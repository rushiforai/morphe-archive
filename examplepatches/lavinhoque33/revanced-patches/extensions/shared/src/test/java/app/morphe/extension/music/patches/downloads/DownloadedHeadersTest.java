/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.List;

public class DownloadedHeadersTest {
    private static final List<String> LABELS = List.of("Download", "Descargar");

    @Test public void theDownloadButtonIsRecognisedByItsLabelWhateverTheCaseOrSpacing() {
        assertTrue(DownloadedHeaders.isDownloadLabel("Download", LABELS));
        assertTrue(DownloadedHeaders.isDownloadLabel("  download ", LABELS));
        assertTrue(DownloadedHeaders.isDownloadLabel("DESCARGAR", LABELS));
    }

    @Test public void anotherButtonOrNoLabelIsNeverTheDownloadButton() {
        assertFalse(DownloadedHeaders.isDownloadLabel("Shuffle", LABELS));
        assertFalse(DownloadedHeaders.isDownloadLabel("Downloaded", LABELS));
        assertFalse(DownloadedHeaders.isDownloadLabel("", LABELS));
        assertFalse(DownloadedHeaders.isDownloadLabel(null, LABELS));
        assertFalse(DownloadedHeaders.isDownloadLabel("Descargar", List.of("Download")));
    }
}
