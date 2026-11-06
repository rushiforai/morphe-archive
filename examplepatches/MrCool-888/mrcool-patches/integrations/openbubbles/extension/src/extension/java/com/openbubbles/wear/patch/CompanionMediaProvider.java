package com.openbubbles.wear.patch;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Binder;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.util.Log;

import com.localob.messaging.backend.db.Attachment;
import com.localob.messaging.backend.db.Attachment_;
import com.localob.messaging.backend.db.Database;
import com.localob.messaging.backend.db.Message;

import io.objectbox.query.Query;
import io.objectbox.query.QueryBuilder;

import org.json.JSONObject;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

/** Only the pinned companion can read backend images; a first read downloads them. */
public final class CompanionMediaProvider extends ContentProvider {
    static final String AUTHORITY = "com.openbubbles.messaging.wear.media";
    private static final long DOWNLOAD_TIMEOUT_MS = 25_000L;
    private static final Pattern ATTACHMENT_GUID = Pattern.compile("[A-Za-z0-9][A-Za-z0-9_-]{0,199}");

    @Override
    public boolean onCreate() {
        // Providers are created before Application.onCreate; do not touch the database here.
        return true;
    }

    private void enforceCaller() {
        if (!isSameUid(Binder.getCallingUid())) {
            throw new SecurityException("The media caller must share the OpenBubbles UID.");
        }
        if (!PatchSettings.isEnabled(getContext())) {
            throw new SecurityException("Wear companion bridge is disabled in OpenBubbles.");
        }
    }

    static boolean isSameUid(int callingUid) { return callingUid == Process.myUid(); }

    @Override
    public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        enforceCaller();
        requireReadMode(mode);
        try {
            Attachment attachment = findAttachment(attachmentGuid(uri));
            attachment.refreshFlows();
            if (!hasReadableFile(Database.INSTANCE.getAttachmentsDir(), attachment.getLocalPathFlow().getValue())) {
                if (Boolean.TRUE.equals(attachment.isDownloaded())) {
                    // OpenBubbles trusts isDownloaded even when the cached file is gone,
                    // so download() would return true without fetching anything.
                    Log.w("OBWearPatch", "Re-downloading stale attachment " + attachment.getGuid());
                    attachment.setDownloaded(false);
                    attachment.refreshFlows();
                }
                BridgeOps.downloadAttachment(attachment, DOWNLOAD_TIMEOUT_MS);
                // A finished download only persists isDownloaded; the path flow stays stale.
                attachment.refreshFlows();
                if (!hasReadableFile(Database.INSTANCE.getAttachmentsDir(), attachment.getLocalPathFlow().getValue())) {
                    Log.w("OBWearPatch", "Attachment still unavailable after download " + attachment.getGuid());
                }
            }
            return ParcelFileDescriptor.open(localFile(attachment), ParcelFileDescriptor.MODE_READ_ONLY);
        } catch (FileNotFoundException e) {
            throw e;
        } catch (Exception e) {
            throw new FileNotFoundException("Downloaded image unavailable.");
        }
    }

    @Override
    public String getType(Uri uri) {
        enforceCaller();
        try {
            return imageMime(findAttachment(attachmentGuid(uri)).getMimeType());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public String getTypeAnonymous(Uri uri) {
        return null;
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        enforceCaller();
        throw new UnsupportedOperationException("Media queries are not supported.");
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        enforceCaller();
        throw new UnsupportedOperationException("Media is read-only.");
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        enforceCaller();
        throw new UnsupportedOperationException("Media is read-only.");
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        enforceCaller();
        throw new UnsupportedOperationException("Media is read-only.");
    }

    static void requireReadMode(String mode) {
        if (!"r".equals(mode)) throw new SecurityException("Media is read-only.");
    }

    static boolean validAttachmentGuid(String guid) {
        return guid != null && ATTACHMENT_GUID.matcher(guid).matches();
    }

    static Uri uriFor(String guid) {
        if (!validAttachmentGuid(guid)) throw new IllegalArgumentException("Invalid attachment ID.");
        return new Uri.Builder().scheme("content").authority(AUTHORITY)
                .appendPath("attachment").appendPath(guid).build();
    }

    static String attachmentGuid(Uri uri) throws FileNotFoundException {
        if (uri == null || !"content".equals(uri.getScheme()) || !AUTHORITY.equals(uri.getAuthority()) ||
                uri.getQuery() != null || uri.getFragment() != null) throw unavailable();
        List<String> segments = uri.getPathSegments();
        if (segments.size() != 2 || !"attachment".equals(segments.get(0)) ||
                !validAttachmentGuid(segments.get(1))) throw unavailable();
        String guid = segments.get(1);
        if (!uriFor(guid).equals(uri)) throw unavailable();
        return guid;
    }

    private static Attachment findAttachment(String guid) throws FileNotFoundException {
        try (Query<Attachment> query = Database.INSTANCE.getAttachments().query()
                .equal(Attachment_.guid, guid, QueryBuilder.StringOrder.CASE_SENSITIVE).build()) {
            Attachment attachment = query.findUnique();
            if (attachment == null || !guid.equals(attachment.getGuid())) throw unavailable();
            return attachment;
        }
    }

    private static File localFile(Attachment attachment) throws IOException {
        if (attachment == null || !validAttachmentGuid(attachment.getGuid()) ||
                Boolean.FALSE.equals(attachment.isDownloaded()) || imageMime(attachment.getMimeType()) == null) {
            throw unavailable();
        }
        Message message = attachment.getMessage().getTarget();
        if (message == null || message.getDateDeleted() != null) throw unavailable();
        String path = attachment.getLocalPathFlow().getValue();
        if (path == null) throw unavailable();
        return containedFile(Database.INSTANCE.getAttachmentsDir(), new File(path));
    }

    static boolean hasReadableFile(File root, String path) {
        if (path == null) return false;
        try {
            containedFile(root, new File(path));
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    static File containedFile(File root, File candidate) throws IOException {
        if (root == null || candidate == null) throw unavailable();
        File directory = root.getCanonicalFile();
        File file = candidate.getCanonicalFile();
        if (!file.toPath().startsWith(directory.toPath()) || file.equals(directory) ||
                !file.isFile() || !file.canRead()) throw unavailable();
        return file;
    }

    static String imageMime(String mime) {
        if (mime == null) return null;
        String value = mime.trim().toLowerCase(Locale.ROOT);
        switch (value) {
            case "image/heic-sequence": return "image/heic";
            case "image/heif-sequence": return "image/heif";
            case "image/jpeg": case "image/png": case "image/gif": case "image/webp":
            case "image/heic": case "image/heif": case "image/avif": case "image/bmp":
                return value;
            default:
                return null;
        }
    }

    static void putMedia(JSONObject out, Message message) {
        try (Query<Attachment> query = Database.INSTANCE.getAttachments().query()
                .equal(Attachment_.messageId, message.getId()).build()) {
            // shortcut: one image per message; extend the wire model for galleries.
            for (Attachment attachment : query.find(0, 16)) {
                try {
                    String mime = imageMime(attachment.getMimeType());
                    if (mime == null) continue;
                    Message owner = attachment.getMessage().getTarget();
                    if (owner == null || owner.getDateDeleted() != null) continue;
                    // Expose the image even before it is downloaded; the provider
                    // fetches it on the first watch read.
                    out.put("mediaUri", uriFor(attachment.getGuid()).toString());
                    out.put("mediaMime", mime);
                    return;
                } catch (Exception ignored) {
                    // Non-image or detached attachments stay placeholders.
                }
            }
        } catch (Throwable t) {
            Log.d("OBWearPatch", "Downloaded attachment unavailable", t);
        }
    }

    private static FileNotFoundException unavailable() {
        return new FileNotFoundException("Downloaded image unavailable.");
    }
}
