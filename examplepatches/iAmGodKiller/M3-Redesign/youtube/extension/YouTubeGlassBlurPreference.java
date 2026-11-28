package app.morphe.extension.youtube.patches.fullscreen;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Configuration;
import android.graphics.Color;
import android.preference.Preference;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

/**
 * Self-contained Android Preference shown inside Morphe Settings -> Navigation that lets the user
 * adjust the blur radius (in dp) of YouTube's glass navigation bar live.
 */
@SuppressWarnings({"unused", "deprecation"})
public class YouTubeGlassBlurPreference extends Preference {

    private static final int MAX_BLUR_DP = 60;

    public YouTubeGlassBlurPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public YouTubeGlassBlurPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public YouTubeGlassBlurPreference(Context context) {
        super(context);
        init();
    }

    private void init() {
        setTitle("Glass navigation bar blur");
        updateSummary();
    }

    @Override
    protected void onAttachedToActivity() {
        super.onAttachedToActivity();
        updateSummary();
    }

    private void updateSummary() {
        Context ctx = getContext();
        if (ctx == null) {
            return;
        }
        int blurDp = YouTubeFullscreenFilter.getGlassBlurDp(ctx);
        boolean hideShadow = YouTubeFullscreenFilter.isHideGlassShadow(ctx);
        String blurPart;
        if (blurDp < 0) {
            blurPart = "App default";
        } else if (blurDp == 0) {
            blurPart = "0 dp (Off — clear glass)";
        } else {
            blurPart = blurDp + " dp";
        }
        setSummary(hideShadow ? (blurPart + " · Clean edge") : blurPart);
    }

    @Override
    protected void onClick() {
        final Context ctx = getContext();
        if (ctx == null) {
            return;
        }

        final int savedDp = YouTubeFullscreenFilter.getGlassBlurDp(ctx);
        final boolean savedHideShadow = YouTubeFullscreenFilter.isHideGlassShadow(ctx);
        final int initialSliderDp = savedDp >= 0
                ? clamp(savedDp, 0, MAX_BLUR_DP)
                : clamp(YouTubeFullscreenFilter.getDetectedDefaultBlurDp(ctx), 0, MAX_BLUR_DP);

        final boolean dark = isDarkTheme(ctx);
        final int primaryTextColor = dark ? Color.WHITE : 0xFF0F0F0F;
        final int secondaryTextColor = dark ? 0xFFB0B0B0 : 0xFF606060;
        final float density = ctx.getResources().getDisplayMetrics().density;

        LinearLayout container = new LinearLayout(ctx);
        container.setOrientation(LinearLayout.VERTICAL);
        int padH = Math.round(24f * density);
        int padV = Math.round(16f * density);
        container.setPadding(padH, padV, padH, Math.round(8f * density));

        final TextView valueLabel = new TextView(ctx);
        valueLabel.setTextColor(primaryTextColor);
        valueLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        valueLabel.setGravity(Gravity.CENTER_HORIZONTAL);
        valueLabel.setText(formatSliderLabel(initialSliderDp, savedDp < 0));
        container.addView(valueLabel);

        final SeekBar seekBar = new SeekBar(ctx);
        seekBar.setMax(MAX_BLUR_DP);
        seekBar.setProgress(initialSliderDp);
        LinearLayout.LayoutParams sbLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        sbLp.topMargin = Math.round(16f * density);
        sbLp.bottomMargin = Math.round(10f * density);
        seekBar.setLayoutParams(sbLp);
        container.addView(seekBar);

        TextView hint = new TextView(ctx);
        hint.setTextColor(secondaryTextColor);
        hint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        hint.setText("0 dp disables blur for clear glass. Higher values increase frosted glass blur strength.");
        container.addView(hint);

        final CheckBox hideShadowCheck = new CheckBox(ctx);
        hideShadowCheck.setText("Hide capsule shadow & hair-like edge");
        hideShadowCheck.setTextColor(primaryTextColor);
        hideShadowCheck.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        hideShadowCheck.setChecked(savedHideShadow);
        LinearLayout.LayoutParams cbLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        cbLp.topMargin = Math.round(14f * density);
        hideShadowCheck.setLayoutParams(cbLp);
        container.addView(hideShadowCheck);

        final boolean[] userMovedSlider = {savedDp >= 0};
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                if (fromUser) {
                    userMovedSlider[0] = true;
                }
                valueLabel.setText(formatSliderLabel(progress, !userMovedSlider[0]));
            }

            @Override
            public void onStartTrackingTouch(SeekBar bar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar bar) {
            }
        });

        try {
            AlertDialog.Builder builder = new AlertDialog.Builder(ctx);
            builder.setTitle("Glass navigation bar blur");
            builder.setView(container);
            builder.setPositiveButton("Apply", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    int chosenBlur = userMovedSlider[0] ? seekBar.getProgress() : savedDp;
                    boolean hideShadow = hideShadowCheck.isChecked();
                    YouTubeFullscreenFilter.setGlassAppearance(ctx, chosenBlur, hideShadow);
                    updateSummary();
                }
            });
            builder.setNeutralButton("Reset", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    YouTubeFullscreenFilter.setGlassAppearance(ctx, -1, false);
                    updateSummary();
                }
            });
            builder.setNegativeButton("Cancel", null);
            builder.show();
        } catch (Throwable ignored) {
        }
    }

    private static String formatSliderLabel(int dp, boolean isDefault) {
        if (isDefault) {
            return "App default (~" + dp + " dp)";
        }
        if (dp == 0) {
            return "Blur radius: 0 dp (Off)";
        }
        return "Blur radius: " + dp + " dp";
    }

    private static boolean isDarkTheme(Context ctx) {
        int mode = ctx.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
