package dev.jason.gboardpatches.extension.symbolfooter;

import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsProvider;

public final class GboardSymbolFooterOrderRuntime {
    private static final String TAG = "GboardPatches";
    private static final String LOG_LABEL = "expression footer tab order";
    private static final Map<ClassLoader, Handles> HANDLES_BY_LOADER =
            Collections.synchronizedMap(new WeakHashMap<ClassLoader, Handles>());
    private static final Object SETTINGS_LOCK = new Object();

    private static volatile CachedSettings cachedSettings;

    private GboardSymbolFooterOrderRuntime() {
    }

    public static Object reorderExpressionCorpusList(Object receiver, Object corpusList) {
        if (receiver == null || corpusList == null) {
            return corpusList;
        }
        try {
            ClassLoader classLoader = receiver.getClass().getClassLoader();
            if (classLoader == null) {
                return corpusList;
            }
            Handles handles = handles(classLoader);
            List<String> configuredOrder = resolveConfiguredOrder(
                    extractExpressionCorpusManagerContext(handles, receiver));
            return reorderExpressionCorpusList(handles, corpusList, configuredOrder);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to reorder " + LOG_LABEL + " corpus list", throwable);
            return corpusList;
        }
    }

    public static void invalidateCachedSettings() {
        synchronized (SETTINGS_LOCK) {
            cachedSettings = null;
        }
    }

    private static Object reorderExpressionCorpusList(Handles handles,
            Object corpusList,
            List<String> configuredOrder) throws Throwable {
        if (!(corpusList instanceof Iterable)) {
            return corpusList;
        }
        List<OrderEntry> entries = new ArrayList<OrderEntry>();
        int index = 0;
        for (Object corpusItem : (Iterable) corpusList) {
            String keyboardTypeName = null;
            if (corpusItem != null && handles.expressionCorpusItemClass.isInstance(corpusItem)) {
                Object keyboardType = handles.expressionCorpusItemKeyboardTypeField.get(corpusItem);
                keyboardTypeName = extractKeyboardTypeName(handles, keyboardType);
            }
            entries.add(new OrderEntry(corpusItem, keyboardTypeName, index++));
        }
        if (entries.isEmpty()) {
            return corpusList;
        }

        List<OrderEntry> reorderedEntries = new ArrayList<OrderEntry>(entries);
        Collections.sort(reorderedEntries, new java.util.Comparator<OrderEntry>() {
            @Override
            public int compare(OrderEntry left, OrderEntry right) {
                int priorityCompare = Integer.compare(
                        orderPriority(left.keyboardTypeName, configuredOrder),
                        orderPriority(right.keyboardTypeName, configuredOrder));
                if (priorityCompare != 0) {
                    return priorityCompare;
                }
                return Integer.compare(left.originalIndex, right.originalIndex);
            }
        });

        if (isSameOrder(entries, reorderedEntries)) {
            Log.i(TAG, "Expression footer order unchanged: configured="
                    + describeOrder(configuredOrder)
                    + ", current=" + describeEntries(entries));
            return corpusList;
        }

        Object builder = handles.immutableListBuilderConstructor.newInstance();
        for (OrderEntry entry : reorderedEntries) {
            handles.immutableListBuilderAddMethod.invoke(builder, entry.corpusItem);
        }
        Object builtSet = handles.immutableListBuilderBuildMethod.invoke(builder);
        Log.i(TAG, "Reordered " + LOG_LABEL + " corpus list: configured="
                + describeOrder(configuredOrder)
                + ", before=" + describeEntries(entries)
                + ", after=" + describeEntries(reorderedEntries));
        return handles.immutableSetToListMethod.invoke(builtSet);
    }

    private static boolean isSameOrder(List<OrderEntry> left, List<OrderEntry> right) {
        if (left.size() != right.size()) {
            return false;
        }
        for (int index = 0; index < left.size(); index++) {
            if (left.get(index).corpusItem != right.get(index).corpusItem) {
                return false;
            }
        }
        return true;
    }

    private static String describeOrder(List<String> configuredOrder) {
        if (configuredOrder == null || configuredOrder.isEmpty()) {
            return "<empty>";
        }
        return configuredOrder.toString();
    }

    private static String describeEntries(List<OrderEntry> entries) {
        List<String> names = new ArrayList<String>();
        if (entries != null) {
            for (OrderEntry entry : entries) {
                names.add(entry != null ? String.valueOf(entry.keyboardTypeName) : "null");
            }
        }
        return names.toString();
    }

    private static int orderPriority(String keyboardTypeName, List<String> configuredOrder) {
        if (configuredOrder == null || configuredOrder.isEmpty()) {
            return GboardSymbolFooterOrderSettings.DEFAULT_SYMBOL_FOOTER_ORDER.size();
        }
        int index = configuredOrder.indexOf(keyboardTypeName);
        return index >= 0 ? index : configuredOrder.size();
    }

    private static List<String> resolveConfiguredOrder(Context context) {
        synchronized (SETTINGS_LOCK) {
            CachedSettings cached = cachedSettings;
            if (cached != null) {
                return cached.order;
            }
            CachedSettings loaded = loadConfiguredOrder(context);
            cachedSettings = loaded;
            return loaded.order;
        }
    }

    private static CachedSettings loadConfiguredOrder(Context context) {
        List<String> fallbackOrder = defaultOrderCopy();
        Context resolvedContext = context != null ? context : applicationContext();
        if (resolvedContext == null) {
            Log.i(TAG, "Expression footer order context unavailable; using fallback order");
            return new CachedSettings(fallbackOrder);
        }
        try {
            if (context == null) {
                Log.i(TAG, "Resolved expression footer order context from application fallback");
            }
            List<String> configuredOrder = loadConfiguredOrderFromProvider(resolvedContext);
            if (configuredOrder != null && !configuredOrder.isEmpty()) {
                Log.i(TAG, "Loaded " + LOG_LABEL + " from provider: " + configuredOrder);
                return new CachedSettings(copyOrder(configuredOrder));
            }
            List<String> directOrder = GboardSymbolFooterOrderSettings.readSymbolFooterOrder(
                    resolvedContext);
            Log.i(TAG, "Loaded " + LOG_LABEL + " from direct prefs fallback: " + directOrder);
            return new CachedSettings(copyOrder(directOrder));
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to load " + LOG_LABEL + "; using defaults", throwable);
            return new CachedSettings(fallbackOrder);
        }
    }

    private static List<String> loadConfiguredOrderFromProvider(Context context) {
        if (context == null) {
            return null;
        }
        try {
            ContentResolver contentResolver = context.getContentResolver();
            if (contentResolver == null) {
                return null;
            }
            Bundle result = contentResolver.call(
                    buildSettingsProviderUri(context),
                    GboardPatchesSettingsProvider.METHOD_GET_SYMBOL_FOOTER_ORDER_SETTINGS,
                    null,
                    null);
            if (result == null) {
                return null;
            }
            ArrayList<String> configuredOrder = result.getStringArrayList(
                    GboardPatchesSettingsProvider.BUNDLE_KEY_SYMBOL_FOOTER_ORDER);
            if (configuredOrder == null || configuredOrder.isEmpty()) {
                Log.i(TAG, "Provider returned empty " + LOG_LABEL);
                return null;
            }
            return configuredOrder;
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to load " + LOG_LABEL + " from provider", throwable);
            return null;
        }
    }

    private static Uri buildSettingsProviderUri(Context context) {
        return Uri.parse("content://"
                + context.getPackageName()
                + GboardPatchesSettingsProvider.AUTHORITY_SUFFIX);
    }

    private static Context applicationContext() {
        Context context = reflectedApplicationContext(
                "android.app.ActivityThread",
                "currentApplication");
        if (context != null) {
            return context;
        }
        return reflectedApplicationContext(
                "android.app.AppGlobals",
                "getInitialApplication");
    }

    private static Context reflectedApplicationContext(String className, String methodName) {
        try {
            Class<?> owner = Class.forName(className);
            Method method = owner.getDeclaredMethod(methodName);
            Object application = method.invoke(null);
            return application instanceof Context ? (Context) application : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Context extractExpressionCorpusManagerContext(Handles handles, Object receiver)
            throws Throwable {
        if (handles == null
                || receiver == null
                || handles.expressionCorpusManagerContextField == null
                || !handles.expressionCorpusManagerContextField.getDeclaringClass()
                        .isInstance(receiver)) {
            return null;
        }
        Object context = handles.expressionCorpusManagerContextField.get(receiver);
        return context instanceof Context ? (Context) context : null;
    }

    private static String extractKeyboardTypeName(Handles handles, Object keyboardType)
            throws Throwable {
        if (handles == null || keyboardType == null) {
            return null;
        }
        Object keyboardTypeName = handles.keyboardTypeNameField.get(keyboardType);
        return keyboardTypeName != null ? String.valueOf(keyboardTypeName) : null;
    }

    private static Handles handles(ClassLoader classLoader) throws Throwable {
        Handles cached = HANDLES_BY_LOADER.get(classLoader);
        if (cached != null) {
            return cached;
        }
        Handles created = new Handles(classLoader);
        HANDLES_BY_LOADER.put(classLoader, created);
        return created;
    }

    private static final class Handles {
        final Field keyboardTypeNameField;
        final Class<?> expressionCorpusItemClass;
        final Field expressionCorpusItemKeyboardTypeField;
        final Constructor<?> immutableListBuilderConstructor;
        final Method immutableListBuilderAddMethod;
        final Method immutableListBuilderBuildMethod;
        final Method immutableSetToListMethod;
        final Field expressionCorpusManagerContextField;

        Handles(ClassLoader classLoader) throws Throwable {
            Class<?> keyboardTypeClass = Class.forName("nzd", false, classLoader);
            Class<?> immutableListBuilderClass = Class.forName("twm", false, classLoader);
            Class<?> immutableSetClass = Class.forName("two", false, classLoader);
            Class<?> expressionCorpusManagerClass = Class.forName("fsg", false, classLoader);
            expressionCorpusItemClass = Class.forName("mik", false, classLoader);

            keyboardTypeNameField = keyboardTypeClass.getDeclaredField("k");
            keyboardTypeNameField.setAccessible(true);

            expressionCorpusItemKeyboardTypeField = expressionCorpusItemClass.getDeclaredField("c");
            expressionCorpusItemKeyboardTypeField.setAccessible(true);

            immutableListBuilderConstructor = immutableListBuilderClass.getDeclaredConstructor();
            immutableListBuilderConstructor.setAccessible(true);
            immutableListBuilderAddMethod =
                    immutableListBuilderClass.getDeclaredMethod("h", Object.class);
            immutableListBuilderAddMethod.setAccessible(true);
            immutableListBuilderBuildMethod = immutableListBuilderClass.getDeclaredMethod("g");
            immutableListBuilderBuildMethod.setAccessible(true);
            immutableSetToListMethod = immutableSetClass.getMethod("g");
            immutableSetToListMethod.setAccessible(true);

            expressionCorpusManagerContextField = expressionCorpusManagerClass.getDeclaredField("c");
            expressionCorpusManagerContextField.setAccessible(true);
        }
    }

    private static final class OrderEntry {
        final Object corpusItem;
        final String keyboardTypeName;
        final int originalIndex;

        OrderEntry(Object corpusItem, String keyboardTypeName, int originalIndex) {
            this.corpusItem = corpusItem;
            this.keyboardTypeName = keyboardTypeName;
            this.originalIndex = originalIndex;
        }
    }

    private static final class CachedSettings {
        final List<String> order;

        CachedSettings(List<String> order) {
            this.order = order;
        }
    }

    private static List<String> copyOrder(List<String> order) {
        if (order == null || order.isEmpty()) {
            return defaultOrderCopy();
        }
        return Collections.unmodifiableList(new ArrayList<String>(order));
    }

    private static List<String> defaultOrderCopy() {
        return Collections.unmodifiableList(
                new ArrayList<String>(GboardSymbolFooterOrderSettings.DEFAULT_SYMBOL_FOOTER_ORDER));
    }
}
