package app.morphe.extension.instants;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Outline;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.widget.FrameLayout;
import android.widget.ImageButton;

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
    // A capture reads the pending image once on the UI path (archive peek animation) and
    // once on the upload path. After both reads, or CAPTURE_WINDOW_MS, it is released.
    private static final int READS_PER_CAPTURE = 2;
    private static final long CAPTURE_WINDOW_MS = 5000L;
    private static volatile int reads;
    private static long firstReadAt;
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
    }

    private static void applyVisibility() {
        ImageButton b = button;
        if (b != null) b.setVisibility(cameraRoute ? View.VISIBLE : View.GONE);
    }

    /** Called every time the camera's control buttons are composed. */
    public static void onCameraComposed() {
        ensureGalleryButton();
    }

    /**
     * Returns a private mutable copy of the selected image for the capture in progress, or
     * null when none is pending. Copies are handed out because the app recycles and draws on
     * the bitmaps it receives.
     */
    public static synchronized Bitmap consumePendingBitmap() {
        Bitmap source = pendingBitmap;
        if (source == null) return null;
        long now = SystemClock.uptimeMillis();
        if (reads == 0) {
            firstReadAt = now;
            MAIN.post(InstantsGalleryHelper::showGalleryIcon);
        } else if (now - firstReadAt > CAPTURE_WINDOW_MS) {
            releasePending();
            return null;
        }
        Bitmap copy = duplicate(source);
        if (++reads >= READS_PER_CAPTURE) releasePending();
        return copy;
    }

    public static Bitmap duplicate(Bitmap source) {
        return source.copy(Bitmap.Config.ARGB_8888, true);
    }

    public static synchronized void setPendingBitmap(Bitmap bitmap) {
        pendingBitmap = bitmap;
        reads = 0;
        MAIN.post(InstantsGalleryHelper::showGalleryIcon);
    }

    private static void releasePending() {
        pendingBitmap = null;
        reads = 0;
        MAIN.post(InstantsGalleryHelper::showGalleryIcon);
    }

    // While a gallery image is waiting to be sent, the button shows its thumbnail so it
    // is obvious that the next shutter press will send that image instead of the camera.
    private static void showGalleryIcon() {
        ImageButton b = button;
        Bitmap pending = pendingBitmap;
        if (b == null) return;
        // The thumbnail is shown only until the capture starts reading the image.
        if (pending != null && reads == 0) {
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
            gallery.setContentDescription("Abrir galeria");
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
