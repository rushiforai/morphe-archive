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

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.Context;
import android.net.Uri;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.Locale;
import java.util.TreeMap;
import java.util.concurrent.CancellationException;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.CaptionTrackList;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.patches.general.offline.OfflineCaptionChoices.Track;

/** Caption URLs are ephemeral; only downloaded cues and public file references enter the private index. */
final class OfflineCaptions {
    private static final String PLAYER_URL = "https://youtubei.googleapis.com/youtubei/v1/player?alt=proto";
    private static final String USER_AGENT = "com.google.android.youtube/20.10.38 (Linux; U; Android 11) gzip";
    private static final String FOLDER = "RVX/Subtitles";

    record Selection(List<Track> tracks, String format) {
        static Selection none() {
            return new Selection(List.of(), "srt");
        }
    }

    static final class Catalog {
        final List<Track> tracks;
        final Set<String> selected = new LinkedHashSet<>();
        boolean include;
        String format;
        final boolean rateLimited;

        Catalog(List<Track> tracks) {
            this(tracks, false);
        }

        Catalog(List<Track> tracks, boolean rateLimited) {
            this.rateLimited = rateLimited;
            this.tracks = tracks;
            include = Settings.OFFLINE_SUBTITLES_INCLUDE.get();
            format = "vtt".equals(Settings.OFFLINE_SUBTITLES_FORMAT.get()) ? "vtt" : "srt";
            String[] remembered = Settings.OFFLINE_SUBTITLES_LANGUAGES.get().split(",");
            OfflineCaptionChoices.restoreRemembered(selected, tracks, remembered);
            if (selected.isEmpty() && !tracks.isEmpty()) {
                Track preferred = tracks.get(0);
                for (Track track : tracks) {
                    if (track.translation().isEmpty() && (track.language().equals("en")
                            || track.language().startsWith("en-"))) {
                        preferred = track;
                        break;
                    }
                }
                selected.add(preferred.key());
            }
        }

        /** Language choices need no per-video player request; matching happens when each task starts. */
        static Catalog forBatch() {
            List<Track> languages = new ArrayList<>();
            Set<String> included = new LinkedHashSet<>();
            for (String key : Settings.OFFLINE_SUBTITLES_LANGUAGES.get().split(",")) {
                String language = OfflineBatchSubtitles.languageOf(key);
                if (!language.isEmpty() && included.add(language)) {
                    languages.add(languageChoice(key, language));
                }
            }
            TreeMap<String, String> sorted = new TreeMap<>();
            for (String language : Locale.getISOLanguages()) {
                if (!included.contains(language)) {
                    sorted.put(Locale.forLanguageTag(language).getDisplayName(), language);
                }
            }
            for (String language : sorted.values()) languages.add(languageChoice(language, language));
            return new Catalog(languages);
        }

        private static Track languageChoice(String key, String language) {
            return new Track(key, language, "", "", Locale.forLanguageTag(language).getDisplayName(), "");
        }

        Selection selection() {
            if (!include) return Selection.none();
            List<Track> result = new ArrayList<>();
            // Selection order is retained, so the default English track is also the player's first track.
            for (String key : selected) {
                for (Track track : tracks) {
                    if (key.equals(track.key())) result.add(track);
                }
            }
            return new Selection(List.copyOf(result), format);
        }

        void remember() {
            Settings.OFFLINE_SUBTITLES_INCLUDE.save(include);
            Settings.OFFLINE_SUBTITLES_FORMAT.save(format);
            Settings.OFFLINE_SUBTITLES_LANGUAGES.save(String.join(",", selected));
        }

        Track currentTrack(Track selected) {
            for (Track track : tracks) {
                if (track.key().equals(selected.key())) return track;
            }
            return selected;
        }
    }

    record Saved(String language, String kind, String format, String name, String uri, OfflineCueFile data) {
        Saved(String language, String kind, String format, String name, String uri, List<OfflineSubtitle.Cue> cues) {
            this(language, kind, format, name, uri, new OfflineCueFile(cues));
        }

        JSONObject toJson() throws JSONException {
            JSONObject json = new JSONObject();
            json.put("language", language);
            json.put("kind", kind);
            json.put("format", format);
            json.put("name", name);
            json.put("uri", uri);
            try {
                json.put("cueFile", data.store(cueDirectory(Utils.getContext())));
            } catch (IOException ex) {
                throw new JSONException(ex);
            }
            return json;
        }

        List<OfflineSubtitle.Cue> cues() {
            try {
                return data.load(cueDirectory(Utils.getContext()));
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not read saved subtitle cues", ex);
                return List.of();
            }
        }

        static Saved fromJson(JSONObject json) {
            return new Saved(json.optString("language"), json.optString("kind"), json.optString("format"),
                    json.optString("name"), json.optString("uri"), OfflineCueFile.fromJson(json));
        }
    }

    private static File cueDirectory(Context context) {
        return new File(OfflineIndex.getDirectory(context), "subs");
    }

    private OfflineCaptions() {
    }

    static Catalog resolve(String videoId, PlayerResponse response, boolean fetchMissing) {
        CaptionTrackList list = response.getCaptions().getPlayerCaptionsTracklistRenderer();
        logMetadata(videoId, "download", list);
        boolean rateLimited = false;
        if (fetchMissing && OfflineCaptionChoices.needsMetadata(list)) {
            try {
                CaptionTrackList fetched = fetchPlayer(videoId).getCaptions().getPlayerCaptionsTracklistRenderer();
                logMetadata(videoId, "ANDROID", fetched);
                if (fetched.getCaptionTracksCount() > 0) list = fetched;
            } catch (RateLimitException ex) {
                rateLimited = true;
            } catch (Exception ex) {
                Logger.printInfo(() -> "Offline captions unavailable for " + videoId, ex);
            }
        }
        return new Catalog(OfflineCaptionChoices.from(list), rateLimited);
    }

    private static void logMetadata(String videoId, String source, CaptionTrackList list) {
        Logger.printDebug(() -> "Offline captions " + videoId + " " + source
                + ": tracks=" + list.getCaptionTracksCount()
                + ", translation languages=" + list.getTranslationLanguagesCount());
    }

    private static PlayerResponse fetchPlayer(String videoId) throws IOException {
        HttpURLConnection connection = Requester.openConnection(PLAYER_URL);
        try {
            configure(connection);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("X-YouTube-Client-Name", "3");
            connection.setRequestProperty("X-YouTube-Client-Version", "20.10.38");
            connection.setDoOutput(true);
            String body = "{\"context\":{\"client\":{\"clientName\":\"ANDROID\","
                    + "\"clientVersion\":\"20.10.38\"}},\"videoId\":\"" + videoId
                    + "\",\"contentCheckOk\":true,\"racyCheckOk\":true}";
            try (var output = connection.getOutputStream()) {
                output.write(body.getBytes(StandardCharsets.UTF_8));
            }
            int status = connection.getResponseCode();
            Logger.printDebug(() -> "Offline caption player " + videoId + " HTTP " + status);
            checkPlayerStatus(status);
            try (InputStream input = connection.getInputStream()) {
                return PlayerResponse.parseFrom(input);
            }
        } finally {
            connection.disconnect();
        }
    }

    static void checkPlayerStatus(int status) throws IOException {
        if (OfflineSubtitle.isRateLimited(status, "")) throw new RateLimitException();
        if (status != 200) throw new IOException("Caption player HTTP " + status);
    }

    static void download(Context context, OfflineVideo video, OfflineDownloader.Task task) {
        Selection selection = task.subtitles;
        Catalog refreshed = task.resolved.captions();
        int savedBefore = video.subtitles.size();
        if (task.batch != null && task.batch.subtitleCounts.rateLimited) {
            task.batch.subtitleCounts.finished(selection.tracks.size(), 0, false);
            return;
        }
        String failedLanguage = null;
        String limitedLanguage = null;
        OfflineCaptionTranslationSession session = null;
        for (Track selected : selection.tracks) {
            if (task.cancelled || Thread.currentThread().isInterrupted()) break;
            Track track = refreshed.currentTrack(selected);
            OfflineMediaStore.Pending pending = null;
            try {
                if (!track.translation().isEmpty()) {
                    if (session == null) {
                        task.preparingTranslatedSubtitles();
                        CaptionTrackList list = fetchPlayer(video.videoId).getCaptions()
                                .getPlayerCaptionsTracklistRenderer();
                        logMetadata(video.videoId, "translation", list);
                        session = OfflineCaptionTranslationSession.create(video.videoId,
                                OfflineCaptionChoices.from(list));
                    }
                    track = session.currentTrack(selected);
                    session.awaitReady(task);
                }
                String json;
                try {
                    json = fetchTrack(track, session);
                } finally {
                    if (session != null && !track.translation().isEmpty()) session.requestFinished();
                }
                List<OfflineSubtitle.Cue> cues = OfflineSubtitle.parseJson3(json, "asr".equals(track.kind()));
                if (cues.isEmpty()) throw new IOException("Empty caption track");
                String displayName = OfflineSubtitle.fileName(video.title, video.videoId, track.language(),
                        track.kind(), track.translation(), selection.format);
                displayName = uniqueName(context, displayName);
                pending = OfflineMediaStore.create(context, OfflineMediaStore.Collection.SUBTITLE, FOLDER, displayName);
                try (var output = new android.os.ParcelFileDescriptor.AutoCloseOutputStream(
                        android.os.ParcelFileDescriptor.dup(pending.fileDescriptor()))) {
                    output.write(OfflineSubtitle.write(cues, selection.format).getBytes(StandardCharsets.UTF_8));
                }
                Uri uri = pending.commit();
                pending = null;
                OfflineMediaStore.retainSubtitleMime(context, uri, displayName);
                String language = track.translation().isEmpty() ? track.language() : track.translation();
                video.subtitles.add(new Saved(language, track.kind(), selection.format, track.name(),
                        uri.toString(), cues));
            } catch (RateLimitException ex) {
                limitedLanguage = track.name();
                break;
            } catch (CancellationException ex) {
                break;
            } catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
                break;
            } catch (Exception ex) {
                failedLanguage = track.name();
                String name = track.name();
                Logger.printInfo(() -> "Could not save offline subtitles: " + name, ex);
                if (session == null && !selected.translation().isEmpty()) break;
            } finally {
                if (pending != null) pending.abort();
            }
        }
        if (task.batch != null) {
            task.batch.subtitleCounts.finished(selection.tracks.size(), video.subtitles.size() - savedBefore,
                    limitedLanguage != null);
        } else if (limitedLanguage != null) {
            Utils.showToastShort(str("revanced_offline_subtitles_limited", limitedLanguage));
        } else if (failedLanguage != null) {
            Utils.showToastShort(str("revanced_offline_subtitles_failed", failedLanguage));
        }
    }

    private static String uniqueName(Context context, String name) {
        return OfflineSubtitle.uniqueName(name, candidate ->
                OfflineMediaStore.find(context, OfflineMediaStore.Collection.SUBTITLE, FOLDER, candidate) != null);
    }

    private static String fetchTrack(Track track, OfflineCaptionTranslationSession session) throws IOException {
        String url = track.url().replaceAll("&fmt=[^&]*", "") + "&fmt=json3";
        if (!track.translation().isEmpty()) {
            url += "&tlang=" + Uri.encode(track.translation())
                    + "&c=ANDROID&cver=20.10.38&xorb=2&xobt=3&xovt=3&cplayer=UNIPLAYER";
        }
        HttpURLConnection connection = Requester.openConnection(url);
        try {
            configure(connection);
            if (session != null && !track.translation().isEmpty()) session.applyHeaders(connection);
            int status = connection.getResponseCode();
            String language = track.translation().isEmpty() ? track.language() : track.translation();
            Logger.printDebug(() -> "Offline caption request " + language + " HTTP " + status);
            if (OfflineSubtitle.isRateLimited(status, "")) throw new RateLimitException();
            String body = status == 200 ? Requester.parseString(connection) : Requester.parseErrorString(connection);
            if (OfflineSubtitle.isRateLimited(status, body)) throw new RateLimitException();
            if (status != 200) throw new IOException("Caption HTTP " + status);
            return body;
        } finally {
            connection.disconnect();
        }
    }

    private static void configure(HttpURLConnection connection) {
        connection.setConnectTimeout(10_000);
        connection.setReadTimeout(15_000);
        connection.setRequestProperty("User-Agent", USER_AGENT);
    }

    static void delete(Context context, OfflineVideo video) {
        for (Saved subtitle : video.subtitles) {
            subtitle.data.delete(cueDirectory(context));
            try {
                Uri uri = Uri.parse(subtitle.uri);
                if ("file".equals(uri.getScheme())) {
                    String path = uri.getPath();
                    if (path != null) new File(path).delete();
                } else if ("content".equals(uri.getScheme())) {
                    context.getContentResolver().delete(uri, null, null);
                }
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not delete offline subtitle " + subtitle.uri, ex);
                Utils.showToastShort(str("revanced_offline_subtitles_delete_failed"));
            }
        }
    }

    static final class RateLimitException extends IOException {
    }
}
