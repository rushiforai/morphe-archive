import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.util.*;
import java.util.zip.ZipFile;
import java.io.BufferedInputStream;

/** Verifies the emitted APK, including receiver provenance after DEX register expansion. */
class VerifyPatchedApk {
    static void require(boolean condition, String message) {
        if (!condition) throw new IllegalStateException(message);
    }
    static Method method(Map<String, ClassDef> classes, String owner, String name, int parameters) {
        ClassDef type = classes.get(owner); require(type != null, "Missing class: " + owner);
        for (Method method : type.getMethods()) {
            if (method.getName().equals(name) && method.getParameterTypes().size() == parameters) return method;
        }
        throw new IllegalStateException("Missing method: " + owner + "->" + name);
    }
    static List<Instruction> instructions(Method method) {
        List<Instruction> result = new ArrayList<>();
        method.getImplementation().getInstructions().forEach(result::add);
        return result;
    }
    public static void main(String[] args) throws Exception {
        Map<String, ClassDef> classes = new HashMap<>();
        try (ZipFile zip = new ZipFile(args[0])) {
            var entries = zip.entries();
            while (entries.hasMoreElements()) {
                var entry = entries.nextElement();
                if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                try (var stream = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (ClassDef type : DexBackedDexFile.fromInputStream(Opcodes.getDefault(), stream).getClasses()) {
                        require(classes.put(type.getType(), type) == null, "Duplicate class: " + type.getType());
                    }
                }
            }
        }
        require(classes.containsKey("Lapp/morphe/extension/swiftkey/ToolbarSettingsActivity;"), "Editor is missing");
        Method render = method(classes, "Lcom/touchtype/keyboard/toolbar/Toolbar;", "g", 2);
        int first = render.getImplementation().getRegisterCount() - 3;
        Map<Integer, String> origins = new HashMap<>();
        origins.put(first, "this"); origins.put(first + 1, "event"); origins.put(first + 2, "state");
        boolean hooked = false;
        for (Instruction instruction : instructions(render)) {
            if (instruction instanceof ReferenceInstruction reference && reference.getReference() instanceof MethodReference call
                && call.getDefiningClass().equals("Lapp/morphe/extension/swiftkey/ToolbarBridge;")
                && call.getName().equals("transform")) {
                int receiver = instruction instanceof RegisterRangeInstruction range ? range.getStartRegister() + 1
                    : ((FiveRegisterInstruction) instruction).getRegisterD();
                require("this".equals(origins.get(receiver)), "Toolbar hook receives a state instead of the toolbar View");
                hooked = true; break;
            }
            if (instruction instanceof TwoRegisterInstruction move && instruction.getOpcode().name().startsWith("MOVE_OBJECT")) {
                origins.put(move.getRegisterA(), origins.get(move.getRegisterB()));
            } else if (instruction instanceof OneRegisterInstruction result
                && (instruction.getOpcode().name().startsWith("MOVE_RESULT") || instruction.getOpcode().name().startsWith("CONST"))) {
                origins.remove(result.getRegisterA());
            }
        }
        require(hooked, "Toolbar render hook was not emitted");
        Method stockEditorEntry = method(classes, "Lrd0/p1;", "<init>", 9);
        long editorHooks = instructions(stockEditorEntry).stream().filter(instruction ->
            instruction instanceof ReferenceInstruction reference && reference.getReference() instanceof MethodReference call
            && call.getDefiningClass().equals("Lapp/morphe/extension/swiftkey/ToolbarHooks;")
            && call.getName().equals("bindEditor")).count();
        require(editorHooks == 1, "Native Reorder items does not open the variable-count editor");
        require(instructions(method(classes, "Lei0/j;", "b", 1)).get(0).getOpcode() == Opcode.RETURN_VOID,
            "Telemetry dispatch is not disabled");
        for (String name : List.of("i", "m")) {
            int count = name.equals("i") ? 2 : 1;
            List<Instruction> body = instructions(method(classes, "Lte/b;", name, count));
            require(body.get(0).getOpcode() == Opcode.SGET_OBJECT && body.get(1).getOpcode() == Opcode.RETURN_OBJECT,
                "Telemetry upload was not short-circuited: " + name);
        }
        System.out.println("Verified emitted DEX: native editor entry, toolbar View receiver, editor, telemetry dispatcher and both upload methods.");
    }
}
