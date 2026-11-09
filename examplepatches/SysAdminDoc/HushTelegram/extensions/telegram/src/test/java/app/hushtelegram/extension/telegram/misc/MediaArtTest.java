/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;

/** Save video cover and Save album art (#53): which picture is chosen, when it is fetched, what gets written and what is said. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {MediaArtTest.Menu.class, MediaArtTest.Tools.class},
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class MediaArtTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder temp = new TemporaryFolder();

    private static final byte[] JPEG = {(byte) 0xff, (byte) 0xd8, (byte) 0xff, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
    private static final byte[] PNG = {(byte) 0x89, 'P', 'N', 'G', 13, 10, 26, 10, 0, 0, 0, 0, 0, 0};

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Menu {
        static File downloaded;

        @Implementation protected static int photoSize(Object size) { return (Integer) size; }
        @Implementation protected static int id(Object message) { return 42; }
        @Implementation protected static File downloaded(Object message) { return downloaded; }
    }

    @Implements(value = MessageMenuTools.class, isInAndroidSdk = false)
    public static class Tools {
        static ArrayList<Object> cover;
        static ArrayList<Object> thumb;
        static final Map<Object, File> files = new HashMap<>();
        static final ArrayList<String> loads = new ArrayList<>();
        static boolean loadMakesFile;
        static File fileOnLoad;

        @Implementation protected static ArrayList<?> thumbs(Object message, int cover) { return cover == 1 ? Tools.cover : thumb; }
        @Implementation protected static File thumbFile(Object message, Object size, int force) { return force == 0 ? files.get(size) : null; }
        @Implementation protected static void thumbLoad(Object message, Object size, int cover) {
            loads.add(size + ":" + cover);
            if (loadMakesFile) files.put(size, fileOnLoad);
        }
    }

    private Context context;
    private final ArrayList<String> written = new ArrayList<>();
    private byte[] lastData;

    @Before public void setUp() {
        restore();
        context = Robolectric.buildActivity(Activity.class).setup().get();
        MediaArt.work = Runnable::run;
        MediaArt.waitMillis = 0;
        MediaArt.stepMillis = 1;
        MediaArt.sink = (c, data, name, mime) -> {
            written.add(name + " " + mime);
            lastData = data;
            return true;
        };
    }

    @After public void restore() {
        Menu.downloaded = null;
        Tools.cover = null;
        Tools.thumb = null;
        Tools.files.clear();
        Tools.loads.clear();
        Tools.loadMakesFile = false;
        Settings.MESSAGE_MENU_SAVE_COVER.resetToDefault();
        Settings.MESSAGE_MENU_SAVE_ART.resetToDefault();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_SAVE_COVER);
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_SAVE_ART);
        HookStatus.clear();
        ShadowToast.reset();
    }

    private File file(String name, byte[] data) throws IOException {
        File file = temp.newFile(name);
        Files.write(file.toPath(), data);
        return file;
    }

    private static ArrayList<Object> sizes(Object... each) {
        return new ArrayList<>(Arrays.asList(each));
    }

    @Test public void theSwitchesStartOff() {
        assertFalse(Settings.MESSAGE_MENU_SAVE_COVER.get());
        assertFalse(Settings.MESSAGE_MENU_SAVE_ART.get());
        assertFalse(Settings.MESSAGE_MENU_CLEAR_CACHE.get());
    }

    @Test public void theBiggestSizeWinsAndPreviewsWithoutBytesNeverDo() {
        assertEquals(300, MediaArt.largest(sizes(100, 300, 200, 0)));
        assertNull(MediaArt.largest(sizes(0, 0)));
        assertNull(MediaArt.largest(null));
    }

    @Test public void aCoverIsPreferredToAThumbnail() {
        Tools.cover = sizes(50);
        Tools.thumb = sizes(900);
        MediaArt.Pick pick = MediaArt.videoPick(new Object());
        assertTrue(pick.cover);
        assertEquals(50, pick.size);
        Tools.cover = null;
        pick = MediaArt.videoPick(new Object());
        assertFalse(pick.cover);
        assertEquals(900, pick.size);
        Tools.thumb = null;
        assertNull(MediaArt.videoPick(new Object()));
        assertFalse(MediaArt.hasVideoArt(new Object()));
    }

    @Test public void aCachedCoverIsSavedWithoutFetching() throws IOException {
        Tools.cover = sizes(50);
        Tools.files.put(50, file("c.jpg", JPEG));
        MediaArt.saveVideo(context, new Object());
        assertEquals(Arrays.asList("video_42_cover.jpg image/jpeg"), written);
        assertArrayEquals(JPEG, lastData);
        assertTrue(Tools.loads.isEmpty());
        assertEquals("Cover saved to Pictures", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aMissingThumbnailIsFetchedThenSaved() throws IOException {
        Tools.thumb = sizes(700);
        Tools.loadMakesFile = true;
        Tools.fileOnLoad = file("t.png", PNG);
        MediaArt.saveVideo(context, new Object());
        assertEquals(Arrays.asList("700:0"), Tools.loads);
        assertEquals(Arrays.asList("video_42_thumb.png image/png"), written);
    }

    @Test public void aPictureThatNeverArrivesIsToastedNotDropped() {
        Tools.cover = sizes(50);
        MediaArt.saveVideo(context, new Object());
        assertEquals(Arrays.asList("50:1"), Tools.loads);
        assertTrue(written.isEmpty());
        assertEquals("Cover isn't available yet", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aVideoWithNoPictureSaysSo() {
        MediaArt.saveVideo(context, new Object());
        assertEquals("No cover to save", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aWriteThatFailsIsToasted() throws IOException {
        Tools.cover = sizes(50);
        Tools.files.put(50, file("c.jpg", JPEG));
        MediaArt.sink = (c, data, name, mime) -> false;
        MediaArt.saveVideo(context, new Object());
        assertEquals("Couldn't save the picture", ShadowToast.getTextOfLatestToast());
    }

    @Test public void serverAlbumArtIsSavedWhenTheFileHasNone() throws IOException {
        Tools.thumb = sizes(120);
        Tools.files.put(120, file("a.jpg", JPEG));
        MediaArt.saveMusic(context, new Object());
        assertEquals(Arrays.asList("album_art_42.jpg image/jpeg"), written);
        assertEquals("Album art saved to Pictures", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aSongWithNoArtSaysSo() {
        MediaArt.saveMusic(context, new Object());
        assertEquals("No album art to save", ShadowToast.getTextOfLatestToast());
        assertFalse(MediaArt.hasMusicArt(new Object()));
    }

    @Test public void serverArtThatIsNotCachedIsToasted() {
        Tools.thumb = sizes(120);
        assertTrue(MediaArt.hasMusicArt(new Object()));
        MediaArt.saveMusic(context, new Object());
        assertEquals("Album art isn't available yet", ShadowToast.getTextOfLatestToast());
    }

    @Test public void formatsAreToldApartByTheirFirstBytes() {
        assertEquals("image/png", MediaArt.mime(PNG));
        assertEquals("image/jpeg", MediaArt.mime(JPEG));
        byte[] webp = {'R', 'I', 'F', 'F', 0, 0, 0, 0, 'W', 'E', 'B', 'P', 0, 0};
        assertEquals("image/webp", MediaArt.mime(webp));
        assertEquals(".png", MediaArt.extension("image/png"));
        assertEquals(".webp", MediaArt.extension("image/webp"));
        assertEquals(".jpg", MediaArt.extension("image/jpeg"));
    }
}
