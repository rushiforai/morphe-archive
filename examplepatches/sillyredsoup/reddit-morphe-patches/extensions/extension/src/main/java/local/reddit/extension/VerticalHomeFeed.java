package local.reddit.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.widget.Toast;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.lang.reflect.Modifier;
import java.util.concurrent.ConcurrentHashMap;
import java.lang.reflect.Field;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Set;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/** Runtime half of the opt-in vertical feed viewer for Reddit 2026.14.0. */
public final class VerticalHomeFeed {
    private static final String MARKER = "__morphe_vertical_home__";
    private static final Map<String, Object> LINKS = new LinkedHashMap<String, Object>(512, .75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String, Object> entry) {
            return size() > 1200;
        }
    };
    private static volatile boolean vertical;
    private static final Map<Object, Integer> POSITIONS = Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static final Map<Object, Boolean> FEEDS = Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static final Map<Object, WeakReference<List<?>>> DISPLAYED = Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static final Map<Object, String> FOCUS = Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static final Map<String, Session> SESSIONS = new ConcurrentHashMap<>();
    private static final Map<Object, Boolean> CUSTOM_STATES = Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile WeakReference<Object> navScreen = new WeakReference<>(null);

    private static final class Session {
        final String token = MARKER + UUID.randomUUID();
        final WeakReference<Object> model;
        final Object pager;
        final int initialIndex;
        volatile List<Object> posts;
        volatile String currentPost;
        boolean requesting;
        Session(Object model, Object pager, List<Object> posts, int initialIndex) {
            this.model = new WeakReference<>(model);
            this.pager = pager;
            this.posts = Collections.unmodifiableList(new ArrayList<>(posts));
            this.initialIndex = initialIndex;
        }
    }
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
        navScreen = new WeakReference<>(screen);
    }

    @SuppressWarnings("unchecked")
    public static void addButton(Object builder) {
        if (!(builder instanceof List<?>) || ((List<?>) builder).isEmpty()) return;
        try {
            List<Object> items = (List<Object>) builder;
            for (Object item : items) if ("Vertical".equals(field(item, "a"))) return;
            Object original = items.get(0);
            Object content = field(original, "b");
            Constructor<?> ctor = original.getClass().getConstructor(String.class, content.getClass());
            items.add(1, ctor.newInstance("Vertical", content));
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    public static Function0<?> wrapClick(Object descriptor, Function0<?> original) {
        if (original instanceof VerticalClick) return original;
        try {
            if (!"Vertical".equals(field(descriptor, "a"))) return original;
            Object owner = null;
            for (Field captured : original.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(captured.getModifiers()) || !
                    "com.reddit.launch.bottomnav.BottomNavScreen".equals(captured.getType().getName())) continue;
                captured.setAccessible(true);
                owner = captured.get(original);
                break;
            }
            return new VerticalClick(owner);
        } catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    private static final class VerticalClick implements Function0<Object> {
        final Object owner;
        VerticalClick(Object owner) { this.owner = owner; }
        @Override public Object invoke() {
            Object nav = owner != null ? owner : navScreen.get();
            Activity activity = activity(nav);
            if (activity != null) {
                Object model = visibleFeed(activity, call(nav, "getCurrentScreen"));
                if (model != null) open(activity, model);
                else Toast.makeText(activity, "Open a post feed first", Toast.LENGTH_SHORT).show();
            }
            return kotlinUnit();
        }
    }

    /** Shared by Home, subreddit, profile, Popular, saved and other native post feeds. */
    public static void rememberFeed(Object model) {
        if (model != null) FEEDS.put(model, Boolean.TRUE);
    }

    /** Capture the sections actually rendered, after native filtering and deduplication. */
    public static Object rememberRendered(Object model, Object state) {
        try {
            Object sections = field(state, "a");
            if (sections instanceof List<?>)
                DISPLAYED.put(field(model, "x"), new WeakReference<>((List<?>) sections));
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return state;
    }

    private static Object visibleFeed(Activity activity, Object screen) {
        Object child = call(screen, "O5");
        if (child != null) screen = child;
        Object direct = call(screen, "F1");
        if (direct != null) return direct;
        synchronized (FEEDS) {
            for (Object model : FEEDS.keySet()) {
                try {
                    // Profile's Posts/Saved panes are embedded screens rather than the nav-stack top.
                    Object owner = field(model, "U");
                    if (belongsToScreen(owner, screen) && activity(owner) == activity && "ON_SCREEN".equals(String.valueOf(
                        call(field(model, "n0"), "getValue")))) return model;
                } catch (ReflectiveOperationException | RuntimeException ignored) { }
            }
        }
        return null;
    }

    private static boolean belongsToScreen(Object owner, Object screen) {
        if (screen == null) return false;
        Set<Object> seen = Collections.newSetFromMap(new IdentityHashMap<>());
        while (owner != null && seen.add(owner)) {
            if (owner == screen) return true;
            // BaseScreen.X4() is the native parent screen. Activity and ON_SCREEN alone
            // can also match the previous feed while navigation visibility catches up.
            owner = call(owner, "X4");
        }
        return false;
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
                        draw = Class.forName("com.reddit.ui.compose.ds.q9").getMethod("a",
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
        try { return marker(field(field(provider, "a"), "B")) ? false : original; }
        catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    /** Null means the ordinary Reddit provider must run. */
    public static Object page(Object provider, String cursor) {
        try {
            Object params = field(provider, "a");
            Session session = SESSIONS.get(string(field(params, "B")));
            if (session == null) return null;
            List<Object> all = session.posts;
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

    private static void open(Activity activity, Object model) {
        Session session = null;
        try {
            Object pager = field(model, "x");
            ArrayList<Object> posts = feedPosts(pager);
            if (posts.isEmpty()) throw new IllegalStateException("No images or videos loaded in this feed");
            Object focused = focusedPost(pager, posts);
            int initialIndex = focused == null ? posts.size() - 1 : posts.indexOf(focused);
            session = new Session(model, pager, posts, initialIndex);
            SESSIONS.put(session.token, session);
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
                .newInstance(session.token, null, null);
            Object navigationSession = Class.forName("com.reddit.domain.model.post.NavigationSession")
                .getConstructor().newInstance();
            Object params;
            if (image(first, linkType) || call(first, "getGallery") != null) {
                Class<?> paramsType = Class.forName("com.reddit.fullbleedplayer.common.d");
                params = paramsType.getConstructor(String.class, String.class, boolean.class,
                    commentsType, Bundle.class, mediaType, dataType, sessionType, entryType,
                    referrerType, String.class, boolean.class, String.class, ArrayList.class,
                    int.class, List.class).newInstance(correlation, firstId, false, closed, null,
                        mediaContext, data, navigationSession, entry, null, uniqueId, false, session.token,
                        null, 0, null);
            } else {
                Class<?> correlationType = Class.forName("com.reddit.fullbleedplayer.l");
                Object token = correlationType.getConstructor(String.class).newInstance(correlation);
                Class<?> paramsType = Class.forName("com.reddit.fullbleedplayer.common.f");
                params = paramsType.getConstructor(correlationType, String.class, boolean.class,
                    commentsType, Bundle.class, mediaType, dataType, sessionType, entryType,
                    referrerType, String.class, boolean.class, String.class, String.class,
                    boolean.class).newInstance(token, firstId, false, closed, null,
                        mediaContext, data, navigationSession, entry, null, uniqueId, false, session.token,
                        null, false);
            }
            Class<?> player = Class.forName("com.reddit.fullbleedplayer.common.FbpActivity");
            Intent intent = new Intent(activity, player);
            intent.putExtra("FBP_PARAMS_EXTRA", (Parcelable) params);
            activity.startActivity(intent);
            Log.i("VerticalFeed", "Opened " + field(model, "M") + " media=" + posts.size()
                + " index=" + initialIndex);
        } catch (ReflectiveOperationException | RuntimeException error) {
            if (session != null) SESSIONS.remove(session.token);
            Log.e("VerticalFeed", "Could not open feed", error);
            String reason = error.getMessage();
            Toast.makeText(activity, "Vertical feed: " + (reason != null ? reason
                    : error.getClass().getSimpleName()),
                Toast.LENGTH_LONG).show();
        }
    }

    private static boolean marker(Object value) {
        return value instanceof String && ((String) value).startsWith(MARKER);
    }

    /** Release snapshots and stop outstanding pagination when this viewer is actually closed. */
    public static void closeViewer(Object value) {
        if (!(value instanceof Activity)) return;
        Activity activity = (Activity) value;
        if (activity.isChangingConfigurations()) return;
        try {
            Object params = activity.getIntent().getParcelableExtra("FBP_PARAMS_EXTRA");
            Object data = call(params, "h");
            String token = string(field(data, "a"));
            if (token != null) {
                Session session = SESSIONS.remove(token);
                if (session != null) syncPosition(session, session.currentPost);
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    private static boolean marked(Object screen) {
        try {
            Object args = field(screen, "f60223b");
            return args instanceof Bundle && marker(((Bundle) args).getString("feed_data_source"));
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
            Object pager = field(handler, "a");
            if (position != null) {
                POSITIONS.put(pager, position);
                List<?> sections = displayed(pager);
                if (sections != null) {
                    // Profile's sticky header can leave the preceding row in the visible range.
                    // Keep the explicitly selected media while it is still in that range.
                    Integer last = (Integer) field(event, "b");
                    String previous = FOCUS.get(pager);
                    if (previous != null && last != null) {
                        for (int i = Math.max(0, position); i <= last && i < sections.size(); i++)
                            if (previous.equals(postId(sectionLink(sections.get(i))))) return;
                    }
                    Object focused = nextMedia(sections, position);
                    String id = postId(focused);
                    if (id != null) FOCUS.put(pager, id);
                    else FOCUS.remove(pager);
                }
            }
        }
        catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    private static List<?> displayed(Object pager) {
        WeakReference<List<?>> reference = DISPLAYED.get(pager);
        return reference == null ? null : reference.get();
    }

    private static Object nextMedia(List<?> sections, int position) {
        for (int i = Math.max(0, position); i < sections.size(); i++) {
            Object link = sectionLink(sections.get(i));
            if (eligible(link) && media(link)) return link;
        }
        return null;
    }

    private static Object focusedPost(Object pager, List<?> posts) throws ReflectiveOperationException {
        String id = FOCUS.get(pager);
        if (id != null) for (Object post : posts) if (id.equals(postId(post))) return post;
        List<?> sections = displayed(pager);
        if (sections == null) sections = (List<?>) field(call(call(pager, "getState"), "getValue"), "b");
        Object focused = nextMedia(sections, POSITIONS.getOrDefault(pager, 0));
        String focusedId = postId(focused);
        if (focusedId != null) for (Object post : posts) if (focusedId.equals(postId(post))) return post;
        return null;
    }

    private static Object sectionLink(Object section) {
        String id = string(call(section, "a"));
        if (id != null && id.startsWith("feed_post_section_"))
            id = id.substring("feed_post_section_".length());
        else if (id != null && id.startsWith("post_preview_"))
            id = id.substring("post_preview_".length());
        synchronized (LINKS) { return LINKS.get(id); }
    }

    private static ArrayList<Object> feedPosts(Object pager) throws ReflectiveOperationException {
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
            if (!marker(field(field(params, "d"), "a"))) return state;
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

    private static Session session(Object source) {
        try { return SESSIONS.get(string(field(field(field(source, "g"), "d"), "a"))); }
        catch (ReflectiveOperationException | RuntimeException ignored) { return null; }
    }

    private static void syncPosition(Session session, String id) {
        if (id == null) return;
        Object model = session.model.get();
        if (model == null) return;
        try {
            Iterable<?> sections = (Iterable<?>) field(call(call(session.pager, "getState"), "getValue"), "b");
            int index = 0;
            for (Object section : sections) {
                Object link = sectionLink(section);
                // Media pages use raw IDs; feed sections use full t3_ IDs.
                if (id.equals(postId(link)) || id.equals(string(call(link, "getId")))) {
                    // OnScrollToId resolves domain-element uniqueId, not the UI section key.
                    String key = string(call(link, "getUniqueId"));
                    if (key == null) key = postId(link);
                    Object event = Class.forName("com.reddit.feeds.ui.events.OnScrollToId")
                        .getConstructor(String.class).newInstance(key);
                    model.getClass().getMethod("a0", Class.forName("yn1.a")).invoke(model, event);
                    // Off-screen feeds may defer their scroll listener until Back. Advance the
                    // cache's viewport hint now, just as the native scroll handler does.
                    int viewport = index;
                    List<?> shown = displayed(session.pager);
                    if (shown != null) {
                        for (int i = 0; i < shown.size(); i++) {
                            if (postId(link).equals(postId(sectionLink(shown.get(i))))) {
                                viewport = i;
                                break;
                            }
                        }
                    }
                    session.pager.getClass().getMethod("h", int.class).invoke(session.pager, viewport);
                    POSITIONS.put(session.pager, index);
                    FOCUS.put(session.pager, postId(link));
                    Log.i("VerticalFeed", "Synced feed section=" + index + " post=" + id);
                    return;
                }
                index++;
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("VerticalFeed", "Could not sync feed position", error);
        }
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

    /** Keep the media player's next-page flag in sync with the source feed, including its initial update. */
    public static Function1<Object, Object> wrapUpdate(Object source, Function1<Object, Object> original) {
        Session session = session(source);
        if (session == null) return original;
        return state -> {
            Object updated = original.invoke(state);
            try { return copyPager(updated, field(updated, "a"), (Boolean) field(updated, "b"), hasMore(session.pager)); }
            catch (ReflectiveOperationException | RuntimeException ignored) { return updated; }
        };
    }

    private static void update(Object source, Function1<Object, Object> transform)
            throws ReflectiveOperationException {
        source.getClass().getMethod("l", Function1.class).invoke(source, transform);
    }

    /** Use exactly the source feed pager request used by the normal near-bottom scroll handler. */
    public static boolean loadMore(Object source) {
        Session session = session(source);
        if (session == null) return false;
        MAIN.post(() -> {
            if (session.requesting || !SESSIONS.containsKey(session.token)) return;
            session.requesting = true;
            Object pager = session.pager;
            List<Object> previous = session.posts;
            try {
                update(source, state -> {
                    try { return copyPager(state, field(state, "a"), true, hasMore(pager)); }
                    catch (ReflectiveOperationException error) { return state; }
                });
                pager.getClass().getMethod("a").invoke(pager);
                pollPage(source, session, previous, android.os.SystemClock.uptimeMillis());
            } catch (ReflectiveOperationException | RuntimeException error) {
                finishPage(source, session, previous);
            }
        });
        return true;
    }

    private static void pollPage(Object source, Session session, List<Object> previous, long started) {
        MAIN.postDelayed(() -> {
            if (!SESSIONS.containsKey(session.token)) return;
            Object pager = session.pager;
            try {
                Object status = field(call(call(pager, "getState"), "getValue"), "c");
                long elapsed = android.os.SystemClock.uptimeMillis() - started;
                if ((elapsed < 500 || "qk1.s".equals(status.getClass().getName())) && elapsed < 30000) {
                    pollPage(source, session, previous, started);
                    return;
                }
                ArrayList<Object> posts = feedPosts(pager);
                ArrayList<Object> fresh = unseenPosts(posts, previous);
                // A page can contain only text/ads. Continue until media arrives or the feed ends/errors.
                if (fresh.isEmpty() && hasMore(pager) && !"qk1.q".equals(status.getClass().getName()) && elapsed < 30000) {
                    pager.getClass().getMethod("a").invoke(pager);
                    pollPage(source, session, previous, started);
                    return;
                }
                finishPage(source, session, posts);
            } catch (ReflectiveOperationException | RuntimeException error) {
                finishPage(source, session, previous);
            }
        }, 250);
    }

    private static void finishPage(Object source, Session session, List<Object> posts) {
        Object pager = session.pager;
        try {
            ArrayList<Object> fresh = unseenPosts(posts, session.posts);
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
            ArrayList<Object> combined = new ArrayList<>(session.posts);
            combined.addAll(fresh);
            session.posts = Collections.unmodifiableList(combined);
            Log.i("VerticalFeed", "Appended media=" + fresh.size() + " total=" + combined.size());
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        finally { session.requesting = false; }
    }

    /** Replace Reddit's discovered feed with the source feed's media snapshot. */
    public static Object initialMedia(Object source, Object original) {
        try {
            Object params = field(source, "g");
            Object data = field(params, "d");
            Session session = session(source);
            if (session == null) return original;
            List<Object> posts = session.posts;
            int initialIndex = session.initialIndex;
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

    /** Select Reddit's existing vertical pager for this custom media session. */
    public static Object verticalViewState(Object viewModel, Object state) {
        try {
            Object params = field(viewModel, "g");
            Object data = field(params, "d");
            Session session = session(viewModel);
            if (session == null) return state;
            Object pagerState = call(field(field(viewModel, "v"), "c"), "getValue");
            String currentId = string(field(pagerState, "e"));
            if (currentId != null && !currentId.equals(session.currentPost)) {
                session.currentPost = currentId;
                MAIN.post(() -> syncPosition(session, currentId));
            }
            Object current = field(state, "g");
            if (!"Horizontal".equals(String.valueOf(current))) {
                CUSTOM_STATES.put(state, Boolean.TRUE);
                return state;
            }
            @SuppressWarnings({"unchecked", "rawtypes"}) Object vertical =
                Enum.valueOf((Class) current.getClass(), "Vertical");
            Object[] values = new Object[15];
            for (int i = 0; i < values.length; i++)
                values[i] = field(state, String.valueOf((char) ('a' + i)));
            values[6] = vertical;
            for (Constructor<?> constructor : state.getClass().getConstructors()) {
                if (constructor.getParameterCount() == values.length) {
                    Object updated = constructor.newInstance(values);
                    CUSTOM_STATES.put(updated, Boolean.TRUE);
                    return updated;
                }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return state;
    }

    /** Reddit normally excludes the native tappable community overlay in vertical mode. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Object communityOrientation(Object renderer) {
        boolean custom = false;
        try { custom = CUSTOM_STATES.containsKey(field(renderer, "b")); }
        catch (ReflectiveOperationException | RuntimeException ignored) { }
        try {
            return Enum.valueOf((Class) Class.forName("com.reddit.fullbleedplayer.ui.ChainingMode"),
                custom ? "Vertical" : "Horizontal");
        } catch (ReflectiveOperationException error) { throw new IllegalStateException(error); }
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
