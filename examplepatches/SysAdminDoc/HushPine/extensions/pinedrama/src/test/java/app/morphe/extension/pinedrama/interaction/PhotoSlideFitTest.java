package app.morphe.extension.pinedrama.interaction;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.View;

import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** When a photo slide is shown whole instead of cropped to cover its cell (#188). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class PhotoSlideFitTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** The 1076 by 1200 screen the square phones report, and a 9:16 phone. */
    private static final float SQUARE_W = 1076f, SQUARE_H = 1200f;
    private static final float PHONE_W = 1080f, PHONE_H = 1920f;
    /** A tall 9:16 slide, and a 3:4 one. */
    private static final float TALL = 9f / 16f, PORTRAIT = 3f / 4f;

    @Test
    public void aTallSlideOnASquareScreenIsFitted() {
        assertTrue(PhotoSlideFit.shouldFit(TALL, SQUARE_W, SQUARE_H));
        assertEquals(1f - TALL / (SQUARE_W / SQUARE_H), PhotoSlideFit.croppedShare(TALL, SQUARE_W, SQUARE_H), 1e-6f);
    }

    @Test
    public void aTallSlideOnANormalPhoneKeepsTikToksCrop() {
        assertFalse(PhotoSlideFit.shouldFit(TALL, PHONE_W, PHONE_H));
        assertFalse(PhotoSlideFit.shouldFit(0.5f, PHONE_W, PHONE_H));
    }

    @Test
    public void aSlideThatLosesLittleIsLeftAlone() {
        assertFalse(PhotoSlideFit.shouldFit(0.89f, SQUARE_W, SQUARE_H));
        assertEquals(0f, PhotoSlideFit.croppedShare(1.5f, SQUARE_W, SQUARE_H), 0f);
    }

    @Test
    public void sizesItCannotUseAreLeftToTikTok() {
        assertFalse(PhotoSlideFit.shouldFit(0f, SQUARE_W, SQUARE_H));
        assertFalse(PhotoSlideFit.shouldFit(Float.NaN, SQUARE_W, SQUARE_H));
        assertFalse(PhotoSlideFit.shouldFit(TALL, 0f, SQUARE_H));
        assertFalse(PhotoSlideFit.shouldFit(TALL, SQUARE_W, 0f));
        assertEquals(0f, PhotoSlideFit.croppedShare(-1f, SQUARE_W, SQUARE_H), 0f);
    }

    @Test
    public void thePortraitSlideNeedsTheCellToBeSquarishToo() {
        assertTrue(PhotoSlideFit.shouldFit(PORTRAIT * 0.8f, 1000f, 1000f));
        assertFalse(PhotoSlideFit.shouldFit(PORTRAIT * 0.8f, 700f, 1200f));
    }

    @Test
    public void containerAnswerFollowsTheViewAndTheSwitch() {
        Context context = RuntimeEnvironment.getApplication();
        View square = new View(context);
        square.layout(0, 0, 1076, 1200);
        View tall = new View(context);
        tall.layout(0, 0, 1080, 1920);
        try {
            Settings.FIT_VIDEO_TO_SCREEN.save(true);
            assertEquals(1, PhotoSlideFit.fitInContainer(square, TALL));
            assertEquals(0, PhotoSlideFit.fitInContainer(tall, TALL));
            assertEquals(0, PhotoSlideFit.fitInContainer(null, TALL));
            assertEquals("a view not laid out yet", 0, PhotoSlideFit.fitInContainer(new View(context), TALL));

            Settings.FIT_VIDEO_TO_SCREEN.save(false);
            assertEquals("off is stock", 0, PhotoSlideFit.fitInContainer(square, TALL));
        } finally {
            Settings.FIT_VIDEO_TO_SCREEN.save(false);
        }
    }

    @Test
    public void squarishStartsAtTheThreshold() {
        assertTrue(PhotoSlideFit.squarish(SQUARE_W, SQUARE_H));
        assertTrue(PhotoSlideFit.squarish(65f, 100f));
        assertTrue("a landscape screen", PhotoSlideFit.squarish(PHONE_H, PHONE_W));
        assertFalse(PhotoSlideFit.squarish(PHONE_W, PHONE_H));
        assertFalse(PhotoSlideFit.squarish(0f, SQUARE_H));
        assertFalse(PhotoSlideFit.squarish(SQUARE_W, 0f));
        assertFalse(PhotoSlideFit.squarish(Float.NaN, SQUARE_H));
    }

    /** The display mode's answer: every slide whole on a squarish screen with Fit on (#188). */
    @Test @Config(qualifiers = "w400dp-h440dp-mdpi")
    public void aSquarishScreenShowsEverySlideWholeWhenFitIsOn() {
        try {
            Settings.FIT_VIDEO_TO_SCREEN.save(true);
            assertEquals(1, PhotoSlideFit.showsWholeImage());
            Settings.FIT_VIDEO_TO_SCREEN.save(false);
            assertEquals("off is stock", 0, PhotoSlideFit.showsWholeImage());
        } finally {
            Settings.FIT_VIDEO_TO_SCREEN.save(false);
        }
    }

    @Test @Config(qualifiers = "w360dp-h640dp-mdpi")
    public void aTallPhoneKeepsTikToksDisplayMode() {
        try {
            Settings.FIT_VIDEO_TO_SCREEN.save(true);
            assertEquals(0, PhotoSlideFit.showsWholeImage());
        } finally {
            Settings.FIT_VIDEO_TO_SCREEN.save(false);
        }
    }

    @Test
    public void screenAnswerIsStockWhenOffOrWithoutAnAspect() {
        try {
            Settings.FIT_VIDEO_TO_SCREEN.save(false);
            assertEquals(0, PhotoSlideFit.fitOnScreen(TALL));
            Settings.FIT_VIDEO_TO_SCREEN.save(true);
            assertEquals(0, PhotoSlideFit.fitOnScreen(0f));
        } finally {
            Settings.FIT_VIDEO_TO_SCREEN.save(false);
        }
    }
}
