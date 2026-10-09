/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.net.Uri;
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
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Download any photo: the menu's answer, the image a save takes (the CDN's copy at the most it
 * serves, when Facebook's modifier gives one, else the largest copy), and who saves on a tap.
 */
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
    /** An imageHigh address that names the most the CDN serves (cstp) and the size it asks for (ctp). */
    private static final String HIGH = "https://scontent-iad3-1.xx.fbcdn.net/v/t39.30808-6/"
            + "475148478_1134540631592283_1316146539584337463_n.jpg?stp=dst-jpg_s1080x2048_tt6&_nc_cat=1"
            + "&cstp=mx1536x2048&ctp=s1080x1440&oh=00_AYD&oe=66F0A1B2";

    /** The modifier's answer for [address] asked to fit [width] x [height]: its ctp rewritten to that. */
    private static Uri asking(Uri address, int width, int height) {
        return Uri.parse(address.toString().replace("ctp=s1080x1440", "ctp=s" + width + "x" + height));
    }

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
        // These cases run at sdk 30 but stand for a phone that reads AVIF, where the CDN's copy is
        // asked for; the case below covers Android 11's largest copy.
        PhotoFormat.readsAvifForTests = true;
        HookStatus.clear();
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
        PhotoSave.resizerForTests = null;
        PhotoFormat.readsAvifForTests = null;
        HookStatus.clear();
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

    /** Facebook's own save asks its modifier for a bigger copy; ours asks it for the most the CDN serves. */
    @Test
    public void theSaveAsksFacebooksModifierForTheMostTheCdnServes() {
        int[] asked = new int[2];
        PhotoSave.resizerForTests = (address, width, height) -> {
            asked[0] = width;
            asked[1] = height;
            return asking(address, width, height);
        };
        TreeJNI photo = photo().with("imageHigh", image(HIGH, 1080, 1440)).with("image", image(MEDIUM, 960, 720));
        assertEquals(HIGH.replace("ctp=s1080x1440", "ctp=s1536x2048"), PhotoSave.saveAddress(photo));
        assertArrayEquals("asked for the cstp's most", new int[] {1536, 2048}, asked);
        assertTrue(HookStatus.report().toString(), HookStatus.report().toString().contains(PhotoSave.FULL_SIZE + " 1"));

        TreeJNI unsized = photo().with("imageHigh", new TreeJNI().with("uri", HIGH));
        assertEquals("with no sizes to compare, the CDN's copy goes",
                HIGH.replace("ctp=s1080x1440", "ctp=s1536x2048"), PhotoSave.saveAddress(unsized));
    }

    /** The CDN sends its bigger copies as AVIF, and Android 11 reads none, so the largest copy goes. */
    @Test
    public void anAndroidThatReadsNoAvifKeepsTheLargestCopy() {
        int[] calls = new int[1];
        PhotoSave.resizerForTests = (address, width, height) -> {
            calls[0]++;
            return asking(address, width, height);
        };
        PhotoFormat.readsAvifForTests = false;
        TreeJNI photo = photo().with("imageHigh", image(HIGH, 1080, 1440)).with("image", image(MEDIUM, 960, 720));
        assertEquals(HIGH, PhotoSave.saveAddress(photo));
        assertEquals("the modifier isn't asked", 0, calls[0]);
        assertFalse(HookStatus.report().toString().contains(PhotoSave.FULL_SIZE));

        PhotoFormat.readsAvifForTests = null;
        assertFalse("sdk 30 is Android 11, which reads no AVIF", PhotoFormat.readsAvif());
        assertEquals(HIGH, PhotoSave.saveAddress(photo));
    }

    @Test
    public void theLargestCopyGoesWhenTheModifierGivesNoMore() {
        TreeJNI photo = photo().with("imageHigh", image(HIGH, 1080, 1440)).with("image", image(MEDIUM, 960, 720));
        assertEquals("unpatched, the stub answers nothing", HIGH, PhotoSave.saveAddress(photo));

        PhotoSave.resizerForTests = (address, width, height) -> address;
        assertEquals("the modifier changed nothing", HIGH, PhotoSave.saveAddress(photo));
        PhotoSave.resizerForTests = (address, width, height) -> null;
        assertEquals("the modifier answered nothing", HIGH, PhotoSave.saveAddress(photo));
        PhotoSave.resizerForTests = (address, width, height) -> {
            throw new IllegalStateException("no modifier");
        };
        assertEquals("the modifier threw", HIGH, PhotoSave.saveAddress(photo));

        PhotoSave.resizerForTests = (address, width, height) -> asking(address, 720, 960);
        TreeJNI bigCopy = photo().with("imageHigh", image(HIGH, 1080, 1440)).with("image", image(FULL, 2048, 1536));
        assertEquals("a copy the model holds asks for more", FULL, PhotoSave.saveAddress(bigCopy));

        int[] calls = new int[1];
        PhotoSave.resizerForTests = (address, width, height) -> {
            calls[0]++;
            return asking(address, width, height);
        };
        assertEquals("an imageHigh address naming no most isn't handed over", FULL,
                PhotoSave.saveAddress(photo().with("imageHigh", image(FULL, 2048, 1536))));
        assertEquals(MEDIUM, PhotoSave.saveAddress(photo().with("image", image(MEDIUM, 960, 720))));
        assertEquals(0, calls[0]);
        assertNull(PhotoSave.saveAddress(photo()));
        assertNull(PhotoSave.saveAddress(photo().with("imageHigh", image(HIGH, 1080, 1440)).releasedTree()));
        assertNull(PhotoSave.saveAddress(null));
        assertFalse("nothing counted as the CDN's copy", HookStatus.report().toString().contains(PhotoSave.FULL_SIZE));
    }

    @Test
    public void theSizeAnAddressAsksForIsReadFromItsCtp() {
        assertEquals(1080L * 1440, PhotoSave.askedArea(HIGH));
        assertEquals(1536L * 2048, PhotoSave.askedArea(HIGH.replace("ctp=s1080x1440", "ctp=p1536x2048_q75")));
        assertEquals("no ctp", 0, PhotoSave.askedArea(FULL));
        assertEquals(0, PhotoSave.askedArea(HIGH.replace("ctp=s1080x1440", "ctp=q75")));
        assertEquals(0, PhotoSave.askedArea("mailto:someone@example.com"));
        assertEquals("not a CDN address", null, PhotoSave.resized("https://example.com/a.jpg"));
        assertNull(PhotoSave.resized(null));
        assertNull(PhotoSave.resized(""));
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
