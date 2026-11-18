package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

/**
 * Bencho's Reorder list for the player menu's sections: the row you hold is free and only its height
 * decides where the list opens, while neighbouring rows fuse like liquid. The fusing is the source's own
 * blur-and-threshold, applied only during a drag and only on Android 12+, where a view can carry it.
 * TalkBack moves a row with its actions, a D-pad by holding select to lift it, and a keyboard with Alt.
 */
final class ArrangeList extends FrameLayout implements Motion.Step {
    private static final float FACE_DP = 44, GAP_DP = 6;
    private static final float LIQUID_K = 220, LIQUID_C = 14, LIQUID_M = .5f;
    private static final float GROW_DP = 12;
    private static final float GIVE = .5f, LEAN = .18f;
    private static final int TINT_MS = 220;
    private static final float EDGE_DP = 56, EDGE_SPEED_DP = 900;
    /** Custom accessibility action ids, outside the standard actions' range. */
    private static final int MOVE_UP = 0x7e5a0001, MOVE_DOWN = 0x7e5a0002;

    /** One row: a section's name and whether it shows. */
    static final class Row {
        final String id;
        final String label;
        boolean visible;

        Row(String id, String label, boolean visible) {
            this.id = id;
            this.label = label;
            this.visible = visible;
        }
    }

    private final Ui ui;
    private final List<Row> rows;
    private final int[] order;
    private final Spring[] y, grow;
    private final float[] tint;
    private final View[] ink;
    private final TextView[] labels;
    private final Blobs blobs;
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final float density;
    private final Consumer<List<Row>> onChange;
    /** A row's face grows with the font; its touch target is the whole step, gap included. */
    private final int face, step;
    private final int slop, holdMs;
    private final int[] spot = new int[2];
    private final AccessibilityNodeInfo.AccessibilityAction moveUp, moveDown;
    private final Runnable pickUpAfterHold = () -> pickUp(true);
    private ScrollView scroller;
    private int scrollAtStart;
    /** The row a finger is on, before the hold that lifts it in a list that scrolls. */
    private int pressed = -1;
    private float downX, downY;
    private int held = -1;
    private int heldSlot;
    private float heldStartY, lastY;
    private long lastAt;
    private float velocity;
    private long tintAt;
    /** The row a D-pad or keyboard lifted, and the key whose release must not also click it. */
    private int lifted = -1;
    private int swallowUp;

    ArrangeList(Context context, Ui ui, List<Row> rows, Consumer<List<Row>> onChange) {
        super(context);
        this.ui = ui;
        this.rows = rows;
        this.onChange = onChange;
        density = context.getResources().getDisplayMetrics().density;
        slop = ViewConfiguration.get(context).getScaledTouchSlop();
        holdMs = ViewConfiguration.getLongPressTimeout() / 2;
        face = Math.max(px(FACE_DP), ui.text(context, "", 15, 0, true).getLineHeight() + px(16));
        step = face + px(GAP_DP);
        moveUp = new AccessibilityNodeInfo.AccessibilityAction(MOVE_UP, Text.label("上へ移動", "Move up"));
        moveDown = new AccessibilityNodeInfo.AccessibilityAction(MOVE_DOWN, Text.label("下へ移動", "Move down"));
        order = new int[rows.size()];
        y = new Spring[rows.size()];
        grow = new Spring[rows.size()];
        tint = new float[rows.size()];
        ink = new View[rows.size()];
        labels = new TextView[rows.size()];
        blobs = new Blobs(context);
        addView(blobs, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        for (int i = 0; i < rows.size(); i++) {
            order[i] = i;
            y[i] = new Spring(i * step).tune(LIQUID_K, LIQUID_C, LIQUID_M);
            grow[i] = new Spring(0).tune(LIQUID_K, LIQUID_C, LIQUID_M);
            ink[i] = rowView(context, i);
            addView(ink[i], new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, step, Gravity.TOP));
        }
        applyPositions();
    }

    private int px(float dp) {
        return Math.round(dp * density);
    }

    private View rowView(Context context, int index) {
        Row row = rows.get(index);
        LinearLayout view = new LinearLayout(context);
        view.setGravity(Gravity.CENTER_VERTICAL);
        view.setPadding(px(16), 0, px(6), 0);
        view.setContentDescription(row.label);
        TextView label = ui.text(context, row.label, 15, ui.secondary, true);
        label.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        labels[index] = label;
        view.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        LiquidSwitch toggle = new LiquidSwitch(context, ui);
        toggle.setChecked(row.visible, false);
        toggle.setListener(on -> {
            row.visible = on;
            onChange.accept(currentOrder());
        });
        view.addView(toggle);
        toggle.speakThrough(view, new LiquidSwitch.Voice(toggle) {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                int slot = slotOf(index);
                // Holding is the D-pad's way to lift; TalkBack has the move actions instead.
                info.setLongClickable(false);
                info.removeAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_LONG_CLICK);
                if (slot > 0) info.addAction(moveUp);
                if (slot < order.length - 1) info.addAction(moveDown);
                info.setCollectionItemInfo(AccessibilityNodeInfo.CollectionItemInfo.obtain(slot, 1, 0, 1, false));
            }

            @Override
            public boolean performAccessibilityAction(View host, int action, Bundle arguments) {
                if (action == MOVE_UP || action == MOVE_DOWN) return shift(index, action == MOVE_UP ? -1 : 1);
                return super.performAccessibilityAction(host, action, arguments);
            }
        });
        // Select toggles the switch, as on any switch row; holding select lifts the row for the arrows.
        view.setOnClickListener(v -> toggle.toggle());
        view.setOnLongClickListener(v -> lift(index));
        view.setOnKeyListener((v, keyCode, e) -> onRowKey(index, keyCode, e));
        view.setOnFocusChangeListener((v, focused) -> {
            if (!focused && lifted == index) drop();
            blobs.invalidate();
        });
        view.setOnTouchListener((v, e) -> onRowTouch(index, e));
        return view;
    }

    private List<Row> currentOrder() {
        List<Row> result = new ArrayList<>(order.length);
        for (int id : order) result.add(rows.get(id));
        return result;
    }

    private int slotOf(int id) {
        for (int slot = 0; slot < order.length; slot++) if (order[slot] == id) return slot;
        return 0;
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        super.onMeasure(widthSpec, MeasureSpec.makeMeasureSpec(step * rows.size(), MeasureSpec.EXACTLY));
    }

    /** Each row is laid out at its slot, so focus moves, TalkBack's order and scrolling to a row follow the list. */
    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        blobs.layout(0, 0, r - l, b - t);
        for (int slot = 0; slot < order.length; slot++) ink[order[slot]].layout(0, slot * step, r - l, (slot + 1) * step);
        applyPositions();
    }

    @Override
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setCollectionInfo(AccessibilityNodeInfo.CollectionInfo.obtain(rows.size(), 1, false));
    }

    // ---- touch ----

    private ScrollView findScroller() {
        for (ViewParent parent = getParent(); parent instanceof View; parent = parent.getParent()) {
            if (parent instanceof ScrollView) return (ScrollView) parent;
        }
        return null;
    }

    /**
     * A list that fits lifts the row at once, as the source does. One that scrolls, such as the dialog on a
     * phone in landscape, lifts it after a short hold, so a swipe that starts on a row still scrolls.
     */
    private boolean onRowTouch(int id, MotionEvent e) {
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                if (held != -1 || pressed != -1) return false;
                if (lifted != -1) drop();
                pressed = id;
                downX = e.getRawX();
                downY = e.getRawY();
                lastY = downY;
                lastAt = SystemClock.uptimeMillis();
                scroller = findScroller();
                if (scroller != null && (scroller.canScrollVertically(-1) || scroller.canScrollVertically(1))) {
                    postDelayed(pickUpAfterHold, holdMs);
                } else {
                    pickUp(false);
                }
                return true;
            case MotionEvent.ACTION_MOVE:
                if (held == id) {
                    long now = SystemClock.uptimeMillis();
                    float dt = Math.max(8, now - lastAt);
                    velocity = Math.max(-3, Math.min(3, (e.getRawY() - lastY) / density / dt * 16));
                    lastY = e.getRawY();
                    lastAt = now;
                    follow();
                } else if (pressed == id) {
                    lastY = e.getRawY();
                    if (Math.hypot(e.getRawX() - downX, e.getRawY() - downY) > slop) cancelHold();
                }
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                if (pressed == id) cancelHold();
                if (held == id) release();
                return true;
            default:
                return true;
        }
    }

    private void cancelHold() {
        pressed = -1;
        removeCallbacks(pickUpAfterHold);
    }

    private void pickUp(boolean afterHold) {
        int id = pressed;
        pressed = -1;
        if (id == -1 || held != -1) return;
        getParent().requestDisallowInterceptTouchEvent(true);
        held = id;
        heldSlot = slotOf(id);
        heldStartY = lastY;
        scrollAtStart = scroller == null ? 0 : scroller.getScrollY();
        lastAt = SystemClock.uptimeMillis();
        velocity = 0;
        raise(id);
        setGoo(true);
        if (afterHold) performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
        loop.start();
    }

    /** The held row stays under the finger, also while the list scrolls under it. */
    private void follow() {
        int scrolled = scroller == null ? 0 : scroller.getScrollY() - scrollAtStart;
        float next = heldSlot * step + lastY - heldStartY + scrolled;
        y[held].value = next;
        y[held].target = next;
        y[held].velocity = 0;
        int want = PortMath.slotAt(next, step, rows.size());
        if (want != slotOf(held)) {
            move(held, want);
            performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
        }
        applyPositions();
    }

    private void release() {
        int id = held;
        held = -1;
        velocity = 0;
        lower(id);
        retarget();
        onChange.accept(currentOrder());
    }

    // ---- keys and TalkBack ----

    private static boolean confirmKey(int keyCode) {
        return keyCode == KeyEvent.KEYCODE_DPAD_CENTER || keyCode == KeyEvent.KEYCODE_ENTER
                || keyCode == KeyEvent.KEYCODE_NUMPAD_ENTER || keyCode == KeyEvent.KEYCODE_SPACE;
    }

    /** Arrows move a lifted row, or any row with Alt or Ctrl held; select, Back or Escape put a lifted row down. */
    private boolean onRowKey(int id, int keyCode, KeyEvent e) {
        boolean down = e.getAction() == KeyEvent.ACTION_DOWN;
        if (!down && keyCode == swallowUp) {
            swallowUp = 0;
            return true;
        }
        boolean vertical = keyCode == KeyEvent.KEYCODE_DPAD_UP || keyCode == KeyEvent.KEYCODE_DPAD_DOWN;
        if (vertical && (lifted == id || e.isAltPressed() || e.isCtrlPressed())) {
            if (down) shift(id, keyCode == KeyEvent.KEYCODE_DPAD_UP ? -1 : 1);
            return true;
        }
        boolean putDown = confirmKey(keyCode) || keyCode == KeyEvent.KEYCODE_BACK || keyCode == KeyEvent.KEYCODE_ESCAPE;
        if (lifted == id && down && putDown) {
            // A repeat is the select that lifted it, still held.
            if (e.getRepeatCount() == 0) {
                drop();
                swallowUp = keyCode;
            }
            return true;
        }
        return false;
    }

    private boolean lift(int id) {
        if (held != -1 || pressed != -1) return false;
        if (lifted != -1) drop();
        lifted = id;
        raise(id);
        return true;
    }

    private void drop() {
        int id = lifted;
        lifted = -1;
        if (id != -1) lower(id);
    }

    /** Moves a row one place and says where it now is. */
    private boolean shift(int id, int delta) {
        int to = slotOf(id) + delta;
        if (held != -1 || to < 0 || to >= order.length) return false;
        move(id, to);
        onChange.accept(currentOrder());
        View row = ink[id];
        row.requestRectangleOnScreen(new Rect(0, 0, row.getWidth(), row.getHeight()));
        row.announceForAccessibility(Text.label(order.length + " 個中 " + (to + 1) + " 番目に移動しました",
                "Moved to position " + (to + 1) + " of " + order.length));
        return true;
    }

    // ---- motion ----

    private void raise(int id) {
        grow[id].target = GROW_DP * density;
        labels[id].setTextColor(ui.text);
        tintAt = 0;
        loop.start();
    }

    private void lower(int id) {
        grow[id].target = 0;
        labels[id].setTextColor(ui.secondary);
        loop.start();
    }

    private void move(int id, int slot) {
        System.arraycopy(PortMath.reorder(order, id, slot), 0, order, 0, order.length);
        // Straight to the new slots, without waiting for a layout pass; the springs carry the look.
        for (int s = 0; s < order.length; s++) {
            View row = ink[order[s]];
            if (row.getTop() != s * step) row.offsetTopAndBottom(s * step - row.getTop());
        }
        retarget();
    }

    private void retarget() {
        for (int slot = 0; slot < order.length; slot++) {
            int id = order[slot];
            if (id != held) y[id].target = slot * step;
        }
        loop.start();
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        if (tintAt == 0) tintAt = nowMs;
        boolean moving = held != -1;
        if (held != -1 && scroller != null) {
            scroller.getLocationOnScreen(spot);
            float speed = PortMath.edgeScroll(lastY, spot[1], spot[1] + scroller.getHeight(), px(EDGE_DP), px(EDGE_SPEED_DP));
            int by = Math.round(speed * seconds);
            if (by != 0 && scroller.canScrollVertically(by)) {
                scroller.scrollBy(0, by);
                follow();
            }
        }
        for (int i = 0; i < rows.size(); i++) {
            if (i != held) moving |= y[i].step(seconds, 8, .1f * density, 1f);
            moving |= grow[i].step(seconds, 8, .05f * density, .5f);
            float want = i == held || i == lifted ? 1 : 0;
            float t = (nowMs - tintAt) / (float) TINT_MS;
            float next = t >= 1 ? want : tint[i] + (want - tint[i]) * Math.min(1, t);
            if (next != tint[i]) moving = true;
            tint[i] = next;
        }
        applyPositions();
        if (!moving) setGoo(false);
        return moving;
    }

    @Override
    public void snap() {
        for (int i = 0; i < rows.size(); i++) {
            y[i].jump(y[i].target);
            grow[i].jump(grow[i].target);
            tint[i] = i == held || i == lifted ? 1 : 0;
        }
        applyPositions();
        setGoo(false);
    }

    private void applyPositions() {
        for (int i = 0; i < rows.size(); i++) ink[i].setTranslationY(y[i].value - ink[i].getTop());
        blobs.invalidate();
    }

    @Override
    protected void onDetachedFromWindow() {
        cancelHold();
        loop.stop();
        super.onDetachedFromWindow();
    }

    /** The metaball is blur then alpha threshold (2.6 blur, cut 28), both from the source's filter. */
    private void setGoo(boolean on) {
        if (Build.VERSION.SDK_INT < 31 || !Motion.enabled()) return;
        if (!on) {
            blobs.setRenderEffect(null);
            return;
        }
        float radius = 2.6f * density;
        float sigma = (radius - .5f) / .57735f;
        ColorMatrix threshold = new ColorMatrix(new float[]{
                1, 0, 0, 0, 0,
                0, 1, 0, 0, 0,
                0, 0, 1, 0, 0,
                0, 0, 0, 28, -14 * 255});
        blobs.setRenderEffect(RenderEffect.createChainEffect(
                RenderEffect.createColorFilterEffect(new ColorMatrixColorFilter(threshold)),
                RenderEffect.createBlurEffect(sigma, sigma, Shader.TileMode.CLAMP)));
    }

    private final class Blobs extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG), ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        Blobs(Context context) {
            super(context);
            ring.setStyle(Paint.Style.STROKE);
            ring.setStrokeWidth(2 * density);
            ring.setColor(ui.accent);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float height = face, inset = (step - face) / 2f;
            float squash = 1 + Math.abs(velocity) * GIVE * .12f;
            float wide = 1 / squash;
            float tilt = velocity * LEAN * 2.6f;
            for (int i = 0; i < rows.size(); i++) {
                paint.setColor(i == held || tint[i] > 0 ? blend(ui.card, ui.dark ? 0xFF2C2C33 : 0xFFE8E8EE, tint[i]) : ui.card);
                float extra = grow[i].value / 2;
                rect.set(getPaddingLeft() - extra, 0, getWidth() + extra, height);
                int saved = canvas.save();
                canvas.translate(0, y[i].value + inset);
                if (i == held) {
                    canvas.scale(wide, squash, getWidth() / 2f, height / 2);
                    canvas.skew(0, (float) Math.tan(Math.toRadians(tilt)));
                }
                canvas.drawRoundRect(rect, height / 2, height / 2, paint);
                // A keyboard or D-pad needs to see which row it is on; touch never focuses one.
                if (ink[i].isFocused()) {
                    float half = ring.getStrokeWidth() / 2;
                    rect.inset(half, half);
                    canvas.drawRoundRect(rect, height / 2 - half, height / 2 - half, ring);
                }
                canvas.restoreToCount(saved);
            }
        }

        private int blend(int from, int to, float t) {
            int fr = (from >> 16) & 255, fg = (from >> 8) & 255, fb = from & 255;
            int tr = (to >> 16) & 255, tg = (to >> 8) & 255, tb = to & 255;
            return 0xFF000000 | Math.round(fr + (tr - fr) * t) << 16 | Math.round(fg + (tg - fg) * t) << 8
                    | Math.round(fb + (tb - fb) * t);
        }
    }
}
