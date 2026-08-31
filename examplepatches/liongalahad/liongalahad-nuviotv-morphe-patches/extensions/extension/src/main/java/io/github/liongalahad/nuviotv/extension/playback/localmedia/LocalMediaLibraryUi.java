package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.os.Handler;
import android.os.Build;
import android.os.Looper;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/** Native Compose bridge for the Storage branch inside Nuvio's existing Library grid. */
public final class LocalMediaLibraryUi {
    private static final String TAG = "MorpheLocalMediaUi";
    private static final ExecutorService SCANNER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "MorpheLocalMediaScan");
        thread.setDaemon(true);
        return thread;
    });
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean SCAN_RUNNING = new AtomicBoolean();
    private static final AtomicLong SCAN_GENERATION = new AtomicLong();
    private static final AtomicLong FILE_ACTION_GENERATION = new AtomicLong();
    private static volatile PendingFileAction pendingFileAction;
    private static final ThreadLocal<Boolean> STORAGE_SEARCH = new ThreadLocal<>();
    private static final ThreadLocal<StorageKeyTarget> PREPARED_KEY_TARGET = new ThreadLocal<>();
    private static final Map<Object, StorageKeyTarget> NATIVE_KEY_TARGETS =
            Collections.synchronizedMap(new IdentityHashMap<>());
    private static volatile boolean storageModeActive;
    private static volatile boolean libraryDestinationActive;
    private static volatile LocalMediaRuntime.LibrarySnapshot latestSnapshot;
    private static volatile StorageKeyTarget pressedKeyTarget;

    private static volatile Object snapshotState;
    private static volatile Object queryState;
    private static volatile Object selectedEntryState;
    private static volatile WeakReference<Object> selectKeyOwner = new WeakReference<>(null);
    private static volatile String actionRestoreEntryKey = "";
    private static volatile Method lazyItemMethod;
    private static volatile Constructor<?> composableLambdaConstructor;
    private static volatile Method cloudSearchMethod;
    private static volatile Method cloudCardMethod;
    private static volatile Method cloudFileDialogMethod;
    private static volatile Method emptyStateMethod;
    private static volatile Object emptyStateIcon;
    private static volatile Method nativeButtonMethod;
    private static volatile Method nativeButtonColorsMethod;
    private static volatile Method nativeTextMethod;
    private static volatile Method previewKeyModifierMethod;
    private static volatile String nativeButtonOwnerName;
    private static volatile String nativeTextOwnerName;
    private static volatile String cloudSearchOwnerName;
    private static volatile String cloudSearchMethodName;
    private static volatile String cloudCardOwnerName;
    private static volatile String cloudCardMethodName;
    private static volatile String cloudDialogOwnerName;
    private static volatile String cloudDialogMethodName;
    private static volatile String emptyStateOwnerName;
    private static volatile String emptyStateMethodName;
    private static volatile String emptyStateIconOwnerName;
    private static volatile String emptyStateIconMethodName;
    private static volatile String cloudItemOwnerName;
    private static volatile String cloudFileOwnerName;

    private static final Function2<Object, Object, Unit> REFRESH_CONTENT = (composer, flags) -> {
        renderRefreshButton(composer);
        return Unit.INSTANCE;
    };

    private LocalMediaLibraryUi() {}

    /** Receives version-specific optimized Compose owners discovered from the target APK. */
    public static void configureNativeUi(
            String buttonOwnerName,
            String textOwnerName,
            String searchOwnerName,
            String searchMethodName,
            String cardOwnerName,
            String cardMethodName,
            String dialogOwnerName,
            String dialogMethodName,
            String statusOwnerName,
            String statusMethodName,
            String statusIconOwnerName,
            String statusIconMethodName,
            String itemOwnerName,
            String fileOwnerName
    ) {
        nativeButtonOwnerName = buttonOwnerName;
        nativeTextOwnerName = textOwnerName;
        cloudSearchOwnerName = searchOwnerName;
        cloudSearchMethodName = searchMethodName;
        cloudCardOwnerName = cardOwnerName;
        cloudCardMethodName = cardMethodName;
        cloudDialogOwnerName = dialogOwnerName;
        cloudDialogMethodName = dialogMethodName;
        emptyStateOwnerName = statusOwnerName;
        emptyStateMethodName = statusMethodName;
        emptyStateIconOwnerName = statusIconOwnerName;
        emptyStateIconMethodName = statusIconMethodName;
        cloudItemOwnerName = itemOwnerName;
        cloudFileOwnerName = fileOwnerName;
    }

    /** Replaces the optional Cloud refresh slot only while the injected mode is active. */
    public static Function2 storageRefreshContent(Object mode, Function2 nativeContent) {
        return LocalMediaRuntime.isStorageMode(mode) ? REFRESH_CONTENT : nativeContent;
    }

    /**
     * Adds Storage content after Nuvio has added the shared Library title and mode selector.
     * Returning true tells the injected branch to skip the native Saved/Cloud body.
     */
    public static boolean populateStorageGridIfActive(Object libraryContentLambda, Object lazyGridScope) {
        boolean storage = capturesStorageMode(libraryContentLambda);
        boolean enteringStorage = storage && !storageModeActive;
        storageModeActive = storage;
        if (!storage) return false;
        try {
            ensureState(lazyGridScope.getClass().getClassLoader());
            if (enteringStorage) {
                LocalMediaRuntime.requestStorageAccessOnFirstUse();
                invalidate();
            }
            String query = stringStateValue(queryState);
            LocalMediaRuntime.LibrarySnapshot snapshot =
                    (LocalMediaRuntime.LibrarySnapshot) stateValue(snapshotState);
            latestSnapshot = snapshot;
            addItem(lazyGridScope, "morphe_storage_search", (scope, composer, flags) -> {
                renderSearch(query, composer);
                return Unit.INSTANCE;
            });

            if (snapshot == null) {
                scheduleScan();
                addMessage(lazyGridScope, "morphe_storage_scanning",
                        "Scanning local storage", LocalMediaRuntime.folderDisplayLabel());
                return true;
            }
            if (!snapshot.hasFolderAccess) {
                addMessage(lazyGridScope, "morphe_storage_access",
                        "Storage access required",
                        "Grant access to use " + LocalMediaRuntime.DEFAULT_FOLDER_LABEL +
                                ", or choose a Local Storage Path in Morphe settings.");
                addItem(lazyGridScope, "morphe_storage_access_retry",
                        (scope, composer, flags) -> {
                            renderActionButton("Grant storage access", () -> {
                                LocalMediaRuntime.requestStorageAccessOnFirstUse();
                                return Unit.INSTANCE;
                            }, composer);
                            return Unit.INSTANCE;
                        });
                return true;
            }
            if (snapshot.error != null && !snapshot.error.isEmpty()) {
                addMessage(lazyGridScope, "morphe_storage_error",
                        "Local storage is unavailable", snapshot.error);
                return true;
            }

            List<LocalMediaRuntime.LocalMediaEntry> visible = filter(snapshot.entries, query);
            if (visible.isEmpty()) {
                String title = query.isEmpty() ? "No playable files" : "No matching files";
                String subtitle = query.isEmpty()
                        ? "Add videos to " + snapshot.folderLabel + " and refresh the library."
                        : "Try a different storage search.";
                addMessage(lazyGridScope, "morphe_storage_empty", title, subtitle);
                return true;
            }

            for (LocalMediaRuntime.LocalMediaEntry entry : visible) {
                EntryPresentation presentation = new EntryPresentation(entry, nativeCloudItem(entry));
                addItem(lazyGridScope, "morphe_storage_" + Integer.toHexString(entry.key.hashCode()),
                        (scope, composer, flags) -> {
                            renderEntry(presentation, composer);
                            return Unit.INSTANCE;
                        });
            }
            return true;
        } catch (Throwable error) {
            Log.e(TAG, "Unable to populate the native Storage library", error);
            addMessageSafely(lazyGridScope, "morphe_storage_failure",
                    "Local storage could not be shown", "Refresh the library or choose the folder again.");
            return true;
        }
    }

    /** Substitutes only the native Cloud placeholder text during the reflected Storage search. */
    public static String storageSearchLabel(String nativeLabel) {
        return Boolean.TRUE.equals(STORAGE_SEARCH.get())
                ? "Search storage library"
                : nativeLabel;
    }

    /** Uses the injected mode name in the native Library source badge. */
    public static String storageSourceLabel(String nativeLabel) {
        return storageModeActive ? "STORAGE" : nativeLabel;
    }

    public static void invalidate() {
        SCAN_GENERATION.incrementAndGet();
        FILE_ACTION_GENERATION.incrementAndGet();
        pendingFileAction = null;
        PREPARED_KEY_TARGET.remove();
        NATIVE_KEY_TARGETS.clear();
        pressedKeyTarget = null;
        Object state = snapshotState;
        if (state != null) setStateValue(state, null);
        Object selected = selectedEntryState;
        if (selected != null) setStateValue(selected, null);
        latestSnapshot = null;
    }

    /** Marks Library route transitions so returning to Storage always performs a fresh scan. */
    static void observeNavigationDestination(String description) {
        String value = description == null ? "" : description.toLowerCase(Locale.ROOT);
        boolean library = value.contains("library");
        if (library) {
            libraryDestinationActive = true;
        } else if (libraryDestinationActive) {
            libraryDestinationActive = false;
            storageModeActive = false;
        }
    }

    /**
     * Marks the exact Storage card or file row about to enter Nuvio's native TV Button.
     * The bytecode hook calls this immediately before the Button call, so the marker cannot
     * leak from a skipped composable into another control.
     */
    public static void prepareStorageKeyTarget(Object nativeModel) {
        StorageKeyTarget target = NATIVE_KEY_TARGETS.get(nativeModel);
        if (target == null) PREPARED_KEY_TARGET.remove();
        else PREPARED_KEY_TARGET.set(target);
    }

    /** Adds a row-owned preview-key handler to only the prepared Storage TV Button. */
    public static Object attachPreparedStorageKeyHandler(Object modifier) {
        StorageKeyTarget target = PREPARED_KEY_TARGET.get();
        PREPARED_KEY_TARGET.remove();
        if (target == null || modifier == null) return modifier;
        try {
            Method method = previewKeyModifierMethod;
            if (method == null) {
                ClassLoader loader = modifier.getClass().getClassLoader();
                Class<?> modifierClass = Class.forName("u1.q", false, loader);
                method = Class.forName("m2.d", false, loader).getDeclaredMethod(
                        "e", modifierClass, Function1.class);
                method.setAccessible(true);
                previewKeyModifierMethod = method;
            }
            return method.invoke(null, modifier, target.keyHandler);
        } catch (Throwable error) {
            PREPARED_KEY_TARGET.remove();
            Log.e(TAG, "Unable to attach the Storage row key handler", error);
            return modifier;
        }
    }

    private static boolean observeStorageRowKey(
            StorageKeyTarget target, Object wrappedEvent
    ) {
        KeyEvent event = unwrapKeyEvent(wrappedEvent);
        if (event == null || !isSelectKey(event.getKeyCode())) return false;
        if (event.getAction() == KeyEvent.ACTION_DOWN) {
            pressedKeyTarget = target;
            Log.d(TAG, "Storage row key down target=" + target.displayName());
            // MainActivity normally starts this timer before Compose dispatch. Calling it here as
            // well makes the row self-contained on TV builds with a different window boundary;
            // duplicate DOWN delivery does not restart the timer.
            LocalMediaRuntime.observeKeyEvent(event);
        } else if (event.getAction() == KeyEvent.ACTION_UP && pressedKeyTarget == target) {
            pressedKeyTarget = null;
        }
        // Nuvio's native Button still owns short-click behavior and focus visuals.
        return false;
    }

    private static KeyEvent unwrapKeyEvent(Object wrappedEvent) {
        if (wrappedEvent instanceof KeyEvent) return (KeyEvent) wrappedEvent;
        if (wrappedEvent == null) return null;
        for (Class<?> type = wrappedEvent.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (!KeyEvent.class.isAssignableFrom(field.getType())) continue;
                try {
                    field.setAccessible(true);
                    return (KeyEvent) field.get(wrappedEvent);
                } catch (Throwable ignored) {
                    return null;
                }
            }
        }
        return null;
    }

    private static boolean isSelectKey(int key) {
        return key == KeyEvent.KEYCODE_DPAD_CENTER || key == KeyEvent.KEYCODE_ENTER ||
                key == KeyEvent.KEYCODE_NUMPAD_ENTER || key == KeyEvent.KEYCODE_BUTTON_A;
    }

    static void pressStorageEntryForTesting(LocalMediaRuntime.LocalMediaEntry entry) {
        storageModeActive = entry != null;
        pressedKeyTarget = entry == null ? null : StorageKeyTarget.entry(entry);
    }

    /** Resolves the row-owned target at the platform long-press timeout. */
    static boolean onSelectLongPressTimeout() {
        if (!storageModeActive) return false;
        StorageKeyTarget direct = pressedKeyTarget;
        if (direct != null) {
            pressedKeyTarget = null;
            Log.d(TAG, "Storage direct long-press timeout target=" + direct.displayName());
            if (direct.file != null) {
                openFileDeleteAction(direct.entryKey, direct.file);
            } else if (direct.entry != null && direct.entry.folder) {
                LocalMediaRuntime.requestDeleteFolder(direct.entry);
            } else if (direct.entry != null && !direct.entry.files.isEmpty()) {
                LocalMediaRuntime.requestDeleteFile(direct.entry.files.get(0));
            } else {
                return false;
            }
            return true;
        }
        PendingFileAction pending = pendingFileAction;
        if (pending != null && pending.generation == FILE_ACTION_GENERATION.get()) {
            pendingFileAction = null;
            FILE_ACTION_GENERATION.incrementAndGet();
            openFileDeleteAction(pending.entryKey, pending.file);
            return true;
        }
        String focused = focusedAccessibilityText();
        if (focused.isEmpty()) return false;
        LocalMediaRuntime.LibrarySnapshot snapshot = latestSnapshot;
        if (snapshot == null) {
            Object state = snapshotState;
            if (state != null) snapshot = (LocalMediaRuntime.LibrarySnapshot) stateValue(state);
        }
        if (snapshot == null) return false;

        String selectedKey = selectedEntryState == null ? "" : stringStateValue(selectedEntryState);
        if (!selectedKey.isEmpty()) {
            for (LocalMediaRuntime.LocalMediaEntry entry : snapshot.entries) {
                if (!selectedKey.equals(entry.key)) continue;
                LocalMediaRuntime.LocalMediaFile file = bestFileMatch(entry.files, focused);
                if (file != null) {
                    openFileDeleteAction(entry.key, file);
                    return true;
                }
            }
            // A folder's file-picker dialog is open. Never reinterpret its focused row as the
            // underlying folder card if this Compose version withholds descendant semantics.
            return false;
        }
        LocalMediaRuntime.LocalMediaEntry entry = bestEntryMatch(snapshot.entries, focused);
        if (entry == null) return false;
        if (entry.folder) LocalMediaRuntime.requestDeleteFolder(entry);
        else LocalMediaRuntime.requestDeleteFile(entry.files.get(0));
        return true;
    }

    static void observeSelectKeyOwner(Object owner) {
        if (owner == null) return;
        Object current = selectKeyOwner.get();
        // The same key can pass through both MainActivity and its Compose Dialog. A visible
        // dialog is the more specific owner, but a dismissed dialog must not leak into the next
        // key cycle and hide the focused Storage card from the timeout resolver.
        if (owner instanceof Dialog || !(current instanceof Dialog) ||
                !isShowing((Dialog) current)) {
            selectKeyOwner = new WeakReference<>(owner);
        }
    }

    private static boolean isShowing(Dialog dialog) {
        try {
            return dialog != null && dialog.isShowing();
        } catch (RuntimeException ignored) {
            return false;
        }
    }

    static void clearSelectKeyOwner() {
        selectKeyOwner = new WeakReference<>(null);
        pressedKeyTarget = null;
    }

    private static void openFileDeleteAction(
            String selectedKey, LocalMediaRuntime.LocalMediaFile file
    ) {
        actionRestoreEntryKey = selectedKey == null ? "" : selectedKey;
        Object selected = selectedEntryState;
        if (selected != null) setStateValue(selected, null);
        // Let Compose remove its modal window first; otherwise that window remains above the
        // native action activity even though the activity has already become top-resumed.
        MAIN.post(() -> LocalMediaRuntime.requestDeleteFile(file));
    }

    static void restoreFileDialogAfterAction() {
        String key = actionRestoreEntryKey;
        actionRestoreEntryKey = "";
        Object selected = selectedEntryState;
        if (!key.isEmpty() && storageModeActive && selected != null) setStateValue(selected, key);
    }

    static void clearFileDialogAfterAction() {
        actionRestoreEntryKey = "";
    }

    private static LocalMediaRuntime.LocalMediaEntry bestEntryMatch(
            List<LocalMediaRuntime.LocalMediaEntry> entries, String focused
    ) {
        LocalMediaRuntime.LocalMediaEntry result = null;
        int length = -1;
        String haystack = focused.toLowerCase(Locale.ROOT);
        for (LocalMediaRuntime.LocalMediaEntry entry : entries) {
            String name = entry.name.toLowerCase(Locale.ROOT);
            if (name.length() > length && haystack.contains(name)) {
                result = entry;
                length = name.length();
            }
        }
        return result;
    }

    private static LocalMediaRuntime.LocalMediaFile bestFileMatch(
            List<LocalMediaRuntime.LocalMediaFile> files, String focused
    ) {
        LocalMediaRuntime.LocalMediaFile result = null;
        int length = -1;
        String haystack = focused.toLowerCase(Locale.ROOT);
        for (LocalMediaRuntime.LocalMediaFile file : files) {
            String name = file.name.toLowerCase(Locale.ROOT);
            String relative = file.relativePath.toLowerCase(Locale.ROOT);
            if ((haystack.contains(name) || haystack.contains(relative)) && name.length() > length) {
                result = file;
                length = name.length();
            }
        }
        return result;
    }

    private static String focusedAccessibilityText() {
        Window window = selectKeyWindow();
        if (window == null) return "";
        FocusedAccessibility focused = null;
        try {
            focused = findFocusedAccessibilityNode(window.getDecorView());
            return focused == null ? "" : nodeText(focused.node, 0);
        } catch (Throwable error) {
            Log.d(TAG, "Unable to inspect focused Storage semantics", error);
            return "";
        } finally {
            if (focused != null) focused.node.recycle();
        }
    }

    private static Window selectKeyWindow() {
        Object owner = selectKeyOwner.get();
        if (owner instanceof Dialog) return ((Dialog) owner).getWindow();
        if (owner instanceof Activity) return ((Activity) owner).getWindow();
        Activity activity = MorpheSettingsUi.resumedActivity();
        return activity == null ? null : activity.getWindow();
    }

    private static FocusedAccessibility findFocusedAccessibilityNode(View view) {
        if (view == null) return null;
        AccessibilityNodeProvider provider = view.getAccessibilityNodeProvider();
        if (provider != null) {
            AccessibilityNodeInfo focused = provider.findFocus(AccessibilityNodeInfo.FOCUS_INPUT);
            if (focused != null) {
                try {
                    if (Build.VERSION.SDK_INT >= 34) {
                        Api34Accessibility.enableAppProcessQueries(focused, view);
                    }
                    return new FocusedAccessibility(focused);
                } catch (Throwable ignored) {
                    // Some Compose versions already return a sealed, queryable virtual node.
                    // Keep it: its own label is enough to resolve a Storage card or file row.
                    return new FocusedAccessibility(focused);
                }
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                FocusedAccessibility focused =
                        findFocusedAccessibilityNode(group.getChildAt(index));
                if (focused != null) return focused;
            }
        }
        return null;
    }

    @android.annotation.TargetApi(34)
    private static final class Api34Accessibility {
        private Api34Accessibility() {}

        static void enableAppProcessQueries(AccessibilityNodeInfo node, View view) {
            node.setQueryFromAppProcessEnabled(view, true);
        }
    }

    private static String nodeText(AccessibilityNodeInfo node, int depth) {
        if (node == null || depth > 12) return "";
        StringBuilder result = new StringBuilder();
        if (node.getText() != null) result.append(node.getText());
        if (node.getContentDescription() != null) {
            if (result.length() > 0) result.append(' ');
            result.append(node.getContentDescription());
        }
        try {
            for (int index = 0; index < node.getChildCount(); index++) {
                AccessibilityNodeInfo child = node.getChild(index);
                if (child == null) continue;
                String childText = nodeText(child, depth + 1);
                child.recycle();
                if (!childText.isEmpty()) {
                    if (result.length() > 0) result.append(' ');
                    result.append(childText);
                }
            }
        } catch (Throwable ignored) {
            // A sealed provider node can still expose its own label even when descendant queries
            // are unavailable from the app process.
        }
        return result.toString();
    }

    private static final class FocusedAccessibility {
        final AccessibilityNodeInfo node;

        FocusedAccessibility(AccessibilityNodeInfo node) {
            this.node = node;
        }
    }

    private static boolean capturesStorageMode(Object owner) {
        if (owner == null) return false;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object captured = field.get(owner);
                    if (captured == null) continue;
                    if (LocalMediaRuntime.isStorageMode(captured)) return true;
                    Method getter = findValueGetter(captured.getClass());
                    if (getter != null && LocalMediaRuntime.isStorageMode(getter.invoke(captured))) return true;
                } catch (Throwable ignored) {
                    // Synthetic lambdas contain unrelated captured fields; only the mode state matters.
                }
            }
        }
        return false;
    }

    private static void ensureState(ClassLoader loader) throws ReflectiveOperationException {
        if (snapshotState != null && queryState != null && selectedEntryState != null) return;
        synchronized (LocalMediaLibraryUi.class) {
            if (snapshotState != null && queryState != null && selectedEntryState != null) return;
            Class<?> stateFactory = Class.forName("e1.j", false, loader);
            Method mutableState = null;
            for (Method candidate : stateFactory.getDeclaredMethods()) {
                Class<?>[] parameters = candidate.getParameterTypes();
                if (Modifier.isStatic(candidate.getModifiers()) &&
                        candidate.getReturnType() != Void.TYPE && parameters.length == 1 &&
                        parameters[0] == Object.class) {
                    mutableState = candidate;
                    break;
                }
            }
            if (mutableState == null) {
                throw new NoSuchMethodException("Compose mutable-state factory");
            }
            mutableState.setAccessible(true);
            snapshotState = mutableState.invoke(null, new Object[]{null});
            queryState = mutableState.invoke(null, "");
            selectedEntryState = mutableState.invoke(null, new Object[]{null});
        }
    }

    private static void scheduleScan() {
        if (!SCAN_RUNNING.compareAndSet(false, true)) return;
        long generation = SCAN_GENERATION.get();
        SCANNER.execute(() -> {
            LocalMediaRuntime.LibrarySnapshot result;
            try {
                Context context = MorpheSettingsRuntime.applicationContext();
                result = context == null
                        ? new LocalMediaRuntime.LibrarySnapshot(false,
                                LocalMediaRuntime.DEFAULT_FOLDER_LABEL, Collections.emptyList(),
                                "Application storage is not ready")
                        : LocalMediaRuntime.scan(context);
            } catch (Throwable error) {
                Log.e(TAG, "Unable to scan local storage", error);
                result = new LocalMediaRuntime.LibrarySnapshot(true,
                        LocalMediaRuntime.folderDisplayLabel(), Collections.emptyList(),
                        "The selected folder could not be scanned");
            }
            LocalMediaRuntime.LibrarySnapshot scanned = result;
            MAIN.post(() -> {
                SCAN_RUNNING.set(false);
                if (generation != SCAN_GENERATION.get()) {
                    // A folder change or explicit refresh occurred while the old root was being
                    // scanned. Discard that result and immediately scan the current root.
                    scheduleScan();
                    return;
                }
                setStateValue(snapshotState, scanned);
                latestSnapshot = scanned;
            });
        });
    }

    private static void refresh() {
        invalidate();
        scheduleScan();
    }

    private static List<LocalMediaRuntime.LocalMediaEntry> filter(
            List<LocalMediaRuntime.LocalMediaEntry> entries,
            String query
    ) {
        if (query.isEmpty()) return entries;
        String needle = query.toLowerCase(Locale.ROOT);
        List<LocalMediaRuntime.LocalMediaEntry> result = new ArrayList<>();
        for (LocalMediaRuntime.LocalMediaEntry entry : entries) {
            if (entry.name.toLowerCase(Locale.ROOT).contains(needle)) {
                result.add(entry);
                continue;
            }
            for (LocalMediaRuntime.LocalMediaFile file : entry.files) {
                if (file.relativePath.toLowerCase(Locale.ROOT).contains(needle)) {
                    result.add(entry);
                    break;
                }
            }
        }
        return result;
    }

    private static void addMessage(Object scope, String key, String title, String subtitle)
            throws ReflectiveOperationException {
        addItem(scope, key, (itemScope, composer, flags) -> {
            renderEmptyState(title, subtitle, composer);
            return Unit.INSTANCE;
        });
    }

    private static void addMessageSafely(Object scope, String key, String title, String subtitle) {
        try {
            addMessage(scope, key, title, subtitle);
        } catch (Throwable nested) {
            Log.e(TAG, "Unable to render the Storage error state", nested);
        }
    }

    private static void addItem(
            Object scope,
            String key,
            Function3<Object, Object, Object, Unit> content
    ) throws ReflectiveOperationException {
        ClassLoader loader = scope.getClass().getClassLoader();
        Method item = lazyItemMethod;
        if (item == null) {
            Class<?> gridScope = Class.forName("f0.h", false, loader);
            for (Method candidate : gridScope.getDeclaredMethods()) {
                Class<?>[] parameters = candidate.getParameterTypes();
                if (Modifier.isStatic(candidate.getModifiers()) && candidate.getReturnType() == Void.TYPE &&
                        parameters.length == 5 && parameters[0] == gridScope &&
                        parameters[1] == String.class && parameters[4] == Integer.TYPE) {
                    candidate.setAccessible(true);
                    item = candidate;
                    break;
                }
            }
            if (item == null) throw new NoSuchMethodException("Native Library grid item");
            lazyItemMethod = item;
        }
        Constructor<?> lambda = composableLambdaConstructor;
        if (lambda == null) {
            lambda = item.getParameterTypes()[3]
                    .getDeclaredConstructor(Integer.TYPE, Object.class, Boolean.TYPE);
            lambda.setAccessible(true);
            composableLambdaConstructor = lambda;
        }
        Function1<Object, Object> fullWidth = itemScope -> fullSpan(loader);
        Object nativeContent = lambda.newInstance(key.hashCode() ^ 0x4d4f5250, content, true);
        item.invoke(null, scope, key, fullWidth, nativeContent, 4);
    }

    private static Object fullSpan(ClassLoader loader) {
        try {
            Class<?> itemScope = Class.forName("f0.u", false, loader);
            Field maxSpanField = null;
            for (Field field : itemScope.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) && field.getType() == Integer.TYPE) {
                    field.setAccessible(true);
                    maxSpanField = field;
                    break;
                }
            }
            if (maxSpanField == null) throw new NoSuchFieldException("Native grid maximum span");
            int maxSpan = maxSpanField.getInt(null);
            Method pack = null;
            // Compose 1.9 moved the grid-span packer from t6.a to k6.g. Match its
            // stable static (int) -> long shape so this bridge also remains usable
            // across Nuvio builds that retain the older optimized owner.
            for (String ownerName : new String[]{"k6.g", "t6.a"}) {
                Class<?> owner;
                try {
                    owner = Class.forName(ownerName, false, loader);
                } catch (ClassNotFoundException ignored) {
                    continue;
                }
                for (Method candidate : owner.getDeclaredMethods()) {
                    if (Modifier.isStatic(candidate.getModifiers()) &&
                            candidate.getReturnType() == Long.TYPE &&
                            candidate.getParameterCount() == 1 &&
                            candidate.getParameterTypes()[0] == Integer.TYPE) {
                        candidate.setAccessible(true);
                        pack = candidate;
                        break;
                    }
                }
                if (pack != null) break;
            }
            if (pack == null) throw new NoSuchMethodException("Native grid span packer");
            long packed = ((Number) pack.invoke(null, maxSpan)).longValue();
            Constructor<?> constructor = Class.forName("f0.c", false, loader)
                    .getDeclaredConstructor(Long.TYPE);
            constructor.setAccessible(true);
            return constructor.newInstance(packed);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to create full-width Storage grid span", error);
        }
    }

    private static void renderSearch(String query, Object composer) {
        try {
            Method method = cloudSearchMethod;
            if (method == null) {
                Class<?> owner = Class.forName(
                        requiredNativeOwner(cloudSearchOwnerName, "Library search"), false,
                        composer.getClass().getClassLoader());
                method = owner.getDeclaredMethod(
                        requiredNativeOwner(cloudSearchMethodName, "Library search method"),
                        String.class, Function1.class,
                        Class.forName("e1.p", false, composer.getClass().getClassLoader()), Integer.TYPE);
                method.setAccessible(true);
                cloudSearchMethod = method;
            }
            Function1<String, Unit> onChange = value -> {
                setStateValue(queryState, value == null ? "" : value);
                return Unit.INSTANCE;
            };
            STORAGE_SEARCH.set(Boolean.TRUE);
            method.invoke(null, query, onChange, composer, 0);
        } catch (Throwable error) {
            throw new IllegalStateException("Unable to render native Storage search", error);
        } finally {
            STORAGE_SEARCH.remove();
        }
    }

    private static Object nativeCloudItem(LocalMediaRuntime.LocalMediaEntry entry)
            throws ReflectiveOperationException {
        ClassLoader loader = LocalMediaLibraryUi.class.getClassLoader();
        Class<?> fileClass = Class.forName(
                requiredNativeOwner(cloudFileOwnerName, "Cloud file model"), false, loader);
        Constructor<?> fileConstructor = fileClass.getDeclaredConstructor(
                String.class, String.class, Long.class, String.class, Boolean.TYPE, String.class);
        fileConstructor.setAccessible(true);
        List<Object> nativeFiles = new ArrayList<>();
        for (LocalMediaRuntime.LocalMediaFile file : entry.files) {
            String displayName = file.name;
            if (entry.folder) {
                String prefix = entry.name + "/";
                displayName = file.relativePath.startsWith(prefix)
                        ? file.relativePath.substring(prefix.length()) : file.relativePath;
            }
            nativeFiles.add(fileConstructor.newInstance(
                    file.uri.toString(), displayName, Long.valueOf(file.size),
                    "video/*", true, file.uri.toString()));
        }

        Class<?> itemClass = Class.forName(
                requiredNativeOwner(cloudItemOwnerName, "Cloud item model"), false, loader);
        Constructor<?> itemConstructor = null;
        for (Constructor<?> candidate : itemClass.getDeclaredConstructors()) {
            Class<?>[] parameters = candidate.getParameterTypes();
            if (parameters.length == 9 && parameters[0] == String.class &&
                    parameters[1] == String.class && parameters[2] == String.class &&
                    parameters[3].isEnum() && parameters[4] == String.class &&
                    parameters[5] == String.class && parameters[6] == Long.class &&
                    parameters[7] == Float.class && List.class.isAssignableFrom(parameters[8])) {
                itemConstructor = candidate;
                break;
            }
        }
        if (itemConstructor == null) throw new NoSuchMethodException("Native Cloud item model");
        Class<?> typeClass = itemConstructor.getParameterTypes()[3];
        @SuppressWarnings({"rawtypes", "unchecked"})
        Object fileType = Enum.valueOf((Class<? extends Enum>) typeClass.asSubclass(Enum.class), "File");
        itemConstructor.setAccessible(true);
        Long size = entry.folder ? null : Long.valueOf(entry.files.get(0).size);
        return itemConstructor.newInstance(
                "storage", "Storage", entry.key, fileType, entry.name, "local", size, null, nativeFiles);
    }

    private static void renderEntry(EntryPresentation presentation, Object composer) {
        try {
            Method card = cloudCardMethod;
            Method dialog = cloudFileDialogMethod;
            ClassLoader loader = composer.getClass().getClassLoader();
            Class<?> itemClass = Class.forName(
                    requiredNativeOwner(cloudItemOwnerName, "Cloud item model"), false, loader);
            Class<?> composerClass = Class.forName("e1.p", false, loader);
            if (card == null) {
                card = Class.forName(
                        requiredNativeOwner(cloudCardOwnerName, "Library card"), false, loader
                ).getDeclaredMethod(
                        requiredNativeOwner(cloudCardMethodName, "Library card method"),
                        itemClass, Boolean.TYPE, Function0.class, composerClass, Integer.TYPE);
                card.setAccessible(true);
                cloudCardMethod = card;
            }
            if (dialog == null) {
                dialog = Class.forName(
                        requiredNativeOwner(cloudDialogOwnerName, "Library dialog"), false, loader
                ).getDeclaredMethod(
                        requiredNativeOwner(cloudDialogMethodName, "Library dialog method"),
                        itemClass, String.class, Function1.class, Function0.class,
                        composerClass, Integer.TYPE);
                dialog.setAccessible(true);
                cloudFileDialogMethod = dialog;
            }

            Function0<Unit> click = () -> {
                // The native file dialog is layered over its folder card. Some TV key dispatchers
                // deliver the select release to both callbacks; the covered card must leave the
                // long-press token for the focused file row.
                if (presentation.entry.folder && presentation.entry.key.equals(
                        stringStateValue(selectedEntryState))) {
                    Log.d(TAG, "Ignored covered Storage folder callback: " +
                            presentation.entry.name);
                    return Unit.INSTANCE;
                }
                boolean longPress = LocalMediaRuntime.consumeSelectLongPress();
                Log.d(TAG, "Storage card action longPress=" + longPress +
                        " name=" + presentation.entry.name);
                if (longPress) {
                    if (presentation.entry.folder) {
                        LocalMediaRuntime.requestDeleteFolder(presentation.entry);
                    } else {
                        LocalMediaRuntime.requestDeleteFile(presentation.entry.files.get(0));
                    }
                    return Unit.INSTANCE;
                }
                if (presentation.entry.folder) {
                    setStateValue(selectedEntryState, presentation.entry.key);
                } else {
                    LocalMediaRuntime.play(presentation.entry.files.get(0));
                }
                return Unit.INSTANCE;
            };
            card.invoke(null, presentation.nativeItem, false, click, composer, 0);

            if (!presentation.entry.folder ||
                    !presentation.entry.key.equals(stringStateValue(selectedEntryState))) return;
            Function1<Object, Unit> playFile = nativeFile -> {
                LocalMediaRuntime.LocalMediaFile file = presentation.filesByNativeModel.get(nativeFile);
                if (file == null) return Unit.INSTANCE;
                if (LocalMediaRuntime.consumeSelectLongPress()) {
                    FILE_ACTION_GENERATION.incrementAndGet();
                    pendingFileAction = null;
                    openFileDeleteAction(presentation.entry.key, file);
                    return Unit.INSTANCE;
                }
                long generation = FILE_ACTION_GENERATION.incrementAndGet();
                pendingFileAction = new PendingFileAction(
                        generation, presentation.entry.key, file);
                // This callback can run on key-down or key-up depending on the TV device. If the
                // release was already dispatched, resolve on the next main-loop turn; otherwise
                // observeKeyEvent resolves it from the real release event with no artificial lag.
                MAIN.post(() -> {
                    if (!LocalMediaRuntime.isSelectKeyDown()) {
                        resolvePendingFileAction(LocalMediaRuntime.consumeSelectLongPress());
                    }
                });
                // Preserve the open folder so popping the local player restores the exact
                // Storage selection view from which playback started.
                return Unit.INSTANCE;
            };
            Function0<Unit> dismiss = () -> {
                FILE_ACTION_GENERATION.incrementAndGet();
                pendingFileAction = null;
                setStateValue(selectedEntryState, null);
                return Unit.INSTANCE;
            };
            dialog.invoke(null, presentation.nativeItem, null, playFile, dismiss, composer, 0);
        } catch (Throwable error) {
            throw new IllegalStateException("Unable to render a native Storage card", error);
        }
    }

    /** Called by the MainActivity key hook after the physical select key is released. */
    static void onSelectKeyReleased(boolean longPress) {
        MAIN.post(() -> resolvePendingFileAction(longPress));
    }

    private static void resolvePendingFileAction(boolean longPress) {
        PendingFileAction pending = pendingFileAction;
        if (pending == null || pending.generation != FILE_ACTION_GENERATION.get()) return;
        pendingFileAction = null;
        FILE_ACTION_GENERATION.incrementAndGet();
        Log.d(TAG, "Storage file action longPress=" + longPress +
                " name=" + pending.file.name);
        if (longPress) openFileDeleteAction(pending.entryKey, pending.file);
        else LocalMediaRuntime.play(pending.file);
    }

    private static final class PendingFileAction {
        final long generation;
        final String entryKey;
        final LocalMediaRuntime.LocalMediaFile file;

        PendingFileAction(
                long generation, String entryKey, LocalMediaRuntime.LocalMediaFile file
        ) {
            this.generation = generation;
            this.entryKey = entryKey;
            this.file = file;
        }
    }

    private static void renderEmptyState(String title, String subtitle, Object composer) {
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Method method = emptyStateMethod;
            if (method == null) {
                Class<?> iconClass = Class.forName("h2.f", false, loader);
                method = Class.forName(
                        requiredNativeOwner(emptyStateOwnerName, "Library status"), false, loader
                ).getDeclaredMethod(
                        requiredNativeOwner(emptyStateMethodName, "Library status method"),
                        String.class, String.class, iconClass,
                        Class.forName("u1.q", false, loader), Float.TYPE,
                        Class.forName("e1.p", false, loader), Integer.TYPE, Integer.TYPE);
                method.setAccessible(true);
                emptyStateMethod = method;
            }
            Object icon = emptyStateIcon;
            if (icon == null) {
                Method iconFactory = Class.forName(
                        requiredNativeOwner(emptyStateIconOwnerName, "Library status icon"),
                        false, loader).getDeclaredMethod(
                        requiredNativeOwner(emptyStateIconMethodName, "Library status icon method"));
                iconFactory.setAccessible(true);
                icon = iconFactory.invoke(null);
                emptyStateIcon = icon;
            }
            method.invoke(null, title, subtitle, icon, null, 0.0f, composer, 0, 24);
        } catch (Throwable error) {
            throw new IllegalStateException("Unable to render native Storage status", error);
        }
    }

    private static void renderRefreshButton(Object composer) {
        renderActionButton("Refresh storage library", () -> {
            refresh();
            return Unit.INSTANCE;
        }, composer);
    }

    private static void renderActionButton(
            String title, Function0<Unit> action, Object composer
    ) {
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Method button = nativeButtonMethod;
            if (button == null) {
                for (Method candidate : Class.forName(
                        requiredNativeOwner(nativeButtonOwnerName, "Button"), false, loader
                ).getDeclaredMethods()) {
                    Class<?>[] parameters = candidate.getParameterTypes();
                    if (Modifier.isStatic(candidate.getModifiers()) && candidate.getReturnType() == Void.TYPE &&
                            parameters.length == 13 && Function0.class.isAssignableFrom(parameters[0]) &&
                            Function3.class.isAssignableFrom(parameters[8]) &&
                            parameters[10] == Integer.TYPE && parameters[11] == Integer.TYPE &&
                            parameters[12] == Integer.TYPE) {
                        candidate.setAccessible(true);
                        button = candidate;
                        break;
                    }
                }
                if (button == null) throw new NoSuchMethodException("Native Library refresh button");
                nativeButtonMethod = button;
            }
            Object colors = nativeButtonColors(composer);
            Function3<Object, Object, Object, Unit> label = (scope, labelComposer, flags) -> {
                renderNativeText(title, labelComposer);
                return Unit.INSTANCE;
            };
            button.invoke(null, action, null, true, null, null, colors, null, null,
                    label, composer, 0, 0, 3958);
        } catch (Throwable error) {
            throw new IllegalStateException("Unable to render native Storage refresh", error);
        }
    }

    private static Object nativeButtonColors(Object composer) throws ReflectiveOperationException {
        ClassLoader loader = composer.getClass().getClassLoader();
        Class<?> keyOwner = Class.forName("xa.b1", false, loader);
        Method readLocal = null;
        for (Method candidate : composer.getClass().getMethods()) {
            if (candidate.getName().equals("j") && candidate.getParameterCount() == 1) {
                readLocal = candidate;
                break;
            }
        }
        if (readLocal == null) throw new NoSuchMethodException("Native composition-local reader");
        readLocal.setAccessible(true);
        Object colors = null;
        for (Field candidate : keyOwner.getDeclaredFields()) {
            if (!Modifier.isStatic(candidate.getModifiers())) continue;
            candidate.setAccessible(true);
            Object value = readLocal.invoke(composer, candidate.get(null));
            if (value != null && "xa.e".equals(value.getClass().getName())) {
                colors = value;
                break;
            }
        }
        if (colors == null) throw new NoSuchFieldException("Native Nuvio color composition local");
        Field containerField = declaredField(colors.getClass(), "c", "f35121c");
        Field contentField = declaredField(colors.getClass(), "l", "f35129l");
        containerField.setAccessible(true);
        contentField.setAccessible(true);
        long container = containerField.getLong(colors);
        long content = contentField.getLong(colors);

        Method factory = nativeButtonColorsMethod;
        if (factory == null) {
            for (Method candidate : Class.forName("p5.f", false, loader).getDeclaredMethods()) {
                Class<?>[] parameters = candidate.getParameterTypes();
                if (Modifier.isStatic(candidate.getModifiers()) && parameters.length == 8 &&
                        parameters[0] == Long.TYPE && parameters[1] == Long.TYPE &&
                        parameters[6].isAssignableFrom(composer.getClass()) &&
                        parameters[7] == Integer.TYPE) {
                    candidate.setAccessible(true);
                    factory = candidate;
                    break;
                }
            }
            if (factory == null) throw new NoSuchMethodException("Native Button colors");
            nativeButtonColorsMethod = factory;
        }
        return factory.invoke(null, container, content, 0L, 0L, 0L, 0L, composer, 252);
    }

    private static Field declaredField(Class<?> owner, String... names) throws NoSuchFieldException {
        for (String name : names) {
            try {
                return owner.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) {
                // Try the next raw or decompiler-provided field name.
            }
        }
        throw new NoSuchFieldException(owner.getName());
    }

    private static void renderNativeText(String text, Object composer) {
        try {
            Method method = nativeTextMethod;
            if (method == null) {
                for (Method candidate : Class.forName(
                        requiredNativeOwner(nativeTextOwnerName, "text"), false,
                        composer.getClass().getClassLoader()).getDeclaredMethods()) {
                    Class<?>[] parameters = candidate.getParameterTypes();
                    if (Modifier.isStatic(candidate.getModifiers()) && candidate.getReturnType() == Void.TYPE &&
                            parameters.length == 19 && parameters[0] == String.class) {
                        candidate.setAccessible(true);
                        method = candidate;
                        break;
                    }
                }
                if (method == null) throw new NoSuchMethodException("Native text");
                nativeTextMethod = method;
            }
            Class<?>[] parameters = method.getParameterTypes();
            Object[] arguments = new Object[parameters.length];
            arguments[0] = text;
            for (int index = 1; index < arguments.length; index++) {
                Class<?> parameter = parameters[index];
                if (parameter == Long.TYPE) arguments[index] = 0L;
                else if (parameter == Integer.TYPE) arguments[index] = 0;
                else if (parameter == Boolean.TYPE) arguments[index] = false;
                else if (parameter == Float.TYPE) arguments[index] = 0.0f;
                else arguments[index] = null;
            }
            arguments[15] = composer;
            arguments[18] = 131070;
            method.invoke(null, arguments);
        } catch (Throwable error) {
            throw new IllegalStateException("Unable to render native Storage text", error);
        }
    }

    private static String requiredNativeOwner(String ownerName, String component) {
        if (ownerName == null || ownerName.isEmpty()) {
            throw new IllegalStateException("Native " + component + " owner was not configured");
        }
        return ownerName;
    }

    private static Object stateValue(Object state) {
        try {
            Method getter = findValueGetter(state.getClass());
            if (getter == null) throw new NoSuchMethodException("Compose state getter");
            return getter.invoke(state);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to read Storage UI state", error);
        }
    }

    private static String stringStateValue(Object state) {
        Object value = stateValue(state);
        return value == null ? "" : String.valueOf(value);
    }

    private static void setStateValue(Object state, Object value) {
        if (state == null) return;
        try {
            Method setter = state.getClass().getMethod("setValue", Object.class);
            setter.setAccessible(true);
            setter.invoke(state, value);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to update Storage UI state", error);
        }
    }

    private static Method findValueGetter(Class<?> type) {
        try {
            Method getter = type.getMethod("getValue");
            getter.setAccessible(true);
            return getter;
        } catch (NoSuchMethodException ignored) {
            return null;
        }
    }

    private static final class EntryPresentation {
        final LocalMediaRuntime.LocalMediaEntry entry;
        final Object nativeItem;
        final Map<Object, LocalMediaRuntime.LocalMediaFile> filesByNativeModel;

        EntryPresentation(LocalMediaRuntime.LocalMediaEntry entry, Object nativeItem)
                throws ReflectiveOperationException {
            this.entry = entry;
            this.nativeItem = nativeItem;
            this.filesByNativeModel = new IdentityHashMap<>();
            Field filesField = null;
            for (Field candidate : nativeItem.getClass().getDeclaredFields()) {
                if (List.class.isAssignableFrom(candidate.getType())) {
                    candidate.setAccessible(true);
                    filesField = candidate;
                    break;
                }
            }
            if (filesField == null) throw new NoSuchFieldException("Native Cloud item files");
            List<?> nativeFiles = (List<?>) filesField.get(nativeItem);
            NATIVE_KEY_TARGETS.put(nativeItem, StorageKeyTarget.entry(entry));
            for (int index = 0; index < nativeFiles.size(); index++) {
                Object nativeFile = nativeFiles.get(index);
                LocalMediaRuntime.LocalMediaFile file = entry.files.get(index);
                filesByNativeModel.put(nativeFile, file);
                NATIVE_KEY_TARGETS.put(nativeFile, StorageKeyTarget.file(entry.key, file));
            }
        }
    }

    private static final class StorageKeyTarget {
        final String entryKey;
        final LocalMediaRuntime.LocalMediaEntry entry;
        final LocalMediaRuntime.LocalMediaFile file;
        final Function1<Object, Boolean> keyHandler;

        private StorageKeyTarget(
                String entryKey,
                LocalMediaRuntime.LocalMediaEntry entry,
                LocalMediaRuntime.LocalMediaFile file
        ) {
            this.entryKey = entryKey;
            this.entry = entry;
            this.file = file;
            this.keyHandler = wrappedEvent ->
                    Boolean.valueOf(observeStorageRowKey(this, wrappedEvent));
        }

        static StorageKeyTarget entry(LocalMediaRuntime.LocalMediaEntry entry) {
            return new StorageKeyTarget(entry.key, entry, null);
        }

        static StorageKeyTarget file(
                String entryKey, LocalMediaRuntime.LocalMediaFile file
        ) {
            return new StorageKeyTarget(entryKey, null, file);
        }

        String displayName() {
            if (file != null) return file.name;
            return entry == null ? "" : entry.name;
        }
    }
}
