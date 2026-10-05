package app.template.extension.settings;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.TextView;

/** "Confetti color" chooser — only relevant when the Confetti reveal animation is selected. */
final class ConfettiColorDialog extends Dialog {

    interface OnPick {
        void onPick(String value);
    }

    private static final String[] LABELS = { "Accent", "Letterboxd colors", "Classic red" };
    private static final String[] VALUES = { "accent", "letterboxd", "red" };
    private static final int[] LETTERBOXD_SWATCHES = { 0xFFFF8000, 0xFF00E054, 0xFF40BCF4 };
    private static final int[] RED_SWATCHES = { 0xFFE63946, 0xFFFFC93C, 0xFFB3122A };

    private final float density;
    private final int accent;

    ConfettiColorDialog(Context context, String current, int accentArgb, final OnPick onPick) {
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
        head.setText("Confetti color");
        head.setTextColor(0xFFFFFFFF);
        head.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        head.setTypeface(head.getTypeface(), Typeface.BOLD);
        head.setPadding(0, 0, 0, dp(10));
        root.addView(head);

        for (int i = 0; i < LABELS.length; i++) {
            final String value = VALUES[i];
            boolean sel = value.equals(current);

            SwatchPreview preview = new SwatchPreview(getContext(), value);
            root.addView(OptionCard.build(getContext(), density, preview, 36f, LABELS[i], sel, accent,
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

    private final class SwatchPreview extends View {
        private final String value;
        private final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);

        SwatchPreview(Context c, String value) {
            super(c);
            this.value = value;
        }

        @Override protected void onDraw(Canvas canvas) {
            int h = getHeight();
            float r = h / 2.4f;
            float cy = h / 2f;
            int[] swatches = "letterboxd".equals(value) ? LETTERBOXD_SWATCHES
                    : "red".equals(value) ? RED_SWATCHES : null;
            if (swatches != null) {
                float gap = r * 2.6f;
                float startX = r + dp(4);
                for (int i = 0; i < swatches.length; i++) {
                    p.setColor(swatches[i]);
                    canvas.drawCircle(startX + i * gap, cy, r, p);
                }
            } else {
                p.setColor(accent);
                canvas.drawCircle(r + dp(4), cy, r, p);
            }
        }
    }
}
