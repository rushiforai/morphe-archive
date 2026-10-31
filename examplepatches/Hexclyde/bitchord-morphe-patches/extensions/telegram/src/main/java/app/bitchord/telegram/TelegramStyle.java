package app.bitchord.telegram;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.widget.*;

/** Mirrors BitChord Theme.kt and loads its existing SF Pro Display fonts. */
final class TelegramStyle {
    final Activity activity;
    final boolean dark;
    final int background, card, foreground, secondary, outline, field;
    final Typeface regular, medium, semibold, heavy;

    TelegramStyle(Activity activity) {
        this.activity = activity;
        dark = isDark(activity);
        background = dark ? Color.BLACK : Color.WHITE;
        foreground = dark ? Color.WHITE : Color.BLACK;
        card = dark ? 0xff1c1c1e : 0xfff2f2f7;
        secondary = dark ? 0xff8e8e93 : 0xff6e6e73;
        outline = dark ? 0xff2c2c2e : 0xffe5e5ea;
        field = outline;
        regular = font("regular", Typeface.NORMAL);
        medium = font("medium", Typeface.NORMAL);
        semibold = font("semibold", Typeface.BOLD);
        heavy = font("heavy", Typeface.BOLD);
    }

    static boolean isDark(Activity activity) {
        try {
            Object flow =
                    Class.forName("com.music.bitchord.data.settings.AppSettings")
                            .getField("themeMode")
                            .get(null);
            Object value =
                    Class.forName("kotlinx.coroutines.flow.StateFlow")
                            .getMethod("getValue")
                            .invoke(flow);
            if ("DARK".equals(value.toString())) return true;
            if ("LIGHT".equals(value.toString())) return false;
            return (activity.getResources().getConfiguration().uiMode
                            & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
        } catch (Exception e) {
            return true;
        }
    }

    int dp(float value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    Typeface font(String weight, int fallback) {
        try {
            int id =
                    activity.getResources()
                            .getIdentifier(
                                    "sf_pro_display_" + weight, "font", activity.getPackageName());
            if (id != 0) return activity.getResources().getFont(id);
        } catch (Exception ignored) {
        }
        return Typeface.create("sans-serif", fallback);
    }

    GradientDrawable shape(int color, int radius, boolean border) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(dp(radius));
        if (border) d.setStroke(dp(1), outline);
        return d;
    }

    TextView text(String value, int size, int color, Typeface face) {
        TextView t = new TextView(activity);
        t.setText(value);
        t.setTextSize(size);
        t.setTextColor(color);
        t.setTypeface(face);
        t.setFontFeatureSettings("kern");
        return t;
    }

    ImageButton backButton(Runnable action) {
        ImageButton b = new ImageButton(activity);
        b.setPadding(0, 0, 0, 0);
        b.setScaleType(ImageView.ScaleType.CENTER);
        b.setImageDrawable(
                new Drawable() {
                    final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

                    {
                        paint.setColor(foreground);
                        paint.setStyle(Paint.Style.STROKE);
                        paint.setStrokeWidth(2);
                        paint.setStrokeCap(Paint.Cap.ROUND);
                        paint.setStrokeJoin(Paint.Join.ROUND);
                    }

                    @Override
                    public void draw(Canvas canvas) {
                        // Draw around the drawable's geometric center; text baselines and font
                        // scaling do not apply.
                        canvas.save();
                        canvas.translate(getBounds().exactCenterX(), getBounds().exactCenterY());
                        float scale = Math.min(getBounds().width(), getBounds().height()) / 24f;
                        canvas.scale(scale, scale);
                        Path arrow = new Path();
                        arrow.moveTo(7, 0);
                        arrow.lineTo(-7, 0);
                        arrow.moveTo(0, -7);
                        arrow.lineTo(-7, 0);
                        arrow.lineTo(0, 7);
                        canvas.drawPath(arrow, paint);
                        canvas.restore();
                    }

                    @Override
                    public int getIntrinsicWidth() {
                        return dp(24);
                    }

                    @Override
                    public int getIntrinsicHeight() {
                        return dp(24);
                    }

                    @Override
                    public void setAlpha(int alpha) {
                        paint.setAlpha(alpha);
                        invalidateSelf();
                    }

                    @Override
                    public void setColorFilter(ColorFilter filter) {
                        paint.setColorFilter(filter);
                        invalidateSelf();
                    }

                    @Override
                    public int getOpacity() {
                        return PixelFormat.TRANSLUCENT;
                    }
                });
        b.setBackground(
                new RippleDrawable(
                        ColorStateList.valueOf(dark ? 0x228e8e93 : 0x22000000),
                        shape(dark ? 0xff0d0d0f : 0xfff7f7f9, 30, true),
                        null));
        b.setBackgroundTintList(null);
        b.setContentDescription("Back");
        b.setOnClickListener(v -> action.run());
        return b;
    }

    TextView button(String value, boolean primary, Runnable action) {
        TextView b = text(value, 16, primary ? background : foreground, semibold);
        b.setGravity(android.view.Gravity.CENTER);
        b.setMinHeight(dp(50));
        b.setPadding(dp(18), dp(12), dp(18), dp(12));
        b.setBackground(
                new RippleDrawable(
                        ColorStateList.valueOf(dark ? 0x228e8e93 : 0x22000000),
                        shape(primary ? foreground : field, 28, false),
                        null));
        b.setOnClickListener(v -> action.run());
        b.setClickable(true);
        b.setFocusable(true);
        b.setAccessibilityDelegate(
                new View.AccessibilityDelegate() {
                    @Override
                    public void onInitializeAccessibilityNodeInfo(
                            View host, android.view.accessibility.AccessibilityNodeInfo info) {
                        super.onInitializeAccessibilityNodeInfo(host, info);
                        info.setClassName(Button.class.getName());
                    }
                });
        return b;
    }

    void tuneDialog(android.app.AlertDialog dialog) {
        if (dialog.getWindow() != null)
            dialog.getWindow().setBackgroundDrawable(shape(card, 18, false));
        for (int which : new int[] {-1, -2}) {
            Button b = dialog.getButton(which);
            if (b != null) {
                b.setTextColor(foreground);
                b.setTypeface(semibold);
            }
        }
    }
}
