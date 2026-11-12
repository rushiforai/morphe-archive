/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

public class DownloadedCheckTest {
    private static double luminance(int color) {
        double[] channels = {(color >> 16) & 0xFF, (color >> 8) & 0xFF, color & 0xFF};
        for (int index = 0; index < 3; index++) {
            double value = channels[index] / 255;
            channels[index] = value <= 0.03928 ? value / 12.92 : Math.pow((value + 0.055) / 1.055, 2.4);
        }
        return 0.2126 * channels[0] + 0.7152 * channels[1] + 0.0722 * channels[2];
    }

    private static double contrast(int foreground, int background) {
        double first = luminance(foreground);
        double second = luminance(background);
        return (Math.max(first, second) + 0.05) / (Math.min(first, second) + 0.05);
    }

    private static boolean isGreen(int color) {
        int red = (color >> 16) & 0xFF;
        int green = (color >> 8) & 0xFF;
        int blue = color & 0xFF;
        return green > red && green > blue;
    }

    @Test public void eachThemeGetsItsOwnGreen() {
        assertNotEquals(DownloadedCheck.color(true), DownloadedCheck.color(false));
        assertTrue(isGreen(DownloadedCheck.color(true)));
        assertTrue(isGreen(DownloadedCheck.color(false)));
        assertEquals(0xFF, DownloadedCheck.color(true) >>> 24);
        assertEquals(0xFF, DownloadedCheck.color(false) >>> 24);
    }

    @Test public void theCheckIsReadableOnItsBackground() {
        // WCAG asks 3:1 for graphics: the dark-theme green on black, the light-theme green on white.
        assertTrue(contrast(DownloadedCheck.color(true), 0xFF000000) >= 3);
        assertTrue(contrast(DownloadedCheck.color(false), 0xFFFFFFFF) >= 3);
    }
}
