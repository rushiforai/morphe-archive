/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-06
 * Written by lavinhoque33, 2026-11-06
 */

package app.morphe.extension.youtube.settings.preference;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.nio.file.Path;
import java.util.Locale;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPathFactory;

public class AboutInfoTest {
    private static final String FORMAT = "RVX Patches: %1$s\nApp: %2$s %3$s\nPatched: %4$s\n"
            + "Android: %5$s (SDK %6$d)\nDevice: %7$s %8$s";

    @Test
    public void hostDebugFormatHasNoLayoutIndentation() throws Exception {
        Path hostStrings = Path.of("../../patches/src/main/resources/youtube/settings/host/values/strings.xml");
        var document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(hostStrings.toFile());
        String format = XPathFactory.newInstance().newXPath().evaluate(
                "/resources/string[@name='revanced_about_debug_format']/text()", document);

        assertEquals(FORMAT, format.replace("\\n", "\n"));
    }

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
}
