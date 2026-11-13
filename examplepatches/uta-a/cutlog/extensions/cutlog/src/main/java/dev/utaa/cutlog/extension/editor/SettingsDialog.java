package dev.utaa.cutlog.extension.editor;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import dev.utaa.cutlog.extension.pref.Feature;
import dev.utaa.cutlog.extension.pref.Prefs;

/**
 * cutlog の機能ごとの ON/OFF（F6）。切り替えはすぐ保存し、閉じたときに撮影画面のボタンの表示を合わせ直す。
 * 当たっていないパッチの機能は出さない。
 */
final class SettingsDialog {
    private final Context context;
    private final Runnable onClosed;

    SettingsDialog(Context context, Runnable onClosed) {
        this.context = context;
        this.onClosed = onClosed;
    }

    void show() {
        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        int padding = Ui.dp(context, 22);
        content.setPadding(padding, padding, padding, Ui.dp(context, 4));

        content.addView(Ui.text(context, "cutlog の設定", 18, Ui.TEXT_PRIMARY, true));
        for (Feature feature : Feature.values()) {
            if (feature.isAvailable()) {
                content.addView(row(feature), matchWidth(Ui.dp(context, 18)));
            }
        }
        TextView note = Ui.text(context,
                "cutlog は setlog の非公式パッチです。setlog の運営とは関係ありません。",
                12, Ui.TEXT_SECONDARY, false);
        note.setLineSpacing(0, 1.2f);
        content.addView(note, matchWidth(Ui.dp(context, 22)));

        ScrollView scroll = new ScrollView(context);
        scroll.addView(content);
        AlertDialog dialog = new AlertDialog.Builder(context, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setView(scroll)
                .setPositiveButton("閉じる", null)
                .setOnDismissListener(d -> onClosed.run())
                .show();
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(Ui.rounded(context, Ui.SURFACE, 22));
        }
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(Ui.ACCENT);
    }

    /** 左に名前と説明、右にスイッチ。行のどこを押しても切り替わる。 */
    private View row(Feature feature) {
        LinearLayout row = Ui.row(context);
        row.setGravity(Gravity.CENTER_VERTICAL);

        LinearLayout labels = new LinearLayout(context);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(Ui.text(context, feature.title, 15, Ui.TEXT_PRIMARY, false));
        TextView description = Ui.text(context, feature.description, 12, Ui.TEXT_SECONDARY, false);
        description.setLineSpacing(0, 1.2f);
        LinearLayout.LayoutParams descriptionParams = matchWidth(Ui.dp(context, 6));
        labels.addView(description, descriptionParams);
        row.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Switch toggle = new Switch(context);
        toggle.setChecked(Prefs.isEnabled(context, feature));
        toggle.setThumbTintList(new ColorStateList(
                new int[][] {{android.R.attr.state_checked}, {}},
                new int[] {Color.WHITE, 0xFFB0B0B5}));
        // 端末テーマの track は半透明で描かれるため、OFF でも見えるよう明るめの灰色にする。
        toggle.setTrackTintList(new ColorStateList(
                new int[][] {{android.R.attr.state_checked}, {}},
                new int[] {Ui.ACCENT, 0xFF8E8E93}));
        toggle.setContentDescription(feature.title);
        toggle.setOnCheckedChangeListener((button, checked) -> Prefs.setEnabled(context, feature, checked));
        LinearLayout.LayoutParams toggleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        toggleParams.leftMargin = Ui.dp(context, 14);
        row.addView(toggle, toggleParams);

        row.setClickable(true);
        row.setOnClickListener(v -> toggle.toggle());
        return row;
    }

    private static LinearLayout.LayoutParams matchWidth(int topMargin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = topMargin;
        return params;
    }
}
