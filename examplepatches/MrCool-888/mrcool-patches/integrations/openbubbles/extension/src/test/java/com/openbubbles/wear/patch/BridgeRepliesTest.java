package com.openbubbles.wear.patch;

import android.app.Application;

import com.localob.messaging.backend.domain.BackendService;
import com.localob.messaging.backend.domain.Chat;
import com.localob.messaging.backend.domain.ContentRun;
import com.localob.messaging.backend.domain.Message;
import com.localob.messaging.backend.domain.MessageContent;
import com.localob.messaging.backend.domain.MessageRef;
import com.localob.messaging.backend.domain.RunFormat;

import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import kotlinx.coroutines.flow.StateFlow;
import kotlinx.datetime.Instant;

import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE, application = Application.class,
        instrumentedPackages = {"com.localob.messaging", "kotlinx.datetime"})
public class BridgeRepliesTest {
    private static final String CHAT_ID = "12345678-1234-5678-9abc-123456789abc";

    @SuppressWarnings("unchecked")
    private static <T> T proxy(Class<T> type, InvocationHandler handler) {
        return (T) Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, handler);
    }

    @SuppressWarnings("unchecked")
    private static <T> StateFlow<T> flow(T value) {
        return proxy(StateFlow.class, (self, method, args) -> {
            if (method.getName().equals("getValue")) return value;
            throw new AssertionError(method.getName());
        });
    }

    private static Message message(String id, String chatId, String origin, boolean fromMe,
                                   String sender, String text) {
        MessageContent content = new MessageContent(
                Collections.singletonList(new ContentRun.Text(text, RunFormat.Companion.getPlain())),
                Collections.emptyList(), null, null, null, null, false);
        return proxy(Message.class, (self, method, args) -> {
            switch (method.getName()) {
                case "getGuid": return id;
                case "getChatGuid": return chatId;
                case "getThreadOriginatorGuid": return origin;
                case "getThreadOriginatorPartIndex": return origin == null ? null : 1;
                case "getDateDeletedFlow": return flow(null);
                case "getContentFlow": return flow(content);
                case "getTimestamp": return Instant.Companion.fromEpochMilliseconds(123L);
                case "isFromMe": return fromMe;
                case "getSender": return sender;
                default: throw new AssertionError(method.getName());
            }
        });
    }

    private static Chat chat(Message replyTarget, Message sentMessage, boolean iMessage,
                             List<MessageContent> sentContents, List<String> backendCalls) {
        return proxy(Chat.class, (self, method, args) -> {
            switch (method.getName()) {
                case "getGuid": return CHAT_ID;
                case "isIMessage": return iMessage;
                case "messageById":
                    backendCalls.add("messageById");
                    assertEquals("quoted-message", args[0]);
                    return replyTarget;
                case "send":
                    backendCalls.add("send");
                    assertNull("scheduledAt stays null", args[1]);
                    sentContents.add((MessageContent) args[0]);
                    return sentMessage;
                default: throw new AssertionError(method.getName());
            }
        });
    }

    private static BackendService backend(Chat chat, List<String> backendCalls) {
        return proxy(BackendService.class, (self, method, args) -> {
            backendCalls.add(method.getName());
            if (method.getName().equals("chatById")) {
                assertEquals(CHAT_ID, args[0]);
                return chat;
            }
            throw new AssertionError("Unexpected backend call: " + method.getName());
        });
    }

    @Test public void quotedSendPassesNativeRootReferenceAndNullSchedule() throws Exception {
        List<String> calls = new ArrayList<>();
        List<MessageContent> sent = new ArrayList<>();
        Message target = message("quoted-message", CHAT_ID, "root-message", false, "alex@example.com", "quoted");
        Message sentMessage = message("sent-message", CHAT_ID, null, true, "me@example.com", "reply");
        Chat chat = chat(target, sentMessage, true, sent, calls);

        JSONObject response = BridgeOps.send(backend(chat, calls), new JSONObject()
                .put("threadId", CHAT_ID).put("text", "reply")
                .put("replyToMessageId", "quoted-message").put("replyToPartIndex", 2));

        assertTrue(response.toString(), response.getBoolean("ok"));
        assertEquals(1, sent.size());
        MessageRef reference = sent.get(0).getReplyTo();
        assertEquals("root-message", reference.getMessageId());
        assertEquals(Integer.valueOf(2), reference.getPartIndex());
        assertEquals(List.of("chatById", "messageById", "send"), calls);
    }

    @Test public void ordinarySendKeepsReplyReferenceNull() throws Exception {
        List<String> calls = new ArrayList<>();
        List<MessageContent> sent = new ArrayList<>();
        Chat chat = chat(null, message("sent", CHAT_ID, null, true, null, "hello"), true, sent, calls);

        JSONObject response = BridgeOps.send(backend(chat, calls), new JSONObject()
                .put("threadId", CHAT_ID).put("text", "hello"));

        assertTrue(response.toString(), response.getBoolean("ok"));
        assertNull(sent.get(0).getReplyTo());
        assertEquals(List.of("chatById", "send"), calls);
    }

    @Test public void invalidCrossChatQuoteDoesNotSendOrResolveAnotherChat() throws Exception {
        List<String> calls = new ArrayList<>();
        List<MessageContent> sent = new ArrayList<>();
        Message wrongChat = message("quoted-message", "12345678-1234-5678-9abc-123456789000",
                null, false, null, "wrong thread");
        Chat chat = chat(wrongChat, message("sent", CHAT_ID, null, true, null, "reply"), true, sent, calls);

        JSONObject response = BridgeOps.send(backend(chat, calls), new JSONObject()
                .put("threadId", CHAT_ID).put("address", "+15551234567").put("text", "reply")
                .put("replyToMessageId", "quoted-message"));

        assertFalse(response.getBoolean("ok"));
        assertTrue(sent.isEmpty());
        assertEquals(List.of("chatById", "messageById"), calls);
    }

    @Test public void smsQuoteIsRejectedBeforeMessageLookupOrSend() throws Exception {
        List<String> calls = new ArrayList<>();
        List<MessageContent> sent = new ArrayList<>();
        Chat chat = chat(message("quoted-message", CHAT_ID, null, false, null, "quoted"),
                message("sent", CHAT_ID, null, true, null, "reply"), false, sent, calls);

        JSONObject response = BridgeOps.send(backend(chat, calls), new JSONObject()
                .put("threadId", CHAT_ID).put("text", "reply").put("replyToMessageId", "quoted-message"));

        assertFalse(response.getBoolean("ok"));
        assertTrue(sent.isEmpty());
        assertEquals(List.of("chatById"), calls);
    }

    @Test public void previewCarriesOriginalSenderAndDirectionAndMissingOriginalReference() throws Exception {
        Message own = message("root-message", CHAT_ID, null, true, "me@example.com", "my quote");
        JSONObject ownPreview = BridgeOps.replyReferenceJson(new MessageRef("root-message", 2), own);
        assertEquals("root-message", ownPreview.getString("messageId"));
        assertEquals(2, ownPreview.getInt("partIndex"));
        assertEquals("my quote", ownPreview.getString("text"));
        assertTrue(ownPreview.getBoolean("fromMe"));
        assertEquals("me@example.com", ownPreview.getString("sender"));

        Message other = message("other-root", CHAT_ID, null, false, "alex@example.com", "their quote");
        JSONObject otherPreview = BridgeOps.replyReferenceJson(new MessageRef("other-root", 0), other);
        assertEquals("their quote", otherPreview.getString("text"));
        assertFalse(otherPreview.getBoolean("fromMe"));
        assertEquals("alex@example.com", otherPreview.getString("sender"));

        JSONObject missing = BridgeOps.replyReferenceJson(new MessageRef("deleted-root", 1), null);
        assertEquals("deleted-root", missing.getString("messageId"));
        assertEquals(1, missing.getInt("partIndex"));
        assertEquals("Original message unavailable", missing.getString("text"));
    }
}
