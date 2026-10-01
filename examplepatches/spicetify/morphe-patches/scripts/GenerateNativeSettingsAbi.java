import app.spicetify.patches.spotify.settings.NativeSettingsAbi;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.TreeMap;

class GenerateNativeSettingsAbi {
    /** Maintainer tool: review the ABI trace before replacing the snapshot for a new stock APK. */
    public static void main(String[] args) throws Exception {
        var apk = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.forApi(35));
        var hashes = new TreeMap<String, String>();
        for (String entry : apk.getDexEntryNames()) {
            for (ClassDef definition : apk.getEntry(entry).getDexFile().getClasses()) {
                if (NativeSettingsAbi.TYPES.contains(definition.getType())) hashes.put(definition.getType(), NativeSettingsAbi.digest(definition));
            }
        }
        if (hashes.size() != NativeSettingsAbi.TYPES.size()) throw new IllegalStateException("Missing native settings classes");
        var lines = hashes.entrySet().stream().map(entry -> entry.getKey() + "=" + entry.getValue()).toList();
        Files.write(Path.of(args[1]), lines);
    }
}
