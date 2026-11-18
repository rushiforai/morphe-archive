package io.github.sabopura.morphe.extension.twitch.ui;

import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** The About page's row for what the patch caught failing since the app started, as text for a bug report. */
final class DiagnosticsRow extends Catalog.Item {
    private static final String SUBJECT = "Sabopura Twitch diagnostics";
    private static final float REPORT_MAX_DP = 280;

    DiagnosticsRow() {
        super(label("診断", "Diagnostics"));
    }

    @Override
    View build(Catalog.Env env) {
        int places = Diagnostics.places();
        String summary = places == 0 ? label("問題は記録されていません", "No problems recorded")
                : label("動かなかった箇所が " + places + " 件あります",
                        places == 1 ? "1 place did not work" : places + " places did not work");
        return env.ui().linkRow(env.context(), title, summary, null, () -> show(env));
    }

    private static void show(Catalog.Env env) {
        Context context = env.context();
        Ui ui = env.ui();
        String text = Diagnostics.report(context);
        TextView report = ui.text(context, text, 12, ui.text, false);
        report.setTypeface(Typeface.MONOSPACE);
        report.setTextIsSelectable(true);
        int padding = Ui.dp(context, 12);
        report.setPadding(padding, padding, padding, padding);
        ScrollView block = new ScrollView(context) {
            @Override
            protected void onMeasure(int widthSpec, int heightSpec) {
                super.onMeasure(widthSpec, MeasureSpec.makeMeasureSpec(Ui.dp(context, REPORT_MAX_DP), MeasureSpec.AT_MOST));
            }
        };
        // The dialog scrolls too; this lets the report take the drag first.
        block.setNestedScrollingEnabled(true);
        block.setBackground(ui.field(context));
        block.addView(report);

        Dialog[] dialog = new Dialog[1];
        LinearLayout buttons = new LinearLayout(context);
        buttons.setGravity(Gravity.CENTER_VERTICAL);
        buttons.addView(ui.button(context, label("コピー", "Copy"), true, () -> {
            dialog[0].dismiss();
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard != null) clipboard.setPrimaryClip(ClipData.newPlainText(SUBJECT, text));
            Notice.show(context, label("診断をコピーしました", "Diagnostics copied"));
        }));
        LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        gap.leftMargin = Ui.dp(context, 10);
        buttons.addView(ui.button(context, label("共有", "Share"), false, () -> {
            dialog[0].dismiss();
            try {
                context.startActivity(Intent.createChooser(new Intent(Intent.ACTION_SEND).setType("text/plain")
                        .putExtra(Intent.EXTRA_SUBJECT, SUBJECT).putExtra(Intent.EXTRA_TEXT, text),
                        label("診断を共有", "Share diagnostics")));
            } catch (RuntimeException e) {
                Notice.show(context, label("共有できるアプリがありません", "No app to share with"));
            }
        }), gap);

        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        content.addView(block, Ui.matchWidth());
        LinearLayout.LayoutParams below = Ui.matchWidth();
        below.topMargin = Ui.dp(context, 12);
        content.addView(buttons, below);
        dialog[0] = ui.modal(context, label("診断", "Diagnostics"),
                label("アプリを起動してから、この Twitch のバージョンでパッチの一部が役目を果たせなかった箇所の一覧です。アカウントの情報は含まれません。不具合を報告するときに貼り付けてください。",
                        "Parts of the patch that could not do their job on this Twitch version since the app started. It contains no account information. Paste it into a bug report."),
                content, null, (Runnable) null, label("閉じる", "Close"));
        Ui.show(dialog[0], context);
    }
}
