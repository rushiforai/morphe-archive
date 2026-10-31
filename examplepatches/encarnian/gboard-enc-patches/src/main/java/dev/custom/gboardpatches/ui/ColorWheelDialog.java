package dev.custom.gboardpatches.ui;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.Shader;
import android.graphics.SweepGradient;
import android.graphics.drawable.GradientDrawable;
import android.preference.PreferenceManager;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;
import java.lang.reflect.Method;

/**
 * Self-contained Color Wheel Picker Dialog for Gboard glide typing trail.
 * Renders an HSV color wheel disc, brightness slider, preview swatch, hex code,
 * and quick-selection presets.
 */
public class ColorWheelDialog {

    private static final String PREF_KEY_CUSTOM_COLOR = "pref_key_glide_trail_custom_color";

    public static void show(final Context context, final Object preference) {
        if (context == null) return;

        final SharedPreferences prefs = GlideTrailPreferences.getPrefs(context);
        int initialColor = prefs != null ? prefs.getInt(PREF_KEY_CUSTOM_COLOR, 0) : 0;
        if (initialColor == 0) {
            // Default vibrant cyan if no color previously saved
            initialColor = 0xFF00E5FF;
        }

        final float[] hsv = new float[3];
        Color.colorToHSV(initialColor, hsv);

        // Main layout container
        ScrollView scrollView = new ScrollView(context);
        final LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = dpToPx(context, 16);
        layout.setPadding(padding, padding, padding, padding);
        layout.setGravity(Gravity.CENTER_HORIZONTAL);
        scrollView.addView(layout);

        // 1. Preview Row: Color Swatch + Hex Display
        final LinearLayout previewRow = new LinearLayout(context);
        previewRow.setOrientation(LinearLayout.HORIZONTAL);
        previewRow.setGravity(Gravity.CENTER_VERTICAL);
        previewRow.setLayoutParams(new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final View colorSwatch = new View(context);
        int swatchSize = dpToPx(context, 44);
        LinearLayout.LayoutParams swatchLp = new LinearLayout.LayoutParams(swatchSize, swatchSize);
        swatchLp.rightMargin = dpToPx(context, 14);
        colorSwatch.setLayoutParams(swatchLp);
        updateSwatch(colorSwatch, initialColor);

        final TextView hexText = new TextView(context);
        hexText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        hexText.setTextColor(Color.WHITE);
        hexText.setText(formatHex(initialColor));

        previewRow.addView(colorSwatch);
        previewRow.addView(hexText);
        layout.addView(previewRow);

        // 2. Interactive HSV Color Wheel View
        int wheelSize = dpToPx(context, 240);
        final ColorWheelView wheelView = new ColorWheelView(context, wheelSize, hsv[0], hsv[1]);
        LinearLayout.LayoutParams wheelLp = new LinearLayout.LayoutParams(wheelSize, wheelSize);
        wheelLp.topMargin = dpToPx(context, 12);
        wheelLp.bottomMargin = dpToPx(context, 12);
        wheelView.setLayoutParams(wheelLp);
        layout.addView(wheelView);

        // 3. Brightness / Value Label & SeekBar
        final TextView valLabel = new TextView(context);
        valLabel.setText("Brightness: " + Math.round(hsv[2] * 100) + "%");
        valLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        valLabel.setTextColor(0xFFCCCCCC);
        layout.addView(valLabel);

        final SeekBar valSeekBar = new SeekBar(context);
        valSeekBar.setMax(100);
        valSeekBar.setProgress(Math.round(hsv[2] * 100));
        LinearLayout.LayoutParams seekLp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        seekLp.topMargin = dpToPx(context, 4);
        seekLp.bottomMargin = dpToPx(context, 12);
        valSeekBar.setLayoutParams(seekLp);
        layout.addView(valSeekBar);

        // Listener for color updates
        final Runnable colorUpdater = new Runnable() {
            @Override
            public void run() {
                hsv[0] = wheelView.getHue();
                hsv[1] = wheelView.getSaturation();
                hsv[2] = valSeekBar.getProgress() / 100.0f;
                int chosen = Color.HSVToColor(hsv);
                updateSwatch(colorSwatch, chosen);
                hexText.setText(formatHex(chosen));
                valLabel.setText("Brightness: " + valSeekBar.getProgress() + "%");
            }
        };

        wheelView.setOnColorChangeListener(colorUpdater);
        valSeekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                colorUpdater.run();
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override public void onStopTrackingTouch(SeekBar seekBar) {}
        });

        // 4. Quick Preset Chips
        TextView presetLabel = new TextView(context);
        presetLabel.setText("Quick presets:");
        presetLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        presetLabel.setTextColor(0xFF999999);
        LinearLayout.LayoutParams plp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        plp.topMargin = dpToPx(context, 4);
        plp.bottomMargin = dpToPx(context, 6);
        presetLabel.setLayoutParams(plp);
        layout.addView(presetLabel);

        HorizontalScrollView presetScroll = new HorizontalScrollView(context);
        presetScroll.setHorizontalScrollBarEnabled(false);
        LinearLayout presetContainer = new LinearLayout(context);
        presetContainer.setOrientation(LinearLayout.HORIZONTAL);
        presetScroll.addView(presetContainer);

        final int[] presets = new int[] {
            0xFF00E5FF, // Neon Cyan
            0xFFD500F9, // Electric Purple
            0xFFFF4081, // Hot Pink
            0xFFFF1744, // Vibrant Red
            0xFFFF6D00, // Neon Orange
            0xFF00E676, // Electric Green
            0xFFFFD600, // Golden Yellow
            0xFFFFFFFF  // Pure White
        };

        for (final int pColor : presets) {
            View chip = new View(context);
            int chipSize = dpToPx(context, 32);
            LinearLayout.LayoutParams chipLp = new LinearLayout.LayoutParams(chipSize, chipSize);
            chipLp.rightMargin = dpToPx(context, 10);
            chip.setLayoutParams(chipLp);
            updateSwatch(chip, pColor);
            chip.setClickable(true);
            chip.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Color.colorToHSV(pColor, hsv);
                    wheelView.setHueAndSaturation(hsv[0], hsv[1]);
                    valSeekBar.setProgress(Math.round(hsv[2] * 100));
                    colorUpdater.run();
                }
            });
            presetContainer.addView(chip);
        }
        layout.addView(presetScroll);

        // Build and display AlertDialog
        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        builder.setTitle("Trail Color Wheel");
        builder.setView(scrollView);

        builder.setPositiveButton("Apply", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                hsv[0] = wheelView.getHue();
                hsv[1] = wheelView.getSaturation();
                hsv[2] = valSeekBar.getProgress() / 100.0f;
                int finalColor = Color.HSVToColor(hsv);
                GlideTrailPreferences.saveCustomColor(context, finalColor);
                updatePreferenceSummary(context, preference, finalColor);
            }
        });

        builder.setNeutralButton("Reset to Theme", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                GlideTrailPreferences.saveCustomColor(context, 0); // 0 = Stock Theme Default
                updatePreferenceSummary(context, preference, 0);
            }
        });

        builder.setNegativeButton("Cancel", null);

        AlertDialog dialog = builder.create();
        dialog.show();
    }

    public static void updateSummary(Context context, Object preference) {
        if (context == null || preference == null) return;
        SharedPreferences prefs = GlideTrailPreferences.getPrefs(context);
        int color = prefs != null ? prefs.getInt(PREF_KEY_CUSTOM_COLOR, 0) : 0;
        updatePreferenceSummary(context, preference, color);
    }

    private static void updatePreferenceSummary(Context context, Object preference, int color) {
        if (preference == null) return;
        String summary;
        if (color != 0) {
            summary = "Active color: " + formatHex(color) + " (Tap to change)";
        } else {
            summary = "Using Gboard stock dynamic theme color (Tap to set custom)";
        }
        GlideTrailPreferences.setSummary(preference, summary);
    }

    private static String formatHex(int color) {
        return String.format("#%06X", (0xFFFFFF & color));
    }

    private static void updateSwatch(View view, int color) {
        GradientDrawable gd = new GradientDrawable();
        gd.setColor(color);
        gd.setCornerRadius(14f);
        gd.setStroke(2, 0xFF888888);
        view.setBackground(gd);
    }

    private static int dpToPx(Context context, int dp) {
        DisplayMetrics dm = context.getResources().getDisplayMetrics();
        return Math.round(dp * dm.density);
    }

    /**
     * Custom View that paints an HSV Color Wheel and handles drag/touch reticle.
     */
    public static class ColorWheelView extends View {
        private final int size;
        private float hue;
        private float saturation;
        private final Paint wheelPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint reticlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint reticleInnerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private Bitmap wheelBitmap;
        private Runnable onColorChangeListener;

        public ColorWheelView(Context context, int size, float initialHue, float initialSat) {
            super(context);
            this.size = size;
            this.hue = initialHue;
            this.saturation = initialSat;

            reticlePaint.setStyle(Paint.Style.STROKE);
            reticlePaint.setStrokeWidth(4f);
            reticlePaint.setColor(Color.WHITE);

            reticleInnerPaint.setStyle(Paint.Style.STROKE);
            reticleInnerPaint.setStrokeWidth(2f);
            reticleInnerPaint.setColor(Color.BLACK);
        }

        public void setOnColorChangeListener(Runnable listener) {
            this.onColorChangeListener = listener;
        }

        public float getHue() {
            return hue;
        }

        public float getSaturation() {
            return saturation;
        }

        public void setHueAndSaturation(float h, float s) {
            this.hue = h;
            this.saturation = Math.max(0f, Math.min(1f, s));
            invalidate();
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            setMeasuredDimension(size, size);
        }

        @Override
        protected void onSizeChanged(int w, int h, int oldw, int oldh) {
            super.onSizeChanged(w, h, oldw, oldh);
            if (w > 0 && h > 0) {
                generateWheelBitmap(w, h);
            }
        }

        private void generateWheelBitmap(int w, int h) {
            wheelBitmap = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
            Canvas c = new Canvas(wheelBitmap);
            float cx = w / 2f;
            float cy = h / 2f;
            float r = Math.min(cx, cy) - 10f;

            // 1. SweepGradient for 360° Hue
            int[] colors = new int[] {
                Color.RED, Color.YELLOW, Color.GREEN,
                Color.CYAN, Color.BLUE, Color.MAGENTA, Color.RED
            };
            SweepGradient sweep = new SweepGradient(cx, cy, colors, null);
            wheelPaint.setShader(sweep);
            c.drawCircle(cx, cy, r, wheelPaint);

            // 2. RadialGradient for Saturation (white center -> transparent edge)
            RadialGradient radial = new RadialGradient(cx, cy, r, Color.WHITE, 0x00FFFFFF, Shader.TileMode.CLAMP);
            Paint satPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            satPaint.setShader(radial);
            c.drawCircle(cx, cy, r, satPaint);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            if (wheelBitmap != null) {
                canvas.drawBitmap(wheelBitmap, 0, 0, null);
            }

            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            float r = Math.min(cx, cy) - 10f;

            // Reticle position
            double rad = Math.toRadians(hue);
            float dist = saturation * r;
            float rx = cx + (float) (dist * Math.cos(rad));
            float ry = cy + (float) (dist * Math.sin(rad));

            canvas.drawCircle(rx, ry, 12f, reticlePaint);
            canvas.drawCircle(rx, ry, 10f, reticleInnerPaint);
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            float r = Math.min(cx, cy) - 10f;

            float dx = event.getX() - cx;
            float dy = event.getY() - cy;
            double dist = Math.hypot(dx, dy);

            saturation = Math.min(1.0f, (float) (dist / r));
            double deg = Math.toDegrees(Math.atan2(dy, dx));
            hue = (float) ((deg + 360.0) % 360.0);

            invalidate();
            if (onColorChangeListener != null) {
                onColorChangeListener.run();
            }
            return true;
        }
    }
}
