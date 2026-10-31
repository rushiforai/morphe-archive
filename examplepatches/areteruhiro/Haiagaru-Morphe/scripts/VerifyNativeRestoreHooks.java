import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.zip.ZipFile;

public final class VerifyNativeRestoreHooks {
    public static void main(String[] args) throws Exception {
        var calls = new HashMap<String, Integer>();
        try (ZipFile zip = new ZipFile(args[0])) {
            var entries = zip.entries();
            while (entries.hasMoreElements()) {
                var entry = entries.nextElement();
                if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                byte[] bytes;
                try (var input = zip.getInputStream(entry)) { bytes = input.readAllBytes(); }
                for (var cls : new DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)).getClasses()) {
                    if (!java.util.Set.of("Lo/setFormat;", "Lo/setFormat$2;", "Lo/setFormat$3;", "Lo/lo;").contains(cls.getType())) continue;
                    for (var method : cls.getMethods()) {
                        if (method.getImplementation() == null) continue;
                        for (var instruction : method.getImplementation().getInstructions()) {
                            if (!(instruction instanceof ReferenceInstruction ref)) continue;
                            if (ref.getReference() instanceof MethodReference call) {
                                if (call.getDefiningClass().equals("Lapp/morphe/extension/chmate/NativeRestore191;"))
                                    calls.merge(cls.getType() + ":" + method.getName() + ":" + call.getName(), 1, Integer::sum);
                                if (cls.getType().equals("Lo/setFormat$2;") && call.getName().equals("interrupted"))
                                    throw new AssertionError("Worker still consumes interrupt flag");
                                if (cls.getType().equals("Lo/setFormat;") && method.getName().equals("onStop") && call.getName().equals("interrupt"))
                                    throw new AssertionError("onStop still interrupts restore");
                            }
                            if (cls.getType().equals("Lo/setFormat;") && method.getName().equals("onStop")
                                    && instruction.getOpcode() == Opcode.IPUT_OBJECT
                                    && ref.getReference() instanceof FieldReference f && f.getName().equals("c"))
                                throw new AssertionError("onStop still loses worker reference");
                        }
                    }
                }
            }
        }
        for (var expected : java.util.Map.of(
                "Lo/setFormat;:onStart:beginPreview", 1,
                "Lo/setFormat;:onCreate:stagingRoot", 1,
                "Lo/setFormat$3;:run:clearUnpreparedDirectory", 1,
                "Lo/setFormat$3;:run:reusePreview", 1,
                "Lo/setFormat$3;:run:finishPreview", 3,
                "Lo/setFormat$3;:run:previewError", 1,
                "Lo/setFormat$2;:run:isInterrupted", 3,
                "Lo/setFormat$2;:run:beginRestore", 1).entrySet()) {
            if (!expected.getValue().equals(calls.get(expected.getKey()))) throw new AssertionError(expected + ": " + calls);
        }
        if (calls.entrySet().stream().filter(e -> e.getKey().startsWith("Lo/lo;:") && e.getKey().endsWith(":installDatabase")).mapToInt(e -> e.getValue()).sum() != 1)
            throw new AssertionError("Expected exactly one startup DB install hook: " + calls);
        if (calls.entrySet().stream().filter(e -> e.getKey().startsWith("Lo/lo;:") && e.getKey().endsWith(":stagingRoot")).mapToInt(e -> e.getValue()).sum() != 1)
            throw new AssertionError("Startup cleanup must use the non-cache staging directory");
        System.out.println("PASS native191 restore DEX hooks: lifecycle, extraction reuse, non-consuming cancellation, verified DB installation");
    }
}
