package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.ClipData;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.net.Uri;
import android.os.Looper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowActivity;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

/** #161: Send Instants from your gallery, run through a stand-in for Messenger's shutter callback as the patch leaves it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class InstantGalleryTest {
    private Application app;
    private Executor originalWork;

    /** The camera's result handed to the shutter's callback. */
    static final class Frame {
        final Bitmap photo;

        Frame(Bitmap photo) { this.photo = photo; }
    }

    /**
     * Messenger's Instants shutter callback after the patch: it asks [InstantGallery.capture] first, then takes the
     * camera's admission, reads its photo twice through [InstantGallery.frame] inside its own catch, recycles the second
     * read and sends the first. A failed read is its own drop of a capture it couldn't use. Admission is released either way.
     */
    static final class Shutter {
        boolean admit = true;
        int admitted, dropped, released;
        final List<Bitmap> sent = new ArrayList<>();

        @SuppressWarnings("unused") // Run again by name through reflection, like the patched callback.
        private void EKR(Frame frame) {
            if (InstantGallery.capture(this, frame, "EKR") != 0) return;
            if (!admit) return;
            admitted++;
            try {
                Bitmap photo = InstantGallery.frame(frame.photo);
                Bitmap second = InstantGallery.frame(frame.photo);
                second.recycle();
                sent.add(photo);
            } catch (Exception failed) {
                dropped++;
            }
            released++;
        }

        void press(Frame frame) { EKR(frame); }
    }

    @Before public void reset() {
        originalWork = InstantGallery.work;
        InstantGallery.work = Runnable::run;
        InstantGallery.resetForTests();
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
    }

    @After public void restore() {
        InstantGallery.work = originalWork;
        InstantGallery.resetForTests();
    }

    private void installGallery() {
        ResolveInfo gallery = new ResolveInfo();
        gallery.activityInfo = new ActivityInfo();
        gallery.activityInfo.packageName = "com.example.gallery";
        gallery.activityInfo.name = "com.example.gallery.Pick";
        shadowOf(app.getPackageManager()).addResolveInfoForIntent(new Intent(Intent.ACTION_PICK).setType("image/*"), gallery);
    }

    private void switchOn() { Settings.preferences.edit().putBoolean(InstantGallery.KEY, true).commit(); }

    private static Frame camera(int width, int height) { return new Frame(Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)); }

    /** A 300 by 100 photo in three bands, blue, red and green, so a middle cut is all red. */
    private static Bitmap bands() {
        Bitmap bands = Bitmap.createBitmap(300, 100, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bands);
        int[] colors = {Color.BLUE, Color.RED, Color.GREEN};
        for (int i = 0; i < 3; i++) {
            Paint paint = new Paint();
            paint.setColor(colors[i]);
            canvas.drawRect(i * 100, 0, i * 100 + 100, 100, paint);
        }
        return bands;
    }

    private Uri savedBands() throws IOException {
        File file = new File(app.getCacheDir(), "instant-pick.png");
        Bitmap bands = bands();
        try (FileOutputStream output = new FileOutputStream(file)) {
            assertTrue(bands.compress(Bitmap.CompressFormat.PNG, 100, output));
        }
        bands.recycle();
        return Uri.fromFile(file);
    }

    private static void assertRed(String what, int pixel) {
        assertTrue(what + " " + Integer.toHexString(pixel), Color.red(pixel) > 200 && Color.green(pixel) < 60 && Color.blue(pixel) < 60);
    }

    private Intent startedScreen() {
        Intent started = shadowOf(app).getNextStartedActivity();
        assertNotNull("The pick screen didn't open", started);
        return started;
    }

    @Test public void offTheShutterTakesItsOwnPhoto() {
        installGallery();
        Shutter shutter = new Shutter();
        Frame frame = camera(120, 160);
        shutter.press(frame);
        assertNull(shadowOf(app).getNextStartedActivity());
        assertEquals(1, shutter.admitted);
        assertEquals(List.of(frame.photo), shutter.sent);
        assertFalse(InstantGallery.holding());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void onThePressIsHeldAndThePickScreenOpens() {
        installGallery();
        switchOn();
        Shutter shutter = new Shutter();
        shutter.press(camera(120, 160));
        assertEquals("The camera's admission was taken while the gallery was open", 0, shutter.admitted);
        assertTrue(InstantGallery.holding());
        Intent screen = startedScreen();
        assertEquals(new ComponentName(app.getPackageName(), InstantPickActivity.class.getName()), screen.getComponent());
        assertTrue("Started from the camera's thread without an activity", (screen.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        assertTrue(Settings.lastActive(InstantGallery.KEY) > 0);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void withNoGalleryAppTheShutterSaysSoAndTakesItsOwnPhoto() {
        switchOn();
        assertNull(InstantGallery.screenIntent(app));
        assertFalse(Settings.available(InstantGallery.KEY));
        Shutter shutter = new Shutter();
        Frame frame = camera(120, 160);
        shutter.press(frame);
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(new SettingsText(app).get("gallery_missing"), ShadowToast.getTextOfLatestToast());
        assertEquals(List.of(frame.photo), shutter.sent);
        assertFalse(InstantGallery.holding());

        installGallery();
        assertTrue(Settings.available(InstantGallery.KEY));
        // A Root Mount install keeps the stock manifest, so Android doesn't know the pick screen.
        android.content.Context stock = new android.content.ContextWrapper(app) {
            @Override public String getPackageName() { return "com.example.without.pick.screen"; }
        };
        assertNull(InstantGallery.screenIntent(stock));
        assertNotNull(InstantGallery.screenIntent(app));
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aPickGoesOutInPlaceOfTheCameraPhotoCutToItsShape() throws IOException {
        installGallery();
        switchOn();
        Shutter shutter = new Shutter();
        Frame frame = camera(120, 160);
        shutter.press(frame);
        boolean[] done = {false};
        InstantGallery.picked(app, savedBands(), () -> done[0] = true);
        assertEquals(1, shutter.admitted);
        assertEquals(1, shutter.released);
        assertEquals(0, shutter.dropped);
        assertEquals(1, shutter.sent.size());
        Bitmap sent = shutter.sent.get(0);
        assertNotSame(frame.photo, sent);
        assertEquals(120, sent.getWidth());
        assertEquals(160, sent.getHeight());
        assertRed("corner", sent.getPixel(0, 0));
        assertRed("middle", sent.getPixel(60, 80));
        assertTrue("The second read is the camera's own photo, which the callback recycles", frame.photo.isRecycled());
        assertFalse(InstantGallery.holding());
        assertFalse(InstantGallery.picked());
        assertFalse("The pick screen closed before the photo was read", done[0]);
        shadowOf(Looper.getMainLooper()).idle();
        assertTrue(done[0]);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aBackOutDropsThePressThroughTheCallbacksOwnCatch() {
        installGallery();
        switchOn();
        Shutter shutter = new Shutter();
        shutter.press(camera(120, 160));
        InstantGallery.canceled();
        assertEquals(1, shutter.admitted);
        assertEquals(1, shutter.dropped);
        assertEquals("The camera's admission was handed back", 1, shutter.released);
        assertTrue(shutter.sent.isEmpty());
        assertFalse(InstantGallery.holding());
        assertTrue(Settings.hookErrors.isEmpty());

        // The shutter is free again: the next press opens the gallery.
        shutter.press(camera(120, 160));
        assertTrue(InstantGallery.holding());
    }

    @Test public void aPressTheGalleryNeverAnsweredIsDroppedByTheNext() {
        installGallery();
        switchOn();
        Shutter first = new Shutter(), second = new Shutter();
        first.press(camera(120, 160));
        startedScreen();
        second.press(camera(120, 160));
        assertEquals(1, first.dropped);
        assertEquals(1, first.released);
        assertEquals(0, second.admitted);
        assertTrue(InstantGallery.holding());
        startedScreen();
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aPickTheCameraWasntReadyForGoesOutWithTheNextPress() throws IOException {
        installGallery();
        switchOn();
        Shutter shutter = new Shutter();
        shutter.press(camera(120, 160));
        startedScreen();
        // Messenger had already let go of the held press, so the replay doesn't get the camera's admission.
        shutter.admit = false;
        InstantGallery.picked(app, savedBands(), () -> {});
        assertTrue(shutter.sent.isEmpty());
        assertTrue(InstantGallery.picked());
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(new SettingsText(app).get("instant_gallery_shutter"), ShadowToast.getTextOfLatestToast());

        shutter.admit = true;
        Frame next = camera(160, 120);
        shutter.press(next);
        assertNull("The next press went to the gallery again", shadowOf(app).getNextStartedActivity());
        assertEquals(1, shutter.sent.size());
        Bitmap sent = shutter.sent.get(0);
        assertEquals(160, sent.getWidth());
        assertEquals(120, sent.getHeight());
        assertRed("middle", sent.getPixel(80, 60));
        assertFalse(InstantGallery.picked());

        // The press after that opens the gallery again.
        shutter.press(camera(120, 160));
        assertTrue(InstantGallery.holding());
        startedScreen();
        assertEquals(1, shutter.sent.size());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void switchingOffOrPausingDropsWhatWaits() throws IOException {
        installGallery();
        switchOn();
        Shutter shutter = new Shutter();
        shutter.press(camera(120, 160));
        // Pause came on while the gallery was open: the pick is let go and the held press dropped.
        Settings.preferences.edit().putBoolean("paused", true).commit();
        InstantGallery.picked(app, savedBands(), () -> {});
        assertEquals(1, shutter.dropped);
        assertTrue(shutter.sent.isEmpty());
        assertFalse(InstantGallery.picked());
        assertFalse(InstantGallery.holding());

        // A held press, then the switch goes off: the next press drops it and takes its own photo.
        Settings.preferences.edit().putBoolean("paused", false).commit();
        Shutter held = new Shutter();
        held.press(camera(120, 160));
        assertTrue(InstantGallery.holding());
        Settings.preferences.edit().putBoolean(InstantGallery.KEY, false).commit();
        Frame frame = camera(120, 160);
        shutter.press(frame);
        assertEquals(1, held.dropped);
        assertFalse(InstantGallery.holding());
        assertSame(frame.photo, shutter.sent.get(0));

        // A pick still waiting is let go the same way.
        switchOn();
        held.press(camera(120, 160));
        held.admit = false;
        InstantGallery.picked(app, savedBands(), () -> {});
        assertTrue(InstantGallery.picked());
        Settings.preferences.edit().putBoolean("paused", true).commit();
        Frame paused = camera(120, 160);
        shutter.press(paused);
        assertFalse(InstantGallery.picked());
        assertSame(paused.photo, shutter.sent.get(1));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aPickIsCutFromItsMiddleAndNeverOverTheLimit() {
        Bitmap pick = bands();
        Bitmap wide = InstantGallery.fitted(pick, Bitmap.createBitmap(160, 120, Bitmap.Config.ARGB_8888));
        assertTrue(pick.isRecycled());
        assertEquals(160, wide.getWidth());
        assertEquals(120, wide.getHeight());
        // A 4:3 cut of the 3:1 bands reaches into the blue and green ones.
        int left = wide.getPixel(2, 60), right = wide.getPixel(157, 60);
        assertTrue(Integer.toHexString(left), Color.blue(left) > 200 && Color.red(left) < 60);
        assertTrue(Integer.toHexString(right), Color.green(right) > 200 && Color.red(right) < 60);
        assertRed("middle", wide.getPixel(80, 60));

        Bitmap big = InstantGallery.fitted(bands(), Bitmap.createBitmap(4000, 3000, Bitmap.Config.ARGB_8888));
        assertEquals(InstantGallery.MAX_EDGE, big.getWidth());
        assertEquals(1536, big.getHeight());

        // Without a usable camera photo the pick keeps its own shape.
        Bitmap gone = Bitmap.createBitmap(120, 160, Bitmap.Config.ARGB_8888);
        gone.recycle();
        Bitmap own = InstantGallery.fitted(bands(), gone);
        assertEquals(300, own.getWidth());
        assertEquals(100, own.getHeight());
        assertEquals(Bitmap.Config.ARGB_8888, own.getConfig());
    }

    @Test public void aCallbackThatThrowsIsReportedPrivately() {
        installGallery();
        switchOn();
        Object broken = new Object() {
            @SuppressWarnings("unused") private void EKR(Frame frame) {
                if (InstantGallery.capture(this, frame, "EKR") != 0) return;
                throw new IllegalStateException("Messenger changed its shutter");
            }
        };
        assertEquals(1, InstantGallery.capture(broken, camera(120, 160), "EKR"));
        InstantGallery.canceled();
        assertTrue(Settings.hookErrors.containsKey(InstantGallery.KEY));
        assertFalse(InstantGallery.holding());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void thePickScreenHandsThePhotoOverAndClosesOnceItsRead() throws IOException {
        installGallery();
        switchOn();
        Shutter shutter = new Shutter();
        shutter.press(camera(120, 160));
        try (ActivityController<InstantPickActivity> controller = Robolectric.buildActivity(InstantPickActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            ShadowActivity.IntentForResult started = screen.getNextStartedActivityForResult();
            assertNotNull(started);
            assertEquals(Intent.ACTION_PICK, started.intent.getAction());
            assertEquals("One photo, never a video", "image/*", started.intent.getType());
            // A gallery that answers in ClipData.
            Uri photo = savedBands();
            Intent picked = new Intent();
            picked.setClipData(ClipData.newRawUri("", photo));
            screen.receiveResult(started.intent, Activity.RESULT_OK, picked);
            assertEquals(1, shutter.sent.size());
            assertFalse("The pick screen closed before the photo was read", controller.get().isFinishing());
            shadowOf(Looper.getMainLooper()).idle();
            assertTrue(controller.get().isFinishing());
        }
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void closingThePickScreenWithNothingPickedFreesTheShutter() {
        installGallery();
        switchOn();
        Shutter shutter = new Shutter();
        shutter.press(camera(120, 160));
        try (ActivityController<InstantPickActivity> controller = Robolectric.buildActivity(InstantPickActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            screen.receiveResult(screen.getNextStartedActivityForResult().intent, Activity.RESULT_CANCELED, null);
            assertTrue(controller.get().isFinishing());
        }
        assertEquals(1, shutter.dropped);

        // A gallery that says OK but hands nothing back is a back-out too.
        shutter.press(camera(120, 160));
        try (ActivityController<InstantPickActivity> controller = Robolectric.buildActivity(InstantPickActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            screen.receiveResult(screen.getNextStartedActivityForResult().intent, Activity.RESULT_OK, new Intent());
            assertTrue(controller.get().isFinishing());
        }
        assertEquals(2, shutter.dropped);

        // Closed some other way before the gallery answered.
        shutter.press(camera(120, 160));
        ActivityController<InstantPickActivity> closed = Robolectric.buildActivity(InstantPickActivity.class).setup();
        closed.get().finish();
        closed.pause().stop().destroy();
        assertEquals(3, shutter.dropped);
        assertFalse(InstantGallery.holding());
        assertTrue(shutter.sent.isEmpty());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void withTheGalleryAppGoneThePickScreenSaysSoAndFreesTheShutter() {
        installGallery();
        switchOn();
        Shutter shutter = new Shutter();
        shutter.press(camera(120, 160));
        shadowOf(app.getPackageManager()).removeResolveInfosForIntent(new Intent(Intent.ACTION_PICK).setType("image/*"), "com.example.gallery");
        // The shutter's own start of the pick screen comes off the shared queue first.
        Intent opened = shadowOf(app).getNextStartedActivity();
        assertEquals(InstantPickActivity.class.getName(), opened.getComponent().getClassName());
        try (ActivityController<InstantPickActivity> controller = Robolectric.buildActivity(InstantPickActivity.class).setup()) {
            assertNull("The pick screen opened something with no gallery app", shadowOf(app).getNextStartedActivity());
            assertTrue(controller.get().isFinishing());
            assertEquals(new SettingsText(app).get("gallery_missing"), ShadowToast.getTextOfLatestToast());
        }
        assertEquals(1, shutter.dropped);
        assertFalse(InstantGallery.holding());
    }

    @Test public void aPictureThatCantBeReadSaysSoAndFreesTheShutter() {
        installGallery();
        switchOn();
        Shutter shutter = new Shutter();
        shutter.press(camera(120, 160));
        InstantGallery.picked(app, Uri.fromFile(new File(app.getCacheDir(), "no-such-photo.png")), () -> {});
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(new SettingsText(app).get("gallery_failed"), ShadowToast.getTextOfLatestToast());
        assertEquals(1, shutter.dropped);
        assertFalse(InstantGallery.holding());
        assertTrue("A missing file isn't a failure of the control", Settings.hookErrors.isEmpty());
    }
}
