package io.github.liongalahad.nuviotv.extension.storage.segmented;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.DocumentsContract;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/** Generic manifest and lifecycle support for media stored as ordered byte segments. */
public final class SegmentedMedia {
    public static final String AUTHORITY_SUFFIX = ".morphe.segmented";
    public static final String MANIFEST_SUFFIX = ".morphe-segments.json";
    public static final String PART_MARKER = ".morphe-part-";
    public static final String STORE_DIRECTORY = ".morphe-segments";
    public static final String BUNDLE_MANIFEST = "manifest.json";
    public static final String DESCRIPTIVE_MANIFEST_SUFFIX = " - playback manifest.json";
    public static final String BUNDLE_PART_PREFIX = "part-";
    private static final String FORMAT = "morphe-segmented-media";
    private static final int VERSION = 1;

    private SegmentedMedia() {}

    public static boolean isManifestName(String name) {
        return name != null && name.toLowerCase(Locale.ROOT).endsWith(MANIFEST_SUFFIX);
    }

    public static boolean isPartName(String name) {
        return name != null && name.toLowerCase(Locale.ROOT).contains(PART_MARKER);
    }

    public static boolean isStoreDirectory(String name) {
        return name != null && STORE_DIRECTORY.equalsIgnoreCase(name);
    }

    public static boolean isBundleManifestName(String name) {
        if (name == null) return false;
        String normalized = name.toLowerCase(Locale.ROOT);
        return BUNDLE_MANIFEST.equalsIgnoreCase(name) ||
                normalized.endsWith(DESCRIPTIVE_MANIFEST_SUFFIX.toLowerCase(Locale.ROOT));
    }

    public static Uri virtualUri(Context context, Uri manifestUri, String bundleId) {
        if (context == null || manifestUri == null || bundleId == null || bundleId.isEmpty()) return null;
        return new Uri.Builder()
                .scheme("content")
                .authority(context.getPackageName() + AUTHORITY_SUFFIX)
                .appendPath("bundle")
                .appendPath(bundleId)
                .appendQueryParameter("manifest", manifestUri.toString())
                .build();
    }

    public static Uri manifestUri(Uri virtualUri) {
        if (virtualUri == null) return null;
        String raw = virtualUri.getQueryParameter("manifest");
        return raw == null || raw.isEmpty() ? null : Uri.parse(raw);
    }

    public static String bundleId(Uri virtualUri) {
        if (virtualUri == null || virtualUri.getPathSegments().size() != 2 ||
                !"bundle".equals(virtualUri.getPathSegments().get(0))) return null;
        return virtualUri.getPathSegments().get(1);
    }

    public static void write(OutputStream output, Manifest manifest) throws IOException {
        if (output == null || manifest == null) throw new IOException("Segmented media manifest is unavailable");
        byte[] encoded = manifest.toJson().toString().getBytes(StandardCharsets.UTF_8);
        output.write(encoded);
        output.flush();
    }

    public static Manifest read(Context context, Uri manifestUri) throws IOException {
        if (context == null || manifestUri == null) throw new IOException("Segmented media manifest is unavailable");
        try (InputStream input = context.getContentResolver().openInputStream(manifestUri)) {
            if (input == null) throw new IOException("Segmented media manifest could not be opened");
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[16 * 1024];
            int count;
            while ((count = input.read(buffer)) >= 0) {
                if (count > 0) bytes.write(buffer, 0, count);
                if (bytes.size() > 1024 * 1024) throw new IOException("Segmented media manifest is too large");
            }
            return Manifest.fromJson(new JSONObject(bytes.toString(StandardCharsets.UTF_8.name())));
        } catch (JSONException error) {
            throw new IOException("Segmented media manifest is malformed", error);
        }
    }

    public static boolean isReadable(Context context, Manifest manifest) {
        if (context == null || manifest == null || manifest.segments.isEmpty()) return false;
        for (Segment segment : manifest.segments) {
            if ("file".equalsIgnoreCase(segment.uri.getScheme())) {
                File file = fileFromUri(segment.uri);
                if (file == null || !file.isFile() || file.length() < segment.length) return false;
                continue;
            }
            try (ParcelFileDescriptor descriptor =
                         context.getContentResolver().openFileDescriptor(segment.uri, "r")) {
                if (descriptor == null) return false;
                long size = descriptor.getStatSize();
                if (size >= 0L && size < segment.length) return false;
            } catch (Exception error) {
                return false;
            }
        }
        return true;
    }

    public static boolean delete(Context context, Uri manifestUri) {
        if (context == null || manifestUri == null) return false;
        Manifest manifest;
        try {
            manifest = read(context, manifestUri);
        } catch (IOException error) {
            return false;
        }
        boolean complete = true;
        for (Segment segment : manifest.segments) complete &= deleteUri(context, segment.uri);
        complete &= deleteUri(context, manifestUri);
        return complete;
    }

    public static boolean deleteVirtual(Context context, Uri virtualUri) {
        return delete(context, manifestUri(virtualUri));
    }

    /** Removes an empty direct bundle, or empty legacy categories through the hidden store. */
    public static void cleanupContainer(Context context, Uri manifestUri) {
        if (context == null || manifestUri == null) return;
        try {
            if ("file".equalsIgnoreCase(manifestUri.getScheme())) {
                File manifest = fileFromUri(manifestUri);
                if (manifest == null || !isBundleManifestName(manifest.getName())) return;
                File store = hiddenStoreAncestor(manifest.getParentFile());
                if (store == null) {
                    deleteIfEmpty(manifest.getParentFile());
                    return;
                }
                File current = manifest.getParentFile();
                while (current != null) {
                    boolean isStore = current.equals(store);
                    if (!deleteIfEmpty(current)) break;
                    if (isStore) break;
                    current = current.getParentFile();
                }
                return;
            }
            if (!"content".equalsIgnoreCase(manifestUri.getScheme())) return;
            String manifestId = DocumentsContract.getDocumentId(manifestUri);
            int separator = manifestId == null ? -1 : manifestId.lastIndexOf('/');
            if (separator <= 0) return;
            String currentId = manifestId.substring(0, separator);
            String bundleId = currentId;
            List<String> ancestors = new ArrayList<>();
            String storeId = null;
            while (currentId != null && !currentId.isEmpty()) {
                ancestors.add(currentId);
                int parent = currentId.lastIndexOf('/');
                String name = currentId.substring(parent + 1);
                if (isStoreDirectory(name)) {
                    storeId = currentId;
                    break;
                }
                if (parent <= 0) break;
                currentId = currentId.substring(0, parent);
            }
            if (storeId == null) {
                Uri bundle = DocumentsContract.buildDocumentUriUsingTree(manifestUri, bundleId);
                if (documentFolderEmpty(context, bundle)) {
                    DocumentsContract.deleteDocument(context.getContentResolver(), bundle);
                }
                return;
            }
            for (String ancestorId : ancestors) {
                Uri ancestor = DocumentsContract.buildDocumentUriUsingTree(manifestUri, ancestorId);
                if (!documentFolderEmpty(context, ancestor)) break;
                DocumentsContract.deleteDocument(context.getContentResolver(), ancestor);
                if (ancestorId.equals(storeId)) break;
            }
        } catch (Throwable ignored) { }
    }

    private static File hiddenStoreAncestor(File directory) {
        File current = directory;
        while (current != null) {
            if (isStoreDirectory(current.getName())) return current;
            current = current.getParentFile();
        }
        return null;
    }

    private static boolean deleteIfEmpty(File directory) {
        String[] children = directory == null ? null : directory.list();
        if (directory != null && directory.isDirectory() && children != null && children.length == 0) {
            return directory.delete();
        }
        return false;
    }

    private static boolean documentFolderEmpty(Context context, Uri directory) {
        String id = DocumentsContract.getDocumentId(directory);
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(directory, id);
        try (Cursor cursor = context.getContentResolver().query(children,
                new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID}, null, null, null)) {
            return cursor != null && cursor.getCount() == 0;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean deleteUri(Context context, Uri uri) {
        if (context == null || uri == null) return false;
        try {
            if ("file".equalsIgnoreCase(uri.getScheme())) {
                File file = fileFromUri(uri);
                if (file == null) return false;
                return !file.exists() || (file.isFile() && file.delete());
            }
            if ("content".equalsIgnoreCase(uri.getScheme())) {
                return DocumentsContract.deleteDocument(context.getContentResolver(), uri);
            }
        } catch (Throwable ignored) { }
        return false;
    }

    private static File fileFromUri(Uri uri) {
        try { return new File(new java.net.URI(uri.toString())); }
        catch (Exception ignored) { }
        String path = uri == null ? null : uri.getPath();
        if (path == null || path.isEmpty()) return null;
        if (File.separatorChar == '\\' && path.matches("^/[A-Za-z]:/.*")) path = path.substring(1);
        return new File(path);
    }

    public static final class Segment {
        public final Uri uri;
        public final long length;

        public Segment(Uri uri, long length) {
            if (uri == null || length <= 0L) throw new IllegalArgumentException("Invalid media segment");
            this.uri = uri;
            this.length = length;
        }
    }

    public static final class Manifest {
        public final String bundleId;
        public final String filename;
        public final String mimeType;
        public final String logicalParent;
        public final long totalLength;
        public final List<Segment> segments;

        public Manifest(String bundleId, String filename, String mimeType, List<Segment> segments) {
            this(bundleId, filename, mimeType, "", segments);
        }

        public Manifest(String bundleId, String filename, String mimeType,
                        String logicalParent, List<Segment> segments) {
            if (bundleId == null || bundleId.trim().isEmpty() || filename == null ||
                    filename.trim().isEmpty() || segments == null || segments.isEmpty()) {
                throw new IllegalArgumentException("Invalid segmented media manifest");
            }
            String parent = logicalParent == null ? "" : logicalParent.trim();
            if (parent.contains("/") || parent.contains("\\") || parent.equals(".") ||
                    parent.equals("..")) {
                throw new IllegalArgumentException("Invalid segmented media logical folder");
            }
            long total = 0L;
            for (Segment segment : segments) {
                if (segment == null || Long.MAX_VALUE - total < segment.length) {
                    throw new IllegalArgumentException("Invalid segmented media size");
                }
                total += segment.length;
            }
            this.bundleId = bundleId;
            this.filename = filename;
            this.mimeType = mimeType == null || mimeType.isEmpty()
                    ? "application/octet-stream" : mimeType;
            this.logicalParent = parent;
            this.totalLength = total;
            this.segments = Collections.unmodifiableList(new ArrayList<>(segments));
        }

        JSONObject toJson() throws IOException {
            try {
                JSONArray values = new JSONArray();
                for (Segment segment : segments) {
                    values.put(new JSONObject().put("uri", segment.uri.toString())
                            .put("length", segment.length));
                }
                return new JSONObject().put("format", FORMAT).put("version", VERSION)
                        .put("bundleId", bundleId).put("filename", filename)
                        .put("mimeType", mimeType).put("logicalParent", logicalParent)
                        .put("totalLength", totalLength)
                        .put("segments", values);
            } catch (JSONException error) {
                throw new IOException("Unable to encode segmented media manifest", error);
            }
        }

        static Manifest fromJson(JSONObject value) throws JSONException, IOException {
            if (!FORMAT.equals(value.optString("format")) || value.optInt("version") != VERSION) {
                throw new IOException("Unsupported segmented media manifest");
            }
            JSONArray values = value.optJSONArray("segments");
            if (values == null || values.length() == 0) throw new IOException("Segment list is empty");
            List<Segment> segments = new ArrayList<>();
            for (int index = 0; index < values.length(); index++) {
                JSONObject part = values.getJSONObject(index);
                String rawUri = part.optString("uri");
                long length = part.optLong("length", -1L);
                if (rawUri.isEmpty() || length <= 0L) throw new IOException("Invalid media segment");
                segments.add(new Segment(Uri.parse(rawUri), length));
            }
            Manifest manifest = new Manifest(value.optString("bundleId"),
                    value.optString("filename"), value.optString("mimeType"),
                    value.optString("logicalParent"), segments);
            if (value.optLong("totalLength", -1L) != manifest.totalLength) {
                throw new IOException("Segmented media size does not match its parts");
            }
            return manifest;
        }
    }
}
