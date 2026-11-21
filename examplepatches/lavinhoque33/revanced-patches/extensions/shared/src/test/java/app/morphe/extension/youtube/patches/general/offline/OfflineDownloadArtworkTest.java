/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.Environment;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.HexFormat;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import fi.iki.elonen.NanoHTTPD;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class OfflineDownloadArtworkTest {
    private static final String VIDEO_ID = "TestVideo01";
    private static final String TITLE = "Fixture title";
    private static final String MAX = "/vi/" + VIDEO_ID + "/maxresdefault.jpg";
    private static final String SD = "/vi/" + VIDEO_ID + "/sddefault.jpg";
    private static final String HQ = "/vi/" + VIDEO_ID + "/hqdefault.jpg";
    private static final String LIBRARY = "/library.jpg";

    // An empty moov is enough for the real tagger; none of the tests needs a codec.
    private static final byte[] MP4 = HexFormat.of().parseHex("000000086d6f6f76");
    private static final byte[] PNG = Base64.getDecoder().decode(
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAADElEQVR4nGP4z8AAAAMBAQDJ/pLvAAAAAElFTkSuQmCC");
    private static final byte[] WEBP = Base64.getDecoder().decode(
            "UklGRj4AAABXRUJQVlA4IDIAAADQAQCdASoBAAEAAUAmJaACdLoB+AADsAD+6SIf+8+fufP3Pn/Rn/+U/fI4/kcf/KBAAA==");
    private static final byte[] LIBRARY_IMAGE = Base64.getDecoder().decode(
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAADElEQVR4nGNgYPgPAAEDAQAIicLsAAAAAElFTkSuQmCC");

    @Rule public final TemporaryFolder temporary = new TemporaryFolder();

    private final List<String> requests = Collections.synchronizedList(new ArrayList<>());
    private Context context;
    private NanoHTTPD server;

    @Before
    public void setUp() throws IOException {
        var app = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.versionName = "21.39.525";
        info.applicationInfo = app.getApplicationInfo();
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);
        Settings.OFFLINE_SAVE_THUMBNAIL.save(true);

        File external = temporary.newFolder();
        context = new ContextWrapper(app) {
            @Override
            public File getExternalFilesDir(String type) {
                return new File(external, type);
            }
        };
    }

    @After
    public void stopServer() {
        if (server != null) server.stop();
    }

    @Test
    public void bothOutputsUseTheSameOriginalAndKeepTheLibraryCopySeparate() throws IOException {
        ByteBuffer cover = box(box(saveAudio(Map.of(SD, PNG)), "covr"), "data");
        assertNotNull(cover);
        assertEquals(14, cover.getInt()); // iTunes data type for PNG.
        assertEquals(0, cover.getInt()); // Default locale.
        byte[] embedded = new byte[cover.remaining()];
        cover.get(embedded);
        assertArrayEquals(PNG, embedded);
        assertArrayEquals(PNG, publishedImage("png"));
        assertEquals(List.of(MAX, SD, LIBRARY), requests);
    }

    @Test
    public void webpIsExportedWithoutBeingEmbeddedOrReplacedBySmallerArtwork() throws IOException {
        assertNull(box(saveAudio(Map.of(MAX, WEBP, SD, PNG)), "covr"));
        assertArrayEquals(WEBP, publishedImage("webp"));
        assertEquals(List.of(MAX, LIBRARY), requests);
    }

    @Test
    public void invalidAndMissingArtworkDoesNotRepeatTheOriginalLookup() throws IOException {
        byte[] html = "<html>Not an image</html>".getBytes(StandardCharsets.UTF_8);
        assertNull(box(saveAudio(Map.of(MAX, html)), "covr"));
        assertFalse(pictures().exists());
        assertEquals(List.of(MAX, SD, HQ, LIBRARY), requests);
    }

    /** Runs the production save and returns the resulting M4A tag atoms. */
    private ByteBuffer saveAudio(Map<String, byte[]> originals) throws IOException {
        server = new NanoHTTPD("127.0.0.1", 0) {
            @Override
            public Response serve(IHTTPSession session) {
                String path = session.getUri();
                requests.add(path);
                byte[] bytes = LIBRARY.equals(path) ? LIBRARY_IMAGE : originals.get(path);
                if (bytes == null) return newFixedLengthResponse(Response.Status.NOT_FOUND, MIME_PLAINTEXT, "");
                return newFixedLengthResponse(Response.Status.OK, "application/octet-stream",
                        new ByteArrayInputStream(bytes), bytes.length);
            }
        };
        server.start(NanoHTTPD.SOCKET_READ_TIMEOUT, true);
        String host = "http://127.0.0.1:" + server.getListeningPort();

        var audio = new OfflineFormats.Stream("", 140, "audio/mp4", MP4.length, 0, 0,
                OfflineFormats.CODEC_AAC, 128_000, true, false, false);
        var resolved = new OfflineFormats.Resolved(VIDEO_ID, 0, null, null, TITLE, "Fixture channel", "", 0,
                host + LIBRARY, List.of(), audio, null, new OfflineCaptions.Catalog(List.of()));
        var sponsor = new OfflineSponsorBlock.Selection(false, List.of(), null);
        var task = new OfflineDownloader.Task(resolved, audio, sponsor);
        File source = temporary.newFile();
        Files.write(source.toPath(), MP4);
        OfflineDownloader.saveDownload(context, task, new File[]{source}, null,
                id -> OfflineThumbnails.fetchOriginal(id, host + "/vi/%s/%s.jpg"));

        OfflineVideo saved = OfflineIndex.get(task.key);
        assertNotNull(saved);
        assertArrayEquals(LIBRARY_IMAGE, Files.readAllBytes(new File(saved.thumbnailPath).toPath()));
        File destination = new File(Uri.parse(saved.contentUri).getPath());
        ByteBuffer mp4 = ByteBuffer.wrap(Files.readAllBytes(destination.toPath()));
        ByteBuffer meta = box(box(box(mp4, "moov"), "udta"), "meta");
        assertNotNull(meta);
        meta.getInt(); // Version and flags.
        ByteBuffer atoms = box(meta, "ilst");
        ByteBuffer title = box(box(atoms, "\u00A9nam"), "data");
        assertNotNull(title);
        title.getLong(); // Text type and locale.
        assertEquals(TITLE, StandardCharsets.UTF_8.decode(title).toString());
        return atoms;
    }

    private File pictures() {
        return new File(context.getExternalFilesDir(Environment.DIRECTORY_PICTURES), OfflineOptions.thumbnailFolder());
    }

    private byte[] publishedImage(String extension) throws IOException {
        String name = OfflineDownloader.displayName(TITLE, VIDEO_ID, extension);
        return Files.readAllBytes(new File(pictures(), name).toPath());
    }

    private static ByteBuffer box(ByteBuffer parent, String name) {
        assertNotNull(parent);
        ByteBuffer boxes = parent.duplicate();
        while (boxes.remaining() >= 8) {
            int length = boxes.getInt();
            byte[] type = new byte[4];
            boxes.get(type);
            if (name.equals(new String(type, StandardCharsets.ISO_8859_1))) {
                return boxes.slice(boxes.position(), length - 8);
            }
            boxes.position(boxes.position() + length - 8);
        }
        return null;
    }
}
