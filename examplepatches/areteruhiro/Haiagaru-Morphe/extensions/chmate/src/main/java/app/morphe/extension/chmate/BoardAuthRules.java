package app.morphe.extension.chmate;

import java.net.URI;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** No credentials or draft content are stored by this policy. */
public final class BoardAuthRules {
    private BoardAuthRules() {}
    /** ex0ch signs countsession with securitykey; never import only half of this identity. */
    public static boolean identityCookie(String name) {
        return "countsession".equalsIgnoreCase(name) || "securitykey".equalsIgnoreCase(name);
    }
    public static String origin(String value) {
        try {
            URI uri = new URI(value.trim());
            if (!"https".equalsIgnoreCase(uri.getScheme()) || uri.getHost() == null
                    || uri.getRawUserInfo() != null) return "";
            return "https://" + uri.getHost().toLowerCase(Locale.ROOT)
                    + (uri.getPort() == -1 || uri.getPort() == 443 ? "" : ":" + uri.getPort());
        } catch (Exception ignored) { return ""; }
    }
    public static String validate(String value) {
        if (value == null || origin(value).isEmpty()) throw new IllegalArgumentException("認証URLはHTTPSで入力してください（ユーザー名・パスワード埋め込み不可）。");
        URI uri = URI.create(value.trim());
        if (uri.getRawFragment() != null) throw new IllegalArgumentException("認証URLに # は指定できません。");
        return uri.toASCIIString();
    }
    public static String preset(String board) {
        return "https://bbs.eddibb.cc".equals(origin(board)) ? "https://bbs.eddibb.cc/auth-code" : "";
    }
    public static boolean required(String message) {
        if (message == null || message.length() > 65536) return false;
        String lower = message.toLowerCase(Locale.ROOT);
        return lower.contains("/auth-code") || lower.contains("authentication required")
                || lower.contains("認証が必要") || lower.contains("認証してください")
                || lower.contains("認証を行") || lower.contains("認証されていません")
                || lower.contains("認証して") || lower.contains("認証が切")
                || lower.contains("認証に失敗") || lower.contains("認証を済")
                || lower.contains("認証コード") || lower.contains("未認証")
                || lower.contains("captcha") || lower.contains("画像認証")
                || lower.contains("ロボットではない") || lower.contains("人間であることを確認");
    }
    public static String suggested(String board, String message) {
        String origin = origin(board);
        if (origin.isEmpty() || !required(message)) return "";
        Matcher links = Pattern.compile("https://[^\\s<>\"']+|/auth-code(?:[?][^\\s<>\"']*)?").matcher(message);
        while (links.find()) {
            String url = links.group().replace("&amp;", "&");
            if (url.startsWith("/")) url = origin + url;
            if (origin.equals(origin(url))) {
                try { return validate(url); } catch (IllegalArgumentException ignored) { }
            }
        }
        return preset(board);
    }

    /** Extract only an explicitly labelled token; otherwise let the user copy the whole error. */
    public static String code(String message) {
        if (message == null || message.length() > 65536) return "";
        Matcher match = Pattern.compile("(?:認証コード|authentication code|auth code)(?:\\s*[：:=]\\s*[「『\\\"']?|\\s*[「『\\\"'])([A-Za-z0-9][A-Za-z0-9_-]{2,254})(?![A-Za-z0-9_/-])",
                Pattern.CASE_INSENSITIVE).matcher(message);
        if (!match.find()) return "";
        String value = match.group(1);
        // A URL after the label is not a code.
        return value.equalsIgnoreCase("https") || value.equalsIgnoreCase("http") ? "" : value;
    }
}
