package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.widget.LinearLayout;

/** Reuses real feature controls: no shadow preferences or bulk data changes. */
final class ExpertSettings {
    static final String KEY = "expertSettingsMode";

    static LinearLayout create(Activity activity) {
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences prefs = SettingsProfiles.prefs(activity);
        LiveSettings.Toggle mode = new LiveSettings.Toggle(activity);
        mode.setText("エキスパート設定モード");
        mode.setChecked(prefs.getBoolean(KEY, false));
        root.addView(mode);
        android.widget.TextView help = new android.widget.TextView(activity);
        help.setText("通常の各カテゴリにない追加動作だけを表示します。各カテゴリと重複する設定はここには表示しません。モード切替だけでは機能や保存済みデータを変更しません。クラッシュ防止に必要な処理は常時有効です。パッチ時に導入していない機能は追加できません。");
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
        readingPosition.setChecked(prefs.getBoolean(ReadingPosition.ENABLED,true));
        options.addView(readingPosition);
        android.widget.TextView readingHelp=new android.widget.TextView(activity);
        readingHelp.setText("ChMate標準の位置復元を補います。オフで追加の位置監視・保存を停止します。変更の反映には再起動が必要です。");
        options.addView(readingHelp);
        new LiveSettings(prefs,()->{}).toggle(readingPosition,ReadingPosition.ENABLED);
        LiveSettings.Toggle previewPosition = new LiveSettings.Toggle(activity);
        previewPosition.setText("リンクカード更新時にスクロール位置を保持");
        previewPosition.setChecked(prefs.getBoolean(XPostPreviewPosition.ENABLED, true));
        options.addView(previewPosition);
        android.widget.TextView previewHelp = new android.widget.TextView(activity);
        previewHelp.setText("X投稿やサイトカードの内容が後から表示される際、読んでいる位置を保ちます。位置がずれる・重く感じる場合はオフにして切り分けできます。変更はすぐ反映されます。");
        options.addView(previewHelp);
        new LiveSettings(prefs, () -> {}).toggle(previewPosition, XPostPreviewPosition.ENABLED,
                XPostPreviewPosition::settingsChanged);
        LiveSettings.Toggle conditionalRefresh = new LiveSettings.Toggle(activity);
        conditionalRefresh.setText("スレ更新で条件付き取得を省く");
        conditionalRefresh.setChecked(prefs.getBoolean(ThreadRefreshOptions.KEY, true));
        options.addView(conditionalRefresh);
        android.widget.TextView conditionalRefreshHelp = new android.widget.TextView(activity);
        conditionalRefreshHelp.setText("サーバーの更新日時だけで『更新なし』と判定されるのを避けるため、DATを取得します。オフにするとChMate標準の条件付き取得に戻り、通信量が少なくなる場合があります。変更はすぐ反映されます。");
        options.addView(conditionalRefreshHelp);
        new LiveSettings(prefs, () -> {}).toggle(conditionalRefresh, ThreadRefreshOptions.KEY);
        Runnable refresh = () -> options.setVisibility(mode.isChecked() ? android.view.View.VISIBLE : android.view.View.GONE);
        new LiveSettings(prefs, refresh).toggle(mode, KEY);
        refresh.run();
        return root;
    }

    private ExpertSettings() {}
}
