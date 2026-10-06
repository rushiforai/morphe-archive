import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import java.io.File;

/** Validate the original APK callback used by QuickFilterToolbar's long-press action. */
public class VerifyFilterImageAction {
    public static void main(String[] args) throws Exception {
        String callback = switch (args[1]) {
            case "226" -> "Lo/listener$setContentView$RemoteActionCompatParcelizer;";
            case "241" -> "Lo/getRemoteResource$RemoteActionCompatParcelizer;";
            case "242" -> "Lo/zzacr$ComponentActivity;";
            default -> throw new IllegalArgumentException(args[1]);
        };
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) {
            for (ClassDef type : dex.getEntry(entry).getDexFile().getClasses()) {
                if (!type.getType().equals(callback)) continue;
                boolean constructor = false, invoke = false, originalLongClick = false;
                for (Method method : type.getMethods()) {
                    boolean objectArg = method.getParameterTypes().toString().equals("[Ljava/lang/Object;]");
                    constructor |= objectArg && method.getName().equals("<init>");
                    invoke |= objectArg && method.getName().equals("invoke");
                    if (method.getImplementation() == null) continue;
                    for (var instruction : method.getImplementation().getInstructions()) {
                        if (instruction instanceof ReferenceInstruction ref
                                && ref.getReference().toString().contains("handleFilterBarLongClick")) {
                            originalLongClick = true;
                        }
                    }
                }
                if (!constructor || !invoke || !originalLongClick) throw new AssertionError(callback);
                System.out.println("PASS " + args[1] + ": original long-click callback and reflection signatures");
                return;
            }
        }
        throw new AssertionError("Callback missing: " + callback);
    }
}
