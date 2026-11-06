package semicoloncolonel.mobilestream.extension.mlb;

import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import semicoloncolonel.mobilestream.extension.shared.misc.AdBreakText;

/**
 * Shows a "Commercial Break in Progress" cover over the IMA SSAI ad view group
 * during live breaks. Ported from ajstrick81's MLB At Bat Android TV patch
 * (GPL-3.0). The primary trigger is {@link #signalAdBreak()}, called by
 * {@link MlbManifestRewriter} when it sees ad markers in a live playlist; the
 * IMA callbacks are a backup. The cover auto-hides a few seconds after the
 * last ad-marked playlist, so a missing end event cannot leave it stuck.
 */
@SuppressWarnings("unused")
public final class AdBreakOverlayHelper {
    private static final String TAG = "MSP-MLB-ADBREAK";
    private static final long HIDE_DELAY_MS = 10_000L;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable HIDE = new Runnable() {
        @Override
        public void run() {
            hideNow();
        }
    };

    private static ViewGroup adViewGroup;
    private static FrameLayout cover;

    private AdBreakOverlayHelper() {
    }

    public static void registerAdViewGroup(ViewGroup viewGroup) {
        adViewGroup = viewGroup;
    }

    /** Primary trigger: show the cover and re-arm the auto-hide timer. */
    public static void signalAdBreak() {
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                showNow();
                MAIN.removeCallbacks(HIDE);
                MAIN.postDelayed(HIDE, HIDE_DELAY_MS);
            }
        });
    }

    /** IMA onAdBreakStarted backup, routed through the same timer. */
    public static void showOverlay() {
        signalAdBreak();
    }

    /** IMA onAdBreakEnded backup: cancel the timer and hide now. */
    public static void hideOverlay() {
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                MAIN.removeCallbacks(HIDE);
                hideNow();
            }
        });
    }

    private static void showNow() {
        ViewGroup container = adViewGroup;
        if (container == null) {
            Log.w(TAG, "ad break signaled but no ad view group registered");
            return;
        }
        try {
            if (cover == null || cover.getContext() != container.getContext()) {
                cover = build(container);
            }
            if (cover.getParent() == null) container.addView(cover);
            else if (cover.getParent() != container) {
                ((ViewGroup) cover.getParent()).removeView(cover);
                container.addView(cover);
            }
            cover.setVisibility(View.VISIBLE);
            cover.bringToFront();
        } catch (Throwable t) {
            Log.e(TAG, "show failure", t);
        }
    }

    private static void hideNow() {
        if (cover != null) cover.setVisibility(View.GONE);
    }

    private static FrameLayout build(ViewGroup container) {
        TextView label = new TextView(container.getContext());
        label.setText(AdBreakText.untimed());
        label.setTextColor(Color.WHITE);
        label.setTextSize(24f);
        label.setTypeface(Typeface.DEFAULT_BOLD);
        label.setGravity(Gravity.CENTER);

        FrameLayout layout = new FrameLayout(container.getContext());
        layout.setBackgroundColor(Color.BLACK);
        layout.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        layout.addView(label, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        return layout;
    }
}
