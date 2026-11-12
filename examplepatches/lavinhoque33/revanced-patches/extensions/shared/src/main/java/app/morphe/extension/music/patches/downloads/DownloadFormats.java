/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-11.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;

/** Source-quality classes, not instantaneous VBR bitrates or transcoded output sizes. */
final class DownloadFormats {
    private DownloadFormats() {}

    @Nullable
    static Format bestAudio(PlayerResponse response, boolean playableCopyOnly, DownloadQuality quality) {
        Format best = null;
        for (Format format : response.getStreamingData().getAdaptiveFormatsList()) {
            if (!eligibleAudio(format, playableCopyOnly)) continue;

            if (best == null || compare(format, best, quality) > 0) best = format;
        }
        return best;
    }

    static List<Format> audioFormats(PlayerResponse response, boolean playableCopyOnly) {
        List<Format> formats = new ArrayList<>();
        for (Format format : response.getStreamingData().getAdaptiveFormatsList()) {
            if (eligibleAudio(format, playableCopyOnly)) formats.add(format);
        }
        return formats;
    }

    private static boolean eligibleAudio(Format format, boolean playableCopyOnly) {
        return StreamSwapLogic.supportedAudio(format.getItag(), format.getMimeType())
                && AudioTagger.canTag(format.getMimeType()) && !format.getUrl().isBlank()
                && (!format.hasAudioTrack() || format.getAudioTrack().getAudioIsDefault())
                && format.getAudioChannels() <= 2 && (!playableCopyOnly || usableCopy(format));
    }

    /** Positive when left is preferred; shared across responses so every available client gets the same policy. */
    static int compare(Format left, Format right, DownloadQuality quality) {
        int leftTier = tier(left.getItag());
        int rightTier = tier(right.getItag());
        int rank = Integer.compare(preference(leftTier, quality), preference(rightTier, quality));
        if (rank != 0) return rank;

        // Stable codec choice within a source class, never a cross-codec VBR bitrate comparison.
        return Integer.compare(codecPreference(left.getItag()), codecPreference(right.getItag()));
    }

    /** No later client can beat these representations for this preset. Equal choices retain client order. */
    static boolean isTopChoice(Format format, DownloadQuality quality) {
        return format.getItag() == switch (quality) {
            case HIGHEST -> 141;
            case HIGH -> 251;
            case NORMAL -> 140;
            case LOW -> 139;
        };
    }

    private static int codecPreference(int itag) {
        return switch (itag) {
            case 141, 139 -> 1;
            default -> 0;
        };
    }

    private static int tier(int itag) {
        return switch (itag) {
            case 141, 774 -> 4; // AAC / Opus 256 kbps, only when the server actually supplies them.
            case 251 -> 3; // Standard high Opus, whose reported VBR bitrate varies with the song.
            case 140 -> 2; // AAC 128 kbps.
            case 250 -> 1; // Opus 70 kbps.
            case 139, 249 -> 0; // AAC 48 kbps / Opus approximately 50 kbps.
            default -> -1;
        };
    }

    /** Prefer the requested class, then the nearest lower class, then the nearest higher class. */
    private static int preference(int tier, DownloadQuality quality) {
        if (quality == DownloadQuality.HIGHEST) return tier;
        int target = switch (quality) {
            case HIGH -> 3;
            case NORMAL -> 2;
            case LOW -> 0;
            default -> throw new IllegalArgumentException("Unknown quality");
        };
        return tier <= target ? 10 + tier : -tier;
    }

    private static boolean usableCopy(Format format) {
        long length = format.getContentLength();
        return length > 0 && format.getLastModified() > 0
                && format.hasInitRange() && format.getInitRange().getStart() >= 0
                && format.getInitRange().getEnd() >= format.getInitRange().getStart()
                && format.getInitRange().getEnd() < length
                && format.hasIndexRange() && format.getIndexRange().getStart() >= 0
                && format.getIndexRange().getEnd() >= format.getIndexRange().getStart()
                && format.getIndexRange().getEnd() < length;
    }
}
