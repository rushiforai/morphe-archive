import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.File;

/** Read-only check of the patched DEX hook and runtime extension. */
public final class VerifyApk {
    public static void main(String[] args) throws Exception {
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        int hooks = 0;
        int legacyHooks = 0;
        boolean extension = false;
        for (String name : dex.getDexEntryNames()) {
            for (var cls : dex.getEntry(name).getDexFile().getClasses()) {
                if (cls.getType().equals("Llab/skisafari/SkiSafariUnlock;")) extension = true;
                boolean modern = cls.getType().equals("Lcom/unity3d/player/UnityPlayerActivity;");
                boolean legacy = cls.getType().equals("Lcom/yodo1/plugin/u3d/Yodo1LagacyUnityActivity;");
                if (!modern && !legacy) continue;
                for (var method : cls.getMethods()) {
                    if (!method.getName().equals("onCreate") || method.getImplementation() == null) continue;
                    for (var instruction : method.getImplementation().getInstructions()) {
                        if (instruction instanceof ReferenceInstruction ref && ref.getReference() instanceof MethodReference target
                                && target.getDefiningClass().equals("Llab/skisafari/SkiSafariUnlock;")
                                && target.getName().equals("start")) {
                            if (modern) hooks++;
                            if (legacy) legacyHooks++;
                        }
                    }
                }
            }
        }
        if (hooks != 1 || !extension) throw new IllegalStateException("Expected one onCreate hook and extension: hooks=" + hooks + ", extension=" + extension);
        if (args.length > 1 && args[1].equals("--legacy") && legacyHooks != 1)
            throw new IllegalStateException("Expected one legacy entry hook, found " + legacyHooks);
        System.out.println("PASS: one Unity Activity onCreate hook and runtime extension present.");
        if (legacyHooks == 1) System.out.println("PASS: one alternative SDK/Unity legacy entry hook present.");
    }
}
