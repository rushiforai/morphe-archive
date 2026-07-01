package dev.jason.gboardpatches.extension.writingtools;

import android.content.Context;
import android.os.Build;
import android.util.Log;

import java.util.Collections;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

public final class GboardAiWritingToolsDependencyRuntime {
    private static final String TAG = "GboardPatches";
    private static final String LOG_PREFIX = "[gboard-ai-writing-tools] ";
    private static final String GEN_AI_FACADE_CLASS = "mpw";
    private static final String DEPENDENCY_INTERFACE_CLASS = "mqc";
    private static final String ALLOW_GEN_AI_SERVER_CLASS = "hcw";
    private static final String ALLOW_GEN_AI_SERVER_FIELD = "b";

    private static final Map<String, Field> FIELD_CACHE = new ConcurrentHashMap<String, Field>();
    private static final Map<String, Method> METHOD_CACHE =
            new ConcurrentHashMap<String, Method>();
    private static final Map<Object, String> MODE_SNAPSHOTS =
            Collections.synchronizedMap(new WeakHashMap<Object, String>());
    private static final AtomicBoolean ENTRY_HOOK_LOGGED = new AtomicBoolean(false);
    private static final AtomicBoolean HOOK_LOGGED = new AtomicBoolean(false);
    private static final AtomicInteger FALLBACK_COUNT = new AtomicInteger(0);
    private static final AtomicInteger RESTORE_COUNT = new AtomicInteger(0);
    private static final AtomicInteger SKIP_COUNT = new AtomicInteger(0);

    private GboardAiWritingToolsDependencyRuntime() {
    }

    public static void syncDependencyProvider(Object dependencyMonitor, String reason) {
        try {
            syncDependencyProviderUnchecked(dependencyMonitor, resolveContext(), reason);
        } catch (Throwable throwable) {
            Log.w(TAG, LOG_PREFIX + "failed to sync dependency provider: " + reason, throwable);
        }
    }

    public static void syncDependencyProvider(Object dependencyMonitor, Context context,
            String reason) {
        try {
            syncDependencyProviderUnchecked(dependencyMonitor, context, reason);
        } catch (Throwable throwable) {
            Log.w(TAG, LOG_PREFIX + "failed to sync dependency provider: " + reason, throwable);
        }
    }

    static void syncDependencyProviderUnchecked(Object dependencyMonitor, Context context,
            String reason) throws Throwable {
        logOnce(ENTRY_HOOK_LOGGED, LOG_PREFIX + "dependency sync entry hook reached");
        if (dependencyMonitor == null || context == null) {
            logLimited(SKIP_COUNT, 40, LOG_PREFIX + buildSkipLog(
                    reason,
                    dependencyMonitor != null,
                    context != null,
                    null));
            return;
        }

        GboardAiWritingToolsSettings.Snapshot settings =
                GboardAiWritingToolsSettings.snapshot(context);
        if (!settings.featureEnabled) {
            logLimited(SKIP_COUNT, 40, LOG_PREFIX + buildSkipLog(
                    reason,
                    true,
                    true,
                    Boolean.FALSE));
            return;
        }

        ClassLoader classLoader = dependencyMonitor.getClass().getClassLoader();
        String dependencyStateName = describeState(readField(dependencyMonitor, "a"));
        boolean allowGenAiServer = Boolean.TRUE.equals(readStaticMkrBoolean(
                classLoader,
                ALLOW_GEN_AI_SERVER_CLASS,
                ALLOW_GEN_AI_SERVER_FIELD));
        Object preferences = readField(dependencyMonitor, "g");

        Boolean proofreadEnabled = readPreferenceBoolean(
                preferences,
                GboardAiWritingToolsOfficialPreferences.SHOW_FIX_IT_BUTTON_PREF_KEY);
        Boolean proofreadServerEnabled = readPreferenceBoolean(
                preferences,
                GboardAiWritingToolsOfficialPreferences.SERVER_PROOFREAD_PREF_KEY);
        Boolean writingToolsServerEnabled = readPreferenceBoolean(
                preferences,
                GboardAiWritingToolsOfficialPreferences.SERVER_WRITING_TOOLS_PREF_KEY);
        Boolean editTextWithAiEnabled = readPreferenceBoolean(
                preferences,
                GboardAiWritingToolsOfficialPreferences
                        .WRITING_TOOLS_COOPERATIVE_MODE_PREF_KEY);

        if (proofreadEnabled != null) {
            GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                    GboardAiWritingToolsOfficialPreferences.SHOW_FIX_IT_BUTTON_PREF_KEY,
                    proofreadEnabled.booleanValue());
        }
        if (proofreadServerEnabled != null) {
            GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                    GboardAiWritingToolsOfficialPreferences.SERVER_PROOFREAD_PREF_KEY,
                    proofreadServerEnabled.booleanValue());
        }
        if (writingToolsServerEnabled != null) {
            GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                    GboardAiWritingToolsOfficialPreferences.SERVER_WRITING_TOOLS_PREF_KEY,
                    writingToolsServerEnabled.booleanValue());
        }
        if (editTextWithAiEnabled != null) {
            GboardAiWritingToolsOfficialPreferences.notePreferenceValue(
                    GboardAiWritingToolsOfficialPreferences
                            .WRITING_TOOLS_COOPERATIVE_MODE_PREF_KEY,
                    editTextWithAiEnabled.booleanValue());
        }

        boolean userAllowsServer = computeUserAllowsServer(
                proofreadEnabled,
                proofreadServerEnabled,
                writingToolsServerEnabled,
                editTextWithAiEnabled);

        boolean useServerFallback = shouldUseServerSideFallback(
                Build.MANUFACTURER,
                dependencyStateName,
                allowGenAiServer,
                userAllowsServer);

        Object genAiFacade = invokeStaticNoArg(classLoader, GEN_AI_FACADE_CLASS, "a");
        if (useServerFallback) {
            invoke(genAiFacade, "e", new Class<?>[] { Class.class },
                    dependencyMonitor.getClass());
        } else {
            Class<?> dependencyInterfaceClass = Class.forName(
                    DEPENDENCY_INTERFACE_CLASS,
                    false,
                    classLoader);
            invoke(genAiFacade, "d", new Class<?>[] { dependencyInterfaceClass },
                    dependencyMonitor);
        }

        logDecision(
                dependencyMonitor,
                useServerFallback ? FALLBACK_COUNT : RESTORE_COUNT,
                reason,
                Build.MANUFACTURER,
                dependencyStateName,
                allowGenAiServer,
                proofreadEnabled,
                proofreadServerEnabled,
                writingToolsServerEnabled,
                editTextWithAiEnabled,
                userAllowsServer,
                useServerFallback,
                describeState(invokeNoArg(genAiFacade, "c")));
    }

    static boolean computeUserAllowsServer(Boolean proofreadEnabled,
            Boolean proofreadServerEnabled,
            Boolean writingToolsServerEnabled,
            Boolean editTextWithAiEnabled) {
        return Boolean.TRUE.equals(
                GboardAiWritingToolsOfficialPreferences.resolveAllowServerForAnyEnabledFeature(
                proofreadEnabled,
                proofreadServerEnabled,
                writingToolsServerEnabled,
                editTextWithAiEnabled));
    }

    static boolean shouldUseServerSideFallback(String manufacturer, String dependencyStateName,
            boolean allowGenAiServer, boolean userAllowsServer) {
        if (!allowGenAiServer || !userAllowsServer) {
            return false;
        }
        if (!isGoogleManufacturer(manufacturer)) {
            return true;
        }
        if (dependencyStateName == null) {
            return false;
        }
        return "AI_CORE_CONNECTION_ERROR".equals(dependencyStateName)
                || "AI_CORE_MODEL_NOT_FOUND".equals(dependencyStateName)
                || "AI_CORE_MODEL_DOWNLOADABLE".equals(dependencyStateName)
                || "AI_CORE_MODEL_DOWNLOADING".equals(dependencyStateName);
    }

    static String buildSkipLog(String reason, boolean hasDependencyMonitor, boolean hasContext,
            Boolean featureEnabled) {
        return "skipped dependency sync"
                + ": reason=" + reason
                + ", hasDependencyMonitor=" + hasDependencyMonitor
                + ", hasContext=" + hasContext
                + ", featureEnabled=" + String.valueOf(featureEnabled);
    }

    static String buildDecisionLog(String reason, String manufacturer, String dependencyStateName,
            boolean allowGenAiServer, Boolean proofreadEnabled,
            Boolean proofreadServerEnabled, Boolean writingToolsServerEnabled,
            Boolean editTextWithAiEnabled, boolean userAllowsServer,
            boolean useServerFallback, String facadeState) {
        return "reason=" + reason
                + ", mode=" + (useServerFallback ? "ServerSideGenAi" : "OnDeviceGenAi")
                + ", manufacturer=" + String.valueOf(manufacturer)
                + ", allowGenAiServer=" + allowGenAiServer
                + ", proofreadEnabled=" + String.valueOf(proofreadEnabled)
                + ", proofreadServerEnabled=" + String.valueOf(proofreadServerEnabled)
                + ", writingToolsServerEnabled=" + String.valueOf(writingToolsServerEnabled)
                + ", editTextWithAiEnabled=" + String.valueOf(editTextWithAiEnabled)
                + ", userAllowsServer=" + userAllowsServer
                + ", dependencyState=" + String.valueOf(dependencyStateName)
                + ", facadeState=" + String.valueOf(facadeState);
    }

    private static boolean isGoogleManufacturer(String manufacturer) {
        return manufacturer != null && manufacturer.toLowerCase().contains("google");
    }

    private static void logDecision(Object dependencyMonitor, AtomicInteger counter,
            String reason, String manufacturer, String dependencyStateName,
            boolean allowGenAiServer, Boolean proofreadEnabled,
            Boolean proofreadServerEnabled, Boolean writingToolsServerEnabled,
            Boolean editTextWithAiEnabled, boolean userAllowsServer,
            boolean useServerFallback, String facadeState) {
        String message = buildDecisionLog(
                reason,
                manufacturer,
                dependencyStateName,
                allowGenAiServer,
                proofreadEnabled,
                proofreadServerEnabled,
                writingToolsServerEnabled,
                editTextWithAiEnabled,
                userAllowsServer,
                useServerFallback,
                facadeState);
        synchronized (MODE_SNAPSHOTS) {
            String previous = MODE_SNAPSHOTS.get(dependencyMonitor);
            if (message.equals(previous)) {
                return;
            }
            MODE_SNAPSHOTS.put(dependencyMonitor, message);
        }
        logOnce(HOOK_LOGGED, LOG_PREFIX + "dependency fallback hooks are active");
        logLimited(counter, 40, LOG_PREFIX + message);
    }

    private static void logOnce(AtomicBoolean gate, String message) {
        if (gate.compareAndSet(false, true)) {
            Log.i(TAG, message);
        }
    }

    private static void logLimited(AtomicInteger counter, int limit, String message) {
        if (counter.incrementAndGet() <= limit) {
            Log.i(TAG, message);
        }
    }

    private static Field getField(Class<?> owner, String fieldName) throws Throwable {
        String cacheKey = owner.getName() + "#" + fieldName;
        Field field = FIELD_CACHE.get(cacheKey);
        if (field != null) {
            return field;
        }
        field = owner.getDeclaredField(fieldName);
        field.setAccessible(true);
        FIELD_CACHE.put(cacheKey, field);
        return field;
    }

    private static Method getMethod(Class<?> owner, String methodName,
            Class<?>... parameterTypes) throws Throwable {
        StringBuilder keyBuilder = new StringBuilder(owner.getName())
                .append('#')
                .append(methodName)
                .append('(');
        for (Class<?> parameterType : parameterTypes) {
            keyBuilder.append(parameterType.getName()).append(',');
        }
        keyBuilder.append(')');
        String cacheKey = keyBuilder.toString();
        Method method = METHOD_CACHE.get(cacheKey);
        if (method != null) {
            return method;
        }
        method = owner.getDeclaredMethod(methodName, parameterTypes);
        method.setAccessible(true);
        METHOD_CACHE.put(cacheKey, method);
        return method;
    }

    private static Object readField(Object receiver, String fieldName) throws Throwable {
        if (receiver == null) {
            return null;
        }
        return getField(receiver.getClass(), fieldName).get(receiver);
    }

    private static String describeState(Object value) {
        if (value instanceof Enum<?>) {
            return ((Enum<?>) value).name();
        }
        return String.valueOf(value);
    }

    private static Object invoke(Object receiver, String methodName, Class<?>[] parameterTypes,
            Object... args) throws Throwable {
        return getMethod(receiver.getClass(), methodName, parameterTypes).invoke(receiver, args);
    }

    private static Object invokeNoArg(Object receiver, String methodName) throws Throwable {
        return invoke(receiver, methodName, new Class<?>[0]);
    }

    private static Object invokeStaticNoArg(ClassLoader classLoader, String className,
            String methodName) throws Throwable {
        Class<?> owner = Class.forName(className, false, classLoader);
        return getMethod(owner, methodName, new Class<?>[0]).invoke(null);
    }

    private static Boolean readPreferenceBoolean(Object preferences, int keyResId)
            throws Throwable {
        if (preferences == null) {
            return null;
        }
        Object value = invoke(preferences, "at", new Class<?>[] { int.class },
                Integer.valueOf(keyResId));
        return value instanceof Boolean ? (Boolean) value : null;
    }

    private static Boolean readStaticMkrBoolean(ClassLoader classLoader, String className,
            String fieldName) throws Throwable {
        Class<?> owner = Class.forName(className, false, classLoader);
        Object mkr = getField(owner, fieldName).get(null);
        Object value = invokeNoArg(mkr, "g");
        return value instanceof Boolean ? (Boolean) value : null;
    }

    private static Context resolveContext() {
        Context context = GboardAiWritingToolsRuntime.reflectedApplicationContext(
                "android.app.ActivityThread",
                "currentApplication");
        if (context != null) {
            return context;
        }
        return GboardAiWritingToolsRuntime.reflectedApplicationContext(
                "android.app.AppGlobals",
                "getInitialApplication");
    }
}
