package app.template.extension.settings;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.GradientDrawable;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

/** HSV colour picker (saturation/value square + hue slider + presets + hex field). */
final class HexPickerDialog extends Dialog {

    interface OnPicked {
        void onPicked(int argb);
    }

    private final float density;
    private final float[] hsv = new float[3];
    private final OnPicked callback;

    private View currentBar;
    private TextView currentHex;
    private SatValView satVal;
    private HueView hue;
    private EditText hexField;
    private boolean syncing;

    HexPickerDialog(Context context, int initialArgb, OnPicked callback) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.callback = callback;
        Color.colorToHSV(0xFF000000 | initialArgb, hsv);
        build();
    }

    private void build() {
        Window window = getWindow();
        if (window != null) window.setBackgroundDrawable(round(0xFF1C1C1C, dp(20)));

        LinearLayout root = new LinearLayout(getContext());
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(20);
        root.setPadding(pad, dp(22), pad, dp(18));

        root.addView(title("Accent colour"));

        currentBar = new View(getContext());
        currentHex = new TextView(getContext());
        currentHex.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        currentHex.setTypeface(currentHex.getTypeface(), android.graphics.Typeface.BOLD);
        currentHex.setGravity(Gravity.CENTER);
        FrameLayout barWrap = new FrameLayout(getContext());
        barWrap.setLayoutParams(marginTop(dp(18)));
        barWrap.addView(currentBar, new FrameLayout.LayoutParams(MATCH, dp(58)));
        barWrap.addView(currentHex, new FrameLayout.LayoutParams(MATCH, dp(58)));
        root.addView(barWrap);

        root.addView(presetRow());

        satVal = new SatValView(getContext());
        LinearLayout.LayoutParams svLp = new LinearLayout.LayoutParams(MATCH, dp(210));
        svLp.topMargin = dp(14);
        satVal.setLayoutParams(svLp);
        root.addView(satVal);

        hue = new HueView(getContext());
        LinearLayout.LayoutParams hueLp = new LinearLayout.LayoutParams(MATCH, dp(26));
        hueLp.topMargin = dp(16);
        hue.setLayoutParams(hueLp);
        root.addView(hue);

        root.addView(hexFieldGroup());
        root.addView(buttonRow());

        satVal.onChange = new Runnable() {
            @Override public void run() { hsv[1] = satVal.sat; hsv[2] = satVal.val; pushFromHsv(true); }
        };
        hue.onChange = new Runnable() {
            @Override public void run() { hsv[0] = hue.hue; pushFromHsv(true); }
        };

        setContentView(root);
        if (window != null) {
            window.setLayout(
                    Math.min(getContext().getResources().getDisplayMetrics().widthPixels - dp(44), dp(430)),
                    ViewGroup.LayoutParams.WRAP_CONTENT);
        }
        pushFromHsv(true);
    }

    private void pushFromHsv(boolean updateField) {
        int argb = Color.HSVToColor(hsv);
        satVal.hue = hsv[0];
        satVal.sat = hsv[1];
        satVal.val = hsv[2];
        satVal.invalidate();
        hue.hue = hsv[0];
        hue.invalidate();

        GradientDrawable bar = round(argb, dp(16));
        currentBar.setBackground(bar);
        String hex = String.format("#%06X", argb & 0xFFFFFF);
        int textOn = AccentPresets.isLight(argb) ? 0xFF141414 : 0xFFFFFFFF;
        currentHex.setText(hex);
        currentHex.setTextColor(textOn);

        if (updateField && !syncing) {
            syncing = true;
            hexField.setText(hex);
            hexField.setSelection(hexField.getText().length());
            syncing = false;
        }
    }

    // --- pieces -----------------------------------------------------------

    private TextView title(String text) {
        TextView tv = new TextView(getContext());
        tv.setText(text);
        tv.setTextColor(0xFFFFFFFF);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
        tv.setTypeface(tv.getTypeface(), android.graphics.Typeface.BOLD);
        tv.setGravity(Gravity.CENTER);
        tv.setPadding(0, 0, 0, dp(4));
        return tv;
    }

    private View presetRow() {
        LinearLayout strip = new LinearLayout(getContext());
        strip.setOrientation(LinearLayout.HORIZONTAL);
        for (final int argb : AccentPresets.ARGB.values()) {
            View sw = new View(getContext());
            sw.setBackground(round(0xFF000000 | argb, dp(10)));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(46), dp(46));
            lp.rightMargin = dp(10);
            sw.setLayoutParams(lp);
            sw.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) {
                    Color.colorToHSV(0xFF000000 | argb, hsv);
                    pushFromHsv(true);
                }
            });
            strip.addView(sw);
        }
        HorizontalScrollView scroll = new HorizontalScrollView(getContext());
        scroll.setHorizontalScrollBarEnabled(false);
        scroll.addView(strip);
        scroll.setLayoutParams(marginTop(dp(14)));
        return scroll;
    }

    private View hexFieldGroup() {
        LinearLayout box = new LinearLayout(getContext());
        box.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable stroke = new GradientDrawable();
        stroke.setCornerRadius(dp(10));
        stroke.setStroke(dp(1), 0xFF3A3A3A);
        box.setBackground(stroke);
        box.setPadding(dp(14), dp(8), dp(14), dp(8));

        TextView label = new TextView(getContext());
        label.setText("Hex color");
        label.setTextColor(0xFF9AA0A6);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);

        hexField = new EditText(getContext());
        hexField.setBackground(null);
        hexField.setPadding(0, dp(2), 0, 0);
        hexField.setTextColor(0xFFEDEDED);
        hexField.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        hexField.setSingleLine(true);
        hexField.setFilters(new InputFilter[] { new InputFilter.LengthFilter(9) });
        hexField.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int a, int b, int c) {}
            @Override public void onTextChanged(CharSequence s, int a, int b, int c) {}
            @Override public void afterTextChanged(Editable e) {
                if (syncing) return;
                try {
                    int argb = AccentMath.parseHex(e.toString());
                    syncing = true;
                    Color.colorToHSV(argb, hsv);
                    pushFromHsv(false);
                    syncing = false;
                } catch (Throwable ignored) {
                    syncing = false;
                }
            }
        });

        box.addView(label);
        box.addView(hexField);
        box.setLayoutParams(marginTop(dp(18)));
        return box;
    }

    private View buttonRow() {
        LinearLayout row = new LinearLayout(getContext());
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setLayoutParams(marginTop(dp(18)));

        TextView cancel = pillButton("Cancel", 0x00000000, 0xFF3A3A3A, 0xFFE0E0E0);
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { dismiss(); }
        });
        TextView save = pillButton("Save", 0xFF3A4250, 0xFF3A4250, 0xFFFFFFFF);
        save.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                if (callback != null) callback.onPicked(Color.HSVToColor(hsv));
                dismiss();
            }
        });

        LinearLayout.LayoutParams lp1 = new LinearLayout.LayoutParams(0, WRAP, 1f);
        lp1.rightMargin = dp(6);
        LinearLayout.LayoutParams lp2 = new LinearLayout.LayoutParams(0, WRAP, 1f);
        lp2.leftMargin = dp(6);
        row.addView(cancel, lp1);
        row.addView(save, lp2);
        return row;
    }

    private TextView pillButton(String text, int fill, int strokeColor, int textColor) {
        TextView tv = new TextView(getContext());
        tv.setText(text);
        tv.setGravity(Gravity.CENTER);
        tv.setTextColor(textColor);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        tv.setPadding(0, dp(14), 0, dp(14));
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dp(12));
        bg.setColor(fill);
        bg.setStroke(dp(1), strokeColor);
        tv.setBackground(bg);
        return tv;
    }

    // --- helpers --------------------------------------------------------

    private static final int MATCH = ViewGroup.LayoutParams.MATCH_PARENT;
    private static final int WRAP = ViewGroup.LayoutParams.WRAP_CONTENT;

    private LinearLayout.LayoutParams marginTop(int top) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(MATCH, WRAP);
        lp.topMargin = top;
        return lp;
    }

    private GradientDrawable round(int color, int radius) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(radius);
        return d;
    }

    private int dp(float v) {
        return Math.round(v * density);
    }

    // --- custom views -------------------------------------------------

    static final class SatValView extends View {
        float hue, sat, val;
        Runnable onChange;
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path clip = new Path();
        private final RectF rect = new RectF();
        private Shader white, black;

        SatValView(Context c) {
            super(c);
            ring.setStyle(Paint.Style.STROKE);
            ring.setColor(0xFFFFFFFF);
            ring.setStrokeWidth(c.getResources().getDisplayMetrics().density * 2.5f);
        }

        @Override protected void onSizeChanged(int w, int h, int ow, int oh) {
            white = new LinearGradient(0, 0, w, 0, 0xFFFFFFFF, 0x00FFFFFF, Shader.TileMode.CLAMP);
            black = new LinearGradient(0, 0, 0, h, 0x00000000, 0xFF000000, Shader.TileMode.CLAMP);
            float r = getResources().getDisplayMetrics().density * 12f;
            clip.reset();
            rect.set(0, 0, w, h);
            clip.addRoundRect(rect, r, r, Path.Direction.CW);
        }

        @Override protected void onDraw(Canvas canvas) {
            int save = canvas.save();
            canvas.clipPath(clip);
            fill.setShader(null);
            fill.setColor(Color.HSVToColor(new float[] { hue, 1f, 1f }));
            canvas.drawRect(0, 0, getWidth(), getHeight(), fill);
            fill.setShader(white);
            canvas.drawRect(0, 0, getWidth(), getHeight(), fill);
            fill.setShader(black);
            canvas.drawRect(0, 0, getWidth(), getHeight(), fill);
            canvas.restoreToCount(save);

            float cx = sat * getWidth();
            float cy = (1f - val) * getHeight();
            canvas.drawCircle(cx, cy, ring.getStrokeWidth() * 3f, ring);
        }

        @Override public boolean onTouchEvent(MotionEvent e) {
            float x = Math.max(0, Math.min(getWidth(), e.getX()));
            float y = Math.max(0, Math.min(getHeight(), e.getY()));
            sat = getWidth() == 0 ? 0 : x / getWidth();
            val = getHeight() == 0 ? 0 : 1f - y / getHeight();
            if (onChange != null) onChange.run();
            getParent().requestDisallowInterceptTouchEvent(true);
            return true;
        }
    }

    static final class HueView extends View {
        float hue;
        Runnable onChange;
        private final Paint bar = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private Shader shader;

        HueView(Context c) {
            super(c);
            ring.setStyle(Paint.Style.STROKE);
            ring.setColor(0xFFFFFFFF);
            ring.setStrokeWidth(c.getResources().getDisplayMetrics().density * 2.5f);
        }

        @Override protected void onSizeChanged(int w, int h, int ow, int oh) {
            shader = new LinearGradient(0, 0, w, 0, new int[] {
                    0xFFFF0000, 0xFFFFFF00, 0xFF00FF00, 0xFF00FFFF, 0xFF0000FF, 0xFFFF00FF, 0xFFFF0000,
            }, null, Shader.TileMode.CLAMP);
        }

        @Override protected void onDraw(Canvas canvas) {
            float r = getHeight() / 2f;
            rect.set(0, 0, getWidth(), getHeight());
            bar.setShader(shader);
            canvas.drawRoundRect(rect, r, r, bar);
            float cx = hue / 360f * getWidth();
            canvas.drawCircle(cx, getHeight() / 2f, r, ring);
        }

        @Override public boolean onTouchEvent(MotionEvent e) {
            float x = Math.max(0, Math.min(getWidth(), e.getX()));
            hue = getWidth() == 0 ? 0 : x / getWidth() * 360f;
            if (hue >= 360f) hue = 359.999f;
            if (onChange != null) onChange.run();
            getParent().requestDisallowInterceptTouchEvent(true);
            return true;
        }
    }
}
