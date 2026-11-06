import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import java.io.File;
import java.util.ArrayList;

public final class ReplayBindingClass {
    public static void main(String[] args) throws Exception {
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        String marker = args.length > 1 ? args[1] : "twitchPatchReplayEmotes";
        var matches = new ArrayList<String>();
        for (String entry : dex.getDexEntryNames()) {
            for (var type : dex.getEntry(entry).getDexFile().getClasses()) {
                for (var method : type.getMethods()) {
                    if (method.getName().equals(marker))
                        matches.add(type.getType().substring(1, type.getType().length() - 1).replace('/', '.'));
                }
            }
        }
        if (matches.size() != 1) throw new IllegalStateException("Expected one patched replay row, found " + matches.size());
        System.out.println(matches.get(0));
    }
}
