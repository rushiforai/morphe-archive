package com.openbubbles.wear.patch;

import android.app.Application;

import com.localob.messaging.backend.domain.AssociatedMessage;
import com.localob.messaging.backend.domain.Message;
import com.localob.messaging.backend.domain.ReactionKind;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlinx.coroutines.flow.StateFlow;
import kotlinx.datetime.Instant;

import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE, application = Application.class,
        instrumentedPackages = {"com.localob.messaging", "kotlinx.datetime"})
public class BridgeReactionsTest {
    private static final String CHAT = "iMessage;-;+15551234567";
    private static final String TARGET = "message-target";

    @SuppressWarnings("unchecked")
    private static <T> T proxy(Class<T> type, InvocationHandler handler) {
        return (T) Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, handler);
    }

    private static AssociatedMessage row(String id, String sender, String type, int part, boolean fromMe, long time) {
        return proxy(AssociatedMessage.class, (self, method, args) -> {
            switch (method.getName()) {
                case "getGuid": return id;
                case "getTargetGuid": return TARGET;
                case "getTargetPartIndex": return part;
                case "getReaction":
                    return type.equals("emoji") ? new ReactionKind.Emoji("😎") :
                            BridgeOps.reactionKind(type.replace("-", ""));
                case "getReactionEnabled": return !type.startsWith("-");
                case "getTimestamp": return Instant.Companion.fromEpochMilliseconds(time);
                case "isFromMe": return fromMe;
                case "getSender": return sender;
                default: throw new AssertionError(method.getName());
            }
        });
    }

    @Test public void mapsAllSixWireTypesToNativeEnumsAndBack() {
        assertSame(ReactionKind.Standard.LOVE, BridgeOps.reactionKind("love"));
        assertSame(ReactionKind.Standard.LIKE, BridgeOps.reactionKind("like"));
        assertSame(ReactionKind.Standard.DISLIKE, BridgeOps.reactionKind("dislike"));
        assertSame(ReactionKind.Standard.LAUGH, BridgeOps.reactionKind("laugh"));
        assertSame(ReactionKind.Standard.EMPHASIZE, BridgeOps.reactionKind("emphasize"));
        assertSame(ReactionKind.Standard.QUESTION, BridgeOps.reactionKind("question"));
        assertNull(BridgeOps.reactionKind("❤️"));
        for (String type : Arrays.asList("love", "like", "dislike", "laugh", "emphasize", "question")) {
            assertEquals(type, BridgeOps.reactionType(BridgeOps.reactionKind(type)));
        }
    }

    @Test public void summariesCountLatestPerSenderAndPartAndMarkOwnReaction() throws Exception {
        List<AssociatedMessage> rows = Arrays.asList(
                row("me-like", null, "like", 0, true, 1),
                row("a-love", "a@example.com", "love", 0, false, 2),
                row("b-love", "b@example.com", "love", 0, false, 3),
                row("a-remove", "a@example.com", "-love", 0, false, 4),
                row("b-change", "b@example.com", "laugh", 0, false, 5),
                row("me-part-one", null, "-like", 1, true, 6),
                row("me-part-one-love", null, "love", 1, true, 7));

        JSONArray summary = BridgeOps.summarizeReactions(TARGET, rows);
        assertEquals(3, summary.length());
        JSONObject like = find(summary, "like", 0);
        assertEquals(1, like.getInt("count"));
        assertTrue(like.getBoolean("fromMe"));
        JSONObject laugh = find(summary, "laugh", 0);
        assertEquals(1, laugh.getInt("count"));
        assertFalse(laugh.getBoolean("fromMe"));
        JSONObject love = find(summary, "love", 1);
        assertEquals(1, love.getInt("count"));
        assertTrue(love.getBoolean("fromMe"));
    }

    @Test public void customReactionReplacesPriorStandardStateAndStaysVisible() throws Exception {
        AssociatedMessage emoji = row("me-emoji", null, "emoji", 0, true, 2);

        JSONArray summary = BridgeOps.summarizeReactions(TARGET, List.of(
                row("me-like", null, "like", 0, true, 1), emoji));

        assertEquals(1, summary.length());
        assertEquals("emoji:😎", summary.getJSONObject(0).getString("type"));
        assertTrue(summary.getJSONObject(0).getBoolean("fromMe"));
    }

    @Test public void appliesChangeByRemovingCurrentThenEnablingDesiredReaction() throws Exception {
        List<String> calls = new ArrayList<>();
        com.localob.messaging.backend.domain.Message target = proxy(
                com.localob.messaging.backend.domain.Message.class, (self, method, args) -> {
                    if (method.getName().equals("getGuid")) return TARGET;
                    if (method.getName().equals("react")) {
                        calls.add(BridgeOps.reactionType((ReactionKind) args[0]) + ":" + args[1] + ":" + args[2]);
                        return kotlin.Unit.INSTANCE;
                    }
                    throw new AssertionError(method.getName());
                });

        BridgeOps.applyReaction(target, List.of(row("mine", null, "like", 2, true, 1)),
                ReactionKind.Standard.LOVE, 2, false);

        assertEquals(Arrays.asList("like:2:false", "love:2:true"), calls);
    }

    @Test public void desiredStateActionsAreIdempotent() throws Exception {
        List<String> calls = new ArrayList<>();
        com.localob.messaging.backend.domain.Message target = proxy(
                com.localob.messaging.backend.domain.Message.class, (self, method, args) -> {
                    if (method.getName().equals("getGuid")) return TARGET;
                    if (method.getName().equals("react")) {
                        calls.add(BridgeOps.reactionType((ReactionKind) args[0]) + ":" + args[2]);
                        return kotlin.Unit.INSTANCE;
                    }
                    throw new AssertionError(method.getName());
                });
        List<AssociatedMessage> current = List.of(row("mine", null, "love", 0, true, 1));

        BridgeOps.applyReaction(target, current, ReactionKind.Standard.LOVE, 0, false);
        BridgeOps.applyReaction(target, current, ReactionKind.Standard.LIKE, 0, true);

        assertTrue(calls.isEmpty());
    }

    @Test public void explicitRemovalSendsTheNativeDisableArgument() throws Exception {
        List<String> calls = new ArrayList<>();
        com.localob.messaging.backend.domain.Message target = proxy(
                com.localob.messaging.backend.domain.Message.class, (self, method, args) -> {
                    if (method.getName().equals("getGuid")) return TARGET;
                    if (method.getName().equals("react")) {
                        calls.add(BridgeOps.reactionType((ReactionKind) args[0]) + ":" + args[1] + ":" + args[2]);
                        return kotlin.Unit.INSTANCE;
                    }
                    throw new AssertionError(method.getName());
                });

        BridgeOps.applyReaction(target, List.of(row("mine", null, "love", 3, true, 1)),
                ReactionKind.Standard.LOVE, 3, true);

        assertEquals(List.of("love:3:false"), calls);
    }

    @Test public void exactChatAndDeletedMessageChecksRejectInvalidTargets() {
        Message target = proxy(Message.class, (self, method, args) -> {
            switch (method.getName()) {
                case "getGuid": return TARGET;
                case "getChatGuid": return CHAT;
                case "getDateDeletedFlow": return proxy(StateFlow.class, (flow, getter, ignored) ->
                        Instant.Companion.fromEpochMilliseconds(1));
                default: throw new AssertionError(method.getName());
            }
        });
        assertFalse(BridgeOps.isMessageTarget(target, "iMessage;-;+15550000000"));
        assertFalse(BridgeOps.isMessageTarget(target, CHAT));
    }

    private static JSONObject find(JSONArray items, String type, int part) {
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.optJSONObject(i);
            if (item != null && item.optString("type").equals(type) && item.optInt("partIndex") == part) return item;
        }
        return null;
    }
}
