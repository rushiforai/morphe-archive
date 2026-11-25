package app.voidhack.extension.applemusic.lyrics;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * SAF-backed local LRC folder scanner, metadata tag indexer, and track resolver.
 */
final class LocalLrcFolder {
    private static final String TAG = "AppleMusicLrclib";
    private static final int MAX_DEPTH = 6;
    private static final int MAX_FILES = 5000;
    private static final int MAX_UNCACHED_TAG_READS_PER_LOOKUP = 150;
    private static final int MAX_UNCACHED_TAG_READS_ON_SCAN = 300;
    private static final long LISTING_TTL_MS = 60L * 1000L;
    private static final String INDEX_FILE_NAME = "local_lrc_folder_index.json";

    private static final String[] CHILD_PROJECTION = new String[]{
            DocumentsContract.Document.COLUMN_DOCUMENT_ID,
            DocumentsContract.Document.COLUMN_DISPLAY_NAME,
            DocumentsContract.Document.COLUMN_MIME_TYPE,
            DocumentsContract.Document.COLUMN_LAST_MODIFIED,
            DocumentsContract.Document.COLUMN_SIZE
    };

    private static final Object LOCK = new Object();
    private static String cachedTreeUri;
    private static long cachedListingAtMs;
    private static List<LocalLrcMatcher.FolderEntry> cachedEntries = Collections.emptyList();
    private static Map<String, CachedMeta> cachedMetaByDocId;
    private static final Map<String, Boolean> trackHasFolderMatch =
            Collections.synchronizedMap(new LinkedHashMap<String, Boolean>(64, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
                    return size() > 128;
                }
            });

    static final class FolderMatch {
        final String docId;
        final String displayName;
        final String rawText;
        final LocalLrcParser.LrcMetadata metadata;

        FolderMatch(String docId, String displayName, String rawText, LocalLrcParser.LrcMetadata metadata) {
            this.docId = docId;
            this.displayName = displayName;
            this.rawText = rawText;
            this.metadata = metadata;
        }
    }

    static final class ScanResult {
        final int fileCount;
        final boolean accessible;

        ScanResult(int fileCount, boolean accessible) {
            this.fileCount = fileCount;
            this.accessible = accessible;
        }
    }

    private static final class CachedMeta {
        final long lastModified;
        final long size;
        final LocalLrcParser.LrcMetadata metadata;

        CachedMeta(long lastModified, long size, LocalLrcParser.LrcMetadata metadata) {
            this.lastModified = lastModified;
            this.size = size;
            this.metadata = metadata;
        }
    }

    private LocalLrcFolder() {}

    static void invalidateCache() {
        synchronized (LOCK) {
            cachedListingAtMs = 0L;
            cachedEntries = Collections.emptyList();
            cachedMetaByDocId = null;
        }
        trackHasFolderMatch.clear();
    }

    static boolean hasCachedMatch(String trackKey) {
        if (trackKey == null || trackKey.isEmpty()) return false;
        return Boolean.TRUE.equals(trackHasFolderMatch.get(trackKey));
    }

    static String describeTreeUri(Uri treeUri) {
        if (treeUri == null) return "";
        try {
            String docId = DocumentsContract.getTreeDocumentId(treeUri);
            if (docId != null && !docId.trim().isEmpty()) {
                int colon = docId.indexOf(':');
                if (colon >= 0) {
                    String volume = docId.substring(0, colon);
                    String path = docId.substring(colon + 1);
                    if (path.isEmpty()) {
                        return "primary".equalsIgnoreCase(volume) ? "Internal storage" : volume;
                    }
                    return "primary".equalsIgnoreCase(volume) ? path : (volume + "/" + path);
                }
                return docId;
            }
        } catch (RuntimeException ignored) {
        }
        String last = treeUri.getLastPathSegment();
        return last != null ? last : treeUri.toString();
    }

    static ScanResult rescanNow(Context ctx) {
        if (ctx == null) return new ScanResult(0, false);
        String uriStr = LrclibPrefs.getLocalFolderUri(ctx);
        if (uriStr.isEmpty()) {
            LrclibPrefs.setLocalFolderCount(ctx, 0);
            invalidateCache();
            return new ScanResult(0, false);
        }
        Uri treeUri = Uri.parse(uriStr);
        List<LocalLrcMatcher.FolderEntry> entries = scanTree(ctx, treeUri);
        if (entries == null) {
            return new ScanResult(0, false);
        }
        synchronized (LOCK) {
            cachedTreeUri = uriStr;
            cachedEntries = entries;
            cachedListingAtMs = System.currentTimeMillis();
        }
        trackHasFolderMatch.clear();
        LrclibPrefs.setLocalFolderCount(ctx, entries.size());

        // Pre-warm metadata tag cache for newly discovered files.
        warmTagIndex(ctx, treeUri, entries, MAX_UNCACHED_TAG_READS_ON_SCAN);
        return new ScanResult(entries.size(), true);
    }

    static FolderMatch findBestMatch(Context ctx, LrclibModels.TrackQuery query, boolean requireSynced) {
        if (ctx == null || query == null) return null;
        String uriStr = LrclibPrefs.getLocalFolderUri(ctx);
        if (uriStr.isEmpty()) return null;

        Uri treeUri = Uri.parse(uriStr);
        List<LocalLrcMatcher.FolderEntry> entries = getEntries(ctx, uriStr, treeUri);
        if (entries == null || entries.isEmpty()) {
            trackHasFolderMatch.put(query.trackKey, false);
            return null;
        }

        Map<String, CachedMeta> metaIndex = loadMetaIndex(ctx, uriStr);
        boolean indexDirty = false;

        // Stage 1: Fast zero-I/O filename + directory shortlist, verified against file metadata tags.
        List<LocalLrcMatcher.ScoredEntry> shortlist = LocalLrcMatcher.shortlistByFilename(query, entries, 8);
        LocalLrcMatcher.FolderEntry bestEntry = null;
        LocalLrcParser.LrcMetadata bestMeta = null;
        double bestScore = Double.NEGATIVE_INFINITY;

        for (LocalLrcMatcher.ScoredEntry candidate : shortlist) {
            LocalLrcParser.LrcMetadata meta = getOrReadMetadata(ctx, treeUri, candidate.entry, metaIndex);
            if (meta == null) continue;
            if (!isCachedUpToDate(metaIndex.get(candidate.entry.docId), candidate.entry)) {
                metaIndex.put(candidate.entry.docId,
                        new CachedMeta(candidate.entry.lastModified, candidate.entry.size, meta));
                indexDirty = true;
            }
            double score = LocalLrcMatcher.scoreWithMetadata(query, candidate.entry, meta, requireSynced);
            if (score > bestScore) {
                bestScore = score;
                bestEntry = candidate.entry;
                bestMeta = meta;
            }
        }

        // Stage 2: If filename matching didn't produce a strong match, check LRC metadata tags ([ti:], [ar:]).
        if (bestEntry == null || bestScore < LocalLrcMatcher.MIN_MATCH_SCORE) {
            int uncachedReads = 0;
            for (LocalLrcMatcher.FolderEntry entry : entries) {
                CachedMeta cached = metaIndex.get(entry.docId);
                LocalLrcParser.LrcMetadata meta;
                if (isCachedUpToDate(cached, entry)) {
                    meta = cached.metadata;
                } else {
                    if (uncachedReads >= MAX_UNCACHED_TAG_READS_PER_LOOKUP) {
                        continue;
                    }
                    uncachedReads++;
                    meta = readMetadataHeader(ctx, treeUri, entry.docId);
                    if (meta == null) continue;
                    metaIndex.put(entry.docId, new CachedMeta(entry.lastModified, entry.size, meta));
                    indexDirty = true;
                }
                if (meta == null || !meta.hasAnyTag()) continue;
                double score = LocalLrcMatcher.scoreWithMetadata(query, entry, meta, requireSynced);
                if (score > bestScore) {
                    bestScore = score;
                    bestEntry = entry;
                    bestMeta = meta;
                }
            }
        }

        if (indexDirty) {
            saveMetaIndex(ctx, uriStr, metaIndex);
        }

        if (bestEntry == null || bestScore < LocalLrcMatcher.MIN_MATCH_SCORE) {
            if (!requireSynced) {
                trackHasFolderMatch.put(query.trackKey, false);
            }
            return null;
        }

        String fullText = readFullText(ctx, treeUri, bestEntry.docId);
        if (fullText == null || fullText.trim().isEmpty()) {
            return null;
        }
        LocalLrcParser.LrcMetadata fullMeta = LocalLrcParser.parseMetadata(fullText);
        if (requireSynced && !fullMeta.hasSyncedTimestamps) {
            return null;
        }
        trackHasFolderMatch.put(query.trackKey, true);
        return new FolderMatch(bestEntry.docId, bestEntry.fileName, fullText,
                fullMeta != null ? fullMeta : bestMeta);
    }

    static byte[] readLimitedBytes(InputStream in, int maxBytes) throws IOException {
        if (in == null) return null;
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int total = 0;
        int n;
        while ((n = in.read(buf)) != -1) {
            int toWrite = Math.min(n, maxBytes - total);
            if (toWrite > 0) {
                out.write(buf, 0, toWrite);
                total += toWrite;
            }
            if (total >= maxBytes) break;
        }
        return out.toByteArray();
    }

    private static List<LocalLrcMatcher.FolderEntry> getEntries(Context ctx, String uriStr, Uri treeUri) {
        long now = System.currentTimeMillis();
        synchronized (LOCK) {
            if (uriStr.equals(cachedTreeUri)
                    && cachedListingAtMs > 0L
                    && (now - cachedListingAtMs) < LISTING_TTL_MS) {
                return cachedEntries;
            }
        }
        List<LocalLrcMatcher.FolderEntry> scanned = scanTree(ctx, treeUri);
        if (scanned == null) {
            synchronized (LOCK) {
                return uriStr.equals(cachedTreeUri) ? cachedEntries : Collections.emptyList();
            }
        }
        synchronized (LOCK) {
            cachedTreeUri = uriStr;
            cachedEntries = scanned;
            cachedListingAtMs = System.currentTimeMillis();
        }
        LrclibPrefs.setLocalFolderCount(ctx, scanned.size());
        return scanned;
    }

    private static List<LocalLrcMatcher.FolderEntry> scanTree(Context ctx, Uri treeUri) {
        try {
            String rootDocId = DocumentsContract.getTreeDocumentId(treeUri);
            if (rootDocId == null || rootDocId.isEmpty()) return null;
            List<LocalLrcMatcher.FolderEntry> out = new ArrayList<>();
            scanDirectory(ctx, treeUri, rootDocId, "", "", 0, out);
            return out;
        } catch (SecurityException e) {
            Log.w(TAG, "Lost read permission for local LRC folder: " + treeUri, e);
            return null;
        } catch (RuntimeException e) {
            Log.w(TAG, "Failed scanning local LRC folder: " + treeUri, e);
            return null;
        }
    }

    private static void scanDirectory(
            Context ctx,
            Uri treeUri,
            String dirDocId,
            String parentDir,
            String grandParentDir,
            int depth,
            List<LocalLrcMatcher.FolderEntry> out) {
        if (depth > MAX_DEPTH || out.size() >= MAX_FILES) return;
        Uri childrenUri = DocumentsContract.buildChildDocumentsUriUsingTree(treeUri, dirDocId);
        List<String[]> subDirs = null;
        try (Cursor c = ctx.getContentResolver().query(childrenUri, CHILD_PROJECTION, null, null, null)) {
            if (c == null) return;
            while (c.moveToNext() && out.size() < MAX_FILES) {
                String docId = c.getString(0);
                String name = c.getString(1);
                String mime = c.getString(2);
                long lastMod = c.isNull(3) ? 0L : c.getLong(3);
                long size = c.isNull(4) ? 0L : c.getLong(4);
                if (docId == null || name == null || name.isEmpty()) continue;

                if (DocumentsContract.Document.MIME_TYPE_DIR.equals(mime)) {
                    if (!name.startsWith(".") && depth < MAX_DEPTH) {
                        if (subDirs == null) subDirs = new ArrayList<>();
                        subDirs.add(new String[]{docId, name});
                    }
                } else if (LocalLrcMatcher.isSupportedFolderFile(name)) {
                    out.add(new LocalLrcMatcher.FolderEntry(docId, name, parentDir, grandParentDir, lastMod, size));
                }
            }
        } catch (RuntimeException e) {
            Log.w(TAG, "Failed listing child documents in local LRC folder", e);
        }

        if (subDirs != null) {
            for (String[] sub : subDirs) {
                if (out.size() >= MAX_FILES) break;
                scanDirectory(ctx, treeUri, sub[0], sub[1], parentDir, depth + 1, out);
            }
        }
    }

    private static void warmTagIndex(
            Context ctx,
            Uri treeUri,
            List<LocalLrcMatcher.FolderEntry> entries,
            int maxReads) {
        String uriStr = treeUri.toString();
        Map<String, CachedMeta> metaIndex = loadMetaIndex(ctx, uriStr);
        boolean dirty = false;
        int reads = 0;
        for (LocalLrcMatcher.FolderEntry entry : entries) {
            if (reads >= maxReads) break;
            if (isCachedUpToDate(metaIndex.get(entry.docId), entry)) continue;
            reads++;
            LocalLrcParser.LrcMetadata meta = readMetadataHeader(ctx, treeUri, entry.docId);
            if (meta != null) {
                metaIndex.put(entry.docId, new CachedMeta(entry.lastModified, entry.size, meta));
                dirty = true;
            }
        }
        if (dirty) {
            saveMetaIndex(ctx, uriStr, metaIndex);
        }
    }

    private static LocalLrcParser.LrcMetadata getOrReadMetadata(
            Context ctx,
            Uri treeUri,
            LocalLrcMatcher.FolderEntry entry,
            Map<String, CachedMeta> metaIndex) {
        CachedMeta cached = metaIndex.get(entry.docId);
        if (isCachedUpToDate(cached, entry)) {
            return cached.metadata;
        }
        return readMetadataHeader(ctx, treeUri, entry.docId);
    }

    private static boolean isCachedUpToDate(CachedMeta cached, LocalLrcMatcher.FolderEntry entry) {
        return cached != null
                && cached.metadata != null
                && cached.lastModified == entry.lastModified
                && cached.size == entry.size;
    }

    private static LocalLrcParser.LrcMetadata readMetadataHeader(Context ctx, Uri treeUri, String docId) {
        Uri docUri = DocumentsContract.buildDocumentUriUsingTree(treeUri, docId);
        try (InputStream in = ctx.getContentResolver().openInputStream(docUri)) {
            byte[] bytes = readLimitedBytes(in, LocalLrcParser.HEADER_PREVIEW_BYTES);
            LocalLrcParser.DecodedText decoded = LocalLrcParser.decodeBytes(bytes);
            if (decoded == null) return null;
            return LocalLrcParser.parseMetadata(decoded.text);
        } catch (IOException | RuntimeException e) {
            return null;
        }
    }

    private static String readFullText(Context ctx, Uri treeUri, String docId) {
        Uri docUri = DocumentsContract.buildDocumentUriUsingTree(treeUri, docId);
        try (InputStream in = ctx.getContentResolver().openInputStream(docUri)) {
            byte[] bytes = readLimitedBytes(in, LocalLrcParser.MAX_LRC_BYTES);
            LocalLrcParser.DecodedText decoded = LocalLrcParser.decodeBytes(bytes);
            return decoded != null ? decoded.text : null;
        } catch (IOException | RuntimeException e) {
            Log.w(TAG, "Failed reading local LRC file from folder: " + docId, e);
            return null;
        }
    }

    private static Map<String, CachedMeta> loadMetaIndex(Context ctx, String uriStr) {
        synchronized (LOCK) {
            if (cachedMetaByDocId != null && uriStr.equals(cachedTreeUri)) {
                return cachedMetaByDocId;
            }
        }
        Map<String, CachedMeta> loaded = new HashMap<>();
        File file = new File(LrclibPrefs.cacheDir(ctx), INDEX_FILE_NAME);
        if (file.isFile()) {
            try (FileInputStream in = new FileInputStream(file)) {
                byte[] bytes = readLimitedBytes(in, LocalLrcParser.MAX_LRC_BYTES);
                if (bytes != null && bytes.length > 0) {
                    JSONObject root = new JSONObject(new String(bytes, StandardCharsets.UTF_8));
                    if (uriStr.equals(root.optString("treeUri", ""))) {
                        JSONObject items = root.optJSONObject("items");
                        if (items != null) {
                            Iterator<String> it = items.keys();
                            while (it.hasNext()) {
                                String key = it.next();
                                JSONObject obj = items.optJSONObject(key);
                                if (obj == null) continue;
                                LocalLrcParser.LrcMetadata meta = new LocalLrcParser.LrcMetadata(
                                        obj.optString("ti", ""),
                                        obj.optString("ar", ""),
                                        obj.optString("al", ""),
                                        obj.optString("la", ""),
                                        obj.optInt("dur", 0),
                                        obj.optBoolean("sync", false)
                                );
                                loaded.put(key, new CachedMeta(
                                        obj.optLong("mod", 0L),
                                        obj.optLong("sz", 0L),
                                        meta
                                ));
                            }
                        }
                    }
                }
            } catch (IOException | JSONException ignored) {
            }
        }
        synchronized (LOCK) {
            cachedMetaByDocId = loaded;
        }
        return loaded;
    }

    private static void saveMetaIndex(Context ctx, String uriStr, Map<String, CachedMeta> index) {
        File file = new File(LrclibPrefs.cacheDir(ctx), INDEX_FILE_NAME);
        File tmp = new File(file.getParentFile(), file.getName() + ".tmp");
        try {
            JSONObject items = new JSONObject();
            for (Map.Entry<String, CachedMeta> e : index.entrySet()) {
                CachedMeta cm = e.getValue();
                if (cm == null || cm.metadata == null) continue;
                JSONObject obj = new JSONObject();
                obj.put("mod", cm.lastModified);
                obj.put("sz", cm.size);
                if (!cm.metadata.title.isEmpty()) obj.put("ti", cm.metadata.title);
                if (!cm.metadata.artist.isEmpty()) obj.put("ar", cm.metadata.artist);
                if (!cm.metadata.album.isEmpty()) obj.put("al", cm.metadata.album);
                if (!cm.metadata.language.isEmpty()) obj.put("la", cm.metadata.language);
                if (cm.metadata.durationSec > 0) obj.put("dur", cm.metadata.durationSec);
                obj.put("sync", cm.metadata.hasSyncedTimestamps);
                items.put(e.getKey(), obj);
            }
            JSONObject root = new JSONObject();
            root.put("treeUri", uriStr);
            root.put("items", items);
            byte[] bytes = root.toString().getBytes(StandardCharsets.UTF_8);
            try (FileOutputStream out = new FileOutputStream(tmp)) {
                out.write(bytes);
            }
            if (!tmp.renameTo(file)) {
                try (FileOutputStream out = new FileOutputStream(file)) {
                    out.write(bytes);
                }
                tmp.delete();
            }
        } catch (IOException | JSONException e) {
            tmp.delete();
        }
    }
}
