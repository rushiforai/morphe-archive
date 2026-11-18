package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Bencho's Inline confirm: pressed, the action happens at once and the same pill springs wide to say so
 * and to offer Undo. An undo that is right there is kinder than a question, so no dialog is added.
 */
final class ConfirmPill extends FrameLayout implements Motion.Step {
    static final long GRACE_MS = 5000;

    /** An undo still on offer. Outlives the pill, which is rebuilt with the page around it. */
    static final class Pending {
        final String key;
        final Runnable undo;
        final long since = SystemClock.uptimeMillis();
        long deadline = since + GRACE_MS;
        boolean opening = true;

        Pending(String key, Runnable undo) {
            this.key = key;
            this.undo = undo;
        }

        boolean live() {
            return SystemClock.uptimeMillis() < deadline;
        }

        boolean timed() {
            return deadline != Long.MAX_VALUE;
        }
    }

    private final TextView idle;
    private final LinearLayout done;
    private final TextView undo;
    private final Runnable onExpire;
    private final Spring body;
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG), fuse = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final float density;
    private final int face, target;
    private Pending pending;
    private boolean offerUndo;
    private int idleWidth, doneWidth;
    private boolean measuredOnce;
    private long fadeStart = -1;
    private final Runnable expire = this::expired;

    ConfirmPill(Context context, Ui ui, String idleLabel, String doneLabel, Pending pending, Runnable commit,
                Runnable onUndo, Runnable onExpire) {
        super(context);
        if (pending != null) pending.deadline = PortMath.undoDeadline(pending.since, GRACE_MS,
                recommendedGrace(context), exploring(context));
        this.pending = pending != null && pending.live() ? pending : null;
        offerUndo = this.pending != null && this.pending.opening;
        this.onExpire = onExpire;
        density = context.getResources().getDisplayMetrics().density;
        setWillNotDraw(false);
        body = new Spring(0);
        fill.setColor(ui.dark ? 0x1FFFFFFF : 0x12000000);
        fuse.setColor(ui.accent);

        idle = ui.text(context, idleLabel == null ? "" : idleLabel, 13, ui.text, true);
        // The face grows with the font; the touch target is 48 dp or a little more than the face.
        face = Math.max(Ui.dp(context, 44), idle.getLineHeight() + Ui.dp(context, 16));
        target = Math.max(Ui.dp(context, 48), face + Ui.dp(context, 4));
        idle.setGravity(Gravity.CENTER);
        idle.setCompoundDrawablesRelativeWithIntrinsicBounds(Icons.drawable(context, Icons.Kind.RESET, ui.text, 16), null, null, null);
        idle.setCompoundDrawablePadding(Ui.dp(context, 8));
        idle.setPadding(Ui.dp(context, 16), 0, Ui.dp(context, 16), 0);
        Ui.pressScale(idle);
        idle.setOnClickListener(v -> commit.run());
        addView(idle, new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, target, Gravity.START | Gravity.CENTER_VERTICAL));

        done = new LinearLayout(context);
        done.setGravity(Gravity.CENTER_VERTICAL);
        TextView said = ui.text(context, doneLabel, 13, ui.secondary, false);
        said.setCompoundDrawablesRelativeWithIntrinsicBounds(Icons.drawable(context, Icons.Kind.CHECK, ui.secondary, 14), null, null, null);
        said.setCompoundDrawablePadding(Ui.dp(context, 6));
        said.setPadding(Ui.dp(context, 16), 0, Ui.dp(context, 4), 0);
        // The undo button says it, so TalkBack has one stop that tells what happened and how to take it back.
        said.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        done.addView(said);
        String undoLabel = Text.label("元に戻す", "Undo");
        undo = ui.text(context, undoLabel, 12, ui.accent, true);
        undo.setContentDescription(Text.label(doneLabel + "、" + undoLabel, doneLabel + ", " + undoLabel));
        undo.setCompoundDrawablesRelativeWithIntrinsicBounds(Icons.drawable(context, Icons.Kind.UNDO, ui.accent, 14), null, null, null);
        undo.setCompoundDrawablePadding(Ui.dp(context, 6));
        undo.setGravity(Gravity.CENTER_VERTICAL);
        int undoFace = Math.max(Ui.dp(context, 36), undo.getLineHeight() + Ui.dp(context, 8));
        int inset = Math.max(0, (target - undoFace) / 2);
        undo.setBackground(new InsetDrawable(ui.pressable(context, 0, 18), 0, inset, 0, inset));
        // After the background: its insets would otherwise replace this padding.
        undo.setPadding(Ui.dp(context, 12), 0, Ui.dp(context, 12), 0);
        undo.setOnClickListener(v -> onUndo.run());
        done.addView(undo, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, target));
        addView(done, new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, target, Gravity.START | Gravity.CENTER_VERTICAL));
        setShowing(this.pending != null);
    }

    /** How far the touch target reaches past the face above and below, for callers that line the face up. */
    int targetMargin() {
        return (target - face) / 2;
    }

    /** The user's "time to take action", which Android 10+ applies to anything with a control in it. */
    private static long recommendedGrace(Context context) {
        if (Build.VERSION.SDK_INT < 29) return GRACE_MS;
        AccessibilityManager manager = (AccessibilityManager) context.getSystemService(Context.ACCESSIBILITY_SERVICE);
        return manager == null ? GRACE_MS : manager.getRecommendedTimeoutMillis((int) GRACE_MS,
                AccessibilityManager.FLAG_CONTENT_CONTROLS | AccessibilityManager.FLAG_CONTENT_TEXT
                        | AccessibilityManager.FLAG_CONTENT_ICONS);
    }

    /** With TalkBack, reaching the button takes longer than any fixed grace, so the undo waits. */
    private static boolean exploring(Context context) {
        AccessibilityManager manager = (AccessibilityManager) context.getSystemService(Context.ACCESSIBILITY_SERVICE);
        return manager != null && manager.isTouchExplorationEnabled();
    }

    private void setShowing(boolean showDone) {
        idle.setVisibility(showDone ? INVISIBLE : VISIBLE);
        done.setVisibility(showDone ? VISIBLE : INVISIBLE);
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        super.onMeasure(widthSpec, heightSpec);
        idleWidth = idle.getMeasuredWidth();
        doneWidth = done.getMeasuredWidth();
        setMeasuredDimension(resolveSize(Math.max(idleWidth, doneWidth), widthSpec), target);
        if (!measuredOnce) {
            measuredOnce = true;
            boolean open = pending != null;
            boolean spring = open && pending.opening;
            body.jump(open && !spring ? doneWidth : idleWidth);
            if (spring) {
                pending.opening = false;
                fadeStart = 0;
                body.tune(500, 18, .9f);
                body.target = doneWidth;
                loop.start();
            } else if (open) {
                body.target = doneWidth;
            }
            idle.setAlpha(1);
            done.setAlpha(open && !spring ? 1 : 0);
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (pending != null) {
            if (pending.timed()) postDelayed(expire, Math.max(0, pending.deadline - SystemClock.uptimeMillis()));
            loop.start();
        }
        if (offerUndo) {
            offerUndo = false;
            // The page was rebuilt under TalkBack's focus; it lands on the result and its undo.
            post(() -> undo.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        loop.stop();
        removeCallbacks(expire);
        super.onDetachedFromWindow();
    }

    private void expired() {
        if (pending == null) return;
        pending = null;
        onExpire.run();
        body.tune(380, 34, .9f);
        body.target = idleWidth;
        fadeStart = 0;
        loop.start();
        setShowing(false);
        idle.setAlpha(0);
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        boolean moving = body.step(seconds, 8, .1f, .5f);
        if (fadeStart == 0) fadeStart = nowMs;
        if (fadeStart > 0) {
            float t = Math.min(1, (nowMs - fadeStart) / 220f);
            if (pending != null) done.setAlpha(t);
            else idle.setAlpha(t);
            if (t >= 1) fadeStart = -1;
            else moving = true;
        }
        // The fuse burns down every frame while the undo is timed.
        return moving || pending != null && pending.timed();
    }

    @Override
    public void snap() {
        body.jump(body.target);
        fadeStart = -1;
        if (pending != null) done.setAlpha(1);
        else idle.setAlpha(1);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float width = body.value, top = (getHeight() - face) / 2f, bottom = top + face;
        rect.set(0, top, width, bottom);
        canvas.drawRoundRect(rect, face / 2f, face / 2f, fill);
        if (pending != null && pending.timed()) {
            float left = (pending.deadline - SystemClock.uptimeMillis()) / (float) (pending.deadline - pending.since);
            left = Math.max(0, Math.min(1, left));
            canvas.drawRect(face / 2f, bottom - 2 * density, face / 2f + (width - face) * left, bottom, fuse);
        }
    }
}
