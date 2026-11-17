/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-16.
 */
package app.morphe.extension.youtube.patches.components;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;

import org.junit.Test;

import app.morphe.extension.shared.patches.components.ByteArrayFilterGroup;

public class PlayerFlyoutMenuFilterTest {
    private static byte[] hex(String value) {
        byte[] bytes = new byte[value.length() / 2];
        for (int index = 0; index < bytes.length; index++) {
            bytes[index] = (byte) Integer.parseInt(value.substring(index * 2, index * 2 + 2), 16);
        }
        return bytes;
    }

    @Test
    public void recognizesActualNumericSourcesInsteadOfDrawableNames() {
        // Actual Android next response source messages, shared by the 21.x clients.
        int[] icons = {89, 231, 173, 292, 181, 125, 314, 20, 444, 564, 737, 676, 677};
        String[] sources = {
                "0a093207d23e040a020859", "0a0a3208d23e050a0308e701", "0a0a3208d23e050a0308ad01",
                "0a0a3208d23e050a0308a402", "0a0a3208d23e050a0308b501", "0a093207d23e040a02087d",
                "0a0a3208d23e050a0308ba02", "0a093207d23e040a020814", "0a0a3208d23e050a0308bc03",
                "0a0a3208d23e050a0308b404", "0a0a3208d23e050a0308e105", "0a0a3208d23e050a0308a405",
                "0a0a3208d23e050a0308a505"
        };

        for (int index = 0; index < icons.length; index++) {
            ByteArrayFilterGroup group = PlayerFlyoutMenuFilter.menuItemGroup(null, new int[]{icons[index]});
            for (int other = 0; other < icons.length; other++) {
                boolean matches = group.check(hex(sources[other])).isFiltered();
                assertTrue("icon " + icons[index] + " versus " + icons[other], matches == (index == other));
            }
        }
    }

    @Test
    public void recognizesSleepTimerWithoutEnglishTitleOrPremiumSelector() {
        // DEX YTICON enum: SLEEP_TIMER outline=331, fill=305. Not Premium feature selector values.
        ByteArrayFilterGroup group = PlayerFlyoutMenuFilter.menuItemGroup(null, new int[]{331, 305},
                "yt_outline_experimental_sleep_timer_", "sleep_timer_sheet_content.e");

        assertTrue(group.check(hex("0a0a3208d23e050a0308cb02")).isFiltered());
        assertTrue(group.check(hex("0a0a3208d23e050a0308b102")).isFiltered());
        assertTrue(group.check("sleep_timer_sheet_content.eml-js|hash".getBytes(StandardCharsets.UTF_8)).isFiltered());
        assertFalse(group.check("premium_upsell igkCCA8%3D".getBytes(StandardCharsets.UTF_8)).isFiltered());
        assertFalse(group.check("premium_upsell igkCCAg%3D".getBytes(StandardCharsets.UTF_8)).isFiltered());
        assertFalse(group.check("Sleep timer Premium".getBytes(StandardCharsets.UTF_8)).isFiltered());
    }

    @Test
    public void preservesLegacyResourceNameAlternativesAndMultipleIcons() {
        ByteArrayFilterGroup group = PlayerFlyoutMenuFilter.menuItemGroup(null, new int[]{314, 20},
                "closed_caption_", "closed_captions_");

        assertTrue(group.check("yt_outline_closed_caption_black_24".getBytes(StandardCharsets.UTF_8)).isFiltered());
        assertTrue(group.check("yt_fill_experimental_closed_captions_black_24"
                .getBytes(StandardCharsets.UTF_8)).isFiltered());
        assertTrue(group.check(hex("0a0a3208d23e050a0308ba02")).isFiltered());
        assertTrue(group.check(hex("0a093207d23e040a020814")).isFiltered());
        assertFalse(group.check("yt_outline_person_radar_white_24".getBytes(StandardCharsets.UTF_8)).isFiltered());
    }

    @Test
    public void rejectsBareEnumValuesWrongExtensionsAndTruncatedSources() {
        ByteArrayFilterGroup group = PlayerFlyoutMenuFilter.menuItemGroup(null, new int[]{331});

        assertFalse(group.check(hex("08cb02")).isFiltered());
        assertFalse(group.check(hex("0a0a3208da3e050a0308cb02")).isFiltered());
        assertFalse(group.check(hex("0a0a3208d23e050a0308cb")).isFiltered());
        assertFalse(group.check(new byte[0]).isFiltered());
        assertFalse(group.check(hex("0a0a3208d23e050a0308b102")).isFiltered());
    }

    @Test
    public void additionalSettingsMatchesBothFlyoutIconFormsButNotMoreInformationOrQuality() {
        ByteArrayFilterGroup group = PlayerFlyoutMenuFilter.menuItemGroup(null, new int[]{173},
                "yt_outline_gear_", "yt_outline_experimental_gear_");

        assertTrue(group.check(hex("0a0a3208d23e050a0308ad01")).isFiltered());
        assertTrue(group.check("yt_outline_gear_black_24".getBytes(StandardCharsets.UTF_8)).isFiltered());
        assertTrue(group.check("yt_outline_experimental_gear_black_24"
                .getBytes(StandardCharsets.UTF_8)).isFiltered());
        assertFalse(group.check(hex("0a0a3208d23e050a0308bd01")).isFiltered()); // INFO_CIRCLE 189.
        assertFalse(group.check(hex("0a093207d23e040a020859")).isFiltered()); // ADJUST 89.
        assertFalse(group.check("yt_outline_info_circle_black_24".getBytes(StandardCharsets.UTF_8)).isFiltered());
        assertFalse(group.check("yt_outline_adjust_black_24".getBytes(StandardCharsets.UTF_8)).isFiltered());
        assertFalse(group.check("More".getBytes(StandardCharsets.UTF_8)).isFiltered());
    }
}
