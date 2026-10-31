package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import android.widget.TextView;

import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyFlags;
import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.EppyTheme;
import app.morphe.extension.sabp.SabpPrefs;

/**
 * Double-tap seeking on the cover, YouTube style: double-tap the left half to go back, the right
 * half to go forward; further taps on the same side within a second add another step (−10, −20,
 * −30…). A tap on the other side starts over in that direction. A label and a soft ripple show
 * the running total on the tapped side. Single taps wait out the double-tap window and then do
 * the cover's normal action (open Read along when the transcript is shown), so a double-tap never
 * also triggers it. The skip buttons stay for TalkBack, keyboards and headset keys.
 */
public final class CoverGestures {
    private final Context c;
    private final EppyTheme t;
    /** Performs one seek step: side -1 back, +1 forward. */
    public interface Seeker {
        void step(int side, int seconds);
    }

    private final Seeker seeker;
    private final FrameLayout frame;
    private final View catcher;
    private final TextView left, right;
    private final Runnable singleTap;
    private final Handler h = new Handler(Looper.getMainLooper());
    private final int slop, doubleTimeout;
    private float downX, downY;
    private long lastUpAt;
    private int lastUpSide;
    private long seekingUntil;
    private int seekSide, total;
    private final Runnable pendingSingle;
    private final Runnable endSeek;

    /** Seeks with SABP's own skip when the step matches it, else a book-level relative seek. */
    public static Seeker playerSeeker(Context c, EppyPlayer player) {
        return (side, s) -> {
            if (s == SabpPrefs.smallSeconds(c)) player.command(side < 0 ? EppyBridge.ACTION_REWIND_SMALL : EppyBridge.ACTION_FWD_SMALL);
            else player.seekBy(side * s);
        };
    }

    public CoverGestures(Context c, EppyTheme t, Seeker seeker, FrameLayout frame, Runnable singleTap) {
        this.c = c;
        this.t = t;
        this.seeker = seeker;
        this.frame = frame;
        this.singleTap = singleTap;
        slop = ViewConfiguration.get(c).getScaledTouchSlop();
        doubleTimeout = ViewConfiguration.getDoubleTapTimeout();
        left = label(Gravity.START | Gravity.CENTER_VERTICAL);
        right = label(Gravity.END | Gravity.CENTER_VERTICAL);
        catcher = new View(c);
        catcher.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        frame.addView(catcher, new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
        catcher.setOnTouchListener((v, e) -> onTouch(v, e));
        pendingSingle = () -> {
            if (singleTap != null) singleTap.run();
        };
        endSeek = () -> {
            seekingUntil = 0;
            total = 0;
            fade(left);
            fade(right);
        };
    }

    private TextView label(int gravity) {
        TextView tv = Ui.text(c, t, "", 15, 650, 0xFFFFFFFF);
        tv.setGravity(Gravity.CENTER);
        tv.setBackground(Ui.rounded(0x66000000, Ui.dp(c, 28)));
        tv.setPadding(Ui.dp(c, 14), Ui.dp(c, 8), Ui.dp(c, 14), Ui.dp(c, 8));
        tv.setAlpha(0f);
        tv.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(FrameLayout.LayoutParams.WRAP_CONTENT, FrameLayout.LayoutParams.WRAP_CONTENT, gravity);
        lp.leftMargin = lp.rightMargin = Ui.dp(c, 12);
        frame.addView(tv, lp);
        return tv;
    }

    private void fade(View v) {
        if (t.reduceMotion) v.setAlpha(0f);
        else v.animate().alpha(0f).setDuration(200).start();
    }

    /** Seconds per step: the patch-user's choice, or SABP's short skip interval. */
    public static int stepSeconds(Context c) {
        int s = EppyTheme.prefs(c).getInt("doubleTapSeconds", 0);
        return s > 0 ? s : SabpPrefs.smallSeconds(c);
    }

    public static boolean enabled(Context c) {
        return EppyFlags.on(c, EppyFlags.GESTURES) && EppyTheme.prefs(c).getInt("doubleTapSeconds", 0) >= 0;
    }

    private boolean onTouch(View v, MotionEvent e) {
        boolean gestures = enabled(c);
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = e.getX();
                downY = e.getY();
                return true;
            case MotionEvent.ACTION_UP: {
                if (Math.abs(e.getX() - downX) > slop || Math.abs(e.getY() - downY) > slop) return true;
                if (e.getEventTime() - e.getDownTime() > ViewConfiguration.getLongPressTimeout()) return true;
                long now = e.getEventTime();
                int side = e.getX() < v.getWidth() / 2f ? -1 : 1;
                if (!gestures) {
                    pendingSingle.run();
                    return true;
                }
                if (now < seekingUntil) {
                    h.removeCallbacks(pendingSingle);
                    step(side, now);
                } else if (now - lastUpAt <= doubleTimeout && side == lastUpSide) {
                    h.removeCallbacks(pendingSingle);
                    step(side, now);
                } else {
                    h.removeCallbacks(pendingSingle);
                    h.postDelayed(pendingSingle, doubleTimeout);
                }
                lastUpAt = now;
                lastUpSide = side;
                return true;
            }
            case MotionEvent.ACTION_CANCEL:
                return true;
            default:
                return true;
        }
    }

    /** Running total of the current burst (for tests and accessibility). */
    public int total() {
        return seekSide * total;
    }

    private void step(int side, long now) {
        if (side != seekSide || now >= seekingUntil) {
            total = 0;
            fade(side < 0 ? right : left);
        }
        seekSide = side;
        int s = stepSeconds(c);
        total += s;
        seeker.step(side, s);
        TextView tv = side < 0 ? left : right;
        tv.setText((side < 0 ? "−" : "+") + total + " seconds");
        tv.animate().cancel();
        tv.setAlpha(1f);
        if (!t.reduceMotion) {
            tv.setScaleX(0.9f);
            tv.setScaleY(0.9f);
            tv.animate().scaleX(1f).scaleY(1f).setDuration(120).start();
        }
        if (t.haptics) catcher.performHapticFeedback(android.view.HapticFeedbackConstants.CLOCK_TICK);
        frame.announceForAccessibility((side < 0 ? "Back " : "Forward ") + total + " seconds");
        seekingUntil = now + 1000;
        h.removeCallbacks(endSeek);
        h.postDelayed(endSeek, 1000);
    }
}
