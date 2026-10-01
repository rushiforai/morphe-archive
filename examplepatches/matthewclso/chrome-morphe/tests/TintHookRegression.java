import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.File;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

/** Compare the Android Icon call contract in an original and patched Chrome APK. */
public final class TintHookRegression {
    private static Map<String, Integer> calls(String path) throws Exception {
        var result = new TreeMap<String, Integer>();
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) {
            for (var cls : dex.getEntry(entry).getDexFile().getClasses()) {
                if (cls.getType().startsWith("Lapp/matthew/chrome/extension/")) continue;
                for (var method : cls.getMethods()) {
                    if (method.getImplementation() == null) continue;
                    var code = new ArrayList<Instruction>();
                    method.getImplementation().getInstructions().forEach(code::add);
                    for (int i = 0; i < code.size(); i++) {
                        var instruction = code.get(i);
                        if (!(instruction instanceof ReferenceInstruction reference)
                                || !(reference.getReference() instanceof MethodReference call)
                                || !call.getDefiningClass().equals("Landroid/graphics/drawable/Icon;")
                                || !(call.getName().equals("setTint") || call.getName().equals("setTintList"))) continue;
                        String next = i + 1 < code.size() ? code.get(i + 1).getOpcode().name() : "end";
                        result.merge(method + " " + instruction.getOpcode() + " " + call + " next=" + next, 1, Integer::sum);
                    }
                }
            }
        }
        return result;
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("Expected original.apk patched.apk");
        var original = calls(args[0]);
        var patched = calls(args[1]);
        if (original.values().stream().mapToInt(Integer::intValue).sum() != 2)
            throw new AssertionError("Expected both Icon tint call sites in the supported Chrome build");
        if (!original.equals(patched))
            throw new AssertionError("Android Icon calls or their result consumers changed");
        System.out.println("Both native Icon tint calls and result consumers are preserved.");
    }
}
