import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/**
 * Inspect and execute the small changed methods from the emitted APK's actual DEX.
 * Usage: VerifyPizzaRewardDex patched.apk [original.apk]
 * Compile/run with the JADX all jar (dexlib2) on the classpath. This validates
 * dispatch and register/branch behavior, not JNI execution or device rendering.
 */
public class VerifyPizzaRewardDex {
    static final String BASE = "Lcom/tapblaze/pizzabusiness/BaseIronSourceWrapper;";
    static final String NATIVE = "Lcom/tapblaze/pizzabusiness/IronSourceWrapper;";
    static String REQUEST;
    static final String ACTIVITY = "Lcom/tapblaze/pizzabusiness/BaseAppActivity;";
    static final String COCOS = "Lorg/cocos2dx/lib/Cocos2dxActivity;";
    static final String HELPER = "Lpl/dudek/extension/pizzabusiness/RewardedAds;";
    static final String INIT_REQUEST = "Lpl/dudek/extension/pizzabusiness/RewardedAds$1;";
    static String SDK_READY;
    static final String STRING = "Ljava/lang/String;";
    static final Object UNSET = new Object();
    static final Object REQUEST_OBJECT = new Object();
    static int scenarios;

    static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    static Map<String, ClassDef> classes(String file) throws Exception {
        Map<String, ClassDef> result = new HashMap<>();
        var container = DexFileFactory.loadDexContainer(new File(file), Opcodes.getDefault());
        for (String entry : container.getDexEntryNames()) {
            for (ClassDef definition : container.getEntry(entry).getDexFile().getClasses()) {
                check(result.put(definition.getType(), definition) == null, "Duplicate class " + definition.getType());
            }
        }
        return result;
    }

    static String key(MethodReference method) {
        if (method == null) return "<no-method-reference>";
        return method.getDefiningClass() + "->" + method.getName() +
            "(" + String.join("", method.getParameterTypes()) + ")" + method.getReturnType();
    }

    static Method method(Map<String, ClassDef> classes, String owner, String name, String result, String... parameters) {
        ClassDef definition = classes.get(owner);
        check(definition != null, "Missing class " + owner);
        List<Method> matches = new ArrayList<>();
        for (Method candidate : definition.getMethods()) {
            if (candidate.getName().equals(name) && candidate.getReturnType().equals(result) &&
                candidate.getParameterTypes().equals(List.of(parameters))) matches.add(candidate);
        }
        check(matches.size() == 1, "Expected one " + owner + "->" + name + List.of(parameters));
        return matches.get(0);
    }

    static List<Instruction> code(Method method) {
        check(method.getImplementation() != null, "Missing implementation " + key(method));
        List<Instruction> instructions = new ArrayList<>();
        method.getImplementation().getInstructions().forEach(instructions::add);
        return instructions;
    }

    static MethodReference call(Instruction instruction) {
        return instruction instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m ? m : null;
    }

    static List<Integer> registers(Instruction instruction) {
        List<Integer> result = new ArrayList<>();
        if (instruction instanceof RegisterRangeInstruction range) {
            for (int i = 0; i < range.getRegisterCount(); i++) result.add(range.getStartRegister() + i);
        } else if (instruction instanceof FiveRegisterInstruction five) {
            int[] all = {five.getRegisterC(), five.getRegisterD(), five.getRegisterE(), five.getRegisterF(), five.getRegisterG()};
            for (int i = 0; i < five.getRegisterCount(); i++) result.add(all[i]);
        } else {
            if (instruction instanceof OneRegisterInstruction one) result.add(one.getRegisterA());
            if (instruction instanceof TwoRegisterInstruction two) result.add(two.getRegisterB());
            if (instruction instanceof ThreeRegisterInstruction three) result.add(three.getRegisterC());
        }
        return result;
    }

    static Map<Integer, Integer> offsets(List<Instruction> instructions) {
        Map<Integer, Integer> indices = new HashMap<>();
        int offset = 0;
        for (int i = 0; i < instructions.size(); i++) {
            indices.put(offset, i);
            offset += instructions.get(i).getCodeUnits();
        }
        return indices;
    }

    static void validateRegistersAndBranches(Method method) {
        var instructions = code(method);
        var indices = offsets(instructions);
        int offset = 0;
        for (Instruction instruction : instructions) {
            for (int register : registers(instruction)) {
                check(register >= 0 && register < method.getImplementation().getRegisterCount(),
                    "Invalid register in " + key(method));
            }
            if (instruction instanceof OffsetInstruction branch) {
                check(indices.containsKey(offset + branch.getCodeOffset()), "Branch outside instruction boundaries: " + key(method));
            }
            offset += instruction.getCodeUnits();
        }
    }

    record Event(String name, List<Object> arguments) {}

    /** A deliberately small interpreter: unknown opcodes/calls fail closed. */
    static List<Event> executeRunner(Method method, String placement) {
        var instructions = code(method);
        var indices = offsets(instructions);
        Object[] values = new Object[method.getImplementation().getRegisterCount()];
        Arrays.fill(values, UNSET);
        values[values.length - 1] = REQUEST_OBJECT;
        List<Event> events = new ArrayList<>();
        int index = 0, offset = 0;
        for (int steps = 0; steps < 100; steps++) {
            check(index >= 0 && index < instructions.size(), "Runner fell out of its method");
            Instruction instruction = instructions.get(index);
            int nextOffset = offset + instruction.getCodeUnits();
            switch (instruction.getOpcode()) {
                case IGET_OBJECT -> {
                    var r = (TwoRegisterInstruction) instruction;
                    var f = (FieldReference) ((ReferenceInstruction) instruction).getReference();
                    check(values[r.getRegisterB()] == REQUEST_OBJECT, "Placement read from wrong object");
                    check(f.getDefiningClass().equals(REQUEST) && f.getName().equals("val$placement") &&
                        f.getType().equals(STRING), "Wrong captured placement field");
                    values[r.getRegisterA()] = placement;
                }
                case CONST_STRING, CONST_STRING_JUMBO -> {
                    String value = ((StringReference) ((ReferenceInstruction) instruction).getReference()).getString();
                    check(value.equals("DefaultRewardedVideo"), "Unexpected replacement string " + value);
                    values[((OneRegisterInstruction) instruction).getRegisterA()] = value;
                }
                case MOVE_OBJECT, MOVE_OBJECT_FROM16, MOVE_OBJECT_16 -> {
                    var r = (TwoRegisterInstruction) instruction;
                    check(values[r.getRegisterB()] != UNSET, "Read of uninitialized move source");
                    values[r.getRegisterA()] = values[r.getRegisterB()];
                }
                case IF_EQZ, IF_NEZ -> {
                    Object value = values[((OneRegisterInstruction) instruction).getRegisterA()];
                    check(value != UNSET, "Read of uninitialized branch condition");
                    boolean zero = value == null || Integer.valueOf(0).equals(value);
                    boolean take = instruction.getOpcode() == Opcode.IF_EQZ ? zero : !zero;
                    if (take) nextOffset = offset + ((OffsetInstruction) instruction).getCodeOffset();
                }
                case GOTO, GOTO_16, GOTO_32 -> nextOffset = offset + ((OffsetInstruction) instruction).getCodeOffset();
                case INVOKE_STATIC, INVOKE_STATIC_RANGE -> {
                    MethodReference target = call(instruction);
                    check(target != null && target.getDefiningClass().equals(NATIVE), "Unexpected runner call");
                    check(Set.of("onVideoStarted", "onVideoWatched", "onVideoEnded", "onVideoReady").contains(target.getName()),
                        "Unexpected native callback " + target.getName());
                    List<String> expectedTypes = target.getName().equals("onVideoWatched") ? List.of(STRING) : List.of();
                    check(target.getReturnType().equals("V") && target.getParameterTypes().equals(expectedTypes) &&
                        registers(instruction).size() == expectedTypes.size(), "Wrong callback descriptor or argument count");
                    List<Object> arguments = new ArrayList<>();
                    for (int register : registers(instruction)) {
                        check(values[register] != UNSET, "Native callback receives an uninitialized register");
                        arguments.add(values[register]);
                    }
                    events.add(new Event(target.getName(), arguments));
                }
                case RETURN_VOID -> {
                    String expected = placement == null ? "DefaultRewardedVideo" : placement;
                    check(events.equals(List.of(new Event("onVideoStarted", List.of()),
                        new Event("onVideoWatched", List.of(expected)), new Event("onVideoEnded", List.of()),
                        new Event("onVideoReady", List.of()))), "Wrong callback sequence/reward for " + placement + ": " + events);
                    scenarios++;
                    return events;
                }
                case NOP -> {}
                default -> throw new AssertionError("Unsupported or dangerous runner opcode " + instruction.getOpcode());
            }
            Integer next = indices.get(nextOffset);
            check(next != null, "Runner control flow leaves method");
            index = next;
            offset = nextOffset;
        }
        throw new AssertionError("Runner loops or fails to return");
    }

    static String canonical(Method method) {
        StringBuilder result = new StringBuilder(key(method)).append(':').append(method.getAccessFlags());
        if (method.getImplementation() == null) return result.toString();
        result.append(':').append(method.getImplementation().getRegisterCount());
        var instructions = code(method);
        var positions = new HashMap<Integer, Integer>();
        int address = 0;
        for (int i = 0; i < instructions.size(); i++) {
            positions.put(address, i);
            address += instructions.get(i).getCodeUnits();
        }
        positions.put(address, instructions.size());
        address = 0;
        for (Instruction instruction : instructions) {
            Opcode opcode = instruction.getOpcode();
            if (opcode == Opcode.CONST_STRING_JUMBO) opcode = Opcode.CONST_STRING;
            if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) opcode = Opcode.GOTO;
            result.append('|').append(opcode).append(registers(instruction));
            if (instruction instanceof ReferenceInstruction reference) result.append(':').append(reference.getReference());
            if (instruction instanceof WideLiteralInstruction literal) result.append(':').append(literal.getWideLiteral());
            if (instruction instanceof OffsetInstruction offset) {
                Integer target = positions.get(address + offset.getCodeOffset());
                check(target != null, "Invalid instruction target in " + key(method));
                result.append(':').append(target);
            }
            address += instruction.getCodeUnits();
        }
        for (TryBlock<? extends ExceptionHandler> block : method.getImplementation().getTryBlocks()) {
            result.append("|try:").append(positions.get(block.getStartCodeAddress())).append(':')
                .append(positions.get(block.getStartCodeAddress() + block.getCodeUnitCount()));
            for (ExceptionHandler handler : block.getExceptionHandlers()) {
                result.append(':').append(handler.getExceptionType()).append('@').append(positions.get(handler.getHandlerCodeAddress()));
            }
        }
        return result.toString();
    }

    public static void main(String[] arguments) throws Exception {
        check(arguments.length == 2, "Usage: VerifyPizzaRewardDex patched.apk original.apk");
        var patched = classes(arguments[0]);
        var input = classes(arguments[1]);
        Method show = method(patched, BASE, "showRewardedVideo", "V", STRING);
        var requests = code(show).stream().filter(i -> i.getOpcode() == Opcode.NEW_INSTANCE)
            .map(i -> ((TypeReference)((ReferenceInstruction)i).getReference()).getType()).toList();
        check(requests.size() == 1, "Expected one reward request allocation");
        REQUEST = requests.get(0);
        var callbacks = new ArrayList<String>();
        for (var cls : input.values()) if (cls.getType().startsWith(BASE.substring(0,BASE.length()-1)+"$"))
            for (var m : cls.getMethods()) if (m.getName().equals("run") && m.getImplementation() != null &&
                code(m).size() == 2 && key(call(code(m).get(0))).equals(NATIVE+"->onVideoReady()V")) callbacks.add(cls.getType());
        check(callbacks.size() == 1, "Expected one original SDK readiness callback");
        SDK_READY = callbacks.get(0);
        Method ready = method(patched, BASE, "isRewardedVideoReady", "Z", STRING);
        Method initialize = method(patched, BASE, "Initialize", "V", STRING, STRING, STRING, "Z", "I");
        Method runner = method(patched, REQUEST, "run", "V");
        Method constructor = method(patched, REQUEST, "<init>", "V", STRING);
        check(patched.get(NATIVE).getSuperclass().equals(BASE), "JNI bridge superclass changed");
        check(patched.get(REQUEST).getInterfaces().contains("Ljava/lang/Runnable;"), "Request is not Runnable");
        for (Method changed : List.of(show, ready, initialize, runner, constructor)) validateRegistersAndBranches(changed);
        check(runner.getImplementation().getTryBlocks().isEmpty(), "Unexpected runner exception handlers");

        for (String callback : List.of("onInitialized", "onVideoReady", "onVideoStarted", "onVideoWatched", "onVideoEnded")) {
            Method nativeMethod = callback.equals("onVideoWatched") ? method(patched, NATIVE, callback, "V", STRING)
                : method(patched, NATIVE, callback, "V");
            check(AccessFlags.PUBLIC.isSet(nativeMethod.getAccessFlags()) && AccessFlags.STATIC.isSet(nativeMethod.getAccessFlags()) &&
                AccessFlags.NATIVE.isSet(nativeMethod.getAccessFlags()) && nativeMethod.getImplementation() == null,
                "Callback no longer has original native signature: " + callback);
        }

        var showCode = code(show);
        check(showCode.size() == 6, "Unexpected rewarded-show method shape");
        check(key(call(showCode.get(0))).equals(ACTIVITY + "->getInstance()" + ACTIVITY), "Wrong activity lookup");
        check(showCode.get(1).getOpcode() == Opcode.MOVE_RESULT_OBJECT &&
            ((OneRegisterInstruction) showCode.get(1)).getRegisterA() == 0, "Wrong activity result register");
        check(showCode.get(2).getOpcode() == Opcode.NEW_INSTANCE &&
            ((TypeReference) ((ReferenceInstruction) showCode.get(2)).getReference()).getType().equals(REQUEST) &&
            ((OneRegisterInstruction) showCode.get(2)).getRegisterA() == 1, "Wrong captured request allocation");
        check(key(call(showCode.get(3))).equals(REQUEST + "-><init>(" + STRING + ")V") &&
            registers(showCode.get(3)).equals(List.of(1, show.getImplementation().getRegisterCount() - 1)),
            "Requested placement is not passed to constructor");
        check(key(call(showCode.get(4))).equals(COCOS + "->runOnGLThread(Ljava/lang/Runnable;)V") &&
            registers(showCode.get(4)).equals(List.of(0, 1)), "Reward completion must queue the captured request on GL thread");
        check(showCode.get(5).getOpcode() == Opcode.RETURN_VOID, "Show does not return after enqueue");

        var ctorCode = code(constructor);
        check(ctorCode.size() == 3 && ctorCode.get(0).getOpcode() == Opcode.IPUT_OBJECT, "Unexpected capture constructor");
        var put = (TwoRegisterInstruction) ctorCode.get(0);
        var field = (FieldReference) ((ReferenceInstruction) ctorCode.get(0)).getReference();
        check(put.getRegisterA() == constructor.getImplementation().getRegisterCount() - 1 &&
            put.getRegisterB() == constructor.getImplementation().getRegisterCount() - 2 &&
            field.getDefiningClass().equals(REQUEST) && field.getName().equals("val$placement") && field.getType().equals(STRING),
            "Constructor does not preserve input placement");
        check(key(call(ctorCode.get(1))).equals("Ljava/lang/Object;-><init>()V") &&
            registers(ctorCode.get(1)).equals(List.of(constructor.getImplementation().getRegisterCount() - 2)) &&
            ctorCode.get(2).getOpcode() == Opcode.RETURN_VOID, "Unexpected constructor side effect");

        var readyCode = code(ready);
        check(readyCode.size() == 2 && readyCode.get(0).getOpcode() == Opcode.CONST_4 &&
            ((NarrowLiteralInstruction) readyCode.get(0)).getNarrowLiteral() == 1 && readyCode.get(1).getOpcode() == Opcode.RETURN &&
            ((OneRegisterInstruction) readyCode.get(0)).getRegisterA() == ((OneRegisterInstruction) readyCode.get(1)).getRegisterA(),
            "Reward readiness still depends on ad loading");
        check(code(method(patched, SDK_READY, "run", "V")).size() == 1 &&
            code(method(patched, SDK_READY, "run", "V")).get(0).getOpcode() == Opcode.RETURN_VOID,
            "Background SDK readiness can still compete with local completion timers");
        if (input.containsKey("Lcom/pairip/StartupLauncher;")) for (Method startup : List.of(
            method(patched, "Lcom/pairip/SignatureCheck;", "verifyIntegrity", "V", "Landroid/content/Context;"),
            method(patched, "Lcom/pairip/StartupLauncher;", "launch", "V"),
            method(patched, "Lcom/pairip/licensecheck/LicenseClient;", "checkLicense", "V", "Landroid/content/Context;"))) {
            check(code(startup).size() == 1 && code(startup).get(0).getOpcode() == Opcode.RETURN_VOID &&
                startup.getImplementation().getTryBlocks().isEmpty(), "Startup companion has stale code/exception handlers");
        }

        var initCode = code(initialize);
        check(initCode.size() >= 2 && key(call(initCode.get(0))).equals(HELPER + "->initialize()V"),
            "Missing GL-safe initialization helper");
        check(initCode.stream().noneMatch(i -> call(i) != null && call(i).getDefiningClass().equals(NATIVE)),
            "Initialization calls native Cocos callbacks directly on the caller thread");
        Method helper = method(patched, HELPER, "initialize", "V");
        Method initRunner = method(patched, INIT_REQUEST, "run", "V");
        validateRegistersAndBranches(helper);
        validateRegistersAndBranches(initRunner);
        check(helper.getImplementation().getTryBlocks().isEmpty() && initRunner.getImplementation().getTryBlocks().isEmpty(),
            "Unexpected initialization exception handling");
        var helperCode = code(helper);
        check(helperCode.size() == 4 && helperCode.get(0).getOpcode() == Opcode.NEW_INSTANCE &&
            ((TypeReference) ((ReferenceInstruction) helperCode.get(0)).getReference()).getType().equals(INIT_REQUEST),
            "Helper does not allocate the expected initialization request");
        int initRegister = ((OneRegisterInstruction) helperCode.get(0)).getRegisterA();
        check(key(call(helperCode.get(1))).equals(INIT_REQUEST + "-><init>()V") &&
            registers(helperCode.get(1)).equals(List.of(initRegister)), "Wrong initialization request constructor");
        check(key(call(helperCode.get(2))).equals("Lorg/cocos2dx/lib/Cocos2dxHelper;->runOnGLThread(Ljava/lang/Runnable;)V") &&
            registers(helperCode.get(2)).equals(List.of(initRegister)) && helperCode.get(3).getOpcode() == Opcode.RETURN_VOID,
            "Initialization helper does not queue on Cocos GL thread");
        var initRunnerCode = code(initRunner);
        check(initRunnerCode.size() == 3 && key(call(initRunnerCode.get(0))).equals(NATIVE + "->onInitialized()V") &&
            key(call(initRunnerCode.get(1))).equals(NATIVE + "->onVideoReady()V") &&
            initRunnerCode.get(2).getOpcode() == Opcode.RETURN_VOID, "Wrong initialization callback order");

        int requestConstructors = 0;
        for (ClassDef definition : patched.values()) for (Method candidate : definition.getMethods()) {
            if (candidate.getImplementation() == null) continue;
            for (Instruction instruction : candidate.getImplementation().getInstructions()) {
                MethodReference reference = call(instruction);
                if (reference != null && reference.getDefiningClass().equals(REQUEST) && reference.getName().equals("<init>")) {
                    requestConstructors++;
                    check(key(candidate).equals(key(show)), "Request is also instantiated outside reward gateway");
                }
            }
        }
        check(requestConstructors == 1, "Expected one exclusive request constructor callsite");
        for (String placement : Arrays.asList(null, "", "DefaultRewardedVideo", "pizza-gems-42", "event/reward/zażółć")) {
            executeRunner(runner, placement);
        }

        if (arguments.length == 2) {
            var original = classes(arguments[1]);
            Set<String> expected = Set.of(key(show), key(ready), key(initialize), key(runner));
            int unchanged = 0;
            for (String owner : List.of(BASE, NATIVE, REQUEST, "Lcom/pairip/VMRunner;")) {
                if (owner.equals("Lcom/pairip/VMRunner;") && !original.containsKey(owner)) {
                    check(!patched.containsKey(owner), "Unprotected input acquired a VM replacement");
                    continue;
                }
                check(original.containsKey(owner), "Original APK missing bridge " + owner);
                Map<String, Method> outputMethods = new HashMap<>();
                for (Method candidate : patched.get(owner).getMethods()) outputMethods.put(key(candidate), candidate);
                for (Method candidate : original.get(owner).getMethods()) {
                    Method output = outputMethods.remove(key(candidate));
                    check(output != null, "Bridge method removed: " + key(candidate));
                    if (!expected.contains(key(candidate))) {
                        check(canonical(candidate).equals(canonical(output)), "Unrelated bridge method changed: " + key(candidate));
                        unchanged++;
                    }
                }
                check(outputMethods.isEmpty(), "Unexpected new bridge methods: " + outputMethods.keySet());
            }
            Method oldInit = method(original, BASE, "Initialize", "V", STRING, STRING, STRING, "Z", "I");
            var oldInitCode = code(oldInit);
            check(initCode.size() == oldInitCode.size() + 1, "SDK/offerwall initialization body was replaced");
            for (int i = 0; i < oldInitCode.size(); i++) {
                Instruction old = oldInitCode.get(i), updated = initCode.get(i + 1);
                check(old.getOpcode() == updated.getOpcode() && registers(old).equals(registers(updated)), "Original init flow changed");
                if (old instanceof ReferenceInstruction r) check(updated instanceof ReferenceInstruction s &&
                    r.getReference().toString().equals(s.getReference().toString()), "Original init references changed");
                if (old instanceof WideLiteralInstruction r) check(updated instanceof WideLiteralInstruction s &&
                    r.getWideLiteral() == s.getWideLiteral(), "Original init constants changed");
                if (old instanceof OffsetInstruction r) check(updated instanceof OffsetInstruction s &&
                    r.getCodeOffset() == s.getCodeOffset(), "Original init branch offsets changed");
            }
            // Compile-only extension stubs must never replace the game's real queue or activity lookup.
            for (String owner : List.of(COCOS, "Lorg/cocos2dx/lib/Cocos2dxHelper;")) {
                Method before = method(original, owner, "runOnGLThread", "V", "Ljava/lang/Runnable;");
                Method after = method(patched, owner, "runOnGLThread", "V", "Ljava/lang/Runnable;");
                check(canonical(before).equals(canonical(after)), "Game GL queue was replaced by an extension stub");
            }
            check(canonical(method(original, ACTIVITY, "getInstance", ACTIVITY)).equals(
                canonical(method(patched, ACTIVITY, "getInstance", ACTIVITY))), "Game activity lookup changed");
            System.out.println("PASS: " + unchanged + " untouched bridge methods and original SDK/offerwall initialization preserved");
        }
        System.out.println("PASS: emitted DEX GL dispatch, captured placement, readiness, native signatures, registers/branches, " +
            scenarios + " interpreted placement scenarios with exactly one reward dispatch each");
        System.out.println("LIMIT: native delayed callbacks and phone gameplay require separate validation");
    }
}
