package app.morphe.extension.chmate;

import java.net.URI;
import java.util.Locale;
import java.util.LinkedHashMap;
import java.util.Map;

/** No network requests and no mutation until the user explicitly inserts a command. */
public final class ThreadCommandRules {
    private ThreadCommandRules() {}
    public static String profile(String url) {
        try {
            String h = new URI(url).getHost();
            if (h == null) return "custom";
            h = h.toLowerCase(Locale.ROOT);
            if (h.equals("5ch.net") || h.endsWith(".5ch.net") || h.equals("5ch.io")
                    || h.endsWith(".5ch.io") || h.equals("bbspink.com") || h.endsWith(".bbspink.com")) return "5ch";
            if (h.equals("bbs.eddibb.cc") || h.equals("d1ch.cc") || h.equals("v1ch.cc")) return "edge";
            if (h.equals("kenmo.org") || h.endsWith(".kenmo.org")) return "kenmo";
            if (h.equals("open2ch.net") || h.endsWith(".open2ch.net")) return "open2ch";
            if (h.equals("jbbs.shitaraba.net") || h.equals("jbbs.livedoor.jp")) return "shitaraba";
            if (h.equals("afternoontea.st") || h.endsWith(".afternoontea.st")) return "afternoontea";
        } catch (Exception ignored) {}
        return "custom";
    }
    public static String[] labels(String profile) {
        if (profile.equals("5ch")) return new String[]{"ワッチョイを表示", "ワッチョイ＋IPを表示（IP公開に注意）", "自由入力",
                "板標準のID・SLIP", "IDを表示・SLIPなし", "ID非表示（UPLIFT等の条件あり）",
                "回線種別のみ", "回線種別＋IP（IP公開に注意）", "詳細ID末尾（verbose）",
                "どんぐり：Lv0・常時表示・大砲可", "どんぐり：Lv0・任意表示・大砲可",
                "どんぐり：Lv0・常時表示・大砲不可", "どんぐり：Lv0・任意表示・大砲不可",
                "名前欄：どんぐりレベル・装備表示", "名前欄：どんぐりポイント", "名前欄：装備表示を隠す（UPLIFT必要）"};
        if (profile.equals("edge")) return new String[]{"ワッチョイを表示", "ワッチョイ＋レベルを表示", "レベルを表示", "自由入力"};
        if (profile.equals("kenmo")) return new String[]{"IDを表示（!id）", "IDを非表示（!noid）", "ワッチョイを表示（!slip）", "ワッチョイを非表示（!noslip）", "IPを表示（!ip・IP公開に注意）", "IPを非表示（!noip）", "スレ固有のID・ワッチョイ（!chid）", "IP由来のID（!ipid）", "IDを月内固定（!longid）", "ワッチョイを月内固定（!longslip）", "スレ主マークを表示（!nushi）", "スレ主マークを非表示（!nonushi）", "ひよこマークを表示（!piyo）", "ひよこマークを非表示（!nopiyo）", "ゆるゆりの名前を表示（!yuruyuri）", "再認証の間隔（!reauth・秒数を編集）", "最大レス数（!max・数値を編集）", "タイトル変更を禁止（!notitlechange）", "自由入力"};
        if (profile.equals("open2ch")) return new String[]{"自演防止表示（!jien）", "自由入力", "アク禁（レス番号を指定・スレ主等）", "アク禁解除（レス番号を指定・スレ主等）"};
        return new String[]{"自由入力（掲示板の仕様を確認してください）"};
    }
    public static String[] values(String profile) {
        if (profile.equals("5ch")) return new String[]{triple("!extend:checked:vvvvv:1000:512"), triple("!extend:checked:vvvvvv:1000:512"), "",
                triple("!extend:default:default:1000:512"), triple("!extend:checked:none:1000:512"), triple("!extend:none:none:1000:512"),
                triple("!extend:checked:vvv:1000:512"), triple("!extend:checked:vvvv:1000:512"), triple("!extend:checked:verbose:1000:512"),
                triple("!extend:checked:vvvvv:1000:512:donguri=0/1"), triple("!extend:checked:vvvvv:1000:512:donguri=0/2"),
                triple("!extend:checked:vvvvv:1000:512:donguri=0/3"), triple("!extend:checked:vvvvv:1000:512:donguri=0/4"),
                "!donguri", "!point", "!nosoubi"};
        if (profile.equals("edge")) return new String[]{triple("!metadent:vv:"), triple("!metadent:vvv:"), "!metadent:v:", ""};
        if (profile.equals("kenmo")) return new String[]{"!id", "!noid", "!slip", "!noslip", "!ip", "!noip", "!chid", "!ipid", "!longid", "!longslip", "!nushi", "!nonushi", "!piyo", "!nopiyo", "!yuruyuri", "!reauth:60", "!max:1000", "!notitlechange", ""};
        if (profile.equals("open2ch")) return new String[]{"!jien", "", "!aku{レス番号}", "!kaijo{レス番号}"};
        return new String[]{""};
    }
    public static boolean nameCommand(String profile, int index) { return profile.equals("5ch") && index >= 13 && index <= 15; }
    public static boolean available(String profile, int index, boolean thread) {
        if (profile.equals("open2ch")) return thread ? index < 2 : index >= 1;
        return thread || nameCommand(profile, index);
    }
    public static String boardKey(String url) {
        try {
            URI uri = new URI(url);
            if (uri.getHost() == null || uri.getUserInfo() != null || !("http".equalsIgnoreCase(uri.getScheme()) || "https".equalsIgnoreCase(uri.getScheme()))) return "";
            String path = uri.getPath();
            java.util.regex.Matcher read = java.util.regex.Pattern.compile("/(?:test/)?read\\.cgi/([^/]+)/").matcher(path);
            if (!profile(url).equals("shitaraba") && read.find()) path = "/" + read.group(1) + "/";
            else if (profile(url).equals("shitaraba")) {
                java.util.regex.Matcher sh = java.util.regex.Pattern.compile("/(?:bbs/(?:read|subject)\\.cgi/)?([a-zA-Z0-9_]+/[0-9]+)/?").matcher(path);
                if (!sh.find()) return ""; path = "/" + sh.group(1) + "/";
            } else if (profile(url).equals("afternoontea")) {
                java.util.regex.Matcher at = java.util.regex.Pattern.compile("/boards/([0-9]+)").matcher(path);
                if (!at.find()) return ""; path = "/boards/" + at.group(1) + "/";
            } else {
                java.util.regex.Matcher board = java.util.regex.Pattern.compile("^/([a-zA-Z0-9_-]+)(?:/|$)").matcher(path);
                if (!board.find()) return ""; path = "/" + board.group(1) + "/";
            }
            return uri.getHost().toLowerCase(Locale.ROOT) + (uri.getPort() == -1 ? "" : ":" + uri.getPort()) + path;
        } catch (Exception ignored) { return ""; }
    }
    public static String settingsUrl(String url) {
        String key = boardKey(url);
        return profile(url).equals("5ch") && !key.isEmpty() ? "https://" + key + "SETTING.TXT" : "";
    }
    public static Map<String, String> settings(String text) {
        Map<String, String> result = new LinkedHashMap<>();
        for (String line : text.split("\\r?\\n")) {
            int equals = line.indexOf('='); if (equals < 1) continue;
            String key = line.substring(0, equals).trim(), value = line.substring(equals + 1).trim();
            if (key.matches("BBS_(USE_VIPQ2|SLIP|FORCE_ID|ACORN|THREAD_TATESUGI|MESSAGE_COUNT|LINE_NUMBER)"))
                result.put(key, value.substring(0, Math.min(value.length(), 256)));
        }
        return result;
    }
    private static String triple(String line) { return line + "\n" + line + "\n" + line; }
    public static String normalize(String value) { return value.replace("\r\n", "\n").replace('\r', '\n').trim(); }
    public static String editValue(String initial, String saved) {
        // Upgrade the old, unedited one-line default without overwriting custom commands.
        if (saved == null || (initial.contains("\n") && normalize(saved).equals(initial.split("\n")[0]))) return initial;
        return saved;
    }
    public static boolean contains(String body, String command) {
        for (String line : body.split("\n", -1)) if (line.trim().equals(command.trim())) return true;
        return false;
    }
    public static boolean conflicts(String body, String command) {
        String[] added = normalize(command).split("\n", -1);
        String[] existing = normalize(body).split("\n", -1);
        for (int i = 0; i < added.length; i++) {
            String candidate = added[i].trim();
            String family = candidate.startsWith("!extend:") ? "!extend:" : candidate.startsWith("!metadent:") ? "!metadent:" : "";
            if (family.isEmpty()) continue;
            for (String line : existing) if (line.trim().startsWith(family) && !line.trim().equals(candidate)) return true;
            for (int j = 0; j < i; j++) if (added[j].trim().startsWith(family) && !added[j].trim().equals(candidate)) return true;
        }
        return false;
    }
    public static String insert(String body, String command) {
        return normalize(command) + "\n" + body;
    }
}
