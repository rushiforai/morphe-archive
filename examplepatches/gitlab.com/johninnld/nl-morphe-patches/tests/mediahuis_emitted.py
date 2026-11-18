"""Inspect emitted Mediahuis bytecode and execute shipped RN privacy boundaries."""
import hashlib
import json
from pathlib import Path
import re
import subprocess

from verify_weerplaza import canonical_method


def source(root, cls):
    paths = list(root.glob("smali*/" + cls + ".smali")) + list(root.glob("smali/smali*/" + cls + ".smali"))
    assert len(paths) == 1, (cls, len(paths))
    return paths[0].read_text()


def method_source(root, cls, sig):
    matches = re.findall(r"^\.method([^\n]*) " + re.escape(sig) + r"\n(.*?)^\.end method", source(root, cls), re.M | re.S)
    assert len(matches) == 1, (cls, sig, len(matches))
    return matches[0]


def locals_count(root, cls, sig):
    flags, body = method_source(root, cls, sig)
    params = re.findall(r"\[*L[^;]+;|\[*[ZBCSIJFD]", sig.split("(", 1)[1].split(")", 1)[0])
    width = sum(2 if p in {"J", "D"} else 1 for p in params) + (0 if "static" in flags.split() else 1)
    match = re.search(r"^\s*\.(locals|registers) (\d+)", body, re.M)
    assert match, (cls, sig, "concrete method")
    return int(match[2]) - (width if match[1] == "registers" else 0)


def code(root, cls, sig):
    local = locals_count(root, cls, sig)
    lines = canonical_method(root, cls, sig)
    lines = [re.sub(r"\b([vp])(\d+)\b", lambda m: "r" + str(int(m[2]) + (local if m[1] == "p" else 0)), line.replace("const-string/jumbo ", "const-string ")) for line in lines]
    # DEX requires an aligned switch payload. Inserting an odd-width prefix can
    # make the assembler add one terminal nop immediately before that payload.
    # Normalize only this proven data-padding position, including its label.
    body = method_source(root, cls, sig)[1]
    terminal = lines[-2].split()[0] if len(lines) >= 2 else ""
    no_fallthrough = terminal in {"return", "return-object", "return-wide", "return-void", "throw", "goto", "goto/16", "goto/32"}
    payload_padding = re.search(r"\bnop\s*\n\s*:[\w]+\s*\n\s*\.(packed-switch|sparse-switch)\b[\s\S]*?\.end \1\s*$", body)
    if lines and lines[-1] == "nop" and no_fallthrough and payload_padding:
        # The historical instruction parser discards packed-case data. Check
        # the independent real case mapping before treating this nop as padding.
        from mediahuis_switches import switch_semantics
        switch_semantics(root, cls, sig)
        lines = remove_instructions(lines, len(lines) - 1, 1)
    return lines


def digest(lines):
    return hashlib.sha256("\n".join(lines).encode()).hexdigest()


def remove_instructions(lines, index, count):
    """Recover original relative branches after removing owned inserted code."""
    result = lines[:index] + lines[index + count:]
    def adjust(match):
        target = int(match[1])
        assert not index <= target < index + count, "Original branch enters patch instructions"
        return "@" + str(target - count if target >= index + count else target)
    return [re.sub(r"@(\d+)", adjust, line) for line in result]


def run_boundary(lines, args=(), parameter_start=0):
    """Execute the actual early-return instructions, rejecting unknown operations."""
    regs = {"r" + str(parameter_start + i): arg for i, arg in enumerate(args)}
    pending = None
    for line in lines:
        if line == "return-void":
            return None
        if line.startswith("const/4 "):
            dest, literal = line.split(" ", 1)[1].split(", ")
            regs[dest] = int(literal, 16)
        elif line.startswith("const-string "):
            dest, literal = line.split(" ", 1)[1].split(", ", 1)
            regs[dest] = json.loads(literal)
        elif line.startswith("sget-object "):
            dest, ref = line.split(" ", 1)[1].split(", ")
            regs[dest] = {"singleton": ref}
        elif line.startswith("new-instance "):
            dest, typ = line.split(" ", 1)[1].split(", ")
            regs[dest] = {"type": typ}
        elif line.startswith("move-result-object "):
            regs[line.split()[1]] = pending
        elif line.startswith("invoke-static ") and "->emptyList()Ljava/util/List;" in line:
            pending = []
        elif line.startswith("invoke-static ") and "Lkotlinx/coroutines/flow/FlowKt;->flowOf(Ljava/lang/Object;)Lkotlinx/coroutines/flow/Flow;" in line:
            name = line.split("{", 1)[1].split("}", 1)[0]
            pending = {"emissions": [regs[name]], "completes": True}
        elif line.startswith("invoke-direct ") and "AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V" in line:
            names = line.split("{", 1)[1].split("}", 1)[0].split(", ")
            regs[names[0]].update(id=regs[names[1]], limited=regs[names[2]])
        elif line.startswith(("return-object ", "return ")):
            return regs[line.split()[1]]
        else:
            raise AssertionError("Unexpected emitted boundary: " + line)
    raise AssertionError("Boundary did not return")


def verify_menu_subscription(root, enabled, originals):
    """Check the SDK predicate and retain the complete subscribe/login builder."""
    from mediahuis_contracts import MENU_BUILDER, MENU_SUBSCRIBE
    pins = {(cls, sig): expected for cls, sig, expected in originals}
    lines = code(root, *MENU_SUBSCRIBE)
    if enabled:
        prefix = lines[:2]
        assert run_boundary(prefix) == 0 and prefix[1].startswith("return "), "SDK menu subscription disabled"
        lines = remove_instructions(lines, 0, 2)
    assert digest(lines) == pins[MENU_SUBSCRIBE], "Retain original SDK menu predicate tail"
    assert digest(code(root, *MENU_BUILDER)) == pins[MENU_BUILDER], "Retain complete menu subscribe/login caller"


def rn_modules(bundle):
    result = {}
    for match in re.finditer(r"__d\(\(function\(.*?\}\),([0-9]+),\[([^\]]*)\]\);", bundle):
        assert match[1] not in result, match[1]
        result[match[1]] = match[0]
    assert len(result) > 2000, "Complete plain-JS Metro bundle"
    return result


def verify_rn(bundle, enabled):
    modules = rn_modules(bundle)
    logger = modules["855"]
    er = modules["1573"]
    assert ("_e.transportFactory=function(t,n){return B;switch(t){" in logger) == enabled, "All Twipe remote log transports disabled"
    assert ("function*(e){return;var r=(0,n.isEmulatorSync)(),i=r?" in er) == enabled, "No Engage Readers SDK initialization"
    assert ("enableTracking:function(){f=!1}" in er) == enabled, "No later ER enable"
    assert ("yield Promise.resolve()" in er) == enabled, "Timer completion without ER track"
    if not enabled:
        return
    # Evaluate the shipped modified modules against their external boundaries.
    runner = r'''
const vm=require('node:vm'),assert=require('node:assert/strict');
const input=JSON.parse(require('node:fs').readFileSync(0,'utf8'));
let nativeCalls=0,exports={};
const asyncHelper=fn=>function(...args){const iter=fn.apply(this,args);return new Promise((resolve,reject)=>{function step(kind,arg){let r;try{r=iter[kind](arg)}catch(e){reject(e);return}if(r.done)resolve(r.value);else Promise.resolve(r.value).then(v=>step('next',v),e=>step('throw',e))}step('next')})};
const native=new Proxy({}, {get(){return()=>{nativeCalls++;throw Error('native tracker called')}}});
const deps={7:x=>x&&x.__esModule?x:{default:x},367:asyncHelper,1574:native,1288:{isEmulatorSync(){throw Error('SDK initialization ran')}},1311:{logger:{debug(){},error(){}},LOGGER_ACTIONS:{},createSdkV2Context(){}}};
vm.runInNewContext(input.er,{__d(factory,id,map){factory(null,n=>deps[n],null,null,null,exports,map)},WeakMap,Promise,Object,Error});
(async()=>{
 const er=await exports.EngageReaders.getInstance('fixture-tag');
 er.enableTracking();er.setUserType('anonymous');er.setUserSubscription('');
 await er.trackEvent({eventData:{page:1},eventOrigin:'view',screenInView:'reader'});
 await er.trackNoDataEvent({eventOrigin:'background'});await er.stopTimers();er.disableTracking();
 await new Promise(r=>setImmediate(r));assert.equal(nativeCalls,0);assert.equal(er.getUserType(),'anonymous');
 const start=input.logger.indexOf('_e.transportFactory=function(t,n){');
 const end=input.logger.indexOf('},function(){return f.Platform.select',start);
 assert(start>=0&&end>start);
 const body=input.logger.slice(start+'_e.transportFactory='.length,end+1);
 const disabled=()=>Promise.resolve();
 const factory=vm.runInNewContext('('+body+')',{B:disabled});
 for(const name of ['kinesis','httpPost','devHost','console','testing','disabled','future-remote-value']){
  const transport=factory(name,{});assert.equal(transport,disabled);await transport([{event:'fixture'}]);
 }
 console.log('PASS emitted RN init/events/timers and every remote log transport complete without network calls');
})().catch(e=>{console.error(e);process.exitCode=1});
'''
    result = subprocess.run(["node", "-e", runner], input=json.dumps({"er": er, "logger": logger}), text=True, capture_output=True)
    assert result.returncode == 0, result.stdout + result.stderr


def verify_onboarding(root, enabled, original_hash):
    from mediahuis_contracts import ONBOARDING, SETTINGS
    lines = code(root, *ONBOARDING)
    getter = [i for i, line in enumerate(lines) if SETTINGS + "->getOnboardingCompleted()Z" in line]
    assert len(getter) == 1, "One real onboarding state branch"
    index = getter[0]
    setter = [i for i, line in enumerate(lines) if SETTINGS + "->setOnboardingCompleted(Z)V" in line]
    assert len(setter) == int(enabled), "Persist completion with the original state setter"
    if enabled:
        assert setter == [index - 1]
        const, call, get = lines[index - 2:index + 1]
        match = re.fullmatch(r"const/4 (r\d+), 0x1", const)
        assert match
        receiver = re.search(r"\{(r\d+)\}", get)[1]
        assert call == "invoke-virtual {" + receiver + ", " + match[1] + "}, " + SETTINGS + "->setOnboardingCompleted(Z)V"
        # Execute the actual retained getter/setter against their PreferenceDelegate
        # boundary, including boxed Boolean values and the delegated-property slot.
        for saved in [False, True]:
            state = {"value": saved, "writes": []}
            assert preference_method(root, "getOnboardingCompleted()Z", state) == saved
            preference_method(root, "setOnboardingCompleted(Z)V", state, True)
            assert preference_method(root, "getOnboardingCompleted()Z", state) is True
            assert state["writes"] == [True]
        assert any("NavController;->setGraph(" in line for line in lines[:index - 2]), "Install the original main graph first"
        lines = remove_instructions(lines, index - 2, 2)
    assert digest(lines) == original_hash, "Preserve complete navigation graph/deep-link/default-tab logic"


def preference_method(root, sig, state, value=None):
    cls = "be/mediahuis/core/data/datasources/settings/SettingsDataSource"
    local = locals_count(root, cls, sig)
    regs = {"r" + str(local): {"preference": state}, "r" + str(local + 1): value}
    pending = None
    for line in code(root, cls, sig):
        parts = line.split(" ", 1)
        op = parts[0]
        if op == "iget-object":
            dest, receiver, field = parts[1].split(", ")
            assert field.endswith("->onboardingCompletedPreference:Lbe/mediahuis/core/data/delegates/PreferenceDelegate;")
            regs[dest] = regs[receiver]["preference"]
        elif op == "sget-object":
            dest, field = parts[1].split(", ")
            assert "->$$delegatedProperties:" in field
            regs[dest] = ["onboardingCompleted"]
        elif op == "const/4":
            dest, number = parts[1].split(", ")
            regs[dest] = int(number, 16)
        elif op == "aget-object":
            dest, array, index = parts[1].split(", ")
            regs[dest] = regs[array][regs[index]]
        elif op.startswith("invoke-"):
            names = parts[1].split("{", 1)[1].split("}", 1)[0].split(", ")
            args = [regs[name] for name in names]
            target = parts[1].split("}, ", 1)[1]
            if target == "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;":
                pending = bool(args[0])
            elif target.endswith("PreferenceDelegate;->setValue(Ljava/lang/Object;Lkotlin/reflect/KProperty;Ljava/lang/Object;)V"):
                assert args[2] == "onboardingCompleted"
                args[0]["value"] = args[3]
                args[0]["writes"].append(args[3])
            elif target.endswith("PreferenceDelegate;->getValue(Ljava/lang/Object;Lkotlin/reflect/KProperty;)Ljava/lang/Object;"):
                assert args[2] == "onboardingCompleted"
                pending = args[0]["value"]
            elif target == "Ljava/lang/Boolean;->booleanValue()Z":
                pending = bool(args[0])
            else:
                raise AssertionError(target)
        elif op.startswith("move-result"):
            regs[parts[1]] = pending
        elif op == "check-cast":
            pass
        elif op == "return":
            return regs[parts[1]]
        elif op == "return-void":
            return None
        else:
            raise AssertionError(line)
    raise AssertionError("Preference method did not return")
