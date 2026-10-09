/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.content.Context;
import android.net.Uri;
import android.view.MenuItem;

import androidx.annotation.Nullable;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
 * {@link #saveAction}: the biggest copy of the photo goes to the folder picked for downloads.
 * When that can't start, Facebook's own save runs instead. A save that starts and then fails says
 * so, and Facebook's save doesn't run after it.
 *
 * <p>The photo is a GraphQL model and its images are read the way Facebook's code reads them, by
 * the hash of each field's GraphQL name, through the kept {@code getTree}, {@code getString} and
 * {@code getIntValue}. Nothing here names a class or member Redex renames.
 *
 * <p>The biggest copy is often bigger than any the model holds. Facebook's own save hands the
 * imageHigh address to the app's image address modifier, which asks Meta's CDN for a bigger size
 * than the address names, up to the most the CDN serves that image at. The patch fills
 * {@link #cdnResized} with that same call, and {@link #saveAddress} asks it for the most. The CDN
 * sends that copy as AVIF, which {@link PhotoFormat} turns into a JPEG before it's saved; on
 * Android 11, which can't read AVIF, the largest copy goes instead.
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
     * The query parameters of a CDN address the modifier reads: {@code cstp}, the most the CDN
     * serves the image at ({@code mx1536x2048}), and {@code ctp}, the size the address asks for,
     * its first part ({@code s1080x1440}, or {@code p} for a crop). The patterns are Facebook's own.
     */
    static final String MOST = "cstp";
    static final String ASKED = "ctp";
    private static final Pattern MOST_SIZE = Pattern.compile("mx(\\d+)x(\\d+)");
    private static final Pattern ASKED_SIZE = Pattern.compile("[spk](\\d+)x(\\d+)");

    /** Counted each time a save takes the CDN's bigger copy over the model's largest. */
    static final String FULL_SIZE = "photo saved at the CDN's full size";

    /** Facebook's modifier in its place, for tests, where the stub has nothing behind it. */
    @Nullable
    static volatile Resizer resizerForTests;

    interface Resizer {
        @Nullable
        Uri resize(Uri address, int width, int height);
    }

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
            String url = saveAddress(photo);
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
     * The address a save of [photo] takes: the CDN's copy of its imageHigh image at the most the
     * CDN serves it, when the modifier gives one that asks for more pixels than the photo's largest
     * copy holds, and the largest copy otherwise. Null when the photo has no image address at all.
     */
    @Nullable
    static String saveAddress(Object photo) {
        Object largest = largestImage(photo);
        String fallback = largest == null ? null : PostDetails.string(largest, URI);
        if (!PostDetails.isLiveTree(photo)) return fallback;
        if (!PhotoFormat.readsAvif()) {
            Logger.diagnosticDebug(DiagnosticCategory.DOWNLOADS, SOURCE,
                () -> "Save photo: the CDN sends its bigger copies as AVIF, which this Android can't read, so the largest copy goes");
            return fallback;
        }
        String resized = resized(PostDetails.string(PostDetails.tree(photo, IMAGES[0]), URI));
        if (resized == null) {
            Logger.diagnosticDebug(DiagnosticCategory.DOWNLOADS, SOURCE,
                () -> "Save photo: the CDN offered no bigger copy, so the largest copy goes");
            return fallback;
        }
        long held = largest == null ? 0 : area(largest);
        if (fallback != null && askedArea(resized) <= held) {
            Logger.diagnosticDebug(DiagnosticCategory.DOWNLOADS, SOURCE,
                () -> "Save photo: the CDN's copy asks for no more than the largest copy, which goes");
            return fallback;
        }
        HookStatus.counted(FamilyNames.PHOTO_DOWNLOAD, FULL_SIZE);
        String largestSize = largest == null ? "none" : number(largest, WIDTH) + "x" + number(largest, HEIGHT);
        Logger.diagnosticDebug(DiagnosticCategory.DOWNLOADS, SOURCE,
            () -> "Save photo: the CDN's copy at " + askedSize(resized) + " goes, over the largest copy's " + largestSize);
        return resized;
    }

    /**
     * [address] as the modifier rewrites it to ask for the most the CDN serves it at, or null when
     * it names no such most, the modifier changes nothing, or it fails. Never throws.
     */
    @Nullable
    static String resized(@Nullable String address) {
        if (address == null || address.isEmpty()) return null;
        try {
            Uri uri = Uri.parse(address);
            if (!uri.isHierarchical()) return null;
            int[] most = size(uri.getQueryParameter(MOST), MOST_SIZE);
            if (most == null) return null;
            Resizer forced = resizerForTests;
            Uri answer = forced != null ? forced.resize(uri, most[0], most[1]) : cdnResized(uri, most[0], most[1]);
            return answer == null || answer.equals(uri) ? null : answer.toString();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.PHOTO_DOWNLOAD, "photo address modifier", t);
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE,
                () -> "Facebook's photo address modifier failed, so the largest copy goes", t);
            return null;
        }
    }

    /**
     * Filled in by the patch: Facebook's image address modifier's answer for [address] asked to
     * fit [width] by [height], made the way Facebook's own Save photo makes it. Null until filled.
     */
    @Nullable
    public static Uri cdnResized(Uri address, int width, int height) {
        return null;
    }

    /** The pixels [address]'s {@code ctp} asks the CDN for, or 0 when it names no size. */
    static long askedArea(String address) {
        int[] asked = askedDimensions(address);
        return asked == null ? 0 : (long) asked[0] * asked[1];
    }

    private static String askedSize(String address) {
        int[] asked = askedDimensions(address);
        return asked == null ? "an unstated size" : asked[0] + "x" + asked[1];
    }

    @Nullable
    private static int[] askedDimensions(String address) {
        try {
            Uri uri = Uri.parse(address);
            return uri.isHierarchical() ? size(uri.getQueryParameter(ASKED), ASKED_SIZE) : null;
        } catch (RuntimeException e) {
            return null;
        }
    }

    /** The width and height [pattern] finds in [value], or null when it finds none above 0. */
    @Nullable
    static int[] size(@Nullable String value, Pattern pattern) {
        if (value == null) return null;
        Matcher found = pattern.matcher(value);
        if (!found.find()) return null;
        try {
            int width = Integer.parseInt(found.group(1));
            int height = Integer.parseInt(found.group(2));
            return width > 0 && height > 0 ? new int[] {width, height} : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    /**
     * The address of the biggest of [photo]'s images, by width times height, or null when it has
     * none. Images that state no size count as nothing, so a sized one wins, and among equals the
     * one earlier in {@link #IMAGES} does.
     */
    static String largest(Object photo) {
        Object image = largestImage(photo);
        return image == null ? null : PostDetails.string(image, URI);
    }

    @Nullable
    private static Object largestImage(Object photo) {
        if (!PostDetails.isLiveTree(photo)) return null;
        Object best = null;
        long bestArea = -1;
        for (int field : IMAGES) {
            Object image = PostDetails.tree(photo, field);
            String uri = PostDetails.string(image, URI);
            if (uri == null || uri.isEmpty()) continue;
            long area = area(image);
            if (area > bestArea) {
                best = image;
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
