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
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.Random;

/** "Cover" chooser that draws a mock hidden-ratings section per option. */
final class RevealStyleDialog extends Dialog {

    interface OnPick {
        void onPick(String value);
    }

    private static final String[] LABELS = { "Frosted panel", "Tap-to-show link", "Shimmer", "Tap to burst" };
    private static final String[] VALUES = { "panel", "link", "shimmer", "burst" };

    private final float density;
    private final int accent;

    RevealStyleDialog(Context context, String current, int accentArgb, final OnPick onPick) {
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
        head.setText("Cover");
        head.setTextColor(0xFFFFFFFF);
        head.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        head.setTypeface(head.getTypeface(), Typeface.BOLD);
        head.setPadding(0, 0, 0, dp(10));
        root.addView(head);

        LinearLayout list = new LinearLayout(getContext());
        list.setOrientation(LinearLayout.VERTICAL);
        for (int i = 0; i < LABELS.length; i++) {
            final String value = VALUES[i];
            boolean sel = value.equals(current);

            RevealPreview preview = new RevealPreview(getContext(), value);
            list.addView(OptionCard.build(getContext(), density, preview, 40f, LABELS[i], sel, accent,
                    new Runnable() {
                        @Override public void run() {
                            onPick.onPick(value);
                            dismiss();
                        }
                    }));
        }

        // A fixed list of options can exceed the screen height on smaller devices (or with system
        // font scaling up) and silently clip the last item(s) with nothing to scroll — wrap it, but
        // WRAP_CONTENT (not a weight against a fixed-height window) so a short list like this one
        // stays its natural size instead of always stretching to fill a forced 80%-of-screen window.
        ScrollView scroll = new ScrollView(getContext());
        scroll.addView(list);
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        setContentView(root);
        if (window != null) {
            int screenW = getContext().getResources().getDisplayMetrics().widthPixels;
            int screenH = getContext().getResources().getDisplayMetrics().heightPixels;
            int width = Math.min(screenW - dp(44), dp(420));
            int maxHeight = (int) (screenH * 0.8f);
            root.measure(
                    View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(maxHeight, View.MeasureSpec.AT_MOST));
            window.setLayout(width, Math.min(root.getMeasuredHeight(), maxHeight));
        }
    }

    private int dp(float v) {
        return Math.round(v * density);
    }

    private final class RevealPreview extends View {
        private final String mode;
        private final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF r = new RectF();

        RevealPreview(Context c, String mode) {
            super(c);
            this.mode = mode;
        }

        @Override protected void onDraw(Canvas canvas) {
            int w = getWidth();
            int h = getHeight();

            // "RATINGS" caption
            p.setColor(0xFF8A8A8A);
            p.setTextSize(dp(8));
            canvas.drawText("RATINGS", 0, dp(9), p);

            float top = dp(16);
            float rad = dp(7);
            r.set(0, top, w, h);

            if ("link".equals(mode)) {
                // no cover — a short text-link bar
                p.setColor(0xFF9AA0A6);
                r.set(0, top + dp(8), w * 0.42f, top + dp(13));
                canvas.drawRoundRect(r, dp(2), dp(2), p);
                return;
            }

            // opaque panel
            p.setColor(0xFF232323);
            canvas.drawRoundRect(r, rad, rad, p);

            float cx = w / 2f;
            float cy = top + (h - top) / 2f;

            if ("panel".equals(mode)) {
                // eye glyph
                p.setStyle(Paint.Style.STROKE);
                p.setStrokeWidth(dp(1.4f));
                p.setColor(0xFFB8C2CC);
                canvas.drawOval(cx - dp(9), cy - dp(5.5f), cx + dp(9), cy + dp(5.5f), p);
                p.setStyle(Paint.Style.FILL);
                canvas.drawCircle(cx, cy, dp(2.6f), p);
                return;
            }

            // shimmer / burst — particle field
            p.setStyle(Paint.Style.FILL);
            int n = 60;
            Random g = new Random(mode.hashCode());
            for (int i = 0; i < n; i++) {
                float x, y;
                if ("burst".equals(mode)) {
                    double ang = g.nextDouble() * Math.PI * 2;
                    double dist = Math.pow(g.nextDouble(), 0.5); // bias outward
                    x = cx + (float) (Math.cos(ang) * dist * (w / 2f));
                    y = cy + (float) (Math.sin(ang) * dist * ((h - top) / 2f));
                } else {
                    x = g.nextFloat() * w;
                    y = top + g.nextFloat() * (h - top);
                }
                int a = 90 + g.nextInt(120);
                p.setColor((a << 24) | 0x00C6D0DA);
                canvas.drawCircle(x, y, dp(1f), p);
            }
        }
    }
}
