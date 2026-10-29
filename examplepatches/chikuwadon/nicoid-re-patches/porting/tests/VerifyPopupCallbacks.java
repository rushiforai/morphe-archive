import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

public class VerifyPopupCallbacks {
    private static final String OWNER = "Le/e/a/PopupPinchLayout;";

    public static void main(String[] args) throws Exception {
        DexFile dex;
        try (java.io.InputStream in = new java.io.BufferedInputStream(new java.io.FileInputStream(args[0]))) {
            dex = com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile.fromInputStream(Opcodes.forApi(21), in);
        }
        Set<String> definitions = new HashSet<>();
        Set<String> names = new HashSet<>();
        Map<String, Set<String>> calls = new HashMap<>();
        for (ClassDef cls : dex.getClasses()) {
            if (!cls.getType().equals(OWNER)) continue;
            for (Method method : cls.getMethods()) {
                definitions.add(method.toString());
                names.add(method.getName());
                Set<String> targets = new HashSet<>();
                calls.put(method.getName(), targets);
                if (method.getImplementation() == null) continue;
                for (Instruction instruction : method.getImplementation().getInstructions()) {
                    if (!(instruction instanceof ReferenceInstruction)) continue;
                    Reference reference = ((ReferenceInstruction) instruction).getReference();
                    if (reference instanceof MethodReference) targets.add(reference.toString());
                }
            }
        }
        // Resizing now runs synchronously; require the real entry points and routing,
        // rather than a compiler-specific number of lambda callbacks.
        for (String name : Arrays.asList("bind", "dispatchTouchEvent", "resize", "save", "onDetachedFromWindow")) {
            if (!names.contains(name)) throw new AssertionError("Missing popup entry point: " + name);
        }
        requireCall(calls, "dispatchTouchEvent", OWNER + "->resize(Ljava/lang/Object;F)V");
        requireCall(calls, "dispatchTouchEvent", OWNER + "->save(Ljava/lang/Object;)V");
        requireCall(calls, "resize", "Le/e/a/PopupLayout236;->request(Ljava/lang/Object;III)V");
        requireCall(calls, "save", "Le/e/a/PopupResize236;->save(Ljava/lang/Object;)V");
        requireCall(calls, "onDetachedFromWindow", "Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V");
        int checked = 0;
        for (ClassDef cls : dex.getClasses()) for (Method method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            for (Instruction instruction : method.getImplementation().getInstructions()) {
                if (!(instruction instanceof ReferenceInstruction)) continue;
                Reference reference = ((ReferenceInstruction) instruction).getReference();
                if (!(reference instanceof MethodReference)) continue;
                MethodReference target = (MethodReference) reference;
                if (!target.getDefiningClass().equals(OWNER)) continue;
                // Framework methods may legally be referenced through the subclass.
                if (!names.contains(target.getName()) && !target.getName().startsWith("lambda$")) continue;
                checked++;
                if (!definitions.contains(target.toString())) {
                    throw new AssertionError("Unresolved packaged DEX callback: " + target);
                }
            }
        }
        System.out.println("Popup lifecycle/resize routing and exact DEX callback names verified: " + checked);
    }

    private static void requireCall(Map<String, Set<String>> calls, String source, String target) {
        if (!calls.get(source).contains(target)) throw new AssertionError("Missing popup routing: " + source + " -> " + target);
    }
}
