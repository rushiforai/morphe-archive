package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.OvershootInterpolator;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * Modern UI motion: short window transitions in place of Joey's full-width slide
 * (a fade and lift for the photo viewer, whose video surface cannot be scaled),
 * and a press-and-pop on the vote and save buttons. Window and property
 * animations only, so nothing waits on them.
 */
public final class PostMotion {
    private static final Interpolator PRESS = new DecelerateInterpolator(1.6f);
    private static final Interpolator SETTLE = new OvershootInterpolator(2.6f);
    /** Starts at full speed and settles. Joey's curve waits, then rushes. */
    private static final Interpolator RISE = new DecelerateInterpolator(1.4f);
    private static final WeakHashMap<View, Integer> RISE_INDEX = new WeakHashMap<>();
    private static long riseWave;
    private static int riseCount;
    private static final String[] POP = {"upvote", "downvote", "save"};
    private static final View.OnTouchListener TOUCH = PostMotion::onTouch;

    private PostMotion() {
    }

    public static int enter(Activity activity, int anim) {
        return swap(activity, anim, "slide_horiz_in", "morphe_post_open", "morphe_media_open");
    }

    public static int exit(Activity activity, int anim) {
        return swap(activity, anim, "slide_horiz_out", "morphe_post_close", "morphe_media_close");
    }

    private static int swap(Activity activity, int anim, String joey, String post, String media) {
        if (anim == 0 || activity == null) return anim;
        try {
            if (!ModernUi.isModernUiEnabled(activity)) return anim;
            if (!joey.equals(activity.getResources().getResourceEntryName(anim))) return anim;
            boolean viewer = activity.getClass().getName().endsWith("PhotoViewer");
            int ours = activity.getResources().getIdentifier(viewer ? media : post, "anim", activity.getPackageName());
            return ours != 0 ? ours : anim;
        } catch (Throwable t) {
            return anim;
        }
    }

    /** Joey sets no touch listener on these, and this one never consumes the touch. */
    static void wireTaps(View item) {
        for (String name : POP) {
            int id = item.getResources().getIdentifier(name, "id", item.getContext().getPackageName());
            View view = id == 0 ? null : item.findViewById(id);
            if (view != null) view.setOnTouchListener(TOUCH);
        }
    }

    private static boolean onTouch(View view, MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                view.animate().cancel();
                view.animate().setStartDelay(0).scaleX(0.82f).scaleY(0.82f).setDuration(80).setInterpolator(PRESS).start();
                break;
            case MotionEvent.ACTION_UP:
                boolean inside = event.getX() >= 0 && event.getY() >= 0
                        && event.getX() <= view.getWidth() && event.getY() <= view.getHeight();
                view.animate().cancel();
                if (inside) {
                    view.animate().scaleX(1.22f).scaleY(1.22f).setDuration(90).setInterpolator(PRESS)
                            .withEndAction(() -> view.animate().scaleX(1f).scaleY(1f)
                                    .setDuration(220).setInterpolator(SETTLE).start())
                            .start();
                } else {
                    settle(view);
                }
                break;
            case MotionEvent.ACTION_CANCEL:
                view.animate().cancel();
                settle(view);
                break;
            default:
                break;
        }
        return false;
    }

    private static void settle(View view) {
        view.animate().setStartDelay(0).scaleX(1f).scaleY(1f).setDuration(160).setInterpolator(PRESS).start();
    }

    /**
     * Joey's feed entrance starts each post a full screen below, on a curve that
     * waits and then rushes. Under Modern UI the same posts rise a short way,
     * already moving on the first frame, and each row follows the one above it.
     */
    public static void softenRise(View view) {
        if (view == null || !ModernUi.isModernUiEnabled(view.getContext())) return;
        long now = SystemClock.uptimeMillis();
        if (now - riseWave > 400) riseCount = 0;
        riseWave = now;
        int index = riseCount++;
        if (index > 5) index = 5;
        RISE_INDEX.put(view, index);
        float rise = 12f * view.getResources().getDisplayMetrics().density;
        view.setTranslationY(rise);
        view.setAlpha(0f);
    }

    /** Runs after Joey has aimed the slide, so the short rise and the fade replace it. */
    public static void polishRise(Object animator, Object compat) {
        View view = animatedView(compat);
        if (view == null || !ModernUi.isModernUiEnabled(view.getContext())) return;
        Integer index = RISE_INDEX.remove(view);
        long delay = (index == null ? 0 : index) * 18L;
        view.animate().translationY(0f).alpha(1f)
                .setStartDelay(delay)
                .setDuration(260)
                .setInterpolator(RISE);
        if (animator == null) return;
        try {
            animator.getClass().getMethod("x", long.class).invoke(animator, 420L);
        } catch (Throwable ignored) {
        }
    }

    private static View animatedView(Object compat) {
        if (compat == null) return null;
        try {
            java.lang.reflect.Field field = compat.getClass().getDeclaredField("a");
            field.setAccessible(true);
            Object ref = field.get(compat);
            if (ref instanceof WeakReference) {
                Object view = ((WeakReference<?>) ref).get();
                if (view instanceof View) return (View) view;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }
}
