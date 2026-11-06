package com.openbubbles.wear.patch;

import android.app.Application;
import android.content.Context;
import com.localob.messaging.app.notifications.ChatNotifications;
import com.localob.messaging.backend.domain.BackendService;
import com.localob.messaging.backend.domain.Chat;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE, application = Application.class,
        instrumentedPackages = {"com.localob.messaging"}, shadows = BridgeMarkReadTest.NativeNotifications.class)
public class BridgeMarkReadTest {
    private static final String GUID = "12345678".repeat(8);
    private static final List<String> calls = new ArrayList<>();
    private static boolean failClear;

    @Before public void reset() { calls.clear(); failClear = false; }

    @SuppressWarnings("unchecked")
    private BackendService backend(boolean failRead) {
        Chat chat = (Chat)Proxy.newProxyInstance(Chat.class.getClassLoader(), new Class<?>[]{Chat.class},
                (self, method, args) -> {
                    if (method.getName().equals("getGuid")) return GUID;
                    if (method.getName().equals("markRead")) {
                        calls.add("read:" + args[0]);
                        if (failRead) throw new IllegalStateException("Read failed");
                        return Unit.INSTANCE;
                    }
                    throw new AssertionError(method.getName());
                });
        return (BackendService)Proxy.newProxyInstance(BackendService.class.getClassLoader(),
                new Class<?>[]{BackendService.class}, (self, method, args) -> {
                    assertEquals("chatById", method.getName());
                    assertEquals(GUID, args[0]);
                    calls.add("lookup");
                    return chat;
                });
    }

    @Test public void readingOnWatchClearsTheMatchingPhoneNotificationAfterReadSucceeds() throws Exception {
        JSONObject response = BridgeOps.markRead(RuntimeEnvironment.getApplication(), backend(false),
                new JSONObject().put("threadId", "chat_" + GUID));
        assertTrue(response.getBoolean("ok"));
        assertEquals(GUID, response.getString("threadId"));
        assertEquals(List.of("lookup", "read:true", "clear:" + GUID), calls);
    }

    @Test public void failedReadLeavesPhoneNotificationAlone() throws Exception {
        JSONObject response = BridgeOps.markRead(RuntimeEnvironment.getApplication(), backend(true),
                new JSONObject().put("threadId", GUID));
        assertFalse(response.getBoolean("ok"));
        assertEquals(List.of("lookup", "read:true"), calls);
    }

    @Test public void markingUnreadDoesNotClearPhoneNotification() throws Exception {
        JSONObject response = BridgeOps.markRead(RuntimeEnvironment.getApplication(), backend(false),
                new JSONObject().put("threadId", GUID).put("read", false));
        assertTrue(response.getBoolean("ok"));
        assertEquals(List.of("lookup", "read:false"), calls);
    }

    @Test public void nativeClearFailureIsNotReportedAsSuccess() throws Exception {
        failClear = true;
        JSONObject response = BridgeOps.markRead(RuntimeEnvironment.getApplication(), backend(false),
                new JSONObject().put("threadId", GUID));
        assertFalse(response.getBoolean("ok"));
        assertTrue(response.getString("error").contains("Notification clear failed"));
    }

    @Implements(value = ChatNotifications.class, isInAndroidSdk = false)
    public static class NativeNotifications {
        @Implementation protected Object clear(Context context, BackendService backend, String guid,
                Continuation<? super Unit> continuation) {
            assertSame(RuntimeEnvironment.getApplication(), context);
            assertNotNull(backend);
            calls.add("clear:" + guid);
            if (failClear) throw new IllegalStateException("Notification clear failed");
            return Unit.INSTANCE;
        }
    }
}
