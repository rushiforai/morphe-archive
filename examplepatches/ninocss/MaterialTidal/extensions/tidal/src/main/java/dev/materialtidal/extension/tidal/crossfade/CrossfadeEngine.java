package dev.materialtidal.extension.tidal.crossfade;

import java.util.Locale;

/**
 * Pure-Java crossfade audio gain math, gapless-album state tracking, and DE/EN UI copy helpers.
 */
@SuppressWarnings("unused")
public final class CrossfadeEngine {

    private static volatile String sameAlbumNextTrackId = null;

    private CrossfadeEngine() {
    }

    public static float clampProgress(float progress) {
        if (Float.isNaN(progress) || progress <= 0f) {
            return 0f;
        }
        if (progress >= 1f) {
            return 1f;
        }
        return progress;
    }

    public static float clampTargetVolume(float targetVolume) {
        if (Float.isNaN(targetVolume) || targetVolume <= 0f) {
            return 0f;
        }
        if (targetVolume >= 1f) {
            return 1f;
        }
        return targetVolume;
    }

    public static float computeFadeOutGain(float progress, float targetVolume) {
        return computeFadeOutGain(
                progress,
                targetVolume,
                CrossfadePrefs.getCurveType(),
                CrossfadePrefs.getStrengthPercent()
        );
    }

    public static float computeFadeInGain(float progress, float targetVolume) {
        return computeFadeInGain(
                progress,
                targetVolume,
                CrossfadePrefs.getCurveType(),
                CrossfadePrefs.getStrengthPercent()
        );
    }

    public static float computeFadeOutGain(
            float progress,
            float targetVolume,
            int curveType,
            int strengthPercent
    ) {
        float t = clampProgress(progress);
        float target = clampTargetVolume(targetVolume);
        if (t <= 0f) {
            return target;
        }
        if (t >= 1f) {
            return 0f;
        }
        double base = computeBaseFadeOut(t, curveType);
        double shaped = applyStrength(base, strengthPercent);
        return (float) (shaped * target);
    }

    public static float computeFadeInGain(
            float progress,
            float targetVolume,
            int curveType,
            int strengthPercent
    ) {
        float t = clampProgress(progress);
        float target = clampTargetVolume(targetVolume);
        if (t <= 0f) {
            return 0f;
        }
        if (t >= 1f) {
            return target;
        }
        double base = computeBaseFadeIn(t, curveType);
        double shaped = applyStrength(base, strengthPercent);
        return (float) (shaped * target);
    }

    private static double computeBaseFadeOut(double t, int curveType) {
        switch (CrossfadePrefs.clampCurve(curveType)) {
            case CrossfadeConfig.CURVE_SMOOTH_S: {
                double s = t * t * (3.0 - 2.0 * t);
                return 1.0 - s;
            }
            case CrossfadeConfig.CURVE_SOFT_DIP:
                return Math.pow(Math.max(0.0, 1.0 - t), 1.8);
            case CrossfadeConfig.CURVE_DJ_BLEND:
                return 1.0 - smoothstep(0.35, 1.0, t);
            case CrossfadeConfig.CURVE_EQUAL_POWER:
            default:
                return Math.cos(t * (Math.PI * 0.5));
        }
    }

    private static double computeBaseFadeIn(double t, int curveType) {
        switch (CrossfadePrefs.clampCurve(curveType)) {
            case CrossfadeConfig.CURVE_SMOOTH_S:
                return t * t * (3.0 - 2.0 * t);
            case CrossfadeConfig.CURVE_SOFT_DIP:
                return Math.pow(Math.max(0.0, t), 1.8);
            case CrossfadeConfig.CURVE_DJ_BLEND:
                return smoothstep(0.0, 0.55, t);
            case CrossfadeConfig.CURVE_EQUAL_POWER:
            default:
                return Math.sin(t * (Math.PI * 0.5));
        }
    }

    private static double smoothstep(double edge0, double edge1, double x) {
        if (edge1 <= edge0) {
            return x >= edge1 ? 1.0 : 0.0;
        }
        double u = (x - edge0) / (edge1 - edge0);
        if (u <= 0.0) {
            return 0.0;
        }
        if (u >= 1.0) {
            return 1.0;
        }
        return u * u * (3.0 - 2.0 * u);
    }

    private static double applyStrength(double baseGain, int strengthPercent) {
        if (baseGain <= 0.0) {
            return 0.0;
        }
        if (baseGain >= 1.0) {
            return 1.0;
        }
        double s = CrossfadePrefs.clampStrength(strengthPercent) / 100.0;
        double gamma = Math.pow(2.0, (0.5 - s) * 1.6);
        double out = Math.pow(baseGain, gamma);
        if (out <= 0.0) {
            return 0.0;
        }
        if (out >= 1.0) {
            return 1.0;
        }
        return out;
    }

    public static void setSameAlbumNextTrackId(String trackId) {
        sameAlbumNextTrackId = trackId;
    }

    public static String getSameAlbumNextTrackId() {
        return sameAlbumNextTrackId;
    }

    public static boolean shouldSkipForGaplessAlbum(String nextTrackId) {
        if (!CrossfadePrefs.isPreserveGaplessAlbums()) {
            return false;
        }
        String matched = sameAlbumNextTrackId;
        return nextTrackId != null && matched != null && nextTrackId.equals(matched);
    }

    public static boolean isGermanLocale() {
        try {
            String lang = Locale.getDefault().getLanguage();
            return lang != null && lang.toLowerCase(Locale.ROOT).startsWith("de");
        } catch (Throwable t) {
            return false;
        }
    }

    public static String getCurveDisplayName(int curveType) {
        boolean de = isGermanLocale();
        switch (CrossfadePrefs.clampCurve(curveType)) {
            case CrossfadeConfig.CURVE_SMOOTH_S:
                return de ? "Sanfte S-Kurve" : "Smooth S-Curve";
            case CrossfadeConfig.CURVE_SOFT_DIP:
                return de ? "Weicher Dip" : "Soft Dip";
            case CrossfadeConfig.CURVE_DJ_BLEND:
                return "DJ Blend";
            case CrossfadeConfig.CURVE_EQUAL_POWER:
            default:
                return "Equal Power";
        }
    }

    public static String getCurveShortSubtitle(int curveType) {
        boolean de = isGermanLocale();
        switch (CrossfadePrefs.clampCurve(curveType)) {
            case CrossfadeConfig.CURVE_SMOOTH_S:
                return de ? "Ausgewogen" : "Balanced";
            case CrossfadeConfig.CURVE_SOFT_DIP:
                return de ? "Dezenter Ausklang" : "Gentle fade";
            case CrossfadeConfig.CURVE_DJ_BLEND:
                return de ? "Starker Mix" : "Strong overlap";
            case CrossfadeConfig.CURVE_EQUAL_POWER:
            default:
                return de ? "Konstante Lautstärke" : "Constant loudness";
        }
    }

    public static String getStrengthDescriptor(int strengthPercent) {
        int s = CrossfadePrefs.clampStrength(strengthPercent);
        boolean de = isGermanLocale();
        if (s < 35) {
            return de ? "Sanft" : "Gentle";
        }
        if (s <= 65) {
            return de ? "Ausgewogen" : "Balanced";
        }
        return de ? "Kräftig" : "Strong";
    }

    public static String getSettingsRowTitle() {
        return isGermanLocale() ? "Übergangsstil & Stärke" : "Crossfade style & curve";
    }

    public static String getSettingsRowSubtitle() {
        boolean de = isGermanLocale();
        String curveName = getCurveDisplayName(CrossfadePrefs.getCurveType());
        int strength = CrossfadePrefs.getStrengthPercent();
        boolean gapless = CrossfadePrefs.isPreserveGaplessAlbums();
        if (de) {
            return gapless
                    ? curveName + " · Stärke " + strength + "% · Alben nahtlos"
                    : curveName + " · Stärke " + strength + "%";
        }
        return gapless
                ? curveName + " · Strength " + strength + "% · Gapless albums"
                : curveName + " · Strength " + strength + "%";
    }

    public static String getDurationBadgeText(int seconds) {
        if (seconds <= 0) {
            return isGermanLocale() ? "Aus" : "Off";
        }
        return seconds + " s";
    }

    public static String getPlayerContextMenuTitle(int seconds) {
        if (seconds <= 0) {
            return isGermanLocale() ? "Crossfade · Aus" : "Crossfade · Off";
        }
        return "Crossfade · " + seconds + " s";
    }
}
