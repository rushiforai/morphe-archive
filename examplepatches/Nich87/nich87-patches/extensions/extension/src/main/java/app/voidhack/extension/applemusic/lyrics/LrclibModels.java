package app.voidhack.extension.applemusic.lyrics;

import org.json.JSONException;
import org.json.JSONObject;

final class LrclibModels {
    private LrclibModels() {}

    enum FallbackMode {
        MISSING_AND_UNSYNCED,
        MISSING_ONLY,
        PREFER_LRCLIB;

        static FallbackMode fromName(String name) {
            if (name == null) return MISSING_AND_UNSYNCED;
            for (FallbackMode mode : values()) {
                if (mode.name().equals(name)) return mode;
            }
            return MISSING_AND_UNSYNCED;
        }
    }

    enum LocalLrcPriority {
        PREFER_LOCAL,
        MISSING_AND_UNSYNCED,
        MISSING_ONLY;

        static LocalLrcPriority fromName(String name) {
            if (name == null) return PREFER_LOCAL;
            for (LocalLrcPriority mode : values()) {
                if (mode.name().equals(name)) return mode;
            }
            return PREFER_LOCAL;
        }
    }

    enum OverrideMode {
        AUTO,
        FORCE_OFFICIAL,
        FORCE_LRCLIB_AUTO,
        FORCE_LRCLIB_ID,
        FORCE_LOCAL_LRC;

        static OverrideMode fromName(String name) {
            if (name == null) return AUTO;
            for (OverrideMode mode : values()) {
                if (mode.name().equals(name)) return mode;
            }
            return AUTO;
        }
    }

    enum LyricsSource {
        UNKNOWN,
        OFFICIAL_WORD,
        OFFICIAL_LINE,
        OFFICIAL_STATIC,
        LRCLIB_WORD,
        LRCLIB_LINE,
        LRCLIB_PLAIN,
        LRCLIB_INSTRUMENTAL,
        LOCAL_WORD,
        LOCAL_LINE,
        LOCAL_PLAIN,
        LOADING_LRCLIB,
        NONE;

        boolean isLrclib() {
            return this == LRCLIB_WORD || this == LRCLIB_LINE
                    || this == LRCLIB_PLAIN || this == LRCLIB_INSTRUMENTAL;
        }

        boolean isLocal() {
            return this == LOCAL_WORD || this == LOCAL_LINE || this == LOCAL_PLAIN;
        }

        boolean hasUsableLrclibLyrics() {
            return this == LRCLIB_WORD || this == LRCLIB_LINE || this == LRCLIB_PLAIN;
        }

        boolean hasUsableExternalLyrics() {
            return hasUsableLrclibLyrics() || isLocal();
        }

        boolean isOfficial() {
            return this == OFFICIAL_WORD || this == OFFICIAL_LINE || this == OFFICIAL_STATIC;
        }
    }

    static final class TrackQuery {
        final String trackKey;
        final long adamId;
        final long queueId;
        final String title;
        final String artist;
        final String album;
        final int durationSec;
        final boolean hasOfficialLyrics;
        final boolean hasCustomLyrics;
        final boolean hasTimeSyncedLyrics;

        TrackQuery(String trackKey, long adamId, long queueId, String title, String artist,
                   String album, int durationSec, boolean hasOfficialLyrics, boolean hasCustomLyrics) {
            this(trackKey, adamId, queueId, title, artist, album, durationSec,
                    hasOfficialLyrics, hasCustomLyrics, hasOfficialLyrics);
        }

        TrackQuery(String trackKey, long adamId, long queueId, String title, String artist,
                   String album, int durationSec, boolean hasOfficialLyrics, boolean hasCustomLyrics,
                   boolean hasTimeSyncedLyrics) {
            this.trackKey = trackKey == null ? "" : trackKey;
            this.adamId = adamId;
            this.queueId = queueId;
            this.title = title == null ? "" : title.trim();
            this.artist = artist == null ? "" : artist.trim();
            this.album = album == null ? "" : album.trim();
            this.durationSec = durationSec;
            this.hasOfficialLyrics = hasOfficialLyrics;
            this.hasCustomLyrics = hasCustomLyrics;
            this.hasTimeSyncedLyrics = hasTimeSyncedLyrics;
        }
    }

    static final class LyricsRecord {
        final long id;
        final String trackName;
        final String artistName;
        final String albumName;
        final double duration;
        final boolean instrumental;
        final boolean hasWordSync;
        final String plainLyrics;
        final String syncedLyrics;
        final String lyricsfile;

        LyricsRecord(long id, String trackName, String artistName, String albumName,
                     double duration, boolean instrumental, boolean hasWordSync,
                     String plainLyrics, String syncedLyrics, String lyricsfile) {
            this.id = id;
            this.trackName = trackName == null ? "" : trackName;
            this.artistName = artistName == null ? "" : artistName;
            this.albumName = albumName == null ? "" : albumName;
            this.duration = duration;
            this.instrumental = instrumental;
            this.hasWordSync = hasWordSync;
            this.plainLyrics = emptyToNull(plainLyrics);
            this.syncedLyrics = emptyToNull(syncedLyrics);
            this.lyricsfile = emptyToNull(lyricsfile);
        }

        boolean hasSynced() {
            return syncedLyrics != null || hasWordSync;
        }

        boolean hasPlain() {
            return plainLyrics != null;
        }

        boolean hasAnyLyrics() {
            return hasSynced() || hasPlain();
        }

        static LyricsRecord fromJson(JSONObject json) {
            if (json == null) return null;
            long id = json.optLong("id", -1L);
            if (id <= 0L) return null;
            String track = optNullableString(json, "trackName");
            if (track == null) track = optNullableString(json, "name");
            return new LyricsRecord(
                    id,
                    track,
                    optNullableString(json, "artistName"),
                    optNullableString(json, "albumName"),
                    json.optDouble("duration", 0.0),
                    json.optBoolean("instrumental", false),
                    json.optBoolean("hasWordSync", false),
                    optNullableString(json, "plainLyrics"),
                    optNullableString(json, "syncedLyrics"),
                    optNullableString(json, "lyricsfile")
            );
        }

        JSONObject toJson() throws JSONException {
            JSONObject obj = new JSONObject();
            obj.put("id", id);
            obj.put("trackName", trackName);
            obj.put("artistName", artistName);
            obj.put("albumName", albumName);
            obj.put("duration", duration);
            obj.put("instrumental", instrumental);
            obj.put("hasWordSync", hasWordSync);
            if (plainLyrics != null) obj.put("plainLyrics", plainLyrics);
            if (syncedLyrics != null) obj.put("syncedLyrics", syncedLyrics);
            if (lyricsfile != null) obj.put("lyricsfile", lyricsfile);
            return obj;
        }
    }

    static final class SearchSummary {
        final long id;
        final String trackName;
        final String artistName;
        final String albumName;
        final double duration;
        final boolean instrumental;
        final boolean hasWordSync;
        final boolean hasPlainLyrics;
        final boolean hasSyncedLyrics;
        final boolean hasLyricsfile;
        final LyricsRecord fullRecord;

        SearchSummary(long id, String trackName, String artistName, String albumName,
                      double duration, boolean instrumental, boolean hasWordSync,
                      boolean hasPlainLyrics, boolean hasSyncedLyrics, boolean hasLyricsfile,
                      LyricsRecord fullRecord) {
            this.id = id;
            this.trackName = trackName == null ? "" : trackName;
            this.artistName = artistName == null ? "" : artistName;
            this.albumName = albumName == null ? "" : albumName;
            this.duration = duration;
            this.instrumental = instrumental;
            this.hasWordSync = hasWordSync;
            this.hasPlainLyrics = hasPlainLyrics;
            this.hasSyncedLyrics = hasSyncedLyrics;
            this.hasLyricsfile = hasLyricsfile;
            this.fullRecord = fullRecord;
        }

        static SearchSummary fromV2Json(JSONObject json) {
            if (json == null) return null;
            long id = json.optLong("id", -1L);
            if (id <= 0L) return null;
            return new SearchSummary(
                    id,
                    optNullableString(json, "trackName"),
                    optNullableString(json, "artistName"),
                    optNullableString(json, "albumName"),
                    json.optDouble("duration", 0.0),
                    json.optBoolean("instrumental", false),
                    json.optBoolean("hasWordSync", false),
                    json.optBoolean("hasPlainLyrics", false),
                    json.optBoolean("hasSyncedLyrics", false),
                    json.optBoolean("hasLyricsfile", false),
                    null
            );
        }

        static SearchSummary fromV1Json(JSONObject json) {
            LyricsRecord rec = LyricsRecord.fromJson(json);
            if (rec == null) return null;
            return new SearchSummary(
                    rec.id,
                    rec.trackName,
                    rec.artistName,
                    rec.albumName,
                    rec.duration,
                    rec.instrumental,
                    rec.hasWordSync,
                    rec.hasPlain(),
                    rec.syncedLyrics != null,
                    rec.lyricsfile != null,
                    rec
            );
        }
    }

    static final class TrackOverride {
        final String trackKey;
        final String trackTitle;
        final String artistName;
        final OverrideMode mode;
        final long lrclibId;
        final int offsetMs;
        final long updatedAt;
        final String localFileName;
        final boolean localForceUnsynced;

        TrackOverride(String trackKey, String trackTitle, String artistName,
                      OverrideMode mode, long lrclibId, int offsetMs, long updatedAt) {
            this(trackKey, trackTitle, artistName, mode, lrclibId, offsetMs, updatedAt, "", false);
        }

        TrackOverride(String trackKey, String trackTitle, String artistName,
                      OverrideMode mode, long lrclibId, int offsetMs, long updatedAt,
                      String localFileName, boolean localForceUnsynced) {
            this.trackKey = trackKey == null ? "" : trackKey;
            this.trackTitle = trackTitle == null ? "" : trackTitle;
            this.artistName = artistName == null ? "" : artistName;
            this.mode = mode == null ? OverrideMode.AUTO : mode;
            this.lrclibId = lrclibId;
            this.offsetMs = offsetMs;
            this.updatedAt = updatedAt;
            this.localFileName = localFileName == null ? "" : localFileName;
            this.localForceUnsynced = localForceUnsynced;
        }

        boolean isEmpty() {
            return mode == OverrideMode.AUTO && lrclibId <= 0L && offsetMs == 0;
        }

        JSONObject toJson() throws JSONException {
            JSONObject obj = new JSONObject();
            obj.put("trackKey", trackKey);
            obj.put("trackTitle", trackTitle);
            obj.put("artistName", artistName);
            obj.put("mode", mode.name());
            obj.put("lrclibId", lrclibId);
            obj.put("offsetMs", offsetMs);
            obj.put("updatedAt", updatedAt);
            if (!localFileName.isEmpty()) obj.put("localFileName", localFileName);
            if (localForceUnsynced) obj.put("localForceUnsynced", true);
            return obj;
        }

        static TrackOverride fromJson(String key, JSONObject obj) {
            if (obj == null) return null;
            return new TrackOverride(
                    key,
                    obj.optString("trackTitle", ""),
                    obj.optString("artistName", ""),
                    OverrideMode.fromName(obj.optString("mode", OverrideMode.AUTO.name())),
                    obj.optLong("lrclibId", -1L),
                    obj.optInt("offsetMs", 0),
                    obj.optLong("updatedAt", 0L),
                    obj.optString("localFileName", ""),
                    obj.optBoolean("localForceUnsynced", false)
            );
        }
    }

    static String optNullableString(JSONObject obj, String key) {
        if (obj == null || !obj.has(key) || obj.isNull(key)) return null;
        String value = obj.optString(key, null);
        return emptyToNull(value);
    }

    static String emptyToNull(String value) {
        if (value == null) return null;
        return value.trim().isEmpty() ? null : value;
    }
}
