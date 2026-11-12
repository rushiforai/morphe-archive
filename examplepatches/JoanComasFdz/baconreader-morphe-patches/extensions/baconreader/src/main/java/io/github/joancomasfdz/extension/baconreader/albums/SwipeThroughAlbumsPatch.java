// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.albums;

import android.annotation.SuppressLint;
import android.view.MotionEvent;
import android.view.View;

import com.github.chrisbanes.photoview.PhotoView;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

import java.lang.reflect.Field;

/**
 * Swipe through albums.
 * <p>
 * BaconReader's Reddit gallery and Imgur album viewers go to the next and previous image only with the small arrows at
 * the screen's sides and the thumbnail strip. A horizontal swipe on the image, or on an Imgur album's video, now does
 * what the arrow on that side does: left for the next, right for the previous. The image view only reports a swipe
 * with one finger while the image isn't zoomed in, so a zoomed image still pans, and a pinch is never a swipe.
 */
@SuppressWarnings("unused")
public final class SwipeThroughAlbumsPatch {
    /** Shortest swipe, in dp, that changes image: a tap that slides a little doesn't. */
    private static final int MIN_DISTANCE_DP = 48;

    /** Longest swipe on a video, in milliseconds: a slower drag is no swipe. */
    private static final long MAX_SWIPE_MS = 1000;

    private SwipeThroughAlbumsPatch() {
    }

    /**
     * Injected at the end of RedditGalleryViewer.createView and ImgurGalleryViewer.createView, with the viewer, once
     * its views are set: its image (imageView), its arrows (backButton, forwardButton) and, in an Imgur album, its
     * video (playerView).
     */
    public static void attach(Object viewer) {
        try {
            View back = (View) field(viewer, "backButton");
            View forward = (View) field(viewer, "forwardButton");
            if (back == null || forward == null) return;
            PhotoView image = (PhotoView) field(viewer, "imageView");
            if (image != null) {
                float density = image.getResources().getDisplayMetrics().density;
                image.setOnSingleFlingListener((down, up, velocityX, velocityY) -> swipe(down, up, back, forward, density));
            }
            Field player = playerField(viewer);
            if (player != null) attachToVideo((View) player.get(viewer), back, forward);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not let the album swipe", ex);
        }
    }

    // The video plays in its own view, whose surface pauses and plays it on a tap: a swipe on it goes to the next or
    // previous item, and any other touch reaches the surface as before.
    @SuppressLint("ClickableViewAccessibility")
    private static void attachToVideo(View player, View back, View forward) throws ReflectiveOperationException {
        if (player == null) return;
        View surface = (View) player.getClass().getMethod("getVideoSurfaceView").invoke(player);
        if (surface == null) return;
        float density = surface.getResources().getDisplayMetrics().density;
        MotionEvent[] down = new MotionEvent[1];
        surface.setOnTouchListener((view, event) -> {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    if (down[0] != null) down[0].recycle();
                    down[0] = MotionEvent.obtain(event);
                    return false;
                case MotionEvent.ACTION_UP:
                    if (down[0] == null || event.getEventTime() - down[0].getEventTime() > MAX_SWIPE_MS
                            || !swipe(down[0], event, back, forward, density)) {
                        return false;
                    }
                    // The swipe isn't a tap: the surface gets a cancel instead of the lift, so it doesn't pause the
                    // video.
                    MotionEvent cancel = MotionEvent.obtain(event);
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    view.onTouchEvent(cancel);
                    cancel.recycle();
                    return true;
                default:
                    return false;
            }
        });
    }

    // A horizontal swipe long enough taps the arrow on its side, when the viewer shows it: none before the first image,
    // none after the last.
    private static boolean swipe(MotionEvent down, MotionEvent up, View back, View forward, float density) {
        if (down == null || up == null) return false;
        float dx = up.getX() - down.getX();
        float dy = up.getY() - down.getY();
        if (Math.abs(dx) < MIN_DISTANCE_DP * density || Math.abs(dx) < Math.abs(dy) * 2) return false;
        View arrow = dx < 0 ? forward : back;
        if (!arrow.isShown()) return false;
        return arrow.performClick();
    }

    private static Object field(Object viewer, String name) throws ReflectiveOperationException {
        Field field = viewer.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(viewer);
    }

    // Only Imgur albums have a video.
    private static Field playerField(Object viewer) {
        try {
            Field field = viewer.getClass().getDeclaredField("playerView");
            field.setAccessible(true);
            return field;
        } catch (NoSuchFieldException ex) {
            return null;
        }
    }
}
