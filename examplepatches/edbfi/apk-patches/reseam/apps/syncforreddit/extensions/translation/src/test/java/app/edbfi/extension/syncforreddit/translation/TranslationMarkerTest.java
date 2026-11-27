// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.translation;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public final class TranslationMarkerTest {
    private static final String ATTRIBUTION = "Translated by Google";

    @Test
    public void recognizesPlainAndLinkedAttributionInMarkdownAndRenderedHtml() {
        String[] markers = {
                "\n\nTranslated by Google&nbsp;&nbsp;&nbsp;^*&#40;French",
                "<p>Translated by Google&nbsp;&nbsp;&nbsp;<sup><em>&#40;French",
                "[Translated by Google](translate)&nbsp;&nbsp;&nbsp;^*&#40;French",
                "<a href=\"translate\">Translated by Google</a>&nbsp;&nbsp;&nbsp;<sup><em>&#40;French",
        };
        for (String marker : markers) {
            assertTrue(marker, TranslationMarker.matches("Original text" + marker, ATTRIBUTION));
        }
    }

    @Test
    public void ignoresOrdinaryAttributionMentionsAndMissingText() {
        assertFalse(TranslationMarker.matches(null, ATTRIBUTION));
        assertFalse(TranslationMarker.matches("<p>Translated by Google is a label.</p>", ATTRIBUTION));
        assertFalse(TranslationMarker.matches("[Translated by Google](translate)", ATTRIBUTION));
    }
}
