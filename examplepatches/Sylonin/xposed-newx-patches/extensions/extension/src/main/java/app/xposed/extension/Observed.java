package app.xposed.extension;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * What X has already loaded and the filters need later: profile details that timeline users
 * lack, post languages and the signed-in account. Kept in memory only and never sent
 * anywhere, like X-Posed's profile cache.
 */
final class Observed {
    /** Details only a profile page loads. */
    static final class Profile {
        final String location, website;
        /** Posts written, or -1. */
        final long posts;

        Profile(String location, String website, long posts) {
            this.location = location;
            this.website = website;
            this.posts = posts;
        }

        boolean sameAs(Profile other) {
            return Objects.equals(location, other.location) && Objects.equals(website, other.website) && posts == other.posts;
        }

        boolean isUnknown() {
            return location == null && website == null && posts < 0;
        }
    }

    private static final Map<Long, Profile> profiles = lru(2000);
    private static final Map<Long, String> languages = lru(5000);
    /** Which post replies to or quotes which, for hiding replies and quotes of filtered posts. */
    static final PostRelations RELATIONS = new PostRelations();
    private static volatile long viewer;

    private Observed() {
    }

    private static <K, V> Map<K, V> lru(int limit) {
        return new LinkedHashMap<K, V>(64, 0.75f, true) {
            @Override
            protected boolean removeEldestEntry(Map.Entry<K, V> eldest) {
                return size() > limit;
            }
        };
    }

    /** Called when X creates a ProfileUser, on whichever thread loads it. Kept only while "Use profile details" is on. */
    static void profileUser(Object user) {
        if (!Settings.sources().profileDetails) return;
        store(ModelBridge.userId(user),
                new Profile(ModelBridge.profileLocation(user), ModelBridge.website(user), ModelBridge.postCount(user)), true);
    }

    /**
     * Called before X maps a GraphQL user from a timeline to its user model, which drops the
     * profile part. That part is there when {@link ProfileInfo} asked for it.
     */
    static void graphqlUser(Object user) {
        if (!Settings.sources().profileDetails) return;
        Object part = ModelBridge.graphqlProfile(user);
        if (part == null) return;
        String location = ModelBridge.profileOnlyLocation(part);
        if (location != null) location = location.trim();
        Long posts = ModelBridge.profileOnlyPostCount(part);
        store(ModelBridge.graphqlUserId(user), new Profile(location == null || location.isEmpty() ? null : location,
                website(ModelBridge.profileOnlyWebsite(part), ModelBridge.profileOnlyUrls(part)),
                posts != null ? posts : -1), false);
    }

    /** The link behind the profile's t.co website, as X's profile shows it; null when it isn't among the profile's links. */
    private static String website(String shortUrl, List<?> entities) {
        if (shortUrl == null || entities == null) return null;
        for (Object entity : entities) {
            if (shortUrl.equals(ModelBridge.urlsEntityUrl(entity))) return ModelBridge.urlsEntityExpanded(entity);
        }
        return null;
    }

    /**
     * Keeps the profile unless it changed, since verdicts compare it by identity. A timeline's
     * copy without any detail (the server drops them under load) doesn't replace a known one.
     */
    private static void store(long id, Profile profile, boolean complete) {
        if (id == 0) return;
        synchronized (profiles) {
            Profile known = profiles.get(id);
            if (known != null && (known.sameAs(profile) || !complete && profile.isUnknown())) return;
            profiles.put(id, profile);
        }
    }

    static Profile profile(long userId) {
        synchronized (profiles) {
            return profiles.get(userId);
        }
    }

    /** Forgets every profile's details, as X-Posed does when profile details are turned off. */
    static void clearProfiles() {
        synchronized (profiles) {
            profiles.clear();
        }
    }

    /** Called when X creates a CanonicalPost, on whichever thread loads it. */
    static void canonicalPost(Object post) {
        long id = ModelBridge.canonicalPostId(post);
        if (id == 0) return;
        String language = ModelBridge.language(post);
        if (language != null) {
            synchronized (languages) {
                languages.put(id, language);
            }
        }
        Object author = ModelBridge.canonicalAuthor(post);
        String handle = author != null ? FilterText.handle(ModelBridge.screenName(author)) : null;
        long authorId = author != null ? ModelBridge.userId(author) : 0;
        Users.put(authorId, handle);
        RELATIONS.put(new PostRelations.Relation(id, authorId, handle, language, ModelBridge.repliedPostId(post),
                FilterText.handle(ModelBridge.repliedToHandle(post)), ModelBridge.quotedPostId(post)));
    }

    /** The language X detected for a post, or null. */
    static String language(long postId) {
        if (postId == 0) return null;
        synchronized (languages) {
            return languages.get(postId);
        }
    }

    static void viewer(long userId) {
        if (userId != 0) viewer = userId;
    }

    /** The signed-in account, which no filter applies to; 0 until a post showed it. */
    static long viewer() {
        return viewer;
    }
}
