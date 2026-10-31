// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.postmedia;

import android.content.Context;
import android.view.Gravity;
import android.view.GestureDetector;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;
import io.github.joancomasfdz.extension.baconreader.DownloadProgress;
import io.github.joancomasfdz.extension.baconreader.GlideUtils;
import io.github.joancomasfdz.extension.baconreader.ImageDownloader;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * Reddit galleries.
 * <p>
 * BaconReader turns the small previews of the thumbnail strip into the full images
 * ("preview.redd.it" to "i.redd.it", as the previews' "&amp;" are not unescaped), so every
 * thumbnail downloads a full image, often a big GIF, and the image shown waits for them.
 * The strip now uses the previews, and the image shown is downloaded with a progress bar,
 * with its preview shown until it is loaded.
 */
@SuppressWarnings("unused")
public final class RedditGalleryPatch {
    /** Smallest preview width used for the thumbnail strip (it shows them at ~100dp). */
    private static final int MIN_PREVIEW_WIDTH = 216;

    /** The progress bar of each gallery viewer. */
    private static final Map<Object, DownloadProgress> PROGRESS = new WeakHashMap<>();
    /** The image each gallery viewer shows now, so a late download of another one is dropped. */
    private static final Map<Object, String> SHOWN = new WeakHashMap<>();

    private RedditGalleryPatch() {
    }

    /**
     * Injected in RedditGalleryViewer.getGalleryImages: which of an image's previews (smallest first)
     * the gallery uses, instead of the first, which is too small for the thumbnail strip.
     */
    public static int previewIndex(List<?> previews) {
        int index = 0;
        try {
            for (int i = 0; i < previews.size(); i++) {
                index = i;
                Object width = field(previews.get(i), "x");
                if (width != null && Integer.parseInt(width.toString()) >= MIN_PREVIEW_WIDTH) break;
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not choose the gallery preview", ex);
        }
        return index;
    }

    /**
     * Injected at the start of RedditImage.thumbnail: the preview itself, with its "&amp;" unescaped.
     *
     * @return The thumbnail URL, or null to let the app decide.
     */
    public static String thumbnail(Object redditImage) {
        try {
            String preview = (String) redditImage.getClass().getMethod("getImagePreview").invoke(redditImage);
            if (preview == null || !preview.startsWith("http")) return null;
            return preview.replace("&amp;", "&");
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not get the gallery preview", ex);
            return null;
        }
    }

    /**
     * Injected at the start of RedditGalleryViewer.glide(RedditImage), which loads the image shown.
     *
     * @return If the image is loaded here (the original method must then return).
     */
    public static boolean loadImage(final Object viewer, Object redditImage) {
        try {
            final String url = (String) redditImage.getClass().getMethod("getLink").invoke(redditImage);
            if (url == null || !url.startsWith("http")) return false;

            final ImageView imageView = (ImageView) field(viewer, "imageView");
            final View flipper = (View) field(viewer, "viewFlipper");
            Context context = imageView.getContext();
            final String preview = thumbnail(redditImage);
            final DownloadProgress progress = progress(viewer, flipper);
            SHOWN.put(viewer, url);

            // Long press saves the image, as in the original method.
            call(viewer, "handleCurrentItemSaving", new Class<?>[]{String.class}, url);

            if (ImageDownloader.cached(context, url) == null) {
                // Show the preview, with the progress bar, until the image is downloaded.
                progress.start();
                imageView.setImageDrawable(null);
                call(viewer, "showImage", new Class<?>[0]);
                if (preview != null) GlideUtils.load(imageView, preview, null, null);
            } else {
                progress.stop(); // A red bar of an image that could not be loaded.
            }

            ImageDownloader.download(context, url, new ImageDownloader.Listener() {
                @Override
                public void onProgress(long received, long total) {
                    if (url.equals(SHOWN.get(viewer))) progress.update(received, total);
                }

                @Override
                public void onDownloaded(File file) {
                    if (!url.equals(SHOWN.get(viewer))) return;
                    progress.stop();
                    show(viewer, imageView, file, url, preview);
                }

                @Override
                public void onFailed() {
                    if (!url.equals(SHOWN.get(viewer))) return;
                    progress.stop();
                    show(viewer, imageView, null, url, preview);
                }
            });
            return true;
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not load the gallery image", ex);
            return false;
        }
    }

    /**
     * Shows the downloaded image, or lets Glide load it if the download failed.
     */
    private static void show(final Object viewer, final ImageView imageView, File file, String url, String preview) {
        GlideUtils.LoadCallback callback = new GlideUtils.LoadCallback() {
            @Override
            public void onReady() {
                // As the app's own listener: double tap zooms, and the image replaces the spinner.
                try {
                    Object doubleTap = call(viewer, "access$200", new Class<?>[]{viewer.getClass()}, viewer);
                    imageView.getClass().getMethod("setOnDoubleTapListener", GestureDetector.OnDoubleTapListener.class)
                            .invoke(imageView, doubleTap);
                } catch (Exception ex) {
                    Logger.printInfo(() -> "Could not set the double tap listener", ex);
                }
                showImage(viewer);
            }

            @Override
            public void onFailed() {
                showImage(viewer);
                DownloadProgress progress = PROGRESS.get(viewer);
                if (progress != null) progress.fail();
            }
        };
        try {
            if (file != null) GlideUtils.load(imageView, file, preview, callback);
            else GlideUtils.load(imageView, url, preview, callback);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show the gallery image", ex);
        }
    }

    private static void showImage(Object viewer) {
        try {
            call(viewer, "showImage", new Class<?>[0]);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not show the gallery image", ex);
        }
    }

    /** The progress bar of the viewer, at the bottom of the image. */
    private static DownloadProgress progress(Object viewer, View flipper) {
        DownloadProgress progress = PROGRESS.get(viewer);
        if (progress != null) return progress;
        progress = new DownloadProgress(flipper.getContext());
        ViewGroup parent = (ViewGroup) flipper.getParent();
        parent.addView(progress.root, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
        PROGRESS.put(viewer, progress);
        return progress;
    }

    // region Reflection (the app's classes are not on the compile classpath)

    private static Object field(Object target, String name) throws Exception {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static Object call(Object target, String name, Class<?>[] parameterTypes, Object... arguments)
            throws Exception {
        Method method = target.getClass().getDeclaredMethod(name, parameterTypes);
        method.setAccessible(true);
        return method.invoke(java.lang.reflect.Modifier.isStatic(method.getModifiers()) ? null : target, arguments);
    }

    // endregion
}
