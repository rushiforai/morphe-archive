package app.hushmessenger.extension;

import android.content.Context;
import com.facebook.messaging.model.messages.Message;
import com.facebook.ui.media.attachments.model.MediaResource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** #236: the words go first when Messenger's editor sends the photo by itself. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class EditorCaptionTest {
    private static final String KEY = "media_caption";

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
        EditorCaption.editorOpening(null);
        EditorCaption.chipOpening(null, null);
    }

    /** Like androidx's Fragment: isAdded() is public on the base class the chat fragment extends. */
    public static class Fragment {
        boolean added = true;

        public final boolean isAdded() {
            return added;
        }
    }

    /** The compose fragment, with the static helper the patch adds to it. */
    public static final class Composer {
        final List<String> sent = new ArrayList<>();

        public static void hushCaptionForEditor(Composer composer, String kind) {
            composer.sent.add(kind);
        }
    }

    /** A compose fragment whose helper fails. */
    public static final class BrokenComposer {
        public static void hushCaptionForEditor(BrokenComposer composer, String kind) {
            throw new IllegalStateException("the composer's view is gone");
        }
    }

    /** A class with a method of that name that isn't the static helper. */
    public static final class Lookalike {
        public void hushCaptionForEditor(Lookalike other, String kind) {}
    }

    /** The chat fragment: its compose fragment among other fields, as Messenger's chat keeps it. */
    public static class Chat extends Fragment {
        private final String title = "a chat";
        private final int unread = 2;
        private final Lookalike lookalike = new Lookalike();
        private Composer composer;

        Chat(Composer composer) {
            this.composer = composer;
        }
    }

    /** Another chat fragment class, whose compose fragment sits in a field of its superclass. */
    public static class BubbleChat extends Chat {
        private final Object extra = new Object();

        BubbleChat(Composer composer) {
            super(composer);
        }
    }

    public static final class BrokenChat extends Fragment {
        private final BrokenComposer composer = new BrokenComposer();
    }

    public static final class LonelyChat extends Fragment {
        private final String title = "no composer here";
    }

    public static final class CrowdedChat extends Fragment {
        private final Composer one = new Composer();
        private final Composer two = new Composer();
    }

    /** Messenger's media kind, under the names its enum gives them, and an unrelated enum beside it. */
    public enum Kind { PHOTO, VIDEO, AUDIO, OTHER, SELFIE_STICKER, ENT_PHOTO, ENT_VIDEO, ANIMATED_PHOTO }

    public enum Source { CAMERA, GALLERY }

    public static final class Media {
        private final Source source = Source.CAMERA;
        private final String uri = "content://media/1";
        private final Kind kind;

        Media(Kind kind) {
            this.kind = kind;
        }
    }

    public static final class Shapeless {
        private final Source source = Source.GALLERY;
    }

    private static List<Media> media(Kind kind) {
        return Collections.singletonList(new Media(kind));
    }

    private static void on() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
    }

    @Test public void aPhotoOrVideoTheEditorSendsGetsTheWordsFirst() {
        on();
        Composer composer = new Composer();
        Chat chat = new Chat(composer);
        for (Kind kind : new Kind[] {Kind.PHOTO, Kind.ENT_PHOTO, Kind.ANIMATED_PHOTO, Kind.VIDEO, Kind.ENT_VIDEO}) {
            EditorCaption.editorOpening(chat);
            EditorCaption.editorSending(media(kind));
        }
        assertEquals(Arrays.asList("image", "image", "image", "video", "video"), composer.sent);
        // The compose fragment can sit in a field the chat class inherits.
        Composer bubbles = new Composer();
        EditorCaption.editorOpening(new BubbleChat(bubbles));
        EditorCaption.editorSending(Arrays.asList(new Media(Kind.VIDEO), new Media(Kind.PHOTO)));
        assertEquals(Collections.singletonList("video"), bubbles.sent);
        assertEquals(0, Settings.hookErrorAt(KEY));
    }

    @Test public void stickersAndOtherKindsLeaveTheWordsInTheBox() {
        on();
        Composer composer = new Composer();
        Chat chat = new Chat(composer);
        for (Kind kind : new Kind[] {Kind.SELFIE_STICKER, Kind.AUDIO, Kind.OTHER, null}) {
            EditorCaption.editorOpening(chat);
            EditorCaption.editorSending(media(kind));
        }
        for (List<?> media : Arrays.<List<?>>asList(null, Collections.emptyList(), Collections.singletonList(null))) {
            EditorCaption.editorOpening(chat);
            EditorCaption.editorSending(media);
        }
        assertTrue(composer.sent.isEmpty());
        assertEquals(0, Settings.hookErrorAt(KEY));
    }

    @Test public void offPauseAndSafeModeLeaveTheSendToMessenger() {
        for (String state : new String[] {"off", "paused", "safe"}) {
            Settings.preferences.edit().clear().putBoolean(KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            Composer composer = new Composer();
            EditorCaption.editorOpening(new Chat(composer));
            EditorCaption.editorSending(media(Kind.PHOTO));
            assertTrue(state, composer.sent.isEmpty());
            assertEquals(state, 0, Settings.hookErrorAt(KEY));
        }
    }

    @Test public void aChatThatIsGoneOrNeverOpenedTheEditorSendsNothing() {
        on();
        // No chat opened the editor: a camera Messenger opened from somewhere else.
        EditorCaption.editorSending(media(Kind.PHOTO));
        // The chat left its screen while the editor was open.
        Composer composer = new Composer();
        Chat gone = new Chat(composer);
        gone.added = false;
        EditorCaption.editorOpening(gone);
        EditorCaption.editorSending(media(Kind.PHOTO));
        // The chat's compose fragment isn't attached yet.
        Chat empty = new Chat(null);
        EditorCaption.editorOpening(empty);
        EditorCaption.editorSending(media(Kind.PHOTO));
        assertTrue(composer.sent.isEmpty());
        assertEquals(0, Settings.hookErrorAt(KEY));
    }

    @Test public void theChatIsTakenOnceSoALaterSendFromElsewhereKeepsItsHandsOff() {
        on();
        Composer composer = new Composer();
        EditorCaption.editorOpening(new Chat(composer));
        EditorCaption.editorSending(media(Kind.PHOTO));
        EditorCaption.editorSending(media(Kind.PHOTO));
        assertEquals(Collections.singletonList("image"), composer.sent);
        // The last chat to open the editor is the one whose words go.
        Composer first = new Composer(), second = new Composer();
        EditorCaption.editorOpening(new Chat(first));
        EditorCaption.editorOpening(new Chat(second));
        EditorCaption.editorSending(media(Kind.VIDEO));
        assertTrue(first.sent.isEmpty());
        assertEquals(Collections.singletonList("video"), second.sent);
    }

    @Test public void aChatShapedDifferentlyIsRecordedAndTheSendGoesOn() {
        on();
        EditorCaption.editorOpening(new LonelyChat());
        EditorCaption.editorSending(media(Kind.PHOTO));
        assertTrue(Settings.hookErrorAt(KEY) > 0);
        Settings.hookErrors.clear();
        CrowdedChat crowded = new CrowdedChat();
        EditorCaption.editorOpening(crowded);
        EditorCaption.editorSending(media(Kind.PHOTO));
        assertTrue(Settings.hookErrorAt(KEY) > 0);
        assertTrue(crowded.one.sent.isEmpty());
        assertTrue(crowded.two.sent.isEmpty());
    }

    @Test public void aMediaWithNoKindOrAHelperThatFailsIsRecorded() {
        on();
        Composer composer = new Composer();
        EditorCaption.editorOpening(new Chat(composer));
        EditorCaption.editorSending(Collections.singletonList(new Shapeless()));
        assertTrue(Settings.hookErrorAt(KEY) > 0);
        assertTrue(composer.sent.isEmpty());
        Settings.hookErrors.clear();
        EditorCaption.editorOpening(new BrokenChat());
        EditorCaption.editorSending(media(Kind.PHOTO));
        assertTrue(Settings.hookErrorAt(KEY) > 0);
    }

    /** The editor's result message, its media in one of its list fields, the way the compose fragment gets it back. */
    private static Message result(MediaResource.Type... kinds) {
        Message message = new Message();
        for (MediaResource.Type kind : kinds) message.A1L.add(new MediaResource(kind));
        return message;
    }

    // #236: the editor a chat opens from the attachment chip hands its photo back to the compose fragment, which sent it
    // without reading the box. The patch asks resultKind what the message holds and hands that to the editor helper.
    @Test public void theResultsKindNamesPhotosVideosAndStickersTheWayTheEditorsSendDoes() {
        on();
        assertEquals("image", EditorCaption.resultKind(result(MediaResource.Type.PHOTO)));
        assertEquals("image", EditorCaption.resultKind(result(MediaResource.Type.ENT_PHOTO)));
        assertEquals("image", EditorCaption.resultKind(result(MediaResource.Type.ANIMATED_PHOTO)));
        assertEquals("video", EditorCaption.resultKind(result(MediaResource.Type.VIDEO)));
        assertEquals("video", EditorCaption.resultKind(result(MediaResource.Type.ENT_VIDEO)));
        assertEquals("sticker", EditorCaption.resultKind(result(MediaResource.Type.SELFIE_STICKER)));
        // The first media decides, in whichever of the message's lists it sits and whatever comes before it there.
        assertEquals("video", EditorCaption.resultKind(result(MediaResource.Type.VIDEO, MediaResource.Type.SELFIE_STICKER)));
        assertEquals("sticker", EditorCaption.resultKind(Message.with("an attachment", new MediaResource(MediaResource.Type.SELFIE_STICKER))));
        assertEquals(0, Settings.hookErrorAt(KEY));
    }

    @Test public void anythingItCantReadAnswersImageAndNothingThrows() {
        on();
        // No message, something that isn't one, a message with no media, and media whose kind isn't set.
        assertEquals("image", EditorCaption.resultKind(null));
        assertEquals("image", EditorCaption.resultKind("a message"));
        assertEquals("image", EditorCaption.resultKind(new Object()));
        assertEquals("image", EditorCaption.resultKind(new Message()));
        assertEquals("image", EditorCaption.resultKind(Message.with("an attachment", new Media(Kind.VIDEO))));
        Message unset = new Message();
        unset.A1L.add(null);
        unset.A1L.add(new MediaResource(null));
        assertEquals("image", EditorCaption.resultKind(unset));
        // A message whose list read throws is recorded and still answers image.
        Message broken = new Message();
        broken.A1L = new ArrayList<Object>() {
            @Override public java.util.Iterator<Object> iterator() {
                throw new IllegalStateException("the list went away");
            }
        };
        assertEquals("image", EditorCaption.resultKind(broken));
        assertTrue(Settings.hookErrorAt(KEY) > 0);
    }

    @Test public void offPauseAndSafeModeAnswerImageWithoutReadingTheMessage() {
        for (String state : new String[] {"off", "paused", "safe"}) {
            Settings.preferences.edit().clear().putBoolean(KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            assertEquals(state, "image", EditorCaption.resultKind(result(MediaResource.Type.SELFIE_STICKER)));
            assertEquals(state, 0, Settings.hookErrorAt(KEY));
        }
    }

    /** The composer's text holder, like Messenger's (588's X.5Dx for LX/6BR;): getText() reads the box as it is now. */
    public static final class TextHolder {
        CharSequence text;

        TextHolder(CharSequence text) {
            this.text = text;
        }

        public CharSequence getText() {
            return text;
        }
    }

    /** A text holder whose box is gone. */
    public static final class BrokenHolder {
        public CharSequence getText() {
            throw new IllegalStateException("the composer's view is gone");
        }
    }

    /** The batch send's media, as Messenger hands it over: a list of MediaResource. */
    private static List<MediaResource> resources(MediaResource.Type... kinds) {
        List<MediaResource> list = new ArrayList<>();
        for (MediaResource.Type kind : kinds) list.add(new MediaResource(kind));
        return list;
    }

    // #236 on the phone: the chip's editor result goes out through the msys composer's batch send, which never reads the
    // box. The chip's opening keeps the composer's bus and text holder, and the batch send asks whether the words go first.
    @Test public void aPhotoOrVideoFromTheChipsEditorSendsTheWordsFirst() {
        on();
        Object bus = new Object();
        for (MediaResource.Type kind : new MediaResource.Type[] {MediaResource.Type.PHOTO, MediaResource.Type.ENT_PHOTO,
                MediaResource.Type.ANIMATED_PHOTO, MediaResource.Type.VIDEO, MediaResource.Type.ENT_VIDEO}) {
            EditorCaption.chipOpening(bus, new TextHolder("hello there"));
            assertTrue(kind.name(), EditorCaption.chipSending(bus, resources(kind)));
        }
        // The first photo decides, and words with spaces around them still go.
        EditorCaption.chipOpening(bus, new TextHolder("  hi  "));
        assertTrue(EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO, MediaResource.Type.SELFIE_STICKER)));
        assertEquals(0, Settings.hookErrorAt(KEY));
    }

    @Test public void theBoxIsReadWhenTheEditorsResultGoesOutNotWhenTheChipOpensIt() {
        on();
        Object bus = new Object();
        TextHolder box = new TextHolder("");
        EditorCaption.chipOpening(bus, box);
        box.text = "typed later";
        assertTrue(EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
        TextHolder emptied = new TextHolder("typed first");
        EditorCaption.chipOpening(bus, emptied);
        emptied.text = "";
        assertFalse(EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
    }

    @Test public void anEmptyBoxAStickerOrAnotherKindLeavesTheSendAlone() {
        on();
        Object bus = new Object();
        for (CharSequence typed : new CharSequence[] {null, "", "   ", "\n\t"}) {
            EditorCaption.chipOpening(bus, new TextHolder(typed));
            assertFalse(String.valueOf(typed), EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
        }
        for (MediaResource.Type kind : new MediaResource.Type[] {MediaResource.Type.SELFIE_STICKER, MediaResource.Type.AUDIO,
                MediaResource.Type.FILE, MediaResource.Type.OTHER, null}) {
            EditorCaption.chipOpening(bus, new TextHolder("hello"));
            assertFalse(String.valueOf(kind), EditorCaption.chipSending(bus, resources(kind)));
        }
        for (List<?> media : Arrays.<List<?>>asList(null, Collections.emptyList(), Collections.singletonList(null))) {
            EditorCaption.chipOpening(bus, new TextHolder("hello"));
            assertFalse(EditorCaption.chipSending(bus, media));
        }
        assertEquals(0, Settings.hookErrorAt(KEY));
    }

    @Test public void offPauseAndSafeModeLeaveTheChipsSendToMessenger() {
        for (String state : new String[] {"off", "paused", "safe"}) {
            Settings.preferences.edit().clear().putBoolean(KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            Object bus = new Object();
            EditorCaption.chipOpening(bus, new TextHolder("hello"));
            assertFalse(state, EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
            assertEquals(state, 0, Settings.hookErrorAt(KEY));
        }
    }

    @Test public void onlyTheComposerWhoseChipOpenedTheEditorAndOnlyOnce() {
        on();
        Object bus = new Object(), other = new Object();
        // A batch send nobody's chip asked for: the camera, or another chat's composer.
        assertFalse(EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
        EditorCaption.chipOpening(bus, new TextHolder("hello"));
        assertFalse(EditorCaption.chipSending(other, resources(MediaResource.Type.PHOTO)));
        assertFalse(EditorCaption.chipSending(null, resources(MediaResource.Type.PHOTO)));
        // The chip's own composer is still waiting, and its words go once.
        assertTrue(EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
        assertFalse(EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
        // The last chip to open the editor counts, and an opening without a bus or a box keeps nothing.
        EditorCaption.chipOpening(other, new TextHolder("first"));
        EditorCaption.chipOpening(bus, new TextHolder("second"));
        assertFalse(EditorCaption.chipSending(other, resources(MediaResource.Type.PHOTO)));
        EditorCaption.chipOpening(bus, null);
        assertFalse(EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
        EditorCaption.chipOpening(null, new TextHolder("hello"));
        assertFalse(EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
        assertEquals(0, Settings.hookErrorAt(KEY));
    }

    @Test public void aBoxThatCantBeReadIsRecordedAndTheSendGoesOn() {
        on();
        Object bus = new Object();
        EditorCaption.chipOpening(bus, new BrokenHolder());
        assertFalse(EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
        assertTrue(Settings.hookErrorAt(KEY) > 0);
        Settings.hookErrors.clear();
        EditorCaption.chipOpening(bus, "no getText here");
        assertFalse(EditorCaption.chipSending(bus, resources(MediaResource.Type.PHOTO)));
        assertTrue(Settings.hookErrorAt(KEY) > 0);
        Settings.hookErrors.clear();
        EditorCaption.chipOpening(bus, new TextHolder("hello"));
        assertFalse(EditorCaption.chipSending(bus, Collections.singletonList(new Shapeless())));
        assertTrue(Settings.hookErrorAt(KEY) > 0);
    }

    @Test public void theSwitchShipsWithTheExtension() {
        assertTrue(Settings.installed.contains(KEY));
    }
}
