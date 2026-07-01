package dev.jason.gboardpatches.extension.writingtools;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@RunWith(RobolectricTestRunner.class)
public final class GboardAiWritingToolsDependencyRuntimeBehaviorTest {
    @After
    public void tearDown() throws Exception {
        GboardAiWritingToolsOfficialPreferences.clearForTest();
        resetGenAiFacade();
        setAllowGenAiServer(false);
    }

    @Test
    public void syncDependencyProviderUsesProvidedContextForServerFallback() throws Throwable {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        GboardAiWritingToolsSettings.ensureDefaults(preferences);
        Assert.assertTrue(GboardAiWritingToolsSettings.writeEnabled(preferences, true));
        Context context = new SharedPreferencesContext(preferences);

        FakeOfficialPreferences officialPreferences = new FakeOfficialPreferences()
                .put(GboardAiWritingToolsOfficialPreferences.SHOW_FIX_IT_BUTTON_PREF_KEY, true)
                .put(GboardAiWritingToolsOfficialPreferences.SERVER_PROOFREAD_PREF_KEY, true)
                .put(GboardAiWritingToolsOfficialPreferences.SERVER_WRITING_TOOLS_PREF_KEY, false)
                .put(GboardAiWritingToolsOfficialPreferences.WRITING_TOOLS_COOPERATIVE_MODE_PREF_KEY,
                        false);
        Object dependencyMonitor = newDependencyMonitor(
                FakeDependencyState.AI_CORE_CONNECTION_ERROR,
                officialPreferences);

        setAllowGenAiServer(true);
        resetGenAiFacade();

        GboardAiWritingToolsDependencyRuntime.syncDependencyProviderUnchecked(
                dependencyMonitor,
                context,
                "behavior-test");

        Assert.assertEquals("server", readGenAiFacadeField("mode"));
        Assert.assertSame(dependencyMonitor.getClass(), readGenAiFacadeField("lastFallbackClass"));
        Assert.assertEquals(1, ((Number) readGenAiFacadeField("serverCalls")).intValue());
    }

    @Test
    public void syncDependencyProviderRestoresOnDeviceModeWhenObservedPrefsDisallowServer()
            throws Throwable {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        GboardAiWritingToolsSettings.ensureDefaults(preferences);
        Assert.assertTrue(GboardAiWritingToolsSettings.writeEnabled(preferences, true));
        Context context = new SharedPreferencesContext(preferences);

        FakeOfficialPreferences officialPreferences = new FakeOfficialPreferences()
                .put(GboardAiWritingToolsOfficialPreferences.SHOW_FIX_IT_BUTTON_PREF_KEY, true)
                .put(GboardAiWritingToolsOfficialPreferences.SERVER_PROOFREAD_PREF_KEY, false)
                .put(GboardAiWritingToolsOfficialPreferences.SERVER_WRITING_TOOLS_PREF_KEY, false)
                .put(GboardAiWritingToolsOfficialPreferences.WRITING_TOOLS_COOPERATIVE_MODE_PREF_KEY,
                        false);
        Object dependencyMonitor = newDependencyMonitor(
                FakeDependencyState.AI_CORE_CONNECTION_ERROR,
                officialPreferences);

        setAllowGenAiServer(true);
        resetGenAiFacade();

        GboardAiWritingToolsDependencyRuntime.syncDependencyProviderUnchecked(
                dependencyMonitor,
                context,
                "behavior-test");

        Assert.assertEquals("device", readGenAiFacadeField("mode"));
        Assert.assertSame(dependencyMonitor, readGenAiFacadeField("lastDependency"));
        Assert.assertEquals(1, ((Number) readGenAiFacadeField("deviceCalls")).intValue());
        Assert.assertEquals(
                Boolean.FALSE,
                GboardAiWritingToolsOfficialPreferences.snapshot().overrideAllowAnyServerFlagValue());
    }

    private static Object newDependencyMonitor(Object state, Object preferences) throws Exception {
        return Class.forName("hcv_test_monitor")
                .getConstructor(Object.class, Object.class)
                .newInstance(state, preferences);
    }

    private static void setAllowGenAiServer(boolean value) throws Exception {
        Class<?> owner = Class.forName("hcw");
        Object mkr = owner.getDeclaredField("b").get(null);
        Field valueField = mkr.getClass().getDeclaredField("value");
        valueField.setAccessible(true);
        valueField.set(mkr, Boolean.valueOf(value));
    }

    private static void resetGenAiFacade() throws Exception {
        Object facade = Class.forName("mpw").getMethod("a").invoke(null);
        Method reset = facade.getClass().getDeclaredMethod("reset");
        reset.setAccessible(true);
        reset.invoke(facade);
    }

    private static Object readGenAiFacadeField(String fieldName) throws Exception {
        Object facade = Class.forName("mpw").getMethod("a").invoke(null);
        Field field = facade.getClass().getDeclaredField(fieldName);
        field.setAccessible(true);
        return field.get(facade);
    }

    private enum FakeDependencyState {
        READY,
        AI_CORE_CONNECTION_ERROR
    }

    private static final class FakeOfficialPreferences {
        private final Map<Integer, Boolean> values = new HashMap<Integer, Boolean>();

        private FakeOfficialPreferences put(int keyResId, boolean value) {
            values.put(Integer.valueOf(keyResId), Boolean.valueOf(value));
            return this;
        }

        @SuppressWarnings("unused")
        public boolean at(int keyResId) {
            return Boolean.TRUE.equals(values.get(Integer.valueOf(keyResId)));
        }
    }

    private static final class SharedPreferencesContext extends ContextWrapper {
        private final SharedPreferences preferences;

        private SharedPreferencesContext(SharedPreferences preferences) {
            super(null);
            this.preferences = preferences;
        }

        @Override
        public Context getApplicationContext() {
            return this;
        }

        @Override
        public SharedPreferences getSharedPreferences(String name, int mode) {
            return preferences;
        }
    }

    private static final class InMemorySharedPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<String, Object>();

        @Override
        public Map<String, ?> getAll() {
            return Collections.unmodifiableMap(new HashMap<String, Object>(values));
        }

        @Override
        public String getString(String key, String defValue) {
            Object value = values.get(key);
            return value instanceof String ? (String) value : defValue;
        }

        @Override
        @SuppressWarnings("unchecked")
        public Set<String> getStringSet(String key, Set<String> defValues) {
            Object value = values.get(key);
            return value instanceof Set ? (Set<String>) value : defValues;
        }

        @Override
        public int getInt(String key, int defValue) {
            Object value = values.get(key);
            return value instanceof Number ? ((Number) value).intValue() : defValue;
        }

        @Override
        public long getLong(String key, long defValue) {
            Object value = values.get(key);
            return value instanceof Number ? ((Number) value).longValue() : defValue;
        }

        @Override
        public float getFloat(String key, float defValue) {
            Object value = values.get(key);
            return value instanceof Number ? ((Number) value).floatValue() : defValue;
        }

        @Override
        public boolean getBoolean(String key, boolean defValue) {
            Object value = values.get(key);
            return value instanceof Boolean ? (Boolean) value : defValue;
        }

        @Override
        public boolean contains(String key) {
            return values.containsKey(key);
        }

        @Override
        public Editor edit() {
            return new Editor() {
                private final Map<String, Object> pending = new HashMap<String, Object>();

                @Override
                public Editor putString(String key, String value) {
                    pending.put(key, value);
                    return this;
                }

                @Override
                public Editor putStringSet(String key, Set<String> values) {
                    pending.put(key, values);
                    return this;
                }

                @Override
                public Editor putInt(String key, int value) {
                    pending.put(key, Integer.valueOf(value));
                    return this;
                }

                @Override
                public Editor putLong(String key, long value) {
                    pending.put(key, Long.valueOf(value));
                    return this;
                }

                @Override
                public Editor putFloat(String key, float value) {
                    pending.put(key, Float.valueOf(value));
                    return this;
                }

                @Override
                public Editor putBoolean(String key, boolean value) {
                    pending.put(key, Boolean.valueOf(value));
                    return this;
                }

                @Override
                public Editor remove(String key) {
                    pending.put(key, null);
                    return this;
                }

                @Override
                public Editor clear() {
                    values.clear();
                    pending.clear();
                    return this;
                }

                @Override
                public boolean commit() {
                    apply();
                    return true;
                }

                @Override
                public void apply() {
                    for (Map.Entry<String, Object> entry : pending.entrySet()) {
                        if (entry.getValue() == null) {
                            values.remove(entry.getKey());
                        } else {
                            values.put(entry.getKey(), entry.getValue());
                        }
                    }
                }
            };
        }

        @Override
        public void registerOnSharedPreferenceChangeListener(
                OnSharedPreferenceChangeListener listener) {
        }

        @Override
        public void unregisterOnSharedPreferenceChangeListener(
                OnSharedPreferenceChangeListener listener) {
        }
    }
}
