package app.hushmessenger.extension;

import android.app.Dialog;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.widget.EditText;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.function.BooleanSupplier;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowLog;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36}, qualifiers = "en-rUS-w390dp-h844dp-mdpi")
public class AutoReplyPictureTest {
    private static final String CHAT = "ADVANCED_CRYPTO_ONE_TO_ONE:410775001";
    private static final String REPLY_ACTION = "app.hushmessenger.test.REPLY";
    private static final String PICTURE = "PIC_1700000000000.jpg";
    private final List<Runnable> queued = new ArrayList<>();
    private final List<Long> delays = new ArrayList<>();
    /** What the swapped sender was handed, one "thread uri" line per send. */
    private final List<String> pictures = new ArrayList<>();
    private AutoReply.Scheduler realScheduler;
    private AutoReplyPicture.Sender realSender;
    private BooleanSupplier realBridge;
    private AutoReplyPicture.Messenger realMessenger;
    private java.util.concurrent.Executor realCopies;
    private final List<Runnable> imports = new ArrayList<>();
    private Context context;
    private NotificationManager manager;

    @Before public void reset() {
        context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        realScheduler = AutoReply.scheduler;
        AutoReply.scheduler = (task, delayMs) -> {
            queued.add(task);
            delays.add(delayMs);
        };
        AutoReply.forgetQueued();
        AutoReply.clock = () -> 1_000_000;
        realSender = AutoReplyPicture.sender;
        realBridge = AutoReplyPicture.bridge;
        realMessenger = AutoReplyPicture.messenger;
        realCopies = AutoReplyPicture.copies;
        AutoReplyPicture.copies = imports::add;
        AutoReplyPicture.sender = (ctx, thread, picture, wanted) -> {
            pictures.add(thread + " " + picture);
            return null;
        };
        AutoReplyPicture.bridge = () -> true;
        Settings.preferences.edit().putBoolean(AutoReply.KEY, true).commit();
        manager = context.getSystemService(NotificationManager.class);
    }

    @After public void tidy() throws IOException {
        Dialog dialog = ShadowDialog.getLatestDialog();
        if (dialog != null && dialog.isShowing()) dialog.dismiss();
        manager.cancelAll();
        AutoReply.scheduler = realScheduler;
        AutoReply.clock = android.os.SystemClock::elapsedRealtime;
        AutoReply.forgetQueued();
        AutoReplyPicture.sender = realSender;
        AutoReplyPicture.bridge = realBridge;
        AutoReplyPicture.messenger = realMessenger;
        AutoReplyPicture.copies = realCopies;
        File[] left = AutoReplyPicture.directory(context).listFiles();
        if (left != null) for (File file : left) Files.deleteIfExists(file.toPath());
    }

    private void runQueued() {
        List<Runnable> due = new ArrayList<>(queued);
        queued.clear();
        delays.clear();
        for (Runnable task : due) task.run();
    }

    /** A chat notification with a Reply action, tagged with the chat's key the way Messenger posts it. */
    private void notification(String thread) {
        RemoteInput input = new RemoteInput.Builder("reply_text").setLabel("Reply").build();
        PendingIntent intent = PendingIntent.getBroadcast(context, 0, new Intent(REPLY_ACTION),
            PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_MUTABLE);
        Notification.Action reply = new Notification.Action.Builder(null, "Reply", intent).addRemoteInput(input).build();
        manager.notify(thread, thread.hashCode(), new Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle("Ana").addAction(reply).build());
    }

    /** What the Reply action received, or null when nothing was sent. */
    private String sent() {
        String text = null;
        for (Intent intent : shadowOf(RuntimeEnvironment.getApplication()).getBroadcastIntents()) {
            if (!REPLY_ACTION.equals(intent.getAction())) continue;
            Bundle results = RemoteInput.getResultsFromIntent(intent);
            text = results == null ? null : String.valueOf(results.getCharSequence("reply_text"));
        }
        return text;
    }

    /** A saved picture file. Its bytes only matter where something decodes it. */
    private File savedFile(String name) throws IOException {
        File file = new File(AutoReplyPicture.directory(context), name);
        assertTrue(file.getParentFile().isDirectory() || file.getParentFile().mkdirs());
        Files.write(file.toPath(), new byte[] {1, 2, 3});
        return file;
    }

    /** A real picture, for the tests that decode one. */
    private File picture(File file, int width, int height, Bitmap.CompressFormat format) throws IOException {
        assertTrue(file.getParentFile().isDirectory() || file.getParentFile().mkdirs());
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        bitmap.eraseColor(Color.rgb(200, 40, 90));
        try (FileOutputStream output = new FileOutputStream(file)) {
            assertTrue(bitmap.compress(format, 90, output));
        }
        bitmap.recycle();
        return file;
    }

    /**
     * A picture's size and type. Robolectric's native decodeFile leaves the file open on Windows, so this reads through
     * a stream it closes, the way the app does.
     */
    private static BitmapFactory.Options bounds(File file) throws IOException {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        try (java.io.InputStream input = new java.io.FileInputStream(file)) {
            BitmapFactory.decodeStream(input, null, bounds);
        }
        return bounds;
    }

    private void reply(String picture) {
        AutoReply.save(Settings.preferences, List.of(new AutoReply.Rule("", "Away", picture)), false);
    }

    /** Whether HushMessenger logged [line] as a warning. */
    private static boolean logged(String line) {
        for (ShadowLog.LogItem item : ShadowLog.getLogsForTag("HushMessenger")) {
            if (item.type == android.util.Log.WARN && line.equals(item.msg)) return true;
        }
        return false;
    }

    /**
     * Stands in for Messenger's factory and send. The factory runs [whileBuilding], then builds one message naming the
     * chat and file, and the send keeps what it was handed in [posted].
     */
    private static AutoReplyPicture.Messenger messenger(List<Object> posted, Runnable whileBuilding) {
        return new AutoReplyPicture.Messenger() {
            @Override public Object build(Context ctx, String thread, Uri picture) {
                whileBuilding.run();
                return CompletableFuture.completedFuture(List.of(thread + " " + picture));
            }

            @Override public Object send(Object message) {
                posted.add(message);
                return CompletableFuture.completedFuture(null);
            }
        };
    }

    @Test public void aReplyKeepsItsPictureAndOnlyNamesThisAppWrites() {
        AutoReply.save(Settings.preferences, List.of(new AutoReply.Rule("hi", "Hey", PICTURE),
            new AutoReply.Rule("lunch", "At noon", "../shared_prefs/hushmessenger.xml"),
            new AutoReply.Rule("later", "Soon", "PIC_1.png"), new AutoReply.Rule("bye", "Bye")), false);
        List<AutoReply.Rule> rules = AutoReply.rules(Settings.preferences);
        assertEquals(PICTURE, rules.get(0).picture);
        assertNull(rules.get(1).picture);
        assertNull(rules.get(2).picture);
        assertNull(rules.get(3).picture);
        String json = Settings.preferences.getString(AutoReply.RULES, "");
        assertTrue(json.contains("\"picture\":\"" + PICTURE + "\""));
        assertFalse(json.contains("shared_prefs"));
        // A value edited by hand to point somewhere else reads as no picture.
        Settings.preferences.edit().putString(AutoReply.RULES, "[{\"when\":\"\",\"reply\":\"Away\",\"picture\":\"../x.jpg\"}]").commit();
        assertNull(AutoReply.rules(Settings.preferences).get(0).picture);
    }

    @Test public void thePictureFollowsTheTextOnceThroughTheSender() throws IOException {
        File file = savedFile(PICTURE);
        reply(PICTURE);
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        assertEquals("Away", sent());
        assertTrue(pictures.isEmpty());
        assertEquals(List.of(AutoReply.PICTURE_DELAY_MS), delays);
        runQueued();
        assertEquals(List.of(CHAT + " " + Uri.fromFile(file)), pictures);
        assertTrue(queued.isEmpty());
        assertEquals(0, AutoReply.pending());
    }

    @Test public void aReplyWithoutAPictureQueuesNothingAfterItsText() {
        reply(null);
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        assertEquals("Away", sent());
        assertTrue(queued.isEmpty());
    }

    @Test public void aMissingPictureStillSendsTheText() {
        reply(PICTURE);
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        assertEquals(List.of(AutoReply.PICTURE_DELAY_MS), delays);
        runQueued();
        assertEquals("Away", sent());
        assertTrue(pictures.isEmpty());
        assertTrue(logged("auto_reply: sent the text without the picture, the picture file is gone"));
        assertEquals("the picture file is gone", AutoReplyPicture.send(context, CHAT, PICTURE, () -> true));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aBuildWithoutTheMediaSendSendsTheTextAlone() throws IOException {
        savedFile(PICTURE);
        AutoReplyPicture.bridge = () -> false;
        reply(PICTURE);
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        assertEquals(List.of(AutoReply.PICTURE_DELAY_MS), delays);
        runQueued();
        assertEquals("Away", sent());
        assertTrue(pictures.isEmpty());
        assertTrue(logged("auto_reply: sent the text without the picture, this Messenger's media send didn't match"));
        boolean preview = Settings.preview;
        try {
            Settings.preview = false;
            assertFalse(AutoReplyPicture.supported());
            AutoReplyPicture.bridge = () -> true;
            assertTrue(AutoReplyPicture.supported());
        } finally {
            Settings.preview = preview;
        }
    }

    /** The switch going off and on, or Pause, between the text and the picture drops the picture. */
    @Test public void aChangeAfterTheTextDropsThePicture() throws IOException {
        savedFile(PICTURE);
        reply(PICTURE);
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        assertEquals("Away", sent());
        assertEquals(List.of(AutoReply.PICTURE_DELAY_MS), delays);
        Settings.preferences.edit().putBoolean(AutoReply.KEY, false).commit();
        Settings.preferences.edit().putBoolean(AutoReply.KEY, true).commit();
        runQueued();
        assertTrue(pictures.isEmpty());

        AutoReply.forgetQueued();
        notification(CHAT);
        AutoReply.received("hello again", CHAT, "mid.2");
        runQueued();
        assertEquals(List.of(AutoReply.PICTURE_DELAY_MS), delays);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        runQueued();
        assertTrue(pictures.isEmpty());
    }

    /** The real send hands each message Messenger's factory built to Messenger's own send. */
    @Test public void thePictureGoesThroughMessengersOwnSend() throws IOException {
        File file = savedFile(PICTURE);
        List<Object> posted = new ArrayList<>();
        AutoReplyPicture.sender = realSender;
        AutoReplyPicture.messenger = messenger(posted, () -> { });
        reply(PICTURE);
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        runQueued();
        assertEquals("Away", sent());
        assertEquals(List.of(CHAT + " " + Uri.fromFile(file)), posted);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Building can take seconds, so turning replies off in the meantime stops the picture before Messenger's send. */
    @Test public void turningRepliesOffWhileThePictureIsBuiltSendsNothing() throws IOException {
        savedFile(PICTURE);
        List<Object> posted = new ArrayList<>();
        AutoReplyPicture.sender = realSender;
        AutoReplyPicture.messenger = messenger(posted, () -> Settings.preferences.edit().putBoolean(AutoReply.KEY, false).commit());
        reply(PICTURE);
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        runQueued();
        assertEquals("Away", sent());
        assertTrue(posted.isEmpty());
        assertTrue(logged("auto_reply: sent the text without the picture, the auto reply changed or went off before the picture went"));
    }

    @Test public void aSenderThatFailsCostsOnlyThePicture() throws IOException {
        savedFile(PICTURE);
        AutoReplyPicture.sender = (ctx, thread, picture, wanted) -> { throw new IllegalStateException("/data/user/0/secret " + thread); };
        String why = AutoReplyPicture.send(context, CHAT, PICTURE, () -> true);
        assertEquals("sending failed with java.lang.IllegalStateException", why);
        assertEquals("the picture's name isn't one this app wrote", AutoReplyPicture.send(context, CHAT, "../" + PICTURE, () -> true));
        assertEquals("the picture's name isn't one this app wrote", AutoReplyPicture.send(context, CHAT, null, () -> true));
    }

    /** An unpatched extension has no media factory, so the real send says so instead of throwing. */
    @Test public void anUnpatchedBuildCantBuildThePictureMessage() throws IOException {
        File file = savedFile(PICTURE);
        assertEquals("Messenger didn't build the picture message",
            AutoReplyPicture.throughMessenger(context, CHAT, Uri.fromFile(file), () -> true));
    }

    @Test public void theDecodeNeverGoesUnderTheLongSide() {
        assertEquals(1, AutoReplyPicture.sample(100, 100, 2048));
        assertEquals(1, AutoReplyPicture.sample(4095, 10, 2048));
        assertEquals(2, AutoReplyPicture.sample(4096, 10, 2048));
        assertEquals(2, AutoReplyPicture.sample(3000, 5000, 2048));
        assertEquals(4, AutoReplyPicture.sample(9000, 8192, 2048));
    }

    @Test public void pruneKeepsSavedPicturesAndClearsTheRest() throws IOException {
        File kept = savedFile("PIC_1.jpg"), unused = savedFile("PIC_2.jpg"), other = savedFile("notes.txt");
        File stale = savedFile("PIC_99.part"), fresh = savedFile("PIC_98.part");
        assertTrue(stale.setLastModified(System.currentTimeMillis() - AutoReplyPicture.STALE_PARTIAL_MS - 60_000));
        AutoReplyPicture.prune(context, Set.of("PIC_1.jpg"));
        assertTrue(kept.exists());
        assertFalse(unused.exists());
        assertTrue(other.exists());
        assertFalse(stale.exists());
        assertTrue(fresh.exists());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aCopyIsTurnedUprightAndNoBiggerThanTheLimit() throws IOException {
        File source = picture(new File(context.getCacheDir(), "turned.jpg"), 60, 30, Bitmap.CompressFormat.JPEG);
        ExifInterface exif = new ExifInterface(source.getPath());
        exif.setAttribute(ExifInterface.TAG_ORIENTATION, String.valueOf(ExifInterface.ORIENTATION_ROTATE_90));
        exif.saveAttributes();
        String name = AutoReplyPicture.copy(context, Uri.fromFile(source));
        assertTrue(AutoReplyPicture.validName(name));
        BitmapFactory.Options bounds = bounds(AutoReplyPicture.fileFor(context, name));
        assertEquals(30, bounds.outWidth);
        assertEquals(60, bounds.outHeight);

        File wide = picture(new File(context.getCacheDir(), "wide.png"), 4100, 40, Bitmap.CompressFormat.PNG);
        String shrunk = AutoReplyPicture.copy(context, Uri.fromFile(wide));
        assertNotEquals(name, shrunk);
        bounds = bounds(AutoReplyPicture.fileFor(context, shrunk));
        assertEquals(AutoReplyPicture.MAX_EDGE, bounds.outWidth);
        assertEquals("image/jpeg", bounds.outMimeType);
        String[] left = AutoReplyPicture.directory(context).list();
        assertEquals(2, left.length);
        Files.delete(source.toPath());
        Files.delete(wide.toPath());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aFileThatIsntAPictureLeavesNothingBehind() throws IOException {
        File text = new File(context.getCacheDir(), "notes.jpg");
        Files.write(text.toPath(), "not a picture".getBytes(StandardCharsets.UTF_8));
        try {
            AutoReplyPicture.copy(context, Uri.fromFile(text));
            fail("copied a file that isn't a picture");
        } catch (IOException expected) {
            assertEquals("not a picture", expected.getMessage());
        }
        String[] left = AutoReplyPicture.directory(context).list();
        assertTrue(left == null || left.length == 0);
        Files.delete(text.toPath());
    }

    private View openReplies(SettingsActivity activity) {
        activity.getWindow().getDecorView().findViewWithTag("auto_reply_edit").performClick();
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertTrue(dialog.isShowing());
        return dialog.getWindow().getDecorView();
    }

    public static class ImportProvider extends android.content.ContentProvider {
        @Override public boolean onCreate() { return true; }
        @Override public String getType(Uri uri) { return "image/jpeg"; }
        @Override public android.os.ParcelFileDescriptor openFile(Uri uri, String mode) throws java.io.FileNotFoundException {
            return android.os.ParcelFileDescriptor.open(new File(getContext().getCacheDir(), uri.getLastPathSegment()),
                android.os.ParcelFileDescriptor.MODE_READ_ONLY);
        }
        @Override public android.database.Cursor query(Uri uri, String[] columns, String selection, String[] args, String order) { return null; }
        @Override public Uri insert(Uri uri, android.content.ContentValues values) { return null; }
        @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
        @Override public int update(Uri uri, android.content.ContentValues values, String selection, String[] args) { return 0; }
    }

    private Uri importPicture(String name, int width, int height) throws IOException {
        picture(new File(context.getCacheDir(), name), width, height, Bitmap.CompressFormat.JPEG);
        Robolectric.setupContentProvider(ImportProvider.class, "reply.pictures");
        return Uri.parse("content://reply.pictures/" + name);
    }

    private void pick(SettingsActivity activity, View root, Uri uri) {
        root.findViewWithTag("auto_reply_picture_pick").performClick();
        activity.onActivityResult(SettingsActivity.PICK_AUTO_REPLY_PICTURE, android.app.Activity.RESULT_OK, new Intent().setData(uri));
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void anOlderCopyCannotReplaceTheNewerPictureWhileTheEditorStaysOpen() throws IOException {
        reply(null);
        Uri a = importPicture("older.jpg", 40, 80), b = importPicture("newer.jpg", 80, 40);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = openReplies(screen.get());
            pick(screen.get(), root, a);
            pick(screen.get(), root, b);
            imports.get(1).run();
            imports.get(0).run();
            var thumbnail = (android.graphics.drawable.BitmapDrawable)
                ((android.widget.ImageView) root.findViewWithTag("auto_reply_picture_thumb")).getDrawable();
            assertEquals(80, thumbnail.getBitmap().getWidth());
            root.findViewWithTag("auto_reply_save").performClick();
            assertEquals(80, bounds(AutoReplyPicture.fileFor(context, AutoReply.rules(Settings.preferences).get(0).picture)).outWidth);
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theLatestSelectionWinsEvenWhenAnOlderCopyFinishesAfterSave() throws IOException {
        reply(null);
        Uri a = importPicture("a.jpg", 40, 80), b = importPicture("b.jpg", 80, 40);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = openReplies(screen.get());
            pick(screen.get(), root, a);
            assertFalse(root.findViewWithTag("auto_reply_save").isEnabled());
            root.findViewWithTag("auto_reply_save").performClick();
            assertTrue(ShadowDialog.getLatestDialog().isShowing());
            assertNull(AutoReply.rules(Settings.preferences).get(0).picture);
            pick(screen.get(), root, b);
            imports.get(1).run();
            assertTrue(root.findViewWithTag("auto_reply_save").isEnabled());
            root.findViewWithTag("auto_reply_save").performClick();
            String saved = AutoReply.rules(Settings.preferences).get(0).picture;
            assertNotNull(saved);
            assertEquals(80, bounds(AutoReplyPicture.fileFor(context, saved)).outWidth);
            imports.get(0).run();
            assertEquals(saved, AutoReply.rules(Settings.preferences).get(0).picture);
            assertTrue(AutoReplyPicture.fileFor(context, saved).isFile());
            assertEquals(1, AutoReplyPicture.directory(context).listFiles(file -> AutoReplyPicture.validName(file.getName())).length);
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void clearAndRemoveInvalidateAnInFlightSelection() throws IOException {
        Uri source = importPicture("clear.jpg", 80, 40);
        for (String action : new String[] {"auto_reply_picture_clear", "auto_reply_remove"}) {
            reply(null);
            imports.clear();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = openReplies(screen.get());
                pick(screen.get(), root, source);
                assertEquals(View.VISIBLE, root.findViewWithTag("auto_reply_picture_clear").getVisibility());
                root.findViewWithTag(action).performClick();
                assertTrue(((java.util.concurrent.Future<?>) imports.get(0)).isCancelled());
                imports.get(0).run();
                root.findViewWithTag("auto_reply_save").performClick();
                assertTrue(AutoReply.rules(Settings.preferences).stream().noneMatch(rule -> rule.picture != null));
                File[] kept = AutoReplyPicture.directory(context).listFiles(file -> AutoReplyPicture.validName(file.getName()));
                assertTrue(kept == null || kept.length == 0);
            }
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void cancelDiscardsALateCopyAndKeepsPicturesSharedBySavedRules() throws IOException {
        File original = picture(new File(AutoReplyPicture.directory(context), PICTURE), 80, 60, Bitmap.CompressFormat.JPEG);
        AutoReply.save(Settings.preferences, List.of(new AutoReply.Rule("one", "Away", PICTURE),
            new AutoReply.Rule("two", "Away too", PICTURE)), false);
        Uri source = importPicture("cancel.jpg", 40, 80);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = openReplies(screen.get());
            pick(screen.get(), root, source);
            root.findViewWithTag("auto_reply_cancel").performClick();
            imports.get(0).run();
            assertTrue(original.isFile());
            assertEquals(2, AutoReply.rules(Settings.preferences).size());
            assertEquals(1, AutoReplyPicture.directory(context).listFiles(file -> AutoReplyPicture.validName(file.getName())).length);
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void recreationKeepsOnlyTheAcceptedDraftAndDiscardsTheOldPendingCopy() throws IOException {
        reply(null);
        Uri accepted = importPicture("accepted.jpg", 80, 40), pending = importPicture("pending.jpg", 40, 80);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = openReplies(screen.get());
            pick(screen.get(), root, accepted);
            imports.get(0).run();
            pick(screen.get(), root, pending);
            screen.recreate();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertTrue(root.findViewWithTag("auto_reply_save").isEnabled());
            imports.get(1).run();
            root.findViewWithTag("auto_reply_save").performClick();
            File saved = AutoReplyPicture.fileFor(context, AutoReply.rules(Settings.preferences).get(0).picture);
            assertEquals(80, bounds(saved).outWidth);
            assertEquals(1, AutoReplyPicture.directory(context).listFiles(file -> AutoReplyPicture.validName(file.getName())).length);
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aPickerResultCannotMoveToANewCardAtTheRemovedCardsPosition() throws IOException {
        reply(null);
        Uri source = importPicture("removed.jpg", 80, 40);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = openReplies(screen.get());
            root.findViewWithTag("auto_reply_picture_pick").performClick();
            root.findViewWithTag("auto_reply_remove").performClick();
            root.findViewWithTag("auto_reply_add").performClick();
            screen.get().onActivityResult(SettingsActivity.PICK_AUTO_REPLY_PICTURE, android.app.Activity.RESULT_OK, new Intent().setData(source));
            assertTrue(imports.isEmpty());
            assertEquals(View.GONE, root.findViewWithTag("auto_reply_picture_thumb").getVisibility());
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void anOutstandingPickerKeepsItsCardIdentityAcrossRecreation() throws IOException {
        reply(null);
        Uri source = importPicture("recreated.jpg", 80, 40);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = openReplies(screen.get());
            root.findViewWithTag("auto_reply_picture_pick").performClick();
            screen.recreate();
            // Android may return the pick before the posted reply sheet is rebuilt.
            screen.get().onActivityResult(SettingsActivity.PICK_AUTO_REPLY_PICTURE, android.app.Activity.RESULT_OK, new Intent().setData(source));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(1, imports.size());
            imports.get(0).run();
            root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            root.findViewWithTag("auto_reply_save").performClick();
            assertNotNull(AutoReply.rules(Settings.preferences).get(0).picture);
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void concurrentCopiesGetDifferentOwnedFiles() throws Exception {
        File source = picture(new File(context.getCacheDir(), "parallel.jpg"), 40, 40, Bitmap.CompressFormat.JPEG);
        var pool = java.util.concurrent.Executors.newFixedThreadPool(2);
        try {
            java.util.concurrent.CountDownLatch start = new java.util.concurrent.CountDownLatch(1);
            var a = pool.submit(() -> { start.await(); return AutoReplyPicture.copy(context, Uri.fromFile(source)); });
            var b = pool.submit(() -> { start.await(); return AutoReplyPicture.copy(context, Uri.fromFile(source)); });
            start.countDown();
            String first = a.get(5, java.util.concurrent.TimeUnit.SECONDS), second = b.get(5, java.util.concurrent.TimeUnit.SECONDS);
            assertNotEquals(first, second);
            assertTrue(AutoReplyPicture.fileFor(context, first).isFile());
            assertTrue(AutoReplyPicture.fileFor(context, second).isFile());
        } finally { pool.shutdownNow(); }
    }

    private void assertRefused(AutoReplyPicture.Failure.Kind kind, File source, AutoReplyPicture.Import job) throws IOException {
        try {
            AutoReplyPicture.copy(context, Uri.fromFile(source), job);
            fail("copied a picture that should have been refused");
        } catch (AutoReplyPicture.Failure refused) {
            assertEquals(kind, refused.kind);
        }
        String[] left = AutoReplyPicture.directory(context).list();
        assertTrue(left == null || left.length == 0);
        assertEquals(0, AutoReplyPicture.reserved());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aFileOverTheSizeLimitIsRefusedWithoutLeavingASnapshot() throws IOException {
        File big = new File(context.getCacheDir(), "big.jpg");
        try (java.io.RandomAccessFile file = new java.io.RandomAccessFile(big, "rw")) {
            file.setLength(AutoReplyPicture.MAX_SOURCE_BYTES + 1);
        }
        assertRefused(AutoReplyPicture.Failure.Kind.TOO_BIG, big, new AutoReplyPicture.Import());
        Files.delete(big.toPath());
    }

    /** A PNG whose header claims [width] x [height], with one row of pixels behind it. */
    private File claimedPng(String name, int width, int height) throws IOException {
        java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
        out.write(new byte[] {(byte) 0x89, 'P', 'N', 'G', '\r', '\n', 0x1a, '\n'});
        java.nio.ByteBuffer header = java.nio.ByteBuffer.allocate(13).putInt(width).putInt(height).put((byte) 8).put((byte) 6);
        java.util.zip.Deflater deflater = new java.util.zip.Deflater();
        deflater.setInput(new byte[1 + width * 4]);
        deflater.finish();
        byte[] packed = new byte[64 * 1024];
        byte[] pixels = java.util.Arrays.copyOf(packed, deflater.deflate(packed));
        deflater.end();
        for (String type : new String[] {"IHDR", "IDAT", "IEND"}) {
            writeChunk(out, type, type.equals("IHDR") ? header.array() : type.equals("IDAT") ? pixels : new byte[0]);
        }
        File file = new File(context.getCacheDir(), name);
        Files.write(file.toPath(), out.toByteArray());
        return file;
    }

    private static void writeChunk(java.io.ByteArrayOutputStream out, String name, byte[] data) throws IOException {
        byte[] type = name.getBytes(StandardCharsets.US_ASCII);
        java.util.zip.CRC32 crc = new java.util.zip.CRC32();
        crc.update(type);
        crc.update(data);
        out.write(java.nio.ByteBuffer.allocate(4).putInt(data.length).array());
        out.write(type);
        out.write(data);
        out.write(java.nio.ByteBuffer.allocate(4).putInt((int) crc.getValue()).array());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aPictureOverThePixelLimitIsRefusedBeforeDecoding() throws IOException {
        File huge = claimedPng("huge.png", 8001, 8000);
        BitmapFactory.Options bounds = bounds(huge);
        assertEquals("the fixture's header decodes", 8001, bounds.outWidth);
        assertRefused(AutoReplyPicture.Failure.Kind.TOO_BIG, huge, new AutoReplyPicture.Import());
        Files.delete(huge.toPath());
    }

    @Test @Config(sdk = 36)
    public void theDecodeIsSampledDownUntilItAndItsCopyFitTheBudget() throws AutoReplyPicture.Failure {
        // 8000 square at the usual sample of 2 holds 64 MB decoded plus a 2048 square copy, over the 64 MiB budget.
        assertEquals(2, AutoReplyPicture.sample(8000, 8000, AutoReplyPicture.MAX_EDGE));
        assertTrue(AutoReplyPicture.bitmapBytes(8000, 8000, 2, 4, false) > AutoReplyPicture.BITMAP_BUDGET);
        assertEquals(4, AutoReplyPicture.fittingSample(8000, 8000, 4, false));
        assertEquals(2000L * 2000 * 4, AutoReplyPicture.bitmapBytes(8000, 8000, 4, 4, false));
        // Turning always makes a copy, and half-float pictures take eight bytes a pixel.
        assertEquals(2L * 2000 * 2000 * 8, AutoReplyPicture.bitmapBytes(8000, 8000, 4, 8, true));
        assertEquals(30L * 60 * 4, AutoReplyPicture.bitmapBytes(60, 30, 1, 4, false));
        try {
            AutoReplyPicture.bitmapBytes(Integer.MAX_VALUE, Integer.MAX_VALUE, 1, 8, true);
            fail("a huge header wrapped into a small estimate");
        } catch (ArithmeticException expected) {}
    }

    @Test @Config(sdk = 36)
    public void theSharedBudgetMakesALaterCopyWaitAndAStoppedOneGiveUp() throws AutoReplyPicture.Failure {
        AutoReplyPicture.Import first = new AutoReplyPicture.Import();
        AutoReplyPicture.reserve(AutoReplyPicture.BITMAP_BUDGET - 10, first);
        try {
            AutoReplyPicture.Import late = new AutoReplyPicture.Import(-1);
            try {
                AutoReplyPicture.reserve(100, late);
                fail("reserved past the budget");
            } catch (AutoReplyPicture.Failure refused) {
                assertEquals(AutoReplyPicture.Failure.Kind.TOO_SLOW, refused.kind);
            }
            AutoReplyPicture.Import replaced = new AutoReplyPicture.Import();
            replaced.cancel();
            try {
                AutoReplyPicture.reserve(100, replaced);
                fail("a cancelled copy took the budget");
            } catch (AutoReplyPicture.Failure refused) {
                assertEquals(AutoReplyPicture.Failure.Kind.CANCELLED, refused.kind);
            }
            AutoReplyPicture.reserve(10, new AutoReplyPicture.Import());
            AutoReplyPicture.release(10);
        } finally {
            AutoReplyPicture.release(AutoReplyPicture.BITMAP_BUDGET - 10);
        }
        assertEquals(0, AutoReplyPicture.reserved());
        try {
            AutoReplyPicture.reserve(AutoReplyPicture.BITMAP_BUDGET + 1, new AutoReplyPicture.Import());
            fail("reserved more than the whole budget");
        } catch (AutoReplyPicture.Failure refused) {
            assertEquals(AutoReplyPicture.Failure.Kind.TOO_BIG, refused.kind);
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aCancelledOrExpiredCopyIsRefusedWithoutLeavingFiles() throws IOException {
        File source = picture(new File(context.getCacheDir(), "stopped.jpg"), 40, 40, Bitmap.CompressFormat.JPEG);
        AutoReplyPicture.Import cancelled = new AutoReplyPicture.Import();
        cancelled.cancel();
        assertRefused(AutoReplyPicture.Failure.Kind.CANCELLED, source, cancelled);
        assertRefused(AutoReplyPicture.Failure.Kind.TOO_SLOW, source, new AutoReplyPicture.Import(-1));
        Files.delete(source.toPath());
    }

    @Test @Config(sdk = 36)
    public void twoCopiesRunAndTwoWaitAndACancelledOneGivesItsPlaceBack() throws Exception {
        AutoReplyPicture.copies = realCopies;
        java.util.concurrent.CountDownLatch hold = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.CountDownLatch running = new java.util.concurrent.CountDownLatch(AutoReplyPicture.WORKERS);
        Runnable blocked = () -> {
            running.countDown();
            try { hold.await(); } catch (InterruptedException stopped) { Thread.currentThread().interrupt(); }
        };
        List<AutoReplyPicture.Import> jobs = new ArrayList<>();
        try {
            for (int i = 0; i < AutoReplyPicture.WORKERS + AutoReplyPicture.PENDING; i++) {
                AutoReplyPicture.Import job = new AutoReplyPicture.Import();
                AutoReplyPicture.submit(job, blocked);
                jobs.add(job);
            }
            assertTrue(running.await(5, java.util.concurrent.TimeUnit.SECONDS));
            try {
                AutoReplyPicture.submit(new AutoReplyPicture.Import(), blocked);
                fail("a fifth copy was queued");
            } catch (java.util.concurrent.RejectedExecutionException expected) {}
            jobs.get(jobs.size() - 1).cancel();
            AutoReplyPicture.Import next = new AutoReplyPicture.Import();
            AutoReplyPicture.submit(next, blocked);
            jobs.add(next);
        } finally {
            hold.countDown();
            for (AutoReplyPicture.Import job : jobs) job.cancel();
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void pickingAgainCancelsTheCardsEarlierCopy() throws IOException {
        reply(null);
        Uri a = importPicture("first.jpg", 40, 80), b = importPicture("second.jpg", 80, 40);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = openReplies(screen.get());
            pick(screen.get(), root, a);
            assertFalse(((java.util.concurrent.Future<?>) imports.get(0)).isCancelled());
            pick(screen.get(), root, b);
            assertTrue(((java.util.concurrent.Future<?>) imports.get(0)).isCancelled());
            assertFalse(((java.util.concurrent.Future<?>) imports.get(1)).isCancelled());
            root.findViewWithTag("auto_reply_picture_clear").performClick();
            assertTrue(((java.util.concurrent.Future<?>) imports.get(1)).isCancelled());
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aCopyPastItsDeadlineGivesUpAndFreesSave() throws IOException {
        reply(null);
        Uri source = importPicture("stuck.jpg", 80, 40);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = openReplies(screen.get());
            pick(screen.get(), root, source);
            assertFalse(root.findViewWithTag("auto_reply_save").isEnabled());
            org.robolectric.shadows.ShadowLooper.idleMainLooper(AutoReplyPicture.DEADLINE_MS - 1, java.util.concurrent.TimeUnit.MILLISECONDS);
            assertFalse(root.findViewWithTag("auto_reply_save").isEnabled());
            org.robolectric.shadows.ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.MILLISECONDS);
            assertTrue(root.findViewWithTag("auto_reply_save").isEnabled());
            assertTrue(((java.util.concurrent.Future<?>) imports.get(0)).isCancelled());
            assertEquals(SettingsText.english("auto_reply_picture_too_slow"),
                org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
            assertEquals(View.GONE, root.findViewWithTag("auto_reply_picture_thumb").getVisibility());
            imports.get(0).run();
            root.findViewWithTag("auto_reply_save").performClick();
            assertNull(AutoReply.rules(Settings.preferences).get(0).picture);
        }
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aSavedPictureShowsOnItsCardAndOutlivesTheScreenBeingRebuilt() throws IOException {
        File file = picture(new File(AutoReplyPicture.directory(context), PICTURE), 80, 60, Bitmap.CompressFormat.JPEG);
        reply(PICTURE);
        Bundle state = new Bundle();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = openReplies(screen.get());
            assertEquals(View.VISIBLE, root.findViewWithTag("auto_reply_picture_thumb").getVisibility());
            assertEquals(View.VISIBLE, root.findViewWithTag("auto_reply_picture_clear").getVisibility());
            ((EditText) root.findViewWithTag("auto_reply_reply")).setText("Away for lunch");
            screen.get().onSaveInstanceState(state);
        }
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).create(state).start().resume().visible()) {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertEquals("Away for lunch", ((EditText) root.findViewWithTag("auto_reply_reply")).getText().toString());
            assertEquals(View.VISIBLE, root.findViewWithTag("auto_reply_picture_thumb").getVisibility());
            root.findViewWithTag("auto_reply_save").performClick();
        }
        AutoReply.Rule saved = AutoReply.rules(Settings.preferences).get(0);
        assertEquals("Away for lunch", saved.reply);
        assertEquals(PICTURE, saved.picture);
        assertTrue(file.exists());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void removingThePictureDeletesItOnSaveAndCancelKeepsIt() throws IOException {
        File file = picture(new File(AutoReplyPicture.directory(context), PICTURE), 80, 60, Bitmap.CompressFormat.JPEG);
        reply(PICTURE);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = openReplies(screen.get());
            root.findViewWithTag("auto_reply_picture_clear").performClick();
            assertEquals(View.GONE, root.findViewWithTag("auto_reply_picture_thumb").getVisibility());
            root.findViewWithTag("auto_reply_cancel").performClick();
            // The sheet lets go of the screen when its dismiss message runs, which a phone does before the next tap.
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(PICTURE, AutoReply.rules(Settings.preferences).get(0).picture);
            assertTrue(file.exists());

            root = openReplies(screen.get());
            root.findViewWithTag("auto_reply_picture_clear").performClick();
            root.findViewWithTag("auto_reply_save").performClick();
        }
        assertNull(AutoReply.rules(Settings.preferences).get(0).picture);
        assertFalse(file.exists());
    }

    /** A build the picture send didn't match hides the picture row, and saving the replies there still keeps the picture. */
    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void savingWhereThePictureRowIsHiddenKeepsThePicture() throws IOException {
        File file = picture(new File(AutoReplyPicture.directory(context), PICTURE), 80, 60, Bitmap.CompressFormat.JPEG);
        reply(PICTURE);
        AutoReplyPicture.bridge = () -> false;
        boolean preview = Settings.preview;
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            // Starting the screen reads hush.preview from this build's manifest again, so it goes off after that.
            Settings.preview = false;
            assertFalse(AutoReplyPicture.supported());
            View root = openReplies(screen.get());
            assertNull(root.findViewWithTag("auto_reply_picture_thumb"));
            ((EditText) root.findViewWithTag("auto_reply_reply")).setText("Back at two");
            root.findViewWithTag("auto_reply_save").performClick();
        } finally {
            Settings.preview = preview;
        }
        AutoReply.Rule saved = AutoReply.rules(Settings.preferences).get(0);
        assertEquals("Back at two", saved.reply);
        assertEquals(PICTURE, saved.picture);
        assertTrue(file.exists());
    }

    /** With the row hidden the picture can't be seen, so a card emptied of both texts goes like any blank card. */
    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aBlankCardWhereThePictureRowIsHiddenSavesAway() throws IOException {
        File file = picture(new File(AutoReplyPicture.directory(context), PICTURE), 80, 60, Bitmap.CompressFormat.JPEG);
        reply(PICTURE);
        AutoReplyPicture.bridge = () -> false;
        boolean preview = Settings.preview;
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Settings.preview = false;
            assertFalse(AutoReplyPicture.supported());
            View root = openReplies(screen.get());
            ((EditText) root.findViewWithTag("auto_reply_reply")).setText("");
            root.findViewWithTag("auto_reply_save").performClick();
            assertEquals(View.GONE, root.findViewWithTag("auto_reply_error").getVisibility());
            assertFalse(ShadowDialog.getLatestDialog().isShowing());
        } finally {
            Settings.preview = preview;
        }
        assertTrue(AutoReply.rules(Settings.preferences).isEmpty());
        assertFalse(file.exists());
    }
}
