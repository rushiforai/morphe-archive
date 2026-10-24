import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import java.util.zip.ZipFile;

/** Checks semantic native color anchors, and the exact registers/slots in patched APKs. */
public final class VerifyNativeThemeColors {
    static final String[] KEYS = {"windowBackgroundColor", "textPrimaryColor", "primaryColor",
        "dialogBackgroundColor", "progressBarPrimaryColor", "progressBarBackgroundColor", "listBackgroundColor"};
    static final String[][] PROFILES = {
        {"Lo/r8lambda0m18vyepBPbBImKp0mAya80YXc8;", "d"},
        {"Lo/addConnectException;", "b"}, {"Lo/getPageMargin;", "a"}, {"Lo/onTextChanged;", "a"}};
    static void check(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
    static List<Instruction> body(Method method) {
        List<Instruction> result = new ArrayList<>();
        if (method.getImplementation() != null) method.getImplementation().getInstructions().forEach(result::add);
        return result;
    }
    static String fieldId(FieldReference field) { return field.getDefiningClass()+"->"+field.getName()+":"+field.getType(); }
    public static void main(String[] args) throws Exception {
        check(args.length > 1 && (args[0].equals("--source") || args[0].equals("--patched")),
            "Usage: VerifyNativeThemeColors --source|--patched apk...");
        for (int arg = 1; arg < args.length; arg++) try (var zip = new ZipFile(args[arg])) {
            Map<String, ClassDef> classes = new HashMap<>();
            for (var entry : Collections.list(zip.entries())) {
                if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                byte[] bytes; try (var input = zip.getInputStream(entry)) { bytes = input.readAllBytes(); }
                for (var cls : new DexBackedDexFile(Opcodes.getDefault(), java.nio.ByteBuffer.wrap(bytes)).getClasses())
                    classes.put(cls.getType(), cls);
            }
            String[] profile = null;
            for (var candidate : PROFILES) {
                ClassDef cls = classes.get(candidate[0]);
                if (cls == null) continue;
                boolean semanticTheme = false;
                for (var method : cls.getMethods()) for (var instruction : body(method))
                    if (instruction instanceof ReferenceInstruction r && r.getReference() instanceof StringReference s &&
                        s.getString().equals("textPrimaryColor")) semanticTheme = true;
                if (!semanticTheme) continue;
                check(profile == null, "Ambiguous native theme profile"); profile = candidate;
            }
            check(profile != null, "Native theme class missing");
            ClassDef theme = classes.get(profile[0]);
            List<String> expected = new ArrayList<>();
            for (String key : KEYS) {
                Set<String> matches = new HashSet<>();
                for (var method : theme.getMethods()) {
                    var instructions = body(method);
                    for (int i = 0; i + 1 < instructions.size(); i++) {
                        if (!(instructions.get(i) instanceof ReferenceInstruction r &&
                            r.getReference() instanceof StringReference s && s.getString().equals(key))) continue;
                        var next = instructions.get(i + 1);
                        if (next.getOpcode() == Opcode.IGET && next instanceof ReferenceInstruction f &&
                            f.getReference() instanceof FieldReference field && field.getDefiningClass().equals(theme.getType()) &&
                            field.getType().equals("I")) matches.add(fieldId(field));
                    }
                }
                check(matches.size() == 1, "Missing/ambiguous JSON field: " + key);
                String field = matches.iterator().next(); expected.add(field);
                boolean publicField = false;
                for (var f : theme.getFields()) if (fieldId(f).equals(field) && (f.getAccessFlags() & 1) != 0) publicField = true;
                check(publicField, "Native color is not public: " + key);
            }
            Method getter = null;
            for (var method : theme.getMethods()) if (method.getName().equals(profile[1]) &&
                (method.getAccessFlags() & 9) == 9 && method.getReturnType().equals(theme.getType()) &&
                method.getParameterTypes().equals(List.of("Landroid/content/Context;"))) {
                check(getter == null, "Ambiguous palette getter"); getter = method;
            }
            check(getter != null, "Public static Context palette getter missing");
            if (args[0].equals("--patched")) {
                ClassDef bridge = classes.get("Lapp/morphe/extension/chmate/NativeThemeColors;");
                check(bridge != null, "Theme bridge missing");
                Method colors = null;
                for (var method : bridge.getMethods()) if (method.getName().equals("colors")) colors = method;
                check(colors != null && colors.getImplementation() != null &&
                    colors.getImplementation().getRegisterCount() == 5, "Theme bridge registers changed");
                var instructions = body(colors);
                var invocation = (RegisterRangeInstruction) instructions.get(0);
                check(invocation.getOpcode() == Opcode.INVOKE_STATIC_RANGE && invocation.getStartRegister() == 4 &&
                    invocation.getRegisterCount() == 1, "Palette getter must receive the original Context p0");
                var ref = (MethodReference) ((ReferenceInstruction) invocation).getReference();
                check(ref.toString().equals(getter.toString()), "Wrong native palette getter");
                int slot = 0;
                for (int i = 0; i < instructions.size(); i++) if (instructions.get(i).getOpcode() == Opcode.IGET) {
                    var read = (TwoRegisterInstruction) instructions.get(i);
                    var field = (FieldReference) ((ReferenceInstruction) read).getReference();
                    check(slot < expected.size() && expected.get(slot).equals(fieldId(field)) &&
                        read.getRegisterA() == 2 && read.getRegisterB() == 0, "Wrong color field or receiver at slot " + slot);
                    var index = instructions.get(i + 1);
                    check(index instanceof NarrowLiteralInstruction n && n.getNarrowLiteral() == slot &&
                        ((OneRegisterInstruction) index).getRegisterA() == 3, "Wrong array slot " + slot);
                    var store = (ThreeRegisterInstruction) instructions.get(i + 2);
                    check(store.getOpcode() == Opcode.APUT && store.getRegisterA() == 2 &&
                        store.getRegisterB() == 1 && store.getRegisterC() == 3, "Wrong palette array write");
                    slot++;
                }
                check(slot == KEYS.length, "Incomplete native palette");
            }
            System.out.println("PASS " + args[0] + " " + args[arg] + ": 7 native colors, public Context getter" +
                (args[0].equals("--patched") ? ", exact bridge registers/array slots" : " (not a runtime test)"));
        }
    }
}
