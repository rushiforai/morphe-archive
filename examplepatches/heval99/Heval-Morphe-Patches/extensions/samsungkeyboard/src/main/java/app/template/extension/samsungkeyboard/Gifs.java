// Based on bearinmindcat/morphe-patches (GPL-3.0) @ 5f79152, extensions/samsungkeyboard/src/main/java/org/ungoogled/samsungkeyboard/Gifs.java.
// Modified for Heval's Morphe Patches on 2026-11-13: package renamed to app.template.extension.samsungkeyboard.
// 2026-11-14: each answer follows its Patch settings switch.

package app.template.extension.samsungkeyboard;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * Always use GIPHY. The keyboard picks its GIF providers from the phone's language: 2 = Tenor only (German, Chinese,
 * Arabic, Turkish), 4 = Tenor, then GIPHY (French, Korean, Spanish, Russian, Italian, Japanese, Portuguese),
 * 3 = GIPHY, then Tenor (English), 0 = GIPHY, then Tenor with English searches (every other language). Tenor's API
 * is closed to apps outside Google since 2026-06-30, so a Tenor-only board stays empty.
 *
 * Each answer below is the patched one only while its Patch settings switch is on; otherwise it hands back what the
 * keyboard computed.
 */
public final class Gifs {
    static final String ALWAYS_GIPHY = "samsungkeyboard.always_giphy";
    static final String GIFS_EVERY_REGION = "samsungkeyboard.gifs_every_region";

    private Gifs() {
    }

    /** The keyboard's answer for a language, with GIPHY first wherever Tenor came first or alone. */
    public static int giphyFirst(int providers) {
        if (providers != 2 && providers != 4) return providers;
        return on(ALWAYS_GIPHY) ? 3 : providers;
    }

    /** The language kept by the notices that name the providers: English while the switch is on, as for the choice. */
    public static String noticeLanguage(String language) {
        return on(ALWAYS_GIPHY) ? "en" : language;
    }

    /** The phone's CSC answer for the GIF board ("enable" or "disable"): "enable" while the switch is on. */
    public static String gifRegion(String answer) {
        return on(GIFS_EVERY_REGION) ? "enable" : answer;
    }

    private static boolean on(String id) {
        try {
            return HevalSettings.isEnabled(id);
        } catch (Throwable ignored) {
            return false;
        }
    }
}
