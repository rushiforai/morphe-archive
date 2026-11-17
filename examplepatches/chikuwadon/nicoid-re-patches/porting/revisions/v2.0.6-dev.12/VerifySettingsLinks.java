import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.jf.dexlib2.DexFileFactory;
import org.jf.dexlib2.Opcode;
import org.jf.dexlib2.Opcodes;
import org.jf.dexlib2.iface.ClassDef;
import org.jf.dexlib2.iface.Method;
import org.jf.dexlib2.iface.MethodImplementation;
import org.jf.dexlib2.iface.instruction.Instruction;
import org.jf.dexlib2.iface.instruction.ReferenceInstruction;
import org.jf.dexlib2.iface.reference.MethodReference;
import org.jf.dexlib2.util.ReferenceUtil;

/** Resolves static calls to the helpers changed by the settings and resume overlays. */
public final class VerifySettingsLinks {
    private static final String RESUME = "Le/e/a/AppResume253;";
    private static final String DEV111 = "Le/e/a/Dev111;";
    private static final Set<String> CHECKED = Set.of(
        RESUME, DEV111, "Le/e/a/FullscreenOptions262;",
        "Le/e/a/FullscreenOptions265;", "Le/e/a/FullscreenSettings270;"
    );

    public static void main(String[] args) throws Exception {
        List<ClassDef> classes = new ArrayList<>();
        Set<String> found = new HashSet<>();
        Map<String, Method> staticMethods = new HashMap<>();
        for (String path : args) {
            for (ClassDef type : DexFileFactory.loadDexFile(new File(path), Opcodes.getDefault()).getClasses()) {
                classes.add(type);
                if (!CHECKED.contains(type.getType())) continue;
                if (!found.add(type.getType())) throw new AssertionError("Duplicate " + type.getType());
                for (Method method : type.getMethods()) {
                    if ((method.getAccessFlags() & 0x8) != 0) {
                        staticMethods.put(ReferenceUtil.getMethodDescriptor(method), method);
                    }
                }
            }
        }
        if (!found.equals(CHECKED)) throw new AssertionError("Missing settings helpers: " + found);
        int resolved = 0;
        int refreshCalls = 0;
        for (ClassDef type : classes) {
            for (Method method : type.getMethods()) {
                MethodImplementation body = method.getImplementation();
                if (body == null) continue;
                for (Instruction instruction : body.getInstructions()) {
                    Opcode opcode = instruction.getOpcode();
                    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) continue;
                    MethodReference target = (MethodReference) ((ReferenceInstruction) instruction).getReference();
                    if (!CHECKED.contains(target.getDefiningClass())) continue;
                    String descriptor = ReferenceUtil.getMethodDescriptor(target);
                    if (!staticMethods.containsKey(descriptor)) {
                        throw new AssertionError(ReferenceUtil.getMethodDescriptor(method) + " calls missing " + descriptor);
                    }
                    if (type.getType().equals(DEV111) && method.getName().equals("updateSummaries")
                            && target.getDefiningClass().equals(RESUME) && target.getName().equals("refresh")) {
                        refreshCalls++;
                    }
                    resolved++;
                }
            }
        }
        if (refreshCalls != 1) throw new AssertionError("Expected one resume settings refresh, got " + refreshCalls);
        System.out.println("PASS: " + resolved + " static settings and resume calls resolved");
    }
}
