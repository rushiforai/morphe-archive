package local.reddit.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/** Runtime half of the opt-in vertical Home viewer for Reddit 2026.14.0. */
public final class VerticalHomeFeed {
    private static final String MARKER = "__morphe_vertical_home__";
    private static final Map<String, Object> LINKS = new LinkedHashMap<String, Object>(512, .75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String, Object> entry) {
            return size() > 1200;
        }
    };
    private static volatile List<Object> snapshot = Collections.emptyList();
    private static volatile boolean vertical;
    private static final Map<Object, Integer> POSITIONS = Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static volatile Object homePager;
    private static volatile int initialIndex;
    private static boolean requesting;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile Object navScreen;
    private static volatile Method drawIcon;
    private static volatile Method drawLabel;

    private VerticalHomeFeed() { }

    public static void rememberLinks(List<?> links) {
        if (links == null) return;
        for (Object link : links) rememberLink(link);
    }

    public static void rememberLink(Object link) {
        if (link == null) return;
        synchronized (LINKS) {
            try {
                String id = string(field(link, "kindWithId"));
                if (id != null) LINKS.put(id, link);
                String rawId = string(call(link, "getId"));
                if (rawId != null) LINKS.put(rawId, link);
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
        }
    }

    public static void initializeNav(Object screen) {
        navScreen = screen;
    }

    @SuppressWarnings("unchecked")
    public static void addButton(Object builder) {
        if (!(builder instanceof List<?>) || ((List<?>) builder).isEmpty()) return;
        try {
            List<Object> items = (List<Object>) builder;
            Object original = items.get(0);
            Object content = field(original, "b");
            Constructor<?> ctor = original.getClass().getConstructor(String.class, content.getClass());
            items.add(1, ctor.newInstance("Vertical", content));
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    public static Function0<?> wrapClick(Object descriptor, Function0<?> original) {
        try {
            if (!"Vertical".equals(field(descriptor, "a"))) return original;
            return () -> {
                Object nav = navScreen;
                Activity activity = activity(nav);
                if (activity != null) {
                    Object screen = call(nav, "getCurrentScreen");
                    if (isHome(screen)) open(activity, screen);
                    else Toast.makeText(activity, "Open Home feed first", Toast.LENGTH_SHORT).show();
                }
                return kotlinUnit();
            };
        } catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    public static String tabLabel(Object descriptor, String original) {
        try { return "Vertical".equals(field(descriptor, "a")) ? "Vertical" : original; }
        catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    public static Function2<?, ?, ?> tabIcon(Object descriptor, Function2<?, ?, ?> original) {
        try {
            if (!"Vertical".equals(field(descriptor, "a"))) return original;
            return (composer, flags) -> {
                try {
                    Method draw = drawIcon;
                    if (draw == null) {
                        Class<?> icon = Class.forName("com.reddit.ui.compose.icons.h");
                        draw = Class.forName("com.reddit.ui.compose.pointer.q9").getMethod("a",
                            icon, Class.forName("androidx.compose.ui.s"), long.class,
                            boolean.class, String.class,
                            Class.forName("androidx.compose.runtime.m"), int.class, int.class);
                        drawIcon = draw;
                    }
                    Object video = Class.forName("com.reddit.ui.compose.icons.i0")
                        .getField("J2").get(null);
                    draw.invoke(null, video, null, 0L, false, null, composer, 24576, 14);
                } catch (ReflectiveOperationException | RuntimeException error) {
                    ((Function2<Object, Object, ?>) original).invoke(composer, flags);
                }
                return kotlinUnit();
            };
        } catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    @SuppressWarnings("unchecked")
    public static Function2<?, ?, ?> tabText(Object descriptor, Function2<?, ?, ?> original) {
        try {
            if (!"Vertical".equals(field(descriptor, "a"))) return original;
            return (composer, flags) -> {
                try {
                    Method draw = drawLabel;
                    if (draw == null) {
                        for (Method candidate : Class.forName("com.reddit.ui.compose.ds.kh").getMethods()) {
                            if ("b".equals(candidate.getName()) && candidate.getParameterCount() == 21
                                && candidate.getParameterTypes()[0] == String.class) {
                                draw = candidate;
                                drawLabel = draw;
                                break;
                            }
                        }
                    }
                    if (draw == null) throw new NoSuchMethodException("bottom bar text");
                    draw.invoke(null, "Vertical", null, 0L, 0L, null, null, null, 0L,
                        null, 0, 0L, 0, false, 0, 0, null, null, composer, 0, 0, 262142);
                } catch (ReflectiveOperationException | RuntimeException error) {
                    ((Function2<Object, Object, ?>) original).invoke(composer, flags);
                }
                return kotlinUnit();
            };
        } catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    public static void pagerAttached(Object screen) {
        vertical = marked(screen);
    }

    public static void pagerDetached(Object screen) {
        if (marked(screen)) {
            vertical = false;
        }
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Object chooseOrientation(Object original) {
        if (!vertical) return original;
        return Enum.valueOf((Class<? extends Enum>) original.getClass(), "Vertical");
    }

    public static boolean useImprovedProvider(Object provider, boolean original) {
        try { return MARKER.equals(field(field(provider, "a"), "B")) ? false : original; }
        catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    /** Null means the ordinary Reddit provider must run. */
    public static Object page(Object provider, String cursor) {
        try {
            Object params = field(provider, "a");
            if (!MARKER.equals(field(params, "B"))) return null;
            List<Object> all = snapshot;
            int start = 0;
            if (cursor != null) {
                try { start = cursor.startsWith("vh:") ? Integer.parseInt(cursor.substring(3))
                    : all.size(); }
                catch (NumberFormatException ignored) { start = all.size(); }
            }
            if (start < 0 || start > all.size()) start = all.size();
            int end = Math.min(start + 20, all.size());
            String after = end < all.size() ? "vh:" + end : null;
            Class<?> listing = Class.forName("com.reddit.domain.model.listing.Listing");
            return listing.getConstructor(List.class, String.class, String.class,
                String.class, String.class, boolean.class, List.class).newInstance(
                    new ArrayList<>(all.subList(start, end)), after, null, null, null,
                    false, Collections.emptyList());
        } catch (ReflectiveOperationException | RuntimeException error) {
            return null;
        }
    }

    private static void open(Activity activity, Object screen) {
        if (!isHome(screen)) return;
        try {
            Object child = call(screen, "O5");
            Object model = call(child, "F1");
            Object pager = field(model, "x");
            homePager = pager;
            requesting = false;
            ArrayList<Object> posts = homePosts(pager);
            if (posts.isEmpty()) throw new IllegalStateException("No Home images or videos loaded");
            int position = POSITIONS.getOrDefault(pager, 0);
            Object sections = field(call(call(pager, "getState"), "getValue"), "b");
            int sectionIndex = 0;
            Object focused = null;
            for (Object section : (Iterable<?>) sections) {
                Object candidate = sectionLink(section);
                if (sectionIndex++ >= position && posts.contains(candidate)) {
                    focused = candidate;
                    break;
                }
            }
            initialIndex = focused == null ? posts.size() - 1 : posts.indexOf(focused);
            snapshot = Collections.unmodifiableList(posts);
            Object first = posts.get(initialIndex);
            Class<?> linkType = Class.forName("com.reddit.domain.model.Link");
            Class<?> listingType = Class.forName("com.reddit.listing.common.ListingType");
            Class<?> mediaType = Class.forName("com.reddit.domain.model.media.MediaContext");
            Class<?> dataType = Class.forName("com.reddit.fullbleedplayer.data.s");
            Class<?> sessionType = Class.forName("com.reddit.domain.model.post.NavigationSession");
            Class<?> commentsType = Class.forName("com.reddit.domain.model.media.CommentsState");
            Class<?> entryType = Class.forName("com.reddit.fullbleedplayer.navigation.VideoEntryPoint");
            Class<?> referrerType = Class.forName("fn.c");
            @SuppressWarnings({"unchecked", "rawtypes"}) Object home = Enum.valueOf((Class) listingType, "HOME");
            @SuppressWarnings({"unchecked", "rawtypes"}) Object closed = Enum.valueOf((Class) commentsType, "CLOSED");
            @SuppressWarnings({"unchecked", "rawtypes"}) Object entry = Enum.valueOf((Class) entryType, "HOME");
            String firstId = string(call(first, "getId"));
            if (firstId == null) firstId = string(call(first, "getKindWithId"));
            String kindId = string(call(first, "getKindWithId"));
            String uniqueId = string(call(first, "getUniqueId"));
            if (uniqueId == null) uniqueId = firstId;
            String correlation = string(call(first, "getEventCorrelationId"));
            if (correlation == null) correlation = UUID.randomUUID().toString();
            Object mediaContext = mediaType.getConstructor(List.class, listingType, String.class,
                String.class, List.class, boolean.class, boolean.class, String.class)
                .newInstance(Collections.singletonList(call(first, "getSubredditId")), home,
                    kindId, "", null, image(first, linkType), false, null);
            Object data = dataType.getConstructor(String.class,
                Class.forName("com.reddit.listing.model.sort.SortType"),
                Class.forName("com.reddit.listing.model.sort.SortTimeFrame"))
                .newInstance(MARKER, null, null);
            Object session = Class.forName("com.reddit.domain.model.post.NavigationSession")
                .getConstructor().newInstance();
            Object params;
            if (image(first, linkType) || call(first, "getGallery") != null) {
                Class<?> paramsType = Class.forName("com.reddit.fullbleedplayer.common.d");
                params = paramsType.getConstructor(String.class, String.class, boolean.class,
                    commentsType, Bundle.class, mediaType, dataType, sessionType, entryType,
                    referrerType, String.class, boolean.class, String.class, ArrayList.class,
                    int.class, List.class).newInstance(correlation, firstId, false, closed, null,
                        mediaContext, data, session, entry, null, uniqueId, false, MARKER,
                        null, 0, null);
            } else {
                Class<?> correlationType = Class.forName("com.reddit.fullbleedplayer.l");
                Object token = correlationType.getConstructor(String.class).newInstance(correlation);
                Class<?> paramsType = Class.forName("com.reddit.fullbleedplayer.common.f");
                params = paramsType.getConstructor(correlationType, String.class, boolean.class,
                    commentsType, Bundle.class, mediaType, dataType, sessionType, entryType,
                    referrerType, String.class, boolean.class, String.class, String.class,
                    boolean.class).newInstance(token, firstId, false, closed, null,
                        mediaContext, data, session, entry, null, uniqueId, false, MARKER,
                        null, false);
            }
            Class<?> player = Class.forName("com.reddit.fullbleedplayer.common.FbpActivity");
            Intent intent = new Intent(activity, player);
            intent.putExtra("FBP_PARAMS_EXTRA", (Parcelable) params);
            activity.startActivity(intent);
        } catch (ReflectiveOperationException | RuntimeException error) {
            String reason = error.getMessage();
            Toast.makeText(activity, "Vertical feed: " + (reason != null ? reason
                    : error.getClass().getSimpleName()),
                Toast.LENGTH_LONG).show();
        }
    }

    private static boolean isHome(Object screen) {
        try {
            Object child = call(screen, "O5");
            Object model = call(child, "F1");
            return "HOME".equals(String.valueOf(field(model, "M")));
        } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    private static boolean marked(Object screen) {
        try {
            Object args = field(screen, "f60223b");
            return args instanceof Bundle && MARKER.equals(((Bundle) args).getString("feed_data_source"));
        } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    private static Activity activity(Object screen) {
        try { return (Activity) call(screen, "H3"); }
        catch (RuntimeException ignored) { return null; }
    }

    private static Object call(Object receiver, String method) {
        if (receiver == null) return null;
        try { return receiver.getClass().getMethod(method).invoke(receiver); }
        catch (ReflectiveOperationException | RuntimeException ignored) { return null; }
    }

    private static Object field(Object receiver, String name) throws ReflectiveOperationException {
        if (receiver == null) return null;
        Class<?> type = receiver.getClass();
        while (type != null) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(receiver);
            } catch (NoSuchFieldException ignored) { type = type.getSuperclass(); }
        }
        throw new NoSuchFieldException(name);
    }

    private static String string(Object value) {
        return value instanceof String ? (String) value : null;
    }

    private static boolean eligible(Object link) {
        return link != null && !Boolean.TRUE.equals(call(link, "getPromoted"))
            && !Boolean.TRUE.equals(call(link, "isBlankAd"));
    }

    private static boolean media(Object link) {
        try {
            Class<?> linkType = Class.forName("com.reddit.domain.model.Link");
            Class<?> types = Class.forName("com.reddit.domain.model.listing.PostTypesKt");
            return Boolean.TRUE.equals(types.getMethod("isImageLinkType", linkType).invoke(null, link))
                || Boolean.TRUE.equals(types.getMethod("isValidFBPVideo", linkType).invoke(null, link))
                || Boolean.TRUE.equals(types.getMethod("isGalleryPost", linkType).invoke(null, link));
        } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    private static boolean image(Object link, Class<?> linkType) throws ReflectiveOperationException {
        return Boolean.TRUE.equals(Class.forName("com.reddit.domain.model.listing.PostTypesKt")
            .getMethod("isImageLinkType", linkType).invoke(null, link));
    }

    /** Scroll positions belong to a pager, so profile/subreddit scrolling cannot overwrite Home. */
    public static void rememberPosition(Object handler, Object event) {
        if (event == null) return;
        try {
            Integer position = (Integer) field(event, "a");
            if (position != null) POSITIONS.put(field(handler, "a"), position);
        }
        catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    private static Object sectionLink(Object section) {
        String id = string(call(section, "a"));
        if (id != null && id.startsWith("feed_post_section_"))
            id = id.substring("feed_post_section_".length());
        else if (id != null && id.startsWith("post_preview_"))
            id = id.substring("post_preview_".length());
        synchronized (LINKS) { return LINKS.get(id); }
    }

    private static ArrayList<Object> homePosts(Object pager) throws ReflectiveOperationException {
        Object state = call(call(pager, "getState"), "getValue");
        ArrayList<Object> posts = new ArrayList<>();
        Set<String> ids = new HashSet<>();
        for (Object section : (Iterable<?>) field(state, "b")) {
            Object link = sectionLink(section);
            String id = postId(link);
            if (eligible(link) && media(link) && id != null && ids.add(id)) posts.add(link);
        }
        return posts;
    }

    private static String postId(Object post) {
        if (post == null) return null;
        try {
            String id = string(field(post, "kindWithId"));
            if (id != null && !id.isEmpty()) return id;
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return string(call(post, "getId"));
    }

    /** Link.equals includes changing scores, comments and analytics; only the ID is stable. */
    private static ArrayList<Object> unseenPosts(List<?> posts, List<?> previous) {
        Set<String> seen = new HashSet<>();
        for (Object post : previous) seen.add(postId(post));
        ArrayList<Object> fresh = new ArrayList<>();
        for (Object post : posts) {
            String id = postId(post);
            if (id != null && seen.add(id)) fresh.add(post);
        }
        return fresh;
    }

    /** Set the initial visibility, leaving Reddit's subsequent tap toggles intact. */
    public static Object initialChrome(Object mapper, Object state) {
        try {
            Object params = field(mapper, "k");
            if (!MARKER.equals(field(field(params, "d"), "a"))) return state;
            String[] fields = {"a", "b", "c", "d", "e", "f", "g", "i", "r", "v",
                "w", "x", "y", "B", "L", "M", "N", "O", "P"};
            Object[] values = new Object[fields.length];
            for (int i = 0; i < fields.length; i++) values[i] = field(state, fields[i]);
            values[12] = false; // FullBleedChromeState.isVisible
            for (Constructor<?> constructor : state.getClass().getConstructors())
                if (constructor.getParameterCount() == values.length)
                    return constructor.newInstance(values);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return state;
    }

    private static boolean custom(Object source) {
        try { return MARKER.equals(field(field(field(source, "g"), "d"), "a")); }
        catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    private static boolean hasMore(Object pager) {
        try {
            Object status = field(call(call(pager, "getState"), "getValue"), "c");
            // qk1.p is the pager's exhausted state; qk1.q is a load error.
            return !"qk1.p".equals(status.getClass().getName());
        } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    private static Object copyPager(Object state, Object items, boolean loading, boolean more)
            throws ReflectiveOperationException {
        Object[] values = new Object[9];
        for (int i = 0; i < values.length; i++) values[i] = field(state, String.valueOf((char) ('a' + i)));
        values[0] = items;
        values[1] = loading;
        values[2] = more;
        for (Constructor<?> constructor : state.getClass().getConstructors())
            if (constructor.getParameterCount() == 9) return constructor.newInstance(values);
        throw new NoSuchMethodException("Media pager state");
    }

    /** Keep the media player's next-page flag in sync with Home, including its initial update. */
    public static Function1<Object, Object> wrapUpdate(Object source, Function1<Object, Object> original) {
        if (!custom(source)) return original;
        return state -> {
            Object updated = original.invoke(state);
            try { return copyPager(updated, field(updated, "a"), (Boolean) field(updated, "b"), hasMore(homePager)); }
            catch (ReflectiveOperationException | RuntimeException ignored) { return updated; }
        };
    }

    private static void update(Object source, Function1<Object, Object> transform)
            throws ReflectiveOperationException {
        source.getClass().getMethod("l", Function1.class).invoke(source, transform);
    }

    /** Use exactly the Home pager request used by the normal near-bottom scroll handler. */
    public static boolean loadMore(Object source) {
        if (!custom(source)) return false;
        MAIN.post(() -> {
            if (requesting || homePager == null) return;
            requesting = true;
            Object pager = homePager;
            List<Object> previous = snapshot;
            try {
                update(source, state -> {
                    try { return copyPager(state, field(state, "a"), true, hasMore(pager)); }
                    catch (ReflectiveOperationException error) { return state; }
                });
                pager.getClass().getMethod("a").invoke(pager);
                pollPage(source, pager, previous, android.os.SystemClock.uptimeMillis());
            } catch (ReflectiveOperationException | RuntimeException error) {
                finishPage(source, pager, previous);
            }
        });
        return true;
    }

    private static void pollPage(Object source, Object pager, List<Object> previous, long started) {
        MAIN.postDelayed(() -> {
            if (pager != homePager) return;
            try {
                Object status = field(call(call(pager, "getState"), "getValue"), "c");
                long elapsed = android.os.SystemClock.uptimeMillis() - started;
                if ((elapsed < 500 || "qk1.s".equals(status.getClass().getName())) && elapsed < 30000) {
                    pollPage(source, pager, previous, started);
                    return;
                }
                ArrayList<Object> posts = homePosts(pager);
                ArrayList<Object> fresh = unseenPosts(posts, previous);
                // A page can contain only text/ads. Continue until media arrives or Home ends/errors.
                if (fresh.isEmpty() && hasMore(pager) && !"qk1.q".equals(status.getClass().getName()) && elapsed < 30000) {
                    pager.getClass().getMethod("a").invoke(pager);
                    pollPage(source, pager, previous, started);
                    return;
                }
                finishPage(source, pager, posts);
            } catch (ReflectiveOperationException | RuntimeException error) {
                finishPage(source, pager, previous);
            }
        }, 250);
    }

    private static void finishPage(Object source, Object pager, List<Object> posts) {
        try {
            ArrayList<Object> fresh = unseenPosts(posts, snapshot);
            Object pages = source.getClass().getMethod("f", List.class).invoke(source, fresh);
            boolean[] appended = {false};
            update(source, state -> {
                try {
                    List<?> old = (List<?>) field(state, "a");
                    // Match the native loader's second guard at the rendered-page level.
                    Set<String> pageIds = new HashSet<>();
                    for (Object page : old) pageIds.add(string(call(page, "c")));
                    ArrayList<Object> newPages = new ArrayList<>();
                    for (Object page : (Iterable<?>) pages) {
                        String id = string(call(page, "c"));
                        if (id != null && pageIds.add(id)) newPages.add(page);
                    }
                    Object indexed = source.getClass().getMethod("c", int.class, List.class)
                        .invoke(source, old.size(), newPages);
                    Class<?> persistent = Class.forName("gp3.g");
                    Method append = null;
                    for (Method method : persistent.getMethods())
                        if ("addAll".equals(method.getName()) && method.getReturnType() == persistent
                            && method.getParameterCount() == 1) append = method;
                    if (append == null) throw new NoSuchMethodException("Persistent list append");
                    Object joined = append.invoke(old, indexed);
                    Object updated = copyPager(state, joined, false, hasMore(pager));
                    appended[0] = true;
                    return updated;
                } catch (ReflectiveOperationException | RuntimeException error) {
                    try { return copyPager(state, field(state, "a"), false, hasMore(pager)); }
                    catch (ReflectiveOperationException ignored) { return state; }
                }
            });
            if (!appended[0]) return;
            ArrayList<Object> combined = new ArrayList<>(snapshot);
            combined.addAll(fresh);
            snapshot = Collections.unmodifiableList(combined);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        finally { requesting = false; }
    }

    /** Replace Reddit's discovered feed with the Home media snapshot. */
    public static Object initialMedia(Object source, Object original) {
        try {
            Object params = field(source, "g");
            Object data = field(params, "d");
            if (!MARKER.equals(field(data, "a"))) return original;
            List<Object> posts = snapshot;
            if (posts.isEmpty()) return original;
            Field requestedIndex = source.getClass().getDeclaredField("q");
            requestedIndex.setAccessible(true);
            requestedIndex.set(source, initialIndex);
            Class<?> linkType = Class.forName("com.reddit.domain.model.Link");
            return Class.forName("com.reddit.fullbleedplayer.data.p")
                .getConstructor(ArrayList.class, linkType, int.class)
                .newInstance(new ArrayList<>(posts), posts.get(initialIndex), initialIndex);
        } catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    /** Select Reddit's existing vertical pager for this Home media session. */
    public static Object verticalViewState(Object viewModel, Object state) {
        try {
            Object params = field(viewModel, "g");
            Object data = field(params, "d");
            if (!MARKER.equals(field(data, "a"))) return state;
            Object current = field(state, "g");
            if (!"Horizontal".equals(String.valueOf(current))) return state;
            @SuppressWarnings({"unchecked", "rawtypes"}) Object vertical =
                Enum.valueOf((Class) current.getClass(), "Vertical");
            Object[] values = new Object[15];
            for (int i = 0; i < values.length; i++)
                values[i] = field(state, String.valueOf((char) ('a' + i)));
            values[6] = vertical;
            for (Constructor<?> constructor : state.getClass().getConstructors()) {
                if (constructor.getParameterCount() == values.length)
                    return constructor.newInstance(values);
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return state;
    }

    public static Object completed() { return kotlinUnit(); }

    private static Object kotlinUnit() {
        try {
            Class<?> type = Class.forName("kotlin.Unit");
            try { return type.getField("a").get(null); }
            catch (NoSuchFieldException missing) { return type.getField("INSTANCE").get(null); }
        } catch (ReflectiveOperationException | RuntimeException ignored) { return null; }
    }
}
