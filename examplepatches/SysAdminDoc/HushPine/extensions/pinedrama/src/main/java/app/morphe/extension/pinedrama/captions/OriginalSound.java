/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.captions;

import app.morphe.extension.pinedrama.blockauthor.Reflect;
import app.morphe.extension.pinedrama.download.VideoDownloads;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;

import org.json.JSONObject;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * The original sound of a copy made for the app's language, as one more audio track (#8).
 *
 * <p>In a language other than English many dramas play from a copy with a dub mixed into its
 * sound and subtitles in that language drawn into its picture, and the video lists no dubs, so
 * Force original dub had nothing to turn off. Such a video gets the sound of PineDrama's own
 * download file as an audio track, built the way the server sends a dub, and the player switches
 * to it the way it switches to any dub. The picture and its subtitles stay.
 */
public final class OriginalSound {
    /** The language code of that track. No dub the server sends uses it. */
    public static final String CODE = "original";
    /** What a dub file is when it isn't split into pieces. */
    static final String FORMAT = "mp4";
    /** The volume a track reports when the video measured none. */
    static final String DEFAULT_VOLUME = "{\"Loudness\":-16,\"Peak\":1}";
    private static final int REMEMBERED = 64;
    private static final Object NO_TRACK = new Object();
    /** The audio made for each copy, by video id plus the identity of the copy's video. */
    private static final Map<String, Object> MADE = Collections.synchronizedMap(
        new LinkedHashMap<String, Object>() {
            @Override
            protected boolean removeEldestEntry(Map.Entry<String, Object> eldest) {
                return size() > REMEMBERED;
            }
        });

    private OriginalSound() {}

    /**
     * Aweme.getAudio(): the video's own audio, or with Force original dub on, the original sound
     * for a copy made for the app's language, which comes with none.
     */
    public static Object audio(Object aweme, Object stock) {
        if (stock != null || aweme == null || !Settings.FORCE_ORIGINAL_DUB.get()) return stock;
        HookStatus.bound(TrackPreference.FAMILY, "original sound");
        Object video = Reflect.invoke(aweme, "getVideo");
        if (video == null) return null;
        String key = Reflect.string(aweme, "getAid", "aid") + '#' + System.identityHashCode(video);
        Object made = MADE.get(key);
        if (made == null) {
            Class<?> type = audioType(aweme);
            made = type == null ? null : build(type, video);
            MADE.put(key, made == null ? NO_TRACK : made);
            if (made != null) {
                Logger.printDebug(() -> "Original sound: " + key + " gets the download file as a track");
            }
        }
        return made == NO_TRACK ? null : made;
    }

    /** Whether the video's audio is the original sound made here. */
    public static boolean carries(Object aweme) {
        Object audio = Reflect.invoke(aweme, "getAudio");
        Object infos = audio == null ? null : Reflect.invoke(audio, "getTtsInfos");
        if (!(infos instanceof List<?>)) return false;
        for (Object info : (List<?>) infos) {
            if (CODE.equals(Reflect.readField(info, "languageCode"))) return true;
        }
        return false;
    }

    /** The address the video plays from: its first rendition's, or its own. */
    static Object played(Object video) {
        Object gears = Reflect.invoke(video, "getRawBitRate");
        return gears instanceof List<?> && !((List<?>) gears).isEmpty()
            ? Reflect.property(((List<?>) gears).get(0), "getPlayAddr", "playAddr")
            : Reflect.invoke(video, "getPlayAddr");
    }

    /** One audio holding one track, the download file, or null when the video is its own file. */
    static Object build(Class<?> audioType, Object video) {
        Object original = VideoDownloads.originalAddress(video, played(video));
        if (original == null) return null;
        String uri = Reflect.string(original, "getUri", "uri");
        List<String> urls = VideoDownloads.urls(original);
        if (uri == null || urls.isEmpty()) return null;
        try {
            Class<?> infoType = Class.forName(sibling(audioType, "TtsInfos"), true, audioType.getClassLoader());
            Field addressField = Reflect.field(infoType, "playAddress");
            if (addressField == null) return null;
            Object address = addressField.getType().getConstructor().newInstance();
            set(address, "uri", uri);
            set(address, "urlList", new ArrayList<>(urls));
            set(address, "fileHash", Reflect.invoke(original, "getFileHash"));
            set(address, "width", Reflect.invoke(original, "getWidth"));
            set(address, "height", Reflect.invoke(original, "getHeight"));
            Object size = Reflect.invoke(original, "getSize");
            if (size instanceof Number) set(address, "dataSize", ((Number) size).longValue());

            Object info = infoType.getConstructor().newInstance();
            set(info, "playAddress", address);
            set(info, "languageCode", CODE);
            set(info, "format", FORMAT);
            set(info, "voiceType", "UNKNOWN");
            set(info, "subInfo", "");
            set(info, "volumeInfo", volume(Reflect.readField(video, "meta")));

            Object audio = audioType.getConstructor().newInstance();
            List<Object> infos = new ArrayList<>();
            infos.add(info);
            if (!set(audio, "TtsInfos", infos)) return null;
            return audio;
        } catch (ReflectiveOperationException | LinkageError | RuntimeException exception) {
            Logger.printDebug(() -> "Original sound: no track for " + uri + ": " + exception);
            return null;
        }
    }

    /** The video's measured loudness and peak as a dub track states them. */
    static String volume(Object meta) {
        if (!(meta instanceof String)) return DEFAULT_VOLUME;
        try {
            JSONObject measured = new JSONObject(new JSONObject((String) meta).optString("VolumeInfoJson", "{}"));
            double loudness = measured.optDouble("Loudness", Double.NaN);
            double peak = measured.optDouble("Peak", Double.NaN);
            if (Double.isNaN(loudness) || Double.isNaN(peak)) return DEFAULT_VOLUME;
            return new JSONObject().put("Loudness", loudness).put("Peak", peak).toString();
        } catch (Exception exception) {
            return DEFAULT_VOLUME;
        }
    }

    private static Class<?> audioType(Object aweme) {
        try {
            return aweme.getClass().getMethod("getAudio").getReturnType();
        } catch (NoSuchMethodException | RuntimeException exception) {
            return null;
        }
    }

    /** The class next to {@code type} with the same prefix, named {@code simpleName}. */
    static String sibling(Class<?> type, String simpleName) {
        String name = type.getName();
        int cut = Math.max(name.lastIndexOf('.'), name.lastIndexOf('$'));
        return name.substring(0, cut + 1) + simpleName;
    }

    private static boolean set(Object target, String name, Object value) {
        Field field = Reflect.field(target.getClass(), name);
        if (field == null) return false;
        try {
            field.set(target, value);
            return true;
        } catch (IllegalAccessException | IllegalArgumentException exception) {
            return false;
        }
    }

    /** Forgets every track made, for tests. */
    static void forget() {
        MADE.clear();
    }
}
