/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;

import org.junit.Test;

import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import app.morphe.extension.shared.utils.Utils;

import static org.junit.Assert.*;

public class SmartShuffleManagerTest {
    /** Android's preference interfaces are backed by real in-memory writes, including remove-on-default. */
    private static final class Preferences {
        final Map<String, Object> values = new HashMap<>();
        final Map<String, Object> changes = new HashMap<>();
        final SharedPreferences.Editor editor = (SharedPreferences.Editor) Proxy.newProxyInstance(
                getClass().getClassLoader(), new Class<?>[]{SharedPreferences.Editor.class},
                (proxy, method, arguments) -> {
                    switch (method.getName()) {
                        case "commit":
                        case "apply":
                            for (Map.Entry<String, Object> entry : changes.entrySet()) {
                                if (entry.getValue() == null) values.remove(entry.getKey());
                                else values.put(entry.getKey(), entry.getValue());
                            }
                            changes.clear();
                            return method.getName().equals("commit") ? Boolean.TRUE : null;
                        case "remove":
                            changes.put((String) arguments[0], null);
                            return proxy;
                        case "putBoolean":
                            changes.put((String) arguments[0], arguments[1]);
                            return proxy;
                        default:
                            throw new UnsupportedOperationException(method.getName());
                    }
                });
        final SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
                getClass().getClassLoader(), new Class<?>[]{SharedPreferences.class},
                (proxy, method, arguments) -> switch (method.getName()) {
                    case "contains" -> values.containsKey(arguments[0]);
                    case "getAll" -> Map.copyOf(values);
                    case "getBoolean", "getString" -> values.getOrDefault(arguments[0], arguments[1]);
                    case "edit" -> editor;
                    default -> throw new UnsupportedOperationException(method.getName());
                });
    }

    @Test
    public void missingPreferenceIsOffAndBothToggleDirectionsStoreAnExplicitBoolean() throws Exception {
        Preferences storage = new Preferences();
        Field contextField = Utils.class.getDeclaredField("context");
        contextField.setAccessible(true);
        Context previousContext = (Context) contextField.get(null);
        Context context = new ContextWrapper(null) {
            @Override
            public SharedPreferences getSharedPreferences(String name, int mode) {
                assertEquals("revanced", name);
                return storage.preferences;
            }
        };
        contextField.set(null, context);
        try {
            SmartShuffleManager.EnabledPreference preference = new SmartShuffleManager.EnabledPreference();
            SharedPreferences persisted = Setting.preferences.preferences;
            assertSame(preference, Setting.getSettingFromPath(SmartShuffleManager.ENABLED_KEY));
            assertEquals(Boolean.FALSE, preference.defaultValue);
            assertFalse(preference.get());
            assertTrue(persisted.contains(preference.key));
            assertFalse(persisted.getBoolean(preference.key, true));
            SmartShuffleManager.debug(() -> {
                throw new AssertionError("Disabled debug logging must not build its message");
            });

            preference.store(true);
            assertTrue(preference.get());
            assertTrue(persisted.getBoolean(preference.key, false));
            Setting.privateSyncValueFromPreferences(preference);
            assertTrue(preference.get());

            preference.store(false);
            assertFalse(preference.get());
            assertTrue(persisted.contains(preference.key));
            assertFalse(persisted.getBoolean(preference.key, true));
            preference.store(false);
            assertTrue(persisted.contains(preference.key));
            assertFalse(persisted.getBoolean(preference.key, true));
        } finally {
            contextField.set(null, previousContext);
        }
    }

    @Test
    public void debugMessagesAreNotBuiltBeforeAnApplicationContextExists() throws Exception {
        Field contextField = Utils.class.getDeclaredField("context");
        contextField.setAccessible(true);
        Object previous = contextField.get(null);
        contextField.set(null, null);
        try {
            SmartShuffleManager.debug(() -> {
                throw new AssertionError("Startup must not initialize settings or emit Smart Shuffle logs");
            });
        } finally {
            contextField.set(null, previous);
        }
    }

    @Test
    public void logIdentifiersPreserveOnlyBoundedSingleLineIdsAndFixedLabels() {
        assertEquals("PL-source_123", SmartShuffleManager.logId("PL-source_123"));
        assertEquals("playlist-song", SmartShuffleManager.logId("playlist-song"));
        assertEquals("none", SmartShuffleManager.logId(null));
        assertEquals("none", SmartShuffleManager.logId(""));
        assertEquals("redacted", SmartShuffleManager.logId("playlist\nAuthorization: secret"));
        assertEquals("redacted", SmartShuffleManager.logId("https://example.test/?params=secret"));
        assertEquals("redacted", SmartShuffleManager.logId("opaque%3D"));
        assertEquals("redacted", SmartShuffleManager.logId("x".repeat(129)));
    }

    @Test
    public void lostDefaultNetworkIsOfflineWithoutRequeryAndRepeatedCallbacksAreLogged() throws Exception {
        Preferences storage = new Preferences();
        Field contextField = Utils.class.getDeclaredField("context");
        contextField.setAccessible(true);
        Object previousContext = contextField.get(null);
        Map<Field, Object> previousState = new HashMap<>();
        Field value = Setting.class.getDeclaredField("value");
        value.setAccessible(true);
        Object previousDebug = null;
        AtomicLong cancellations = null;
        long previousCancellation = 0;
        try {
            contextField.set(null, new ContextWrapper(null) {
                @Override public SharedPreferences getSharedPreferences(String name, int mode) {
                    return storage.preferences;
                }
                @Override public Object getSystemService(String name) {
                    throw new AssertionError("Callbacks must not requery a stale active network");
                }
            });
            previousDebug = value.get(BaseSettings.DEBUG);
            value.set(BaseSettings.DEBUG, true);
            for (String name : new String[]{"online", "revision", "pending", "active", "policy"}) {
                Field field = SmartShuffleManager.class.getDeclaredField(name);
                field.setAccessible(true);
                previousState.put(field, field.get(null));
                field.set(null, switch (name) {
                    case "online" -> true;
                    case "revision" -> 40L;
                    case "pending" -> new SmartShuffleStart("PLsource", 40);
                    default -> null;
                });
            }
            Field cancellation = SmartShuffleNative.class.getDeclaredField("cancellations");
            cancellation.setAccessible(true);
            cancellations = (AtomicLong) cancellation.get(null);
            previousCancellation = cancellations.get();
            Field buffer = LogBufferManager.class.getDeclaredField("logBuffer");
            buffer.setAccessible(true);
            var logs = (Collection<?>) buffer.get(null);
            long callbacks = logs.stream().filter(line -> ((String) line)
                    .contains("Smart Shuffle network callback=")).count();

            var observer = new SmartShuffleManager.NetworkObserver(null);
            observer.onLost(null);
            observer.onLost(null);
            observer.onCapabilitiesChanged(null, null);

            for (Field field : previousState.keySet()) {
                switch (field.getName()) {
                    case "online" -> assertFalse(field.getBoolean(null));
                    case "revision" -> assertEquals(41, field.getLong(null));
                    case "pending" -> assertNull(field.get(null));
                }
            }
            assertEquals(previousCancellation + 1, cancellations.get());
            assertEquals(callbacks + 3, logs.stream().filter(line -> ((String) line)
                    .contains("Smart Shuffle network callback=")).count());
        } finally {
            for (var entry : previousState.entrySet()) entry.getKey().set(null, entry.getValue());
            if (cancellations != null) cancellations.set(previousCancellation);
            if (previousDebug != null) value.set(BaseSettings.DEBUG, previousDebug);
            contextField.set(null, previousContext);
        }
    }
}
