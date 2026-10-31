package samsungcompat;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import samsungcompat.sync.SyncRunner;

/**
 * The sync folder: {@code devices/<deviceId>.json} and {@code notes/<uuid>/<hash>.sdocx}. Files are
 * written as {@code .part} and renamed when complete, so a sync tool never ships a half-written file.
 */
final class NotesSyncFolder implements SyncRunner.SharedFolder {
    private static final String DEVICES = "devices";
    private static final String NOTES = "notes";
    private static final String MANIFEST_SUFFIX = ".json";
    private static final String PAYLOAD_SUFFIX = ".sdocx";
    private static final String PART = ".part";

    private final ContentResolver resolver;
    private final Uri tree;
    /** Per-run cache of directory listings: directory document URI -> (name -> URI). */
    private final Map<Uri, Map<String, Uri>> listings = new HashMap<>();

    NotesSyncFolder(ContentResolver resolver, Uri tree) {
        this.resolver = resolver;
        this.tree = tree;
    }

    @Override
    public Map<String, String> readManifests() throws IOException {
        Map<String, String> result = new LinkedHashMap<>();
        Uri devices = directory(root(), DEVICES, false);
        if (devices == null) return result;
        for (Map.Entry<String, Uri> child : list(devices).entrySet()) {
            String name = child.getKey();
            if (!name.endsWith(MANIFEST_SUFFIX)) continue;
            result.put(name.substring(0, name.length() - MANIFEST_SUFFIX.length()),
                new String(readAll(child.getValue()), StandardCharsets.UTF_8));
        }
        return result;
    }

    @Override
    public void writeManifest(String deviceId, String json) throws IOException {
        Uri devices = directory(root(), DEVICES, true);
        writeAtomically(devices, deviceId + MANIFEST_SUFFIX,
            out -> out.write(json.getBytes(StandardCharsets.UTF_8)));
    }

    @Override
    public boolean hasPayload(String uuid, String hash) {
        try {
            Uri notes = directory(root(), NOTES, false);
            Uri note = notes == null ? null : directory(notes, uuid, false);
            return note != null && list(note).containsKey(hash + PAYLOAD_SUFFIX);
        } catch (IOException e) {
            return false;
        }
    }

    @Override
    public void writePayload(String uuid, String hash, SyncRunner.PayloadWriter writer)
        throws IOException {
        Uri note = directory(directory(root(), NOTES, true), uuid, true);
        writeAtomically(note, hash + PAYLOAD_SUFFIX, writer);
    }

    @Override
    public InputStream openPayload(String uuid, String hash) throws IOException {
        Uri notes = directory(root(), NOTES, false);
        Uri note = notes == null ? null : directory(notes, uuid, false);
        Uri file = note == null ? null : list(note).get(hash + PAYLOAD_SUFFIX);
        if (file == null) throw new FileNotFoundException("payload " + uuid + "/" + hash);
        InputStream in = resolver.openInputStream(file);
        if (in == null) throw new FileNotFoundException("payload " + uuid + "/" + hash);
        return in;
    }

    private void writeAtomically(Uri dir, String name, SyncRunner.PayloadWriter writer)
        throws IOException {
        Map<String, Uri> children = list(dir);
        Uri stale = children.remove(name + PART);
        if (stale != null) delete(stale);
        Uri part = create(dir, name + PART, "application/octet-stream");
        boolean done = false;
        try {
            try (OutputStream out = resolver.openOutputStream(part, "wt")) {
                if (out == null) throw new IOException("cannot write " + name);
                writer.writeTo(out);
            }
            Uri old = children.remove(name);
            if (old != null) delete(old);
            Uri renamed = DocumentsContract.renameDocument(resolver, part, name);
            if (renamed == null) throw new IOException("cannot rename " + name);
            children.put(name, renamed);
            done = true;
        } finally {
            if (!done) {
                try { delete(part); } catch (IOException ignored) { }
            }
        }
    }

    private Uri root() {
        return DocumentsContract.buildDocumentUriUsingTree(tree,
            DocumentsContract.getTreeDocumentId(tree));
    }

    private Uri directory(Uri parent, String name, boolean create) throws IOException {
        Uri existing = list(parent).get(name);
        if (existing != null || !create) return existing;
        Uri made = create(parent, name, DocumentsContract.Document.MIME_TYPE_DIR);
        list(parent).put(name, made);
        return made;
    }

    private Uri create(Uri parent, String name, String mime) throws IOException {
        Uri made = DocumentsContract.createDocument(resolver, parent, mime, name);
        if (made == null) throw new IOException("cannot create " + name);
        return made;
    }

    private void delete(Uri document) throws IOException {
        if (!DocumentsContract.deleteDocument(resolver, document)) {
            throw new IOException("cannot delete " + document);
        }
    }

    private Map<String, Uri> list(Uri dir) throws IOException {
        Map<String, Uri> cached = listings.get(dir);
        if (cached != null) return cached;
        Map<String, Uri> result = new LinkedHashMap<>();
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree,
            DocumentsContract.getDocumentId(dir));
        String[] columns = {DocumentsContract.Document.COLUMN_DOCUMENT_ID,
            DocumentsContract.Document.COLUMN_DISPLAY_NAME};
        try (Cursor cursor = resolver.query(children, columns, null, null, null)) {
            if (cursor == null) throw new IOException("cannot list sync folder");
            while (cursor.moveToNext()) {
                result.put(cursor.getString(1),
                    DocumentsContract.buildDocumentUriUsingTree(tree, cursor.getString(0)));
            }
        }
        listings.put(dir, result);
        return result;
    }

    private byte[] readAll(Uri document) throws IOException {
        try (InputStream in = resolver.openInputStream(document)) {
            if (in == null) throw new IOException("cannot read " + document);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[32768];
            int count;
            while ((count = in.read(buffer)) != -1) out.write(buffer, 0, count);
            return out.toByteArray();
        }
    }
}
