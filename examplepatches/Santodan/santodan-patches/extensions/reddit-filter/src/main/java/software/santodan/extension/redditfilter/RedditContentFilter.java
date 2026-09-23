package software.santodan.extension.redditfilter;

import android.content.*;
import android.preference.*;
import android.text.InputType;
import android.app.AlertDialog;
import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.net.Uri;
import android.widget.EditText;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.text.TextWatcher;
import android.text.Editable;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.lang.reflect.Modifier;
import java.lang.ref.WeakReference;
import java.util.*;
import java.util.regex.*;
import java.util.concurrent.*;
import java.io.OutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

/** Runtime settings and safe Listing-level filtering. */
@SuppressWarnings({"unused", "deprecation"})
public final class RedditContentFilter {
    private static final String KEYWORDS = "redditplusplus_filter_keywords";
    private static final String FLAIRS = "redditplusplus_filter_flairs";
    private static final String DISCOVERED_FLAIRS = "redditplusplus_discovered_flairs";
    private static final String FLAIR_COLORS = "redditplusplus_flair_colors";
    private static final String STORE = "redditplusplus_settings";
    private static final String DEBUG = "redditplusplus_debug_enabled";
    private static final String LAST_FLAIR_ACTION = "reddit_filter_last_flair_action";
    private static final String SHOW_HOME_FLAIRS = "reddit_filter_show_home_flairs";
    private static volatile Context applicationContext;
    private static volatile Accessors accessors;
    private static volatile Object flairSource;
    private static volatile Object subredditSource;
    private static volatile Object postByIdSource;
    private static volatile Object linkRepository;
    private static final ExecutorService POST_LOOKUPS = Executors.newFixedThreadPool(4, task -> {
        Thread thread = new Thread(task, "Reddit-filter-post-details");
        thread.setDaemon(true);
        return thread;
    });
    private static final Map<String, CompletableFuture<Void>> POST_LOOKUP_TASKS = new ConcurrentHashMap<>();
    private static volatile String lastPostLookup = "not requested";
    private static volatile String lastNativeFlairUi = "not observed";
    private static volatile String lastFlairRequestError = "none";
    private static volatile long chipStyleCalls, chipStylesApplied;
    private static volatile long channelAugmentCalls;
    private static volatile String lastChannelAugment = "not called";
    private static volatile String lastFeedScreenCommunity = "not seen";
    private static volatile long feedScreenSeenAt;
    private static volatile long unassignedChannelSeenAt;
    private static volatile int unassignedChannelCount = -1;
    private static volatile String lastHeaderHook = "not called";
    private static volatile String lastFallbackCheck = "not called";
    private static final Map<String, Integer> NATIVE_CHANNEL_COUNTS = new java.util.concurrent.ConcurrentHashMap<>();
    private static final Set<String> NATIVE_CHIP_COMMUNITIES = java.util.concurrent.ConcurrentHashMap.newKeySet();
    private static final Map<android.widget.FrameLayout, Integer> ORIGINAL_ROW_PADDING =
        Collections.synchronizedMap(new WeakHashMap<>());
    private static final Set<android.widget.FrameLayout> ROW_ATTACHING =
        Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private static volatile String lastChipStyle = "not called";
    private static volatile String lastFlairRowPosition = "not attached";
    private static volatile WeakReference<Activity> currentActivity = new WeakReference<>(null);
    private static volatile boolean trackingActivities;
    private static final Map<String, PostInfo> POSTS = new java.util.concurrent.ConcurrentHashMap<>();
    private static final Map<String, Integer> TEMPLATE_COUNTS = new java.util.concurrent.ConcurrentHashMap<>();
    private static volatile long rendererCalls, matchedCards;
    private static volatile long listingFilterCalls, listingItemsSeen, listingItemsRemoved;
    private static volatile String lastListingFilter = "not called";
    private static volatile long linkModelCalls, linkModelsStored;
    private static volatile String lastLinkModel = "not called";
    private static volatile long feedLinkMapperCalls;
    private static volatile String lastFeedLinkMapper = "not called";
    private static volatile long classicPostCalls, classicPostFlairMatches;
    private static volatile String lastClassicPost = "not called";
    private static volatile long homeFlairDisplayCalls, homeFlairsDisplayed;
    private static volatile String lastHomeFlairDisplay = "not called";
    private static volatile long feedSourceCalls;
    private static volatile String lastFeedSource = "not called";
    private static final java.util.concurrent.atomic.AtomicBoolean FEED_SOURCE_TRACE_RECORDED =
        new java.util.concurrent.atomic.AtomicBoolean();
    private static final java.util.concurrent.atomic.AtomicBoolean FEED_CELL_TRACE_RECORDED =
        new java.util.concurrent.atomic.AtomicBoolean();
    private static final java.util.concurrent.atomic.AtomicInteger HOME_MODEL_LOGS =
        new java.util.concurrent.atomic.AtomicInteger();
    private static volatile String lastClasses = "none", lastTitles = "none", lastFlairs = "none";
    private static final ArrayDeque<String> DECISIONS = new ArrayDeque<>();
    private static final ThreadLocal<Object> CHANNEL_MODEL = new ThreadLocal<>();
    private static final Set<String> LOADING_HEADER_FLAIRS = Collections.synchronizedSet(new HashSet<>());
    private static volatile WeakReference<android.widget.FrameLayout> currentFlairHeader = new WeakReference<>(null);
    private static volatile String currentSubreddit = "";
    private static volatile WeakReference<android.view.View> currentSubredditHeader = new WeakReference<>(null);
    private static volatile WeakReference<Object> currentSubredditHeaderModel = new WeakReference<>(null);
    private static final Map<Object, Object> FLAIR_CALLBACK_MODELS =
        Collections.synchronizedMap(new WeakHashMap<>());

    private RedditContentFilter() {}

    public static void rememberSubredditScreen(Object composable) {
        try {
            Object screen = field(composable, "a");
            Method name = screen.getClass().getDeclaredMethod("n5");
            name.setAccessible(true);
            String community = normalizeCommunity(string(name.invoke(screen)));
            recordUiEvent(null, "screen community=" + community + " previous=" + lastFeedScreenCommunity
                + " pending=" + unassignedChannelCount);
            if (!community.isEmpty()) {
                if (!community.equals(lastFeedScreenCommunity)) unassignedChannelCount = -1;
                currentSubreddit = community;
                lastFeedScreenCommunity = community;
                feedScreenSeenAt = android.os.SystemClock.uptimeMillis();
                if (unassignedChannelCount >= 0
                    && feedScreenSeenAt - unassignedChannelSeenAt < 3000L) {
                    NATIVE_CHANNEL_COUNTS.put(community, unassignedChannelCount);
                    unassignedChannelCount = -1;
                    android.view.View header = currentSubredditHeader.get();
                    Object model = currentSubredditHeaderModel.get();
                    if (header != null && model != null)
                        header.post(() -> maybeAttachFallbackFlairRow(header, model, community));
                }
            } else {
                currentSubreddit = "";
                lastFeedScreenCommunity = "empty subredditName";
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            currentSubreddit = "";
            lastFeedScreenCommunity = error.getClass().getSimpleName() + ": " + error.getMessage();
        }
    }

    public static void prepareSubredditFlairs(Object header, Object model) {
        if (!(header instanceof android.view.View) || model == null) {
            lastHeaderHook = "missing header view or model";
            return;
        }
        android.view.View view = (android.view.View) header;
        String community;
        try { community = normalizeCommunity(string(field(model, "b"))); }
        catch (ReflectiveOperationException | RuntimeException error) {
            lastHeaderHook = error.getClass().getSimpleName() + ": " + error.getMessage();
            return;
        }
        if (community.isEmpty()) {
            lastHeaderHook = "empty community";
            return;
        }
        lastHeaderHook = "r/" + community + " attached=" + view.isAttachedToWindow()
            + " class=" + view.getClass().getName();
        recordUiEvent(view.getContext(), "header r/" + community + " view="
            + System.identityHashCode(view) + " attached=" + view.isAttachedToWindow()
            + " native=" + NATIVE_CHANNEL_COUNTS.get(community) + " pending=" + unassignedChannelCount);
        currentSubreddit = community;
        currentSubredditHeader = new WeakReference<>(view);
        currentSubredditHeaderModel = new WeakReference<>(model);
        view.addOnAttachStateChangeListener(new android.view.View.OnAttachStateChangeListener() {
            public void onViewAttachedToWindow(android.view.View attached) { }
            public void onViewDetachedFromWindow(android.view.View detached) {
                recordUiEvent(detached.getContext(), "header detached r/" + community
                    + " view=" + System.identityHashCode(detached));
                if (currentSubredditHeader.get() == detached) {
                    currentSubreddit = "";
                    feedScreenSeenAt = 0L;
                    currentSubredditHeader = new WeakReference<>(null);
                    currentSubredditHeaderModel = new WeakReference<>(null);
                }
                detached.removeOnAttachStateChangeListener(this);
            }
        });
        trackActivities(view.getContext());
        Context owner = view.getContext();
        for (int i = 0; i < 12 && owner instanceof android.content.ContextWrapper
            && !(owner instanceof Activity); i++)
            owner = ((android.content.ContextWrapper) owner).getBaseContext();
        if (owner instanceof Activity) currentActivity = new WeakReference<>((Activity) owner);
        if (TEMPLATE_COUNTS.containsKey(community) || subredditSource == null
            || !LOADING_HEADER_FLAIRS.add(community)) {
            view.post(() -> maybeAttachFallbackFlairRow(view, model, community));
            view.postDelayed(() -> maybeAttachFallbackFlairRow(view, model, community), 250L);
            view.postDelayed(() -> maybeAttachFallbackFlairRow(view, model, community), 1000L);
            view.postDelayed(() -> maybeAttachFallbackFlairRow(view, model, community), 3000L);
            return;
        }
        fetchFullFlairs(view.getContext(), community, success -> LOADING_HEADER_FLAIRS.remove(community));
        view.post(() -> maybeAttachFallbackFlairRow(view, model, community));
        view.postDelayed(() -> maybeAttachFallbackFlairRow(view, model, community), 250L);
        view.postDelayed(() -> maybeAttachFallbackFlairRow(view, model, community), 1000L);
        view.postDelayed(() -> maybeAttachFallbackFlairRow(view, model, community), 3000L);
    }

    private static void maybeAttachFallbackFlairRow(android.view.View view, Object model, String community) {
        if (!view.isAttachedToWindow() || !community.equals(lastFeedScreenCommunity)) {
            lastFallbackCheck = "r/" + community + " header detached or replaced";
            recordUiEvent(view.getContext(), "fallback skip " + lastFallbackCheck);
            return;
        }
        if (view.findViewWithTag("reddit_filter_flair_row") != null) {
            lastFallbackCheck = "r/" + community + " row already attached";
            recordUiEvent(view.getContext(), "fallback skip " + lastFallbackCheck);
            return;
        }
        if (NATIVE_CHIP_COMMUNITIES.contains(community)) {
            lastFallbackCheck = "r/" + community + " native flair chips rendered";
            recordUiEvent(view.getContext(), "fallback skip " + lastFallbackCheck);
            return;
        }
        Integer nativeCount = NATIVE_CHANNEL_COUNTS.get(community);
        if (nativeCount == null && unassignedChannelCount >= 0
            && android.os.SystemClock.uptimeMillis() - unassignedChannelSeenAt < 10000L) {
            nativeCount = unassignedChannelCount;
            NATIVE_CHANNEL_COUNTS.put(community, nativeCount);
            unassignedChannelCount = -1;
        }
        lastFallbackCheck = "r/" + community + " native=" + nativeCount
            + " pending=" + unassignedChannelCount;
        recordUiEvent(view.getContext(), "fallback check " + lastFallbackCheck
            + " view=" + System.identityHashCode(view));
        attachSubredditFlairRow(view, model);
    }

    public static List<?> augmentFlairChannels(List<?> original) {
        if (original == null) return null;
        channelAugmentCalls++;
        String community = currentSubreddit;
        android.view.View header = currentSubredditHeader.get();
        boolean visibleHeader = header != null && header.isAttachedToWindow();
        recordUiEvent(null, "channels community=" + community + " screen=" + lastFeedScreenCommunity
            + " original=" + original.size() + " header="
            + (header == null ? "none" : System.identityHashCode(header))
            + " visible=" + visibleHeader + " pending=" + unassignedChannelCount);
        if (header != null && !community.isEmpty()) {
            NATIVE_CHANNEL_COUNTS.put(community, original.size());
            Object headerModel = currentSubredditHeaderModel.get();
            if (headerModel != null && original.size() <= 1)
                header.post(() -> maybeAttachFallbackFlairRow(header, headerModel, community));
        }
        if (!visibleHeader) {
            unassignedChannelCount = original.size();
            unassignedChannelSeenAt = android.os.SystemClock.uptimeMillis();
        }
        if (!visibleHeader && !lastFeedScreenCommunity.isEmpty()
            && android.os.SystemClock.uptimeMillis() - feedScreenSeenAt < 1000L)
            NATIVE_CHANNEL_COUNTS.put(lastFeedScreenCommunity, original.size());
        else if (visibleHeader && !community.isEmpty())
            NATIVE_CHANNEL_COUNTS.put(community, original.size());
        if (!visibleHeader) {
            lastChannelAugment = "not a visible subreddit header";
            return original;
        }
        Context context = applicationContext != null ? applicationContext : appContext();
        if (community.isEmpty() || context == null) {
            lastChannelAugment = community.isEmpty() ? "missing community" : "missing context for r/" + community;
            return original;
        }
        try {
            List<Object> result = new ArrayList<>(original.size());
            for (Object item : original)
                if (item == null || !item.getClass().getName().equals("aog0")) result.add(item);
            Set<String> labels = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
            for (Object item : original) if (item != null && item.getClass().getName().equals("yng0"))
                labels.add(normalizeFlair(string(field(item, "c"))));
            Class<?> channel = Class.forName("yng0");
            Class<?> status = Class.forName("xmk0");
            Object defaultStatus = Class.forName("ki6").getField("k0").get(null);
            java.lang.reflect.Constructor<?> constructor = channel.getDeclaredConstructor(String.class,
                String.class, String.class, boolean.class, status, int.class, String.class, List.class);
            constructor.setAccessible(true);
            int added = 0;
            for (String entry : lines(prefs(context).getString(DISCOVERED_FLAIRS, ""))) {
                int split = entry.indexOf("::");
                if (split <= 0 || !entry.substring(0, split).equalsIgnoreCase(community)) continue;
                String label = entry.substring(split + 2);
                if (label.isEmpty() || !labels.add(normalizeFlair(label))) continue;
                result.add(constructor.newInstance(community, "rpp:" + label, label, false,
                    defaultStatus, 0, null, Collections.emptyList()));
                if (++added >= 200) break;
            }
            lastChannelAugment = "r/" + community + " original=" + original.size()
                + " added=" + added;
            return result;
        } catch (ReflectiveOperationException | RuntimeException error) {
            lastChannelAugment = error.getClass().getSimpleName() + ": " + error.getMessage();
            return original;
        }
    }

    public static Object wrapFlairClick(Object original, Object model) {
        if (original == null || model == null) return original;
        FLAIR_CALLBACK_MODELS.put(original, model);
        try {
            if (!string(field(model, "b")).startsWith("rpp:")) return original;
            String community = normalizeCommunity(string(field(model, "a")));
            String flair = string(field(model, "c"));
            Class<?> function = Class.forName("kotlin.jvm.functions.Function0");
            Object replacement = Proxy.newProxyInstance(function.getClassLoader(), new Class<?>[] { function },
                (proxy, method, args) -> {
                    if (method.getName().equals("invoke")) showChannelFilterMenu(community, flair);
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("equals")) return proxy == args[0];
                    if (method.getName().equals("toString")) return "Reddit flair click";
                    return null;
                });
            FLAIR_CALLBACK_MODELS.put(replacement, model);
            return replacement;
        } catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    /** Reuses Reddit's chip layout while supplying the template palette or a filtered palette. */
    public static Object styleFlairChip(Object model, Object original) {
        chipStyleCalls++;
        if (model == null || original == null || !model.getClass().getName().equals("yng0")) {
            lastChipStyle = "not a flair model";
            return original;
        }
        try {
            String community = normalizeCommunity(string(field(model, "a")));
            String label = normalizeFlair(string(field(model, "c")));
            if (!community.isEmpty()) {
                if (NATIVE_CHIP_COMMUNITIES.add(community))
                    recordUiEvent(null, "native chip r/" + community + " flair=" + label);
                android.widget.FrameLayout fallback = currentFlairHeader.get();
                if (fallback != null && community.equals(lastFeedScreenCommunity))
                    fallback.post(() -> removeFallbackFlairRow(fallback, community));
            }
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null || community.isEmpty() || label.isEmpty()) {
                lastChipStyle = "missing context or flair identity";
                return original;
            }
            SharedPreferences preferences = prefs(context);
            boolean blocked = false;
            for (FlairRule rule : parseFlairs(preferences.getString(FLAIRS, "")))
                if (rule.community.equals(community) && rule.flair.equalsIgnoreCase(label)) {
                    blocked = true; break;
                }
            String palette = null;
            if (!blocked) for (String entry : lines(preferences.getString(FLAIR_COLORS, ""))) {
                int split = entry.indexOf("::");
                int separator = entry.indexOf('\t', split + 2);
                if (split > 0 && separator > split && entry.substring(0, split).equalsIgnoreCase(community)
                    && normalizeFlair(entry.substring(split + 2, separator)).equalsIgnoreCase(label)) {
                    palette = entry.substring(separator + 1); break;
                }
            }
            if (!blocked && palette == null) {
                lastChipStyle = "no template color for r/" + community + " :: " + label;
                return original;
            }
            int background;
            if (blocked) { background = 0xff303030; }
            else {
                String[] parts = palette.split("\\|", 2);
                background = android.graphics.Color.parseColor(parts[0]);
            }
            Class<?> function = Class.forName("kotlin.jvm.functions.Function1");
            Class<?> paletteType = Class.forName("d8j");
            Field provider = paletteType.getDeclaredField("a");
            provider.setAccessible(true);
            Object onLightBackground = provider.get(original);
            java.lang.reflect.Constructor<?> constructor = Class.forName("c8j")
                .getDeclaredConstructor(long.class, function);
            constructor.setAccessible(true);
            Object result = constructor.newInstance(((long) background) << 32, onLightBackground);
            chipStylesApplied++;
            lastChipStyle = (blocked ? "gray filter" : "template color") + " for r/" + community
                + " :: " + label;
            return result;
        } catch (ReflectiveOperationException | RuntimeException error) {
            lastChipStyle = error.getClass().getSimpleName() + ": " + error.getMessage();
            return original;
        }
    }

    public static Object flairChipModifier(Object modifier, Object interaction, Object indication,
                                           boolean enabled, String label, Object role, Object onClick) {
        try {
            Object model = FLAIR_CALLBACK_MODELS.get(onClick);
            if (model == null && onClick != null && onClick.getClass().getName().equals("qm7"))
                model = field(onClick, "e");
            if (model != null && model.getClass().getName().equals("yng0")) {
                String community = normalizeCommunity(string(field(model, "a")));
                String flair = string(field(model, "c"));
                if (!community.isEmpty() && !flair.isEmpty()) {
                    Class<?> function = Class.forName("kotlin.jvm.functions.Function0");
                    Object onLongClick = Proxy.newProxyInstance(function.getClassLoader(),
                        new Class<?>[] { function }, (proxy, method, args) -> {
                            if (method.getName().equals("invoke")) showChannelFilterMenu(community, flair);
                            return null;
                        });
                    Method combined = channelModifierMethod("d", 10);
                    if (combined != null) return combined.invoke(null, modifier, interaction, indication,
                        enabled, label, role, null, onClick, onLongClick, 0);
                }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        try {
            Method clickable = channelModifierMethod("a", 7);
            if (clickable != null) return clickable.invoke(null, modifier, interaction, indication,
                enabled, label, role, onClick);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return modifier;
    }

    /** The subreddit header exists even when Reddit has no post-channel navigation row. */
    public static void attachSubredditFlairRow(Object header, Object model) {
        if (!(header instanceof android.widget.FrameLayout) || model == null) return;
        android.widget.FrameLayout frame = (android.widget.FrameLayout) header;
        String community;
        try { community = normalizeCommunity(string(field(model, "b"))); }
        catch (ReflectiveOperationException | RuntimeException ignored) { return; }
        if (community.isEmpty()) return;
        if (NATIVE_CHIP_COMMUNITIES.contains(community) || !ROW_ATTACHING.add(frame)) return;
        frame.post(() -> {
            try {
                if (!frame.isAttachedToWindow() || !community.equals(lastFeedScreenCommunity)
                    || NATIVE_CHIP_COMMUNITIES.contains(community)
                    || frame.findViewWithTag("reddit_filter_flair_row") != null) return;
                trackActivities(frame.getContext());
                Context owner = frame.getContext();
                while (owner instanceof android.content.ContextWrapper && !(owner instanceof Activity))
                    owner = ((android.content.ContextWrapper) owner).getBaseContext();
                if (owner instanceof Activity) currentActivity = new WeakReference<>((Activity) owner);
                currentFlairHeader = new WeakReference<>(frame);
                recordUiEvent(frame.getContext(), "fallback attach r/" + community + " frame="
                    + System.identityHashCode(frame) + " height=" + frame.getHeight());
                boolean load = !TEMPLATE_COUNTS.containsKey(community)
                    && (subredditSource != null || flairSource != null)
                    && LOADING_HEADER_FLAIRS.add(community);
                renderSubredditFlairRow(frame, community);
                if (load)
                    fetchFullFlairs(frame.getContext(), community, success -> {
                        LOADING_HEADER_FLAIRS.remove(community);
                        if (frame.isAttachedToWindow()) renderSubredditFlairRow(frame, community);
                    });
            } catch (RuntimeException ignored) { }
            finally { ROW_ATTACHING.remove(frame); }
        });
    }

    private static void removeFallbackFlairRow(android.widget.FrameLayout frame, String community) {
        android.view.View row = frame.findViewWithTag("reddit_filter_flair_row");
        if (row == null) return;
        frame.removeView(row);
        Integer padding = ORIGINAL_ROW_PADDING.remove(frame);
        if (padding != null)
            frame.setPadding(frame.getPaddingLeft(), frame.getPaddingTop(), frame.getPaddingRight(), padding);
        recordUiEvent(frame.getContext(), "fallback removed r/" + community + " native chips rendered");
    }

    private static int dp(Context context, int value) {
        return (int) (value * context.getResources().getDisplayMetrics().density + 0.5f);
    }

    private static void renderSubredditFlairRow(android.widget.FrameLayout frame, String community) {
        if (NATIVE_CHIP_COMMUNITIES.contains(community)) {
            removeFallbackFlairRow(frame, community);
            return;
        }
        Context context = frame.getContext();
        android.view.View old = frame.findViewWithTag("reddit_filter_flair_row");
        if (old != null) frame.removeView(old);
        SharedPreferences preferences = prefs(context);
        Set<String> selected = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        selected.addAll(lines(preferences.getString(FLAIRS, "")));
        Set<String> available = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        for (String entry : lines(preferences.getString(DISCOVERED_FLAIRS, ""))) {
            int split = entry.indexOf("::");
            if (split > 0 && entry.substring(0, split).equalsIgnoreCase(community))
                available.add(entry.substring(split + 2));
        }
        for (String entry : selected) {
            int split = entry.indexOf("::");
            if (split > 0 && entry.substring(0, split).equalsIgnoreCase(community))
                available.add(entry.substring(split + 2));
        }
        android.widget.HorizontalScrollView scroll = new android.widget.HorizontalScrollView(context);
        scroll.setTag("reddit_filter_flair_row");
        scroll.setHorizontalScrollBarEnabled(false);
        scroll.setFillViewport(false);
        scroll.setBackgroundColor(0xff000000);
        android.widget.LinearLayout row = new android.widget.LinearLayout(context);
        row.setOrientation(android.widget.LinearLayout.HORIZONTAL);
        row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        row.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        scroll.addView(row, new android.widget.HorizontalScrollView.LayoutParams(-2, -1));
        if (available.isEmpty()) {
            addFlairChip(row, LOADING_HEADER_FLAIRS.contains(community) ? "Loading…" : "No flairs found",
                false, null, null, null);
        } else {
            List<String> labels = new ArrayList<>(available);
            labels.sort((a, b) -> {
                boolean af = selected.contains(community + "::" + a);
                boolean bf = selected.contains(community + "::" + b);
                return af == bf ? String.CASE_INSENSITIVE_ORDER.compare(a, b) : af ? -1 : 1;
            });
            for (String label : labels) addFlairChip(row, label, selected.contains(community + "::" + label),
                () -> showChannelFilterMenu(community, label), () -> showChannelFilterMenu(community, label),
                flairPalette(preferences, community, label));
        }
        int height = dp(context, 56);
        if (!ORIGINAL_ROW_PADDING.containsKey(frame)) ORIGINAL_ROW_PADDING.put(frame, frame.getPaddingBottom());
        frame.setPadding(frame.getPaddingLeft(), frame.getPaddingTop(), frame.getPaddingRight(), height);
        frame.setClipToPadding(false);
        android.widget.FrameLayout.LayoutParams params = new android.widget.FrameLayout.LayoutParams(-1, height,
            android.view.Gravity.TOP);
        frame.addView(scroll, params);
        recordUiEvent(context, "fallback render r/" + community + " available=" + available.size()
            + " frame=" + System.identityHashCode(frame) + " height=" + frame.getHeight());
        scroll.post(() -> {
            scroll.setTranslationY(Math.max(0, frame.getHeight() - scroll.getHeight()));
            scroll.post(() -> recordFlairRowPosition(frame, scroll, community));
        });
        scroll.postDelayed(() -> {
            if (scroll.getParent() == frame)
                scroll.setTranslationY(Math.max(0, frame.getHeight() - scroll.getHeight()));
        }, 200L);
    }

    private static void recordFlairRowPosition(android.widget.FrameLayout frame,
                                               android.widget.HorizontalScrollView scroll, String community) {
            int[] headerScreen = new int[2];
            int[] rowScreen = new int[2];
            frame.getLocationOnScreen(headerScreen);
            scroll.getLocationOnScreen(rowScreen);
            android.view.ViewParent parent = frame.getParent();
            lastFlairRowPosition = "r/" + community + " headerY=" + headerScreen[1]
                + " headerHeight=" + frame.getHeight() + " rowY=" + rowScreen[1]
                + " rowTop=" + scroll.getTop() + " rowHeight=" + scroll.getHeight()
                + " margin=" + ((android.widget.FrameLayout.LayoutParams) scroll.getLayoutParams()).topMargin
                + " parent=" + (parent == null ? "none" : parent.getClass().getName());
    }

    private static String flairPalette(SharedPreferences preferences, String community, String label) {
        for (String entry : lines(preferences.getString(FLAIR_COLORS, ""))) {
            int split = entry.indexOf("::");
            int separator = entry.indexOf('\t', split + 2);
            if (split > 0 && separator > split && entry.substring(0, split).equalsIgnoreCase(community)
                && normalizeFlair(entry.substring(split + 2, separator)).equalsIgnoreCase(normalizeFlair(label)))
                return entry.substring(separator + 1);
        }
        return null;
    }

    private static void addFlairChip(android.widget.LinearLayout row, String label, boolean blocked,
                                     Runnable click, Runnable longClick, String palette) {
        Context context = row.getContext();
        android.widget.TextView chip = new android.widget.TextView(context);
        chip.setText(label);
        chip.setTextSize(14);
        int backgroundColor = blocked ? 0xff303030 : 0xff181818;
        int textColor = blocked ? 0xff888888 : 0xffeeeeee;
        if (!blocked && palette != null) try {
            String[] parts = palette.split("\\|", 2);
            backgroundColor = android.graphics.Color.parseColor(parts[0]);
            textColor = parts.length > 1 && parts[1].equalsIgnoreCase("DARK") ? 0xff111111 : 0xffffffff;
        } catch (IllegalArgumentException ignored) { }
        chip.setTextColor(textColor);
        chip.setGravity(android.view.Gravity.CENTER);
        chip.setSingleLine(true);
        chip.setPadding(dp(context, 14), 0, dp(context, 14), 0);
        android.graphics.drawable.GradientDrawable background = new android.graphics.drawable.GradientDrawable();
        background.setColor(backgroundColor);
        background.setCornerRadius(dp(context, 16));
        background.setStroke(dp(context, 1), blocked ? 0xff555555 : palette == null ? 0xff666666 : backgroundColor);
        chip.setBackground(background);
        android.widget.LinearLayout.LayoutParams params = new android.widget.LinearLayout.LayoutParams(-2, dp(context, 38));
        params.rightMargin = dp(context, 8);
        row.addView(chip, params);
        if (click != null) chip.setOnClickListener(v -> {
            try { click.run(); }
            catch (RuntimeException error) {
                recordFlairAction(context, "Tap failed: " + error.getClass().getSimpleName()
                    + ": " + error.getMessage());
                Toast.makeText(context, "Unable to open this flair", Toast.LENGTH_SHORT).show();
            }
        });
        if (longClick != null) chip.setOnLongClickListener(v -> {
            try { longClick.run(); }
            catch (RuntimeException error) {
                recordFlairAction(context, "Long press failed: " + error.getClass().getSimpleName()
                    + ": " + error.getMessage());
                Toast.makeText(context, "Unable to edit this flair", Toast.LENGTH_SHORT).show();
            }
            return true;
        });
    }

    private static void recordFlairAction(Context context, String action) {
        prefs(context).edit().putString(LAST_FLAIR_ACTION, action).commit();
    }

    private static synchronized void trackActivities(Context context) {
        if (trackingActivities || !(context.getApplicationContext() instanceof Application)) return;
        ((Application) context.getApplicationContext()).registerActivityLifecycleCallbacks(
            new Application.ActivityLifecycleCallbacks() {
                public void onActivityCreated(Activity activity, Bundle state) {}
                public void onActivityStarted(Activity activity) {}
                public void onActivityResumed(Activity activity) { currentActivity = new WeakReference<>(activity); }
                public void onActivityPaused(Activity activity) {}
                public void onActivityStopped(Activity activity) {}
                public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
                public void onActivityDestroyed(Activity activity) {}
            });
        trackingActivities = true;
    }

    public static void rememberChannelModel(Object model) { CHANNEL_MODEL.set(model); }

    /** Adds a long-press callback while preserving Reddit's original tap callback. */
    public static Object channelModifier(Object modifier, Object interaction, Object indication,
                                         boolean enabled, String label, Object role, Object onClick, int mask) {
        Object model = CHANNEL_MODEL.get();
        CHANNEL_MODEL.remove();
        try {
            if (model != null && model.getClass().getName().equals("yng0")) {
                String community = normalizeCommunity(string(field(model, "b")));
                String flair = string(field(model, "c"));
                if (!community.isEmpty() && !flair.isEmpty()) {
                    Class<?> function = Class.forName("kotlin.jvm.functions.Function0");
                    Object onLongClick = Proxy.newProxyInstance(function.getClassLoader(),
                        new Class<?>[] { function }, (proxy, method, args) -> {
                            if (method.getName().equals("invoke")) showChannelFilterMenu(community, flair);
                            return null;
                        });
                    Method combined = channelModifierMethod("d", 10);
                    if (combined != null) return combined.invoke(null, modifier, interaction, indication,
                        (mask & 4) != 0 || enabled, (mask & 8) != 0 ? null : label,
                        (mask & 16) != 0 ? null : role, null, onClick, onLongClick, 0);
                }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        try {
            Method clickable = channelModifierMethod("b", 8);
            if (clickable != null) return clickable.invoke(null, modifier, interaction, indication,
                enabled, label, role, onClick, mask);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return modifier;
    }

    private static Method channelModifierMethod(String name, int parameters) throws ClassNotFoundException {
        for (Method method : Class.forName("cy8").getDeclaredMethods())
            if (method.getName().equals(name) && method.getParameterTypes().length == parameters) {
                method.setAccessible(true);
                return method;
            }
        return null;
    }

    private static void showChannelFilterMenu(String community, String flair) {
        Activity activity = currentActivity.get();
        if (activity == null || activity.isFinishing()) return;
        recordFlairAction(activity, "Opening r/" + community + " filter menu: " + flair);
        activity.runOnUiThread(() -> {
            String cleanCommunity = normalizeCommunity(community);
            String cleanFlair = normalizeFlair(flair);
            String rule = cleanCommunity + "::" + cleanFlair;
            SharedPreferences preferences = prefs(activity);
            Set<String> selected = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
            for (FlairRule item : parseFlairs(preferences.getString(FLAIRS, "")))
                selected.add(item.community + "::" + item.flair);
            boolean blocked = selected.contains(rule);
            new AlertDialog.Builder(activity).setTitle("r/" + community + " · " + flair)
                .setItems(new String[] { blocked ? "Show posts with this flair" : "Hide posts with this flair" },
                    (dialog, which) -> {
                        if (blocked) selected.remove(rule); else selected.add(rule);
                        preferences.edit().putString(FLAIRS, joinLines(selected)).apply();
                        recordFlairAction(activity, "Changed r/" + community + " filter: " + flair);
                        android.widget.FrameLayout header = currentFlairHeader.get();
                        if (header != null && header.isAttachedToWindow())
                            renderSubredditFlairRow(header, cleanCommunity);
                        Toast.makeText(activity, blocked ? "Flair filter removed" : "Flair filter added",
                            Toast.LENGTH_SHORT).show();
                    }).show();
        });
    }

    public static Object wrapChannelClick(Object model, Object original) {
        if (model == null || original == null || !model.getClass().getName().equals("yng0")) return original;
        try {
            String community = normalizeCommunity(string(field(model, "b")));
            String label = string(field(model, "c"));
            if (community.isEmpty() || label.isEmpty()) return original;
            Class<?> function = Class.forName("kotlin.jvm.functions.Function0");
            return Proxy.newProxyInstance(function.getClassLoader(), new Class<?>[] { function }, (proxy, method, args) -> {
                if (!method.getName().equals("invoke")) return null;
                Activity activity = currentActivity.get();
                if (activity == null || activity.isFinishing()) {
                    original.getClass().getMethod("invoke").invoke(original);
                    return null;
                }
                String rule = community + "::" + label;
                SharedPreferences preferences = prefs(activity);
                Set<String> selected = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
                selected.addAll(lines(preferences.getString(FLAIRS, "")));
                boolean blocked = selected.contains(rule);
                new AlertDialog.Builder(activity).setTitle("r/" + community + " · " + label)
                    .setItems(new String[] { "Browse this flair",
                        blocked ? "Show posts with this flair" : "Hide posts with this flair" }, (dialog, which) -> {
                        if (which == 0) {
                            try { original.getClass().getMethod("invoke").invoke(original); }
                            catch (ReflectiveOperationException ignored) { }
                        } else {
                            if (blocked) selected.remove(rule); else selected.add(rule);
                            preferences.edit().putString(FLAIRS, joinLines(selected)).apply();
                            Toast.makeText(activity, blocked ? "Flair filter removed" : "Flair filter added",
                                Toast.LENGTH_SHORT).show();
                        }
                    }).show();
                return null;
            });
        } catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    public static Object dimFilteredChannel(Object model, Object emphasis) {
        if (model == null || !model.getClass().getName().equals("yng0")) return emphasis;
        try {
            String community = normalizeCommunity(string(field(model, "b")));
            String flair = string(field(model, "c"));
            String rule = community + "::" + flair;
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null) return emphasis;
            lastNativeFlairUi = rule + " at " + System.currentTimeMillis();
            if (prefs(context).getBoolean(DEBUG, false))
                appendDecision("FLAIR UI community=" + community + " flair=" + flair
                    + " filtered=" + lines(prefs(context).getString(FLAIRS, "")).contains(rule));
            Set<String> selected = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
            selected.addAll(lines(prefs(context).getString(FLAIRS, "")));
            if (!selected.contains(rule)) return emphasis;
            return Class.forName("com.reddit.screens.channels.composables.Emphasis")
                .getField("Weak").get(null);
        } catch (ReflectiveOperationException | RuntimeException ignored) { return emphasis; }
    }

    public static void rememberFlairSource(Object source) { flairSource = source; }
    public static void rememberSubredditSource(Object source) { subredditSource = source; }

    public static void rememberPostByIdSource(Object source) { postByIdSource = source; }

    public static void rememberLinkRepository(Object repository) { linkRepository = repository; }

    private static void initializePostByIdSource() {
        if (postByIdSource != null || linkRepository == null) return;
        try {
            Method provider = linkRepository.getClass().getDeclaredMethod("E");
            provider.setAccessible(true);
            Object source = provider.invoke(linkRepository);
            if (source != null) postByIdSource = source;
        } catch (ReflectiveOperationException | RuntimeException error) {
            lastPostLookup = "source initialization " + error.getClass().getSimpleName()
                + ": " + error.getMessage();
        }
    }

    private static CompletableFuture<Void> requestPostDetails(String id) {
        if (id == null || id.isEmpty()) return null;
        initializePostByIdSource();
        if (postByIdSource == null && Looper.myLooper() != Looper.getMainLooper()) {
            long deadline = android.os.SystemClock.uptimeMillis() + 3000L;
            while (postByIdSource == null && android.os.SystemClock.uptimeMillis() < deadline) {
                try { Thread.sleep(25L); }
                catch (InterruptedException error) {
                    Thread.currentThread().interrupt(); break;
                }
            }
        }
        if (postByIdSource == null) {
            lastPostLookup = id + " skipped: posts-by-ID source not initialized";
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context != null && prefs(context).getBoolean(DEBUG, false))
                appendDecision("LOOKUP " + id + " skipped: source not initialized");
            return null;
        }
        String fullId = id.startsWith("t3_") ? id : "t3_" + id;
        PostInfo cached = POSTS.get(fullId);
        if (cached != null && !cached.flair.isEmpty()) return null;
        CompletableFuture<Void> previous = POST_LOOKUP_TASKS.get(fullId);
        if (previous != null && previous.isDone()) POST_LOOKUP_TASKS.remove(fullId, previous);
        return POST_LOOKUP_TASKS.computeIfAbsent(fullId, key -> {
            CompletableFuture<Void> result = new CompletableFuture<>();
            POST_LOOKUPS.execute(() -> {
                try {
                    Object source = postByIdSource;
                    Class<?> continuation = Class.forName("fmc");
                    Object emptyContext = Class.forName("kotlin.coroutines.EmptyCoroutineContext")
                        .getField("INSTANCE").get(null);
                    Object completion = Proxy.newProxyInstance(continuation.getClassLoader(),
                        new Class<?>[] { continuation }, (proxy, method, args) -> {
                            if (method.getName().equals("getContext")) return emptyContext;
                            if (method.getName().equals("resumeWith")) {
                                finishPostLookup(key, result);
                            }
                            return null;
                        });
                    boolean linkSource = source.getClass().getName().equals("com.reddit.data.remote.h");
                    Class<?> stateType = Class.forName(linkSource
                        ? "com.reddit.data.remote.RemoteGqlLinkDataSource$getHomeFeedPostsByIds$1"
                        : "com.reddit.data.remote.RemoteGqlHistoryDataSourceImpl$getPostsByIds$1");
                    java.lang.reflect.Constructor<?> stateConstructor = stateType.getDeclaredConstructor(
                        source.getClass(), continuation);
                    stateConstructor.setAccessible(true);
                    Object state = stateConstructor.newInstance(source, completion);
                    Class<?> continuationImpl = Class.forName(
                        "kotlin.coroutines.jvm.internal.ContinuationImpl");
                    Method fetch;
                    Object immediate;
                    if (linkSource) {
                        // The generic posts-by-ID query omits flair data for a subset of home-feed
                        // links (notably posts from joined communities). Use Reddit's dedicated
                        // home-feed hydration query so filtering and the optional badge see the
                        // same complete link model as the feed itself.
                        fetch = source.getClass().getDeclaredMethod("b", ArrayList.class,
                            boolean.class, boolean.class, boolean.class, boolean.class,
                            continuationImpl);
                        fetch.setAccessible(true);
                        immediate = fetch.invoke(source, new ArrayList<>(Collections.singletonList(key)),
                            false, false, false, false, state);
                    } else {
                        fetch = source.getClass().getDeclaredMethod("c", ArrayList.class, continuationImpl);
                        fetch.setAccessible(true);
                        immediate = fetch.invoke(source, new ArrayList<>(Collections.singletonList(key)), state);
                    }
                    if (immediate != null
                        && !immediate.getClass().getName().contains("CoroutineSingletons")) {
                        finishPostLookup(key, result);
                    }
                } catch (ReflectiveOperationException | RuntimeException error) {
                    lastPostLookup = key + " " + error.getClass().getSimpleName() + ": " + error.getMessage();
                    result.complete(null);
                }
            });
            return result;
        });
    }

    private static void finishPostLookup(String fullId, CompletableFuture<Void> result) {
        if (result.isDone()) return;
        PostInfo post = POSTS.get(fullId);
        if (post == null || post.flair.isEmpty()) fetchPublicPostDetails(fullId);
        post = POSTS.get(fullId);
        lastPostLookup = fullId + " completed; flair="
            + (post == null ? "missing" : post.flair);
        result.complete(null);
    }

    /**
     * Reddit's feed and posts-by-ID GraphQL projections sometimes deliberately omit link flair.
     * The post-detail screen uses another projection, so use the public by-id representation as
     * a final fallback for the exact fields needed by filtering and the optional home-feed badge.
     */
    private static void fetchPublicPostDetails(String fullId) {
        HttpURLConnection connection = null;
        try {
            URL url = new URL("https://www.reddit.com/by_id/" + fullId + ".json?raw_json=1");
            connection = (HttpURLConnection) url.openConnection();
            connection.setConnectTimeout(1800);
            connection.setReadTimeout(1800);
            connection.setRequestProperty("User-Agent", "android:app.morphe.patches:v0.2.2");
            connection.setRequestProperty("Accept", "application/json");
            int status = connection.getResponseCode();
            if (status < 200 || status >= 300) {
                lastPostLookup = fullId + " public lookup HTTP " + status;
                return;
            }
            StringBuilder json = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(), StandardCharsets.UTF_8))) {
                char[] buffer = new char[4096];
                for (int count; (count = reader.read(buffer)) >= 0; )
                    json.append(buffer, 0, count);
            }
            org.json.JSONObject data = new org.json.JSONObject(json.toString())
                .getJSONObject("data").getJSONArray("children").getJSONObject(0)
                .getJSONObject("data");
            String id = data.optString("name", fullId);
            String flair = data.optString("link_flair_text", "");
            PostInfo resolved = new PostInfo(data.optString("title", ""), "",
                data.optString("selftext", ""), data.optString("subreddit", ""), flair,
                data.optString("link_flair_background_color", ""),
                data.optString("link_flair_text_color", ""));
            POSTS.put(id, resolved);
            if (id.startsWith("t3_")) POSTS.put(id.substring(3), resolved);
            if (!fullId.equals(id)) POSTS.put(fullId, resolved);
        } catch (Exception error) {
            lastPostLookup = fullId + " public lookup " + error.getClass().getSimpleName()
                + ": " + error.getMessage();
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static void fetchFullFlairs(Context context, String community, java.util.function.Consumer<Boolean> done) {
        Object source = subredditSource != null ? subredditSource : flairSource;
        if (source == null) {
            lastFlairRequestError = "Flair network source not initialized";
            done.accept(false); return;
        }
        new Thread(() -> {
            try {
                Object client = field(source, source == subredditSource ? "j" : "c");
                Object query = Class.forName("kbl").getConstructor(String.class).newInstance(community);
                Class<?> clientType = Class.forName("pon");
                Class<?> continuationType = Class.forName("fmc");
                Object emptyContext = Class.forName("kotlin.coroutines.EmptyCoroutineContext")
                    .getField("INSTANCE").get(null);
                Handler main = new Handler(Looper.getMainLooper());
                Object continuation = Proxy.newProxyInstance(continuationType.getClassLoader(),
                    new Class<?>[] { continuationType }, (proxy, method, args) -> {
                        if (method.getName().equals("getContext")) return emptyContext;
                        if (method.getName().equals("resumeWith")) {
                            boolean success = storeFullFlairs(context, community, args[0]);
                            if (!success) lastFlairRequestError = "GraphQL response did not contain flair templates";
                            main.post(() -> done.accept(success));
                        }
                        return null;
                    });
                Method execute = null;
                for (Method method : clientType.getDeclaredMethods())
                    if (method.getName().equals("e") && Modifier.isStatic(method.getModifiers())
                        && method.getParameterTypes().length == 12) { execute = method; break; }
                if (execute == null) throw new NoSuchMethodException("GraphQL request method");
                Object result = execute.invoke(null, client, query, null, null, null, null, null,
                    null, null, null, continuation, 1022);
                if (result != null && !result.getClass().getName().contains("CoroutineSingletons")) {
                    boolean success = storeFullFlairs(context, community, result);
                    if (!success) lastFlairRequestError = "GraphQL response did not contain flair templates";
                    main.post(() -> done.accept(success));
                }
            } catch (Exception error) {
                lastFlairRequestError = error.getClass().getSimpleName() + ": " + error.getMessage();
                new Handler(Looper.getMainLooper()).post(() -> done.accept(false));
            }
        }, "Reddit-filter-flairs").start();
    }

    private static boolean storeFullFlairs(Context context, String community, Object response) {
        try {
            Object root = field(response, "a");
            Object subreddit = field(root, "a");
            Object templates = field(subreddit, "b");
            Object items = field(templates, "a");
            if (!(items instanceof Iterable<?>)) return false;
            SharedPreferences preferences = prefs(context);
            Set<String> discovered = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
            discovered.addAll(lines(preferences.getString(DISCOVERED_FLAIRS, "")));
            Map<String, String> colors = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
            for (String entry : lines(preferences.getString(FLAIR_COLORS, ""))) {
                int separator = entry.indexOf('\t');
                if (separator > 0) colors.put(entry.substring(0, separator), entry.substring(separator + 1));
            }
            int count = 0;
            for (Object item : (Iterable<?>) items) {
                if (item == null || ++count > 500) break;
                String label = string(field(item, "c")).trim();
                if (!label.isEmpty()) {
                    String key = community + "::" + label;
                    discovered.add(key);
                    String background = string(field(item, "f"));
                    Object textValue = field(item, "d");
                    String textColor = textValue instanceof Enum<?>
                        ? ((Enum<?>) textValue).name() : String.valueOf(textValue);
                    try {
                        android.graphics.Color.parseColor(background);
                        colors.put(key, background + "|" + textColor);
                    } catch (IllegalArgumentException ignored) { }
                }
            }
            TEMPLATE_COUNTS.put(community, count);
            lastFlairRequestError = "none";
            List<String> colorEntries = new ArrayList<>();
            for (Map.Entry<String, String> entry : colors.entrySet())
                colorEntries.add(entry.getKey() + "\t" + entry.getValue());
            preferences.edit().putString(DISCOVERED_FLAIRS, joinLines(discovered))
                .putString(FLAIR_COLORS, joinLines(colorEntries)).apply();
            return true;
        } catch (ReflectiveOperationException | RuntimeException error) { return false; }
    }

    public static void rememberSubreddit(Object subreddit) {
        if (subreddit == null) return;
        try {
            Class<?> type = subreddit.getClass();
            String community = normalizeCommunity(string(type.getMethod("getDisplayName").invoke(subreddit)));
            Object flairs = type.getMethod("getFlairs").invoke(subreddit);
            if (community.isEmpty() || !(flairs instanceof Iterable<?>)) return;
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null) return;
            SharedPreferences preferences = prefs(context);
            Set<String> discovered = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
            discovered.addAll(lines(preferences.getString(DISCOVERED_FLAIRS, "")));
            boolean changed = false;
            int count = 0;
            for (Object flair : (Iterable<?>) flairs) {
                if (flair == null || ++count > 500) break;
                String label = string(flair.getClass().getMethod("getText").invoke(flair)).trim();
                if (!label.isEmpty()) changed |= discovered.add(community + "::" + label);
            }
            if (changed) preferences.edit().putString(DISCOVERED_FLAIRS, joinLines(discovered)).apply();
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    public static void rememberLink(Object link) {
        linkModelCalls++;
        lastLinkModel = link == null ? "null instance" : "received " + link.getClass().getName();
        if (link == null) return;
        try {
            Accessors methods = accessors;
            if (methods == null) { methods = new Accessors(link.getClass()); accessors = methods; }
            PostInfo info = new PostInfo(string(methods.title.invoke(link)), string(methods.body.invoke(link)),
                string(methods.selftext.invoke(link)), normalizeCommunity(string(methods.subreddit.invoke(link))),
                string(methods.flair.invoke(link)), string(methods.flairBackground.invoke(link)),
                string(methods.flairTextColor.invoke(link)));
            for (String id : new String[] { string(methods.id.invoke(link)), string(methods.kindWithId.invoke(link)) }) {
                if (id.isEmpty()) continue;
                String shortId = id.startsWith("t3_") ? id.substring(3) : id;
                String fullId = id.startsWith("t3_") ? id : "t3_" + id;
                PostInfo existing = POSTS.get(fullId);
                if (existing == null) existing = POSTS.get(shortId);
                PostInfo stored = richerPostInfo(existing, info);
                POSTS.put(shortId, stored);
                POSTS.put(fullId, stored);
                linkModelsStored++;
                lastLinkModel = "stored " + id + " " + stored.community + "::" + stored.flair;
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            lastLinkModel = error.getClass().getSimpleName() + ": " + error.getMessage();
        }
    }

    public static boolean hideFeedPost(Object section) {
        rendererCalls++;
        try {
            Field idField = section.getClass().getDeclaredField("a"); idField.setAccessible(true);
            String id = string(idField.get(section));
            PostInfo info = POSTS.get(id);
            if (info == null) info = POSTS.get(id.startsWith("t3_") ? id.substring(3) : "t3_" + id);
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null) return false;
            trackActivities(context);
            SharedPreferences preferences = prefs(context);
            boolean debugEnabled = preferences.getBoolean(DEBUG, false);
            CardText card = readCardText(section, debugEnabled,
                !preferences.getString(FLAIRS, "").isEmpty());
            String candidateCommunity = info != null && !info.community.isEmpty()
                ? info.community : card.community;
            boolean filteredCommunity = false;
            List<FlairRule> configuredFlairRules = parseFlairs(preferences.getString(FLAIRS, ""));
            for (FlairRule selectedRule : configuredFlairRules)
                if (selectedRule.community.equals(candidateCommunity)) {
                    filteredCommunity = true;
                    break;
                }
            if (info == null || info.flair.isEmpty()) {
                boolean needsDetails = preferences.getBoolean(SHOW_HOME_FLAIRS, false);
                if (filteredCommunity) needsDetails = true;
                if (needsDetails) {
                    String fullId = id.startsWith("t3_") ? id : "t3_" + id;
                    for (int attempt = 0; attempt < 2; attempt++) {
                        CompletableFuture<Void> lookup = requestPostDetails(id);
                        boolean timedOut = false;
                        if (lookup != null)
                            try { lookup.get(3000, TimeUnit.MILLISECONDS); }
                            catch (InterruptedException error) {
                                Thread.currentThread().interrupt(); break;
                            } catch (ExecutionException ignored) { break; }
                            catch (TimeoutException ignored) { timedOut = true; }
                        PostInfo fetched = POSTS.get(id);
                        if (fetched == null) fetched = POSTS.get(fullId);
                        if (fetched != null) info = fetched;
                        if (!timedOut || (info != null && !info.flair.isEmpty())) break;
                        POST_LOOKUP_TASKS.remove(fullId, lookup);
                        lastPostLookup = fullId + " timed out; retrying";
                    }
                }
            }
            lastClasses = card.classes.isEmpty() ? "none" : joinValues(card.classes);
            lastTitles = card.titles.isEmpty() ? "none" : joinValues(card.titles);
            lastFlairs = card.flairs.isEmpty() ? "none" : joinValues(card.flairs);
            String reason = null;
            for (Pattern keyword : compileLines(preferences.getString(KEYWORDS, "")))
                if ((info != null && (keyword.matcher(info.title).find() || keyword.matcher(info.body).find()
                    || keyword.matcher(info.selftext).find())) || matchesAny(keyword, card.titles)) {
                    reason = "keyword:" + keyword.pattern(); break;
                }
            String community = info != null && !info.community.isEmpty() ? info.community : card.community;
            android.view.View activeHeader = currentSubredditHeader.get();
            if (community.isEmpty() && activeHeader != null && activeHeader.isAttachedToWindow())
                community = currentSubreddit;
            if (!filteredCommunity)
                for (FlairRule selectedRule : configuredFlairRules)
                    if (selectedRule.community.equals(community)) {
                        filteredCommunity = true;
                        break;
                    }
            if (!community.isEmpty() && !card.flairs.isEmpty()) {
                discoverCardFlairs(preferences, community, card.flairs);
                discoverCardFlairColor(preferences, community, card.flairs);
            }
            List<FlairRule> flairRules = configuredFlairRules;
            if (reason == null) for (FlairRule rule : flairRules) {
                if (!rule.community.equals(community)) continue;
                if ((info != null && rule.flair.equalsIgnoreCase(normalizeFlair(info.flair)))
                    || containsIgnoreCase(card.flairs, rule.flair)) {
                    reason = "flair:" + rule.community + "::" + rule.flair; break;
                }
            }
            if (reason == null && info == null && card.flairs.isEmpty())
                for (FlairRule rule : flairRules) {
                    if (rule.community.equals(community)
                        && containsIgnoreCase(card.headerValues, rule.flair)) {
                        reason = "flair-header:" + rule.community + "::" + rule.flair;
                        break;
                    }
                }
            boolean unresolvedFlair = (info == null || info.flair.isEmpty()) && card.flairs.isEmpty();
            if (reason == null && unresolvedFlair && postByIdSource == null
                && preferences.getBoolean(SHOW_HOME_FLAIRS, false)) {
                // Home V3 first emits speculative cards which omit flair metadata. Do
                // not render that incomplete copy: Reddit follows it with the complete
                // feed model, allowing both the badge and any filter to be applied.
                reason = "flair-loading:" + candidateCommunity;
            }
            if (reason == null && filteredCommunity && unresolvedFlair) {
                // Reddit omits flair data from some joined-community home-feed cards.
                // If the detail source is not ready (or cannot resolve the post), allowing
                // an unknown flair would leak posts through an active community filter.
                reason = "flair-unknown:" + candidateCommunity;
            }
            if (reason == null && community.isEmpty() && !card.flairs.isEmpty()) {
                // Some feed cards omit their subreddit identifier entirely. Only use a
                // label without community scope when selected rules make it unambiguous.
                Set<String> matchingCommunities = new HashSet<>();
                FlairRule candidate = null;
                for (FlairRule rule : flairRules) if (containsIgnoreCase(card.flairs, rule.flair)) {
                    matchingCommunities.add(rule.community);
                    candidate = rule;
                }
                if (matchingCommunities.size() == 1 && candidate != null)
                    reason = "flair-label-only:" + candidate.community + "::" + candidate.flair;
            }
            if (reason != null) matchedCards++;
            if (debugEnabled) recordDecision(id, card, info, community, reason);
            return reason != null;
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return false;
    }

    private static void recordDecision(String id, CardText card, PostInfo info, String community, String reason) {
        String line = (reason == null ? "SHOW" : "HIDE " + reason) + " id=" + id
            + " community=" + community + " title=" + joinValues(card.titles)
            + " flairs=" + joinValues(card.flairs) + " model="
            + (info == null ? "missing" : info.community + "::" + info.flair)
            + " other=" + joinValues(card.other)
            + " headerClass=" + card.headerClass + " headerValues=" + joinValues(card.headerValues)
            + " headerValueCount=" + card.headerValues.size()
            + " header=" + card.header
            + " elements=" + joinValues(card.classes);
        appendDecision(line);
    }

    private static PostInfo richerPostInfo(PostInfo existing, PostInfo incoming) {
        if (existing == null) return incoming;
        String flair = incoming.flair.isEmpty() ? existing.flair : incoming.flair;
        String background = incoming.backgroundColor.isEmpty()
            ? existing.backgroundColor : incoming.backgroundColor;
        String textColor = incoming.textColor.isEmpty() ? existing.textColor : incoming.textColor;
        String community = incoming.community.isEmpty() ? existing.community : incoming.community;
        String title = incoming.title.isEmpty() ? existing.title : incoming.title;
        String body = incoming.body.isEmpty() ? existing.body : incoming.body;
        String selftext = incoming.selftext.isEmpty() ? existing.selftext : incoming.selftext;
        return new PostInfo(title, body, selftext, community, flair, background, textColor);
    }

    public static void rememberFeedLink(Object link) {
        feedLinkMapperCalls++;
        rememberLink(link);
        try {
            if (link == null) { lastFeedLinkMapper = "null Link"; return; }
            Accessors methods = accessors;
            if (methods == null) { methods = new Accessors(link.getClass()); accessors = methods; }
            String id = string(methods.kindWithId.invoke(link));
            String community = normalizeCommunity(string(methods.subreddit.invoke(link)));
            String flair = string(methods.flair.invoke(link));
            lastFeedLinkMapper = id + " " + community + "::" + flair;
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null || !prefs(context).getBoolean(DEBUG, false)) return;
            for (FlairRule rule : parseFlairs(prefs(context).getString(FLAIRS, "")))
                if (rule.community.equals(community)) {
                    appendDecision("LINKMAP id=" + id + " community=" + community + " flair=" + flair);
                    break;
                }
        } catch (ReflectiveOperationException | RuntimeException error) {
            lastFeedLinkMapper = error.getClass().getSimpleName() + ": " + error.getMessage();
        }
    }

    public static void rememberClassicPost(Object post) {
        classicPostCalls++;
        if (post == null) { lastClassicPost = "null post"; return; }
        try {
            String id = string(field(post, "e"));
            String community = normalizeCommunity(string(field(post, "k")));
            Object flairElement = field(post, "s");
            Set<String> values = new LinkedHashSet<>();
            collectStrings(flairElement, 0, Collections.newSetFromMap(new IdentityHashMap<>()), values);
            lastClassicPost = id + " " + community + " flairs=" + joinValues(values);
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null || id.isEmpty() || community.isEmpty()) return;
            SharedPreferences preferences = prefs(context);
            for (FlairRule rule : parseFlairs(preferences.getString(FLAIRS, "")))
                if (rule.community.equals(community) && containsIgnoreCase(values, rule.flair)) {
                    PostInfo info = new PostInfo(string(field(post, "p")), "", "", community, rule.flair);
                    POSTS.put(id, info);
                    if (id.startsWith("t3_")) POSTS.put(id.substring(3), info);
                    else POSTS.put("t3_" + id, info);
                    classicPostFlairMatches++;
                    break;
                }
            if (preferences.getBoolean(DEBUG, false))
                for (FlairRule rule : parseFlairs(preferences.getString(FLAIRS, "")))
                    if (rule.community.equals(community)) {
                        appendDecision("CLASSIC id=" + id + " community=" + community
                            + " flairs=" + joinValues(values));
                        break;
                    }
        } catch (ReflectiveOperationException | RuntimeException error) {
            lastClassicPost = error.getClass().getSimpleName() + ": " + error.getMessage();
        }
    }

    public static boolean hideClassicPost(Object post) {
        classicPostCalls++;
        if (post == null) return false;
        try {
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null) return false;
            String id = string(field(post, "e"));
            String community = normalizeCommunity(string(field(post, "k")));
            Set<String> renderedFlairs = new LinkedHashSet<>();
            collectStrings(field(post, "s"), 0,
                Collections.newSetFromMap(new IdentityHashMap<>()), renderedFlairs);
            List<FlairRule> rules = parseFlairs(prefs(context).getString(FLAIRS, ""));
            boolean filteredCommunity = false;
            for (FlairRule rule : rules) if (rule.community.equals(community)) {
                filteredCommunity = true; break;
            }
            PostInfo info = POSTS.get(id);
            if (info == null) info = POSTS.get(id.startsWith("t3_") ? id.substring(3) : "t3_" + id);
            if (filteredCommunity && (info == null || info.flair.isEmpty()) && renderedFlairs.isEmpty()) {
                CompletableFuture<Void> lookup = requestPostDetails(id);
                if (lookup != null) try { lookup.get(3000, TimeUnit.MILLISECONDS); }
                catch (InterruptedException error) { Thread.currentThread().interrupt(); }
                catch (ExecutionException | TimeoutException ignored) { }
                info = POSTS.get(id);
                if (info == null) info = POSTS.get(id.startsWith("t3_") ? id.substring(3) : "t3_" + id);
            }
            String reason = null;
            for (FlairRule rule : rules) {
                if (!rule.community.equals(community)) continue;
                if ((info != null && rule.flair.equalsIgnoreCase(normalizeFlair(info.flair)))
                    || containsIgnoreCase(renderedFlairs, rule.flair)) {
                    reason = "selected flair"; break;
                }
            }
            if (reason == null && filteredCommunity
                && (info == null || info.flair.isEmpty()) && renderedFlairs.isEmpty())
                reason = "unresolved";
            lastClassicPost = id + " " + community + " flairs=" + joinValues(renderedFlairs)
                + " model=" + (info == null ? "missing" : info.flair)
                + " decision=" + (reason == null ? "show" : "hide " + reason);
            if (prefs(context).getBoolean(DEBUG, false))
                appendDecision("CLASSIC " + (reason == null ? "SHOW" : "HIDE") + " id=" + id
                    + " community=" + community + " flairs=" + joinValues(renderedFlairs)
                    + " model=" + (info == null ? "missing" : info.flair)
                    + " reason=" + (reason == null ? "not selected" : reason));
            if (reason != null) classicPostFlairMatches++;
            return reason != null;
        } catch (ReflectiveOperationException | RuntimeException error) {
            lastClassicPost = error.getClass().getSimpleName() + ": " + error.getMessage();
            return false;
        }
    }

    /**
     * Final filter for Reddit's common feed-element list. Unlike the individual model mappers,
     * this also receives elements restored from Reddit's joined-community/cache pipeline.
     */
    public static List<?> filterFeedElements(List<?> original) {
        if (original == null || original.isEmpty()) return original;
        Context context = applicationContext != null ? applicationContext : appContext();
        if (context == null) return original;
        List<FlairRule> rules = parseFlairs(prefs(context).getString(FLAIRS, ""));
        if (rules.isEmpty()) return original;
        ArrayList<Object> kept = new ArrayList<>(original.size());
        for (Object element : original) {
            if (element == null) { kept.add(null); continue; }
            String id = "";
            try {
                Method getter = element.getClass().getMethod("getLinkId");
                id = string(getter.invoke(element));
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                try { id = string(inheritedField(element, "a")); }
                catch (ReflectiveOperationException | RuntimeException ignoredAgain) { }
            }
            if (id.isEmpty()) { kept.add(element); continue; }
            PostInfo info = POSTS.get(id);
            if (info == null) info = POSTS.get(id.startsWith("t3_") ? id.substring(3) : "t3_" + id);
            String community = info == null ? "" : normalizeCommunity(info.community);
            if (community.isEmpty()) {
                Set<String> values = new LinkedHashSet<>();
                collectStrings(element, 0, Collections.newSetFromMap(new IdentityHashMap<>()), values);
                for (String value : values) {
                    String candidate = normalizeCommunity(value);
                    for (FlairRule rule : rules) if (rule.community.equals(candidate)) {
                        community = candidate; break;
                    }
                    if (!community.isEmpty()) break;
                }
            }
            boolean filteredCommunity = false;
            for (FlairRule rule : rules) if (rule.community.equals(community)) {
                filteredCommunity = true; break;
            }
            if (filteredCommunity && (info == null || info.flair.isEmpty())) {
                CompletableFuture<Void> lookup = requestPostDetails(id);
                if (lookup != null) try { lookup.get(3000, TimeUnit.MILLISECONDS); }
                catch (InterruptedException error) { Thread.currentThread().interrupt(); }
                catch (ExecutionException | TimeoutException ignored) { }
                info = POSTS.get(id);
                if (info == null) info = POSTS.get(id.startsWith("t3_") ? id.substring(3) : "t3_" + id);
                if (info != null && community.isEmpty()) community = normalizeCommunity(info.community);
            }
            String flair = info == null ? "" : normalizeFlair(info.flair);
            boolean hide = false;
            for (FlairRule rule : rules)
                if (rule.community.equals(community) && rule.flair.equalsIgnoreCase(flair)) {
                    hide = true; break;
                }
            if (prefs(context).getBoolean(DEBUG, false) && filteredCommunity)
                appendDecision("ELEMENT " + (hide ? "HIDE" : "SHOW") + " id=" + id
                    + " community=" + community + " flair=" + flair
                    + " class=" + element.getClass().getName());
            if (!hide) {
                if (info != null && !info.flair.isEmpty()
                    && prefs(context).getBoolean(SHOW_HOME_FLAIRS, false))
                    addFlairToPreviewElement(element, id, info);
                kept.add(element);
            } else matchedCards++;
        }
        return kept.size() == original.size() ? original : kept;
    }

    /** Adds the missing PostFlairsElement to Reddit's cached PostPreviewFeedElement (w230). */
    private static void addFlairToPreviewElement(Object element, String id, PostInfo post) {
        if (element == null || !"w230".equals(element.getClass().getName())) return;
        try {
            Field existingField = element.getClass().getDeclaredField("n");
            existingField.setAccessible(true);
            if (existingField.get(element) != null) return;
            String color = post.backgroundColor.isEmpty() ? "#3A3D40" : post.backgroundColor;
            String textColor = post.textColor.isEmpty() ? "LIGHT" : post.textColor;
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context != null) {
                String prefix = post.community + "::" + post.flair + "\t";
                for (String entry : lines(prefs(context).getString(FLAIR_COLORS, "")))
                    if (entry.regionMatches(true, 0, prefix, 0, prefix.length())) {
                        String[] colors = entry.substring(prefix.length()).split("\\|", 2);
                        if (post.backgroundColor.isEmpty() && colors.length > 0 && !colors[0].isEmpty())
                            color = colors[0];
                        if (post.textColor.isEmpty() && colors.length > 1 && !colors[1].isEmpty())
                            textColor = colors[1];
                        break;
                    }
            }
            Class<?> badgeType = Class.forName("je20");
            Object badge = badgeType.getConstructor(String.class, String.class, String.class,
                String.class, String.class, String.class, String.class, String.class,
                String.class).newInstance(post.flair, null, id, post.community, "",
                    textColor, color, post.flair, post.flair);
            Method listFactory = Class.forName("fs80").getDeclaredMethod("R", Object[].class);
            listFactory.setAccessible(true);
            Object badges = listFactory.invoke(null, (Object) new Object[] { badge });
            Class<?> flairType = Class.forName("lg20");
            java.lang.reflect.Constructor<?> constructor = flairType.getDeclaredConstructor(
                String.class, String.class, boolean.class, Class.forName("ni20"), Class.forName("v4p"));
            constructor.setAccessible(true);
            Object flair = constructor.newInstance(id, string(inheritedField(element, "b")), false,
                field(element, "h"), badges);
            existingField.set(element, flair);

            ArrayList<Object> children = new ArrayList<>();
            for (String name : new String[] { "i", "j", "k", "l", "m", "n", "o", "p",
                    "q", "r", "s", "t", "u" }) {
                Object child = field(element, name);
                if (child != null) children.add(child);
            }
            Method compact = Class.forName("fs80").getDeclaredMethod("X", Iterable.class);
            compact.setAccessible(true);
            Field content = element.getClass().getDeclaredField("B");
            content.setAccessible(true);
            content.set(element, compact.invoke(null, children));
            homeFlairsDisplayed++;
            lastHomeFlairDisplay = id + " preview displayed: " + post.flair;
            if (context != null && prefs(context).getBoolean(DEBUG, false))
                appendDecision("ELEMENT FLAIR id=" + id + " community=" + post.community
                    + " flair=" + post.flair);
        } catch (ReflectiveOperationException | RuntimeException error) {
            lastHomeFlairDisplay = id + " preview failed " + error.getClass().getSimpleName()
                + ": " + error.getMessage();
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context != null && prefs(context).getBoolean(DEBUG, false))
                appendDecision("ELEMENT FLAIR ERROR id=" + id + " "
                    + error.getClass().getSimpleName() + ": " + error.getMessage());
        }
    }

    private static void recordUiEvent(Context context, String event) {
        try {
            Context source = context != null ? context : applicationContext != null ? applicationContext : appContext();
            if (source == null || !prefs(source).getBoolean(DEBUG, false)) return;
            appendDecision("UI " + System.currentTimeMillis() + " " + event);
        } catch (RuntimeException ignored) { }
    }

    private static void appendDecision(String line) {
        synchronized (DECISIONS) {
            if (DECISIONS.size() >= 2000) DECISIONS.removeFirst();
            DECISIONS.addLast(line);
        }
    }

    public static Object filterFeedSection(Object section) {
        return hideFeedPost(section) ? null : section;
    }

    public static Object showHomePostFlair(Object section) {
        if (section == null) return null;
        homeFlairDisplayCalls++;
        try {
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null || !prefs(context).getBoolean(SHOW_HOME_FLAIRS, false)) {
                lastHomeFlairDisplay = context == null ? "missing context" : "setting disabled";
                return section;
            }
            String id = string(field(section, "a"));
            PostInfo post = POSTS.get(id);
            if (post == null) post = POSTS.get(id.startsWith("t3_") ? id.substring(3) : "t3_" + id);
            if (post == null || post.flair.isEmpty()) {
                CompletableFuture<Void> lookup = requestPostDetails(id);
                if (lookup != null) try { lookup.get(3000, TimeUnit.MILLISECONDS); }
                catch (InterruptedException error) { Thread.currentThread().interrupt(); }
                catch (ExecutionException | TimeoutException ignored) { }
                post = POSTS.get(id);
                if (post == null) post = POSTS.get(id.startsWith("t3_") ? id.substring(3) : "t3_" + id);
            }
            if (post == null || post.flair.isEmpty()) {
                lastHomeFlairDisplay = id + " unresolved";
                return section;
            }
            for (FlairRule rule : parseFlairs(prefs(context).getString(FLAIRS, "")))
                if (rule.community.equals(post.community)
                    && rule.flair.equalsIgnoreCase(normalizeFlair(post.flair))) {
                    matchedCards++;
                    if (prefs(context).getBoolean(DEBUG, false))
                        appendDecision("HIDE display-flair:" + rule.community + "::" + rule.flair
                            + " id=" + id);
                    return null;
                }
            Object children = field(section, "b");
            if (!(children instanceof Iterable<?>)) {
                lastHomeFlairDisplay = id + " children are not iterable";
                return section;
            }
            for (Object child : (Iterable<?>) children)
                if (child != null && child.getClass().getName().equals("mg20")) {
                    lastHomeFlairDisplay = id + " native flair already present";
                    return section;
                }
            String color = post.backgroundColor.isEmpty() ? "#3A3D40" : post.backgroundColor;
            String textColor = post.textColor.isEmpty() ? "LIGHT" : post.textColor;
            String prefix = post.community + "::" + post.flair + "\t";
            for (String entry : lines(prefs(context).getString(FLAIR_COLORS, "")))
                if (entry.regionMatches(true, 0, prefix, 0, prefix.length())) {
                    String[] colors = entry.substring(prefix.length()).split("\\|", 2);
                    if (post.backgroundColor.isEmpty() && colors.length > 0 && !colors[0].isEmpty())
                        color = colors[0];
                    if (post.textColor.isEmpty() && colors.length > 1 && !colors[1].isEmpty())
                        textColor = colors[1];
                    break;
                }
            Class<?> badgeType = Class.forName("je20");
            Object badge = badgeType.getConstructor(String.class, String.class, String.class,
                String.class, String.class, String.class, String.class, String.class,
                String.class).newInstance(post.flair, null, id, post.community, "",
                    textColor, color, post.flair, post.flair);
            Method listFactory = Class.forName("fs80").getDeclaredMethod("R", Object[].class);
            listFactory.setAccessible(true);
            Object flairList = listFactory.invoke(null, (Object) new Object[] { badge });
            Class<?> flairElementType = Class.forName("lg20");
            java.lang.reflect.Constructor<?> flairElementConstructor = flairElementType.getDeclaredConstructor(
                String.class, String.class, boolean.class, Class.forName("ni20"), Class.forName("v4p"));
            flairElementConstructor.setAccessible(true);
            Object flairElement = flairElementConstructor.newInstance(id, string(field(section, "c")),
                false, field(section, "d"), flairList);
            java.lang.reflect.Constructor<?> wrapper = Class.forName("mg20")
                .getDeclaredConstructor(flairElementType);
            wrapper.setAccessible(true);
            Object row = wrapper.newInstance(flairElement);
            List<Object> reordered = new ArrayList<>();
            int titleIndex = -1;
            for (Object child : (Iterable<?>) children) {
                reordered.add(child);
                if (child != null && child.getClass().getName().equals("usi"))
                    titleIndex = reordered.size();
            }
            reordered.add(titleIndex >= 0 ? titleIndex : Math.min(2, reordered.size()), row);
            Object updated = listFactory.invoke(null, (Object) reordered.toArray());
            Field content = section.getClass().getDeclaredField("b");
            content.setAccessible(true);
            content.set(section, updated);
            homeFlairsDisplayed++;
            lastHomeFlairDisplay = id + " displayed: " + post.flair;
            lastPostLookup = id + " native flair displayed: " + post.flair;
        } catch (ReflectiveOperationException | RuntimeException error) {
            lastHomeFlairDisplay = "failed " + error.getClass().getSimpleName() + ": " + error.getMessage();
            lastPostLookup = "display " + error.getClass().getSimpleName() + ": " + error.getMessage();
        }
        return section;
    }

    public static void traceFeedPostCell(Object cell) {
        if (cell == null || FEED_CELL_TRACE_RECORDED.get()) return;
        try {
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null || !prefs(context).getBoolean(DEBUG, false)) return;
            Set<String> values = new LinkedHashSet<>();
            collectStrings(cell, 0, Collections.newSetFromMap(new IdentityHashMap<>()), values);
            if (!containsIgnoreCase(values, "MorpheApp")
                || !FEED_CELL_TRACE_RECORDED.compareAndSet(false, true)) return;
            StringBuilder trace = new StringBuilder("CELL TRACE id=")
                .append(string(inheritedField(cell, "a")));
            StackTraceElement[] frames = Thread.currentThread().getStackTrace();
            for (int i = 2; i < frames.length && i < 26; i++)
                trace.append("\n  at ").append(frames[i]);
            appendDecision(trace.toString());
        } catch (ReflectiveOperationException | RuntimeException error) {
            appendDecision("CELL TRACE ERROR " + error.getClass().getSimpleName()
                + ": " + error.getMessage());
        }
    }

    public static void inspectHomePostModel(Object model) {
        if (model == null || HOME_MODEL_LOGS.get() >= 8) return;
        try {
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null || !prefs(context).getBoolean(DEBUG, false)) return;
            Set<String> values = new LinkedHashSet<>();
            collectStrings(model, 0, Collections.newSetFromMap(new IdentityHashMap<>()), values);
            boolean relevant = false;
            for (FlairRule rule : parseFlairs(prefs(context).getString(FLAIRS, "")))
                if (containsIgnoreCase(values, rule.community)
                    || containsIgnoreCase(values, "r/" + rule.community)) {
                    relevant = true; break;
                }
            if (!relevant) return;
            if (HOME_MODEL_LOGS.incrementAndGet() > 8) return;
            String samples = String.join(" | ", values);
            if (samples.length() > 6000) samples = samples.substring(0, 6000) + " …";
            appendDecision("HOME MODEL class=" + model.getClass().getName()
                + " values=" + values.size() + " samples=" + samples);
        } catch (RuntimeException error) {
            appendDecision("HOME MODEL ERROR " + error.getClass().getSimpleName()
                + ": " + error.getMessage());
        }
    }

    public static boolean hideHomePostModel(Object model) {
        if (model == null) return false;
        try {
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null) return false;
            List<FlairRule> rules = parseFlairs(prefs(context).getString(FLAIRS, ""));
            if (rules.isEmpty()) return false;
            Set<String> values = new LinkedHashSet<>();
            collectStrings(model, 0, Collections.newSetFromMap(new IdentityHashMap<>()), values);
            String id = "";
            String community = "";
            for (String value : values) {
                if (id.isEmpty() && value.startsWith("t3_")) id = value;
                String normalized = normalizeCommunity(value);
                for (FlairRule rule : rules) if (rule.community.equals(normalized)) {
                    community = rule.community; break;
                }
                if (!community.isEmpty() && !id.isEmpty()) break;
            }
            if (id.isEmpty() || community.isEmpty()) return false;
            PostInfo post = POSTS.get(id);
            if (post == null || post.flair.isEmpty()) {
                CompletableFuture<Void> lookup = requestPostDetails(id);
                if (lookup != null) try { lookup.get(3000, TimeUnit.MILLISECONDS); }
                catch (InterruptedException error) { Thread.currentThread().interrupt(); }
                catch (ExecutionException | TimeoutException ignored) { }
                post = POSTS.get(id);
            }
            String flair = post == null ? "" : normalizeFlair(post.flair);
            boolean hide = flair.isEmpty();
            String reason = flair.isEmpty() ? "unresolved" : "not selected";
            if (!flair.isEmpty()) for (FlairRule rule : rules)
                if (rule.community.equals(community) && rule.flair.equalsIgnoreCase(flair)) {
                    hide = true; reason = "selected flair"; break;
                }
            if (prefs(context).getBoolean(DEBUG, false))
                appendDecision("HOMEV3 " + (hide ? "HIDE" : "SHOW") + " id=" + id
                    + " community=" + community + " flair=" + flair + " reason=" + reason
                    + " values=" + joinValues(values));
            return hide;
        } catch (RuntimeException error) {
            return false;
        }
    }

    public static void inspectFeedSource(Object source) {
        feedSourceCalls++;
        lastFeedSource = source == null ? "null source" : "received " + source.getClass().getName();
        try {
            Context context = applicationContext != null ? applicationContext : appContext();
            if (context == null) { lastFeedSource = "no context"; return; }
            if (source == null) return;
            if (!prefs(context).getBoolean(DEBUG, false)) { lastFeedSource = "recording disabled"; return; }
            String id = string(inheritedField(source, "a"));
            Set<String> values = new java.util.LinkedHashSet<>();
            collectStrings(source, 0, Collections.newSetFromMap(new IdentityHashMap<>()), values);
            StringBuilder matches = new StringBuilder();
            for (FlairRule rule : parseFlairs(prefs(context).getString(FLAIRS, "")))
                if (containsIgnoreCase(values, rule.flair)) {
                    if (matches.length() > 0) matches.append(" | ");
                    matches.append(rule.community).append("::").append(rule.flair);
                }
            String samples = joinValues(values);
            for (FlairRule rule : parseFlairs(prefs(context).getString(FLAIRS, "")))
                if (containsIgnoreCase(values, rule.community)
                    || containsIgnoreCase(values, "r/" + rule.community)) {
                    samples = String.join(" | ", values);
                    if (samples.length() > 12000) samples = samples.substring(0, 12000) + " …";
                    break;
                }
            appendDecision("SOURCE id=" + id + " class="
                + source.getClass().getName() + " values=" + values.size()
                + " flairMatches=" + matches + " samples=" + samples);
            if (id.startsWith("t3_") && containsIgnoreCase(values, "MorpheApp")
                && FEED_SOURCE_TRACE_RECORDED.compareAndSet(false, true)) {
                StringBuilder trace = new StringBuilder("SOURCE TRACE id=").append(id);
                StackTraceElement[] frames = Thread.currentThread().getStackTrace();
                for (int i = 2; i < frames.length && i < 24; i++)
                    trace.append("\n  at ").append(frames[i]);
                appendDecision(trace.toString());
            }
            lastFeedSource = "recorded " + id;
        } catch (ReflectiveOperationException | RuntimeException error) {
            lastFeedSource = error.getClass().getSimpleName() + ": " + error.getMessage();
        }
    }

    private static CardText readCardText(Object section, boolean inspectOther, boolean inspectHeader) {
        CardText result = new CardText();
        try {
            Field content = section.getClass().getDeclaredField("b"); content.setAccessible(true);
            Object sections = content.get(section);
            if (!(sections instanceof Iterable<?>)) return result;
            for (Object child : (Iterable<?>) sections) {
                if (child == null) continue;
                String name = child.getClass().getName();
                result.classes.add(name);
                try {
                if (name.equals("com.reddit.feeds.impl.ui.composables.a")) {
                    Object header = field(child, "a");
                    result.headerClass = header == null ? "none" : header.getClass().getName();
                    if (inspectHeader || inspectOther) collectStrings(header, 0,
                        Collections.newSetFromMap(new IdentityHashMap<>()), result.headerValues);
                    result.community = normalizeCommunity(string(field(header, "t")));
                    if (result.community.isEmpty()) {
                        String details = string(field(header, "m"));
                        if (details.regionMatches(true, 0, "r/", 0, 2))
                            result.community = normalizeCommunity(details);
                    }
                    result.header = "subredditId:" + string(field(header, "s"))
                        + ", subredditIdentifier:" + string(field(header, "t"))
                        + ", details:" + string(field(header, "m"));
                } else if (name.equals("aj30") || name.equals("bwi0")) {
                    Field title = child.getClass().getDeclaredField("b"); title.setAccessible(true);
                    Object value = title.get(child); if (value instanceof String) result.titles.add((String) value);
                } else if (name.equals("usi")) {
                    Field wrapped = child.getClass().getDeclaredField("a"); wrapped.setAccessible(true);
                    Object titleElement = wrapped.get(child);
                    Field title = titleElement.getClass().getDeclaredField("i"); title.setAccessible(true);
                    Object value = title.get(titleElement); if (value instanceof String) result.titles.add((String) value);
                } else if (name.equals("mg20")) {
                    Field element = child.getClass().getDeclaredField("a"); element.setAccessible(true);
                    Object flairElement = element.get(child);
                    Field flairs = flairElement.getClass().getDeclaredField("i"); flairs.setAccessible(true);
                    collectStrings(flairs.get(flairElement), 0,
                        Collections.newSetFromMap(new IdentityHashMap<>()), result.flairs);
                } else if (inspectOther && (name.equals("s8k") || name.equals("fsi")
                    || name.equals("kf40") || name.equals("m1p"))) {
                    collectStrings(child, 0, Collections.newSetFromMap(new IdentityHashMap<>()), result.other);
                }
                } catch (ReflectiveOperationException | RuntimeException ignored) { }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return result;
    }

    private static Object field(Object value, String name) throws ReflectiveOperationException {
        if (value == null) return null;
        Field target = value.getClass().getDeclaredField(name); target.setAccessible(true);
        return target.get(value);
    }

    private static Object inheritedField(Object value, String name) throws ReflectiveOperationException {
        for (Class<?> type = value.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field target = type.getDeclaredField(name);
                target.setAccessible(true);
                return target.get(value);
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }

    private static String joinValues(Collection<String> values) {
        StringBuilder result = new StringBuilder(); int count = 0;
        for (String value : values) {
            if (count++ == 8) { result.append(" …"); break; }
            if (result.length() > 0) result.append(" | "); result.append(value);
        }
        return result.toString();
    }

    private static boolean matchesAny(Pattern pattern, Set<String> values) {
        for (String value : values) if (pattern.matcher(value).find()) return true;
        return false;
    }

    private static boolean containsIgnoreCase(Set<String> values, String wanted) {
        for (String value : values) if (normalizeFlair(value).equalsIgnoreCase(normalizeFlair(wanted))) return true;
        return false;
    }

    private static void discoverCardFlairs(SharedPreferences preferences, String community, Set<String> values) {
        Set<String> discovered = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        discovered.addAll(lines(preferences.getString(DISCOVERED_FLAIRS, "")));
        boolean changed = false;
        for (String value : values) {
            String label = value.trim();
            if (label.isEmpty() || label.equalsIgnoreCase("LIGHT") || label.equalsIgnoreCase("DARK")
                || label.equals("subredditId") || label.equals("subredditName")
                || label.startsWith("#") || label.contains("&#")
                || label.matches("(?i)[0-9a-f]{8}-[0-9a-f-]{27,}")) continue;
            changed |= discovered.add(community + "::" + label);
        }
        if (changed) preferences.edit().putString(DISCOVERED_FLAIRS, joinLines(discovered)).apply();
    }

    private static void discoverCardFlairColor(SharedPreferences preferences, String community, Set<String> values) {
        String color = "", label = "", textColor = "LIGHT";
        for (String value : values) {
            String candidate = normalizeFlair(value);
            if (candidate.matches("(?i)#[0-9a-f]{6}([0-9a-f]{2})?")) color = candidate;
            else if (candidate.equalsIgnoreCase("DARK")) textColor = "DARK";
            else if (!candidate.isEmpty() && !candidate.equalsIgnoreCase("LIGHT")
                && !candidate.equals("subredditId") && !candidate.equals("subredditName")
                && !candidate.matches("(?i)[0-9a-f]{8}-[0-9a-f-]{27,}")) label = candidate;
        }
        if (color.isEmpty() || label.isEmpty()) return;
        String key = community + "::" + label;
        List<String> stored = lines(preferences.getString(FLAIR_COLORS, ""));
        String prefix = key + "\t";
        for (String entry : stored) if (entry.regionMatches(true, 0, prefix, 0, prefix.length())) return;
        stored.add(prefix + color + "|" + textColor);
        preferences.edit().putString(FLAIR_COLORS, joinLines(stored)).apply();
    }

    private static void collectStrings(Object value, int depth, Set<Object> seen, Set<String> output) {
        if (value == null || depth > 7 || seen.contains(value)) return;
        if (value instanceof String) { output.add((String) value); return; }
        seen.add(value);
        if (value instanceof Iterable<?>) {
            for (Object child : (Iterable<?>) value) collectStrings(child, depth + 1, seen, output);
            return;
        }
        Class<?> type = value.getClass();
        String name = type.getName();
        if (name.startsWith("java.") || name.startsWith("android.") || name.startsWith("kotlin.")) return;
        try {
            for (Class<?> owner = type; owner != null && owner != Object.class; owner = owner.getSuperclass())
                for (Field field : owner.getDeclaredFields()) {
                    if (java.lang.reflect.Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                    field.setAccessible(true);
                    collectStrings(field.get(value), depth + 1, seen, output);
                }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    public static boolean filterAsBlankAd(Object link, boolean original) {
        if (original || link == null) return original;
        Context context = applicationContext;
        if (context == null) context = appContext();
        if (context == null) return false;
        SharedPreferences preferences = prefs(context);
        List<Pattern> keywords = compileLines(preferences.getString(KEYWORDS, ""));
        List<FlairRule> flairs = parseFlairs(preferences.getString(FLAIRS, ""));
        Set<String> discovered = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        discovered.addAll(lines(preferences.getString(DISCOVERED_FLAIRS, "")));
        if (rememberFlair(link, discovered))
            preferences.edit().putString(DISCOVERED_FLAIRS, joinLines(discovered)).apply();
        return matches(link, keywords, flairs);
    }

    public static List<?> filterListing(List<?> original) {
        if (original == null || original.isEmpty()) return original;
        listingFilterCalls++;
        listingItemsSeen += original.size();
        Context context = applicationContext;
        if (context == null) context = appContext();
        if (context == null) return original;
        SharedPreferences preferences = prefs(context);
        List<Pattern> keywords = compileLines(preferences.getString(KEYWORDS, ""));
        List<FlairRule> flairs = parseFlairs(preferences.getString(FLAIRS, ""));
        ArrayList<Object> filtered = new ArrayList<>(original.size());
        boolean discoveredChanged = false;
        Set<String> discovered = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        discovered.addAll(lines(preferences.getString(DISCOVERED_FLAIRS, "")));
        for (Object item : original) {
            Object link = findLink(item, 0, Collections.newSetFromMap(new IdentityHashMap<>()));
            if (link != null) discoveredChanged |= rememberFlair(link, discovered);
            if (link == null || !matches(link, keywords, flairs)) filtered.add(item);
            else listingItemsRemoved++;
        }
        lastListingFilter = "items=" + original.size() + " kept=" + filtered.size();
        if (discoveredChanged)
            preferences.edit().putString(DISCOVERED_FLAIRS, joinLines(discovered)).apply();
        return filtered;
    }

    public static void addSettings(Context context, PreferenceScreen screen) {
        if (context == null || screen == null || screen.findPreference(KEYWORDS) != null) return;
        applicationContext = context.getApplicationContext();
        trackActivities(context);
        if (context instanceof Activity) currentActivity = new WeakReference<>((Activity) context);
        PreferenceCategory category = new PreferenceCategory(context);
        category.setTitle("Filters");
        category.setOrder(-1000);
        screen.addPreference(category);
        category.addPreference(new EntryListPreference(context, KEYWORDS, "Keyword filters",
            "Add, edit, or remove case-insensitive regular expressions.", true));
        category.addPreference(new FlairListPreference(context));
        CheckBoxPreference debug = new CheckBoxPreference(context);
        debug.setTitle("Record filter decisions");
        debug.setSummary("Keep the latest 2,000 feed-card and flair-row events for export.");
        debug.setChecked(prefs(context).getBoolean(DEBUG, false));
        debug.setOnPreferenceChangeListener((preference, value) -> {
            prefs(context).edit().putBoolean(DEBUG, (Boolean) value).apply(); return true;
        });
        category.addPreference(debug);
        Preference diagnostics = new Preference(context);
        diagnostics.setTitle("Filter diagnostics");
        diagnostics.setSummary("Show what the feed renderer is detecting");
        diagnostics.setOnPreferenceClickListener(ignored -> {
            SharedPreferences stored = prefs(context);
            String message = "Renderer calls: " + rendererCalls + "\nMatched cards: " + matchedCards
                + "\nListing filter: " + listingFilterCalls + " calls, " + listingItemsSeen
                + " seen, " + listingItemsRemoved + " removed (" + lastListingFilter + ")"
                + "\nKeyword rules: " + lineCount(stored.getString(KEYWORDS, ""))
                + "\nFlair rules: " + lineCount(stored.getString(FLAIRS, ""))
                + "\nActive flair rules: " + stored.getString(FLAIRS, "").replace('\n', ',')
                + "\nLink models: " + linkModelCalls + "/" + linkModelsStored + " (" + lastLinkModel + ")"
                + "\nFeed Link mapper calls: " + feedLinkMapperCalls + " (" + lastFeedLinkMapper + ")"
                + "\nClassic post flairs: " + classicPostCalls + "/" + classicPostFlairMatches
                + " (" + lastClassicPost + ")"
                + "\nHome flair display: " + homeFlairDisplayCalls + "/" + homeFlairsDisplayed
                + " (" + lastHomeFlairDisplay + ")"
                + "\nFeed source calls: " + feedSourceCalls + " (" + lastFeedSource + ")"
                + "\nPost lookup source: " + (postByIdSource == null ? "not initialized" : "ready")
                + "\nLast post lookup: " + lastPostLookup
                + "\nLast native flair UI: " + lastNativeFlairUi
                + "\nTemplate colors stored: " + lineCount(stored.getString(FLAIR_COLORS, ""))
                + "\nChip style calls/applied: " + chipStyleCalls + "/" + chipStylesApplied
                + "\nLast chip style: " + lastChipStyle
                + "\nChannel augment calls: " + channelAugmentCalls
                + "\nLast channel augment: " + lastChannelAugment
                + "\nLast feed-screen community: " + lastFeedScreenCommunity
                + "\nNative channel counts: " + NATIVE_CHANNEL_COUNTS
                + "\nNative flair-chip communities: " + NATIVE_CHIP_COMMUNITIES
                + "\nPending channel count: " + unassignedChannelCount
                + "\nLast header hook: " + lastHeaderHook
                + "\nLast fallback check: " + lastFallbackCheck
                + "\nLast flair row: " + lastFlairRowPosition
                + "\nLast flair action: " + stored.getString(LAST_FLAIR_ACTION, "none")
                + "\nCommunity template lists loaded: " + TEMPLATE_COUNTS
                + "\nFlair request client: " + (subredditSource != null ? "subreddit source ready"
                    : flairSource != null ? "flair source ready" : "not initialized")
                + "\nLast flair request error: " + lastFlairRequestError
                + "\n\nElement classes:\n" + lastClasses + "\n\nTitles:\n" + lastTitles
                + "\n\nFlairs:\n" + lastFlairs;
            new AlertDialog.Builder(context).setTitle("Filter diagnostics")
                .setMessage(message).setPositiveButton("Save .txt", (dialog, which) -> saveDiagnostics(context))
                .setNegativeButton("Close", null).show(); return true;
        });
        category.addPreference(diagnostics);
    }

    public static void addHomeFlairSetting(Object category, Context context) {
        if (!(category instanceof PreferenceCategory) || context == null) return;
        PreferenceCategory layout = (PreferenceCategory) category;
        if (layout.findPreference(SHOW_HOME_FLAIRS) != null) return;
        SwitchPreference preference = new SwitchPreference(context);
        preference.setKey(SHOW_HOME_FLAIRS);
        preference.setTitle("Show post flairs in home feed");
        preference.setSummary("Display post flair badges in the home feed.");
        preference.setOrder(Integer.MIN_VALUE);
        preference.setChecked(prefs(context).getBoolean(SHOW_HOME_FLAIRS, false));
        preference.setOnPreferenceChangeListener((ignored, value) -> {
            prefs(context).edit().putBoolean(SHOW_HOME_FLAIRS, (Boolean) value).apply();
            return true;
        });
        layout.addPreference(preference);
    }

    private static boolean matches(Object item, List<Pattern> keywords, List<FlairRule> flairs) {
        try {
            Accessors methods = accessors;
            if (methods == null) { methods = new Accessors(item.getClass()); accessors = methods; }
            String title = string(methods.title.invoke(item));
            String body = string(methods.body.invoke(item));
            String selftext = string(methods.selftext.invoke(item));
            for (Pattern keyword : keywords)
                if (keyword.matcher(title).find() || keyword.matcher(body).find() || keyword.matcher(selftext).find()) return true;
            String community = normalizeCommunity(string(methods.subreddit.invoke(item)));
            String flair = string(methods.flair.invoke(item));
            for (FlairRule rule : flairs)
                if (rule.community.equals(community) && rule.flair.equalsIgnoreCase(flair)) return true;
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return false;
    }

    private static boolean rememberFlair(Object link, Set<String> discovered) {
        try {
            Accessors methods = accessors;
            if (methods == null) { methods = new Accessors(link.getClass()); accessors = methods; }
            String community = normalizeCommunity(string(methods.subreddit.invoke(link)));
            String flair = string(methods.flair.invoke(link)).trim();
            return !community.isEmpty() && !flair.isEmpty() && discovered.add(community + "::" + flair);
        } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    private static Object findLink(Object value, int depth, Set<Object> seen) {
        if (value == null || depth > 5 || seen.contains(value)) return null;
        if (value.getClass().getName().equals("com.reddit.domain.model.Link")) return value;
        seen.add(value);
        try {
            if (value instanceof Iterable<?>) {
                for (Object child : (Iterable<?>) value) {
                    Object link = findLink(child, depth + 1, seen);
                    if (link != null) return link;
                }
                return null;
            }
            Class<?> type = value.getClass();
            String name = type.getName();
            if (name.startsWith("java.") || name.startsWith("android.") || name.startsWith("kotlin.")) return null;
            for (Class<?> owner = type; owner != null && owner != Object.class; owner = owner.getSuperclass()) {
                for (Field field : owner.getDeclaredFields()) {
                    if (java.lang.reflect.Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                    field.setAccessible(true);
                    Object link = findLink(field.get(value), depth + 1, seen);
                    if (link != null) return link;
                }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return null;
    }

    private static SharedPreferences prefs(Context context) {
        SharedPreferences stable = context.getApplicationContext().getSharedPreferences(STORE, Context.MODE_PRIVATE);
        if (!stable.contains(KEYWORDS) && !stable.contains(FLAIRS)) {
            SharedPreferences legacy = PreferenceManager.getDefaultSharedPreferences(context);
            SharedPreferences.Editor edit = stable.edit();
            for (String key : new String[] { KEYWORDS, FLAIRS, DISCOVERED_FLAIRS })
                if (legacy.contains(key)) edit.putString(key, legacy.getString(key, ""));
            edit.apply();
        }
        return stable;
    }

    private static Context appContext() {
        try {
            Class<?> utils = Class.forName("app.morphe.extension.shared.Utils");
            Object context = utils.getMethod("getContext").invoke(null);
            return context instanceof Context ? ((Context) context).getApplicationContext() : null;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            try {
                Object context = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
                return context instanceof Context ? ((Context) context).getApplicationContext() : null;
            } catch (ReflectiveOperationException | RuntimeException ignoredAgain) { return null; }
        }
    }

    private static List<Pattern> compileLines(String text) {
        ArrayList<Pattern> result = new ArrayList<>();
        for (String line : lines(text)) try {
            result.add(Pattern.compile(line, Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE));
        } catch (PatternSyntaxException ignored) { }
        return result;
    }

    private static List<FlairRule> parseFlairs(String text) {
        ArrayList<FlairRule> result = new ArrayList<>();
        for (String line : lines(text)) {
            int split = line.indexOf("::");
            if (split <= 0 || split + 2 >= line.length()) continue;
            result.add(new FlairRule(normalizeCommunity(line.substring(0, split)),
                normalizeFlair(line.substring(split + 2))));
        }
        return result;
    }

    private static List<String> lines(String text) {
        ArrayList<String> result = new ArrayList<>();
        if (text == null) return result;
        for (String line : text.split("\\r?\\n")) if (!line.trim().isEmpty()) result.add(line.trim());
        return result;
    }

    private static boolean validRegexLines(String text) {
        for (String line : lines(text)) try { Pattern.compile(line); }
        catch (PatternSyntaxException ignored) { return false; }
        return true;
    }

    private static int lineCount(String text) { return lines(text).size(); }
    private static String joinLines(Collection<String> values) {
        StringBuilder result = new StringBuilder();
        for (String value : values) { if (result.length() > 0) result.append('\n'); result.append(value); }
        return result.toString();
    }
    private static String string(Object value) { return value instanceof String ? (String) value : ""; }
    private static String normalizeFlair(String value) {
        if (value == null || value.isEmpty()) return "";
        String decoded = android.text.Html.fromHtml(value, android.text.Html.FROM_HTML_MODE_LEGACY).toString();
        return decoded.trim().replaceAll("\\s+", " ");
    }
    private static String normalizeCommunity(String value) {
        String result = value.trim().toLowerCase(Locale.ROOT);
        return result.startsWith("r/") ? result.substring(2) : result;
    }

    private static final class Accessors {
        final Method id, kindWithId, title, body, selftext, subreddit, flair, flairBackground, flairTextColor;
        Accessors(Class<?> type) throws NoSuchMethodException {
            id = type.getMethod("getId"); kindWithId = type.getMethod("getKindWithId");
            title = type.getMethod("getTitle"); body = type.getMethod("getBody");
            selftext = type.getMethod("getSelftext"); subreddit = type.getMethod("getSubreddit");
            flair = type.getMethod("getLinkFlairText");
            flairBackground = type.getMethod("getLinkFlairBackgroundColor");
            flairTextColor = type.getMethod("getLinkFlairTextColor");
        }
    }

    private static final class PostInfo {
        final String title, body, selftext, community, flair, backgroundColor, textColor;
        PostInfo(String title, String body, String selftext, String community, String flair) {
            this(title, body, selftext, community, flair, "", "");
        }
        PostInfo(String title, String body, String selftext, String community, String flair,
                 String backgroundColor, String textColor) {
            this.title = title; this.body = body; this.selftext = selftext;
            this.community = community; this.flair = flair;
            this.backgroundColor = backgroundColor; this.textColor = textColor;
        }
    }

    private static final class CardText {
        final Set<String> titles = new HashSet<>();
        final Set<String> flairs = new HashSet<>();
        final Set<String> other = new LinkedHashSet<>();
        final Set<String> headerValues = new LinkedHashSet<>();
        final Set<String> classes = new LinkedHashSet<>();
        String community = "";
        String header = "none";
        String headerClass = "none";
    }

    private static void saveDiagnostics(Context context) {
        if (Build.VERSION.SDK_INT < 29) {
            Toast.makeText(context, "Saving to Downloads requires Android 10 or later.", Toast.LENGTH_LONG).show();
            return;
        }
        SharedPreferences stored = prefs(context);
        StringBuilder text = new StringBuilder("Filter diagnostics\n")
            .append("Listing filter: ").append(listingFilterCalls).append(" calls, ")
            .append(listingItemsSeen).append(" seen, ").append(listingItemsRemoved)
            .append(" removed (").append(lastListingFilter).append(")\n")
            .append("Keyword rules: ").append(lineCount(stored.getString(KEYWORDS, ""))).append('\n')
            .append("Flair rules: ").append(lineCount(stored.getString(FLAIRS, ""))).append('\n')
            .append("Active flair rules: ")
            .append(stored.getString(FLAIRS, "").replace('\n', ',')).append('\n')
            .append("Link models: ").append(linkModelCalls).append('/').append(linkModelsStored)
            .append(" (").append(lastLinkModel).append(")\n")
            .append("Feed Link mapper calls: ").append(feedLinkMapperCalls)
            .append(" (").append(lastFeedLinkMapper).append(")\n")
            .append("Classic post flairs: ").append(classicPostCalls).append('/')
            .append(classicPostFlairMatches).append(" (").append(lastClassicPost).append(")\n")
            .append("Home flair display: ").append(homeFlairDisplayCalls).append('/')
            .append(homeFlairsDisplayed).append(" (").append(lastHomeFlairDisplay).append(")\n")
            .append("Feed source calls: ").append(feedSourceCalls).append(" (" + lastFeedSource + ")\n")
            .append("Post lookup source: ").append(postByIdSource == null ? "not initialized" : "ready").append('\n')
            .append("Last post lookup: ").append(lastPostLookup).append('\n')
            .append("Last native flair UI: ").append(lastNativeFlairUi).append('\n')
            .append("Template colors stored: ").append(lineCount(stored.getString(FLAIR_COLORS, ""))).append('\n')
            .append("Chip style calls/applied: ").append(chipStyleCalls).append('/')
            .append(chipStylesApplied).append('\n')
            .append("Last chip style: ").append(lastChipStyle).append('\n')
            .append("Channel augment calls: ").append(channelAugmentCalls).append('\n')
            .append("Last channel augment: ").append(lastChannelAugment).append('\n')
            .append("Last feed-screen community: ").append(lastFeedScreenCommunity).append('\n')
            .append("Native channel counts: ").append(NATIVE_CHANNEL_COUNTS).append('\n')
            .append("Native flair-chip communities: ").append(NATIVE_CHIP_COMMUNITIES).append('\n')
            .append("Pending channel count: ").append(unassignedChannelCount).append('\n')
            .append("Last header hook: ").append(lastHeaderHook).append('\n')
            .append("Last fallback check: ").append(lastFallbackCheck).append('\n')
            .append("Last flair row: ").append(lastFlairRowPosition).append("\n\n")
            .append("Last flair action: ").append(stored.getString(LAST_FLAIR_ACTION, "none")).append("\n\n")
            .append("Filter decisions\n");
        synchronized (DECISIONS) {
            for (String line : DECISIONS) text.append(line).append('\n');
        }
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, "reddit-filter-debug-" + System.currentTimeMillis() + ".txt");
        values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain");
        values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS);
        Uri uri = null;
        try {
            uri = context.getContentResolver().insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
            if (uri == null) throw new IllegalStateException("Downloads did not return a file");
            try (OutputStream stream = context.getContentResolver().openOutputStream(uri)) {
                if (stream == null) throw new IllegalStateException("Cannot open Downloads file");
                stream.write(text.toString().getBytes(StandardCharsets.UTF_8));
            }
            Toast.makeText(context, "Saved filter log to Downloads.", Toast.LENGTH_LONG).show();
        } catch (Exception error) {
            if (uri != null) context.getContentResolver().delete(uri, null, null);
            Toast.makeText(context, "Could not save filter log: " + error.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private static final class FlairRule {
        final String community, flair;
        FlairRule(String community, String flair) { this.community = community; this.flair = flair; }
    }

    private static class EntryListPreference extends Preference {
        final String storageKey, emptySummary;
        final boolean regex;

        EntryListPreference(Context context, String key, String title, String summary, boolean regex) {
            super(context); storageKey = key; emptySummary = summary; this.regex = regex;
            setKey(key); setTitle(title); refreshSummary();
            setOnPreferenceClickListener(ignored -> { showEntries(); return true; });
        }

        List<String> values() { return lines(prefs().getString(storageKey, "")); }
        SharedPreferences prefs() { return RedditContentFilter.prefs(getContext()); }
        void save(List<String> values) { prefs().edit().putString(storageKey, joinLines(values)).apply(); refreshSummary(); }
        void refreshSummary() {
            int count = values().size(); setSummary(count == 0 ? emptySummary : count + " active rule(s)");
        }
        void showEntries() {
            final List<String> values = values();
            String[] labels = values.toArray(new String[0]);
            new AlertDialog.Builder(getContext()).setTitle(getTitle()).setItems(labels, (d, which) -> edit(values, which))
                .setPositiveButton("Add", (d, w) -> edit(values, -1)).setNegativeButton("Close", null).show();
        }
        void edit(final List<String> values, final int index) {
            final EditText input = new EditText(getContext());
            input.setSingleLine(false);
            input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
            if (index >= 0) input.setText(values.get(index));
            AlertDialog dialog = new AlertDialog.Builder(getContext()).setTitle(index < 0 ? "Add entry" : "Edit entry")
                .setView(input).setPositiveButton("Save", null)
                .setNegativeButton("Cancel", (d, w) -> showEntries())
                .setNeutralButton(index < 0 ? null : "Delete", (d, w) -> { values.remove(index); save(values); showEntries(); })
                .create();
            dialog.setOnShowListener(ignored -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
                String value = input.getText().toString().trim();
                if (value.isEmpty()) return;
                if (regex && !validRegexLines(value)) {
                    Toast.makeText(getContext(), "Invalid regular expression.", Toast.LENGTH_LONG).show(); return;
                }
                if (index < 0) values.add(value); else values.set(index, value);
                save(values); dialog.dismiss(); showEntries();
            }));
            dialog.show();
        }
    }

    private static final class FlairListPreference extends Preference {
        FlairListPreference(Context context) {
            super(context); setKey(FLAIRS); setTitle("Community flair filters"); refreshSummary();
            setOnPreferenceClickListener(ignored -> { showChoices(); return true; });
        }
        void refreshSummary() {
            int count = lines(RedditContentFilter.prefs(getContext()).getString(FLAIRS, "")).size();
            setSummary(count == 0 ? "Choose a community, then select its flairs." : count + " filtered flair(s)");
        }
        void showChoices() {
            SharedPreferences prefs = RedditContentFilter.prefs(getContext());
            final List<String> available = lines(prefs.getString(DISCOVERED_FLAIRS, ""));
            if (available.isEmpty()) {
                new AlertDialog.Builder(getContext()).setTitle(getTitle())
                    .setMessage("Only flairs seen on posts are discovered automatically. You can add another flair manually.")
                    .setPositiveButton("Add flair", (d, w) -> addFlair(prefs))
                    .setNegativeButton("Close", null).show(); return;
            }
            if (available.size() >= 0) { showCommunities(prefs, available); return; }
            final Set<String> selected = new HashSet<>(lines(prefs.getString(FLAIRS, "")));
            boolean[] checked = new boolean[available.size()];
            String[] labels = new String[available.size()];
            for (int i = 0; i < available.size(); i++) {
                checked[i] = selected.contains(available.get(i)); labels[i] = "r/" + available.get(i).replace("::", " — ");
            }
            new AlertDialog.Builder(getContext()).setTitle(getTitle()).setMultiChoiceItems(labels, checked, (d, which, enabled) -> {
                if (enabled) selected.add(available.get(which)); else selected.remove(available.get(which));
            }).setPositiveButton("Save", (d, w) -> prefs.edit().putString(FLAIRS, joinLines(selected)).apply())
                .setNegativeButton("Cancel", null).show();
        }

        void addFlair(SharedPreferences prefs) {
            EditText input = new EditText(getContext());
            input.setSingleLine(true);
            input.setHint("community::flair label");
            new AlertDialog.Builder(getContext()).setTitle("Add flair manually")
                .setMessage("Example: pcmasterrace::Hardware")
                .setView(input).setPositiveButton("Add", (d, w) -> {
                    String value = input.getText().toString().trim();
                    int split = value.indexOf("::");
                    if (split <= 0 || split + 2 >= value.length()) {
                        Toast.makeText(getContext(), "Use community::flair label", Toast.LENGTH_LONG).show(); return;
                    }
                    String rule = normalizeCommunity(value.substring(0, split)) + "::" + value.substring(split + 2).trim();
                    Set<String> discovered = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
                    discovered.addAll(lines(prefs.getString(DISCOVERED_FLAIRS, "")));
                    discovered.add(rule);
                    Set<String> selected = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
                    selected.addAll(lines(prefs.getString(FLAIRS, "")));
                    selected.add(rule);
                    prefs.edit().putString(DISCOVERED_FLAIRS, joinLines(discovered))
                        .putString(FLAIRS, joinLines(selected)).apply();
                    refreshSummary();
                }).setNegativeButton("Cancel", null).show();
        }

        void showCommunities(SharedPreferences prefs, List<String> available) {
            final Map<String, List<String>> grouped = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
            for (String value : available) {
                int split = value.indexOf("::");
                if (split > 0 && split + 2 < value.length())
                    grouped.computeIfAbsent(value.substring(0, split), ignored -> new ArrayList<>())
                        .add(value.substring(split + 2));
            }
            final List<String> communities = new ArrayList<>(grouped.keySet());
            final Set<String> selectedRules = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
            selectedRules.addAll(lines(prefs.getString(FLAIRS, "")));
            Collections.sort(communities, (left, right) -> {
                boolean leftSelected = hasSelectedCommunity(selectedRules, left);
                boolean rightSelected = hasSelectedCommunity(selectedRules, right);
                return leftSelected == rightSelected ? String.CASE_INSENSITIVE_ORDER.compare(left, right)
                    : (leftSelected ? -1 : 1);
            });
            LinearLayout layout = new LinearLayout(getContext());
            layout.setOrientation(LinearLayout.VERTICAL);
            EditText search = new EditText(getContext());
            search.setSingleLine(true);
            search.setHint("Search communities");
            layout.addView(search);
            ListView list = new ListView(getContext());
            list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
            int listHeight = (int) (400 * getContext().getResources().getDisplayMetrics().density);
            layout.addView(list, new LinearLayout.LayoutParams(-1, listHeight));
            ArrayAdapter<String> adapter = new ArrayAdapter<>(getContext(),
                android.R.layout.simple_list_item_multiple_choice, new ArrayList<>());
            list.setAdapter(adapter);
            Runnable refresh = () -> {
                String query = search.getText().toString().trim().toLowerCase(Locale.ROOT);
                adapter.clear();
                for (String community : communities) if (community.toLowerCase(Locale.ROOT).contains(query))
                    adapter.add("r/" + community + (TEMPLATE_COUNTS.containsKey(community)
                            ? " (" + TEMPLATE_COUNTS.get(community) + " templates loaded)" : " (seen on posts)"));
                adapter.notifyDataSetChanged();
                for (int i = 0; i < adapter.getCount(); i++) {
                    String label = adapter.getItem(i);
                    for (String community : communities) if (label.startsWith("r/" + community + " (")) {
                        list.setItemChecked(i, hasSelectedCommunity(selectedRules, community));
                        break;
                    }
                }
            };
            search.addTextChangedListener(new TextWatcher() {
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
                public void onTextChanged(CharSequence s, int start, int before, int count) { refresh.run(); }
                public void afterTextChanged(Editable s) {}
            });
            refresh.run();
            AlertDialog dialog = new AlertDialog.Builder(getContext()).setTitle("Choose community")
                .setView(layout).setPositiveButton("Add flair", (d, w) -> addFlair(prefs))
                .setNegativeButton("Close", null).create();
            list.setOnItemClickListener((parent, view, position, id) -> {
                String label = adapter.getItem(position);
                if (label == null) return;
                for (String community : communities) if (label.startsWith("r/" + community + " (")) {
                    list.setItemChecked(position, hasSelectedCommunity(selectedRules, community));
                    dialog.dismiss();
                    showCommunity(prefs, community, grouped.get(community));
                    break;
                }
            });
            dialog.show();
        }

        void showCommunity(SharedPreferences prefs, String community, List<String> availableFlairs) {
            if (!TEMPLATE_COUNTS.containsKey(community)) {
                AlertDialog loading = new AlertDialog.Builder(getContext()).setTitle("Loading r/" + community + " flairs")
                    .setMessage("Requesting the community's full flair list…")
                    .setNegativeButton("Cancel", null).show();
                fetchFullFlairs(getContext(), community, success -> {
                    loading.dismiss();
                    if (!success) Toast.makeText(getContext(),
                        "Full flair list unavailable; showing discovered flairs.", Toast.LENGTH_LONG).show();
                    List<String> refreshed = new ArrayList<>();
                    for (String value : lines(prefs.getString(DISCOVERED_FLAIRS, "")))
                        if (value.regionMatches(true, 0, community + "::", 0, community.length() + 2))
                            refreshed.add(value.substring(community.length() + 2));
                    showCommunityChoices(prefs, community, refreshed);
                });
                return;
            }
            showCommunityChoices(prefs, community, availableFlairs);
        }

        void showCommunityChoices(SharedPreferences prefs, String community, List<String> availableFlairs) {
            final Set<String> selected = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
            selected.addAll(lines(prefs.getString(FLAIRS, "")));
            Collections.sort(availableFlairs, (left, right) -> {
                boolean leftSelected = selected.contains(community + "::" + left);
                boolean rightSelected = selected.contains(community + "::" + right);
                return leftSelected == rightSelected ? String.CASE_INSENSITIVE_ORDER.compare(left, right)
                    : (leftSelected ? -1 : 1);
            });
            boolean[] checked = new boolean[availableFlairs.size()];
            for (int i = 0; i < checked.length; i++) checked[i] = selected.contains(community + "::" + availableFlairs.get(i));
            new AlertDialog.Builder(getContext()).setTitle("r/" + community + " flairs")
                .setMultiChoiceItems(availableFlairs.toArray(new String[0]), checked, (d, which, enabled) -> {
                    String rule = community + "::" + availableFlairs.get(which);
                    if (enabled) selected.add(rule); else selected.remove(rule);
                }).setPositiveButton("Save", (d, w) -> {
                    prefs.edit().putString(FLAIRS, joinLines(selected)).apply(); refreshSummary();
                }).setNegativeButton("Back", (d, w) -> showChoices()).show();
        }

        boolean hasSelectedCommunity(Set<String> selected, String community) {
            String prefix = community + "::";
            for (String rule : selected) if (rule.regionMatches(true, 0, prefix, 0, prefix.length())) return true;
            return false;
        }
    }
}
