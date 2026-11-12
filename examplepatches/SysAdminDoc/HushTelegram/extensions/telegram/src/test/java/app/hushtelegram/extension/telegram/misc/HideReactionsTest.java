/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.telegram.messenger.MessageObject;
import org.telegram.tgnet.TLRPC;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HideReactionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_REACTION_ROWS);
        SettingReadsForTests.mend(Settings.HIDE_REACTION_PICKER);
        SettingReadsForTests.mend(Settings.HIDE_EMOJI_PACK_NOTE);
        Settings.HIDE_REACTION_ROWS.resetToDefault();
        Settings.HIDE_REACTION_PICKER.resetToDefault();
        Settings.HIDE_EMOJI_PACK_NOTE.resetToDefault();
        HookStatus.clear();
    }

    @Test public void bothSwitchesStartOffAndLeaveTelegramAlone() {
        assertFalse(Settings.HIDE_REACTION_ROWS.get());
        assertFalse(Settings.HIDE_REACTION_PICKER.get());
        Object message = new Object();
        assertSame(message, DoubleTapReactions.rows(message, false, false));
        assertTrue(DoubleTapReactions.picker(true));
        assertFalse(DoubleTapReactions.picker(false));
    }

    @Test public void rowsGoAwayForMessagesButNotForTagsOrNoMessage() {
        Settings.HIDE_REACTION_ROWS.save(true);
        Object message = new Object();
        assertNull(DoubleTapReactions.rows(message, false, false));
        assertNull(DoubleTapReactions.rows(message, true, false));
        assertSame("Saved Messages tags are another feature", message, DoubleTapReactions.rows(message, false, true));
        assertNull(DoubleTapReactions.rows(null, false, false));
        assertTrue("the picker is its own switch", DoubleTapReactions.picker(true));
    }

    private static MessageObject reacted(boolean unread) {
        TLRPC.MessagePeerReaction reaction = new TLRPC.MessagePeerReaction();
        reaction.unread = unread;
        MessageObject message = new MessageObject();
        message.messageOwner = new TLRPC.Message();
        message.messageOwner.reactions = new TLRPC.TL_messageReactions();
        message.messageOwner.reactions.recent_reactions.add(reaction);
        return message;
    }

    @Test public void aHiddenRowStillTellsTheChatItsReactionsAreUnread() {
        MessageObject unread = reacted(true);
        assertSame(unread, DoubleTapReactions.rows(unread, false, false));
        assertFalse("off keeps Telegram's own answer", DoubleTapReactions.unreadRow(0));
        assertTrue(DoubleTapReactions.unreadRow(1));
        Settings.HIDE_REACTION_ROWS.save(true);
        assertNull(DoubleTapReactions.rows(unread, false, false));
        assertTrue("the chat marks the hidden reactions seen", DoubleTapReactions.unreadRow(0));
        assertFalse("answered once per setMessage", DoubleTapReactions.unreadRow(0));
        assertNull(DoubleTapReactions.rows(reacted(false), false, false));
        assertFalse("already seen", DoubleTapReactions.unreadRow(0));
        assertNull(DoubleTapReactions.rows(new MessageObject(), false, false));
        assertFalse("no stored message", DoubleTapReactions.unreadRow(0));
        assertNull(DoubleTapReactions.rows(unread, false, false));
        assertSame(unread, DoubleTapReactions.rows(unread, false, true));
        assertFalse("a tag row after a hidden one starts clean", DoubleTapReactions.unreadRow(0));
        assertTrue("a tag row keeps Telegram's own answer", DoubleTapReactions.unreadRow(1));
    }

    @Test public void anUnreadableMessageStillHidesItsRow() {
        Settings.HIDE_REACTION_ROWS.save(true);
        assertNull(DoubleTapReactions.rows(new Object(), false, false));
        assertFalse(DoubleTapReactions.unreadRow(0));
        assertFalse(HookStatus.missing(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS).isEmpty());
    }

    @Test public void theReactionEffectIsSkippedOnlyWhileRowsAreHidden() {
        assertFalse(DoubleTapReactions.hideEffect());
        Settings.HIDE_REACTION_PICKER.save(true);
        assertFalse("the picker is its own switch", DoubleTapReactions.hideEffect());
        Settings.HIDE_REACTION_ROWS.save(true);
        assertTrue(DoubleTapReactions.hideEffect());
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(DoubleTapReactions.hideEffect());
        PauseForTests.resume();
        SettingReadsForTests.breakReads(Settings.HIDE_REACTION_ROWS);
        assertFalse(DoubleTapReactions.hideEffect());
    }

    @Test public void talkBackSkipsReactionsOnlyWhileTheRowIsHidden() {
        TLRPC.TL_messageReactions reactions = new TLRPC.TL_messageReactions();
        assertSame("off reads like stock Telegram", reactions, DoubleTapReactions.spoken(reactions));
        Settings.HIDE_REACTION_ROWS.save(true);
        assertNull(DoubleTapReactions.spoken(reactions));
        assertNull(DoubleTapReactions.spoken(null));
        reactions.reactions_as_tags = true;
        assertSame("Saved Messages tags still show, so they still read", reactions, DoubleTapReactions.spoken(reactions));
        Settings.HIDE_REACTION_ROWS.save(false);
        Settings.HIDE_REACTION_PICKER.save(true);
        reactions.reactions_as_tags = false;
        assertSame("the picker is its own switch", reactions, DoubleTapReactions.spoken(reactions));
    }

    @Test public void talkBackFallsBackToStockWhenTheReactionsCantBeRead() {
        Settings.HIDE_REACTION_ROWS.save(true);
        Object odd = new Object();
        assertSame(odd, DoubleTapReactions.spoken(odd));
        assertFalse(HookStatus.missing(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS).isEmpty());
        TLRPC.TL_messageReactions reactions = new TLRPC.TL_messageReactions();
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertSame(reactions, DoubleTapReactions.spoken(reactions));
    }

    @Test public void pickerSwitchOnlyTurnsAnAvailablePickerOff() {
        Settings.HIDE_REACTION_PICKER.save(true);
        assertFalse(DoubleTapReactions.picker(true));
        assertFalse(DoubleTapReactions.picker(false));
        Object message = new Object();
        assertSame("the rows are their own switch", message, DoubleTapReactions.rows(message, false, false));
    }

    @Test public void selectionBubbleFollowsThePickerSwitch() {
        java.util.List<Object> selected = java.util.Collections.singletonList(new Object());
        assertSame("off keeps the bubble", selected, DoubleTapReactions.selection(selected));
        Settings.HIDE_REACTION_ROWS.save(true);
        assertSame("the rows are their own switch", selected, DoubleTapReactions.selection(selected));
        Settings.HIDE_REACTION_PICKER.save(true);
        assertTrue("an empty list is what makes Telegram drop the bubble", DoubleTapReactions.selection(selected).isEmpty());
        assertNull(DoubleTapReactions.selection(null));
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertSame(selected, DoubleTapReactions.selection(selected));
        PauseForTests.resume();
        SettingReadsForTests.breakReads(Settings.HIDE_REACTION_PICKER);
        assertSame(selected, DoubleTapReactions.selection(selected));
    }

    @Test public void emojiPackLineHasItsOwnSwitchAndKeepsABlockedAnswer() {
        assertFalse("off follows Telegram", DoubleTapReactions.packNote(0));
        assertTrue("blocked stays blocked", DoubleTapReactions.packNote(1));
        Settings.HIDE_REACTION_PICKER.save(true);
        assertFalse("the picker is its own switch", DoubleTapReactions.packNote(0));
        Settings.HIDE_EMOJI_PACK_NOTE.save(true);
        assertTrue(DoubleTapReactions.packNote(0));
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(DoubleTapReactions.packNote(0));
        PauseForTests.resume();
        SettingReadsForTests.breakReads(Settings.HIDE_EMOJI_PACK_NOTE);
        assertFalse(DoubleTapReactions.packNote(0));
    }

    @Test public void pausedAndBrokenReadsFallBackToStock() {
        Settings.HIDE_REACTION_ROWS.save(true);
        Settings.HIDE_REACTION_PICKER.save(true);
        Object message = new Object();
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertSame(message, DoubleTapReactions.rows(message, false, false));
        assertTrue(DoubleTapReactions.picker(true));
        PauseForTests.resume();
        SettingReadsForTests.breakReads(Settings.HIDE_REACTION_ROWS);
        SettingReadsForTests.breakReads(Settings.HIDE_REACTION_PICKER);
        assertSame(message, DoubleTapReactions.rows(message, false, false));
        assertTrue(DoubleTapReactions.picker(true));
        assertFalse(HookStatus.missing(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS).isEmpty());
    }
}
