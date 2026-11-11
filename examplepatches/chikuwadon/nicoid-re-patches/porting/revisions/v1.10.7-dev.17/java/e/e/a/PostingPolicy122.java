package e.e.a;

import java.io.IOException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

/** Limit posting to the known current endpoint and emit credential-free diagnostics. */
public final class PostingPolicy122 {
    public static final String POST_SERVER = "https://public.nvcomment.nicovideo.jp";
    private PostingPolicy122() { }

    public static String postServer(String supplied) throws IOException {
        if (supplied == null || supplied.length() == 0) return POST_SERVER;
        if (!supplied.matches("https://(?:(?:public\\.)?nvcomment|nv-comment)\\.nicovideo\\.jp/?"))
            throw new IOException("Unsupported comment server");
        return POST_SERVER;
    }

    public static String describe(Throwable problem) {
        if (problem instanceof UnknownHostException) return "DNS error";
        if (problem instanceof SocketTimeoutException) return "connection timeout";
        if (problem instanceof IOException) {
            String m = problem.getMessage();
            if (m != null && m.matches("HTTP [1-5][0-9][0-9]"))
                return m + (m.equals("HTTP 429") ? " (rate-limited)" : "");
            if ("Unsupported comment server".equals(m) ||
                "No comment metadata".equals(m) ||
                "No main thread".equals(m) ||
                "Request rejected".equals(m)) return m;
            return "IOException";
        }
        if (problem instanceof IllegalArgumentException) return "invalid posting metadata";
        return problem == null ? "unknown error" : problem.getClass().getSimpleName();
    }
}
