package org.ungoogled.waze;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.time.Duration;
import java.util.List;
import java.util.stream.Collectors;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE)
public class BridgeTest {
    private Application app;

    private static void field(Class<?> cls, String name, Object value) throws Exception {
        Field f = cls.getDeclaredField(name);
        f.setAccessible(true);
        f.set(null, value);
    }

    @Before public void setup() throws Exception {
        app = RuntimeEnvironment.getApplication();
        field(Customization.class, "app", app);
        app.getSharedPreferences("ungoogled_waze", Context.MODE_PRIVATE).edit().clear().commit();
        Field main = Bridge.class.getDeclaredField("MAIN");
        main.setAccessible(true);
        ((Handler) main.get(null)).removeCallbacksAndMessages(null);
        field(Bridge.class, "last", null);
        field(Bridge.class, "lastKey", "");
        field(Bridge.class, "lastSentAt", 0L);
        field(Bridge.class, "beating", false);
        Bridge.init(app);
    }

    private void send() throws Exception {
        Method m = Bridge.class.getDeclaredMethod("send", Intent.class, String.class, int.class);
        m.setAccessible(true);
        m.invoke(null, new Intent(Bridge.ACTION).putExtra("type", new int[]{1}), "police", 1);
    }

    private List<Intent> broadcasts() {
        return shadowOf(app).getBroadcastIntents().stream()
                .filter(i -> Bridge.ACTION.equals(i.getAction())).collect(Collectors.toList());
    }

    @Test public void heartbeatRepeatsWhileEnabled() throws Exception {
        send();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMinutes(1));
        assertEquals(2, broadcasts().size());
    }

    @Test public void switchingOffStopsHeartbeatAndClearsCachedAlerts() throws Exception {
        send();
        Customization.setForTest("shareAlerts", false);
        int afterDisable = broadcasts().size();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMinutes(2));
        assertEquals(afterDisable, broadcasts().size());
        Intent cleared = broadcasts().get(afterDisable - 1);
        assertEquals(0, cleared.getIntArrayExtra("type").length);
    }

    @Test public void staleInFlightUpdateCannotRestartSharingAfterDisable() throws Exception {
        Customization.setForTest("shareAlerts", false);
        int afterDisable = broadcasts().size();
        send();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMinutes(2));
        assertEquals(afterDisable, broadcasts().size());
    }
}
