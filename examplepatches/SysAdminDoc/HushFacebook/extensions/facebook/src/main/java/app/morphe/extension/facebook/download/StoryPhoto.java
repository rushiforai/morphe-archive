/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.content.Context;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The original picture of a photo Story with music (#38), and the Save photo item the story menu
 * gets for it beside Save. Facebook plays such a Story as a video made from the photo, and its
 * media model carries both: {@code playable_url}, the video, and {@code stories_photo_uri}, the
 * photo it was made from, whose {@code uri} Facebook shows instead when it reverts the Story to a
 * still (582: the PHOTO_REVERT_P2V card kind). A plain photo Story's media has the photo and no
 * video. A video Story's media can hold a {@code stories_photo_uri} too, as its cover (seen on
 * Instagram cross-posts), so the photo alone doesn't make a Story one made from a photo. Facebook's
 * own card kind asks one more thing first: that the story card's node holds the tree
 * {@link #MADE_FROM_PHOTO}, and only then calls it PHOTO_REVERT_P2V. A MobileConfig flag has a say
 * too (582 2NB.A0H), and without both Facebook calls the Story a video and its menu's Save gets
 * the video label (the #38 reporter's Turkish menu read "Reels videosunu kaydet"), so
 * Save photo on more stories (#38) offers the item on any Story whose media holds a video and a
 * photo, accepting that on a video Story the photo is its cover.
 *
 * <p>The story card's kept {@code getMedia} takes the video thumbnail whenever the media has a
 * video, so a save reading it never sees the photo. The media model itself is a field of the card,
 * cached there once {@code getMedia} has run, so it's found among the card's own trees by what it
 * holds, and read through the kept {@code getString} and {@code getTree} by the hash of each field's
 * GraphQL name, as {@link PostDetails} reads a post. No getter Redex renames is used.
 *
 * <p>The menu's builder makes Save photo as a copy of its Save item with a title of its own, so a
 * tap on it reaches the same action, which hands over the item tapped. The copies made here are
 * remembered, and a tap on one saves the photo while a tap on Save still saves the video.
 */
public final class StoryPhoto {
    static final int STORIES_PHOTO_URI = "stories_photo_uri".hashCode();
    static final int URI = "uri".hashCode();
    /**
     * The tree of a story card's node that Facebook's card kind needs, with the media's photo,
     * before it calls a Story PHOTO_REVERT_P2V (582 RegularStoryCard's card kind getter reads it
     * by this GraphQL id). The client never spells its name, so it's kept by the id.
     */
    static final int MADE_FROM_PHOTO = 0xaa18ee7f;

    /** Counted each time Save photo takes the CDN's bigger copy of a story's photo over its own. */
    static final String FULL_SIZE = "story photo saved at the CDN's full size";

    /**
     * The Save photo items the menu built, kept no longer than the menu keeps them and told apart
     * by identity, so an item class whose equals compares fields can't pass Save for Save photo.
     */
    private static final List<WeakReference<Object>> OFFERED = new ArrayList<>();

    private StoryPhoto() {
    }

    /** The primary Save item's custom title, preserving Facebook's when no override is needed. */
    public static String saveTitle(Object card, String original) {
        try {
            if (!Utils.settingsReady() || !Settings.DOWNLOAD_STORIES.get()) return original;
            return StoryOverlayVideo.in(card) == null ? original : L10n.t("Save video");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_DOWNLOAD, "story menu save title", failure);
            return original;
        }
    }

    /**
     * The address of the photo [card]'s Story was made from, when its node holds
     * {@link #MADE_FROM_PHOTO} and its media holds both a video and that photo. Null for a video
     * Story, a plain photo Story, a card whose media isn't cached in it or a released tree. Never
     * throws.
     */
    static String originalOf(Object card) {
        return PostDetails.string(photoOf(card, false), URI);
    }

    /**
     * The image of the photo [card]'s media holds beside its video, as {@link #originalOf} finds
     * it, or with [anyStory] (Save photo on more stories, #38) on any card whose media holds both,
     * whatever its node says: a photo Story with music that Facebook plays as a video and doesn't
     * mark as made from a photo, or a video Story's cover. Null when there's no such image or its
     * address is blank. Never throws.
     */
    static Object photoOf(Object card, boolean anyStory) {
        List<Object> trees = PostDetails.treesIn(card);
        if (!anyStory && !madeFromPhoto(trees)) return null;
        for (Object tree : trees) {
            if (!PostDetails.isLiveTree(tree) || PostDetails.string(tree, VideoMenuItem.PLAYABLE_URL) == null) continue;
            Object image = PostDetails.tree(tree, STORIES_PHOTO_URI);
            String uri = PostDetails.string(image, URI);
            if (uri != null && !uri.trim().isEmpty()) return image;
        }
        return null;
    }

    /** Whether Save photo on more stories is on. Asked only once the settings are ready. */
    private static boolean anyStory() {
        return Settings.SAVE_STORY_PHOTOS.get();
    }

    /** Whether any tree of [card] holds a video and a photo, made from it or not. For the log only. */
    private static boolean hasPhoto(Object card) {
        for (Object tree : PostDetails.treesIn(card)) {
            if (PostDetails.isLiveTree(tree) && PostDetails.string(tree, VideoMenuItem.PLAYABLE_URL) != null
                && PostDetails.tree(tree, STORIES_PHOTO_URI) != null) return true;
        }
        return false;
    }

    private static boolean madeFromPhoto(List<Object> trees) {
        for (Object tree : trees) {
            if (PostDetails.tree(tree, MADE_FROM_PHOTO) != null) return true;
        }
        return false;
    }

    /**
     * The title of the Save photo item the story menu adds beside Save, or null when the menu keeps
     * its single Save: Save any story off, paused or not ready, or a Story not made from a photo.
     * The viewer has asked the card for its media by the time its menu opens, which caches the
     * model; asking once more here makes sure. Never throws: it runs inside Facebook's menu code.
     */
    public static String menuTitle(Object card) {
        try {
            if (!Utils.settingsReady() || !Settings.DOWNLOAD_STORIES.get()) return null;
            media(card);
            boolean anyStory = anyStory();
            if (photoOf(card, anyStory) == null) {
                Logger.diagnosticDebug(DiagnosticCategory.DOWNLOADS, StoryPhoto.class.getSimpleName(),
                    () -> "a story's menu keeps one Save: made from a photo "
                        + madeFromPhoto(PostDetails.treesIn(card)) + ", photo " + hasPhoto(card)
                        + ", Save photo on more stories " + (anyStory ? "on" : "off"));
                return null;
            }
            HookStatus.bound(FamilyNames.STORY_DOWNLOAD, "story menu photo item");
            return L10n.t("Save photo");
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.STORY_DOWNLOAD, "story menu photo item", t);
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, StoryPhoto.class.getSimpleName(),
                () -> "could not add Save photo to a story's menu", t);
            return null;
        }
    }

    /** Remembers [item] as a Save photo item the menu's builder just made. Never throws. */
    public static void offered(Object item) {
        if (item == null) return;
        synchronized (OFFERED) {
            for (Iterator<WeakReference<Object>> each = OFFERED.iterator(); each.hasNext(); ) {
                if (each.next().get() == null) each.remove();
            }
            OFFERED.add(new WeakReference<>(item));
        }
    }

    /** Whether [item] is a Save photo item, rather than Facebook's own Save. */
    static boolean isOffered(Object item) {
        if (item == null) return false;
        synchronized (OFFERED) {
            for (WeakReference<Object> offered : OFFERED) {
                if (offered.get() == item) return true;
            }
        }
        return false;
    }

    /**
     * A tap on Save photo: saves the photo [card]'s Story was made from, at the biggest size Meta's
     * CDN serves it when Facebook's photo address modifier is filled ({@link PhotoSave#fullSize}),
     * else at the size the story shows it, or says it couldn't. Always answers true, since the item is Hushfacebook's and
     * Facebook's own save would only save the video. A tap after the switch went off does nothing.
     */
    static boolean save(Context context, Object card) {
        try {
            if (!Utils.settingsReady() || !Settings.DOWNLOAD_STORIES.get()) {
                Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, StoryPhoto.class.getSimpleName(),
                    () -> "Save photo tapped on a story after Save any story went off");
                return true;
            }
            Context application = context == null ? Utils.getContext() : context.getApplicationContext();
            Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, StoryPhoto.class.getSimpleName(),
                () -> "Save photo tapped on a story's menu");
            if (MediaDownload.busy(application)) return true;
            Object image = photoOf(card, anyStory());
            String own = PostDetails.string(image, URI);
            // The biggest copy Meta's CDN serves of the photo, as Save photo on a post takes (#38).
            String address = PhotoSave.fullSize(image);
            if (address != null && !address.equals(own)) HookStatus.counted(FamilyNames.STORY_DOWNLOAD, FULL_SIZE);
            if (!MediaDownload.savePhoto(application, address, PostDetails.ofCard(null, card))) {
                Feedback.show(application, L10n.t(application, "Couldn't save this story's photo. Try again in a moment."), true);
            }
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.STORY_DOWNLOAD, "story photo save", t);
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, StoryPhoto.class.getSimpleName(),
                () -> "the story's Save photo tap failed", t);
        }
        return true;
    }

    private static void media(Object card) {
        if (card == null) return;
        try {
            card.getClass().getMethod("getMedia").invoke(card);
        } catch (Throwable ignored) {
            // No getMedia, or it failed: the cached model, if any, is read as it is.
        }
    }
}
