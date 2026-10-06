import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import java.io.File;
import java.util.*;

/** Static compatibility check: java -cp morphe-desktop.jar VerifyMarkAllRead.java APK VERSION */
public class VerifyMarkAllRead {
    public static void main(String[] args) throws Exception {
        String[] spec = switch (args[1]) {
            case "191" -> new String[]{"onUserRewarded", "a", "RemoteActionCompatParcelizer", "b", "e"};
            case "226" -> new String[]{"splitDomain", "e", "IconCompatParcelizer", "a", "e"};
            case "241" -> new String[]{"hLn11", "e", "IconCompatParcelizer", "a", "b"};
            case "242" -> new String[]{"VN21", "a", "ComponentActivity", "c", "c"};
            default -> throw new IllegalArgumentException(args[1]);
        };
        Map<String, ClassDef> classes = new HashMap<>();
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) {
            for (ClassDef cls : dex.getEntry(entry).getDexFile().getClasses()) classes.put(cls.getType(), cls);
        }
        String owner = "Lo/" + spec[0];
        ClassDef manager = Objects.requireNonNull(classes.get(owner + ";"), "manager");
        ClassDef board = Objects.requireNonNull(classes.get(owner + "$" + spec[2] + ";"), "board");
        requireField(manager, spec[1], "Map;");
        requireField(board, spec[3], "HashMap;");
        boolean setter = false;
        for (Method m : board.getMethods()) {
            if (m.getName().equals(spec[4]) && m.getParameterTypes().toString().equals("[J, I]")
                    && m.getReturnType().equals("V")) setter = true;
        }
        if (!setter) throw new AssertionError("Missing native read-count setter");
        boolean modern = args[1].equals("241") || args[1].equals("242");
        boolean captured = false;
        for (Method m : manager.getMethods()) {
            if (!m.getName().equals("<init>") || m.getImplementation() == null) continue;
            for (var ins : m.getImplementation().getInstructions()) {
                if (ins instanceof ReferenceInstruction r && r.getReference().toString().contains(
                        "->captureReadCountManager(Ljava/lang/Object;)V")) captured = true;
            }
        }
        if (modern && !captured) throw new AssertionError("Missing DI manager capture hook");
        if (!modern) requireField(manager, "d", owner + ";");
        ClassDef extension = Objects.requireNonNull(classes.get("Lapp/morphe/extension/chmate/Haiagaru;"), "extension");
        boolean captureEntry = false;
        for (Method m : extension.getMethods()) if (m.getName().equals("captureReadCountManager")) captureEntry = true;
        if (!captureEntry) throw new AssertionError("Missing extension entry point");
        System.out.println(args[1] + ": native manager/map/setter and patched extension verified");
    }

    private static void requireField(ClassDef cls, String name, String typeSuffix) {
        for (Field f : cls.getFields()) if (f.getName().equals(name) && f.getType().endsWith(typeSuffix)) return;
        throw new AssertionError("Missing field " + cls.getType() + " " + name + " " + typeSuffix);
    }
}
