package dev.rikunode.settings;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Switch;

/** In-app controls; only enabled Morphe patches actually consume these preferences. */
public final class HoshioriSettingsActivity extends Activity {
    public static final String STORE = "hoshiori_settings";
    private LinearLayout content;
    private SharedPreferences settings;

    public static boolean enabled(Context context, String key, boolean fallback) {
        return context.getSharedPreferences(STORE, Context.MODE_PRIVATE).getBoolean(key, fallback);
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        settings = getSharedPreferences(STORE, MODE_PRIVATE);
        ScrollView scroll = new ScrollView(this);
        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(18), dp(14), dp(18), dp(24));
        scroll.addView(content);
        setContentView(scroll);
        setTitle("Hoshiori");
        header("Hoshiori");
        description("Morphe Managerで組み込んだパッチの動作を、アプリ内で切り替えます。組み込まれていない機能は有効になりません。");
        group("記事一覧");
        toggle("PR記事を非表示", "hideNativePrEntries", true);
        toggle("ランキングのお知らせを非表示", "hideWeeklyRanking", true);
        toggle("PR記事専用タブを表示", "showPrTab", false);
        description("読み込んだ記事一覧のPR記事だけを集約します。有効中は通常タブからPR記事を除外します。");
        group("記事の閲覧");
        toggle("記事内広告をブロック", "blockInAppBrowserAds", true);
        toggle("広告フィルターを自動更新", "updateAdBlockLists", true);
        toggle("Cookie・Webストレージを保持", "preserveArticleWebStorage", true);
        description("Cookie保持をOFFにすると、次の該当イベントから元の消去処理を使用します。変更後の既存データは即時削除されません。");
        toggle("コメント詳細から記事を開く", "openArticleFromBookmarkCard", true);
        group("表示のカスタマイズ");
        TextView drawer = row("ドロワーの項目と並び順");
        drawer.setOnClickListener(v -> openDrawerSettings());
        group("アプリ情報");
        description(getPackageName().endsWith(".morphe") ? "インストール形態：クローン" : "インストール形態：通常パッケージ");
        description("クローン化はインストール時に決まるため、アプリ内では切り替えできません。");
    }

    private void openDrawerSettings() {
        startActivity(new Intent(this, HoshioriDrawerSettingsActivity.class));
    }

    private void toggle(String label, String key, boolean defaultValue) {
        Switch sw = new Switch(this);
        sw.setText(label);
        sw.setTextSize(15);
        sw.setPadding(dp(4), dp(12), dp(4), dp(12));
        sw.setChecked(settings.getBoolean(key, defaultValue));
        sw.setOnCheckedChangeListener((button, checked) ->
                settings.edit().putBoolean(key, checked).apply());
        content.addView(sw, new LinearLayout.LayoutParams(-1, -2));
    }

    private TextView row(String label) {
        TextView text = text(label, 15);
        text.setPadding(dp(4), dp(14), dp(4), dp(14));
        content.addView(text);
        return text;
    }

    private void group(String text) {
        TextView heading = text(text, 17);
        heading.setTextColor(Color.rgb(35, 96, 162));
        heading.setPadding(0, dp(22), 0, dp(7));
        content.addView(heading);
    }

    private void header(String label) {
        TextView heading = text(label, 23);
        heading.setPadding(0, 0, 0, dp(8));
        content.addView(heading);
    }

    private void description(String label) {
        TextView text = text(label, 13);
        text.setTextColor(Color.DKGRAY);
        text.setPadding(0, dp(5), 0, dp(7));
        content.addView(text);
    }

    private TextView text(String value, int sp) {
        TextView text = new TextView(this);
        text.setText(value);
        text.setTextSize(sp);
        return text;
    }
    private int dp(int px) {
        return (int) (getResources().getDisplayMetrics().density * px + .5f);
    }
}
