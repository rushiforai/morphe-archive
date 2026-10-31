package dev.custom.gboardpatches.ui;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;

/**
 * Interactive Slider Dialog for continuous control of:
 * - Trail Fade Duration (Speed): 200ms - 4000ms
 * - Trail Width & Thickness: 2dp - 40dp
 * - Trail Length & Retention: 5 - 100 points
 */
public class GlideTrailSliderDialog {

    public static void show(final Context context, final Object preference, final String key) {
        if (context == null || key == null) return;

        final SharedPreferences prefs = GlideTrailPreferences.getPrefs(context);

        final String title;
        final String unit;
        final int min;
        final int max;
        final int defVal;
        final int[] presets;
        final String[] presetLabels;

        if (GlideTrailPreferences.PREF_SPEED_MS.equals(key)) {
            title = "Trail Fade Duration";
            unit = "ms";
            min = 200;
            max = 4000;
            defVal = 1000;
            presets = new int[] { 400, 750, 1000, 1500, 2000, 3000, 4000 };
            presetLabels = new String[] { "400ms (Fast)", "750ms", "1000ms (Default)", "1500ms", "2000ms (Slow)", "3000ms", "4000ms (Max)" };
        } else if (GlideTrailPreferences.PREF_WIDTH_DP.equals(key)) {
            title = "Trail Width & Thickness";
            unit = "dp";
            min = 2;
            max = 40;
            defVal = 13;
            presets = new int[] { 4, 8, 13, 18, 24, 32, 40 };
            presetLabels = new String[] { "4dp (Thin)", "8dp", "13dp (Default)", "18dp", "24dp (Thick)", "32dp", "40dp (Max)" };
        } else if (GlideTrailPreferences.PREF_LENGTH_PTS.equals(key)) {
            title = "Trail Length & Retention";
            unit = "points";
            min = 5;
            max = 100;
            defVal = 20;
            presets = new int[] { 10, 20, 35, 50, 70, 100 };
            presetLabels = new String[] { "10 pts (Short)", "20 pts (Default)", "35 pts", "50 pts", "70 pts", "100 pts (Ribbon)" };
        } else {
            return;
        }

        int current = prefs.getInt(key, defVal);
        if (current < min) current = min;
        if (current > max) current = max;
        final int[] activeVal = new int[] { current };

        // Build Dialog UI
        ScrollView scrollView = new ScrollView(context);
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        int pad = dpToPx(context, 18);
        layout.setPadding(pad, pad, pad, pad);
        layout.setGravity(Gravity.CENTER_HORIZONTAL);
        scrollView.addView(layout);

        // 1. Live Numeric Value Display
        final TextView valText = new TextView(context);
        valText.setText(activeVal[0] + " " + unit);
        valText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 28);
        valText.setTypeface(null, Typeface.BOLD);
        valText.setTextColor(0xFF00E5FF);
        valText.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams valLp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        valLp.bottomMargin = dpToPx(context, 16);
        valText.setLayoutParams(valLp);
        layout.addView(valText);

        // 2. Smooth Continuous SeekBar
        final SeekBar seekBar = new SeekBar(context);
        seekBar.setMax(max - min);
        seekBar.setProgress(activeVal[0] - min);
        LinearLayout.LayoutParams seekLp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        seekLp.bottomMargin = dpToPx(context, 16);
        seekBar.setLayoutParams(seekLp);
        layout.addView(seekBar);

        // 3. Min/Max Labels Row
        LinearLayout rangeRow = new LinearLayout(context);
        rangeRow.setOrientation(LinearLayout.HORIZONTAL);
        TextView minLabel = new TextView(context);
        minLabel.setText(min + " " + unit);
        minLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        minLabel.setTextColor(0xFF888888);
        LinearLayout.LayoutParams leftLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        minLabel.setLayoutParams(leftLp);

        TextView maxLabel = new TextView(context);
        maxLabel.setText(max + " " + unit);
        maxLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        maxLabel.setTextColor(0xFF888888);
        maxLabel.setGravity(Gravity.RIGHT);
        LinearLayout.LayoutParams rightLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        maxLabel.setLayoutParams(rightLp);

        rangeRow.addView(minLabel);
        rangeRow.addView(maxLabel);
        layout.addView(rangeRow);

        // 4. Quick Presets
        TextView presetHeading = new TextView(context);
        presetHeading.setText("Quick presets:");
        presetHeading.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        presetHeading.setTextColor(0xFFAAAAAA);
        LinearLayout.LayoutParams phLp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        phLp.topMargin = dpToPx(context, 14);
        phLp.bottomMargin = dpToPx(context, 8);
        presetHeading.setLayoutParams(phLp);
        layout.addView(presetHeading);

        HorizontalScrollView presetScroll = new HorizontalScrollView(context);
        presetScroll.setHorizontalScrollBarEnabled(false);
        LinearLayout presetContainer = new LinearLayout(context);
        presetContainer.setOrientation(LinearLayout.HORIZONTAL);
        presetScroll.addView(presetContainer);

        for (int i = 0; i < presets.length; i++) {
            final int pVal = presets[i];
            final String pLabel = presetLabels[i];

            Button btn = new Button(context);
            btn.setText(pLabel);
            btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
            btn.setTextColor(Color.WHITE);
            GradientDrawable btnBg = new GradientDrawable();
            btnBg.setColor(0xFF2E333D);
            btnBg.setCornerRadius(dpToPx(context, 14));
            btnBg.setStroke(1, 0xFF4A5160);
            btn.setBackground(btnBg);
            int pPadH = dpToPx(context, 12);
            int pPadV = dpToPx(context, 4);
            btn.setPadding(pPadH, pPadV, pPadH, pPadV);

            LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, dpToPx(context, 34));
            btnLp.rightMargin = dpToPx(context, 8);
            btn.setLayoutParams(btnLp);

            btn.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    activeVal[0] = pVal;
                    seekBar.setProgress(pVal - min);
                    valText.setText(pVal + " " + unit);
                }
            });
            presetContainer.addView(btn);
        }
        layout.addView(presetScroll);

        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar sb, int progress, boolean fromUser) {
                int calc = min + progress;
                activeVal[0] = calc;
                valText.setText(calc + " " + unit);
            }
            @Override public void onStartTrackingTouch(SeekBar sb) {}
            @Override public void onStopTrackingTouch(SeekBar sb) {}
        });

        // Dialog Builder
        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        builder.setTitle(title);
        builder.setView(scrollView);

        builder.setPositiveButton("Apply", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                int finalVal = activeVal[0];
                GlideTrailPreferences.savePrefInt(context, key, finalVal);
                GlideTrailPreferences.setSummary(preference, "Current: " + finalVal + " " + unit + " (Tap to adjust)");
            }
        });

        builder.setNeutralButton("Reset to Default (" + defVal + unit + ")", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                GlideTrailPreferences.savePrefInt(context, key, defVal);
                GlideTrailPreferences.setSummary(preference, "Current: " + defVal + " " + unit + " (Tap to adjust)");
            }
        });

        builder.setNegativeButton("Cancel", null);

        AlertDialog dialog = builder.create();
        dialog.show();
    }

    private static int dpToPx(Context context, int dp) {
        DisplayMetrics dm = context.getResources().getDisplayMetrics();
        return Math.round(dp * dm.density);
    }
}
