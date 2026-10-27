package app.morphe.extension.chmate;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/** Positive server completion only. A CAPTCHA result alone is never a posted message. */
final class BoardPostResult {
    private BoardPostResult() { }
    static boolean success(String board, String url, String title, String text, boolean hasForm) {
        if (hasForm || title == null || text == null || BoardAuthRules.origin(board).isEmpty()
                || !BoardAuthRules.origin(board).equals(BoardAuthRules.origin(url))) return false;
        try { if (!"/test/bbs.cgi".equals(URI.create(url).getPath())) return false; }
        catch (IllegalArgumentException invalid) { return false; }
        String heading = title.replaceAll("[\\s　。.!！]+", "");
        if (!(heading.equals("書きこみました") || heading.equals("書き込みました")
                || heading.equals("書き込み完了") || heading.equals("投稿完了"))) return false;
        if (text.contains("エラー") || text.toLowerCase(java.util.Locale.ROOT).contains("error")
                || text.contains("ＥＲＲＯＲ") || text.contains("失敗")) return false;
        return text.contains("書きこみが終わりました") || text.contains("書き込みが終わりました")
                || text.contains("書き込みが完了しました") || text.contains("投稿が完了しました");
    }
    static byte[] fingerprint(CharSequence text) {
        try { return MessageDigest.getInstance("SHA-256").digest(text.toString().getBytes(StandardCharsets.UTF_8)); }
        catch (java.security.NoSuchAlgorithmException impossible) { throw new IllegalStateException(impossible); }
    }
    static boolean sameDraft(byte[] expected, CharSequence current) {
        return expected != null && current != null && MessageDigest.isEqual(expected, fingerprint(current));
    }
}
