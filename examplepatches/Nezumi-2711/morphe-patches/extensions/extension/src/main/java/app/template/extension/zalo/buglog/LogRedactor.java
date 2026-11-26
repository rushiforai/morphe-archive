package app.template.extension.zalo.buglog;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Masks personal data before a line reaches the bug-log file. The file is meant to be shared,
 * so anything that looks like a credential, phone number, e-mail or Zalo uid is masked here
 * even when the caller forgot to.
 */
final class LogRedactor {
    private LogRedactor() { }

    /** key=value / key: value pairs whose value is a secret. */
    private static final Pattern SECRET_PAIR = Pattern.compile(
        "(?i)\\b(access[_-]?token|refresh[_-]?token|id[_-]?token|auth[_-]?token|token|password|passwd|secret|"
            + "session[_-]?key|cookie|authorization|api[_-]?key)(\\s*[=:]\\s*\"?)([^\\s\",;&]+)");
    /** Bearer tokens and Google OAuth tokens (ya29.*, 1//*). */
    private static final Pattern BEARER = Pattern.compile("(?i)\\b(bearer\\s+)([A-Za-z0-9._~+/=-]{8,})");
    private static final Pattern GOOGLE_TOKEN = Pattern.compile("\\b(ya29\\.[A-Za-z0-9._-]+|1//[A-Za-z0-9._-]{10,})");
    /** Long opaque base64/hex-like blobs (JWT pieces, keys). */
    private static final Pattern BLOB = Pattern.compile("\\b[A-Za-z0-9_-]{32,}\\.[A-Za-z0-9_-]{8,}(\\.[A-Za-z0-9_-]+)?\\b");
    private static final Pattern EMAIL = Pattern.compile("\\b([A-Za-z0-9._%+-])[A-Za-z0-9._%+-]*@([A-Za-z0-9.-]+\\.[A-Za-z]{2,})\\b");
    /** Vietnamese phone numbers: +84 / 84 / 0 followed by 9 digits (spaces, dots or dashes allowed). */
    private static final Pattern PHONE = Pattern.compile("(?<![\\d.])(\\+?84|0)([\\s.-]?\\d){9}(?![\\d.])");
    /** Zalo uids and other long numeric ids (9+ digits). Keeps the last three digits for correlation. */
    private static final Pattern LONG_NUMBER = Pattern.compile("(?<![\\d.:])\\d{9,}(?![\\d.])");

    static String redact(String text) {
        if (text == null || text.isEmpty()) return text;
        // Bearer first: "Authorization: Bearer x" would otherwise mask only the word "Bearer".
        String out = BEARER.matcher(text).replaceAll("$1***");
        out = SECRET_PAIR.matcher(out).replaceAll("$1$2***");
        out = GOOGLE_TOKEN.matcher(out).replaceAll("***");
        out = BLOB.matcher(out).replaceAll("***");
        out = EMAIL.matcher(out).replaceAll("$1***@$2");
        out = mask(PHONE.matcher(out));
        out = mask(LONG_NUMBER.matcher(out));
        return out;
    }

    /** Replaces each match with its digits masked except the first two and last three. */
    private static String mask(Matcher matcher) {
        StringBuffer buffer = new StringBuffer();
        while (matcher.find()) {
            String digits = matcher.group().replaceAll("\\D", "");
            String head = digits.length() > 8 ? digits.substring(0, 2) : "";
            String tail = digits.substring(Math.max(0, digits.length() - 3));
            matcher.appendReplacement(buffer, Matcher.quoteReplacement(head + "****" + tail));
        }
        matcher.appendTail(buffer);
        return buffer.toString();
    }
}
