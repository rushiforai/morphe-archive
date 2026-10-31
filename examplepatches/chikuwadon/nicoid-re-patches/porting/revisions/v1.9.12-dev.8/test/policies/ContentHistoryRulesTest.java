package e.e.a;

import java.util.Arrays;
import java.util.HashSet;

public final class ContentHistoryRulesTest {
    private static void check(boolean value, String name) { if (!value) throw new AssertionError(name); }
    public static void main(String[] args) {
        String[] words = ContentFilterRules.keywords(" ＡＢＣ,実況，例\nABC、  \r\n.*");
        check(words.length == 4, "blank and duplicate keywords ignored");
        check(ContentFilterRules.blocked("新しいabc動画", words), "case and fullwidth matching");
        check(ContentFilterRules.blocked("実況プレイ", words), "Japanese substring matching");
        check(!ContentFilterRules.blocked("別の動画", words), "unmatched video retained");
        check(!ContentFilterRules.blocked("動画", ContentFilterRules.keywords(".*")), "keywords are literal, not regex");
        check(!ContentFilterRules.blocked(null, words), "missing title safe");
        check(!ContentFilterRules.blocked("何でも", ContentFilterRules.keywords(" ,\n ")), "empty filter disables hiding");
        String[] channels = ContentFilterRules.keywords("ＮＨＫ,Example Channel\n公式チャンネル");
        check(ContentFilterRules.blocked("NHK公式", channels), "channel name width normalization");
        check(ContentFilterRules.blocked("example channel", channels), "channel name case normalization");
        check(ContentFilterRules.blocked("アニメ公式チャンネル", channels), "channel name substring matching");
        check(!ContentFilterRules.blocked("別の投稿者", channels), "other uploader retained");
        check(!ContentFilterRules.blocked(null, channels), "missing legacy owner retained");
        for (String id : new String[]{"sm123", "nm345", "so678", "ss901", "12345"}) {
            check(HistoryRules.same("https://www.nicovideo.jp/watch/" + id, id), "watch URL deletion: " + id);
            check(HistoryRules.same("http://www.nicovideo.jp/shorts/" + id + "?from=history#test", id), "short URL and query deletion: " + id);
        }
        check(!HistoryRules.same("https://www.nicovideo.jp/watch/sm123", "sm1234"), "no prefix collisions");
        check(!HistoryRules.same(null, "sm123"), "null safe");
        HashSet<String> selected = new HashSet<>(Arrays.asList("https://www.nicovideo.jp/watch/sm123", "http://www.nicovideo.jp/watch/so456"));
        check(HistoryRules.contains(selected, "sm123"), "bulk bare ID deletion");
        check(HistoryRules.contains(selected, "so456"), "bulk multiple deletion");
        check(!HistoryRules.contains(selected, "sm789"), "unselected history retained");
        for (String[] pair : new String[][]{
                {"2026年10月05日 08時45分 視聴 0回視聴", "<b>%s</b> 視聴 <font color='red'>%s回視聴</font>"},
                {"2026-10-05 08:45 viewed 0 views", "<b>%s</b> viewed <font color='red'>%s views</font>"},
                {"2026-10-05 08:45 觀看 0次觀看", "<b>%s</b> 觀看 <font color='red'>%s次觀看</font>"}}) {
            String result = HistoryRules.accountViewedAt(pair[0], pair[1]);
            check(result.endsWith("45分") || result.endsWith("08:45"), "account timestamp kept without fabricated count");
        }
        check("date".equals(HistoryRules.accountViewedAt("date", "%s")), "unknown format preserved");
        System.out.println("Content filter and history deletion checks passed");
    }
}
