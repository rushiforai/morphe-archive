package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;

import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmoteInfoSpan;
import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmoteSupport;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** The sheet shown for a tapped third-party emote or badge. */
public final class EmoteInfoSheet {
    private EmoteInfoSheet() {}

    public static void show(Context context, EmoteInfoSpan info) {
        Text.use(context);
        Ui ui = Ui.of(context);
        LinearLayout panel = new LinearLayout(context);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setGravity(Gravity.CENTER_HORIZONTAL);
        int pad = Ui.dp(context, 20);
        panel.setPadding(pad, Ui.dp(context, 4), pad, pad);

        View preview = EmoteSupport.preview(context, info);
        panel.addView(preview, new LinearLayout.LayoutParams(Ui.dp(context, 112), Ui.dp(context, 112)));
        panel.addView(ui.text(context, info.name, 18, ui.text, true));
        panel.addView(ui.text(context, info.source, 13, ui.secondary, false));

        BackDialog[] dialog = new BackDialog[1];
        Sheet sheet = new Sheet(context, ui, panel, () -> {
            if (dialog[0].isShowing()) dialog[0].dismiss();
        });
        LinearLayout.LayoutParams button = Ui.matchWidth();
        button.topMargin = Ui.dp(context, 16);
        panel.addView(ui.button(context, label("名前をコピー", "Copy name"), true, () -> {
            copy(context, info.name);
            sheet.close();
        }), button);

        dialog[0] = new BackDialog(context, android.R.style.Theme_Translucent_NoTitleBar) {
            @Override
            void goBack() {
                sheet.close();
            }
        };
        dialog[0].requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog[0].setContentView(sheet);
        Window window = dialog[0].getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setDimAmount(0);
            window.setWindowAnimations(0);
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
            if (Build.VERSION.SDK_INT >= 30) {
                window.setDecorFitsSystemWindows(false);
                WindowManager.LayoutParams attributes = window.getAttributes();
                attributes.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
                window.setAttributes(attributes);
            }
        }
        Ui.show(dialog[0], context);
    }

    private static void copy(Context context, String name) {
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard != null) clipboard.setPrimaryClip(ClipData.newPlainText(name, name));
        Notice.show(context, label("コピーしました", "Copied"));
    }
}
