import app.spicetify.patches.spotify.settings.NativeSettingsAbi;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

class GenerateNativeSettingsAbi {
    /**
     * Maintainer tool: review the ABI trace before replacing the snapshot for a new stock APK.
     * {@code <apk> <out>} writes the settings snapshot. {@code --refresh <apk> <file>...} recomputes the
     * digests in snapshot files that already list their classes, as after a change to the digest itself.
     */
    public static void main(String[] args) throws Exception {
        if (args[0].equals("--refresh")) {
            refresh(args[1], List.of(args).subList(2, args.length));
            return;
        }
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

    /** Keeps each file's classes and order, and replaces every digest with the one the stock APK gives now. */
    private static void refresh(String apkPath, List<String> files) throws Exception {
        var lines = new HashMap<String, List<String>>();
        var wanted = new HashMap<String, String>();
        for (String file : files) {
            var content = Files.readAllLines(Path.of(file));
            lines.put(file, content);
            for (String line : content) wanted.put(line.substring(0, line.indexOf('=')), null);
        }
        var apk = DexFileFactory.loadDexContainer(new File(apkPath), Opcodes.forApi(35));
        for (String entry : apk.getDexEntryNames()) {
            for (ClassDef definition : apk.getEntry(entry).getDexFile().getClasses()) {
                if (wanted.containsKey(definition.getType())) wanted.put(definition.getType(), NativeSettingsAbi.digest(definition));
            }
        }
        for (Map.Entry<String, String> entry : wanted.entrySet()) {
            if (entry.getValue() == null) throw new IllegalStateException("Missing class " + entry.getKey());
        }
        for (String file : files) {
            var refreshed = new ArrayList<String>();
            for (String line : lines.get(file)) {
                String type = line.substring(0, line.indexOf('='));
                refreshed.add(type + "=" + wanted.get(type));
            }
            Files.write(Path.of(file), refreshed);
        }
    }
}
