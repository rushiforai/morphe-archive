package app.hushmessenger.extension;

import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.PathInterpolator;
import android.view.animation.Transformation;
import android.view.animation.TranslateAnimation;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.ToIntBiFunction;

/**
 * Slides a chat in from the side when it opens and back out on Back (#28). androidx asks each fragment for its
 * animation before it loads the one the transaction names, so answering null keeps Messenger's own.
 */
public final class ChatAnimation {
    static final String KEY = "chat_animation";
    /** The roles the patch passes: the chat itself, and the inbox it opens over. */
    static final int CHAT = 1;
    static final int INBOX = 2;
    static final long SLIDE_IN = 300;
    static final long SLIDE_OUT = 250;
    /** A chat opened while another one shows fades in with Android's own fade, and keeps it. */
    static final int SWITCH_FADE = android.R.anim.fade_in;
    /** Chats this slid in. Only those slide back out, so chat heads, bubbles and restored chats keep their own. */
    static final Map<Object, Boolean> slidIn = Collections.synchronizedMap(new WeakHashMap<>());
    static volatile long slidOutAt = Long.MIN_VALUE / 2;
    /** When a chat last faded in over another one. */
    static volatile long switchedAt = Long.MIN_VALUE / 2;
    /** Messenger asks for both fragments of one transaction within this long of each other. */
    static final long SAME_PASS = 50;

    private ChatAnimation() {}

    /** Called from androidx's Fragment.onCreateAnimation and the older chat's own. Null keeps the stock animation. */
    public static Animation create(Object fragment, int role, boolean enter, int nextAnim) {
        try {
            if (role == CHAT) return enter ? open(fragment, nextAnim) : close(fragment);
            if (role == INBOX) return inbox(enter);
        } catch (RuntimeException error) {
            Settings.hookFailed(KEY, "Can't animate a chat", error);
        }
        return null;
    }

    /** Messenger gives a chat it opens from the inbox, search or a notification an entrance. Restored ones get none. */
    static Animation open(Object chat, int nextAnim) {
        if (nextAnim == SWITCH_FADE) switchedAt = SystemClock.uptimeMillis();
        if (nextAnim == 0 || nextAnim == SWITCH_FADE || !on()) return null;
        slidIn.put(chat, Boolean.TRUE);
        // The inbox can draw its first held frame before the chat draws its first one.
        slidingInUntil = SystemClock.uptimeMillis() + PENDING;
        return slide(true);
    }

    static Animation close(Object chat) {
        if (slidIn.remove(chat) == null || !on()) return null;
        // Another chat fading in over this one replaces it rather than going back.
        if (SystemClock.uptimeMillis() - switchedAt < SAME_PASS) return null;
        slidOutAt = SystemClock.uptimeMillis();
        return slide(false);
    }

    /**
     * Messenger hides the inbox the moment a chat opens and fades it back in on Back. This keeps it drawn under a chat
     * sliding over it, and shows it at once under one sliding away. Messenger asks for the opening chat first, so any
     * other screen that covers the inbox keeps Messenger's own.
     */
    static Animation inbox(boolean enter) {
        long now = SystemClock.uptimeMillis();
        if (enter ? slidIn.isEmpty() && now - slidOutAt > SLIDE_OUT : now >= slidingInUntil) return null;
        if (!on()) return null;
        Animation hold = new Hold();
        hold.setDuration(SLIDE_IN);
        return hold;
    }

    /** Android's Remove animations setting turns this off along with every other animation. */
    static boolean on() {
        return ValueAnimator.areAnimatorsEnabled() && Settings.enabled(KEY);
    }

    static boolean rightToLeft() {
        return TextUtils.getLayoutDirectionFromLocale(Locale.getDefault()) == View.LAYOUT_DIRECTION_RTL;
    }

    static Animation slide(boolean in) {
        Animation slide = new Slide(in, rightToLeft() ? -1f : 1f);
        slide.setDuration(in ? SLIDE_IN : SLIDE_OUT);
        slide.setInterpolator(new PathInterpolator(0.2f, 0f, 0f, 1f));
        return slide;
    }

    /** A frame this much later than the last one is a stall, not the animation's own time. */
    static final long STALL = 34;
    static final long FRAME = 17;
    /** How long the inbox waits for a chat that hasn't drawn yet. */
    static final long PENDING = 1000;
    /** Until when a chat sliding in still needs the inbox drawn under it. */
    static volatile long slidingInUntil;

    /**
     * Messenger builds the chat on the main thread while the slide starts, so the next frame can come 100 ms late,
     * when the slide is nearly over. This moves the start forward by a stall so the slide goes on from where it was.
     */
    static long steady(Animation animation, long lastFrame, long now) {
        if (lastFrame > 0 && animation.hasStarted() && now - lastFrame > STALL) {
            animation.setStartTime(animation.getStartTime() + now - lastFrame - FRAME);
        }
        return now;
    }

    static final class Slide extends TranslateAnimation {
        private final boolean in;
        private long lastFrame;

        Slide(boolean in, float side) {
            super(RELATIVE_TO_SELF, in ? side : 0f, RELATIVE_TO_SELF, in ? 0f : side, ABSOLUTE, 0f, ABSOLUTE, 0f);
            this.in = in;
        }

        @Override public boolean getTransformation(long now, Transformation out) {
            lastFrame = steady(this, lastFrame, now);
            boolean more = super.getTransformation(now, out);
            if (in) slidingInUntil = more ? now + 2 * STALL : 0;
            return more;
        }
    }

    /** Draws the inbox as it is for the slide's length, and longer while a chat is still sliding in over it. */
    static final class Hold extends AlphaAnimation {
        private long lastFrame;

        Hold() { super(1f, 1f); }

        @Override public boolean getTransformation(long now, Transformation out) {
            lastFrame = steady(this, lastFrame, now);
            return super.getTransformation(now, out) | now < slidingInUntil;
        }
    }

    /** Search and notifications open a chat as an activity of its own instead of a fragment over the inbox. */
    static final String CHAT_ACTIVITY = "com.facebook.messaging.msys.thread.fragment.MsysThreadViewActivity";
    /** Android takes an activity's transition only from a resource, so the patch adds these to Messenger's own. */
    static final String IN = "hush_chat_in";
    static final String OUT = "hush_chat_out";
    static final String HOLD = "hush_chat_hold";
    static final String RTL = "_rtl";
    /** Finds the patch's animation resources by name, since they only exist once the patch adds them. Tests swap it. */
    @SuppressLint("DiscouragedApi")
    static volatile ToIntBiFunction<Context, String> animations =
        (context, name) -> context.getResources().getIdentifier(name, "anim", context.getPackageName());
    /** Chat activities this slid in. Only those slide back out. */
    static final Map<Activity, Boolean> slidActivities = Collections.synchronizedMap(new WeakHashMap<>());

    /** HostScreens hands over Messenger's Application here when the patch applied. */
    public static void register(Application application) {
        application.registerActivityLifecycleCallbacks(new ChatActivities());
    }

    /** The transitions as {in, out, hold}. The patch adds all of them, so a missing one is a broken install. */
    static int[] transitions(Context context) {
        String side = rightToLeft() ? RTL : "";
        int[] ids = {animations.applyAsInt(context, IN + side), animations.applyAsInt(context, OUT + side),
            animations.applyAsInt(context, HOLD)};
        for (int id : ids) if (id == 0) throw new IllegalStateException("The chat slide's resources are missing");
        return ids;
    }

    static final class ChatActivities implements Application.ActivityLifecycleCallbacks {
        @Override @SuppressWarnings("deprecation") public void onActivityCreated(Activity activity, Bundle state) {
            // A chat Android brings back after a restart or a rotation is already on screen.
            if (state != null || !CHAT_ACTIVITY.equals(activity.getClass().getName())) return;
            try {
                if (!on()) return;
                int[] ids = transitions(activity);
                if (Build.VERSION.SDK_INT >= 34) {
                    activity.overrideActivityTransition(Activity.OVERRIDE_TRANSITION_OPEN, ids[0], ids[2]);
                } else {
                    activity.overridePendingTransition(ids[0], ids[2]);
                }
                slidActivities.put(activity, Boolean.TRUE);
            } catch (RuntimeException error) {
                Settings.hookFailed(KEY, "Can't animate a chat", error);
            }
        }

        /** Android 14 and later read the closing slide when the chat closes, so it follows the switch from here. */
        @Override public void onActivityResumed(Activity activity) {
            if (Build.VERSION.SDK_INT < 34 || !slidActivities.containsKey(activity)) return;
            try {
                if (on()) {
                    int[] ids = transitions(activity);
                    activity.overrideActivityTransition(Activity.OVERRIDE_TRANSITION_CLOSE, ids[2], ids[1]);
                } else {
                    activity.clearOverrideActivityTransition(Activity.OVERRIDE_TRANSITION_CLOSE);
                }
            } catch (RuntimeException error) {
                Settings.hookFailed(KEY, "Can't animate a chat", error);
            }
        }

        /** Older Android takes the closing slide while the finishing chat pauses. */
        @Override @SuppressWarnings("deprecation") public void onActivityPaused(Activity activity) {
            if (Build.VERSION.SDK_INT >= 34 || !activity.isFinishing() || !slidActivities.containsKey(activity)) return;
            try {
                if (!on()) return;
                int[] ids = transitions(activity);
                activity.overridePendingTransition(ids[2], ids[1]);
            } catch (RuntimeException error) {
                Settings.hookFailed(KEY, "Can't animate a chat", error);
            }
        }

        @Override public void onActivityDestroyed(Activity activity) { slidActivities.remove(activity); }
        @Override public void onActivityStarted(Activity activity) {}
        @Override public void onActivityStopped(Activity activity) {}
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
    }
}
