/*
* Copyright 2026 De-Vanced
* Copyright 2026 Hushfacebook contributors
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*
* Palette maths adapted from Hushfacebook (GPL-3.0).
* [https://github.com/SysAdminDoc/HushFacebook/blob/aa6cb7c4d904b3fbf1da07809231e97b151705fb/extensions/facebook/src/main/java/app/morphe/extension/facebook/theme/TonePalette.java](https://github.com/SysAdminDoc/HushFacebook/blob/aa6cb7c4d904b3fbf1da07809231e97b151705fb/extensions/facebook/src/main/java/app/morphe/extension/facebook/theme/TonePalette.java)
*/

package app.morphe.extension.facebook.theme;

import android.content.Context;
import android.os.Build;

import java.util.Arrays;

public final class TonePalette {
    public static final int ACCENT = 0;
    public static final int NEUTRAL = 1;
    public static final int NEUTRAL_VARIANT = 2;

    public static final int[] TONES = {
            0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 95, 99, 100
    };

    static final String FALLBACK =
            "000000 00184A 192E60 324578 4A5C92 6375AC 7C8FC8 97AAE4 B3C5FF DBE1FF EEF0FF FEFBFF FFFFFF;"
                    + "000000 1A1B21 2F3036 46464C 5D5E64 76767D 909097 ABAAB1 C6C6CD E3E2E9 F1F0F7 FEFBFF FFFFFF;"
                    + "000000 191B23 2E3038 45464F 5C5E67 757680 8F909A AAAAB4 C5C6D0 E2E2EC F0F0FA FEFBFF FFFFFF";

    private static final int STEPS = 1000;
    private static final double[] LINEAR = new double[256];

    static {
        for (int index = 0; index < 256; index++) {
            double channel = index / 255.0;
            LINEAR[index] = channel <= 0.04045
                    ? channel / 12.92
                    : Math.pow((channel + 0.055) / 1.055, 2.4);
        }
    }

    private static final double XN = 0.95047;
    private static final double ZN = 1.08883;

    private final int[][] tones;
    public final boolean dynamic;
    private volatile int[][] byLightness;

    TonePalette(int[][] tones, boolean dynamic) {
        if (tones.length != 3) {
            throw new IllegalArgumentException("three families, not " + tones.length);
        }
        for (int[] family : tones) {
            if (family.length != TONES.length) {
                throw new IllegalArgumentException("a family has " + family.length + " tones");
            }
        }
        this.tones = new int[3][];
        for (int family = 0; family < 3; family++) {
            this.tones[family] = new int[TONES.length];
            for (int index = 0; index < TONES.length; index++) {
                this.tones[family][index] = tones[family][index] | 0xff000000;
            }
        }
        this.dynamic = dynamic;
    }

    public static TonePalette fallback() {
        String[] families = FALLBACK.split(";");
        int[][] values = new int[3][TONES.length];
        for (int family = 0; family < 3; family++) {
            String[] hex = families[family].trim().split(" ");
            for (int index = 0; index < TONES.length; index++) {
                values[family][index] = 0xff000000 | Integer.parseInt(hex[index], 16);
            }
        }
        return new TonePalette(values, false);
    }

    public static TonePalette of(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            try {
                return system(context);
            } catch (RuntimeException unreadable) {
                return fallback();
            }
        }
        return fallback();
    }

    private static TonePalette system(Context context) {
        int[][] ids = {
                {
                        android.R.color.system_accent1_1000,
                        android.R.color.system_accent1_900,
                        android.R.color.system_accent1_800,
                        android.R.color.system_accent1_700,
                        android.R.color.system_accent1_600,
                        android.R.color.system_accent1_500,
                        android.R.color.system_accent1_400,
                        android.R.color.system_accent1_300,
                        android.R.color.system_accent1_200,
                        android.R.color.system_accent1_100,
                        android.R.color.system_accent1_50,
                        android.R.color.system_accent1_10,
                        android.R.color.system_accent1_0
                },
                {
                        android.R.color.system_neutral1_1000,
                        android.R.color.system_neutral1_900,
                        android.R.color.system_neutral1_800,
                        android.R.color.system_neutral1_700,
                        android.R.color.system_neutral1_600,
                        android.R.color.system_neutral1_500,
                        android.R.color.system_neutral1_400,
                        android.R.color.system_neutral1_300,
                        android.R.color.system_neutral1_200,
                        android.R.color.system_neutral1_100,
                        android.R.color.system_neutral1_50,
                        android.R.color.system_neutral1_10,
                        android.R.color.system_neutral1_0
                },
                {
                        android.R.color.system_neutral2_1000,
                        android.R.color.system_neutral2_900,
                        android.R.color.system_neutral2_800,
                        android.R.color.system_neutral2_700,
                        android.R.color.system_neutral2_600,
                        android.R.color.system_neutral2_500,
                        android.R.color.system_neutral2_400,
                        android.R.color.system_neutral2_300,
                        android.R.color.system_neutral2_200,
                        android.R.color.system_neutral2_100,
                        android.R.color.system_neutral2_50,
                        android.R.color.system_neutral2_10,
                        android.R.color.system_neutral2_0
                }
        };
        int[][] values = new int[3][TONES.length];
        for (int family = 0; family < 3; family++) {
            for (int index = 0; index < TONES.length; index++) {
                values[family][index] = context.getColor(ids[family][index]);
            }
        }
        return new TonePalette(values, true);
    }

    public int tone(int family, int tone) {
        for (int index = 0; index < TONES.length; index++) {
            if (TONES[index] == tone) {
                return tones[family][index];
            }
        }
        throw new IllegalArgumentException("no tone " + tone);
    }

    public int sameLightness(int family, int color) {
        int[][] tables = byLightness;
        if (tables == null) {
            tables = buildTables();
        }
        int step = (int) Math.round(lstar(color) * (STEPS / 100.0));
        if (step < 0) {
            step = 0;
        }
        if (step > STEPS) {
            step = STEPS;
        }
        return (color & 0xff000000) | (tables[family][step] & 0x00ffffff);
    }

    private synchronized int[][] buildTables() {
        if (byLightness != null) {
            return byLightness;
        }
        int[][] tables = new int[3][STEPS + 1];
        for (int family = 0; family < 3; family++) {
            double[][] labs = new double[TONES.length][];
            for (int index = 0; index < TONES.length; index++) {
                labs[index] = lab(tones[family][index]);
            }
            Arrays.sort(labs, (left, right) -> Double.compare(left[0], right[0]));
            int cursor = 0;
            for (int step = 0; step <= STEPS; step++) {
                double light = step * (100.0 / STEPS);
                while (cursor < labs.length - 2 && light > labs[cursor + 1][0]) {
                    cursor++;
                }
                double[] low = labs[cursor];
                double[] high = labs[cursor + 1];
                double span = high[0] - low[0];
                double weight = span <= 0
                        ? 0
                        : Math.max(0, Math.min(1, (light - low[0]) / span));
                tables[family][step] = fromLab(
                        light,
                        low[1] + (high[1] - low[1]) * weight,
                        low[2] + (high[2] - low[2]) * weight
                );
            }
        }
        byLightness = tables;
        return tables;
    }

    public static double lstar(int color) {
        return yToLstar(luminance(color));
    }

    public static double luminance(int color) {
        return 0.2126 * LINEAR[(color >> 16) & 0xff]
                + 0.7152 * LINEAR[(color >> 8) & 0xff]
                + 0.0722 * LINEAR[color & 0xff];
    }

    private static double yToLstar(double y) {
        return y <= 216.0 / 24389.0
                ? y * 24389.0 / 27.0
                : 116.0 * Math.cbrt(y) - 16.0;
    }

    private static double[] lab(int color) {
        double red = LINEAR[(color >> 16) & 0xff];
        double green = LINEAR[(color >> 8) & 0xff];
        double blue = LINEAR[color & 0xff];
        double x = (0.4124 * red + 0.3576 * green + 0.1805 * blue) / XN;
        double y = 0.2126 * red + 0.7152 * green + 0.0722 * blue;
        double z = (0.0193 * red + 0.1192 * green + 0.9505 * blue) / ZN;
        double fx = labF(x);
        double fy = labF(y);
        double fz = labF(z);
        return new double[]{116 * fy - 16, 500 * (fx - fy), 200 * (fy - fz)};
    }

    private static double labF(double value) {
        return value > 216.0 / 24389.0
                ? Math.cbrt(value)
                : (24389.0 / 27.0 * value + 16) / 116;
    }

    private static double labInverse(double value) {
        double cube = value * value * value;
        return cube > 216.0 / 24389.0
                ? cube
                : (116 * value - 16) * 27.0 / 24389.0;
    }

    private static int fromLab(double light, double a, double b) {
        double fy = (light + 16) / 116;
        double x = labInverse(fy + a / 500) * XN;
        double y = labInverse(fy);
        double z = labInverse(fy - b / 200) * ZN;
        double red = 3.2406 * x - 1.5372 * y - 0.4986 * z;
        double green = -0.9689 * x + 1.8758 * y + 0.0415 * z;
        double blue = 0.0557 * x - 0.2040 * y + 1.0570 * z;
        return 0xff000000
                | (channel(red) << 16)
                | (channel(green) << 8)
                | channel(blue);
    }

    private static int channel(double linear) {
        double channel = linear <= 0.0031308
                ? 12.92 * linear
                : 1.055 * Math.pow(linear, 1 / 2.4) - 0.055;
        return (int) Math.round(Math.max(0, Math.min(1, channel)) * 255);
    }
}
