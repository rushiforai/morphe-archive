package com.openbubbles.wear.patch;

import android.app.Application;

import com.localob.messaging.backend.domain.BackendService;
import com.localob.messaging.backend.domain.Chat;
import com.localob.messaging.backend.domain.ContentRun;
import com.localob.messaging.backend.domain.DeliveryState;
import com.localob.messaging.backend.domain.Message;
import com.localob.messaging.backend.domain.MessageContent;
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
import java.util.Date;
import java.util.List;

import kotlinx.coroutines.flow.StateFlow;
import kotlinx.datetime.Instant;

import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
// Instrumentation rebuilds JVM stack frames missing from the DEX-derived fixtures.
@Config(sdk = 32, manifest = Config.NONE, application = Application.class,
        instrumentedPackages = {"com.localob.messaging", "kotlinx.datetime"})
public class BridgeOpsTest {
    private static final String GUID = "iMessage;+;group-id";

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

    @Test public void normalizesOnlyUnambiguousSingleAddresses() {
        assertEquals("+15551234567", BridgeOps.normalizeAddress("tel:+1 (555) 123-4567"));
        assertEquals("alex+tag@example.com", BridgeOps.normalizeAddress(" MAILTO:Alex+tag@EXAMPLE.COM "));
        assertEquals("+15551234567", BridgeOps.normalizeAddress("iMessage;-;+15551234567"));
        for (String input : new String[]{"", "call 15551234567", "++15551234567", "1555+1234567",
                "12345;67890", "12345,67890", "tel:12345?body=Hi", "12345\n67890", "１２３４５６７８９０",
                "1234567890123456", "a@", "a..b@example.com", "a@example.com,b@example.com",
                "a@b", "Name <a@example.com>", "iMessage;+;15551234567", "iMessage;-;12345;-;67890"}) {
            assertNull(input, BridgeOps.normalizeAddress(input));
        }
    }

    @Test public void validatesGuidWithoutTreatingMalformedTargetsAsNewChats() {
        assertEquals(GUID, BridgeOps.guidFromThreadId("chat_" + GUID));
        assertEquals("SMS;-;+15551234567", BridgeOps.guidFromThreadId("SMS;-;+15551234567"));
        for (String invalid : new String[]{"iMessage;+;", "iMessage;+;one;two", "iMessage;+;two people",
                "iMessage;+;a\nb", "Other;-;abc", "chat_iMessage;+;"}) {
            assertNull(invalid, BridgeOps.guidFromThreadId(invalid));
        }
    }

    @Test public void nativeUuidChatResolvesByExactIdWithoutAddressFallback() throws Exception {
        for (String guid : new String[]{"12345678-1234-5678-9ABC-123456789ABC", "12345678-1234-5678-9abc-123456789abc"}) {
            assertTrue(BridgeOps.validChatGuid(guid));
            assertEquals(guid, BridgeOps.guidFromThreadId("chat_" + guid));
            assertNull(BridgeOps.normalizeAddress(guid));
            Chat chat = proxy(Chat.class, (self, method, args) -> {
                assertEquals("getGuid", method.getName());
                return guid;
            });
            BackendService backend = proxy(BackendService.class, (self, method, args) -> {
                assertEquals("chatById", method.getName());
                assertEquals(guid, args[0]);
                return chat;
            });
            assertSame(chat, BridgeOps.resolve(backend, "chat_" + guid, "+15551234567", true));
        }
        for (String malformed : new String[]{"12345678-1234-5678-9ABC-123456789AB", "12345678-1234-5678-9ABC-123456789ABG",
                "12345678-1234-5678-9ABC-123456789ABC;extra", "12345678-1234-5678-9ABC-123456789ABC\n"}) {
            assertFalse(malformed, BridgeOps.validChatGuid(malformed));
        }
    }

    @Test public void nativeHexGroupResolvesByExactIdWithoutAddressFallback() throws Exception {
        for (String guid : new String[]{"abcdef01".repeat(8), "ABCDEF01".repeat(8), "1".repeat(64),
                "abcdef01".repeat(9), "ABCDEF01".repeat(9)}) {
            assertTrue(BridgeOps.validChatGuid(guid));
            assertEquals(guid, BridgeOps.guidFromThreadId("chat_" + guid));
            assertNull(BridgeOps.normalizeAddress(guid));
            Chat chat = proxy(Chat.class, (self, method, args) -> {
                assertEquals("getGuid", method.getName());
                return guid;
            });
            BackendService backend = proxy(BackendService.class, (self, method, args) -> {
                assertEquals("chatById", method.getName());
                assertEquals(guid, args[0]);
                return chat;
            });
            assertSame(chat, BridgeOps.resolve(backend, "chat_" + guid, null, false));
            assertSame(chat, BridgeOps.resolve(backend, "chat_" + guid, "+15551234567", true));
        }
        for (String bad : new String[]{"a".repeat(63), "a".repeat(65), "a".repeat(63) + "z",
                "a".repeat(64) + ";extra", "a".repeat(64) + "\n",
                "a".repeat(71), "a".repeat(73), "a".repeat(71) + "z",
                "a".repeat(72) + ";extra", "a".repeat(72) + "\n"}) {
            assertFalse(BridgeOps.validChatGuid(bad));
        }
    }

    @Test public void missingOrFailedGuidLookupNeverFindsOrCreatesByAddress() throws Exception {
        for (boolean fail : new boolean[]{false, true}) {
            List<String> calls = new ArrayList<>();
            BackendService backend = proxy(BackendService.class, (self, method, args) -> {
                calls.add(method.getName());
                assertEquals("chatById", method.getName());
                assertEquals(GUID, args[0]);
                if (fail) throw new IllegalStateException("lookup failed");
                return null;
            });
            if (fail) {
                assertThrows(IllegalStateException.class,
                        () -> BridgeOps.resolve(backend, "chat_" + GUID, "+15551234567", true));
            } else {
                assertNull(BridgeOps.resolve(backend, "chat_" + GUID, "+15551234567", true));
            }
            assertEquals(Collections.singletonList("chatById"), calls);
        }
        BackendService untouched = proxy(BackendService.class, (self, method, args) -> {
            throw new AssertionError("Malformed GUID reached backend");
        });
        assertThrows(IllegalArgumentException.class,
                () -> BridgeOps.resolve(untouched, "chat_iMessage;+;bad guid", "+15551234567", true));
    }

    @Test public void refusesDifferentGuidFromBackend() {
        Chat wrong = proxy(Chat.class, (self, method, args) -> "iMessage;-;+15551234567");
        BackendService backend = proxy(BackendService.class, (self, method, args) -> wrong);
        assertThrows(IllegalStateException.class,
                () -> BridgeOps.resolve(backend, GUID, "+15551234567", true));
    }

    @Test public void addressLookupIgnoresGroupAndChecksCreatedRecipient() throws Exception {
        Chat group = proxy(Chat.class, (self, method, args) -> {
            if (method.getName().equals("isGroup")) return true;
            throw new AssertionError(method.getName());
        });
        Chat direct = proxy(Chat.class, (self, method, args) -> {
            switch (method.getName()) {
                case "isGroup": return false;
                case "getGuid": return "iMessage;-;+15551234567";
                case "getHandlesFlow": return flow(Collections.singletonList("+1 (555) 123-4567"));
                default: throw new AssertionError(method.getName());
            }
        });
        BackendService backend = proxy(BackendService.class, (self, method, args) -> {
            if (method.getName().equals("findChats")) return List.of(group, direct);
            throw new AssertionError(method.getName());
        });
        assertSame(direct, BridgeOps.resolve(backend, "chat_contact:42", "+15551234567", true));
        BackendService wrong = proxy(BackendService.class, (self, method, args) -> {
            if (method.getName().equals("findChats")) return Collections.emptyList();
            if (method.getName().equals("chat")) return group;
            throw new AssertionError(method.getName());
        });
        assertThrows(IllegalStateException.class,
                () -> BridgeOps.resolve(wrong, "new:person", "+15551234567", true));
        Chat groupWithOneParticipant = proxy(Chat.class, (self, method, args) -> {
            switch (method.getName()) {
                case "isGroup": return false;
                case "getGuid": return GUID;
                case "getHandlesFlow": return flow(Collections.singletonList("+15551234567"));
                default: throw new AssertionError(method.getName());
            }
        });
        BackendService onlyGroup = proxy(BackendService.class, (self, method, args) -> {
            if (method.getName().equals("findChats")) return Collections.singletonList(groupWithOneParticipant);
            throw new AssertionError(method.getName());
        });
        assertNull(BridgeOps.resolve(onlyGroup, "new:person", "+15551234567", false));
    }

    @Test public void sendSuccessSurvivesMessageSerializationAndHistoryFailure() throws Exception {
        List<String> sends = new ArrayList<>();
        Message unreadable = proxy(Message.class, (self, method, args) -> {
            throw new IllegalStateException("serialization failed");
        });
        Chat chat = proxy(Chat.class, (self, method, args) -> {
            if (method.getName().equals("getGuid")) return GUID;
            if (method.getName().equals("send")) {
                sends.add("send");
                MessageContent content = (MessageContent) args[0];
                assertEquals("Hello", ((ContentRun.Text) content.getRuns().get(0)).getText());
                return unreadable;
            }
            throw new IllegalStateException("history failed");
        });
        BackendService backend = proxy(BackendService.class, (self, method, args) -> {
            assertEquals("chatById", method.getName());
            return chat;
        });
        JSONObject response = BridgeOps.send(backend, new JSONObject().put("threadId", GUID).put("text", "Hello"));
        assertTrue(response.getBoolean("ok"));
        assertEquals(GUID, response.getString("threadId"));
        assertTrue(response.getBoolean("historyUnavailable"));
        assertFalse(response.has("error"));
        assertEquals(Collections.singletonList("send"), sends);
    }

    @Test public void rejectsLongOutgoingTextInsteadOfSilentlyTruncatingIt() throws Exception {
        BackendService untouched = proxy(BackendService.class, (self, method, args) -> {
            throw new AssertionError("Long message reached backend");
        });
        assertFalse(BridgeOps.send(untouched, new JSONObject().put("text", "x".repeat(801))).getBoolean("ok"));
    }

    @Test public void serializesBoundedTextAndClosedSetStatus() throws Exception {
        MessageContent content = new MessageContent(List.of(
                new ContentRun.Text("x".repeat(799), RunFormat.Companion.getPlain()),
                new ContentRun.Text("😀".repeat(200), RunFormat.Companion.getPlain())),
                Collections.emptyList(), null, null, null, null, false);
        Message message = proxy(Message.class, (self, method, args) -> {
            switch (method.getName()) {
                case "getGuid": return "message-id";
                case "getContentFlow": return flow(content);
                case "getTimestamp": return Instant.Companion.fromEpochMilliseconds(12L);
                case "isFromMe": return true;
                case "getSender": return "s".repeat(1_000);
                case "getDeliveryStateFlow": return flow(new DeliveryState.Failed("error".repeat(10_000)));
                default: throw new AssertionError(method.getName());
            }
        });
        JSONObject json = BridgeOps.messageJson(message);
        assertEquals(799, json.getString("text").length());
        assertEquals(254, json.getString("sender").length());
        assertEquals("failed", json.getString("status"));
        assertTrue(json.toString().length() < 2_000);
        assertEquals("x", BridgeOps.bounded("x😀", 2));
    }

    @Test public void threadMetadataKeepsBackendUnreadAndActivity() throws Exception {
        Chat chat = proxy(Chat.class, (self, method, args) -> {
            switch (method.getName()) {
                case "getGuid": return "iMessage;-;+15551234567";
                case "getDisplayNameFlow": return flow("Alex");
                case "isGroup": return false;
                case "getHasUnreadFlow": return flow(true);
                case "getHandlesFlow": return flow(Collections.singletonList("+15551234567"));
                case "getLastActivityFlow": return flow(Instant.Companion.fromEpochMilliseconds(1234L));
                case "getLastMessageFlow": return flow(null);
                default: throw new AssertionError(method.getName());
            }
        });
        JSONObject json = BridgeOps.threadMetadata(chat);
        assertTrue(json.getBoolean("unread"));
        assertEquals(1234L, json.getLong("lastTimestamp"));
        assertEquals("Alex", json.getString("title"));
        assertEquals("+15551234567", json.getString("address"));
    }

    @Test public void chatDirectoryKeepsRowWhenLatestMessageMetadataIsUnreadable() throws Exception {
        Message unreadable = proxy(Message.class, (self, method, args) -> {
            if (method.getName().equals("getTimestamp") || method.getName().equals("getContentFlow")) {
                throw new IllegalStateException("optional message metadata unavailable");
            }
            throw new AssertionError(method.getName());
        });
        JSONObject json = new JSONObject();
        BridgeOps.putChatActivity(json, unreadable, new Date(1234L));
        assertEquals(1234L, json.getLong("lastTimestamp"));
        assertEquals("", json.getString("lastPreview"));
    }
}
