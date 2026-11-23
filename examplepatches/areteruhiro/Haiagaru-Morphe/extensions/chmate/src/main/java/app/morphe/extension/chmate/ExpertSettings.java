package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.widget.LinearLayout;

/** Reuses real feature controls: no shadow preferences or bulk data changes. */
final class ExpertSettings {
    static final String KEY = "expertSettingsMode";
    static final String MIGRATION_ONCE = "optimizePackageMigration";
    static final String HISTORY_LIMIT = "optimizeHistoryDisplayLimit";
    static final String CHAIN_ANCESTORS = "optimizeNotificationChainAncestors";

    static final String BOARD_DB = "optimizeBoardTitleDatabase";
    static final String MODEL_ACCESS = "optimizeResponseModelAccess";
    static final String NEW_DAT = "optimizeWatchNewDatRows";
    static final String BOARD_COOKIES = "optimizeBoardCookieReads";
    static final String COOKIE_AUTH_UI = "optimizeCookieAuthUi";
    static final String RUNTIME_VERSION = RuntimeVersion.OPTIMIZE;
    static final String BACKGROUND_POSTING = BackgroundPostingUi.ENABLED;

    private static void optimization(LinearLayout options, Activity activity,
            SharedPreferences prefs, String key, String label, String description) {
        LiveSettings.Toggle toggle = new LiveSettings.Toggle(activity);
        toggle.setText(label);
        toggle.setChecked(prefs.getBoolean(key, true));
        options.addView(toggle);
        android.widget.TextView help = new android.widget.TextView(activity);
        help.setText(description);
        options.addView(help);
        new LiveSettings(prefs, () -> {}).toggle(toggle, key);
    }

    static LinearLayout create(Activity activity) {
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences prefs = SettingsProfiles.prefs(activity);
        LiveSettings.Toggle mode = new LiveSettings.Toggle(activity);
        mode.setText("エキスパート設定の項目を表示");
        mode.setChecked(prefs.getBoolean(KEY, false));
        root.addView(mode);
        android.widget.TextView help = new android.widget.TextView(activity);
        help.setText("詳細な設定項目の表示を切り替えます。各機能の動作は、表示される個別スイッチで変更してください。設定値は表示を閉じても保持されます。通常の各カテゴリと重複しない追加動作を表示します。クラッシュ防止に必要な処理は常時有効です。パッチ時に導入していない機能は追加できません。");
        root.addView(help);
        LinearLayout options = new LinearLayout(activity);
        options.setOrientation(LinearLayout.VERTICAL);
        root.addView(options);
        android.widget.TextView behaviorTitle = new android.widget.TextView(activity);
        behaviorTitle.setText("追加の動作切替");
        behaviorTitle.setTypeface(behaviorTitle.getTypeface(), android.graphics.Typeface.BOLD);
        options.addView(behaviorTitle);
        LiveSettings.Toggle emoji = new LiveSettings.Toggle(activity);
        emoji.setText("端末にない絵文字の表示を補完");
        emoji.setChecked(prefs.getBoolean(EmojiFontFallback.ENABLED,true));
        options.addView(emoji);
        android.widget.TextView emojiHelp = new android.widget.TextView(activity);
        emojiHelp.setText("追加フォントとレスの表示監視で絵文字を補います。オフにするとChMate標準の表示を使います。変更の反映には再起動が必要です。");
        options.addView(emojiHelp);
        new LiveSettings(prefs,()->{}).toggle(emoji,EmojiFontFallback.ENABLED);
        LiveSettings.Toggle readingPosition = new LiveSettings.Toggle(activity);
        readingPosition.setText("スレを開き直すときの表示位置を補完");
        readingPosition.setChecked(ReadingPosition.enabled(prefs));
        options.addView(readingPosition);
        android.widget.TextView readingHelp=new android.widget.TextView(activity);
        readingHelp.setText("ChMate標準の位置復元を補います。初期状態はOFFです。WebサイトのリンクカードまたはXカード形式が有効な場合、未設定なら自動でONになります。手動で変更した設定を優先します。オフでは追加の位置監視・保存を停止します。反映には再起動が必要です。");
        options.addView(readingHelp);
        new LiveSettings(prefs,()->{}).toggle(readingPosition,ReadingPosition.ENABLED);
        LiveSettings.Toggle previewPosition = new LiveSettings.Toggle(activity);
        previewPosition.setText("リンクカード更新時にスクロール位置を保持");
        previewPosition.setChecked(prefs.getBoolean(XPostPreviewPosition.ENABLED, true));
        options.addView(previewPosition);
        android.widget.TextView previewHelp = new android.widget.TextView(activity);
        previewHelp.setText("WebリンクカードまたはX投稿カードが有効なとき、カードの読み込み後も読んでいる位置を保ちます。両方オフの間は補正を停止し、このスイッチの選択は保存します。初期値はオンで、変更はすぐ反映されます。");
        options.addView(previewHelp);
        new LiveSettings(prefs, () -> {}).toggle(previewPosition, XPostPreviewPosition.ENABLED,
                XPostPreviewPosition::settingsChanged);
        LiveSettings.Toggle delayedFilterPosition=new LiveSettings.Toggle(activity);
        delayedFilterPosition.setText("遅延位置スナップショット");
        delayedFilterPosition.setChecked(prefs.getBoolean(FilterPosition.DELAYED_SNAPSHOT,false));
        options.addView(delayedFilterPosition);
        android.widget.TextView delayedFilterPositionHelp=new android.widget.TextView(activity);
        delayedFilterPositionHelp.setText("初期OFF。フィルター変更前の全行位置スナップショットを省き、一覧更新後に位置を探します。フィルター変更後に表示位置がずれる場合はOFFのままにしてください。変更後のフィルター操作から反映されます。");
        options.addView(delayedFilterPositionHelp);
        new LiveSettings(prefs,()->{}).toggle(delayedFilterPosition,FilterPosition.DELAYED_SNAPSHOT);
        LiveSettings.Toggle conditionalRefresh = new LiveSettings.Toggle(activity);
        conditionalRefresh.setText("スレ更新で条件付き取得を省く");
        conditionalRefresh.setChecked(prefs.getBoolean(ThreadRefreshOptions.KEY, false));
        options.addView(conditionalRefresh);
        android.widget.TextView conditionalRefreshHelp = new android.widget.TextView(activity);
        conditionalRefreshHelp.setText("サーバーの更新日時だけで『更新なし』と判定されるのを避けるため、DATを取得します。オフにするとChMate標準の条件付き取得に戻り、通信量が少なくなる場合があります。変更はすぐ反映されます。");
        options.addView(conditionalRefreshHelp);
        new LiveSettings(prefs, () -> {}).toggle(conditionalRefresh, ThreadRefreshOptions.KEY);
        addOptimizations(options, activity, prefs);
        Runnable refresh = () -> options.setVisibility(mode.isChecked() ? android.view.View.VISIBLE : android.view.View.GONE);
        new LiveSettings(prefs, refresh).toggle(mode, KEY);
        refresh.run();
        return root;
    }

    static void addOptimizations(LinearLayout options, Activity activity, SharedPreferences prefs) {
        optimization(options, activity, prefs, MIGRATION_ONCE, "起動中の重複したパッケージ名移行を省く（次回起動から）",
                "アプリ起動中に設定の移行先を調べる処理を一度にまとめます。アプリを完全に終了し、次に起動したときから反映します。");
        optimization(options, activity, prefs, HISTORY_LIMIT, "履歴の表示件数取得でアプリ情報の再照会を省く",
                "履歴の表示件数を読むたびにアプリの版を調べる処理を省きます。履歴に保存される件数や削除条件は変わりません。");
        optimization(options, activity, prefs, CHAIN_ANCESTORS, "通知の連鎖NG判定を引用元のレスに絞る",
                "返信通知を作るとき、引用先をたどって必要なレスだけに連鎖NGを照合します。スレ本文のあぼーん表示とは別の処理です。");
        optimization(options, activity, prefs, BOARD_DB, "外部板名の修復でデータベース接続を再利用",
                "外部板の保存済み表示名を補正するとき、複数の板で一つのデータベース接続を共有します。");
        if (responseModelAccessSupported(activity))
            optimization(options, activity, prefs, MODEL_ACCESS, "フィルター・人気レスでスレ情報の取得経路を再利用",
                "226／242で、レスの抽出や人気レスの判定に使うスレ情報の取り出し方を再利用します。レスを追加取得した場合も最新の一覧を使います。");
        optimization(options, activity, prefs, NEW_DAT, "5ch形式の登録スレ監視で既読レスの本文解析を省く",
                "5ch形式の登録スレ監視で、新しく取得したレスを中心に本文を解析します。DATは掲示板が配信するレスのデータです。");
        optimization(options, activity, prefs, BOARD_COOKIES, "板別Cookie確認で保存データとCookieの再解析を省く",
                "読み取り済みの板別Cookieを再利用します。Cookieはサイトが認証状態などを見分ける値です。送信時は有効期限と送信先を確認します。");
        optimization(options, activity, prefs, COOKIE_AUTH_UI, "認証前のCookie確認を画面スレッドから外す",
                "板の認証画面を開く前に、アプリ内ブラウザが保存したCookieを別の処理で読みます。読み取り中も画面が応答しやすくなります。");
        optimization(options, activity, prefs, RUNTIME_VERSION, "画像切替などでアプリ版情報を再照会しない",
                "画像を切り替えるときなどに、インストール済みChMateの版番号を毎回問い合わせず、起動中に取得した値を使います。");
        android.widget.Button guide = new android.widget.Button(activity);
        guide.setText("機能の詳細と用語集");
        guide.setOnClickListener(view -> activity.startActivity(new android.content.Intent(
                android.content.Intent.ACTION_VIEW, android.net.Uri.parse(
                "https://github.com/areteruhiro/Haiagaru-Morphe/blob/dev/docs/feature-guide.md"))));
        options.addView(guide);
    }

    static void addBackgroundPosting(LinearLayout options, Activity activity, SharedPreferences prefs) {
        LiveSettings.Toggle backgroundPosting = new LiveSettings.Toggle(activity);
        backgroundPosting.setText("投稿後すぐ元の画面に戻る（実験的）");
        backgroundPosting.setChecked(prefs.getBoolean(BACKGROUND_POSTING, false));
        options.addView(backgroundPosting);
        android.widget.TextView backgroundPostingHelp = new android.widget.TextView(activity);
        backgroundPostingHelp.setText("初期設定はOFFです。この更新後の初回起動時は、以前オンにした場合も一度オフになります。送信処理は止めず、投稿画面を同じタスクの背面に残して元の画面へ戻します。送信エラーやCookie確認が発生した場合は投稿画面を再表示します。成功時はChMate標準の投稿結果通知で一覧を更新します。対応する送信Taskを確認できない場合は投稿画面を閉じません。変更はすぐ反映されます。");
        options.addView(backgroundPostingHelp);
        new LiveSettings(prefs, () -> {}).toggle(backgroundPosting, BACKGROUND_POSTING);
    }

    private static boolean responseModelAccessSupported(Activity activity) {
        try {
            String version = activity.getPackageManager()
                    .getPackageInfo(activity.getPackageName(), 0).versionName;
            // 191 reads its DataBinding adapter directly; this ViewModel reflection cache is
            // used by the 226 lazy provider and the 242 Compose response fragment.
            return "0.8.10.226 dev".equals(version) || "0.8.10.242 dev".equals(version);
        } catch (Exception ignored) {
            return false;
        }
    }

    private ExpertSettings() {}
}
