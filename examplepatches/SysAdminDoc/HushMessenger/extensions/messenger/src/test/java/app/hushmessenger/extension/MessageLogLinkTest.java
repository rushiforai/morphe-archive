package app.hushmessenger.extension;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.Person;
import android.content.Context;
import X.Xma;
import com.facebook.graphservice.interfaces.Tree;
import com.facebook.graphservice.tree.TreeJNI;
import com.facebook.messaging.model.messages.Message;
import com.facebook.messaging.model.share.Share;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

/** Keeping the address a message shared, so an unsent reel or post can still be opened from the log. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class MessageLogLinkTest {
    private static final String REEL = "https://www.instagram.com/reel/C9xYz12AbCd/?igsh=bWV0YQ";
    private static final String POST = "https://www.facebook.com/share/p/1AbCdEfGh/";
    private static final String THREAD = "ONE_TO_ONE:7:8";
    private static final String GROUP = "GROUP:77";
    private static final String ID = "mid.700";

    private java.util.function.LongConsumer retryLater;

    /** A card the way Messenger types one: an interface of its own over a tree class over TreeJNI. */
    static class CardTree extends TreeJNI {
    }

    static final class Card extends CardTree implements Xma {
    }

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        retryLater = MessageLog.retryLater;
        MessageLog.retryLater = delay -> { };
        MessageLog.retry();
        MessageLog.forgetCaptures();
        Settings.hookErrors.clear();
        Settings.takeIncomingMessageId();
        Settings.takeIncomingMessageMedia();
        Settings.takeIncomingMessageLink();
        MessageLog.vault = new MessageLogTest.SoftwareVault();
        logFile().delete();
        MessageLogMedia.deleteAll(Settings.appContext);
        TreeJNI.reads.clear();
        TreeJNI.failing = false;
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).commit();
    }

    @After public void tidy() {
        TreeJNI.reads.clear();
        TreeJNI.failing = false;
        Settings.appContext.getSystemService(NotificationManager.class).cancelAll();
        MessageLog.retryLater = retryLater;
        logFile().delete();
        new File(Settings.appContext.getFilesDir(), MessageLog.NAMES).delete();
        MessageLogMedia.deleteAll(Settings.appContext);
        MessageLog.vault = null;
    }

    private File logFile() {
        return new File(Settings.appContext.getFilesDir(), MessageLog.FILE);
    }

    /** A card whose story links to [url], beside a title, the way a shared reel's card arrives. */
    private static Card card(String url) {
        TreeJNI story = new TreeJNI();
        story.put("title", "Reel by ana");
        if (url != null) story.put("url", url);
        Card card = new Card();
        card.put("snippet", "ana sent a reel");
        card.put("story_attachment", story);
        return card;
    }

    private static MessageLog.Entry logged(String id) {
        for (MessageLog.Entry entry : MessageLog.entries()) if (id.equals(entry.id)) return entry;
        throw new AssertionError("nothing logged for " + id);
    }

    /** What the hook found on [message], taken the way the log's own call takes it. */
    private static String linkOn(Object message) {
        Settings.incomingMessageMedia(message);
        return Settings.takeIncomingMessageLink();
    }

    /** The notification Messenger put up for a group, one line per message, each carrying its message's id. */
    private static void notifyGroup(String[] ids, String[] senders, String[] lines) {
        Context context = Settings.appContext;
        Notification.MessagingStyle style = new Notification.MessagingStyle(new Person.Builder().setName("Me").build())
            .setConversationTitle("Climbing").setGroupConversation(true);
        for (int i = 0; i < ids.length; i++) {
            Notification.MessagingStyle.Message line = new Notification.MessagingStyle.Message(lines[i], 2 + i,
                new Person.Builder().setName(senders[i]).build());
            line.getExtras().putString("msgId", ids[i]);
            style.addMessage(line);
        }
        context.getSystemService(NotificationManager.class).notify(GROUP, 1, new Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setStyle(style).build());
    }

    /** The report itself: a shared reel was logged as "Shared a reel." and nothing to open once it was unsent. */
    @Test public void aSharedReelIsLoggedAsItsLinkInPlaceOfTheNotificationLine() {
        notifyGroup(new String[] {"mid.70", "mid.71"}, new String[] {"Ana", "Bo"},
            new String[] {"Ana shared a reel.", "Bo shared a reel."});
        Settings.incomingMessageId("mid.70");
        Settings.incomingMessageMedia(Message.sharing(Share.linking(REEL)));
        Settings.recordReceivedMessage(null, GROUP);
        // One whose share carries no web address at all is logged as it always was.
        Settings.incomingMessageId("mid.71");
        Settings.incomingMessageMedia(Message.sharing(Share.linking(null)));
        Settings.recordReceivedMessage(null, GROUP);
        MessageLog.drain();

        MessageLog.Entry shared = logged("mid.70");
        assertEquals(REEL, shared.text);
        assertTrue(shared.attachment);
        // Still named from its own line, which the link doesn't get in the way of.
        assertEquals("Ana", shared.sender);
        assertEquals("Climbing", shared.chat);
        MessageLog.Entry bare = logged("mid.71");
        assertEquals("Bo shared a reel.", bare.text);
        assertEquals("Bo", bare.sender);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void theCardsLinkIsReadThroughTheTreesOwnMethods() {
        assertEquals(REEL, linkOn(Message.carding(card(REEL))));
        // The story's tree, then its address, each by the hash Messenger's own getters use.
        assertEquals(Arrays.asList(MessageLogLink.STORY_ATTACHMENT, MessageLogLink.URL), TreeJNI.reads);
        assertNull("taken once", Settings.takeIncomingMessageLink());

        Settings.incomingMessageId(ID);
        Settings.incomingMessageMedia(Message.carding(card(POST)));
        Settings.recordReceivedMessage(null, THREAD);
        MessageLog.drain();
        assertEquals("with no notification to read, the link is still what's kept", POST, logged(ID).text);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void theFieldHashesAreTheirNamesHashes() {
        assertEquals(MessageLogLink.URL_FIELD.hashCode(), MessageLogLink.URL);
        assertEquals(MessageLogLink.STORY_ATTACHMENT_FIELD.hashCode(), MessageLogLink.STORY_ATTACHMENT);
    }

    @Test public void wordsKeepTheLinkOnALineUnderThem() {
        Settings.incomingMessageId(ID);
        Settings.incomingMessageMedia(Message.carding(card(REEL)));
        Settings.recordReceivedMessage("this one is so you", THREAD);
        assertNull(Settings.takeIncomingMessageLink());
        MessageLog.drain();
        MessageLog.Entry entry = logged(ID);
        assertEquals("this one is so you\n" + REEL, entry.text);
        assertFalse(entry.attachment);
    }

    /** A typed address is already in the words, and Messenger built its card from it. */
    @Test public void wordsThatHoldAnAddressAreLeftAsTheyAre() {
        assertEquals("see https://example.com/a", MessageLogLink.joined("see https://example.com/a", REEL));
        assertEquals("HTTP://EXAMPLE.COM", MessageLogLink.joined("HTTP://EXAMPLE.COM", REEL));
        assertEquals(REEL, MessageLogLink.joined(null, REEL));
        assertEquals(REEL, MessageLogLink.joined("", REEL));
        assertEquals("hi", MessageLogLink.joined("hi", null));
        assertEquals("hi", MessageLogLink.joined("hi", ""));
    }

    @Test public void onlyAWholeWebAddressCounts() {
        for (String other : new String[] {"fb://reel/1234567890", "javascript:alert(1)", "JavaScript://example.com/%0aalert(1)",
            "ftp://example.com/file", "content://com.facebook.orca/1", "intent://reel/1#Intent;scheme=https;end", "mailto:ana@example.com",
            "https://scontent.xx.fbcdn.net/v/t51.2885-15/p.jpg?oe=6A1B", "https://fbcdn.net/p.jpg", "https://lookaside.fbsbx.com/lookaside/crawler/media/?media_id=1",
            "https://scontent-lax3-1.cdninstagram.com/v/t51/p.jpg", "https://", "https:///reel/1", "www.instagram.com/reel/1",
            "https://www.instagram.com/reel/1 and more", "https://www.instagram.com/reel/1\nmore", "Reel by ana", "", "   ", null}) {
            assertNull(String.valueOf(other), MessageLogLink.link(other));
        }
        assertEquals(REEL, MessageLogLink.link(REEL));
        assertEquals(POST, MessageLogLink.link("  " + POST + " "));
        assertEquals("HTTP://Example.com/a", MessageLogLink.link("HTTP://Example.com/a"));
        assertEquals("https://notfbcdn.net/a", MessageLogLink.link("https://notfbcdn.net/a"));
        StringBuilder huge = new StringBuilder("https://example.com/");
        while (huge.length() <= MessageLogLink.MAX_LINK_CHARS) huge.append('a');
        assertNull("a link too long to sit beside the words", MessageLogLink.link(huge.toString()));
    }

    /** A Share's fields aren't named here, so its pictures, deep link and script values sit beside the link it holds. */
    @Test public void aShareIsReadByValue() {
        Share noisy = new Share("https://scontent.xx.fbcdn.net/v/t51/p.jpg", "javascript:alert(1)", "fb://reel/1234567890",
            "https://lookaside.fbsbx.com/x", "1234567890", REEL, "ana");
        assertEquals(REEL, linkOn(Message.sharing(noisy)));
        Share nothing = new Share("https://scontent.xx.fbcdn.net/v/t51/p.jpg", "javascript:alert(1)", "fb://reel/1234567890",
            null, "1234567890", "intent://reel/1", "ana");
        assertNull(linkOn(Message.sharing(nothing)));
        // Something else in the list that only looks like a share is left alone.
        assertNull(linkOn(Message.with(REEL)));
        assertNull(linkOn(Message.sharing(Share.linking(null), Share.linking("fb://reel/1"))));
        assertEquals(POST, linkOn(Message.sharing(Share.linking(null), Share.linking(POST))));
    }

    @Test public void anOlderShareComesBeforeTheCard() {
        Message both = Message.sharing(Share.linking(POST));
        both.A0F = card(REEL);
        assertEquals(POST, linkOn(both));
        assertTrue("the card isn't read once the share gave a link", TreeJNI.reads.isEmpty());
    }

    @Test public void aMessageWithNothingSharedIsLoggedAsBefore() {
        assertEquals(REEL, linkOn(Message.carding(card(REEL))));
        Settings.incomingMessageMedia(Message.sharing(Share.linking(REEL)));
        Settings.incomingMessageMedia(Message.with());
        assertNull("a message with no link clears what the one before it left", Settings.takeIncomingMessageLink());
        assertNull(linkOn(new Object()));
        assertNull(linkOn(null));
        assertNull(linkOn(Message.carding(card(null))));

        Settings.incomingMessageId(ID);
        Settings.incomingMessageMedia(Message.with());
        Settings.recordReceivedMessage("just words", THREAD);
        Settings.incomingMessageId("mid.72");
        Settings.incomingMessageMedia(Message.with());
        Settings.recordReceivedMessage(null, THREAD);
        MessageLog.drain();
        assertEquals("just words", logged(ID).text);
        MessageLog.Entry attachment = logged("mid.72");
        assertTrue(attachment.attachment);
        assertEquals("", attachment.text);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aTreeThatThrowsLeavesTheMessageLoggedWithoutALink() {
        TreeJNI.failing = true;
        Settings.incomingMessageId(ID);
        Settings.incomingMessageMedia(Message.carding(card(REEL)));
        Settings.recordReceivedMessage("still logged", THREAD);
        MessageLog.drain();
        assertEquals("still logged", logged(ID).text);
        assertTrue(Settings.hookErrors.containsKey(MessageLog.KEY));
    }

    /** A list that fails partway through doesn't keep the card from being read. */
    @Test public void aListThatThrowsStillLetsTheCardBeRead() {
        Message message = Message.carding(card(REEL));
        message.A1M = new ArrayList<Object>() {
            @Override public Iterator<Object> iterator() {
                throw new IllegalStateException("list unreadable");
            }
        };
        assertEquals(REEL, linkOn(message));
        assertTrue(Settings.hookErrors.containsKey(MessageLog.KEY));
    }

    /** A native read of the wrong type can end the process, so a field is only read once its type says it can be. */
    @Test public void aFieldIsReadOnlyWhenItHoldsWhatItsReadAs() {
        Card urlIsATree = new Card();
        TreeJNI story = new TreeJNI();
        story.put("url", new TreeJNI());
        urlIsATree.put("story_attachment", story);
        assertNull(linkOn(Message.carding(urlIsATree)));
        assertEquals(Collections.singletonList(MessageLogLink.STORY_ATTACHMENT), TreeJNI.reads);

        TreeJNI.reads.clear();
        Card urlUnset = new Card();
        TreeJNI empty = new TreeJNI();
        empty.declare("url", Tree.FieldType.STRING);
        urlUnset.put("story_attachment", empty);
        assertNull(linkOn(Message.carding(urlUnset)));
        assertEquals(Collections.singletonList(MessageLogLink.STORY_ATTACHMENT), TreeJNI.reads);

        TreeJNI.reads.clear();
        Card storyIsAString = new Card();
        storyIsAString.put("story_attachment", REEL);
        assertNull(linkOn(Message.carding(storyIsAString)));
        Card storyUnset = new Card();
        storyUnset.declare("story_attachment", Tree.FieldType.TREE);
        assertNull(linkOn(Message.carding(storyUnset)));
        assertNull(linkOn(Message.carding(new Card())));
        assertTrue(TreeJNI.reads.isEmpty());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void nothingIsReadWithTheLogOff() {
        Settings.preferences.edit().putBoolean(MessageLog.KEY, false).commit();
        assertNull(linkOn(Message.carding(card(REEL))));
        assertNull(MessageLogLink.shared(Message.carding(card(REEL))));
        assertNull(MessageLogLink.shared(Message.sharing(Share.linking(REEL))));
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).putBoolean("paused", true).commit();
        assertNull(linkOn(Message.carding(card(REEL))));
        assertTrue(TreeJNI.reads.isEmpty());

        // A link held from before the switch went off goes with the next message, not into the log.
        Settings.preferences.edit().putBoolean("paused", false).commit();
        Settings.incomingMessageMedia(Message.carding(card(REEL)));
        Settings.preferences.edit().putBoolean(MessageLog.KEY, false).commit();
        Settings.incomingMessageMedia(Message.carding(card(REEL)));
        assertNull(Settings.takeIncomingMessageLink());
    }

    @Test public void aLongMessageIsClippedSoItsLinkStillFits() {
        StringBuilder words = new StringBuilder();
        while (words.length() < MessageLog.MAX_TEXT_CHARS + 500) words.append("so many words ");
        MessageLog.queueShared(words.toString(), THREAD, ID, REEL);
        MessageLog.drain();
        String text = logged(ID).text;
        assertTrue(text.length() <= MessageLog.MAX_TEXT_CHARS);
        assertTrue(text.endsWith("\n" + REEL));
        assertTrue(text.startsWith("so many words so many words"));
    }

    /** The case the report is about: the link stays with the entry once the sender unsends it, before or after the write. */
    @Test public void anUnsentShareKeepsItsLink() {
        MessageLog.queueShared(null, THREAD, ID, REEL);
        assertTrue(MessageLog.markNow(ID, THREAD, null));
        MessageLog.drain();
        MessageLog.Entry early = logged(ID);
        assertTrue(early.unsent);
        assertEquals(REEL, early.text);

        MessageLog.queueShared("look", THREAD, "mid.73", POST);
        MessageLog.drain();
        assertTrue(MessageLog.markNow("mid.73", THREAD, null));
        MessageLog.Entry late = logged("mid.73");
        assertTrue(late.unsent);
        assertEquals("look\n" + POST, late.text);
    }
}
