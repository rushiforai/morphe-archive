/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.profile;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Dialog;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowLooper;

import java.util.Collections;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ProfilePictureTest {
    private static final String LOAD_FAILED = "Couldn't load the picture. Try again in a moment.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private ProfilePictureForTests.FakeThreads threads;
    private final Object callback = new Object();

    /** The switch starts off; these tests turn it on. Cleared first too, so nothing is left from another class. */
    @Before public void turnTheSwitchOn() {
        restore();
        Settings.FULL_SIZE_PROFILE_PICTURES.save(true);
        threads = ProfilePictureForTests.install();
    }

    @After public void restore() {
        ProfilePictureForTests.reset();
        PauseForTests.resume();
        Settings.FULL_SIZE_PROFILE_PICTURES.resetToDefault();
        HookStatus.clear();
    }

    private String report() {
        return String.join("\n", HookStatus.report());
    }

    /** The switch starts off, and needs no restart: it's read each time a picture opens. */
    @Test public void theSwitchStartsOffAndAppliesWithoutARestart() {
        assertFalse("the switch starts on", Settings.FULL_SIZE_PROFILE_PICTURES.defaultValue);
        assertFalse(Settings.FULL_SIZE_PROFILE_PICTURES.rebootApp);
    }

    /** On, the largest size opens in the viewer over the screen in front, and Threads draws nothing. */
    @Test public void onOpensTheLargestSizeFullScreen() {
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertNotNull("no viewer went up", dialog);
        assertTrue(dialog.isShowing());
        assertSame(ProfilePicture.current.dialog, dialog);
        // The fetch runs off the main thread; it asks for the largest size, not the circle's.
        waitFor(() -> !threads.fetched.isEmpty());
        assertEquals(Collections.singletonList(ProfilePictureForTests.HD), threads.fetched);
        assertTrue(report(), report().contains(FamilyNames.FULL_SIZE_PROFILE_PICTURES + ": invoked 1"));
        assertTrue(report(), report().contains(ProfilePicture.OPENED + " 1"));
        // The bar names the account.
        assertNotNull(find(dialog.getWindow().getDecorView(), "@someone"));
    }

    /** Threads asks again whenever it redraws; the viewer already covers it, so no second one opens. */
    @Test public void aRedrawWhileTheViewerIsUpOpensNothingMore() {
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        // Asked again before the viewer has gone up, and after.
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        PictureViewer first = ProfilePicture.current;
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        assertSame(first, ProfilePicture.current);
        assertTrue(report(), report().contains(ProfilePicture.COVERED + " 2"));
    }

    /** Close, Back, or anything else that takes the viewer down runs Threads' own callback, once. */
    @Test public void closingHandsTheProfileBackToThreads() {
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        Dialog dialog = ProfilePicture.current.dialog;
        dialog.onBackPressed();
        ShadowLooper.idleMainLooper();
        assertFalse(dialog.isShowing());
        assertEquals(Collections.singletonList(callback), threads.dismissed);
        assertNull(ProfilePicture.current);

        // The next tap opens a new viewer.
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        assertTrue(ProfilePicture.current.dialog.isShowing());
    }

    /** A screen torn down under the viewer takes its window without a dismiss; the next tap starts over. */
    @Test public void aViewerWhoseScreenWentAwayDoesNotHoldTheNextOne() {
        org.robolectric.android.controller.ActivityController<android.app.Activity> screen =
            org.robolectric.Robolectric.buildActivity(android.app.Activity.class).setup();
        threads.front = screen.get();
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        PictureViewer gone = ProfilePicture.current;
        screen.pause().stop().destroy();
        threads.front = org.robolectric.Robolectric.buildActivity(android.app.Activity.class).setup().get();
        assertFalse(gone.isUp());
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        assertTrue(gone != ProfilePicture.current);
    }

    /** A picture that doesn't load says so on the viewer, with Close still there. */
    @Test public void aFailedLoadSaysSo() {
        threads.bytes = null;
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        View root = ProfilePicture.current.dialog.getWindow().getDecorView();
        waitFor(() -> {
            ShadowLooper.idleMainLooper();
            TextView error = find(root, LOAD_FAILED);
            return error != null && error.getVisibility() == View.VISIBLE;
        });
    }

    /** The circle's own picture stands in when the largest size isn't a Meta media address. */
    @Test public void theLargestSizeIsPreferredOnlyWhenItsAddressIsMetas() {
        assertEquals(ProfilePictureForTests.HD, ProfilePicture.choose(ProfilePictureForTests.HD, ProfilePictureForTests.SMALL));
        assertEquals(ProfilePictureForTests.SMALL, ProfilePicture.choose(null, ProfilePictureForTests.SMALL));
        assertEquals(ProfilePictureForTests.SMALL, ProfilePicture.choose("https://example.com/a.jpg", ProfilePictureForTests.SMALL));
        assertEquals(ProfilePictureForTests.SMALL, ProfilePicture.choose(
            ProfilePictureForTests.HD.replace("https:", "http:"), ProfilePictureForTests.SMALL));
        assertNull(ProfilePicture.choose(null, "https://example.com/a.jpg"));
        assertNull(ProfilePicture.choose(null, null));
    }

    /** Whatever the viewer can't do, Threads' own circle opens instead, with the reason counted. */
    @Test public void eachRefusalLeavesThePictureToThreads() {
        assertFalse("a user Threads hasn't loaded", ProfilePicture.open(new Object(), "2", callback));
        assertFalse("no user id", ProfilePicture.open(new Object(), null, callback));
        threads.profile = new ProfilePicture.Profile("https://example.com/a.jpg", null, "someone");
        assertFalse("no Meta address", ProfilePicture.open(new Object(), "1", callback));
        threads.profile = new ProfilePicture.Profile(ProfilePictureForTests.HD, null, "someone");
        threads.front = null;
        assertFalse("no screen", ProfilePicture.open(new Object(), "1", callback));
        Settings.FULL_SIZE_PROFILE_PICTURES.save(false);
        assertFalse("off", ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        assertNull(ProfilePicture.current);
        for (String reason : new String[] {"user not loaded", "no user id", "no picture address", "no screen in front", "switch off"}) {
            assertTrue(report(), report().contains(ProfilePicture.LEFT_TO_THREADS + reason + " 1"));
        }
    }

    /** Paused or in safe mode, the saved switch stays on and Threads' circle comes back. */
    @Test public void pauseAndSafeModeLeaveThePictureToThreads() {
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertFalse(ProfilePicture.open(new Object(), "1", callback));
        assertTrue(Settings.FULL_SIZE_PROFILE_PICTURES.savedValue());
        assertTrue(report(), report().contains(ProfilePicture.LEFT_TO_THREADS + "HushThreads paused 1"));
        PauseForTests.resume();

        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        assertFalse(ProfilePicture.open(new Object(), "1", callback));
        assertTrue(Settings.FULL_SIZE_PROFILE_PICTURES.savedValue());
    }

    /**
     * When Threads' callback fails, the viewer can't hand the profile back, so every later picture is
     * left to Threads, whose own circle still closes.
     */
    @Test public void aFailedHandBackLeavesLaterPicturesToThreads() {
        threads.dismissFails = new IllegalStateException("callback");
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        ProfilePicture.current.dialog.dismiss();
        ShadowLooper.idleMainLooper();
        assertNull(ProfilePicture.current);
        assertFalse(ProfilePicture.open(new Object(), "1", callback));
        assertTrue(report(), report().contains(ProfilePicture.LEFT_TO_THREADS + "Threads' callback failed earlier 1"));
        assertEquals(Collections.singletonList("a working 'put the enlarged picture away' hook (it threw "
                + IllegalStateException.class.getName() + ")"),
            HookStatus.missing(FamilyNames.FULL_SIZE_PROFILE_PICTURES));
    }

    /** A failure reading Threads' model leaves the picture to Threads and is reported. */
    @Test public void aFailureInTheLookupLeavesThePictureToThreads() {
        threads.profileFails = new ClassCastException("not a composer");
        assertFalse(ProfilePicture.open(new Object(), "1", callback));
        assertNull(ProfilePicture.current);
        assertEquals(Collections.singletonList("a working 'enlarged profile picture' hook (it threw "
                + ClassCastException.class.getName() + ")"),
            HookStatus.missing(FamilyNames.FULL_SIZE_PROFILE_PICTURES));
    }

    /** A loaded picture replaces the spinner; Save stays hidden in a build without Save media. */
    @Test public void aLoadedPictureShowsWithSaveOnlyWhenSaveMediaIsIn() {
        java.io.ByteArrayOutputStream png = new java.io.ByteArrayOutputStream();
        android.graphics.Bitmap.createBitmap(20, 30, android.graphics.Bitmap.Config.ARGB_8888)
            .compress(android.graphics.Bitmap.CompressFormat.PNG, 100, png);
        threads.bytes = png.toByteArray();
        assertTrue(ProfilePicture.open(new Object(), "1", callback));
        ShadowLooper.idleMainLooper();
        View root = ProfilePicture.current.dialog.getWindow().getDecorView();
        waitFor(() -> {
            ShadowLooper.idleMainLooper();
            PictureViewer.ZoomImageView image = findImage(root);
            return image != null && image.getDrawable() != null;
        });
        assertEquals(View.GONE, find(root, LOAD_FAILED).getVisibility());
        View save = findDescribed(root, "Save");
        assertNotNull(save);
        assertEquals(View.INVISIBLE, save.getVisibility());
    }

    private static PictureViewer.ZoomImageView findImage(View view) {
        if (view instanceof PictureViewer.ZoomImageView) return (PictureViewer.ZoomImageView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                PictureViewer.ZoomImageView found = findImage(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static View findDescribed(View view, String description) {
        if (description.contentEquals(String.valueOf(view.getContentDescription()))) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findDescribed(group.getChildAt(i), description);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** As built, with no patch writing the model's bodies, nothing is found and Threads keeps its circle. */
    @Test public void unpatchedModelFindsNothing() {
        ProfilePicture.source = ProfilePicture.THREADS;
        assertNull(ProfilePicture.THREADS.profile(new Object(), "1"));
        assertFalse(ProfilePicture.open(new Object(), "1", callback));
        assertTrue(report(), report().contains(ProfilePicture.LEFT_TO_THREADS + "user not loaded 1"));
    }

    /** A picture is decoded at most 4096 pixels on its longer side, halving as needed. */
    @Test public void bigPicturesAreHalvedUntilTheyFit() {
        assertEquals(1, PictureViewer.sampleSize(1080, 1080));
        assertEquals(1, PictureViewer.sampleSize(4096, 100));
        assertEquals(2, PictureViewer.sampleSize(4097, 100));
        assertEquals(4, PictureViewer.sampleSize(100, 9000));
    }

    /** A zoomed picture never leaves a gap at an edge it's longer than, and a shorter side stays centered. */
    @Test public void aZoomedPictureStaysOverTheScreen() {
        // Shorter than the view: centered.
        assertEquals(50f, PictureViewer.ZoomImageView.pull(0, 100, 200), 0f);
        assertEquals(-30f, PictureViewer.ZoomImageView.pull(80, 180, 200), 0f);
        // Longer: pulled back to the edge it left, and left alone when it covers the view.
        assertEquals(-20f, PictureViewer.ZoomImageView.pull(20, 420, 200), 0f);
        assertEquals(30f, PictureViewer.ZoomImageView.pull(-250, 170, 200), 0f);
        assertEquals(0f, PictureViewer.ZoomImageView.pull(-100, 300, 200), 0f);
    }

    private static TextView find(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return (TextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = find(group.getChildAt(i), text);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static void waitFor(java.util.function.BooleanSupplier condition) {
        long until = System.currentTimeMillis() + 5_000;
        while (!condition.getAsBoolean()) {
            if (System.currentTimeMillis() > until) throw new AssertionError("timed out");
            try {
                Thread.sleep(10);
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                throw new AssertionError(interrupted);
            }
        }
    }
}
