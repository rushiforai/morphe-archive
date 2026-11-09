/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Application;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.IBinder;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

/** The Keep-Alive Service start and the service's side of it, without Telegram. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class KeepAliveTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private final Application application = RuntimeEnvironment.getApplication();
    private final Runnable realApply = OwnConnection.apply;

    /** Stands in for Telegram's NotificationsService. */
    public static final class Held extends Service {
        @Override public IBinder onBind(Intent intent) { return null; }
    }

    /** Records which start Telegram's call became, and can refuse a foreground start like Android 12 does in the background. */
    private static final class Starts extends ContextWrapper {
        final List<String> made = new ArrayList<>();
        boolean refuseForeground;

        Starts(Context base) { super(base); }

        @Override public ComponentName startForegroundService(Intent intent) {
            if (refuseForeground) throw new IllegalStateException("not allowed to start a foreground service from the background");
            made.add("foreground " + intent.getBooleanExtra(KeepAlive.IN_FRONT, false));
            return intent.getComponent();
        }

        @Override public ComponentName startService(Intent intent) {
            made.add("plain " + intent.getBooleanExtra(KeepAlive.IN_FRONT, false));
            return intent.getComponent();
        }
    }

    @Before public void setUp() {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.KEEP_ALIVE_RUNNING.resetToDefault();
        PatchFamilyForTests.inBuild(PatchFamily.REPAIR_FIREBASE_PUSH);
        PatchFamilyForTests.installed(PatchFamily.Capability.KEEP_ALIVE_RUNNING);
        KeepAlive.reset();
    }

    @After public void restore() {
        OwnConnection.apply = realApply;
        Settings.KEEP_ALIVE_RUNNING.resetToDefault();
        PatchFamilyForTests.reset();
        PatchFamilyForTests.resetCapabilities();
        PauseForTests.resume();
        KeepAlive.reset();
        HookStatus.clear();
    }

    @Test public void theSwitchIsOnByDefault() {
        assertTrue(Settings.KEEP_ALIVE_RUNNING.get());
    }

    @Test public void telegramsStartAsksForAForegroundServiceAndTheServiceKeepsThePromise() {
        Starts starts = new Starts(application);
        Intent intent = new Intent(application, Held.class);
        assertEquals(new ComponentName(application, Held.class), KeepAlive.start(starts, intent));
        assertEquals(List.of("foreground true"), starts.made);

        Held service = Robolectric.buildService(Held.class).create().get();
        KeepAlive.started(service, intent);
        assertEquals(KeepAlive.NOTIFICATION_ID, shadowOf(service).getLastForegroundNotificationId());
        Notification shown = shadowOf(service).getLastForegroundNotification();
        assertNotNull(shown);
        assertEquals(KeepAlive.CHANNEL, shown.getChannelId());
        assertTrue("it can't be swiped away while the service runs", (shown.flags & Notification.FLAG_ONGOING_EVENT) != 0);
        assertEquals("Keeping Telegram connected", shown.extras.getString(Notification.EXTRA_TITLE));
        assertNotNull("a tap opens the channel's settings", shown.contentIntent);

        NotificationChannel channel = application.getSystemService(NotificationManager.class).getNotificationChannel(KeepAlive.CHANNEL);
        assertEquals(NotificationManager.IMPORTANCE_MIN, channel.getImportance());
        assertNull(channel.getSound());
        assertFalse(channel.canShowBadge());
        assertTrue(String.join("\n", HookStatus.report()).contains(KeepAlive.KEPT_IN_FRONT));
    }

    @Test public void withTheSwitchOffTelegramsOwnStartRuns() {
        Settings.KEEP_ALIVE_RUNNING.save(false);
        Starts starts = new Starts(application);
        Intent intent = new Intent(application, Held.class);
        KeepAlive.start(starts, intent);
        assertEquals(List.of("plain false"), starts.made);

        Held service = Robolectric.buildService(Held.class).create().get();
        KeepAlive.started(service, intent);
        assertNull(shadowOf(service).getLastForegroundNotification());
    }

    @Test public void withoutThePatchedStatusTelegramsOwnStartRuns() {
        PatchFamilyForTests.installed();
        Starts starts = new Starts(application);
        KeepAlive.start(starts, new Intent(application, Held.class));
        assertEquals(List.of("plain false"), starts.made);
    }

    @Test public void aRefusedForegroundStartFallsBackToTelegramsOwnStart() {
        Starts starts = new Starts(application);
        starts.refuseForeground = true;
        Intent intent = new Intent(application, Held.class);
        KeepAlive.start(starts, intent);
        assertEquals("the stock start, with no promise left on the intent", List.of("plain false"), starts.made);
        assertTrue(String.join("\n", HookStatus.report()).contains(KeepAlive.ANDROID_REFUSED));

        Held service = Robolectric.buildService(Held.class).create().get();
        KeepAlive.started(service, intent);
        assertNull("a plain start doesn't put the service in front", shadowOf(service).getLastForegroundNotification());
    }

    @Test public void aStockStartFailureStillReachesTelegramsCatch() {
        Context broken = new ContextWrapper(application) {
            @Override public ComponentName startForegroundService(Intent intent) { throw new SecurityException("refused"); }
            @Override public ComponentName startService(Intent intent) { throw new SecurityException("stock failure"); }
        };
        try {
            KeepAlive.start(broken, new Intent(application, Held.class));
            throw new AssertionError("the stock start's exception was swallowed");
        } catch (SecurityException expected) {
            assertEquals("stock failure", expected.getMessage());
        }
    }

    @Test public void turningTheSwitchOffTakesARunningServiceOutOfFront() {
        Held service = Robolectric.buildService(Held.class).create().get();
        Intent promised = new Intent(application, Held.class).putExtra(KeepAlive.IN_FRONT, true);
        KeepAlive.started(service, promised);
        assertFalse(shadowOf(service).isForegroundStopped());

        Settings.KEEP_ALIVE_RUNNING.save(false);
        KeepAlive.started(service, new Intent(application, Held.class));
        assertTrue(shadowOf(service).isForegroundStopped());
        assertTrue("the notification goes with it", shadowOf(service).getNotificationShouldRemoved());
        assertTrue(String.join("\n", HookStatus.report()).contains(KeepAlive.STEPPED_BACK));
    }

    @Test public void aPlainStartWhileInFrontLeavesItThere() {
        Held service = Robolectric.buildService(Held.class).create().get();
        KeepAlive.started(service, new Intent(application, Held.class).putExtra(KeepAlive.IN_FRONT, true));
        KeepAlive.started(service, new Intent(application, Held.class));
        assertFalse(shadowOf(service).isForegroundStopped());
    }

    @Test public void androidsRestartAfterStoppingTheServicePutsItBackInFront() {
        Held service = Robolectric.buildService(Held.class).create().get();
        KeepAlive.started(service, null);
        assertEquals(KeepAlive.NOTIFICATION_ID, shadowOf(service).getLastForegroundNotificationId());

        Held off = Robolectric.buildService(Held.class).create().get();
        Settings.KEEP_ALIVE_RUNNING.save(false);
        KeepAlive.started(off, null);
        assertNull(shadowOf(off).getLastForegroundNotification());
    }

    @Test public void aRefusedPromiseNeverReachesTelegram() {
        Held service = Robolectric.buildService(Held.class).create().get();
        shadowOf(service).setThrowInStartForeground(new IllegalStateException("refused"));
        KeepAlive.started(service, new Intent(application, Held.class).putExtra(KeepAlive.IN_FRONT, true));
        assertTrue(String.join("\n", HookStatus.report()).contains(KeepAlive.ANDROID_REFUSED));
    }

    @Test public void flippingTheSwitchHasTelegramStartOrStopItsServiceNow() {
        int[] applied = {0};
        OwnConnection.apply = () -> applied[0]++;
        KeepAlive.switched();
        assertEquals(1, applied[0]);
    }

    @Test @Config(sdk = 34) public void android14AsksOnlyWhenTheManifestDeclaresRemoteMessaging() {
        ComponentName held = new ComponentName(application, Held.class);
        declare(0x1);
        shadowOf(application).grantPermissions(KeepAlive.REMOTE_MESSAGING_PERMISSION);
        Starts starts = new Starts(application);
        KeepAlive.start(starts, new Intent(application, Held.class));
        assertEquals("data sync alone: Telegram's own start", List.of("plain false"), starts.made);
        assertTrue(String.join("\n", HookStatus.report()).contains(KeepAlive.NOT_DECLARED));

        declare(0x1 | KeepAlive.REMOTE_MESSAGING);
        shadowOf(application).denyPermissions(KeepAlive.REMOTE_MESSAGING_PERMISSION);
        assertFalse("the type without its permission", KeepAlive.wanted(application, held));

        shadowOf(application).grantPermissions(KeepAlive.REMOTE_MESSAGING_PERMISSION);
        assertTrue(KeepAlive.wanted(application, held));
        Starts declared = new Starts(application);
        Intent intent = new Intent(application, Held.class);
        KeepAlive.start(declared, intent);
        assertEquals(List.of("foreground true"), declared.made);

        Held service = Robolectric.buildService(Held.class).create().get();
        KeepAlive.started(service, intent);
        assertEquals(KeepAlive.REMOTE_MESSAGING, service.getForegroundServiceType());
    }

    @Test @Config(sdk = 34) public void android14RestartWithoutTheDeclaredTypeStaysAPlainService() {
        declare(0x1);
        shadowOf(application).grantPermissions(KeepAlive.REMOTE_MESSAGING_PERMISSION);
        Held service = Robolectric.buildService(Held.class).create().get();
        KeepAlive.started(service, null);
        assertNull(shadowOf(service).getLastForegroundNotification());
    }

    private void declare(int types) {
        ServiceInfo info = new ServiceInfo();
        info.packageName = application.getPackageName();
        info.name = Held.class.getName();
        info.applicationInfo = application.getApplicationInfo();
        // ServiceInfo keeps the manifest's foregroundServiceType in a field with no public setter.
        ReflectionHelpers.setField(info, "mForegroundServiceType", types);
        shadowOf(application.getPackageManager()).addOrUpdateService(info);
    }
}
