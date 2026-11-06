/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-10-31.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.CaptionTrack;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.CaptionTrackList;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.CaptionTranslationLanguage;

public class OfflineCaptionChoicesTest {
    private static CaptionTrack track(String language) {
        return CaptionTrack.newBuilder().setLanguageCode(language).setVssId("." + language)
                .setBaseUrl("https://www.youtube.com/api/timedtext?lang=" + language)
                .setIsTranslatable(true).build();
    }

    private static CaptionTranslationLanguage target(String language) {
        return CaptionTranslationLanguage.newBuilder().setLanguageCode(language).build();
    }

    @Test
    public void tvNativeTracksStillRequireMissingTranslationMetadata() {
        var nativeOnly = CaptionTrackList.newBuilder().addCaptionTracks(track("en")).build();
        assertTrue(OfflineCaptionChoices.needsMetadata(nativeOnly));
        var complete = nativeOnly.toBuilder().addTranslationLanguages(target("fr")).build();
        assertFalse(OfflineCaptionChoices.needsMetadata(complete));
        assertTrue(OfflineCaptionChoices.needsMetadata(CaptionTrackList.getDefaultInstance()));
    }

    @Test
    public void manualTracksOfferTranslationsEvenWhenNativeTargetAlreadyExists() {
        var list = CaptionTrackList.newBuilder().addCaptionTracks(track("en")).addCaptionTracks(track("fr"))
                .addTranslationLanguages(target("fr")).addTranslationLanguages(target("de")).build();
        var choices = OfflineCaptionChoices.from(list);
        assertEquals(4, choices.size());
        assertEquals(".fr", choices.get(1).key());
        assertEquals("translate:fr", choices.get(2).key());
        assertEquals("fr", choices.get(2).translation());
        assertEquals("en", choices.get(2).language());
        assertEquals("de", choices.get(3).translation());
    }

    @Test
    public void originalDefaultSourceIsPreferredOverFirstNativeLanguage() {
        var list = CaptionTrackList.newBuilder().addCaptionTracks(track("ar")).addCaptionTracks(track("en"))
                .addDefaultTranslationSourceTrackIndices(1).addTranslationLanguages(target("de")).build();
        assertEquals("en", OfflineCaptionChoices.from(list).get(2).language());
    }

    @Test
    public void perTargetSourcesAreHonouredAndDoNotRequireAsr() {
        var german = target("de").toBuilder().addTranslationSourceTrackIndices(1).build();
        var invalid = target("ja").toBuilder().addTranslationSourceTrackIndices(99).build();
        var list = CaptionTrackList.newBuilder().addCaptionTracks(track("en")).addCaptionTracks(track("fr"))
                .addDefaultTranslationSourceTrackIndices(0).addTranslationLanguages(german)
                .addTranslationLanguages(invalid).build();
        var choices = OfflineCaptionChoices.from(list);
        assertEquals(3, choices.size());
        assertEquals("fr", choices.get(2).language());
        assertEquals("de", choices.get(2).translation());
    }

    @Test
    public void sourceInTargetLanguageDoesNotHideOtherEligibleSources() {
        var list = CaptionTrackList.newBuilder().addCaptionTracks(track("en")).addCaptionTracks(track("de"))
                .addTranslationLanguages(target("en")).build();
        assertEquals("de", OfflineCaptionChoices.from(list).get(2).language());
    }

    @Test
    public void absentTranslationMetadataAndNontranslatableSourcesAreNotInvented() {
        var zoo = CaptionTrackList.newBuilder().addCaptionTracks(track("en")).addCaptionTracks(track("de")).build();
        assertEquals(2, OfflineCaptionChoices.from(zoo).size());
        var blocked = CaptionTrackList.newBuilder()
                .addCaptionTracks(track("en").toBuilder().setIsTranslatable(false))
                .addTranslationLanguages(target("fr")).build();
        assertEquals(1, OfflineCaptionChoices.from(blocked).size());
    }

    @Test public void barePlaylistLanguagesPreferUploadedTracksAndKeepExactKeysFirst() {
        var automatic = new OfflineCaptionChoices.Track("a.fr", "fr", "asr", "", "French auto", "");
        var uploaded = new OfflineCaptionChoices.Track(".fr", "fr", "", "", "French", "");
        Set<String> selected = new LinkedHashSet<>();
        OfflineCaptionChoices.restoreRemembered(selected, List.of(automatic, uploaded), new String[]{"fr"});
        assertEquals(Set.of(".fr"), selected);
        selected.clear();
        OfflineCaptionChoices.restoreRemembered(selected, List.of(automatic, uploaded), new String[]{"a.fr"});
        assertEquals(Set.of("a.fr"), selected);
        selected.clear();
        OfflineCaptionChoices.restoreRemembered(selected, List.of(automatic), new String[]{"fr"});
        assertEquals(Set.of("a.fr"), selected);
    }

    @Test public void bareLanguageRestoreNeverChoosesTranslationsAndStillCapsAtFiveTracks() {
        var translated = new OfflineCaptionChoices.Track("translate:de", "fr", "translated", "de", "German", "");
        Set<String> selected = new LinkedHashSet<>();
        OfflineCaptionChoices.restoreRemembered(selected, List.of(translated), new String[]{"fr"});
        assertTrue(selected.isEmpty());
        var list = CaptionTrackList.newBuilder();
        for (String language : new String[]{"fr", "de", "es", "it", "en", "pt"}) {
            list.addCaptionTracks(track(language));
        }
        OfflineCaptionChoices.restoreRemembered(selected, OfflineCaptionChoices.from(list.build()),
                new String[]{"fr", "de", "es", "it", "en", "pt"});
        assertEquals(List.of(".fr", ".de", ".es", ".it", ".en"), List.copyOf(selected));
    }
}
