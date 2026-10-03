package app.morphe.extension.facebook;

import android.app.Activity;
import android.app.Application;
import android.app.DownloadManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.MediaStore;
import android.util.Log;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import app.morphe.extension.facebook.media.DashManifestParser;
import app.morphe.extension.facebook.media.DownloadQuality;
import app.morphe.extension.facebook.media.FacebookPageMediaExtractor;
import app.morphe.extension.facebook.media.MediaTransfer;
import app.morphe.extension.facebook.media.MediaVariant;
import app.morphe.extension.facebook.media.MediaVariantSelector;
import app.morphe.extension.facebook.media.MediaResizer;
import app.morphe.extension.facebook.media.Mp4TrackMuxer;
import app.morphe.extension.facebook.settings.DeVancedSettings;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Downloads the media currently displayed in a Facebook Reel or Story. */
public final class MediaDownloader {
    private static final String LITHO_TAG = "MorpheLitho";
    private static final int MAX_DEPTH = 12;
    private static final int MAX_VISITS = 5_000;
    private static final int MAX_CANDIDATES = 128;
    private static final int MAX_DOWNLOAD_ATTEMPTS_PER_ROUND = 32;
    private static final String DOWNLOAD_CACHE_DIRECTORY =
            "morphe_facebook_media";
    private static final String DOWNLOAD_NOTIFICATION_CHANNEL =
            "morphe_facebook_downloads_v1";
    private static final int DOWNLOAD_NOTIFICATION_ID = 0x4D4F52;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean INITIALIZED = new AtomicBoolean(false);
    private static final AtomicBoolean DOWNLOAD_IN_PROGRESS = new AtomicBoolean(false);
    private static final ArrayList<WeakReference<Object>> CAPTURED_SOURCES = new ArrayList<>();
    private static final ArrayList<WeakReference<Object>> RECENT_PLAYER_PARAMS =
            new ArrayList<>();
    private static final Map<Object, Object> STORY_MENU_ITEMS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static volatile WeakReference<Object> currentStoryCard = new WeakReference<>(null);
    private static volatile WeakReference<Object> currentReelsMenuOwner =
            new WeakReference<>(null);
    private static volatile WeakReference<Object> currentReelsModel =
            new WeakReference<>(null);

    private static final Pattern CDN_URL = Pattern.compile(
            "https?://[^\"'\\s]+?(?:fbcdn\\.net|cdninstagram\\.com)[^\"'\\s]*",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern URL_DIMENSIONS = Pattern.compile(
            "(?:^|[=&_./-])(?:s|p)?(\\d{2,4})x(\\d{2,4})(?:[=&_./-]|$)",
            Pattern.CASE_INSENSITIVE
    );

    private static volatile Application application;
    private static volatile long installedVersionCode = Long.MIN_VALUE;
    private static volatile boolean downloadNotificationsAvailable = true;

    private MediaDownloader() {
    }

    public static void initialize(Application app) {
        if (app == null) return;
        application = app;
        if (INITIALIZED.compareAndSet(false, true)) {
            app.registerActivityLifecycleCallbacks(new ReelMenuInjector());
            new Thread(
                    () -> {
                        PerformanceOptimizer.applyBackgroundThreadPriority();
                        cleanupOldDownloadCache(app);
                    },
                    "MorpheFacebookDownloadCleanup"
            ).start();
        }
    }

    public static void downloadActiveMedia(Activity activity) {
        if (activity == null) return;
        if (!DOWNLOAD_IN_PROGRESS.compareAndSet(false, true)) {
            Toast.makeText(activity, "A download is already running.", Toast.LENGTH_SHORT).show();
            return;
        }
        boolean detectedVideoSurface = currentStoryCard.get() == null &&
                currentReelsModel.get() != null;
        if (!detectedVideoSurface) {
            detectedVideoSurface = hasVisibleVideoSurface(activity);
        }
        final boolean videoSurface = detectedVideoSurface;
        final DownloadQuality downloadQuality =
                DeVancedSettings.getDownloadQuality();
        Context appContext = activity.getApplicationContext();
        WeakReference<Activity> activityReference = new WeakReference<>(activity);
        List<Object> retainedSources = snapshotActiveSources();
        showDownloadPreparing(
                appContext,
                downloadQuality == DownloadQuality.HIGHEST
                        ? "Finding highest-quality media\u2026"
                        : "Finding " +
                                downloadQuality.displayName() +
                                " media\u2026"
        );
        Toast.makeText(activity, "Preparing download\u2026", Toast.LENGTH_SHORT).show();
        new Thread(
                () -> prepareSystemDownload(
                        appContext,
                        activityReference,
                        videoSurface,
                        retainedSources,
                        downloadQuality
                ),
                "MorpheFacebookPrepare"
        ).start();
    }

    public static void captureStoryCard(Object storyCard) {
        if (storyCard == null) return;
        Object previous = currentStoryCard.get();
        if (previous != storyCard) {
            synchronized (CAPTURED_SOURCES) {
                CAPTURED_SOURCES.clear();
            }
            currentStoryCard = new WeakReference<>(storyCard);
            currentReelsMenuOwner = new WeakReference<>(null);
            currentReelsModel = new WeakReference<>(null);
            trace(
                    "story capture type=" + storyCard.getClass().getName() +
                            " thread=" + Thread.currentThread().getName()
            );
        }
        captureMenuSource(storyCard);
        try {
            Method getMedia = storyCard.getClass().getMethod("getMedia");
            captureMenuSource(getMedia.invoke(storyCard));
        } catch (Throwable ignored) {
        }
        try {
            Method getPreviewUrl = storyCard.getClass().getMethod("getPreviewUrl");
            captureMenuSource(getPreviewUrl.invoke(storyCard));
        } catch (Throwable ignored) {
        }
    }

    public static void captureMenuSource(Object source) {
        if (source == null) return;
        synchronized (CAPTURED_SOURCES) {
            for (int i = CAPTURED_SOURCES.size() - 1; i >= 0; i--) {
                Object current = CAPTURED_SOURCES.get(i).get();
                if (current == null) {
                    CAPTURED_SOURCES.remove(i);
                } else if (current == source) {
                    return;
                }
            }
            CAPTURED_SOURCES.add(new WeakReference<>(source));
            while (CAPTURED_SOURCES.size() > 12) CAPTURED_SOURCES.remove(0);
        }
    }

    public static void capturePlayerParams(Object params) {
        if (params == null) return;
        synchronized (RECENT_PLAYER_PARAMS) {
            for (int index = RECENT_PLAYER_PARAMS.size() - 1;
                 index >= 0;
                 index--) {
                Object current = RECENT_PLAYER_PARAMS.get(index).get();
                if (current == null) {
                    RECENT_PLAYER_PARAMS.remove(index);
                } else if (current == params) {
                    return;
                }
            }
            RECENT_PLAYER_PARAMS.add(new WeakReference<>(params));
            while (RECENT_PLAYER_PARAMS.size() > 24) {
                RECENT_PLAYER_PARAMS.remove(0);
            }
        }
    }

    public static void finalizeStoryMenuBuilder(Object builder) {
        traceStoryBuilder("direct", builder);
        finalizeStoryMenu(currentStoryCard.get(), builder);
    }

    public static void finalizeStoryMenuHelperBuilder(Object builder) {
        traceStoryBuilder("3TE.A03", builder);
        finalizeStoryMenu(currentStoryCard.get(), builder);
    }

    public static void finalizeStoryMenuWithSource(Object source, Object builder) {
        traceStoryBuilder("an5-return", builder);
        finalizeStoryMenu(source, builder);
    }

    public static Object finalizeStoryMenuItems(Object value) {
        ArrayList<Object> items = new ArrayList<>();
        if (value instanceof Iterable<?>) {
            for (Object item : (Iterable<?>) value) items.add(item);
        }
        Object source = currentStoryCard.get();
        if (source == null) {
            trace("story final list source-null");
            return value;
        }
        Object row = createStoryRow(source, items);
        if (row == null) {
            return value;
        }
        try {
            Class<?> immutableList =
                    Class.forName("com.google.common.collect.ImmutableList");
            Object builder = immutableList.getMethod("builder").invoke(null);
            Method add = builder.getClass().getMethod("add", Object.class);
            for (Object item : items) {
                add.invoke(builder, item);
            }
            add.invoke(builder, row);
            Object result = builder.getClass().getMethod("build").invoke(builder);
            trace(
                    "story final list row=" + row.getClass().getName() +
                            " size=" + (items.size() + 1)
            );
            return result;
        } catch (Throwable error) {
            trace("story final immutable list failed " + error);
            return value;
        }
    }

    public static void finalizeStoryControlRows(Object rows) {
        List<Object> items = mutableList(rows);
        if (items == null) {
            trace("story control rows not-list type=" + typeName(rows));
            return;
        }
        trace(
                "story control rows before=" + items.size() +
                        " types=" + describeItems(items)
        );
        Object source = currentStoryCard.get();
        Object row = createStoryControlRow(source);
        if (row == null) {
            trace("story control row-null");
            return;
        }
        removeMorpheItems(items);
        items.add(row);
        trace(
                "story control row-added=" + row.getClass().getName() +
                        " size=" + items.size()
        );
    }

    public static void finalizeFbShortsControlMenu(
            Object userSession,
            Object storyModel,
            Object componentContext,
            Object reelContext,
            Object primaryMenu,
            Object secondaryMenu
    ) {
        captureMenuSource(storyModel);
        captureMenuSource(reelContext);

        List<Object> primary = mutableList(primaryMenu);
        List<Object> secondary = mutableList(secondaryMenu);
        trace(
                "fbshorts hook primary=" + sizeOf(primary) +
                        " secondary=" + sizeOf(secondary) +
                        " thread=" + Thread.currentThread().getName()
        );

        Object row = createReelsRow(componentContext);
        if (row == null) {
            trace("fbshorts row-null");
            return;
        }

        try {
            ClassLoader loader = row.getClass().getClassLoader();
            if (primary != null) {
                removeMorpheItems(primary);
                Class<?> wrapperType =
                        loadFacebookClass(loader, "X.bAY", "X.Zfo");
                Constructor<?> constructor =
                        wrapperType.getDeclaredConstructor(Object.class, Integer.TYPE);
                constructor.setAccessible(true);
                Object wrapper = constructor.newInstance(row, 0);
                primary.add(wrapper);
                trace(
                        "fbshorts primary-added=" + wrapper.getClass().getName() +
                                " size=" + primary.size()
                );
            }
            if (secondary != null && secondary != primary) {
                removeMorpheItems(secondary);
                Class<?> helperType =
                        loadFacebookClass(
                                loader,
                                "X.Y6J",
                                "X.bAi",
                                "X.Zg7"
                        );
                Method add = helperType.getDeclaredMethod(
                        "A00",
                        Object.class,
                        List.class,
                        Integer.TYPE
                );
                add.setAccessible(true);
                add.invoke(null, row, secondary, 0);
                trace("fbshorts secondary-added size=" + secondary.size());
            }
        } catch (Throwable error) {
            trace("fbshorts add failed " + error);
        }
    }

    public static void finalizeReelsMenu(
            Object userSession,
            Object callerContext,
            Object storyModel,
            Object reelContext,
            Object verifiedConfig,
            Object actionProvider,
            Object componentContext,
            Object playerOrigin,
            Object reelMedia,
            Object reelMetadata,
            Object reelId,
            Object menu,
            Object callback,
            boolean flag1,
            boolean flag2,
            boolean flag3
    ) {
        synchronized (CAPTURED_SOURCES) {
            CAPTURED_SOURCES.clear();
        }
        currentStoryCard = new WeakReference<>(null);
        currentReelsMenuOwner = new WeakReference<>(reelContext);
        currentReelsModel = new WeakReference<>(storyModel);
        captureMenuSource(storyModel);
        captureMenuSource(reelContext);
        captureMenuSource(verifiedConfig);
        captureMenuSource(reelMedia);
        captureMenuSource(reelMetadata);
        captureMenuSource(reelId);
        captureMenuSource(callback);

        if (!(menu instanceof List<?>)) {
            trace("reels hook menu-not-list type=" + typeName(menu));
            return;
        }
        @SuppressWarnings("unchecked")
        List<Object> items = (List<Object>) menu;
        trace(
                "reels hook before=" + items.size() +
                        " types=" + describeItems(items) +
                        " thread=" + Thread.currentThread().getName()
        );
        appendReelsDownloadItem(componentContext, items, "reels overflow");
    }

    public static void finalizeReturnedReelsMenu(Object owner, Object menu) {
        if (owner == null) return;

        captureReturnedReel(owner);
        List<Object> items = mutableList(menu);
        if (items == null) return;
        appendReturnedReelsDownloadItem(owner, items);
    }

    private static void captureReturnedReel(Object owner) {
        Object model = fieldValueByType(owner, "X.5L3", "X.9BL");
        if (model == null) model = fieldValue(owner, "A06");
        if (currentReelsMenuOwner.get() == owner &&
                currentReelsModel.get() == model) {
            return;
        }

        synchronized (CAPTURED_SOURCES) {
            CAPTURED_SOURCES.clear();
        }
        currentStoryCard = new WeakReference<>(null);
        currentReelsMenuOwner = new WeakReference<>(owner);
        currentReelsModel = new WeakReference<>(model);

        captureMenuSource(owner);
        captureMenuSource(fieldValue(owner, "A08"));
        captureMenuSource(fieldValue(owner, "A09"));
        captureMenuSource(fieldValue(owner, "A0H"));
        captureMenuSource(model);
        trace(
                "reels capture owner=" + owner.getClass().getName() +
                        " model=" + typeName(model)
        );
    }

    private static void appendReelsDownloadItem(
            Object classLoaderSource,
            List<Object> items,
            String source
    ) {
        try {
            Object row = createReelsRow(classLoaderSource);
            if (row == null) {
                trace(source + " row-null");
                return;
            }

            removeMorpheItems(items);
            ClassLoader loader = row.getClass().getClassLoader();
            Class<?> wrapperHelper = null;
            Object sample = null;
            for (Object item : items) {
                if (item != null) {
                    sample = item;
                    break;
                }
            }
            if (sample != null) {
                Class<?> yls = Class.forName("X.Yls", false, loader);
                Class<?> ylt = Class.forName("X.Ylt", false, loader);
                if (yls.isInstance(sample)) {
                    wrapperHelper = Class.forName("X.Y65", false, loader);
                } else if (ylt.isInstance(sample)) {
                    wrapperHelper = Class.forName("X.Y6J", false, loader);
                }
            }
            if (wrapperHelper == null) {
                wrapperHelper = loadFacebookClass(
                        loader,
                        "X.Y6J",
                        "X.bAi",
                        "X.Zg7"
                );
            }
            Method add = wrapperHelper.getDeclaredMethod(
                    "A00",
                    Object.class,
                    List.class,
                    Integer.TYPE
            );
            add.setAccessible(true);
            add.invoke(null, row, items, 0);
            Object inserted = items.isEmpty() ? null : items.get(items.size() - 1);
            trace(
                    source + " wrapper-added=" + typeName(inserted) +
                            " row=" + row.getClass().getName() +
                            " after=" + items.size() +
                            " thread=" + Thread.currentThread().getName()
            );
        } catch (Throwable error) {
            trace(source + " add failed " + error);
        }
    }

    private static void appendReturnedReelsDownloadItem(
            Object classLoaderSource,
            List<Object> items
    ) {
        try {
            Object row = createReelsRow(classLoaderSource);
            if (row == null) {
                trace("reels returned row-null");
                return;
            }
            removeMorpheItems(items);
            ClassLoader loader = row.getClass().getClassLoader();
            Class<?> wrapperHelper;
            if (getInstalledVersionCode() == 474618930L) {
                Object sample = null;
                for (Object item : items) {
                    if (item != null) {
                        sample = item;
                        break;
                    }
                }
                if (sample == null) {
                    trace("reels returned list-empty; wrapper type unknown");
                    return;
                }
                Class<?> yls = Class.forName("X.Yls", false, loader);
                Class<?> ylt = Class.forName("X.Ylt", false, loader);
                String wrapperName;
                if (yls.isInstance(sample)) {
                    wrapperName = "X.Y65";
                } else if (ylt.isInstance(sample)) {
                    wrapperName = "X.Y6J";
                } else {
                    trace(
                            "reels returned unsupported item=" +
                                    sample.getClass().getName()
                    );
                    return;
                }
                wrapperHelper = Class.forName(
                        wrapperName,
                        false,
                        loader
                );
            } else {
                wrapperHelper = loadFacebookClass(
                        loader,
                        "X.bAi",
                        "X.Zg7"
                );
            }
            Method add = wrapperHelper.getDeclaredMethod(
                    "A00",
                    Object.class,
                    List.class,
                    Integer.TYPE
            );
            add.setAccessible(true);
            add.invoke(null, row, items, 0);
            Object inserted = items.isEmpty()
                    ? null
                    : items.get(items.size() - 1);
            trace(
                    "reels returned wrapper-added=" + typeName(inserted) +
                            " helper=" + wrapperHelper.getName() +
                            " row=" + row.getClass().getName() +
                            " after=" + items.size() +
                            " thread=" + Thread.currentThread().getName()
            );
        } catch (Throwable error) {
            trace("reels returned add failed " + error);
        }
    }

    private static void finalizeStoryMenu(Object source, Object builder) {
        if (source == null || builder == null) {
            trace(
                    "story finalize missing source=" + typeName(source) +
                            " builder=" + typeName(builder)
            );
            return;
        }
        captureStoryFromCallback(source);

        synchronized (STORY_MENU_ITEMS) {
            Object item = STORY_MENU_ITEMS.get(builder);
            if (item == null) {
                item = createStoryMenuItem(source, builder);
                if (item == null) {
                    trace("story create returned null");
                    return;
                }
                if (!builderAdd(builder, item)) {
                    trace("story builder add failed item=" + item.getClass().getName());
                    return;
                }
                STORY_MENU_ITEMS.put(builder, item);
                trace(
                        "story item added=" + item.getClass().getName() +
                                " thread=" + Thread.currentThread().getName()
                );
            }
            moveBuilderItemToEnd(builder, item);
        }
    }

    private static void captureStoryFromCallback(Object source) {
        captureMenuSource(source);
        for (Class<?> current = source.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (!field.getType().getName().equals("com.facebook.stories.model.StoryCard")) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    captureStoryCard(field.get(source));
                } catch (Throwable ignored) {
                }
            }
        }
    }

    private static Object createStoryMenuItem(Object source, Object builder) {
        List<Object> items = builderItems(builder);
        return createStoryRow(source, items);
    }

    private static Object createStoryRow(Object source, List<Object> items) {
        if (source == null) return null;
        trace("story snapshot size=" + items.size() + " types=" + describeItems(items));
        for (Object item : items) {
            if (isMorpheReelDownloadItem(item)) {
                trace("story builder already contains the download row");
                return null;
            }
        }
        Object template = null;
        for (Object item : items) {
            if (item == null) continue;
            try {
                for (Constructor<?> candidate : item.getClass().getDeclaredConstructors()) {
                    if (candidate.getParameterCount() == 10) {
                        template = item;
                        break;
                    }
                }
            } catch (Throwable ignored) {
            }
            if (template != null) {
                break;
            }
        }
        try {
            ClassLoader loader = template != null
                    ? template.getClass().getClassLoader()
                    : source.getClass().getClassLoader();
            if (loader == null) loader = MediaDownloader.class.getClassLoader();
            Class<?> itemClass = template != null
                    ? template.getClass()
                    : loadFacebookClass(loader, "X.Xpz", "X.Z5x");
            Constructor<?> constructor = null;
            for (Constructor<?> candidate : itemClass.getDeclaredConstructors()) {
                if (candidate.getParameterCount() == 10) {
                    constructor = candidate;
                    break;
                }
            }
            if (constructor == null) return null;
            constructor.setAccessible(true);

            Class<?> callbackInterface = constructor.getParameterTypes()[0];
            Object callback = Proxy.newProxyInstance(
                    callbackInterface.getClassLoader(),
                    new Class<?>[]{callbackInterface},
                    (proxy, method, args) -> {
                        if (method.getDeclaringClass() == Object.class) {
                            if (method.getName().equals("toString")) return "MorpheDownloadMedia";
                            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                            if (method.getName().equals("equals")) {
                                return args != null && args.length == 1 && proxy == args[0];
                            }
                        }
                        trace(
                                "story click method=" + method.getName() +
                                        " thread=" + Thread.currentThread().getName()
                        );
                        captureStoryFromCallback(source);
                        downloadActiveMedia(ReelMenuInjector.getCurrentActivity());
                        return defaultValue(method.getReturnType());
                    }
            );

            Context context = contextFromSource(source);
            int drawableId = nativeDownloadIcon(context);
            Object fallbackIcon = template == null ? null : fieldValue(template, "A02");
            Class<?> iconType = constructor.getParameterTypes()[1];
            Object icon = staticFieldValue(iconType, "A85");
            if (icon == null) icon = staticFieldValue(iconType, "AHO");
            if (icon == null) icon = staticFieldValue(iconType, "AIX");
            if (icon == null) icon = staticFieldValue(iconType, "A81");
            if (icon == null) {
                icon = resolveIconToken(iconType, drawableId, fallbackIcon);
            }
            if (icon == null) {
                trace("story create icon-null");
                return null;
            }

            return constructor.newInstance(
                    callback,
                    icon,
                    null,
                    null,
                    null,
                    null,
                    "Download media",
                    "morphe_download_media",
                    10_001,
                    false
            );
        } catch (Throwable error) {
            trace("story create failed " + error);
            return null;
        }
    }

    private static Object createReelsMenuItem(Object componentContext) {
        String stage = "class-loader";
        try {
            Object row = createReelsRow(componentContext);
            if (row == null) return null;
            ClassLoader loader = row.getClass().getClassLoader();
            Class<?> menuItemType =
                    loadFacebookClass(loader, "X.W0u", "X.aNh");
            stage = "menu-item-proxy";
            Object menuItem = Proxy.newProxyInstance(
                    loader,
                    new Class<?>[]{menuItemType},
                    (proxy, method, args) -> {
                        if (method.getDeclaringClass() == Object.class) {
                            if (method.getName().equals("toString")) {
                                return "MorpheReelsDownloadItem";
                            }
                            if (method.getName().equals("hashCode")) {
                                return System.identityHashCode(proxy);
                            }
                            if (method.getName().equals("equals")) {
                                return args != null && args.length == 1 && proxy == args[0];
                            }
                        }
                        if (method.getName().equals("ADU") ||
                                method.getName().equals("AE7")) {
                            trace(
                                    "reels ADU row=" + row.getClass().getName() +
                                            " thread=" + Thread.currentThread().getName()
                            );
                            return row;
                        }
                        return defaultValue(method.getReturnType());
                    }
            );
            trace(
                    "reels create success item=" + menuItem.getClass().getName() +
                            " row=" + row.getClass().getName()
            );
            return menuItem;
        } catch (Throwable error) {
            trace("reels create failed stage=" + stage + " error=" + error);
            return null;
        }
    }

    private static Class<?> load580Class(String name, ClassLoader componentLoader) throws ClassNotFoundException {
        ClassLoader[] loaders = {
                MediaDownloader.class.getClassLoader(),
                componentLoader,
                Thread.currentThread().getContextClassLoader()
        };
        ClassNotFoundException last = null;
        for (ClassLoader loader : loaders) {
            if (loader == null) continue;
            try {
                return Class.forName(name, false, loader);
            } catch (ClassNotFoundException error) {
                last = error;
            }
        }
        throw last == null ? new ClassNotFoundException(name) : last;
    }

    private static Object createReelsRow580(Object componentContext) {
        String stage = "class-loader";
        try {
            ClassLoader componentLoader = componentContext != null
                    ? componentContext.getClass().getClassLoader()
                    : null;
            stage = "load-types";
            Class<?> callbackType = load580Class("X.UsP", componentLoader);
            Class<?> iconTokenType = load580Class("X.1OQ", componentLoader);
            Class<?> iconType = load580Class("X.TuL", componentLoader);
            Class<?> rowType = load580Class("X.S8T", componentLoader);

            stage = "click-proxy";
            ClassLoader callbackLoader = callbackType.getClassLoader();
            Object callback = Proxy.newProxyInstance(
                    callbackLoader,
                    new Class<?>[]{callbackType},
                    (proxy, method, args) -> {
                        if (method.getDeclaringClass() == Object.class) {
                            if (method.getName().equals("toString")) {
                                return "MorpheReelsDownload";
                            }
                            if (method.getName().equals("hashCode")) {
                                return System.identityHashCode(proxy);
                            }
                            if (method.getName().equals("equals")) {
                                return args != null && args.length == 1 && proxy == args[0];
                            }
                        }
                        trace("reels 580 click method=" + method.getName());
                        downloadActiveMedia(ReelMenuInjector.getCurrentActivity());
                        return defaultValue(method.getReturnType());
                    }
            );

            stage = "icon";
            Object iconToken = staticFieldValue(iconTokenType, "A85");
            if (iconToken == null) iconToken = staticFieldValue(iconTokenType, "AHO");
            if (iconToken == null) iconToken = staticFieldValue(iconTokenType, "AIX");
            if (iconToken == null) {
                trace("reels 580 icon-token-null");
                return null;
            }
            java.lang.reflect.Method iconFactory =
                    iconType.getDeclaredMethod("A00", iconTokenType);
            iconFactory.setAccessible(true);
            Object icon = iconFactory.invoke(null, iconToken);

            stage = "row";
            Constructor<?> rowConstructor = rowType.getDeclaredConstructor(
                    callbackType,
                    iconType,
                    Boolean.class,
                    CharSequence.class,
                    CharSequence.class,
                    CharSequence.class,
                    Integer.class
            );
            rowConstructor.setAccessible(true);
            Object row = rowConstructor.newInstance(
                    callback,
                    icon,
                    null,
                    "Download media",
                    null,
                    "morphe_download_media",
                    null
            );
            trace("reels 580 row success=" + row.getClass().getName());
            return row;
        } catch (Throwable error) {
            trace("reels 580 row failed stage=" + stage + " error=" + error);
            return null;
        }
    }

    public static void finalizeReelsMoreSheet(Object componentContext, Object menu) {
        if (!(menu instanceof java.util.List<?>)) {
            trace("reels more-sheet menu-not-list type=" + typeName(menu));
            return;
        }
        try {
            Object row = createReelsRow580(componentContext);
            if (row == null) {
                trace("reels more-sheet row-null");
                return;
            }
            @SuppressWarnings("unchecked")
            java.util.List<Object> items = (java.util.List<Object>) menu;
            removeMorpheItems(items);
            items.add(row);
            trace("reels more-sheet added=" + row.getClass().getName() + " size=" + items.size());
        } catch (Throwable error) {
            trace("reels more-sheet add failed " + error);
        }
    }

    private static Object createReelsRow(Object componentContext) {
        Object row = createReelsRow474618930(componentContext);
        if (row != null) return row;
        return createLegacyReelsRow(componentContext);
    }

    private static Object createReelsRow474618930(Object componentContext) {
        String stage = "class-loader";
        try {
            ClassLoader loader = componentContext != null
                    ? componentContext.getClass().getClassLoader()
                    : MediaDownloader.class.getClassLoader();
            stage = "load-types";
            Class<?> callbackType = Class.forName("X.Ylq", false, loader);
            Class<?> iconTokenType = Class.forName("X.1Vb", false, loader);
            Class<?> iconType = Class.forName("X.Xk2", false, loader);
            Class<?> rowType = Class.forName("X.Vpv", false, loader);

            stage = "click-proxy";
            ClassLoader callbackLoader = callbackType.getClassLoader();
            Object callback = Proxy.newProxyInstance(
                    callbackLoader,
                    new Class<?>[]{callbackType},
                    (proxy, method, args) -> {
                        if (method.getDeclaringClass() == Object.class) {
                            if (method.getName().equals("toString")) {
                                return "MorpheReelsDownload";
                            }
                            if (method.getName().equals("hashCode")) {
                                return System.identityHashCode(proxy);
                            }
                            if (method.getName().equals("equals")) {
                                return args != null &&
                                        args.length == 1 &&
                                        proxy == args[0];
                            }
                        }
                        trace(
                                "reels click method=" + method.getName() +
                                        " thread=" +
                                        Thread.currentThread().getName()
                        );
                        downloadActiveMedia(
                                ReelMenuInjector.getCurrentActivity()
                        );
                        return defaultValue(method.getReturnType());
                    }
            );

            stage = "icon";
            Object iconToken = staticFieldValue(iconTokenType, "A82");
            if (iconToken == null) {
                iconToken = staticFieldValue(iconTokenType, "A83");
            }
            if (iconToken == null) {
                iconToken = staticFieldValue(iconTokenType, "A81");
            }
            if (iconToken == null) {
                trace("reels 578 icon-token-null");
                return null;
            }
            Method iconFactory =
                    iconType.getDeclaredMethod("A00", iconTokenType);
            iconFactory.setAccessible(true);
            Object icon = iconFactory.invoke(null, iconToken);

            stage = "row";
            Method rowFactory = rowType.getDeclaredMethod(
                    "A00",
                    callbackType,
                    iconType,
                    CharSequence.class,
                    CharSequence.class
            );
            rowFactory.setAccessible(true);
            Object row = rowFactory.invoke(
                    null,
                    callback,
                    icon,
                    "Download media",
                    null
            );
            trace("reels 578 row success=" + row.getClass().getName());
            return row;
        } catch (Throwable error) {
            trace(
                    "reels 578 row failed stage=" + stage +
                            " error=" + error
            );
            return null;
        }
    }

    private static Object createLegacyReelsRow(Object componentContext) {
        String stage = "class-loader";
        try {
            ClassLoader loader = componentContext != null
                    ? componentContext.getClass().getClassLoader()
                    : MediaDownloader.class.getClassLoader();
            stage = "load-types";
            Class<?> callbackType =
                    loadFacebookClass(loader, "X.W0r", "X.UNY");
            Class<?> iconTokenType =
                    loadFacebookClass(loader, "X.1ZT", "X.1ZP");
            Class<?> iconType =
                    loadFacebookClass(loader, "X.VHr", "X.ZHN");
            Class<?> rowType =
                    loadFacebookClass(loader, "X.ZHa", "X.XhY");

            stage = "click-proxy";
            ClassLoader callbackLoader = callbackType.getClassLoader();
            Object callback = Proxy.newProxyInstance(
                    callbackLoader,
                    new Class<?>[]{callbackType},
                    (proxy, method, args) -> {
                        if (method.getDeclaringClass() == Object.class) {
                            if (method.getName().equals("toString")) {
                                return "MorpheReelsDownload";
                            }
                            if (method.getName().equals("hashCode")) {
                                return System.identityHashCode(proxy);
                            }
                            if (method.getName().equals("equals")) {
                                return args != null && args.length == 1 && proxy == args[0];
                            }
                        }
                        trace(
                                "reels click method=" + method.getName() +
                                        " thread=" + Thread.currentThread().getName()
                        );
                        downloadActiveMedia(ReelMenuInjector.getCurrentActivity());
                        return defaultValue(method.getReturnType());
                    }
            );

            stage = "icon";
            Object iconToken = staticFieldValue(iconTokenType, "A81");
            if (iconToken == null) iconToken = staticFieldValue(iconTokenType, "AI3");
            if (iconToken == null) {
                trace("reels create icon-token-null");
                return null;
            }
            Constructor<?> iconConstructor =
                    iconType.getDeclaredConstructor(Uri.class, iconTokenType, Boolean.class);
            iconConstructor.setAccessible(true);
            Object icon = iconConstructor.newInstance(null, iconToken, null);

            stage = "row";
            Constructor<?> rowConstructor = rowType.getDeclaredConstructor(
                    callbackType,
                    iconType,
                    Boolean.class,
                    CharSequence.class,
                    CharSequence.class,
                    CharSequence.class,
                    Integer.class
            );
            rowConstructor.setAccessible(true);
            Object row = rowConstructor.newInstance(
                    callback,
                    icon,
                    null,
                    "Download media",
                    null,
                    "morphe_download_media",
                    null
            );
            trace("reels row success=" + row.getClass().getName());
            return row;
        } catch (Throwable error) {
            trace("reels row failed stage=" + stage + " error=" + error);
            return null;
        }
    }

    private static Object createStoryControlRow(Object source) {
        String stage = "class-loader";
        try {
            ClassLoader loader = source != null
                    ? source.getClass().getClassLoader()
                    : MediaDownloader.class.getClassLoader();
            stage = "load-types";
            Class<?> callbackType =
                    loadFacebookClass(loader, "X.W0r", "X.UNY");
            Class<?> iconTokenType =
                    loadFacebookClass(loader, "X.1ZT", "X.1ZP");
            Class<?> iconType =
                    loadFacebookClass(loader, "X.VHr", "X.ZHN");
            Class<?> rowType =
                    loadFacebookClass(loader, "X.ZHa", "X.XhY");

            stage = "click-proxy";
            ClassLoader callbackLoader = callbackType.getClassLoader();
            Object callback = Proxy.newProxyInstance(
                    callbackLoader,
                    new Class<?>[]{callbackType},
                    (proxy, method, args) -> {
                        if (method.getDeclaringClass() == Object.class) {
                            if (method.getName().equals("toString")) {
                                return "MorpheStoryDownload";
                            }
                            if (method.getName().equals("hashCode")) {
                                return System.identityHashCode(proxy);
                            }
                            if (method.getName().equals("equals")) {
                                return args != null && args.length == 1 && proxy == args[0];
                            }
                        }
                        trace(
                                "story control click method=" + method.getName() +
                                        " thread=" + Thread.currentThread().getName()
                        );
                        if (source != null) captureStoryFromCallback(source);
                        downloadActiveMedia(ReelMenuInjector.getCurrentActivity());
                        return defaultValue(method.getReturnType());
                    }
            );

            stage = "icon";
            Object iconToken = staticFieldValue(iconTokenType, "A81");
            if (iconToken == null) iconToken = staticFieldValue(iconTokenType, "AI3");
            if (iconToken == null) return null;
            Constructor<?> iconConstructor =
                    iconType.getDeclaredConstructor(Uri.class, iconTokenType, Boolean.class);
            iconConstructor.setAccessible(true);
            Object icon = iconConstructor.newInstance(null, iconToken, null);

            stage = "row";
            Constructor<?> rowConstructor = rowType.getDeclaredConstructor(
                    callbackType,
                    iconType,
                    Boolean.class,
                    CharSequence.class,
                    CharSequence.class,
                    CharSequence.class,
                    Integer.class
            );
            rowConstructor.setAccessible(true);
            Object row = rowConstructor.newInstance(
                    callback,
                    icon,
                    null,
                    "Download media",
                    null,
                    "morphe_download_media",
                    null
            );
            trace("story control row success=" + row.getClass().getName());
            return row;
        } catch (Throwable error) {
            trace("story control row failed stage=" + stage + " error=" + error);
            return null;
        }
    }

    private static Object resolveIconToken(
            Class<?> iconType,
            int drawableId,
            Object fallback
    ) {
        if (drawableId == 0) return fallback;
        for (Field staticField : iconType.getDeclaredFields()) {
            if (!Modifier.isStatic(staticField.getModifiers()) ||
                    !iconType.isAssignableFrom(staticField.getType())) {
                continue;
            }
            try {
                staticField.setAccessible(true);
                Object token = staticField.get(null);
                if (token != null && objectContainsInt(token, drawableId)) return token;
            } catch (Throwable ignored) {
            }
        }
        return fallback;
    }

    private static boolean objectContainsInt(Object value, int expected) {
        for (Class<?> current = value.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) ||
                        field.getType() != Integer.TYPE) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    if (field.getInt(value) == expected) return true;
                } catch (Throwable ignored) {
                }
            }
        }
        return false;
    }

    private static boolean isNativeReelDownloadItem(Object item) {
        if (item == null) return false;
        if (item.getClass().getName().equals("X.VZu")) return true;
        for (Field field : item.getClass().getDeclaredFields()) {
            if (field.getType().getName().equals("X.VZZ")) return true;
        }
        return false;
    }

    private static boolean isMorpheReelDownloadItem(Object item) {
        if (item != null && "MorpheReelsDownloadItem".equals(String.valueOf(item))) {
            return true;
        }
        return objectContainsString(
                item,
                "morphe_download_media",
                new IdentityHashMap<>(),
                0
        ) || objectContainsString(
                item,
                "MorpheReelsDownload",
                new IdentityHashMap<>(),
                0
        );
    }

    @SuppressWarnings("unchecked")
    private static List<Object> mutableList(Object value) {
        return value instanceof List<?> ? (List<Object>) value : null;
    }

    private static int sizeOf(List<?> value) {
        return value == null ? -1 : value.size();
    }

    private static void removeMorpheItems(List<Object> items) {
        for (Object item : new ArrayList<>(items)) {
            if (isMorpheReelDownloadItem(item)) {
                items.remove(item);
            }
        }
    }

    private static boolean objectContainsString(
            Object value,
            String expected,
            IdentityHashMap<Object, Boolean> visited,
            int depth
    ) {
        if (value == null || depth > 3 || visited.put(value, Boolean.TRUE) != null) {
            return false;
        }
        if (expected.equals(value)) return true;
        try {
            if (expected.equals(String.valueOf(value))) return true;
        } catch (Throwable ignored) {
        }
        Class<?> type = value.getClass();
        if (isLeaf(type)) return false;
        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    if (objectContainsString(
                            field.get(value),
                            expected,
                            visited,
                            depth + 1
                    )) {
                        return true;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return false;
    }

    private static Context contextFromSource(Object source) {
        for (Class<?> current = source.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (!Context.class.isAssignableFrom(field.getType())) continue;
                try {
                    field.setAccessible(true);
                    Object context = field.get(source);
                    if (context instanceof Context) return (Context) context;
                } catch (Throwable ignored) {
                }
            }
        }
        return application;
    }

    private static int nativeDownloadIcon(Context context) {
        if (context == null) return 0;
        int id = context.getResources().getIdentifier(
                "fb_ic_download_24",
                "drawable",
                context.getPackageName()
        );
        if (id == 0) {
            id = context.getResources().getIdentifier(
                    "fb_ic_download_outline_24",
                    "drawable",
                    context.getPackageName()
            );
        }
        return id;
    }

    private static List<Object> builderItems(Object builder) {
        try {
            Method build = builder.getClass().getMethod("build");
            Object snapshot = build.invoke(builder);
            if (!(snapshot instanceof Iterable<?>)) return Collections.emptyList();
            ArrayList<Object> result = new ArrayList<>();
            for (Object item : (Iterable<?>) snapshot) result.add(item);
            return result;
        } catch (Throwable error) {
            trace("story snapshot failed builder=" + typeName(builder) + " error=" + error);
            return Collections.emptyList();
        }
    }

    private static boolean builderAdd(Object builder, Object item) {
        try {
            Method add = builder.getClass().getMethod("add", Object.class);
            add.invoke(builder, item);
            return true;
        } catch (Throwable error) {
            trace("story add failed " + error);
            return false;
        }
    }

    private static void traceStoryBuilder(String site, Object builder) {
        List<Object> items = builderItems(builder);
        trace(
                "story builder site=" + site +
                        " size=" + items.size() +
                        " types=" + describeItems(items) +
                        " thread=" + Thread.currentThread().getName()
        );
    }

    private static String describeItems(List<?> items) {
        if (items == null) return "null";
        StringBuilder result = new StringBuilder();
        int count = Math.min(items.size(), 8);
        for (int i = 0; i < count; i++) {
            if (i > 0) result.append(',');
            result.append(typeName(items.get(i)));
        }
        if (items.size() > count) result.append(",...");
        return result.toString();
    }

    private static String typeName(Object value) {
        return value == null ? "null" : value.getClass().getName();
    }

    private static void trace(String message) {
        Log.i(LITHO_TAG, message);
    }

    private static void moveBuilderItemToEnd(Object builder, Object item) {
        try {
            Field contents = field(builder.getClass(), "contents");
            Field size = field(builder.getClass(), "size");
            if (contents == null || size == null) return;
            contents.setAccessible(true);
            size.setAccessible(true);
            Object[] values = (Object[]) contents.get(builder);
            int count = size.getInt(builder);
            int index = -1;
            for (int i = 0; i < count; i++) {
                if (values[i] == item) {
                    index = i;
                    break;
                }
            }
            if (index < 0 || index == count - 1) return;
            System.arraycopy(values, index + 1, values, index, count - index - 1);
            values[count - 1] = item;
        } catch (Throwable ignored) {
        }
    }

    private static Field field(Class<?> type, String name) {
        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                return current.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) {
            }
        }
        return null;
    }

    private static Object fieldValue(Object owner, String name) {
        try {
            Field field = field(owner.getClass(), name);
            if (field == null) return null;
            field.setAccessible(true);
            return field.get(owner);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object fieldValueByType(
            Object owner,
            String... typeNames
    ) {
        if (owner == null) return null;
        for (Class<?> current = owner.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Field candidate : current.getDeclaredFields()) {
                if (Modifier.isStatic(candidate.getModifiers())) continue;
                String fieldType = candidate.getType().getName();
                boolean matches = false;
                for (String typeName : typeNames) {
                    if (typeName.equals(fieldType)) {
                        matches = true;
                        break;
                    }
                }
                if (!matches) continue;
                try {
                    candidate.setAccessible(true);
                    Object value = candidate.get(owner);
                    if (value != null) return value;
                } catch (Throwable ignored) {
                }
            }
        }
        return null;
    }

    private static Object staticFieldValue(Class<?> type, String name) {
        try {
            Field field = type.getDeclaredField(name);
            if (!Modifier.isStatic(field.getModifiers())) return null;
            field.setAccessible(true);
            return field.get(null);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Class<?> loadFacebookClass(
            ClassLoader loader,
            String build474227093Name,
            String build474227001Name
    ) throws ClassNotFoundException {
        long versionCode = getInstalledVersionCode();
        String preferred = versionCode == 474227093L
                ? build474227093Name
                : build474227001Name;
        String fallback = versionCode == 474227093L
                ? build474227001Name
                : build474227093Name;
        try {
            return Class.forName(preferred, false, loader);
        } catch (ClassNotFoundException ignored) {
            return Class.forName(fallback, false, loader);
        }
    }

    private static Class<?> loadFacebookClass(
            ClassLoader loader,
            String build474618930Name,
            String build474227093Name,
            String build474227001Name
    ) throws ClassNotFoundException {
        long versionCode = getInstalledVersionCode();
        String[] candidates;
        if (versionCode == 474618930L) {
            candidates = new String[]{
                    build474618930Name,
                    build474227093Name,
                    build474227001Name
            };
        } else if (versionCode == 474227093L) {
            candidates = new String[]{
                    build474227093Name,
                    build474227001Name,
                    build474618930Name
            };
        } else {
            candidates = new String[]{
                    build474227001Name,
                    build474227093Name,
                    build474618930Name
            };
        }

        ClassNotFoundException failure = null;
        for (String candidate : candidates) {
            try {
                return Class.forName(candidate, false, loader);
            } catch (ClassNotFoundException error) {
                failure = error;
            }
        }
        throw failure == null
                ? new ClassNotFoundException(build474618930Name)
                : failure;
    }

    @SuppressWarnings("deprecation")
    private static long getInstalledVersionCode() {
        long cached = installedVersionCode;
        if (cached != Long.MIN_VALUE) return cached;

        Application app = application;
        if (app == null) return -1L;
        try {
            android.content.pm.PackageInfo info = app.getPackageManager()
                    .getPackageInfo(app.getPackageName(), 0);
            long value = android.os.Build.VERSION.SDK_INT >= 28
                    ? info.getLongVersionCode()
                    : info.versionCode;
            installedVersionCode = value;
            trace("facebook versionCode=" + value);
            return value;
        } catch (Throwable error) {
            trace("facebook versionCode lookup failed " + error);
            return -1L;
        }
    }

    private static int intField(Object owner, String name, int fallback) {
        try {
            Field field = field(owner.getClass(), name);
            if (field == null) return fallback;
            field.setAccessible(true);
            return field.getInt(owner);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static Object defaultValue(Class<?> type) {
        if (!type.isPrimitive() || type == Void.TYPE) return null;
        if (type == Boolean.TYPE) return false;
        if (type == Character.TYPE) return '\0';
        if (type == Byte.TYPE) return (byte) 0;
        if (type == Short.TYPE) return (short) 0;
        if (type == Integer.TYPE) return 0;
        if (type == Long.TYPE) return 0L;
        if (type == Float.TYPE) return 0f;
        if (type == Double.TYPE) return 0d;
        return null;
    }

    /** Kept for compatibility with older injected callers. */
    public static void downloadActiveReel(Activity activity) {
        downloadActiveMedia(activity);
    }

    private static void prepareSystemDownload(
            Context appContext,
            WeakReference<Activity> activityReference,
            boolean videoSurface,
            List<Object> retainedSources,
            DownloadQuality downloadQuality
    ) {
        Throwable lastError = null;
        try {
            Set<String> rejectedUrls = new LinkedHashSet<>();
            for (int round = 0; round < 7; round++) {
                CandidateSet candidates =
                        findCapturedMediaCandidates(
                                videoSurface,
                                retainedSources,
                                downloadQuality
                        );
                boolean hasDashPlan =
                        candidates.hasCompleteDashPair(
                                downloadQuality.targetQualityEdge()
                        );
                if (hasDashPlan) {
                    try {
                        if (downloadSelectedDash(
                                appContext,
                                candidates.dashVariants,
                                rejectedUrls,
                                downloadQuality
                        )) {
                            postToast(appContext, "Media downloaded");
                            return;
                        }
                    } catch (Throwable error) {
                        lastError = error;
                    }
                    if (round < 6) {
                        trace(
                                "download waiting for fresh selected-quality URLs round=" +
                                        round
                        );
                        Thread.sleep(round < 2 ? 500L : 1_000L);
                        continue;
                    }
                }
                try {
                    if (downloadReachableCandidate(
                            appContext,
                            candidates.progressiveCandidates,
                            rejectedUrls,
                            downloadQuality
                    )) {
                        postToast(appContext, "Media downloaded");
                        return;
                    }
                } catch (Throwable error) {
                    lastError = error;
                }

                if (round == 0 || round == 3 || round == 6) {
                    Activity activity = activityReference.get();
                    if (activity != null) {
                        trace("download falling back to visible-view scan round=" + round);
                        try {
                            if (downloadReachableCandidate(
                                    appContext,
                                    findMediaCandidates(
                                            activity,
                                            downloadQuality
                                    ),
                                    rejectedUrls,
                                    downloadQuality
                            )) {
                                postToast(appContext, "Media downloaded");
                                return;
                            }
                        } catch (Throwable error) {
                            lastError = error;
                        }
                    }
                }

                if (round < 6) {
                    trace("download waiting for playable URL round=" + round);
                    Thread.sleep(round < 2 ? 500L : 1_000L);
                }
            }

            if (downloadQuality != DownloadQuality.HIGHEST) {
                throw new IllegalStateException(
                        "Facebook did not expose a direct " +
                                downloadQuality.displayName() +
                                " stream for this media"
                );
            }
            if (lastError != null) throw lastError;
            throw new IllegalStateException(
                    "No downloadable media was found on the current Reel or Story"
            );
        } catch (Throwable error) {
            trace("download prepare failed " + error);
            String message = error.getMessage() == null
                    ? error.getClass().getSimpleName()
                    : error.getMessage();
            showDownloadFailed(appContext, message);
            postToast(appContext, "Download failed: " + message);
        } finally {
            DOWNLOAD_IN_PROGRESS.set(false);
        }
    }

    private static List<Object> snapshotActiveSources() {
        ArrayList<Object> sources = new ArrayList<>();
        IdentityHashMap<Object, Boolean> seen = new IdentityHashMap<>();
        addSource(sources, seen, currentStoryCard.get());
        addSource(sources, seen, currentReelsModel.get());
        addSource(sources, seen, currentReelsMenuOwner.get());
        synchronized (CAPTURED_SOURCES) {
            for (int i = CAPTURED_SOURCES.size() - 1; i >= 0; i--) {
                Object source = CAPTURED_SOURCES.get(i).get();
                if (source == null) {
                    CAPTURED_SOURCES.remove(i);
                } else {
                    addSource(sources, seen, source);
                }
            }
        }
        return sources;
    }

    private static void addSource(
            List<Object> sources,
            IdentityHashMap<Object, Boolean> seen,
            Object source
    ) {
        if (source != null && seen.put(source, Boolean.TRUE) == null) {
            sources.add(source);
        }
    }

    private static CandidateSet findCapturedMediaCandidates(
            boolean videoSurface,
            List<Object> retainedSources,
            DownloadQuality downloadQuality
    ) {
        ArrayList<Object> sources = new ArrayList<>();
        IdentityHashMap<Object, Boolean> seen = new IdentityHashMap<>();
        addSource(sources, seen, currentStoryCard.get());
        addSource(sources, seen, currentReelsModel.get());
        addSource(sources, seen, currentReelsMenuOwner.get());
        for (Object source : retainedSources) {
            addSource(sources, seen, source);
        }
        synchronized (CAPTURED_SOURCES) {
            for (int i = CAPTURED_SOURCES.size() - 1; i >= 0; i--) {
                Object source = CAPTURED_SOURCES.get(i).get();
                if (source == null) {
                    CAPTURED_SOURCES.remove(i);
                } else {
                    addSource(sources, seen, source);
                }
            }
        }

        LinkedHashSet<String> urls = new LinkedHashSet<>();
        ScanState state = new ScanState(urls);
        for (Object source : sources) {
            collectUrls(source, state, 0, true);
            if (state.isFull()) break;
        }
        int matchedPlayerDash =
                addMatchingPlayerDashManifest(urls, state);
        int pageDash = 0;
        if (downloadQuality != null &&
                downloadQuality.targetQualityEdge() > 0) {
            pageDash = addFacebookPageMedia(urls, state);
        }
        List<MediaCandidate> candidates = rankCandidates(
                urls,
                videoSurface,
                downloadQuality,
                state.preferredProgressiveUrls
        );
        List<MediaVariant> dashVariants =
                new ArrayList<>(state.dashVariants.values());
        trace(
                "download captured sources=" + sources.size() +
                        " urls=" + urls.size() +
                        " candidates=" + candidates.size() +
                        " dashVariants=" + dashVariants.size() +
                        " matchedPlayerDash=" + matchedPlayerDash +
                        " pageDash=" + pageDash +
                        " pageLow=" +
                        state.preferredProgressiveUrls.size()
        );
        return new CandidateSet(candidates, dashVariants);
    }

    private static int addMatchingPlayerDashManifest(
            Set<String> currentUrls,
            ScanState state
    ) {
        LinkedHashSet<String> currentKeys = new LinkedHashSet<>();
        for (String url : currentUrls) {
            String key = mediaUrlKey(url);
            if (key != null) currentKeys.add(key);
        }

        PlayerMediaSource latestSource = null;
        Object latestParams = null;
        synchronized (RECENT_PLAYER_PARAMS) {
            for (int index = RECENT_PLAYER_PARAMS.size() - 1;
                 index >= 0;
                 index--) {
                Object params = RECENT_PLAYER_PARAMS.get(index).get();
                if (params == null) {
                    RECENT_PLAYER_PARAMS.remove(index);
                    continue;
                }
                PlayerMediaSource source = playerMediaSource(params);
                if (source == null) {
                    if (latestParams == null) latestParams = params;
                    continue;
                }
                if (latestSource == null) latestSource = source;
                if (latestParams == null) latestParams = params;
                if (!source.matches(currentUrls, currentKeys)) continue;
                return addPlayerMediaSource(
                        currentUrls,
                        state,
                        source,
                        true
                );
            }
        }
        if (latestSource != null) {
            return addPlayerMediaSource(
                    currentUrls,
                    state,
                    latestSource,
                    false
            );
        }
        if (latestParams == null) return 0;

        ScanState extracted = new ScanState(
                new LinkedHashSet<>()
        );
        collectUrls(latestParams, extracted, 0, true);
        if (extracted.dashVariants.isEmpty()) return 0;

        int before = state.dashVariants.size();
        for (MediaVariant variant : extracted.dashVariants.values()) {
            state.dashVariants.putIfAbsent(variant.url, variant);
        }
        trace(
                "download extracted DASH manifest recursively from latest player params"
        );
        return state.dashVariants.size() - before;
    }

    private static int addPlayerMediaSource(
            Set<String> currentUrls,
            ScanState state,
            PlayerMediaSource source,
            boolean matched
    ) {
        currentUrls.addAll(source.progressiveUrls);
        state.preferredProgressiveUrls.addAll(source.preferredUrls);
        int before = state.dashVariants.size();
        if (source.manifest != null) {
            state.addDashManifest(source.manifest);
        }
        int added = state.dashVariants.size() - before;
        trace(
                "download player source matched=" + matched +
                        " progressive=" +
                        source.progressiveUrls.size() +
                        " manifest=" +
                        (source.manifest == null
                                ? 0
                                : source.manifest.length()) +
                        " dashAdded=" + added
        );
        return added;
    }

    private static int addFacebookPageMedia(
            Set<String> currentUrls,
            ScanState state
    ) {
        String videoId = latestPlayerVideoId();
        if (videoId == null) return 0;

        FacebookPageMediaExtractor.Result result =
                FacebookPageMediaExtractor.extract(videoId);
        int before = state.dashVariants.size();
        for (MediaVariant variant : result.dashVariants) {
            if (variant != null &&
                    variant.url != null &&
                    !variant.url.isEmpty()) {
                state.dashVariants.putIfAbsent(
                        variant.url,
                        variant
                );
            }
        }
        for (String url : result.lowProgressiveUrls) {
            if (url == null || url.isEmpty()) continue;
            currentUrls.add(url);
            state.preferredProgressiveUrls.add(url);
        }
        currentUrls.addAll(result.highProgressiveUrls);
        int added = state.dashVariants.size() - before;
        trace(
                "download page formats videoId=" + videoId +
                        " dash=" + result.dashVariants.size() +
                        " low=" +
                        result.lowProgressiveUrls.size() +
                        " high=" +
                        result.highProgressiveUrls.size() +
                        " dashAdded=" + added
        );
        return added;
    }

    private static String latestPlayerVideoId() {
        synchronized (RECENT_PLAYER_PARAMS) {
            for (int index = RECENT_PLAYER_PARAMS.size() - 1;
                 index >= 0;
                 index--) {
                Object captured =
                        RECENT_PLAYER_PARAMS.get(index).get();
                if (captured == null) {
                    RECENT_PLAYER_PARAMS.remove(index);
                    continue;
                }
                Object params = fieldValueByType(
                        captured,
                        "com.facebook.video.engine.api.VideoPlayerParams"
                );
                String videoId = stringField(params, "A0x");
                if (videoId != null &&
                        videoId.matches("[0-9]{6,24}")) {
                    return videoId;
                }
            }
        }
        return null;
    }

    private static PlayerMediaSource playerMediaSource(Object params) {
        Object dataSource = fieldValueByType(
                params,
                "com.facebook.video.engine.api.VideoDataSource"
        );
        if (dataSource == null) return null;

        ArrayList<String> urls = new ArrayList<>();
        ArrayList<String> preferredUrls = new ArrayList<>();
        String manifest = stringField(dataSource, "A0C");
        addUriField(urls, dataSource, "A06");
        addUriField(urls, dataSource, "A07");
        addUriField(urls, dataSource, "A08");
        for (Class<?> type = dataSource.getClass();
             type != null && type != Object.class;
             type = type.getSuperclass()) {
            Field[] fields;
            try {
                fields = type.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }
            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                Object value;
                try {
                    field.setAccessible(true);
                    value = field.get(dataSource);
                } catch (Throwable ignored) {
                    continue;
                }
                if (value instanceof Uri) {
                    urls.add(cleanUrl(String.valueOf(value)));
                } else if (value instanceof String) {
                    String text = (String) value;
                    if (text.contains("<MPD") ||
                            text.contains("<mpd") ||
                            text.contains("&lt;MPD") ||
                            text.contains("&lt;mpd")) {
                        manifest = text;
                    }
                }
            }
        }
        if (manifest == null && urls.isEmpty()) return null;
        return new PlayerMediaSource(urls, preferredUrls, manifest);
    }

    private static void addUriField(
            List<String> urls,
            Object owner,
            String name
    ) {
        Object value = namedFieldValue(owner, name);
        if (!(value instanceof Uri)) return;
        String url = cleanUrl(String.valueOf(value));
        if (!url.isEmpty() && !urls.contains(url)) urls.add(url);
    }

    private static String stringField(Object owner, String name) {
        Object value = namedFieldValue(owner, name);
        return value instanceof String ? (String) value : null;
    }

    private static Object namedFieldValue(Object owner, String name) {
        if (owner == null) return null;
        for (Class<?> type = owner.getClass();
             type != null && type != Object.class;
             type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object fieldValueByType(Object owner, String typeName) {
        if (owner == null) return null;
        if (typeName.equals(owner.getClass().getName())) return owner;
        Class<?> requestedType = null;
        try {
            requestedType = Class.forName(typeName);
        } catch (Throwable ignored) {
        }
        for (Class<?> type = owner.getClass();
             type != null && type != Object.class;
             type = type.getSuperclass()) {
            Field[] fields;
            try {
                fields = type.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }
            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    Object value = field.get(owner);
                    if (typeName.equals(field.getType().getName()) ||
                            (requestedType != null &&
                                    value != null &&
                                    requestedType.isInstance(value))) {
                        return value;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return null;
    }

    private static String mediaUrlKey(String value) {
        try {
            java.net.URL url = new java.net.URL(value);
            return url.getHost().toLowerCase(Locale.US) + url.getPath();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static List<MediaCandidate> rankCandidates(
            Set<String> urls,
            boolean videoSurface,
            DownloadQuality downloadQuality,
            Set<String> preferredUrls
    ) {
        ArrayList<MediaCandidate> candidates = new ArrayList<>();
        for (String raw : urls) {
            MediaCandidate candidate = MediaCandidate.from(
                    raw,
                    preferredUrls.contains(raw)
            );
            if (candidate == null) continue;
            if (videoSurface && !candidate.video) continue;
            candidates.add(candidate);
        }
        int targetQualityEdge = downloadQuality == null
                ? 0
                : downloadQuality.targetQualityEdge();
        Collections.sort(candidates, (left, right) -> {
            if (targetQualityEdge > 0 &&
                    left.video &&
                    right.video) {
                int targetOrder = compareTargetQuality(
                        left,
                        right,
                        targetQualityEdge
                );
                if (targetOrder != 0) return targetOrder;
            }
            if (!videoSurface) {
                int dimensions = Long.compare(
                        right.pixelCount(),
                        left.pixelCount()
                );
                if (dimensions != 0) return dimensions;
            }
            int leftScore = left.score + (left.video == videoSurface ? 100 : 0);
            int rightScore = right.score + (right.video == videoSurface ? 100 : 0);
            return Integer.compare(rightScore, leftScore);
        });
        return candidates;
    }

    private static int compareTargetQuality(
            MediaCandidate left,
            MediaCandidate right,
            int targetQualityEdge
    ) {
        int leftEdge = left.qualityLabelEdge();
        int rightEdge = right.qualityLabelEdge();
        boolean leftKnown = leftEdge > 0;
        boolean rightKnown = rightEdge > 0;
        if (leftKnown != rightKnown) {
            return leftKnown ? -1 : 1;
        }
        if (!leftKnown) return 0;

        boolean leftExact = leftEdge == targetQualityEdge;
        boolean rightExact = rightEdge == targetQualityEdge;
        if (leftExact != rightExact) {
            return leftExact ? -1 : 1;
        }

        boolean leftLower = leftEdge < targetQualityEdge;
        boolean rightLower = rightEdge < targetQualityEdge;
        if (leftLower != rightLower) {
            return leftLower ? -1 : 1;
        }
        if (leftEdge != rightEdge) {
            return leftLower
                    ? Integer.compare(rightEdge, leftEdge)
                    : Integer.compare(leftEdge, rightEdge);
        }
        return 0;
    }

    private static boolean downloadReachableCandidate(
            Context appContext,
            List<MediaCandidate> candidates,
            Set<String> rejectedUrls,
            DownloadQuality downloadQuality
    ) throws Throwable {
        Throwable lastError = null;
        int attempts = 0;
        for (int i = 0;
             i < candidates.size() &&
                     attempts < MAX_DOWNLOAD_ATTEMPTS_PER_ROUND;
             i++) {
            MediaCandidate candidate = candidates.get(i);
            if (rejectedUrls.contains(candidate.url)) continue;
            attempts++;
            try {
                downloadCandidate(appContext, candidate, downloadQuality);
                trace(
                        "download candidate completed index=" + i +
                                " video=" + candidate.video +
                                " requested=" +
                                (downloadQuality == null
                                        ? "none"
                                        : downloadQuality.displayName())
                );
                return true;
            } catch (Throwable error) {
                lastError = error;
                rejectedUrls.add(candidate.url);
                trace(
                        "download candidate rejected index=" + i +
                                " error=" + error.getMessage()
                );
            }
        }
        if (lastError != null) throw lastError;
        return false;
    }

    private static boolean downloadSelectedDash(
            Context appContext,
            List<MediaVariant> variants,
            Set<String> rejectedUrls,
            DownloadQuality downloadQuality
    ) throws Throwable {
        MediaVariantSelector.DashPair pair =
                MediaVariantSelector.bestDashPair(
                        variants,
                        downloadQuality.targetQualityEdge()
                );
        if (pair == null) return false;
        if (rejectedUrls.contains(pair.video.url) ||
                rejectedUrls.contains(pair.audio.url)) {
            return false;
        }

        boolean reel = currentStoryCard.get() == null;
        String prefix = reel ? "FB_Reel_" : "FB_Story_";
        String fileName = prefix + System.currentTimeMillis() + ".mp4";
        File jobDirectory = createDownloadJobDirectory(appContext);
        File videoFile = new File(jobDirectory, "video.mp4");
        File audioFile = new File(jobDirectory, "audio.mp4");
        File mergedFile = new File(jobDirectory, "merged.mp4");
        ExecutorService executor = Executors.newFixedThreadPool(2);
        Future<Long> videoFuture = null;
        Future<Long> audioFuture = null;
        DashProgress progress = new DashProgress(appContext, fileName);

        try {
            trace(
                    "download selected requested=" +
                            downloadQuality.displayName() +
                            " resolved=" +
                            pair.video.qualityLabelEdge() +
                            " exact=" +
                            (downloadQuality.targetQualityEdge() <= 0 ||
                                    downloadQuality.targetQualityEdge() ==
                                            pair.video.qualityLabelEdge()) +
                            "p videoBitrate=" + pair.video.bitrate +
                            " audioBitrate=" + pair.audio.bitrate +
                            " videoCodec=" + pair.video.codecs +
                            " audioCodec=" + pair.audio.codecs
            );
            showDownloadPreparing(
                    appContext,
                    directQualityMessage(
                            downloadQuality.targetQualityEdge(),
                            pair.video.qualityLabelEdge()
                    )
            );
            videoFuture = executor.submit(() -> {
                PerformanceOptimizer.applyBackgroundThreadPriority();
                return MediaTransfer.download(
                        pair.video,
                        videoFile,
                        (downloaded, total) ->
                                progress.update(true, downloaded, total)
                );
            });
            audioFuture = executor.submit(() -> {
                PerformanceOptimizer.applyBackgroundThreadPriority();
                return MediaTransfer.download(
                        pair.audio,
                        audioFile,
                        (downloaded, total) ->
                                progress.update(false, downloaded, total)
                );
            });

            awaitTransfer(videoFuture);
            awaitTransfer(audioFuture);
            showDownloadPreparing(
                    appContext,
                    "Combining audio and video\u2026"
            );
            Mp4TrackMuxer.Result result = Mp4TrackMuxer.mux(
                    videoFile,
                    audioFile,
                    mergedFile
            );
            showDownloadPreparing(appContext, "Saving media\u2026");
            publishCachedMedia(
                    appContext,
                    mergedFile,
                    fileName,
                    "video/mp4"
            );
            showDownloadComplete(
                    appContext,
                    fileName,
                    result.qualityEdge(),
                    downloadQuality.targetQualityEdge()
            );
            trace(
                    "download selected completed quality=" +
                            result.qualityEdge() +
                            "p source=" + result.qualityEdge() +
                            "p durationUs=" + result.durationUs
            );
            return true;
        } catch (Throwable error) {
            rejectedUrls.add(pair.video.url);
            rejectedUrls.add(pair.audio.url);
            if (videoFuture != null) videoFuture.cancel(true);
            if (audioFuture != null) audioFuture.cancel(true);
            showDownloadPreparing(
                    appContext,
                    "Retrying selected-quality media\u2026"
            );
            throw error;
        } finally {
            executor.shutdownNow();
            try {
                executor.awaitTermination(35, TimeUnit.SECONDS);
            } catch (InterruptedException error) {
                Thread.currentThread().interrupt();
            }
            deleteTree(jobDirectory);
        }
    }

    private static long awaitTransfer(Future<Long> future) throws Throwable {
        try {
            return future.get();
        } catch (ExecutionException error) {
            Throwable cause = error.getCause();
            throw cause == null ? error : cause;
        } catch (InterruptedException error) {
            Thread.currentThread().interrupt();
            throw error;
        }
    }

    private static File createDownloadJobDirectory(Context context) {
        File root = new File(
                context.getCacheDir(),
                DOWNLOAD_CACHE_DIRECTORY
        );
        if (!root.exists() && !root.mkdirs()) {
            throw new IllegalStateException(
                    "Could not create media download cache"
            );
        }

        String baseName = System.currentTimeMillis() +
                "-" + Thread.currentThread().getId();
        for (int suffix = 0; suffix < 100; suffix++) {
            File directory = new File(
                    root,
                    suffix == 0 ? baseName : baseName + '-' + suffix
            );
            if (directory.mkdir()) return directory;
        }
        throw new IllegalStateException(
                "Could not create media download job"
        );
    }

    private static void publishCachedMedia(
            Context context,
            File source,
            String fileName,
            String mimeType
    ) throws Throwable {
        ContentResolver resolver = context.getContentResolver();
        Uri output = null;
        try {
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
            values.put(MediaStore.MediaColumns.MIME_TYPE, mimeType);
            values.put(
                    MediaStore.MediaColumns.RELATIVE_PATH,
                    Environment.DIRECTORY_DOWNLOADS + "/Morphe/Facebook"
            );
            values.put(MediaStore.MediaColumns.IS_PENDING, 1);
            output = resolver.insert(
                    MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                    values
            );
            if (output == null) {
                throw new IllegalStateException("MediaStore insert failed");
            }

            long expectedBytes = source.length();
            long copiedBytes = 0;
            try (FileInputStream input = new FileInputStream(source);
                 OutputStream stream = resolver.openOutputStream(output, "w")) {
                if (stream == null) {
                    throw new IllegalStateException(
                            "Output stream unavailable"
                    );
                }
                byte[] buffer = new byte[64 * 1024];
                int count;
                while ((count = input.read(buffer)) >= 0) {
                    if (count == 0) continue;
                    stream.write(buffer, 0, count);
                    copiedBytes += count;
                }
            }
            if (expectedBytes <= 0 || copiedBytes != expectedBytes) {
                throw new IllegalStateException(
                        "Published media length did not match"
                );
            }

            ContentValues complete = new ContentValues();
            complete.put(MediaStore.MediaColumns.IS_PENDING, 0);
            if (resolver.update(output, complete, null, null) <= 0) {
                throw new IllegalStateException(
                        "Could not finalize downloaded media"
                );
            }
        } catch (Throwable error) {
            if (output != null) {
                try {
                    resolver.delete(output, null, null);
                } catch (Throwable ignored) {
                }
            }
            throw error;
        }
    }

    private static void cleanupOldDownloadCache(Context context) {
        File root = new File(
                context.getCacheDir(),
                DOWNLOAD_CACHE_DIRECTORY
        );
        File[] jobs = root.listFiles();
        if (jobs == null) return;

        long cutoff = System.currentTimeMillis() -
                TimeUnit.HOURS.toMillis(24);
        for (File job : jobs) {
            if (job.lastModified() < cutoff) deleteTree(job);
        }
    }

    private static boolean deleteTree(File target) {
        if (target == null || !target.exists()) return true;
        if (target.isDirectory()) {
            File[] children = target.listFiles();
            if (children != null) {
                for (File child : children) {
                    if (!deleteTree(child)) return false;
                }
            }
        }
        return target.delete();
    }

    private static void preflightCandidate(MediaCandidate media) throws Throwable {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new java.net.URL(media.url).openConnection();
            connection.setInstanceFollowRedirects(true);
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(15_000);
            connection.setRequestProperty("Referer", "https://www.facebook.com/");
            connection.setRequestProperty(
                    "User-Agent",
                    "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 Chrome/131 Mobile Safari/537.36"
            );

            int response = connection.getResponseCode();
            if (response != HttpURLConnection.HTTP_OK &&
                    response != HttpURLConnection.HTTP_PARTIAL) {
                throw new IllegalStateException("HTTP " + response);
            }

            String responseType = connection.getContentType();
            String normalizedType = responseType == null
                    ? ""
                    : responseType.toLowerCase(Locale.US);
            if (normalizedType.startsWith("text/") ||
                    normalizedType.contains("json") ||
                    normalizedType.contains("xml")) {
                throw new IllegalStateException("Server returned " + responseType);
            }
            if (media.video && normalizedType.startsWith("image/")) {
                throw new IllegalStateException("Server returned a thumbnail");
            }

            long minimumBytes = media.video ? 128L * 1024L : 16L * 1024L;
            long totalBytes = responseTotalBytes(connection, response);
            if (totalBytes >= 0 && totalBytes < minimumBytes) {
                throw new IllegalStateException("Media response was too small");
            }

            try (InputStream input = connection.getInputStream()) {
                byte[] buffer = new byte[64 * 1024];
                int count;
                do {
                    count = input.read(buffer);
                } while (count == 0);
                if (count < 0) throw new IllegalStateException("Empty response");
                if (!looksLikeExpectedMedia(media, normalizedType, buffer, count)) {
                    throw new IllegalStateException(
                            media.video
                                    ? "Server returned a thumbnail or invalid video"
                                    : "Server returned invalid image data"
                    );
                }
            }
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static long responseTotalBytes(
            HttpURLConnection connection,
            int response
    ) {
        if (response == HttpURLConnection.HTTP_PARTIAL) {
            String contentRange = connection.getHeaderField("Content-Range");
            if (contentRange != null) {
                int slash = contentRange.lastIndexOf('/');
                if (slash >= 0 && slash + 1 < contentRange.length()) {
                    try {
                        return Long.parseLong(contentRange.substring(slash + 1).trim());
                    } catch (NumberFormatException ignored) {
                    }
                }
            }
            return -1;
        }
        return connection.getContentLengthLong();
    }

    private static long enqueueSystemDownload(
            Context appContext,
            MediaCandidate media
    ) {
        DownloadManager manager =
                (DownloadManager) appContext.getSystemService(Context.DOWNLOAD_SERVICE);
        if (manager == null) {
            throw new IllegalStateException("System DownloadManager is unavailable");
        }

        String prefix = media.video ? "FB_Reel_" : "FB_Story_";
        String fileName = prefix + System.currentTimeMillis() + media.extension;
        DownloadManager.Request request = new DownloadManager.Request(Uri.parse(media.url));
        request.setTitle(fileName);
        request.setDescription("Downloading Facebook media");
        request.setMimeType(media.mimeType);
        request.setAllowedOverMetered(true);
        request.setAllowedOverRoaming(true);
        request.setNotificationVisibility(
                DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED
        );
        request.addRequestHeader("Referer", "https://www.facebook.com/");
        request.addRequestHeader(
                "User-Agent",
                "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 Chrome/131 Mobile Safari/537.36"
        );
        request.setDestinationInExternalPublicDir(
                Environment.DIRECTORY_DOWNLOADS,
                "Morphe/Facebook/" + fileName
        );
        return manager.enqueue(request);
    }

    private static void postToast(Context context, String message) {
        MAIN.post(() -> Toast.makeText(context, message, Toast.LENGTH_SHORT).show());
    }

    private static void showDownloadPreparing(Context context, String status) {
        postDownloadNotification(
                context,
                android.R.drawable.stat_sys_download,
                "Downloading Facebook media",
                status,
                0,
                true,
                true
        );
    }

    private static void showDownloadProgress(
            Context context,
            String fileName,
            long downloadedBytes,
            long totalBytes
    ) {
        int percent = downloadPercentage(downloadedBytes, totalBytes);
        String text = totalBytes > 0
                ? percent + " \u00b7 " + formatBytes(downloadedBytes) +
                        " of " + formatBytes(totalBytes)
                : formatBytes(downloadedBytes) + " downloaded";
        postDownloadNotification(
                context,
                android.R.drawable.stat_sys_download,
                fileName.startsWith("FB_Reel_")
                        ? "Downloading Facebook Reel"
                        : "Downloading Facebook Story",
                text,
                Math.max(percent, 0),
                percent < 0,
                true
        );
    }

    private static void showDownloadComplete(Context context, String fileName) {
        showDownloadComplete(context, fileName, 0, 0);
    }

    private static void showDownloadComplete(
            Context context,
            String fileName,
            int qualityEdge
    ) {
        showDownloadComplete(context, fileName, qualityEdge, 0);
    }

    private static void showDownloadComplete(
            Context context,
            String fileName,
            int qualityEdge,
            int requestedQualityEdge
    ) {
        String destination = "Saved to Downloads/Morphe/Facebook";
        if (qualityEdge > 0) {
            destination += " \u00b7 " + qualityEdge + "p";
        }
        postDownloadNotification(
                context,
                android.R.drawable.stat_sys_download_done,
                fileName.startsWith("FB_Reel_")
                        ? "Facebook Reel downloaded"
                        : "Facebook Story downloaded",
                destination,
                0,
                false,
                false
        );
    }

    private static String directQualityMessage(
            int requestedQualityEdge,
            int resolvedQualityEdge
    ) {
        if (resolvedQualityEdge > 0) {
            return "Downloading the direct " + resolvedQualityEdge +
                    "p track\u2026";
        }
        return "Downloading a direct Facebook track\u2026";
    }

    private static void showDownloadFailed(Context context, String message) {
        postDownloadNotification(
                context,
                android.R.drawable.stat_notify_error,
                "Facebook media download failed",
                message,
                0,
                false,
                false
        );
    }

    @SuppressWarnings("deprecation")
    private static void postDownloadNotification(
            Context context,
            int smallIcon,
            String title,
            String text,
            int progress,
            boolean indeterminate,
            boolean ongoing
    ) {
        if (!downloadNotificationsAvailable) return;
        try {
            NotificationManager manager =
                    (NotificationManager) context.getSystemService(
                            Context.NOTIFICATION_SERVICE
                    );
            if (manager == null) {
                throw new IllegalStateException("NotificationManager is unavailable");
            }

            Notification.Builder builder;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                NotificationChannel channel =
                        manager.getNotificationChannel(DOWNLOAD_NOTIFICATION_CHANNEL);
                if (channel == null) {
                    channel = new NotificationChannel(
                            DOWNLOAD_NOTIFICATION_CHANNEL,
                            "Morphe media downloads",
                            NotificationManager.IMPORTANCE_LOW
                    );
                    channel.setDescription("Facebook media download progress");
                    channel.setShowBadge(false);
                    channel.enableVibration(false);
                    channel.setSound(null, null);
                    manager.createNotificationChannel(channel);
                }
                builder = new Notification.Builder(
                        context,
                        DOWNLOAD_NOTIFICATION_CHANNEL
                );
            } else {
                builder = new Notification.Builder(context)
                        .setPriority(Notification.PRIORITY_LOW);
            }

            builder
                    .setSmallIcon(smallIcon)
                    .setContentTitle(title)
                    .setContentText(text)
                    .setCategory(Notification.CATEGORY_PROGRESS)
                    .setVisibility(Notification.VISIBILITY_PUBLIC)
                    .setOnlyAlertOnce(true)
                    .setOngoing(ongoing);
            if (ongoing) {
                builder
                        .setShowWhen(false)
                        .setProgress(
                                indeterminate ? 0 : 100,
                                progress,
                                indeterminate
                        );
            } else {
                builder
                        .setAutoCancel(true)
                        .setShowWhen(true)
                        .setWhen(System.currentTimeMillis())
                        .setProgress(0, 0, false);
            }
            manager.notify(DOWNLOAD_NOTIFICATION_ID, builder.build());
        } catch (Throwable error) {
            downloadNotificationsAvailable = false;
            trace("download notification unavailable error=" + error);
        }
    }

    private static int downloadPercentage(long downloadedBytes, long totalBytes) {
        if (totalBytes <= 0) return -1;
        return (int) Math.max(
                0,
                Math.min(100, downloadedBytes * 100.0d / totalBytes)
        );
    }

    private static String formatBytes(long bytes) {
        if (bytes >= 1024L * 1024L) {
            return String.format(
                    Locale.US,
                    "%.1f MB",
                    bytes / (1024.0d * 1024.0d)
            );
        }
        if (bytes >= 1024L) {
            return String.format(Locale.US, "%.1f KB", bytes / 1024.0d);
        }
        return Math.max(bytes, 0) + " B";
    }

    static boolean hasActiveMedia(Activity activity) {
        return activity != null && !findMediaCandidates(
                activity,
                DeVancedSettings.getDownloadQuality()
        ).isEmpty();
    }

    private static void attemptDownload(final Activity activity, final int attempt) {
        List<MediaCandidate> media = findMediaCandidates(
                activity,
                DeVancedSettings.getDownloadQuality()
        );
        if (!media.isEmpty()) {
            enqueueDownload(activity, media);
            return;
        }

        if (attempt < 3) {
            if (attempt == 0) {
                Toast.makeText(activity, "Finding the current Reel or StoryÃ¢â‚¬Â¦", Toast.LENGTH_SHORT).show();
            }
            MAIN.postDelayed(() -> attemptDownload(activity, attempt + 1), 450L);
            return;
        }

        Toast.makeText(
                activity,
                "No downloadable media was found on the current Reel or Story.",
                Toast.LENGTH_SHORT
        ).show();
        DOWNLOAD_IN_PROGRESS.set(false);
    }

    private static List<MediaCandidate> findMediaCandidates(
            Activity activity,
            DownloadQuality downloadQuality
    ) {
        LinkedHashSet<String> urls = new LinkedHashSet<>();
        ScanState state = new ScanState(urls);

        collectUrls(currentStoryCard.get(), state, 0, true);
        collectUrls(currentReelsModel.get(), state, 0, true);
        collectUrls(currentReelsMenuOwner.get(), state, 0, true);

        synchronized (CAPTURED_SOURCES) {
            for (int i = CAPTURED_SOURCES.size() - 1; i >= 0; i--) {
                Object source = CAPTURED_SOURCES.get(i).get();
                if (source == null) {
                    CAPTURED_SOURCES.remove(i);
                } else {
                    collectUrls(source, state, 0, true);
                }
                if (state.isFull()) break;
            }
        }

        for (View root : getAllActiveViews()) {
            collectUrls(root, state, 0, false);
            if (state.isFull()) break;
        }
        if (!state.isFull()) {
            try {
                collectUrls(activity.getWindow().getDecorView(), state, 0, false);
            } catch (Throwable ignored) {
            }
        }

        return rankCandidates(
                urls,
                hasVisibleVideoSurface(activity),
                downloadQuality,
                Collections.emptySet()
        );
    }

    @SuppressWarnings("unchecked")
    public static List<View> getAllActiveViews() {
        ArrayList<View> views = new ArrayList<>();
        try {
            Class<?> globalClass = Class.forName("android.view.WindowManagerGlobal");
            Method getInstance = globalClass.getDeclaredMethod("getInstance");
            getInstance.setAccessible(true);
            Object global = getInstance.invoke(null);
            Field viewsField = globalClass.getDeclaredField("mViews");
            viewsField.setAccessible(true);
            Object value = viewsField.get(global);
            if (value instanceof List<?>) views.addAll((List<View>) value);
        } catch (Throwable ignored) {
        }
        return views;
    }

    private static void collectUrls(
            Object value,
            ScanState state,
            int depth,
            boolean inspectGetters
    ) {
        if (value == null || depth > MAX_DEPTH || state.isFull() ||
                state.visited.put(value, Boolean.TRUE) != null) {
            return;
        }
        state.visits++;

        if (value instanceof Uri || value instanceof CharSequence) {
            String text = String.valueOf(value);
            if (value instanceof CharSequence) {
                state.addDashManifest(text);
            }
            addUrls(text, state.urls);
            return;
        }

        if (value instanceof View) {
            View view = (View) value;
            collectUrls(view.getTag(), state, depth + 1, inspectGetters);
            CharSequence description = view.getContentDescription();
            if (description != null) addUrls(description.toString(), state.urls);
            collectClickListener(view, state, depth + 1, inspectGetters);
        }

        if (value instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) value;
            for (int i = 0; i < group.getChildCount() && !state.isFull(); i++) {
                collectUrls(group.getChildAt(i), state, depth + 1, inspectGetters);
            }
        }

        if (value instanceof Iterable<?>) {
            for (Object child : (Iterable<?>) value) {
                collectUrls(child, state, depth + 1, inspectGetters);
                if (state.isFull()) break;
            }
            return;
        }

        if (value instanceof Map<?, ?>) {
            for (Object child : ((Map<?, ?>) value).values()) {
                collectUrls(child, state, depth + 1, inspectGetters);
                if (state.isFull()) break;
            }
            return;
        }

        Class<?> type = value.getClass();
        if (type.isArray() && !type.getComponentType().isPrimitive()) {
            int length = Math.min(Array.getLength(value), 64);
            for (int i = 0; i < length && !state.isFull(); i++) {
                collectUrls(Array.get(value, i), state, depth + 1, inspectGetters);
            }
            return;
        }
        if (isLeaf(type)) return;

        if (inspectGetters) collectModelGetters(value, state, depth);

        for (Class<?> current = type;
             current != null && current != Object.class && !state.isFull();
             current = current.getSuperclass()) {
            try {
                for (Field field : current.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                    try {
                        field.setAccessible(true);
                        collectUrls(field.get(value), state, depth + 1, inspectGetters);
                    } catch (Throwable ignored) {
                    }
                    if (state.isFull()) break;
                }
            } catch (Throwable ignored) {
            }
        }
    }

    private static void collectClickListener(
            View view,
            ScanState state,
            int depth,
            boolean inspectGetters
    ) {
        try {
            Method method = View.class.getDeclaredMethod("getListenerInfo");
            method.setAccessible(true);
            Object listenerInfo = method.invoke(view);
            if (listenerInfo == null) return;
            Field listenerField = listenerInfo.getClass().getDeclaredField("mOnClickListener");
            listenerField.setAccessible(true);
            Object listener = listenerField.get(listenerInfo);
            if (inspectGetters) captureMenuSource(listener);
            collectUrls(listener, state, depth, inspectGetters);
        } catch (Throwable ignored) {
        }
    }

    private static void collectModelGetters(Object value, ScanState state, int depth) {
        if (depth > 8 || state.getterCalls >= 256) return;
        Class<?> type = value.getClass();
        String className = type.getName();
        boolean likelyModel = className.startsWith("X.") ||
                className.startsWith("com.facebook.") ||
                className.contains("GraphQL") ||
                className.contains("Story") ||
                className.contains("Reel") ||
                className.contains("Media") ||
                className.contains("Video");
        if (!likelyModel) return;

        for (Class<?> current = type;
              current != null && current != Object.class && state.getterCalls < 256;
             current = current.getSuperclass()) {
            Method[] methods;
            try {
                methods = current.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }
            for (Method method : methods) {
                if (Modifier.isStatic(method.getModifiers()) ||
                        method.getParameterCount() != 0 ||
                        method.getReturnType() == Void.TYPE ||
                        method.getReturnType().isPrimitive() ||
                        method.getName().equals("getClass") ||
                        method.getName().equals("toString")) {
                    continue;
                }

                Class<?> resultType = method.getReturnType();
                String resultName = resultType.getName();
                boolean useful = CharSequence.class.isAssignableFrom(resultType) ||
                        Uri.class.isAssignableFrom(resultType) ||
                        Iterable.class.isAssignableFrom(resultType) ||
                        Map.class.isAssignableFrom(resultType) ||
                        resultName.startsWith("X.") ||
                        resultName.startsWith("com.facebook.") ||
                        resultName.contains("GraphQL") ||
                        resultName.contains("Story") ||
                        resultName.contains("Reel") ||
                        resultName.contains("Media") ||
                        resultName.contains("Video") ||
                        resultName.contains("Image");
                if (!useful) continue;

                try {
                    method.setAccessible(true);
                    state.getterCalls++;
                    collectUrls(method.invoke(value), state, depth + 1, true);
                } catch (Throwable ignored) {
                }
                if (state.isFull()) return;
            }
        }
    }

    private static boolean isLeaf(Class<?> type) {
        String name = type.getName();
        return type.isPrimitive() ||
                Number.class.isAssignableFrom(type) ||
                type == Boolean.class ||
                type == Character.class ||
                type == Class.class ||
                ClassLoader.class.isAssignableFrom(type) ||
                Thread.class.isAssignableFrom(type) ||
                name.startsWith("android.os.") ||
                name.startsWith("java.lang.reflect.") ||
                name.startsWith("java.time.");
    }

    private static void addUrls(String text, Set<String> output) {
        if (text == null || text.length() < 30 || output.size() >= MAX_CANDIDATES) return;
        String normalized = text
                .replace("\\u0026", "&")
                .replace("\\/", "/")
                .replace("&amp;", "&");
        Matcher matcher = CDN_URL.matcher(normalized);
        while (matcher.find() && output.size() < MAX_CANDIDATES) {
            output.add(cleanUrl(matcher.group()));
        }
    }

    private static boolean hasVisibleVideoSurface(Activity activity) {
        ArrayList<View> roots = new ArrayList<>(getAllActiveViews());
        try {
            roots.add(activity.getWindow().getDecorView());
        } catch (Throwable ignored) {
        }
        for (View root : roots) {
            if (containsVisibleVideoSurface(root, 0)) return true;
        }
        return false;
    }

    private static boolean containsVisibleVideoSurface(View view, int depth) {
        if (view == null || depth > 18 || view.getVisibility() != View.VISIBLE || !view.isShown()) {
            return false;
        }
        if ((view instanceof TextureView || view instanceof SurfaceView) &&
                view.getWidth() > 120 && view.getHeight() > 120) {
            return true;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (containsVisibleVideoSurface(group.getChildAt(i), depth + 1)) return true;
            }
        }
        return false;
    }

    private static String cleanUrl(String raw) {
        String cleaned = raw
                .replace("\\u0026", "&")
                .replace("\\u003d", "=")
                .replace("\\u003D", "=")
                .replace("&amp;", "&");
        while (!cleaned.isEmpty()) {
            char last = cleaned.charAt(cleaned.length() - 1);
            if (last != '\\' && last != ')' && last != ']' &&
                    last != '}' && last != ',' && last != ';') {
                break;
            }
            cleaned = cleaned.substring(0, cleaned.length() - 1);
        }
        return cleaned;
    }

    private static void enqueueDownload(Context context, List<MediaCandidate> candidates) {
        Context appContext = context.getApplicationContext();
        showDownloadPreparing(appContext, "Finding full-size media\u2026");
        new Thread(() -> {
            Throwable lastError = null;
            try {
                int attempts = Math.min(candidates.size(), 8);
                for (int i = 0; i < attempts; i++) {
                    try {
                        downloadCandidate(appContext, candidates.get(i));
                        MAIN.post(() -> Toast.makeText(
                                appContext,
                                "Media downloaded",
                                Toast.LENGTH_SHORT
                        ).show());
                        return;
                    } catch (Throwable error) {
                        lastError = error;
                    }
                }
                Throwable error = lastError;
                String message = error == null || error.getMessage() == null
                        ? "No valid full-size media response"
                        : error.getMessage();
                showDownloadFailed(appContext, message);
                MAIN.post(() -> Toast.makeText(
                        appContext,
                        "Download failed: " + message,
                        Toast.LENGTH_SHORT
                ).show());
            } finally {
                DOWNLOAD_IN_PROGRESS.set(false);
            }
        }, "MorpheFacebookDownload").start();
    }

    private static void downloadCandidate(
            Context appContext,
            MediaCandidate media,
            DownloadQuality downloadQuality
    ) throws Throwable {
        if (media != null &&
                media.video &&
                downloadQuality != null &&
                downloadQuality.targetQualityEdge() > 0) {
            if (!media.preferred) {
                throw new IllegalStateException(
                        "No direct selected-quality source"
                );
            }
            downloadVideoAtQuality(
                    appContext,
                    media,
                    downloadQuality
            );
            return;
        }
        downloadCandidate(appContext, media);
    }

    private static void downloadVideoAtQuality(
            Context appContext,
            MediaCandidate media,
            DownloadQuality downloadQuality
    ) throws Throwable {
        File jobDirectory = createDownloadJobDirectory(appContext);
        File sourceFile = new File(jobDirectory, "source.mp4");
        File normalizedFile = new File(jobDirectory, "normalized.mp4");
        boolean reel = currentStoryCard.get() == null;
        String fileName = (reel ? "FB_Reel_" : "FB_Story_") +
                System.currentTimeMillis() +
                ".mp4";
        try {
            MediaVariant source = new MediaVariant(
                    MediaVariant.Kind.PROGRESSIVE_VIDEO,
                    media.url,
                    media.width,
                    media.height,
                    0L,
                    media.mimeType,
                    "",
                    "",
                    "progressive",
                    false
            );
            trace(
                    "download progressive source requested=" +
                            downloadQuality.displayName() +
                            " source=" + media.width + "x" + media.height
            );
            showDownloadPreparing(
                    appContext,
                    "Downloading source video\u2026"
            );
            SingleDownloadProgress progress =
                    new SingleDownloadProgress(
                            appContext,
                            fileName
                    );
            MediaTransfer.download(
                    source,
                    sourceFile,
                    progress::update
            );
            showDownloadPreparing(
                    appContext,
                    "Converting to " +
                            downloadQuality.displayName() +
                            "\u2026"
            );
            long conversionStarted = SystemClock.elapsedRealtime();
            MediaResizer.Result normalized = MediaResizer.resizeIfNeeded(
                    sourceFile,
                    normalizedFile,
                    downloadQuality.targetQualityEdge()
            );
            java.io.File shareableFile =
                    app.morphe.extension.facebook.media
                            .MediaShareNormalizer.normalizeForShare(
                            normalized.file
                    );
            publishCachedMedia(
                    appContext,
                    shareableFile,
                    fileName,
                    "video/mp4"
            );
            showDownloadComplete(
                    appContext,
                    fileName,
                    normalized.qualityEdge()
            );
            trace(
                    "download progressive completed quality=" +
                            normalized.qualityEdge() +
                            "p dimensions=" +
                            normalized.width + "x" + normalized.height +
                            " transcoded=" + normalized.transcoded +
                            " conversionMs=" +
                            (SystemClock.elapsedRealtime() -
                                    conversionStarted)
            );
        } finally {
            deleteTree(jobDirectory);
        }
    }

    private static void downloadCandidate(Context appContext, MediaCandidate media) throws Throwable {
        Uri output = null;
        String fileName = null;
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new java.net.URL(media.url).openConnection();
            connection.setInstanceFollowRedirects(true);
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(30_000);
            connection.setRequestProperty("Referer", "https://www.facebook.com/");
            connection.setRequestProperty(
                    "User-Agent",
                    "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 Chrome/131 Mobile Safari/537.36"
            );
            int response = connection.getResponseCode();
            if (response != HttpURLConnection.HTTP_OK &&
                    response != HttpURLConnection.HTTP_PARTIAL) {
                throw new IllegalStateException("HTTP " + response);
            }
            if (response == HttpURLConnection.HTTP_PARTIAL) {
                throw new IllegalStateException("Server returned partial media");
            }

            String responseType = connection.getContentType();
            String normalizedType = responseType == null
                    ? ""
                    : responseType.toLowerCase(Locale.US);
            if (normalizedType.startsWith("text/") ||
                    normalizedType.contains("json") ||
                    normalizedType.contains("xml")) {
                throw new IllegalStateException("Server returned " + responseType);
            }
            if (media.video && normalizedType.startsWith("image/")) {
                throw new IllegalStateException("Server returned a thumbnail");
            }

            long minimumBytes = media.video ? 128L * 1024L : 16L * 1024L;
            long declaredBytes = connection.getContentLengthLong();
            if (declaredBytes >= 0 && declaredBytes < minimumBytes) {
                throw new IllegalStateException("Media response was too small");
            }

            ContentResolver resolver = appContext.getContentResolver();
            long bytes;
            try (InputStream input = connection.getInputStream()) {
                byte[] buffer = new byte[64 * 1024];
                int firstCount;
                do {
                    firstCount = input.read(buffer);
                } while (firstCount == 0);
                if (firstCount < 0) throw new IllegalStateException("Empty response");
                if (!looksLikeExpectedMedia(media, normalizedType, buffer, firstCount)) {
                    throw new IllegalStateException(
                            media.video
                                    ? "Server returned a thumbnail or invalid video"
                                    : "Server returned invalid image data"
                    );
                }

                String prefix = media.video ? "FB_Reel_" : "FB_Story_";
                fileName = prefix + System.currentTimeMillis() + media.extension;
                ContentValues values = new ContentValues();
                values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
                values.put(MediaStore.MediaColumns.MIME_TYPE, media.mimeType);
                values.put(
                        MediaStore.MediaColumns.RELATIVE_PATH,
                        Environment.DIRECTORY_DOWNLOADS + "/Morphe/Facebook"
                );
                values.put(MediaStore.MediaColumns.IS_PENDING, 1);

                output = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
                if (output == null) throw new IllegalStateException("MediaStore insert failed");

                bytes = firstCount;
                long lastNotificationTime = System.currentTimeMillis();
                int lastNotificationPercent = downloadPercentage(bytes, declaredBytes);
                showDownloadProgress(appContext, fileName, bytes, declaredBytes);
                try (OutputStream stream = resolver.openOutputStream(output, "w")) {
                    if (stream == null) throw new IllegalStateException("Output stream unavailable");
                    stream.write(buffer, 0, firstCount);
                    int count;
                    while ((count = input.read(buffer)) >= 0) {
                        if (count == 0) continue;
                        stream.write(buffer, 0, count);
                        bytes += count;
                        long now = System.currentTimeMillis();
                        int percent = downloadPercentage(bytes, declaredBytes);
                        if (now - lastNotificationTime >= 500L &&
                                (percent < 0 || percent != lastNotificationPercent)) {
                            showDownloadProgress(
                                    appContext,
                                    fileName,
                                    bytes,
                                    declaredBytes
                            );
                            lastNotificationTime = now;
                            lastNotificationPercent = percent;
                        }
                    }
                }
            }
            if (bytes < minimumBytes) {
                throw new IllegalStateException("Downloaded media was too small");
            }
            if (declaredBytes > 0 && bytes < declaredBytes) {
                throw new IllegalStateException(
                        "Download ended before the full media arrived"
                );
            }

            ContentValues complete = new ContentValues();
            complete.put(MediaStore.MediaColumns.IS_PENDING, 0);
            resolver.update(output, complete, null, null);
            showDownloadComplete(appContext, fileName);
        } catch (Throwable error) {
            if (output != null) {
                try {
                    appContext.getContentResolver().delete(output, null, null);
                } catch (Throwable ignored) {
                }
                showDownloadPreparing(appContext, "Retrying with another source\u2026");
            }
            throw error;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static boolean looksLikeExpectedMedia(
            MediaCandidate media,
            String contentType,
            byte[] bytes,
            int count
    ) {
        boolean jpeg = count >= 3 &&
                (bytes[0] & 0xff) == 0xff &&
                (bytes[1] & 0xff) == 0xd8 &&
                (bytes[2] & 0xff) == 0xff;
        boolean png = count >= 8 &&
                (bytes[0] & 0xff) == 0x89 &&
                bytes[1] == 'P' && bytes[2] == 'N' && bytes[3] == 'G';
        boolean webp = count >= 12 &&
                bytes[0] == 'R' && bytes[1] == 'I' && bytes[2] == 'F' && bytes[3] == 'F' &&
                bytes[8] == 'W' && bytes[9] == 'E' && bytes[10] == 'B' && bytes[11] == 'P';
        boolean gif = count >= 6 &&
                bytes[0] == 'G' && bytes[1] == 'I' && bytes[2] == 'F';
        boolean image = jpeg || png || webp || gif;

        boolean mp4 = count >= 12 &&
                ((bytes[4] == 'f' && bytes[5] == 't' && bytes[6] == 'y' && bytes[7] == 'p') ||
                 (bytes[4] == 's' && bytes[5] == 't' && bytes[6] == 'y' && bytes[7] == 'p') ||
                 (bytes[4] == 'm' && bytes[5] == 'o' && bytes[6] == 'o' && bytes[7] == 'f'));

        if (media.video) {
            return !image && (mp4 || contentType.startsWith("video/"));
        }
        return image && !contentType.startsWith("video/");
    }

    private static final class PlayerMediaSource {
        final List<String> progressiveUrls;
        final List<String> preferredUrls;
        final String manifest;

        PlayerMediaSource(
                List<String> progressiveUrls,
                List<String> preferredUrls,
                String manifest
        ) {
            this.progressiveUrls = progressiveUrls;
            this.preferredUrls = preferredUrls;
            this.manifest = manifest;
        }

        boolean matches(
                Set<String> currentUrls,
                Set<String> currentKeys
        ) {
            for (String url : progressiveUrls) {
                if (currentUrls.contains(url)) return true;
                String key = mediaUrlKey(url);
                if (key != null && currentKeys.contains(key)) return true;
            }
            return false;
        }
    }

    private static final class DashProgress {
        final Context context;
        final String fileName;
        long videoBytes;
        long audioBytes;
        long videoTotal = -1;
        long audioTotal = -1;
        long lastUpdate;

        DashProgress(Context context, String fileName) {
            this.context = context;
            this.fileName = fileName;
        }

        synchronized void update(
                boolean video,
                long downloadedBytes,
                long totalBytes
        ) {
            if (video) {
                videoBytes = downloadedBytes;
                videoTotal = totalBytes;
            } else {
                audioBytes = downloadedBytes;
                audioTotal = totalBytes;
            }
            long now = System.currentTimeMillis();
            boolean completed = totalBytes > 0 &&
                    downloadedBytes >= totalBytes;
            if (!completed && now - lastUpdate < 500L) return;

            long combinedTotal = videoTotal > 0 && audioTotal > 0
                    ? videoTotal + audioTotal
                    : -1;
            showDownloadProgress(
                    context,
                    fileName,
                    videoBytes + audioBytes,
                    combinedTotal
            );
            lastUpdate = now;
        }
    }

    private static final class SingleDownloadProgress {
        final Context context;
        final String fileName;
        long lastUpdate;
        int lastPercent = -2;

        SingleDownloadProgress(
                Context context,
                String fileName
        ) {
            this.context = context;
            this.fileName = fileName;
        }

        synchronized void update(
                long downloadedBytes,
                long totalBytes
        ) {
            long now = System.currentTimeMillis();
            int percent = downloadPercentage(
                    downloadedBytes,
                    totalBytes
            );
            boolean completed = totalBytes > 0 &&
                    downloadedBytes >= totalBytes;
            if (!completed &&
                    now - lastUpdate < 500L &&
                    percent == lastPercent) {
                return;
            }
            showDownloadProgress(
                    context,
                    fileName,
                    downloadedBytes,
                    totalBytes
            );
            lastUpdate = now;
            lastPercent = percent;
        }
    }

    private static final class CandidateSet {
        final List<MediaCandidate> progressiveCandidates;
        final List<MediaVariant> dashVariants;

        CandidateSet(
                List<MediaCandidate> progressiveCandidates,
                List<MediaVariant> dashVariants
        ) {
            this.progressiveCandidates = progressiveCandidates;
            this.dashVariants = dashVariants;
        }

        boolean hasCompleteDashPair(int targetQualityEdge) {
            return MediaVariantSelector.bestDashPair(
                    dashVariants,
                    targetQualityEdge
            ) != null;
        }
    }

    private static final class ScanState {
        final IdentityHashMap<Object, Boolean> visited = new IdentityHashMap<>();
        final Set<String> urls;
        final Set<String> preferredProgressiveUrls =
                new LinkedHashSet<>();
        final LinkedHashMap<String, MediaVariant> dashVariants =
                new LinkedHashMap<>();
        int visits;
        int getterCalls;

        ScanState(Set<String> urls) {
            this.urls = urls;
        }

        void addDashManifest(String value) {
            if (value == null ||
                    (!value.contains("<MPD") &&
                            !value.contains("<mpd") &&
                            !value.contains("&lt;MPD") &&
                            !value.contains("&lt;mpd"))) {
                return;
            }
            for (MediaVariant variant : DashManifestParser.parse(value)) {
                if (variant.url != null &&
                        !variant.url.isEmpty() &&
                        dashVariants.size() < 64) {
                    dashVariants.putIfAbsent(variant.url, variant);
                }
            }
        }

        boolean isFull() {
            return visits >= MAX_VISITS || urls.size() >= MAX_CANDIDATES;
        }
    }

    private static final class MediaCandidate {
        final String url;
        final boolean video;
        final String extension;
        final String mimeType;
        final int score;
        final boolean preferred;
        final int width;
        final int height;

        private MediaCandidate(
                String url,
                boolean video,
                String extension,
                String mimeType,
                int score,
                boolean preferred,
                int width,
                int height
        ) {
            this.url = url;
            this.video = video;
            this.extension = extension;
            this.mimeType = mimeType;
            this.score = score;
            this.preferred = preferred;
            this.width = width;
            this.height = height;
        }

        long pixelCount() {
            return (long) width * height;
        }

        int qualityLabelEdge() {
            int edge = width > 0 && height > 0
                    ? Math.min(width, height)
                    : Math.max(width, height);
            return MediaVariant.normalizeQualityEdge(edge);
        }

        static MediaCandidate from(
                String url,
                boolean preferred
        ) {
            if (url == null || url.length() < 30) return null;
            String lower = url.toLowerCase(Locale.US);
            if (!lower.contains("fbcdn.net") && !lower.contains("cdninstagram.com")) return null;

            boolean image = lower.contains(".jpg") ||
                    lower.contains(".jpeg") ||
                    lower.contains(".png") ||
                    lower.contains(".webp") ||
                    lower.contains("stp=dst-");
            boolean partialVideo = lower.contains("bytestart=") ||
                    lower.contains("byteend=") ||
                    lower.contains("bytestop=");
            if (partialVideo) {
                // Byte-range URLs are playback fragments, not complete files.
                return null;
            }
            boolean video = !image &&
                    (lower.contains(".mp4") ||
                            lower.contains("/v/") ||
                            lower.contains("video"));
            if (!video && !image) return null;

            int width = 0;
            int height = 0;
            Matcher dimensions = URL_DIMENSIONS.matcher(lower);
            while (dimensions.find()) {
                try {
                    int candidateWidth =
                            Integer.parseInt(dimensions.group(1));
                    int candidateHeight =
                            Integer.parseInt(dimensions.group(2));
                    if ((long) candidateWidth * candidateHeight >
                            (long) width * height) {
                        width = candidateWidth;
                        height = candidateHeight;
                    }
                } catch (NumberFormatException ignored) {
                }
            }

            int score = 0;
            if (video) {
                if (lower.contains(".mp4")) score += 12;
                if (lower.contains("video")) score += 5;
                if (lower.contains("/v/")) score += 3;
                if (lower.contains("efg=") || lower.contains("oh=")) score += 2;
                return new MediaCandidate(
                        url,
                        true,
                        ".mp4",
                        "video/mp4",
                        score + (preferred ? 1000 : 0),
                        preferred,
                        width,
                        height
                );
            }

            if (lower.contains("s150x150") || lower.contains("p64x64") ||
                    lower.matches(".*(?:s|p)\\d{2,3}x\\d{2,3}.*") ||
                    lower.contains("/t1.") || lower.contains("/cp0/")) {
                score -= 24;
            }
            if (lower.contains("stp=dst-")) score += 6;
            if (lower.contains("p1080") || lower.contains("2048") || lower.contains("2160")) {
                score += 6;
            }
            if (url.length() > 250) score += 2;

            String extension = lower.contains(".png") ? ".png" :
                    lower.contains(".webp") ? ".webp" : ".jpg";
            String mime = ".png".equals(extension) ? "image/png" :
                    ".webp".equals(extension) ? "image/webp" : "image/jpeg";
            return new MediaCandidate(
                    url,
                    false,
                    extension,
                    mime,
                    score,
                    preferred,
                    width,
                    height
            );
        }
    }
}
