import java.io.File;
import java.util.ArrayList;
import java.util.List;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.ClassDef;

/** Run with Morphe Desktop's all.jar on the classpath and Java 21. */
class VerifySharingDex {
    private static final String HELPER = "Lapp/spicetify/extension/spotify/privacy/SharingLinks;";
    private static final String SETTINGS = "Lapp/spicetify/extension/spotify/settings/PatchSettings;";
    private static final String RESPONSE = "Lcom/spotify/share/linkgeneration/api/proto/GenerateUrlResponse;";
    private static final String STRING = "Ljava/lang/String;";

    public static void main(String[] args) throws Exception {
        if (args.length != 3) throw new IllegalArgumentException(
                "Usage: VerifySharingDex.java APK SHARING_ENABLED SETTINGS_ENABLED");
        int expected = flag(args[1]);
        int expectedHelpers = flag(args[2]);
        if (expected > expectedHelpers) throw new IllegalArgumentException("Sharing requires settings");
        int helpers = 0;
        int wrappers = 0;
        int localCalls = 0;
        int resultCalls = 0;
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        var classes = new ArrayList<ClassDef>();
        for (var entry : dex.getDexEntryNames()) classes.addAll(dex.getEntry(entry).getDexFile().getClasses());
        var resultConstructor = expected == 0 ? null : findResultConstructor(classes);
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                if (cls.getType().equals(HELPER) && method.getName().equals("sanitizeUrl")) {
                    if (!method.getParameterTypes().equals(java.util.List.of("Ljava/lang/String;"))
                            || !method.getReturnType().equals("Ljava/lang/String;")
                            || !AccessFlags.PUBLIC.isSet(cls.getAccessFlags())
                            || !AccessFlags.PUBLIC.isSet(method.getAccessFlags())
                            || !AccessFlags.STATIC.isSet(method.getAccessFlags())
                            || method.getImplementation() == null) {
                        throw new AssertionError("Injected helper has an invalid signature, access flags, or no body");
                    }
                    helpers++;
                }
                if (cls.getType().equals(HELPER) && method.getName().equals("onShareUrl")) {
                    verifyWrapper(cls, method);
                    wrappers++;
                }
                if (method.getImplementation() == null) continue;
                var instructions = new ArrayList<Instruction>();
                method.getImplementation().getInstructions().forEach(instructions::add);
                for (int i = 0; i < instructions.size(); i++) {
                    var instruction = instructions.get(i);
                    if (!(instruction instanceof ReferenceInstruction ref)
                            || !(ref.getReference() instanceof MethodReference target)
                            || !target.getDefiningClass().equals(HELPER)
                            || !(target.getName().equals("sanitizeUrl") || target.getName().equals("onShareUrl"))) continue;
                    if (cls.getType().equals(HELPER) && method.getName().equals("onShareUrl")) continue;
                    if (!target.getName().equals("onShareUrl")) {
                        throw new AssertionError("Native sharing hook bypasses the saved preference");
                    }
                    if (!target.getParameterTypes().equals(java.util.List.of("Ljava/lang/String;"))
                            || !target.getReturnType().equals("Ljava/lang/String;")) {
                        throw new AssertionError("Sanitizer call descriptor does not match the helper");
                    }
                    if (method.getName().equals("<init>")) {
                        if (!method.equals(resultConstructor)) {
                            throw new AssertionError("Sanitizer hooks are not in the server sharing result constructor");
                        }
                        verifyResultConstructor(method, instructions);
                        resultCalls++;
                        continue;
                    }
                    localCalls++;
                    if (i < 2 || i + 1 >= instructions.size()
                            || instruction.getOpcode() != Opcode.INVOKE_STATIC_RANGE
                            || !(instruction instanceof RegisterRangeInstruction range)
                            || range.getRegisterCount() != 1
                            || instructions.get(i - 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT
                            || instructions.get(i + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT
                            || ((OneRegisterInstruction) instructions.get(i - 1)).getRegisterA() != range.getStartRegister()
                            || ((OneRegisterInstruction) instructions.get(i + 1)).getRegisterA() != range.getStartRegister()
                            || !(instructions.get(i - 2) instanceof ReferenceInstruction previous)
                            || !(previous.getReference() instanceof MethodReference uri)
                            || !uri.getDefiningClass().equals("Landroid/net/Uri;")
                            || !uri.getName().equals("toString")) {
                        throw new AssertionError("Sanitizer call does not preserve the URI result register");
                    }
                    System.out.println("Verified call: " + cls.getType() + "->" + method.getName());
                }
            }
        }
        if (localCalls != expected || resultCalls != 2 * expected || helpers != expectedHelpers || wrappers != expectedHelpers) {
            throw new AssertionError("Expected " + expectedHelpers + " sanitizer/wrapper, " + expected + " local hook and " + (2 * expected)
                    + " result hooks; found " + helpers + "/" + wrappers + "/" + localCalls + "/" + resultCalls);
        }
        System.out.println("Sharing DEX verified: " + localCalls + " local hook(s), "
                + resultCalls + " result hook(s), " + helpers + " sanitizer(s), " + wrappers + " preference wrapper(s)");
    }

    private static int flag(String value) {
        if (!value.equals("0") && !value.equals("1")) throw new IllegalArgumentException("Flags must be 0 or 1");
        return Integer.parseInt(value);
    }

    private static void verifyWrapper(ClassDef cls, Method method) {
        var code = instructions(method);
        if (!AccessFlags.PUBLIC.isSet(cls.getAccessFlags())
                || !AccessFlags.PUBLIC.isSet(method.getAccessFlags())
                || !AccessFlags.STATIC.isSet(method.getAccessFlags())
                || !method.getParameterTypes().equals(List.of(STRING)) || !method.getReturnType().equals(STRING)
                || method.getImplementation() == null || method.getImplementation().getRegisterCount() != 2
                || !method.getImplementation().getTryBlocks().isEmpty() || code.size() != 6
                || !isStaticCall(code.get(0), SETTINGS, "cleanSharingEnabled", List.of(), "Z", 0)
                || code.get(1).getOpcode() != Opcode.MOVE_RESULT
                || ((OneRegisterInstruction) code.get(1)).getRegisterA() != 0
                || code.get(2).getOpcode() != Opcode.IF_EQZ
                || ((OneRegisterInstruction) code.get(2)).getRegisterA() != 0
                || !(code.get(2) instanceof OffsetInstruction branch)
                || branch.getCodeOffset() != code.get(2).getCodeUnits() + code.get(3).getCodeUnits() + code.get(4).getCodeUnits()
                || !isStaticCall(code.get(3), HELPER, "sanitizeUrl", List.of(STRING), STRING, 1)
                || !(code.get(3) instanceof FiveRegisterInstruction call) || call.getRegisterC() != 1
                || code.get(4).getOpcode() != Opcode.MOVE_RESULT_OBJECT
                || ((OneRegisterInstruction) code.get(4)).getRegisterA() != 1
                || code.get(5).getOpcode() != Opcode.RETURN_OBJECT
                || ((OneRegisterInstruction) code.get(5)).getRegisterA() != 1) {
            throw new AssertionError("Sharing wrapper must read the preference and return the original URL when disabled");
        }
    }

    private static boolean isStaticCall(Instruction instruction, String owner, String name,
                                        List<String> parameters, String result, int registers) {
        return instruction.getOpcode() == Opcode.INVOKE_STATIC
                && instruction instanceof FiveRegisterInstruction call && call.getRegisterCount() == registers
                && instruction instanceof ReferenceInstruction reference
                && reference.getReference() instanceof MethodReference target
                && target.getDefiningClass().equals(owner) && target.getName().equals(name)
                && target.getParameterTypes().equals(parameters) && target.getReturnType().equals(result);
    }

    private static MethodReference findResultConstructor(List<ClassDef> classes) {
        var responses = classes.stream().filter(cls -> cls.getType().equals(RESPONSE)).toList();
        if (responses.size() != 1) throw new AssertionError("Expected one sharing response class");
        var getters = new ArrayList<Method>();
        for (String name : List.of("shareableUrl_", "shareId_", "spotifyUri_", "fullUrl_")) {
            var matches = new ArrayList<Method>();
            for (var method : responses.getFirst().getMethods()) {
                var code = instructions(method);
                if (method.getParameterTypes().isEmpty() && method.getReturnType().equals(STRING)
                        && !AccessFlags.STATIC.isSet(method.getAccessFlags()) && code.size() == 2
                        && code.get(0).getOpcode() == Opcode.IGET_OBJECT
                        && code.get(0) instanceof TwoRegisterInstruction read
                        && read.getRegisterB() == method.getImplementation().getRegisterCount() - 1
                        && code.get(0) instanceof ReferenceInstruction reference
                        && reference.getReference() instanceof FieldReference field
                        && field.getDefiningClass().equals(RESPONSE) && field.getName().equals(name)
                        && field.getType().equals(STRING) && code.get(1).getOpcode() == Opcode.RETURN_OBJECT
                        && ((OneRegisterInstruction) code.get(1)).getRegisterA() == read.getRegisterA()) {
                    matches.add(method);
                }
            }
            if (matches.size() != 1) throw new AssertionError("Sharing response getter changed: " + name);
            getters.add(matches.getFirst());
        }
        var candidates = new ArrayList<MethodReference>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            var code = instructions(method);
            for (int index = 8; index < code.size(); index++) {
                if (code.get(index).getOpcode() != Opcode.INVOKE_DIRECT
                        || !(code.get(index) instanceof FiveRegisterInstruction call) || call.getRegisterCount() != 5
                        || !(code.get(index) instanceof ReferenceInstruction reference)
                        || !(reference.getReference() instanceof MethodReference target)
                        || !target.getName().equals("<init>") || !target.getReturnType().equals("V")
                        || !target.getParameterTypes().equals(List.of(STRING, STRING, STRING, STRING))) continue;
                int[] arguments = {call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG()};
                if (!(code.get(index - 8) instanceof FiveRegisterInstruction first)) continue;
                int receiver = first.getRegisterC();
                var registers = new java.util.HashSet<Integer>();
                boolean matches = true;
                for (int argument = 0; argument < 4; argument++) {
                    var invoke = code.get(index - 8 + argument * 2);
                    var result = code.get(index - 7 + argument * 2);
                    if (invoke.getOpcode() != Opcode.INVOKE_VIRTUAL
                            || !(invoke instanceof FiveRegisterInstruction getter) || getter.getRegisterCount() != 1
                            || getter.getRegisterC() != receiver || !(invoke instanceof ReferenceInstruction getterReference)
                            || !getterReference.getReference().equals(getters.get(argument))
                            || result.getOpcode() != Opcode.MOVE_RESULT_OBJECT
                            || ((OneRegisterInstruction) result).getRegisterA() != arguments[argument]
                            || (argument < 3 && arguments[argument] == receiver)
                            || arguments[argument] == call.getRegisterC() || !registers.add(arguments[argument])) {
                        matches = false;
                        break;
                    }
                }
                if (matches) candidates.add(target);
            }
        }
        if (candidates.size() != 1) {
            throw new AssertionError("Expected one server sharing result construction, found " + candidates.size());
        }
        return candidates.getFirst();
    }

    private static List<Instruction> instructions(Method method) {
        var code = new ArrayList<Instruction>();
        if (method.getImplementation() != null) method.getImplementation().getInstructions().forEach(code::add);
        return code;
    }

    private static void verifyResultConstructor(Method method, java.util.List<Instruction> code) {
        String string = "Ljava/lang/String;";
        if (!method.getParameterTypes().equals(java.util.List.of(string, string, string, string))
                || !method.getReturnType().equals("V") || method.getImplementation().getRegisterCount() != 5
                || !AccessFlags.CONSTRUCTOR.isSet(method.getAccessFlags())
                || code.size() != 10 || code.get(9).getOpcode() != Opcode.RETURN_VOID) {
            throw new AssertionError("Unexpected sharing result constructor");
        }
        if (code.get(0).getOpcode() != Opcode.INVOKE_DIRECT
                || !(code.get(0) instanceof FiveRegisterInstruction init) || init.getRegisterCount() != 1
                || init.getRegisterC() != 0 || !(code.get(0) instanceof ReferenceInstruction initReference)
                || !(initReference.getReference() instanceof MethodReference initTarget)
                || !initTarget.getDefiningClass().equals("Ljava/lang/Object;")
                || !initTarget.getName().equals("<init>") || !initTarget.getParameterTypes().isEmpty()
                || !initTarget.getReturnType().equals("V")) {
            throw new AssertionError("Sharing result must initialize its superclass first");
        }
        for (int i = 0; i < 2; i++) {
            int index = 1 + 2 * i;
            int parameter = i == 0 ? 1 : 4;
            if (code.get(index).getOpcode() != Opcode.INVOKE_STATIC_RANGE
                    || !(code.get(index) instanceof RegisterRangeInstruction call)
                    || call.getRegisterCount() != 1 || call.getStartRegister() != parameter
                    || !(code.get(index) instanceof ReferenceInstruction reference)
                    || !(reference.getReference() instanceof MethodReference target)
                    || !target.getDefiningClass().equals(HELPER) || !target.getName().equals("onShareUrl")
                    || !target.getParameterTypes().equals(java.util.List.of(string))
                    || !target.getReturnType().equals(string)
                    || code.get(index + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT
                    || ((OneRegisterInstruction) code.get(index + 1)).getRegisterA() != parameter) {
                throw new AssertionError("Sharing result must sanitize only the two URL arguments");
            }
        }
        var fields = new java.util.HashSet<String>();
        for (int parameter = 1; parameter <= 4; parameter++) {
            var instruction = code.get(parameter + 4);
            if (instruction.getOpcode() != Opcode.IPUT_OBJECT
                    || !(instruction instanceof TwoRegisterInstruction store)
                    || store.getRegisterA() != parameter || store.getRegisterB() != 0
                    || !(instruction instanceof ReferenceInstruction reference)
                    || !(reference.getReference() instanceof FieldReference field)
                    || !field.getDefiningClass().equals(method.getDefiningClass())
                    || !field.getType().equals(string) || !fields.add(field.getName())) {
                throw new AssertionError("Sharing result arguments are not stored unchanged");
            }
        }
    }
}
