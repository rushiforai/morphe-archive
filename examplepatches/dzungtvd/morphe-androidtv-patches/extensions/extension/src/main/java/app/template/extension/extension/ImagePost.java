package app.template.extension.extension;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/** Draws TikTok Lite image posts over the player surface. */
@SuppressWarnings("unused")
public final class ImagePost {

    private static final String TAG = "TikTokTVImagePost";
    private static final String OVERLAY_TAG = "app.tiktoktv.imagepost";
    private static final String IMAGE_VIEW_CLASS = "com.bytedance.lighten.loader.SmartImageView";
    private static final String SCALE_TYPE_CLASS = "com.bytedance.lighten.core.ab";

    /** `aweme_type` TikTok Lite uses for a photomode post. */
    private static final int IMAGE_POST_TYPE = 150;

    private static final long SLIDE_INTERVAL_MS = 4000L;
    private static final long PLACE_RETRY_MS = 150L;
    private static final int MAX_PLACE_ATTEMPTS = 12;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private ImagePost() {
    }

    /** @param fragment the `BaseVideoFragment` about to bind the aweme @param aweme the `Aweme` it binds */
    public static void onPlay(Object fragment, Object aweme) {
        if (fragment == null || aweme == null) return;

        Object view = call(fragment, "getView");
        if (!(view instanceof View)) return;
        View root = (View) view;

        Number type = asNumber(call(aweme, "getAwemeType"));
        // Swiping away to a video has to drop the picture, or the video plays behind a still frame.
        removeOverlay(root);
        if (type == null || type.intValue() != IMAGE_POST_TYPE) return;

        List<String> album = ImageStore.imagesOf(asString(call(aweme, "getAid")));
        boolean fullPost = album != null && !album.isEmpty();
        List<String> urls = fullPost ? album : coverOf(aweme);
        if (urls.isEmpty()) {
            android.util.Log.i(TAG, "nothing to render for " + call(aweme, "getAid"));
            return;
        }

        // Distinguishes a post whose whole album was captured from one drawn from its cover alone.
        android.util.Log.i(TAG, "render " + (fullPost ? "album " : "cover ") + urls.size()
                + " pictures for " + call(aweme, "getAid"));

        MAIN.post(() -> place(root, urls, 0));
    }

    private static void place(View root, List<String> urls, int attempt) {
        View surface = findSurface(root);
        if (surface == null) {
            if (attempt < MAX_PLACE_ATTEMPTS) {
                MAIN.postDelayed(() -> place(root, urls, attempt + 1), PLACE_RETRY_MS);
            }
            return;
        }

        ViewGroup parent = (ViewGroup) surface.getParent();
        Context context = root.getContext();
        if (parent == null || context == null) return;

        View image = newImageView(context);
        if (image == null) return;

        FrameLayout overlay = new FrameLayout(context);
        overlay.setTag(OVERLAY_TAG);
        overlay.setBackgroundColor(0xFF000000);
        overlay.addView(image, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // Same bounds as the surface it replaces, so the picture sits exactly in the video area.
        parent.addView(overlay, parent.indexOfChild(surface) + 1, surface.getLayoutParams());

        show(image, urls.get(0));
        if (urls.size() > 1) slide(overlay, image, urls);
    }

    /** Advances the single image view through the post, and counts the slides for the viewer. */
    private static void slide(FrameLayout overlay, View image, List<String> urls) {
        Context context = overlay.getContext();
        TextView counter = new TextView(context);
        counter.setTextColor(0xCCFFFFFF);
        counter.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        int margin = (int) (12 * context.getResources().getDisplayMetrics().density);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.gravity = Gravity.BOTTOM | Gravity.END;
        params.setMargins(margin, margin, margin, margin);
        overlay.addView(counter, params);

        counter.setText(1 + "/" + urls.size());
        MAIN.postDelayed(new Runnable() {
            private int index;

            @Override
            public void run() {
                // Detached overlays are not re-attached; this is the loop's only exit.
                if (overlay.getWindowToken() == null) return;
                index = (index + 1) % urls.size();
                show(image, urls.get(index));
                counter.setText((index + 1) + "/" + urls.size());
                MAIN.postDelayed(this, SLIDE_INTERVAL_MS);
            }
        }, SLIDE_INTERVAL_MS);
    }

    private static void removeOverlay(View root) {
        View stale = root.getRootView().findViewWithTag(OVERLAY_TAG);
        if (!(stale instanceof ViewGroup)) return;

        ((ViewGroup) stale).removeAllViews();
        ViewGroup parent = (ViewGroup) stale.getParent();
        if (parent != null) parent.removeView(stale);
    }

    /** Deepest surface-shaped view with a size, which is where the player draws. */
    private static View findSurface(View view) {
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findSurface(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return isPlayerSurface(view) ? view : null;
    }

    private static boolean isPlayerSurface(View view) {
        if (view.getWidth() <= 0 || view.getHeight() <= 0) return false;

        for (Class<?> type = view.getClass(); type != null && type != View.class;
                type = type.getSuperclass()) {
            String name = type.getName();
            if (name.contains("SurfaceView") || name.contains("TextureView")) return true;
        }
        return false;
    }

    /** @return the post's first picture, which is all the TV model still exposes of it. */
    private static List<String> coverOf(Object aweme) {
        List<String> urls = new ArrayList<>(1);
        Object video = call(aweme, "getVideo");
        if (video == null) return urls;

        Object cover = call(video, "getCover");
        if (cover == null) cover = call(video, "getOriginCover");
        if (cover == null) cover = call(video, "getWebpCover");
        if (cover == null) return urls;

        Object list = call(cover, "getUrlList");
        if (!(list instanceof List) || ((List<?>) list).isEmpty()) return urls;

        // The list holds the same picture on several CDN mirrors, so only the first is used.
        Object first = ((List<?>) list).get(0);
        if (first instanceof String) urls.add((String) first);
        return urls;
    }

    private static View newImageView(Context context) {
        try {
            Object view = Class.forName(IMAGE_VIEW_CLASS)
                    .getConstructor(Context.class)
                    .newInstance(context);
            if (!(view instanceof View)) return null;

            Class<?> scaleType = Class.forName(SCALE_TYPE_CLASS);
            for (Object constant : (Object[]) scaleType.getMethod("values").invoke(null)) {
                if (!String.valueOf(constant).contains("FIT_CENTER")) continue;

                // Photomode posts are portrait and the TV video area is landscape.
                view.getClass().getMethod("setActualImageScaleType", scaleType)
                        .invoke(view, constant);
                break;
            }
            return (View) view;
        } catch (Throwable failure) {
            android.util.Log.i(TAG, "no image loader: " + failure);
            return null;
        }
    }

    private static void show(View image, String url) {
        try {
            image.getClass().getMethod("setImageURI", String.class).invoke(image, url);
        } catch (Throwable failure) {
            android.util.Log.i(TAG, "image not shown: " + failure);
        }
    }

    private static Object call(Object target, String name) {
        if (target == null) return null;
        try {
            return target.getClass().getMethod(name).invoke(target);
        } catch (Throwable failure) {
            return null;
        }
    }

    private static Number asNumber(Object value) {
        return value instanceof Number ? (Number) value : null;
    }

    private static String asString(Object value) {
        return value instanceof String ? (String) value : null;
    }
}
