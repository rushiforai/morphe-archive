package app.patchlab.extension.offlinegames;

/** Checks actual process mappings, not just the files prepared for dlopen. */
public final class NativeLoadStatus {
    private NativeLoadStatus() {}

    public static boolean hasExpectedMapping(String maps, String directory) {
        String expected = directory + "/libil2cpp.so";
        boolean found = false;
        for (String line : maps.split("\n")) {
            if (!line.contains("libil2cpp.so")) continue;
            int pathStart = line.indexOf('/');
            if (pathStart < 0 || !line.substring(pathStart).trim().equals(expected)) return false;
            found = true;
        }
        return found;
    }
}
