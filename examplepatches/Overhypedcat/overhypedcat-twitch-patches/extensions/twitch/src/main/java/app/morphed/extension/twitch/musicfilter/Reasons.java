package app.morphed.extension.twitch.musicfilter;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

/** Failures as short reasons the user can read and report. */
public final class Reasons {
    private Reasons() {
    }

    public static String status(int status) {
        switch (status) {
            case 403: return "refused (403)";
            case 404: return "not found (404)";
            case 429: return "too many requests right now (429), it eases off in a while";
            case 500: return "had an error (500)";
            case 502: return "is having trouble (502)";
            case 503: return "is down for a moment (503)";
            default: return "answered " + status;
        }
    }

    public static String of(Throwable error) {
        if (error instanceof SocketTimeoutException) return "no answer in time";
        if (error instanceof UnknownHostException) return "no internet connection";
        String text = error.getMessage();
        if (text == null || text.trim().isEmpty()) return app.morphed.extension.twitch.Messages.of(error);
        text = text.replaceAll("https?://\\S+", "").replaceAll("\\s+", " ").trim();
        return text.length() > 160 ? text.substring(0, 160) : text;
    }
}
