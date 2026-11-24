import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import java.io.BufferedInputStream;
import java.util.HashSet;
import java.util.Set;
import java.util.zip.ZipFile;

/** Checks serialized branch destinations in patched app, extension and sign-in consumers. */
public final class CheckPatchBranches {
    private static final Set<String> TARGETS = Set.of(
            "Lcom/qidian/Int/reader/utils/w;", "Lcom/qidian/QDReader/utils/i;",
            "Lcom/qidian/Int/reader/MainActivity;",
            "Lfr/g;",
            "Lcom/google/android/gms/auth/api/signin/internal/SignInHubActivity;",
            "Lapp/saketh/extension/navigation/NavigationHooks;",
            "Lcom/qidian/Int/reader/wengine/NewWReaderActivity;",
            "Lcom/qidian/Int/reader/fragment/ReadsFragment;",
            "Lcom/qidian/Int/reader/bookshelf/b0;",
            "Lcom/qidian/QDReader/utils/q;", "Lvr/a;",
            "Landroidx/appcompat/widget/AppCompatTextHelper;",
            "Lskin/support/app/SkinCompatDelegate;", "Lskin/support/content/res/SkinCompatResources;",
            "Lskin/support/content/res/SkinCompatVectorResources;",
            "Lcom/qidian/Int/reader/view/MainPageTabItemView;",
            "Lcom/qidian/QDReader/components/setting/QDReaderUserSetting;", "Lf30/a$a;",
            "Lcom/yuewen/webnovel/wengine/view/WQDHeaderView;",
            "Lcom/yuewen/webnovel/wengine/view/WTextView;",
            "Lcom/qidian/QDReader/readerengine/view/menu/MenuThemeView;",
            "Lcom/qidian/Int/reader/read/menu/WReaderMenuBottomRowView;",
            "Lapp/saketh/extension/controls/PatchControlsActivity;",
            "Lcom/qidian/Int/reader/fragment/r0$e;");

    public static void main(String[] args) throws Exception {
        Set<String> found = new HashSet<>();
        try (ZipFile apk = new ZipFile(args[0])) {
            var entries = apk.entries();
            while (entries.hasMoreElements()) {
                var entry = entries.nextElement();
                if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                try (var input = new BufferedInputStream(apk.getInputStream(entry))) {
                    var dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), input);
                    for (ClassDef cls : dex.getClasses()) {
                        if (!TARGETS.contains(cls.getType())) continue;
                        found.add(cls.getType());
                        for (Method method : cls.getMethods()) {
                            if (method.getImplementation() == null) continue;
                            Set<Integer> boundaries = new HashSet<>();
                            int address = 0;
                            for (Instruction instruction : method.getImplementation().getInstructions()) {
                                boundaries.add(address);
                                address += instruction.getCodeUnits();
                            }
                            address = 0;
                            for (Instruction instruction : method.getImplementation().getInstructions()) {
                                if (instruction instanceof OffsetInstruction branch
                                        && !boundaries.contains(address + branch.getCodeOffset())) {
                                    throw new AssertionError(method.getName() + ": branch at " + address
                                            + " targets middle of instruction " + (address + branch.getCodeOffset()));
                                }
                                address += instruction.getCodeUnits();
                            }
                        }
                    }
                }
            }
        }
        if (!found.equals(TARGETS)) throw new AssertionError("Patched consumer classes missing");
        System.out.println("PASS: patched consumer branches target instruction boundaries");
    }
}
