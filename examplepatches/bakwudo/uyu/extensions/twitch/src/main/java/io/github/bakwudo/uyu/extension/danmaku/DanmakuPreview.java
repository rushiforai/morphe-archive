package io.github.bakwudo.uyu.extension.danmaku;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import java.util.Random;

/**
 * A live preview for the settings screen: sample comments flowing over a dark frame with the
 * aspect ratio of the screen in landscape, so the preview is a scaled-down fullscreen player.
 * Comments arrive a little faster than they leave, so the preview always shows the maximum
 * number of comments.
 */
public final class DanmakuPreview extends FrameLayout {
    private static final long TICK_MS = 50;
    /** How much faster comments arrive than they leave. */
    private static final float ARRIVAL_RATE = 1.25f;
    /** Largest share of the screen height the preview takes, so the settings stay visible. */
    private static final float MAX_HEIGHT_FRACTION = 0.4f;

    /** Twitch's global emote "Kappa". */
    private static final String KAPPA = "25";

    private static final Object[][] SAMPLES = {
            {"wwwwwwwwww"},
            {"888888888888"},
            {"GG"},
            {"Nice play!"},
            {"今の上手すぎる"},
            {"lol"},
            {new DanmakuComment.Emote(KAPPA)},
            {"おつかれさまでした！"},
            {"That was close ", new DanmakuComment.Emote(KAPPA)},
            {"えぐい"},
            {"Longer comments move faster, so every comment is on screen for the same time"},
            {"草"},
    };

    private final DanmakuView danmaku;
    private final float aspectRatio;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Random random = new Random();
    private final Runnable addSamples = new Runnable() {
        @Override
        public void run() {
            long now = SystemClock.uptimeMillis();
            DanmakuStyle style = danmaku.getStyle();
            // Comments stay for the duration, so this rate keeps the view at its maximum. The
            // view drops the comments beyond it.
            float perMillisecond = ARRIVAL_RATE * style.maxComments / style.durationMs;
            if (lastRun > 0) pending += (now - lastRun) * perMillisecond * (0.5f + random.nextFloat());
            lastRun = now;

            while (pending >= 1) {
                pending--;
                if (danmaku.getCommentCount() >= style.maxComments) {
                    pending = 0;
                    break;
                }
                danmaku.addComment(new DanmakuComment(SAMPLES[random.nextInt(SAMPLES.length)]));
            }
            handler.postDelayed(this, TICK_MS);
        }
    };

    /** Comments due to be added. */
    private float pending = 1;
    private long lastRun;

    public DanmakuPreview(Context context) {
        super(context);
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        aspectRatio = Math.max(metrics.widthPixels, metrics.heightPixels)
                / (float) Math.max(1, Math.min(metrics.widthPixels, metrics.heightPixels));

        setBackground(new GradientDrawable(GradientDrawable.Orientation.TL_BR,
                new int[]{0xFF3A3F5C, 0xFF1B1D2A, 0xFF4A3A2A}));
        danmaku = new DanmakuView(context);
        addView(danmaku, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int width = MeasureSpec.getSize(widthMeasureSpec);
        int height = Math.round(width / aspectRatio);
        // In landscape, a preview as wide as the screen would cover the whole screen.
        int maxHeight = Math.round(getResources().getDisplayMetrics().heightPixels * MAX_HEIGHT_FRACTION);
        if (height > maxHeight) {
            height = maxHeight;
            width = Math.round(height * aspectRatio);
        }
        super.onMeasure(MeasureSpec.makeMeasureSpec(width, MeasureSpec.EXACTLY),
                MeasureSpec.makeMeasureSpec(height, MeasureSpec.EXACTLY));
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        handler.removeCallbacks(addSamples);
        pending = 1;
        lastRun = 0;
        handler.post(addSamples);
    }

    @Override
    protected void onDetachedFromWindow() {
        handler.removeCallbacks(addSamples);
        super.onDetachedFromWindow();
    }
}
