/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Supplier;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Files Telegram already has show as downloaded in an account with no record of them (#79). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class KnownFilesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();

    /** A document or photo size: the name Telegram files it under (null for a photo) and its size. */
    private static final class Attach {
        final String name;
        final long size;

        Attach(String name, long size) {
            this.name = name;
            this.size = size;
        }
    }

    private final KnownFiles.Telegram fake = new KnownFiles.Telegram() {
        @Override public String documentName(Object attach) {
            return ((Attach) attach).name;
        }

        @Override public long size(Object attach) {
            return ((Attach) attach).size;
        }
    };

    private KnownFiles.Telegram savedTelegram;
    private Supplier<File[]> savedMedia;
    private File root;
    private File media;

    @Before public void setUp() throws IOException {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.KNOWN_FILES.resetToDefault();
        StorageFolder.moved = null;
        savedTelegram = KnownFiles.telegram;
        savedMedia = KnownFiles.mediaFolders;
        KnownFiles.telegram = fake;
        root = temporary.newFolder("Telegram");
        media = temporary.newFolder("media");
        File[] folders = {media};
        KnownFiles.mediaFolders = () -> folders;
    }

    @After public void restore() {
        KnownFiles.telegram = savedTelegram;
        KnownFiles.mediaFolders = savedMedia;
        StorageFolder.moved = null;
        Settings.KNOWN_FILES.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    private static File write(File folder, String name, int size) throws IOException {
        File file = new File(folder, name);
        file.getParentFile().mkdirs();
        Files.write(file.toPath(), new byte[size]);
        return file;
    }

    /** Where getPathToAttach puts a document under the downloader's own name for it. */
    private File documentPath() {
        return new File(new File(root, KnownFiles.DOCUMENTS), "5_123456789.pdf");
    }

    @Test public void offByDefaultEverythingComesBackAsItCame() throws IOException {
        assertFalse(Settings.KNOWN_FILES.defaultValue);
        write(new File(root, KnownFiles.FILES), "report.pdf", 7);
        File path = documentPath();
        assertSame(path, KnownFiles.knownFile(new Attach("report.pdf", 7), path));
        assertSame(null, KnownFiles.knownFile(new Attach("report.pdf", 7), null));
    }

    @Test public void aNamedFileOfTheSameSizeInTelegramFilesCounts() throws IOException {
        Settings.KNOWN_FILES.save(true);
        File kept = write(new File(root, KnownFiles.FILES), "report.pdf", 7);
        assertEquals(kept, KnownFiles.knownFile(new Attach("report.pdf", 7), documentPath()));
        assertTrue(String.join("\n", HookStatus.report()).contains("known file"));
        // The same name at another size is a different file.
        assertEquals(documentPath(), KnownFiles.knownFile(new Attach("report.pdf", 8), documentPath()));
        assertEquals(documentPath(), KnownFiles.knownFile(new Attach("other.pdf", 7), documentPath()));
    }

    @Test public void telegramsNumberedCopiesAreFollowedUpToTheFirstGap() throws IOException {
        Settings.KNOWN_FILES.save(true);
        File files = new File(root, KnownFiles.FILES);
        write(files, "report.pdf", 3);
        File second = write(files, "report (1).pdf", 7);
        write(files, "report (3).pdf", 9);
        assertEquals(second, KnownFiles.knownFile(new Attach("report.pdf", 7), documentPath()));
        // (2) isn't there, so Telegram never got to (3) for this file.
        assertEquals(documentPath(), KnownFiles.knownFile(new Attach("report.pdf", 9), documentPath()));
        // A name without an extension gets its number at the end.
        File plain = write(files, "notes (1)", 4);
        write(files, "notes", 2);
        assertEquals(plain, KnownFiles.knownFile(new Attach("notes", 4), documentPath()));
        // A first copy that's gone still leads to the numbered ones.
        new File(files, "report.pdf").delete();
        assertEquals(second, KnownFiles.knownFile(new Attach("report.pdf", 7), documentPath()));
    }

    @Test public void aFileThatIsAlreadyThereIsLeftAlone() throws IOException {
        Settings.KNOWN_FILES.save(true);
        write(new File(root, KnownFiles.FILES), "report.pdf", 7);
        File own = write(new File(root, KnownFiles.DOCUMENTS), "5_123456789.pdf", 7);
        assertSame(own, KnownFiles.knownFile(new Attach("report.pdf", 7), own));
    }

    @Test public void foldersTelegramsOwnMovedFromAreLookedIn() throws IOException {
        Settings.KNOWN_FILES.save(true);
        File earlier = temporary.newFolder("earlier");
        File kept = write(new File(earlier, KnownFiles.FILES), "report.pdf", 7);
        assertEquals(documentPath(), KnownFiles.knownFile(new Attach("report.pdf", 7), documentPath()));
        StorageFolder.moved = new File[] {root, null, earlier, earlier};
        assertEquals(kept, KnownFiles.knownFile(new Attach("report.pdf", 7), documentPath()));
        assertEquals(2, KnownFiles.roots(root).size());
    }

    @Test public void photosAndVideosAreFoundInAndroidMediaByTheirOwnName() throws IOException {
        Settings.KNOWN_FILES.save(true);
        File video = write(new File(new File(media, KnownFiles.TELEGRAM), KnownFiles.VIDEO), "5_42.mp4", 11);
        File photo = write(new File(new File(media, KnownFiles.TELEGRAM), KnownFiles.IMAGES), "7_43.jpg", 5);
        File videoPath = new File(new File(root, KnownFiles.VIDEO), "5_42.mp4");
        File photoPath = new File(new File(root, KnownFiles.IMAGES), "7_43.jpg");
        assertEquals(video, KnownFiles.knownFile(new Attach(null, 11), videoPath));
        assertEquals(photo, KnownFiles.knownFile(new Attach(null, 5), photoPath));
        assertEquals(videoPath, KnownFiles.knownFile(new Attach(null, 12), videoPath));
        // A photo's name in the video folder isn't the same file.
        assertEquals(new File(new File(root, KnownFiles.VIDEO), "7_43.jpg"),
                KnownFiles.knownFile(new Attach(null, 5), new File(new File(root, KnownFiles.VIDEO), "7_43.jpg")));
    }

    @Test public void otherFoldersAndFilesWithoutASizeComeBackAsTheyCame() throws IOException {
        Settings.KNOWN_FILES.save(true);
        write(new File(root, KnownFiles.FILES), "song.mp3", 7);
        File audio = new File(new File(root, "Telegram Audio"), "song.mp3");
        assertEquals(audio, KnownFiles.knownFile(new Attach("song.mp3", 7), audio));
        write(new File(root, KnownFiles.FILES), "empty.pdf", 0);
        assertEquals(documentPath(), KnownFiles.knownFile(new Attach("empty.pdf", 0), documentPath()));
        assertEquals(documentPath(), KnownFiles.knownFile(new Attach(null, 7), documentPath()));
        assertEquals(documentPath(), KnownFiles.knownFile(new Attach("", 7), documentPath()));
    }

    @Test public void aFailureLeavesTheFileAsItCame() {
        Settings.KNOWN_FILES.save(true);
        Map<String, Integer> calls = new HashMap<>();
        KnownFiles.telegram = new KnownFiles.Telegram() {
            @Override public String documentName(Object attach) {
                calls.merge("name", 1, Integer::sum);
                throw new IllegalStateException("changed");
            }

            @Override public long size(Object attach) {
                return 7;
            }
        };
        assertEquals(documentPath(), KnownFiles.knownFile(new Object(), documentPath()));
        assertEquals(Integer.valueOf(1), calls.get("name"));
        assertTrue(String.join("\n", HookStatus.missing()).contains("'known file' hook (it threw java.lang.IllegalStateException)"));
    }
}
