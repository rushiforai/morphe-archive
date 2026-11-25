package app.hushmessenger.extension;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.Person;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.Icon;
import java.io.File;
import java.nio.file.Files;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/**
 * The faces the message log keeps from chat notifications: a group's picture, each sender's in a group, and the other
 * person's in a one-to-one chat. Each sits sealed in a folder of its own and goes and comes back with the log.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MessageLogFacesTest {
    private static final String FACES = "hush_message_log_faces";
    private Context context;
    private NotificationManager manager;
    private MessageLog.Vault originalVault;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        context = Settings.appContext;
        manager = context.getSystemService(NotificationManager.class);
        originalVault = MessageLog.vault;
        MessageLog.vault = new MessageLogTest.SoftwareVault();
        // With the switch still off, this drops anything an earlier test left queued.
        MessageLog.retry();
        MessageLog.forgetCaptures();
        MessageLog.clear();
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).commit();
    }

    @After public void tidy() {
        manager.cancelAll();
        MessageLog.clear();
        MessageLog.forgetCaptures();
        MessageLog.vault = originalVault;
    }

    @Test public void aGroupsPictureAndItsSendersFaceAreKeptSealedInTheirOwnFolder() throws Exception {
        Notification group = groupNotification(Color.RED, Color.GREEN);
        manager.notify("GROUP:77", 1, group);
        MessageLog.storeNow("see you at six", "GROUP:77", "mid.1");
        assertEquals("Ana", MessageLog.entries().get(0).sender);
        File chat = chatFace("GROUP:77"), ana = senderFace("GROUP:77", "Ana");
        assertTrue("the group's picture", chat.isFile());
        assertTrue("the sender's face", ana.isFile());
        assertFalse("nobody else's", senderFace("GROUP:77", "Bo").exists());
        // Sealed with the log's key: on disk it's the nonce, the sealed picture and the tag, never the picture itself.
        byte[] plain = MessageLog.open(chat, 1 << 20), raw = Files.readAllBytes(chat.toPath());
        assertTrue(plain.length > 0);
        assertEquals(plain.length + 28, raw.length);
        assertFalse(java.util.Arrays.equals(plain, java.util.Arrays.copyOfRange(raw, 12, raw.length - 16)));
        assertTrue(Settings.hookErrors.toString(), Settings.hookErrors.isEmpty());
    }

    @Test public void aOneToOneChatTakesItsSendersFaceElseTheLargeIcon() throws Exception {
        Notification direct = directNotification("Ana", null, Color.BLUE);
        manager.notify("ONE_TO_ONE:1:2", 1, direct);
        MessageLog.storeNow("hi there", "ONE_TO_ONE:1:2", "mid.1");
        assertTrue("the large icon stands in", chatFace("ONE_TO_ONE:1:2").isFile());
        // A one-to-one chat's face is its sender's, so no second copy of it is kept.
        assertFalse(senderFace("ONE_TO_ONE:1:2", "Ana").exists());
        assertEquals(1, faces().length);
    }

    @Test public void facesStayThroughTheLogsTidyGoWithClearAndComeBackWithUndo() throws Exception {
        manager.notify("GROUP:77", 1, groupNotification(Color.RED, Color.GREEN));
        MessageLog.storeNow("see you at six", "GROUP:77", "mid.1");
        manager.cancelAll();
        // Another write tidies the log's photos, and its own folder of faces stays as it was.
        MessageLog.storeNow("later", "GROUP:77", "mid.2");
        MessageLogMedia.tidy(context, MessageLog.entries());
        byte[] kept = MessageLog.open(chatFace("GROUP:77"), 1 << 20);
        assertEquals(2, faces().length);

        MessageLog.Cleared cleared = MessageLog.clearForUndo();
        assertTrue(cleared.cleared);
        assertFalse("clear takes the faces", new File(context.getFilesDir(), FACES).exists());
        assertTrue(MessageLog.restore(cleared));
        assertEquals(2, faces().length);
        assertArrayEquals("Undo seals them again under the log's new key", kept, MessageLog.open(chatFace("GROUP:77"), 1 << 20));
    }

    @Test public void aFaceGoesWhenItsChatLeavesTheLog() throws Exception {
        manager.notify("GROUP:77", 1, groupNotification(Color.RED, Color.GREEN));
        MessageLog.storeNow("see you at six", "GROUP:77", "mid.1");
        manager.cancelAll();
        assertEquals(2, faces().length);
        // The group's only message ages out, and its faces go with it.
        MessageLog.write(context, List.of(new MessageLog.Entry(System.currentTimeMillis() - 40 * MessageLog.DAY_MS, "GROUP:77", "old", "Ana", "Climbing", "mid.1")));
        MessageLog.expireNow();
        assertTrue(MessageLog.entries().isEmpty());
        assertFalse(new File(context.getFilesDir(), FACES).exists());
    }

    @Test public void nothingIsKeptWhileTheLogIsOff() throws Exception {
        Settings.preferences.edit().putBoolean(MessageLog.KEY, false).commit();
        manager.notify("GROUP:77", 1, groupNotification(Color.RED, Color.GREEN));
        MessageLog.storeNow("see you at six", "GROUP:77", "mid.1");
        assertFalse(new File(context.getFilesDir(), FACES).exists());
    }

    /** Auto reply's answer takes the notification down, so the faces come along with the names it noted. */
    @Test public void facesComeAlongWithTheNamesAutoReplyNoted() throws Exception {
        MessageLog.noteNames("ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.1", "ping test", directNotification("Ana", Color.MAGENTA, null));
        MessageLog.storeNow("ping test", "ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.1");
        assertEquals("Ana", MessageLog.entries().get(0).sender);
        assertTrue(chatFace("ADVANCED_CRYPTO_ONE_TO_ONE:9").isFile());
        MessageLog.noteNames("ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.2", "pong", directNotification("Ana", Color.MAGENTA, null));
        assertTrue(MessageLog.clear());
        MessageLog.storeNow("pong", "ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.2");
        assertFalse("clear drops what was noted for messages not written yet", chatFace("ADVANCED_CRYPTO_ONE_TO_ONE:9").exists());
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void eachFaceIsTheRightPictureSquaredAndSmall() throws Exception {
        manager.notify("GROUP:77", 1, groupNotification(Color.RED, Color.GREEN));
        MessageLog.storeNow("see you at six", "GROUP:77", "mid.1");
        assertColor(Color.RED, decoded(chatFace("GROUP:77")));
        assertColor(Color.GREEN, decoded(senderFace("GROUP:77", "Ana")));
        manager.cancelAll();
        // The sender's own face wins over the large icon in a one-to-one chat.
        manager.notify("ONE_TO_ONE:1:2", 2, directNotification("Ana", Color.MAGENTA, Color.BLUE));
        MessageLog.storeNow("hi there", "ONE_TO_ONE:1:2", "mid.2");
        Bitmap face = decoded(chatFace("ONE_TO_ONE:1:2"));
        assertColor(Color.MAGENTA, face);
        assertEquals(face.getWidth(), face.getHeight());
        assertTrue("small: " + face.getWidth(), face.getWidth() <= 128);
    }

    private static Bitmap decoded(File face) throws Exception {
        byte[] plain = MessageLog.open(face, 1 << 20);
        Bitmap bitmap = BitmapFactory.decodeByteArray(plain, 0, plain.length);
        assertNotNull(face.getName(), bitmap);
        return bitmap;
    }

    private static void assertColor(int expected, Bitmap bitmap) {
        int middle = bitmap.getPixel(bitmap.getWidth() / 2, bitmap.getHeight() / 2);
        String seen = Integer.toHexString(middle);
        assertTrue(seen, Math.abs(Color.red(middle) - Color.red(expected)) < 40);
        assertTrue(seen, Math.abs(Color.green(middle) - Color.green(expected)) < 40);
        assertTrue(seen, Math.abs(Color.blue(middle) - Color.blue(expected)) < 40);
    }

    private File chatFace(String thread) {
        return new File(new File(context.getFilesDir(), FACES), MessageLog.digest(thread));
    }

    private File senderFace(String thread, String sender) {
        return new File(new File(context.getFilesDir(), FACES), MessageLog.digest(thread + (char) 0 + sender));
    }

    private String[] faces() {
        String[] names = new File(context.getFilesDir(), FACES).list();
        return names == null ? new String[0] : names;
    }

    static Icon solid(int color) {
        Bitmap bitmap = Bitmap.createBitmap(96, 64, Bitmap.Config.ARGB_8888);
        bitmap.eraseColor(color);
        return Icon.createWithBitmap(bitmap);
    }

    /** A group chat's notification with the group's picture and a face for Ana, who sent the newest line. */
    Notification groupNotification(int groupColor, int anaColor) {
        Notification.MessagingStyle style = new Notification.MessagingStyle(new Person.Builder().setName("Me").build())
            .setConversationTitle("Climbing").setGroupConversation(true)
            .addMessage("earlier", 1, new Person.Builder().setName("Bo").build())
            .addMessage("see you at six", 2, new Person.Builder().setName("Ana").setIcon(solid(anaColor)).build());
        Notification notification = new Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setStyle(style).build();
        notification.extras.putParcelable("android.conversationIcon", solid(groupColor));
        return notification;
    }

    /** A one-to-one chat's notification from [sender], with their face on the line and a large icon when given. */
    Notification directNotification(String sender, Integer faceColor, Integer largeColor) {
        Person.Builder person = new Person.Builder().setName(sender);
        if (faceColor != null) person.setIcon(solid(faceColor));
        Notification.MessagingStyle style = new Notification.MessagingStyle(new Person.Builder().setName("Me").build())
            .addMessage("hi there", 1, person.build());
        Notification.Builder builder = new Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle(sender).setStyle(style);
        if (largeColor != null) builder.setLargeIcon(solid(largeColor));
        return builder.build();
    }
}
