package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.ClipData;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/**
 * #180: a photo pasted into a chat goes into that chat's tray the way a pick from the phone's gallery does, instead of
 * being sent on its own. Everything the chat can't take that way is left to Messenger untouched.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class PastePhotoTest {
    private static final String AUTHORITY = "com.example.pasted";
    private Application app;

    /** The app a photo is pasted from, which knows each item's type. */
    public static class PastedProvider extends ContentProvider {
        @Override public boolean onCreate() { return true; }
        @Override public String getType(Uri uri) {
            String path = uri.getPath();
            if (path.startsWith("/gif")) return "image/gif";
            if (path.startsWith("/text")) return "text/plain";
            if (path.startsWith("/unknown")) return null;
            if (path.startsWith("/shouting")) return "IMAGE/PNG";
            return "image/jpeg";
        }
        @Override public Cursor query(Uri uri, String[] columns, String selection, String[] arguments, String order) { return null; }
        @Override public Uri insert(Uri uri, ContentValues values) { return null; }
        @Override public int delete(Uri uri, String selection, String[] arguments) { return 0; }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] arguments) { return 0; }
    }

    /** The chat fragment, which takes a photo from another app through its own result handler. */
    public static class Chat {
        final List<int[]> requests = new ArrayList<>();
        final List<Intent> taken = new ArrayList<>();
        public void onActivityResult(int request, int result, Intent data) {
            requests.add(new int[] {request, result});
            taken.add(data);
        }
    }

    /** A chat fragment Messenger's own result handler isn't on, so the paste has nowhere to go. */
    public static class ChatWithoutResults {}

    /** A chat fragment whose result handler throws, as one torn down mid-paste would. */
    public static class RefusingChat {
        public void onActivityResult(int request, int result, Intent data) {
            throw new IllegalStateException("this chat is gone");
        }
    }

    @Before public void reset() {
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        Robolectric.setupContentProvider(PastedProvider.class, AUTHORITY);
    }

    private static void on() {
        Settings.preferences.edit().putBoolean(PastePhoto.KEY, true).commit();
    }

    private static Uri item(String path) {
        return Uri.parse("content://" + AUTHORITY + path);
    }

    private static ClipData clip(Uri... items) {
        ClipData pasted = ClipData.newRawUri("pasted", items[0]);
        for (int i = 1; i < items.length; i++) pasted.addItem(new ClipData.Item(items[i]));
        return pasted;
    }

    /** A chat on screen: its own view with the text input inside it, handed over as the chat opens. */
    private View openChat(Object fragment) {
        FrameLayout root = new FrameLayout(app);
        FrameLayout column = new FrameLayout(app);
        View input = new View(app);
        column.addView(input, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 60));
        root.addView(column);
        PastePhoto.chatShown(fragment, root);
        return input;
    }

    @Test public void aPastedPhotoGoesIntoTheChatItWasPastedIn() {
        on();
        Chat chat = new Chat();
        View input = openChat(chat);
        Uri photo = item("/image/7");
        assertTrue(PastePhoto.pasted(input, clip(photo)));
        assertEquals(1, chat.taken.size());
        assertArrayEquals(new int[] {1112, Activity.RESULT_OK}, chat.requests.get(0));
        Intent one = chat.taken.get(0);
        assertEquals(photo, one.getData());
        assertEquals("image/jpeg", one.getType());
        // The same one-item result a pick from the phone's gallery comes back as, so the chat's tray takes it.
        assertTrue(one.getBooleanExtra(GalleryPicker.ONE_ITEM, false));
        assertTrue(one.getBooleanExtra(GalleryPicker.RESULT_PREPARED, false));
        assertNotEquals(0, one.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
        assertNull(one.getClipData());
        assertTrue(Settings.lastActive(PastePhoto.KEY) > 0);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** A type in capitals is still a photo, and the chat gets the type the phone gave, not a lowered copy. */
    @Test public void aTypeInCapitalsIsStillAPhoto() {
        on();
        Chat chat = new Chat();
        View input = openChat(chat);
        assertTrue(PastePhoto.pasted(input, clip(item("/shouting/8"))));
        assertEquals("IMAGE/PNG", chat.taken.get(0).getType());
    }

    @Test public void everythingElsePastedIsLeftToMessenger() {
        on();
        Chat chat = new Chat();
        View input = openChat(chat);
        ClipData text = ClipData.newPlainText("pasted", "hello");
        for (ClipData each : new ClipData[] {
            text,
            clip(item("/gif/7")),
            clip(item("/text/7")),
            clip(item("/unknown/7")),
            clip(item("/image/7"), item("/image/8")),
            clip(Uri.parse("file:///sdcard/DCIM/a.jpg")),
            clip(Uri.parse("https://example.com/photo.jpg")),
            null,
        }) assertFalse(String.valueOf(each), PastePhoto.pasted(input, each));
        assertFalse(PastePhoto.pasted(null, clip(item("/image/7"))));
        assertTrue(chat.taken.isEmpty());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aPasteSomewhereElseOrInAChatThatWasntHandedOverStaysMessengers() {
        on();
        Chat chat = new Chat();
        openChat(chat);
        // The same clip, pasted in a view no chat holds.
        assertFalse(PastePhoto.pasted(new View(app), clip(item("/image/7"))));
        assertTrue(chat.taken.isEmpty());

        // A chat that opened before the switch went on isn't remembered, so its paste is Messenger's until it opens again.
        Settings.preferences.edit().clear().commit();
        Chat early = new Chat();
        View input = openChat(early);
        on();
        assertFalse(PastePhoto.pasted(input, clip(item("/image/7"))));
        assertTrue(early.taken.isEmpty());
        assertTrue(PastePhoto.pasted(openChat(early), clip(item("/image/7"))));
        assertEquals(1, early.taken.size());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void theSwitchOffAndPauseBothLeaveThePasteAlone() {
        on();
        Chat chat = new Chat();
        View input = openChat(chat);
        Settings.preferences.edit().putBoolean(PastePhoto.KEY, false).commit();
        assertFalse(PastePhoto.pasted(input, clip(item("/image/7"))));
        on();
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse("Pause leaves it to Messenger", PastePhoto.pasted(input, clip(item("/image/7"))));
        assertTrue(chat.taken.isEmpty());
        assertEquals(0, Settings.lastActive(PastePhoto.KEY));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** A chat that can't take the result keeps its own paste, and the control says it's broken instead of eating it. */
    @Test public void aChatThatCantTakeThePhotoLeavesThePasteToMessenger() {
        on();
        View without = openChat(new ChatWithoutResults());
        assertFalse(PastePhoto.pasted(without, clip(item("/image/7"))));
        assertTrue(Settings.hookErrors.containsKey(PastePhoto.KEY));

        Settings.hookErrors.clear();
        View refusing = openChat(new RefusingChat());
        assertFalse(PastePhoto.pasted(refusing, clip(item("/image/7"))));
        assertTrue(Settings.hookErrors.containsKey(PastePhoto.KEY));

        // A chat that can take it still works, with the broken one still remembered.
        Chat chat = new Chat();
        assertTrue(PastePhoto.pasted(openChat(chat), clip(item("/image/7"))));
        assertEquals(1, chat.taken.size());
    }

    @Test public void onlyTheChatsStillOpenAreRememberedAndNeverTwice() {
        on();
        List<Chat> chats = new ArrayList<>();
        List<View> inputs = new ArrayList<>();
        for (int i = 0; i < 9; i++) {
            Chat chat = new Chat();
            chats.add(chat);
            inputs.add(openChat(chat));
        }
        // The ninth chat pushes the first one out, so a paste there goes Messenger's way.
        assertFalse(PastePhoto.pasted(inputs.get(0), clip(item("/image/7"))));
        for (int i = 1; i < 9; i++) assertTrue("chat " + i, PastePhoto.pasted(inputs.get(i), clip(item("/image/7"))));

        // The same chat opened again replaces its old view instead of taking a second place.
        Chat again = chats.get(8);
        View moved = openChat(again);
        assertFalse("The chat's old view is forgotten", PastePhoto.pasted(inputs.get(8), clip(item("/image/7"))));
        assertTrue(PastePhoto.pasted(moved, clip(item("/image/7"))));
        assertEquals(2, again.taken.size());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aChatHandedOverWithNothingIsIgnored() {
        on();
        PastePhoto.chatShown(null, new FrameLayout(app));
        PastePhoto.chatShown(new Chat(), null);
        assertFalse(PastePhoto.pasted(new View(app), clip(item("/image/7"))));
        assertTrue(Settings.hookErrors.isEmpty());
    }
}
