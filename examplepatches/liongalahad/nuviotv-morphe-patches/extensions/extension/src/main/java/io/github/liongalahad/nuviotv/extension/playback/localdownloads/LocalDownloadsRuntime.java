package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.DocumentsContract;
import android.util.Log;
import android.widget.Toast;

import androidx.media3.common.MediaItem;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.Player;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Constructor;
import java.lang.ref.WeakReference;
import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.LinkedHashSet;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import io.github.liongalahad.nuviotv.extension.settings.MorpheStoragePath;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;

/** Runtime bridge for download menu actions, route interception and exact local playback. */
@SuppressWarnings({"unused", "rawtypes", "unchecked", "JavaReflectionMemberAccess"})
public final class LocalDownloadsRuntime {
    private static final String TAG = "MorpheDownloads";
    private static final String ENTRIES_KEY = "playback.local_downloads.entries.v1";
    private static final long ACTION_TIMEOUT_MS = 10L * 60L * 1000L;
    private static final String[] SUBTITLE_WORKER_CLASS_NAMES = {"x9.q3", "v9.j3"};
    private static final ThreadLocal<OptionContext> OPTION_CONTEXT = new ThreadLocal<>();
    private static final Object LOCK = new Object();

    private static volatile Object activeHeroMeta;
    private static volatile Object activeHeroVideo;
    private static final ThreadLocal<HeroContext> HERO_CONTEXT = new ThreadLocal<>();
    private static volatile Class<?> heroActionOwner;
    private static volatile HeroContext pendingMovieAction;
    private static volatile DownloadedEntry pendingMovieActionEntry;
    private static volatile boolean pendingHeroDownloadBridge;
    private static volatile long pendingHeroDownloadBridgeGeneration;
    private static volatile PendingAction pendingAction;
    private static volatile RouteIdentity pendingRoute;
    private static volatile long pendingAtMs;
    private static volatile DownloadRequest activeRequest;
    private static volatile DownloadState downloadState = DownloadState.idle();
    private static volatile boolean dialogHidden;
    private static volatile boolean progressDialogVisible;
    private static volatile boolean playbackActive;
    private static volatile WeakReference<Object> streamViewModel = new WeakReference<>(null);
    private static volatile Object subtitleRepository;
    private static volatile Class<?> subtitleWorkerClass;
    private static volatile DownloadedEntry pendingDelete;
    private static boolean entryActionOpenOrLaunching;
    private static volatile Object navController;
    private static volatile Object downloadedBadgeIcon;
    private static final AtomicBoolean cancelRequested = new AtomicBoolean(false);
    private static volatile boolean sourcePickerObserved;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable SOURCE_PICKER_WATCH = new Runnable() {
        @Override public void run() {
            if (pendingAction != PendingAction.DOWNLOAD) return;
            if (SystemClock.elapsedRealtime() - pendingAtMs > ACTION_TIMEOUT_MS) {
                clearPendingAction();
                return;
            }
            String destination = currentDestinationDescription();
            if (isSourcePickerDestination(destination)) {
                sourcePickerObserved = true;
            } else if (sourcePickerObserved) {
                Log.i(TAG, "Cleared download mode after leaving the source picker");
                clearPendingAction();
                return;
            }
            MAIN.postDelayed(this, 250L);
        }
    };

    private LocalDownloadsRuntime() {}

    public static void observeHero(Object meta, Object video) {
        activeHeroMeta = meta;
        activeHeroVideo = video;
    }

    /** Captures the movie detail action context used by the patch-owned download control. */
    public static void enterHero(
            Object meta, Object video, Function0<?> onPlayLongPress, Object composer
    ) {
        observeHero(meta, video);
        if (heroActionOwner == null && composer != null) {
            try { heroActionOwner = findHeroActionOwner(composer); }
            catch (ReflectiveOperationException error) {
                Log.e(TAG, "Unable to resolve the native movie action control", error);
            }
        }
        HERO_CONTEXT.set(new HeroContext(meta, video, onPlayLongPress));
    }

    public static void prepareOptions(Object target, Function0<?> manualPlay, boolean showManual) {
        OPTION_CONTEXT.set(new OptionContext(target, manualPlay, showManual));
        if (target == null && showManual && manualPlay != null && pendingHeroDownloadBridge) {
            pendingHeroDownloadBridge = false;
            long generation = ++pendingHeroDownloadBridgeGeneration;
            MAIN.post(() -> {
                if (generation != pendingHeroDownloadBridgeGeneration) return;
                Log.i(TAG, "Opening the movie source picker from the detail download action");
                begin(PendingAction.DOWNLOAD, manualPlay);
            });
        }
    }

    public static Function3<Object, Object, Object, Unit> wrapOptionsContent(
            Function3<Object, Object, Object, Unit> original
    ) {
        OptionContext context = OPTION_CONTEXT.get();
        return context == null || original == null ? original : new WrappedOptions(original, context);
    }

    public static Function1<Object, Unit> wrapResolvedCallback(Function1<Object, Unit> original) {
        return original instanceof ResolvedCallback ? original : new ResolvedCallback(original);
    }

    public static void observeStreamViewModel(Object viewModel) {
        streamViewModel = new WeakReference<>(viewModel);
        Object repository = findSubtitleRepository(viewModel);
        if (repository != null) subtitleRepository = repository;
    }

    /** Receives the exact obfuscated worker class resolved by the patch for this APK build. */
    public static void observeSubtitleWorkerClass(Class<?> workerClass) {
        if (workerClass == null || workerClass == subtitleWorkerClass) return;
        subtitleWorkerClass = workerClass;
        Log.i(TAG, "Captured subtitle worker " + workerClass.getName());
    }

    public static void observeNavController(Object controller) {
        if (controller != null) {
            navController = controller;
            scheduleSourcePickerWatch();
        }
    }

    public static String rewriteStreamRoute(String route) {
        if (route == null || !route.startsWith("stream/")) return route;
        RouteIdentity identity = RouteIdentity.fromRoute(route);
        PendingAction action = pendingAction;
        if (action != null && SystemClock.elapsedRealtime() - pendingAtMs > ACTION_TIMEOUT_MS) {
            clearPendingAction();
            action = null;
        }
        if (action == PendingAction.DOWNLOAD) {
            pendingRoute = identity;
            scheduleSourcePickerWatch();
            return route;
        }
        if (LocalDownloadsSettings.isEnabled() &&
                LocalDownloadsSettings.isAutoplayEnabled() &&
                !identity.manualSelection) {
            DownloadedEntry entry = findEntry(identity);
            if (entry != null && entry.isReadable(application())) return entry.playerRoute();
        }
        return route;
    }

    /** Returns true when the selected source was consumed as a download instead of playback. */
    public static boolean interceptResolvedSelection(Object playbackInfo) {
        if (pendingAction != PendingAction.DOWNLOAD || pendingRoute == null) return false;
        RouteIdentity route = pendingRoute;
        DownloadRequest request = DownloadRequest.from(playbackInfo, route);
        if (request == null) {
            showMessage("Download unavailable",
                    "This source cannot be downloaded. Select a direct HTTP video source.", true);
            return true;
        }
        if (isDownloadRunning()) {
            showMessage("Download already running",
                    "Wait for the current download to finish or cancel it before starting another.", true);
            return true;
        }
        // Keep the download intent armed for this source-picker session. Selecting a second
        // source after cancellation or rejection must still download instead of falling through
        // to playback. A later Download action replaces this session, and the timeout remains a
        // final guard against stale picker state.
        activeRequest = request;
        cancelRequested.set(false);
        dialogHidden = false;
        updateState(DownloadState.preparing(request.progressTitle()));
        Context context = application();
        Intent service = new Intent(context, LocalDownloadsService.class);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) context.startForegroundService(service);
        else context.startService(service);
        showProgress(false);
        return true;
    }

    public static void onPlaybackStateChanged(Object listener, int state) {
        playbackActive = state == Player.STATE_BUFFERING || state == Player.STATE_READY;
    }

    /** Adds only subtitle sidecars recorded in this patch's own completed-entry index. */
    public static List<MediaItem.SubtitleConfiguration> attachDownloadedSubtitles(
            Context context,
            String mediaUrl,
            List<MediaItem.SubtitleConfiguration> existing
    ) {
        if (mediaUrl == null || mediaUrl.isEmpty()) return existing;
        DownloadedEntry match = null;
        for (DownloadedEntry entry : entries()) {
            if (mediaUrl.equals(entry.mediaUri)) { match = entry; break; }
        }
        if (match == null || match.subtitleUris.isEmpty()) return existing;
        List<MediaItem.SubtitleConfiguration> result = new ArrayList<>();
        if (existing != null) result.addAll(existing);
        for (int index = 0; index < match.subtitleUris.size(); index++) {
            String raw = match.subtitleUris.get(index);
            Uri uri = Uri.parse(raw);
            String extension = extensionOf(uri.getLastPathSegment());
            MediaItem.SubtitleConfiguration.Builder builder =
                    new MediaItem.SubtitleConfiguration.Builder(uri)
                            .setMimeType(subtitleMimeType(extension))
                            .setSelectionFlags(0);
            result.add(builder.build());
        }
        Log.i(TAG, "Attached " + match.subtitleUris.size() +
                " downloaded subtitle sidecars to local playback");
        return result;
    }

    public static void prepareDefaultFolder(Activity activity) {
        if (MorpheStoragePath.value() != null) return;
        if (hasDefaultFolderAccess(activity)) {
            MorpheStoragePath.defaultFolder().mkdirs();
            return;
        }
        activity.startActivity(new Intent(activity, LocalDownloadsDefaultFolderAccessActivity.class));
    }

    public static boolean hasDefaultFolderAccess(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) return Environment.isExternalStorageManager();
        return context.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) ==
                PackageManager.PERMISSION_GRANTED;
    }

    public static boolean isDownloadRunning() {
        DownloadState state = downloadState;
        return state.status == Status.PREPARING || state.status == Status.DOWNLOADING;
    }

    static DownloadRequest takeActiveRequest() { return activeRequest; }
    static boolean isCancelRequested() { return cancelRequested.get(); }
    static void updateProgress(long bytes, long total) {
        DownloadRequest request = activeRequest;
        if (request != null) updateState(DownloadState.downloading(
                request.progressTitle(), bytes, total));
    }
    static void failDownload(String title, String message) {
        DownloadRequest request = activeRequest;
        activeRequest = null;
        if (request != null) {
            pendingAction = PendingAction.DOWNLOAD;
            pendingRoute = request.identity;
            pendingAtMs = SystemClock.elapsedRealtime();
        }
        updateState(DownloadState.failed(title, message));
        if (!playbackActive) showProgress(true);
    }
    static void rejectForSize(DownloadRequest request, String message) {
        activeRequest = null;
        pendingAction = PendingAction.DOWNLOAD;
        pendingRoute = request.identity;
        pendingAtMs = SystemClock.elapsedRealtime();
        updateState(DownloadState.failed("File too large", message));
        if (!playbackActive) showProgress(true);
    }
    static void completeDownload(DownloadedEntry entry) {
        boolean saved = saveEntry(entry);
        activeRequest = null;
        Log.i(TAG, "Completed local download index update: saved=" + saved +
                " contentId=" + entry.contentId + " videoId=" + entry.videoId +
                " season=" + entry.season + " episode=" + entry.episode);
        if (!saved) {
            updateState(DownloadState.failed(entry.displayLabel(),
                    "Download finished, but the local file index could not be saved"));
            if (dialogHidden && !playbackActive) showProgress(true);
            return;
        }
        LocalDownloadsRefreshState.invalidate();
        updateState(DownloadState.complete(entry.displayLabel()));
        if (dialogHidden && !playbackActive) showProgress(true);
    }
    static DownloadState state() { return downloadState; }
    static void hideDialog() { dialogHidden = true; }
    static void cancelDownload() {
        cancelRequested.set(true);
        LocalDownloadsService.cancelActiveTransfer();
    }
    static void updateStateForService(DownloadState state) {
        activeRequest = null;
        updateState(state);
    }

    static List<SubtitleDownload> fetchAddonSubtitles(DownloadRequest request, long actualVideoSize) {
        Object viewModel = streamViewModel.get();
        if (request == null) return Collections.emptyList();
        Object repository = subtitleRepository;
        if (repository == null) repository = findSubtitleRepository(viewModel);
        if (repository == null) return Collections.emptyList();

        try {
            Object worker = createSubtitleWorker(repository, request, actualVideoSize);
            if (worker == null) return Collections.emptyList();
            Object value = runBlocking(worker);
            if (!(value instanceof List)) return Collections.emptyList();
            List<SubtitleDownload> subtitles = new ArrayList<>();
            Set<String> preferredLanguages = preferredSubtitleLanguages(viewModel);
            for (Object subtitle : (List<?>) value) {
                Object[] fields = DownloadRequest.fieldsInDeclarationOrder(subtitle);
                String url = DownloadRequest.stringValue(subtitle, "getUrl", fields, 1);
                String lang = DownloadRequest.stringValue(subtitle, "getLang", fields, 2);
                if (url != null && (url.startsWith("http://") || url.startsWith("https://")) &&
                        isPreferredSubtitleLanguage(lang, preferredLanguages)) {
                    subtitles.add(new SubtitleDownload(url, lang == null ? "und" : lang));
                }
            }
            Log.i(TAG, "Resolved " + subtitles.size() + " preferred-language addon subtitles " +
                    preferredLanguages + " for local download");
            return subtitles;
        } catch (Throwable error) {
            Log.w(TAG, "Unable to retrieve addon subtitles", error);
            return Collections.emptyList();
        }
    }

    private static Object createSubtitleWorker(
            Object repository, DownloadRequest request, long actualVideoSize
    ) throws Exception {
        for (Class<?> workerClass : subtitleWorkerClasses()) {
            for (Constructor<?> constructor : workerClass.getDeclaredConstructors()) {
                Object[] arguments = subtitleWorkerArguments(
                        constructor, repository, request, actualVideoSize);
                if (arguments == null) continue;
                constructor.setAccessible(true);
                Log.i(TAG, "Using subtitle worker " + workerClass.getName() +
                        " with " + arguments.length + " constructor parameters");
                return constructor.newInstance(arguments);
            }
        }
        Log.w(TAG, "No compatible subtitle worker is available");
        return null;
    }

    /** Supports Nuvio's split-APK (10 parameters) and universal (9 parameters) workers. */
    static Object[] subtitleWorkerArguments(
            Constructor<?> constructor, Object repository, DownloadRequest request,
            long actualVideoSize
    ) {
        if (constructor == null || repository == null || request == null) return null;
        Class<?>[] parameters = constructor.getParameterTypes();
        boolean commonShape = (parameters.length == 9 || parameters.length == 10) &&
                parameters[0].isInstance(repository) &&
                parameters[1] == String.class && parameters[2] == String.class &&
                parameters[3] == String.class &&
                Function3.class.isAssignableFrom(parameters[4]) &&
                Continuation.class.isAssignableFrom(parameters[parameters.length - 1]);
        if (!commonShape) return null;

        Long subtitleSize = request.sourceVideoSize != null && request.sourceVideoSize > 0
                ? request.sourceVideoSize : actualVideoSize > 0 ? actualVideoSize : null;
        Object[] common = {
                repository,
                request.identity.contentType,
                request.identity.contentId,
                emptyToNull(request.identity.videoId),
                null
        };
        if (parameters.length == 10) {
            if (!Function1.class.isAssignableFrom(parameters[5]) ||
                    parameters[6] != String.class || parameters[7] != Long.class ||
                    parameters[8] != String.class) return null;
            return new Object[] {
                    common[0], common[1], common[2], common[3], common[4], null,
                    emptyToNull(request.videoHash), subtitleSize, request.filename, null
            };
        }
        if (parameters[5] != String.class || parameters[6] != Long.class ||
                parameters[7] != String.class) return null;
        return new Object[] {
                common[0], common[1], common[2], common[3], common[4],
                emptyToNull(request.videoHash), subtitleSize, request.filename, null
        };
    }

    /** Reads Nuvio's live primary and secondary subtitle settings from the stream view model. */
    static Set<String> preferredSubtitleLanguages(Object viewModel) {
        LinkedHashSet<String> result = new LinkedHashSet<>();
        Object subtitleStyle = findNestedObjectWithToStringPrefix(
                viewModel, "SubtitleStyleSettings(preferredLanguage=", 2);
        if (subtitleStyle == null) subtitleStyle = findSubtitleStyleFromSettingsFlow(viewModel);
        if (subtitleStyle != null) {
            String description = String.valueOf(subtitleStyle);
            addSettingValue(result, description,
                    "SubtitleStyleSettings(preferredLanguage=", ", secondaryPreferredLanguage=");
            addSettingValue(result, description,
                    ", secondaryPreferredLanguage=", ", useForcedSubtitles=");
        }
        if (result.isEmpty()) result.add("en");
        return Collections.unmodifiableSet(result);
    }

    /**
     * The stream screen owns Nuvio's player-settings store, whose full settings Flow is wrapped by
     * an object that points back to that store. This structural lookup survives the different
     * obfuscated class and field names used by universal and split APKs.
     */
    private static Object findSubtitleStyleFromSettingsFlow(Object viewModel) {
        if (viewModel == null) return null;
        for (Class<?> owner = viewModel.getClass(); owner != null; owner = owner.getSuperclass()) {
            for (Field field : owner.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    Object settingsStore = field.get(viewModel);
                    if (settingsStore == null) continue;
                    Object settingsFlow = findFlowOwnedBy(settingsStore);
                    if (!isKotlinFlow(settingsFlow)) continue;
                    Object settings = firstFlowValue(settingsFlow);
                    Object subtitleStyle = findNestedObjectWithToStringPrefix(
                            settings, "SubtitleStyleSettings(preferredLanguage=", 1);
                    if (subtitleStyle != null) return subtitleStyle;
                } catch (Throwable ignored) { }
            }
        }
        return null;
    }

    private static Object findFlowOwnedBy(Object owner) {
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    Object candidate = field.get(owner);
                    if (isKotlinFlow(candidate) && directlyReferences(candidate, owner)) {
                        return candidate;
                    }
                } catch (Throwable ignored) { }
            }
        }
        return null;
    }

    private static boolean directlyReferences(Object candidate, Object expected) {
        for (Class<?> type = candidate.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    if (field.get(candidate) == expected) return true;
                } catch (Throwable ignored) { }
            }
        }
        return false;
    }

    private static boolean isKotlinFlow(Object candidate) {
        if (candidate == null) return false;
        for (Class<?> type = candidate.getClass(); type != null; type = type.getSuperclass()) {
            for (Class<?> contract : type.getInterfaces()) {
                if ("kotlinx.coroutines.flow.Flow".equals(contract.getName())) return true;
            }
        }
        return false;
    }

    private static Object firstFlowValue(final Object flow) throws Exception {
        return runBlocking(new Function2() {
            @Override public Object invoke(Object scope, Object continuation) {
                try {
                    Class<?> flowKt = Class.forName("kotlinx.coroutines.flow.FlowKt");
                    for (Method method : flowKt.getMethods()) {
                        Class<?>[] parameters = method.getParameterTypes();
                        if ("first".equals(method.getName()) && parameters.length == 2 &&
                                parameters[0].isInstance(flow) &&
                                Continuation.class.isAssignableFrom(parameters[1])) {
                            return method.invoke(null, flow, continuation);
                        }
                    }
                    throw new NoSuchMethodException("kotlinx.coroutines Flow.first");
                } catch (RuntimeException error) {
                    throw error;
                } catch (Throwable error) {
                    throw new IllegalStateException("Unable to read Nuvio player settings", error);
                }
            }
        });
    }

    private static void addSettingValue(
            Set<String> result, String description, String startMarker, String endMarker
    ) {
        int start = description.indexOf(startMarker);
        if (start < 0) return;
        start += startMarker.length();
        int end = description.indexOf(endMarker, start);
        if (end < 0) return;
        String value = description.substring(start, end).trim();
        if ("null".equalsIgnoreCase(value)) return;
        String normalized = normalizeLanguage(value);
        if (!normalized.isEmpty()) result.add(normalized);
    }

    /**
     * Finds the settings model by its stable data-class description. Nuvio's class names differ
     * between architecture APKs (for example x3/e7 on x86_64 and p3/q6 on universal builds).
     */
    private static Object findNestedObjectWithToStringPrefix(
            Object target, String prefix, int remainingDepth
    ) {
        if (target == null) return null;
        try {
            if (String.valueOf(target).startsWith(prefix)) return target;
        } catch (Throwable ignored) { }
        if (remainingDepth <= 0) return null;
        for (Class<?> owner = target.getClass(); owner != null; owner = owner.getSuperclass()) {
            for (Field field : owner.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(target);
                    if (value == null || value == target) continue;
                    Object found = findNestedObjectWithToStringPrefix(
                            value, prefix, remainingDepth - 1);
                    if (found != null) return found;
                } catch (Throwable ignored) { }
            }
        }
        return null;
    }

    private static Object findTypedField(Object target, String className) {
        if (target == null) return null;
        for (Class<?> owner = target.getClass(); owner != null; owner = owner.getSuperclass()) {
            for (Field field : owner.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) ||
                        !className.equals(field.getType().getName())) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(target);
                    if (value != null) return value;
                } catch (Throwable ignored) { }
            }
        }
        return null;
    }

    static boolean isPreferredSubtitleLanguage(String candidate, Set<String> preferred) {
        String actual = normalizeLanguage(candidate);
        if (actual.isEmpty() || preferred == null || preferred.isEmpty()) return false;
        String actualBase = languageBase(actual);
        for (String expectedValue : preferred) {
            String expected = normalizeLanguage(expectedValue);
            if (actual.equals(expected) || actualBase.equals(languageBase(expected))) return true;
        }
        return false;
    }

    static String normalizeLanguage(String value) {
        if (value == null) return "";
        String normalized = value.trim().toLowerCase(Locale.ROOT)
                .replace('_', '-').replace(' ', '-');
        while (normalized.contains("--")) normalized = normalized.replace("--", "-");
        if (normalized.startsWith("portuguese-brazil") || normalized.equals("brazilian-portuguese"))
            return "pt-br";
        if (normalized.startsWith("chinese-simplified")) return "zh-cn";
        if (normalized.startsWith("chinese-traditional")) return "zh-tw";
        String compact = normalized.replace("-", "");
        Map<String, String> aliases = LANGUAGE_ALIASES;
        String alias = aliases.get(compact);
        if (alias != null) return alias;
        if (normalized.matches("[a-z]{2,3}(?:-[a-z0-9]{2,4})?")) {
            String[] parts = normalized.split("-", 2);
            String base = aliases.get(parts[0]);
            return base == null ? normalized : base + (parts.length == 1 ? "" : "-" + parts[1]);
        }
        return normalized;
    }

    private static String languageBase(String value) {
        int separator = value.indexOf('-');
        return separator < 0 ? value : value.substring(0, separator);
    }

    private static final Map<String, String> LANGUAGE_ALIASES = languageAliases();

    private static Map<String, String> languageAliases() {
        LinkedHashMap<String, String> aliases = new LinkedHashMap<>();
        String[][] values = {
                {"en", "eng", "english"}, {"it", "ita", "italian"},
                {"pt", "por", "portuguese"}, {"es", "spa", "spanish"},
                {"fr", "fra", "fre", "french"}, {"de", "deu", "ger", "german"},
                {"nl", "nld", "dut", "dutch"}, {"pl", "pol", "polish"},
                {"ru", "rus", "russian"}, {"uk", "ukr", "ukrainian"},
                {"ar", "ara", "arabic"}, {"he", "heb", "hebrew"},
                {"hi", "hin", "hindi"}, {"ja", "jpn", "japanese"},
                {"ko", "kor", "korean"}, {"zh", "zho", "chi", "chinese"},
                {"tr", "tur", "turkish"}, {"cs", "ces", "cze", "czech"},
                {"sv", "swe", "swedish"}, {"no", "nor", "norwegian"},
                {"da", "dan", "danish"}, {"fi", "fin", "finnish"},
                {"el", "ell", "gre", "greek"}, {"ro", "ron", "rum", "romanian"},
                {"hu", "hun", "hungarian"}, {"id", "ind", "indonesian"},
                {"vi", "vie", "vietnamese"}, {"th", "tha", "thai"}
        };
        for (String[] row : values) for (String alias : row) aliases.put(alias, row[0]);
        aliases.put("portuguesebr", "pt-br");
        aliases.put("portuguesebrazil", "pt-br");
        aliases.put("brazilianportuguese", "pt-br");
        return Collections.unmodifiableMap(aliases);
    }

    private static Object findSubtitleRepository(Object viewModel) {
        if (viewModel == null) return null;
        for (Class<?> workerClass : subtitleWorkerClasses()) {
            Object repository = findSubtitleRepository(viewModel, workerClass);
            if (repository != null) return repository;
        }
        Log.w(TAG, "Subtitle repository is unavailable for this APK architecture");
        return null;
    }

    static Object findSubtitleRepository(Object viewModel, Class<?> workerClass) {
        if (viewModel == null || workerClass == null) return null;
        LinkedHashSet<Class<?>> repositoryClasses = new LinkedHashSet<>();
        for (Constructor<?> constructor : workerClass.getDeclaredConstructors()) {
            Class<?>[] parameters = constructor.getParameterTypes();
            if (parameters.length == 9 || parameters.length == 10) {
                repositoryClasses.add(parameters[0]);
            }
        }
        for (Class<?> repositoryClass : repositoryClasses) {
            for (Class<?> owner = viewModel.getClass(); owner != null;
                 owner = owner.getSuperclass()) {
                for (Field field : owner.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    try {
                        field.setAccessible(true);
                        Object candidate = field.get(viewModel);
                        if (candidate != null && repositoryClass.isInstance(candidate)) {
                            Log.i(TAG, "Resolved subtitle repository " +
                                    repositoryClass.getName() + " from " +
                                    viewModel.getClass().getName());
                            return candidate;
                        }
                    } catch (Throwable ignored) { }
                }
            }
        }
        return null;
    }

    private static List<Class<?>> subtitleWorkerClasses() {
        LinkedHashSet<Class<?>> result = new LinkedHashSet<>();
        if (subtitleWorkerClass != null) result.add(subtitleWorkerClass);
        for (String className : SUBTITLE_WORKER_CLASS_NAMES) {
            try { result.add(Class.forName(className)); }
            catch (ClassNotFoundException ignored) { }
        }
        return new ArrayList<>(result);
    }

    private static String emptyToNull(String value) {
        return value == null || value.isEmpty() ? null : value;
    }

    private static Object runBlocking(Object coroutineWorker) throws Exception {
        Class<?> buildersClass = Class.forName("kotlinx.coroutines.BuildersKt");
        for (Method method : buildersClass.getMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (!"runBlocking".equals(method.getName()) || parameters.length != 2 ||
                    !parameters[0].isInstance(EmptyCoroutineContext.INSTANCE) ||
                    !Function2.class.isAssignableFrom(parameters[1])) continue;
            return method.invoke(null, EmptyCoroutineContext.INSTANCE, (Function2) coroutineWorker);
        }
        throw new NoSuchMethodException("kotlinx.coroutines runBlocking");
    }

    static void resetFinishedState() {
        if (!isDownloadRunning()) updateState(DownloadState.idle());
    }

    static void progressDialogClosed() {
        progressDialogVisible = false;
        DownloadState state = downloadState;
        if (dialogHidden && !playbackActive && state.status == Status.COMPLETE) showProgress(true);
    }

    static void showProgress(boolean completion) {
        synchronized (LOCK) {
            if (progressDialogVisible) return;
            progressDialogVisible = true;
        }
        Context context = application();
        Intent intent = new Intent(context, LocalDownloadsProgressActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP |
                        Intent.FLAG_ACTIVITY_CLEAR_TOP);
        if (completion) intent.putExtra("completion", true);
        try { context.startActivity(intent); }
        catch (RuntimeException error) {
            progressDialogVisible = false;
            Log.e(TAG, "Unable to show download dialog", error);
        }
    }

    private static void showMessage(String title, String message, boolean error) {
        updateState(error ? DownloadState.failed(title, message) : DownloadState.complete(message));
        showProgress(true);
    }

    private static void updateState(DownloadState state) { downloadState = state; }

    static Context application() {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null) throw new IllegalStateException("Morphe settings were not initialized");
        return context;
    }

    private static void begin(PendingAction action, Function0<?> callback) {
        pendingAction = action;
        pendingRoute = null;
        pendingAtMs = SystemClock.elapsedRealtime();
        sourcePickerObserved = false;
        try { callback.invoke(); }
        catch (Throwable error) {
            clearPendingAction();
            Log.e(TAG, "Unable to open the source picker", error);
            toast("Unable to open source selection");
        }
    }

    private static void clearPendingAction() {
        MAIN.removeCallbacks(SOURCE_PICKER_WATCH);
        pendingAction = null;
        pendingRoute = null;
        pendingAtMs = 0L;
        sourcePickerObserved = false;
    }

    private static void scheduleSourcePickerWatch() {
        MAIN.removeCallbacks(SOURCE_PICKER_WATCH);
        if (pendingAction == PendingAction.DOWNLOAD) {
            MAIN.post(SOURCE_PICKER_WATCH);
        }
    }

    static boolean isSourcePickerDestination(String description) {
        return description != null &&
                description.toLowerCase(Locale.ROOT).contains("stream/");
    }

    private static String currentDestinationDescription() {
        Object controller = navController;
        if (controller == null) return "";
        try {
            Method current = null;
            for (Class<?> owner = controller.getClass(); owner != null && current == null;
                 owner = owner.getSuperclass()) {
                try { current = owner.getDeclaredMethod("h"); }
                catch (NoSuchMethodException ignored) { }
            }
            if (current == null) return "";
            current.setAccessible(true);
            Object destination = current.invoke(controller);
            return destination == null ? "" : destination.toString();
        } catch (Throwable error) {
            Log.d(TAG, "Unable to inspect the current Nuvio destination", error);
            return "";
        }
    }

    private static DownloadedEntry entryForTarget(Object target) {
        return entryForTarget(target, true);
    }

    private static DownloadedEntry entryForTarget(Object target, boolean logLookup) {
        List<DownloadedEntry> entries = entries();
        if (entries.isEmpty()) {
            if (logLookup) Log.i(TAG, "Local menu lookup: download index is empty");
            return null;
        }
        Object candidate = target != null ? target : activeHeroVideo;
        String videoId = stringProperty(candidate, "getId");
        String contentId = target == null ? stringProperty(activeHeroMeta, "getId") :
                deepStringProperty(target, "getContentId", 2);
        String contentTitle = target == null ? stringProperty(activeHeroMeta, "getName") : null;
        String contentType = target == null ? stringProperty(activeHeroMeta, "getApiType") : null;
        Integer season = integerProperty(candidate, "getSeason");
        Integer episode = integerProperty(candidate, "getEpisode");
        String episodeTitle = stringProperty(candidate, "getTitle");
        if (target != null) {
            String nestedVideo = deepStringProperty(target, "getVideoId", 2);
            if (nestedVideo != null) videoId = nestedVideo;
        }
        if (contentId == null) contentId = stringProperty(activeHeroMeta, "getId");
        if (logLookup) {
            Log.i(TAG, "Local menu lookup: entries=" + entries.size() + " target=" +
                    (candidate == null ? "null" : candidate.getClass().getName()) +
                    " contentId=" + contentId + " videoId=" + videoId + " season=" + season +
                    " episode=" + episode + " title=" + episodeTitle);
        }
        for (DownloadedEntry entry : entries) {
            if (logLookup) {
                Log.i(TAG, "Indexed local entry: contentId=" + entry.contentId + " videoId=" +
                        entry.videoId + " season=" + entry.season + " episode=" + entry.episode +
                        " title=" + entry.episodeTitle);
            }
            if (videoId != null && videoId.equals(entry.videoId)) return entry;
            // Movie Video ids may describe a catalogue item while the indexed id came from its
            // selected source route. The Meta content id is the stable identity shared by detail
            // and continue cards; series still require season/episode matching below.
            if (contentId != null && contentId.equals(entry.contentId) && entry.isMovie() &&
                    (target == null || "movie".equalsIgnoreCase(contentType))) return entry;
            if (contentId != null && contentId.equals(entry.contentId) &&
                    entry.matchesEpisode(season, episode)) return entry;
            if (episodeTitle != null && episodeTitle.equalsIgnoreCase(entry.episodeTitle) &&
                    entry.matchesEpisode(season, episode)) return entry;
            if (contentId != null && contentId.equals(entry.contentId) && entry.videoId.isEmpty()) return entry;
        }
        // Support older movie index rows produced by routes which omitted contentId.
        if (target == null && "movie".equalsIgnoreCase(contentType) && contentTitle != null) {
            for (DownloadedEntry entry : entries) {
                if (entry.isMovie() && contentTitle.equalsIgnoreCase(entry.displayTitle)) return entry;
            }
        }
        return null;
    }

    /** Used by episode-card UI hooks; stale index entries never produce a badge. */
    public static boolean isTargetDownloaded(Object target) {
        if (!LocalDownloadsSettings.isEnabled()) return false;
        DownloadedEntry entry = entryForTarget(target, false);
        return entry != null && entry.isReadable(application());
    }

    /** Emits a movie-only action immediately after Nuvio's native Watched control. */
    public static void renderMovieDownloadAction(Object composer) {
        HeroContext context = HERO_CONTEXT.get();
        if (context == null || composer == null || !LocalDownloadsSettings.isEnabled() ||
                context.onPlayLongPress == null ||
                !"movie".equalsIgnoreCase(stringProperty(context.meta, "getApiType"))) return;
        try {
            LocalDownloadsRefreshState.observeForCompose();
            DownloadedEntry entry = entryForTarget(null, false);
            boolean downloaded = entry != null && entry.isReadable(application());
            Class<?> owner = heroActionOwner;
            if (owner == null) {
                owner = findHeroActionOwner(composer);
                heroActionOwner = owner;
            }
            Method actionButton = findHeroActionButton(owner, composer);
            Function0<Unit> click = () -> {
                showMovieAction(context);
                return Unit.INSTANCE;
            };
            actionButton.invoke(
                    null,
                    downloadedBadgeIcon(),
                    null,
                    downloaded ? "Downloaded" : "Download to storage",
                    click,
                    null,
                    true,
                    downloaded,
                    longStaticField("b2.y", "d"),
                    longStaticField("b2.y", "b"),
                    NoOpAction.INSTANCE,
                    composer,
                    0,
                    0
            );
        } catch (Throwable error) {
            Log.e(TAG, "Unable to render the movie download action", error);
        }
    }

    private static Class<?> findHeroActionOwner(Object composer)
            throws ReflectiveOperationException {
        ClassLoader loader = composer.getClass().getClassLoader();
        for (StackTraceElement frame : Thread.currentThread().getStackTrace()) {
            if (frame.getClassName().equals(LocalDownloadsRuntime.class.getName())) continue;
            try {
                Class<?> candidate = Class.forName(frame.getClassName(), false, loader);
                findHeroActionButton(candidate, composer);
                return candidate;
            } catch (ClassNotFoundException | NoSuchMethodException ignored) {
                // Continue to the first structurally matching native detail-action owner.
            }
        }
        throw new NoSuchMethodException("Native movie detail action owner");
    }

    private static Method findHeroActionButton(Class<?> owner, Object composer)
            throws NoSuchMethodException {
        for (Method method : owner.getDeclaredMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != Void.TYPE ||
                    parameters.length != 13 || parameters[2] != String.class ||
                    !Function0.class.isAssignableFrom(parameters[3]) ||
                    !Function0.class.isAssignableFrom(parameters[4]) ||
                    parameters[5] != Boolean.TYPE || parameters[6] != Boolean.TYPE ||
                    parameters[7] != Long.TYPE || parameters[8] != Long.TYPE ||
                    !Function0.class.isAssignableFrom(parameters[9]) ||
                    !parameters[10].isInstance(composer) ||
                    parameters[11] != Integer.TYPE || parameters[12] != Integer.TYPE) continue;
            method.setAccessible(true);
            return method;
        }
        throw new NoSuchMethodException("Native movie detail action button");
    }

    private static void showMovieAction(HeroContext context) {
        pendingMovieAction = context;
        DownloadedEntry entry = entryForTarget(null, false);
        pendingMovieActionEntry = entry != null && entry.isReadable(application()) ? entry : null;
        Context app = application();
        try {
            app.startActivity(new Intent(app, LocalDownloadsMovieActionActivity.class)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP));
        } catch (RuntimeException error) {
            cancelPendingMovieAction();
            Log.e(TAG, "Unable to show the movie download menu", error);
            toast("Unable to open download options");
        }
    }

    static boolean hasPendingMovieAction() { return pendingMovieAction != null; }
    static DownloadedEntry pendingMovieActionEntry() { return pendingMovieActionEntry; }
    static String pendingMovieActionTitle() {
        HeroContext context = pendingMovieAction;
        String title = context == null ? null : stringProperty(context.meta, "getName");
        return title == null || title.trim().isEmpty() ? "Movie" : title.trim();
    }
    static void cancelPendingMovieAction() {
        pendingMovieAction = null;
        pendingMovieActionEntry = null;
    }

    static boolean startPendingMovieDownload() {
        HeroContext context = pendingMovieAction;
        if (context == null || context.onPlayLongPress == null) return false;
        cancelPendingMovieAction();
        pendingHeroDownloadBridge = true;
        long generation = ++pendingHeroDownloadBridgeGeneration;
        MAIN.postDelayed(() -> {
            if (generation != pendingHeroDownloadBridgeGeneration) return;
            try { context.onPlayLongPress.invoke(); }
            catch (Throwable error) {
                pendingHeroDownloadBridge = false;
                Log.e(TAG, "Unable to open movie download source selection", error);
                toast("Unable to open source selection");
            }
        }, 50L);
        MAIN.postDelayed(() -> {
            if (generation != pendingHeroDownloadBridgeGeneration || !pendingHeroDownloadBridge)
                return;
            pendingHeroDownloadBridge = false;
            Log.w(TAG, "Movie download source-picker bridge timed out");
            toast("Unable to open source selection");
        }, 3000L);
        return true;
    }

    static void prepareMovieActionForTesting(DownloadedEntry entry, Object meta) {
        pendingMovieAction = new HeroContext(meta, null, NoOpAction.INSTANCE);
        pendingMovieActionEntry = entry;
    }

    /** Draws a downloaded marker beside Nuvio's watched marker inside an episode card. */
    public static void renderDownloadedEpisodeBadge(
            Object episodeCardContent, boolean watched, Object composer
    ) {
        if (episodeCardContent == null || composer == null) return;
        boolean groupStarted = false;
        try {
            Method beginGroup = composer.getClass().getMethod("d0", Integer.TYPE);
            beginGroup.invoke(composer, 0x4d6f7244);
            groupStarted = true;

            LocalDownloadsRefreshState.observeForCompose();
            Object video = findTypedField(
                    episodeCardContent, "com.nuvio.tv.domain.model.Video");
            if (!isTargetDownloaded(video)) return;

            Object cardLayout = findTypedField(episodeCardContent, "la.w0");
            float badgeSize = floatField(cardLayout, "t", 21f);
            float iconSize = floatField(cardLayout, "u", Math.max(1f, badgeSize - 1f));
            float margin = floatField(cardLayout, "v", 4f);
            // Nuvio's watched marker uses the top-left corner. Mirror its edge inset
            // directly on the top-right; the two badges never need to displace each other.
            float rightMargin = margin;

            Class<?> modifierClass = Class.forName("u1.q");
            Class<?> alignmentClass = Class.forName("u1.i");
            Class<?> shapeClass = Class.forName("b2.u0");
            Class<?> composerClass = Class.forName("e1.m0");
            Object modifier = staticField("u1.n", "b");
            Object boxScope = staticField("c0.t", "a");
            Object topEnd = staticField("u1.b", "c");
            modifier = declaredMethod(boxScope.getClass(), "a", modifierClass, alignmentClass)
                    .invoke(boxScope, modifier, topEnd);
            modifier = declaredMethod(Class.forName("c0.b"), "w", modifierClass,
                    Float.TYPE, Float.TYPE, Float.TYPE, Float.TYPE, Integer.TYPE)
                    .invoke(null, modifier, 0f, margin, rightMargin, 0f, 9);
            modifier = declaredMethod(Class.forName("androidx.compose.foundation.layout.b"),
                    "l", modifierClass, Float.TYPE).invoke(null, modifier, badgeSize);

            Object circle = staticField("j0.g", "a");
            long shadowColor = longStaticField("b2.y", "k");
            modifier = declaredMethod(Class.forName("y1.g"), "g", modifierClass,
                    Float.TYPE, shapeClass, Long.TYPE, Integer.TYPE)
                    .invoke(null, modifier, 10f, circle, shadowColor, 12);

            Object themeKey = staticField("va.w0", "a");
            Method readCompositionLocal = composer.getClass().getMethod(
                    "j", Class.forName("e1.d2"));
            Object theme = readCompositionLocal.invoke(composer, themeKey);
            long badgeColor = longField(theme, "h");
            modifier = declaredMethod(Class.forName("w.m"), "g", modifierClass,
                    Long.TYPE, shapeClass).invoke(null, modifier, badgeColor, circle);

            float innerPadding = Math.max(0f, (badgeSize - iconSize) / 2f);
            if (innerPadding > 0f) {
                modifier = declaredMethod(Class.forName("u1.a"), "d", modifierClass,
                        Float.TYPE).invoke(null, modifier, innerPadding);
            }

            Object palette = staticField("va.u0", "g");
            long selectedBackground = longField(palette, "a");
            long iconColor = badgeColor == selectedBackground
                    ? longStaticField("b2.y", "b") : longStaticField("b2.y", "d");
            declaredMethod(Class.forName("p5.k0"), "b", Class.forName("h2.f"),
                    String.class, modifierClass, Long.TYPE, composerClass,
                    Integer.TYPE, Integer.TYPE).invoke(
                    null, downloadedBadgeIcon(), "Downloaded", modifier, iconColor,
                    composer, 0, 0);
        } catch (Throwable error) {
            Log.e(TAG, "Unable to render downloaded episode badge", error);
        } finally {
            if (groupStarted) {
                try { composer.getClass().getMethod("p", Boolean.TYPE).invoke(composer, false); }
                catch (Throwable error) {
                    Log.e(TAG, "Unable to close downloaded badge composition group", error);
                }
            }
        }
    }

    private static Object downloadedBadgeIcon() throws Exception {
        Object cached = downloadedBadgeIcon;
        if (cached != null) return cached;
        synchronized (LOCK) {
            cached = downloadedBadgeIcon;
            if (cached != null) return cached;

            Class<?> builderClass = Class.forName("h2.e");
            Constructor<?> constructor = builderClass.getDeclaredConstructor(
                    String.class, Float.TYPE, Float.TYPE, Float.TYPE, Float.TYPE,
                    Long.TYPE, Integer.TYPE, Boolean.TYPE, Integer.TYPE);
            constructor.setAccessible(true);
            Object builder = constructor.newInstance(
                    "Filled.Download", 24f, 24f, 24f, 24f, 0L, 0, false, 96);

            ArrayList<Object> path = new ArrayList<>(16);
            addVectorPoint(path, "h2.n", 11f, 4f);
            addVectorPoint(path, "h2.m", 13f, 4f);
            addVectorPoint(path, "h2.m", 13f, 12.5f);
            addVectorPoint(path, "h2.m", 16.5f, 9f);
            addVectorPoint(path, "h2.m", 18f, 10.5f);
            addVectorPoint(path, "h2.m", 12f, 16.5f);
            addVectorPoint(path, "h2.m", 6f, 10.5f);
            addVectorPoint(path, "h2.m", 7.5f, 9f);
            addVectorPoint(path, "h2.m", 11f, 12.5f);
            path.add(staticField("h2.j", "c"));
            addVectorPoint(path, "h2.n", 6f, 18f);
            addVectorPoint(path, "h2.m", 18f, 18f);
            addVectorPoint(path, "h2.m", 18f, 20f);
            addVectorPoint(path, "h2.m", 6f, 20f);
            path.add(staticField("h2.j", "c"));

            Class<?> brushClass = Class.forName("b2.x0");
            Constructor<?> brushConstructor = brushClass.getDeclaredConstructor(Long.TYPE);
            brushConstructor.setAccessible(true);
            Object brush = brushConstructor.newInstance(longStaticField("b2.y", "b"));
            declaredMethod(builderClass, "a", builderClass, ArrayList.class,
                    Integer.TYPE, brushClass).invoke(null, builder, path, 0, brush);
            cached = declaredMethod(builderClass, "b").invoke(builder);
            downloadedBadgeIcon = cached;
            return cached;
        }
    }

    private static void addVectorPoint(
            ArrayList<Object> path, String className, float x, float y
    ) throws Exception {
        Constructor<?> constructor = Class.forName(className)
                .getDeclaredConstructor(Float.TYPE, Float.TYPE);
        constructor.setAccessible(true);
        path.add(constructor.newInstance(x, y));
    }

    private static Method declaredMethod(
            Class<?> owner, String name, Class<?>... parameterTypes
    ) throws NoSuchMethodException {
        Method method = owner.getDeclaredMethod(name, parameterTypes);
        method.setAccessible(true);
        return method;
    }

    private static Object staticField(String className, String name) throws Exception {
        Field field = Class.forName(className).getDeclaredField(name);
        field.setAccessible(true);
        return field.get(null);
    }

    private static long longStaticField(String className, String name) throws Exception {
        Field field = Class.forName(className).getDeclaredField(name);
        field.setAccessible(true);
        return field.getLong(null);
    }

    private static long longField(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getLong(target);
    }

    private static boolean booleanField(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getBoolean(target);
    }

    private static float floatField(Object target, String name, float fallback) {
        if (target == null) return fallback;
        try {
            Field field = target.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.getFloat(target);
        } catch (Throwable ignored) { return fallback; }
    }

    private static void requestDeleteLocal(Object target) {
        DownloadedEntry entry = entryForTarget(target);
        if (entry == null || !entry.isReadable(application())) {
            toast("No downloaded local file is available for this title");
            return;
        }
        pendingDelete = entry;
        Context context = application();
        Intent intent = new Intent(context, LocalDownloadsDeleteActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP);
        try { context.startActivity(intent); }
        catch (RuntimeException error) {
            pendingDelete = null;
            Log.e(TAG, "Unable to show local-download delete confirmation", error);
            toast("Unable to open delete confirmation");
        }
    }

    static void requestDeleteEntry(DownloadedEntry entry) {
        if (entry == null) return;
        pendingDelete = entry;
        Context context = application();
        try {
            context.startActivity(new Intent(context, LocalDownloadsDeleteActivity.class)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP));
        } catch (RuntimeException error) {
            pendingDelete = null;
            Log.e(TAG, "Unable to show indexed-download delete confirmation", error);
            toast("Unable to open delete confirmation");
        }
    }

    static synchronized void showDeleteEntryAction(DownloadedEntry entry) {
        if (entry == null) return;
        // A TV select hold is reported through both ListView's long-click callback and the
        // explicit key timeout. Coalesce them so one gesture cannot stack two popups.
        if (entryActionOpenOrLaunching) return;
        entryActionOpenOrLaunching = true;
        pendingDelete = entry;
        Context context = application();
        try {
            context.startActivity(new Intent(context, LocalDownloadsEntryActionActivity.class)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP));
        } catch (RuntimeException error) {
            entryActionOpenOrLaunching = false;
            pendingDelete = null;
            Log.e(TAG, "Unable to show indexed-download action menu", error);
            toast("Unable to open download options");
        }
    }

    static synchronized void finishEntryAction() {
        entryActionOpenOrLaunching = false;
    }

    static synchronized boolean beginEntryActionForTesting() {
        if (entryActionOpenOrLaunching) return false;
        entryActionOpenOrLaunching = true;
        return true;
    }

    static DownloadedEntry pendingDelete() { return pendingDelete; }
    static void cancelPendingDelete() { pendingDelete = null; }

    static DeleteResult confirmPendingDelete() {
        DownloadedEntry entry = pendingDelete;
        pendingDelete = null;
        if (entry == null) return DeleteResult.failure("The downloaded file is no longer available");
        DeleteResult result = deleteEntryFiles(application(), entry);
        if (result.mediaDeleted) {
            removeEntry(entry);
            LocalDownloadsRefreshState.invalidate();
        }
        return result;
    }

    static DeleteResult deleteEntryFiles(Context context, DownloadedEntry entry) {
        if (context == null || entry == null) return DeleteResult.failure("Nothing was deleted");
        boolean mediaDeleted = deleteUri(context, entry.mediaUri);
        if (!mediaDeleted) return DeleteResult.failure("The local video file could not be deleted");
        int subtitleFailures = 0;
        for (String subtitle : entry.subtitleUris) {
            if (!deleteUri(context, subtitle)) subtitleFailures++;
        }
        cleanupEmptyFolder(context, entry.resolvedFolderUri());
        return subtitleFailures == 0
                ? DeleteResult.success("Local video and subtitles deleted")
                : new DeleteResult(true, false,
                        "The video was deleted, but " + subtitleFailures +
                                (subtitleFailures == 1 ? " subtitle could not be deleted" :
                                        " subtitles could not be deleted"));
    }

    private static boolean deleteUri(Context context, String raw) {
        if (raw == null || raw.isEmpty()) return true;
        try {
            Uri uri = Uri.parse(raw);
            if ("file".equalsIgnoreCase(uri.getScheme())) {
                File file = new File(uri.getPath());
                return !file.exists() || (file.isFile() && file.delete());
            }
            if ("content".equalsIgnoreCase(uri.getScheme())) {
                return DocumentsContract.deleteDocument(context.getContentResolver(), uri);
            }
        } catch (Throwable error) {
            Log.w(TAG, "Unable to delete local download URI", error);
        }
        return false;
    }

    private static void cleanupEmptyFolder(Context context, String rawFolder) {
        if (rawFolder == null || rawFolder.isEmpty()) return;
        try {
            Uri folder = Uri.parse(rawFolder);
            if ("file".equalsIgnoreCase(folder.getScheme())) {
                File directory = new File(folder.getPath());
                String[] children = directory.list();
                if (directory.isDirectory() && children != null && children.length == 0) directory.delete();
                return;
            }
            if (!"content".equalsIgnoreCase(folder.getScheme()) || !isDocumentFolderEmpty(context, folder))
                return;
            DocumentsContract.deleteDocument(context.getContentResolver(), folder);
        } catch (Throwable error) {
            Log.w(TAG, "Unable to remove empty local-download folder", error);
        }
    }

    private static boolean isDocumentFolderEmpty(Context context, Uri folder) {
        String documentId = DocumentsContract.getDocumentId(folder);
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(folder, documentId);
        try (Cursor cursor = context.getContentResolver().query(children,
                new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID}, null, null, null)) {
            return cursor != null && cursor.getCount() == 0;
        } catch (Throwable error) {
            return false;
        }
    }

    private static void removeEntry(DownloadedEntry deleted) {
        List<DownloadedEntry> values = entries();
        for (int index = values.size() - 1; index >= 0; index--) {
            if (values.get(index).sameIdentity(deleted)) values.remove(index);
        }
        JSONArray array = new JSONArray();
        for (DownloadedEntry entry : values) array.put(entry.toJson());
        preferences().edit().putString(ENTRIES_KEY, array.toString()).commit();
    }

    static DeleteAllResult deleteAllIndexedDownloads(Context context) {
        List<DownloadedEntry> indexed = entries();
        List<DownloadedEntry> remaining = new ArrayList<>();
        int deleted = 0;
        int incomplete = 0;
        for (DownloadedEntry entry : indexed) {
            DeleteResult result = deleteEntryFiles(context, entry);
            if (result.mediaDeleted) {
                deleted++;
                if (!result.complete) incomplete++;
            } else {
                remaining.add(entry);
            }
        }
        JSONArray array = new JSONArray();
        for (DownloadedEntry entry : remaining) array.put(entry.toJson());
        boolean saved = preferences().edit().putString(ENTRIES_KEY, array.toString()).commit();
        LocalDownloadsRefreshState.invalidate();
        if (!saved) return new DeleteAllResult(deleted, indexed.size() - deleted,
                "Files were processed, but the download index could not be updated");
        int failed = indexed.size() - deleted;
        if (failed == 0 && incomplete == 0) {
            return new DeleteAllResult(deleted, 0,
                    deleted == 1 ? "1 download deleted" : deleted + " downloads deleted");
        }
        String message = deleted + " deleted";
        if (failed > 0) message += ", " + failed + " could not be deleted";
        if (incomplete > 0) message += ", " + incomplete + " had subtitle cleanup errors";
        return new DeleteAllResult(deleted, failed + incomplete, message);
    }

    private static void playLocal(Object target) {
        DownloadedEntry entry = entryForTarget(target);
        playDownloadedEntry(entry);
    }

    static boolean playDownloadedEntry(DownloadedEntry entry) {
        if (entry == null || !entry.isReadable(application())) {
            toast("No downloaded local file is available for this title");
            return false;
        }
        Object controller = navController;
        if (controller == null) {
            toast("Nuvio navigation is not ready");
            return false;
        }
        try {
            for (Class<?> owner = controller.getClass(); owner != null; owner = owner.getSuperclass()) {
                for (Method method : owner.getDeclaredMethods()) {
                    Class<?>[] parameters = method.getParameterTypes();
                    if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != Void.TYPE ||
                            parameters.length != 4 || parameters[1] != String.class ||
                            parameters[3] != Integer.TYPE ||
                            !parameters[0].isAssignableFrom(controller.getClass())) continue;
                    method.setAccessible(true);
                    method.invoke(null, controller, entry.playerRoute(), null, 2);
                    Log.i(TAG, "Started direct local playback for contentId=" + entry.contentId +
                            " videoId=" + entry.videoId);
                    return true;
                }
            }
            throw new NoSuchMethodException("Nuvio navigation helper");
        } catch (Throwable error) {
            Log.e(TAG, "Unable to navigate to the downloaded local file", error);
            toast("Unable to start local playback");
            return false;
        }
    }

    static String mediaLabel(String title, Integer season, Integer episode) {
        String value = title == null || title.trim().isEmpty() ? "Local download" : title.trim();
        if (season == null || episode == null) return value;
        return value + String.format(Locale.US, " · S%02dE%02d", season, episode);
    }

    private static void renderButton(Object composer, String label, Function0<Unit> action) {
        renderButton(composer, label, action, null);
    }

    private static void renderButton(Object composer, String label, Function0<Unit> action,
                                     Object suppliedModifier) {
        try {
            Class<?> owner = Class.forName("p5.a1");
            for (Method method : owner.getDeclaredMethods()) {
                Class<?>[] p = method.getParameterTypes();
                if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != Void.TYPE ||
                        p.length != 13 || !Function0.class.isAssignableFrom(p[0]) ||
                        !Function3.class.isAssignableFrom(p[8])) continue;
                Object[] args = new Object[13];
                args[0] = action;
                Class<?> modifierClass = Class.forName("u1.q");
                Object modifier = suppliedModifier;
                if (modifier == null) {
                    modifier = declaredMethod(Class.forName("androidx.compose.foundation.layout.b"),
                            "d", modifierClass, Float.TYPE).invoke(
                            null, staticField("u1.n", "b"), 1f);
                }
                args[1] = modifier;
                args[2] = false;
                args[8] = new LabelContent(label);
                args[9] = composer;
                args[10] = 0;
                args[11] = 0;
                // Supply full-width Modifier and default the remaining optional visuals.
                args[12] = 4092;
                method.setAccessible(true);
                method.invoke(null, args);
                return;
            }
            throw new NoSuchMethodException("Nuvio TV Button");
        } catch (Throwable error) {
            Log.e(TAG, "Unable to render local-download action", error);
        }
    }

    /** Renders the two downloaded-file actions on one native-height row. */
    private static void renderLocalActionsRow(
            Object composer, Function0<Unit> playAction, Function0<Unit> deleteAction
    ) {
        boolean groupStarted = false;
        boolean nodeStarted = false;
        try {
            Class<?> composerClass = Class.forName("e1.m0");
            Class<?> modifierClass = Class.forName("u1.q");
            Class<?> arrangementClass = Class.forName("c0.e");
            Class<?> verticalAlignmentClass = Class.forName("u1.h");

            declaredMethod(composer.getClass(), "d0", Integer.TYPE)
                    .invoke(composer, 0x4d6f7252);
            groupStarted = true;

            Object modifier = declaredMethod(Class.forName("androidx.compose.foundation.layout.b"),
                    "d", modifierClass, Float.TYPE).invoke(
                    null, staticField("u1.n", "b"), 1f);
            Object spacedArrangement = declaredMethod(Class.forName("c0.i"),
                    "g", Float.TYPE).invoke(null, 8f);
            Object measurePolicy = declaredMethod(Class.forName("c0.t1"), "a",
                    arrangementClass, verticalAlignmentClass, composerClass, Integer.TYPE)
                    .invoke(null, spacedArrangement, staticField("u1.b", "k"),
                            composer, 54);
            Object compositionLocals = declaredMethod(composer.getClass(), "l").invoke(composer);
            Object materializedModifier = declaredMethod(Class.forName("u1.a"), "c",
                    composerClass, modifierClass).invoke(null, composer, modifier);

            Object nodeFactory = staticField("u2.i", "b");
            declaredMethod(composer.getClass(), "h0").invoke(composer);
            nodeStarted = true;
            if (booleanField(composer, "S")) {
                declaredMethod(composer.getClass(), "k", Function0.class)
                        .invoke(composer, nodeFactory);
            } else {
                declaredMethod(composer.getClass(), "r0").invoke(composer);
            }

            Class<?> updater = Class.forName("e1.j");
            Method update = declaredMethod(updater, "C", composerClass,
                    Object.class, Function2.class);
            update.invoke(null, composer, measurePolicy, staticField("u2.i", "f"));
            update.invoke(null, composer, compositionLocals, staticField("u2.i", "e"));
            update.invoke(null, composer, Integer.valueOf(Long.hashCode(longField(composer, "T"))),
                    staticField("u2.i", "g"));
            declaredMethod(updater, "x", composerClass, Function1.class)
                    .invoke(null, composer, staticField("u2.i", "h"));
            update.invoke(null, composer, materializedModifier, staticField("u2.i", "d"));

            Constructor<?> weightConstructor = Class.forName("c0.z0")
                    .getDeclaredConstructor(Float.TYPE, Boolean.TYPE);
            weightConstructor.setAccessible(true);
            Object playModifier = weightConstructor.newInstance(1f, true);
            Object deleteModifier = weightConstructor.newInstance(1f, true);

            renderButton(composer, "Play local file", playAction, playModifier);
            renderButton(composer, "Delete local file", deleteAction, deleteModifier);

            declaredMethod(composer.getClass(), "p", Boolean.TYPE).invoke(composer, true);
            nodeStarted = false;
        } catch (Throwable error) {
            Log.e(TAG, "Unable to render local-download action row", error);
        } finally {
            try {
                if (nodeStarted) {
                    declaredMethod(composer.getClass(), "p", Boolean.TYPE).invoke(composer, true);
                }
                if (groupStarted) {
                    declaredMethod(composer.getClass(), "p", Boolean.TYPE).invoke(composer, false);
                }
            } catch (Throwable error) {
                Log.e(TAG, "Unable to close local-download action row", error);
            }
        }
    }

    private static void renderText(Object composer, String label) {
        try {
            Class<?> owner = Class.forName("p5.a2");
            for (Method method : owner.getDeclaredMethods()) {
                Class<?>[] p = method.getParameterTypes();
                if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != Void.TYPE ||
                        p.length != 19 || p[0] != String.class) continue;
                Object[] args = new Object[19];
                args[0] = label;
                for (int i = 1; i < args.length; i++) {
                    if (p[i] == Long.TYPE) args[i] = 0L;
                    else if (p[i] == Integer.TYPE) args[i] = 0;
                    else if (p[i] == Boolean.TYPE) args[i] = false;
                }
                args[15] = composer;
                args[18] = 131070;
                method.setAccessible(true);
                method.invoke(null, args);
                return;
            }
            throw new NoSuchMethodException("Nuvio Text");
        } catch (Throwable error) {
            Log.e(TAG, "Unable to render local-download label", error);
        }
    }

    private static Object property(Object target, String getter) {
        if (target == null) return null;
        try {
            Method method = target.getClass().getMethod(getter);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (Throwable ignored) { return null; }
    }

    private static String stringProperty(Object target, String getter) {
        Object value = property(target, getter);
        return value instanceof String ? (String) value : null;
    }

    private static Integer integerProperty(Object target, String getter) {
        Object value = property(target, getter);
        return value instanceof Number ? ((Number) value).intValue() : null;
    }

    private static String deepStringProperty(Object target, String getter, int depth) {
        String direct = stringProperty(target, getter);
        if (direct != null || target == null || depth <= 0) return direct;
        for (Class<?> owner = target.getClass(); owner != null; owner = owner.getSuperclass()) {
            for (Field field : owner.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    Object nested = field.get(target);
                    String found = deepStringProperty(nested, getter, depth - 1);
                    if (found != null) return found;
                } catch (Throwable ignored) { }
            }
        }
        return null;
    }

    private static DownloadedEntry findEntry(RouteIdentity identity) {
        if (identity == null) return null;
        for (DownloadedEntry entry : entries()) if (entry.matches(identity)) return entry;
        return null;
    }

    static List<DownloadedEntry> entries() {
        String raw;
        try { raw = preferences().getString(ENTRIES_KEY, "[]"); }
        catch (ClassCastException ignored) { raw = "[]"; }
        List<DownloadedEntry> result = new ArrayList<>();
        try {
            JSONArray array = new JSONArray(raw == null ? "[]" : raw);
            for (int index = 0; index < array.length(); index++) {
                DownloadedEntry entry = DownloadedEntry.fromJson(array.optJSONObject(index));
                if (entry != null) result.add(entry);
            }
        } catch (JSONException error) { Log.e(TAG, "Unable to read download index", error); }
        return result;
    }

    /**
     * Returns indexed downloads whose video is currently available.
     *
     * The persisted index is deliberately retained when a file cannot be opened: an unavailable
     * removable drive is indistinguishable from an externally deleted SAF document. This keeps
     * USB downloads recoverable after reconnection while ensuring stale rows are not shown.
     */
    static List<DownloadedEntry> availableEntries() {
        Context context = application();
        List<DownloadedEntry> result = new ArrayList<>();
        for (DownloadedEntry entry : entries()) {
            if (entry.isReadable(context)) result.add(entry);
        }
        return result;
    }

    private static boolean saveEntry(DownloadedEntry completed) {
        List<DownloadedEntry> entries = entries();
        for (int index = entries.size() - 1; index >= 0; index--) {
            if (entries.get(index).sameIdentity(completed)) entries.remove(index);
        }
        entries.add(completed);
        JSONArray array = new JSONArray();
        for (DownloadedEntry entry : entries) array.put(entry.toJson());
        return preferences().edit().putString(ENTRIES_KEY, array.toString()).commit();
    }

    private static SharedPreferences preferences() {
        return application().getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    private static String encode(String value) {
        return URLEncoder.encode(value == null ? "" : value, StandardCharsets.UTF_8).replace("+", "%20");
    }
    private static String decode(String value) {
        try { return URLDecoder.decode(value == null ? "" : value, "UTF-8"); }
        catch (Exception ignored) { return value == null ? "" : value; }
    }
    private static String extensionOf(String value) {
        if (value == null) return "";
        int dot = value.lastIndexOf('.');
        return dot < 0 ? "" : value.substring(dot + 1).toLowerCase(Locale.ROOT);
    }
    private static String subtitleMimeType(String extension) {
        if ("srt".equals(extension)) return MimeTypes.APPLICATION_SUBRIP;
        if ("vtt".equals(extension)) return MimeTypes.TEXT_VTT;
        if ("ass".equals(extension) || "ssa".equals(extension)) return MimeTypes.TEXT_SSA;
        if ("ttml".equals(extension) || "dfxp".equals(extension)) return MimeTypes.APPLICATION_TTML;
        return MimeTypes.TEXT_UNKNOWN;
    }
    private static void toast(String message) {
        Activity activity = MorpheSettingsUi.resumedActivity();
        if (activity != null) activity.runOnUiThread(() ->
                Toast.makeText(activity, message, Toast.LENGTH_LONG).show());
    }

    private enum PendingAction { DOWNLOAD }
    enum Status { IDLE, PREPARING, DOWNLOADING, COMPLETE, FAILED, CANCELLED }

    static final class OptionContext {
        final Object target; final Function0<?> manualPlay; final boolean showManual;
        OptionContext(Object target, Function0<?> manualPlay, boolean showManual) {
            this.target = target; this.manualPlay = manualPlay; this.showManual = showManual;
        }
    }

    private static final class HeroContext {
        final Object meta;
        final Object video;
        final Function0<?> onPlayLongPress;
        HeroContext(Object meta, Object video, Function0<?> onPlayLongPress) {
            this.meta = meta;
            this.video = video;
            this.onPlayLongPress = onPlayLongPress;
        }
    }

    private enum NoOpAction implements Function0<Unit> {
        INSTANCE;
        @Override public Unit invoke() { return Unit.INSTANCE; }
    }

    private static final class WrappedOptions implements Function3<Object, Object, Object, Unit> {
        final Function3<Object, Object, Object, Unit> original; final OptionContext context;
        WrappedOptions(Function3<Object, Object, Object, Unit> original, OptionContext context) {
            this.original = original; this.context = context;
        }
        @Override public Unit invoke(Object scope, Object composer, Object flags) {
            LocalDownloadsRefreshState.observeForCompose();
            original.invoke(scope, composer, flags);
            if (!context.showManual || context.manualPlay == null || !LocalDownloadsSettings.isEnabled()) {
                return Unit.INSTANCE;
            }
            DownloadedEntry localEntry = entryForTarget(context.target);
            if (localEntry != null && localEntry.isReadable(application())) {
                renderLocalActionsRow(composer, () -> {
                    playLocal(context.target); return Unit.INSTANCE;
                }, () -> {
                    requestDeleteLocal(context.target); return Unit.INSTANCE;
                });
            } else {
                renderButton(composer, "Download to storage", () -> {
                    begin(PendingAction.DOWNLOAD, context.manualPlay); return Unit.INSTANCE;
                });
            }
            return Unit.INSTANCE;
        }
    }

    private static final class LabelContent implements Function3<Object, Object, Object, Unit> {
        final String label; LabelContent(String label) { this.label = label; }
        @Override public Unit invoke(Object scope, Object composer, Object flags) {
            renderText(composer, label); return Unit.INSTANCE;
        }
    }

    private static final class ResolvedCallback implements Function1<Object, Unit> {
        final Function1<Object, Unit> original;
        ResolvedCallback(Function1<Object, Unit> original) { this.original = original; }
        @Override public Unit invoke(Object value) {
            return interceptResolvedSelection(value) ? Unit.INSTANCE : original.invoke(value);
        }
    }

    static final class RouteIdentity {
        final String videoId, contentType, title, contentId, contentName, poster, backdrop, logo,
                episodeTitle, contentLanguage;
        final Integer season, episode;
        final boolean manualSelection;

        RouteIdentity(String videoId, String contentType, String title, Map<String, String> q) {
            this.videoId = videoId; this.contentType = contentType; this.title = title;
            this.contentId = q.getOrDefault("contentId", "");
            this.contentName = q.getOrDefault("contentName", title);
            this.poster = q.getOrDefault("poster", "");
            this.backdrop = q.getOrDefault("backdrop", "");
            this.logo = q.getOrDefault("logo", "");
            this.episodeTitle = q.getOrDefault("episodeName", "");
            this.contentLanguage = q.getOrDefault("contentLanguage", "");
            this.season = integer(q.get("season")); this.episode = integer(q.get("episode"));
            this.manualSelection = Boolean.parseBoolean(q.getOrDefault("manualSelection", "false"));
        }

        static RouteIdentity fromRoute(String route) {
            int queryAt = route.indexOf('?');
            String path = queryAt < 0 ? route : route.substring(0, queryAt);
            String[] parts = path.split("/", -1);
            if (parts.length < 4) return null;
            Map<String, String> q = new LinkedHashMap<>();
            if (queryAt >= 0) for (String field : route.substring(queryAt + 1).split("&")) {
                int equals = field.indexOf('=');
                q.put(decode(equals < 0 ? field : field.substring(0, equals)),
                        decode(equals < 0 ? "" : field.substring(equals + 1)));
            }
            return new RouteIdentity(decode(parts[1]), decode(parts[2]), decode(parts[3]), q);
        }
        private static Integer integer(String value) {
            try { return value == null || value.isEmpty() ? null : Integer.valueOf(value); }
            catch (NumberFormatException ignored) { return null; }
        }
    }

    static final class DownloadRequest {
        private static final Object FIELD_MISSING = new Object();
        private static final Pattern SIZE_PATTERN = Pattern.compile(
                "(?i)([0-9]+(?:[.,][0-9]+)?)\\s*(KB|MB|GB|TB)\\b"
        );
        final RouteIdentity identity;
        final String url, sourceTitle, filename, displayTitle, videoHash;
        final Map<String, String> headers;
        final Long declaredSize, sourceVideoSize;

        DownloadRequest(RouteIdentity identity, String url, String sourceTitle, String filename,
                        Map<String, String> headers, Long declaredSize, Long sourceVideoSize,
                        String videoHash) {
            this.identity = identity; this.url = url; this.sourceTitle = sourceTitle;
            this.filename = filename; this.headers = headers; this.declaredSize = declaredSize;
            this.sourceVideoSize = sourceVideoSize;
            this.videoHash = videoHash == null ? "" : videoHash;
            this.displayTitle = identity.contentName.isEmpty() ? identity.title : identity.contentName;
        }

        String progressTitle() {
            return mediaLabel(displayTitle, identity.season, identity.episode);
        }

        static DownloadRequest from(Object info, RouteIdentity identity) {
            if (info == null || identity == null) return null;
            Object[] values = fieldsInDeclarationOrder(info);
            // Kotlin's source declaration order is not preserved by DEX reflection: fields are
            // returned in field-id order (A, B, C, a, b, ...). Prefer Nuvio 0.8.4's compact
            // field names, while retaining named-getter and declaration-order fallbacks for tests
            // and future unobfuscated builds.
            String url = stringValue(info, "getUrl", "a", values, 0);
            boolean torrent = booleanValue(info, "isTorrent", "f", values, 5);
            String yt = stringValue(info, "getYtId", "h", values, 7);
            if (torrent || (yt != null && !yt.isEmpty()) || url == null) return null;
            String lower = url.toLowerCase(Locale.ROOT);
            if (!(lower.startsWith("http://") || lower.startsWith("https://")) ||
                    lower.contains(".m3u8") || lower.contains(".mpd")) return null;
            String title = stringValue(info, "getTitle", "b", values, 1);
            String filename = stringValue(info, "getFilename", "u", values, 20);
            if (filename == null || filename.trim().isEmpty()) {
                String path = Uri.parse(url).getLastPathSegment();
                filename = path == null || path.isEmpty() ? "video.mp4" : path;
            }
            Object rawHeaders = objectValue(info, "getHeaders", "i", values, 8);
            Map<String, String> headers = new LinkedHashMap<>();
            if (rawHeaders instanceof Map) {
                for (Object item : ((Map<?, ?>) rawHeaders).entrySet()) {
                    Map.Entry<?, ?> e = (Map.Entry<?, ?>) item;
                    if (e.getKey() != null && e.getValue() != null)
                        headers.put(String.valueOf(e.getKey()), String.valueOf(e.getValue()));
                }
            }
            Object size = objectValue(info, "getVideoSize", "w", values, 22);
            Long sourceVideoSize = size instanceof Number ? ((Number) size).longValue() : null;
            Long declaredSize = sourceVideoSize;
            if (declaredSize == null || declaredSize <= 0) {
                String description = stringValue(
                        info, "getStreamDescription", "z", values, 25
                );
                declaredSize = sizeFromText(description);
            }
            String videoHash = stringValue(info, "getVideoHash", "v", values, 21);
            return new DownloadRequest(identity, url, title == null ? identity.title : title,
                    filename, headers, declaredSize, sourceVideoSize, videoHash);
        }

        private static Long sizeFromText(String value) {
            if (value == null || value.isEmpty()) return null;
            Matcher matcher = SIZE_PATTERN.matcher(value);
            if (!matcher.find()) return null;
            try {
                double amount = Double.parseDouble(matcher.group(1).replace(',', '.'));
                String unit = matcher.group(2).toUpperCase(Locale.ROOT);
                double multiplier = "TB".equals(unit) ? 1_099_511_627_776.0 :
                        "GB".equals(unit) ? 1_073_741_824.0 :
                        "MB".equals(unit) ? 1_048_576.0 : 1024.0;
                double bytes = amount * multiplier;
                if (!Double.isFinite(bytes) || bytes <= 0) return null;
                return bytes >= Long.MAX_VALUE ? Long.MAX_VALUE : (long) Math.ceil(bytes);
            } catch (RuntimeException ignored) {
                return null;
            }
        }

        static Object[] fieldsInDeclarationOrder(Object info) {
            List<Object> result = new ArrayList<>();
            for (Field field : info.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                try { field.setAccessible(true); result.add(field.get(info)); }
                catch (Throwable ignored) { result.add(null); }
            }
            return result.toArray();
        }
        private static Object objectValue(
                Object info, String getter, String compactField, Object[] values, int index
        ) {
            Object reflected = property(info, getter);
            if (reflected == null) {
                Object compact = fieldValue(info, compactField);
                if (compact != FIELD_MISSING) return compact;
            }
            return reflected != null ? reflected : index < values.length ? values[index] : null;
        }
        static String stringValue(Object info, String getter, Object[] values, int index) {
            return stringValue(info, getter, null, values, index);
        }
        private static String stringValue(
                Object info, String getter, String compactField, Object[] values, int index
        ) {
            Object value = objectValue(info, getter, compactField, values, index);
            return value instanceof String ? (String) value : null;
        }
        private static boolean booleanValue(
                Object info, String getter, String compactField, Object[] values, int index
        ) {
            Object value = objectValue(info, getter, compactField, values, index);
            return value instanceof Boolean && (Boolean) value;
        }
        private static Object fieldValue(Object info, String name) {
            if (name == null || name.isEmpty()) return FIELD_MISSING;
            for (Class<?> owner = info.getClass(); owner != null; owner = owner.getSuperclass()) {
                try {
                    Field field = owner.getDeclaredField(name);
                    field.setAccessible(true);
                    return field.get(info);
                } catch (Throwable ignored) { }
            }
            return FIELD_MISSING;
        }
    }

    static final class SubtitleDownload {
        final String url, language;
        SubtitleDownload(String url, String language) { this.url = url; this.language = language; }
    }

    static final class DownloadedEntry {
        final String contentId, videoId, contentType, displayTitle, mediaUri, folderUri, filename, poster,
                backdrop, logo, episodeTitle, contentLanguage;
        final Integer season, episode;
        final long size;
        final List<String> subtitleUris;

        DownloadedEntry(RouteIdentity id, String mediaUri, String filename, long size,
                        List<String> subtitleUris) {
            this(id, mediaUri, "", filename, size, subtitleUris);
        }

        DownloadedEntry(RouteIdentity id, String mediaUri, String folderUri, String filename, long size,
                        List<String> subtitleUris) {
            contentId = id.contentId; videoId = id.videoId; contentType = id.contentType;
            displayTitle = id.contentName.isEmpty() ? id.title : id.contentName;
            this.mediaUri = mediaUri; this.folderUri = folderUri == null ? "" : folderUri;
            this.filename = filename; this.size = size;
            poster = id.poster; backdrop = id.backdrop; logo = id.logo;
            season = id.season; episode = id.episode; episodeTitle = id.episodeTitle;
            contentLanguage = id.contentLanguage;
            this.subtitleUris = Collections.unmodifiableList(new ArrayList<>(subtitleUris));
        }
        String displayLabel() { return mediaLabel(displayTitle, season, episode); }
        String resolvedFolderUri() {
            if (!folderUri.isEmpty()) return folderUri;
            try {
                Uri media = Uri.parse(mediaUri);
                if ("file".equalsIgnoreCase(media.getScheme())) {
                    File parent = new File(media.getPath()).getParentFile();
                    return parent == null ? "" : Uri.fromFile(parent).toString();
                }
                if ("content".equalsIgnoreCase(media.getScheme())) {
                    String id = DocumentsContract.getDocumentId(media);
                    int separator = id.lastIndexOf('/');
                    if (separator > 0) return DocumentsContract.buildDocumentUriUsingTree(
                            media, id.substring(0, separator)).toString();
                }
            } catch (Throwable ignored) { }
            return "";
        }

        boolean matches(RouteIdentity id) {
            if (!contentId.isEmpty() && !id.contentId.isEmpty() && !contentId.equals(id.contentId)) return false;
            if (contentId.equals(id.contentId) && matchesEpisode(id.season, id.episode)) return true;
            if (!videoId.isEmpty() || !id.videoId.isEmpty()) return videoId.equals(id.videoId);
            return contentId.equals(id.contentId);
        }
        boolean matchesEpisode(Integer candidateSeason, Integer candidateEpisode) {
            return season != null && episode != null && candidateSeason != null &&
                    candidateEpisode != null && season.equals(candidateSeason) &&
                    episode.equals(candidateEpisode);
        }
        boolean isMovie() {
            return "movie".equalsIgnoreCase(contentType) || (season == null && episode == null);
        }
        boolean sameIdentity(DownloadedEntry other) {
            if (!contentId.equals(other.contentId)) return false;
            return matchesEpisode(other.season, other.episode) || videoId.equals(other.videoId);
        }
        boolean isReadable(Context context) {
            try {
                Uri uri = Uri.parse(mediaUri);
                if ("file".equalsIgnoreCase(uri.getScheme())) return new java.io.File(uri.getPath()).isFile();
                android.os.ParcelFileDescriptor fd = context.getContentResolver().openFileDescriptor(uri, "r");
                if (fd == null) return false;
                fd.close(); return true;
            } catch (Exception ignored) { return false; }
        }
        String playerRoute() {
            String title = episodeTitle.isEmpty() ? displayTitle : episodeTitle;
            return "player/" + encode(mediaUri) + "/" + encode(title) +
                    "?streamName=" + encode("Local Download") + "&year=&headers=" +
                    "&contentId=" + encode(contentId) + "&contentType=" + encode(contentType) +
                    "&contentName=" + encode(displayTitle) + "&poster=" + encode(poster) +
                    "&backdrop=" + encode(backdrop) + "&logo=" + encode(logo) +
                    "&videoId=" + encode(videoId) + "&season=" + (season == null ? "" : season) +
                    "&episode=" + (episode == null ? "" : episode) +
                    "&episodeTitle=" + encode(episodeTitle) + "&bingeGroup=&autoPlayNav=false" +
                    "&returnToDetailOnBack=true&returnToHomeOnBack=false&filename=" + encode(filename) +
                    "&videoHash=&videoSize=" + Math.max(0L, size) + "&startFromBeginning=false" +
                    "&addonName=&addonLogo=&streamDescription=&infoHash=&fileIdx=&sources=" +
                    "&contentLanguage=" + encode(contentLanguage) + "&launchStartedAtMs=" +
                    SystemClock.elapsedRealtime();
        }
        JSONObject toJson() {
            JSONObject value = new JSONObject();
            try {
                value.put("contentId", contentId).put("videoId", videoId).put("contentType", contentType)
                        .put("displayTitle", displayTitle).put("mediaUri", mediaUri)
                        .put("folderUri", folderUri).put("filename", filename)
                        .put("poster", poster).put("backdrop", backdrop).put("logo", logo)
                        .put("episodeTitle", episodeTitle).put("contentLanguage", contentLanguage)
                        .put("season", season).put("episode", episode).put("size", size)
                        .put("subtitles", new JSONArray(subtitleUris));
            } catch (JSONException ignored) { }
            return value;
        }
        static DownloadedEntry fromJson(JSONObject value) {
            if (value == null) return null;
            Map<String, String> q = new LinkedHashMap<>();
            q.put("contentId", value.optString("contentId")); q.put("contentName", value.optString("displayTitle"));
            q.put("poster", value.optString("poster")); q.put("backdrop", value.optString("backdrop"));
            q.put("logo", value.optString("logo")); q.put("episodeName", value.optString("episodeTitle"));
            q.put("contentLanguage", value.optString("contentLanguage"));
            if (value.has("season") && !value.isNull("season")) q.put("season", String.valueOf(value.optInt("season")));
            if (value.has("episode") && !value.isNull("episode")) q.put("episode", String.valueOf(value.optInt("episode")));
            RouteIdentity id = new RouteIdentity(value.optString("videoId"), value.optString("contentType"),
                    value.optString("displayTitle"), q);
            JSONArray subtitles = value.optJSONArray("subtitles");
            List<String> uris = new ArrayList<>();
            if (subtitles != null) for (int i = 0; i < subtitles.length(); i++) uris.add(subtitles.optString(i));
            return new DownloadedEntry(id, value.optString("mediaUri"), value.optString("folderUri"),
                    value.optString("filename"),
                    value.optLong("size"), uris);
        }
    }

    static final class DeleteResult {
        final boolean mediaDeleted;
        final boolean complete;
        final String message;
        DeleteResult(boolean mediaDeleted, boolean complete, String message) {
            this.mediaDeleted = mediaDeleted;
            this.complete = complete;
            this.message = message;
        }
        static DeleteResult success(String message) { return new DeleteResult(true, true, message); }
        static DeleteResult failure(String message) { return new DeleteResult(false, false, message); }
    }

    static final class DeleteAllResult {
        final int deleted;
        final int failures;
        final String message;

        DeleteAllResult(int deleted, int failures, String message) {
            this.deleted = deleted;
            this.failures = failures;
            this.message = message;
        }
    }

    static final class DownloadState {
        final Status status; final String title, message; final long bytes, total;
        DownloadState(Status status, String title, String message, long bytes, long total) {
            this.status = status; this.title = title; this.message = message; this.bytes = bytes; this.total = total;
        }
        static DownloadState idle() { return new DownloadState(Status.IDLE, "", "", 0, -1); }
        static DownloadState preparing(String title) { return new DownloadState(Status.PREPARING, title, "Checking source and storage", 0, -1); }
        static DownloadState downloading(String title, long bytes, long total) { return new DownloadState(Status.DOWNLOADING, title, "Downloading", bytes, total); }
        static DownloadState complete(String title) { return new DownloadState(Status.COMPLETE, title, "Download finished successfully", 0, 0); }
        static DownloadState failed(String title, String message) { return new DownloadState(Status.FAILED, title, message, 0, 0); }
        static DownloadState cancelled(String title) { return new DownloadState(Status.CANCELLED, title, "Download cancelled", 0, 0); }
    }
}
