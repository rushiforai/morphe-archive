package app.voidhack.extension.applemusic.lyrics;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

final class LyricsEdits {
    private static final String TAG = "AppleMusicLrclib";
    private static final String PREFS_NAME = "voidhack_lyrics_line_edits";
    private static final String META_PREFS_NAME = "voidhack_lyrics_line_edits_meta";

    static final class StoredLineEdit {
        final int index;
        final long startMs;
        final String originalText;
        final String editedText;
        final String originalReading;
        final String editedReading;
        final String currentReading;

        StoredLineEdit(
                int index,
                long startMs,
                String originalText,
                String editedText,
                String originalReading,
                String editedReading,
                String currentReading) {
            this.index = index;
            this.startMs = startMs;
            this.originalText = originalText == null ? "" : originalText;
            this.editedText = editedText == null ? "" : editedText;
            this.originalReading = originalReading == null ? "" : originalReading;
            this.editedReading = editedReading == null ? "" : editedReading;
            this.currentReading = currentReading == null ? "" : currentReading;
        }

        String displayCurrentText() {
            return !editedText.isEmpty() ? editedText : originalText;
        }

        String displayCurrentReading() {
            if (!editedReading.isEmpty()) return editedReading;
            if (!currentReading.isEmpty()) return currentReading;
            return originalReading;
        }

        boolean isTextChanged() {
            return !editedText.isEmpty() && !editedText.equals(originalText);
        }

        boolean isReadingChanged() {
            String curr = displayCurrentReading();
            if (!editedReading.isEmpty()) return !editedReading.equals(originalReading);
            return !curr.isEmpty() && !curr.equals(originalReading);
        }
    }

    static final class DocumentRecord {
        final String documentKey;
        final String trackKey;
        final String trackTitle;
        final String artistName;
        final int editedLineCount;
        final long updatedAt;
        final List<StoredLineEdit> lines;

        DocumentRecord(
                String documentKey,
                String trackKey,
                String trackTitle,
                String artistName,
                int editedLineCount,
                long updatedAt,
                List<StoredLineEdit> lines) {
            this.documentKey = documentKey == null ? "" : documentKey;
            this.trackKey = trackKey == null ? "" : trackKey;
            this.trackTitle = trackTitle == null ? "" : trackTitle;
            this.artistName = artistName == null ? "" : artistName;
            this.editedLineCount = editedLineCount;
            this.updatedAt = updatedAt;
            this.lines = lines == null ? Collections.emptyList() : lines;
        }
    }

    private LyricsEdits() {}

    static String documentKey(String trackKey, String sourceKey, String originalLyrics) {
        if (trackKey == null || trackKey.isEmpty() || sourceKey == null || originalLyrics == null) return null;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            update(digest, trackKey);
            update(digest, sourceKey);
            update(digest, originalLyrics);
            StringBuilder result = new StringBuilder(64);
            for (byte b : digest.digest()) {
                result.append(Character.forDigit((b >>> 4) & 0xF, 16));
                result.append(Character.forDigit(b & 0xF, 16));
            }
            return result.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new AssertionError(e);
        }
    }

    private static void update(MessageDigest digest, String value) {
        digest.update(Integer.toString(value.length()).getBytes(StandardCharsets.US_ASCII));
        digest.update((byte) ':');
        digest.update(value.getBytes(StandardCharsets.UTF_8));
    }

    static Map<Integer, LyricsEditTtml.Edit> load(Context context, String documentKey) {
        if (documentKey == null) return Collections.emptyMap();
        String value = prefs(context).getString(documentKey, null);
        if (value == null) return Collections.emptyMap();
        Map<Integer, LyricsEditTtml.Edit> result = new HashMap<>();
        try {
            JSONObject stored = new JSONObject(value);
            for (Iterator<String> keys = stored.keys(); keys.hasNext();) {
                String key = keys.next();
                JSONObject row = stored.optJSONObject(key);
                if (row != null) {
                    result.put(Integer.parseInt(key), new LyricsEditTtml.Edit(row.optString("text", null),
                            row.optString("reading", null)));
                }
            }
        } catch (JSONException | NumberFormatException e) {
            Log.w(TAG, "Could not read lyric line edits", e);
        }
        return result;
    }

    static synchronized boolean save(Context context, String documentKey, int index, String text, String reading) {
        return save(context, documentKey, index, text, reading, null, null, null, null, null, -1L);
    }

    static synchronized boolean save(
            Context context,
            String documentKey,
            int index,
            String text,
            String reading,
            String trackKey,
            String trackTitle,
            String artistName,
            String originalText,
            String originalReading,
            long startMs) {
        if (documentKey == null || index < 0) return false;
        SharedPreferences preferences = prefs(context);
        SharedPreferences meta = metaPrefs(context);
        LyricsEditTtml.Edit edit = new LyricsEditTtml.Edit(text, reading);
        try {
            JSONObject stored = new JSONObject(preferences.getString(documentKey, "{}"));
            String key = Integer.toString(index);
            if (edit.text == null && edit.reading == null) {
                stored.remove(key);
            } else {
                JSONObject row = new JSONObject();
                row.put("text", edit.text);
                row.put("reading", edit.reading);
                stored.put(key, row);
            }
            SharedPreferences.Editor editor = preferences.edit();
            SharedPreferences.Editor metaEditor = meta.edit();
            if (stored.length() == 0) {
                editor.remove(documentKey);
                metaEditor.remove(documentKey);
            } else {
                editor.putString(documentKey, stored.toString());
                JSONObject prevMeta = parseJsonQuietly(meta.getString(documentKey, null));
                JSONObject nextMeta = new JSONObject();
                nextMeta.put("trackKey", firstNonEmpty(trackKey, prevMeta.optString("trackKey", "")));
                nextMeta.put("trackTitle", firstNonEmpty(trackTitle, prevMeta.optString("trackTitle", "")));
                nextMeta.put("artistName", firstNonEmpty(artistName, prevMeta.optString("artistName", "")));
                nextMeta.put("updatedAt", System.currentTimeMillis());

                JSONObject prevLines = prevMeta.optJSONObject("lines");
                JSONObject nextLines = prevLines != null ? new JSONObject(prevLines.toString()) : new JSONObject();
                if (edit.text == null && edit.reading == null) {
                    nextLines.remove(key);
                } else {
                    JSONObject prevLine = nextLines.optJSONObject(key);
                    JSONObject lineMeta = new JSONObject();
                    String origT = firstNonEmpty(originalText, prevLine != null ? prevLine.optString("origText", "") : "");
                    String origR = firstNonEmpty(originalReading, prevLine != null ? prevLine.optString("origReading", "") : "");
                    long ms = startMs >= 0L ? startMs : (prevLine != null ? prevLine.optLong("startMs", -1L) : -1L);
                    if (!origT.isEmpty()) lineMeta.put("origText", origT);
                    if (!origR.isEmpty()) lineMeta.put("origReading", origR);
                    if (ms >= 0L) lineMeta.put("startMs", ms);
                    nextLines.put(key, lineMeta);
                }
                nextMeta.put("lines", nextLines);
                metaEditor.putString(documentKey, nextMeta.toString());
            }
            boolean ok = editor.commit();
            if (ok) metaEditor.apply();
            return ok;
        } catch (JSONException e) {
            Log.w(TAG, "Could not save lyric line edits", e);
            return false;
        }
    }

    static synchronized void backfillMetadata(
            Context context,
            String documentKey,
            String trackKey,
            String trackTitle,
            String artistName,
            List<LyricsEditTtml.EditedLine> editedLines) {
        if (context == null || documentKey == null || documentKey.isEmpty()
                || editedLines == null || editedLines.isEmpty()) {
            return;
        }
        SharedPreferences meta = metaPrefs(context);
        JSONObject prevMeta = parseJsonQuietly(meta.getString(documentKey, null));
        String prevTitle = prevMeta.optString("trackTitle", "");
        String prevArtist = prevMeta.optString("artistName", "");
        String prevTrackKey = prevMeta.optString("trackKey", "");
        JSONObject prevLines = prevMeta.optJSONObject("lines");

        boolean needsUpdate = (prevTitle.isEmpty() && trackTitle != null && !trackTitle.trim().isEmpty())
                || (prevArtist.isEmpty() && artistName != null && !artistName.trim().isEmpty())
                || (prevTrackKey.isEmpty() && trackKey != null && !trackKey.trim().isEmpty())
                || prevLines == null;
        if (!needsUpdate) {
            for (LyricsEditTtml.EditedLine line : editedLines) {
                JSONObject existing = prevLines.optJSONObject(Integer.toString(line.index));
                if (existing == null
                        || (existing.optString("origText", "").isEmpty() && !line.originalText.isEmpty())
                        || (existing.optString("origReading", "").isEmpty() && !line.originalReading.isEmpty())
                        || !existing.optString("currReading", "").equals(line.currentReading)
                        || (existing.optLong("startMs", -1L) < 0L && line.startMs >= 0L)) {
                    needsUpdate = true;
                    break;
                }
            }
        }
        if (!needsUpdate) return;

        try {
            JSONObject nextMeta = new JSONObject();
            nextMeta.put("trackKey", firstNonEmpty(trackKey, prevTrackKey));
            nextMeta.put("trackTitle", firstNonEmpty(trackTitle, prevTitle));
            nextMeta.put("artistName", firstNonEmpty(artistName, prevArtist));
            long prevUpdated = prevMeta.optLong("updatedAt", 0L);
            nextMeta.put("updatedAt", prevUpdated > 0L ? prevUpdated : System.currentTimeMillis());

            JSONObject nextLines = prevLines != null ? new JSONObject(prevLines.toString()) : new JSONObject();
            for (LyricsEditTtml.EditedLine line : editedLines) {
                String key = Integer.toString(line.index);
                JSONObject prevLine = nextLines.optJSONObject(key);
                JSONObject lineMeta = new JSONObject();
                String origT = firstNonEmpty(line.originalText, prevLine != null ? prevLine.optString("origText", "") : "");
                String origR = firstNonEmpty(line.originalReading, prevLine != null ? prevLine.optString("origReading", "") : "");
                String currR = firstNonEmpty(line.currentReading, prevLine != null ? prevLine.optString("currReading", "") : "");
                long ms = line.startMs >= 0L ? line.startMs : (prevLine != null ? prevLine.optLong("startMs", -1L) : -1L);
                if (!origT.isEmpty()) lineMeta.put("origText", origT);
                if (!origR.isEmpty()) lineMeta.put("origReading", origR);
                if (!currR.isEmpty()) lineMeta.put("currReading", currR);
                if (ms >= 0L) lineMeta.put("startMs", ms);
                nextLines.put(key, lineMeta);
            }
            nextMeta.put("lines", nextLines);
            meta.edit().putString(documentKey, nextMeta.toString()).apply();
        } catch (JSONException ignored) {
        }
    }

    static synchronized boolean clearDocument(Context context, String documentKey) {
        if (context == null || documentKey == null || documentKey.isEmpty()) return false;
        boolean ok = prefs(context).edit().remove(documentKey).commit();
        metaPrefs(context).edit().remove(documentKey).apply();
        return ok;
    }

    static synchronized void clearAll(Context context) {
        if (context == null) return;
        prefs(context).edit().clear().commit();
        metaPrefs(context).edit().clear().apply();
    }

    static synchronized int countDocuments(Context context) {
        if (context == null) return 0;
        return listAll(context).size();
    }

    static synchronized DocumentRecord getDocument(Context context, String documentKey) {
        if (context == null || documentKey == null || documentKey.isEmpty()) return null;
        String raw = prefs(context).getString(documentKey, null);
        if (raw == null || raw.isEmpty()) return null;
        JSONObject m = parseJsonQuietly(metaPrefs(context).getString(documentKey, null));
        return buildDocumentRecord(documentKey, raw, m);
    }

    static synchronized List<DocumentRecord> listAll(Context context) {
        if (context == null) return Collections.emptyList();
        Map<String, ?> all = prefs(context).getAll();
        if (all == null || all.isEmpty()) return Collections.emptyList();
        SharedPreferences meta = metaPrefs(context);
        List<DocumentRecord> result = new ArrayList<>();
        for (Map.Entry<String, ?> entry : all.entrySet()) {
            String docKey = entry.getKey();
            Object rawVal = entry.getValue();
            if (!(rawVal instanceof String)) continue;
            JSONObject m = parseJsonQuietly(meta.getString(docKey, null));
            DocumentRecord rec = buildDocumentRecord(docKey, (String) rawVal, m);
            if (rec != null) result.add(rec);
        }
        Collections.sort(result, new Comparator<DocumentRecord>() {
            @Override
            public int compare(DocumentRecord a, DocumentRecord b) {
                return Long.compare(b.updatedAt, a.updatedAt);
            }
        });
        return result;
    }

    private static DocumentRecord buildDocumentRecord(String docKey, String rawJson, JSONObject metaObj) {
        if (rawJson == null || rawJson.isEmpty()) return null;
        try {
            JSONObject obj = new JSONObject(rawJson);
            JSONObject metaLines = metaObj != null ? metaObj.optJSONObject("lines") : null;
            List<StoredLineEdit> lines = new ArrayList<>();
            for (Iterator<String> it = obj.keys(); it.hasNext();) {
                String k = it.next();
                int idx;
                try {
                    idx = Integer.parseInt(k);
                } catch (NumberFormatException ignored) {
                    continue;
                }
                JSONObject row = obj.optJSONObject(k);
                if (row == null) continue;
                String editedText = row.optString("text", null);
                String editedReading = row.optString("reading", null);
                if (editedText == null && editedReading == null) continue;
                JSONObject ml = metaLines != null ? metaLines.optJSONObject(k) : null;
                lines.add(new StoredLineEdit(
                        idx,
                        ml != null ? ml.optLong("startMs", -1L) : -1L,
                        ml != null ? ml.optString("origText", "") : "",
                        editedText != null ? editedText : "",
                        ml != null ? ml.optString("origReading", "") : "",
                        editedReading != null ? editedReading : "",
                        ml != null ? ml.optString("currReading", "") : ""
                ));
            }
            if (lines.isEmpty()) return null;
            Collections.sort(lines, new Comparator<StoredLineEdit>() {
                @Override
                public int compare(StoredLineEdit a, StoredLineEdit b) {
                    return Integer.compare(a.index, b.index);
                }
            });
            return new DocumentRecord(
                    docKey,
                    metaObj != null ? metaObj.optString("trackKey", "") : "",
                    metaObj != null ? metaObj.optString("trackTitle", "") : "",
                    metaObj != null ? metaObj.optString("artistName", "") : "",
                    lines.size(),
                    metaObj != null ? metaObj.optLong("updatedAt", 0L) : 0L,
                    lines
            );
        } catch (JSONException e) {
            return null;
        }
    }

    private static JSONObject parseJsonQuietly(String raw) {
        if (raw == null || raw.isEmpty()) return new JSONObject();
        try {
            return new JSONObject(raw);
        } catch (JSONException e) {
            return new JSONObject();
        }
    }

    private static String firstNonEmpty(String primary, String fallback) {
        if (primary != null && !primary.trim().isEmpty()) return primary.trim();
        return fallback == null ? "" : fallback.trim();
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    private static SharedPreferences metaPrefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(META_PREFS_NAME, Context.MODE_PRIVATE);
    }
}
