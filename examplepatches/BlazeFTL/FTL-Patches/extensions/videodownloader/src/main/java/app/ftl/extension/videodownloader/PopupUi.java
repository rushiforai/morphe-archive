package app.ftl.extension.videodownloader;

import android.app.Activity;
import android.app.Dialog;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

final class PopupUi {
    static final int SHEET = 0xFFF4F6FB;
    static final int CARD = 0xFFFFFFFF;
    static final int INK = 0xFF1B1F2A;
    static final int MUTED = 0xFF6B7280;
    static final int LINE = 0xFFE3E7F0;
    static final int ACCENT = 0xFF1A73E8;
    static final int ACCENT_SOFT = 0xFFE8F0FE;
    static final int RED = 0xFFD93025;
    static final int RED_SOFT = 0xFFFCE8E6;
    static final int GREEN = 0xFF188038;
    static final int GREEN_SOFT = 0xFFE6F4EA;
    static final int CHIP_GRAY = 0xFFEBEEF5;

    final Activity activity;
    final float density;

    PopupUi(Activity activity) {
        this.activity = activity;
        this.density = activity.getResources().getDisplayMetrics().density;
    }

    int dp(float v) {
        return Math.round(v * density);
    }

    GradientDrawable shape(int fill, float radiusDp, int stroke) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(fill);
        d.setCornerRadius(dp(radiusDp));
        if (stroke != 0) {
            d.setStroke(Math.max(1, dp(1f)), stroke);
        }
        return d;
    }

    GradientDrawable oval(int fill, int stroke) {
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.OVAL);
        d.setColor(fill);
        if (stroke != 0) {
            d.setStroke(Math.max(1, dp(1.5f)), stroke);
        }
        return d;
    }

    RippleDrawable ripple(GradientDrawable content) {
        return new RippleDrawable(ColorStateList.valueOf(0x22000000), content, null);
    }

    TextView text(float sp, int color, boolean medium) {
        TextView t = new TextView(activity);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        t.setTextColor(color);
        t.setIncludeFontPadding(false);
        if (medium) {
            t.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        }
        return t;
    }

    ImageView iconButton(int glyph, int glyphColor, int fill, int stroke, int sizeDp, int padDp) {
        ImageView v = new ImageView(activity);
        v.setImageDrawable(new PopupGlyph(glyph, glyphColor));
        v.setScaleType(ImageView.ScaleType.FIT_XY);
        v.setBackground(ripple(oval(fill, stroke)));
        v.setPadding(dp(padDp), dp(padDp), dp(padDp), dp(padDp));
        v.setLayoutParams(new LinearLayout.LayoutParams(dp(sizeDp), dp(sizeDp)));
        return v;
    }

    LinearLayout.LayoutParams lp(int w, int h, int l, int t, int r, int b) {
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(w, h);
        p.setMargins(dp(l), dp(t), dp(r), dp(b));
        return p;
    }

    LinearLayout sheetRoot(int bottomDp) {
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        float r = 28f * density;
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(SHEET);
        bg.setCornerRadii(new float[]{r, r, r, r, 0, 0, 0, 0});
        root.setBackground(bg);
        root.setPadding(dp(16), dp(10), dp(16), dp(bottomDp));

        View grabber = new View(activity);
        grabber.setBackground(shape(0xFFD3D8E4, 2f, 0));
        LinearLayout.LayoutParams gp = new LinearLayout.LayoutParams(dp(36), dp(4));
        gp.gravity = Gravity.CENTER_HORIZONTAL;
        root.addView(grabber, gp);
        return root;
    }

    Dialog newSheet() {
        Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_Light_Dialog_NoActionBar);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        return dialog;
    }

    void present(Dialog dialog, LinearLayout root, int heightPx, boolean resize) {
        dialog.setContentView(root, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                heightPx > 0 ? ViewGroup.LayoutParams.MATCH_PARENT : ViewGroup.LayoutParams.WRAP_CONTENT));
        Window w = dialog.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            WindowManager.LayoutParams wl = new WindowManager.LayoutParams();
            wl.copyFrom(w.getAttributes());
            wl.width = ViewGroup.LayoutParams.MATCH_PARENT;
            wl.height = heightPx > 0 ? heightPx : ViewGroup.LayoutParams.WRAP_CONTENT;
            wl.gravity = Gravity.BOTTOM;
            wl.dimAmount = 0.45f;
            w.setAttributes(wl);
            w.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            if (resize) {
                w.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                        | WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);
            }
        }
        dialog.setCanceledOnTouchOutside(true);
        int offset = heightPx > 0 ? heightPx : activity.getResources().getDisplayMetrics().heightPixels / 2;
        root.setTranslationY(offset);
        dialog.show();
        root.animate().translationY(0f).setDuration(240L).setInterpolator(new DecelerateInterpolator()).start();
    }
}
