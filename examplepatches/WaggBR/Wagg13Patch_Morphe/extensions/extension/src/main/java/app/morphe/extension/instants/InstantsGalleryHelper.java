package app.morphe.extension.instants;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Outline;
import android.graphics.drawable.GradientDrawable;
import android.media.MediaMetadataRetriever;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.widget.FrameLayout;
import android.widget.ImageButton;

import java.io.File;
import java.lang.ref.WeakReference;

/**
 * Native bridge used by the Instants Morphe patch.
 *
 * Adds a small native gallery button over the camera (visible only on the Home route),
 * lets the user pick an image, and substitutes it for the camera bitmaps on the next
 * shutter press.
 */
public final class InstantsGalleryHelper {
    private static final int BUTTON_ID = 0x57414747;
    private static final int PICKER_REQUEST = 0x5741;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static volatile Bitmap pendingBitmap;

    // A video picked from the gallery: the file (a private copy), its thumbnail and its stored size.
    private static File pendingVideoFile;
    private static Bitmap pendingVideoThumbnail;
    private static int pendingVideoWidth;
    private static int pendingVideoHeight;
    // Size to report for the video that replaced the recording, see substituteVideo.
    private static boolean videoSizeApplied;
    private static int videoSizeA;
    private static int videoSizeB;
    // True while the capture being posted is the gallery's, so the app's "save to photos" leaves the
    // camera roll alone (the picked photo or video is already on the device). Set by every
    // substitution, so the next real capture clears it again.
    private static boolean galleryCapture;
    // False while a screen other than the camera (Home) is on top of the navigation stack.
    private static volatile boolean cameraRoute = true;
    private static ImageButton button;

    private InstantsGalleryHelper() {}

    public static void setActivity(Activity activity) {
        activityRef = new WeakReference<>(activity);
    }

    static Activity getActivity() {
        return activityRef.get();
    }

    /**
     * Called by the patched navigator whenever the top route changes (forward or back).
     * The gallery button belongs to the camera, which is the Home route; every other
     * route (settings, archive, ...) draws on top of it and must hide the button.
     */
    public static void onRoute(Object route) {
        cameraRoute = route == null || route.getClass().getName().endsWith("MoonshotRoute$Home");
        MAIN.post(InstantsGalleryHelper::applyVisibility);
        InstantsGoBack.onRoute();
    }

    /** True while the Home route (camera and friends' viewer) is on top of the navigation stack. */
    static boolean isHomeRoute() {
        return cameraRoute;
    }

    // The button belongs to the camera: it is hidden on other routes and while the friends' viewer
    // is what the Home route shows (the viewer has its reply bar where the button sits).
    private static void applyVisibility() {
        ImageButton b = button;
        if (b != null) {
            b.setVisibility(cameraRoute && !InstantsGoBack.isViewerOnScreen() ? View.VISIBLE : View.GONE);
        }
    }

    /** Re-applies the visibility, for when the screen shown by the Home route changes. */
    static void refreshVisibility() {
        applyVisibility();
    }

    /** Called every time the camera's control buttons are composed. */
    public static void onCameraComposed() {
        InstantsGoBack.onCameraComposed();
        ensureGalleryButton();
    }

    /**
     * Called by the patched "photo captured" callback with the camera's bitmap. When an image
     * was picked from the gallery it is returned instead, and released: it is used for one
     * capture only. A private mutable copy is handed out because the app draws on and recycles
     * the bitmaps it receives.
     */
    public static synchronized Bitmap substituteCaptured(Bitmap original) {
        Bitmap source = pendingBitmap;
        galleryCapture = source != null;
        if (source == null) return original;
        Bitmap copy = source.copy(Bitmap.Config.ARGB_8888, true);
        if (copy == null) {
            galleryCapture = false;
            return original;
        }
        pendingBitmap = null;
        refreshButton(source);
        return copy;
    }

    /**
     * Called by the patched "save to photos" step before it writes the capture to the gallery.
     * True when the capture being saved came from the gallery. Not cleared here: one capture can
     * try more than one save (the JPEG path falls back to the Bitmap one), and all must be skipped.
     */
    public static synchronized boolean isGalleryCapture() {
        return galleryCapture;
    }

    public static synchronized void setPendingBitmap(Bitmap bitmap) {
        Bitmap old = pendingBitmap;
        Bitmap oldThumbnail = takePendingVideo();
        pendingBitmap = bitmap;
        refreshButton(old, oldThumbnail);
    }

    /** Long-pressing the gallery shortcut cancels the pending media selection. */
    public static synchronized void clearPendingMedia() {
        Bitmap old = pendingBitmap;
        pendingBitmap = null;
        refreshButton(old, takePendingVideo());
    }

    public static synchronized void setPendingVideo(File file, Bitmap thumbnail, int width, int height) {
        Bitmap old = pendingBitmap;
        Bitmap oldThumbnail = takePendingVideo();
        pendingBitmap = null;
        pendingVideoFile = file;
        pendingVideoThumbnail = thumbnail;
        pendingVideoWidth = width;
        pendingVideoHeight = height;
        refreshButton(old, oldThumbnail);
    }

    /** Clears the pending video and returns its thumbnail, which the caller must release later. */
    private static Bitmap takePendingVideo() {
        pendingVideoFile = null;
        Bitmap thumbnail = pendingVideoThumbnail;
        pendingVideoThumbnail = null;
        return thumbnail;
    }

    /**
     * Called by the patched "video recorded" step with the recording and its two reported
     * dimensions. When a video was picked from the gallery its file is returned instead, and
     * released (one capture only). The recorded file is not touched.
     */
    public static synchronized File substituteVideo(File recording, int a, int b) {
        videoSizeApplied = false;
        File replacement = pendingVideoFile;
        galleryCapture = replacement != null && replacement.exists();
        if (replacement == null || !replacement.exists()) return recording;

        // The step also receives the video's size, as the recorder reports it. Keep the same
        // convention: stored size (before rotation) or swapped, whichever the recording's size matches.
        int[] recorded = storedSize(recording);
        if (recorded != null && a == recorded[0] && b == recorded[1]) {
            videoSizeA = pendingVideoWidth;
            videoSizeB = pendingVideoHeight;
            videoSizeApplied = true;
        } else if (recorded != null && a == recorded[1] && b == recorded[0]) {
            videoSizeA = pendingVideoHeight;
            videoSizeB = pendingVideoWidth;
            videoSizeApplied = true;
        }
        Log.i(GalleryPickerFragment.TAG, "video replaced; reported size " + a + "x" + b
                + (videoSizeApplied ? " -> " + videoSizeA + "x" + videoSizeB : " kept"));
        refreshButton(takePendingVideo());
        return replacement;
    }

    /** First reported dimension: the replacement's when the video was replaced, else [original]. */
    public static synchronized int videoSizeA(int original) {
        return videoSizeApplied ? videoSizeA : original;
    }

    /** Second reported dimension, see [videoSizeA]. */
    public static synchronized int videoSizeB(int original) {
        return videoSizeApplied ? videoSizeB : original;
    }

    private static int[] storedSize(File video) {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(video.getAbsolutePath());
            return new int[]{
                    Integer.parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_WIDTH)),
                    Integer.parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT)),
            };
        } catch (Throwable t) {
            return null;
        } finally {
            try {
                retriever.release();
            } catch (Throwable ignored) {
                // Nothing to release.
            }
        }
    }

    /**
     * Updates the button on the main thread and only then releases bitmaps that are no longer
     * pending. The button can be showing one of them; recycling it before the image is replaced
     * would make the next frame draw a recycled bitmap and crash.
     */
    private static void refreshButton(Bitmap... release) {
        MAIN.post(() -> {
            showGalleryIcon();
            for (Bitmap bitmap : release) {
                if (bitmap != null && bitmap != pendingBitmap && bitmap != pendingVideoThumbnail
                        && !bitmap.isRecycled()) {
                    bitmap.recycle();
                }
            }
        });
    }

    // While a gallery image is waiting to be sent, the button shows its thumbnail so it is obvious
    // that the next shutter press will send that image instead of the camera.
    private static void showGalleryIcon() {
        ImageButton b = button;
        Bitmap pending = pendingBitmap != null ? pendingBitmap : pendingVideoThumbnail;
        if (b == null) return;
        if (pending != null) {
            b.setPadding(0, 0, 0, 0);
            b.setScaleType(ImageButton.ScaleType.CENTER_CROP);
            b.setImageBitmap(pending);
            b.setClipToOutline(true);
        } else {
            int pad = dp(b.getContext(), 12);
            b.setPadding(pad, pad, pad, pad);
            b.setScaleType(ImageButton.ScaleType.CENTER_INSIDE);
            b.setImageResource(android.R.drawable.ic_menu_gallery);
        }
    }

    public static void ensureGalleryButton() {
        final Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        MAIN.post(() -> {
            Activity current = activityRef.get();
            if (current == null || current.isFinishing() || current.isDestroyed()) return;
            View content = current.findViewById(android.R.id.content);
            if (!(content instanceof FrameLayout)) return;
            FrameLayout root = (FrameLayout) content;

            View existing = root.findViewById(BUTTON_ID);
            if (existing instanceof ImageButton) {
                button = (ImageButton) existing;
                return;
            }

            ImageButton gallery = new ImageButton(current);
            gallery.setId(BUTTON_ID);
            gallery.setContentDescription(InstantsStrings.openGallery(current));
            gallery.setImageResource(android.R.drawable.ic_menu_gallery);
            gallery.setScaleType(ImageButton.ScaleType.CENTER_INSIDE);
            gallery.setPadding(dp(current, 12), dp(current, 12), dp(current, 12), dp(current, 12));

            GradientDrawable background = new GradientDrawable();
            background.setShape(GradientDrawable.OVAL);
            background.setColor(0xCC202124);
            gallery.setBackground(background);
            gallery.setElevation(dp(current, 6));
            gallery.setOutlineProvider(new ViewOutlineProvider() {
                @Override
                public void getOutline(View view, Outline outline) {
                    outline.setOval(0, 0, view.getWidth(), view.getHeight());
                }
            });
            gallery.setOnClickListener(v -> openGallery(current));
            gallery.setOnLongClickListener(v -> {
                clearPendingMedia();
                android.widget.Toast.makeText(current, InstantsStrings.selectionCleared(current), android.widget.Toast.LENGTH_SHORT).show();
                return true;
            });

            // Same height as the audience pill ("AMIGOS"), vertically centered with it.
            // Anchored to the left screen edge instead of the screen center: the pill's
            // width changes with the selected audience ("AMIGOS PRÓXIMOS" is much wider),
            // so a center-relative offset would overlap it.
            int size = dp(current, 48);
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(size, size);
            lp.gravity = Gravity.BOTTOM | Gravity.LEFT;
            lp.bottomMargin = dp(current, 32);
            lp.leftMargin = dp(current, 16);
            root.addView(gallery, lp);
            button = gallery;
            showGalleryIcon();
            applyVisibility();
        });
    }

    private static void openGallery(Activity activity) {
        try {
            // A headless fragment receives the picker result without requiring an
            // <activity> entry in the target app's manifest.
            activity.getFragmentManager()
                    .beginTransaction()
                    .add(new GalleryPickerFragment(), GalleryPickerFragment.TAG)
                    .commitAllowingStateLoss();
        } catch (Throwable t) {
            Log.e(GalleryPickerFragment.TAG, "Unable to open gallery", t);
        }
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
