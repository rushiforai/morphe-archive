package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.DocumentsContract;
import android.util.Log;
import android.view.KeyEvent;
import android.view.ViewConfiguration;
import android.widget.Toast;

import androidx.media3.common.MediaItem;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.Player;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import io.github.liongalahad.nuviotv.extension.settings.MorpheStoragePath;

import java.io.File;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.functions.Function1;

/** Runtime boundary for browsing and playing files from a persisted Storage Access Framework tree. */
public final class LocalMediaRuntime {
    public static final String DEFAULT_FOLDER_LABEL = MorpheStoragePath.DEFAULT_FOLDER_LABEL;
    public static final String DEFAULT_DOCUMENT_ID = MorpheStoragePath.DEFAULT_DOCUMENT_ID;
    public static final String ENABLED_KEY = "playback.local_media.enabled";
    public static final String TREE_URI_KEY = MorpheStoragePath.STORAGE_PATH_KEY;
    static final String LEGACY_TREE_URI_KEY = "playback.local_media.tree_uri";

    private static final String TAG = "MorpheLocalMedia";
    private static final Set<String> VIDEO_EXTENSIONS = extensionSet(
            "mkv", "mp4", "m4v", "webm", "avi", "mov", "mpeg", "mpg", "ts", "m2ts", "mts"
    );
    private static final Set<String> SUBTITLE_EXTENSIONS = extensionSet(
            "srt", "ass", "ssa", "vtt", "ttml", "dfxp"
    );
    private static volatile Object navController;
    private static volatile String activeLocalMediaUri;
    private static volatile WeakReference<Object> activeLocalPlayer = new WeakReference<>(null);
    private static volatile boolean activeLocalPlayerReady;
    private static volatile boolean activeLocalEndHandled;
    private static volatile Object observedStorageMode;
    private static volatile Function1<Object, ?> observedStorageModeSelector;
    private static volatile Object pendingReturnStorageMode;
    private static volatile Function1<Object, ?> pendingReturnStorageModeSelector;
    private static volatile long selectDownTime;
    private static volatile boolean selectLongPressDetected;
    private static volatile boolean selectLongPressConsumed;
    private static volatile boolean selectLongPressHandled;
    private static volatile long longPressReleasedAt;
    private static volatile PendingDelete pendingDelete;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable SELECT_LONG_PRESS = () -> {
        if (selectDownTime <= 0L || selectLongPressHandled) return;
        selectLongPressDetected = true;
        if (LocalMediaLibraryUi.onSelectLongPressTimeout()) {
            selectLongPressConsumed = true;
            selectLongPressHandled = true;
        }
    };

    private LocalMediaRuntime() {}

    public static boolean isEnabled() {
        SharedPreferences preferences = preferences();
        try {
            return preferences.getBoolean(ENABLED_KEY, false);
        } catch (ClassCastException ignored) {
            return false;
        }
    }

    public static void setEnabled(boolean enabled) {
        preferences().edit().putBoolean(ENABLED_KEY, enabled).apply();
    }

    public static String treeUriString() {
        migrateLegacyStoragePath();
        return MorpheStoragePath.value();
    }

    /** Preserves folder choices made by Local Media builds from before the path became shared. */
    static void migrateLegacyStoragePath() {
        SharedPreferences preferences = preferences();
        if (preferences.contains(TREE_URI_KEY) || !preferences.contains(LEGACY_TREE_URI_KEY)) return;
        String legacy;
        try {
            legacy = preferences.getString(LEGACY_TREE_URI_KEY, null);
        } catch (ClassCastException ignored) {
            legacy = null;
        }
        SharedPreferences.Editor edit = preferences.edit().remove(LEGACY_TREE_URI_KEY);
        if (legacy != null && !legacy.trim().isEmpty()) edit.putString(TREE_URI_KEY, legacy);
        edit.commit();
    }

    public static boolean setTreeUri(Context context, Uri treeUri) {
        MorpheSettingsRuntime.initialize(context);
        boolean saved = MorpheStoragePath.setTreeUri(context, treeUri);
        if (!saved) return false;
        LocalMediaLibraryUi.invalidate();
        return true;
    }

    public static boolean setFolderPath(Context context, String folderPath) {
        File folder = folderPath == null ? null : new File(folderPath);
        if (!LocalMediaInternalFolderPickerActivity.isAllowedFolder(folder)) {
            Log.w(TAG, "Rejected custom storage folder: " + folderPath);
            return false;
        }
        MorpheSettingsRuntime.initialize(context);
        boolean saved = MorpheStoragePath.setFolderPath(context, folder.getAbsolutePath());
        Log.d(TAG, "Custom storage folder saved=" + saved + ": " + folder.getAbsolutePath());
        if (!saved) return false;
        LocalMediaLibraryUi.invalidate();
        return true;
    }

    public static String folderDisplayLabel() {
        return MorpheStoragePath.displayLabel();
    }

    static String folderDisplayLabelForPath(String folderPath) {
        return MorpheStoragePath.displayLabelForPath(folderPath);
    }

    public static void openFolderPicker(Activity activity) {
        activity.startActivity(new Intent(activity, LocalMediaFolderPickerActivity.class));
    }

    public static boolean hasDefaultFolderAccess(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            return Environment.isExternalStorageManager();
        }
        return context.checkSelfPermission(Manifest.permission.READ_EXTERNAL_STORAGE) ==
                android.content.pm.PackageManager.PERMISSION_GRANTED &&
                context.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) ==
                android.content.pm.PackageManager.PERMISSION_GRANTED;
    }

    public static void prepareDefaultFolder(Activity activity) {
        if (treeUriString() != null) return;
        if (!hasDefaultFolderAccess(activity)) {
            activity.startActivity(new Intent(activity, LocalMediaDefaultFolderAccessActivity.class));
            return;
        }
        if (!ensureDefaultFolder(activity)) {
            Toast.makeText(activity,
                    "Movies/Nuvio could not be created",
                    Toast.LENGTH_LONG).show();
        }
        LocalMediaLibraryUi.invalidate();
        MorpheSettingsUi.refresh();
    }

    public static boolean ensureDefaultFolder(Context context) {
        if (!hasDefaultFolderAccess(context)) return false;
        try {
            return ensureDirectory(defaultFolder());
        } catch (Throwable error) {
            Log.e(TAG, "Unable to create the default local media folder", error);
            return false;
        }
    }

    static boolean ensureDirectory(File folder) {
        return folder.isDirectory() || (!folder.exists() && folder.mkdirs()) || folder.isDirectory();
    }

    private static File defaultFolder() {
        return new File(
                Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES),
                "Nuvio"
        );
    }

    /** Removes the injected mode from the native selector when the user disables it. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static EnumEntries visibleLibraryModes(EnumEntries modes) {
        if (modes == null || isEnabled()) return modes;
        List<Enum> visible = new ArrayList<>();
        for (Object mode : modes) {
            if (!(mode instanceof Enum) || !"Storage".equals(((Enum<?>) mode).name())) {
                visible.add((Enum) mode);
            }
        }
        if (visible.size() == modes.size() || visible.isEmpty()) return modes;
        Class<?> enumClass = visible.get(0).getDeclaringClass();
        Enum[] values = (Enum[]) Array.newInstance(enumClass, visible.size());
        for (int index = 0; index < visible.size(); index++) values[index] = visible.get(index);
        return EnumEntriesKt.enumEntries(values);
    }

    public static boolean isStorageMode(Object mode) {
        return mode instanceof Enum && "Storage".equals(((Enum<?>) mode).name());
    }

    /** Records TV select-key duration before Compose dispatches the card click callback. */
    public static void observeKeyEvent(KeyEvent event) {
        observeKeyEvent(null, event);
    }

    /** Records the window receiving the key so held items can be resolved before key-up. */
    public static void observeKeyEvent(Object keyOwner, KeyEvent event) {
        if (event == null) return;
        int key = event.getKeyCode();
        if (!isSelectKey(key)) return;
        if (event.getAction() == KeyEvent.ACTION_DOWN) {
            LocalMediaLibraryUi.observeSelectKeyOwner(keyOwner);
            if (selectDownTime <= 0L) {
                // Some TV remotes dispatch the same held key through both the Activity and its
                // Compose dialog, or emit repeat DOWN events with repeatCount still set to zero.
                // Anchor the timeout to the first DOWN and never restart it before key-up.
                selectDownTime = event.getDownTime();
                selectLongPressDetected = false;
                selectLongPressConsumed = false;
                selectLongPressHandled = false;
                longPressReleasedAt = 0L;
                MAIN.removeCallbacks(SELECT_LONG_PRESS);
                MAIN.postDelayed(SELECT_LONG_PRESS, ViewConfiguration.getLongPressTimeout());
            }
            long held = event.getEventTime() -
                    (selectDownTime > 0 ? selectDownTime : event.getDownTime());
            if (event.isLongPress() || event.getRepeatCount() > 0 ||
                    held >= ViewConfiguration.getLongPressTimeout()) {
                selectLongPressDetected = true;
                SELECT_LONG_PRESS.run();
            }
        } else if (event.getAction() == KeyEvent.ACTION_UP) {
            MAIN.removeCallbacks(SELECT_LONG_PRESS);
            long held = event.getEventTime() - (selectDownTime > 0 ? selectDownTime : event.getDownTime());
            boolean longPress = selectLongPressHandled || (!selectLongPressConsumed &&
                    (selectLongPressDetected || held >= ViewConfiguration.getLongPressTimeout()));
            longPressReleasedAt = longPress ? SystemClock.elapsedRealtime() : 0L;
            selectDownTime = 0L;
            selectLongPressDetected = false;
            selectLongPressConsumed = false;
            selectLongPressHandled = false;
            LocalMediaLibraryUi.onSelectKeyReleased(longPress);
            LocalMediaLibraryUi.clearSelectKeyOwner();
        }
    }

    private static boolean isSelectKey(int key) {
        return key == KeyEvent.KEYCODE_DPAD_CENTER || key == KeyEvent.KEYCODE_ENTER ||
                key == KeyEvent.KEYCODE_NUMPAD_ENTER || key == KeyEvent.KEYCODE_BUTTON_A;
    }

    static boolean isSelectKeyDown() {
        return selectDownTime > 0L;
    }

    static void finishHeldSelectCycle() {
        MAIN.removeCallbacks(SELECT_LONG_PRESS);
        selectDownTime = 0L;
        selectLongPressDetected = false;
        selectLongPressConsumed = false;
        selectLongPressHandled = false;
        LocalMediaLibraryUi.clearSelectKeyOwner();
    }

    public static boolean consumeSelectLongPress() {
        if (selectLongPressDetected) {
            selectLongPressDetected = false;
            selectLongPressConsumed = true;
            longPressReleasedAt = 0L;
            return true;
        }
        long released = longPressReleasedAt;
        longPressReleasedAt = 0L;
        boolean valid = released > 0L && SystemClock.elapsedRealtime() - released <= 750L;
        if (valid) selectLongPressConsumed = true;
        return valid;
    }

    public static void requestDeleteFolder(LocalMediaEntry entry) {
        if (entry == null || !entry.folder) return;
        if (pendingDelete != null) return;
        pendingDelete = PendingDelete.folder(entry, isSelectKeyDown());
        showDeleteAction();
    }

    public static void requestDeleteFile(LocalMediaFile file) {
        if (file == null) return;
        if (pendingDelete != null) return;
        pendingDelete = PendingDelete.file(file, isSelectKeyDown());
        showDeleteAction();
    }

    private static void showDeleteAction() {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null) return;
        try {
            context.startActivity(new Intent(context, LocalMediaActionActivity.class)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP));
        } catch (RuntimeException error) {
            pendingDelete = null;
            Log.e(TAG, "Unable to show Storage action menu", error);
            toast("Unable to open Storage options");
        }
    }

    static void showPendingDeleteConfirmation() {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null || pendingDelete == null) return;
        try {
            context.startActivity(new Intent(context, LocalMediaDeleteActivity.class)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP));
        } catch (RuntimeException error) {
            Log.e(TAG, "Unable to show Storage delete confirmation", error);
            toast("Unable to open delete confirmation");
        }
    }

    static PendingDelete pendingDelete() { return pendingDelete; }
    static void cancelPendingDelete() {
        pendingDelete = null;
        LocalMediaLibraryUi.restoreFileDialogAfterAction();
    }

    static DeleteResult confirmPendingDelete() {
        PendingDelete request = pendingDelete;
        pendingDelete = null;
        LocalMediaLibraryUi.clearFileDialogAfterAction();
        Context context = MorpheSettingsRuntime.applicationContext();
        if (request == null || context == null) return DeleteResult.failure("Nothing was deleted");
        DeleteResult result = request.folder
                ? deleteFolder(context, request.entry)
                : deleteFile(context, request.file);
        LocalMediaLibraryUi.invalidate();
        return result;
    }

    static DeleteResult deleteFile(Context context, LocalMediaFile file) {
        if (context == null || file == null) return DeleteResult.failure("Nothing was deleted");
        if (!deleteDocument(context, file.uri, false))
            return DeleteResult.failure("The video file could not be deleted");
        int subtitleFailures = 0;
        for (LocalSubtitle subtitle : file.subtitles) {
            if (!deleteDocument(context, subtitle.uri, false)) subtitleFailures++;
        }
        boolean folderCleanupFailed = false;
        Uri rootFolder = file.rootFolderUri != null
                ? file.rootFolderUri : rootFolderUri(topLevelFolder(file.relativePath));
        if (rootFolder != null && !containsPlayableFiles(context, rootFolder)) {
            folderCleanupFailed = !deleteDocument(context, rootFolder, true);
        } else {
            cleanupEmptyParent(context, file.uri);
        }
        if (subtitleFailures == 0 && !folderCleanupFailed)
            return DeleteResult.success("File and associated subtitles deleted");
        StringBuilder message = new StringBuilder("The video was deleted");
        if (subtitleFailures > 0) {
            message.append(", but ").append(subtitleFailures)
                    .append(subtitleFailures == 1
                            ? " subtitle could not be deleted" : " subtitles could not be deleted");
        }
        if (folderCleanupFailed) {
            message.append(subtitleFailures > 0 ? " and the empty media folder remains"
                    : ", but the empty media folder could not be deleted");
        }
        return new DeleteResult(true, false, message.toString());
    }

    static DeleteResult deleteFolder(Context context, LocalMediaEntry entry) {
        if (context == null || entry == null || !entry.folder)
            return DeleteResult.failure("Nothing was deleted");
        Uri folder = entry.folderUri != null ? entry.folderUri : rootFolderUri(entry.name);
        if (folder == null) return DeleteResult.failure("The folder is outside the selected storage path");
        return deleteDocument(context, folder, true)
                ? DeleteResult.success("Folder and all its contents deleted")
                : DeleteResult.failure("The folder could not be deleted");
    }

    private static Uri rootFolderUri(String name) {
        if (name == null || name.isEmpty() || name.contains("/") || name.contains("\\")) return null;
        try {
            Uri root = MorpheStoragePath.uri();
            if ("file".equalsIgnoreCase(root.getScheme())) {
                File rootFile = new File(root.getPath()).getCanonicalFile();
                File target = new File(rootFile, name).getCanonicalFile();
                if (!rootFile.equals(target.getParentFile())) return null;
                return Uri.fromFile(target);
            }
            if ("content".equalsIgnoreCase(root.getScheme())) {
                String rootId = DocumentsContract.getTreeDocumentId(root);
                return DocumentsContract.buildDocumentUriUsingTree(root, rootId + "/" + name);
            }
        } catch (Throwable error) {
            Log.w(TAG, "Unable to resolve Storage folder", error);
        }
        return null;
    }

    private static String topLevelFolder(String relativePath) {
        if (relativePath == null) return null;
        int separator = relativePath.indexOf('/');
        return separator <= 0 ? null : relativePath.substring(0, separator);
    }

    /** A failed scan is treated as containing media so cleanup never deletes uncertain content. */
    private static boolean containsPlayableFiles(Context context, Uri folder) {
        if (folder == null) return true;
        try {
            if ("file".equalsIgnoreCase(folder.getScheme())) {
                return containsPlayableFile(new File(folder.getPath()));
            }
            if ("content".equalsIgnoreCase(folder.getScheme())) {
                Uri tree = MorpheStoragePath.uri();
                return containsPlayableSafDocument(context, tree,
                        DocumentsContract.getDocumentId(folder), new HashSet<>());
            }
        } catch (Throwable error) {
            Log.w(TAG, "Unable to verify whether a Storage folder still contains video", error);
        }
        return true;
    }

    private static boolean containsPlayableFile(File target) {
        if (target == null || !target.isDirectory()) return false;
        File[] children = target.listFiles();
        if (children == null) return true;
        for (File child : children) {
            if (child.isDirectory() && containsPlayableFile(child)) return true;
            if (child.isFile() && VIDEO_EXTENSIONS.contains(extensionOf(child.getName()))) return true;
        }
        return false;
    }

    private static boolean containsPlayableSafDocument(
            Context context, Uri tree, String parentId, Set<String> visited
    ) {
        if (!visited.add(parentId)) return false;
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, parentId);
        String[] projection = {
                DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_MIME_TYPE
        };
        try (Cursor cursor = context.getContentResolver().query(children, projection, null, null, null)) {
            if (cursor == null) return true;
            while (cursor.moveToNext()) {
                String documentId = cursor.getString(0);
                String name = cursor.getString(1);
                String mimeType = cursor.getString(2);
                if (DocumentsContract.Document.MIME_TYPE_DIR.equals(mimeType)) {
                    if (documentId != null && containsPlayableSafDocument(
                            context, tree, documentId, visited)) return true;
                } else if (name != null && VIDEO_EXTENSIONS.contains(extensionOf(name))) {
                    return true;
                }
            }
            return false;
        } catch (Throwable error) {
            Log.w(TAG, "Unable to scan Storage folder before cleanup", error);
            return true;
        }
    }

    private static boolean deleteDocument(Context context, Uri uri, boolean recursiveFolder) {
        if (uri == null) return false;
        try {
            if ("file".equalsIgnoreCase(uri.getScheme())) {
                File target = new File(uri.getPath());
                if (!target.exists()) return true;
                if (target.isDirectory()) return recursiveFolder && deleteFileTree(target);
                return target.isFile() && target.delete();
            }
            if ("content".equalsIgnoreCase(uri.getScheme())) {
                return DocumentsContract.deleteDocument(context.getContentResolver(), uri);
            }
        } catch (Throwable error) {
            Log.w(TAG, "Unable to delete Storage item", error);
        }
        return false;
    }

    private static boolean deleteFileTree(File target) throws IOException {
        File root = new File(MorpheStoragePath.uri().getPath()).getCanonicalFile();
        File exact = target.getCanonicalFile();
        if (exact.equals(root) || !root.equals(exact.getParentFile())) return false;
        File[] children = exact.listFiles();
        if (children == null) return false;
        for (File child : children) {
            if (child.isDirectory()) {
                if (!deleteNestedTree(child, exact)) return false;
            } else if (!child.isFile() || !child.delete()) return false;
        }
        return exact.delete();
    }

    private static boolean deleteNestedTree(File target, File allowedParent) throws IOException {
        File exact = target.getCanonicalFile();
        if (!exact.getPath().startsWith(allowedParent.getCanonicalPath() + File.separator)) return false;
        File[] children = exact.listFiles();
        if (children == null) return false;
        for (File child : children) {
            if (child.isDirectory()) {
                if (!deleteNestedTree(child, allowedParent)) return false;
            } else if (!child.isFile() || !child.delete()) return false;
        }
        return exact.delete();
    }

    private static void cleanupEmptyParent(Context context, Uri media) {
        try {
            if ("file".equalsIgnoreCase(media.getScheme())) {
                File parent = new File(media.getPath()).getCanonicalFile().getParentFile();
                File root = new File(MorpheStoragePath.uri().getPath()).getCanonicalFile();
                String[] children = parent == null ? null : parent.list();
                if (parent != null && !parent.equals(root) &&
                        parent.getPath().startsWith(root.getPath() + File.separator) &&
                        children != null && children.length == 0) parent.delete();
                return;
            }
            if (!"content".equalsIgnoreCase(media.getScheme())) return;
            Uri tree = MorpheStoragePath.uri();
            String id = DocumentsContract.getDocumentId(media);
            int separator = id.lastIndexOf('/');
            if (separator <= 0) return;
            String parentId = id.substring(0, separator);
            if (parentId.equals(DocumentsContract.getTreeDocumentId(tree))) return;
            Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, parentId);
            try (Cursor cursor = context.getContentResolver().query(children,
                    new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID}, null, null, null)) {
                if (cursor == null || cursor.getCount() != 0) return;
            }
            DocumentsContract.deleteDocument(context.getContentResolver(),
                    DocumentsContract.buildDocumentUriUsingTree(tree, parentId));
        } catch (Throwable error) {
            Log.w(TAG, "Unable to remove empty Storage folder", error);
        }
    }

    /** Retains the native Library mode callback while Storage is the selected source. */
    @SuppressWarnings("unchecked")
    public static void observeLibraryModeSelection(Object mode, Function1<?, ?> selector) {
        if (!isStorageMode(mode) || selector == null) return;
        observedStorageMode = mode;
        observedStorageModeSelector = (Function1<Object, ?>) selector;
    }

    /** Renders the third enum label before Nuvio's exhaustive two-value Kotlin branch executes. */
    public static boolean renderStorageModeLabel(Object labelLambda, Object composer, Object flags) {
        Enum<?> mode = capturedStorageMode(labelLambda);
        if (mode == null) return false;
        try {
            Class<?> textOwner = Class.forName("p5.a2");
            for (Method method : textOwner.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != Void.TYPE ||
                        parameters.length != 19 || parameters[0] != String.class) continue;
                Object[] arguments = new Object[19];
                arguments[0] = "Storage";
                for (int index = 1; index < arguments.length; index++) {
                    Class<?> parameter = parameters[index];
                    if (parameter == Long.TYPE) arguments[index] = 0L;
                    else if (parameter == Integer.TYPE) arguments[index] = 0;
                    else if (parameter == Boolean.TYPE) arguments[index] = false;
                    else arguments[index] = null;
                }
                arguments[15] = composer;
                arguments[18] = 131070;
                method.setAccessible(true);
                method.invoke(null, arguments);
                return true;
            }
        } catch (Throwable error) {
            Log.e(TAG, "Unable to render the Storage label", error);
        }
        return false;
    }

    private static Enum<?> capturedStorageMode(Object labelLambda) {
        if (labelLambda == null) return null;
        for (Class<?> owner = labelLambda.getClass(); owner != null; owner = owner.getSuperclass()) {
            for (java.lang.reflect.Field field : owner.getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object value = field.get(labelLambda);
                    if (value instanceof Enum && "Storage".equals(((Enum<?>) value).name())) {
                        return (Enum<?>) value;
                    }
                } catch (Throwable error) {
                    Log.e(TAG, "Unable to inspect the library-mode label", error);
                }
            }
        }
        return null;
    }

    public static void observeNavController(Object controller) {
        if (controller != null) {
            navController = controller;
            observeCurrentDestination();
        }
    }

    private static void observeCurrentDestination() {
        Object controller = navController;
        if (controller == null) return;
        try {
            Method current = null;
            for (Class<?> owner = controller.getClass(); owner != null && current == null;
                 owner = owner.getSuperclass()) {
                try { current = owner.getDeclaredMethod("h"); }
                catch (NoSuchMethodException ignored) { }
            }
            if (current == null) return;
            current.setAccessible(true);
            Object destination = current.invoke(controller);
            LocalMediaLibraryUi.observeNavigationDestination(
                    destination == null ? "" : destination.toString());
        } catch (Throwable error) {
            Log.d(TAG, "Unable to inspect the current Nuvio destination", error);
        }
    }

    public static boolean play(LocalMediaFile file) {
        Object controller = navController;
        if (controller == null) {
            toast("Nuvio navigation is not ready");
            return false;
        }
        String route = buildPlayerRoute(file.uri.toString(), file.name, file.size);
        beginLocalPlayback(file.uri.toString());
        try {
            for (Class<?> owner = controller.getClass(); owner != null; owner = owner.getSuperclass()) {
                for (Method method : owner.getDeclaredMethods()) {
                    Class<?>[] parameters = method.getParameterTypes();
                    if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != Void.TYPE ||
                            parameters.length != 4 || parameters[1] != String.class ||
                            parameters[3] != Integer.TYPE ||
                            !parameters[0].isAssignableFrom(controller.getClass())) continue;
                    method.setAccessible(true);
                    method.invoke(null, controller, route, null, 2);
                    return true;
                }
            }
        } catch (Throwable error) {
            Log.e(TAG, "Unable to navigate to the local player route", error);
            cancelPendingLocalPlayback();
            toast("Unable to start local playback");
            return false;
        }
        Log.e(TAG, "Nuvio navigation helper was not found");
        cancelPendingLocalPlayback();
        toast("Unable to start local playback");
        return false;
    }

    /** Observes the full-screen Media3 listener and exits only a rendered local item at EOF. */
    public static void onPlaybackStateChanged(Object listener, int state) {
        Player player = playerFromListener(listener);
        if (player == null) return;
        String currentUri = null;
        try {
            MediaItem item = player.getCurrentMediaItem();
            if (item != null && item.localConfiguration != null) {
                currentUri = item.localConfiguration.uri.toString();
            }
        } catch (Throwable error) {
            Log.e(TAG, "Unable to inspect the active local media item", error);
        }
        if (shouldExitForPlaybackState(player, currentUri, state)) exitLocalPlayer();
    }

    private static synchronized void beginLocalPlayback(String mediaUri) {
        activeLocalMediaUri = mediaUri;
        activeLocalPlayer = new WeakReference<>(null);
        activeLocalPlayerReady = false;
        activeLocalEndHandled = false;
        pendingReturnStorageMode = observedStorageMode;
        pendingReturnStorageModeSelector = observedStorageModeSelector;
    }

    private static synchronized void cancelPendingLocalPlayback() {
        activeLocalMediaUri = null;
        activeLocalPlayer = new WeakReference<>(null);
        activeLocalPlayerReady = false;
        activeLocalEndHandled = false;
        pendingReturnStorageMode = null;
        pendingReturnStorageModeSelector = null;
    }

    static synchronized boolean shouldExitForPlaybackState(
            Object playerToken, String currentUri, int state
    ) {
        if (activeLocalMediaUri == null || currentUri == null ||
                !activeLocalMediaUri.equals(currentUri)) return false;
        Object currentPlayer = activeLocalPlayer.get();
        if (currentPlayer == null) {
            currentPlayer = playerToken;
            activeLocalPlayer = new WeakReference<>(playerToken);
        }
        if (currentPlayer != playerToken) return false;
        if (state == Player.STATE_READY) activeLocalPlayerReady = true;
        if (state != Player.STATE_ENDED || !activeLocalPlayerReady || activeLocalEndHandled) {
            return false;
        }
        activeLocalEndHandled = true;
        activeLocalMediaUri = null;
        return true;
    }

    static synchronized void beginLocalPlaybackForTesting(String mediaUri) {
        beginLocalPlayback(mediaUri);
    }

    private static Player playerFromListener(Object listener) {
        if (listener == null) return null;
        for (Class<?> owner = listener.getClass(); owner != null; owner = owner.getSuperclass()) {
            for (java.lang.reflect.Field field : owner.getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object value = field.get(listener);
                    if (value instanceof Player) return (Player) value;
                } catch (Throwable ignored) {
                    // Only the listener's Player field matters.
                }
            }
        }
        return null;
    }

    @SuppressWarnings("deprecation")
    private static void exitLocalPlayer() {
        Activity activity = MorpheSettingsUi.resumedActivity();
        if (activity == null) {
            Log.e(TAG, "Unable to leave local playback because no activity is resumed");
            return;
        }
        activity.runOnUiThread(() -> {
            restorePendingStorageSelection();
            activity.onBackPressed();
        });
    }

    private static synchronized boolean restorePendingStorageSelection() {
        Object mode = pendingReturnStorageMode;
        Function1<Object, ?> selector = pendingReturnStorageModeSelector;
        pendingReturnStorageMode = null;
        pendingReturnStorageModeSelector = null;
        if (!isStorageMode(mode) || selector == null) return false;
        try {
            selector.invoke(mode);
            return true;
        } catch (Throwable error) {
            Log.e(TAG, "Unable to restore the Storage library selection", error);
            return false;
        }
    }

    static synchronized boolean restorePendingStorageSelectionForTesting() {
        return restorePendingStorageSelection();
    }

    public static String buildPlayerRoute(String streamUrl, String filename, long videoSize) {
        String title = stripExtension(filename);
        String localId = "local:" + Integer.toHexString(streamUrl.hashCode());
        return "player/" + encode(streamUrl) + "/" + encode(title) +
                "?streamName=" + encode("Local Storage") +
                // Local files have no catalogue detail identity. The patch's full-screen
                // playback-state hook returns an ended local item to the existing Storage entry.
                "&year=&headers=&contentId=" +
                "&contentType=movie&contentName=" + encode(title) +
                "&poster=&backdrop=&logo=&videoId=" + encode(localId) +
                "&season=&episode=&episodeTitle=&bingeGroup=&autoPlayNav=false" +
                "&returnToDetailOnBack=false&returnToHomeOnBack=false" +
                "&filename=" + encode(filename) + "&videoHash=&videoSize=" + Math.max(0L, videoSize) +
                "&startFromBeginning=false&addonName=&addonLogo=&streamDescription=" +
                "&infoHash=&fileIdx=&sources=&contentLanguage=&launchStartedAtMs=" +
                SystemClock.elapsedRealtime();
    }

    /** Adds same-basename sidecars to the list already assembled by Nuvio. */
    public static List<MediaItem.SubtitleConfiguration> attachSidecarSubtitles(
            Context context,
            String mediaUrl,
            List<MediaItem.SubtitleConfiguration> existing
    ) {
        if (!isEnabled() || mediaUrl == null || mediaUrl.isEmpty()) return existing;
        List<LocalSubtitle> sidecars = Collections.emptyList();
        try {
            Uri mediaUri = Uri.parse(mediaUrl);
            if ("content".equalsIgnoreCase(mediaUri.getScheme()) ||
                    "file".equalsIgnoreCase(mediaUri.getScheme())) {
                for (LocalMediaFile file : scan(context).files) {
                    if (file.uri.toString().equals(mediaUrl)) {
                        sidecars = file.subtitles;
                        break;
                    }
                }
            }
            if (sidecars.isEmpty()) return existing;

            List<MediaItem.SubtitleConfiguration> result = existing == null
                    ? new ArrayList<>() : new ArrayList<>(existing);
            Set<String> attachedUris = new HashSet<>();
            for (MediaItem.SubtitleConfiguration configuration : result) {
                attachedUris.add(configuration.uri.toString());
            }
            for (LocalSubtitle subtitle : sidecars) {
                if (!attachedUris.add(subtitle.uri.toString())) continue;
                result.add(new MediaItem.SubtitleConfiguration.Builder(subtitle.uri)
                        .setMimeType(subtitleMimeType(subtitle.name))
                        .setLabel(subtitle.name)
                        .build());
            }
            return result;
        } catch (Throwable error) {
            Log.e(TAG, "Unable to attach local subtitle sidecars", error);
            return existing;
        }
    }

    public static LibrarySnapshot scan(Context context) {
        String persistedTree = treeUriString();
        if (persistedTree == null || persistedTree.isEmpty()) {
            if (!hasDefaultFolderAccess(context)) {
                return new LibrarySnapshot(false, DEFAULT_FOLDER_LABEL, Collections.emptyList(), null);
            }
            return scanDefaultFolder();
        }

        Uri storedLocation = Uri.parse(persistedTree);
        if ("file".equals(storedLocation.getScheme())) {
            try {
                File folder = new File(storedLocation.getPath());
                if (!LocalMediaInternalFolderPickerActivity.isAllowedFolder(folder)) {
                    return new LibrarySnapshot(true, folderDisplayLabel(), Collections.emptyList(),
                            "The selected folder could not be read");
                }
                List<ScanBucket> buckets = new ArrayList<>();
                scanFileChildren(folder, "", null, null, buckets);
                return buildSnapshot(true, folderDisplayLabel(), buckets, null);
            } catch (Throwable error) {
                Log.e(TAG, "Unable to scan the selected local media folder", error);
                return new LibrarySnapshot(true, folderDisplayLabel(), Collections.emptyList(),
                        "The selected folder could not be scanned");
            }
        }

        Uri treeUri;
        try {
            treeUri = Uri.parse(persistedTree);
            String treeId = DocumentsContract.getTreeDocumentId(treeUri);
            List<ScanBucket> buckets = new ArrayList<>();
            scanSafChildren(context, treeUri, treeId, "", null, null,
                    buckets, new HashSet<>());
            return buildSnapshot(true, folderDisplayLabel(), buckets, null);
        } catch (Throwable error) {
            Log.e(TAG, "Unable to scan local media tree", error);
            return new LibrarySnapshot(true, folderDisplayLabel(), Collections.emptyList(),
                    "Folder access is no longer available; choose the folder again");
        }
    }

    private static LibrarySnapshot scanDefaultFolder() {
        try {
            File folder = defaultFolder();
            if (!ensureDirectory(folder)) {
                return new LibrarySnapshot(true, DEFAULT_FOLDER_LABEL, Collections.emptyList(),
                        "The default Movies/Nuvio folder could not be created");
            }
            List<ScanBucket> buckets = new ArrayList<>();
            scanFileChildren(folder, "", null, null, buckets);
            return buildSnapshot(true, DEFAULT_FOLDER_LABEL, buckets, null);
        } catch (Throwable error) {
            Log.e(TAG, "Unable to scan the default local media folder", error);
            return new LibrarySnapshot(true, DEFAULT_FOLDER_LABEL, Collections.emptyList(),
                    "The default Movies/Nuvio folder could not be read");
        }
    }

    private static void scanSafChildren(
            Context context,
            Uri treeUri,
            String parentDocumentId,
            String relativeParent,
            String rootFolder,
            Uri rootFolderUri,
            List<ScanBucket> buckets,
            Set<String> visited
    ) {
        if (!visited.add(parentDocumentId)) return;
        Uri childrenUri = DocumentsContract.buildChildDocumentsUriUsingTree(treeUri, parentDocumentId);
        String[] projection = {
                DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_MIME_TYPE,
                DocumentsContract.Document.COLUMN_SIZE,
                DocumentsContract.Document.COLUMN_LAST_MODIFIED
        };
        try (Cursor cursor = context.getContentResolver().query(childrenUri, projection, null, null, null)) {
            if (cursor == null) return;
            while (cursor.moveToNext()) {
                String documentId = cursor.getString(0);
                String name = cursor.getString(1);
                String mimeType = cursor.getString(2);
                if (documentId == null || name == null) continue;
                String relativePath = relativeParent.isEmpty() ? name : relativeParent + "/" + name;
                if (DocumentsContract.Document.MIME_TYPE_DIR.equals(mimeType)) {
                    String directRoot = rootFolder == null ? name : rootFolder;
                    Uri directRootUri = rootFolderUri == null
                            ? DocumentsContract.buildDocumentUriUsingTree(treeUri, documentId)
                            : rootFolderUri;
                    scanSafChildren(context, treeUri, documentId, relativePath, directRoot,
                            directRootUri, buckets, visited);
                    continue;
                }
                String extension = extensionOf(name);
                if (!VIDEO_EXTENSIONS.contains(extension) && !SUBTITLE_EXTENSIONS.contains(extension)) continue;
                Uri documentUri = DocumentsContract.buildDocumentUriUsingTree(treeUri, documentId);
                buckets.add(new ScanBucket(
                        new RawDocument(documentUri, name,
                                cursor.isNull(3) ? 0L : cursor.getLong(3),
                                cursor.isNull(4) ? 0L : cursor.getLong(4), relativeParent,
                                relativePath, rootFolderUri),
                        rootFolder,
                        VIDEO_EXTENSIONS.contains(extension)
                ));
            }
        }
    }

    private static void scanFileChildren(
            File parent,
            String relativeParent,
            String rootFolder,
            Uri rootFolderUri,
            List<ScanBucket> buckets
    ) {
        File[] children = parent.listFiles();
        if (children == null) return;
        for (File child : children) {
            String name = child.getName();
            String relativePath = relativeParent.isEmpty() ? name : relativeParent + "/" + name;
            if (child.isDirectory()) {
                scanFileChildren(child, relativePath, rootFolder == null ? name : rootFolder,
                        rootFolderUri == null ? Uri.fromFile(child) : rootFolderUri, buckets);
                continue;
            }
            if (!child.isFile()) continue;
            String extension = extensionOf(name);
            if (!VIDEO_EXTENSIONS.contains(extension) && !SUBTITLE_EXTENSIONS.contains(extension)) continue;
            buckets.add(new ScanBucket(
                    new RawDocument(Uri.fromFile(child), name, child.length(), child.lastModified(),
                            relativeParent, relativePath, rootFolderUri),
                    rootFolder,
                    VIDEO_EXTENSIONS.contains(extension)
            ));
        }
    }

    private static LibrarySnapshot buildSnapshot(
            boolean hasFolderAccess,
            String folderLabel,
            List<ScanBucket> buckets,
            String error
    ) {
        List<RawDocument> allVideos = new ArrayList<>();
        List<RawDocument> allSubtitles = new ArrayList<>();
        for (ScanBucket bucket : buckets) {
            (bucket.video ? allVideos : allSubtitles).add(bucket.document);
        }
        List<LocalMediaFile> files = matchSidecars(allVideos, allSubtitles);
        files.sort(Comparator.comparing(file -> file.relativePath.toLowerCase(Locale.ROOT)));

        List<LocalMediaEntry> entries = new ArrayList<>();
        for (LocalMediaFile file : files) {
            if (file.relativePath.indexOf('/') < 0) {
                entries.add(LocalMediaEntry.file(file));
            }
        }
        Set<String> rootFolders = new HashSet<>();
        for (ScanBucket bucket : buckets) {
            if (bucket.video && bucket.rootFolder != null) rootFolders.add(bucket.rootFolder);
        }
        List<String> sortedFolders = new ArrayList<>(rootFolders);
        sortedFolders.sort(String.CASE_INSENSITIVE_ORDER);
        List<LocalMediaEntry> folderEntries = new ArrayList<>();
        for (String folder : sortedFolders) {
            List<LocalMediaFile> folderFiles = new ArrayList<>();
            String prefix = folder + "/";
            for (LocalMediaFile file : files) {
                if (file.relativePath.startsWith(prefix)) folderFiles.add(file);
            }
            if (!folderFiles.isEmpty()) folderEntries.add(LocalMediaEntry.folder(folder, folderFiles));
        }
        entries.sort(Comparator.comparing(entry -> entry.name.toLowerCase(Locale.ROOT)));
        folderEntries.addAll(entries);
        return new LibrarySnapshot(hasFolderAccess, folderLabel, files, folderEntries, error);
    }

    static List<LocalMediaFile> matchSidecars(List<RawDocument> videos, List<RawDocument> subtitles) {
        List<LocalMediaFile> files = new ArrayList<>();
        for (RawDocument video : videos) {
            String videoBase = stripExtension(video.name);
            List<LocalSubtitle> matching = new ArrayList<>();
            for (RawDocument subtitle : subtitles) {
                if (video.parentPath.equals(subtitle.parentPath) &&
                        isVideoSidecar(videoBase, stripExtension(subtitle.name))) {
                    matching.add(new LocalSubtitle(subtitle.uri, subtitle.name));
                }
            }
            matching.sort(Comparator.comparing(item -> item.name.toLowerCase(Locale.ROOT)));
            files.add(new LocalMediaFile(video.uri, video.name, video.relativePath,
                    video.size, video.lastModified, video.rootFolderUri, matching));
        }
        return files;
    }

    /** Accepts Movie.srt plus language/collision sidecars such as Movie.en.2.srt. */
    static boolean isVideoSidecar(String videoBase, String subtitleBase) {
        if (videoBase == null || subtitleBase == null) return false;
        if (videoBase.equalsIgnoreCase(subtitleBase)) return true;
        if (subtitleBase.length() <= videoBase.length() + 1 ||
                !subtitleBase.regionMatches(true, 0, videoBase + ".", 0, videoBase.length() + 1)) {
            return false;
        }
        String suffix = subtitleBase.substring(videoBase.length() + 1);
        return suffix.length() <= 32 && suffix.matches("(?i)[a-z0-9_-]+(?:\\.[a-z0-9_-]+){0,2}");
    }

    public static boolean isSupportedVideoName(String name) {
        return VIDEO_EXTENSIONS.contains(extensionOf(name));
    }

    public static boolean isSupportedSubtitleName(String name) {
        return SUBTITLE_EXTENSIONS.contains(extensionOf(name));
    }

    private static SharedPreferences preferences() {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null) throw new IllegalStateException("Morphe settings were not initialized");
        return context.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    private static String encode(String value) {
        return URLEncoder.encode(value, StandardCharsets.UTF_8).replace("+", "%20");
    }

    private static String extensionOf(String name) {
        if (name == null) return "";
        int separator = name.lastIndexOf('.');
        return separator < 0 || separator == name.length() - 1
                ? "" : name.substring(separator + 1).toLowerCase(Locale.ROOT);
    }

    private static String stripExtension(String name) {
        if (name == null) return "";
        int separator = name.lastIndexOf('.');
        return separator <= 0 ? name : name.substring(0, separator);
    }

    private static String subtitleMimeType(String name) {
        switch (extensionOf(name)) {
            case "srt": return MimeTypes.APPLICATION_SUBRIP;
            case "vtt": return MimeTypes.TEXT_VTT;
            case "ass":
            case "ssa": return MimeTypes.TEXT_SSA;
            case "ttml":
            case "dfxp": return MimeTypes.APPLICATION_TTML;
            default: return MimeTypes.APPLICATION_SUBRIP;
        }
    }

    private static Set<String> extensionSet(String... values) {
        Set<String> result = new HashSet<>();
        Collections.addAll(result, values);
        return Collections.unmodifiableSet(result);
    }

    private static void toast(String message) {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context != null) Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
    }

    static final class RawDocument {
        final Uri uri;
        final String name;
        final long size;
        final long lastModified;
        final String parentPath;
        final String relativePath;
        final Uri rootFolderUri;

        RawDocument(Uri uri, String name, long size, long lastModified) {
            this(uri, name, size, lastModified, "", name, null);
        }

        RawDocument(
                Uri uri,
                String name,
                long size,
                long lastModified,
                String parentPath,
                String relativePath,
                Uri rootFolderUri
        ) {
            this.uri = uri;
            this.name = name;
            this.size = size;
            this.lastModified = lastModified;
            this.parentPath = parentPath == null ? "" : parentPath;
            this.relativePath = relativePath == null ? name : relativePath;
            this.rootFolderUri = rootFolderUri;
        }
    }

    private static final class ScanBucket {
        final RawDocument document;
        final String rootFolder;
        final boolean video;

        ScanBucket(RawDocument document, String rootFolder, boolean video) {
            this.document = document;
            this.rootFolder = rootFolder;
            this.video = video;
        }
    }

    public static final class LocalSubtitle {
        public final Uri uri;
        public final String name;

        LocalSubtitle(Uri uri, String name) {
            this.uri = uri;
            this.name = name;
        }
    }

    public static final class LocalMediaFile {
        public final Uri uri;
        public final String name;
        public final String relativePath;
        public final long size;
        public final long lastModified;
        public final Uri rootFolderUri;
        public final List<LocalSubtitle> subtitles;

        LocalMediaFile(Uri uri, String name, long size, long lastModified, List<LocalSubtitle> subtitles) {
            this(uri, name, name, size, lastModified, null, subtitles);
        }

        LocalMediaFile(
                Uri uri,
                String name,
                String relativePath,
                long size,
                long lastModified,
                List<LocalSubtitle> subtitles
        ) {
            this(uri, name, relativePath, size, lastModified,
                    rootFolderUri(topLevelFolder(relativePath)), subtitles);
        }

        LocalMediaFile(
                Uri uri,
                String name,
                String relativePath,
                long size,
                long lastModified,
                Uri rootFolderUri,
                List<LocalSubtitle> subtitles
        ) {
            this.uri = uri;
            this.name = name;
            this.relativePath = relativePath;
            this.size = size;
            this.lastModified = lastModified;
            this.rootFolderUri = rootFolderUri;
            this.subtitles = Collections.unmodifiableList(new ArrayList<>(subtitles));
        }
    }

    public static final class LocalMediaEntry {
        public final String key;
        public final String name;
        public final boolean folder;
        public final Uri folderUri;
        public final List<LocalMediaFile> files;

        private LocalMediaEntry(
                String key, String name, boolean folder, Uri folderUri, List<LocalMediaFile> files
        ) {
            this.key = key;
            this.name = name;
            this.folder = folder;
            this.folderUri = folderUri;
            this.files = Collections.unmodifiableList(new ArrayList<>(files));
        }

        static LocalMediaEntry file(LocalMediaFile file) {
            return new LocalMediaEntry(file.uri.toString(), file.name, false, null,
                    Collections.singletonList(file));
        }

        static LocalMediaEntry folder(String name, List<LocalMediaFile> files) {
            Uri folderUri = files.isEmpty() ? rootFolderUri(name) : files.get(0).rootFolderUri;
            String key = folderUri == null ? "folder:" + name : folderUri.toString();
            return new LocalMediaEntry(key, name, true, folderUri, files);
        }
    }

    static final class PendingDelete {
        final boolean folder;
        final LocalMediaEntry entry;
        final LocalMediaFile file;
        final String name;
        final boolean openedDuringSelectHold;

        private PendingDelete(boolean folder, LocalMediaEntry entry, LocalMediaFile file, String name,
                              boolean openedDuringSelectHold) {
            this.folder = folder;
            this.entry = entry;
            this.file = file;
            this.name = name;
            this.openedDuringSelectHold = openedDuringSelectHold;
        }

        static PendingDelete folder(LocalMediaEntry entry, boolean openedDuringSelectHold) {
            return new PendingDelete(true, entry, null, entry.name, openedDuringSelectHold);
        }

        static PendingDelete file(LocalMediaFile file, boolean openedDuringSelectHold) {
            return new PendingDelete(false, null, file, file.name, openedDuringSelectHold);
        }
    }

    static final class DeleteResult {
        final boolean targetDeleted;
        final boolean complete;
        final String message;

        DeleteResult(boolean targetDeleted, boolean complete, String message) {
            this.targetDeleted = targetDeleted;
            this.complete = complete;
            this.message = message;
        }

        static DeleteResult success(String message) { return new DeleteResult(true, true, message); }
        static DeleteResult failure(String message) { return new DeleteResult(false, false, message); }
    }

    public static final class LibrarySnapshot {
        public final boolean hasFolderAccess;
        public final String folderLabel;
        public final List<LocalMediaFile> files;
        public final List<LocalMediaEntry> entries;
        public final String error;

        LibrarySnapshot(boolean hasFolderAccess, String folderLabel, List<LocalMediaFile> files, String error) {
            this(hasFolderAccess, folderLabel, files, directFileEntries(files), error);
        }

        LibrarySnapshot(
                boolean hasFolderAccess,
                String folderLabel,
                List<LocalMediaFile> files,
                List<LocalMediaEntry> entries,
                String error
        ) {
            this.hasFolderAccess = hasFolderAccess;
            this.folderLabel = folderLabel;
            this.files = Collections.unmodifiableList(new ArrayList<>(files));
            this.entries = Collections.unmodifiableList(new ArrayList<>(entries));
            this.error = error;
        }

        private static List<LocalMediaEntry> directFileEntries(List<LocalMediaFile> files) {
            List<LocalMediaEntry> entries = new ArrayList<>();
            for (LocalMediaFile file : files) entries.add(LocalMediaEntry.file(file));
            return entries;
        }
    }
}
