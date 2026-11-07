package app.noam.extension.chesscom.settings;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ComposeShader;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.RectF;
import android.graphics.Shader;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;

import java.util.Locale;

import app.noam.extension.chesscom.theme.Accent;

final class ColorPicker {
    interface Listener {
        void onColor(int color);
    }

    private ColorPicker() {}

    static void show(Activity activity, String title, int initial, Listener listener) {
        float density = activity.getResources().getDisplayMetrics().density;
        float[] hsv = new float[3];
        Color.colorToHSV(initial | 0xFF000000, hsv);

        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        int pad = Math.round(20 * density);
        content.setPadding(pad, Math.round(12 * density), pad, 0);

        Swatch preview = new Swatch(activity);
        EditText hex = new EditText(activity);
        SaturationValue square = new SaturationValue(activity, hsv);
        Hue hue = new Hue(activity, hsv);
        boolean[] typing = {false};
        Runnable changed = () -> {
            int color = Color.HSVToColor(hsv);
            preview.setColor(color);
            if (!typing[0]) hex.setText(String.format(Locale.ROOT, "#%06X", color & 0xFFFFFF));
            square.invalidate();
            hue.invalidate();
        };
        square.onChange = changed;
        hue.onChange = changed;

        content.addView(square, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, Math.round(200 * density)));
        LinearLayout.LayoutParams hueParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, Math.round(28 * density));
        hueParams.topMargin = Math.round(14 * density);
        content.addView(hue, hueParams);

        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        rowParams.topMargin = Math.round(14 * density);
        row.addView(preview, new LinearLayout.LayoutParams(Math.round(56 * density), Math.round(36 * density)));
        hex.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS);
        hex.setSingleLine(true);
        hex.setTextColor(0xFFFFFFFF);
        LinearLayout.LayoutParams hexParams = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        hexParams.leftMargin = Math.round(16 * density);
        row.addView(hex, hexParams);
        content.addView(row, rowParams);

        hex.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {}

            @Override
            public void afterTextChanged(Editable editable) {
                String text = editable.toString().trim();
                if (!text.startsWith("#")) text = "#" + text;
                if (text.length() != 7) return;
                try {
                    Color.colorToHSV(Color.parseColor(text), hsv);
                } catch (IllegalArgumentException e) {
                    return;
                }
                typing[0] = true;
                changed.run();
                typing[0] = false;
            }
        });
        changed.run();

        AlertDialog dialog = new AlertDialog.Builder(activity, android.R.style.Theme_Material_Dialog_Alert)
            .setTitle(title)
            .setView(content)
            .setPositiveButton(android.R.string.ok, (shown, which) -> listener.onColor(Color.HSVToColor(hsv)))
            .setNegativeButton(android.R.string.cancel, null)
            .create();
        dialog.setOnShowListener(shown -> {
            int accent = Accent.current();
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(accent);
            dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(accent);
        });
        dialog.show();
    }

    private static final class Swatch extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        Swatch(Activity activity) {
            super(activity);
        }

        void setColor(int color) {
            paint.setColor(color);
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float radius = getHeight() / 4f;
            canvas.drawRoundRect(new RectF(0, 0, getWidth(), getHeight()), radius, radius, paint);
        }
    }

    /** Saturation left to right, brightness bottom to top, for the current hue. */
    private static final class SaturationValue extends View {
        private final float[] hsv;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        Runnable onChange;

        SaturationValue(Activity activity, float[] hsv) {
            super(activity);
            this.hsv = hsv;
            ring.setStyle(Paint.Style.STROKE);
        }

        /** Room around the square so the ring stays whole at its edges. */
        private float inset() {
            return 12 * getResources().getDisplayMetrics().density;
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float inset = inset();
            float left = inset, top = inset, right = getWidth() - inset, bottom = getHeight() - inset;
            int pure = Color.HSVToColor(new float[]{hsv[0], 1f, 1f});
            Shader saturation = new LinearGradient(left, 0, right, 0, Color.WHITE, pure, Shader.TileMode.CLAMP);
            Shader value = new LinearGradient(0, top, 0, bottom, Color.WHITE, Color.BLACK, Shader.TileMode.CLAMP);
            paint.setShader(new ComposeShader(value, saturation, PorterDuff.Mode.MULTIPLY));
            float radius = 12 * getResources().getDisplayMetrics().density;
            canvas.drawRoundRect(new RectF(left, top, right, bottom), radius, radius, paint);
            float x = left + hsv[1] * (right - left), y = top + (1 - hsv[2]) * (bottom - top);
            float r = 10 * getResources().getDisplayMetrics().density;
            ring.setStrokeWidth(r / 3);
            ring.setColor(Color.BLACK);
            canvas.drawCircle(x, y, r, ring);
            ring.setStrokeWidth(r / 5);
            ring.setColor(Color.WHITE);
            canvas.drawCircle(x, y, r, ring);
        }

        @SuppressLint("ClickableViewAccessibility")
        @Override
        public boolean onTouchEvent(MotionEvent event) {
            getParent().requestDisallowInterceptTouchEvent(true);
            float inset = inset();
            hsv[1] = Math.max(0f, Math.min(1f, (event.getX() - inset) / (getWidth() - 2 * inset)));
            hsv[2] = 1f - Math.max(0f, Math.min(1f, (event.getY() - inset) / (getHeight() - 2 * inset)));
            if (onChange != null) onChange.run();
            return true;
        }
    }

    private static final class Hue extends View {
        private final float[] hsv;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint marker = new Paint(Paint.ANTI_ALIAS_FLAG);
        Runnable onChange;

        Hue(Activity activity, float[] hsv) {
            super(activity);
            this.hsv = hsv;
            marker.setStyle(Paint.Style.STROKE);
            marker.setColor(Color.WHITE);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = getWidth(), h = getHeight();
            int[] colors = new int[7];
            for (int i = 0; i < colors.length; i++) colors[i] = Color.HSVToColor(new float[]{i * 60f % 360f, 1f, 1f});
            colors[6] = Color.HSVToColor(new float[]{0f, 1f, 1f});
            paint.setShader(new LinearGradient(0, 0, w, 0, colors, null, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(new RectF(0, 0, w, h), h / 2, h / 2, paint);
            float x = h / 2 + hsv[0] / 360f * (w - h);
            marker.setStrokeWidth(h / 7);
            canvas.drawCircle(x, h / 2, h / 2 - h / 14, marker);
        }

        @SuppressLint("ClickableViewAccessibility")
        @Override
        public boolean onTouchEvent(MotionEvent event) {
            getParent().requestDisallowInterceptTouchEvent(true);
            hsv[0] = Math.max(0f, Math.min(359.9f, (event.getX() - getHeight() / 2f) / (getWidth() - getHeight()) * 360f));
            if (onChange != null) onChange.run();
            return true;
        }
    }
}
