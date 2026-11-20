/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19
 * Written by lavinhoque33, 2026-11-06
 */

package app.morphe.extension.youtube.settings.preference;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.graphics.Color;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.URLSpan;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Locale;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class AboutInfoTest {

    @Test
    public void sdkFormattingDoesNotDependOnDeviceLocale() {
        Locale previous = Locale.getDefault();
        try {
            Locale.setDefault(Locale.forLanguageTag("ar"));
            assertEquals("34", AboutInfo.buildDebugInfo("%6$d", "", "", "", "", "", 34, "", ""));
        } finally {
            Locale.setDefault(previous);
        }
    }

    @Test
    public void inclusionDescriptionHidesLegacyCommentsAndFoldsSoftWraps() {
        String description = "Inclusion records are not execution results. <!--\n"
                + "        -->Final outcomes are unavailable; <!-- hidden metadata -->\r\n"
                + "        unrecorded patches are not necessarily excluded.";

        assertEquals("Inclusion records are not execution results. Final outcomes are unavailable; "
                        + "unrecorded patches are not necessarily excluded.",
                AboutPreference.formatInclusionDescription(description).toString());
    }

    @Test
    public void inclusionDescriptionPreservesParagraphsAndLinkSpans() {
        String source = "Patch records. <!-- cached separator -->\r\n\r\n\tSee details.";
        SpannableString description = new SpannableString(source);
        String url = "https://github.com/lavinhoque33/revanced-patches";
        URLSpan link = new URLSpan(url);
        description.setSpan(link, source.indexOf("details"), source.length() - 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);

        Spanned formatted = (Spanned) AboutPreference.formatInclusionDescription(description);

        assertEquals("Patch records.\n\nSee details.", formatted.toString());
        assertEquals("details", formatted.subSequence(formatted.getSpanStart(link),
                formatted.getSpanEnd(link)).toString());
        assertEquals(url, formatted.getSpans(0, formatted.length(), URLSpan.class)[0].getURL());
    }

    @Test
    public void notRecordedRetainsTextAndContrastInBothStockThemes() {
        assertOrangeStatusContrast(false, Color.WHITE);
        assertOrangeStatusContrast(true, 0xFF121212);
    }

    private static void assertOrangeStatusContrast(boolean darkMode, int background) {
        Spanned status = (Spanned) AboutPreference.colorUnrecordedStatus("Not recorded", darkMode);
        ForegroundColorSpan colorSpan = status.getSpans(0, status.length(), ForegroundColorSpan.class)[0];
        int foreground = colorSpan.getForegroundColor();
        double foregroundLuminance = Color.luminance(foreground);
        double backgroundLuminance = Color.luminance(background);
        double contrast = (Math.max(foregroundLuminance, backgroundLuminance) + 0.05)
                / (Math.min(foregroundLuminance, backgroundLuminance) + 0.05);

        assertEquals("Not recorded", status.toString());
        assertTrue(Color.red(foreground) > Color.green(foreground));
        assertTrue(Color.green(foreground) > Color.blue(foreground));
        assertTrue("WCAG AA normal text contrast: " + contrast, contrast >= 4.5);
    }
}
