package dev.rikunode.futatabi.bridge;

import android.text.Html;
import org.json.JSONObject;

/** Display only recognized upstream error messages; never render raw response JSON. */
final class PostPresentation {
    private PostPresentation() {}
    static String plain(String raw) {
        if (raw == null) return "";
        String s = raw.replaceAll("(?is)<(script|style)\\b[^>]*>.*?</\\1\\s*>", "");
        s = Html.fromHtml(s, Html.FROM_HTML_MODE_LEGACY).toString();
        // A source may HTML-encode its own markup.
        s = s.replaceAll("(?i)</?[a-z][^>]*>", "").replaceAll("[\\r\\n\\t ]+", " ").trim();
        return s.length() > 900 ? s.substring(0, 900) : s;
    }
    static String error(String raw) {
        try {
            JSONObject value = new JSONObject(raw);
            Object error = value.opt("error");
            JSONObject nested = error instanceof JSONObject ? (JSONObject) error : value;
            String text = nested.optString("message", "");
            if (text.isEmpty() && error instanceof String) text = (String) error;
            if (text.isEmpty()) text = nested.optString("code", "");
            if (value.optBoolean("postAccepted"))
                return "\u672c\u6587\u306f\u53d7\u7406\u6e08\u307f\u3002\u753b\u50cf\u306e\u9001\u4fe1\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u518d\u6295\u7a3f\u305b\u305a\u30b9\u30ec\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002 " + plain(text);
            return plain(text);
        } catch (Exception ignored) { return plain(raw); }
    }
    static String completion(String board, String raw, String expectedThread) throws Exception {
        JSONObject value = new JSONObject(raw);
        if ("aimoge".equals(board)) {
            String thread = java.util.UUID.fromString(value.getString("threadId")).toString();
            java.util.UUID.fromString(value.getString("postId"));
            if (!expectedThread.isEmpty() && !thread.equals(expectedThread))
                throw new IllegalArgumentException("Unexpected reply thread");
            String status = value.getString("status");
            int seq = value.getInt("seq");
            if (seq < 0) throw new IllegalArgumentException("Invalid reply number");
            if ("shadowed".equals(status)) return null;
            if (!"public".equals(status)) throw new IllegalArgumentException("Unknown post status");
            return "\u6295\u7a3f\u5b8c\u4e86\uff08\u30ec\u30b9 " + seq + "\uff09";
        }
        if ("animanch".equals(board)) {
            String number = value.getString("number");
            if (!number.matches("[0-9]+")) throw new IllegalArgumentException("Invalid reply number");
            return "\u6295\u7a3f\u5b8c\u4e86\uff08\u30ec\u30b9 " + number + "\uff09";
        }
        throw new IllegalArgumentException("Unsupported reply board");
    }

    static String quote(String board, String number, String body) {
        if (number == null || number.isEmpty()) return body;
        if (!number.matches("[0-9]{1,19}")) throw new IllegalArgumentException("Invalid reply number");
        String prefix;
        if ("aimoge".equals(board)) prefix = ">No." + number;
        else if ("animanch".equals(board)) prefix = ">>" + number;
        else throw new IllegalArgumentException("Unsupported reply board");
        if (body.equals(prefix) || body.startsWith(prefix + "\n")) return body;
        return prefix + "\n" + body;
    }
    static String excerpt(String text) {
        String s = text.replaceAll("\\s+", " ").trim();
        int n = Math.min(100, s.codePointCount(0, s.length()));
        return s.substring(0, s.offsetByCodePoints(0, n));
    }
}
