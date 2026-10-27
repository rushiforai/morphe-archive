package app.morphe.extension.chmate;

import java.net.URI;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Ephemeral original server pages. No solver, draft parsing, persistence or automatic submission. */
public final class BoardChallengeSession {
    private static final long LIFETIME = 5 * 60 * 1000000000L;
    private static final Map<String, Page> PAGES = new LinkedHashMap<>();
    private static final Pattern FORMS = Pattern.compile("(?is)<form\\b([^>]*)>");
    private static final Pattern ATTRIBUTES = Pattern.compile("(?is)([a-z][a-z0-9_-]*)\\s*=\\s*(?:\"([^\"]*)\"|'([^']*)'|([^\\s\"'<>`=]+))");
    private BoardChallengeSession() { }

    static String baseUrl(String board, String html) {
        String origin = BoardAuthRules.origin(board);
        if (origin.isEmpty() || html == null || html.length() > 65536
                || !(html.contains("計算による投稿確認") || html.toLowerCase(Locale.ROOT).contains("captcha"))
                || !Pattern.compile("(?is)<(?:html|!doctype)\\b").matcher(html).find()
                || !Pattern.compile("(?is)<script\\b").matcher(html).find()
                || Pattern.compile("(?is)<base\\b").matcher(html).find()) return "";
        String base = origin + "/test/bbs.cgi";
        Matcher forms = FORMS.matcher(html);
        boolean post = false;
        int count = 0;
        while (forms.find()) {
            if (++count > 8) return "";
            Map<String, String> attributes = new LinkedHashMap<>();
            Matcher values = ATTRIBUTES.matcher(forms.group(1));
            while (values.find()) {
                String name = values.group(1).toLowerCase(Locale.ROOT);
                String value = values.group(2) != null ? values.group(2)
                        : values.group(3) != null ? values.group(3) : values.group(4);
                // Ambiguous duplicate attributes must not pick a different action than the browser.
                if (attributes.put(name, value) != null) return "";
            }
            if (!"post".equalsIgnoreCase(attributes.get("method"))) continue;
            String action = attributes.get("action");
            if (action == null || action.isEmpty()) action = base; // HTML's same-page form action.
            try {
                URI destination = URI.create(base).resolve(action.replace("&amp;", "&"));
                if (!origin.equals(BoardAuthRules.origin(destination.toString()))
                        || destination.getRawFragment() != null
                        || !"/test/bbs.cgi".equals(destination.getPath())) return "";
            } catch (IllegalArgumentException invalid) { return ""; }
            post = true;
        }
        return post ? base : "";
    }

    public static final class Page {
        final String board, base, html, encoding;
        final boolean calculation, captcha;
        final long created;
        Runnable posted;
        Page(String board, String base, String html, long created) {
            this.board = board; this.base = base; this.html = html; this.created = created;
            this.encoding = encoding(html);
            this.calculation = html.contains("計算による投稿確認");
            String lower = html.toLowerCase(Locale.ROOT);
            this.captcha = lower.contains("g-recaptcha") || lower.contains("h-captcha")
                    || lower.contains("cf-turnstile") || (!calculation && lower.contains("captcha"));
        }
        byte[] bytes() { return html.getBytes(java.nio.charset.Charset.forName(
                encoding.equals("Shift_JIS") ? "windows-31j" : encoding)); }
    }
    static String encoding(String html) {
        Matcher meta = Pattern.compile("(?is)<meta\\b[^>]*charset\\s*=\\s*[\"']?\\s*([a-z0-9_-]+)").matcher(html);
        if (!meta.find()) return "UTF-8";
        switch (meta.group(1).toLowerCase(Locale.ROOT).replace('_','-')) {
            case "shift-jis": case "sjis": case "windows-31j": case "cp932": return "Shift_JIS";
            case "euc-jp": return "EUC-JP";
            case "iso-2022-jp": return "ISO-2022-JP";
            default: return "UTF-8";
        }
    }
    static synchronized String remember(String board, String html) {
        return remember(board, html, System.nanoTime());
    }
    static synchronized String remember(String board, String html, long now) {
        String base = baseUrl(board, html);
        if (base.isEmpty()) return "";
        expire(now);
        while (PAGES.size() >= 4) PAGES.remove(PAGES.keySet().iterator().next());
        String token = UUID.randomUUID().toString();
        PAGES.put(token, new Page(board, base, html, now));
        return token;
    }
    static synchronized Page find(String token, String board) {
        return find(token, board, System.nanoTime());
    }
    static synchronized Page find(String token, String board, long now) {
        expire(now);
        Page page = PAGES.get(token);
        return page != null && page.board.equals(board) ? page : null;
    }
    static synchronized void forget(String token) { PAGES.remove(token); }
    private static void expire(long now) {
        PAGES.values().removeIf(page -> now - page.created >= LIFETIME || now < page.created);
    }
}
