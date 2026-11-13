package app.morphe.extension.chmate;

import java.util.Map;
import java.util.HashMap;
import java.util.Collections;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Japanese descriptions for the English commit notes in older published histories. */
final class ReleaseNoteJapanese {
    private static final Pattern COMMIT = Pattern.compile("^\\* (?:\\*\\*[^*]+:\\*\\* )?(.+?)( \\(\\[[0-9a-f]+\\]\\(https?://[^)]+\\)\\))$");
    private static final Map<String, String> SUBJECTS = subjects();

    private static Map<String, String> subjects() {
        Map<String, String> values = new HashMap<>();
        values.put("place feature controls in release history and classify native sites", "更新履歴のバージョン内に機能設定を配置し、外部板のサイト分類を修正");
        values.put("default shared NG to two reports and migrate existing settings", "共有NGの初期報告数を2に変更し、既存の設定も移行");
        values.put("repair Edge folders and rename Org boards", "エッヂのフォルダ表示を修正し、オルグ板の名称を統一");
        values.put("improve settings search and release history", "設定検索の表記揺れに対応し、更新履歴の表示を改善");
        values.put("organize update history and add kenmo boards", "更新履歴の設定を整理し、オルグ板を追加");
        values.put("bound custom toolbar icons and strip outgoing replacement glyphs", "ツールバー画像の大きさを制限し、投稿時の文字化け記号を除去");
        values.put("canonicalize backup XML and avoid broad shared NG regex matches", "バックアップXMLの形式を統一し、共有NGの正規表現による広すぎる一致を防止");
        values.put("correct external board dates and disabled providers", "外部板の日時と、無効なサイトが追加される問題を修正");
        values.put("correct watch navigation access and board thumbnail preferences", "監視対象への移動と、板ごとのサムネイル設定を修正");
        values.put("handle site posting receipts and empty Bakusai mobile pages", "外部板の投稿結果と、爆サイの空のモバイルページの扱いを修正");
        values.put("merge mobile pages and preserve source URLs and paragraphs", "モバイルページを補完し、元URLと本文の段落を保持");
        values.put("parse Bakusai board layouts and restore full Futaba titles", "爆サイの板表示形式に対応し、ふたばの省略されたスレタイトルを修正");
        values.put("parse Bakusai recruitment thread lists", "爆サイの求人形式のスレ一覧に対応");
        values.put("preserve HOME refresh position and repair board loading", "HOME更新時の表示位置を保持し、板一覧の読み込みを修正");
        values.put("preserve HTTP for active local board gateways", "動作中のローカル外部板ゲートウェイのHTTP通信を保持");
        values.put("prevent thumbnail overlap and preserve background audio", "サムネイルの重なりを防ぎ、他アプリのバックグラウンド音声を維持");
        values.put("reduce reporter memory pressure and repair image paging and archived Unicode", "記者ID履歴のメモリ使用を削減し、画像のページ移動と過去ログの特殊文字を修正");
        values.put("repair DAT sharing after package rename", "パッケージ名変更後にDAT共有でクラッシュする問題を修正");
        values.put("restore category and list thumbnail previews", "カテゴリとスレ一覧のサムネイル表示を修正");
        values.put("restore setting links and improve native search and board rendering", "設定リンクを修正し、標準検索と板表示を改善");
        values.put("suppress read-response notifications and muted playback focus", "既読レスの重複通知と、ミュート再生時の音声フォーカス取得を抑制");
        values.put("use native client identity for public Bakusai requests", "爆サイの公開ページ取得に標準クライアントの識別情報を使用");
        values.put("use native refresh history rows and restore thumbnail sliders", "対象タブの履歴表示を標準のスレ履歴に揃え、サムネイル設定バーを修正");
        values.put("prevent overlapping reviews and reuse committed feed snapshots", "共有NGの審査重複を防ぎ、確定済み配信データを再利用");
        values.put("tolerate slow GAS responses and retry receive timeouts", "共有NGサーバーの応答待機と、受信タイムアウト時の再試行を改善");
        values.put("add confirmed settings links and resilient media previews", "確認付き設定リンクを追加し、画像・動画のプレビュー取得を改善");
        values.put("add copy-paste NG and pace thumbnail requests", "コピペ省略レスの透明あぼーんと、サムネイル取得間隔の制御を追加");
        values.put("add native external boards and verify posting dialog completion", "標準の掲示板設定へ外部板を追加し、投稿確認後の画面終了を調整");
        values.put("add recent feature controls and fix history and image settings", "追加機能の設定を用意し、履歴と画像設定を修正");
        values.put("add registered image NG and refine board and reporter search", "登録画像NGを追加し、板検索と記者ID検索を改善");
        values.put("add scoped kenmo reporters and network-aware IP posting confirmation", "オルグ板の記者IDを板ごとに区別し、通信回線別のIP表示スレ投稿前確認を追加");
        values.put("display Bakusai related news in native thread lists", "爆サイの関連ニュースを標準のスレ一覧に表示");
        values.put("edit shared NG locally and guard fixed-label matches", "共有NGの条件を端末で編集可能にし、固定ラベルへの誤一致を防止");
        values.put("expand board support, reporter search, monitoring and thumbnails", "対応掲示板・記者ID検索・スレ監視・サムネイル表示を拡充");
        values.put("open and copy source site URLs and fix reported formats", "元サイトのURLを開く・コピーする操作を追加し、報告された表示形式を修正");
        values.put("show external-board creation dates and momentum", "外部板のスレ作成日時と勢いを表示");
        values.put("support regex replacements and improve media viewing", "文字列置換の正規表現に対応し、画像・動画の表示を改善");
        return Collections.unmodifiableMap(values);
    }

    static String line(String line) {
        Matcher match = COMMIT.matcher(line);
        if (!match.matches()) return line;
        String subject = match.group(1).replace(" [skip ci]", "");
        String translated = SUBJECTS.get(subject);
        return translated == null ? line : "- " + translated + match.group(2);
    }

    private ReleaseNoteJapanese() {}
}
