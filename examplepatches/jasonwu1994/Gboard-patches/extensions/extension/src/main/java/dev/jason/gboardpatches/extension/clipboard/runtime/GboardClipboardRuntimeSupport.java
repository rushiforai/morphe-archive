package dev.jason.gboardpatches.extension.clipboard;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

@SuppressWarnings({"unchecked", "unused"})
final class GboardClipboardRuntimeSupport {
    interface ThrowingSupplier<T> {
        T get() throws Throwable;
    }

    interface ThrowingRunnable {
        void run() throws Throwable;
    }

    static final String TAG = "GboardClipboard";
    static final String LOG_PREFIX = "[gboard-clipboard]";

    static final String CLIPBOARD_LOADER_CALLABLE_CLASS = "eln";
    static final String CLIPBOARD_PRUNE_CALLABLE_CLASS = "emr";
    static final String CLIPBOARD_ADAPTER_CLASS = "emk";
    static final String CLIPBOARD_VIEW_HOLDER_CLASS = "emi";

    static final long MINUTE_MS = 60_000L;
    static final long INFINITE_TTL_MS = -1L;
    static final int INFINITE_TTL_MINUTES = -1;
    static final int INFINITE_MAX_COUNT = -1;
    static final int DEFAULT_TTL_MINUTES = 60;
    static final int DEFAULT_MAX_COUNT = 100;
    static final int DEFAULT_PREVIEW_LINES = 5;

    static final long STOCK_CLIPBOARD_TTL_MS = 3_600_000L;
    static final int STOCK_CLIPBOARD_MAX_COUNT = 100;
    static final int STOCK_CLIPBOARD_PRUNE_TRIGGER = 120;
    static final int STOCK_CLIPBOARD_GROUP_LIMIT = 5;
    static final int STOCK_CLIPBOARD_CONTENT_MAX_LINES = 5;
    static final int LAST_VISIBLE_TIMESTAMP_PREF_RES_ID = 0x7f140928;
    static final String[] CURSOR_COUNT_PROJECTION =
            new String[] { "_id", "timestamp", "item_type", "uri" };
    static final String STOCK_SELECTION_RECENT_PINNED_SPECIAL =
            "((item_type & 1) = 0 AND (item_type & 2) = 0 AND timestamp >= ?)"
                    + " OR ((item_type & 1) != 0)"
                    + " OR ((item_type & 1) = 0 AND (item_type & 2) != 0)";
    static final String SELECTION_TIMESTAMP_EQUALS = "timestamp = ?";
    static final String SORT_TIMESTAMP_DESC = "timestamp DESC";
    static final long COUNTDOWN_UPDATE_INTERVAL_MS = 1_000L;

    private volatile Context applicationContext;
    private volatile Field clipboardKeyboardContextField;

    private final Map<ClassLoader, ReflectionHandles> handlesByLoader =
            Collections.synchronizedMap(new WeakHashMap<ClassLoader, ReflectionHandles>());
    final Map<TextView, CountdownBinding> activeCountdownByTextView =
            Collections.synchronizedMap(new WeakHashMap<TextView, CountdownBinding>());
    final Map<TextView, Integer> activeMaxLinesOverrideByTextView =
            Collections.synchronizedMap(new WeakHashMap<TextView, Integer>());
    final Map<Object, OrderIndexRefreshState> orderIndexRefreshStateByAdapter =
            Collections.synchronizedMap(new WeakHashMap<Object, OrderIndexRefreshState>());

    final AtomicInteger loaderInvocationCount = new AtomicInteger(0);
    final AtomicInteger pruneInvocationCount = new AtomicInteger(0);
    final AtomicInteger trimInvocationCount = new AtomicInteger(0);
    final AtomicInteger countdownBindCount = new AtomicInteger(0);
    final AtomicInteger textMaxLinesPatchCount = new AtomicInteger(0);

    <T> T runSafely(String action, ThrowingSupplier<T> supplier, T fallbackValue) {
        try {
            return supplier.get();
        } catch (Throwable throwable) {
            logWarn("Failed to " + action, throwable);
            return fallbackValue;
        }
    }

    void runSafely(String action, ThrowingRunnable runnable) {
        try {
            runnable.run();
        } catch (Throwable throwable) {
            logWarn("Failed to " + action, throwable);
        }
    }

    boolean isClipboardEnabled() {
        Context context = applicationContext();
        return context == null || GboardClipboardSettings.readClipboardEnabled(context);
    }

    boolean shouldShowExpiryCountdown() {
        Context context = applicationContext();
        return context == null
                ? GboardClipboardSettings.DEFAULT_CLIPBOARD_SHOW_COUNTDOWN
                : GboardClipboardSettings.readClipboardShowCountdown(context);
    }

    boolean shouldShowCreationTime() {
        Context context = applicationContext();
        return context == null
                ? GboardClipboardSettings.DEFAULT_CLIPBOARD_SHOW_CREATION_TIME
                : GboardClipboardSettings.readClipboardShowCreationTime(context);
    }

    int configuredRetentionTtlMinutes() {
        Context context = applicationContext();
        if (context == null) {
            return DEFAULT_TTL_MINUTES;
        }
        long ttlMs = GboardClipboardSettings.readClipboardTtlMs(context);
        if (ttlMs == INFINITE_TTL_MS) {
            return INFINITE_TTL_MINUTES;
        }
        return sanitizeRetentionTtlMinutes((int) (ttlMs / MINUTE_MS));
    }

    int configuredMaxCount() {
        Context context = applicationContext();
        return context == null
                ? DEFAULT_MAX_COUNT
                : sanitizeMaxCount(GboardClipboardSettings.readClipboardMaxCount(context));
    }

    int configuredPreviewLines() {
        Context context = applicationContext();
        return context == null
                ? DEFAULT_PREVIEW_LINES
                : sanitizeContentMaxLines(
                        GboardClipboardSettings.readClipboardContentMaxLines(context));
    }

    int configuredColumnCount() {
        Context context = applicationContext();
        return context == null
                ? GboardClipboardSettings.DEFAULT_CLIPBOARD_COLUMN_COUNT
                : sanitizeClipboardColumnCount(
                        GboardClipboardSettings.readClipboardColumnCount(context));
    }

    void registerApplicationContext(Context context) {
        if (context == null) {
            return;
        }
        Context resolvedContext = context.getApplicationContext();
        if (resolvedContext != null) {
            applicationContext = resolvedContext;
        }
    }

    RuntimeSettings runtimeSettings() {
        Context context = applicationContext();
        if (context == null) {
            return RuntimeSettings.stockDefaults(true);
        }

        GboardClipboardSettings.ensureDefaults(context);
        boolean enabled = GboardClipboardSettings.readClipboardEnabled(context);
        if (!enabled) {
            return RuntimeSettings.stockDefaults(false);
        }

        return new RuntimeSettings(
                true,
                GboardClipboardSettings.readClipboardShowCountdown(context),
                GboardClipboardSettings.readClipboardShowCreationTime(context),
                GboardClipboardSettings.readClipboardShowOrderIndex(context),
                sanitizeOrderIndexMode(
                        GboardClipboardSettings.readClipboardOrderIndexMode(context)),
                GboardClipboardSettings.readClipboardTtlMs(context),
                sanitizeMaxCount(GboardClipboardSettings.readClipboardMaxCount(context)),
                sanitizeContentMaxLines(
                        GboardClipboardSettings.readClipboardContentMaxLines(context)));
    }

    void registerContextFromReceiver(Object receiver) throws Throwable {
        if (receiver == null) {
            return;
        }
        ReflectionHandles handles = reflectionHandles(receiver.getClass().getClassLoader());
        Context context = adapterContext(handles, receiver);
        if (context == null) {
            context = loaderContext(handles, receiver);
        }
        if (context == null) {
            context = pruneContext(handles, receiver);
        }
        registerApplicationContext(context);
    }

    Context runtimeContext(Object receiver) throws Throwable {
        if (receiver == null) {
            return null;
        }
        Field field = clipboardKeyboardContextField;
        if (field == null || !field.getDeclaringClass().isInstance(receiver)) {
            field = findDeclaredFieldInHierarchy(receiver.getClass(), "y");
            if (field == null) {
                return null;
            }
            clipboardKeyboardContextField = field;
        }
        Object value = field.get(receiver);
        return value instanceof Context ? (Context) value : null;
    }

    ReflectionHandles reflectionHandles(ClassLoader classLoader) throws Throwable {
        synchronized (handlesByLoader) {
            ReflectionHandles cached = handlesByLoader.get(classLoader);
            if (cached != null) {
                return cached;
            }
            ReflectionHandles created = new ReflectionHandles(classLoader);
            handlesByLoader.put(classLoader, created);
            return created;
        }
    }

    Context loaderContext(ReflectionHandles handles, Object receiver) throws Throwable {
        if (receiver == null
                || !handles.loaderCallableOwnerField.getDeclaringClass().isInstance(receiver)) {
            return null;
        }
        Object loader = handles.loaderCallableOwnerField.get(receiver);
        if (loader == null) {
            return null;
        }
        if (!handles.loaderContextField.getDeclaringClass().isInstance(loader)) {
            return null;
        }
        return (Context) handles.loaderContextField.get(loader);
    }

    Context pruneContext(ReflectionHandles handles, Object receiver) throws Throwable {
        if (receiver == null
                || !handles.pruneCallableOwnerField.getDeclaringClass().isInstance(receiver)) {
            return null;
        }
        Object dataHandler = handles.pruneCallableOwnerField.get(receiver);
        if (dataHandler == null) {
            return null;
        }
        if (!handles.dataHandlerContextField.getDeclaringClass().isInstance(dataHandler)) {
            return null;
        }
        return (Context) handles.dataHandlerContextField.get(dataHandler);
    }

    Context adapterContext(ReflectionHandles handles, Object receiver) throws Throwable {
        if (receiver == null
                || !handles.adapterContextField.getDeclaringClass().isInstance(receiver)) {
            return null;
        }
        Object value = handles.adapterContextField.get(receiver);
        return value instanceof Context ? (Context) value : null;
    }

    Context applicationContext() {
        Context context = applicationContext;
        if (context != null) {
            return context;
        }

        context = reflectedApplicationContext("android.app.ActivityThread", "currentApplication");
        if (context != null) {
            applicationContext = context;
            return context;
        }

        context = reflectedApplicationContext("android.app.AppGlobals", "getInitialApplication");
        if (context != null) {
            applicationContext = context;
        }
        return context;
    }

    long readLastVisibleTimestamp(ReflectionHandles handles, Context context) throws Throwable {
        Object prefs = handles.preferencesAccessorMethod.invoke(null, context);
        Object value = handles.preferenceReadLongMethod.invoke(
                prefs,
                LAST_VISIBLE_TIMESTAMP_PREF_RES_ID,
                0L);
        return value instanceof Long ? ((Long) value).longValue() : 0L;
    }

    void writeLastVisibleTimestamp(ReflectionHandles handles, Context context, long value)
            throws Throwable {
        Object prefs = handles.preferencesAccessorMethod.invoke(null, context);
        handles.preferenceWriteLongMethod.invoke(prefs, LAST_VISIBLE_TIMESTAMP_PREF_RES_ID, value);
    }

    long readPrimaryTimestamp(ReflectionHandles handles, Context context) throws Throwable {
        Object value = handles.primaryTimestampReadMethod.invoke(null, context);
        return value instanceof Long ? ((Long) value).longValue() : 0L;
    }

    Uri createClipboardUri(ReflectionHandles handles, Context context) throws Throwable {
        Object value = handles.createClipboardUriMethod.invoke(null, context, 2, -1L);
        return value instanceof Uri ? (Uri) value : null;
    }

    Cursor queryItemTypeCursor(ReflectionHandles handles, Object dataHandler, Uri clipboardUri,
            int itemType) throws Throwable {
        Object value = handles.dataHandlerQueryByItemTypeMethod.invoke(
                dataHandler, clipboardUri, itemType);
        return value instanceof Cursor ? (Cursor) value : null;
    }

    int queryItemTypeCount(ReflectionHandles handles, Object dataHandler, Uri clipboardUri,
            int itemType) throws Throwable {
        Cursor cursor = null;
        try {
            cursor = queryItemTypeCursor(handles, dataHandler, clipboardUri, itemType);
            return safeCursorCount(cursor);
        } finally {
            closeQuietly(cursor);
        }
    }

    int queryCursorCount(Context context, Uri clipboardUri, String selection,
            String[] selectionArgs) {
        Cursor cursor = null;
        try {
            cursor = queryCursor(context, clipboardUri, CURSOR_COUNT_PROJECTION,
                    selection, selectionArgs, SORT_TIMESTAMP_DESC);
            return safeCursorCount(cursor);
        } finally {
            closeQuietly(cursor);
        }
    }

    Cursor queryCursor(Context context, Uri uri, String[] projection, String selection,
            String[] selectionArgs, String sortOrder) {
        if (context == null || uri == null) {
            return null;
        }
        ContentResolver resolver = context.getContentResolver();
        return resolver.query(uri, projection, selection, selectionArgs, sortOrder);
    }

    int safeCursorCount(Cursor cursor) {
        if (cursor == null || cursor.isClosed()) {
            return 0;
        }
        return cursor.getCount();
    }

    void closeQuietly(Cursor cursor) {
        if (cursor == null) {
            return;
        }
        try {
            cursor.close();
        } catch (RuntimeException ignored) {
            // Best effort.
        }
    }

    long clipId(ReflectionHandles handles, Object clip) throws Throwable {
        return handles.clipIdField.getLong(clip);
    }

    long clipTimestamp(ReflectionHandles handles, Object clip) throws Throwable {
        return handles.clipTimestampField.getLong(clip);
    }

    int clipItemType(ReflectionHandles handles, Object clip) throws Throwable {
        Object model = handles.clipModelField.get(clip);
        return handles.clipModelItemTypeField.getInt(model);
    }

    boolean isPinned(ReflectionHandles handles, Object clip) throws Throwable {
        Object value = handles.clipIsPinnedMethod.invoke(clip);
        return value instanceof Boolean && ((Boolean) value).booleanValue();
    }

    boolean isSpecial(ReflectionHandles handles, Object clip) throws Throwable {
        Object value = handles.clipIsSpecialMethod.invoke(clip);
        return value instanceof Boolean && ((Boolean) value).booleanValue();
    }

    int sanitizeRetentionTtlMinutes(int ttlMinutes) {
        if (ttlMinutes == INFINITE_TTL_MINUTES) {
            return ttlMinutes;
        }
        return ttlMinutes > 0 ? ttlMinutes : DEFAULT_TTL_MINUTES;
    }

    int sanitizeMaxCount(int maxCount) {
        if (maxCount == INFINITE_MAX_COUNT) {
            return maxCount;
        }
        return maxCount > 0 ? maxCount : DEFAULT_MAX_COUNT;
    }

    int sanitizeContentMaxLines(int value) {
        return value > 0 ? value : DEFAULT_PREVIEW_LINES;
    }

    int sanitizeClipboardColumnCount(int value) {
        if (value == GboardClipboardSettings.CLIPBOARD_COLUMN_COUNT_ONE
                || value == GboardClipboardSettings.CLIPBOARD_COLUMN_COUNT_TWO
                || value == GboardClipboardSettings.CLIPBOARD_COLUMN_COUNT_THREE) {
            return value;
        }
        return GboardClipboardSettings.DEFAULT_CLIPBOARD_COLUMN_COUNT;
    }

    String sanitizeOrderIndexMode(String value) {
        return GboardClipboardSettings.CLIPBOARD_ORDER_INDEX_MODE_OLDEST_FIRST.equals(
                value)
                ? GboardClipboardSettings.CLIPBOARD_ORDER_INDEX_MODE_OLDEST_FIRST
                : GboardClipboardSettings.CLIPBOARD_ORDER_INDEX_MODE_NEWEST_FIRST;
    }

    void logInfo(String message) {
        Log.i(TAG, message);
    }

    void logWarn(String message, Throwable throwable) {
        Log.w(TAG, message, throwable);
    }

    void logLimited(AtomicInteger counter, int limit, String message) {
        int count = counter.incrementAndGet();
        if (count <= limit) {
            logInfo(message + " [count=" + count + "]");
        }
    }

    private Context reflectedApplicationContext(String className, String methodName) {
        try {
            Class<?> owner = Class.forName(className);
            Method method = owner.getDeclaredMethod(methodName);
            Object application = method.invoke(null);
            return application instanceof Context ? (Context) application : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private Field findDeclaredFieldInHierarchy(Class<?> type, String fieldName) {
        Class<?> current = type;
        while (current != null) {
            try {
                Field field = current.getDeclaredField(fieldName);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        return null;
    }

    static final class ClipSections {
        final List<Object> recent;
        final List<Object> pinned;
        final List<Object> special;

        ClipSections(List<Object> recent, List<Object> pinned, List<Object> special) {
            this.recent = recent;
            this.pinned = pinned;
            this.special = special;
        }
    }

    static final class LoaderAssembly {
        final List<Object> result;
        final List<Object> visibleRecent;
        final int visibleRecentCount;
        final int visiblePinnedCount;
        final int visibleSpecialCount;
        final boolean primaryInserted;

        LoaderAssembly(List<Object> result, List<Object> visibleRecent, int visiblePinnedCount,
                int visibleSpecialCount, boolean primaryInserted) {
            this.result = result;
            this.visibleRecent = visibleRecent;
            this.visibleRecentCount = visibleRecent.size();
            this.visiblePinnedCount = visiblePinnedCount;
            this.visibleSpecialCount = visibleSpecialCount;
            this.primaryInserted = primaryInserted;
        }
    }

    static final class RuntimeSettings {
        final boolean enabled;
        final boolean showExpiryCountdown;
        final boolean showCreationTime;
        final boolean showOrderIndex;
        final String clipboardOrderIndexMode;
        final long clipboardTtlMs;
        final int clipboardMaxCount;
        final int clipboardContentMaxLines;
        final int clipboardGroupLimit;

        RuntimeSettings(boolean enabled, boolean showExpiryCountdown, boolean showCreationTime,
                boolean showOrderIndex, String clipboardOrderIndexMode, long clipboardTtlMs,
                int clipboardMaxCount, int clipboardContentMaxLines) {
            this.enabled = enabled;
            this.showExpiryCountdown = showExpiryCountdown;
            this.showCreationTime = showCreationTime;
            this.showOrderIndex = showOrderIndex;
            this.clipboardOrderIndexMode = clipboardOrderIndexMode;
            this.clipboardTtlMs = clipboardTtlMs;
            this.clipboardMaxCount = clipboardMaxCount;
            this.clipboardContentMaxLines = clipboardContentMaxLines;
            this.clipboardGroupLimit = clipboardMaxCount < 0
                    ? Integer.MAX_VALUE
                    : Math.max(1, clipboardMaxCount);
        }

        static RuntimeSettings stockDefaults(boolean enabled) {
            return new RuntimeSettings(
                    enabled,
                    false,
                    false,
                    false,
                    GboardClipboardSettings.DEFAULT_CLIPBOARD_ORDER_INDEX_MODE,
                    STOCK_CLIPBOARD_TTL_MS,
                    STOCK_CLIPBOARD_MAX_COUNT,
                    STOCK_CLIPBOARD_CONTENT_MAX_LINES);
        }
    }

    static final class CountdownBinding implements Runnable {
        final GboardClipboardUiHookAdapter module;
        final ReflectionHandles handles;
        final TextView textView;
        final String originalText;
        final long clipId;
        final long clipTimestamp;
        final boolean pinned;
        final boolean special;
        final long clipboardTtlMs;
        int clipOrder;

        CountdownBinding(GboardClipboardUiHookAdapter module, ReflectionHandles handles,
                TextView textView, String originalText, long clipId, long clipTimestamp,
                boolean pinned, boolean special, long clipboardTtlMs, int clipOrder) {
            this.module = module;
            this.handles = handles;
            this.textView = textView;
            this.originalText = originalText == null ? "" : originalText;
            this.clipId = clipId;
            this.clipTimestamp = clipTimestamp;
            this.pinned = pinned;
            this.special = special;
            this.clipboardTtlMs = clipboardTtlMs;
            this.clipOrder = clipOrder;
        }

        @Override
        public void run() {
            module.onCountdownTick(this);
        }
    }

    static final class OrderIndexRefreshState {
        boolean scheduled;
        boolean rerunRequested;
    }

    static final class ReflectionHandles {
        final Field loaderCallableOwnerField;
        final Field loaderContextField;
        final Field pruneCallableOwnerField;
        final Field dataHandlerContextField;
        final Field dataHandlerDisabledField;
        final Field dataHandlerCountField;
        final Field adapterContextField;
        final Field adapterItemsField;
        final Field adapterRecentCountField;
        final Field adapterPinnedVisibleCountField;
        final Field clipItemViewHolderTextField;
        final Field clipIdField;
        final Field clipTimestampField;
        final Field clipModelField;
        final Field clipModelItemTypeField;
        final Method clipIsPinnedMethod;
        final Method clipIsSpecialMethod;
        final Method queryClipsMethod;
        final Method createClipboardUriMethod;
        final Method deleteClipsMethod;
        final Method primaryTimestampReadMethod;
        final Method dataHandlerQueryByItemTypeMethod;
        final Method dataHandlerCleanupCursorMethod;
        final Method preferencesAccessorMethod;
        final Method preferenceReadLongMethod;
        final Method preferenceWriteLongMethod;
        final Method adapterNotifyItemRemovedMethod;
        final Method adapterRefreshMethod;
        final Class<?> clipItemViewHolderClass;
        final Object recentHeader;
        final Object pinnedHeader;
        final Object specialHeader;

        ReflectionHandles(ClassLoader classLoader) throws Throwable {
            Class<?> loaderCallableClass = resolveClass(classLoader,
                    CLIPBOARD_LOADER_CALLABLE_CLASS);
            Class<?> loaderClass = resolveClass(classLoader, "elo");
            Class<?> pruneCallableClass = resolveClass(classLoader,
                    CLIPBOARD_PRUNE_CALLABLE_CLASS);
            Class<?> dataHandlerClass = resolveClass(classLoader, "emy");
            Class<?> adapterClass = resolveClass(classLoader, CLIPBOARD_ADAPTER_CLASS);
            Class<?> clipItemViewHolderClass = resolveClass(classLoader,
                    CLIPBOARD_VIEW_HOLDER_CLASS);
            Class<?> clipClass = resolveClass(classLoader, "elk");
            Class<?> clipModelClass = resolveClass(classLoader, "elm");
            Class<?> queryUtilsClass = resolveClass(classLoader, "emo");
            Class<?> preferencesClass = resolveClass(classLoader, "oql");
            Class<?> preferenceBaseClass = resolveClass(classLoader, "bze");

            loaderCallableOwnerField = declaredField(loaderCallableClass, "a");
            loaderContextField = declaredField(loaderClass, "b");
            pruneCallableOwnerField = declaredField(pruneCallableClass, "a");
            dataHandlerContextField = declaredField(dataHandlerClass, "c");
            dataHandlerDisabledField = declaredField(dataHandlerClass, "g");
            dataHandlerCountField = declaredField(dataHandlerClass, "h");
            adapterContextField = declaredField(adapterClass, "d");
            adapterItemsField = declaredField(adapterClass, "m");
            adapterRecentCountField = declaredField(adapterClass, "n");
            adapterPinnedVisibleCountField = declaredField(adapterClass, "x");
            clipItemViewHolderTextField = declaredField(clipItemViewHolderClass, "t");
            clipIdField = declaredField(clipClass, "d");
            clipTimestampField = declaredField(clipClass, "e");
            clipModelField = declaredField(clipClass, "g");
            clipModelItemTypeField = declaredField(clipModelClass, "c");
            clipIsPinnedMethod = declaredMethod(clipClass, "m");
            clipIsSpecialMethod = declaredMethod(clipClass, "n");
            queryClipsMethod = declaredMethod(queryUtilsClass, "i",
                    Context.class, String.class, String[].class, String.class);
            createClipboardUriMethod = declaredMethod(queryUtilsClass, "c",
                    Context.class, int.class, long.class);
            deleteClipsMethod = declaredMethod(queryUtilsClass, "g",
                    Context.class, List.class);
            primaryTimestampReadMethod = declaredMethod(dataHandlerClass, "a",
                    Context.class);
            dataHandlerQueryByItemTypeMethod = declaredMethod(dataHandlerClass, "b",
                    Uri.class, int.class);
            dataHandlerCleanupCursorMethod = declaredMethod(dataHandlerClass, "k",
                    Cursor.class);
            preferencesAccessorMethod = declaredMethod(preferencesClass, "O", Context.class);
            preferenceReadLongMethod = declaredMethod(preferenceBaseClass, "m",
                    int.class, long.class);
            preferenceWriteLongMethod = declaredMethod(preferenceBaseClass, "r",
                    int.class, long.class);
            adapterNotifyItemRemovedMethod = declaredMethod(adapterClass.getSuperclass(),
                    "n", int.class);
            adapterRefreshMethod = declaredMethod(adapterClass, "R");
            this.clipItemViewHolderClass = clipItemViewHolderClass;
            recentHeader = declaredField(clipClass, "a").get(null);
            pinnedHeader = declaredField(clipClass, "b").get(null);
            specialHeader = declaredField(clipClass, "c").get(null);
        }

        private static Field declaredField(Class<?> owner, String name)
                throws NoSuchFieldException {
            Field field = owner.getDeclaredField(name);
            field.setAccessible(true);
            return field;
        }

        private static Method declaredMethod(Class<?> owner, String name,
                Class<?>... parameterTypes) throws NoSuchMethodException {
            Method method = owner.getDeclaredMethod(name, parameterTypes);
            method.setAccessible(true);
            return method;
        }
    }

    private static Class<?> resolveClass(ClassLoader classLoader, String className)
            throws ClassNotFoundException {
        return Class.forName(className, false, classLoader);
    }
}
