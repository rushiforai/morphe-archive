package app.template.extension.settings;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * A dark, rounded, accent-tinted dialog matching the rest of the mod UI — used for the restart
 * prompt and the welcome message instead of the platform {@code AlertDialog}.
 */
final class ModDialog {

    private ModDialog() {}

    static void show(Context ctx, String title, String message,
                     String positiveText, final Runnable onPositive,
                     String negativeText, final Runnable onNegative) {
        show(ctx, title, message, positiveText, onPositive, negativeText, onNegative, null);
    }

    static void show(Context ctx, String title, String message,
                     String positiveText, final Runnable onPositive,
                     String negativeText, final Runnable onNegative,
                     final Runnable onDismiss) {
        try {
            Prefs.load(ctx);
            final float d = ctx.getResources().getDisplayMetrics().density;
            final int accent = 0xFF000000 | AccentPresets.previewColor(ctx,
                    Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(ctx)),
                    Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));

            final Dialog dialog = new Dialog(ctx);
            Window window = dialog.getWindow();
            if (window != null) {
                GradientDrawable bg = new GradientDrawable();
                bg.setColor(SurfaceColors.elevated(ctx));
                bg.setCornerRadius(24 * d);
                window.setBackgroundDrawable(bg);
            }

            LinearLayout root = new LinearLayout(ctx);
            root.setOrientation(LinearLayout.VERTICAL);
            int pad = Math.round(24 * d);
            root.setPadding(pad, Math.round(22 * d), pad, Math.round(16 * d));

            TextView head = new TextView(ctx);
            head.setText(title);
            head.setTextColor(0xFFFFFFFF);
            head.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
            head.setTypeface(head.getTypeface(), Typeface.BOLD);
            head.setPadding(0, 0, 0, Math.round(12 * d));
            root.addView(head);

            TextView body = new TextView(ctx);
            body.setText(message);
            body.setTextColor(0xFFC7C7C7);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            body.setLineSpacing(Math.round(3 * d), 1f);
            ScrollView scroll = new ScrollView(ctx);
            scroll.addView(body);
            LinearLayout.LayoutParams slp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            slp.bottomMargin = Math.round(20 * d);
            root.addView(scroll, slp);

            LinearLayout buttons = new LinearLayout(ctx);
            buttons.setOrientation(LinearLayout.HORIZONTAL);
            buttons.setGravity(Gravity.END);

            if (negativeText != null) {
                TextView neg = pill(ctx, d, negativeText, 0x00000000, 0xFF3A3A3A, 0xFFE0E0E0);
                neg.setOnClickListener(new View.OnClickListener() {
                    @Override public void onClick(View v) {
                        dialog.dismiss();
                        if (onNegative != null) onNegative.run();
                    }
                });
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                lp.rightMargin = Math.round(8 * d);
                buttons.addView(neg, lp);
            }

            int onAccent = AccentPresets.isLight(accent) ? 0xFF141414 : 0xFFFFFFFF;
            TextView pos = pill(ctx, d, positiveText, accent, accent, onAccent);
            pos.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) {
                    dialog.dismiss();
                    if (onPositive != null) onPositive.run();
                }
            });
            LinearLayout.LayoutParams plp = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, negativeText != null ? 1f : 2f);
            buttons.addView(pos, plp);

            root.addView(buttons);
            dialog.setContentView(root);
            if (window != null) {
                int margin = Math.round(24 * d);
                int max = Math.round(420 * d);
                int screen = ctx.getResources().getDisplayMetrics().widthPixels;
                window.setLayout(Math.min(screen - 2 * margin, max),
                        ViewGroup.LayoutParams.WRAP_CONTENT);
            }
            if (onDismiss != null) {
                dialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {
                    @Override public void onDismiss(android.content.DialogInterface d) {
                        onDismiss.run();
                    }
                });
            }
            // Dismiss only via a button — no outside-touch, no back-button.
            dialog.setCanceledOnTouchOutside(false);
            dialog.setCancelable(false);
            dialog.show();
        } catch (Throwable ignored) {
        }
    }

    private static TextView pill(Context ctx, float d, String text, int fill, int stroke, int textColor) {
        TextView tv = new TextView(ctx);
        tv.setText(text);
        tv.setGravity(Gravity.CENTER);
        tv.setTextColor(textColor);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        tv.setPadding(0, Math.round(13 * d), 0, Math.round(13 * d));
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(14 * d);
        bg.setColor(fill);
        bg.setStroke(Math.round(d), stroke);
        tv.setBackground(bg);
        return tv;
    }
}
