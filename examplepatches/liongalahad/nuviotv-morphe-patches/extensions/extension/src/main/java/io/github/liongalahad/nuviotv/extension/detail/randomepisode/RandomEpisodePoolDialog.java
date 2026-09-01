package io.github.liongalahad.nuviotv.extension.detail.randomepisode;

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

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;

/** TV choice dialog for the per-show random episode pool. */
final class RandomEpisodePoolDialog {
    private static final int DIALOG_WIDTH_DP = 440;
    private static final int BACKGROUND_CARD = Color.rgb(35, 35, 35);
    private static final int SELECTED_BACKGROUND = Color.rgb(58, 58, 58);
    private static final int TEXT_PRIMARY = Color.rgb(245, 245, 245);
    private static final int TEXT_SECONDARY = Color.rgb(184, 184, 184);
    private static final int SELECTED_CONTENT = Color.rgb(190, 190, 190);

    private RandomEpisodePoolDialog() {}

    static void show(String showKey) {
        Activity activity = MorpheSettingsUi.resumedActivity();
        if (activity == null || activity.isFinishing()) return;
        create(activity, showKey).show();
    }

    static Dialog create(Activity activity, String showKey) {
        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(activity, 24), dp(activity, 24), dp(activity, 24), dp(activity, 24));
        content.setBackground(shape(BACKGROUND_CARD, dp(activity, 16), 0, 0));
        content.setLayoutParams(new ViewGroup.LayoutParams(
                dp(activity, DIALOG_WIDTH_DP), ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView heading = text(activity, "Episodes included", 24, TEXT_PRIMARY);
        heading.setTypeface(Typeface.DEFAULT, Typeface.NORMAL);
        content.addView(heading, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        String selectedPool = RandomEpisodeSettings.episodePool(showKey);
        ModeOptionView selectedView = null;
        ModeOptionView firstView = null;
        String[] pools = {RandomEpisodeSettings.POOL_ALL, RandomEpisodeSettings.POOL_UNWATCHED};
        for (int index = 0; index < pools.length; index++) {
            String pool = pools[index];
            boolean selected = pool.equals(selectedPool);
            ModeOptionView option = new ModeOptionView(activity, showKey, pool, selected, dialog);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = dp(activity, index == 0 ? 16 : 8);
            content.addView(option, params);
            if (firstView == null) firstView = option;
            if (selected) selectedView = option;
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
        (selectedView == null ? firstView : selectedView).requestFocus();
        return dialog;
    }

    private static final class ModeOptionView extends LinearLayout {
        private final Activity activity;
        private final boolean selected;
        private final TextView title;
        private final TextView description;

        ModeOptionView(
                Activity activity, String showKey, String pool, boolean selected, Dialog dialog
        ) {
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

            boolean unwatched = RandomEpisodeSettings.POOL_UNWATCHED.equals(pool);
            LinearLayout labels = new LinearLayout(activity);
            labels.setOrientation(VERTICAL);
            title = text(activity, unwatched ? "Unwatched only" : "All", 18,
                    selected ? SELECTED_CONTENT : TEXT_PRIMARY);
            description = text(activity,
                    unwatched
                            ? "Exclude completed episodes; partially watched episodes remain available."
                            : "Include every aired regular episode.",
                    14, selected ? SELECTED_CONTENT : TEXT_SECONDARY);
            description.setPadding(0, dp(activity, 2), 0, 0);
            labels.addView(title, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            labels.addView(description, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            addView(labels, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            if (selected) {
                View check = new CheckView(activity);
                LinearLayout.LayoutParams checkParams = new LinearLayout.LayoutParams(
                        dp(activity, 24), dp(activity, 24));
                checkParams.leftMargin = dp(activity, 16);
                addView(check, checkParams);
            }

            setOnClickListener(view -> {
                RandomEpisodeSettings.selectEpisodePoolAndEnable(showKey, pool);
                RandomEpisodeRuntime.onEpisodePoolChanged(showKey);
                RandomEpisodeRefreshState.invalidate();
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
            title.setTextColor(focused ? TEXT_PRIMARY : (selected ? SELECTED_CONTENT : TEXT_PRIMARY));
            description.setTextColor(
                    focused ? TEXT_SECONDARY : (selected ? SELECTED_CONTENT : TEXT_SECONDARY));
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

        @Override protected void onDraw(Canvas canvas) {
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
