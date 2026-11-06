package android.os;

import java.io.File;

/** Model storage mount and permission changes without accessing Android or a real user's files. */
public final class Environment {
    public static final String MEDIA_MOUNTED = "mounted";
    public static final String MEDIA_MOUNTED_READ_ONLY = "mounted_ro";
    public static File getExternalStorageDirectory() { return new File(System.getProperty("test.external")); }
    public static String getExternalStorageState() { return System.getProperty("test.mount", MEDIA_MOUNTED); }
    public static boolean isExternalStorageManager() { return Boolean.parseBoolean(System.getProperty("test.access", "true")); }
}
