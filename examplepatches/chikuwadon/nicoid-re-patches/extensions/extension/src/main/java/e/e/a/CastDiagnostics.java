package e.e.a;

/** Phase markers only: do not log stream URLs, session cookies, or device addresses. */
public final class CastDiagnostics {
    private CastDiagnostics() { }
    static void record(String message) {
        try { Class.forName("e.e.a.ModernDebug").getMethod("record", String.class).invoke(null, message); }
        catch (ReflectiveOperationException ignored) { }
    }
    public static void discovery() { record("Cast: discovery started for legacy receiver FAB5A9D8"); }
    public static void connected() { record("Cast: Google API connection established; launching legacy receiver"); }
    public static void receiverResult(Object status) { record("Cast: receiver launch result: " + String.valueOf(status)); }
    public static void stream(String url) {
        if (url == null) { record("Cast: stream acquisition failed"); return; }
        String path;
        try { path = new java.net.URL(url).getPath(); }
        catch (java.net.MalformedURLException ignored) { path = url; }
        record(path.contains(".m3u8") ? "Cast: HLS stream acquired; preparing authenticated relay" : "Cast: stream reached legacy relay");
    }
}
