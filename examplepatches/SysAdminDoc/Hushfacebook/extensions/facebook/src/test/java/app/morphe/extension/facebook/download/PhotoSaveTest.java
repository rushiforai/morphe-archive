/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.view.MenuItem;

import com.facebook.graphservice.tree.TreeJNI;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/** Download any photo: the menu's answer, the image a save takes, and who saves on a tap. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PhotoSaveTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A full-size photo on Meta's CDN. Its size marker is the one the video ranking reads as a thumbnail's. */
    private static final String FULL = "https://scontent-iad3-1.xx.fbcdn.net/v/t39.30808-6/"
            + "475148478_1134540631592283_1316146539584337463_n.jpg?stp=dst-jpg_s2048x2048_tt6&_nc_cat=1&oh=00_AYA&oe=66F0A1B2";
    private static final String MEDIUM = "https://scontent-iad3-1.xx.fbcdn.net/v/t39.30808-6/"
            + "475148478_1134540631592283_1316146539584337463_n.jpg?stp=dst-jpg_s960x960_tt6&_nc_cat=1&oh=00_AYB&oe=66F0A1B2";
    private static final String SMALL = "https://scontent-iad3-1.xx.fbcdn.net/v/t39.30808-6/"
            + "475148478_1134540631592283_1316146539584337463_n.jpg?stp=dst-jpg_s320x320_tt6&_nc_cat=1&oh=00_AYC&oe=66F0A1B2";

    private final List<PostDetails> saved = new ArrayList<>();
    private int facebooksTaps;
    private final MenuItem.OnMenuItemClickListener facebooks = item -> {
        facebooksTaps++;
        return true;
    };

    @Before
    public void setUp() {
        // Every Meta name answers a private address, so a save that starts is refused before a
        // socket opens.
        MediaDownload.policyForTests = new MediaUrlPolicy(host -> new InetAddress[] { InetAddress.getByName("10.9.8.7") });
        MediaDownload.detailsForTests = saved::add;
    }

    @After
    public void tearDown() throws InterruptedException {
        long deadline = System.nanoTime() + 20_000_000_000L;
        while (MediaDownload.savesInFlight() > 0) {
            assertTrue("a save never finished", System.nanoTime() < deadline);
            Thread.sleep(10);
        }
        MediaDownload.policyForTests = null;
        MediaDownload.detailsForTests = null;
        PauseForTests.resume();
        Settings.DOWNLOAD_PHOTOS.resetToDefault();
    }

    private static TreeJNI image(String uri, int width, int height) {
        return new TreeJNI().with("uri", uri).number("width", width).number("height", height);
    }

    private static TreeJNI photo() {
        return new TreeJNI("Photo");
    }

    @Test
    public void theMenuOffersSaveWhenFacebookDoesOrTheSwitchIsOn() {
        assertTrue("the switch starts on", Settings.DOWNLOAD_PHOTOS.get());
        assertTrue(PhotoSave.offersSave(true));
        assertTrue(PhotoSave.offersSave(false));
        Settings.DOWNLOAD_PHOTOS.save(false);
        assertTrue("the poster's yes stands", PhotoSave.offersSave(true));
        assertFalse(PhotoSave.offersSave(false));
        Settings.DOWNLOAD_PHOTOS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse("paused, Facebook decides", PhotoSave.offersSave(false));
    }

    @Test
    public void theSaveTakesTheBiggestImageItsSizesShow() {
        TreeJNI photo = photo().with("imageLow", image(SMALL, 320, 240)).with("image", image(MEDIUM, 960, 720))
                .with("imageHigh", image(FULL, 2048, 1536));
        assertEquals(FULL, PhotoSave.largest(photo));

        TreeJNI bigger = photo().with("imageHigh", image(MEDIUM, 960, 720)).with("image", image(FULL, 2048, 1536));
        assertEquals("whichever field holds it", FULL, PhotoSave.largest(bigger));

        TreeJNI unsized = photo().with("image", new TreeJNI().with("uri", MEDIUM)).with("imageHigh", new TreeJNI().with("uri", FULL));
        assertEquals("without sizes, imageHigh, the one Facebook's own save takes", FULL, PhotoSave.largest(unsized));

        TreeJNI oneSized = photo().with("imageHigh", new TreeJNI().with("uri", FULL)).with("imageLow", image(SMALL, 320, 240));
        assertEquals("a size beats none", SMALL, PhotoSave.largest(oneSized));
        assertEquals("imageHigh unsized, image none, imageMedium none, imageLow 320x240", PhotoSave.sizes(oneSized));

        assertEquals("an image without an address is passed over", MEDIUM, PhotoSave.largest(
                photo().with("imageHigh", new TreeJNI().number("width", 4000).number("height", 3000))
                        .with("imageMedium", image(MEDIUM, 960, 720))));
        assertNull(PhotoSave.largest(photo()));
        assertNull(PhotoSave.largest(photo().with("imageHigh", image(FULL, 2048, 1536)).releasedTree()));
        assertNull(PhotoSave.largest(new Object()));
        assertNull(PhotoSave.largest(null));
    }

    @Test
    public void aTapSavesThroughHushfacebookAndFacebooksRunsOnlyWhenOursCant() {
        TreeJNI photo = photo().with("imageHigh", image(FULL, 2048, 1536));
        MenuItem.OnMenuItemClickListener action = PhotoSave.saveAction(facebooks, photo);
        assertTrue(action.onMenuItemClick(null));
        assertEquals("ours started, so Facebook's didn't run", 0, facebooksTaps);
        assertEquals("one save went to the downloader", 1, saved.size());

        Settings.DOWNLOAD_PHOTOS.save(false);
        assertTrue(action.onMenuItemClick(null));
        assertEquals("off, Facebook's saves", 1, facebooksTaps);
        Settings.DOWNLOAD_PHOTOS.save(true);

        assertTrue(PhotoSave.saveAction(facebooks, photo()).onMenuItemClick(null));
        assertEquals("no image to take, Facebook's saves", 2, facebooksTaps);

        TreeJNI elsewhere = photo().with("imageHigh", image("https://example.com/a.jpg", 2048, 1536));
        assertTrue(PhotoSave.saveAction(facebooks, elsewhere).onMenuItemClick(null));
        assertEquals("an image off Meta's servers isn't fetched, Facebook's saves", 3, facebooksTaps);
        assertEquals(1, saved.size());
    }

    @Test
    public void theWrapKeepsFacebooksListenerReachable() {
        MenuItem.OnMenuItemClickListener action = PhotoSave.saveAction(facebooks, null);
        assertTrue(action instanceof PhotoSave.Action);
        assertSame(facebooks, ((PhotoSave.Action) action).facebooks);
        assertFalse("no listener of Facebook's and nothing to save takes no tap",
                PhotoSave.saveAction(null, null).onMenuItemClick(null));
    }
}
