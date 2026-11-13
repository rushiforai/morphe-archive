package app.morphe.extension.chmate;

import java.util.*;
import java.util.regex.*;

/** Parses both bundled notes and GitHub's full changelog into individual releases. */
final class ReleaseHistoryText {
    static final class Release {
        final String version, date, notes;
        final boolean development;
        Release(String version, String date, String notes) {
            this.version=version;this.date=date;this.notes=notes;
            development=version.contains("-dev.");
        }
    }
    private static final Pattern HEADER=Pattern.compile("(?m)^(?:# )?Haiagaru ([0-9]+\\.[0-9]+\\.[0-9]+(?:-[A-Za-z0-9.]+)?) \\(([^)]+)\\)\\s*$");
    static List<Release> parse(String source) {
        List<Release> result=new ArrayList<>();
        Matcher headings=HEADER.matcher(source);int start=-1;String version=null,date=null;
        while(headings.find()) {
            if(start>=0)result.add(new Release(version,date,notes(source.substring(start,headings.start()))));
            if(headings.group(1).equals("1.24.1")) { start=-1;break; }
            version=headings.group(1);date=headings.group(2);start=headings.end();
        }
        if(start>=0)result.add(new Release(version,date,notes(source.substring(start))));
        return result;
    }
    private static String notes(String source) {
        StringBuilder result=new StringBuilder();boolean excluded=false,cumulative=false;
        boolean summarized=source.contains("## 今回の変更");
        for(String raw:source.split("\\r?\\n")) {
            String line=raw.trim();
            if(summarized&&line.startsWith("## 安定版1.24.1から")){cumulative=true;continue;}
            if(cumulative){if(!line.startsWith("## "))continue;cumulative=false;}
            if(line.startsWith("## ")) {
                excluded=line.equals("## 追加ファイル")||line.equals("## 謝辞")||line.equals("## 開発継続へのご支援のお願い");
            } else if(line.startsWith("### ")&&(line.contains("Bug Fixes")||line.contains("New Features")||line.contains("Improvements")||line.contains("Updated App Support"))) excluded=false;
            if(excluded||line.equals("今回の変更内容は、以下のカテゴリ別リリース項目をご覧ください。"))continue;
            line=line.replace("🐛 Bug Fixes","修正").replace("✨ New Features","追加機能")
                .replace("🛠 Improvements & Fixes","改善・修正").replace("🔧 Improvements","改善")
                .replace("🚀 Updated App Support","対応アプリ");
            line=ReleaseNoteJapanese.line(line);
            if(line.equals("## 主な変更"))continue;
            result.append(line).append('\n');
        }
        String text=result.toString().trim();
        return text.isEmpty()?"詳細はGitHubのリリースページをご覧ください。":text;
    }
    static String addedFeatures(String source) {
        String heading="### 追加機能一覧";
        int start=source.indexOf(heading);if(start<0)return "機能の説明を取得できませんでした。GitHubから更新履歴を取得して、もう一度開いてください。";
        start+=heading.length();
        Matcher next=Pattern.compile("(?m)^#{1,3} ").matcher(source);next.region(start,source.length());
        return source.substring(start,next.find()?next.start():source.length()).trim();
    }
    /** In-app explanations are independent of deliberately short public release notes. */
    static String displayNotes(Release release) {
        String base=ReleaseFeatureOptions.stableVersion(release.version);
        if(base.equals("1.27.4"))return release.notes+"\n\n### スレ一覧の画像取得\n"
                +"- エッヂはDATの先頭を部分取得し、1レス目を読み終えた時点で受信を止めます。\n"
                +"- 5chは1レス目を指定して取得します。あにまんは1レス目、ふたばは冒頭レスと画像がない場合の次のレスまでを読み取ります。\n"
                +"- HTML形式のサイトでは必要なレスの受信・解析後に接続を閉じます。サーバー側のページ生成や受信バッファ分の通信は残ります。";
        if(base.equals("1.27.5"))return release.notes+"\n\n### 更新履歴の機能設定\n"
                +"- バージョンを開いた中の上側に機能スイッチ・設定ボタン、下側に詳しい更新内容を表示します。\n"
                +"- 機能が変更されたバージョンにも対応するスイッチを表示し、同じ設定のON/OFFを連動させます。\n"
                +"- 「追加された機能をすべて見る」を別画面に用意し、目的別の設定と説明をまとめました。\n"
                +"- 更新履歴では過去版の全差分の繰り返しを省き、その版の変更点を表示します。";
        return release.notes;
    }
    private ReleaseHistoryText(){}
}
