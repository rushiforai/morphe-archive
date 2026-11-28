package com.waze.gw;

import android.content.Context;
import android.graphics.Typeface;
import android.widget.TextView;

/** Shared typography for numeric values drawn by the mod UI. */
final class ModTypeface {
    private static final String SPEED_FONT = "gw_fonts/TGL_0-1451Eng.ttf";
    private static final String BRAND_FONT = "gw_fonts/Anta-Regular.ttf";
    private static final String GAUGE_FONT = "gw_fonts/JetBrains_Mono/static/JetBrainsMono-Bold.ttf";
    private static volatile Typeface speed;
    private static volatile Typeface brand;
    private static volatile Typeface gauge;
    private static volatile boolean attempted;
    private static volatile boolean brandAttempted;
    private static volatile boolean gaugeAttempted;

    private ModTypeface() { }

    static void applySpeed(TextView view) {
        if (view == null) return;
        Typeface custom = speed(view.getContext());
        view.setTypeface(custom != null ? custom : Typeface.DEFAULT_BOLD);
        view.setIncludeFontPadding(false);
        // Engschrift is deliberately condensed; open it for small HUD/bubble sizes.
        view.setTextScaleX(1.16f);
    }

    /** Current-speed and minimum-limit numerals: the same JetBrains Mono face as the distance gauge. */
    static void applyGauge(TextView view) {
        if (view == null) return;
        view.setTypeface(gauge(view.getContext()));
        view.setIncludeFontPadding(false);
        view.setTextScaleX(1f);
    }

    /** Anta is reserved for the compact WAZE MOD identity tab. */
    static void applyBrand(TextView view) {
        if (view == null) return;
        Typeface custom = brand(view.getContext());
        view.setTypeface(custom != null ? custom : Typeface.DEFAULT_BOLD);
        view.setIncludeFontPadding(false);
    }

    /** Use more of the available face while keeping three-digit values clear of the rim. */
    static void fitSpeed(TextView view, int value, float shortSp, float threeDigitSp) {
        if (view == null) return;
        float targetSp = value >= 100 ? threeDigitSp : shortSp;
        float targetPx = targetSp * view.getResources().getDisplayMetrics().scaledDensity;
        if (Math.abs(view.getTextSize() - targetPx) > 0.5f)
            view.setTextSize(targetSp);
    }

    /** Shared with Canvas-based renderers such as the Android Auto overlay. */
    static Typeface speed(Context context) {
        if (context == null) return null;
        if (!attempted) {
            synchronized (ModTypeface.class) {
                if (!attempted) {
                    try {
                        speed = Typeface.createFromAsset(context.getAssets(), SPEED_FONT);
                    } catch (Throwable ignored) { }
                    attempted = true;
                }
            }
        }
        return speed;
    }

    /** Digits of the following-distance gauge; falls back to the system bold face if the asset is missing. */
    static Typeface gauge(Context context) {
        if (context == null) return Typeface.DEFAULT_BOLD;
        if (!gaugeAttempted) {
            synchronized (ModTypeface.class) {
                if (!gaugeAttempted) {
                    try {
                        gauge = Typeface.createFromAsset(context.getAssets(), GAUGE_FONT);
                    } catch (Throwable ignored) { }
                    gaugeAttempted = true;
                }
            }
        }
        return gauge != null ? gauge : Typeface.DEFAULT_BOLD;
    }

    private static Typeface brand(Context context) {
        if (context == null) return null;
        if (!brandAttempted) {
            synchronized (ModTypeface.class) {
                if (!brandAttempted) {
                    try {
                        brand = Typeface.createFromAsset(context.getAssets(), BRAND_FONT);
                    } catch (Throwable ignored) { }
                    brandAttempted = true;
                }
            }
        }
        return brand;
    }
}
