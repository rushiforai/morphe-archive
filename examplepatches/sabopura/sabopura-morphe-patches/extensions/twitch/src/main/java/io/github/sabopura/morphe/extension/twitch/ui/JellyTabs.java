package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.function.IntConsumer;

/**
 * Bencho's Jelly tabs on real views, so each chip stays a focusable, tappable child. Each chip carries
 * three springs (nudge, scale across, scale up); the jelly is the two scales disagreeing.
 */
final class JellyTabs extends LinearLayout implements Motion.Step {
    private static final float SWELL = .2f, SHRINK = .05f, BARGE_DP = 6;
    private static final float STIFF = 580, BOUNCE = .25f;
    private static final int STAGGER_MS = 22, WOBBLE = 67;
    private static final int SUBSTEPS = 8;

    private final TextView[] chips;
    private final Spring[] x, sx, sy;
    private final Spring[][] all;
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final float density;
    private int selected;
    private boolean placed;

    JellyTabs(Context context, Ui ui, String[] labels, int selected, IntConsumer onPick) {
        super(context);
        setOrientation(HORIZONTAL);
        setGravity(Gravity.CENTER_VERTICAL);
        setClipChildren(false);
        setClipToPadding(false);
        density = context.getResources().getDisplayMetrics().density;
        this.selected = selected;
        chips = new TextView[labels.length];
        x = new Spring[labels.length];
        sx = new Spring[labels.length];
        sy = new Spring[labels.length];
        all = new Spring[][]{x, sx, sy};
        for (int i = 0; i < labels.length; i++) {
            final int index = i;
            boolean on = i == selected;
            float rest = on ? 1 + SWELL : 1 - SHRINK;
            x[i] = new Spring(0);
            sx[i] = new Spring(rest);
            sy[i] = new Spring(rest);
            chips[i] = ui.chip(context, labels[i], on, () -> {
                select(index);
                onPick.accept(index);
            });
            LayoutParams lp = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (i > 0) lp.leftMargin = Ui.dp(context, 8);
            addView(chips[i], lp);
        }
    }

    TextView chip(int index) {
        return chips[index];
    }

    void select(int index) {
        select(index, false);
    }

    /** {@code -1} selects nothing, for a value between the chips. */
    void select(int index, boolean instant) {
        if (index == selected) return;
        selected = index;
        for (int i = 0; i < chips.length; i++) chips[i].setSelected(i == index);
        apply(instant);
        centerSelected(!instant);
    }

    private void apply(boolean instant) {
        float push = (selected < 0 ? 0 : chips[selected].getWidth() * SWELL / 2) + BARGE_DP * density;
        float jelly = WOBBLE / 100f * 1.5f;
        long now = android.os.SystemClock.uptimeMillis();
        for (int i = 0; i < chips.length; i++) {
            boolean on = i == selected;
            int far = selected < 0 ? 0 : Math.abs(i - selected);
            float nudge = selected < 0 ? 0 : Math.signum(i - selected) * push;
            float scale = on ? 1 + SWELL : 1 - SHRINK;
            if (instant) {
                x[i].jump(nudge);
                sx[i].jump(scale);
                sy[i].jump(scale);
                continue;
            }
            float k = STIFF * (1 - .12f * Math.min(far, 3));
            boolean busy = !x[i].atRest(1e-3f, 1e-3f) || !sx[i].atRest(1e-3f, 1e-3f) || !sy[i].atRest(1e-3f, 1e-3f);
            long delay = busy ? 0 : far * STAGGER_MS;
            aim(x[i], nudge, k, .9f, BOUNCE, now + delay);
            aim(sx[i], scale, k * (1 + .24f * jelly), .9f - .1f * jelly,
                    Math.min(.85f, BOUNCE + .3f * jelly), now + delay);
            aim(sy[i], scale, k * (1 - .14f * jelly), .9f + .05f * jelly, BOUNCE,
                    now + delay + (long) (50 * jelly));
        }
        if (instant) {
            paint();
        } else {
            loop.start();
        }
    }

    private static void aim(Spring spring, float to, float k, float mass, float bounce, long at) {
        spring.target = to;
        spring.startsAt = at;
        spring.tune(k, PortMath.damping(k, mass, bounce), mass);
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        boolean moving = false;
        long uptime = android.os.SystemClock.uptimeMillis();
        for (Spring[] set : all) {
            for (Spring spring : set) {
                if (uptime < spring.startsAt) {
                    moving = true;
                    continue;
                }
                moving |= spring.step(seconds, SUBSTEPS, 1e-4f, 1e-3f);
            }
        }
        paint();
        return moving;
    }

    @Override
    public void snap() {
        for (int i = 0; i < chips.length; i++) {
            x[i].jump(x[i].target);
            sx[i].jump(sx[i].target);
            sy[i].jump(sy[i].target);
        }
        paint();
    }

    private void paint() {
        for (int i = 0; i < chips.length; i++) {
            chips[i].setTranslationX(x[i].value);
            chips[i].setScaleX(sx[i].value);
            chips[i].setScaleY(sy[i].value);
        }
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        super.onMeasure(widthSpec, heightSpec);
        int widest = 0;
        for (TextView chip : chips) widest = Math.max(widest, chip.getMeasuredWidth());
        int side = (int) Math.ceil(widest * SWELL * 1.3f / 2 + BARGE_DP * density) + Math.round(2 * density);
        if (side != getPaddingLeft()) {
            setPadding(side, 0, side, 0);
            super.onMeasure(widthSpec, heightSpec);
        }
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        if (!placed) {
            placed = true;
            apply(true);
            post(() -> centerSelected(false));
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        loop.stop();
        super.onDetachedFromWindow();
    }

    /** Keeps the chosen chip in view; a narrow screen cannot show them all. */
    private void centerSelected(boolean smooth) {
        ViewParent parent = getParent();
        if (selected < 0 || !(parent instanceof HorizontalScrollView)) return;
        HorizontalScrollView scroll = (HorizontalScrollView) parent;
        View chip = chips[selected];
        int to = chip.getLeft() + chip.getWidth() / 2 - scroll.getWidth() / 2;
        if (smooth && Motion.enabled()) scroll.smoothScrollTo(to, 0);
        else scroll.scrollTo(to, 0);
    }
}
