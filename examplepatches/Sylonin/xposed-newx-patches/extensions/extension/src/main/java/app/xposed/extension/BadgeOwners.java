package app.xposed.extension;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Whose account, and which post, each badge list X builds belongs to. X builds every user's
 * badge list in one function; the patch reports its user and its result, so name rows that show
 * no handle (the profile header, chat headers) still get the badge. Just before a post header
 * builds its list, the patch reports the post (or the post's time), so the share button knows
 * which post it captures. Lists compare equal across accounts, so they are told apart by
 * identity.
 */
final class BadgeOwners {
    static final class Owner {
        final String handle;
        /** The post whose header the list is for, or 0. */
        final long postId;

        Owner(String handle, long postId) {
            this.handle = handle;
            this.postId = postId;
        }
    }

    /** What the patch reported for the badge list being built on this thread. */
    private static final class Frame {
        Object pendingPost, pendingTime;
        Object user, post, time;
    }

    private static final ThreadLocal<Frame> frames = ThreadLocal.withInitial(Frame::new);
    private static final WeakIdentityMap<Owner> owners = new WeakIdentityMap<>();
    private static final long AMBIGUOUS = -1;
    /** Post ids by author and time, from the posts X shows. */
    private static final Map<String, Long> posts = new LinkedHashMap<String, Long>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Long> eldest) {
            return size() > 4000;
        }
    };

    private BadgeOwners() {
    }

    /** The AvailablePost whose author's list is built next. */
    static void pendingPost(Object post) {
        Frame f = frames.get();
        f.pendingPost = post;
        f.pendingTime = null;
    }

    /** The time (a kotlin.time.Instant) of the post whose author's list is built next. */
    static void pendingTime(Object instant) {
        Frame f = frames.get();
        f.pendingTime = instant;
        f.pendingPost = null;
    }

    /** X starts building the badge list of [user]. */
    static void begin(Object user) {
        Frame f = frames.get();
        f.user = user;
        f.post = f.pendingPost;
        f.time = f.pendingTime;
        f.pendingPost = null;
        f.pendingTime = null;
    }

    /**
     * X built [list] for the user given to {@link #begin}. Returns the list to use: the same
     * one, or a new empty list in place of X's shared empty one, so it has an identity of its own.
     */
    static Object end(Object list) {
        Frame f = frames.get();
        Object user = f.user, post = f.post, time = f.time;
        f.user = null;
        f.post = null;
        f.time = null;
        if (user == null || !(list instanceof List)) return list;
        String handle = FilterText.handle(ModelBridge.screenName(user));
        if (handle == null) return list;
        long postId = 0;
        if (post != null) {
            if (ModelBridge.postAuthor(post) == user) postId = ModelBridge.postId(post);
        } else if (time != null) {
            postId = postAt(handle, ModelBridge.instantMillis(time));
        }
        Object result = ((List<?>) list).isEmpty() ? ComposeBridge.emptyImmutableList() : list;
        synchronized (owners) {
            owners.put(result, new Owner(handle, postId));
        }
        return result;
    }

    /** Whose a badge list is, or null when X built it some other way. */
    static Owner owner(Object list) {
        synchronized (owners) {
            return owners.get(list);
        }
    }

    /** Notes a post X shows (an AvailablePost), so its header can be matched by author and time. */
    static void post(Object post) {
        if (post == null) return;
        String handle = FilterText.handle(ModelBridge.screenName(ModelBridge.postAuthor(post)));
        long millis = ModelBridge.instantMillis(ModelBridge.postTime(post));
        long id = ModelBridge.postId(post);
        if (handle != null) register(handle, millis, id);
    }

    /** Two posts by one author at the same moment can't be told apart; neither gets a share button. */
    static void register(String handle, long millis, long postId) {
        if (millis == 0 || postId <= 0) return;
        String key = key(handle, millis);
        synchronized (posts) {
            Long known = posts.get(key);
            posts.put(key, known == null || known == postId ? postId : AMBIGUOUS);
        }
    }

    /** The post [handle] made at [millis], or 0 when unknown or ambiguous. */
    static long postAt(String handle, long millis) {
        if (handle == null || millis == 0) return 0;
        Long id;
        synchronized (posts) {
            id = posts.get(key(handle, millis));
        }
        return id != null && id > 0 ? id : 0;
    }

    private static String key(String handle, long millis) {
        return handle.toLowerCase(Locale.ROOT) + '@' + millis;
    }
}
