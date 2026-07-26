package dev.jason.gboardpatches.extension.writingtools;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class GboardAiWritingToolsBackendFactoryRuntimeTest {
    @After
    public void tearDown() throws Exception {
        setAiCoreConstructionFailure(false);
        applicationContextField().set(null, null);
    }

    @Test
    public void serverModeMasterOffAndAlreadyPrivateResultsStayUntouched() throws Exception {
        InMemorySharedPreferences preferences = installSettings(
                true,
                GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER);
        Object config = newConfig("server");
        Object server = newServer(config);
        Assert.assertSame(server,
                GboardAiWritingToolsBackendFactoryRuntime.replaceUnsupportedServerFallback(
                        server,
                        installedContext(),
                        config));

        GboardAiWritingToolsSettings.writeBackendType(
                preferences,
                GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE);
        Object alreadyPrivate = newAiCore(config);
        Assert.assertSame(alreadyPrivate,
                GboardAiWritingToolsBackendFactoryRuntime.replaceUnsupportedServerFallback(
                        alreadyPrivate,
                        installedContext(),
                        config));

        GboardAiWritingToolsSettings.writeEnabled(preferences, false);
        Object disabledServer = newServer(config);
        Assert.assertSame(disabledServer,
                GboardAiWritingToolsBackendFactoryRuntime.replaceUnsupportedServerFallback(
                        disabledServer,
                        installedContext(),
                        config));
    }

    @Test
    public void privateModesReplaceOnlyExactServerResultAndPreserveConfigAndPayload()
            throws Exception {
        InMemorySharedPreferences preferences = installSettings(
                true,
                GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE);
        Object config = newConfig("private-config");
        Object aiCore = GboardAiWritingToolsBackendFactoryRuntime
                .replaceUnsupportedServerFallback(
                        newServer(config), installedContext(), config);

        Assert.assertEquals("njr", aiCore.getClass().getName());
        Assert.assertSame(config, aiCore.getClass().getField("config").get(aiCore));
        Object aiCoreFuture = aiCore.getClass().getMethod("request", String.class)
                .invoke(aiCore, "exact payload");
        Assert.assertEquals("exact payload",
                aiCoreFuture.getClass().getField("payload").get(aiCoreFuture));

        GboardAiWritingToolsSettings.writeBackendType(
                preferences,
                GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA);
        Object astrea = GboardAiWritingToolsBackendFactoryRuntime
                .replaceUnsupportedServerFallback(
                        newServer(config), installedContext(), config);
        Assert.assertEquals("njt", astrea.getClass().getName());
        Object astreaFuture = astrea.getClass().getMethod("request", String.class)
                .invoke(astrea, "astrea payload");
        Assert.assertEquals("astrea payload",
                astreaFuture.getClass().getField("payload").get(astreaFuture));
    }

    @Test
    public void nullExplicitContextUsesCachedApplicationContextForPrivateModes()
            throws Exception {
        InMemorySharedPreferences preferences = installSettings(
                true,
                GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE);
        Object config = newConfig("cached-context");

        Object aiCore = GboardAiWritingToolsBackendFactoryRuntime
                .replaceUnsupportedServerFallback(newServer(config), null, config);
        Assert.assertEquals("njr", aiCore.getClass().getName());
        Assert.assertSame(config, aiCore.getClass().getField("config").get(aiCore));

        GboardAiWritingToolsSettings.writeBackendType(
                preferences,
                GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA);
        Object astrea = GboardAiWritingToolsBackendFactoryRuntime
                .replaceUnsupportedServerFallback(newServer(config), null, config);
        Assert.assertEquals("njt", astrea.getClass().getName());
    }

    @Test
    public void nullExplicitAndUnresolvedApplicationContextNeverReturnsServer()
            throws Exception {
        applicationContextField().set(null, null);
        Object config = newConfig("unresolved-context");
        Object server = newServer(config);

        Object replacement = GboardAiWritingToolsBackendFactoryRuntime
                .replaceUnsupportedServerFallback(server, null, config);

        Assert.assertNotSame(server, replacement);
        Assert.assertTrue(Proxy.isProxyClass(replacement.getClass()));
        Assert.assertEquals("PRIVATE_INFERENCE_CONTEXT_UNAVAILABLE",
                Class.forName("njz").getMethod("i").invoke(replacement));
    }

    @Test
    public void throwingSettingsReadFailsClosedWithOriginalCause() throws Exception {
        Object config = newConfig("throwing-settings");
        Object server = newServer(config);
        IllegalStateException failure = new IllegalStateException("settings unavailable");

        Object replacement = GboardAiWritingToolsBackendFactoryRuntime
                .replaceUnsupportedServerFallback(
                        server,
                        new ThrowingSharedPreferencesContext(failure),
                        config);

        Assert.assertNotSame(server, replacement);
        Assert.assertTrue(Proxy.isProxyClass(replacement.getClass()));
        Class<?> handlerType = Class.forName("njz");
        Assert.assertEquals("PRIVATE_INFERENCE_SETTINGS_UNAVAILABLE",
                handlerType.getMethod("i").invoke(replacement));
        Object failedFuture = handlerType.getMethod("request", String.class)
                .invoke(replacement, "must fail closed");
        Assert.assertSame(failure, failedFuture.getClass().getField("failure").get(failedFuture));
    }

    @Test
    public void constructorFailureReturnsTargetInterfaceProxyWithFailedFutures()
            throws Exception {
        installSettings(
                true,
                GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE);
        Object config = newConfig("failure");
        Object server = newServer(config);
        setAiCoreConstructionFailure(true);

        Object replacement = GboardAiWritingToolsBackendFactoryRuntime
                .replaceUnsupportedServerFallback(server, installedContext(), config);

        Assert.assertNotSame(server, replacement);
        Assert.assertTrue(Proxy.isProxyClass(replacement.getClass()));
        Class<?> handlerType = Class.forName("njz");
        Assert.assertSame(handlerType.getClassLoader(), replacement.getClass().getClassLoader());
        Assert.assertEquals("PRIVATE_INFERENCE_AICORE_UNAVAILABLE",
                handlerType.getMethod("i").invoke(replacement));
        Object failedFuture = handlerType.getMethod("request", String.class)
                .invoke(replacement, "must not reach server");
        Throwable cause = (Throwable) failedFuture.getClass().getField("failure")
                .get(failedFuture);
        Assert.assertTrue(cause instanceof IllegalStateException);
        handlerType.getMethod("o").invoke(replacement);
        handlerType.getMethod("close").invoke(replacement);
    }

    @Test
    public void missingPrivateBindingNeverRestoresServerAndMissingProxyBindingReturnsNull()
            throws Exception {
        installSettings(
                true,
                GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE);
        Object config = newConfig("missing");

        ClassLoader missingHandlerLoader = new IsolatedServerLoader(false);
        Object isolatedServer = newIsolatedServer(missingHandlerLoader, config);
        Object failClosed = GboardAiWritingToolsBackendFactoryRuntime
                .replaceUnsupportedServerFallback(
                        isolatedServer, installedContext(), config);
        Assert.assertNotSame(isolatedServer, failClosed);
        Assert.assertTrue(Proxy.isProxyClass(failClosed.getClass()));

        ClassLoader missingProxyLoader = new IsolatedServerLoader(true);
        Object isolatedServerWithoutProxy = newIsolatedServer(missingProxyLoader, config);
        Assert.assertNull(GboardAiWritingToolsBackendFactoryRuntime
                .replaceUnsupportedServerFallback(
                        isolatedServerWithoutProxy, installedContext(), config));
    }

    private static InMemorySharedPreferences installSettings(boolean enabled, String backend)
            throws Exception {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        GboardAiWritingToolsSettings.ensureDefaults(preferences);
        GboardAiWritingToolsSettings.writeEnabled(preferences, enabled);
        GboardAiWritingToolsSettings.writeBackendType(preferences, backend);
        applicationContextField().set(null, new SharedPreferencesContext(preferences));
        return preferences;
    }

    private static Object newConfig(String id) throws Exception {
        return Class.forName("oxe").getConstructor(String.class).newInstance(id);
    }

    private static Object newServer(Object config) throws Exception {
        return Class.forName("njl").getConstructor(config.getClass()).newInstance(config);
    }

    private static Object newAiCore(Object config) throws Exception {
        return Class.forName("njr")
                .getConstructor(Context.class, config.getClass())
                .newInstance(new ContextWrapper(null), config);
    }

    private static Object newIsolatedServer(ClassLoader loader, Object config) throws Exception {
        return loader.loadClass("njl").getConstructor(config.getClass()).newInstance(config);
    }

    private static void setAiCoreConstructionFailure(boolean value) throws Exception {
        Class.forName("njr").getField("failConstruction").setBoolean(null, value);
    }

    private static Field applicationContextField() throws Exception {
        Field field = GboardAiWritingToolsRuntime.class.getDeclaredField("applicationContext");
        field.setAccessible(true);
        return field;
    }

    private static Context installedContext() throws Exception {
        return (Context) applicationContextField().get(null);
    }

    private static final class IsolatedServerLoader extends ClassLoader {
        private final boolean blockFailedFutureFactory;

        private IsolatedServerLoader(boolean blockFailedFutureFactory) {
            super(GboardAiWritingToolsBackendFactoryRuntimeTest.class.getClassLoader());
            this.blockFailedFutureFactory = blockFailedFutureFactory;
        }

        @Override
        protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
            if ("njr".equals(name)) {
                throw new ClassNotFoundException(name);
            }
            if (blockFailedFutureFactory && "vme".equals(name)) {
                throw new ClassNotFoundException(name);
            }
            if (!"njl".equals(name)) {
                return super.loadClass(name, resolve);
            }
            synchronized (this) {
                Class<?> loaded = findLoadedClass(name);
                if (loaded == null) {
                    byte[] bytes = readClassBytes(name);
                    loaded = defineClass(name, bytes, 0, bytes.length);
                }
                if (resolve) {
                    resolveClass(loaded);
                }
                return loaded;
            }
        }

        private byte[] readClassBytes(String name) throws ClassNotFoundException {
            try (InputStream input = getParent().getResourceAsStream(name + ".class")) {
                if (input == null) {
                    throw new ClassNotFoundException(name);
                }
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int read;
                while ((read = input.read(buffer)) >= 0) {
                    output.write(buffer, 0, read);
                }
                return output.toByteArray();
            } catch (ClassNotFoundException exception) {
                throw exception;
            } catch (Exception exception) {
                throw new ClassNotFoundException(name, exception);
            }
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

    private static final class ThrowingSharedPreferencesContext extends ContextWrapper {
        private final RuntimeException failure;

        private ThrowingSharedPreferencesContext(RuntimeException failure) {
            super(null);
            this.failure = failure;
        }

        @Override
        public Context getApplicationContext() {
            return this;
        }

        @Override
        public SharedPreferences getSharedPreferences(String name, int mode) {
            throw failure;
        }
    }

    private static final class InMemorySharedPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<String, Object>();

        @Override
        public Map<String, ?> getAll() {
            return Collections.unmodifiableMap(values);
        }

        @Override
        public String getString(String key, String defValue) {
            Object value = values.get(key);
            return value instanceof String ? (String) value : defValue;
        }

        @Override
        public Set<String> getStringSet(String key, Set<String> defValues) {
            return defValues;
        }

        @Override
        public int getInt(String key, int defValue) {
            return defValue;
        }

        @Override
        public long getLong(String key, long defValue) {
            return defValue;
        }

        @Override
        public float getFloat(String key, float defValue) {
            return defValue;
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
                    pending.put(key, value);
                    return this;
                }

                @Override
                public Editor putLong(String key, long value) {
                    pending.put(key, value);
                    return this;
                }

                @Override
                public Editor putFloat(String key, float value) {
                    pending.put(key, value);
                    return this;
                }

                @Override
                public Editor putBoolean(String key, boolean value) {
                    pending.put(key, value);
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
