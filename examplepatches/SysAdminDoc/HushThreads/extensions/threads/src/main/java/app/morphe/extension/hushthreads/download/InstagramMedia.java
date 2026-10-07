/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b646 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.extension.hushthreads.download;

import java.util.List;

/**
 * Instagram's media model, which Threads posts are built on, read for a save. Its getters have
 * shortened names that change with every release, so none is named here: each method below
 * answers null or 0 as built, and the save patch writes its body at patch time, as a call to
 * the getter it finds by the field it reads. A method whose body wasn't written answers null, and
 * a save then has nothing to go on and says so.
 *
 * <p>Every argument is the app's own object, handed over as an Object, of the type the method
 * names. The written bodies cast it, so a wrong type throws, and the callers catch that.
 */
@SuppressWarnings({"unused", "SameReturnValue"})
public final class InstagramMedia {
    private InstagramMedia() {
    }

    /** A Media's {@code video_versions}: the single MP4 files Threads lists for its video. */
    public static List<?> videoVersions(Object media) {
        return null;
    }

    /** A Media's {@code video_dash_manifest}: the DASH manifest its player streams, as text. */
    public static String dashManifest(Object media) {
        return null;
    }

    /** A Media's id, {@code <media pk>_<owner's pk>}. */
    public static String mediaId(Object media) {
        return null;
    }

    /** A Media's {@code user}: who posted it. */
    public static Object owner(Object media) {
        return null;
    }

    /** A Media's {@code taken_at}: when it was posted, in seconds since 1970. */
    public static Long takenAt(Object media) {
        return null;
    }

    /** A User's {@code username}. */
    public static String username(Object user) {
        return null;
    }

    /** A video version's {@code url}. */
    public static String versionUrl(Object version) {
        return null;
    }

    /** A video version's {@code width}, in pixels. */
    public static Integer versionWidth(Object version) {
        return null;
    }

    /** A video version's {@code height}, in pixels. */
    public static Integer versionHeight(Object version) {
        return null;
    }

    /** A Media's {@code carousel_media}: the pages of a carousel post, in order, or null for any other post. */
    public static List<?> carouselMedia(Object media) {
        return null;
    }

    /** A Media's {@code image_versions2}: the sizes Threads lists for its picture. */
    public static Object imageVersions(Object media) {
        return null;
    }

    /** The {@code candidates} of a picture's sizes, one per size. */
    public static List<?> imageCandidates(Object imageVersions) {
        return null;
    }

    /** A candidate's address. */
    public static String candidateUrl(Object candidate) {
        return null;
    }

    /** A candidate's width in pixels, or 0 as built. */
    public static int candidateWidth(Object candidate) {
        return 0;
    }

    /** A candidate's height in pixels, or 0 as built. */
    public static int candidateHeight(Object candidate) {
        return 0;
    }
}
