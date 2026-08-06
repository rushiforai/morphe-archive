package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.TextView;

/** View implementation matching Nuvio's RenderTypeSettingsItem choice dialog. */
final class MorpheSdhModeDialog {
    private static final int DIALOG_WIDTH_DP = 440;
    private static final int BACKGROUND_CARD = Color.rgb(35, 35, 35);
    private static final int SELECTED_BACKGROUND = Color.rgb(58, 58, 58);
    private static final int TEXT_PRIMARY = Color.rgb(245, 245, 245);
    private static final int TEXT_SECONDARY = Color.rgb(184, 184, 184);
    private static final int SELECTED_CONTENT = Color.rgb(190, 190, 190);

    private MorpheSdhModeDialog() {}

    static void show(Activity activity) {
        Dialog dialog = create(activity);
        dialog.show();
    }

    static Dialog create(Activity activity) {
        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(activity, 24), dp(activity, 24), dp(activity, 24), dp(activity, 24));
        content.setBackground(shape(BACKGROUND_CARD, dp(activity, 16), 0, 0));
        content.setLayoutParams(new ViewGroup.LayoutParams(
                dp(activity, DIALOG_WIDTH_DP), ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView heading = text(activity, MorpheSettingsRuntime.sdhDialogTitle(), 24, TEXT_PRIMARY);
        heading.setTypeface(Typeface.DEFAULT, Typeface.NORMAL);
        content.addView(heading, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        int selected = MorpheSettingsRuntime.sdhCleanupModeOrdinal();
        ModeOptionView first = null;
        for (int mode = MorpheSettingsRuntime.SDH_MODE_OFF;
             mode <= MorpheSettingsRuntime.SDH_MODE_REMOVE_LYRICS; mode++) {
            ModeOptionView option = new ModeOptionView(activity, mode, mode == selected, dialog);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            params.topMargin = dp(activity, mode == MorpheSettingsRuntime.SDH_MODE_OFF ? 16 : 8);
            content.addView(option, params);
            if (first == null) first = option;
        }

        dialog.setContentView(content);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.width = dp(activity, DIALOG_WIDTH_DP);
            attributes.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            attributes.gravity = Gravity.CENTER;
            attributes.dimAmount = 0.78f;
            window.setAttributes(attributes);
        }
        if (first != null) first.requestFocus();
        return dialog;
    }

    private static final class ModeOptionView extends LinearLayout {
        private final Activity activity;
        private final boolean selected;
        private final TextView title;
        private final TextView description;

        ModeOptionView(Activity activity, int mode, boolean selected, Dialog dialog) {
            super(activity);
            this.activity = activity;
            this.selected = selected;
            setOrientation(HORIZONTAL);
            setGravity(Gravity.CENTER_VERTICAL);
            setPadding(dp(activity, 14), dp(activity, 10), dp(activity, 14), dp(activity, 10));
            setFocusable(true);
            setFocusableInTouchMode(true);
            setClickable(true);
            setSoundEffectsEnabled(true);

            LinearLayout labels = new LinearLayout(activity);
            labels.setOrientation(VERTICAL);
            title = text(activity, MorpheSettingsRuntime.sdhModeTitle(mode), 18,
                    selected ? SELECTED_CONTENT : TEXT_PRIMARY);
            description = text(activity, MorpheSettingsRuntime.sdhModeDescription(mode), 14,
                    selected ? SELECTED_CONTENT : TEXT_SECONDARY);
            description.setPadding(0, dp(activity, 2), 0, 0);
            labels.addView(title, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            labels.addView(description, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            if (selected) {
                View check = new CheckView(activity);
                LinearLayout.LayoutParams checkParams = new LinearLayout.LayoutParams(
                        dp(activity, 24), dp(activity, 24));
                checkParams.leftMargin = dp(activity, 16);
                addView(check, checkParams);
            }

            setOnClickListener(view -> {
                MorpheSettingsRuntime.setSdhCleanupMode(mode);
                MorpheComposeModeAction.refreshSettingsPane();
                dialog.dismiss();
            });
            updateBackground(false);
        }

        @Override
        protected void onFocusChanged(boolean gainFocus, int direction, android.graphics.Rect oldRect) {
            super.onFocusChanged(gainFocus, direction, oldRect);
            updateBackground(gainFocus);
        }

        private void updateBackground(boolean focused) {
            int fill = selected ? SELECTED_BACKGROUND : BACKGROUND_CARD;
            int stroke = focused ? TEXT_PRIMARY : (selected ? SELECTED_CONTENT : Color.TRANSPARENT);
            setBackground(shape(fill, dp(activity, 14), dp(activity, focused || selected ? 2 : 0), stroke));
            int primary = focused ? TEXT_PRIMARY : (selected ? SELECTED_CONTENT : TEXT_PRIMARY);
            int secondary = focused ? TEXT_SECONDARY : (selected ? SELECTED_CONTENT : TEXT_SECONDARY);
            title.setTextColor(primary);
            description.setTextColor(secondary);
        }
    }

    private static final class CheckView extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        CheckView(Activity activity) {
            super(activity);
            paint.setColor(SELECTED_CONTENT);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(dp(activity, 2));
            paint.setStrokeCap(Paint.Cap.SQUARE);
            paint.setStrokeJoin(Paint.Join.MITER);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float unit = getWidth() / 24f;
            android.graphics.Path path = new android.graphics.Path();
            path.moveTo(4f * unit, 12f * unit);
            path.lineTo(9f * unit, 17f * unit);
            path.lineTo(20f * unit, 6f * unit);
            canvas.drawPath(path, paint);
        }
    }

    private static TextView text(Activity activity, String value, float sp, int color) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextSize(sp);
        view.setTextColor(color);
        view.setGravity(Gravity.START);
        view.setIncludeFontPadding(false);
        return view;
    }

    private static GradientDrawable shape(int fill, float radius, int strokeWidth, int strokeColor) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(fill);
        drawable.setCornerRadius(radius);
        if (strokeWidth > 0) drawable.setStroke(strokeWidth, strokeColor);
        return drawable;
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }
}
