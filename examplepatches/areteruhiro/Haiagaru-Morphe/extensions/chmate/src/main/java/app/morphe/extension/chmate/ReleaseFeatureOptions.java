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
        ORG("1.26.0"), LOCAL_IMAGES("1.28.0"), WACCHOI_COPY_UPPER("1.28.0"), WACCHOI_COPY_LOWER("1.28.0"),
        GLOBAL_SEARCH_BACKGROUND("1.40.0"), GLOBAL_SEARCH_HISTORY("1.40.0"), GLOBAL_SEARCH_PARTIAL("1.40.0"),
        VIEWER_DOUBLE_BACK("1.40.0"), ALWAYS_MOSAIC_GRAY("1.40.0"), ALWAYS_MOSAIC_STRENGTH("1.40.0"),
        MODERATION_ADULT("1.40.0"), MODERATION_GORE("1.40.0"), MODERATION_LIST("1.40.0"),
        UPLOAD_DESTINATION("1.40.0"), NG_REPLY_NOTIFICATIONS("1.40.0"), KEYWORD_NAMES("1.41.0"),
        HOME_THREAD_ORDER("1.42.0"), KEYWORD_MENU("1.42.0"),
        RESPONSE_NOTES_MENU("1.43.0"), ROTATION_MENU("1.43.0"), EXTERNAL_VIDEO_CACHE("1.43.0"),
        POST_LIMIT_DISPLAY("1.46.0"), FILTER_OPTIMIZATION("1.46.0"), DELAYED_POSITION_SNAPSHOT("1.46.0"), CONDITIONAL_REFRESH("1.46.0"),
        NOTE_INDICATOR("1.46.0"), HOME_NOTES_MENU("1.46.0"), ARCHIVE_VIEWER_MODE("1.46.0"),
        NG_CHAIN_REPLY_NOTIFICATIONS("1.46.0"), FILTER_TRANSPARENT_BACKGROUND("1.46.0"),
        IMAGE_PAGING_GESTURES("1.46.0"), GIF_DEDICATED_VIEWER("1.46.0"), THREAD_SCOPED_NG("1.46.0"),
        X_POST_TRUNCATION_MODE("1.46.0"), WACCHOI_NG_EXPIRY("1.46.0"),
        WACCHOI_COPY_PARENS("1.47.0"), THREAD_REPORTER_COPY("1.47.0"), HIDDEN_NG_NEW_ARRIVAL_COUNT("1.47.0"),
        READING_POSITION_CARD_DEFAULT("1.47.0"), EXTRA_QUICK_FILTERS("1.47.0"), KYODEMO_TOOLBAR_PALETTE("1.49.0"),
        ANIMANCH_HEART("1.49.0"), CRASH_REPORTING("1.49.0"), GIGAFILE_BUTTON("1.49.0"), GIGAFILE_LINK_MODE("1.49.0"),
        FUTABA_DIRECT_POSTING("1.49.0"), FUTABA_OFFICIAL_POSTING("1.49.0"), EXPERT_PERFORMANCE("1.49.2"), BACKGROUND_POSTING_OPT_IN("1.50.4"),
        SHORT_BOARD_THREADS("1.50.0"), THREAD_TAB_GROUPS("1.52.0"), HIDE_IMAGE_BOTTOM_ACTIONS("1.52.0"), DIRECT_COPY_GESTURE("1.52.0");

        final String version;
        Option(String version) { this.version = version; }
        String category() {
            switch(this){
                case BACKGROUND_POSTING_OPT_IN:case EXPERT_PERFORMANCE:return "エキスパート設定";
                case DIRECT_COPY_GESTURE:case THREAD_TAB_GROUPS:case SHORT_BOARD_THREADS:return "表示・検索";
                case FUTABA_DIRECT_POSTING:case FUTABA_OFFICIAL_POSTING:return "履歴・投稿";
                case ANIMANCH_HEART:case CRASH_REPORTING:case SETTINGS_LINKS:case SITE_GROUPS:case EDGE:case ORG:case BAKUSAI:case FUTABA:case ANIMAN:return "アプリ・通信";
                case WACCHOI_COPY_UPPER:case WACCHOI_COPY_LOWER:case WACCHOI_COPY_PARENS:
                case THREAD_REPORTER_COPY:case REPORTER_SEARCH:case REPORTER_MENU:case REPORTER_BOARD:return "表示・検索";
                case NG_CHAIN_REPLY_NOTIFICATIONS:return "通知";
                case HIDDEN_NG_NEW_ARRIVAL_COUNT:return "スレ更新";
                case FILTER_TRANSPARENT_BACKGROUND:return "表示・検索";
                case READING_POSITION_CARD_DEFAULT:return "表示・検索";
                case EXTRA_QUICK_FILTERS:case KYODEMO_TOOLBAR_PALETTE:return "表示・検索";
                case CONDITIONAL_REFRESH:return "スレ更新";
                case X_POST_TRUNCATION_MODE:return "表示・検索";
                case WACCHOI_NG_EXPIRY:return "NG・文字列置換";
                case KEYWORD_NAMES:case GLOBAL_SEARCH_BACKGROUND:case GLOBAL_SEARCH_HISTORY:case GLOBAL_SEARCH_PARTIAL:
                case HOME_THREAD_ORDER:case KEYWORD_MENU:case HOME_NOTES_MENU:return "表示・検索";
                case VIEWER_DOUBLE_BACK:case ALWAYS_MOSAIC_GRAY:case ALWAYS_MOSAIC_STRENGTH:
                case GIGAFILE_BUTTON:case GIGAFILE_LINK_MODE:case MODERATION_ADULT:case MODERATION_GORE:case MODERATION_LIST:case UPLOAD_DESTINATION:
                case LOCAL_IMAGES:case THREAD_THUMBNAILS:case VIDEO_THUMBNAILS:case VIDEO_IMMERSIVE:
                case HIDE_IMAGE_BOTTOM_ACTIONS:case ROTATION_MENU:case EXTERNAL_VIDEO_CACHE:case NOTE_INDICATOR:case ARCHIVE_VIEWER_MODE:
                case IMAGE_PAGING_GESTURES:case GIF_DEDICATED_VIEWER:return "画像・動画";
                case IMAGE_NG:case COPY_PASTE_NG:case REPLACE_TXT:case IMAGE_NG_SETTINGS:case THREAD_SCOPED_NG:return "NG・文字列置換";
                default:return "履歴・投稿";
            }
        }
        String description() {
            switch(this){
                case DIRECT_COPY_GESTURE:return "ChMateのジェスチャー設定に「長押しコピー ON／OFF」を追加します。ツールバーと同じ本文範囲選択の設定を切り替えます。初期OFF・ジェスチャー未割り当てです。";
                case BACKGROUND_POSTING_OPT_IN:return "今回の更新後は、以前オンにした場合も一度オフになります。再びオンにできます。";
                case THREAD_TAB_GROUPS:return "タブレット表示時のスレタブメニューにグループ化ボタンを表示します。初期オン。グループ管理自体は初期オフです。";
                case FUTABA_DIRECT_POSTING:return "ふたば img／may の鉛筆ボタンから公式投稿フォームだけを開きます。初期値はオンです。";
                case FUTABA_OFFICIAL_POSTING:return "ふたば img／may の投稿に、広告を除いた公式フォームを使います。初期値はオンです。";
                case ANIMANCH_HEART:return "あにまんのレスにハートボタンを表示します。";
                case CRASH_REPORTING:return "クラッシュ・ANRログの送信への同意を管理します。";
                case LOCAL_IMAGES:return "保存画像の内容と元URLを照合して表示します。追加の検索フォルダや、改名済み画像との手動関連付けも設定できます。";
                case WACCHOI_COPY_UPPER:case WACCHOI_COPY_LOWER:return "ワッチョイ部分の長押しから、上4桁はaabb-、下4桁は-XXXXの形式でコピーできます。元の大文字・小文字・記号を保持します。";
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
                case GLOBAL_SEARCH_BACKGROUND:return "HOMEの全板検索をバックグラウンドで実行します。";
                case GLOBAL_SEARCH_HISTORY:return "取得した検索結果を保存し、HOMEから開けるようにします。";
                case GLOBAL_SEARCH_PARTIAL:return "検索中でも取得済みの途中結果を開けるようにします。";
                case VIEWER_DOUBLE_BACK:return "専用ビューアーは本体の戻る操作を連続2回行うと閉じます。";
                case ALWAYS_MOSAIC_GRAY:return "ChMateの「画像は常にモザイク」にモノクロを重ねます。";
                case ALWAYS_MOSAIC_STRENGTH:return "ChMateの「画像は常にモザイク」にHaiagaruのモザイク強度を適用します。";
                case MODERATION_ADULT:return "成人向け画像を検出してサムネイルをモザイクにします。画像検出ZIPが必要です。";
                case MODERATION_GORE:return "グロ画像を検出してサムネイルをモザイクにします。画像検出ZIPが必要です。";
                case MODERATION_LIST:return "スレ一覧の画像にも有効な自動検出を適用します。画像検出ZIPが必要です。";
                case GIGAFILE_BUTTON:return "書き込み画面のファイルアイコンと全画面メニューのアップロード項目を切り替えます。";
                case GIGAFILE_LINK_MODE:return "共有リンクをアプリ内・外部ブラウザ・直接ダウンロードで開く方法を選べます。";
                case UPLOAD_DESTINATION:return "書き込み画面から画像・動画を添付するときに、送信先を選べます。";
                case NG_REPLY_NOTIFICATIONS:return "NGに該当する返信を新着通知の対象から外します。";
                case NG_CHAIN_REPLY_NOTIFICATIONS:return "連鎖NGの対象も通知から除外します。OFFでは、NGレスにアンカーしただけの別IDの返信は通知されます。";
                case HIDDEN_NG_NEW_ARRIVAL_COUNT:return "ChMate 0.8.10.191／226／242で、スレ更新直後の「新着件数」から透明あぼーんとして判定されたレスを除きます。HOMEやスレ一覧の未読件数・既読位置は変えません。初期状態はOFFです。";
                case READING_POSITION_CARD_DEFAULT:return "WebサイトのリンクカードまたはXカード形式を有効にすると、読書位置の補助保存を未設定時だけ自動で有効にします。初期状態はOFFで、手動で変更した設定を優先します。";
                case KYODEMO_TOOLBAR_PALETTE:return "Kyodemoビューの上部ツールバーの色を変更します。初期設定は「本文の配色に合わせる」です。";
                case EXTRA_QUICK_FILTERS:return "AA・自分・返信の追加フィルターを表示するか切り替えます。初期状態はOFFです。";
                case FILTER_TRANSPARENT_BACKGROUND:return "下部フィルターパネルの背景を透明にするか、テーマ色の不透明背景を使うか切り替えます。";
                case IMAGE_PAGING_GESTURES:return "ONではHaiagaruの方向指定を使い、OFFではChMate標準の画像切り替え操作を使います。初期状態はOFFです。";
                case GIF_DEDICATED_VIEWER:return "GIFをHaiagaru専用ビューアで開くか切り替えます。初期状態はOFFです。";
                case THREAD_SCOPED_NG:return "NG ID・名前・ワードを登録時にこのスレだけへ限定できます。ﾜｯﾁｮｲ上下4桁NGはこの板だけにも限定できます。スレ削除時は対応するスレ限定NGを削除します。";
                case X_POST_TRUNCATION_MODE:return "Xの全文が取得できない場合に省略の可能性を知らせる基準を、詳細な280ポイント判定か簡易な420バイト判定から選べます。返信先の@ユーザー名は判定から除きます。";
                case WACCHOI_NG_EXPIRY:return "5chは次の日曜日、エッヂはUnix週境界（木曜日）に、ワッチョイ関連NGを自動解除する期限を登録ごとに設定できます。";
                case WACCHOI_COPY_PARENS:return "ワッチョイの全文コピー時に、IDコードを含む丸括弧を任意で取り除けます。上4桁・下4桁コピーはNG登録に使えるハイフン付き形式です。";
                case THREAD_REPORTER_COPY:return "スレタイ長押しに記者IDのコピーを追加し、記者IDのNGを一覧表示時にも適用します。";
                case KEYWORD_NAMES:return "検索条件ごとに短い表示名を付けられます。縦棒やカンマも使用できます。";
                case HOME_THREAD_ORDER:return "HOMEのお気に入りスレを並び替え・固定できます。OFFにしても保存した並び順は保持します。";
                case KEYWORD_MENU:return "HOMEの3点メニューにキーワード表示名の設定入口を表示します。";
                case RESPONSE_NOTES_MENU:return "レス長押しメニューに「メモ」を表示します。OFFにしても保存済みのメモは保持します。";
                case HIDE_IMAGE_BOTTOM_ACTIONS:return "242の画像ビューア下部にある共有・保存・回転ボタンを隠します。画像を開き直すと反映されます。初期値はオフです。";
                case ROTATION_MENU:return "画像ビューアの回転操作を画面上のボタンと︙メニューのどちらへ置くか切り替えます。";
                case EXTERNAL_VIDEO_CACHE:return "専用ビューアを使わないとき、imgpile動画を一時取得して外部プレイヤーへ渡します。";
                case POST_LIMIT_DISPLAY:return "投稿欄に板ごとのスレタイ・本文・行数・1行あたりの上限と超過位置を表示します。";
                case FILTER_OPTIMIZATION:return "レスフィルター全体の抽出・位置保持などの処理を任意で最適化します。初期状態はOFFです。";
                case EXPERT_PERFORMANCE:return "起動・スレ読込・投稿・Cookie・履歴・通知・フィルター・画像切替時の処理を個別に切り替えられます。今回追加した設定は初期ONです。";
                case SHORT_BOARD_THREADS:return "板の一覧で指定以下のレス数のスレを隠します。初期OFFで、上限の初期値は1です。";
                case DELAYED_POSITION_SNAPSHOT:return "エキスパート設定で遅延位置スナップショットを切り替えられます。初期状態はOFFです。";
                case CONDITIONAL_REFRESH:return "初期OFFではChMate標準の条件付き・Range更新を使います。更新日時だけで新着を取りこぼす場合にONにすると条件付きヘッダーを省きます。通信量が増えることがあります。";
                case NOTE_INDICATOR:return "メモ済みレスの右下にアイコンを表示します。タップしてメモを開き、編集できます。";
                case HOME_NOTES_MENU:return "HOMEの3点メニューにメモの一覧を表示します。";
                case ARCHIVE_VIEWER_MODE:return "エッヂ過去ログの専用ビューア1（従来画面）／2（元サイト表示）を選びます。";
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
        if (base.equals("1.52.0")) {
            result.add(Option.HOME_THREAD_ORDER); result.add(Option.RESPONSE_NOTES_MENU);
            result.add(Option.BACKGROUND_POSTING_OPT_IN); result.add(Option.WATCH_AFTER_POSTING);
        }
        if (base.equals("1.27.1") || base.equals("1.27.2") || base.equals("1.27.3")) {
            result.add(Option.EDGE); result.add(Option.ORG);
        }
        if (base.equals("1.27.4")) result.add(Option.THREAD_THUMBNAILS);
        // The history-control correction affects every control in this screen.
        if (base.equals("1.27.5")) for(Option option:Option.values()) if(option.version.equals("1.25.0") || option.version.equals("1.26.0")) result.add(option);
        return result;
    }

    private ReleaseFeatureOptions() {}
}
