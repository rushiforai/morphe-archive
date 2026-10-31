package io.github.emotionbug.patches.adot.recording;

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import java.io.File;
import java.util.*;
import org.junit.*;
import static org.junit.Assert.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

public class SettingsEligibilityPatchTest {
    private final SettingsEligibilityPatch patch=new SettingsEligibilityPatch(true);
    private static TreeMap<Integer,Instruction> code(MethodImplementation body) {
        var result=new TreeMap<Integer,Instruction>();int pc=0;
        for (Instruction instruction:body.getInstructions()) { result.put(pc,instruction);pc+=instruction.getCodeUnits(); }
        return result;
    }
    private static Method method(String target,MethodImplementation body) {
        String descriptor=target.substring(target.indexOf("->")+2);
        List<String> parameters=descriptor.startsWith("f(")?List.of("Lrj3;"):
            descriptor.startsWith("onCreate(")?List.of("Landroid/os/Bundle;"):
            descriptor.startsWith("y0(")?List.of("Z"):List.of("Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;");
        return new ImmutableMethod(target.substring(0,target.indexOf("->")),descriptor.substring(0,descriptor.indexOf('(')),
            parameters.stream().map(type->new ImmutableMethodParameter(type,Set.of(),null)).toList(),
            descriptor.substring(descriptor.indexOf(')')+1),17,Set.of(),Set.of(),body);
    }
    private static Method fixture(String name) {
        var target=SettingsEligibilityPatch.TARGETS.get(name);
        var instructions=new ArrayList<Instruction>();int pc=0;
        for (var gate:target.gates()) {
            while (pc<gate.start()) { instructions.add(new ImmutableInstruction10x(Opcode.NOP));pc++; }
            for (Instruction instruction:SettingsEligibilityPatch.originalShape(gate)) { instructions.add(instruction);pc+=instruction.getCodeUnits(); }
        }
        int last=target.gates().stream().mapToInt(g->Math.max(g.supported(),g.unavailable())).max().orElseThrow();
        while (pc<=last) { instructions.add(new ImmutableInstruction10x(Opcode.NOP));pc++; }
        return method(name,new ImmutableMethodImplementation(target.registers(),instructions,null,null));
    }
    private record Inputs(boolean nativeSupport,boolean sharedSupport,boolean samsung,boolean lg,boolean excludedModel) {}
    private record Outcome(boolean supported,int sharedCalls) {}
    private static Outcome execute(MethodImplementation body,SettingsEligibilityPatch.Gate gate,Inputs inputs) {
        var instructions=code(body);Object[] registers=new Object[body.getRegisterCount()];
        registers[gate.model()]="LM-Q927L";registers[gate.zero()]=0;
        Object result=null;int pc=gate.start(),sharedCalls=0;
        for (int steps=0;steps<100;steps++) {
            if (pc==gate.supported()) return new Outcome(true,sharedCalls);
            if (pc==gate.unavailable()) return new Outcome(false,sharedCalls);
            Instruction instruction=instructions.get(pc);assertNotNull("Invalid PC "+pc,instruction);
            int next=pc+instruction.getCodeUnits();
            switch (instruction.getOpcode()) {
                case INVOKE_STATIC,INVOKE_VIRTUAL -> {
                    MethodReference call=(MethodReference)((ReferenceInstruction)instruction).getReference();
                    result=switch(call.getDefiningClass()+"->"+call.getName()) {
                        case "Lg92;->G" -> "native-provider";
                        case "Lo1i;->b" -> inputs.nativeSupport?1:0;
                        case "Lj8j;->a" -> "oem-provider";
                        case "Lj8j;->d" -> inputs.samsung?1:0;
                        case "Lj8j;->c" -> inputs.lg?1:0;
                        case "Ljava/lang/Object;->getClass" -> "class";
                        case "Lkotlin/text/b;->v" -> {
                            var args=(FiveRegisterInstruction)instruction;
                            assertEquals(0,registers[args.getRegisterE()]);
                            yield Objects.equals(registers[args.getRegisterC()],registers[args.getRegisterD()])?1:0;
                        }
                        case "Lhya;->a" -> {
                            assertEquals(Opcode.INVOKE_VIRTUAL,instruction.getOpcode());
                            var args=(FiveRegisterInstruction)instruction;
                            assertEquals(1,args.getRegisterCount());assertEquals("shared-provider",registers[args.getRegisterC()]);
                            sharedCalls++;yield inputs.sharedSupport?1:0;
                        }
                        default -> throw new AssertionError("Unexpected call "+call);
                    };
                }
                case SGET_OBJECT -> {
                    FieldReference field=(FieldReference)((ReferenceInstruction)instruction).getReference();
                    registers[((OneRegisterInstruction)instruction).getRegisterA()]=field.getDefiningClass().equals("Lhya;")?
                        "shared-provider":inputs.excludedModel?"LM-Q927L":"CPH2745";
                }
                case MOVE_RESULT,MOVE_RESULT_OBJECT -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=result;
                case CONST_STRING -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=((StringReference)((ReferenceInstruction)instruction).getReference()).getString();
                case CONST_4 -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=((NarrowLiteralInstruction)instruction).getNarrowLiteral();
                case IF_EQZ,IF_NEZ -> {
                    boolean zero=Objects.equals(0,registers[((OneRegisterInstruction)instruction).getRegisterA()]);
                    if (zero==(instruction.getOpcode()==Opcode.IF_EQZ)) next=pc+((OffsetInstruction)instruction).getCodeOffset();
                }
                case GOTO,GOTO_16 -> next=pc+((OffsetInstruction)instruction).getCodeOffset();
                case NOP -> {}
                default -> throw new AssertionError("Unexpected instruction "+instruction.getOpcode());
            }
            pc=next;
        }
        throw new AssertionError("Nonterminating settings gate");
    }
    private void verify(Method original) {
        var target=SettingsEligibilityPatch.TARGETS.get(id(original));
        var before=original.getImplementation();var after=patch.implementation(original);
        for (var gate:target.gates()) for (int bits=0;bits<32;bits++) {
            var inputs=new Inputs((bits&1)!=0,(bits&2)!=0,(bits&4)!=0,(bits&8)!=0,(bits&16)!=0);
            boolean oldSupport=inputs.nativeSupport&&(inputs.samsung||(inputs.lg&&!inputs.excludedModel));
            assertEquals(new Outcome(oldSupport,0),execute(before,gate,inputs));
            assertEquals(new Outcome(inputs.sharedSupport,1),execute(after,gate,inputs));
        }
        var oldCode=code(before);var newCode=code(after);
        assertEquals(oldCode.lastKey(),newCode.lastKey());
        for (var entry:oldCode.entrySet()) if (target.gates().stream().noneMatch(g->entry.getKey()>=g.start()&&entry.getKey()<g.end()))
            assertEquals("Changed original path at "+entry.getKey(),ConnectionEligibilityPatch.shape(entry.getValue()),
                ConnectionEligibilityPatch.shape(newCode.get(entry.getKey())));
        assertEquals(before.getRegisterCount(),after.getRegisterCount());
        assertEquals(before.getTryBlocks(),after.getTryBlocks());
        assertThrows(IllegalStateException.class,()->patch.implementation(method(id(original),after)));
    }
    @Test public void allFiveSettingsDecisionsUseSharedSupportAndRetainUnavailablePaths() {
        for (String target:patch.methods()) verify(fixture(target));
    }
    @Test public void changedGateAndIncomingBranchesOrHandlersFailClosed() {
        assertThrows(IllegalArgumentException.class,()->new SettingsEligibilityPatch(false));
        for (String target:patch.methods()) {
            Method original=fixture(target);var body=original.getImplementation();
            var gate=SettingsEligibilityPatch.TARGETS.get(target).gates().get(0);
            var changed=new ArrayList<Instruction>();int pc=0;
            for (Instruction instruction:body.getInstructions()) {
                changed.add(pc==gate.start()+8?new ImmutableInstruction21t(Opcode.IF_EQZ,(gate.register()+1)%body.getRegisterCount(),gate.unavailable()-(pc)):instruction);
                pc+=instruction.getCodeUnits();
            }
            assertThrows(IllegalStateException.class,()->patch.implementation(method(target,new ImmutableMethodImplementation(body.getRegisterCount(),changed,null,null))));
            var incoming=new ArrayList<Instruction>();body.getInstructions().forEach(incoming::add);
            incoming.subList(0,3).clear();incoming.add(0,new ImmutableInstruction30t(Opcode.GOTO_32,gate.start()+10));
            assertThrows(IllegalStateException.class,()->patch.implementation(method(target,new ImmutableMethodImplementation(body.getRegisterCount(),incoming,null,null))));
            var tries=List.of(new ImmutableTryBlock(0,1,List.of(new ImmutableExceptionHandler(null,gate.start()+10))));
            assertThrows(IllegalStateException.class,()->patch.implementation(method(target,new ImmutableMethodImplementation(body.getRegisterCount(),body.getInstructions(),tries,null))));
        }
    }
    @Test public void originalApkSettingsExecuteSameDecisionMatrix() throws Exception {
        String path=System.getenv("EBPATCHER_TEST_APK");Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK",path!=null);
        var container=DexFileFactory.loadDexContainer(new File(path),Opcodes.getDefault());
        var remaining=new HashSet<>(patch.methods());
        for (var owner:container.getEntry("classes3.dex").getDexFile().getClasses()) for (Method method:owner.getMethods())
            if (remaining.remove(id(method))) verify(method);
        assertTrue("Missing target methods "+remaining,remaining.isEmpty());
    }
}
