package app.morphe.extension.chmate;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.net.URI;
import java.util.Locale;

/** Maps ChMate board identities to Kyodemo's board-scoped ID/ﾜｯﾁｮｲ search. */
public final class KyodemoRouting {
    private KyodemoRouting() {}

    /** Strip only execution parameters, without decoding Shift_JIS search values. */
    public static String analysisResultUrl(String url) {
        if (url == null) return null;
        try {
            URI uri = URI.create(url);
            if (!"https".equalsIgnoreCase(uri.getScheme())
                    || !"www.kyodemo.net".equalsIgnoreCase(uri.getHost())
                    || !uri.getPath().matches("/sdemo/b/[A-Za-z0-9_-]+/")) return null;
            String raw = uri.getRawQuery();
            if (raw == null) return null;
            boolean analysis = false;
            StringBuilder query = new StringBuilder();
            for (String part : raw.split("&")) {
                if (part.equals("fetch=a")) analysis = true;
                // c identifies the site's generated analysis; keep it.
                if (part.startsWith("fetch=")) continue;
                if (query.length() > 0) query.append('&');
                query.append(part);
            }
            return analysis ? "https://www.kyodemo.net" + uri.getRawPath()
                    + (query.length() == 0 ? "" : "?" + query) : null;
        } catch (IllegalArgumentException invalid) {
            return null;
        }
    }

    public static String boardSlug(String sourceHost, String board) {
        if (sourceHost == null || board == null || board.isEmpty()) return null;
        String prefix = prefixForHost(sourceHost.toLowerCase(Locale.ROOT));
        if (prefix == null) return null;
        String identifier = board.replace('/', '_');
        if (!identifier.matches("[A-Za-z0-9_-]+")) return null;
        // ItsuMo ch's 5chan.jp boards are named 5ch_newsplus on the source,
        // but Kyodemo stores them under i_5chnewsplus (without that separator).
        if ("i_".equals(prefix) && identifier.startsWith("5ch_")) {
            identifier = "5ch" + identifier.substring(4);
        }
        if ("s_".equals(prefix) && !identifier.matches("[A-Za-z0-9_-]+_[0-9]+")) {
            return null;
        }
        return prefix + identifier;
    }

    public static boolean supportsHost(String sourceHost) {
        return sourceHost != null
                && prefixForHost(sourceHost.toLowerCase(Locale.ROOT)) != null;
    }

    private static String prefixForHost(String host) {
        // Kyodemo uses the ordinary ChMate board name for 5ch/2ch boards.
        if (isHostOrSubdomain(host, "5ch.net") || isHostOrSubdomain(host, "5ch.io")
                || isHostOrSubdomain(host, "2ch.net")) return "";
        // BBSPINK is grouped under p_ in Kyodemo's category menu, but its
        // actual board URLs use the unprefixed board ID (e.g. /b/pinkplus/).
        if (isHostOrSubdomain(host, "bbspink.com")) return "";
        if (isHostOrSubdomain(host, "open2ch.net")) return "o_";
        if (isHostOrSubdomain(host, "machi.to")) return "m_";
        if (isHostOrSubdomain(host, "vip2ch.com")) return "v_";
        if (isHostOrSubdomain(host, "5chan.jp")) return "i_";
        if ("jbbs.shitaraba.net".equals(host)) return "s_";
        if ("bbs.eddibb.cc".equals(host)) return "e_e_";
        if ("v1ch.cc".equals(host)) return "e_e_";
        if ("yaruozatsudan.com".equals(host)) return "e_y_";
        if ("yaruoshelter.com".equals(host) || "yarumakai.com".equals(host)) return "e_y_";
        if ("pinkdarker.com".equals(host)) return "e_n_";
        if ("bbs.punipuni.eu".equals(host)) return "e_p_";
        if ("bbs.kamemushi.com".equals(host)) return "e_k_";
        if ("bbs.jpnkn.com".equals(host)) return "e_j_";
        if ("bbs.3chan.cc".equals(host)) return "e_3_";
        if ("refugee-chan.mobi".equals(host)) return "e_h_";
        return null;
    }

    public static String idSearchUrl(String host, String board, String id, String key, String date) {
        String slug = boardSlug(host, board);
        if (slug == null || id == null || id.isEmpty()) return null;
        StringBuilder url = new StringBuilder("https://www.kyodemo.net/sdemo/b/")
                .append(slug).append("/?bs=hi&k=").append(encode(id));
        if (date != null && date.matches("[0-9]{8}")) {
            String day = date.substring(0, 4) + "-" + date.substring(4, 6)
                    + "-" + date.substring(6, 8);
            url.append("&fr=").append(day).append("&to=").append(day);
        }
        return url.toString();
    }

    public static String wacchoiSearchUrl(String host, String board, String wacchoi) {
        if (wacchoi == null) return null;
        String edgeSlip = edgeWacchoiInText(wacchoi);
        if (edgeSlip != null) {
            String slug = boardSlug(host, board);
            return slug == null ? null : "https://www.kyodemo.net/sdemo/b/" + slug
                    + "/?bs=hi&k=" + encode(edgeSlip);
        }
        String labeled = labeledWacchoiInText(wacchoi);
        String value = labeled == null ? wacchoi.trim() : labeled;
        if (!value.isEmpty() && value.length() <= 512
                && value.chars().noneMatch(Character::isISOControl)) {
            // Match the site's Shift_JIS form: the label is required to
            // distinguish a SLIP from an ID. Keep both halves of the token.
            String slug = boardSlug(host, board);
            if (slug == null) return null;
            try {
                String query = labeled != null || value.indexOf(' ') >= 0 ? value : "ﾜｯﾁｮｲ " + value;
                // Never replace unencodable characters with '?'. Keep the legacy
                // encoding for ordinary SLIPs, and preserve Unicode with UTF-8.
                String charset = java.nio.charset.Charset.forName("Shift_JIS").newEncoder().canEncode(query)
                        ? "Shift_JIS" : "UTF-8";
                return "https://www.kyodemo.net/sdemo/b/" + slug + "/?bs=hi&k="
                        + URLEncoder.encode(query, charset);
            } catch (UnsupportedEncodingException impossible) {
                throw new AssertionError(impossible);
            }
        }
        return null;
    }

    public static boolean isWacchoiToken(String query) {
        return query != null && (edgeWacchoiInText(query) != null
                || labeledWacchoiInText(query) != null
                || query.trim().equals(bareWacchoiInText(query.trim())));
    }

    /** Preserve the selected poster's carrier label, case and token verbatim. */
    public static String labeledWacchoiInText(String text) {
        if (text == null) return null;
        java.util.regex.Matcher match = java.util.regex.Pattern.compile(
                "(?:[\\uFF66-\\uFF9F\\u30A0-\\u30FF]+|ﾜｯﾁｮｲ)[^\\s()\\[\\]<>]*[ \\t]+"
                        + "[^\\s()\\[\\]<>]+").matcher(text);
        return match.find() ? match.group() : null;
    }

    /** Edge's level is part of Kyodemo's indexed name, not a replaceable SLIP label. */
    public static String edgeWacchoiInText(String text) {
        if (text == null) return null;
        java.util.regex.Matcher match = java.util.regex.Pattern.compile(
                "(?i)(?<![a-z0-9])(L[0-9]+)[ \\t]+([^\\s()\\[\\]<>]+)")
                .matcher(text);
        return match.find() ? match.group() : null;
    }

    /** A parsed token may omit its carrier label; use the same broad syntax in every menu. */
    public static String bareWacchoiInText(String text) {
        if (text == null) return null;
        java.util.regex.Matcher match = java.util.regex.Pattern.compile(
                "[^\\s()\\[\\]<>]+[-‐‑–—][^\\s()\\[\\]<>]+").matcher(text);
        while (match.find()) {
            String token = match.group();
            // URLs, date headers and explicitly labeled IDs are not SLIPs.
            if (token.contains("://") || token.startsWith("ID:") || token.startsWith("BE:")
                    || token.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}")) continue;
            return token;
        }
        return null;
    }

    /** Restores a result link for the current board to its original ChMate URL. */
    public static String sourceThreadUrl(String sourceHost, String board, String resultUrl) {
        String slug = boardSlug(sourceHost, board);
        if (slug == null || resultUrl == null) return null;
        final URI result;
        try {
            result = URI.create(resultUrl);
        } catch (IllegalArgumentException invalid) {
            return null;
        }
        if (!"https".equalsIgnoreCase(result.getScheme())
                || !"www.kyodemo.net".equalsIgnoreCase(result.getHost())) return null;
        String[] path = result.getPath().split("/");
        if (path.length < 5 || !"sdemo".equals(path[1])
                || !"r".equals(path[2]) || !slug.equals(path[3])
                || !("pinkdarker.com".equals(sourceHost.toLowerCase(Locale.ROOT))
                    ? path[4].matches("[0-9]+") : path[4].matches("[0-9]{9,}"))) return null;
        String response = "";
        if (path.length > 5 && !path[5].isEmpty()) {
            if (!path[5].matches("[0-9]+")) return null;
            response = path[5] + '/';
        }
        String host = sourceHost.toLowerCase(Locale.ROOT);
        if ("pinkdarker.com".equals(host)) {
            return "https://" + host + "/t/topic/" + path[4]
                    + (response.isEmpty() ? "" : "/" + response.substring(0, response.length() - 1));
        }
        String prefix = "jbbs.shitaraba.net".equals(host) || isHostOrSubdomain(host, "machi.to")
                ? "/bbs/read.cgi/" : "/test/read.cgi/";
        return "https://" + host + prefix + board + '/' + path[4] + '/' + response;
    }

    private static String encode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (UnsupportedEncodingException impossible) {
            throw new AssertionError(impossible);
        }
    }

    private static boolean isHostOrSubdomain(String host, String domain) {
        return host.equals(domain) || host.endsWith('.' + domain);
    }
}
