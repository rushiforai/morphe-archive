package app.morphe.extension.chmate;

import java.util.ArrayList;
import java.util.List;

/** Stable release where an option was added or its existing feature was expanded.
 * Keep these versions fixed when publishing later releases. */
final class ReleaseFeatureOptions {
    enum Option {
        SETTINGS_LINKS("1.25.0"), SITE_GROUPS("1.25.0"),
        EDGE("1.25.0"), BAKUSAI("1.25.0"), FUTABA("1.25.0"), ANIMAN("1.25.0"),
        REPORTER_SEARCH("1.25.0"), REPORTER_MENU("1.25.0"), REPORTER_BOARD("1.25.0"),
        THREAD_THUMBNAILS("1.25.0"), VIDEO_THUMBNAILS("1.25.0"), VIDEO_IMMERSIVE("1.25.0"),
        IMAGE_NG("1.25.0"), COPY_PASTE_NG("1.25.0"), REPLACE_TXT("1.25.0"),
        HISTORY_TARGETS("1.25.0"), WATCH_AFTER_POSTING("1.25.0"), DELETE_READ("1.25.0"),
        IP_WIFI("1.25.0"), IP_MOBILE("1.25.0"), IMAGE_NG_SETTINGS("1.25.0"),
        ORG("1.26.0"), LOCAL_IMAGES("1.28.0"), WACCHOI_COPY_UPPER("1.28.0"), WACCHOI_COPY_LOWER("1.28.0");

        final String version;
        Option(String version) { this.version = version; }
        String category() {
            switch(this){
                case SETTINGS_LINKS:case SITE_GROUPS:case EDGE:case ORG:case BAKUSAI:case FUTABA:case ANIMAN:return "アプリ・通信";
                case WACCHOI_COPY_UPPER:case WACCHOI_COPY_LOWER:case REPORTER_SEARCH:case REPORTER_MENU:case REPORTER_BOARD:return "表示・検索";
                case LOCAL_IMAGES:case THREAD_THUMBNAILS:case VIDEO_THUMBNAILS:case VIDEO_IMMERSIVE:return "画像・動画";
                case IMAGE_NG:case COPY_PASTE_NG:case REPLACE_TXT:case IMAGE_NG_SETTINGS:return "NG・文字列置換";
                default:return "履歴・投稿";
            }
        }
        String description() {
            switch(this){
                case LOCAL_IMAGES:return "保存画像の内容と元URLを照合して表示します。追加の検索フォルダや、改名済み画像との手動関連付けも設定できます。";
                case WACCHOI_COPY_UPPER:case WACCHOI_COPY_LOWER:return "ワッチョイ部分の長押しから、上4桁・下4桁をそれぞれコピーできます。ハイフンを含めず、大文字・小文字・記号を保持します。";
                case SETTINGS_LINKS:return "本文に書かれたHaiagaruの設定リンクから、設定を開いたり切り替えたりできます。";
                case SITE_GROUPS:return "標準の分類にない外部板を、ホストごとの項目にまとめます。反映には再起動が必要です。";
                case EDGE:case ORG:case BAKUSAI:case FUTABA:case ANIMAN:return "このサイトを使用するか切り替えます。板の追加・取得はChMateの掲示板設定から行います。OFFにしても保存済みのログは削除しません。";
                case REPORTER_SEARCH:return "記者IDやスレ名について、開始日・終了日を指定して検索できます。";
                case REPORTER_MENU:return "記者IDの表示と操作項目をレスメニューに追加します。";
                case REPORTER_BOARD:return "対応する板のスレ一覧に記者IDを表示します。";
                case THREAD_THUMBNAILS:return "スレ一覧に冒頭レスの画像を表示します。大きさ・枚数・対象の板は画像・動画の設定で変更できます。";
                case VIDEO_THUMBNAILS:return "対応する動画から静止画を作り、サムネイルとして表示します。";
                case VIDEO_IMMERSIVE:return "専用動画ビューアを横向きにしたとき、システムバーを隠して表示します。";
                case IMAGE_NG:return "登録した画像に一致するレスを、通常のあぼーんとして表示します。";
                case COPY_PASTE_NG:return "ChMateがコピペ省略と判定したレスを、透明あぼーんで非表示にします。";
                case REPLACE_TXT:return "ReplaceTxtのルールで表示する文字列を置き換えます。正規表現にも対応します。";
                case HISTORY_TARGETS:return "履歴ポップアップに監視対象のスレをまとめたタブを表示します。";
                case WATCH_AFTER_POSTING:return "書き込み後、そのスレを自動で新着監視の対象にします。通知条件は監視の設定で変更できます。";
                case DELETE_READ:return "更新ボタンの長押しから、既読スレを削除する画面を開けます。";
                case IP_WIFI:case IP_MOBILE:return "選択した通信回線でIP表示スレへ投稿する前に確認を表示します。";
                case IMAGE_NG_SETTINGS:return "画像の登録、URLからの追加、判定レベル、一致枚数を設定します。";
                default:throw new AssertionError(this);
            }
        }
    }

    static String stableVersion(String version) {
        int suffix = version.indexOf('-');
        return suffix < 0 ? version : version.substring(0, suffix);
    }

    /** Prefer the stable accordion; before publication use only the newest dev. */
    static List<Option> forRelease(ReleaseHistoryText.Release release,
                                   List<ReleaseHistoryText.Release> visible) {
        String base = stableVersion(release.version);
        ReleaseHistoryText.Release owner = null;
        for (ReleaseHistoryText.Release candidate : visible) {
            if (!stableVersion(candidate.version).equals(base)) continue;
            if (owner == null) owner = candidate;
            if (!candidate.development) { owner = candidate; break; }
        }
        List<Option> result = new ArrayList<>();
        if (owner != release) return result;
        for (Option option : Option.values()) if (option.version.equals(base)) result.add(option);
        // Existing options also belong beside the releases that changed their behavior.
        if (base.equals("1.27.1") || base.equals("1.27.2") || base.equals("1.27.3")) {
            result.add(Option.EDGE); result.add(Option.ORG);
        }
        if (base.equals("1.27.4")) result.add(Option.THREAD_THUMBNAILS);
        // The history-control correction affects every control in this screen.
        if (base.equals("1.27.5")) for(Option option:Option.values()) if(!option.version.equals("1.28.0")) result.add(option);
        return result;
    }

    private ReleaseFeatureOptions() {}
}
