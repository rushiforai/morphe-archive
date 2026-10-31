package app.morphe.extension.chmate;

import java.io.IOException;
import java.net.URI;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Board-scoped, user-initiated archive search. Never crawls thread bodies. */
final class KyodemoArchive {
    static final String HOST = "www.kyodemo.net";
    static final String PATH = "/sdemo/b/e_e_liveedge/";
    private static final Pattern ARTICLE = Pattern.compile("(?is)<article\\b[^>]*>(.*?)</article>");
    private static final Pattern TITLE = Pattern.compile("(?is)<h2\\b[^>]*>(.*?)</h2>");
    private static final Pattern LINK = Pattern.compile("(?is)<a\\b[^>]*\\bhref=[\"'](/sdemo/r/e_e_liveedge/([0-9]{9,12})/)[\"']");
    private static final Pattern DATE = Pattern.compile("(?is)<small\\b[^>]*class=[\"'][^\"']*left_i[^\"']*[\"'][^>]*>(.*?)</small>");
    private static final Pattern NEXT = Pattern.compile("(?is)<a\\b[^>]*class=[\"'][^\"']*pagination-next[^\"']*[\"'][^>]*>");
    private static final Pattern SPAN = Pattern.compile("(?is)<span\\b[^>]*>(.*?)</span>");

    static boolean accepts(String url) {
        try {
            URI uri = URI.create(url);
            return "https".equalsIgnoreCase(uri.getScheme()) && HOST.equalsIgnoreCase(uri.getHost())
                    && uri.getPort() == -1 && uri.getUserInfo() == null
                    && uri.getPath().matches(Pattern.quote(PATH) + "(?:[0-9]+)?");
        } catch (RuntimeException invalid) { return false; }
    }

    static String query(String keyword, String from, String to, int page) {
        long offset = (long) (Math.max(1, page) - 1) * 50 + 1;
        return "https://" + HOST + PATH + (offset == 1 ? "" : offset)
                + "?kt=k_&k=" + encode(keyword) + "&fr=" + encode(from) + "&to=" + encode(to);
    }

    private static String encode(String value) {
        try {
            String input = value == null ? "" : value;
            if (!java.nio.charset.Charset.forName("Windows-31J").newEncoder().canEncode(input))
                throw new IllegalArgumentException("Kyodemoで検索できない文字が含まれています");
            return URLEncoder.encode(input, "Windows-31J");
        } catch (java.io.UnsupportedEncodingException impossible) { throw new AssertionError(impossible); }
    }

    static String parameter(String url, String key) {
        try {
            String raw = URI.create(url).getRawQuery();
            if (raw != null) for (String part : raw.split("&")) {
                String[] pair = part.split("=", 2);
                if (key.equals(pair[0])) return URLDecoder.decode(pair.length == 2 ? pair[1] : "", "Windows-31J");
            }
        } catch (Exception invalid) { /* An invalid saved URL has no reusable search term. */ }
        return "";
    }

    static int page(String url) {
        try {
            String tail = URI.create(url).getPath().substring(PATH.length());
            return tail.isEmpty() ? 1 : (int) Math.min(Integer.MAX_VALUE, (Long.parseLong(tail) - 1) / 50 + 1);
        } catch (RuntimeException invalid) { return 1; }
    }

    static final class Row {
        final String titleHtml, dateHtml, url, kyodemoUrl;
        Row(String title, String date, String url, String kyodemoUrl) {
            this.titleHtml = title; this.dateHtml = date; this.url = url; this.kyodemoUrl = kyodemoUrl;
        }
    }
    static final class Page {
        final List<Row> rows;
        final boolean hasNext;
        Page(List<Row> rows, boolean next) { this.rows = rows; this.hasNext = next; }
    }

    static Page parse(String html, int page) throws IOException {
        if (!html.matches("(?s).*\\bid=[\"']blist[\"'].*"))
            throw new IOException("Kyodemoの検索結果形式を確認できませんでした");
        List<Row> rows = new ArrayList<>();
        Matcher articles = ARTICLE.matcher(html);
        while (articles.find()) {
            Matcher link = LINK.matcher(articles.group(1)), title = TITLE.matcher(articles.group(1));
            if (!link.find() || !title.find()) continue;
            if (rows.size() >= 50) break;
            Matcher date = DATE.matcher(articles.group(1));
            String dateHtml = "";
            if (date.find()) {
                dateHtml = date.group(1);
                Matcher spans = SPAN.matcher(dateHtml);
                List<String> values = new ArrayList<>();
                while (spans.find()) values.add(spans.group(1));
                if (!values.isEmpty()) dateHtml = String.join(" / ", values);
            }
            rows.add(new Row(title.group(1).replaceFirst("^\\s*[0-9]+[:：]\\s*", ""),
                    dateHtml, "https://bbs.eddibb.cc/test/read.cgi/liveedge/" + link.group(2) + "/",
                    "https://www.kyodemo.net" + link.group(1)));
        }
        boolean next = false;
        Matcher navigation = NEXT.matcher(html);
        String expected = PATH + ((long) Math.max(1, page) * 50 + 1);
        while (navigation.find()) {
            Matcher href = Pattern.compile("(?is)\\bhref=[\"']([^\"']+)[\"']").matcher(navigation.group());
            if (href.find() && (href.group(1).equals(expected) || href.group(1).startsWith(expected + "?"))) next = true;
        }
        return new Page(rows, next);
    }
}
