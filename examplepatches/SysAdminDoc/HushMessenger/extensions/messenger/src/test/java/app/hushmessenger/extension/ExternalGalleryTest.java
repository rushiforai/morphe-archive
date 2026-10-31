package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowActivity;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ExternalGalleryTest {
    static final String CAMERA_SCREEN = "com.facebook.messaging.montage.composer.MontageComposerActivity";
    Application app;
    private java.util.concurrent.Executor originalWork;

    @Before public void reset() {
        originalWork = GalleryActivity.work;
        GalleryActivity.work = Runnable::run;
        GalleryPicker.lastOutcome = GalleryPicker.Outcome.NOT_USED;
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        Settings.chatTray = false;
        CrashGuard.resetForTests();
    }

    @After public void restoreWorker() {
        GalleryActivity.work = originalWork;
        GalleryPicker.lastOutcome = GalleryPicker.Outcome.NOT_USED;
    }

    /** A gallery app that answers a photo pick, as Samsung's Gallery and Google Photos do. */
    private ResolveInfo installGallery() {
        ResolveInfo gallery = new ResolveInfo();
        gallery.activityInfo = new ActivityInfo();
        gallery.activityInfo.packageName = "com.example.gallery";
        gallery.activityInfo.name = "com.example.gallery.Pick";
        shadowOf(app.getPackageManager()).addResolveInfoForIntent(new Intent(Intent.ACTION_PICK).setType("image/*"), gallery);
        return gallery;
    }

    @Test public void theGalleryAppAndroidOpensOnItsOwnIsAskedForPhotosAndVideosTogether() {
        ResolveInfo gallery = installGallery();
        assertEquals("Without an any-type pick the gallery app gets a photo pick", "image/*", GalleryPicker.pickIntent(app).getType());
        // Samsung's Gallery shows videos only for an any-type pick. A contacts app answers one too, so it's asked by name.
        ResolveInfo contacts = new ResolveInfo();
        contacts.activityInfo = new ActivityInfo();
        contacts.activityInfo.packageName = "com.example.contacts";
        contacts.activityInfo.name = "com.example.contacts.Pick";
        shadowOf(app.getPackageManager()).addResolveInfoForIntent(new Intent(Intent.ACTION_PICK).setType("*/*"), contacts);
        shadowOf(app.getPackageManager()).addResolveInfoForIntent(
            new Intent(Intent.ACTION_PICK).setType("*/*").setPackage("com.example.gallery"), gallery);
        Intent pick = GalleryPicker.pickIntent(app);
        assertEquals("*/*", pick.getType());
        assertEquals("com.example.gallery", pick.getPackage());
        assertNull(pick.getComponent());
        assertEquals(Arrays.asList("image/*", "video/*"), Arrays.asList(pick.getStringArrayExtra(Intent.EXTRA_MIME_TYPES)));
    }

    /** A gallery app as Android's own resolver needs to see it before it asks which app to use. */
    private ResolveInfo gallery(String packageName) {
        ResolveInfo gallery = new ResolveInfo();
        gallery.activityInfo = new ActivityInfo();
        gallery.activityInfo.packageName = packageName;
        gallery.activityInfo.name = packageName + ".Pick";
        gallery.activityInfo.applicationInfo = new android.content.pm.ApplicationInfo();
        gallery.activityInfo.applicationInfo.packageName = packageName;
        return gallery;
    }

    /**
     * #64 and #94: with two gallery apps and no default Android asks which one to use. The photo pick left Samsung's
     * Gallery showing photos only, and an any-type pick behind a photo-pick selector still put contact pickers on
     * Samsung's list, so the chooser now gets one any-type pick per gallery, each by name.
     */
    @Test public void whenAndroidAsksWhichGalleryOnlyGalleriesAreListedAndEachShowsPhotosAndVideos() {
        var packages = shadowOf(app.getPackageManager());
        packages.setShouldShowActivityChooser(true);
        ResolveInfo samsung = gallery("com.example.gallery"), photos = gallery("com.example.photos");
        Intent photoPick = new Intent(Intent.ACTION_PICK).setType("image/*");
        packages.addResolveInfoForIntent(photoPick, samsung);
        packages.addResolveInfoForIntent(photoPick, photos);
        // No contacts app here: Robolectric matches a registered pick by its action alone, so one would answer the photo
        // pick too. On a phone the contacts picker answers an any-type pick but not a photo pick, so the selector keeps it out.
        packages.addResolveInfoForIntent(new Intent(Intent.ACTION_PICK).setType("*/*").setPackage("com.example.gallery"), samsung);
        String asks = app.getPackageManager().resolveActivity(photoPick, android.content.pm.PackageManager.MATCH_DEFAULT_ONLY)
            .activityInfo.packageName;
        assertFalse("Android picked " + asks + " without asking", Arrays.asList("com.example.gallery", "com.example.photos").contains(asks));

        assertEquals("A gallery that can't take an any-type pick keeps the photo pick", "image/*", GalleryPicker.pickIntent(app).getType());
        packages.addResolveInfoForIntent(new Intent(Intent.ACTION_PICK).setType("*/*").setPackage("com.example.photos"), photos);
        Intent pick = GalleryPicker.pickIntent(app);
        assertEquals(Intent.ACTION_CHOOSER, pick.getAction());
        assertNull("A selector put contact pickers on Samsung's list", pick.getSelector());
        java.util.List<Intent> offered = new java.util.ArrayList<>();
        offered.add((Intent) pick.getParcelableExtra(Intent.EXTRA_INTENT));
        for (android.os.Parcelable each : pick.getParcelableArrayExtra(Intent.EXTRA_INITIAL_INTENTS)) offered.add((Intent) each);
        java.util.List<ComponentName> screens = new java.util.ArrayList<>();
        for (Intent each : offered) {
            screens.add(each.getComponent());
            assertEquals(Intent.ACTION_PICK, each.getAction());
            assertEquals("*/*", each.getType());
            assertNull(each.getSelector());
            assertTrue(each.getBooleanExtra(Intent.EXTRA_ALLOW_MULTIPLE, false));
            assertEquals(Arrays.asList("image/*", "video/*"), Arrays.asList(each.getStringArrayExtra(Intent.EXTRA_MIME_TYPES)));
        }
        assertEquals("Only the two galleries are offered", Arrays.asList(
            new ComponentName("com.example.gallery", "com.example.gallery.Pick"),
            new ComponentName("com.example.photos", "com.example.photos.Pick")), screens);
    }

    /** #94: the gallery picked from Android's chooser hands its pick back through the pick screen like any other. */
    @Test public void aGalleryPickedFromTheChooserStillReachesTheChat() {
        var packages = shadowOf(app.getPackageManager());
        packages.setShouldShowActivityChooser(true);
        Intent photoPick = new Intent(Intent.ACTION_PICK).setType("image/*");
        for (String name : Arrays.asList("com.example.gallery", "com.example.photos")) {
            ResolveInfo each = gallery(name);
            packages.addResolveInfoForIntent(photoPick, each);
            packages.addResolveInfoForIntent(new Intent(Intent.ACTION_PICK).setType("*/*").setPackage(name), each);
        }
        Robolectric.setupContentProvider(PickedProvider.class, "gallery.chooser");
        try (ActivityController<GalleryActivity> controller = Robolectric.buildActivity(GalleryActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            ShadowActivity.IntentForResult started = screen.getNextStartedActivityForResult();
            assertNotNull(started);
            assertEquals(Intent.ACTION_CHOOSER, started.intent.getAction());
            Uri item = Uri.parse("content://gallery.chooser/image/7");
            screen.receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(item));
            shadowOf(Looper.getMainLooper()).idle();
            assertEquals(Activity.RESULT_OK, screen.getResultCode());
            assertEquals(item, screen.getResultIntent().getData());
            assertEquals(GalleryPicker.Outcome.SELECTED, GalleryPicker.lastOutcome);
        }
    }

    /** The chat camera launcher's start: its own extras, then the ones it's handed, on a new intent for its screen. */
    private Intent launch(Bundle handed) {
        Intent intent = new Intent().setClassName(app.getPackageName(), CAMERA_SCREEN).putExtra("trigger2", "thread");
        return handed == null ? intent : intent.putExtras(handed);
    }

    @Test public void theGalleryButtonOpensThePhonesGalleryOnlyWithItsSwitchOn() {
        installGallery();
        assertNull("Off leaves the button to Messenger", Settings.chatGallery());
        assertEquals(0, Settings.lastActive(GalleryPicker.KEY));

        Settings.preferences.edit().putBoolean(GalleryPicker.KEY, true).commit();
        Bundle handed = Settings.chatGallery();
        assertNotNull(handed);
        assertTrue(Settings.lastActive(GalleryPicker.KEY) > 0);
        Intent marked = launch(handed);
        marked.putExtra(Settings.CHAT_CAMERA_MARK, true);
        Intent screen = Settings.chatCamera(marked);
        // Messenger's launcher refuses an intent for another app's screen, so the button starts the pick screen inside it.
        assertEquals(new ComponentName(app.getPackageName(), GalleryActivity.class.getName()), screen.getComponent());
        assertNull(screen.getAction());
        assertEquals("The chat reads the pick back the way it reads a photo picked in another app", 1112, Settings.cameraRequestCode(screen, 7376));
        assertFalse(marked.hasExtra(Settings.CHAT_GALLERY_MARK));
        assertFalse(marked.hasExtra(Settings.CHAT_CAMERA_MARK));
        Intent pick = GalleryPicker.pickIntent(app);
        assertEquals(Intent.ACTION_PICK, pick.getAction());
        assertEquals("image/*", pick.getType());
        assertNull("The pick goes to whichever gallery app the person uses", pick.getComponent());
        assertEquals(Arrays.asList("image/*", "video/*"), Arrays.asList(pick.getStringArrayExtra(Intent.EXTRA_MIME_TYPES)));

        // The camera button's next launch is built fresh, without the gallery's extras, and stays Messenger's camera.
        Intent camera = launch(null);
        assertSame(camera, Settings.chatCamera(camera));
        assertEquals(7376, Settings.cameraRequestCode(camera, 7376));

        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertNull("Pause brings Messenger's gallery back", Settings.chatGallery());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void withNoGalleryAppTheSwitchSaysWhyAndTheButtonStaysMessengers() {
        Settings.preferences.edit().putBoolean(GalleryPicker.KEY, true).commit();
        assertNull(GalleryPicker.pickIntent(app));
        assertFalse(Settings.available(GalleryPicker.KEY));
        assertNull(Settings.chatGallery());
        assertEquals(0, Settings.lastActive(GalleryPicker.KEY));

        // A gallery app removed between the tap and the launch leaves the launcher's own screen, marks off.
        Intent marked = launch(null).putExtra(Settings.CHAT_GALLERY_MARK, true);
        assertSame(marked, Settings.chatCamera(marked));
        assertFalse(marked.hasExtra(Settings.CHAT_GALLERY_MARK));
        assertEquals("thread", marked.getStringExtra("trigger2"));
        assertEquals(7376, Settings.cameraRequestCode(marked, 7376));

        installGallery();
        assertTrue(Settings.available(GalleryPicker.KEY));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** A gallery app's provider, which knows each picked item's type. */
    public static class PickedProvider extends ContentProvider {
        @Override public boolean onCreate() { return true; }
        @Override public String getType(Uri uri) { return uri.getPath().startsWith("/video") ? "video/mp4" : "image/jpeg"; }
        @Override public Cursor query(Uri uri, String[] columns, String selection, String[] arguments, String order) { return null; }
        @Override public Uri insert(Uri uri, ContentValues values) { return null; }
        @Override public int delete(Uri uri, String selection, String[] arguments) { return 0; }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] arguments) { return 0; }
        @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws java.io.FileNotFoundException {
            if (uri.getPath().contains("revoked")) throw new SecurityException("private provider URI must not enter diagnostics");
            File file = new File(getContext().getCacheDir(), "gallery-result-test.bin");
            try (java.io.FileOutputStream output = new java.io.FileOutputStream(file)) { output.write(1); }
            catch (IOException failed) { throw new java.io.FileNotFoundException("test media unavailable"); }
            return ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
        }
    }

    public static class SlowProvider extends PickedProvider {
        static java.util.concurrent.CountDownLatch entered, release;
        static volatile boolean mainThread;
        @Override public String getType(Uri uri) {
            mainThread = Looper.myLooper() == Looper.getMainLooper();
            entered.countDown();
            try { if (!release.await(3, java.util.concurrent.TimeUnit.SECONDS)) throw new IllegalStateException("test provider timeout"); }
            catch (InterruptedException stopped) { Thread.currentThread().interrupt(); throw new IllegalStateException(stopped); }
            return super.getType(uri);
        }
    }

    @Test public void aSlowProviderDoesNotBlockTheResultScreenAndItsGrantIsCheckedBeforeReturn() throws Exception {
        installGallery();
        Robolectric.setupContentProvider(SlowProvider.class, "gallery.slow");
        SlowProvider.entered = new java.util.concurrent.CountDownLatch(1);
        SlowProvider.release = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.CountDownLatch done = new java.util.concurrent.CountDownLatch(1);
        GalleryActivity.work = task -> originalWork.execute(() -> { try { task.run(); } finally { done.countDown(); } });
        try (ActivityController<GalleryActivity> controller = Robolectric.buildActivity(GalleryActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            screen.receiveResult(screen.getNextStartedActivityForResult().intent, Activity.RESULT_OK,
                new Intent().setData(Uri.parse("content://gallery.slow/image/7")));
            assertTrue(SlowProvider.entered.await(3, java.util.concurrent.TimeUnit.SECONDS));
            assertFalse(SlowProvider.mainThread);
            assertFalse(controller.get().isFinishing());
            SlowProvider.release.countDown();
            assertTrue(done.await(3, java.util.concurrent.TimeUnit.SECONDS));
            shadowOf(Looper.getMainLooper()).idle();
            assertEquals(Activity.RESULT_OK, screen.getResultCode());
            assertEquals(GalleryPicker.Outcome.SELECTED, GalleryPicker.lastOutcome);
        } finally { SlowProvider.release.countDown(); }
    }

    @Test public void timeoutAndCancelDiscardALateResultWithoutSendingAnything() {
        installGallery();
        Robolectric.setupContentProvider(PickedProvider.class, "gallery.delayed");
        for (boolean timeout : new boolean[] {true, false}) {
            java.util.List<Runnable> queued = new java.util.ArrayList<>();
            GalleryActivity.work = queued::add;
            try (ActivityController<GalleryActivity> controller = Robolectric.buildActivity(GalleryActivity.class).setup()) {
                GalleryActivity activity = controller.get();
                ShadowActivity screen = shadowOf(activity);
                screen.receiveResult(screen.getNextStartedActivityForResult().intent, Activity.RESULT_OK,
                    new Intent().setData(Uri.parse("content://gallery.delayed/image/7")));
                assertFalse(activity.isFinishing());
                if (timeout) shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(GalleryActivity.RESULT_TIMEOUT_MILLIS));
                else { activity.finish(); controller.pause().stop().destroy(); }
                queued.get(0).run();
                shadowOf(Looper.getMainLooper()).idle();
                assertNotEquals(Activity.RESULT_OK, screen.getResultCode());
                assertNull(screen.getResultIntent());
                if (timeout) assertEquals(GalleryPicker.Outcome.RESULT_TIMEOUT, GalleryPicker.lastOutcome);
            }
        }
    }

    @Test public void aRecreatedResultScreenReceivesTheOwnedJobOnce() {
        installGallery();
        Robolectric.setupContentProvider(PickedProvider.class, "gallery.recreated");
        java.util.List<Runnable> queued = new java.util.ArrayList<>();
        GalleryActivity.work = queued::add;
        try (ActivityController<GalleryActivity> controller = Robolectric.buildActivity(GalleryActivity.class).setup()) {
            GalleryActivity old = controller.get();
            ShadowActivity screen = shadowOf(old);
            screen.receiveResult(screen.getNextStartedActivityForResult().intent, Activity.RESULT_OK,
                new Intent().setData(Uri.parse("content://gallery.recreated/image/7")));
            controller.recreate();
            assertNotSame(old, controller.get());
            queued.get(0).run();
            shadowOf(Looper.getMainLooper()).idle();
            assertEquals(Activity.RESULT_OK, shadowOf(controller.get()).getResultCode());
            assertNotEquals(Activity.RESULT_OK, screen.getResultCode());
            assertEquals(1, queued.size());
        }
    }

    @Test public void revokedGrantsAndBusyWorkersHaveCategoricalFailures() {
        installGallery();
        Robolectric.setupContentProvider(PickedProvider.class, "gallery.revoked");
        for (boolean busy : new boolean[] {false, true}) {
            GalleryActivity.work = busy ? task -> { throw new java.util.concurrent.RejectedExecutionException(); } : Runnable::run;
            try (ActivityController<GalleryActivity> controller = Robolectric.buildActivity(GalleryActivity.class).setup()) {
                ShadowActivity screen = shadowOf(controller.get());
                screen.receiveResult(screen.getNextStartedActivityForResult().intent, Activity.RESULT_OK,
                    new Intent().setDataAndType(Uri.parse("content://gallery.revoked/image/revoked"), "image/jpeg"));
                assertEquals(Activity.RESULT_CANCELED, screen.getResultCode());
                assertNull(screen.getResultIntent());
                assertEquals(busy ? GalleryPicker.Outcome.RESULT_BUSY : GalleryPicker.Outcome.RESULT_REVOKED, GalleryPicker.lastOutcome);
            }
        }
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void nonMediaAndNonLocalResultsAreInvalid() {
        assertNull(GalleryPicker.handBack(app, new Intent().setDataAndType(Uri.parse("https://example.com/photo"), "image/jpeg")));
        assertNull(GalleryPicker.handBack(app, new Intent().setDataAndType(Uri.parse("content://example/file"), "text/plain")));
    }

    @Test public void missingPickerAndMissingHostScreenAreDifferentAndWildcardTypesAreResolvedOnce() {
        assertNull(GalleryPicker.screenIntent(app));
        assertEquals(GalleryPicker.Outcome.PICKER_MISSING, GalleryPicker.lastOutcome);
        installGallery();
        android.content.Context missingHost = new android.content.ContextWrapper(app) {
            @Override public String getPackageName() { return "com.example.without.gallery.screen"; }
        };
        assertNull(GalleryPicker.screenIntent(missingHost));
        assertEquals(GalleryPicker.Outcome.COMPONENT_MISSING, GalleryPicker.lastOutcome);
        assertNotNull(GalleryPicker.screenIntent(app));
        Robolectric.setupContentProvider(PickedProvider.class, "gallery.wildcard");
        Uri uri = Uri.parse("content://gallery.wildcard/image/7");
        assertEquals("image/jpeg", GalleryPicker.handBack(app, new Intent().setDataAndType(uri, "*/*")).getType());
        Intent unknown = new Intent().setData(uri).putExtra(GalleryPicker.RESULT_PREPARED, true);
        Settings.preferences.edit().putBoolean(GalleryPicker.KEY, true).commit();
        Settings.externalMediaResult(1112, Activity.RESULT_OK, unknown);
        assertNull("An already prepared result must not query its provider on the UI thread", unknown.getType());
    }

    @Test public void aPickWithNoTypeGetsItsOwnTypeSoTheChatOpensItInTheEditor() {
        String authority = "com.example.gallery.picked";
        Robolectric.setupContentProvider(PickedProvider.class, authority);
        Uri photo = Uri.parse("content://" + authority + "/image/7");
        Intent off = new Intent().setData(photo);
        Settings.externalMediaResult(1112, Activity.RESULT_OK, off);
        assertNull("Off leaves the result as the gallery app sent it", off.getType());

        Settings.preferences.edit().putBoolean(GalleryPicker.KEY, true).commit();
        Intent picked = new Intent().setData(photo).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        Settings.externalMediaResult(1112, Activity.RESULT_OK, picked);
        assertEquals("image/jpeg", picked.getType());
        assertEquals(photo, picked.getData());
        assertTrue("The read grant stays on the result", (picked.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0);
        Intent video = new Intent().setData(Uri.parse("content://" + authority + "/video/8"));
        Settings.externalMediaResult(1112, Activity.RESULT_OK, video);
        assertEquals("video/mp4", video.getType());

        // A type the app sent, another request, a cancel and a file path stay as they are.
        Intent typed = new Intent().setDataAndType(photo, "image/png");
        Settings.externalMediaResult(1112, Activity.RESULT_OK, typed);
        assertEquals("image/png", typed.getType());
        Intent camera = new Intent().setData(photo);
        Settings.externalMediaResult(7376, Activity.RESULT_OK, camera);
        assertNull(camera.getType());
        Intent cancelled = new Intent().setData(photo);
        Settings.externalMediaResult(1112, Activity.RESULT_CANCELED, cancelled);
        assertNull(cancelled.getType());
        Intent file = new Intent().setData(Uri.parse("file:///sdcard/DCIM/a.jpg"));
        Settings.externalMediaResult(1112, Activity.RESULT_OK, file);
        assertNull(file.getType());
        Settings.externalMediaResult(1112, Activity.RESULT_OK, null);

        Settings.preferences.edit().putBoolean("paused", true).commit();
        Intent paused = new Intent().setData(photo);
        Settings.externalMediaResult(1112, Activity.RESULT_OK, paused);
        assertNull("Pause leaves it to Messenger", paused.getType());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void onlyThePickScreenGetsThePickedPhotoRequestCode() {
        Intent someoneElses = new Intent(Intent.ACTION_PICK).setType("image/*");
        assertFalse(GalleryPicker.isPick(app, someoneElses));
        assertEquals(7376, Settings.cameraRequestCode(someoneElses, 7376));
        Intent copied = new Intent().setClassName("com.facebook.orca.other", GalleryActivity.class.getName());
        assertFalse(GalleryPicker.isPick(app, copied));
        assertFalse(GalleryPicker.isPick(app, null));
        assertFalse(GalleryPicker.isPick(null, new Intent().setClassName(app, GalleryActivity.class.getName())));
        assertEquals(7376, Settings.cameraRequestCode(null, 7376));
    }

    @Test public void thePickScreenHandsWhatThePersonPickedBackToTheChatWithItsTypeAndReadGrant() {
        installGallery();
        String authority = "com.example.gallery.picked";
        Robolectric.setupContentProvider(PickedProvider.class, authority);
        for (String path : new String[] {"/image/7", "/video/8"}) {
            Uri item = Uri.parse("content://" + authority + path);
            try (ActivityController<GalleryActivity> controller = Robolectric.buildActivity(GalleryActivity.class).setup()) {
                ShadowActivity screen = shadowOf(controller.get());
                Intent pick = screen.getNextStartedActivityForResult().intent;
                assertEquals(Intent.ACTION_PICK, pick.getAction());
                assertEquals(Arrays.asList("image/*", "video/*"), Arrays.asList(pick.getStringArrayExtra(Intent.EXTRA_MIME_TYPES)));
                screen.receiveResult(pick, Activity.RESULT_OK, new Intent().setData(item).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION));
                assertTrue(controller.get().isFinishing());
                assertEquals(Activity.RESULT_OK, screen.getResultCode());
                Intent result = screen.getResultIntent();
                assertEquals(item, result.getData());
                assertEquals(path.startsWith("/video") ? "video/mp4" : "image/jpeg", result.getType());
                // The chat gets its own read grant, so the photo still opens after this screen is gone.
                assertNotEquals(0, result.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
            }
        }
        // A type the gallery app sent stays.
        Uri photo = Uri.parse("content://" + authority + "/image/9");
        Intent typed = GalleryPicker.handBack(app, new Intent().setDataAndType(photo, "image/png"));
        assertEquals("image/png", typed.getType());
        assertNull(GalleryPicker.handBack(app, new Intent()));
        assertNull(GalleryPicker.handBack(app, null));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aCancelledPickLeavesTheChatAsItWas() {
        installGallery();
        try (ActivityController<GalleryActivity> controller = Robolectric.buildActivity(GalleryActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            Intent pick = screen.getNextStartedActivityForResult().intent;
            screen.receiveResult(pick, Activity.RESULT_CANCELED, null);
            assertTrue(controller.get().isFinishing());
            assertEquals(Activity.RESULT_CANCELED, screen.getResultCode());
            assertNull(screen.getResultIntent());
        }
        // A gallery app that says OK but hands nothing back is a cancel too.
        try (ActivityController<GalleryActivity> controller = Robolectric.buildActivity(GalleryActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            screen.receiveResult(screen.getNextStartedActivityForResult().intent, Activity.RESULT_OK, new Intent());
            assertEquals(Activity.RESULT_CANCELED, screen.getResultCode());
        }
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void withTheGalleryAppGoneThePickScreenSaysSoAndCloses() {
        try (ActivityController<GalleryActivity> controller = Robolectric.buildActivity(GalleryActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            assertNull(screen.getNextStartedActivityForResult());
            assertTrue(controller.get().isFinishing());
            assertEquals(Activity.RESULT_CANCELED, screen.getResultCode());
            assertEquals(new SettingsText(app).get("gallery_missing"), ShadowToast.getTextOfLatestToast());
        }
    }

    /** #64 and #82: the gallery app lets the person pick several photos and videos at once, in either pick. */
    @Test public void bothPicksLetThePersonTakeSeveralItems() {
        ResolveInfo gallery = installGallery();
        assertTrue(GalleryPicker.pickIntent(app).getBooleanExtra(Intent.EXTRA_ALLOW_MULTIPLE, false));
        shadowOf(app.getPackageManager()).addResolveInfoForIntent(
            new Intent(Intent.ACTION_PICK).setType("*/*").setPackage("com.example.gallery"), gallery);
        Intent anyType = GalleryPicker.pickIntent(app);
        assertEquals("*/*", anyType.getType());
        assertTrue(anyType.getBooleanExtra(Intent.EXTRA_ALLOW_MULTIPLE, false));
    }

    private static android.content.ClipData clipOf(Uri... items) {
        android.content.ClipData clip = android.content.ClipData.newRawUri("picked", items[0]);
        for (int i = 1; i < items.length; i++) clip.addItem(new android.content.ClipData.Item(items[i]));
        return clip;
    }

    private static Intent withClip(Intent intent, Uri... items) {
        intent.setClipData(clipOf(items));
        return intent;
    }

    private static java.util.List<Uri> urisOf(android.content.ClipData clip) {
        java.util.List<Uri> uris = new java.util.ArrayList<>();
        for (int i = 0; i < clip.getItemCount(); i++) uris.add(clip.getItemAt(i).getUri());
        return uris;
    }

    @Test public void severalPickedItemsComeBackTogetherMarkedWithTheFirstAsTheResult() {
        String authority = "com.example.gallery.picked";
        Robolectric.setupContentProvider(PickedProvider.class, authority);
        Uri photo = Uri.parse("content://" + authority + "/image/7"), video = Uri.parse("content://" + authority + "/video/8");
        // Samsung's Gallery sends a pick of several in the clip alone, and some apps put the first in the data too.
        for (Intent picked : new Intent[] {new Intent(), new Intent().setData(photo)}) {
            picked.setClipData(clipOf(photo, video));
            Intent result = GalleryPicker.handBack(app, picked);
            assertEquals(photo, result.getData());
            assertEquals("image/jpeg", result.getType());
            assertEquals(Arrays.asList(photo, video), urisOf(result.getClipData()));
            assertEquals(Arrays.asList("image/jpeg", "video/mp4"),
                Arrays.asList(result.getClipData().getDescription().getMimeType(0), result.getClipData().getDescription().getMimeType(1)));
            assertTrue(result.getBooleanExtra(GalleryPicker.ITEMS_MARK, false));
            assertNotEquals(0, result.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
        }
        // One item in the clip alone is an ordinary pick, so Messenger's editor opens it as before.
        Intent single = GalleryPicker.handBack(app, withClip(new Intent(), video));
        assertEquals(video, single.getData());
        assertEquals("video/mp4", single.getType());
        assertNull(single.getClipData());
        assertFalse(single.hasExtra(GalleryPicker.ITEMS_MARK));
        // The same item twice is one item.
        Intent twice = GalleryPicker.handBack(app, withClip(new Intent().setData(photo), photo));
        assertNull(twice.getClipData());
        assertFalse(twice.hasExtra(GalleryPicker.ITEMS_MARK));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Google Photos, and the phone's MediaStore, which know a video or a song from its path. */
    public static class PhotosProvider extends PickedProvider {
        @Override public String getType(Uri uri) {
            String path = uri.getPath();
            return path.startsWith("/external/audio/") ? "audio/mpeg" : path.contains("/video/") ? "video/mp4" : "image/jpeg";
        }
    }

    /** Photos wraps a photo or video already on the phone around its MediaStore URI, and Messenger gets that one (#103). */
    @Test public void aGooglePhotosPickOfSomethingOnThePhoneComesBackAsItsMediaStoreItem() {
        Robolectric.setupContentProvider(PhotosProvider.class, GalleryPicker.PHOTOS_PROVIDER);
        Robolectric.setupContentProvider(PhotosProvider.class, "media");
        String photos = "content://" + GalleryPicker.PHOTOS_PROVIDER + "/-1/2/";
        Uri video = Uri.parse(photos + "content%3A%2F%2Fmedia%2Fexternal%2Fvideo%2Fmedia%2F2017/ORIGINAL/NONE/video%2Fmp4/94870622");
        Uri photo = Uri.parse(photos + "content%3A%2F%2Fmedia%2Fexternal%2Fimages%2Fmedia%2F2018/ORIGINAL/NONE/image%2Fjpeg/94870623");
        Uri videoOnPhone = Uri.parse("content://media/external/video/media/2017");
        Uri photoOnPhone = Uri.parse("content://media/external/images/media/2018");
        // The type comes from the phone's item, not from what Photos said about its own URI.
        Intent one = GalleryPicker.handBack(app, new Intent().setDataAndType(video, "video/webm"));
        assertEquals(videoOnPhone, one.getData());
        assertEquals("video/mp4", one.getType());
        assertNotEquals(0, one.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
        // The first item in the data and again in the clip is still one item.
        Intent several = GalleryPicker.handBack(app, withClip(new Intent().setData(video), video, photo));
        assertEquals(videoOnPhone, several.getData());
        assertEquals("video/mp4", several.getType());
        assertEquals(Arrays.asList(videoOnPhone, photoOnPhone), urisOf(several.getClipData()));
        assertEquals("image/jpeg", several.getClipData().getDescription().getMimeType(1));
        assertTrue(several.getBooleanExtra(GalleryPicker.ITEMS_MARK, false));

        // A cloud-only item has nothing on the phone, and one Messenger can't open itself keeps Photos' grant.
        Uri cloud = Uri.parse(photos + "mediakey%3A%2Flocal%253A9f1c/ORIGINAL/NONE/image%2Fjpeg/94870624");
        Uri unreadable = Uri.parse(photos + "content%3A%2F%2Fmedia%2Fexternal%2Fimages%2Fmedia%2Frevoked/ORIGINAL/NONE/image%2Fjpeg/94870625");
        for (Uri kept : new Uri[] {cloud, unreadable}) assertEquals(kept, GalleryPicker.handBack(app, new Intent().setData(kept)).getData());
        // Nor is anything the phone doesn't list as a photo or video.
        Uri song = Uri.parse(photos + "content%3A%2F%2Fmedia%2Fexternal%2Faudio%2Fmedia%2F2019/ORIGINAL/NONE/image%2Fjpeg/94870626");
        assertEquals(song, GalleryPicker.onPhone(app, song));
        // Only Photos' own URIs are unwrapped.
        String authority = "com.example.gallery.picked";
        Robolectric.setupContentProvider(PickedProvider.class, authority);
        Uri other = Uri.parse("content://" + authority + "/content%3A%2F%2Fmedia%2Fexternal%2Fimages%2Fmedia%2F2018");
        assertEquals(other, GalleryPicker.handBack(app, new Intent().setData(other)).getData());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void thePickScreenHandsSeveralItemsBackToTheChat() {
        installGallery();
        String authority = "com.example.gallery.picked";
        Robolectric.setupContentProvider(PickedProvider.class, authority);
        Uri photo = Uri.parse("content://" + authority + "/image/7"), video = Uri.parse("content://" + authority + "/video/8");
        try (ActivityController<GalleryActivity> controller = Robolectric.buildActivity(GalleryActivity.class).setup()) {
            ShadowActivity screen = shadowOf(controller.get());
            Intent pick = screen.getNextStartedActivityForResult().intent;
            screen.receiveResult(pick, Activity.RESULT_OK, withClip(new Intent(), photo, video).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION));
            assertEquals(Activity.RESULT_OK, screen.getResultCode());
            Intent result = screen.getResultIntent();
            assertEquals(photo, result.getData());
            assertEquals(Arrays.asList(photo, video), urisOf(result.getClipData()));
            assertTrue(result.getBooleanExtra(GalleryPicker.ITEMS_MARK, false));
            assertNotEquals(0, result.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
        }
    }

    /** The chat's photo handler with a marked pick of several: Messenger's Send to sheet, with the chat on top. */
    @Test public void aPickOfSeveralGoesToTheSendToSheetWithTheChatOnTop() {
        String authority = "com.example.gallery.picked";
        Robolectric.setupContentProvider(PickedProvider.class, authority);
        Uri photo = Uri.parse("content://" + authority + "/image/7"), video = Uri.parse("content://" + authority + "/video/8");
        Uri png = Uri.parse("content://" + authority + "/image/9");
        Uri thread = Uri.parse("thread://100000000000042");
        var started = shadowOf(app);
        Intent mixed = GalleryPicker.handBack(app, withClip(new Intent(), photo, video));
        assertFalse("Off leaves the pick to Messenger", Settings.galleryItems(thread, mixed));
        assertNull(started.getNextStartedActivity());

        Settings.preferences.edit().putBoolean(GalleryPicker.KEY, true).commit();
        assertTrue(Settings.galleryItems(thread, mixed));
        assertTrue(Settings.lastActive(GalleryPicker.KEY) > 0);
        Intent send = started.getNextStartedActivity();
        assertEquals(new ComponentName(app.getPackageName(), GalleryPicker.SHARE_HANDLER), send.getComponent());
        assertEquals(Intent.ACTION_SEND_MULTIPLE, send.getAction());
        assertEquals("*/*", send.getType());
        assertEquals(Arrays.asList(photo, video), send.getParcelableArrayListExtra(Intent.EXTRA_STREAM));
        assertEquals(Arrays.asList(photo, video), urisOf(send.getClipData()));
        assertEquals(Arrays.asList(thread), send.getParcelableArrayListExtra(GalleryPicker.SHARE_TARGETS));
        int flags = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_ACTIVITY_NEW_TASK;
        assertEquals(flags, send.getFlags() & flags);
        // Messenger's second caller with the same result takes it without a second sheet.
        assertTrue(Settings.galleryItems(thread, mixed));
        assertNull(started.getNextStartedActivity());

        // All photos is a photo share, and a thread that can't ride along leaves the sheet without a pinned chat.
        for (Object noPin : new Object[] {null, "100000000000042"}) {
            Intent photos = GalleryPicker.handBack(app, withClip(new Intent(), photo, png));
            assertTrue(Settings.galleryItems(noPin, photos));
            Intent unpinned = started.getNextStartedActivity();
            assertEquals("image/*", unpinned.getType());
            assertFalse(unpinned.hasExtra(GalleryPicker.SHARE_TARGETS));
        }

        // One item, an unmarked clip, a cancel and Pause stay with Messenger's editor.
        Intent single = GalleryPicker.handBack(app, new Intent().setData(photo));
        Intent unmarked = withClip(new Intent().setData(photo), photo, video);
        for (Intent stock : new Intent[] {single, unmarked, null}) {
            assertFalse(Settings.galleryItems(thread, stock));
            assertNull(started.getNextStartedActivity());
        }
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse("Pause leaves the pick to Messenger", Settings.galleryItems(thread, mixed));
        assertNull(started.getNextStartedActivity());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** #101: each picked item comes apart as its own one-item result, with the type the pick screen read for it. */
    @Test public void aPickComesApartIntoOneResultPerItemWithItsOwnType() {
        String authority = "com.example.gallery.picked";
        Robolectric.setupContentProvider(PickedProvider.class, authority);
        Uri photo = Uri.parse("content://" + authority + "/image/7"), video = Uri.parse("content://" + authority + "/video/8");
        Uri png = Uri.parse("content://" + authority + "/image/9");
        Intent mixed = GalleryPicker.handBack(app, withClip(new Intent(), photo, video, png));
        assertArrayEquals(new String[] {"image/jpeg", "video/mp4", "image/jpeg"}, mixed.getStringArrayExtra(GalleryPicker.ITEM_TYPES));
        Intent[] items = GalleryPicker.chatItems(mixed);
        assertEquals(3, items.length);
        java.util.List<Uri> uris = new java.util.ArrayList<>();
        java.util.List<String> types = new java.util.ArrayList<>();
        for (Intent item : items) {
            uris.add(item.getData());
            types.add(item.getType());
            assertNull(item.getClipData());
            assertFalse(item.hasExtra(GalleryPicker.ITEMS_MARK));
            assertTrue(item.getBooleanExtra(GalleryPicker.ONE_ITEM, false));
            assertTrue(item.getBooleanExtra(GalleryPicker.RESULT_PREPARED, false));
            assertNotEquals(0, item.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
        }
        assertEquals(Arrays.asList(photo, video, png), uris);
        assertEquals(Arrays.asList("image/jpeg", "video/mp4", "image/jpeg"), types);

        // One item, or a clip the pick screen didn't mark, is the one item in the data.
        Intent single = GalleryPicker.handBack(app, new Intent().setData(video));
        assertNull(single.getStringArrayExtra(GalleryPicker.ITEM_TYPES));
        Intent unmarked = withClip(new Intent().setDataAndType(photo, "image/jpeg"), photo, video);
        for (Intent one : new Intent[] {single, unmarked}) {
            Intent[] split = GalleryPicker.chatItems(one);
            assertEquals(1, split.length);
            assertEquals(one.getData(), split[0].getData());
            assertEquals(one.getType(), split[0].getType());
            assertTrue(split[0].getBooleanExtra(GalleryPicker.ONE_ITEM, false));
        }
        // A marked pick missing its type list still splits, and each item's type is left for the chat to read.
        mixed.removeExtra(GalleryPicker.ITEM_TYPES);
        for (Intent item : GalleryPicker.chatItems(mixed)) assertNull(item.getType());
    }

    /** #101: with Put gallery picks in the chat on, the chat's photo handler runs once per item instead of opening the Send to sheet. */
    @Test public void withPutInTheChatOnThePickGoesToTheChatsTrayNotTheSendToSheet() {
        String authority = "com.example.gallery.picked";
        Robolectric.setupContentProvider(PickedProvider.class, authority);
        Uri photo = Uri.parse("content://" + authority + "/image/7"), video = Uri.parse("content://" + authority + "/video/8");
        Uri thread = Uri.parse("thread://100000000000042");
        var started = shadowOf(app);
        Intent mixed = GalleryPicker.handBack(app, withClip(new Intent(), photo, video));
        assertNull("Off leaves the pick to Messenger", Settings.galleryToChat(mixed));

        // Without the gallery switch there's no pick screen to come back from, so the chat switch alone does nothing.
        Settings.preferences.edit().putBoolean(GalleryPicker.CHAT_KEY, true).commit();
        assertNull(Settings.galleryToChat(mixed));
        Settings.preferences.edit().putBoolean(GalleryPicker.CHAT_KEY, false).putBoolean(GalleryPicker.KEY, true).commit();
        assertNull("The gallery switch alone keeps the Send to sheet", Settings.galleryToChat(mixed));
        assertEquals(0, Settings.lastActive(GalleryPicker.CHAT_KEY));

        Settings.preferences.edit().putBoolean(GalleryPicker.CHAT_KEY, true).commit();
        // A chat built before the switch went on has no tray, so its pick keeps the Send to sheet.
        assertNull(Settings.galleryToChat(mixed));
        assertTrue(Settings.galleryItems(thread, mixed));
        assertEquals(Intent.ACTION_SEND_MULTIPLE, started.getNextStartedActivity().getAction());
        mixed = GalleryPicker.handBack(app, withClip(new Intent(), photo, video));
        assertTrue("The chat opened again builds the tray", Settings.galleryTray(false));
        assertFalse("The Send to sheet steps aside", Settings.galleryItems(thread, mixed));
        assertNull(started.getNextStartedActivity());
        Intent[] items = Settings.galleryToChat(mixed);
        assertEquals(2, items.length);
        assertEquals(Arrays.asList(photo, video), Arrays.asList(items[0].getData(), items[1].getData()));
        assertTrue(Settings.lastActive(GalleryPicker.CHAT_KEY) > 0);
        assertTrue(mixed.getBooleanExtra(GalleryPicker.IN_CHAT, false));
        // Messenger's second caller with the same pick runs the handler on nothing, so nothing lands twice.
        assertEquals(0, Settings.galleryToChat(mixed).length);
        // Each item the handler then runs on is left to the handler, and its copy goes in the tray, not the editor.
        Object media = new Object();
        for (Intent item : items) {
            assertNull(Settings.galleryToChat(item));
            assertFalse(Settings.galleryItems(thread, item));
            assertEquals(java.util.Collections.singletonList(media), Settings.galleryChatItem(item, media));
            assertNull("An item the chat couldn't copy opens nothing", Settings.galleryChatItem(item, null));
        }
        assertNull("A pick that wasn't split keeps Messenger's editor", Settings.galleryChatItem(mixed, media));
        assertNull(Settings.galleryChatItem(new Intent().setData(photo), media));
        assertNull(Settings.galleryChatItem(null, media));

        // One item goes to the tray too, as a single run.
        Intent single = GalleryPicker.handBack(app, new Intent().setData(photo));
        Intent[] one = Settings.galleryToChat(single);
        assertEquals(1, one.length);
        assertEquals(photo, one[0].getData());
        assertEquals("image/jpeg", one[0].getType());
        // A photo from another app's share or Messenger's own gallery isn't the pick screen's, and nothing is no pick.
        assertNull(Settings.galleryToChat(new Intent().setDataAndType(photo, "image/jpeg")));
        assertNull(Settings.galleryToChat(new Intent().putExtra(GalleryPicker.RESULT_PREPARED, true)));
        assertNull(Settings.galleryToChat(null));

        Settings.preferences.edit().putBoolean("paused", true).commit();
        Intent paused = GalleryPicker.handBack(app, withClip(new Intent(), photo, video));
        assertNull("Pause leaves the pick to Messenger", Settings.galleryToChat(paused));
        assertFalse(paused.hasExtra(GalleryPicker.IN_CHAT));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** #101: the chat's tray, which the server leaves off for some accounts, is on while both switches are. */
    @Test public void bothSwitchesOnGiveTheChatMessengersTray() {
        assertFalse("Off keeps the server's answer", Settings.galleryTray(false));
        assertTrue(Settings.galleryTray(true));
        assertTrue(Settings.chatTray);
        Settings.preferences.edit().putBoolean(GalleryPicker.CHAT_KEY, true).commit();
        assertFalse("The chat switch needs the gallery switch", Settings.galleryTray(false));
        assertFalse(Settings.chatTray);
        assertEquals(0, Settings.lastActive(GalleryPicker.CHAT_KEY));
        Settings.preferences.edit().putBoolean(GalleryPicker.KEY, true).commit();
        assertTrue(Settings.galleryTray(false));
        assertTrue(Settings.chatTray);
        assertTrue(Settings.lastActive(GalleryPicker.CHAT_KEY) > 0);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse("Pause keeps the server's answer", Settings.galleryTray(false));
        assertTrue(Settings.galleryTray(true));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void putInTheChatNeedsThePickScreenLikeTheGallerySwitch() {
        assertFalse(Settings.available(GalleryPicker.CHAT_KEY));
        installGallery();
        assertTrue(Settings.available(GalleryPicker.CHAT_KEY));
    }
}
