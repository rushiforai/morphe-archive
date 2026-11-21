/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.shared.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.Manifest;
import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import android.provider.DocumentsContract;
import android.provider.DocumentsContract.Document;
import android.provider.MediaStore;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowContentResolver;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class PortableExportTest {
    private static final String AUTHORITY = "rvx.test.export";
    private static final Uri ROOT = DocumentsContract.buildTreeDocumentUri(AUTHORITY, "root");
    private static final Uri FIRST = Uri.parse("content://media/external/audio/media/1");
    private static final Uri SECOND = Uri.parse("content://media/external/audio/media/2");
    private static final Uri MISSING = Uri.parse("content://media/external/audio/media/3");

    @Rule public TemporaryFolder temp = new TemporaryFolder();

    private ContentResolver resolver;
    private MediaProvider media;
    private TreeProvider tree;

    @Before
    public void setup() throws IOException {
        var context = RuntimeEnvironment.getApplication();
        resolver = context.getContentResolver();
        media = new MediaProvider();
        ProviderInfo mediaInfo = new ProviderInfo();
        mediaInfo.authority = MediaStore.AUTHORITY;
        mediaInfo.applicationInfo = context.getApplicationInfo();
        media.attachInfo(context, mediaInfo);
        ShadowContentResolver.registerProviderInternal(MediaStore.AUTHORITY, media);

        tree = new TreeProvider(temp.getRoot());
        ProviderInfo info = new ProviderInfo();
        info.authority = AUTHORITY;
        info.exported = true;
        info.grantUriPermissions = true;
        info.readPermission = Manifest.permission.MANAGE_DOCUMENTS;
        info.writePermission = Manifest.permission.MANAGE_DOCUMENTS;
        info.applicationInfo = context.getApplicationInfo();
        Shadows.shadowOf(context).grantPermissions(Manifest.permission.MANAGE_DOCUMENTS);
        tree.attachInfo(context, info);
        ShadowContentResolver.registerProviderInternal(AUTHORITY, tree);
    }

    @Test
    public void singleCopyDoesNotOverwriteAMatchingFile() throws IOException {
        source(FIRST, "song.m4a", "first");
        tree.existing("root", "Song.m4a", "keep");
        var job = new PortableExport.Job(resolver, ROOT, new PortableExport.Request("Song", false, List.of(FIRST)));

        job.run();

        assertEquals(PortableExport.Outcome.FINISHED, job.result.outcome());
        assertEquals(1, job.result.copied());
        assertEquals("keep", tree.text("root", "Song.m4a"));
        assertEquals("first", tree.text("root", "song (2).m4a"));
        assertEquals("first", readText(media.files.get(FIRST).file()));
    }

    @Test
    public void duplicateNamesAndRepeatedExportsDoNotOverwriteAndKeepTheOrder() throws IOException {
        source(FIRST, "same.m4a", "first");
        source(SECOND, "Same.m4a", "second");
        String preexisting = tree.add("root", "Mix", Document.MIME_TYPE_DIR);
        tree.existing(preexisting, "original.txt", "keep");

        PortableExport.Result first = playlist(FIRST, SECOND, FIRST);
        PortableExport.Result again = playlist(FIRST, SECOND, FIRST);

        assertEquals(PortableExport.Outcome.FINISHED, first.outcome());
        assertEquals(3, first.copied());
        assertTrue(first.wrotePlaylist());
        assertEquals("Mix (2)", first.folderName());
        assertEquals("Mix (3)", again.folderName());
        assertEquals(3, again.copied());
        assertEquals("keep", tree.text(preexisting, "original.txt"));
        String copied = tree.id("root", "Mix (2)");
        assertEquals("first", tree.text(copied, "same.m4a"));
        assertEquals("second", tree.text(copied, "Same (2).m4a"));
        assertEquals("#EXTM3U\n./same.m4a\n./Same (2).m4a\n./same.m4a\n", tree.text(copied, "Mix.m3u8"));
        assertEquals(List.of(), tree.deleted);
        assertSourcesIntact();
    }

    @Test
    public void aDestinationFailureDeletesOnlyTheFailedCopy() throws IOException {
        setupTwoFilesAndExistingTree();
        tree.failOnOpen = "second.m4a";

        PortableExport.Result result = playlist(FIRST, SECOND);

        assertEquals(PortableExport.Outcome.DESTINATION_FAILED, result.outcome());
        assertPartialAndClean(result);
    }

    @Test
    public void cancellationDeletesOnlyTheInterruptedCopy() throws IOException {
        setupTwoFilesAndExistingTree();
        PortableExport.Job job = new PortableExport.Job(resolver, ROOT,
                new PortableExport.Request("Mix", true, List.of(FIRST, SECOND)));
        tree.cancelOnOpen = "second.m4a";
        tree.cancel = job::cancel;

        job.run();

        assertEquals(PortableExport.Outcome.CANCELLED, job.result.outcome());
        assertPartialAndClean(job.result);
    }

    @Test
    public void missingSourceReportsPartialAndWritesOnlyTheSuccessfulEntries() throws IOException {
        source(FIRST, "first.m4a", "first");
        source(SECOND, "second.m4a", "second");

        PortableExport.Result result = playlist(FIRST, MISSING, SECOND);

        assertEquals(PortableExport.Outcome.FINISHED, result.outcome());
        assertEquals(3, result.total());
        assertEquals(2, result.copied());
        assertEquals(1, result.missing());
        assertTrue(result.wrotePlaylist());
        assertEquals("#EXTM3U\n./first.m4a\n./second.m4a\n", tree.text(tree.id("root", "Mix"), "Mix.m3u8"));
        assertSourcesIntact();
    }

    private void setupTwoFilesAndExistingTree() throws IOException {
        source(FIRST, "first.m4a", "first");
        source(SECOND, "second.m4a", "second");
        String preexisting = tree.add("root", "Mix", Document.MIME_TYPE_DIR);
        tree.existing(preexisting, "second.m4a", "existing export");
    }

    private void assertPartialAndClean(PortableExport.Result result) throws IOException {
        assertEquals(1, result.copied());
        assertEquals(0, result.missing());
        assertEquals(0, result.cleanupFailures());
        assertFalse(result.wrotePlaylist());
        String copied = tree.id("root", "Mix (2)");
        assertEquals("first", tree.text(copied, "first.m4a"));
        assertNull(tree.id(copied, "second.m4a"));
        assertNull(tree.id(copied, "Mix.m3u8"));
        assertEquals(List.of("second.m4a"), tree.deleted);
        assertEquals("existing export", tree.text(tree.id("root", "Mix"), "second.m4a"));
        assertSourcesIntact();
    }

    private PortableExport.Result playlist(Uri... sources) {
        var job = new PortableExport.Job(resolver, ROOT, new PortableExport.Request("Mix", true, List.of(sources)));
        job.run();
        return job.result;
    }

    private static String readText(File file) throws IOException {
        return new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);
    }

    private static void writeText(File file, String contents) throws IOException {
        Files.write(file.toPath(), contents.getBytes(StandardCharsets.UTF_8));
    }

    private void source(Uri uri, String name, String contents) throws IOException {
        File file = temp.newFile();
        writeText(file, contents);
        media.files.put(uri, new Source(name, file));
    }

    private void assertSourcesIntact() throws IOException {
        assertEquals("first", readText(media.files.get(FIRST).file()));
        assertEquals("second", readText(media.files.get(SECOND).file()));
    }

    private record Source(String name, File file) {}

    private static final class MediaProvider extends ContentProvider {
        final Map<Uri, Source> files = new HashMap<>();

        @Override public boolean onCreate() { return true; }
        @Override public String getType(Uri uri) { return "audio/mp4"; }
        @Override public Uri insert(Uri uri, ContentValues values) { throw new AssertionError("Source insert"); }
        @Override public int delete(Uri uri, String where, String[] args) { throw new AssertionError("Source delete"); }
        @Override public int update(Uri uri, ContentValues values, String where, String[] args) {
            throw new AssertionError("Source update");
        }

        @Override
        public Cursor query(Uri uri, String[] projection, String where, String[] args, String sort) {
            MatrixCursor cursor = new MatrixCursor(projection);
            Source file = files.get(uri);
            if (file != null) {
                var row = cursor.newRow();
                for (String column : projection) {
                    row.add(switch (column) {
                        case MediaStore.MediaColumns.DISPLAY_NAME -> file.name();
                        case MediaStore.MediaColumns.MIME_TYPE -> getType(uri);
                        case MediaStore.MediaColumns.SIZE -> file.file().length();
                        case MediaStore.MediaColumns.IS_PENDING, MediaStore.MediaColumns.IS_TRASHED -> 0;
                        default -> throw new AssertionError(column);
                    });
                }
            }
            return cursor;
        }

        @Override
        public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
            assertEquals("No source can be opened for writing", "r", mode);
            Source source = files.get(uri);
            if (source == null) throw new FileNotFoundException();
            return ParcelFileDescriptor.open(source.file(), ParcelFileDescriptor.MODE_READ_ONLY);
        }
    }

    private record Node(String parent, String name, String mime, File disk) {}

    private static final class TreeProvider extends android.provider.DocumentsProvider {
        private final File files;
        private final Map<String, Node> nodes = new HashMap<>();
        private int nextId;
        String failOnOpen;
        String cancelOnOpen;
        Runnable cancel;
        final List<String> deleted = new ArrayList<>();

        TreeProvider(File files) {
            this.files = files;
            nodes.put("root", new Node(null, "Export fixture", Document.MIME_TYPE_DIR, null));
        }

        @Override public boolean onCreate() { return true; }
        @Override public Cursor queryRoots(String[] projection) { return new MatrixCursor(projection); }

        @Override
        public boolean isChildDocument(String parent, String child) {
            for (Node item = nodes.get(child); item != null; item = nodes.get(item.parent())) {
                if (parent.equals(item.parent())) return true;
            }
            return false;
        }

        @Override
        public Cursor queryDocument(String id, String[] projection) throws FileNotFoundException {
            Node node = nodes.get(id);
            if (node == null) throw new FileNotFoundException(id);
            MatrixCursor cursor = new MatrixCursor(projection);
            addRow(cursor, projection, id, node);
            return cursor;
        }

        @Override
        public Cursor queryChildDocuments(String parent, String[] projection, String sort) {
            MatrixCursor cursor = new MatrixCursor(projection);
            nodes.forEach((id, node) -> {
                if (parent.equals(node.parent())) addRow(cursor, projection, id, node);
            });
            return cursor;
        }

        private static void addRow(MatrixCursor cursor, String[] projection, String id, Node node) {
            var row = cursor.newRow();
            for (String column : projection) {
                row.add(switch (column) {
                    case Document.COLUMN_DOCUMENT_ID -> id;
                    case Document.COLUMN_DISPLAY_NAME -> node.name();
                    case Document.COLUMN_MIME_TYPE -> node.mime();
                    case Document.COLUMN_FLAGS -> Document.FLAG_SUPPORTS_DELETE
                            | (node.disk() == null ? Document.FLAG_DIR_SUPPORTS_CREATE : Document.FLAG_SUPPORTS_WRITE);
                    default -> throw new AssertionError(column);
                });
            }
        }

        String add(String parent, String name, String mime) {
            String id = "node" + ++nextId;
            File disk = Document.MIME_TYPE_DIR.equals(mime) ? null : new File(files, id);
            nodes.put(id, new Node(parent, name, mime, disk));
            return id;
        }

        void existing(String parent, String name, String contents) throws IOException {
            String id = add(parent, name, "application/octet-stream");
            writeText(nodes.get(id).disk(), contents);
        }

        String id(String parent, String name) {
            return nodes.entrySet().stream().filter(entry -> parent.equals(entry.getValue().parent())
                            && name.equals(entry.getValue().name())).map(Map.Entry::getKey).findFirst().orElse(null);
        }

        String text(String parent, String name) throws IOException {
            return readText(nodes.get(id(parent, name)).disk());
        }

        @Override
        public String createDocument(String parent, String mime, String name) {
            assertNull("Never ask a provider to create an existing name", id(parent, name));
            return add(parent, name, mime);
        }

        @Override
        public void deleteDocument(String id) throws FileNotFoundException {
            Node node = nodes.remove(id);
            if (node == null) throw new FileNotFoundException(id);
            if (node.disk() != null && node.disk().exists()) assertTrue(node.disk().delete());
            deleted.add(node.name());
        }

        @Override
        public ParcelFileDescriptor openDocument(String id, String mode, CancellationSignal signal)
                throws FileNotFoundException {
            assertEquals("Never request seekable read/write access", "w", mode);
            Node node = nodes.get(id);
            if (node.name().equals(failOnOpen) || node.name().equals(cancelOnOpen)) {
                try {
                    writeText(node.disk(), "partial output");
                } catch (IOException ex) {
                    throw new AssertionError(ex);
                }
                if (node.name().equals(failOnOpen)) throw new FileNotFoundException("Destination became read-only");
                cancel.run();
            }
            return ParcelFileDescriptor.open(node.disk(), ParcelFileDescriptor.MODE_WRITE_ONLY
                    | ParcelFileDescriptor.MODE_CREATE);
        }
    }
}
