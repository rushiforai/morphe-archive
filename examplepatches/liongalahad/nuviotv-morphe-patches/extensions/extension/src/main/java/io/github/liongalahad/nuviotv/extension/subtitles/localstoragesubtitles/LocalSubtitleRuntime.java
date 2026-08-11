package io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.JSONArray;
import org.json.JSONObject;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/** Device-local subtitle storage and UI bridges for Nuvio's Media3 player. */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class LocalSubtitleRuntime {
    static final String LOCAL_LANGUAGE_KEY = "!local";
    static final String LOCAL_SOURCE_LABEL = "Local";
    static final String PICKER_CONTENT_KEY_EXTRA =
            "io.github.liongalahad.nuviotv.localstoragesubtitles.CONTENT_KEY";
    static final int MAX_IMPORT_BYTES = 10 * 1024 * 1024;
    private static final String PREFERENCES_NAME = "morphe_patches";
    private static final String IMPORTS_PREFERENCE = "local_storage_subtitles.imports";
    private static final String SELECTIONS_PREFERENCE = "local_storage_subtitles.selections";
    private static final String ENABLED_PREFERENCE = "local_storage_subtitles.enabled";
    private static final long RETENTION_MILLIS = 7L * 24L * 60L * 60L * 1000L;
    private static final int LANGUAGE_SAMPLE_BYTES = 64 * 1024;
    private static final long PICKER_RETURN_DELAY_MILLIS = 650L;
    private static final String UNKNOWN_LANGUAGE = "und";
    private static final Pattern XML_LANGUAGE = Pattern.compile(
            "(?i)\\bxml:lang\\s*=\\s*[\"']([a-z]{2,3}(?:-[a-z0-9]{2,8})?)[\"']"
    );
    private static final Pattern DECLARED_LANGUAGE = Pattern.compile(
            "(?im)^\\s*(?:language|lang)\\s*[:=]\\s*([a-z]{2,3}(?:-[a-z0-9]{2,8})?)\\s*$"
    );
    private static final Pattern FILE_TOKEN = Pattern.compile("(?i)(?:^|[._ \\-\\[(])([a-z]{2,3}(?:-[a-z0-9]{2,8})?)(?=$|[._ \\-\\])])");
    private static final List<ImportedSubtitle> IMPORTED = new ArrayList<>();
    private static final Map<String, String> SELECTED_BY_CONTENT = new LinkedHashMap<>();
    private static final Map<String, String> LANGUAGE_CODES = buildLanguageCodes();

    private static volatile Context applicationContext;
    private static volatile WeakReference<Activity> resumedActivity = new WeakReference<>(null);
    private static volatile WeakReference<Object> activeController = new WeakReference<>(null);
    private static volatile WeakReference<Function1<Object, Unit>> selectionDelegate =
            new WeakReference<>(null);
    private static volatile Handler mainHandler;
    private static volatile Runnable pendingPickerSelection;
    private static volatile boolean mpvActive;
    private static volatile boolean featureEnabled = true;
    private static volatile boolean importedSelectionActive;
    private static volatile boolean sessionAddonListRefreshPending;
    private static volatile boolean suppressNextTransientDismiss;
    private static volatile String activeContentKey;
    private static volatile String activeImportedUrl;
    private static volatile WeakReference<Object> restoredController = new WeakReference<>(null);
    private static volatile String restoredContentKey;
    private static volatile String restoredImportedUrl;
    private static volatile Constructor<?> subtitleConstructor;

    private LocalSubtitleRuntime() {}

    static void initialize(Context context) {
        applicationContext = context.getApplicationContext();
        SharedPreferences preferences = preferences();
        featureEnabled = preferences == null || readFeatureEnabled(preferences);
        loadPersistentState();
    }

    static void onActivityResumed(Activity activity) {
        resumedActivity = new WeakReference<>(activity);
    }

    static void onActivityPaused(Activity activity) {
        if (resumedActivity.get() == activity) resumedActivity = new WeakReference<>(null);
    }

    /** A new runtime controller denotes a new playback session, not a new import lifetime. */
    public static synchronized void observeController(Object controller) {
        Object previous = activeController.get();
        if (previous != null && previous != controller) {
            importedSelectionActive = false;
            suppressNextTransientDismiss = false;
            activeImportedUrl = null;
            activeContentKey = null;
            resetRestoreGate();
        }
        activeController = new WeakReference<>(controller);
    }

    public static synchronized void observeContentIdentity(
            String contentId, Integer season, Integer episode
    ) {
        String key = contentKey(contentId, season, episode);
        if (!key.equals(activeContentKey)) {
            importedSelectionActive = false;
            suppressNextTransientDismiss = false;
            activeImportedUrl = null;
            activeContentKey = key;
        }
        claimLegacyImportForContent(key);
    }

    public static void setMpvActive(boolean active) {
        mpvActive = active;
    }

    /** Adds the Local Storage pseudo-language and device imports to Nuvio's snapshot input. */
    public static List mergeSubtitles(List original) {
        LocalSubtitleRefreshState.observeForCompose();
        if (mpvActive || !featureEnabled) return original;
        ArrayList<Object> merged = new ArrayList<>();
        if (original != null) {
            for (Object subtitle : original) {
                // The overlay can feed the result of a previous composition back into this
                // boundary. Remove every row owned by this patch before rebuilding the local
                // section so cursor movement cannot grow the list or its language count.
                if (!isLocalSubtitle(subtitle)) merged.add(subtitle);
            }
        }
        Object action = createSubtitle(LOCAL_LANGUAGE_KEY, "", LOCAL_LANGUAGE_KEY, LOCAL_SOURCE_LABEL, null);
        if (action != null) merged.add(action);
        synchronized (LocalSubtitleRuntime.class) {
            for (ImportedSubtitle imported : IMPORTED) {
                if (!belongsToContent(imported, activeContentKey)) continue;
                Object subtitle = createImportedSubtitle(imported);
                if (subtitle != null) merged.add(subtitle);
            }
        }
        return merged;
    }

    /** Keeps Nuvio's subtitle overlay alive while the system picker is shown. */
    public static Function1<Object, Unit> wrapSelection(
            Function1<Object, Unit> delegate,
            Function0<Unit> ignoredDisable,
            Function1<Object, Unit> ignoredEvent,
            Function0<Unit> dismiss
    ) {
        selectionDelegate = new WeakReference<>(delegate);
        return subtitle -> {
            if (isPickerAction(subtitle)) {
                launchPicker();
            } else {
                cancelPendingPickerSelection();
                delegate.invoke(subtitle);
            }
            return Unit.INSTANCE;
        };
    }

    public static boolean isImportedSubtitle(Object subtitle) {
        return isLocalSubtitle(subtitle) && !isPickerAction(subtitle);
    }

    public static boolean rejectImportedSubtitleForMpv(Object subtitle) {
        boolean imported = isImportedSubtitle(subtitle);
        if (!imported) {
            // Nuvio's track-preference reconciler can try to restore its stale addon choice
            // while the freshly attached local track is still settling. User selections pass
            // through rememberImportedSelection first, which clears this guard explicitly.
            return importedSelectionActive;
        }
        importedSelectionActive = featureEnabled && !mpvActive;
        activeImportedUrl = importedSelectionActive ? subtitleString(subtitle, "getUrl") : null;
        ImportedSubtitle stored = importedByUrl(activeImportedUrl);
        if (importedSelectionActive && !belongsToContent(stored, activeContentKey)) {
            importedSelectionActive = false;
            activeImportedUrl = null;
            showMessage("This local subtitle belongs to a different video");
            return true;
        }
        if (featureEnabled && !mpvActive) return false;
        showMessage(featureEnabled
                ? "Local Storage subtitles are available with ExoPlayer only"
                : "Enable local subtitle importing in Morphe settings");
        return true;
    }

    /** Supplies Nuvio's buffer-preserving sidecar path with a patch-owned private file. */
    public static synchronized String localSubtitleText(String url) {
        if (!featureEnabled || mpvActive || !importedSelectionActive || url == null ||
                !url.equals(activeImportedUrl)) return null;
        ImportedSubtitle imported = importedByUrl(url);
        if (imported == null || !belongsToContent(imported, activeContentKey)) return null;
        File file = imported.storedFile;
        if (!file.isFile()) throw new IllegalStateException("The imported subtitle file is unavailable");
        long length = file.length();
        if (length <= 0L || length > MAX_IMPORT_BYTES) {
            throw new IllegalStateException("The imported subtitle file is invalid");
        }
        try (FileInputStream input = new FileInputStream(file);
             ByteArrayOutputStream output = new ByteArrayOutputStream((int) length)) {
            byte[] buffer = new byte[8192];
            int total = 0;
            while (true) {
                int read = input.read(buffer);
                if (read < 0) break;
                total += read;
                if (total > MAX_IMPORT_BYTES) {
                    throw new IllegalStateException("The imported subtitle file exceeds 10 MB");
                }
                output.write(buffer, 0, read);
            }
            if (total == 0) throw new IllegalStateException("The imported subtitle file is empty");
            return decodeSubtitleText(output.toByteArray());
        } catch (IllegalStateException error) {
            throw error;
        } catch (Throwable error) {
            throw new IllegalStateException("Unable to read the imported subtitle file", error);
        }
    }

    /** Stores a local choice in patch-private state and bypasses Nuvio's own preference. */
    public static synchronized boolean rememberImportedSelection(
            String contentId, Integer season, Integer episode, Object subtitle
    ) {
        if (!isImportedSubtitle(subtitle)) {
            // This method is Nuvio's user-choice boundary. An explicit ordinary addon choice
            // releases the local-selection guard and removes the patch-private preference.
            // Automatic restore calls bypass this boundary and remain blocked while local is active.
            clearImportedSelection(contentId, season, episode);
            return false;
        }
        if (!featureEnabled) return true;
        String key = contentKey(contentId, season, episode);
        String url = subtitleString(subtitle, "getUrl");
        if (url == null || url.trim().isEmpty()) return false;
        ImportedSubtitle imported = importedByUrl(url);
        if (imported == null) return false;
        if (!hasOwner(imported)) {
            imported.ownerContentKey = key;
        } else if (!belongsToContent(imported, key)) {
            importedSelectionActive = false;
            activeImportedUrl = null;
            return true;
        }
        boolean newlyActive = !importedSelectionActive || !url.equals(activeImportedUrl);
        SELECTED_BY_CONTENT.put(key, url);
        imported.lastUsedAt = System.currentTimeMillis();
        activeContentKey = key;
        activeImportedUrl = url;
        importedSelectionActive = true;
        suppressNextTransientDismiss = newlyActive;
        persistImports();
        persistSelections();
        return true;
    }

    public static synchronized void clearImportedSelection(
            String contentId, Integer season, Integer episode
    ) {
        String key = contentKey(contentId, season, episode);
        SELECTED_BY_CONTENT.remove(key);
        if (key.equals(activeContentKey)) {
            importedSelectionActive = false;
            suppressNextTransientDismiss = false;
            activeImportedUrl = null;
        }
        persistSelections();
    }

    public static void clearImportedSelection() {
        importedSelectionActive = false;
        suppressNextTransientDismiss = false;
        activeImportedUrl = null;
    }

    /** Returns the saved local choice for this title/episode so ExoPlayer can attach it again. */
    public static synchronized Object restoredSubtitle(
            Object controller, String contentId, Integer season, Integer episode
    ) {
        if (!featureEnabled) return null;
        observeController(controller);
        String key = contentKey(contentId, season, episode);
        String selectedUrl = SELECTED_BY_CONTENT.get(key);
        if (selectedUrl == null) return null;
        ImportedSubtitle imported = importedByUrl(selectedUrl);
        if (imported == null || !imported.storedFile.isFile()) {
            SELECTED_BY_CONTENT.remove(key);
            persistSelections();
            return null;
        }
        if (!hasOwner(imported)) {
            imported.ownerContentKey = key;
            persistImports();
        } else if (!belongsToContent(imported, key)) {
            SELECTED_BY_CONTENT.remove(key);
            persistSelections();
            return null;
        }
        if (importedSelectionActive && key.equals(activeContentKey) &&
                selectedUrl.equals(activeImportedUrl)) {
            // A user selection already activated this sidecar. A later track update must not
            // select the same private file again or let Nuvio's stale preference replace it.
            restoredController = new WeakReference<>(controller);
            restoredContentKey = key;
            restoredImportedUrl = selectedUrl;
            return null;
        }
        boolean alreadyHandled = restoredController.get() == controller &&
                key.equals(restoredContentKey) && selectedUrl.equals(restoredImportedUrl);
        if (alreadyHandled) {
            activeContentKey = key;
            activeImportedUrl = selectedUrl;
            importedSelectionActive = true;
            return null;
        }

        // Mark the restore before calling Nuvio's selection method. Track updates may revisit
        // preference restoration; this single-shot gate prevents repeated sidecar selection.
        restoredController = new WeakReference<>(controller);
        restoredContentKey = key;
        restoredImportedUrl = selectedUrl;
        activeContentKey = key;
        activeImportedUrl = selectedUrl;
        importedSelectionActive = true;
        imported.lastUsedAt = System.currentTimeMillis();
        persistImports();
        return createImportedSubtitle(imported);
    }

    /** Ignores only the picker-return transient dismissal after a new local selection. */
    public static synchronized boolean shouldSuppressTransientDismiss(Object event) {
        if (!suppressNextTransientDismiss || event == null ||
                !"OnDismissTransientOverlay".equals(event.toString())) return false;
        suppressNextTransientDismiss = false;
        return true;
    }

    static boolean importedSelectionActiveForTesting() {
        return importedSelectionActive;
    }

    static synchronized void setImportStateForTesting(
            ImportedSubtitle imported, String contentKey
    ) {
        IMPORTED.clear();
        SELECTED_BY_CONTENT.clear();
        if (imported != null) IMPORTED.add(imported);
        activeContentKey = contentKey;
        activeImportedUrl = null;
        importedSelectionActive = false;
        mpvActive = false;
        featureEnabled = true;
        activeController = new WeakReference<>(null);
        resetRestoreGate();
    }

    /** Blocks only Nuvio's stale subtitle action while still allowing track reconciliation to finish. */
    public static boolean shouldBlockNuvioSubtitleSelection() {
        return importedSelectionActive;
    }

    public static String rewriteLanguageLabel(String label, String key) {
        return LOCAL_LANGUAGE_KEY.equals(key) ? "Local Storage" : label;
    }

    public static int adjustLanguageCount(String key, int count) {
        return LOCAL_LANGUAGE_KEY.equals(key) ? Math.max(0, count - 1) : count;
    }

    /** Keeps Nuvio's fixed None row first and places Local Storage before every real language. */
    public static List prioritizeLanguageRail(List original) {
        if (original == null || original.size() < 2) return original;
        Object local = null;
        for (Object item : original) {
            if (LOCAL_LANGUAGE_KEY.equals(railItemKey(item))) {
                local = item;
                break;
            }
        }
        if (local == null || original.get(1) == local) return original;
        ArrayList<Object> reordered = new ArrayList<>(original.size());
        reordered.add(original.get(0));
        reordered.add(local);
        for (int index = 1; index < original.size(); index++) {
            Object item = original.get(index);
            if (item != local) reordered.add(item);
        }
        return reordered;
    }

    public static String rewriteOptionTitle(String title, Object subtitle) {
        if (!isLocalSubtitle(subtitle)) return title;
        if (isPickerAction(subtitle)) return "Choose subtitle file";
        String id = subtitleString(subtitle, "getId");
        String language = languageFromId(id);
        String display = displayLanguage(language);
        return title != null && title.trim().toUpperCase(Locale.ROOT).endsWith(" SDH")
                ? display + " SDH"
                : display;
    }

    public static String rewriteOptionMeta(String meta, Object subtitle) {
        if (!isLocalSubtitle(subtitle)) return meta;
        // Nuvio still calls isBlank() on this register before converting it to a nullable row label.
        if (isPickerAction(subtitle)) return "";
        return filenameFromId(subtitleString(subtitle, "getId"));
    }

    /** The picker launcher is an action, so it must never render a selected tick. */
    public static boolean selectableOptionState(boolean selected, Object subtitle) {
        if (isPickerAction(subtitle)) return false;
        if (isImportedSubtitle(subtitle)) {
            String url = subtitleString(subtitle, "getUrl");
            return importedSelectionActive
                    ? url != null && url.equals(activeImportedUrl)
                    : selected;
        }
        return importedSelectionActive ? false : selected;
    }

    private static void resetRestoreGate() {
        restoredController = new WeakReference<>(null);
        restoredContentKey = null;
        restoredImportedUrl = null;
    }

    /** Nuvio's option-focus restore can retain a stale requester after a Media3 refresh. */
    public static boolean preferLanguageRailFocus(String selectedLanguage) {
        return LOCAL_LANGUAGE_KEY.equals(selectedLanguage);
    }

    /** Invalidates only Nuvio's remembered session copy of addon subtitles after an import. */
    public static synchronized boolean refreshSessionAddonList(boolean visibleChanged) {
        if (!sessionAddonListRefreshPending) return visibleChanged;
        sessionAddonListRefreshPending = false;
        return true;
    }

    public static boolean isFeatureEnabled() {
        return featureEnabled;
    }

    public static synchronized boolean toggleFeatureEnabled() {
        featureEnabled = !featureEnabled;
        SharedPreferences preferences = preferences();
        if (preferences == null) throw new IllegalStateException("Local subtitle settings are unavailable");
        preferences.edit().putBoolean(ENABLED_PREFERENCE, featureEnabled).commit();
        if (!featureEnabled) {
            importedSelectionActive = false;
            activeImportedUrl = null;
            suppressNextTransientDismiss = false;
            cancelPendingPickerSelection();
        }
        return featureEnabled;
    }

    public static String playbackLanguage(String language, Object subtitle) {
        if (!isImportedSubtitle(subtitle)) return language;
        return languageFromId(subtitleString(subtitle, "getId"));
    }

    static synchronized ImportedSubtitle importFile(
            Context context, Uri source, String displayName, String ownerContentKey
    ) throws Exception {
        if (ownerContentKey == null || ownerContentKey.trim().isEmpty()) {
            throw new IllegalStateException("Playback identity is unavailable; reopen the subtitle menu and try again");
        }
        String extension = extensionOf(displayName);
        if (!isSupportedExtension(extension)) {
            throw new IllegalArgumentException("Choose an SRT, VTT, ASS, SSA, TTML or DFXP subtitle file");
        }
        File directory = storageDirectory(context);
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new IllegalStateException("Unable to create local subtitle storage");
        }
        String safeName = sanitizeFilename(displayName);
        File target = new File(directory, UUID.randomUUID() + "-" + safeName);
        byte[] sample;
        int total = 0;
        try (InputStream input = context.getContentResolver().openInputStream(source);
             FileOutputStream output = new FileOutputStream(target);
             ByteArrayOutputStream sampleOutput = new ByteArrayOutputStream(LANGUAGE_SAMPLE_BYTES)) {
            if (input == null) throw new IllegalArgumentException("The selected file cannot be opened");
            byte[] buffer = new byte[8192];
            while (true) {
                int read = input.read(buffer);
                if (read < 0) break;
                total += read;
                if (total > MAX_IMPORT_BYTES) throw new IllegalArgumentException("Subtitle file exceeds 10 MB");
                output.write(buffer, 0, read);
                int sampleRemaining = LANGUAGE_SAMPLE_BYTES - sampleOutput.size();
                if (sampleRemaining > 0) sampleOutput.write(buffer, 0, Math.min(read, sampleRemaining));
            }
            sample = sampleOutput.toByteArray();
        } catch (Throwable error) {
            //noinspection ResultOfMethodCallIgnored
            target.delete();
            throw error;
        }
        if (total == 0) {
            //noinspection ResultOfMethodCallIgnored
            target.delete();
            throw new IllegalArgumentException("The selected subtitle file is empty");
        }
        String language = inferLanguageCode(displayName, decodeSubtitleText(sample));
        ImportedSubtitle imported = new ImportedSubtitle(
                displayName, language, target, System.currentTimeMillis(), ownerContentKey
        );
        IMPORTED.removeIf(item -> {
            if (!sameImportSlot(item, displayName, ownerContentKey)) return false;
            //noinspection ResultOfMethodCallIgnored
            item.storedFile.delete();
            return true;
        });
        IMPORTED.add(imported);
        persistImports();
        return imported;
    }

    /** Selects a completed import after the picker activity has yielded focus back to playback. */
    static synchronized void selectAfterPickerReturns(ImportedSubtitle imported) {
        cancelPendingPickerSelection();
        if (!belongsToContent(imported, activeContentKey)) return;
        Object subtitle = createImportedSubtitle(imported);
        Function1<Object, Unit> delegate = selectionDelegate.get();
        if (subtitle == null || delegate == null) return;
        activeImportedUrl = storedFileUrl(imported.storedFile);
        importedSelectionActive = true;
        sessionAddonListRefreshPending = true;
        LocalSubtitleRefreshState.invalidate();
        Handler handler = mainHandler;
        if (handler == null) {
            handler = new Handler(Looper.getMainLooper());
            mainHandler = handler;
        }
        Runnable selection = () -> {
            synchronized (LocalSubtitleRuntime.class) {
                if (pendingPickerSelection == null) return;
                pendingPickerSelection = null;
            }
            delegate.invoke(subtitle);
        };
        pendingPickerSelection = selection;
        handler.postDelayed(selection, PICKER_RETURN_DELAY_MILLIS);
    }

    private static synchronized void cancelPendingPickerSelection() {
        Runnable selection = pendingPickerSelection;
        Handler handler = mainHandler;
        pendingPickerSelection = null;
        if (selection != null && handler != null) handler.removeCallbacks(selection);
    }

    static String inferLanguageCode(String filename, String sample) {
        Matcher xml = XML_LANGUAGE.matcher(sample == null ? "" : sample);
        if (xml.find()) return normalizeLanguageCode(xml.group(1));
        Matcher declared = DECLARED_LANGUAGE.matcher(sample == null ? "" : sample);
        if (declared.find()) return normalizeLanguageCode(declared.group(1));

        String stem = filename == null ? "" : filename.replaceFirst("(?i)\\.[^.]+$", "");
        Matcher token = FILE_TOKEN.matcher(stem);
        String detected = null;
        while (token.find()) {
            String candidate = normalizeLanguageCode(token.group(1));
            // SDH is both an accessibility marker and the ISO-639-3 code for Southern Kurdish.
            // Filename markers are more commonly accessibility metadata; explicit file metadata
            // can still declare Southern Kurdish with xml:lang or a Language header.
            if ("sdh".equals(candidate)) continue;
            if (LANGUAGE_CODES.containsKey(candidate)) {
                detected = candidate;
                continue;
            }
            int suffix = candidate.indexOf('-');
            if (suffix > 0) {
                String base = normalizeLanguageCode(candidate.substring(0, suffix));
                if (LANGUAGE_CODES.containsKey(base)) detected = base;
            }
        }
        return detected == null ? UNKNOWN_LANGUAGE : detected;
    }

    static String displayLanguage(String languageCode) {
        String normalized = normalizeLanguageCode(languageCode);
        if (UNKNOWN_LANGUAGE.equals(normalized)) return "Unknown language";
        Locale locale = Locale.forLanguageTag(normalized);
        String display = locale.getDisplayName(Locale.getDefault());
        if (display == null || display.trim().isEmpty() || display.equalsIgnoreCase(normalized)) {
            display = LANGUAGE_CODES.get(normalized);
        }
        if (display == null || display.trim().isEmpty()) return "Unknown language";
        return display.substring(0, 1).toUpperCase(Locale.getDefault()) + display.substring(1);
    }

    private static Object createImportedSubtitle(ImportedSubtitle imported) {
        return createSubtitle(
                imported.languageCode + "\n" + imported.displayName,
                storedFileUrl(imported.storedFile),
                LOCAL_LANGUAGE_KEY,
                LOCAL_SOURCE_LABEL,
                imported.languageCode
        );
    }

    private static void launchPicker() {
        Activity activity = resumedActivity.get();
        if (activity == null) {
            showMessage("Unable to open the subtitle file picker");
            return;
        }
        String contentKey = activeContentKey;
        if (contentKey == null || contentKey.trim().isEmpty()) {
            showMessage("Playback identity is unavailable; reopen the subtitle menu and try again");
            return;
        }
        activity.startActivity(
                new Intent(activity, LocalSubtitlePickerActivity.class)
                        .putExtra(PICKER_CONTENT_KEY_EXTRA, contentKey)
        );
    }

    private static Object createSubtitle(String id, String url, String language, String addonName, String addonLogo) {
        try {
            Constructor<?> constructor = subtitleConstructor;
            if (constructor == null) {
                ClassLoader loader = LocalSubtitleRuntime.class.getClassLoader();
                Class<?> subtitleClass = Class.forName("com.nuvio.tv.domain.model.Subtitle", false, loader);
                constructor = subtitleClass.getDeclaredConstructor(
                        String.class, String.class, String.class, String.class, String.class
                );
                constructor.setAccessible(true);
                subtitleConstructor = constructor;
            }
            return constructor.newInstance(id, url, language, addonName, addonLogo);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean isLocalSubtitle(Object subtitle) {
        return subtitle != null &&
                LOCAL_LANGUAGE_KEY.equals(subtitleString(subtitle, "getLang")) &&
                LOCAL_SOURCE_LABEL.equals(subtitleString(subtitle, "getAddonName"));
    }

    private static boolean isPickerAction(Object subtitle) {
        return isLocalSubtitle(subtitle) &&
                LOCAL_LANGUAGE_KEY.equals(subtitleString(subtitle, "getId")) &&
                "".equals(subtitleString(subtitle, "getUrl"));
    }

    private static String subtitleString(Object subtitle, String methodName) {
        try {
            Method method = subtitle.getClass().getMethod(methodName);
            Object value = method.invoke(subtitle);
            return value instanceof String ? (String) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String railItemKey(Object item) {
        if (item == null) return null;
        for (String methodName : new String[]{"a", "getKey"}) {
            try {
                Method method = item.getClass().getMethod(methodName);
                Object value = method.invoke(item);
                if (value instanceof String) return (String) value;
            } catch (Throwable ignored) {
                // Try the source-level accessor after the optimized accessor.
            }
        }
        return null;
    }

    private static String languageFromId(String id) {
        if (id == null) return UNKNOWN_LANGUAGE;
        int separator = id.indexOf('\n');
        return separator < 0 ? UNKNOWN_LANGUAGE : normalizeLanguageCode(id.substring(0, separator));
    }

    private static String filenameFromId(String id) {
        if (id == null) return null;
        int separator = id.indexOf('\n');
        return separator < 0 || separator == id.length() - 1 ? null : id.substring(separator + 1);
    }

    private static String normalizeLanguageCode(String raw) {
        if (raw == null) return UNKNOWN_LANGUAGE;
        String normalized = raw.trim().toLowerCase(Locale.ROOT).replace('_', '-');
        if (normalized.equals("eng")) return "en";
        if (normalized.equals("ita")) return "it";
        if (normalized.equals("spa")) return "es";
        if (normalized.equals("fra") || normalized.equals("fre")) return "fr";
        if (normalized.equals("deu") || normalized.equals("ger")) return "de";
        if (normalized.equals("por")) return "pt";
        if (normalized.equals("und") || normalized.isEmpty()) return UNKNOWN_LANGUAGE;
        return normalized;
    }

    private static Map<String, String> buildLanguageCodes() {
        LinkedHashMap<String, String> result = new LinkedHashMap<>();
        for (String code : Locale.getISOLanguages()) {
            Locale locale = Locale.forLanguageTag(code);
            result.put(code, locale.getDisplayLanguage(Locale.ENGLISH));
            try {
                result.put(locale.getISO3Language().toLowerCase(Locale.ROOT), locale.getDisplayLanguage(Locale.ENGLISH));
            } catch (Throwable ignored) {
                // Some vendor runtimes omit ISO-3 data for uncommon languages.
            }
        }
        return result;
    }

    private static String decodeSubtitleText(byte[] bytes) {
        int offset = 0;
        Charset charset = StandardCharsets.UTF_8;
        if (bytes.length >= 2) {
            if ((bytes[0] & 0xff) == 0xff && (bytes[1] & 0xff) == 0xfe) {
                charset = Charset.forName("UTF-16LE");
                offset = 2;
            } else if ((bytes[0] & 0xff) == 0xfe && (bytes[1] & 0xff) == 0xff) {
                charset = Charset.forName("UTF-16BE");
                offset = 2;
            }
        }
        if (bytes.length >= 3 && (bytes[0] & 0xff) == 0xef &&
                (bytes[1] & 0xff) == 0xbb && (bytes[2] & 0xff) == 0xbf) {
            charset = StandardCharsets.UTF_8;
            offset = 3;
        }
        return new String(bytes, offset, bytes.length - offset, charset);
    }

    private static String extensionOf(String filename) {
        if (filename == null) return "";
        int dot = filename.lastIndexOf('.');
        return dot < 0 ? "" : filename.substring(dot + 1).toLowerCase(Locale.ROOT);
    }

    private static boolean isSupportedExtension(String extension) {
        return extension.equals("srt") || extension.equals("vtt") || extension.equals("webvtt") ||
                extension.equals("ass") || extension.equals("ssa") || extension.equals("ttml") ||
                extension.equals("dfxp");
    }

    private static String sanitizeFilename(String filename) {
        String safe = filename == null ? "subtitle.srt" : filename.replaceAll("[^A-Za-z0-9._ -]", "_");
        safe = safe.replaceAll("^[. ]+|[. ]+$", "");
        return safe.isEmpty() ? "subtitle.srt" : safe;
    }

    private static File storageDirectory(Context context) {
        return new File(context.getFilesDir(), "morphe-local-subtitles");
    }

    private static String contentKey(String contentId, Integer season, Integer episode) {
        String id = contentId == null ? "" : contentId.trim();
        if (id.isEmpty()) return "";
        return id + "|S" + (season == null ? "-" : season) + "|E" + (episode == null ? "-" : episode);
    }

    static String contentKeyForTesting(String contentId, Integer season, Integer episode) {
        return contentKey(contentId, season, episode);
    }

    private static boolean hasOwner(ImportedSubtitle imported) {
        return imported != null && imported.ownerContentKey != null &&
                !imported.ownerContentKey.trim().isEmpty();
    }

    static boolean belongsToContent(ImportedSubtitle imported, String key) {
        return hasOwner(imported) && key != null && imported.ownerContentKey.equals(key);
    }

    static boolean sameImportSlot(ImportedSubtitle imported, String displayName, String key) {
        return belongsToContent(imported, key) && displayName != null &&
                imported.displayName.equalsIgnoreCase(displayName);
    }

    static boolean claimOwnerIfUnassigned(ImportedSubtitle imported, String key) {
        if (imported == null || key == null || key.trim().isEmpty()) return false;
        if (hasOwner(imported)) return belongsToContent(imported, key);
        imported.ownerContentKey = key;
        return true;
    }

    /** Migrates an import created before content ownership was persisted without exposing it globally. */
    private static synchronized void claimLegacyImportForContent(String key) {
        if (key == null || key.trim().isEmpty()) return;
        String selectedUrl = SELECTED_BY_CONTENT.get(key);
        if (selectedUrl == null) return;
        ImportedSubtitle imported = importedByUrl(selectedUrl);
        if (imported != null && !hasOwner(imported) && claimOwnerIfUnassigned(imported, key)) {
            persistImports();
        }
    }

    private static ImportedSubtitle importedByUrl(String url) {
        for (ImportedSubtitle imported : IMPORTED) {
            if (storedFileUrl(imported.storedFile).equals(url)) return imported;
        }
        return null;
    }

    private static String storedFileUrl(File file) {
        String path = file.getAbsolutePath().replace('\\', '/');
        if (!path.startsWith("/")) path = "/" + path;
        return "file://" + path;
    }

    static String storedFileUrlForTesting(File file) {
        return storedFileUrl(file);
    }

    private static SharedPreferences preferences() {
        Context context = applicationContext;
        return context == null ? null : context.getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    private static boolean readFeatureEnabled(SharedPreferences preferences) {
        try {
            return preferences.getBoolean(ENABLED_PREFERENCE, true);
        } catch (ClassCastException ignored) {
            return true;
        }
    }

    private static synchronized void loadPersistentState() {
        IMPORTED.clear();
        SELECTED_BY_CONTENT.clear();
        SharedPreferences preferences = preferences();
        if (preferences == null) return;
        try {
            JSONArray imports = new JSONArray(preferences.getString(IMPORTS_PREFERENCE, "[]"));
            File directory = storageDirectory(applicationContext);
            for (int index = 0; index < imports.length(); index++) {
                JSONObject item = imports.getJSONObject(index);
                File file = new File(directory, item.getString("storedName"));
                if (file.isFile()) {
                    IMPORTED.add(new ImportedSubtitle(
                            item.getString("displayName"),
                            item.getString("languageCode"),
                            file,
                            item.optLong(
                                    "lastUsedAt",
                                    file.lastModified() > 0L ? file.lastModified() : System.currentTimeMillis()
                            ),
                            item.optString("ownerContentKey", "")
                    ));
                }
            }
            JSONObject selections = new JSONObject(preferences.getString(SELECTIONS_PREFERENCE, "{}"));
            JSONArray keys = selections.names();
            if (keys != null) {
                for (int index = 0; index < keys.length(); index++) {
                    String key = keys.getString(index);
                    SELECTED_BY_CONTENT.put(key, selections.getString(key));
                }
            }
            removeExpiredImports(System.currentTimeMillis());
        } catch (Throwable ignored) {
            IMPORTED.clear();
            SELECTED_BY_CONTENT.clear();
        }
    }

    private static synchronized void persistImports() {
        SharedPreferences preferences = preferences();
        if (preferences == null) return;
        JSONArray imports = new JSONArray();
        for (ImportedSubtitle imported : IMPORTED) {
            JSONObject item = new JSONObject();
            try {
                item.put("displayName", imported.displayName);
                item.put("languageCode", imported.languageCode);
                item.put("storedName", imported.storedFile.getName());
                item.put("lastUsedAt", imported.lastUsedAt);
                item.put("ownerContentKey", imported.ownerContentKey);
                imports.put(item);
            } catch (Throwable ignored) {
                // Skip a malformed entry without affecting other imports.
            }
        }
        preferences.edit().putString(IMPORTS_PREFERENCE, imports.toString()).apply();
    }

    private static synchronized void persistSelections() {
        SharedPreferences preferences = preferences();
        if (preferences == null) return;
        JSONObject selections = new JSONObject();
        for (Map.Entry<String, String> entry : SELECTED_BY_CONTENT.entrySet()) {
            try {
                selections.put(entry.getKey(), entry.getValue());
            } catch (Throwable ignored) {
                // Skip a malformed entry without affecting other selections.
            }
        }
        preferences.edit().putString(SELECTIONS_PREFERENCE, selections.toString()).apply();
    }

    private static void removeExpiredImports(long now) {
        ArrayList<String> removedUrls = new ArrayList<>();
        IMPORTED.removeIf(imported -> {
            if (!isExpired(imported.lastUsedAt, now)) return false;
            removedUrls.add(storedFileUrl(imported.storedFile));
            //noinspection ResultOfMethodCallIgnored
            imported.storedFile.delete();
            return true;
        });
        if (removedUrls.isEmpty()) return;
        SELECTED_BY_CONTENT.entrySet().removeIf(entry -> removedUrls.contains(entry.getValue()));
        persistImports();
        persistSelections();
    }

    private static boolean isExpired(long lastUsedAt, long now) {
        return now >= lastUsedAt && now - lastUsedAt >= RETENTION_MILLIS;
    }

    static boolean isExpiredForTesting(long lastUsedAt, long now) {
        return isExpired(lastUsedAt, now);
    }

    private static void showMessage(String message) {
        Context context = applicationContext;
        if (context != null) Toast.makeText(context, message, Toast.LENGTH_LONG).show();
    }

    static final class ImportedSubtitle {
        final String displayName;
        final String languageCode;
        final File storedFile;
        long lastUsedAt;
        String ownerContentKey;

        ImportedSubtitle(String displayName, String languageCode, File storedFile) {
            this(displayName, languageCode, storedFile, System.currentTimeMillis(), "");
        }

        ImportedSubtitle(String displayName, String languageCode, File storedFile, long lastUsedAt) {
            this(displayName, languageCode, storedFile, lastUsedAt, "");
        }

        ImportedSubtitle(
                String displayName,
                String languageCode,
                File storedFile,
                long lastUsedAt,
                String ownerContentKey
        ) {
            this.displayName = displayName;
            this.languageCode = languageCode;
            this.storedFile = storedFile;
            this.lastUsedAt = lastUsedAt;
            this.ownerContentKey = ownerContentKey == null ? "" : ownerContentKey;
        }
    }
}
