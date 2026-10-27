package app.patchlab.extension.offlinegames.strictv2;

import java.io.File;
import java.io.IOException;

/** Checks all relevant file-backed mappings, resolving actual filesystem aliases. */
public final class NativeLoadStatus {
    private NativeLoadStatus() {}

    public static boolean hasExpectedMapping(String maps, String directory) {
        return problem(maps, directory, "libil2cpp.so") == null;
    }

    public static String problem(String maps, String directory, String name) {
        if (directory == null) return "No prepared library directory";
        final File expected;
        try {
            expected = new File(directory, name).getCanonicalFile();
        } catch (IOException error) {
            return "Cannot resolve expected " + name + ": " + error;
        }
        boolean found = false;
        for (String line : maps.split("\n")) {
            if (!line.contains(name)) continue;
            // address, permissions, offset, device, inode, pathname (may contain spaces)
            String[] columns = line.trim().split("\\s+", 6);
            if (columns.length != 6) return "Unrecognized mapping for " + name + ": " + line;
            String path = columns[5];
            if (path.endsWith(" (deleted)")) return "Deleted mapping for " + name + ": " + path;
            try {
                if (!new File(path).getCanonicalFile().equals(expected)) {
                    return "Unexpected " + name + " mapping: " + path + "\nExpected: " + expected;
                }
            } catch (IOException error) {
                return "Cannot resolve " + name + " mapping: " + error;
            }
            found = true;
        }
        return found ? null : "Missing process mapping for " + name;
    }

    public static String unityProblem(String maps, String directory) {
        for (String name : new String[]{"libmain.so", "libunity.so", "libil2cpp.so"}) {
            String problem = problem(maps, directory, name);
            if (problem != null) return problem;
        }
        return null;
    }
}
