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

    @Before public void setUp() {
        reset();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
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
        // Mentions, reactions, sends and story fetches all go out as usual.
        for (String other : Arrays.asList("org.telegram.tgnet.TLRPC$TL_messages_readMentions",
                "org.telegram.tgnet.TLRPC$TL_messages_readReactions", "org.telegram.tgnet.TLRPC$TL_account_updateStatus",
                "org.telegram.tgnet.TLRPC$TL_messages_sendMessage", "org.telegram.tgnet.TLRPC$TL_messages_getHistory",
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
}
