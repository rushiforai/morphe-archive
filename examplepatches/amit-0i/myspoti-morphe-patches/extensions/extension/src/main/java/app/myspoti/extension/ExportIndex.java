package app.myspoti.extension;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Portable export index stored in the user-selected folder. The index and generated
 * playlist/album manifests live beside the audio, not in app-private data, so they
 * can be rediscovered after MySpoti is reinstalled and the folder is reconnected.
 */
final class ExportIndex {
    static final String PREFS = "morphe_download_tools";
    static final String PREF_EXPORT_TREE_URI = "export_tree_uri";
    static final String PREF_AUTO_SYNC = "export_auto_sync";
    static final String PREF_DELETE_REMOVED = "export_delete_removed";
    static final String INDEX_NAME = "MySpoti Export Index.json";
    private static final String FORMAT = "myspoti-export-index";
    private static final int VERSION = 4;
    // Incremented when the lyrics fetch bridge changes so previously failed attempts are retried
    // once after an update instead of remaining suppressed by the old retry timestamp.
    private static final int LYRICS_LOOKUP_VERSION = 2;

    private final Context context;
    private final ContentResolver resolver;
    private final Uri tree;
    private final Uri parent;
    private final String parentDocumentId;
    private Uri indexUri;
    private JSONObject root;
    private JSONObject entries;
    private JSONObject collectionEntries;
    private final List<Child> children = new ArrayList<>();
    // SAF providers can be slow when queried once per document. Keep one child listing per
    // directory for the lifetime of a sync and reuse it for track checks and filename lookups.
    private final Map<String, List<Child>> childCache = new HashMap<>();

    private ExportIndex(Context context, Uri tree) throws Exception {
        this.context = context.getApplicationContext();
        this.resolver = context.getContentResolver();
        this.tree = tree;
        this.parentDocumentId = DocumentsContract.getTreeDocumentId(tree);
        this.parent = DocumentsContract.buildDocumentUriUsingTree(tree, parentDocumentId);
        loadChildren();
        loadOrCreateIndex();
    }

    static ExportIndex open(Context context, Uri tree) throws Exception {
        if (tree == null) throw new IOException("No export folder has been selected.");
        return new ExportIndex(context, tree);
    }

    private void loadChildren() throws Exception {
        children.clear();
        childCache.clear();
        children.addAll(queryChildren(parentDocumentId));
        childCache.put(parentDocumentId, new ArrayList<>(children));
    }

    private List<Child> childrenForParent(String parentId) throws Exception {
        List<Child> cached = childCache.get(parentId);
        if (cached != null) return cached;
        List<Child> loaded = queryChildren(parentId);
        childCache.put(parentId, loaded);
        return loaded;
    }

    private void rememberChild(String parentId, Child child) {
        List<Child> cached = childCache.get(parentId);
        if (cached != null) cached.add(child);
        if (parentDocumentId.equals(parentId)) {
            boolean exists = false;
            for (Child item : children) if (item.id.equals(child.id)) { exists = true; break; }
            if (!exists) children.add(child);
        }
    }

    private String parentIdForRelativePath(String relativePath) throws Exception {
        String normalized = relativePath == null ? "" : relativePath.replace('\\', '/').trim();
        while (normalized.startsWith("/")) normalized = normalized.substring(1);
        String[] parts = normalized.isEmpty() ? new String[0] : normalized.split("/");
        String folderId = parentDocumentId;
        for (int i = 0; i < parts.length - 1; i++) {
            String folderName = parts[i];
            Child found = null;
            for (Child child : childrenForParent(folderId)) {
                if (folderName.equals(child.name)
                        && DocumentsContract.Document.MIME_TYPE_DIR.equals(child.mime)) {
                    found = child;
                    break;
                }
            }
            if (found == null) return null;
            folderId = found.id;
        }
        return folderId;
    }

    private List<Child> queryChildren(String parentId) throws Exception {
        List<Child> result = new ArrayList<>();
        Uri childrenUri = DocumentsContract.buildChildDocumentsUriUsingTree(tree, parentId);
        String[] projection = new String[] {
                DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_MIME_TYPE,
                DocumentsContract.Document.COLUMN_SIZE
        };
        try (Cursor cursor = resolver.query(childrenUri, projection, null, null, null)) {
            if (cursor == null) throw new IOException("The selected folder cannot be listed by Android.");
            int idCol = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_DOCUMENT_ID);
            int nameCol = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_DISPLAY_NAME);
            int mimeCol = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_MIME_TYPE);
            int sizeCol = cursor.getColumnIndex(DocumentsContract.Document.COLUMN_SIZE);
            while (cursor.moveToNext()) {
                String id = idCol >= 0 ? cursor.getString(idCol) : null;
                if (id == null) continue;
                String name = nameCol >= 0 ? cursor.getString(nameCol) : "";
                String mime = mimeCol >= 0 ? cursor.getString(mimeCol) : "";
                long size = sizeCol >= 0 && !cursor.isNull(sizeCol) ? cursor.getLong(sizeCol) : -1L;
                result.add(new Child(id, name == null ? "" : name, mime == null ? "" : mime, size));
            }
        }
        return result;
    }

    private void loadOrCreateIndex() throws Exception {
        for (Child child : children) {
            if (INDEX_NAME.equals(child.name) && !DocumentsContract.Document.MIME_TYPE_DIR.equals(child.mime)) {
                indexUri = documentUri(child.id);
                break;
            }
        }

        if (indexUri != null) {
            try (InputStream input = resolver.openInputStream(indexUri)) {
                if (input == null) throw new IOException("The export index could not be opened.");
                byte[] bytes = readAll(input);
                root = new JSONObject(new String(bytes, StandardCharsets.UTF_8));
                if (!FORMAT.equals(root.optString("format"))) {
                    throw new IOException("The selected folder contains an unknown MySpoti export index; it was left untouched.");
                }
                entries = root.optJSONObject("entries");
                if (entries == null) entries = new JSONObject();
                collectionEntries = root.optJSONObject("collections");
                if (collectionEntries == null) collectionEntries = new JSONObject();
            } catch (JSONException e) {
                throw new IOException("The MySpoti export index is unreadable. It was left untouched to protect your history.", e);
            }
        } else {
            root = new JSONObject();
            entries = new JSONObject();
            collectionEntries = new JSONObject();
            root.put("format", FORMAT);
            root.put("version", VERSION);
            root.put("appPackage", "app.myspoti.stable");
            root.put("appVersion", "2.3.0");
            root.put("createdAt", System.currentTimeMillis());
            root.put("entries", entries);
            root.put("collections", collectionEntries);
            // Create a portable index before exporting anything, so an interrupted sync
            // can be resumed without guessing which files are already owned by this patch.
            indexUri = DocumentsContract.createDocument(resolver, parent, "application/json", INDEX_NAME);
            if (indexUri == null) throw new IOException("Android could not create the export index in this folder.");
            save();
        }
        // Upgrade older v1 indexes in place. Track records remain valid; collection manifests
        // are added to the same portable document without rewriting any audio files.
        if (root.optInt("version", 1) < VERSION || root.optJSONObject("collections") == null
                || root.optJSONArray("singles") == null) {
            root.put("version", VERSION);
            root.put("collections", collectionEntries);
            if (root.optJSONArray("singles") == null) root.put("singles", new JSONArray());
            save();
        }
    }

    int count() { return entries.length(); }
    int collectionCount() { return collectionEntries.length(); }

    /**
     * Delete only tracks that were previously exported by this index and are no longer
     * present in MySpoti's completed offline store. Every file is addressed by its recorded
     * SAF document ID; arbitrary files in the user's folder are never scanned or removed.
     */
    int removeTracksNotIn(java.util.Set<String> retainedTrackIds) throws Exception {
        java.util.Set<String> retained = retainedTrackIds == null
                ? java.util.Collections.<String>emptySet() : retainedTrackIds;
        List<String> removed = new ArrayList<>();
        java.util.Iterator<String> keys = entries.keys();
        while (keys.hasNext()) {
            String trackId = keys.next();
            if (!retained.contains(trackId)) removed.add(trackId);
        }
        if (removed.isEmpty()) return 0;

        for (String trackId : removed) {
            JSONObject item = entries.optJSONObject(trackId);
            if (item == null) continue;
            deleteRecordedDocument(item.optString("documentId", ""));
            deleteRecordedDocument(item.optString("lyricsJsonDocumentId", ""));
            deleteRecordedDocument(item.optString("lyricsLrcDocumentId", ""));
            entries.remove(trackId);
        }

        // Keep portable collection metadata consistent while preserving membership for
        // tracks that are queued in MySpoti but have not finished downloading yet.
        java.util.Iterator<String> collectionKeys = collectionEntries.keys();
        while (collectionKeys.hasNext()) {
            JSONObject collection = collectionEntries.optJSONObject(collectionKeys.next());
            if (collection == null) continue;
            JSONArray exported = collection.optJSONArray("exportedTrackIds");
            if (exported != null) {
                JSONArray kept = new JSONArray();
                for (int i = 0; i < exported.length(); i++) {
                    String id = exported.optString(i, "");
                    if (!removed.contains(id)) kept.put(id);
                }
                collection.put("exportedTrackIds", kept);
                collection.put("exportedTrackCount", kept.length());
                JSONArray members = collection.optJSONArray("trackIds");
                collection.put("notYetExportedTrackCount", Math.max(0,
                        (members == null ? 0 : members.length()) - kept.length()));
            }
        }

        JSONArray singles = root.optJSONArray("singles");
        if (singles != null) {
            JSONArray keptSingles = new JSONArray();
            for (int i = 0; i < singles.length(); i++) {
                String id = singles.optString(i, "");
                if (!removed.contains(id)) keptSingles.put(id);
            }
            root.put("singles", keptSingles);
        }
        save();
        return removed.size();
    }

    /** Remove playlist/album manifests only when MySpoti's collection index was read safely. */
    int removeCollectionsNotIn(java.util.Set<String> retainedCollectionKeys) throws Exception {
        java.util.Set<String> retained = retainedCollectionKeys == null
                ? java.util.Collections.<String>emptySet() : retainedCollectionKeys;
        List<String> removed = new ArrayList<>();
        java.util.Iterator<String> keys = collectionEntries.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (!retained.contains(key)) removed.add(key);
        }
        for (String key : removed) {
            JSONObject item = collectionEntries.optJSONObject(key);
            if (item != null) deleteRecordedDocument(item.optString("documentId", ""));
            collectionEntries.remove(key);
        }
        if (!removed.isEmpty()) save();
        return removed.size();
    }

    void replaceSingleTrackIds(Iterable<String> trackIds) throws Exception {
        JSONArray values = new JSONArray();
        if (trackIds != null) for (String id : trackIds) {
            if (id != null && !id.trim().isEmpty()) values.put(id);
        }
        root.put("singles", values);
        save();
    }

    private void deleteRecordedDocument(String documentId) throws Exception {
        if (documentId == null || documentId.isEmpty()) return;
        Uri document = documentUri(documentId);
        if (!documentExists(document)) return;
        if (!deleteDocument(document)) {
            throw new IOException("Android could not delete an exported file. The remaining export records were kept.");
        }
    }

    int lyricsCount() {
        int count = 0;
        java.util.Iterator<String> keys = entries.keys();
        while (keys.hasNext()) {
            JSONObject item = entries.optJSONObject(keys.next());
            if (item != null && item.optBoolean("lyricsAvailable", false)) count++;
        }
        return count;
    }

    boolean hasLyrics(String trackId) {
        JSONObject item = entry(trackId);
        if (item == null || !item.optBoolean("lyricsAvailable", false)) return false;
        String id = item.optString("lyricsJsonDocumentId", "");
        if (id.isEmpty()) return false;
        try { return documentExists(documentUri(id)); }
        catch (Throwable ignored) { return false; }
    }

    boolean hasLyricsEmbedded(String trackId) {
        JSONObject item = entry(trackId);
        return item != null && item.optBoolean("lyricsEmbedded", false);
    }

    /** Avoid repeating failed background provider lookups for every unrelated collection update. */
    boolean shouldLookupLyrics(String trackId, long retryIntervalMs) {
        JSONObject item = entry(trackId);
        if (item == null) return true;
        // The first implementation's lookup could fail silently when no player cache existed.
        // Re-run once with the corrected bridge, even if an older attempt was recorded.
        if (item.optInt("lyricsLookupVersion", 0) < LYRICS_LOOKUP_VERSION) return true;
        if (item.optBoolean("lyricsAvailable", false)) {
            try {
                if (readLyricsJson(trackId) != null) return false;
            } catch (Throwable ignored) {}
        }
        long attemptedAt = item.optLong("lyricsLookupAttemptedAt", 0L);
        return attemptedAt <= 0L || System.currentTimeMillis() - attemptedAt >= retryIntervalMs;
    }

    void markLyricsLookupAttempted(String trackId) throws Exception {
        JSONObject item = entry(trackId);
        if (item == null) throw new IOException("Cannot record a lyrics lookup before the audio export record exists for " + trackId);
        item.put("lyricsLookupAttemptedAt", System.currentTimeMillis());
        item.put("lyricsLookupVersion", LYRICS_LOOKUP_VERSION);
        entries.put(trackId, item);
        save();
    }

    boolean shouldRetryMissingLyrics(String trackId, long retryIntervalMs) {
        JSONObject item = entry(trackId);
        if (item == null) return true;
        long attemptedAt = item.optLong("lyricsRepairLookupAttemptedAt", 0L);
        return attemptedAt <= 0L || System.currentTimeMillis() - attemptedAt >= retryIntervalMs;
    }

    void markMissingLyricsLookupAttempted(String trackId) throws Exception {
        JSONObject item = entry(trackId);
        if (item == null) throw new IOException("Cannot record a missing-lyrics repair before the audio export record exists for " + trackId);
        item.put("lyricsRepairLookupAttemptedAt", System.currentTimeMillis());
        entries.put(trackId, item);
        save();
    }

    JSONObject readLyricsJson(String trackId) throws IOException {
        JSONObject item = entry(trackId);
        if (item == null) return null;
        String id = item.optString("lyricsJsonDocumentId", "");
        if (!id.isEmpty()) {
            try (InputStream input = resolver.openInputStream(documentUri(id))) {
                if (input != null) {
                    JSONObject object = new JSONObject(new String(readAll(input), StandardCharsets.UTF_8));
                    if (LyricsStore.validLyricsJson(object)) return object;
                }
            } catch (Throwable t) {
                android.util.Log.w("MyspotiStoragePatch", "Could not read indexed portable lyrics JSON for " + trackId + "; trying its path", t);
            }
        }
        String path = item.optString("lyricsJsonFileName", "");
        String canonicalPath = "Lyrics/JSON/" + safeTrackFileToken(trackId) + ".json";
        if (path.isEmpty()) path = canonicalPath;
        try {
            Uri fallback = findDocumentAtRelativePath(path);
            if (fallback == null && !canonicalPath.equals(path)) fallback = findDocumentAtRelativePath(canonicalPath);
            if (fallback == null) return null;
            try (InputStream input = resolver.openInputStream(fallback)) {
                if (input == null) return null;
                JSONObject object = new JSONObject(new String(readAll(input), StandardCharsets.UTF_8));
                return LyricsStore.validLyricsJson(object) ? object : null;
            }
        } catch (Throwable t) {
            android.util.Log.w("MyspotiStoragePatch", "Could not read portable lyrics JSON for " + trackId, t);
            return null;
        }
    }

    String readLyricsLrc(String trackId) throws IOException {
        JSONObject item = entry(trackId);
        if (item == null) return null;
        String id = item.optString("lyricsLrcDocumentId", "");
        if (!id.isEmpty()) {
            try (InputStream input = resolver.openInputStream(documentUri(id))) {
                if (input != null) return new String(readAll(input), StandardCharsets.UTF_8);
            } catch (Throwable t) {
                android.util.Log.w("MyspotiStoragePatch", "Could not read indexed portable LRC for " + trackId + "; trying its path", t);
            }
        }
        String path = item.optString("lyricsLrcFileName", "");
        String canonicalPath = "Lyrics/LRC/" + expectedLyricsLrcName(trackId, relativePathFromRoot(trackId));
        if (path.isEmpty()) path = canonicalPath;
        try {
            Uri fallback = findDocumentAtRelativePath(path);
            if (fallback == null && !canonicalPath.equals(path)) fallback = findDocumentAtRelativePath(canonicalPath);
            if (fallback == null) return null;
            try (InputStream input = resolver.openInputStream(fallback)) {
                return input == null ? null : new String(readAll(input), StandardCharsets.UTF_8);
            }
        } catch (Throwable t) {
            android.util.Log.w("MyspotiStoragePatch", "Could not read portable LRC lyrics for " + trackId, t);
            return null;
        }
    }

    /** Save portable lyrics under Lyrics/, away from the audio files in Tracks/. */
    void writeLyrics(String trackId, JSONObject lyrics, String lrcContent, boolean embedded) throws Exception {
        if (!LyricsStore.validLyricsJson(lyrics) || lrcContent == null || lrcContent.trim().isEmpty()) return;
        JSONObject item = entries.optJSONObject(trackId);
        if (item == null) throw new IOException("Cannot save lyrics before audio export record exists for " + trackId);
        String relativeAudio = relativePathFromRoot(trackId);
        if (relativeAudio.isEmpty()) throw new IOException("Exported audio path is missing for lyrics sidecar " + trackId);
        String[] pathParts = relativeAudio.split("/");
        String audioName = pathParts[pathParts.length - 1];
        int dot = audioName.lastIndexOf('.');
        String baseName = dot > 0 ? audioName.substring(0, dot) : audioName;
        String legacyLrcName = baseName + ".lrc";
        String trackToken = safeTrackFileToken(trackId);
        String trackSuffix = " [" + trackToken + "]";
        // Legacy exports did not include a track ID in their media filename. Add the full
        // stable ID to the LRC name even for those imports, so same-title songs never collide.
        if (!baseName.endsWith(trackSuffix)) baseName += trackSuffix;
        String lrcName = baseName + ".lrc";
        String oldLrcDocumentId = item.optString("lyricsLrcDocumentId", "");
        String oldJsonDocumentId = item.optString("lyricsJsonDocumentId", "");
        Uri lrcFolder = ensureFolderPath("Lyrics", "LRC");
        Uri lrcDocument = findDocumentInFolder(lrcFolder, lrcName);
        if (lrcDocument == null) {
            lrcDocument = DocumentsContract.createDocument(resolver, lrcFolder, "application/x-subrip", lrcName);
            if (lrcDocument == null) throw new IOException("Android could not create lyrics sidecar " + lrcName);
            rememberChild(DocumentsContract.getDocumentId(lrcFolder), new Child(
                    DocumentsContract.getDocumentId(lrcDocument), lrcName, "application/x-subrip", -1L));
        }
        try (OutputStream output = resolver.openOutputStream(lrcDocument, "wt")) {
            if (output == null) throw new IOException("Could not write lyrics sidecar " + lrcName);
            output.write(lrcContent.getBytes(StandardCharsets.UTF_8));
            output.flush();
        }

        Uri lyricsFolder = ensureFolderPath("Lyrics", "JSON");
        String jsonName = safeTrackFileToken(trackId) + ".json";
        Uri jsonDocument = findDocumentInFolder(lyricsFolder, jsonName);
        if (jsonDocument == null) {
            jsonDocument = DocumentsContract.createDocument(resolver, lyricsFolder, "application/json", jsonName);
            if (jsonDocument == null) throw new IOException("Android could not create JSON lyrics archive " + jsonName);
            rememberChild(DocumentsContract.getDocumentId(lyricsFolder), new Child(
                    DocumentsContract.getDocumentId(jsonDocument), jsonName, "application/json", -1L));
        }
        JSONObject portable = new JSONObject(lyrics.toString());
        portable.put("key", trackId);
        portable.put("at", System.currentTimeMillis());
        try (OutputStream output = resolver.openOutputStream(jsonDocument, "wt")) {
            if (output == null) throw new IOException("Could not write JSON lyrics " + jsonName);
            output.write(portable.toString().getBytes(StandardCharsets.UTF_8));
            output.flush();
        }
        item.put("lyricsAvailable", true);
        item.put("lyricsJsonDocumentId", DocumentsContract.getDocumentId(jsonDocument));
        item.put("lyricsLrcDocumentId", DocumentsContract.getDocumentId(lrcDocument));
        item.put("lyricsJsonFileName", "Lyrics/JSON/" + jsonName);
        item.put("lyricsLrcFileName", "Lyrics/LRC/" + lrcName);
        item.put("lyricsSynced", portable.optBoolean("synced", false));
        item.put("lyricsProvider", portable.optString("provider", ""));
        item.put("lyricsLanguage", portable.optString("language", ""));
        item.put("lyricsEmbedded", embedded);
        item.put("lyricsUpdatedAt", System.currentTimeMillis());
        entries.put(trackId, item);
        save();

        // Older versions placed the LRC next to its audio file. Remove only the exact
        // document previously recorded for this track, and only after the new copy is safe.
        String newLrcDocumentId = DocumentsContract.getDocumentId(lrcDocument);
        try { deleteDuplicateDocumentsInFolder(lrcFolder, lrcName, newLrcDocumentId); }
        catch (Throwable error) {
            android.util.Log.w("MyspotiStoragePatch", "Could not clean duplicate LRC files for " + trackId, error);
        }
        if (!oldLrcDocumentId.isEmpty() && !oldLrcDocumentId.equals(newLrcDocumentId)) {
            try { deleteRecordedDocument(oldLrcDocumentId); }
            catch (Throwable error) {
                android.util.Log.w("MyspotiStoragePatch", "Could not remove the previous LRC sidecar for " + trackId, error);
            }
        }
        String newJsonDocumentId = DocumentsContract.getDocumentId(jsonDocument);
        try { deleteDuplicateDocumentsInFolder(lyricsFolder, jsonName, newJsonDocumentId); }
        catch (Throwable error) {
            android.util.Log.w("MyspotiStoragePatch", "Could not clean duplicate JSON lyrics files for " + trackId, error);
        }
        if (!oldJsonDocumentId.isEmpty() && !oldJsonDocumentId.equals(newJsonDocumentId)) {
            try { deleteRecordedDocument(oldJsonDocumentId); }
            catch (Throwable error) {
                android.util.Log.w("MyspotiStoragePatch", "Could not remove the previous JSON lyrics file for " + trackId, error);
            }
        }
        // Previous patch versions put the LRC next to the exported audio. Remove only
        // exact-name sidecars that correspond to this indexed audio file. This also cleans
        // up same-name duplicates left by document providers that allow duplicate display names.
        String[] audioParentPath = new String[Math.max(0, pathParts.length - 1)];
        if (audioParentPath.length > 0) System.arraycopy(pathParts, 0, audioParentPath, 0, audioParentPath.length);
        try { deleteDocumentsNamedInFolder(ensureFolderPath(audioParentPath), legacyLrcName); }
        catch (Throwable error) {
            android.util.Log.w("MyspotiStoragePatch", "Could not remove old adjacent LRC sidecars for " + trackId, error);
        }
        // The previous JSON layout stored <track-id>.json directly under Lyrics/.
        // Clean only that exact indexed filename after the replacement is safely written.
        try { deleteDocumentsNamedInFolder(ensureFolderPath("Lyrics"), jsonName); }
        catch (Throwable error) {
            android.util.Log.w("MyspotiStoragePatch", "Could not remove the legacy JSON lyrics file for " + trackId, error);
        }
    }

    private static String safeTrackFileToken(String id) {
        String value = id == null ? "" : id.replaceAll("[^A-Za-z0-9._-]", "_");
        if (value.isEmpty() || value.equals(".") || value.equals("..")) return Integer.toHexString(String.valueOf(id).hashCode());
        return value.length() > 120 ? value.substring(0, 120) : value;
    }

    /** Snapshot of every portable track record, keyed by its MySpoti track ID. */
    List<JSONObject> trackEntries() throws JSONException {
        List<JSONObject> result = new ArrayList<>();
        java.util.Iterator<String> keys = entries.keys();
        while (keys.hasNext()) {
            JSONObject item = entries.optJSONObject(keys.next());
            if (item != null) result.add(new JSONObject(item.toString()));
        }
        return result;
    }

    /** Snapshot of the portable collection metadata for native Downloads restoration. */
    JSONObject collectionEntries() throws JSONException {
        return new JSONObject(collectionEntries.toString());
    }

    JSONArray singleTrackIds() throws JSONException {
        JSONArray values = root.optJSONArray("singles");
        return values == null ? new JSONArray() : new JSONArray(values.toString());
    }

    void mergeSingleTrackIds(Iterable<String> trackIds) throws Exception {
        JSONArray current = singleTrackIds();
        java.util.LinkedHashSet<String> merged = new java.util.LinkedHashSet<>();
        for (int i = 0; i < current.length(); i++) {
            String id = current.optString(i, "");
            if (!id.isEmpty()) merged.add(id);
        }
        if (trackIds != null) for (String id : trackIds) {
            if (id != null && !id.trim().isEmpty()) merged.add(id);
        }
        JSONArray values = new JSONArray();
        for (String id : merged) values.put(id);
        root.put("singles", values);
        save();
    }

    long totalExportBytes() {
        long total = 0L;
        java.util.Iterator<String> keys = entries.keys();
        while (keys.hasNext()) {
            JSONObject item = entries.optJSONObject(keys.next());
            if (item != null) total += Math.max(0L, item.optLong("exportedBytes", 0L));
        }
        return total;
    }

    /** Open an already-exported audio document using the currently granted SAF tree. */
    InputStream openTrackInput(String trackId) throws IOException {
        Uri document = existingDocument(trackId);
        if (document == null) throw new IOException("The exported audio for track " + trackId + " is missing or the folder permission must be renewed.");
        InputStream input = resolver.openInputStream(document);
        if (input == null) throw new IOException("Android could not open the exported audio for track " + trackId + ".");
        return input;
    }

    String summary() {
        StringBuilder text = new StringBuilder("Portable export archive: ")
                .append(entries.length()).append(" song record(s), ")
                .append(collectionEntries.length()).append(" playlist/album manifest(s).");
        java.util.Iterator<String> keys = entries.keys();
        int shown = 0;
        while (keys.hasNext() && shown < 4) {
            JSONObject item = entries.optJSONObject(keys.next());
            if (item == null) continue;
            String title = item.optString("title", "Untitled");
            String artist = item.optString("artist", "Unknown artist");
            text.append("\n• ").append(title);
            if (!artist.isEmpty()) text.append(" — ").append(artist);
            shown++;
        }
        if (entries.length() > shown) text.append("\n…and ").append(entries.length() - shown).append(" more songs.");
        text.append("\nMusic is stored once in Tracks/; playlists and albums reference those files.");
        text.append("\nLyrics: ").append(lyricsCount()).append(" track(s) in Lyrics/LRC/ and Lyrics/JSON/.");
        text.append("\nStored beside your exported files; reconnect this same folder after reinstall.");
        return text.toString();
    }

    JSONObject entry(String trackId) {
        return trackId == null ? null : entries.optJSONObject(trackId);
    }

    String relativePathFromRoot(String trackId) {
        JSONObject item = entry(trackId);
        if (item == null) return "";
        String path = item.optString("relativePathFromRoot", "");
        if (path.isEmpty()) path = item.optString("fileName", ""); // v1 index: files were in the root folder.
        return path.replace('\\', '/');
    }

    Uri existingDocument(String trackId) throws IOException {
        JSONObject item = entry(trackId);
        if (item == null) return null;
        String id = item.optString("documentId", "");
        if (id.isEmpty()) return null;
        String relativePath = item.optString("relativePathFromRoot", "");
        if (relativePath.isEmpty()) relativePath = item.optString("fileName", "");
        try {
            String parentId = parentIdForRelativePath(relativePath);
            // The portable index is authoritative about the expected parent folder. If that
            // folder no longer exists, the indexed audio is missing and must be re-exported.
            // Do not query the stale document URI: Android's FileSystemProvider can throw
            // IllegalArgumentException/FileNotFoundException while validating a deleted
            // document against the tree root (instead of returning an empty cursor).
            if (parentId == null) return null;

            // One child-documents query per containing folder replaces one resolver query
            // per exported song. A successful folder listing is authoritative: if the indexed
            // document ID is absent, the file was deleted/moved and should be recreated.
            for (Child child : childrenForParent(parentId)) {
                if (id.equals(child.id) && !DocumentsContract.Document.MIME_TYPE_DIR.equals(child.mime)) {
                    return documentUri(id);
                }
            }
            return null;
        } catch (SecurityException error) {
            throw new IOException("Permission to inspect an existing export was lost. Reconnect the export folder.", error);
        } catch (IOException error) {
            throw error;
        } catch (Exception error) {
            throw new IOException("Android could not inspect the export folder.", error);
        }
    }

    boolean hasLyricsAvailable(String trackId) {
        JSONObject item = entry(trackId);
        return item != null && item.optBoolean("lyricsAvailable", false);
    }

    /**
     * Check the actual canonical sidecars, not just the historical lyricsAvailable flag.
     * Users can delete .lrc/.json files without changing the portable index; a sync must
     * detect that and rebuild both files from whichever surviving copy is available.
     */
    boolean lyricsSidecarsNeedRepair(String trackId) throws IOException {
        JSONObject item = entry(trackId);
        if (item == null || !item.optBoolean("lyricsAvailable", false)) return false;
        String audioPath = relativePathFromRoot(trackId);
        if (audioPath.isEmpty()) return true;
        String jsonPath = "Lyrics/JSON/" + safeTrackFileToken(trackId) + ".json";
        String lrcPath = "Lyrics/LRC/" + expectedLyricsLrcName(trackId, audioPath);
        try {
            return !documentExistsAtRelativePath(jsonPath) || !documentExistsAtRelativePath(lrcPath);
        } catch (SecurityException error) {
            throw new IOException("Permission to inspect exported lyrics was lost. Reconnect the export folder.", error);
        } catch (IOException error) {
            throw error;
        } catch (Exception error) {
            throw new IOException("Android could not inspect the exported lyrics folders.", error);
        }
    }

    private boolean documentExistsAtRelativePath(String relativePath) throws Exception {
        String normalized = relativePath == null ? "" : relativePath.replace('\\', '/');
        int slash = normalized.lastIndexOf('/');
        if (slash <= 0 || slash == normalized.length() - 1) return false;
        String parentId = parentIdForRelativePath(normalized);
        if (parentId == null) return false;
        String expectedName = normalized.substring(slash + 1);
        for (Child child : childrenForParent(parentId)) {
            if (expectedName.equals(child.name)
                    && !DocumentsContract.Document.MIME_TYPE_DIR.equals(child.mime)) return true;
        }
        return false;
    }

    private Uri findDocumentAtRelativePath(String relativePath) throws Exception {
        String normalized = relativePath == null ? "" : relativePath.replace('\\', '/');
        int slash = normalized.lastIndexOf('/');
        if (slash <= 0 || slash == normalized.length() - 1) return null;
        String parentId = parentIdForRelativePath(normalized);
        if (parentId == null) return null;
        String expectedName = normalized.substring(slash + 1);
        for (Child child : childrenForParent(parentId)) {
            if (expectedName.equals(child.name)
                    && !DocumentsContract.Document.MIME_TYPE_DIR.equals(child.mime)) return documentUri(child.id);
        }
        return null;
    }

    private static String expectedLyricsLrcName(String trackId, String audioPath) {
        String[] parts = audioPath.replace('\\', '/').split("/");
        String audioName = parts.length == 0 ? "" : parts[parts.length - 1];
        int dot = audioName.lastIndexOf('.');
        String baseName = dot > 0 ? audioName.substring(0, dot) : audioName;
        String suffix = " [" + safeTrackFileToken(trackId) + "]";
        if (!baseName.endsWith(suffix)) baseName += suffix;
        return baseName + ".lrc";
    }

    boolean sameFingerprint(String trackId, String fingerprint) {
        JSONObject item = entry(trackId);
        return item != null && fingerprint.equals(item.optString("fingerprint"));
    }

    /** Match old pre-ledger exports by their exact historical artist-title filename in the root. */
    Uri uniqueLegacyMatch(String displayName) throws IOException {
        Uri match = null;
        int matches = 0;
        for (Child child : children) {
            if (displayName.equals(child.name) && !DocumentsContract.Document.MIME_TYPE_DIR.equals(child.mime)
                    && !INDEX_NAME.equals(child.name) && !isDocumentAlreadyIndexed(child.id)) {
                match = documentUri(child.id);
                matches++;
            }
        }
        return matches == 1 && documentExists(match) ? match : null;
    }

    private boolean isDocumentAlreadyIndexed(String documentId) {
        java.util.Iterator<String> keys = entries.keys();
        while (keys.hasNext()) {
            JSONObject item = entries.optJSONObject(keys.next());
            if (item != null && documentId.equals(item.optString("documentId"))) return true;
        }
        return false;
    }

    int nameMatchCount(String displayName) {
        int matches = 0;
        for (Child child : children) {
            if (displayName.equals(child.name) && !DocumentsContract.Document.MIME_TYPE_DIR.equals(child.mime)
                    && !INDEX_NAME.equals(child.name)) matches++;
        }
        return matches;
    }

    boolean deleteDocument(Uri document) {
        if (document == null) return true;
        try {
            boolean deleted = DocumentsContract.deleteDocument(resolver, document);
            if (deleted) {
                String documentId = DocumentsContract.getDocumentId(document);
                for (List<Child> siblings : childCache.values()) {
                    java.util.Iterator<Child> iterator = siblings.iterator();
                    while (iterator.hasNext()) if (documentId.equals(iterator.next().id)) iterator.remove();
                }
                java.util.Iterator<Child> rootIterator = children.iterator();
                while (rootIterator.hasNext()) if (documentId.equals(rootIterator.next().id)) rootIterator.remove();
                childCache.clear();
            }
            return deleted;
        }
        catch (Throwable error) {
            android.util.Log.w("MyspotiStoragePatch", "Could not delete generated export document", error);
            return false;
        }
    }

    Uri createDocument(String mime, String displayName) throws Exception {
        Uri existing = findDocumentInPath(displayName);
        if (existing != null) return existing;
        Uri uri = DocumentsContract.createDocument(resolver, parent, mime, displayName);
        if (uri == null) throw new IOException("Android could not create " + displayName);
        String id = DocumentsContract.getDocumentId(uri);
        rememberChild(parentDocumentId, new Child(id, displayName, mime, -1L));
        return uri;
    }

    /** Create or reopen one file under a SAF folder hierarchy relative to the chosen root. */
    Uri createDocumentInPath(String mime, String displayName, String... folderPath) throws Exception {
        Uri folder = ensureFolderPath(folderPath);
        Uri existing = findDocumentInFolder(folder, displayName);
        if (existing != null) return existing;
        Uri uri = DocumentsContract.createDocument(resolver, folder, mime, displayName);
        if (uri == null) throw new IOException("Android could not create " + displayName);
        rememberChild(DocumentsContract.getDocumentId(folder),
                new Child(DocumentsContract.getDocumentId(uri), displayName, mime, -1L));
        return uri;
    }

    /** Remove a previously generated manifest filename suffix from a collection's display name. */
    static String cleanCollectionName(String value) {
        if (value == null) return "";
        return value.replace('\n', ' ').replace('\r', ' ').trim()
                .replaceFirst("(?i)\\s+\\[[0-9a-f]{8}\\]\\.m3u8$", "").trim();
    }

    /** Write/update a portable .m3u8 collection manifest and record it in the same JSON index. */
    void writeCollectionManifest(String collectionKey, String collectionUri, String type,
                                 String name, String fileName, String content,
                                 List<String> memberTrackIds, List<String> exportedTrackIds,
                                 int missingTracks, String... folderPath) throws Exception {
        if (collectionKey == null || collectionKey.isEmpty()) throw new IOException("Collection ID is missing.");
        Uri folder = ensureFolderPath(folderPath);
        String relativeFolder = joinPath(folderPath);
        JSONObject previous = collectionEntries.optJSONObject(collectionKey);
        Uri previousDocument = null;
        Uri document = null;
        if (previous != null) {
            String documentId = previous.optString("documentId", "");
            if (!documentId.isEmpty()) {
                Uri candidate = documentUri(documentId);
                try { if (documentExists(candidate)) previousDocument = candidate; }
                catch (Throwable ignored) { previousDocument = null; }
            }
            // Reuse the old SAF document only when its path/name are still correct.
            // If an album's artist/name changes, create at the new path and remove the stale manifest.
            if (previousDocument != null && fileName.equals(previous.optString("fileName", ""))
                    && relativeFolder.equals(previous.optString("relativeFolder", ""))) {
                document = previousDocument;
            }
        }
        if (document == null) document = findDocumentInFolder(folder, fileName);
        if (document == null) {
            document = DocumentsContract.createDocument(resolver, folder, "audio/x-mpegurl", fileName);
            if (document == null) throw new IOException("Android could not create playlist manifest " + fileName);
            rememberChild(DocumentsContract.getDocumentId(folder), new Child(
                    DocumentsContract.getDocumentId(document), fileName, "audio/x-mpegurl", -1L));
        }

        try (OutputStream output = resolver.openOutputStream(document, "wt")) {
            if (output == null) throw new IOException("Could not write playlist manifest " + fileName);
            output.write(content.getBytes(StandardCharsets.UTF_8));
            output.flush();
        }

        JSONObject item = new JSONObject();
        item.put("collectionUri", collectionUri == null ? "" : collectionUri);
        item.put("type", type == null ? "" : type);
        item.put("name", cleanCollectionName(name));
        item.put("fileName", fileName);
        item.put("documentId", DocumentsContract.getDocumentId(document));
        // Keep full membership, including tracks still queued/not yet exported. A second array
        // records exactly which songs the current M3U8 file can resolve to exported media.
        item.put("trackIds", new JSONArray(memberTrackIds));
        item.put("exportedTrackIds", new JSONArray(exportedTrackIds));
        item.put("exportedTrackCount", exportedTrackIds.size());
        item.put("notYetExportedTrackCount", missingTracks);
        item.put("updatedAt", System.currentTimeMillis());
        item.put("relativeFolder", relativeFolder);
        collectionEntries.put(collectionKey, item);
        save();
        if (previousDocument != null && !previousDocument.equals(document)) deleteDocument(previousDocument);
    }

    private Uri ensureFolderPath(String... folderPath) throws Exception {
        Uri folder = parent;
        String folderId = parentDocumentId;
        if (folderPath == null) return folder;
        for (String rawName : folderPath) {
            String name = rawName == null ? "" : rawName.trim();
            if (name.isEmpty() || name.equals(".") || name.equals("..") || name.contains("/")) {
                throw new IOException("Invalid export folder name: " + rawName);
            }
            Child found = null;
            for (Child child : childrenForParent(folderId)) {
                if (name.equals(child.name) && DocumentsContract.Document.MIME_TYPE_DIR.equals(child.mime)) {
                    found = child;
                    break;
                }
            }
            if (found == null) {
                Uri created = DocumentsContract.createDocument(resolver, folder,
                        DocumentsContract.Document.MIME_TYPE_DIR, name);
                if (created == null) throw new IOException("Android could not create folder " + name);
                String createdId = DocumentsContract.getDocumentId(created);
                rememberChild(folderId, new Child(createdId, name,
                        DocumentsContract.Document.MIME_TYPE_DIR, -1L));
                folderId = createdId;
                folder = created;
            } else {
                folderId = found.id;
                folder = documentUri(folderId);
            }
        }
        return folder;
    }

    private Uri findDocumentInFolder(Uri folder, String displayName) throws Exception {
        String id = DocumentsContract.getDocumentId(folder);
        for (Child child : childrenForParent(id)) {
            if (displayName.equals(child.name) && !DocumentsContract.Document.MIME_TYPE_DIR.equals(child.mime)) {
                return documentUri(child.id);
            }
        }
        return null;
    }

    private void deleteDocumentsNamedInFolder(Uri folder, String displayName) throws Exception {
        deleteDuplicateDocumentsInFolder(folder, displayName, null);
    }

    /** Keep one selected document and remove any same-name duplicate files in a folder. */
    private void deleteDuplicateDocumentsInFolder(Uri folder, String displayName, String keepDocumentId) throws Exception {
        String id = DocumentsContract.getDocumentId(folder);
        for (Child child : childrenForParent(id)) {
            if (!displayName.equals(child.name)
                    || DocumentsContract.Document.MIME_TYPE_DIR.equals(child.mime)
                    || (keepDocumentId != null && keepDocumentId.equals(child.id))) continue;
            Uri document = documentUri(child.id);
            if (!deleteDocument(document)) {
                android.util.Log.w("MyspotiStoragePatch", "Could not remove duplicate lyric file " + displayName);
            }
        }
    }

    private Uri findDocumentInPath(String displayName, String... folderPath) throws Exception {
        return findDocumentInFolder(ensureFolderPath(folderPath), displayName);
    }

    private Uri documentUri(String documentId) {
        return DocumentsContract.buildDocumentUriUsingTree(tree, documentId);
    }

    private static String joinPath(String[] path) {
        if (path == null || path.length == 0) return "";
        StringBuilder result = new StringBuilder();
        for (String part : path) {
            if (part == null || part.isEmpty()) continue;
            if (result.length() > 0) result.append('/');
            result.append(part);
        }
        return result.toString();
    }

    void record(String trackId, String fingerprint, Uri document, String displayName,
                String title, String artist, String album, long durationMs, String extension,
                long exportedBytes, boolean importedLegacy) throws Exception {
        String relative = entry(trackId) == null ? displayName : relativePathFromRoot(trackId);
        record(trackId, fingerprint, document, displayName, title, artist, album, durationMs,
                extension, exportedBytes, importedLegacy, relative);
    }

    void record(String trackId, String fingerprint, Uri document, String displayName,
                String title, String artist, String album, long durationMs, String extension,
                long exportedBytes, boolean importedLegacy, String relativePathFromRoot) throws Exception {
        record(trackId, fingerprint, document, displayName, title, artist, album, durationMs,
                extension, exportedBytes, importedLegacy, relativePathFromRoot, "", "", "", false, "MUSIC", "", "");
    }

    void record(String trackId, String fingerprint, Uri document, String displayName,
                String title, String artist, String album, long durationMs, String extension,
                long exportedBytes, boolean importedLegacy, String relativePathFromRoot,
                String albumId, String coverUrl, String source, boolean verified,
                String kind, String providerId, String extensionQuality) throws Exception {
        if (trackId == null || trackId.isEmpty()) throw new IOException("The MySpoti track ID is missing; cannot create a reliable sync record.");
        JSONObject item = new JSONObject();
        item.put("trackId", trackId);
        item.put("fingerprint", fingerprint);
        item.put("documentId", DocumentsContract.getDocumentId(document));
        item.put("fileName", displayName);
        item.put("relativePathFromRoot", relativePathFromRoot == null ? displayName : relativePathFromRoot);
        item.put("title", title == null ? "" : title);
        item.put("artist", artist == null ? "" : artist);
        item.put("album", album == null ? "" : album);
        item.put("albumId", albumId == null ? "" : albumId);
        item.put("coverUrl", coverUrl == null ? "" : coverUrl);
        item.put("durationMs", durationMs);
        item.put("extension", extension == null ? "" : extension);
        item.put("source", source == null ? "" : source);
        item.put("verified", verified);
        item.put("kind", kind == null || kind.isEmpty() ? "MUSIC" : kind);
        item.put("providerId", providerId == null ? "" : providerId);
        item.put("extensionQuality", extensionQuality == null ? "" : extensionQuality);
        JSONObject previous = entries.optJSONObject(trackId);
        if (previous != null) {
            String[] preserved = new String[] { "lyricsJsonDocumentId", "lyricsLrcDocumentId", "lyricsJsonFileName", "lyricsLrcFileName", "lyricsProvider", "lyricsLanguage" };
            for (String field : preserved) if (previous.has(field)) item.put(field, previous.opt(field));
            if (previous.has("lyricsUpdatedAt")) item.put("lyricsUpdatedAt", previous.optLong("lyricsUpdatedAt"));
            if (previous.has("lyricsAvailable")) item.put("lyricsAvailable", previous.optBoolean("lyricsAvailable"));
            if (previous.has("lyricsSynced")) item.put("lyricsSynced", previous.optBoolean("lyricsSynced"));
            if (previous.has("lyricsEmbedded")) item.put("lyricsEmbedded", previous.optBoolean("lyricsEmbedded"));
            if (previous.has("lyricsLookupAttemptedAt")) item.put("lyricsLookupAttemptedAt", previous.optLong("lyricsLookupAttemptedAt"));
            if (previous.has("lyricsRepairLookupAttemptedAt")) item.put("lyricsRepairLookupAttemptedAt", previous.optLong("lyricsRepairLookupAttemptedAt"));
            if (previous.has("lyricsLookupVersion")) item.put("lyricsLookupVersion", previous.optInt("lyricsLookupVersion"));
        }
        item.put("exportedBytes", exportedBytes);
        item.put("exportedAt", System.currentTimeMillis());
        item.put("importedLegacy", importedLegacy);
        entries.put(trackId, item);
        save();
    }

    void save() throws Exception {
        root.put("version", VERSION);
        root.put("entries", entries);
        root.put("collections", collectionEntries);
        root.put("updatedAt", System.currentTimeMillis());
        try (OutputStream output = resolver.openOutputStream(indexUri, "wt")) {
            if (output == null) throw new IOException("The MySpoti export index cannot be written.");
            output.write(root.toString(2).getBytes(StandardCharsets.UTF_8));
            output.flush();
        }
    }

    private boolean documentExists(Uri document) throws IOException {
        if (document == null) return false;
        try (Cursor cursor = resolver.query(document,
                new String[] { DocumentsContract.Document.COLUMN_DOCUMENT_ID }, null, null, null)) {
            if (cursor == null) throw new IOException("Android could not verify an existing export file.");
            return cursor.moveToFirst();
        } catch (SecurityException e) {
            throw new IOException("Permission to inspect an existing export was lost. Reconnect the export folder.", e);
        }
    }

    private static byte[] readAll(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[16 * 1024];
        int count;
        while ((count = input.read(buffer)) != -1) if (count > 0) output.write(buffer, 0, count);
        return output.toByteArray();
    }

    private static final class Child {
        final String id;
        final String name;
        final String mime;
        final long size;
        Child(String id, String name, String mime, long size) {
            this.id = id;
            this.name = name;
            this.mime = mime;
            this.size = size;
        }
    }
}
