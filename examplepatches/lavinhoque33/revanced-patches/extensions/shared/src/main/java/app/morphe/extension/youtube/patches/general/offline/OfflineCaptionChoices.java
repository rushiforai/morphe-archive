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

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.CaptionText;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.CaptionTrack;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.CaptionTrackList;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.CaptionTranslationLanguage;

/** Pure metadata-to-picker mapping; native tracks never suppress a distinct translated choice. */
final class OfflineCaptionChoices {
    record Track(String key, String language, String kind, String translation, String name, String url) {
    }

    private OfflineCaptionChoices() {
    }

    /** Exact track keys win; bare playlist language choices prefer uploaded native tracks over ASR. */
    static void restoreRemembered(Set<String> selected, List<Track> tracks, String[] remembered) {
        for (String key : remembered) {
            Track match = null;
            for (Track track : tracks) {
                if (track.key().equals(key)) {
                    match = track;
                    break;
                }
            }
            if (match == null) {
                for (Track track : tracks) {
                    if (!track.translation().isEmpty() || !track.language().equals(key)) continue;
                    if (match == null || (match.kind().equals("asr") && !track.kind().equals("asr"))) match = track;
                }
            }
            if (match != null) OfflineSubtitle.select(selected, match.key(), true);
        }
    }

    static boolean needsMetadata(CaptionTrackList list) {
        // TV responses can include native tracks but omit the entire translation-language list.
        return list.getCaptionTracksCount() == 0 || list.getTranslationLanguagesCount() == 0;
    }

    static List<Track> from(CaptionTrackList list) {
        List<Track> result = new ArrayList<>();
        for (CaptionTrack track : list.getCaptionTracksList()) {
            if (track.getBaseUrl().isEmpty() || track.getLanguageCode().isEmpty()) continue;
            String key = track.getVssId().isEmpty()
                    ? track.getLanguageCode() + ":" + track.getKind() : track.getVssId();
            result.add(new Track(key, track.getLanguageCode(), track.getKind(), "",
                    name(track.getName(), track.getLanguageCode()), track.getBaseUrl()));
        }
        if (result.isEmpty()) return result;
        for (CaptionTranslationLanguage language : list.getTranslationLanguagesList()) {
            String target = language.getLanguageCode();
            if (target.isEmpty()) continue;
            int sourceIndex = sourceIndex(list, language);
            if (sourceIndex < 0) continue;
            CaptionTrack source = list.getCaptionTracks(sourceIndex);
            result.add(new Track("translate:" + target, source.getLanguageCode(), "translated", target,
                    name(language.getLanguageName(), target), source.getBaseUrl()));
        }
        return result;
    }

    private static int sourceIndex(CaptionTrackList list, CaptionTranslationLanguage language) {
        String target = language.getLanguageCode();
        if (language.getTranslationSourceTrackIndicesCount() > 0) {
            return sourceIndex(list, language.getTranslationSourceTrackIndicesList(), target);
        }
        int preferred = sourceIndex(list, list.getDefaultTranslationSourceTrackIndicesList(), target);
        if (preferred >= 0) return preferred;
        for (int index = 0; index < list.getCaptionTracksCount(); index++) {
            if (eligible(list.getCaptionTracks(index), target)) return index;
        }
        return -1;
    }

    private static int sourceIndex(CaptionTrackList list, List<Integer> indices, String target) {
        for (int index : indices) {
            if (index >= 0 && index < list.getCaptionTracksCount() && eligible(list.getCaptionTracks(index), target)) {
                return index;
            }
        }
        return -1;
    }

    private static boolean eligible(CaptionTrack track, String target) {
        return track.getIsTranslatable() && !track.getBaseUrl().isEmpty() && !track.getLanguageCode().isEmpty()
                && !track.getLanguageCode().equals(target);
    }

    private static String name(CaptionText text, String fallback) {
        StringBuilder name = new StringBuilder();
        for (var run : text.getRunsList()) name.append(run.getText());
        return name.length() == 0 ? fallback : name.toString();
    }
}
