package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Outline;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.sabp.EppyTheme;

/** Small builders for programmatic Material 3 views. */
public final class Ui {
    private Ui() {
    }

    public static int dp(Context c, float v) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, c.getResources().getDisplayMetrics()));
    }

    public static GradientDrawable rounded(int color, float radiusPx) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(radiusPx);
        return d;
    }

    public static GradientDrawable outlined(int fill, int stroke, int strokePx, float radiusPx) {
        GradientDrawable d = rounded(fill, radiusPx);
        d.setStroke(strokePx, stroke);
        return d;
    }

    /** A ripple over a rounded background (or a borderless ripple when bg is null). */
    public static Drawable ripple(EppyTheme t, Drawable bg, float radiusPx) {
        int rippleColor = EppyTheme.withAlpha(t.onSurface, 0.12f);
        GradientDrawable mask = rounded(0xFFFFFFFF, radiusPx);
        return new RippleDrawable(ColorStateList.valueOf(rippleColor), bg, mask);
    }

    public static TextView text(Context c, EppyTheme t, String s, float sp, int weight, int color) {
        TextView tv = new TextView(c);
        tv.setText(s);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        tv.setTypeface(EppyTheme.font(c, weight));
        tv.setTextColor(color);
        tv.setIncludeFontPadding(false);
        // No line-spacing multiplier here: Android adds it below the last line too, which pushed
        // every single-line label above the centre of its icon/container (v0.3.0 misalignment).
        // Multi-line body text sets its own spacing.
        return tv;
    }

    /** Single-line label, vertically centred in its box: the building block of buttons, chips, tabs. */
    public static TextView label(Context c, EppyTheme t, String s, float sp, int weight, int color) {
        TextView tv = text(c, t, s, sp, weight, color);
        tv.setMaxLines(1);
        tv.setSingleLine(true);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        tv.setGravity(Gravity.CENTER_VERTICAL);
        return tv;
    }

    public static TextView singleLine(TextView tv) {
        tv.setMaxLines(1);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        return tv;
    }

    /** Rounded clipping for any view (cover art, cards). */
    public static void clip(View v, final float radiusPx) {
        v.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), radiusPx);
            }
        });
        v.setClipToOutline(true);
    }

    public static void circle(View v) {
        v.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setOval(0, 0, view.getWidth(), view.getHeight());
            }
        });
        v.setClipToOutline(true);
    }

    /** A 48dp touch target with a centred 24dp icon and a circular ripple. */
    public static FrameLayout iconButton(Context c, EppyTheme t, int icon, int color, int bgColor, String description, View.OnClickListener click) {
        FrameLayout f = new FrameLayout(c);
        int size = dp(c, 48);
        f.setLayoutParams(new ViewGroup.LayoutParams(size, size));
        f.setMinimumWidth(size);
        f.setMinimumHeight(size);
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.OVAL);
        bg.setColor(bgColor);
        f.setBackground(new RippleDrawable(ColorStateList.valueOf(EppyTheme.withAlpha(t.onSurface, 0.12f)), bg, null));
        ImageView iv = new ImageView(c);
        iv.setImageDrawable(new EppyIcon(icon, color));
        int is = dp(c, 24);
        f.addView(iv, new FrameLayout.LayoutParams(is, is, Gravity.CENTER));
        f.setContentDescription(description);
        f.setFocusable(true);
        f.setClickable(true);
        f.setOnClickListener(v -> {
            haptic(v, t);
            if (click != null) click.onClick(v);
        });
        return f;
    }

    /** A Material 3 chip: 40dp tall pill, optional 18dp leading icon. */
    public static LinearLayout chip(Context c, EppyTheme t, int icon, String label, boolean selected, View.OnClickListener click) {
        return chip(c, t, icon, label, selected, null, click);
    }

    /**
     * Chip with stable geometry: the icon never changes size, the selected state only changes
     * colours, and {@code reserveLabel} (e.g. "Remove bookmark") reserves the width of the longest
     * label this chip can show, so toggling it doesn't shift its neighbours.
     */
    public static LinearLayout chip(Context c, EppyTheme t, int icon, String label, boolean selected, String reserveLabel,
                                    View.OnClickListener click) {
        LinearLayout chip = new LinearLayout(c);
        chip.setOrientation(LinearLayout.HORIZONTAL);
        chip.setGravity(Gravity.CENTER);
        chip.setMinimumHeight(dp(c, 40));
        chip.setPadding(dp(c, icon != 0 ? 12 : 16), dp(c, 6), dp(c, 16), dp(c, 6));
        int fill = selected ? t.secondaryContainer : t.surfaceContainerHigh;
        int fg = selected ? t.onSecondaryContainer : t.onSurface;
        chip.setBackground(ripple(t, rounded(fill, dp(c, 20)), dp(c, 20)));
        if (icon != 0) {
            ImageView iv = new ImageView(c);
            iv.setImageDrawable(new EppyIcon(icon, fg));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(c, 18), dp(c, 18));
            lp.rightMargin = dp(c, 8);
            lp.gravity = Gravity.CENTER_VERTICAL;
            chip.addView(iv, lp);
        }
        TextView tv = label(c, t, label, 14, 500, fg);
        if (reserveLabel != null) {
            android.graphics.Paint p = new android.graphics.Paint();
            p.setTypeface(tv.getTypeface());
            p.setTextSize(tv.getTextSize());
            tv.setMinWidth((int) Math.ceil(Math.max(p.measureText(reserveLabel), p.measureText(label))));
        }
        tv.setIncludeFontPadding(false);
        tv.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams tl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tl.gravity = Gravity.CENTER_VERTICAL;
        chip.addView(tv, tl);
        chip.setClickable(true);
        chip.setFocusable(true);
        chip.setContentDescription(label + (selected ? ", on" : ""));
        chip.setOnClickListener(v -> {
            haptic(v, t);
            if (click != null) click.onClick(v);
        });
        return chip;
    }

    /** Cover art square with rounded corners and a tinted placeholder when there is no art. */
    public static ImageView cover(Context c, EppyTheme t, Bitmap bmp, float radiusDp) {
        ImageView iv = new ImageView(c);
        iv.setScaleType(ImageView.ScaleType.CENTER_CROP);
        setCover(iv, t, bmp);
        clip(iv, dp(c, radiusDp));
        return iv;
    }

    public static void setCover(ImageView iv, EppyTheme t, Bitmap bmp) {
        if (bmp != null) {
            iv.setImageBitmap(bmp);
            iv.setBackground(null);
            iv.setPadding(0, 0, 0, 0);
        } else {
            Context c = iv.getContext();
            iv.setImageDrawable(new EppyIcon(EppyIcon.HEADPHONES, EppyTheme.withAlpha(t.onPrimaryContainer, 0.6f)));
            iv.setBackground(rounded(t.primaryContainer, 0));
            int p = dp(c, 22);
            iv.setPadding(p, p, p, p);
        }
    }

    public static void haptic(View v, EppyTheme t) {
        if (t != null && t.haptics) {
            v.performHapticFeedback(HapticFeedbackConstants.CONTEXT_CLICK);
        }
    }

    public static String time(long ms) {
        long total = Math.max(0, ms / 1000);
        long h = total / 3600, m = (total % 3600) / 60, s = total % 60;
        return h > 0 ? String.format("%d:%02d:%02d", h, m, s) : String.format("%d:%02d", m, s);
    }

    /** "3 h 12 min" style, for remaining-time labels and screen readers. */
    public static String duration(long seconds) {
        long h = seconds / 3600, m = (seconds % 3600) / 60;
        if (h > 0) return h + " h " + m + " min";
        if (m > 0) return m + " min";
        return Math.max(0, seconds) + " s";
    }

    /** Filled pill button (48dp tall), shared by every screen. */
    public static TextView filledButton(Context c, EppyTheme t, String label, View.OnClickListener l) {
        TextView b = label(c, t, label, 15, 600, t.onPrimary);
        b.setGravity(Gravity.CENTER);
        b.setMinHeight(dp(c, 48));
        b.setPadding(dp(c, 24), 0, dp(c, 24), 0);
        b.setBackground(ripple(t, rounded(t.primary, dp(c, 24)), dp(c, 24)));
        b.setClickable(true);
        b.setFocusable(true);
        b.setOnClickListener(v -> {
            haptic(v, t);
            l.onClick(v);
        });
        return b;
    }

    /** Text button (48dp tall). */
    public static TextView textButton(Context c, EppyTheme t, String label, View.OnClickListener l) {
        TextView b = label(c, t, label, 15, 600, t.primary);
        b.setGravity(Gravity.CENTER);
        b.setMinHeight(dp(c, 48));
        b.setPadding(dp(c, 16), 0, dp(c, 16), 0);
        b.setBackground(ripple(t, null, dp(c, 24)));
        b.setClickable(true);
        b.setFocusable(true);
        b.setOnClickListener(l);
        return b;
    }

    public static LinearLayout.LayoutParams lp(int w, int h) {
        return new LinearLayout.LayoutParams(w, h);
    }

    public static LinearLayout.LayoutParams lp(int w, int h, float weight) {
        return new LinearLayout.LayoutParams(w, h, weight);
    }

    public static LinearLayout row(Context c) {
        LinearLayout l = new LinearLayout(c);
        l.setOrientation(LinearLayout.HORIZONTAL);
        l.setGravity(Gravity.CENTER_VERTICAL);
        return l;
    }

    public static LinearLayout column(Context c) {
        LinearLayout l = new LinearLayout(c);
        l.setOrientation(LinearLayout.VERTICAL);
        return l;
    }

    public static View space(Context c, int wDp, int hDp) {
        View v = new View(c);
        v.setLayoutParams(new LinearLayout.LayoutParams(dp(c, wDp), dp(c, hDp)));
        return v;
    }

    /** Settings row with a trailing switch; the whole row toggles. */
    public static LinearLayout switchRow(Context c, EppyTheme t, String title, String summary, boolean value,
                                         android.widget.CompoundButton.OnCheckedChangeListener l) {
        LinearLayout row = row(c);
        row.setMinimumHeight(dp(c, 64));
        row.setPadding(dp(c, 16), dp(c, 8), dp(c, 16), dp(c, 8));
        LinearLayout texts = column(c);
        texts.addView(text(c, t, title, 16, 500, t.onSurface));
        if (summary != null) {
            TextView s = text(c, t, summary, 13, 400, t.onSurfaceVariant);
            s.setPadding(0, dp(c, 4), 0, 0);
            texts.addView(s);
        }
        row.addView(texts, lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        android.widget.Switch sw = new android.widget.Switch(c);
        sw.setChecked(value);
        int[][] states = {{android.R.attr.state_checked}, {}};
        sw.setThumbTintList(new android.content.res.ColorStateList(states, new int[]{t.onPrimary, t.outline}));
        sw.setTrackTintList(new android.content.res.ColorStateList(states, new int[]{t.primary, t.surfaceContainerHighest}));
        sw.setContentDescription(title);
        sw.setOnCheckedChangeListener((b, checked) -> {
            haptic(b, t);
            if (l != null) l.onCheckedChanged(b, checked);
        });
        row.addView(sw);
        row.setOnClickListener(v -> sw.toggle());
        row.setBackground(ripple(t, null, 0));
        return row;
    }

    /** Tappable row: leading icon, title and optional summary. */
    public static LinearLayout linkRow(Context c, EppyTheme t, int icon, String title, String summary, View.OnClickListener l) {
        LinearLayout row = row(c);
        row.setMinimumHeight(dp(c, 64));
        row.setPadding(dp(c, 16), dp(c, 8), dp(c, 16), dp(c, 8));
        if (icon != 0) {
            android.widget.ImageView iv = new android.widget.ImageView(c);
            iv.setImageDrawable(new EppyIcon(icon, t.onSurfaceVariant));
            LinearLayout.LayoutParams il = new LinearLayout.LayoutParams(dp(c, 24), dp(c, 24));
            il.rightMargin = dp(c, 16);
            row.addView(iv, il);
        }
        LinearLayout texts = column(c);
        texts.addView(text(c, t, title, 16, 500, t.onSurface));
        if (summary != null) {
            TextView s = text(c, t, summary, 13, 400, t.onSurfaceVariant);
            s.setPadding(0, dp(c, 4), 0, 0);
            texts.addView(s);
        }
        row.addView(texts, lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.setClickable(true);
        row.setFocusable(true);
        row.setOnClickListener(l);
        row.setBackground(ripple(t, null, 0));
        row.setContentDescription(title + (summary != null ? ". " + summary : ""));
        return row;
    }
}
