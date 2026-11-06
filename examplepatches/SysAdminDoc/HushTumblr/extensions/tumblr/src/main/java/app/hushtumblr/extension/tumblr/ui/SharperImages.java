/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.net.Uri;

import androidx.annotation.Nullable;

import java.util.List;
import java.util.Locale;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Sharper images. Tumblr's server sends each image in a post in several sizes, and one method
 * picks the size it loads at from the width Tumblr asks for. On a phone Tumblr asks for no more
 * than 640 pixels across, and less again on a slow connection, so a photo across a 1080 pixel
 * screen is stretched and looks soft. The patch hands {@link #pick} the sizes, Tumblr's pick and
 * the width it asked for at each answer of that method. While the switch is on it answers the
 * largest size of the same picture up to twice the width asked for, which takes a 640 request to
 * Tumblr's 1280 copy, and Tumblr loads and caches that one its own way. The image opened full
 * screen already loads the original and keeps doing so.
 *
 * <p>Tumblr's pick stays while the switch is off, HushTumblr is paused, the settings aren't ready
 * or anything throws, and when the pick isn't one of the sizes or no larger size qualifies. A
 * still is never swapped for a GIF, a GIF never for a still, and neither for a size in another
 * shape. None over {@link #MAX_WIDTH} pixels across or {@link #MAX_PIXELS} pixels in all is
 * picked, and no GIF over {@link #MAX_GIF_PIXELS}, so one image can't take too much memory. The
 * width is the one Tumblr lays the image out at, before it shrinks the request for a slow
 * connection, so a slow connection gets the same copy. While the switch is on, each answer counts
 * its outcome under one of the names below on the diagnostic report's line for this patch.
 */
public final class SharperImages {
    /** The widest size this picks. Tumblr's originals go up to 2048 across. */
    static final int MAX_WIDTH = 2048;
    /** The most pixels a size this picks may hold, a 2048 by 3072 image's. */
    static final long MAX_PIXELS = 2048L * 3072L;
    /**
     * The most pixels a GIF this picks may hold, a 1280 by 960 one's. A playing GIF keeps a few
     * frames decoded at its size, so its cap sits far below a still's.
     */
    static final long MAX_GIF_PIXELS = 1280L * 960L;

    /** The step a failed pick is reported under. */
    static final String STEP = "image size";

    // What the diagnostic report counts for each answer while the switch is on. Fixed text only:
    // never an address.
    static final String UPGRADED = "upgraded";
    static final String GIF_UPGRADED = "GIF upgraded";
    static final String ALREADY_LARGEST = "pick already the largest";
    static final String NOT_LISTED = "pick not among the sizes";
    static final String NO_SIZES = "no sizes";
    static final String UNREADABLE = "pick's size unreadable";
    static final String BLANK = "pick empty";
    static final String OVER_CAP = "larger only past the cap";
    static final String OTHER_SHAPE = "larger only in another shape";
    static final String OTHER_KIND = "larger only still or only animated";

    private SharperImages() {
    }

    /**
     * Injected ahead of each answer of Tumblr's image size picker, with the image's sizes, the size
     * picked and the width Tumblr asked for. Answers a larger size of the same picture while the
     * switch is on, and Tumblr's pick otherwise. What it answers is always the pick itself or one
     * of [sizes]. Never throws.
     */
    public static Object pick(@Nullable List<?> sizes, @Nullable Object chosen, int width) {
        try {
            if (chosen == null || !on()) return chosen;
            Pick pick = choose(sizes, chosen, width);
            HookStatus.counted(FamilyNames.SHARPER_IMAGES, pick.outcome);
            return pick.size;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHARPER_IMAGES, STEP, failure);
            return chosen;
        }
    }

    /** The size to load, and the name its outcome is counted under. */
    static final class Pick {
        final Object size;
        final String outcome;

        Pick(Object size, String outcome) {
            this.size = size;
            this.outcome = outcome;
        }
    }

    /**
     * The largest of [sizes] of [chosen]'s kind (a still for a still, a GIF for a GIF) with its
     * shape, an address, and no more than twice [width] across (twice [chosen]'s own width when
     * Tumblr asked for none) within the caps, counted as upgraded, or [chosen] itself when there
     * are no sizes, it isn't one of them by address, its size can't be read or none is larger,
     * counted by why.
     */
    static Pick choose(@Nullable List<?> sizes, Object chosen, int width) {
        // Tumblr answers its own empty size when an image lists none, so this goes first.
        if (sizes == null || sizes.isEmpty()) return new Pick(chosen, NO_SIZES);
        if (!(chosen instanceof HushPhotoSize)) return new Pick(chosen, UNREADABLE);
        HushPhotoSize picked = (HushPhotoSize) chosen;
        String url = picked.getUrl();
        int pickedWidth = picked.getWidth();
        int pickedHeight = picked.getHeight();
        if (url == null || url.isEmpty() || pickedWidth <= 0 || pickedHeight <= 0) return new Pick(chosen, BLANK);
        boolean gif = animated(url);
        long most = gif ? MAX_GIF_PIXELS : MAX_PIXELS;
        long widest = Math.min(MAX_WIDTH, 2L * (width > 0 ? width : pickedWidth));
        long pickedPixels = (long) pickedWidth * pickedHeight;
        boolean listed = false;
        boolean overCap = false;
        boolean otherShape = false;
        boolean otherKind = false;
        Object best = chosen;
        long bestPixels = pickedPixels;
        for (Object candidate : sizes) {
            if (!(candidate instanceof HushPhotoSize)) continue;
            HushPhotoSize size = (HushPhotoSize) candidate;
            String candidateUrl = size.getUrl();
            if (candidateUrl == null || candidateUrl.isEmpty()) continue;
            if (url.equals(candidateUrl)) listed = true;
            int candidateWidth = size.getWidth();
            int candidateHeight = size.getHeight();
            if (candidateWidth <= 0 || candidateHeight <= 0) continue;
            long pixels = (long) candidateWidth * candidateHeight;
            boolean larger = pixels > pickedPixels;
            if (animated(candidateUrl) != gif) {
                otherKind |= larger;
                continue;
            }
            if (candidateWidth > widest || pixels > most) {
                overCap |= larger;
                continue;
            }
            if (!sameShape(candidateWidth, candidateHeight, pickedWidth, pickedHeight)) {
                otherShape |= larger;
                continue;
            }
            if (pixels > bestPixels) {
                best = candidate;
                bestPixels = pixels;
            }
        }
        if (!listed) return new Pick(chosen, NOT_LISTED);
        if (best != chosen) return new Pick(best, gif ? GIF_UPGRADED : UPGRADED);
        return new Pick(chosen, overCap ? OVER_CAP : otherShape ? OTHER_SHAPE : otherKind ? OTHER_KIND : ALREADY_LARGEST);
    }

    /** Whether [address] is a GIF's, by its path's ending; its query doesn't count. */
    static boolean animated(String address) {
        String path = Uri.parse(address).getPath();
        if (path == null) return false;
        String lower = path.toLowerCase(Locale.ROOT);
        return lower.endsWith(".gif") || lower.endsWith(".gifv");
    }

    /**
     * Whether a [width] by [height] size has the shape of an [otherWidth] by [otherHeight] one,
     * within 2 percent, which the server's rounding of each size stays inside. A square crop of a
     * tall image doesn't.
     */
    static boolean sameShape(int width, int height, int otherWidth, int otherHeight) {
        long one = (long) width * otherHeight;
        long other = (long) otherWidth * height;
        return Math.abs(one - other) * 50 <= Math.max(one, other);
    }

    private static boolean on() {
        if (!Utils.settingsReady() || !PatchFamily.Capability.IMAGE_SIZES.installed()) return false;
        HookStatus.invoked(FamilyNames.SHARPER_IMAGES);
        return Settings.SHARPER_IMAGES.get();
    }
}
