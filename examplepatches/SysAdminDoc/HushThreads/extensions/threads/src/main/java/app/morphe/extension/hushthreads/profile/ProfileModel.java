/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.profile;

/**
 * What {@link ProfilePicture} reads of Threads to find a profile's picture. The calls behind these
 * have shortened names that change with every release, so none is named here: each method answers
 * null, 0 or nothing as built, and the Full size profile pictures patch writes its body at patch
 * time, as the same call Threads' own enlarged picture makes. A method whose body wasn't written
 * answers null, and the viewer then leaves the picture to Threads.
 *
 * <p>Every argument is the app's own object, handed over as an Object of the type the method names.
 * The written bodies cast it, so a wrong type throws, and {@link ProfilePicture} catches that.
 */
@SuppressWarnings({"unused", "SameReturnValue"})
public final class ProfileModel {
    private ProfileModel() {
    }

    /** The signed-in account's session, read from the Compose [composer] the way the enlarged picture reads it. */
    public static Object session(Object composer) {
        return null;
    }

    /** The account's cache of the users Threads has loaded, for a [session]. */
    public static Object userCache(Object session) {
        return null;
    }

    /** The user with the id [userId] in [cache], or null when Threads hasn't loaded them. */
    public static Object cachedUser(Object cache, String userId) {
        return null;
    }

    /** A User's {@code hd_profile_pic_url_info}: the largest size of their picture, or null. */
    public static Object hdPicture(Object user) {
        return null;
    }

    /** A User's {@code profile_pic_url}: the picture Threads draws in a circle. */
    public static Object picture(Object user) {
        return null;
    }

    /** A User's {@code username}. */
    public static String username(Object user) {
        return null;
    }

    /** The address of an {@code hd_profile_pic_url_info}. */
    public static String hdUrl(Object info) {
        return null;
    }

    /** The address of a picture Threads draws. */
    public static String pictureUrl(Object image) {
        return null;
    }

    /** Runs Threads' own callback that puts the enlarged picture away. Does nothing as built. */
    public static void dismiss(Object callback) {
    }
}
