package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Build;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;

import java.util.ArrayDeque;

/**
 * Bencho's Mobile drawer as the player menu's container: a bottom sheet in portrait and the same thing
 * from the right edge in landscape. It re-decides its shape from its real size on every measure, so
 * rotating or folding while it is open just works.
 */
final class Sheet extends FrameLayout implements Motion.Step {
    /** A sheet over another sheet dims more, so the one below, handle and all, reads as set aside. */
    private static final float DIM = .25f, STACKED_DIM = .4f;
    private static final float SETTLE_K = 380, SETTLE_C = 34;
    private static final float RETURN_K = 200, RETURN_C = 40;
    private static final float HANDLE_ZONE_DP = 32, SIDE_HEADER_DP = 64;
    private static final int STAGGER_MAX = 10;
    /** Sheets in a window now; touched on the main thread only. */
    private static int shown;

    private final float density;
    private final int slop;
    private final View scrim;
    private final View handle;
    private final Panel panel;
    private final ScrollView scroll;
    private final LinearLayout content;
    private final Spring position = new Spring(0).tune(SETTLE_K, SETTLE_C, 1);
    private static final long CLOSE_LIMIT_MS = 500;
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final Runnable onClosed;
    private final ArrayDeque<float[]> history = new ArrayDeque<>();
    private final Ui ui;

    /** A scrolling view inside the content; a drag over it closes the sheet only from its top. */
    private View innerScroll;
    private final int[] spot = new int[2];
    private boolean configured, side, opened, closing, candidate, dragging;
    private float downX, downY, dragStart;
    private int topInset, bottomInset, rightInset;

    private final class Panel extends LinearLayout {
        int maxHeight;

        Panel(Context context) {
            super(context);
        }

        @Override
        protected void onMeasure(int widthSpec, int heightSpec) {
            if (!side && maxHeight > 0) {
                heightSpec = MeasureSpec.makeMeasureSpec(
                        Math.min(maxHeight, MeasureSpec.getSize(heightSpec)), MeasureSpec.AT_MOST);
            }
            super.onMeasure(widthSpec, heightSpec);
        }
    }

    private final class Handle extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        Handle(Context context, int color) {
            super(context);
            paint.setColor(color);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f, cy = getHeight() / 2f;
            float along = 18 * density, across = 2 * density;
            if (side) canvas.drawRoundRect(cx - across, cy - along, cx + across, cy + along, across, across, paint);
            else canvas.drawRoundRect(cx - along, cy - across, cx + along, cy + across, across, across, paint);
        }
    }

    Sheet(Context context, Ui ui, LinearLayout content, Runnable onClosed) {
        super(context);
        this.ui = ui;
        this.content = content;
        this.onClosed = onClosed;
        density = context.getResources().getDisplayMetrics().density;
        slop = ViewConfiguration.get(context).getScaledTouchSlop();
        scrim = new View(context);
        scrim.setAlpha(0);
        scrim.setContentDescription(Text.label("閉じる", "Close"));
        scrim.setOnClickListener(v -> close());
        addView(scrim, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        panel = new Panel(context);
        handle = new Handle(context, ui.dark ? 0x55FFFFFF : 0x33000000);
        scroll = new ScrollView(context);
        scroll.setClipToPadding(false);
        scroll.addView(content);
        panel.addView(handle);
        panel.addView(scroll);
        panel.setClipToOutline(true);
        addView(panel);
        setOnApplyWindowInsetsListener((v, insets) -> {
            readInsets(insets);
            requestLayout();
            return insets;
        });
    }

    void setInnerScroll(View view) {
        innerScroll = view;
    }

    /** A see-through, full-window dialog that shows only this sheet. Back closes the sheet. */
    static BackDialog host(Context context, Sheet sheet) {
        BackDialog dialog = new BackDialog(context, android.R.style.Theme_Translucent_NoTitleBar) {
            @Override
            void goBack() {
                sheet.close();
            }
        };
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        dialog.setContentView(sheet);
        android.view.Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(Color.TRANSPARENT));
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.clearFlags(android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setDimAmount(0);
            window.setWindowAnimations(0);
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
            window.setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                    | android.view.WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);
            if (Build.VERSION.SDK_INT >= 30) {
                window.setDecorFitsSystemWindows(false);
                android.view.WindowManager.LayoutParams attributes = window.getAttributes();
                attributes.layoutInDisplayCutoutMode =
                        android.view.WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
                window.setAttributes(attributes);
            }
        }
        return dialog;
    }

    @SuppressWarnings("deprecation")
    private void readInsets(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= 30) {
            // The keyboard counts, so a sheet with a text field rises above it.
            android.graphics.Insets i = insets.getInsets(WindowInsets.Type.systemBars()
                    | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime());
            topInset = i.top;
            bottomInset = i.bottom;
            rightInset = i.right;
        } else {
            topInset = insets.getSystemWindowInsetTop();
            bottomInset = insets.getSystemWindowInsetBottom();
            rightInset = insets.getSystemWindowInsetRight();
        }
    }

    private int px(float dp) {
        return Math.round(dp * density);
    }

    private int dp(int px) {
        return Math.round(px / density);
    }

    /** Shape only depends on the size given here, so it can never disagree with the window. */
    private void place(int width, int height) {
        int widthDp = dp(width), heightDp = dp(height);
        boolean wantSide = Layouts.sidePanel(widthDp, heightDp);
        if (!configured || wantSide != side) {
            configured = true;
            side = wantSide;
            panel.setOrientation(side ? LinearLayout.HORIZONTAL : LinearLayout.VERTICAL);
            panel.setBackground(side
                    ? Ui.corners(getContext(), ui.surface, 24, 0, 0, 24)
                    : Ui.corners(getContext(), ui.surface, 24, 24, 0, 0));
            LinearLayout.LayoutParams handleLp = side
                    ? new LinearLayout.LayoutParams(px(HANDLE_ZONE_DP - 8), ViewGroup.LayoutParams.MATCH_PARENT)
                    : new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, px(HANDLE_ZONE_DP - 8));
            handle.setLayoutParams(handleLp);
            handle.invalidate();
            scroll.setLayoutParams(side
                    ? new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1)
                    : new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            panel.setTranslationX(0);
            panel.setTranslationY(0);
        }
        LayoutParams lp = (LayoutParams) panel.getLayoutParams();
        lp.width = px(Layouts.panelWidth(widthDp, heightDp));
        lp.height = side ? ViewGroup.LayoutParams.MATCH_PARENT : ViewGroup.LayoutParams.WRAP_CONTENT;
        lp.gravity = side ? android.view.Gravity.END | android.view.Gravity.FILL_VERTICAL
                : android.view.Gravity.BOTTOM | android.view.Gravity.CENTER_HORIZONTAL;
        panel.maxHeight = side ? 0 : Layouts.sheetPanelMax(
                px(Layouts.sheetMaxHeight(widthDp, heightDp, dp(topInset))), bottomInset, height, topInset);
        panel.setPadding(0, side ? topInset : 0, side ? rightInset : 0, bottomInset);
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        place(MeasureSpec.getSize(widthSpec), MeasureSpec.getSize(heightSpec));
        super.onMeasure(widthSpec, heightSpec);
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        if (!opened && panel.getHeight() > 0) {
            opened = true;
            position.jump(hiddenOffset());
            paintPosition();
            position.target = 0;
            revealContent();
            loop.start();
        }
    }

    private float hiddenOffset() {
        return (side ? panel.getWidth() : panel.getHeight()) * 1.1f;
    }

    private void paintPosition() {
        float value = position.value;
        if (side) panel.setTranslationX(value);
        else panel.setTranslationY(value);
        float span = Math.max(1, side ? panel.getWidth() : panel.getHeight());
        scrim.setAlpha(1 - Math.max(0, Math.min(1, value / span)));
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        boolean moving = position.step(seconds, 8, .5f, 2f);
        paintPosition();
        if (closing && (position.value >= (side ? panel.getWidth() : panel.getHeight()) || !moving)) {
            finishClose();
            return false;
        }
        return moving;
    }

    @Override
    public void snap() {
        position.jump(position.target);
        paintPosition();
        if (closing) finishClose();
    }

    private void finishClose() {
        if (!closing) return;
        closing = false;
        onClosed.run();
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        scrim.setBackgroundColor(Color.argb(Math.round((shown > 0 ? STACKED_DIM : DIM) * 255), 0, 0, 0));
        shown++;
    }

    @Override
    protected void onDetachedFromWindow() {
        shown--;
        loop.stop();
        super.onDetachedFromWindow();
    }

    void close() {
        if (closing) return;
        closing = true;
        position.tune(SETTLE_K, SETTLE_C, 1);
        position.target = hiddenOffset();
        loop.start();
        // Spring time is capped per frame, so a very slow device must still close promptly.
        postDelayed(this::finishClose, CLOSE_LIMIT_MS);
    }

    /** Sections fade up one after another, the sheet's own rows in the source. */
    private void revealContent() {
        if (!Motion.enabled()) return;
        PathInterpolator out = new PathInterpolator(Ease.OUT[0], Ease.OUT[1], Ease.OUT[2], Ease.OUT[3]);
        for (int i = 0; i < Math.min(STAGGER_MAX, content.getChildCount()); i++) {
            View child = content.getChildAt(i);
            child.setAlpha(0);
            child.setTranslationY(8 * density);
            child.animate().alpha(1).translationY(0).setDuration(220)
                    .setStartDelay(80 + i * 30L).setInterpolator(out).start();
        }
    }

    // ---- dragging ----

    private boolean inPanel(float x, float y) {
        return x >= panel.getX() && x <= panel.getX() + panel.getWidth()
                && y >= panel.getY() && y <= panel.getY() + panel.getHeight();
    }

    private boolean grabbable(float x, float y) {
        if (!inPanel(x, y)) return false;
        float along = side ? x - panel.getX() : y - panel.getY();
        if (along <= HANDLE_ZONE_DP * density) return true;
        if (side) return y - panel.getY() <= SIDE_HEADER_DP * density;
        return !scroll.canScrollVertically(-1) && !(over(innerScroll, x, y) && innerScroll.canScrollVertically(-1));
    }

    private boolean over(View view, float x, float y) {
        if (view == null || !view.isShown()) return false;
        getLocationOnScreen(spot);
        int ownX = spot[0], ownY = spot[1];
        view.getLocationOnScreen(spot);
        float left = spot[0] - ownX, top = spot[1] - ownY;
        return x >= left && x <= left + view.getWidth() && y >= top && y <= top + view.getHeight();
    }

    private float pointer(MotionEvent e) {
        return side ? e.getRawX() : e.getRawY();
    }

    @Override
    public boolean onInterceptTouchEvent(MotionEvent e) {
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                begin(e);
                return false;
            case MotionEvent.ACTION_MOVE:
                return shouldClaim(e);
            default:
                return false;
        }
    }

    private void begin(MotionEvent e) {
        downX = e.getX();
        downY = e.getY();
        dragging = false;
        candidate = !closing && grabbable(e.getX(), e.getY());
        history.clear();
    }

    private boolean shouldClaim(MotionEvent e) {
        if (!candidate || dragging) return dragging;
        float along = side ? e.getX() - downX : e.getY() - downY;
        float across = side ? e.getY() - downY : e.getX() - downX;
        if (along <= slop || along <= Math.abs(across)) return false;
        dragging = true;
        loop.stop();
        dragStart = pointer(e);
        record(e);
        return true;
    }

    private void record(MotionEvent e) {
        history.addLast(new float[]{e.getEventTime(), pointer(e)});
        while (history.size() > 2 && e.getEventTime() - history.peekFirst()[0] > 100) history.pollFirst();
    }

    /** framer's PanInfo velocity: distance over the last 100 ms, in dp/s. */
    private float pointerVelocity() {
        if (history.size() < 2) return 0;
        float[] first = history.peekFirst(), last = history.peekLast();
        float seconds = (last[0] - first[0]) / 1000f;
        return seconds <= 0 ? 0 : (last[1] - first[1]) / seconds / density;
    }

    @Override
    public boolean onTouchEvent(MotionEvent e) {
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                begin(e);
                return candidate;
            case MotionEvent.ACTION_MOVE:
                if (!dragging && !shouldClaim(e)) return candidate;
                position.value = PortMath.sheetFollow(pointer(e) - dragStart);
                position.velocity = 0;
                paintPosition();
                record(e);
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                if (!dragging) return candidate;
                dragging = false;
                record(e);
                float offset = (pointer(e) - dragStart) / density;
                float velocity = pointerVelocity();
                boolean closes = e.getActionMasked() == MotionEvent.ACTION_UP
                        && PortMath.sheetCloses(offset, velocity);
                position.velocity = velocity * density * .7f;
                if (closes) {
                    close();
                } else {
                    position.tune(RETURN_K, RETURN_C, 1);
                    position.target = 0;
                    loop.start();
                }
                return true;
            default:
                return candidate;
        }
    }
}
