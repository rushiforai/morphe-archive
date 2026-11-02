package app.template.extension.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Touch shield for Strava's recording screen, with a persistent on-screen
 * toggle pill.
 *
 * While the feature is ON (pref morphe.record_touch_lock) the recording
 * screen always shows a small pill at the top:
 *   - locked:   full-screen shield swallowing every touch + pill
 *               "tap to unlock"
 *   - unlocked: no shield, small translucent pill "tap to lock" so the
 *               screen can be re-locked with one tap, any time
 * The pill flips between the two states; the Extra Settings switch turns
 * the whole feature on/off (no pill at all when off).
 *
 * The overlay is attached to the window DecorView, NOT to
 * android.R.id.content: the recording screen re-calls setContentView() on
 * some state changes, and that wipes every child of the content frame
 * (observed on device). DecorView children survive setContentView.
 */
public final class StravaTouchLock implements Application.ActivityLifecycleCallbacks {

    /** Feature master switch (Extra Settings). */
    public static volatile boolean active = true;
    /** Shield state while the feature is on. True = touches swallowed. */
    public static volatile boolean locked = true;

    private FrameLayout shield;

    public static void install(Context ctx) {
        try {
            Application app = (Application) ctx.getApplicationContext();
            SharedPreferences prefs = ctx.getSharedPreferences(
                "com.strava_preferences", Context.MODE_PRIVATE);
            active = prefs.getBoolean("morphe.record_touch_lock", true);
            app.registerActivityLifecycleCallbacks(new StravaTouchLock());
            android.util.Log.e("MorpheLock", "installed, active=" + active);
        } catch (Throwable t) {
            android.util.Log.e("MorpheLock", "install failed", t);
        }
    }

    private static ViewGroup decorRoot(Activity activity) {
        Window w = activity.getWindow();
        if (w == null) return null;
        return (ViewGroup) w.getDecorView();
    }

    private static SharedPreferences prefs(Activity activity) {
        return activity.getSharedPreferences(
            "com.strava_preferences", Context.MODE_PRIVATE);
    }

    @Override
    public void onActivityResumed(Activity activity) {
        String cls = activity.getClass().getName();
        boolean isRec = cls.startsWith("com.strava") && cls.contains("RecordingScreen");
        if (!isRec) {
            detach(decorRoot(activity));
            return;
        }
        ViewGroup root = decorRoot(activity);
        if (root == null) return;
        rebuild(activity, root, "resume");
    }

    private void rebuild(final Activity activity, final ViewGroup root, String why) {
        detach(root);
        if (!active) return;
        try {
            if (locked) {
                shield = new FrameLayout(activity);
                shield.setBackgroundColor(Color.TRANSPARENT);
                shield.setClickable(true);
                shield.setFocusable(true);
                shield.setOnTouchListener(new View.OnTouchListener() {
                    @Override public boolean onTouch(View v, MotionEvent e) { return true; }
                });
                shield.addView(makePill(activity, true,
                    new View.OnClickListener() {
                        @Override public void onClick(View v) { flip(activity, false); }
                    }));
                root.addView(shield, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                android.util.Log.e("MorpheLock", "shield on (" + why + ")");
            } else {
                root.addView(makePill(activity, false,
                    new View.OnClickListener() {
                        @Override public void onClick(View v) { flip(activity, true); }
                    }));
                android.util.Log.e("MorpheLock", "pill-only on (" + why + ")");
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheLock", "rebuild failed", t);
        }
    }

    private TextView makePill(Activity activity, boolean isLocked,
                              View.OnClickListener onClick) {
        float d = activity.getResources().getDisplayMetrics().density;
        TextView pill = new TextView(activity);
        pill.setText(isLocked ? "tap to unlock" : "tap to lock");
        pill.setTextSize(11);
        pill.setTextColor(Color.WHITE);
        pill.setGravity(Gravity.CENTER);
        pill.setPadding((int) (14 * d), (int) (7 * d), (int) (14 * d), (int) (7 * d));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(isLocked ? 0xCC1C1C1E : 0x661C1C1E);
        bg.setCornerRadius(18 * d);
        pill.setBackgroundDrawable(bg);
        FrameLayout.LayoutParams pl = new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        pl.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        pl.topMargin = (int) (116 * d);
        pill.setLayoutParams(pl);
        pill.setOnClickListener(onClick);
        return pill;
    }

    private void flip(final Activity activity, boolean lock) {
        locked = lock;
        ViewGroup root = decorRoot(activity);
        if (root == null) return;
        rebuild(activity, root, "flip");
        Toast.makeText(activity, lock ? "Recording screen locked"
                                      : "Recording screen unlocked", Toast.LENGTH_SHORT).show();
    }

    /** Called by the Extra Settings switch: feature on/off, same process. */
    public static void applyTo(Activity activity, boolean on) {
        active = on;
        prefs(activity).edit().putBoolean("morphe.record_touch_lock", on).apply();
        if (activity.getClass().getName().contains("RecordingScreen")) {
            ViewGroup root = decorRoot(activity);
            if (root == null) return;
            detach(root);
            if (on) {
                try {
                    new StravaTouchLock().rebuild(activity, root, "applyTo");
                } catch (Throwable ignored) {}
            }
        }
    }

    private static void detach(ViewGroup root) {
        if (root == null) return;
        int removed = 0;
        for (int i = root.getChildCount() - 1; i >= 0; i--) {
            View child = root.getChildAt(i);
            if (child instanceof FrameLayout && child.getId() == View.NO_ID
                && root.getClass().getName().contains("DecorView")) {
                root.removeView(child);
                removed++;
            }
        }
        if (removed > 0) {
            android.util.Log.e("MorpheLock", "detach removed=" + removed);
        }
    }

    @Override public void onActivityCreated(Activity a, Bundle b) {}
    @Override public void onActivityStarted(Activity a) {}
    @Override public void onActivityPaused(Activity a) {}
    @Override public void onActivityStopped(Activity a) {}
    @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
    @Override public void onActivityDestroyed(Activity a) {
        shield = null;
    }
}
