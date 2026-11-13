package app.morphe.extension.chmate;

import java.text.Normalizer;
import java.util.*;
import java.util.regex.*;

/** Search-only aliases. Display labels and stored preference keys are never rewritten. */
public final class SettingsSearchTerms {
    private static final String[][] GROUPS = {
        {"cookie", "cookies", "クッキー", "クッキ"},
        {"ua", "user agent", "user-agent", "useragent", "ユーザーエージェント", "ユーザエージェント"},
        {"thumbnail", "thumbnails", "サムネイル", "サムネール", "サムネ"},
        {"cache", "キャッシュ"}, {"backup", "バックアップ"},
        {"restore", "リストア", "復元"}, {"search", "サーチ", "検索"},
        {"wacchoi", "ワッチョイ", "ﾜｯﾁｮｲ"}, {"image", "images", "イメージ", "画像"},
        {"video", "videos", "ビデオ", "動画"}, {"gif", "ジフ", "ギフ"},
        {"download", "ダウンロード"}, {"upload", "アップロード"},
        {"browser", "ブラウザー", "ブラウザ"}, {"server", "サーバー", "サーバ"},
        {"folder", "フォルダー", "フォルダ"}, {"viewer", "ビューアー", "ビューア", "ビュワー", "ビューワー"},
        {"toolbar", "ツールバー"}, {"filter", "フィルター", "フィルタ"},
        {"history", "ヒストリー", "履歴"}, {"gesture", "ジェスチャー", "ジェスチャ"},
        {"popup", "ポップアップ"}, {"clipboard", "クリップボード"},
        {"notification", "notifications", "通知"}, {"regex", "regexp", "正規表現"},
        {"font", "フォント"}, {"theme", "テーマ"}, {"password", "パスワード"},
        {"session", "セッション"}, {"login", "ログイン", "サインイン"},
        {"sync", "synchronize", "同期"}, {"wifi", "wi-fi", "wi fi", "ワイファイ"},
        {"edge", "エッヂ", "エッジ"}, {"twitter", "ツイッター"},
        {"orgboard", "オルグ板", "オルグ", "けんも板", "kenmo.org", "kenmo", "00c.org"},
        {"menu", "メニュー"}, {"tab", "tabs", "タブ"}, {"scroll", "スクロール"},
        {"account", "アカウント"}, {"id", "アイディー", "アイディ"},
        {"on", "オン"}, {"off", "オフ"}
    };
    private static final Map<String,String> ALIASES = new HashMap<>();
    private static final Pattern WORDS;
    private static final Pattern HIT=Pattern.compile(""), MISS=Pattern.compile("(?!)");
    static {
        for (String[] group : GROUPS) for (String alias : group) ALIASES.put(fold(alias), group[0]);
        List<String> aliases = new ArrayList<>(ALIASES.keySet());
        aliases.sort(Comparator.comparingInt(String::length).reversed().thenComparing(Comparator.naturalOrder()));
        StringJoiner alternatives = new StringJoiner("|");
        for (String alias : aliases) {
            // English words must not change substrings such as "on" in "connection".
            String literal = Pattern.quote(alias);
            alternatives.add(alias.matches("[a-z -]+") ? "(?<![a-z])" + literal + "(?![a-z])" : literal);
        }
        WORDS = Pattern.compile(alternatives.toString());
    }
    private static String fold(String value) {
        String text = Normalizer.normalize(value == null ? "" : value, Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);
        StringBuilder result = new StringBuilder(text.length());
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            result.append(c >= '\u30a1' && c <= '\u30f6' ? (char)(c - 0x60) : c);
        }
        return result.toString().trim().replaceAll("\\s+", " ");
    }
    static String normalize(String value) {
        Matcher matcher = WORDS.matcher(fold(value));
        StringBuffer result = new StringBuffer();
        while (matcher.find()) matcher.appendReplacement(result, Matcher.quoteReplacement(ALIASES.get(matcher.group())));
        matcher.appendTail(result);
        return result.toString();
    }
    static boolean matches(String labels, String query) {
        // Preserve partial searches in the original label as well as aliases.
        String original=fold(labels), literal=fold(query);boolean direct=true;
        for(String word:literal.split("\\s+"))if(!original.contains(word)){direct=false;break;}
        if(direct)return true;
        String text = normalize(labels), terms = normalize(query);
        if (terms.isEmpty()) return true;
        for (String word : terms.split("\\s+")) if (!text.contains(word)) return false;
        return true;
    }
    /** Only expand literal native preference queries; multiple words must all be present. */
    public static Matcher reset(Matcher original, CharSequence text) {
        String source = original.pattern().pattern();
        if (!source.startsWith("\\Q") || !source.endsWith("\\E")) return original.reset(text);
        String query = source.substring(2, source.length() - 2).replace("\\E\\\\E\\Q", "\\E");
        if (!Pattern.quote(query).equals(source)) return original.reset(text);
        return (matches(text == null ? "" : text.toString(),query)?HIT:MISS).matcher("");
    }
    private SettingsSearchTerms() {}
}
