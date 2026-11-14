/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.telegram.tgnet.RequestDelegate;
import org.telegram.tgnet.TLRPC;
import org.telegram.tgnet.tl.TL_account;
import org.telegram.tgnet.tl.TL_stories;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GhostModeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Sent sent;

    @Before public void setUp() {
        reset();
        HookStatus.clear();
        sent = new Sent();
        GhostMode.requests = sent;
    }

    @After public void tearDown() {
        PauseForTests.resume();
        GhostMode.chats = CHATS;
        GhostMode.requests = REQUESTS;
        SettingReadsForTests.mend(Settings.GHOST_MODE);
        reset();
        HookStatus.clear();
    }

    private static void reset() {
        Settings.GHOST_MODE.resetToDefault();
        Settings.GHOST_READS.resetToDefault();
        Settings.GHOST_STORIES.resetToDefault();
        Settings.GHOST_TYPING.resetToDefault();
        Settings.GHOST_ONLINE.resetToDefault();
        Settings.GHOST_READ_AFTER_SEND.resetToDefault();
        Settings.GHOST_READS_BUTTON.resetToDefault();
        Settings.GHOST_CHATS.resetToDefault();
        GhostChats.save(Collections.emptySet());
        GhostChats.forget();
        GhostMode.forgetHeld();
    }

    private static final GhostMode.Chats CHATS = GhostMode.chats;
    private static final GhostMode.Requests REQUESTS = GhostMode.requests;

    /** Telegram's sending as the gate sees it: each request comes back through drop() on its way out. */
    private static final class Sent implements GhostMode.Requests {
        int account;
        boolean works = true;
        final List<Object> requests = new ArrayList<>();
        final List<Integer> accounts = new ArrayList<>();
        final List<Object> callbacks = new ArrayList<>();
        final List<Integer> signedIn = new ArrayList<>();

        @Override public int account() {
            return account;
        }

        @Override public List<Integer> signedIn() {
            return signedIn;
        }

        @Override public boolean send(int from, Object request, Object callback) {
            if (!works) return false;
            requests.add(request);
            accounts.add(from);
            callbacks.add(callback);
            assertFalse("the gate kept back a read it was sending itself", GhostMode.drop(request, null));
            return true;
        }
    }

    private static TLRPC.TL_messages_readHistory read(TLRPC.InputPeer peer, int max) {
        TLRPC.TL_messages_readHistory request = new TLRPC.TL_messages_readHistory();
        request.peer = peer;
        request.max_id = max;
        return request;
    }

    private static TLRPC.InputPeer user(long id) {
        TLRPC.InputPeer peer = new TLRPC.TL_inputPeerUser();
        peer.user_id = id;
        return peer;
    }

    private static TLRPC.InputPeer group(long id) {
        TLRPC.InputPeer peer = new TLRPC.TL_inputPeerChat();
        peer.chat_id = id;
        return peer;
    }

    private static TLRPC.InputPeer supergroup(long id) {
        TLRPC.InputPeer peer = new TLRPC.TL_inputPeerChannel();
        peer.channel_id = id;
        return peer;
    }

    private static TLRPC.TL_messages_sendMessage message(TLRPC.InputPeer peer) {
        TLRPC.TL_messages_sendMessage request = new TLRPC.TL_messages_sendMessage();
        request.peer = peer;
        request.message = "hi";
        return request;
    }

    private static TLRPC.TL_inputEncryptedChat secret(int id) {
        TLRPC.TL_inputEncryptedChat chat = new TLRPC.TL_inputEncryptedChat();
        chat.chat_id = id;
        return chat;
    }

    private static TLRPC.TL_messages_readEncryptedHistory secretRead(int id) {
        TLRPC.TL_messages_readEncryptedHistory request = new TLRPC.TL_messages_readEncryptedHistory();
        request.peer = secret(id);
        return request;
    }

    private static TLRPC.TL_messages_sendEncrypted secretMessage(int id) {
        TLRPC.TL_messages_sendEncrypted request = new TLRPC.TL_messages_sendEncrypted();
        request.peer = secret(id);
        return request;
    }

    private static TLRPC.TL_channels_readHistory channelRead(long id) {
        TLRPC.TL_channels_readHistory request = new TLRPC.TL_channels_readHistory();
        request.channel = new TLRPC.TL_inputChannel();
        request.channel.channel_id = id;
        return request;
    }

    private static TLRPC.Chat channel(boolean broadcast, boolean megagroup) {
        TLRPC.Chat chat = new TLRPC.TL_channel();
        chat.broadcast = broadcast;
        chat.megagroup = megagroup;
        return chat;
    }

    @Test public void aBroadcastChannelsReadGoesOutSoItsBadgeClearsOnOtherDevices() {
        Settings.GHOST_MODE.save(true);
        GhostMode.chats = id -> id == 7 ? channel(true, false) : id == 8 ? channel(false, true) : null;
        assertFalse(GhostMode.drop(channelRead(7), null));
        // A supergroup's members can see who read, and a channel this phone can't place stays back too.
        assertTrue(GhostMode.drop(channelRead(8), null));
        assertTrue(GhostMode.drop(channelRead(9), null));
        assertTrue(GhostMode.drop(new TLRPC.TL_channels_readHistory(), null));
        assertEquals(Arrays.asList("Disable analytics: invoked 4, 0 found, 0 missing. "
                        + "Counted: channel reads sent 1, read receipts kept back 3"),
                HookStatus.report());
        // With Ghost mode off the channel isn't looked up at all.
        Settings.GHOST_MODE.save(false);
        GhostMode.chats = id -> {
            throw new AssertionError("looked up " + id);
        };
        assertFalse(GhostMode.drop(channelRead(7), null));
    }

    @Test public void aChannelThatCantBeLookedUpStaysKeptBackAndSaysSo() {
        Settings.GHOST_MODE.save(true);
        GhostMode.chats = id -> {
            throw new ClassNotFoundException("no controller");
        };
        assertTrue(GhostMode.drop(channelRead(7), null));
        assertEquals(Arrays.asList("a working 'ghost mode channel read' hook (it threw java.lang.ClassNotFoundException)"),
                HookStatus.missing(FamilyNames.DISABLE_ANALYTICS));
        // Without Telegram's tables there's nothing to place it in either.
        GhostMode.chats = CHATS;
        assertTrue(GhostMode.drop(channelRead(7), null));
    }

    @Test public void offByDefaultWithBothPartsReadyForWhenItIsTurnedOn() {
        assertFalse(Settings.GHOST_MODE.get());
        assertTrue(Settings.GHOST_READS.get());
        assertTrue(Settings.GHOST_STORIES.get());
        assertFalse(Settings.GHOST_TYPING.get());
        assertFalse(Settings.GHOST_ONLINE.get());
        assertFalse(GhostMode.drop(new TL_stories.TL_stories_readStories(), null));
        assertTrue(HookStatus.report().stream().noneMatch(row -> row.contains("Counted:")));
    }

    @Test public void everyReadReceiptAndStoryViewRequestIsKnownByItsTelegramName() {
        for (String read : Arrays.asList("TL_messages_readHistory", "TL_channels_readHistory",
                "TL_messages_readMessageContents", "TL_channels_readMessageContents",
                "TL_messages_readEncryptedHistory", "TL_messages_readDiscussion", "TL_messages_readSavedHistory")) {
            assertEquals(read, GhostMode.Kind.READ, GhostMode.kind("org.telegram.tgnet.TLRPC$" + read));
        }
        assertEquals(GhostMode.Kind.STORY, GhostMode.kind("org.telegram.tgnet.tl.TL_stories$TL_stories_readStories"));
        assertEquals(GhostMode.Kind.STORY, GhostMode.kind("org.telegram.tgnet.tl.TL_stories$TL_stories_incrementStoryViews"));
        assertEquals(GhostMode.Kind.TYPING, GhostMode.kind("org.telegram.tgnet.TLRPC$TL_messages_setTyping"));
        assertEquals(GhostMode.Kind.TYPING, GhostMode.kind("org.telegram.tgnet.TLRPC$TL_messages_setEncryptedTyping"));
        assertEquals(GhostMode.Kind.ONLINE, GhostMode.kind("org.telegram.tgnet.tl.TL_account$updateStatus"));
        // Sends go out as usual, and only tell Ghost mode which chat was replied in.
        for (String send : Arrays.asList("TL_messages_sendMessage", "TL_messages_sendMedia", "TL_messages_sendMultiMedia",
                "TL_messages_sendInlineBotResult", "TL_messages_sendEncrypted", "TL_messages_sendEncryptedFile",
                "TL_messages_sendEncryptedMultiMedia")) {
            assertEquals(send, GhostMode.Kind.SEND, GhostMode.kind("org.telegram.tgnet.TLRPC$" + send));
        }
        // Mentions, reactions, service messages and story fetches all go out as usual.
        for (String other : Arrays.asList("org.telegram.tgnet.TLRPC$TL_messages_readMentions",
                "org.telegram.tgnet.TLRPC$TL_messages_readReactions", "org.telegram.tgnet.TLRPC$TL_account_updateStatus",
                "org.telegram.tgnet.TLRPC$TL_messages_sendEncryptedService", "org.telegram.tgnet.TLRPC$TL_messages_getHistory",
                "org.telegram.tgnet.tl.TL_stories$TL_stories_getAllStories", "TL_messages_readHistory",
                "org.telegram.tgnet.TLRPC$TL_messages_readHistoryX", "")) {
            assertEquals(other, GhostMode.Kind.OTHER, GhostMode.kind(other));
        }
    }

    @Test public void onKeepsBackStoryViewsAndCountsEach() {
        Settings.GHOST_MODE.save(true);
        assertTrue(GhostMode.drop(new TL_stories.TL_stories_readStories(), null));
        assertTrue(GhostMode.drop(new TL_stories.TL_stories_incrementStoryViews(), null));
        assertEquals(Arrays.asList("Disable analytics: invoked 2, 0 found, 0 missing. Counted: story views kept back 2"),
                HookStatus.report());
    }

    @Test public void anyOtherRequestGoesOutWithoutReadingASettingOrCountingAnything() {
        Settings.GHOST_MODE.save(true);
        assertFalse(GhostMode.drop(new TLRPC.TL_auth_sendCode(), null));
        assertFalse(GhostMode.drop(new TL_stories.TL_stories_getAllStories(), null));
        assertFalse(GhostMode.drop(null, null));
        SettingReadsForTests.breakReads(Settings.GHOST_MODE);
        assertFalse(GhostMode.drop(new TLRPC.TL_auth_sendCode(), null));
        SettingsContextRule.withoutContext(() -> assertFalse(GhostMode.drop(new TLRPC.TL_auth_sendCode(), null)));
        assertTrue(HookStatus.report().isEmpty());
        assertTrue(HookStatus.missing(FamilyNames.DISABLE_ANALYTICS).isEmpty());
    }

    @Test public void onKeepsBackReadReceiptsAndCountsEach() {
        Settings.GHOST_MODE.save(true);
        assertTrue(GhostMode.keepBack(GhostMode.Kind.READ));
        assertTrue(GhostMode.keepBack(GhostMode.Kind.READ));
        assertFalse(GhostMode.keepBack(GhostMode.Kind.OTHER));
        assertEquals(Arrays.asList("Disable analytics: invoked 2, 0 found, 0 missing. Counted: read receipts kept back 2"),
                HookStatus.report());
    }

    @Test public void eachPartAnswersOnlyForItsOwnRequests() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_STORIES.save(false);
        assertFalse(GhostMode.drop(new TL_stories.TL_stories_readStories(), null));
        assertFalse(GhostMode.drop(new TL_stories.TL_stories_incrementStoryViews(), null));
        assertTrue(GhostMode.keepBack(GhostMode.Kind.READ));
        Settings.GHOST_STORIES.save(true);
        Settings.GHOST_READS.save(false);
        assertFalse(GhostMode.keepBack(GhostMode.Kind.READ));
        assertTrue(GhostMode.drop(new TL_stories.TL_stories_readStories(), null));
        assertEquals(Arrays.asList("Disable analytics: invoked 5, 0 found, 0 missing. "
                        + "Counted: read receipts kept back 1, story views kept back 1"),
                HookStatus.report());
    }

    private static TL_account.updateStatus status(boolean offline) {
        TL_account.updateStatus request = new TL_account.updateStatus();
        request.offline = offline;
        return request;
    }

    @Test public void typingIsKeptBackOnlyWithItsOwnSwitchAndCountsEach() {
        Settings.GHOST_MODE.save(true);
        assertFalse(GhostMode.drop(new TLRPC.TL_messages_setTyping(), null));
        Settings.GHOST_TYPING.save(true);
        assertTrue(GhostMode.drop(new TLRPC.TL_messages_setTyping(), null));
        assertTrue(GhostMode.drop(new TLRPC.TL_messages_setEncryptedTyping(), null));
        // The other parts stay as they were.
        assertTrue(GhostMode.drop(new TL_stories.TL_stories_readStories(), null));
        assertFalse(GhostMode.drop(status(false), null));
        Settings.GHOST_MODE.save(false);
        assertFalse(GhostMode.drop(new TLRPC.TL_messages_setTyping(), null));
        assertEquals(Arrays.asList("Disable analytics: invoked 6, 0 found, 0 missing. "
                        + "Counted: typing statuses kept back 2, story views kept back 1"),
                HookStatus.report());
    }

    @Test public void goingOnlineIsKeptBackAndGoingOfflineGoesOut() {
        Settings.GHOST_MODE.save(true);
        assertFalse(GhostMode.drop(status(false), null));
        Settings.GHOST_ONLINE.save(true);
        assertTrue(GhostMode.drop(status(false), null));
        assertTrue(GhostMode.drop(status(false), null));
        assertFalse(GhostMode.drop(status(true), null));
        assertFalse(GhostMode.drop(new TLRPC.TL_messages_setTyping(), null));
        assertEquals(Arrays.asList("Disable analytics: invoked 4, 0 found, 0 missing. Counted: online statuses kept back 2"),
                HookStatus.report());
    }

    private static void idle() {
        org.robolectric.shadows.ShadowLooper.idleMainLooper();
    }

    @Test public void turningTheOnlinePartOnSendsEverySignedInAccountOfflineAtOnce() {
        sent.signedIn.addAll(Arrays.asList(0, 2));
        // Ghost mode watches its switches from the first status Telegram sends.
        assertFalse(GhostMode.drop(status(true), null));
        Settings.GHOST_MODE.save(true);
        idle();
        assertTrue("the online part is still off", sent.requests.isEmpty());
        Settings.GHOST_ONLINE.save(true);
        idle();
        assertEquals(Arrays.asList(0, 2), sent.accounts);
        for (Object request : sent.requests) assertTrue(((TL_account.updateStatus) request).offline);
        assertTrue(HookStatus.report().toString(), HookStatus.report().get(0).endsWith("Counted: accounts sent offline 2"));
    }

    @Test public void turningGhostModeOnWithTheOnlinePartAlreadyOnSendsOfflineAndNothingElseDoes() {
        sent.signedIn.add(1);
        Settings.GHOST_ONLINE.save(true);
        assertFalse(GhostMode.drop(status(true), null));
        Settings.GHOST_MODE.save(true);
        idle();
        assertEquals(Arrays.asList(1), sent.accounts);
        Settings.GHOST_TYPING.save(true);
        Settings.GHOST_ONLINE.save(false);
        Settings.GHOST_MODE.save(false);
        idle();
        assertEquals(1, sent.requests.size());
    }

    @Test public void goingOfflineSendsNothingWhilePausedOrWithoutSettings() {
        sent.signedIn.add(0);
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_ONLINE.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), 0, GhostMode.goOffline());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertEquals(0, GhostMode.goOffline()));
        sent.works = false;
        assertEquals(0, GhostMode.goOffline());
        sent.works = true;
        assertEquals(1, GhostMode.goOffline());
    }

    private static TLRPC.TL_messages_getMessagesViews views(boolean increment) {
        TLRPC.TL_messages_getMessagesViews request = new TLRPC.TL_messages_getMessagesViews();
        request.peer = supergroup(5);
        request.increment = increment;
        return request;
    }

    @Test public void aChannelPostsViewCountStillLoadsButThisViewIsntAdded() {
        TLRPC.TL_messages_getMessagesViews off = views(true);
        assertFalse(GhostMode.drop(off, null));
        assertTrue("Ghost mode off counts the view as usual", off.increment);
        Settings.GHOST_MODE.save(true);
        TLRPC.TL_messages_getMessagesViews on = views(true);
        assertFalse(GhostMode.drop(on, null));
        assertFalse(on.increment);
        // A fetch that never counted is left alone, and with read receipts off the view counts again.
        assertFalse(GhostMode.drop(views(false), null));
        Settings.GHOST_READS.save(false);
        TLRPC.TL_messages_getMessagesViews reads = views(true);
        assertFalse(GhostMode.drop(reads, null));
        assertTrue(reads.increment);
        assertEquals(Arrays.asList("Disable analytics: invoked 3, 0 found, 0 missing. Counted: post views not counted 1"),
                HookStatus.report());
        assertEquals(GhostMode.Kind.VIEW, GhostMode.kind("org.telegram.tgnet.TLRPC$TL_messages_getMessagesViews"));
    }

    private static TLRPC.TL_messages_setTyping typing(TLRPC.InputPeer peer) {
        TLRPC.TL_messages_setTyping request = new TLRPC.TL_messages_setTyping();
        request.peer = peer;
        return request;
    }

    private static TL_stories.TL_stories_readStories story(TLRPC.InputPeer peer) {
        TL_stories.TL_stories_readStories request = new TL_stories.TL_stories_readStories();
        request.peer = peer;
        return request;
    }

    private static void exceptions(Long... chats) {
        Settings.GHOST_CHATS.save(true);
        assertTrue(GhostChats.save(new LinkedHashSet<>(Arrays.asList(chats))));
    }

    @Test public void whileGhostModeIsOnAnExceptionChatReadsAndTypesAsUsual() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_TYPING.save(true);
        exceptions(7L, -9L, -11L, 0x4000000000000003L);
        assertFalse(GhostMode.drop(read(user(7), 3), null));
        assertFalse(GhostMode.drop(read(group(9), 3), null));
        assertFalse(GhostMode.drop(channelRead(11), null));
        assertFalse(GhostMode.drop(secretRead(3), null));
        assertFalse(GhostMode.drop(typing(user(7)), null));
        assertFalse(GhostMode.drop(story(user(7)), null));
        // Every other chat stays kept back.
        assertTrue(GhostMode.drop(read(user(8), 3), null));
        assertTrue(GhostMode.drop(typing(user(8)), null));
        assertTrue(sent.requests.isEmpty());
        assertEquals(Arrays.asList("Disable analytics: invoked 8, 0 found, 0 missing. "
                        + "Counted: exceptions applied 6, read receipts kept back 1, typing statuses kept back 1"),
                HookStatus.report());
    }

    @Test public void whileGhostModeIsOffAnExceptionChatKeepsThingsBackUntilYouReply() {
        Settings.GHOST_TYPING.save(true);
        Settings.GHOST_READ_AFTER_SEND.save(true);
        exceptions(7L, -5L);
        TLRPC.TL_messages_readHistory read = read(user(7), 4);
        assertTrue(GhostMode.drop(read, null));
        assertTrue(GhostMode.drop(typing(user(7)), null));
        assertTrue(GhostMode.drop(story(user(7)), null));
        TLRPC.TL_messages_getMessagesViews views = views(true);
        assertFalse(GhostMode.drop(views, null));
        assertFalse("the exception channel's view isn't added", views.increment);
        // Other chats act as in stock Telegram.
        assertFalse(GhostMode.drop(read(user(8), 4), null));
        assertFalse(GhostMode.drop(typing(user(8)), null));
        assertTrue(sent.requests.isEmpty());
        // A reply elsewhere lets nothing out, and one in the exception sends the read it held.
        assertFalse(GhostMode.drop(message(user(8)), null));
        assertTrue(sent.requests.isEmpty());
        assertFalse(GhostMode.drop(message(user(7)), null));
        assertEquals(Collections.singletonList(read), sent.requests);
    }

    @Test public void onlineStatusAndPlayedVoiceMessagesFollowGhostModeItself() {
        Settings.GHOST_ONLINE.save(true);
        exceptions(7L);
        assertFalse(GhostMode.drop(status(false), null));
        assertFalse(GhostMode.drop(new TLRPC.TL_messages_readMessageContents(), null));
        Settings.GHOST_MODE.save(true);
        assertTrue(GhostMode.drop(status(false), null));
        assertTrue(GhostMode.drop(new TLRPC.TL_messages_readMessageContents(), null));
        assertFalse(HookStatus.report().toString(), HookStatus.report().toString().contains("threw"));
        assertFalse(HookStatus.report().toString(), HookStatus.report().toString().contains("exceptions applied"));
    }

    @Test public void theListDoesNothingWithItsSwitchOff() {
        Settings.GHOST_MODE.save(true);
        exceptions(7L);
        Settings.GHOST_CHATS.save(false);
        assertTrue(GhostMode.drop(read(user(7), 2), null));
        Settings.GHOST_CHATS.save(true);
        assertFalse(GhostMode.drop(read(user(7), 2), null));
    }

    /** A request's callback that keeps what Telegram would have been told. */
    private static final class Answers implements RequestDelegate {
        final List<Object> responses = new ArrayList<>();
        final List<TLRPC.TL_error> errors = new ArrayList<>();

        @Override public void run(Object response, TLRPC.TL_error error) {
            responses.add(response);
            errors.add(error);
        }
    }

    @Test public void aKeptBackTypingStatusIsAnsweredSoTelegramCanSendTheNextOne() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_TYPING.save(true);
        Settings.GHOST_ONLINE.save(true);
        Answers typing = new Answers();
        assertTrue(GhostMode.drop(new TLRPC.TL_messages_setTyping(), typing));
        assertTrue(GhostMode.drop(new TLRPC.TL_messages_setEncryptedTyping(), typing));
        assertEquals(Arrays.asList((Object) null, null), typing.responses);
        for (TLRPC.TL_error error : typing.errors) {
            assertEquals(GhostMode.ERROR_CODE, error.code);
            assertEquals(GhostMode.ERROR_TEXT, error.text);
        }
        // Story views and online statuses leave no waiting mark behind, so their callbacks stay unrun.
        Answers others = new Answers();
        assertTrue(GhostMode.drop(new TL_stories.TL_stories_readStories(), others));
        assertTrue(GhostMode.drop(status(false), others));
        assertTrue(others.responses.isEmpty());
        // A typing status that goes out gets the server's answer, never this one.
        Settings.GHOST_TYPING.save(false);
        Answers sent = new Answers();
        assertFalse(GhostMode.drop(new TLRPC.TL_messages_setTyping(), sent));
        assertTrue(sent.responses.isEmpty());
        assertTrue(HookStatus.missing(FamilyNames.DISABLE_ANALYTICS).isEmpty());
        assertEquals(Arrays.asList("Disable analytics: invoked 5, 0 found, 0 missing. "
                        + "Counted: typing statuses kept back 2, story views kept back 1, online statuses kept back 1"),
                HookStatus.report());
    }

    @Test public void aTypingAnswerThatFailsStillKeepsItBackAndSaysSo() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_TYPING.save(true);
        RequestDelegate throwing = (response, error) -> {
            throw new IllegalStateException("callback");
        };
        assertTrue(GhostMode.drop(new TLRPC.TL_messages_setTyping(), throwing));
        // A callback with no run(response, error) to answer through is a miss, not a throw.
        Runnable unanswerable = () -> { };
        assertTrue(GhostMode.drop(new TLRPC.TL_messages_setEncryptedTyping(), unanswerable));
        List<String> missing = HookStatus.missing(FamilyNames.DISABLE_ANALYTICS);
        assertEquals(missing.toString(), 2, missing.size());
        assertTrue(missing.toString(), missing.get(0).contains("ghost mode typing answer"));
        assertTrue(missing.toString(), missing.get(1).startsWith("method ") && missing.get(1).endsWith("#run"));
        assertTrue(HookStatus.report().toString(), HookStatus.report().get(0).endsWith("Counted: typing statuses kept back 2"));
    }

    @Test public void typingAndOnlineGoOutUnderEveryPauseReasonAndWhenSettingsAreUnavailable() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_TYPING.save(true);
        Settings.GHOST_ONLINE.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), GhostMode.drop(new TLRPC.TL_messages_setTyping(), null));
            assertFalse(reason.name(), GhostMode.drop(status(false), null));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            assertFalse(GhostMode.drop(new TLRPC.TL_messages_setEncryptedTyping(), null));
            assertFalse(GhostMode.drop(status(false), null));
        });
        assertTrue(HookStatus.report().stream().noneMatch(row -> row.contains("Counted:")));
        assertTrue(GhostMode.drop(status(false), null));
    }

    @Test public void thePartsNeedGhostModeOn() {
        Settings.GHOST_READS.save(true);
        Settings.GHOST_STORIES.save(true);
        assertFalse(GhostMode.drop(new TL_stories.TL_stories_readStories(), null));
        assertFalse(GhostMode.drop(new TL_stories.TL_stories_incrementStoryViews(), null));
        assertFalse(GhostMode.keepBack(GhostMode.Kind.READ));
        assertTrue(HookStatus.report().stream().noneMatch(row -> row.contains("Counted:")));
    }

    @Test public void everyPauseReasonLetsTheReceiptsGoAndResumeKeepsThemBackAgain() {
        Settings.GHOST_MODE.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), GhostMode.drop(new TL_stories.TL_stories_readStories(), null));
            assertFalse(reason.name(), GhostMode.keepBack(GhostMode.Kind.READ));
            PauseForTests.resume();
        }
        assertTrue(HookStatus.report().stream().noneMatch(row -> row.contains("Counted:")));
        assertTrue(GhostMode.drop(new TL_stories.TL_stories_readStories(), null));
    }

    @Test public void unavailableSettingsLetTheReceiptsGo() {
        Settings.GHOST_MODE.save(true);
        SettingsContextRule.withoutContext(() -> assertFalse(GhostMode.drop(new TL_stories.TL_stories_readStories(), null)));
        assertTrue(HookStatus.report().stream().noneMatch(row -> row.contains("Counted:")));
    }

    @Test public void anUnreadableSwitchLetsTheReceiptsGoAndSaysSo() {
        Settings.GHOST_MODE.save(true);
        SettingReadsForTests.breakReads(Settings.GHOST_MODE);
        assertFalse(GhostMode.drop(new TL_stories.TL_stories_incrementStoryViews(), null));
        assertEquals(Arrays.asList("a working 'ghost mode switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.DISABLE_ANALYTICS));
        assertTrue(HookStatus.report().stream().noneMatch(row -> row.contains("Counted:")));
    }

    @Test public void aReplyLetsOutTheNewestReadKeptBackInThatChatAndNoOther() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READ_AFTER_SEND.save(true);
        TLRPC.TL_messages_readHistory older = read(user(5), 10);
        TLRPC.TL_messages_readHistory newest = read(user(5), 20);
        TLRPC.TL_messages_readHistory inGroup = read(group(5), 30);
        Object newestAnswer = new Object();
        assertTrue(GhostMode.drop(older, new Object()));
        assertTrue(GhostMode.drop(newest, newestAnswer));
        assertTrue(GhostMode.drop(inGroup, null));

        assertFalse("a reply was kept back", GhostMode.drop(message(user(5)), null));
        assertEquals(Arrays.asList((Object) newest), sent.requests);
        // Telegram's own answer handling for that read runs when it finally goes.
        assertEquals(Arrays.asList(newestAnswer), sent.callbacks);
        // It went out once, and the group with the same number waits for its own reply.
        assertFalse(GhostMode.drop(message(user(5)), null));
        assertEquals(1, sent.requests.size());
        assertFalse(GhostMode.drop(message(group(5)), null));
        assertEquals(Arrays.asList((Object) newest, inGroup), sent.requests);
        // Saved Messages and a send with no chat name no one.
        assertFalse(GhostMode.drop(message(new TLRPC.TL_inputPeerSelf()), null));
        assertFalse(GhostMode.drop(new TLRPC.TL_messages_sendMessage(), null));
        assertEquals(2, sent.requests.size());
        assertTrue(HookStatus.missing(FamilyNames.DISABLE_ANALYTICS).isEmpty());
        assertEquals(Arrays.asList("Disable analytics: invoked 3, 0 found, 0 missing. "
                        + "Counted: read receipts kept back 3, reads sent after a reply 2"),
                HookStatus.report());
    }

    @Test public void secretChatsAndSupergroupsAreMatchedToTheirOwnReplies() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READ_AFTER_SEND.save(true);
        GhostMode.chats = id -> channel(false, true);
        TLRPC.TL_channels_readHistory inSupergroup = channelRead(7);
        TLRPC.TL_messages_readEncryptedHistory inSecret = secretRead(7);
        TLRPC.TL_messages_readHistory withPerson = read(user(7), 1);
        assertTrue(GhostMode.drop(inSupergroup, null));
        assertTrue(GhostMode.drop(inSecret, null));
        assertTrue(GhostMode.drop(withPerson, null));

        assertFalse(GhostMode.drop(secretMessage(7), null));
        assertEquals(Arrays.asList((Object) inSecret), sent.requests);
        TLRPC.TL_messages_sendMedia photo = new TLRPC.TL_messages_sendMedia();
        photo.peer = supergroup(7);
        assertFalse(GhostMode.drop(photo, null));
        assertEquals(Arrays.asList((Object) inSecret, inSupergroup), sent.requests);
        assertTrue(HookStatus.missing(FamilyNames.DISABLE_ANALYTICS).isEmpty());
    }

    @Test public void withReadAfterYouReplyOffOnlyTheButtonLetsAReadOut() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READS_BUTTON.save(true);
        TLRPC.TL_messages_readHistory held = read(user(5), 1);
        assertTrue(GhostMode.drop(held, null));

        assertFalse(GhostMode.drop(message(user(5)), null));
        assertTrue("a reply let a read out with its switch off", sent.requests.isEmpty());
        assertEquals(1, GhostMode.sendHeld());
        assertEquals(Arrays.asList((Object) held), sent.requests);
        assertEquals("nothing is left once they've gone", 0, GhostMode.sendHeld());
    }

    @Test public void theButtonSendsOnlyTheReadsOfTheAccountOnScreen() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READS_BUTTON.save(true);
        TLRPC.TL_messages_readHistory first = read(user(5), 1);
        TLRPC.TL_messages_readEncryptedHistory second = secretRead(3);
        assertTrue(GhostMode.drop(first, null));
        assertTrue(GhostMode.drop(second, null));
        sent.account = 1;
        TLRPC.TL_messages_readHistory otherAccount = read(user(5), 2);
        assertTrue(GhostMode.drop(otherAccount, null));

        assertEquals(1, GhostMode.sendHeld());
        assertEquals(Arrays.asList((Object) otherAccount), sent.requests);
        sent.account = 0;
        assertEquals(2, GhostMode.sendHeld());
        assertTrue(sent.requests.containsAll(Arrays.asList(first, second)));
        assertEquals(Arrays.asList(1, 0, 0), sent.accounts);
        assertEquals(0, GhostMode.sendHeld());
        assertEquals(Arrays.asList("Disable analytics: invoked 3, 0 found, 0 missing. "
                        + "Counted: read receipts kept back 3, reads sent from the button 3"),
                HookStatus.report());
    }

    @Test public void aChatsMenuSendsOnlyThatChatsRead() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READS_BUTTON.save(true);
        TLRPC.TL_messages_readHistory here = read(user(5), 1);
        TLRPC.TL_messages_readHistory elsewhere = read(user(6), 1);
        assertTrue(GhostMode.drop(here, null));
        assertTrue(GhostMode.drop(elsewhere, null));
        sent.account = 1;
        TLRPC.TL_messages_readHistory otherAccount = read(user(5), 2);
        assertTrue(GhostMode.drop(otherAccount, null));

        assertEquals(1, GhostMode.sendHeld(0, 5));
        assertEquals(Arrays.asList((Object) here), sent.requests);
        assertEquals("the chat's own account sends it, whatever account is on screen", Arrays.asList(0), sent.accounts);
        assertEquals("nothing is left in that chat", 0, GhostMode.sendHeld(0, 5));
        assertEquals("a chat with nothing held", 0, GhostMode.sendHeld(0, 7));
        sent.account = 0;
        assertEquals("the other chat and the other account keep theirs", 1, GhostMode.sendHeld());
        assertEquals(Arrays.asList((Object) here, elsewhere), sent.requests);
        assertEquals(1, GhostMode.sendHeld(1, 5));
        assertEquals(Arrays.asList((Object) here, elsewhere, otherAccount), sent.requests);

        TLRPC.TL_messages_readHistory stuck = read(group(9), 3);
        assertTrue(GhostMode.drop(stuck, null));
        sent.works = false;
        assertEquals(-1, GhostMode.sendHeld(0, -9));
        sent.works = true;
        assertEquals("a read that couldn't go waits for the next tap", 1, GhostMode.sendHeld(0, -9));
        assertEquals(stuck, sent.requests.get(3));
    }

    @Test public void aBuildThatCantSendKeepsTheReadsHeldForTheNextTry() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READS_BUTTON.save(true);
        Settings.GHOST_READ_AFTER_SEND.save(true);
        TLRPC.TL_messages_readHistory held = read(user(5), 1);
        assertTrue(GhostMode.drop(held, null));
        sent.works = false;

        assertEquals(-1, GhostMode.sendHeld());
        assertFalse(GhostMode.drop(message(user(5)), null));
        // A read that didn't go isn't let through the gate later.
        assertTrue(GhostMode.drop(held, null));
        sent.works = true;
        assertEquals(1, GhostMode.sendHeld());
        assertEquals(Arrays.asList((Object) held), sent.requests);
        // Unpatched, the send itself does nothing.
        assertFalse(GhostMode.sendRequest(0, held, null));
    }

    @Test public void nothingIsHeldWhileBothWaysOutAreOff() {
        Settings.GHOST_MODE.save(true);
        assertTrue(GhostMode.drop(read(user(5), 1), null));

        Settings.GHOST_READ_AFTER_SEND.save(true);
        assertFalse(GhostMode.drop(message(user(5)), null));
        assertEquals(0, GhostMode.sendHeld());
        assertTrue(sent.requests.isEmpty());
    }

    @Test public void aReplyLetsNothingOutWhileGhostModeIsOffOrPaused() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READ_AFTER_SEND.save(true);
        assertTrue(GhostMode.drop(read(user(5), 1), null));

        Settings.GHOST_MODE.save(false);
        assertFalse(GhostMode.drop(message(user(5)), null));
        Settings.GHOST_MODE.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(GhostMode.drop(message(user(5)), null));
        assertTrue(sent.requests.isEmpty());
        PauseForTests.resume();
        assertFalse(GhostMode.drop(message(user(5)), null));
        assertEquals(1, sent.requests.size());
    }
}
