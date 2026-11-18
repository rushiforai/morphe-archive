// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class HttpTest {
    @Test
    public void keepsAPlainAgent() {
        String agent = "Dalvik/2.1.0 (Linux; U; Android 15; Pixel 9 Build/AP3A)";
        assertEquals(agent, Http.headerSafe(agent));
    }

    @Test
    public void replacesWhatAHeaderCantHold() {
        assertEquals("Dalvik/2.1.0 (Linux; U; Android 14; Galaxy? ??? Build/X)?",
                Http.headerSafe("Dalvik/2.1.0 (Linux; U; Android 14; Galaxy™ 樂天版 Build/X)\n"));
    }

    @Test
    public void fallsBackWhenTheSystemHasNone() {
        assertEquals("Dalvik/2.1.0 (Linux; Android)", Http.headerSafe(null));
        assertEquals("Dalvik/2.1.0 (Linux; Android)", Http.headerSafe(""));
    }
}
