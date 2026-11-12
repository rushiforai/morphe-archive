/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-11.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.Iterator;
import java.util.List;
import java.util.function.Function;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;

public class DownloadCandidatesTest {
    private static Format format(int itag) {
        return Format.newBuilder().setItag(itag).setUrl("https://source/" + itag).build();
    }

    private static final class Sources implements Iterator<List<Format>> {
        private final List<List<Format>> replies;
        private int fetched;

        @SafeVarargs
        Sources(List<Format>... replies) {
            this.replies = List.of(replies);
        }

        @Override public boolean hasNext() {
            return fetched < replies.size();
        }

        @Override public List<Format> next() {
            return replies.get(fetched++);
        }
    }

    @Test public void everyPresetStopsAtItsOptimumWithoutRequestingAnotherClient() {
        int[] optimal = {141, 251, 140, 139};
        for (DownloadQuality quality : DownloadQuality.values()) {
            Format chosen = format(optimal[quality.ordinal()]);
            Sources sources = new Sources(List.of(chosen), List.of(format(249)));
            DownloadCandidates<Format> candidates = new DownloadCandidates<>(sources, Function.identity(), quality);
            assertSame(chosen, candidates.next());
            assertEquals(1, sources.fetched);
        }
    }

    @Test public void highestSearchesPastTheFirstPublicStreamAndPremiumOpusForTheBestOfferedClass() {
        Format premium = format(141);
        Sources sources = new Sources(List.of(format(251)), List.of(format(774)), List.of(premium), List.of());
        DownloadCandidates<Format> candidates = new DownloadCandidates<>(
                sources, Function.identity(), DownloadQuality.HIGHEST);
        assertSame(premium, candidates.next());
        assertEquals(3, sources.fetched);
    }

    @Test public void highestPublicFallbackIsReturnedOnlyAfterTheRemainingClientsWereChecked() {
        Format publicAudio = format(251);
        Sources sources = new Sources(List.of(publicAudio), List.of(format(140)), List.of());
        DownloadCandidates<Format> candidates = new DownloadCandidates<>(
                sources, Function.identity(), DownloadQuality.HIGHEST);
        assertSame(publicAudio, candidates.next());
        assertEquals(3, sources.fetched);
    }

    @Test public void rejectedUrlRetainsTheSameReplyAndRanksOtherClientsBeforeTakingALowerFallback() {
        Format high = format(251);
        Format normal = format(140);
        Format low = format(139);
        Sources sources = new Sources(List.of(high, low), List.of(normal));
        DownloadCandidates<Format> candidates = new DownloadCandidates<>(
                sources, Function.identity(), DownloadQuality.HIGH);
        assertSame(high, candidates.next());
        assertEquals(1, sources.fetched);
        // The caller rejected high's URL: the next choice still considers both the next client and this reply.
        assertSame(normal, candidates.next());
        assertEquals(2, sources.fetched);
        assertSame(low, candidates.next());
        assertNull(candidates.next());
    }

    @Test public void oneReplyCanSupplyItsOwnFallbackWithoutRepeatingARequest() {
        Format high = format(251);
        Format normal = format(140);
        Sources sources = new Sources(List.of(high, normal));
        DownloadCandidates<Format> candidates = new DownloadCandidates<>(
                sources, Function.identity(), DownloadQuality.HIGH);
        assertSame(high, candidates.next());
        assertSame(normal, candidates.next());
        assertNull(candidates.next());
        assertEquals(1, sources.fetched);
    }

    @Test public void equalQualityKeepsClientArrivalOrderRatherThanItsReportedVbrBitrate() {
        Format first = format(251).toBuilder().setBitrate(101000).build();
        Format later = format(251).toBuilder().setBitrate(170000).build();
        Sources sources = new Sources(List.of(first), List.of(later));
        DownloadCandidates<Format> candidates = new DownloadCandidates<>(
                sources, Function.identity(), DownloadQuality.HIGHEST);
        assertSame(first, candidates.next());
        assertSame(later, candidates.next());
        assertEquals(2, sources.fetched);
    }
}
