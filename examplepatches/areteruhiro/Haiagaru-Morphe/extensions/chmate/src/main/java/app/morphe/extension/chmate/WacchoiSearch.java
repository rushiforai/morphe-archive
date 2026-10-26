package app.morphe.extension.chmate;

import java.net.URI;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Shared parsing rules for public slip indexes; independent of Android UI. */
final class WacchoiSearch {
    static final class RequestBudget {
        final int limit;
        int used;
        RequestBudget(int limit) { this.limit = Math.max(0, limit); }
        void check() throws java.io.IOException {
            if (limit > 0 && used >= limit)
                throw new java.io.IOException("通信回数上限（" + limit + "回）に達しました。「続きから検索」で再開できます");
        }
        void take() throws java.io.IOException { check(); used++; }
        void reset() { used = 0; }
    }
    static final Pattern SLIP = Pattern.compile(
            "(?<![A-Za-z0-9+/])([A-Za-z0-9+/]{4})-([A-Za-z0-9+/]{4})(?![A-Za-z0-9+/])");
    private static final Pattern PAGE = Pattern.compile(
            "(?i)href\\s*=\\s*['\"]?(?:\\./)?\\?p=(\\d+)");

    static boolean validToken(String token) {
        return token != null && token.matches("[A-Za-z0-9+/]{4}");
    }

    static boolean validFilter(String token) {
        return token == null || token.isEmpty()
                || token.matches("[A-Za-z0-9+/\\-]+")
                || token.matches("(?i)ID:/[A-Za-z0-9._+/-]{1,32}/?");
    }

    static String normalizeEdgeIdFilter(String token) {
        if (token == null) return "";
        String value = token.trim();
        if (value.regionMatches(true, 0, "ID:", 0, 3)) value = value.substring(3);
        return value;
    }

    static boolean matchesEdgeId(String filter, String id) {
        String query = normalizeEdgeIdFilter(filter);
        return query.isEmpty() || (id != null && id.contains(query));
    }

    static String edgeWacchoi(String postHtml) {
        Matcher body = Pattern.compile("(?is)<div\\b[^>]*class=['\"]clmess['\"][^>]*>").matcher(postHtml);
        String header = body.find() ? postHtml.substring(0, body.start()) : postHtml;
        Matcher link = Pattern.compile("(?i)(?:[?&]|&amp;)wc=([^&'\"\\s>]+)").matcher(header);
        while (link.find()) {
            try {
                String value = URLDecoder.decode(link.group(1), "UTF-8");
                Matcher slip = SLIP.matcher(value);
                if (slip.find()) return slip.group();
            } catch (java.io.UnsupportedEncodingException | IllegalArgumentException ignored) { }
        }
        return "";
    }

    static boolean matchesEdgeWacchoi(String filter, String value, boolean upper) {
        if (filter == null || filter.isEmpty()) return true;
        Matcher slip = SLIP.matcher(value == null ? "" : value);
        return slip.find() && matchesFilter(filter, slip, upper);
    }

    static String edgeBoardUrl(boolean archive, String title) {
        String base = "https://www.kyodemo.net/sdemo/b/e_e_liveedge/";
        if (title == null || title.trim().isEmpty()) return archive ? base + "?kt=k_&j=1" : base;
        try {
            // Kyodemo uses Shift_JIS for its search form and pagination links.
            return base + "?bs=&kt=" + (archive ? "k_" : "") + "&fr=&to=&k="
                    + URLEncoder.encode(title.trim(), "Windows-31J");
        } catch (java.io.UnsupportedEncodingException unavailable) {
            throw new IllegalStateException(unavailable);
        }
    }

    /** Extract only the post body, excluding name, ID, menus and the page footer. */
    static String edgeBodyHtml(String post) {
        Matcher start = Pattern.compile("(?is)<div\\b[^>]*class=['\"]clmess['\"][^>]*>").matcher(post);
        if (!start.find()) return "";
        int from = start.end(), depth = 1;
        Matcher tags = Pattern.compile("(?is)</?div\\b[^>]*>").matcher(post);
        tags.region(from, post.length());
        while (tags.find()) {
            if (tags.group().startsWith("</")) depth--; else depth++;
            if (depth == 0) return post.substring(from, tags.start());
        }
        return "";
    }

    static boolean matchesFilter(String token, Matcher slip, boolean firstHalf) {
        if (token == null || token.isEmpty()) return true;
        String query = token;
        String upper = slip.group(1);
        String lower = slip.group(2);
        if (query.indexOf('-') >= 0 || query.length() > 4)
            return (upper + "-" + lower).contains(query);
        return (firstHalf ? upper : lower).contains(query);
    }

    static String normalizeSlipText(String text) {
        return java.text.Normalizer.normalize(text == null ? "" : text, java.text.Normalizer.Form.NFKC)
                .replace('\u2010', '-').replace('\u2011', '-').replace('\u2212', '-')
                .replace("\u200b", "").replace("\u200d", "");
    }

    static void selectAllBoards(List<String> available, Set<String> selected) {
        selected.clear();
        selected.addAll(available);
    }

    static boolean allBoardsSelected(List<String> available, Set<String> selected) {
        return !available.isEmpty() && selected.containsAll(available);
    }

    static int nextPage(String html, int current) {
        int next = Integer.MAX_VALUE;
        Matcher matcher = PAGE.matcher(html);
        while (matcher.find()) {
            try {
                int candidate = Integer.parseInt(matcher.group(1));
                if (candidate > current && candidate < next) next = candidate;
            } catch (NumberFormatException ignored) { }
        }
        return next == Integer.MAX_VALUE ? -1 : next;
    }

    static String profileUrl(String base, String href) {
        try {
            URI resolved = URI.create(base).resolve(href.replace("&amp;", "&"));
            String host = resolved.getHost();
            if (!("http".equals(resolved.getScheme()) || "https".equals(resolved.getScheme()))
                    || !("hissi.org".equalsIgnoreCase(host) || "www.hissi.org".equalsIgnoreCase(host))
                    || resolved.getUserInfo() != null || resolved.getPath() == null
                    || !resolved.getPath().matches("/read\\.php/[A-Za-z0-9_-]+/[0-9]{8}/[A-Za-z0-9+/_-]+\\.html")) {
                return null;
            }
            return resolved.toString();
        } catch (IllegalArgumentException invalid) { return null; }
    }

    private WacchoiSearch() { }
}
