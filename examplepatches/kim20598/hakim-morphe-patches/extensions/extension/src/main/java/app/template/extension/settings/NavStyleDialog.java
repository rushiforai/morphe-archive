package app.template.extension.settings;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.TextView;

/** "Bottom nav selected style" chooser that draws a mini navigation bar per option. */
final class NavStyleDialog extends Dialog {

    interface OnPick {
        void onPick(String value);
    }

    private static final String[] LABELS = {
            "Stock", "No pill", "No pill, white icon", "No pill, accent icon", "Accent pill",
    };
    private static final String[] VALUES = { "stock", "nopill", "white", "accent", "accentPill" };

    private final float density;
    private final int accent;

    NavStyleDialog(Context context, String current, int accentArgb, final OnPick onPick) {
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
        head.setText("Bottom nav selected style");
        head.setTextColor(0xFFFFFFFF);
        head.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        head.setTypeface(head.getTypeface(), Typeface.BOLD);
        head.setPadding(0, 0, 0, dp(10));
        root.addView(head);

        for (int i = 0; i < LABELS.length; i++) {
            final String value = VALUES[i];
            boolean sel = value.equals(current);

            NavPreview preview = new NavPreview(getContext(), value);
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

    /** A tiny five-item bottom nav; item 0 shows the selected treatment, item 2 is the green "+". */
    private final class NavPreview extends View {
        private final String mode;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        NavPreview(Context c, String mode) {
            super(c);
            this.mode = mode;
        }

        @Override protected void onDraw(Canvas canvas) {
            int w = getWidth();
            int h = getHeight();
            float r = dp(10);

            paint.setColor(0xFF0C0C0C);
            rect.set(0, 0, w, h);
            canvas.drawRoundRect(rect, r, r, paint);

            int n = 5;
            float step = w / (float) n;
            float cy = h / 2f;
            float dot = dp(4.5f);

            boolean stockGreen = "green".equals(
                    Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(getContext())));
            int selIconColor;
            boolean pill;
            int pillColor;
            switch (mode) {
                case "nopill": selIconColor = 0xFF40BCF4; pill = false; pillColor = 0; break;
                case "white":  selIconColor = 0xFFF2F2F2; pill = false; pillColor = 0; break;
                case "accent": selIconColor = stockGreen ? 0xFFF2F2F2 : accent; pill = false; pillColor = 0; break;
                case "accentPill":
                    selIconColor = stockGreen ? 0xFFF2F2F2 : accent;
                    pill = true; pillColor = (0x38 << 24) | (accent & 0xFFFFFF); break;
                default: // stock
                    selIconColor = 0xFF40BCF4; pill = true; pillColor = 0xFF333333; break;
            }

            for (int i = 0; i < n; i++) {
                float cx = step * (i + 0.5f);
                if (i == 0 && pill) {
                    paint.setColor(pillColor);
                    float pw = step * 0.7f, ph = h * 0.5f;
                    rect.set(cx - pw / 2, cy - ph / 2, cx + pw / 2, cy + ph / 2);
                    canvas.drawRoundRect(rect, ph / 2, ph / 2, paint);
                }
                if (i == 2) {
                    paint.setColor(0xFF00E054); // the always-green + button
                } else if (i == 0) {
                    paint.setColor(selIconColor);
                } else {
                    paint.setColor(0xFF6A7480); // unselected grey
                }
                canvas.drawCircle(cx, cy, dot, paint);
            }
        }
    }
}
