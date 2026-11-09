/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;
import static org.junit.Assume.assumeNoException;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

/** Clear from cache (#53): which files may be deleted, which names are tried, and that a sweep keeps to them. */
public class CacheClearTest {
    @Rule public final TemporaryFolder temp = new TemporaryFolder();

    private File video;
    private File documents;
    private File downloads;
    private List<File> telegram;
    private List<File> publicStorage;

    @Before public void setUp() throws IOException {
        File files = temp.newFolder("Android", "data", "app", "files", "Telegram");
        video = new File(files, "Telegram Video");
        documents = new File(files, "Telegram Documents");
        assertTrue(video.mkdirs() && documents.mkdirs());
        downloads = temp.newFolder("Download");
        telegram = Arrays.asList(video, documents);
        publicStorage = Collections.singletonList(downloads);
    }

    private File make(File folder, String name, int bytes) throws IOException {
        File file = new File(folder, name);
        Files.write(file.toPath(), new byte[bytes]);
        return file;
    }

    @Test public void filesInsideTelegramsFoldersAreAllowed() throws IOException {
        assertTrue(CacheClear.allowed(make(video, "a.mp4", 1), telegram, publicStorage));
    }

    @Test public void theFoldersThemselvesAreNotAllowed() {
        assertFalse(CacheClear.allowed(video, telegram, publicStorage));
    }

    @Test public void publicStorageIsNeverAllowed() throws IOException {
        assertFalse(CacheClear.allowed(make(downloads, "a.mp4", 1), telegram, publicStorage));
    }

    @Test public void aTelegramFolderInsidePublicStorageStillIsNotTouched() throws IOException {
        File inside = new File(downloads, "Telegram");
        assertTrue(inside.mkdirs());
        assertFalse(CacheClear.allowed(make(inside, "a.mp4", 1), Collections.singletonList(inside), publicStorage));
    }

    @Test public void pathsOutsideEveryFolderAreNotAllowed() throws IOException {
        assertFalse(CacheClear.allowed(make(temp.getRoot(), "other.mp4", 1), telegram, publicStorage));
    }

    @Test public void dotDotCannotLeaveAFolder() throws IOException {
        make(downloads, "a.mp4", 1);
        assertFalse(CacheClear.allowed(new File(video, "../../../../../Download/a.mp4"), telegram, publicStorage));
    }

    @Test public void aLinkCannotPointOutOfAFolder() throws IOException {
        File target = make(downloads, "a.mp4", 1);
        File link = new File(video, "link.mp4");
        try {
            Files.createSymbolicLink(link.toPath(), target.toPath());
        } catch (IOException | UnsupportedOperationException | SecurityException unavailable) {
            assumeNoException(unavailable);
        }
        assertFalse(CacheClear.allowed(link, telegram, publicStorage));
        assertEquals(0, CacheClear.sweep(Collections.singletonList(link), telegram, publicStorage));
        assertTrue(target.isFile());
    }

    @Test public void noRootsMeansNothingIsAllowed() throws IOException {
        assertFalse(CacheClear.allowed(make(video, "a.mp4", 1), new ArrayList<File>(), publicStorage));
        assertFalse(CacheClear.allowed(null, telegram, publicStorage));
    }

    @Test public void baseDropsTheExtension() {
        assertEquals("123_4", CacheClear.base("123_4.mp4"));
        assertEquals("noext", CacheClear.base("noext"));
        assertEquals(".hidden", CacheClear.base(".hidden"));
    }

    @Test public void everyEndingIsTriedInEveryFolder() {
        List<File> found = CacheClear.candidates("77_5.mp4", null, telegram);
        assertTrue(found.contains(new File(video, "77_5.mp4")));
        assertTrue(found.contains(new File(documents, "77_5.temp")));
        assertTrue(found.contains(new File(video, "77_5_64.iv")));
        assertTrue(found.contains(new File(documents, "77_5.temp.enc")));
    }

    @Test public void aNameWithAPathPartIsRefused() {
        assertTrue(CacheClear.candidates("../x.mp4", null, telegram).isEmpty());
        assertTrue(CacheClear.candidates("a/b.mp4", null, telegram).isEmpty());
        assertTrue(CacheClear.candidates("a\\b.mp4", null, telegram).isEmpty());
        assertTrue(CacheClear.candidates("", null, telegram).isEmpty());
        assertTrue(CacheClear.candidates(null, null, telegram).isEmpty());
    }

    @Test public void theFinishedFileTelegramNamesIsTriedFirstEvenWithoutAName() throws IOException {
        File finished = make(video, "z.mp4", 1);
        List<File> found = CacheClear.candidates(null, finished, telegram);
        assertEquals(Collections.singletonList(finished), found);
    }

    @Test public void aSweepDeletesFinishedAndPartialFilesAndCountsThem() throws IOException {
        File finished = make(video, "9_1.mp4", 1000);
        File partial = make(video, "9_1.temp", 200);
        File parts = make(documents, "9_1_64.pt", 30);
        File saved = make(downloads, "9_1.mp4", 5000);
        File other = make(video, "10_1.mp4", 7);
        List<File> files = CacheClear.candidates("9_1.mp4", finished, telegram);
        files.add(saved);
        assertEquals(1230, CacheClear.sweep(files, telegram, publicStorage));
        assertFalse(finished.exists() || partial.exists() || parts.exists());
        assertTrue("a saved copy stays", saved.isFile());
        assertTrue("another download stays", other.isFile());
        assertEquals("a second sweep finds nothing", 0, CacheClear.sweep(files, telegram, publicStorage));
    }
}
