/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-03.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class OfflineSubtitleStyleTest {
    @Test
    public void legacyFiveFieldsKeepAppearanceAndMigrateTransparentBackground() {
        OfflineSubtitleStyle style = OfflineSubtitleStyle.parse("2,1,2,0,0");
        assertEquals(2, style.size);
        assertEquals(1, style.colour);
        assertEquals(2, style.position);
        assertEquals(0, style.opacity);
        assertFalse(style.enabled);
        assertEquals("", style.language);
        assertEquals("2,1,2,0,0,,v2,50,0,#FFFFFF", style.encode());
    }

    @Test
    public void legacySixFieldsMigrateDimBackgroundAndKeepLanguage() {
        OfflineSubtitleStyle style = OfflineSubtitleStyle.parse("1,3,0,1,1,es-419");
        assertEquals(60, style.opacity);
        assertEquals(3, style.colour);
        assertTrue(style.enabled);
        assertEquals("es-419", style.language);
        assertEquals("1,3,0,60,1,es-419,v2,50,0,#FFFFFF", style.encode());
        assertEquals(style.encode(), OfflineSubtitleStyle.parse(style.encode()).encode());
    }

    @Test
    public void newFieldsRoundTripCustomPositionOpaqueRgbAndFont() {
        OfflineSubtitleStyle style = OfflineSubtitleStyle.parse("3,4,3,30,1,fr,v2,75,6,#12ab34");
        assertEquals(3, style.size);
        assertEquals(4, style.colour);
        assertEquals(3, style.position);
        assertEquals(30, style.opacity);
        assertEquals(75, style.verticalPercent);
        assertEquals(6, style.font);
        assertEquals(0xFF12AB34, style.customColour);
        assertEquals("3,4,3,30,1,fr,v2,75,6,#12AB34", style.encode());
        assertEquals(style.encode(), OfflineSubtitleStyle.parse(style.encode()).encode());
    }

    @Test
    public void malformedFieldsFallBackIndependentlyWithoutDiscardingValidLaterFields() {
        OfflineSubtitleStyle style = OfflineSubtitleStyle.parse("bad,2,no,101,0,fr,v2,25,4,#0088cc");
        assertEquals(1, style.size);
        assertEquals(2, style.colour);
        assertEquals(0, style.position);
        assertEquals(60, style.opacity);
        assertFalse(style.enabled);
        assertEquals("fr", style.language);
        assertEquals(25, style.verticalPercent);
        assertEquals(4, style.font);
        assertEquals(0xFF0088CC, style.customColour);
    }

    @Test
    public void outOfRangeFieldsAndBadColoursUseDefaults() {
        OfflineSubtitleStyle style = OfflineSubtitleStyle.parse("-1,5,4,-5,no,invalid language,v2,101,7,#nothex");
        assertEquals("1,0,0,60,1,,v2,50,0,#FFFFFF", style.encode());
        assertEquals("1,0,0,60,1,,v2,50,0,#FFFFFF", OfflineSubtitleStyle.parse(null).encode());
        assertEquals("1,0,0,60,1,,v2,50,0,#FFFFFF", OfflineSubtitleStyle.parse("").encode());
    }

    @Test
    public void truncatedNewValuesAndLegacyInvalidBackgroundDoNotThrow() {
        assertEquals("2,0,0,60,1,,v2,50,0,#FFFFFF", OfflineSubtitleStyle.parse("2").encode());
        assertEquals("1,0,0,60,1,,v2,50,0,#FFFFFF", OfflineSubtitleStyle.parse("1,0,0,9,1").encode());
        assertEquals("1,4,3,35,1,en,v2,50,0,#FFFFFF",
                OfflineSubtitleStyle.parse("1,4,3,33,1,en,v2").encode());
    }

    @Test
    public void opacityIsFivePercentStepsWithExactTransparentAndOpaqueEnds() {
        assertEquals(0, OfflineSubtitleStyle.opacityAlpha(0));
        assertEquals(77, OfflineSubtitleStyle.opacityAlpha(30));
        assertEquals(153, OfflineSubtitleStyle.opacityAlpha(60));
        assertEquals(255, OfflineSubtitleStyle.opacityAlpha(100));
        assertEquals(0, OfflineSubtitleStyle.opacityAlpha(-1));
        assertEquals(255, OfflineSubtitleStyle.opacityAlpha(101));
        assertEquals(0, OfflineSubtitleStyle.opacityStep(2));
        assertEquals(5, OfflineSubtitleStyle.opacityStep(3));
        assertEquals(60, OfflineSubtitleStyle.opacityStep(61));
        assertEquals(100, OfflineSubtitleStyle.opacityStep(120));
    }

    @Test
    public void percentagePlacesTheBoxCentreAndClampsBothEdges() {
        assertEquals(0, OfflineSubtitleStyle.verticalOffset(1000, 100, 0));
        assertEquals(200, OfflineSubtitleStyle.verticalOffset(1000, 100, 25));
        assertEquals(450, OfflineSubtitleStyle.verticalOffset(1000, 100, 50));
        assertEquals(700, OfflineSubtitleStyle.verticalOffset(1000, 100, 75));
        assertEquals(900, OfflineSubtitleStyle.verticalOffset(1000, 100, 100));
        assertEquals(0, OfflineSubtitleStyle.verticalOffset(1000, 100, -20));
        assertEquals(900, OfflineSubtitleStyle.verticalOffset(1000, 100, 120));
        assertEquals(0, OfflineSubtitleStyle.verticalOffset(0, 100, 50));
    }

    @Test
    public void clampingWorksAcrossOrientationsAndDifferentMeasuredBoxHeights() {
        for (int height : new int[]{240, 720, 1920}) {
            for (int box : new int[]{0, 32, 101, 5000}) {
                int maximum = height - Math.min(height, box);
                assertEquals(0, OfflineSubtitleStyle.verticalOffset(height, box, 0));
                assertEquals(maximum, OfflineSubtitleStyle.verticalOffset(height, box, 100));
                for (int percent : new int[]{0, 25, 50, 75, 100}) {
                    int offset = OfflineSubtitleStyle.verticalOffset(height, box, percent);
                    assertTrue(offset >= 0);
                    assertTrue(offset <= maximum);
                }
            }
        }
    }

    @Test
    public void widthLimitAndPaddingScaleWithTheActualTextPixelsInAllSizes() {
        assertEquals(972, OfflineSubtitleStyle.maxWidth(1080));
        assertEquals(1728, OfflineSubtitleStyle.maxWidth(1920));
        assertEquals(0, OfflineSubtitleStyle.maxWidth(0));
        int[] sizes = {16, 20, 26, 32};
        int[] horizontal = {8, 10, 13, 16};
        int[] vertical = {3, 4, 5, 6};
        for (int index = 0; index < sizes.length; index++) {
            assertEquals(sizes[index], OfflineSubtitleStyle.sizeSp(index));
            assertEquals(horizontal[index], OfflineSubtitleStyle.horizontalPadding(sizes[index]));
            assertEquals(vertical[index], OfflineSubtitleStyle.verticalPadding(sizes[index]));
        }
        assertEquals(20, OfflineSubtitleStyle.horizontalPadding(40));
        assertEquals(8, OfflineSubtitleStyle.verticalPadding(40));
        assertEquals(222, OfflineSubtitleStyle.boxWidth(201.2f, 10, 972));
        assertEquals(972, OfflineSubtitleStyle.boxWidth(2000, 10, 972));
        assertEquals(80, OfflineSubtitleStyle.boxWidth(80, 0, 972));
        assertEquals(16, OfflineSubtitleStyle.boxWidth(0, 8, 972));
    }

    @Test
    public void colourHexRoundTripsAndNeverRetainsTextTransparency() {
        assertEquals("#00ABCD", OfflineSubtitleStyle.colourHex(0xFF00ABCD));
        assertEquals(0xFF00ABCD, OfflineSubtitleStyle.parseColour("#00abcd", 0));
        assertEquals(0xFF123456, OfflineSubtitleStyle.parseColour("#00123456", 0));
        assertEquals(0xFF112233, OfflineSubtitleStyle.parseColour("#-FFFFF", 0xFF112233));
        assertEquals(0xFF112233, OfflineSubtitleStyle.parseColour("#12345", 0xFF112233));
        assertEquals(0xFF112233, OfflineSubtitleStyle.parseColour(null, 0xFF112233));
        for (int colour : new int[]{0xFF000000, 0xFFFFFFFF, 0xFF123456, 0xFF00FF80}) {
            assertEquals(colour, OfflineSubtitleStyle.parseColour(OfflineSubtitleStyle.colourHex(colour), 0));
        }
    }
}
