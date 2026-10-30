/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import java.util.List;
import org.junit.Test;
import org.telegram.tgnet.TLRPC;
import org.telegram.tgnet.tl.TL_update;

/** How the bridge reads reactions out of Telegram's two updates. */
public class ReactionAlertsBridgeTest {
    private static final long FRIEND = 5;
    private static final int DATE = 1_790_000_000;
    private static final String THUMBS = new String(Character.toChars(0x1F44D));

    @Test public void aPrivateChatsReactionArrivesAsAnEditOfYourMessage() throws Exception {
        TL_update.TL_updateEditMessage edit = edit(true, user(FRIEND));
        List<ReactionAlerts.Reaction> found = ReactionAlertsBridge.reactionsOf(edit);
        assertEquals(1, found.size());
        ReactionAlerts.Reaction reaction = found.get(0);
        assertEquals(FRIEND, reaction.dialog);
        assertEquals(65, reaction.id);
        assertEquals(0, reaction.topic);
        assertEquals(FRIEND, reaction.from);
        assertEquals(THUMBS, reaction.emoji);
        assertEquals(DATE, reaction.date);
        assertTrue(reaction.unread);
        assertFalse(reaction.mine);
    }

    @Test public void anEditOfSomeoneElsesMessageOrInAGroupListsNothing() throws Exception {
        assertTrue(ReactionAlertsBridge.reactionsOf(edit(false, user(FRIEND))).isEmpty());
        TLRPC.TL_peerChat group = new TLRPC.TL_peerChat();
        group.chat_id = 42;
        assertTrue(ReactionAlertsBridge.reactionsOf(edit(true, group)).isEmpty());
        TL_update.TL_updateEditMessage bare = edit(true, user(FRIEND));
        bare.message.reactions = null;
        assertTrue(ReactionAlertsBridge.reactionsOf(bare).isEmpty());
    }

    @Test public void aReactionsUpdateKeepsItsChatMessageAndTopic() throws Exception {
        TL_update.TL_updateMessageReactions update = new TL_update.TL_updateMessageReactions();
        TLRPC.TL_peerChat group = new TLRPC.TL_peerChat();
        group.chat_id = 42;
        update.peer = group;
        update.msg_id = 7;
        update.top_msg_id = 3;
        update.reactions = reactions();
        ReactionAlerts.Reaction reaction = ReactionAlertsBridge.reactionsOf(update).get(0);
        assertEquals(-42, reaction.dialog);
        assertEquals(7, reaction.id);
        assertEquals(3, reaction.topic);
        assertEquals(FRIEND, reaction.from);
    }

    private static TL_update.TL_updateEditMessage edit(boolean out, TLRPC.Peer chat) {
        TLRPC.Message message = new TLRPC.Message();
        message.id = 65;
        message.out = out;
        message.peer_id = chat;
        message.reactions = reactions();
        TL_update.TL_updateEditMessage edit = new TL_update.TL_updateEditMessage();
        edit.message = message;
        return edit;
    }

    private static TLRPC.TL_messageReactions reactions() {
        TLRPC.TL_reactionEmoji thumbs = new TLRPC.TL_reactionEmoji();
        thumbs.emoticon = THUMBS;
        TLRPC.MessagePeerReaction recent = new TLRPC.MessagePeerReaction();
        recent.peer_id = user(FRIEND);
        recent.reaction = thumbs;
        recent.date = DATE;
        recent.unread = true;
        TLRPC.TL_messageReactions reactions = new TLRPC.TL_messageReactions();
        reactions.recent_reactions.add(recent);
        return reactions;
    }

    private static TLRPC.TL_peerUser user(long id) {
        TLRPC.TL_peerUser peer = new TLRPC.TL_peerUser();
        peer.user_id = id;
        return peer;
    }
}
