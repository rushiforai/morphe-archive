package app.hushmessenger.extension;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class AutoReplyTest {
    private static final String CHAT = "ADVANCED_CRYPTO_ONE_TO_ONE:410775001";
    private static final String GROUP = "ADVANCED_CRYPTO_GROUP:5551";
    private static final String REPLY_ACTION = "app.hushmessenger.test.REPLY";
    private final long[] now = {1_000_000};
    private final List<Runnable> queued = new ArrayList<>();
    /** How long each queued task was asked to wait, in the order they were queued. */
    private final List<Long> delays = new ArrayList<>();
    private AutoReply.Scheduler realScheduler;
    private Context context;
    private NotificationManager manager;

    @Before public void reset() {
        context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
        realScheduler = AutoReply.scheduler;
        AutoReply.scheduler = (task, delayMs) -> {
            queued.add(task);
            delays.add(delayMs);
        };
        AutoReply.forgetQueued();
        AutoReply.clock = () -> now[0];
        Settings.preferences.edit().putBoolean(AutoReply.KEY, true).commit();
        manager = context.getSystemService(NotificationManager.class);
    }

    @After public void tidy() {
        manager.cancelAll();
        AutoReply.scheduler = realScheduler;
        AutoReply.clock = android.os.SystemClock::elapsedRealtime;
        AutoReply.forgetQueued();
    }

    /** Runs what's queued now, moving the clock on by what each task was asked to wait. Tasks they queue wait for the next call. */
    private void runQueued() {
        List<Runnable> due = new ArrayList<>(queued);
        long waited = delays.isEmpty() ? 0 : delays.get(delays.size() - 1);
        queued.clear();
        delays.clear();
        now[0] += waited;
        for (Runnable task : due) task.run();
    }

    /** Runs the queue until nothing is left, so a message that never gets a notification reaches its deadline. */
    private void runUntilQuiet() {
        for (int pass = 0; pass < 64 && !queued.isEmpty(); pass++) runQueued();
    }

    private void replies(boolean groups, String... whenThenReply) {
        List<AutoReply.Rule> rules = new ArrayList<>();
        for (int i = 0; i < whenThenReply.length; i += 2) rules.add(new AutoReply.Rule(whenThenReply[i], whenThenReply[i + 1]));
        AutoReply.save(Settings.preferences, rules, groups);
    }

    /** A chat notification the way Messenger posts one: tagged with the chat's key, with a Reply action. Returns that action's token. */
    private PendingIntent notification(String thread) {
        return notification(thread, null);
    }

    private PendingIntent notification(String thread, Notification.Style style) {
        RemoteInput input = new RemoteInput.Builder("reply_text").setLabel("Reply").build();
        PendingIntent intent = PendingIntent.getBroadcast(context, 0, new Intent(REPLY_ACTION),
            PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_MUTABLE);
        Notification.Action reply = new Notification.Action.Builder(null, "Reply", intent).addRemoteInput(input).build();
        Notification.Action read = new Notification.Action.Builder(null, "Mark as read",
            PendingIntent.getBroadcast(context, 1, new Intent("app.hushmessenger.test.READ"), PendingIntent.FLAG_IMMUTABLE)).build();
        manager.notify(thread, thread.hashCode(), new Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle("Ana").setStyle(style).addAction(read).addAction(reply).build());
        return intent;
    }

    /** What the Reply action received, or null when nothing was sent. */
    private String sent() {
        List<Intent> broadcasts = shadowOf(RuntimeEnvironment.getApplication()).getBroadcastIntents();
        String text = null;
        for (Intent intent : broadcasts) {
            if (!REPLY_ACTION.equals(intent.getAction())) continue;
            Bundle results = RemoteInput.getResultsFromIntent(intent);
            text = results == null ? null : String.valueOf(results.getCharSequence("reply_text"));
        }
        return text;
    }

    @Test public void matchesWholeWordsIgnoringCase() {
        replies(false, "hi, hello", "Hey!");
        List<AutoReply.Rule> rules = AutoReply.rules(Settings.preferences);
        assertEquals("Hey!", AutoReply.match(rules, "HI there").reply);
        assertEquals("Hey!", AutoReply.match(rules, "well, hello?").reply);
        assertNull(AutoReply.match(rules, "this is not a greeting"));
        assertNull(AutoReply.match(rules, "chicken"));
    }

    @Test public void anEmptyWordsBoxAnswersAnyMessageAndTheFirstMatchWins() {
        replies(false, "lunch", "At noon", "", "Away right now");
        List<AutoReply.Rule> rules = AutoReply.rules(Settings.preferences);
        assertEquals("At noon", AutoReply.match(rules, "lunch today?").reply);
        assertEquals("Away right now", AutoReply.match(rules, "anything else").reply);
    }

    @Test public void keepsRepliesWithTextUpToTheLimit() {
        List<AutoReply.Rule> rules = new ArrayList<>();
        rules.add(new AutoReply.Rule("no reply here", "  "));
        for (int i = 0; i < AutoReply.MAX_RULES + 3; i++) rules.add(new AutoReply.Rule("w" + i, "r" + i));
        assertEquals(AutoReply.MAX_RULES, AutoReply.save(Settings.preferences, rules, true));
        List<AutoReply.Rule> saved = AutoReply.rules(Settings.preferences);
        assertEquals(AutoReply.MAX_RULES, saved.size());
        assertEquals("w0", saved.get(0).when);
        assertTrue(Settings.preferences.getBoolean(AutoReply.GROUPS, false));
    }

    @Test public void aDamagedValueReadsAsNoRepliesAndTheHookSkipsTheMessage() {
        Settings.preferences.edit().putString(AutoReply.RULES, "{not json").commit();
        assertTrue(AutoReply.rules(Settings.preferences).isEmpty());
        assertFalse(AutoReply.wanted());
        replies(false, "", "Away");
        assertTrue(AutoReply.wanted());
        Settings.preferences.edit().putBoolean(AutoReply.KEY, false).commit();
        assertFalse(AutoReply.wanted());
    }

    @Test public void answersThroughTheNotificationsReplyAction() {
        replies(false, "free", "Busy, back soon");
        notification(CHAT);
        assertTrue(AutoReply.answer("are you free tonight?", CHAT, null));
        assertEquals("Busy, back soon", sent());
        assertTrue(Settings.lastActive(AutoReply.KEY) > 0);
    }

    @Test public void handsTheMessageLogTheSenderBeforeTheReplyTakesTheNotificationDown() {
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).commit();
        MessageLog.forgetCaptures();
        replies(false, "", "Away");
        notification(CHAT);
        assertTrue(AutoReply.answer("are you there?", CHAT, "mid.1"));
        manager.cancelAll();
        assertEquals("Ana", MessageLog.named(context, new MessageLog.Entry(1, CHAT, "are you there?", "", "", "mid.1")).sender);
    }

    private static Notification.MessagingStyle group(String... senderThenText) {
        Notification.MessagingStyle style = new Notification.MessagingStyle(new android.app.Person.Builder().setName("Me").build())
            .setConversationTitle("Climbing").setGroupConversation(true);
        for (int i = 0; i < senderThenText.length; i += 2) {
            style.addMessage(senderThenText[i + 1], i, new android.app.Person.Builder().setName(senderThenText[i]).build());
        }
        return style;
    }

    /**
     * Ana and Bo send the same words in a group, and the reply to Ana's takes the notification down before the log names
     * either. The names noted for Ana's message stay on it, and Bo's isn't given them.
     */
    @Test public void namesNotedForOneMessageNeverLandOnAnotherWithTheSameWords() {
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).commit();
        MessageLog.forgetCaptures();
        replies(true, "", "Away");
        notification(GROUP, group("Ana", "on my way"));
        assertTrue(AutoReply.answer("on my way", GROUP, "mid.1"));
        manager.cancelAll();
        // Bo's came in during the cooldown, so it gets no reply and no names of its own.
        assertFalse(AutoReply.answer("on my way", GROUP, "mid.2"));
        assertEquals("", MessageLog.named(context, new MessageLog.Entry(2, GROUP, "on my way", "", "", "mid.2")).sender);
        MessageLog.Entry ana = MessageLog.named(context, new MessageLog.Entry(1, GROUP, "on my way", "", "", "mid.1"));
        assertEquals("Ana", ana.sender);
        assertEquals("Climbing", ana.chat);
    }

    /** When the notification shows the same words from two people, the reply's noted names leave the sender unknown. */
    @Test public void theSameWordsFromTwoPeopleLeaveTheNotedSenderUnknown() {
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).commit();
        MessageLog.forgetCaptures();
        replies(true, "", "Away");
        notification(GROUP, group("Ana", "on my way", "Bo", "on my way"));
        assertTrue(AutoReply.answer("on my way", GROUP, "mid.1"));
        manager.cancelAll();
        MessageLog.Entry named = MessageLog.named(context, new MessageLog.Entry(1, GROUP, "on my way", "", "", "mid.1"));
        assertEquals("", named.sender);
        assertEquals("Climbing", named.chat);
    }

    @Test public void answersEachChatAtMostOnceEveryFiveMinutes() {
        replies(false, "", "Away");
        notification(CHAT);
        assertTrue(AutoReply.answer("one", CHAT, null));
        now[0] += AutoReply.COOLDOWN_MS - 1;
        assertFalse(AutoReply.answer("two", CHAT, null));
        now[0] += 1;
        assertTrue(AutoReply.answer("three", CHAT, null));
    }

    @Test public void leavesGroupChatsAloneUnlessAllowed() {
        replies(false, "", "Away");
        notification(GROUP);
        assertFalse(AutoReply.answer("hello all", GROUP, null));
        assertNull(sent());
        replies(true, "", "Away");
        assertTrue(AutoReply.answer("hello all", GROUP, null));
        assertTrue(AutoReply.oneToOne("ONE_TO_ONE:1:2"));
        assertFalse(AutoReply.oneToOne("GROUP:3"));
    }

    /** Marketplace chats carry their own MARKETPLACE type, not ONE_TO_ONE, and are still one buyer and one seller (#227). */
    @Test public void answersAMarketplaceChatWithGroupsOff() {
        String marketplace = "MARKETPLACE:410775001:100012345";
        replies(false, "", "Away");
        notification(marketplace);
        AutoReply.received("is this still available?", marketplace, "mid.1");
        runQueued();
        assertEquals("Away", sent());
        assertTrue(AutoReply.lastReply.containsKey(marketplace));
        assertFalse(AutoReply.oneToOne("COMMUNITY_CHANNEL:5"));
        assertFalse(AutoReply.oneToOne("AI_BOT:6"));
    }

    @Test public void neverAnswersAMessageThatIsOneOfItsOwnReplies() {
        replies(false, "", "Away right now");
        notification(CHAT);
        assertFalse(AutoReply.answer(" away right now ", CHAT, null));
        assertNull(sent());
    }

    @Test public void noNotificationMeansNoReplyAndNoCooldown() {
        replies(false, "", "Away");
        assertFalse(AutoReply.answer("hello", CHAT, null));
        assertFalse(AutoReply.lastReply.containsKey(CHAT));
        notification(CHAT);
        assertTrue(AutoReply.answer("hello", CHAT, null));
    }

    /** A chat let on only for the message log has no notification to answer through, so it gets no reply. */
    @Test public void aChatLetOnOnlyForTheLogGetsNoAnswer() {
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).putBoolean(QuietChats.KEY, true).commit();
        QuietChats.forget();
        try {
            replies(false, "", "Away");
            notification(CHAT);
            assertTrue(Settings.quietChat(CHAT));
            Settings.autoReplyTo("are you there?", CHAT);
            assertTrue(queued.isEmpty());
            Settings.loudChat(CHAT);
            Settings.autoReplyTo("are you there?", CHAT);
            runQueued();
            assertEquals("Away", sent());
        } finally {
            QuietChats.forget();
        }
    }

    /** A Reply token Messenger canceled sends nothing and holds no cooldown, so the next message in the chat is answered. */
    @Test public void aCanceledReplyTokenLeavesNoCooldown() {
        replies(false, "", "Away");
        notification(CHAT).cancel();
        assertFalse(AutoReply.answer("hello", CHAT, "mid.1"));
        assertNull(sent());
        assertFalse(AutoReply.lastReply.containsKey(CHAT));
        now[0] += 1_000;
        notification(CHAT);
        assertTrue(AutoReply.answer("hello again", CHAT, "mid.2"));
        assertEquals("Away", sent());
        // A reply that went out keeps its cooldown.
        now[0] += 1_000;
        assertFalse(AutoReply.answer("third", CHAT, "mid.3"));
        assertTrue(AutoReply.lastReply.containsKey(CHAT));
    }

    /** A canceled token is usually Messenger replacing the notification, so the one retry answers through the new one. */
    @Test public void aCanceledReplyTokenIsRetriedOnceThroughTheReplacement() {
        replies(false, "", "Away");
        notification(CHAT).cancel();
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        assertNull(sent());
        assertEquals(1, queued.size());
        assertEquals(1, AutoReply.pending());
        // The sync copy of the same message is dropped as seen, and the retry answers it.
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        assertEquals(1, queued.size());
        runQueued();
        assertEquals("Away", sent());
        assertTrue(queued.isEmpty());
        assertEquals(0, AutoReply.pending());
    }

    /** Canceled every time it looks: nothing is sent, nothing waits, and no cooldown is left behind. */
    @Test public void aRetryThatIsCanceledAgainGivesUpCleanly() {
        replies(false, "", "Away");
        notification(CHAT).cancel();
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        notification(CHAT).cancel();
        runUntilQuiet();
        assertNull(sent());
        assertTrue(queued.isEmpty());
        assertEquals(0, AutoReply.pending());
        assertFalse(AutoReply.lastReply.containsKey(CHAT));
    }

    @Test public void pauseAndOffSendNothing() {
        replies(false, "", "Away");
        notification(CHAT);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(AutoReply.answer("hello", CHAT, null));
        Settings.preferences.edit().putBoolean("paused", false).putBoolean(AutoReply.KEY, false).commit();
        assertFalse(AutoReply.answer("hello", CHAT, null));
        assertNull(sent());
    }

    @Test public void theSameMessageDeliveredTwiceIsAnsweredOnce() {
        replies(false, "", "Away");
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        AutoReply.received("hello", CHAT, "mid.1");
        assertEquals(1, queued.size());
        runQueued();
        assertEquals("Away", sent());
        assertEquals(0, AutoReply.pending());
    }

    @Test public void aBurstPastTheCapIsSkippedAndTheQueueRecovers() {
        replies(false, "", "Away");
        for (int i = 0; i < AutoReply.MAX_PENDING + 10; i++) AutoReply.received("m" + i, CHAT, "mid." + i);
        assertEquals(AutoReply.MAX_PENDING, queued.size());
        assertEquals(AutoReply.MAX_PENDING, AutoReply.pending());
        // No notification yet: each one keeps its place while it waits for one.
        runQueued();
        assertEquals(AutoReply.MAX_PENDING, AutoReply.pending());
        runUntilQuiet();
        assertEquals(0, AutoReply.pending());
        assertNull(sent());
        AutoReply.received("later", CHAT, "mid.later");
        assertEquals(1, queued.size());
    }

    /** #182: the answer used to sit out a fixed wait. It now looks almost at once and sends on the first look. */
    @Test public void aReplyGoesOutOnTheFirstLookWhenTheNotificationIsAlreadyUp() {
        replies(false, "", "Away");
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        assertEquals(1, delays.size());
        assertTrue("waited " + delays.get(0) + "ms before even looking", delays.get(0) <= 300);
        runQueued();
        assertEquals("Away", sent());
        assertTrue(queued.isEmpty());
        assertEquals(0, AutoReply.pending());
    }

    /** #182: while the notification is still coming it looks again on a short beat, not after seconds. */
    @Test public void aMessageWaitingForItsNotificationIsLookedAtAgainOnAShortBeat() {
        replies(false, "", "Away");
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        assertEquals(1, delays.size());
        assertTrue("waited " + delays.get(0) + "ms before looking again", delays.get(0) <= 500);
        assertEquals(1, AutoReply.pending());
        // Past the deadline it stops looking instead of waiting on a notification that never came.
        long started = now[0];
        runUntilQuiet();
        assertEquals(0, AutoReply.pending());
        assertNull(sent());
        assertTrue(now[0] - started >= AutoReply.GIVE_UP_MS - AutoReply.FIRST_MS - AutoReply.RECHECK_MS);
    }

    @Test public void aRetryWaitsForTheNotificationAndAnswersOnce() {
        replies(false, "", "Away");
        AutoReply.received("hello", CHAT, "mid.1");
        runQueued();
        assertEquals(1, queued.size());
        assertEquals(1, AutoReply.pending());
        notification(CHAT);
        runQueued();
        assertEquals("Away", sent());
        assertTrue(queued.isEmpty());
        assertEquals(0, AutoReply.pending());
    }

    @Test public void turningTheSwitchOffAndOnOrPausingDropsAnEarlierMessage() {
        replies(false, "", "Away");
        notification(CHAT);
        AutoReply.received("hello", CHAT, "mid.1");
        Settings.preferences.edit().putBoolean(AutoReply.KEY, false).commit();
        Settings.preferences.edit().putBoolean(AutoReply.KEY, true).commit();
        runQueued();
        assertNull(sent());
        assertEquals(0, AutoReply.pending());
        AutoReply.received("hello again", CHAT, "mid.2");
        Settings.preferences.edit().putBoolean("paused", true).commit();
        Settings.preferences.edit().putBoolean("paused", false).commit();
        runQueued();
        assertNull(sent());
        assertEquals(0, AutoReply.pending());
    }

    /** A reply edited after a message came in never goes to that message. Later messages get the new one. */
    @Test public void editingTheRepliesDropsAMessageQueuedBefore() {
        replies(false, "free", "Busy");
        notification(CHAT);
        AutoReply.received("are you free?", CHAT, "mid.1");
        replies(false, "free", "Call me");
        runQueued();
        assertNull(sent());
        AutoReply.received("are you free now?", CHAT, "mid.2");
        runQueued();
        assertEquals("Call me", sent());
    }

    @Test public void aClockSetBackDoesNotHoldTheCooldown() {
        replies(false, "", "Away");
        notification(CHAT);
        assertTrue(AutoReply.answer("one", CHAT, null));
        now[0] -= 24L * 60 * 60 * 1000;
        assertTrue(AutoReply.answer("two", CHAT, null));
    }

    /** Group messages with groups off, words no reply matches and a chat cooling down never take a place in the queue. */
    @Test public void messagesThatCantBeAnsweredNeverCrowdOutOneThatCan() {
        replies(false, "free", "Busy");
        for (int i = 0; i < AutoReply.MAX_PENDING + 5; i++) {
            AutoReply.received("are you free? " + i, GROUP, "g." + i);
            AutoReply.received("hello " + i, CHAT, "c." + i);
        }
        assertEquals(0, AutoReply.pending());
        assertTrue(queued.isEmpty());
        notification(CHAT);
        AutoReply.received("are you free?", CHAT, "c.free");
        assertEquals(1, AutoReply.pending());
        runQueued();
        assertEquals("Busy", sent());
        AutoReply.received("still free?", CHAT, "c.later");
        assertEquals("The chat is cooling down", 0, AutoReply.pending());
        assertTrue(queued.isEmpty());
    }

    /** The second copy of a message no reply matched stays unanswered when a matching reply is saved in between. */
    @Test public void aReplySavedBetweenTwoCopiesDoesntAnswerTheOlderMessage() {
        replies(false, "free", "Busy");
        notification(CHAT);
        AutoReply.received("lunch?", CHAT, "c.1");
        assertEquals(0, AutoReply.pending());
        replies(false, "lunch", "At noon");
        AutoReply.received("lunch?", CHAT, "c.1");
        assertEquals(0, AutoReply.pending());
        assertTrue(queued.isEmpty());
        AutoReply.received("lunch?", CHAT, "c.2");
        assertEquals(1, AutoReply.pending());
    }

    /** A failure inside the check stays in the extension, so Messenger still builds the notification. */
    @Test public void aFailingCheckNeverReachesMessenger() {
        replies(false, "", "Away");
        AutoReply.Scheduler working = AutoReply.scheduler;
        java.util.function.LongSupplier clock = AutoReply.clock;
        AutoReply.clock = () -> { throw new IllegalStateException("clock gone"); };
        try {
            AutoReply.received("hello", CHAT, "c.1");
            AutoReply.clock = clock;
            AutoReply.scheduler = (task, delayMs) -> { throw new IllegalStateException("queue gone"); };
            AutoReply.received("hello", CHAT, "c.2");
            assertEquals(0, AutoReply.pending());
        } finally {
            AutoReply.scheduler = working;
            AutoReply.clock = clock;
        }
    }

    /**
     * Your own line with the same words doesn't hide who sent a message, and never names you. Two other people with the
     * same words leave a group unknown.
     */
    @Test public void aOneToOneChatStillNamesTheOtherPersonWhenYourOwnLineMatchesToo() {
        android.app.Person me = new android.app.Person.Builder().setName("Me").build();
        Notification.MessagingStyle style = new Notification.MessagingStyle(me)
            .addMessage("ok", 1, me).addMessage("ok", 2, new android.app.Person.Builder().setName("Ana").build());
        Notification shown = new Notification.Builder(context, "chats").setSmallIcon(android.R.drawable.sym_def_app_icon)
            .setContentTitle("Ana").setStyle(style).build();
        assertEquals("Ana", ChatNotifications.sender(shown, "ok", CHAT));
        assertNull(ChatNotifications.sender(new Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle("Climbing")
            .setStyle(group("Ana", "ok", "Bo", "ok")).build(), "ok", GROUP));
        assertEquals("Ana", ChatNotifications.sender(new Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle("Climbing")
            .setStyle(group("Me", "ok", "Ana", "ok")).build(), "ok", GROUP));
        // Only your own line has the words, so the message itself isn't shown yet.
        assertNull(ChatNotifications.sender(new Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle("Climbing")
            .setStyle(group("Me", "lunch?", "Ana", "hi")).build(), "lunch?", GROUP));
        Notification mine = new Notification.Builder(context, "chats").setSmallIcon(android.R.drawable.sym_def_app_icon)
            .setContentTitle("Ana").setStyle(new Notification.MessagingStyle(me).addMessage("lunch?", 1, me)
                .addMessage("hi", 2, new android.app.Person.Builder().setName("Ana").build())).build();
        assertEquals("Ana", ChatNotifications.sender(mine, "lunch?", CHAT));
    }
}
