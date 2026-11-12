/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11
 * Written by lavinhoque33, 2026-11-06
 */

package app.morphe.extension.youtube.settings.preference;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.util.Locale;

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
}
