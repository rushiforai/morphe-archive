package android.os;

import java.io.File;

public final class Environment {
    public static String DIRECTORY_DOWNLOADS = "Download";
    private Environment() {}
    public static File getExternalStorageDirectory() { return new File(System.getProperty("java.io.tmpdir"), "ext"); }
    public static String getExternalStorageState() { return "mounted"; }
    public static String getExternalStorageState(File path) { return "mounted"; }
    public static boolean isExternalStorageEmulated() { return true; }
    public static boolean isExternalStorageEmulated(File path) { return true; }
    public static boolean isExternalStorageRemovable() { return false; }
    public static boolean isExternalStorageRemovable(File path) { return false; }
}
