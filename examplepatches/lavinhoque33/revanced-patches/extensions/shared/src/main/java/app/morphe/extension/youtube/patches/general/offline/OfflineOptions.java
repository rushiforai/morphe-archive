/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.youtube.settings.Settings;

/**
 * The built-in downloader settings: which codecs and qualities are offered, and where files go.
 * The picker and playlist downloads both read them from here, so they always agree.
 */
final class OfflineOptions {
    static final int LOWEST_HEIGHT = 144;
    static final int HIGHEST_HEIGHT = 4320;

    private static final Pattern UNSAFE_FOLDER_CHARACTERS = Pattern.compile("[:*?\"<>|\\p{Cntrl}]");

    private OfflineOptions() {
    }

    // region formats

    static boolean showFormatIds() {
        return Settings.OFFLINE_SHOW_FORMAT_IDS.get();
    }

    /**
     * Turning off every video codec would leave nothing to download, so then every codec is offered
     * and the picker says why.
     */
    static boolean allVideoCodecsOff() {
        return !Settings.OFFLINE_CODEC_H264.get()
                && !Settings.OFFLINE_CODEC_VP9.get()
                && !Settings.OFFLINE_CODEC_AV1.get();
    }

    static boolean isVideoCodecEnabled(String codec) {
        if (allVideoCodecsOff()) return true;
        return switch (codec) {
            case OfflineFormats.CODEC_H264 -> Settings.OFFLINE_CODEC_H264.get();
            case OfflineFormats.CODEC_VP9 -> Settings.OFFLINE_CODEC_VP9.get();
            case OfflineFormats.CODEC_AV1 -> Settings.OFFLINE_CODEC_AV1.get();
            default -> true;
        };
    }

    static boolean isAudioCodecEnabled(String codec) {
        return switch (codec) {
            case OfflineFormats.CODEC_OPUS -> Settings.OFFLINE_AUDIO_OPUS.get();
            case OfflineFormats.CODEC_AAC -> Settings.OFFLINE_AUDIO_AAC.get();
            default -> true;
        };
    }

    /** Smallest video height to offer. A minimum above the maximum counts as the two swapped. */
    static int minHeight() {
        return Math.min(settingHeight(Settings.OFFLINE_MIN_HEIGHT), settingHeight(Settings.OFFLINE_MAX_HEIGHT));
    }

    /** Largest video height to offer. */
    static int maxHeight() {
        return Math.max(settingHeight(Settings.OFFLINE_MIN_HEIGHT), settingHeight(Settings.OFFLINE_MAX_HEIGHT));
    }

    static boolean isRangeNarrowed() {
        return minHeight() > LOWEST_HEIGHT || maxHeight() < HIGHEST_HEIGHT;
    }

    private static int settingHeight(IntegerSetting setting) {
        return Math.max(LOWEST_HEIGHT, Math.min(HIGHEST_HEIGHT, setting.get()));
    }

    /** The videos whose codec is turned on and whose height is within the quality range. */
    static List<OfflineFormats.Stream> filterVideos(List<OfflineFormats.Stream> videos) {
        final int min = minHeight();
        final int max = maxHeight();
        List<OfflineFormats.Stream> offered = new ArrayList<>(videos.size());
        for (OfflineFormats.Stream video : videos) {
            if (video.height() < min || video.height() > max) continue;
            if (isVideoCodecEnabled(video.codec())) offered.add(video);
        }
        return offered;
    }

    /** The audio-only streams whose codec is turned on. */
    static List<OfflineFormats.Stream> filterAudio(List<OfflineFormats.Stream> audio) {
        List<OfflineFormats.Stream> offered = new ArrayList<>(audio.size());
        for (OfflineFormats.Stream stream : audio) {
            if (isAudioCodecEnabled(stream.codec())) offered.add(stream);
        }
        return offered;
    }

    // endregion

    // region files

    static boolean saveThumbnailWithDownloads() {
        return Settings.OFFLINE_SAVE_THUMBNAIL.get();
    }

    /** Below {@code Movies}. */
    static String videoFolder() {
        return folder(Settings.OFFLINE_VIDEO_FOLDER);
    }

    /** Below {@code Music}. */
    static String audioFolder() {
        return folder(Settings.OFFLINE_AUDIO_FOLDER);
    }

    /** Below {@code Pictures}. */
    static String thumbnailFolder() {
        return folder(Settings.OFFLINE_THUMBNAIL_FOLDER);
    }

    private static String folder(StringSetting setting) {
        String folder = sanitizeFolder(setting.get());
        return folder.isEmpty() ? sanitizeFolder(setting.defaultValue) : folder;
    }

    /**
     * Turns what the user typed into a relative folder path MediaStore accepts: no leading or
     * doubled slashes, no {@code .} or {@code ..} segments and no characters file systems reject.
     *
     * @return The sanitized path, or an empty string if nothing usable is left or the path tries to
     * leave its collection with {@code ..}.
     */
    static String sanitizeFolder(String folder) {
        StringBuilder clean = new StringBuilder();
        for (String segment : folder.replace('\\', '/').split("/")) {
            String name = UNSAFE_FOLDER_CHARACTERS.matcher(segment).replaceAll("_").trim();
            if (name.equals("..")) return "";
            if (name.isEmpty() || name.equals(".")) continue;
            if (clean.length() > 0) clean.append('/');
            clean.append(name);
        }
        return clean.toString();
    }

    // endregion
}
