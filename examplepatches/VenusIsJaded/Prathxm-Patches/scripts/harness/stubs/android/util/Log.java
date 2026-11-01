package android.util;
/** JVM stub of android.util.Log for the verification harness. */
public final class Log {
    private static int p(String l, String tag, String msg, Throwable t) {
        System.out.println("    [" + l + "/" + tag + "] " + msg + (t != null ? " :: " + t : ""));
        return 0;
    }
    public static int v(String t, String m) { return 0; }
    public static int d(String t, String m) { return 0; }
    public static int d(String t, String m, Throwable e) { return 0; }
    public static int i(String t, String m) { return p("I", t, m, null); }
    public static int w(String t, String m) { return p("W", t, m, null); }
    public static int w(String t, String m, Throwable e) { return p("W", t, m, e); }
    public static int e(String t, String m) { return p("E", t, m, null); }
    public static int e(String t, String m, Throwable e) { if (e != null) e.printStackTrace(System.out); return p("E", t, m, e); }
    public static String getStackTraceString(Throwable t) { return String.valueOf(t); }
}
