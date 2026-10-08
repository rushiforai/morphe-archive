/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.content.Context;
import android.view.MenuItem;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Save photo in the photo viewer's menu, for any photo, through Hushfacebook's own save.
 *
 * <p>Facebook already has the item. It shows it only when the photo's {@code can_viewer_download}
 * is true, which the poster's settings decide, and the patch hands both of the viewer's reads of
 * that flag to {@link #offersSave}. A tap then runs the action the patch wraps with
 * {@link #saveAction}: the biggest of the photo's images goes to the folder picked for downloads.
 * When that can't start, Facebook's own save runs instead. A save that starts and then fails says
 * so, and Facebook's save doesn't run after it.
 *
 * <p>The photo is a GraphQL model and its images are read the way Facebook's code reads them, by
 * the hash of each field's GraphQL name, through the kept {@code getTree}, {@code getString} and
 * {@code getIntValue}. Nothing here names a class or member Redex renames.
 */
public final class PhotoSave {

    private PhotoSave() {}

    /** The source every event of the save carries in the diagnostic report. */
    static final String SOURCE = "PhotoSave";

    /**
     * The photo's images, by the field name whose hash Facebook's models look them up by. The
     * viewer's own save reads {@code imageHigh} (581 {@code LX/9v2;->BXO}); the others are smaller
     * copies of the same picture. The order is the tiebreak when the sizes aren't there to compare.
     */
    static final String[] IMAGE_NAMES = {"imageHigh", "image", "imageMedium", "imageLow"};
    static final int[] IMAGES = new int[IMAGE_NAMES.length];

    static {
        for (int i = 0; i < IMAGE_NAMES.length; i++) IMAGES[i] = IMAGE_NAMES[i].hashCode();
    }

    /** An image's address and size. */
    static final int URI = "uri".hashCode();
    static final int WIDTH = "width".hashCode();
    static final int HEIGHT = "height".hashCode();

    /**
     * The answer the photo viewer's menu gets when it asks whether this viewer may save the photo,
     * where Facebook's own [facebooks] is the poster's say. With Download any photo on, every
     * photo may be. Off, paused, or before the settings are ready, Facebook's answer stands. Never
     * throws.
     */
    public static boolean offersSave(boolean facebooks) {
        if (facebooks) return true;
        try {
            return Utils.settingsReady() && Settings.DOWNLOAD_PHOTOS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.PHOTO_DOWNLOAD, "save photo item", t);
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE,
                () -> "could not decide whether the photo menu offers Save photo", t);
            return false;
        }
    }

    /**
     * Facebook's Save photo action for [photo], wrapped so a tap saves through Hushfacebook first.
     * Never throws, and never null when [facebooks] isn't.
     */
    public static MenuItem.OnMenuItemClickListener saveAction(MenuItem.OnMenuItemClickListener facebooks, Object photo) {
        try {
            HookStatus.bound(FamilyNames.PHOTO_DOWNLOAD, "save photo action");
            return new Action(facebooks, photo);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.PHOTO_DOWNLOAD, "save photo action", t);
            return facebooks;
        }
    }

    /** The wrapped action. Ours when it starts, Facebook's when it doesn't. */
    static final class Action implements MenuItem.OnMenuItemClickListener {
        final MenuItem.OnMenuItemClickListener facebooks;
        final Object photo;

        Action(MenuItem.OnMenuItemClickListener facebooks, Object photo) {
            this.facebooks = facebooks;
            this.photo = photo;
        }

        @Override
        public boolean onMenuItemClick(MenuItem item) {
            if (save(Utils.getContext(), photo)) return true;
            return facebooks != null && facebooks.onMenuItemClick(item);
        }
    }

    /**
     * Saves [photo] the way a video saves: to the folder picked for downloads, with a
     * notification. Answers whether the save started. Off, paused, or before the settings are
     * ready it answers false and Facebook's save runs, as it would unpatched. Never throws.
     */
    static boolean save(Context context, Object photo) {
        try {
            if (!Utils.settingsReady() || !Settings.DOWNLOAD_PHOTOS.get()) return false;
            HookStatus.invoked(FamilyNames.PHOTO_DOWNLOAD);
            Logger.diagnosticDebug(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "Save photo images: " + sizes(photo));
            String url = largest(photo);
            if (url == null) {
                Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE,
                    () -> "the photo carried no image address, so Facebook's own save runs");
                return false;
            }
            Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "Save photo tapped");
            // The photo's own id, for a template that asks for it. A name uses it only when it's digits.
            return MediaDownload.savePhoto(context, url, PostDetails.read(PostDetails.string(photo, PostDetails.ID), photo));
        } catch (Throwable t) {
            // It runs inside Facebook's click dispatch, on the thread that draws the app.
            HookStatus.threw(FamilyNames.PHOTO_DOWNLOAD, "save photo tap", t);
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "the Save photo tap failed", t);
            return false;
        }
    }

    /**
     * The address of the biggest of [photo]'s images, by width times height, or null when it has
     * none. Images that state no size count as nothing, so a sized one wins, and among equals the
     * one earlier in {@link #IMAGES} does.
     */
    static String largest(Object photo) {
        if (!PostDetails.isLiveTree(photo)) return null;
        String best = null;
        long bestArea = -1;
        for (int field : IMAGES) {
            Object image = PostDetails.tree(photo, field);
            String uri = PostDetails.string(image, URI);
            if (uri == null || uri.isEmpty()) continue;
            long area = area(image);
            if (area > bestArea) {
                best = uri;
                bestArea = area;
            }
        }
        return best;
    }

    /**
     * Each of [photo]'s images by field name and size ("imageHigh 1536x2048, image unsized,
     * imageMedium none, ..."), for the Debug log. Only those words and numbers, never an address.
     */
    static String sizes(Object photo) {
        StringBuilder line = new StringBuilder();
        for (int i = 0; i < IMAGES.length; i++) {
            Object image = PostDetails.tree(photo, IMAGES[i]);
            String uri = PostDetails.string(image, URI);
            if (i > 0) line.append(", ");
            line.append(IMAGE_NAMES[i]).append(' ');
            if (uri == null || uri.isEmpty()) {
                line.append("none");
            } else {
                line.append(area(image) > 0 ? number(image, WIDTH) + "x" + number(image, HEIGHT) : "unsized");
            }
        }
        return line.toString();
    }

    /** [image]'s width times height, or 0 when either isn't stated. */
    private static long area(Object image) {
        int width = number(image, WIDTH);
        int height = number(image, HEIGHT);
        return width > 0 && height > 0 ? (long) width * height : 0;
    }

    private static int number(Object model, int field) {
        Object value = PostDetails.call(model, "getIntValue", field);
        return value instanceof Integer ? (Integer) value : 0;
    }
}
