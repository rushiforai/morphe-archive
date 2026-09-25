/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.shared.diagnostics;

/** Removes request addresses, credentials and device identifiers from exported text. */
public final class DiagnosticRedactor {
    private static final String HOST_SUFFIXES =
            "(?:tiktokv?\\.com|tiktokcdn\\.com|byteoversea\\.com|bytedance\\.com|musical\\.ly|ibyteimg\\.com)";
    private static final String CREDENTIAL_NAMES =
            "[a-z0-9_-]*(?:token|session|sessionid|sid|secret|password|passwd|signature|cookie"
                    + "|auth|credential|device_id|deviceid|install_id|installid|iid|openudid"
                    + "|odin|ttwid|uid|sec_user_id|secuid)[a-z0-9_-]*";
    /**
     * Names carrying the id of one video, comment or message. Each of these resolves to a post
     * somebody can open, so a shared report would otherwise carry a slice of what was watched.
     * They are matched whole rather than as a substring, so an ordinary setting such as
     * {@code hide_paid_partnership} keeps its value.
     */
    private static final String CONTENT_ID_NAMES =
            "(?:[a-z0-9]+_)*(?:aid|aweme_?id|item_?id|group_?id|cid|comment_?id|msg_?id|message_?id)";
    /**
     * Ids are printed in comma separated lists, and the value pattern the credential rule uses
     * stops at the first comma, so everything after the first id stayed in the report.
     */
    private static final String CONTENT_ID_VALUE = "\"?[^\\s;&\"'<>]+";
    /**
     * A bare id, for the places that print a list of them with no name in front. TikTok's ids run
     * to nineteen digits; nothing else these reports carry is a number that long.
     */
    private static final String BARE_CONTENT_ID = "\\b\\d{17,21}\\b";
    /**
     * A creator's name, as the bundle writes it into a toast or a banner: between Unicode's
     * first-strong isolate U+2068 and its pop U+2069. Every toast is written to the buffer as it
     * is shown, in whatever language the phone speaks, so the name cannot be found by the words
     * around it. The isolate pair marks it in every language. A run with no pop is cut to the
     * end of the line, so a name that lost its closing mark is still not printed.
     */
    private static final String ISOLATED_NAME = "⁨[^⁩\\n]*⁩?";
    /**
     * An account handle, which starts with @ and stands on its own. One glued to something in
     * front of it is not a handle: an email address, or the identity hash Java prints after a
     * class name.
     */
    private static final String HANDLE = "(?<![\\w.@/:])@[A-Za-z0-9_.]{2,}";

    private DiagnosticRedactor() {
    }

    public static String redact(String text) {
        if (text == null || text.isEmpty()) return "";
        return text
                .replaceAll(ISOLATED_NAME, "[name omitted]")
                .replaceAll(HANDLE, "[handle omitted]")
                .replaceAll("(?i)\\b[a-z][a-z0-9+.-]*://[^\\s\"'<>]+", "[url omitted]")
                .replaceAll("(?i)\\b(?:[a-z0-9-]+\\.)+" + HOST_SUFFIXES + "\\b(?:[:/][^\\s\"'<>]*)?",
                        "[host omitted]")
                .replaceAll("(?i)\\b(" + CREDENTIAL_NAMES + ")\\s*[=:]\\s*\"?[^\\s;,&\"'<>]+",
                        "$1=[omitted]")
                .replaceAll("(?i)\\b(" + CONTENT_ID_NAMES + ")\\s*[=:]\\s*" + CONTENT_ID_VALUE,
                        "$1=[omitted]")
                .replaceAll(BARE_CONTENT_ID, "[id omitted]");
    }
}
