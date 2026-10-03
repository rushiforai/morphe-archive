/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

import java.util.ArrayList;
import java.util.List;

/**
 * Instagram's media model, read for a save. Instagram's getters have shortened names that change
 * with every release, so none is named here: each method below answers null as built, and the
 * download patch writes its body at patch time, as a call to the getter it finds by the field it
 * reads. A method whose body wasn't written answers null, and a save then has nothing to go on and
 * says so.
 *
 * <p>Every argument is Instagram's own object, handed over as an Object, of the type the method
 * names. The written bodies cast it, so a wrong type throws, and the callers catch that.
 */
@SuppressWarnings({"unused", "SameReturnValue"})
public final class InstagramMedia {
    private InstagramMedia() {
    }

    /** A Media's {@code video_versions}: the single MP4 files Instagram lists for its video. */
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

    /** A Media's {@code image_versions2}: the sizes Instagram lists for its picture. */
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

    /** The Media a story's menu is open on, read off the menu's helper, or null for a story with none. */
    public static Object storyMedia(Object menu) {
        return null;
    }

    /** The post a feed menu's builder is building rows for, read off its state. */
    public static Object feedMenuMedia(Object menu) {
        return null;
    }

    /** What Instagram keeps about that post in the feed, read off the builder's state. */
    public static Object feedMenuItemState(Object menu) {
        return null;
    }

    /** The page of a carousel a post's feed state says is on screen, counting from 0, or -1 as built. */
    public static int carouselIndex(Object itemState) {
        return -1;
    }

    /**
     * Adds Instagram's own Download row to [rows], the feed menu's list, the way its builder adds it
     * for your own posts. The patch replaces this body.
     */
    public static void addDownloadRow(Object menu, ArrayList<?> rows) {
    }

    /** A distinct menu option with Download's icon and ordinal, made by its native constructor. */
    public static Object saveAllOption() {
        return null;
    }

    /** Adds a separate labeled row through the same native adder that creates Download. */
    public static void addSaveAllRow(Object menu, ArrayList<?> rows, Object option, CharSequence label) {
    }
}
