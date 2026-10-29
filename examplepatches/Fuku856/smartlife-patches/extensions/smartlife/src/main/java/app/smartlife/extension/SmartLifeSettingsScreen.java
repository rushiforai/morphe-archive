package app.smartlife.extension;

import android.app.AlertDialog;
import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Locale;

/**
 * A self-contained "SmartLife Patches" settings screen, built programmatically so it needs no
 * bundled resources. Shown from the two injected entry points (long-press the settings button in
 * the profile tab, and long-press the toolbar of the in-app Settings screen).
 */
@SuppressWarnings("unused")
public final class SmartLifeSettingsScreen {

    private SmartLifeSettingsScreen() {}

    private static boolean isJapanese() {
        return "ja".equals(Locale.getDefault().getLanguage());
    }

    private static String text(String ja, String en) {
        return isJapanese() ? ja : en;
    }

    /**
     * Attach a long-press handler to a view (the profile-tab settings button, or the Settings
     * screen toolbar) that opens the SmartLife Patches screen. Called from patched app code.
     */
    public static void attachSettingsLongPress(final View view) {
        if (view == null) return;
        try {
            view.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View v) {
                    show(v.getContext());
                    return true;
                }
            });
        } catch (Throwable ignored) {
        }
    }

    /** Entry point called from patched app code with an Activity context. */
    public static void show(Context context) {
        if (context == null) return;
        try {
            // Fallback in case the early capture did not run.
            SmartLifeSettings.init(context);

            int pad = dp(context, 20);

            ScrollView scroll = new ScrollView(context);
            LinearLayout root = new LinearLayout(context);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setPadding(pad, pad, pad, pad);
            scroll.addView(root);

            root.addView(toggleRow(context,
                    text("AIアシスタントを非表示", "Hide AI assistant"),
                    text("Hey Tuya の AI バー・AI タブ・フローティングボールを隠します。",
                            "Hide the Hey Tuya AI bar, AI tab and floating ball."),
                    SmartLifeSettings.KEY_HIDE_AI, true));

            root.addView(toggleRow(context,
                    text("ホームのおすすめを非表示", "Hide home recommendations"),
                    text("ホーム画面の「おすすめ」カードを表示しません。",
                            "Hide the \"Recommended\" cards on the home screen."),
                    SmartLifeSettings.KEY_HIDE_HOME_RECOMMENDATIONS, true));

            TextView note = new TextView(context);
            note.setText(text(
                    "変更はアプリを完全に終了して再起動すると反映されます。"
                            + "広告とテレメトリはパッチ適用時に除去済みのため、ここでは切り替えません。",
                    "Changes take effect after fully closing and restarting the app. "
                            + "Ads and telemetry are removed at patch time and are not toggled here."));
            note.setPadding(0, dp(context, 16), 0, 0);
            note.setAlpha(0.6f);
            root.addView(note);

            new AlertDialog.Builder(context)
                    .setTitle("SmartLife Patches")
                    .setView(scroll)
                    .setPositiveButton(android.R.string.ok, null)
                    .show();
        } catch (Throwable ignored) {
        }
    }

    private static View toggleRow(final Context context, String title, String summary,
                                  final String key, boolean defaultValue) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(context, 10), 0, dp(context, 10));

        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setLayoutParams(new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView t = new TextView(context);
        t.setText(title);
        t.setTextSize(16);
        texts.addView(t);

        TextView s = new TextView(context);
        s.setText(summary);
        s.setTextSize(12);
        s.setAlpha(0.6f);
        texts.addView(s);

        final Switch sw = new Switch(context);
        sw.setChecked(SmartLifeSettings.getBoolean(key, defaultValue));
        final boolean[] reverting = {false};
        sw.setOnCheckedChangeListener((button, isChecked) -> {
            if (reverting[0]) return;
            if (!SmartLifeSettings.setBoolean(key, isChecked)) {
                // Never silently drop a change: tell the user and revert the switch.
                Toast.makeText(context, text("設定を保存できませんでした",
                        "Could not save the setting"), Toast.LENGTH_SHORT).show();
                reverting[0] = true;
                button.setChecked(!isChecked);
                reverting[0] = false;
            }
        });

        row.addView(texts);
        row.addView(sw);
        return row;
    }

    private static int dp(Context context, int value) {
        float density = context.getResources().getDisplayMetrics().density;
        return (int) (value * density + 0.5f);
    }
}
