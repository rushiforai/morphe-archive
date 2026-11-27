import app.morphe.patcher.patch.*;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;

/** Check real loader metadata and dependency closure for all 256 toggle combinations. */
public class ValidateBundleOptions {
    private static void visit(Patch<?> patch, Set<Patch<?>> closure) {
        if (closure.add(patch)) for (Patch<?> dependency : patch.getDependencies()) visit(dependency, closure);
    }
    public static void main(String[] args) throws Exception {
        File bundle = new File(args[0]);
        PatchLoader loader = args.length > 1
            ? new PatchLoader.Dex(Set.of(bundle), new File(args[1]))
            : new PatchLoader.Jar(Set.of(bundle));
        Set<String> expected = Set.of("Selectable map themes", "Detailed report icons at normal sizes", "Rank badge selector", "Unlock driver moods", "Android Auto setup", "Selectable report icon packs", "Android Auto police alert distance", "Speed camera sound below speed limit");
        List<Patch<?>> options = new ArrayList<>();
        Set<String> names = new HashSet<>();
        for (Patch<?> patch : loader) if (patch.getName() != null) { options.add(patch); names.add(patch.getName()); }
        if (options.size() != expected.size() || !names.equals(expected)) throw new AssertionError("Unexpected options: " + names);
        for (int mask = 0; mask < (1 << options.size()); mask++) {
            Set<Patch<?>> closure = new HashSet<>();
            Set<String> selected = new HashSet<>();
            for (int i = 0; i < options.size(); i++) if ((mask & (1 << i)) != 0) {
                selected.add(options.get(i).getName()); visit(options.get(i), closure);
            }
            Set<String> actual = new HashSet<>();
            for (Patch<?> patch : closure) if (patch.getName() != null) actual.add(patch.getName());
            if (!selected.equals(actual)) throw new AssertionError("Unexpected automatic selection: " + selected + " -> " + actual);
        }
        try (ZipFile zip = new ZipFile(bundle)) {
            for (String hash : List.of("2b7cbd6c31b0cdac691dd0df6abf9639fa4feb2e9dd3923f99ce0774ca122c95", "11f1914871552e4827d1bb75bb4f9a2893579c7df0b4b72514731442fb394ef4")) {
                var entry = zip.getEntry("themes/native-profiles/" + hash + ".properties");
                if (entry == null) throw new AssertionError("Missing regression renderer profile: " + hash);
                Properties profile = new Properties();
                try (var input = zip.getInputStream(entry)) { profile.load(input); }
                if (!hash.equals(profile.getProperty("source.sha256")) || !"2".equals(profile.getProperty("profile.schema")) ||
                        !profile.getProperty("output.sha256", "").matches("[a-f0-9]{64}"))
                    throw new AssertionError("Invalid renderer profile: " + hash);
            }
            for (String path : List.of("extensions/theme-selector.dex", "extensions/badge-selector.dex", "extensions/aa-installer.dex", "extensions/icon-pack.dex", "extensions/alert-distance.dex", "extensions/camera-sound.dex", "classes.dex")) {
                if (zip.getEntry(path) == null || zip.getEntry(path).getSize() == 0) throw new AssertionError("Missing DEX: " + path);
            }
            for (String path : List.of("theme-selector.dex", "badge-selector.dex", "aa-installer.dex", "icon-pack.dex", "alert-distance.dex", "camera-sound.dex")) {
                var dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), new BufferedInputStream(zip.getInputStream(zip.getEntry("extensions/" + path))));
                Set<String> local = new HashSet<>();
                for (var type : dex.getClasses()) local.add(type.getType());
                for (var reference : dex.getTypeReferences()) {
                    String type = reference.getType();
                    while (type.startsWith("[")) type = type.substring(1);
                    if (type.startsWith("Llocal/wazemaps/") && !local.contains(type))
                        throw new AssertionError("Cross-extension dependency in " + path + ": " + type);
                }
            }
        }
        for (Patch<?> patch : options) {
            if (!(patch instanceof BytecodePatch)) continue;
            int streams = 0;
            for (var provider : ((BytecodePatch) patch).getExtensionStreamProviders$morphe_patcher()) {
                for (var input : provider.get()) try (InputStream stream = input.get()) {
                    byte[] magic = stream.readNBytes(4);
                    if (!Arrays.equals(magic, new byte[]{'d','e','x','\n'})) throw new AssertionError("Invalid extension: " + patch.getName());
                    streams++;
                }
            }
            int expectedStreams = patch.getName().equals("Unlock driver moods") ? 0 : 1;
            if (streams != expectedStreams) throw new AssertionError("Unexpected extension count for " + patch.getName() + ": " + streams);
        }
        System.out.println("PASS: exactly eight independent options, all 256 selection combinations, and separately loadable theme/icon/badge/Android Auto/alert/camera extensions on " + System.getProperty("java.vm.name"));
    }
}
