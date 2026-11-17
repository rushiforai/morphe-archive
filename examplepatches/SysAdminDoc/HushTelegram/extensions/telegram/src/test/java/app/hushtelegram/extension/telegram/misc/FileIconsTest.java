/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.RectF;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.io.File;
import java.io.FileOutputStream;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.misc.FileIconsForTests.ChatView;
import app.hushtelegram.extension.telegram.misc.FileIconsForTests.Circle;
import app.hushtelegram.extension.telegram.misc.FileIconsForTests.Doc;
import app.hushtelegram.extension.telegram.misc.FileIconsForTests.Msg;
import app.hushtelegram.extension.telegram.misc.FileIconsForTests.SharedCellView;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * File icons and thumbnails (#79): an APK or EXE sent as a file gets its own glyph in a chat and in
 * Shared media, a downloaded PDF or video a picture made off the main thread, and everything else,
 * a file with a server thumbnail, one not downloaded yet, the switch off or a pause, keeps
 * Telegram's own icon.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class FileIconsTest {
    private static final int SIDE = 100;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    /** What the stand-in maker was asked for, and the picture it hands back. */
    private final List<FileIcons.Kind> asked = Collections.synchronizedList(new ArrayList<>());
    private final List<Integer> sizes = Collections.synchronizedList(new ArrayList<>());
    private volatile Bitmap made;

    @Before
    public void reset() throws Exception {
        restore();
        made = solid(Color.RED);
        FileIcons.maker = (kind, file, size) -> {
            asked.add(kind);
            sizes.add(size);
            return made;
        };
        Settings.FILE_ICONS.save(true);
    }

    @After
    public void restore() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        shadowOf(Looper.getMainLooper()).idle();
        FileIcons.forgetForTests();
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.FILE_ICONS);
        Settings.FILE_ICONS.resetToDefault();
        HookStatus.clear();
    }

    // ---- What a file is ----------------------------------------------------------------------

    @Test
    public void aFileIsKnownByItsNameFirstThenItsType() {
        assertEquals(FileIcons.Kind.APK, FileIcons.kind("Hush.apk", null));
        assertEquals(FileIcons.Kind.EXE, FileIcons.kind("Setup.EXE", null));
        assertEquals(FileIcons.Kind.PDF, FileIcons.kind(" manual.pdf ", "application/octet-stream"));
        assertEquals(FileIcons.Kind.VIDEO, FileIcons.kind("clip.MKV", null));
        assertEquals(FileIcons.Kind.VIDEO, FileIcons.kind("clip.webm", null));
        assertEquals("the name wins over the type", FileIcons.Kind.APK, FileIcons.kind("app.apk", "application/pdf"));
        assertEquals(FileIcons.Kind.APK, FileIcons.kind(null, "application/vnd.android.package-archive"));
        assertEquals(FileIcons.Kind.EXE, FileIcons.kind("download", "application/x-msdownload"));
        assertEquals(FileIcons.Kind.PDF, FileIcons.kind("scan", "application/pdf"));
        assertEquals(FileIcons.Kind.VIDEO, FileIcons.kind("recording.bin", "video/mp4"));
        assertNull(FileIcons.kind("photo.jpg", "image/jpeg"));
        assertNull(FileIcons.kind("notes.txt", "text/plain"));
        assertNull(FileIcons.kind(null, null));
    }

    @Test
    public void aPictureIsKeptByTheFileAndItsSizeAtMostMaxSize() {
        Msg sending = new Msg(null, "/sdcard/Download/x.pdf", null);
        assertEquals("d7|512", FileIcons.key(new Doc(7, false, "x.pdf", null), sending, 1000));
        assertEquals("a file being sent has no id yet", "/sdcard/Download/x.pdf|40",
                FileIcons.key(new Doc(0, false, "x.pdf", null), sending, 40));
        assertNull(FileIcons.key(new Doc(0, false, "x.pdf", null), new Msg(null, null, null), 40));
    }

    @Test
    public void theFileIsTheOneItWasSentFromThenTheDownload() throws Exception {
        File sent = file("sent.pdf");
        File downloaded = file("downloaded.pdf");
        File empty = folder.newFile("empty.pdf");
        assertEquals(sent, FileIcons.file(new Msg(null, sent.getPath(), downloaded)));
        assertEquals(downloaded, FileIcons.file(new Msg(null, empty.getPath(), downloaded)));
        assertEquals(downloaded, FileIcons.file(new Msg(null, null, downloaded)));
        assertNull("an empty download isn't there yet", FileIcons.file(new Msg(null, null, empty)));
        assertNull(FileIcons.file(new Msg(null, new File(folder.getRoot(), "gone.pdf").getPath(), null)));
    }

    // ---- Shared media > Files ----------------------------------------------------------------

    @Test
    public void anApkOrExeInSharedMediaGetsItsGlyphAndLosesTheExtensionLabel() {
        for (String name : new String[]{"app.apk", "setup.exe"}) {
            SharedCellView cell = shared(new Doc(3, false, name, null), null, null);
            FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
            assertTrue(name, cell.icon.getDrawable() instanceof FileIcons.Glyph);
            FileIcons.Glyph glyph = (FileIcons.Glyph) cell.icon.getDrawable();
            assertEquals(name, name.endsWith(".apk") ? FileIcons.Kind.APK : FileIcons.Kind.EXE, glyph.kind);
            assertFalse("Shared media's is a rounded square", glyph.round);
            assertTrue("Telegram's icon wasn't set", cell.icon.resources.isEmpty());
            assertEquals("its extension isn't drawn over it", View.INVISIBLE, cell.label.getVisibility());
        }
        assertTrue("nothing is made for a glyph", asked.isEmpty());
    }

    @Test
    public void everythingElseInSharedMediaKeepsTelegramsIcon() throws Exception {
        List<SharedCellView> cells = new ArrayList<>();
        cells.add(shared(new Doc(4, true, "app.apk", null), null, file("app.apk")));
        cells.add(shared(new Doc(4, true, "manual.pdf", null), null, file("manual.pdf")));
        cells.add(shared(new Doc(4, false, "notes.txt", null), null, file("notes.txt")));
        cells.add(new SharedCellView(context(), new Msg(null, null, null)));
        cells.add(new SharedCellView(context(), "a cell this build doesn't know"));
        for (SharedCellView cell : cells) stock(cell);

        // An icon in anything but Telegram's file cell is never touched.
        FrameLayout elsewhere = new FrameLayout(context());
        FileIconsForTests.IconView icon = new FileIconsForTests.IconView(context());
        elsewhere.addView(icon);
        FileIcons.sharedIcon(icon, FileIconsForTests.STOCK_ICON);
        assertEquals(Collections.singletonList(FileIconsForTests.STOCK_ICON), icon.resources);
        drain();
        assertTrue("nothing was made", asked.isEmpty());
    }

    @Test
    public void switchedOffOrPausedSharedMediaKeepsTelegramsIcon() {
        Settings.FILE_ICONS.save(false);
        stock(shared(new Doc(5, false, "app.apk", null), null, null));
        Settings.FILE_ICONS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        stock(shared(new Doc(5, false, "app.apk", null), null, null));
    }

    @Test
    public void aDownloadedPdfShowsItsPictureOnceItIsMadeOffTheMainThread() throws Exception {
        SharedCellView cell = shared(new Doc(6, false, "manual.pdf", null), null, file("manual.pdf"));
        FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
        assertEquals("Telegram's icon shows while it's made",
                Collections.singletonList(FileIconsForTests.STOCK_ICON), cell.icon.resources);
        assertEquals(View.VISIBLE, cell.label.getVisibility());

        drain();
        assertEquals(Collections.singletonList(FileIcons.Kind.PDF), asked);
        assertEquals("at the icon's size", Collections.singletonList(120), sizes);
        assertTrue(cell.icon.getDrawable() instanceof FileIcons.Picture);
        assertSame(made, ((FileIcons.Picture) cell.icon.getDrawable()).bitmap());
        assertEquals(View.INVISIBLE, cell.label.getVisibility());

        // Bound again, the cell shows the kept picture at once and nothing is made twice.
        cell.label.setVisibility(View.VISIBLE);
        FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
        assertTrue(cell.icon.getDrawable() instanceof FileIcons.Picture);
        assertEquals(1, cell.icon.resources.size());
        assertEquals(View.INVISIBLE, cell.label.getVisibility());
        drain();
        assertEquals(1, asked.size());
    }

    @Test
    public void aDownloadedVideoShowsAFrame() throws Exception {
        SharedCellView cell = shared(new Doc(8, false, "clip.mp4", "video/mp4"), null, file("clip.mp4"));
        FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
        drain();
        assertEquals(Collections.singletonList(FileIcons.Kind.VIDEO), asked);
        assertTrue(cell.icon.getDrawable() instanceof FileIcons.Picture);
    }

    @Test
    public void aCellThatMovedOnToAnotherFileDoesntGetTheOldPicture() throws Exception {
        SharedCellView cell = shared(new Doc(9, false, "manual.pdf", null), null, file("manual.pdf"));
        FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
        cell.message = new Msg(new Doc(10, false, "notes.txt", null), null, null);
        drain();
        assertEquals(1, asked.size());
        assertFalse(cell.icon.getDrawable() instanceof FileIcons.Picture);
        assertEquals(View.VISIBLE, cell.label.getVisibility());
    }

    @Test
    public void aFileThatCantBeMadeIntoAPictureIsntTriedAgain() throws Exception {
        made = null;
        SharedCellView cell = shared(new Doc(11, false, "broken.pdf", null), null, file("broken.pdf"));
        FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
        drain();
        FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
        drain();
        assertEquals(1, asked.size());
        assertEquals(2, cell.icon.resources.size());
        assertFalse(cell.icon.getDrawable() instanceof FileIcons.Picture);
    }

    @Test
    public void aFileNotDownloadedYetIsLookedForAgainAfterAWhile() throws Exception {
        File later = new File(folder.getRoot(), "later.pdf");
        Msg message = new Msg(new Doc(12, false, "later.pdf", null), null, later);
        SharedCellView cell = new SharedCellView(context(), message);
        FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
        drain();
        assertEquals(1, message.lookedFor.get());
        assertTrue("there was nothing to make", asked.isEmpty());

        FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
        drain();
        assertEquals("not looked for again straight away", 1, message.lookedFor.get());

        try (FileOutputStream out = new FileOutputStream(later)) {
            out.write(1);
        }
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(FileIcons.RETRY_MILLIS + 1));
        FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
        drain();
        assertEquals(2, message.lookedFor.get());
        assertEquals(Collections.singletonList(FileIcons.Kind.PDF), asked);
        assertTrue(cell.icon.getDrawable() instanceof FileIcons.Picture);
    }

    @Test
    public void aSharedMediaStubThatThrowsLeavesTelegramsIconAndIsReported() {
        Doc broken = new Doc(13, false, "app.apk", null) {
            @Override public String fileName() {
                throw new IllegalStateException("renamed");
            }
        };
        stock(shared(broken, null, null));
        assertTrue(String.valueOf(HookStatus.missing(FamilyNames.SAVE_DOWNLOADS)),
                String.valueOf(HookStatus.missing(FamilyNames.SAVE_DOWNLOADS)).contains("'file icon' hook"));
    }

    // ---- Chat bubbles ------------------------------------------------------------------------

    @Test
    public void aDownloadedApkOrExeInAChatGetsItsGlyphDrawnOverTheCircle() {
        Bitmap apk = bubble(new Doc(20, false, "app.apk", null), FileIcons.ICON_FILE, null);
        assertEquals(FileIcons.APK_COLOR, apk.getPixel(SIDE / 2, 6));
        assertEquals("the robot's head", Color.WHITE, apk.getPixel(SIDE / 2, 56));
        assertEquals("a round glyph leaves the corners alone", 0, apk.getPixel(2, 2));

        Bitmap exe = bubble(new Doc(21, false, "setup.exe", null), FileIcons.ICON_FILE, null);
        assertEquals("between the panes", FileIcons.EXE_COLOR, exe.getPixel(SIDE / 2, SIDE / 2));
        assertEquals("a pane", Color.WHITE, exe.getPixel(38, 38));
        assertEquals(Color.WHITE, exe.getPixel(62, 62));
        assertEquals(0, exe.getPixel(2, 2));
    }

    @Test
    public void aCircleThatShowsAnythingButADownloadedFileIsLeftAlone() throws Exception {
        // Telegram's download arrow, its cancel cross and its progress all show other icons.
        for (int icon : new int[]{-1, 0, 2, 3, 4}) {
            assertBlank(bubble(new Doc(22, false, "app.apk", null), icon, null));
        }
        assertBlank(bubble(new Doc(23, true, "app.apk", null), FileIcons.ICON_FILE, null));
        assertBlank(bubble(new Doc(24, false, "notes.txt", null), FileIcons.ICON_FILE, null));
        Settings.FILE_ICONS.save(false);
        assertBlank(bubble(new Doc(25, false, "app.apk", null), FileIcons.ICON_FILE, null));
        Settings.FILE_ICONS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertBlank(bubble(new Doc(26, false, "manual.pdf", null), FileIcons.ICON_FILE, file("manual.pdf")));
        PauseForTests.resume();

        // A circle the build doesn't know, and one in a cell that isn't a chat cell.
        Bitmap drawn = canvasBitmap();
        FileIcons.bubble("not a circle", new Canvas(drawn));
        FileIcons.bubble(new Circle(FileIcons.ICON_FILE, new View(context()), new RectF(0, 0, SIDE, SIDE)), new Canvas(drawn));
        assertBlank(drawn);
        drain();
        assertTrue(asked.isEmpty());
    }

    @Test
    public void aDownloadedPdfInAChatIsDrawnOnceItsPictureIsMade() throws Exception {
        Msg message = new Msg(new Doc(27, false, "manual.pdf", null), null, file("manual.pdf"));
        ChatView cell = new ChatView(context(), message);
        Circle circle = new Circle(FileIcons.ICON_FILE, cell, new RectF(0, 0, SIDE, SIDE));
        int before = cell.invalidated;
        Bitmap first = canvasBitmap();
        FileIcons.bubble(circle, new Canvas(first));
        assertBlank(first);
        assertEquals(before, cell.invalidated);

        drain();
        assertEquals(Collections.singletonList(FileIcons.Kind.PDF), asked);
        assertEquals(Collections.singletonList(SIDE), sizes);
        assertEquals("the cell is drawn again once it's there", before + 1, cell.invalidated);

        Bitmap second = canvasBitmap();
        FileIcons.bubble(circle, new Canvas(second));
        assertEquals(Color.RED, second.getPixel(SIDE / 2, SIDE / 2));
        drain();
        assertEquals(1, asked.size());
    }

    @Test
    public void aChatStubThatThrowsDrawsNothingAndIsReported() {
        Doc broken = new Doc(28, false, "app.apk", null) {
            @Override public boolean hasThumb() {
                throw new IllegalStateException("renamed");
            }
        };
        assertBlank(bubble(broken, FileIcons.ICON_FILE, null));
        assertTrue(String.valueOf(HookStatus.missing(FamilyNames.SAVE_DOWNLOADS)),
                String.valueOf(HookStatus.missing(FamilyNames.SAVE_DOWNLOADS)).contains("'file icon in a chat' hook"));
    }

    @Test
    public void theProbeOtherTestsUseSeesTheGlyph() {
        assertTrue(FileIconsForTests.on());
        Settings.FILE_ICONS.save(false);
        assertFalse(FileIconsForTests.on());
    }

    // ---- Helpers -----------------------------------------------------------------------------

    private static Context context() {
        return RuntimeEnvironment.getApplication();
    }

    private SharedCellView shared(Object document, String attachPath, File downloaded) {
        return new SharedCellView(context(), new Msg(document, attachPath, downloaded));
    }

    /** Binds [cell] and checks Telegram's icon and label were left as Telegram set them. */
    private static void stock(SharedCellView cell) {
        FileIcons.sharedIcon(cell.icon, FileIconsForTests.STOCK_ICON);
        assertEquals(Collections.singletonList(FileIconsForTests.STOCK_ICON), cell.icon.resources);
        assertFalse(cell.icon.getDrawable() instanceof FileIcons.Glyph);
        assertFalse(cell.icon.getDrawable() instanceof FileIcons.Picture);
        assertEquals(View.VISIBLE, cell.label.getVisibility());
    }

    /** What the hook draws over a chat circle showing [icon] for a message holding [document]. */
    private static Bitmap bubble(Object document, int icon, File downloaded) {
        ChatView cell = new ChatView(context(), new Msg(document, null, downloaded));
        Bitmap drawn = canvasBitmap();
        FileIcons.bubble(new Circle(icon, cell, new RectF(0, 0, SIDE, SIDE)), new Canvas(drawn));
        return drawn;
    }

    private static Bitmap canvasBitmap() {
        Bitmap bitmap = Bitmap.createBitmap(SIDE, SIDE, Bitmap.Config.ARGB_8888);
        bitmap.eraseColor(Color.TRANSPARENT);
        return bitmap;
    }

    private static Bitmap solid(int color) {
        Bitmap bitmap = Bitmap.createBitmap(8, 8, Bitmap.Config.ARGB_8888);
        bitmap.eraseColor(color);
        return bitmap;
    }

    private static void assertBlank(Bitmap drawn) {
        for (int y = 0; y < drawn.getHeight(); y += 7) {
            for (int x = 0; x < drawn.getWidth(); x += 7) {
                if (drawn.getPixel(x, y) != 0) throw new AssertionError("drew at " + x + "," + y);
            }
        }
    }

    private File file(String name) throws Exception {
        File file = new File(folder.getRoot(), name);
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(new byte[]{1, 2, 3});
        }
        return file;
    }

    /** Lets every worker finish, then runs what it handed back to the main thread. */
    private static void drain() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        shadowOf(Looper.getMainLooper()).idle();
    }
}
