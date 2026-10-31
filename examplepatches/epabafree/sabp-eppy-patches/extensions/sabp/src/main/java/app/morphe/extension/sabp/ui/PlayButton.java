package app.morphe.extension.sabp.ui;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;
import android.view.animation.PathInterpolator;

import app.morphe.extension.sabp.EppyTheme;

/**
 * The play/pause control: one continuous shape that always fits inside the view's bounds
 * (a circle by default), with the play and pause glyphs cross-fading in the centre.
 * Nothing is drawn outside the bounds, so nothing gets clipped into partial shapes.
 */
public class PlayButton extends View {
    public static final int SHAPE_CIRCLE = 0, SHAPE_ROUNDED_SQUARE = 1, SHAPE_OUTLINE_CIRCLE = 2;

    private final Paint bg = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF r = new RectF();
    private EppyIcon play, pause;
    private boolean playing;
    private float fade; // 0 = play glyph, 1 = pause glyph
    private ValueAnimator anim;
    private EppyTheme t;
    private int shape = SHAPE_CIRCLE;

    public PlayButton(Context c) {
        super(c);
        setClickable(true);
        setFocusable(true);
        setContentDescription("Play");
    }

    public void apply(EppyTheme t) {
        apply(t, t.playShape);
    }

    public void apply(EppyTheme t, int shape) {
        this.t = t;
        this.shape = shape;
        int glyph = shape == SHAPE_OUTLINE_CIRCLE ? t.onSurface : t.onPrimary;
        bg.setColor(shape == SHAPE_OUTLINE_CIRCLE ? t.outline : t.primary);
        bg.setStyle(shape == SHAPE_OUTLINE_CIRCLE ? Paint.Style.STROKE : Paint.Style.FILL);
        bg.setStrokeWidth(Ui.dp(getContext(), 1.5f));
        play = new EppyIcon(EppyIcon.PLAY, glyph);
        pause = new EppyIcon(EppyIcon.PAUSE, glyph);
        invalidate();
    }

    public boolean isPlaying() {
        return playing;
    }

    public void setPlaying(boolean p, boolean animate) {
        if (p == playing && anim == null && fade == (p ? 1f : 0f)) return;
        playing = p;
        setContentDescription(p ? "Pause" : "Play");
        float target = p ? 1f : 0f;
        if (anim != null) anim.cancel();
        anim = null;
        if (!animate || (t != null && t.reduceMotion)) {
            fade = target;
            invalidate();
            return;
        }
        anim = ValueAnimator.ofFloat(fade, target);
        anim.setDuration(180);
        anim.setInterpolator(new PathInterpolator(0.2f, 0f, 0f, 1f));
        anim.addUpdateListener(a -> {
            fade = (float) a.getAnimatedValue();
            invalidate();
        });
        anim.addListener(new android.animation.AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(android.animation.Animator animation) {
                anim = null;
            }
        });
        anim.start();
    }

    @Override
    protected void onMeasure(int w, int h) {
        // Always square so the circle is never squashed or cut.
        int size = Math.min(getDefaultSize(Ui.dp(getContext(), 56), w), getDefaultSize(Ui.dp(getContext(), 56), h));
        setMeasuredDimension(size, size);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (play == null) return;
        float size = Math.min(getWidth(), getHeight());
        float cx = getWidth() / 2f, cy = getHeight() / 2f;
        float inset = shape == SHAPE_OUTLINE_CIRCLE ? bg.getStrokeWidth() / 2f + 1 : 0.5f;
        float half = size / 2f - inset;
        r.set(cx - half, cy - half, cx + half, cy + half);
        float radius = shape == SHAPE_ROUNDED_SQUARE ? half * 0.56f : half;
        bg.setAlpha(isPressed() ? 215 : 255);
        canvas.drawRoundRect(r, radius, radius, bg);

        int icon = Math.round(size * 0.42f);
        int left = Math.round(cx - icon / 2f), top = Math.round(cy - icon / 2f);
        // The PLAY glyph is already optically centred in its 24-unit grid (triangle spans 8–19),
        // so both glyphs use identical bounds. v0.3.0 added an extra nudge that pushed it right.
        play.setBounds(left, top, left + icon, top + icon);
        pause.setBounds(left, top, left + icon, top + icon);
        play.setAlpha(Math.round(255 * (1f - fade)));
        pause.setAlpha(Math.round(255 * fade));
        if (fade < 1f) play.draw(canvas);
        if (fade > 0f) pause.draw(canvas);
    }

    @Override
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        invalidate();
    }
}
