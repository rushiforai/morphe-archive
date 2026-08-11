package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
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
    private static final ThreadLocal<Boolean> STORAGE_SEARCH = new ThreadLocal<>();
    private static volatile boolean storageModeActive;

    private static volatile Object snapshotState;
    private static volatile Object queryState;
    private static volatile Object selectedEntryState;
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

    private static final Function2<Object, Object, Unit> REFRESH_CONTENT = (composer, flags) -> {
        renderRefreshButton(composer);
        return Unit.INSTANCE;
    };

    private LocalMediaLibraryUi() {}

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
        storageModeActive = storage;
        if (!storage) return false;
        try {
            ensureState(lazyGridScope.getClass().getClassLoader());
            String query = stringStateValue(queryState);
            LocalMediaRuntime.LibrarySnapshot snapshot =
                    (LocalMediaRuntime.LibrarySnapshot) stateValue(snapshotState);
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
                        "Folder access required",
                        "Open Settings > Morphe > Playback > Local Storage to allow " +
                                LocalMediaRuntime.DEFAULT_FOLDER_LABEL + ".");
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
        Object state = snapshotState;
        if (state != null) setStateValue(state, null);
        Object selected = selectedEntryState;
        if (selected != null) setStateValue(selected, null);
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
            Method mutableState = stateFactory.getDeclaredMethod("q", Object.class);
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
            for (Method candidate : Class.forName("t6.a", false, loader).getDeclaredMethods()) {
                if (Modifier.isStatic(candidate.getModifiers()) && candidate.getReturnType() == Long.TYPE &&
                        candidate.getParameterCount() == 1 &&
                        candidate.getParameterTypes()[0] == Integer.TYPE) {
                    candidate.setAccessible(true);
                    pack = candidate;
                    break;
                }
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
                Class<?> owner = Class.forName("na.f0", false, composer.getClass().getClassLoader());
                method = owner.getDeclaredMethod("d", String.class, Function1.class,
                        Class.forName("e1.m0", false, composer.getClass().getClassLoader()), Integer.TYPE);
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
        Class<?> fileClass = Class.forName("y8.a", false, loader);
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

        Class<?> typeClass = Class.forName("y8.c", false, loader);
        @SuppressWarnings({"rawtypes", "unchecked"})
        Object fileType = Enum.valueOf((Class<? extends Enum>) typeClass.asSubclass(Enum.class), "File");
        Class<?> itemClass = Class.forName("y8.b", false, loader);
        Constructor<?> itemConstructor = itemClass.getDeclaredConstructor(
                String.class, String.class, String.class, typeClass, String.class, String.class,
                Long.class, Float.class, List.class);
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
            Class<?> itemClass = Class.forName("y8.b", false, loader);
            Class<?> composerClass = Class.forName("e1.m0", false, loader);
            if (card == null) {
                card = Class.forName("na.f0", false, loader).getDeclaredMethod(
                        "b", itemClass, Boolean.TYPE, Function0.class, composerClass, Integer.TYPE);
                card.setAccessible(true);
                cloudCardMethod = card;
            }
            if (dialog == null) {
                dialog = Class.forName("na.f0", false, loader).getDeclaredMethod(
                        "a", itemClass, String.class, Function1.class, Function0.class,
                        composerClass, Integer.TYPE);
                dialog.setAccessible(true);
                cloudFileDialogMethod = dialog;
            }

            Function0<Unit> click = () -> {
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
                // Preserve the open folder so popping the local player restores the exact
                // Storage selection view from which playback started.
                if (file != null) LocalMediaRuntime.play(file);
                return Unit.INSTANCE;
            };
            Function0<Unit> dismiss = () -> {
                setStateValue(selectedEntryState, null);
                return Unit.INSTANCE;
            };
            dialog.invoke(null, presentation.nativeItem, null, playFile, dismiss, composer, 0);
        } catch (Throwable error) {
            throw new IllegalStateException("Unable to render a native Storage card", error);
        }
    }

    private static void renderEmptyState(String title, String subtitle, Object composer) {
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Method method = emptyStateMethod;
            if (method == null) {
                Class<?> iconClass = Class.forName("h2.f", false, loader);
                method = Class.forName("da.y2", false, loader).getDeclaredMethod(
                        "j", String.class, String.class, iconClass,
                        Class.forName("u1.q", false, loader), Float.TYPE,
                        Class.forName("e1.m0", false, loader), Integer.TYPE, Integer.TYPE);
                method.setAccessible(true);
                emptyStateMethod = method;
            }
            Object icon = emptyStateIcon;
            if (icon == null) {
                Method iconFactory = Class.forName("n.b", false, loader).getDeclaredMethod("x");
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
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Method button = nativeButtonMethod;
            if (button == null) {
                for (Method candidate : Class.forName("p5.a1", false, loader).getDeclaredMethods()) {
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
            Function0<Unit> action = () -> {
                refresh();
                return Unit.INSTANCE;
            };
            Function3<Object, Object, Object, Unit> label = (scope, labelComposer, flags) -> {
                renderNativeText("Refresh storage library", labelComposer);
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
        Class<?> keyOwner = Class.forName("va.w0", false, loader);
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
            if (value != null && "va.e".equals(value.getClass().getName())) {
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
                for (Method candidate : Class.forName("p5.a2", false,
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
            for (int index = 0; index < nativeFiles.size(); index++) {
                filesByNativeModel.put(nativeFiles.get(index), entry.files.get(index));
            }
        }
    }
}
