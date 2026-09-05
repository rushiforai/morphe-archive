package app.template.extension.settings;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Random;

/** "Reveal animation" chooser — how the chosen cover disappears on tap, independent of it. */
final class RevealAnimationDialog extends Dialog {

    interface OnPick {
        void onPick(String value);
    }

    private static final String[] LABELS = { "Pop", "Crumble", "Confetti" };
    private static final String[] VALUES = { "default", "crumble", "confetti" };

    private final float density;
    private final int accent;

    RevealAnimationDialog(Context context, String current, int accentArgb, final OnPick onPick) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.accent = 0xFF000000 | accentArgb;
        build(current, onPick);
    }

    private void build(String current, final OnPick onPick) {
        Window window = getWindow();
        if (window != null) {
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(SurfaceColors.elevated(getContext()));
            bg.setCornerRadius(dp(20));
            window.setBackgroundDrawable(bg);
        }

        LinearLayout root = new LinearLayout(getContext());
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(20), dp(20), dp(20), dp(14));

        TextView head = new TextView(getContext());
        head.setText("Reveal animation");
        head.setTextColor(0xFFFFFFFF);
        head.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        head.setTypeface(head.getTypeface(), Typeface.BOLD);
        head.setPadding(0, 0, 0, dp(4));
        root.addView(head);

        TextView sub = new TextView(getContext());
        sub.setText("How the cover disappears when you tap it. Has no effect on \"Tap-to-show link\".");
        sub.setTextColor(0xFF9AA0A6);
        sub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        LinearLayout.LayoutParams sublp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sublp.bottomMargin = dp(10);
        sub.setLayoutParams(sublp);
        root.addView(sub);

        for (int i = 0; i < LABELS.length; i++) {
            final String value = VALUES[i];
            boolean sel = value.equals(current);

            AnimationPreview preview = new AnimationPreview(getContext(), value);
            root.addView(OptionCard.build(getContext(), density, preview, 44f, LABELS[i], sel, accent,
                    new Runnable() {
                        @Override public void run() {
                            onPick.onPick(value);
                            dismiss();
                        }
                    }));
        }

        setContentView(root);
        if (window != null) {
            window.setLayout(
                    Math.min(getContext().getResources().getDisplayMetrics().widthPixels - dp(44), dp(420)),
                    ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    private int dp(float v) {
        return Math.round(v * density);
    }

    private final class AnimationPreview extends View {
        private final String mode;
        private final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF r = new RectF();

        AnimationPreview(Context c, String mode) {
            super(c);
            this.mode = mode;
        }

        @Override protected void onDraw(Canvas canvas) {
            int w = getWidth();
            int h = getHeight();
            r.set(0, 0, w, h);

            if ("confetti".equals(mode)) {
                p.setColor(0xFF232323);
                canvas.drawRoundRect(r, dp(7), dp(7), p);
                p.setStyle(Paint.Style.FILL);
                Random g = new Random(1);
                int[] palette = { accent, 0xFFFFFFFF, 0xFF1A1A1A };
                for (int i = 0; i < 40; i++) {
                    float x = g.nextFloat() * w;
                    float y = g.nextFloat() * h;
                    float rot = g.nextFloat() * 360f;
                    float s = dp(1.6f + g.nextFloat() * 1.6f);
                    p.setColor(palette[g.nextInt(palette.length)]);
                    p.setAlpha(160 + g.nextInt(90));
                    canvas.save();
                    canvas.rotate(rot, x, y);
                    canvas.drawRect(x - s, y - s * 0.6f, x + s, y + s * 0.6f, p);
                    canvas.restore();
                }
                return;
            }

            if ("crumble".equals(mode)) {
                p.setColor(0xFF232323);
                canvas.drawRoundRect(r, dp(7), dp(7), p);
                p.setStyle(Paint.Style.STROKE);
                p.setStrokeWidth(dp(0.6f));
                p.setColor(0x33FFFFFF);
                float cell = dp(7f);
                for (float x = cell; x < w; x += cell) canvas.drawLine(x, 0, x, h, p);
                for (float y = cell; y < h; y += cell) canvas.drawLine(0, y, w, y, p);
                return;
            }

            // default — a plain half-faded panel
            p.setStyle(Paint.Style.FILL);
            p.setColor(0xFF232323);
            canvas.drawRoundRect(r, dp(7), dp(7), p);
            p.setColor(0x552F3338);
            canvas.drawRoundRect(r, dp(7), dp(7), p);
        }
    }
}
