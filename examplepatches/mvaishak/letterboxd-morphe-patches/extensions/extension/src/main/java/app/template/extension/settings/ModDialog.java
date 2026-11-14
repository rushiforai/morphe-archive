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
import android.widget.CheckBox;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * A dark, rounded, accent-tinted dialog matching the rest of the mod UI — used for the restart
 * prompt and the welcome message instead of the platform {@code AlertDialog}.
 */
final class ModDialog {

    private ModDialog() {}

    static void show(Context ctx, String title, CharSequence message,
                     String positiveText, final Runnable onPositive,
                     String negativeText, final Runnable onNegative) {
        show(ctx, title, message, positiveText, onPositive, negativeText, onNegative, null);
    }

    static void show(Context ctx, String title, CharSequence message,
                     String positiveText, final Runnable onPositive,
                     String negativeText, final Runnable onNegative,
                     final Runnable onDismiss) {
        show(ctx, title, message, positiveText, onPositive, negativeText, onNegative,
                onDismiss, null, null);
    }

    static void choose(Context ctx, String title, String[] labels, String action,
                       java.util.function.Consumer<boolean[]> onConfirm) {
        boolean[] checked = new boolean[labels.length];
        java.util.Arrays.fill(checked, true);
        show(ctx, title, null, action, () -> onConfirm.accept(checked), "Cancel", null,
                null, labels, checked);
    }

    private static void show(Context ctx, String title, CharSequence message,
                             String positiveText, Runnable onPositive,
                             String negativeText, Runnable onNegative, Runnable onDismiss,
                             String[] labels, boolean[] checked) {
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

            ScrollView scroll = new ScrollView(ctx);
            if (labels == null) {
                TextView body = new TextView(ctx);
                body.setText(message);
                body.setTextColor(0xFFC7C7C7);
                body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
                body.setLineSpacing(Math.round(3 * d), 1f);
                body.setLinkTextColor(AccentPresets.readableText(accent, SurfaceColors.elevated(ctx)));
                body.setMovementMethod(android.text.method.LinkMovementMethod.getInstance());
                scroll.addView(body);
            }
            // Weighted (not WRAP_CONTENT): once the window height below is clamped to fit the
            // screen, this is what has to give. Without a weight the body just kept growing past
            // the screen edge — on a long message (the what's-new dialog) that pushed the buttons
            // row off-bottom with no way to reach them, and this dialog has no back/outside-tap
            // dismiss, so there was no way out at all.
            LinearLayout.LayoutParams slp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
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

            int onAccent = AccentPresets.readableText(0xFFFFFFFF, accent);
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

            if (labels != null) {
                LinearLayout choices = new LinearLayout(ctx);
                choices.setOrientation(LinearLayout.VERTICAL);
                int selectedColor = AccentPresets.readableText(accent, SurfaceColors.elevated(ctx));
                android.content.res.ColorStateList tint = new android.content.res.ColorStateList(
                        new int[][]{{android.R.attr.state_checked}, {}},
                        new int[]{selectedColor, 0xFF99AABB});
                for (int i = 0; i < labels.length; i++) {
                    final int index = i;
                    CheckBox choice = new CheckBox(ctx);
                    choice.setText(labels[i]);
                    int appearance = ctx.getResources().getIdentifier(
                            "TextAppearance.Letterboxd.BodyMedium", "style", ctx.getPackageName());
                    if (appearance != 0) choice.setTextAppearance(appearance);
                    else choice.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
                    choice.setTextColor(0xFFFFFFFF);
                    choice.setButtonTintList(tint);
                    choice.setCompoundDrawablePadding(Math.round(8 * d));
                    choice.setMinHeight(Math.round(48 * d));
                    choice.setChecked(checked[i]);
                    choice.setOnCheckedChangeListener((button, selected) -> {
                        checked[index] = selected;
                        boolean any = false;
                        for (boolean item : checked) any |= item;
                        pos.setEnabled(any);
                        pos.setAlpha(any ? 1f : 0.45f);
                    });
                    choices.addView(choice, new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                }
                scroll.addView(choices);
            }

            root.addView(buttons);
            dialog.setContentView(root);
            if (window != null) {
                int margin = Math.round(24 * d);
                int maxWidth = Math.round(420 * d);
                int screenW = ctx.getResources().getDisplayMetrics().widthPixels;
                int screenH = ctx.getResources().getDisplayMetrics().heightPixels;
                int width = Math.min(screenW - 2 * margin, maxWidth);
                int maxHeight = Math.round(screenH * 0.8f);
                // Measure at that cap first: title + buttons keep their natural size and the
                // (weighted) body absorbs whatever's left, so on a short message the dialog still
                // sizes to its content instead of always taking 80% of the screen.
                root.measure(
                        View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(maxHeight, View.MeasureSpec.AT_MOST));
                window.setLayout(width, Math.min(root.getMeasuredHeight(), maxHeight));
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
            dialog.setCancelable(labels != null);
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
