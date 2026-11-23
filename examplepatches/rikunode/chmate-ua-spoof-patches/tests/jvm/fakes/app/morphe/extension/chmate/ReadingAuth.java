package app.morphe.extension.chmate;

/** Test double of Haiagaru's package-private ReadingAuth.agent(url, method): eddibb reads only. */
final class ReadingAuth {
    static volatile String pairedAgent;
    static String agent(String url, String method) {
        if (pairedAgent == null || url == null) return null;
        boolean read = "GET".equalsIgnoreCase(method) || "HEAD".equalsIgnoreCase(method);
        return read && url.startsWith("https://bbs.eddibb.cc/") && url.contains("/test/read.cgi/") ? pairedAgent : null;
    }
    private ReadingAuth() { }
}
