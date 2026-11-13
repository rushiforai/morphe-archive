import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import org.jf.dexlib2.Opcodes;
import org.jf.dexlib2.dexbacked.DexBackedDexFile;
import org.jf.dexlib2.iface.ClassDef;
import org.jf.dexlib2.writer.io.FileDataStore;
import org.jf.dexlib2.writer.pool.DexPool;

final class MergeLiveDex {
    private static DexBackedDexFile read(String path) throws IOException {
        return org.jf.dexlib2.DexFileFactory.loadDexFile(new File(path), Opcodes.forApi(28));
    }

    private static boolean updatedHelper(String type) {
        return type.equals("Le/e/a/RetainedPlayback137;") || type.startsWith("Le/e/a/RetainedPlayback137$")
            || type.equals("Le/e/a/PlayerIcons;") || type.startsWith("Le/e/a/PlayerIcons$")
            || type.equals("Le/e/a/PlayerTheme;") || type.startsWith("Le/e/a/PlayerTheme$");
    }

    public static void main(String[] args) throws IOException {
        DexBackedDexFile baseline = read(args[0]);
        DexBackedDexFile hooks = read(args[1]);
        DexBackedDexFile live = read(args[2]);
        DexPool pool = new DexPool(baseline.getOpcodes());
        Set<String> replacements = new HashSet<>();
        for (ClassDef cls : hooks.getClasses()) {
            replacements.add(cls.getType());
            pool.internClass(cls);
        }
        Set<String> liveAmbient = new HashSet<>();
        for (ClassDef cls : live.getClasses()) {
            String type = cls.getType();
            if (type.equals("Le/e/a/AmbientLight;") || type.startsWith("Le/e/a/AmbientLight$")
                    || type.startsWith("Le/e/a/AmbientLight$$")) liveAmbient.add(type);
        }
        if (!liveAmbient.contains("Le/e/a/AmbientLight$Glow;")) throw new IOException("Missing ambient glow");
        // The local playlist screen needs cohesive UI + adapter changes: replace
        // its complete class family, including compiled lambda implementations.
        Set<String> livePlaylist = new HashSet<>();
        for (ClassDef cls : live.getClasses()) {
            String type = cls.getType();
            if (type.equals("Le/e/a/LocalPlaylists;") || type.startsWith("Le/e/a/LocalPlaylists$"))
                livePlaylist.add(type);
        }
        if (!livePlaylist.contains("Le/e/a/LocalPlaylists;")
                || !livePlaylist.contains("Le/e/a/LocalPlaylists$Page;"))
            throw new IOException("Missing local playlist replacement classes");
        Set<String> types = new HashSet<>();
        for (ClassDef cls : baseline.getClasses()) {
            String type = cls.getType();
            types.add(type);
            if (!replacements.contains(type) && !liveAmbient.contains(type)
                    && !type.equals("Le/e/a/LocalPlaylists;")
                    && !type.startsWith("Le/e/a/LocalPlaylists$")
                    && !updatedHelper(type)) pool.internClass(cls);
        }
        if (!types.containsAll(replacements)) throw new IOException("Unknown replacement class");
        Set<String> expectedHelpers = new HashSet<>();
        expectedHelpers.add("Le/e/a/RetainedPlayback137;");
        expectedHelpers.add("Le/e/a/PlayerIcons;");
        expectedHelpers.add("Le/e/a/PlayerTheme;");
        if (!types.containsAll(expectedHelpers))
            throw new IOException("Missing stable helper override family");
        Set<String> suppliedHelpers = new HashSet<>();
        for (ClassDef cls : live.getClasses()) if (expectedHelpers.contains(cls.getType()))
            suppliedHelpers.add(cls.getType());
        if (!suppliedHelpers.equals(expectedHelpers))
            throw new IOException("Missing live helper replacement classes");

        for (ClassDef cls : live.getClasses()) {
            String type = cls.getType();
            if (types.add(type) || liveAmbient.contains(type) || livePlaylist.contains(type) || updatedHelper(type)) {
                pool.internClass(cls);
            } else if (!type.startsWith("Lcom/android/tools/r8/annotations/")) {
                throw new IOException("Live dependency collides with stable helper: " + type);
            }
        }
        FileDataStore output = new FileDataStore(new File(args[3]));
        try {
            pool.writeTo(output);
        } finally {
            output.close();
        }
        System.out.println("Verified helper classes: " + types.size());
    }
}
