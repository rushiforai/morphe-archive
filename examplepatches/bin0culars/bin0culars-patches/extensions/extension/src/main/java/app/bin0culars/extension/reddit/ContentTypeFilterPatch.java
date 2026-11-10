package app.bin0culars.extension.reddit;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

public final class ContentTypeFilterPatch {

    private static final String PREF_KEY_FILTER = "content_type_filter";

    private static final String CHOICE_ALL = "all";
    private static final String CHOICE_VIDEOS = "videos";
    private static final String CHOICE_IMAGES = "images";
    private static final String CHOICE_TEXT = "text";
    private static final String CHOICE_LINKS = "links";

    private static final int KIND_NONE = 0;
    private static final int KIND_VIDEO = 1;
    private static final int KIND_IMAGE = 2;
    private static final int KIND_LINK = 3;
    private static final int KIND_UNKNOWN = 4;
    private static final int KIND_TEXT = 5;

    private static final String HOME_FEED_SCREEN = "com.reddit.feeds.home.impl.ui.HomeFeedScreen";
    private static final String POPULAR_FEED_SCREEN = "com.reddit.feeds.popular.impl.ui.PopularFeedScreen";

    private static final Set<Object> FEED_SCREENS =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private static SharedPreferences.OnSharedPreferenceChangeListener prefChangeListener;
    private static Context appContext;
    private static int emptyPagesInARow;

    private static Constructor<?> onFeedRefreshConstructor;
    private static Method onEventMethod;
    private static Object refreshTypePull;
    private static Object refreshInteractionModeManual;
    private static Object onLoadMoreEvent;
    private static boolean reflectionInitialized;
    private static boolean reflectionFailed;

    private static Context getApplicationContext() {
        if (appContext != null) {
            return appContext;
        }
        try {
            appContext = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (Throwable ignored) {
        }
        return appContext;
    }

    public static void registerFeedScreen(Object screen) {
        if (screen != null) {
            FEED_SCREENS.add(screen);
        }
        ensurePrefListener();
    }

    private static synchronized void ensurePrefListener() {
        if (prefChangeListener != null) {
            return;
        }
        Context context = getApplicationContext();
        if (context == null) {
            return;
        }
        try {
            SharedPreferences prefs = context.getSharedPreferences("bin0culars_mods", Context.MODE_PRIVATE);
            prefChangeListener = (sharedPreferences, key) -> {
                if (PREF_KEY_FILTER.equals(key)) {
                    emptyPagesInARow = 0;
                    new Handler(Looper.getMainLooper()).post(ContentTypeFilterPatch::refreshLiveScreens);
                }
            };
            prefs.registerOnSharedPreferenceChangeListener(prefChangeListener);
        } catch (Throwable ignored) {
        }
    }

    private static int leafKind(Object element, int scratch) {
        // Modified during patching.
        return 0;
    }

    private static boolean isPostContainer(Object element, int scratch) {
        // Modified during patching.
        return false;
    }

    private static List<?> children(Object element, int scratch) {
        // Modified during patching.
        return null;
    }

    private static Object feedType(Object dataSource) {
        // Modified during patching.
        return null;
    }

    private static Object feedViewModel(Object screen) {
        // Modified during patching.
        return null;
    }

    private static boolean isFirstPage(Object request, int scratch) {
        // Modified during patching.
        return false;
    }

    private static int choiceToKind(String choice) {
        if (choice == null) {
            return KIND_NONE;
        }
        switch (choice) {
            case CHOICE_VIDEOS:
                return KIND_VIDEO;
            case CHOICE_IMAGES:
                return KIND_IMAGE;
            case CHOICE_TEXT:
                return KIND_TEXT;
            case CHOICE_LINKS:
                return KIND_LINK;
            default:
                return KIND_NONE;
        }
    }

    private static boolean isMediaKind(int kind) {
        return kind == KIND_VIDEO || kind == KIND_IMAGE || kind == KIND_LINK;
    }

    private static int determinePostKind(Object element, int depth) {
        boolean[] hasUnknown = new boolean[1];
        int kind = scanKind(element, depth, hasUnknown);
        if (isMediaKind(kind)) {
            return kind;
        }
        if (hasUnknown[0]) {
            return KIND_UNKNOWN;
        }
        return KIND_TEXT;
    }

    private static int scanKind(Object element, int depth, boolean[] hasUnknown) {
        if (element == null || depth > 4) {
            return KIND_NONE;
        }
        int leaf = leafKind(element, 0);
        if (isMediaKind(leaf)) {
            return leaf;
        }
        if (leaf == KIND_UNKNOWN) {
            hasUnknown[0] = true;
        }

        List<?> kids = children(element, 0);
        if (kids != null && !kids.isEmpty()) {
            for (Object child : kids) {
                if (child != null) {
                    int childKind = scanKind(child, depth + 1, hasUnknown);
                    if (isMediaKind(childKind)) {
                        return childKind;
                    }
                }
            }
        }
        return KIND_NONE;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List filterPage(List page, Object dataSource, Object request) {
        try {
            if (page == null || page.isEmpty() || dataSource == null) {
                return page;
            }
            String choice = BinocularsMods.getChoice(PREF_KEY_FILTER);
            if (choice == null || choice.isEmpty() || CHOICE_ALL.equals(choice)) {
                return page;
            }
            Object ft = feedType(dataSource);
            if (!(ft instanceof Enum)) {
                return page;
            }
            String feedName = ((Enum<?>) ft).name();
            if (!"HOME".equals(feedName) && !"POPULAR".equals(feedName)) {
                return page;
            }
            int targetKind = choiceToKind(choice);
            if (targetKind == KIND_NONE) {
                return page;
            }

            int totalPostContainers = 0;
            int keptPostContainers = 0;
            Object firstPostContainer = null;
            int firstPostContainerResultIndex = -1;
            List result = new ArrayList(page.size());
            for (Object element : page) {
                if (element == null) {
                    continue;
                }
                if (!isPostContainer(element, 0)) {
                    result.add(element);
                } else {
                    if (totalPostContainers == 0) {
                        firstPostContainer = element;
                        firstPostContainerResultIndex = result.size();
                    }
                    totalPostContainers++;
                    int kind = determinePostKind(element, 0);
                    if (kind == targetKind || kind == KIND_UNKNOWN) {
                        result.add(element);
                        keptPostContainers++;
                    }
                }
            }

            if (totalPostContainers >= 1 && keptPostContainers == 0 && isFirstPage(request, 0)) {
                if (firstPostContainer != null && firstPostContainerResultIndex >= 0) {
                    result.add(firstPostContainerResultIndex, firstPostContainer);
                    keptPostContainers = 1;
                }
            }

            if (totalPostContainers >= 1) {
                if (keptPostContainers >= 1) {
                    emptyPagesInARow = 0;
                } else {
                    emptyPagesInARow++;
                }
                if (keptPostContainers < 3 && emptyPagesInARow <= 10) {
                    requestLoadMore(feedName);
                }
            }

            return result;
        } catch (Throwable ignored) {
            return page;
        }
    }

    private static synchronized void initReflection() {
        if (reflectionInitialized || reflectionFailed) {
            return;
        }
        try {
            Class<?> feedRefreshTypeClass = Class.forName("com.reddit.feeds.ui.events.FeedRefreshType");
            @SuppressWarnings({"unchecked", "rawtypes"})
            Object pull = Enum.valueOf((Class<Enum>) feedRefreshTypeClass, "PULL_TO_REFRESH");
            refreshTypePull = pull;

            Class<?> modeClass = Class.forName("com.reddit.feeds.ui.events.FeedRefreshInteractionMode");
            @SuppressWarnings({"unchecked", "rawtypes"})
            Object manual = Enum.valueOf((Class<Enum>) modeClass, "MANUAL");
            refreshInteractionModeManual = manual;

            Class<?> onFeedRefreshClass = Class.forName("com.reddit.feeds.ui.events.OnFeedRefresh");
            onFeedRefreshConstructor = onFeedRefreshClass.getConstructor(
                    feedRefreshTypeClass,
                    modeClass,
                    boolean.class);

            Class<?> compositionViewModelClass = Class.forName("com.reddit.screen.presentation.CompositionViewModel");
            onEventMethod = compositionViewModelClass.getMethod("onEvent", Object.class);

            Class<?> onLoadMoreClass = Class.forName("com.reddit.feeds.ui.events.OnLoadMore");
            for (Field field : onLoadMoreClass.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) && field.getType() == onLoadMoreClass) {
                    field.setAccessible(true);
                    onLoadMoreEvent = field.get(null);
                    break;
                }
            }

            reflectionInitialized = true;
        } catch (Throwable ignored) {
            reflectionFailed = true;
        }
    }

    private static void sendEventToScreens(Object event, String targetClassName) {
        if (event == null || onEventMethod == null) {
            return;
        }
        List<Object> screens;
        synchronized (FEED_SCREENS) {
            screens = new ArrayList<>(FEED_SCREENS);
        }
        for (Object screen : screens) {
            if (screen == null) {
                continue;
            }
            if (targetClassName != null && !targetClassName.equals(screen.getClass().getName())) {
                continue;
            }
            try {
                Object vm = feedViewModel(screen);
                if (vm != null) {
                    onEventMethod.invoke(vm, event);
                }
            } catch (Throwable ignored) {
            }
        }
    }

    public static void refreshLiveScreens() {
        try {
            initReflection();
            if (onFeedRefreshConstructor == null || refreshTypePull == null || refreshInteractionModeManual == null) {
                return;
            }
            Object event = onFeedRefreshConstructor.newInstance(refreshTypePull, refreshInteractionModeManual, false);
            sendEventToScreens(event, null);
        } catch (Throwable ignored) {
        }
    }

    private static void requestLoadMore(String feedName) {
        try {
            initReflection();
            if (onLoadMoreEvent == null) {
                return;
            }
            final String targetClassName;
            if ("HOME".equals(feedName)) {
                targetClassName = HOME_FEED_SCREEN;
            } else if ("POPULAR".equals(feedName)) {
                targetClassName = POPULAR_FEED_SCREEN;
            } else {
                return;
            }
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    sendEventToScreens(onLoadMoreEvent, targetClassName);
                } catch (Throwable ignored) {
                }
            });
        } catch (Throwable ignored) {
        }
    }
}
