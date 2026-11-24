/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-23.
 */
package app.morphe.extension.music.patches;

import static app.morphe.extension.music.patches.MusicDrcSelection.DRC;
import static app.morphe.extension.music.patches.MusicDrcSelection.ORIGINAL;
import static app.morphe.extension.music.patches.MusicDrcSelection.SAME_TRACK_PAIR;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public final class MusicDrcSelectionTest {
    private record Format(int itag, String rvxMimeType, String rvxAudioTrackId, boolean rvxIsDrc)
            implements MusicDrcSelection.Format {}

    private static final Format ORIGINAL_OPUS = new Format(251, "audio/webm", "en.1", false);
    private static final Format DRC_OPUS = new Format(251, "audio/webm", "en.1", true);
    private static final Format ORIGINAL_AAC = new Format(140, "audio/mp4", "en.1", false);
    private static final Format DUB_DRC = new Format(251, "audio/webm", "es.1", true);
    private static final Format VIDEO = new Format(134, "video/mp4", "", false);

    @Test
    public void prefersUncompressedVariantWithoutSwappingSameItagIdentity() {
        var formats = new ArrayList<MusicDrcSelection.Format>(List.of(DRC_OPUS, ORIGINAL_OPUS, ORIGINAL_AAC));

        assertEquals(ORIGINAL | DRC | SAME_TRACK_PAIR, MusicDrcSelection.selectOriginal(formats, true));
        assertEquals(List.of(ORIGINAL_OPUS, ORIGINAL_AAC), formats);
        assertSame(ORIGINAL_OPUS, formats.get(0));
    }

    @Test
    public void retainsDrcOnlyOtherTrackEvenWhenDefaultTrackHasBothVariants() {
        var formats = new ArrayList<MusicDrcSelection.Format>(List.of(DRC_OPUS, DUB_DRC, ORIGINAL_OPUS));

        assertEquals(ORIGINAL | DRC | SAME_TRACK_PAIR, MusicDrcSelection.selectOriginal(formats, true));
        assertEquals(List.of(DUB_DRC, ORIGINAL_OPUS), formats);
        assertSame(DUB_DRC, formats.get(0));
    }

    @Test
    public void unrelatedOriginalTrackIsNotAReplacementForDrcOnlyTrack() {
        var formats = List.<MusicDrcSelection.Format>of(DUB_DRC, ORIGINAL_OPUS);

        assertEquals(ORIGINAL | DRC, MusicDrcSelection.selectOriginal(formats, true));
        assertEquals(List.of(DUB_DRC, ORIGINAL_OPUS), formats);
    }

    @Test
    public void aVideoTrackIsNotNonDrcAudio() {
        Format unlabelledDrc = new Format(251, "audio/webm", "", true);
        var formats = List.<MusicDrcSelection.Format>of(VIDEO, unlabelledDrc);

        assertEquals(DRC, MusicDrcSelection.selectOriginal(formats, true));
        assertEquals(List.of(VIDEO, unlabelledDrc), formats);
    }

    @Test
    public void leavingPreferenceOffOnlyObservesThePairWithoutMutatingTheList() {
        var formats = List.<MusicDrcSelection.Format>of(DRC_OPUS, ORIGINAL_OPUS, DUB_DRC);

        assertEquals(ORIGINAL | DRC | SAME_TRACK_PAIR, MusicDrcSelection.selectOriginal(formats, false));
        assertEquals(List.of(DRC_OPUS, ORIGINAL_OPUS, DUB_DRC), formats);
    }

    @Test
    public void leavesSingleVariantAndEmptyInventoriesAlone() {
        assertEquals(DRC, MusicDrcSelection.selectOriginal(List.of(DRC_OPUS), true));
        assertEquals(ORIGINAL, MusicDrcSelection.selectOriginal(List.of(ORIGINAL_OPUS), true));
        assertEquals(0, MusicDrcSelection.selectOriginal(List.of(), true));
    }
}
