package app.aimal.extension.streaming;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The floating control panel.
 *
 * Built entirely in code from framework views, so no resource patch is needed
 * and nothing depends on the app's own resources.
 *
 * It gets out of the way on its own: a few seconds after the last interaction
 * it collapses to a dim pill showing the current speed. Touching the pill
 * brings it back to full opacity and opens the speed row and aspect toggle.
 */
@SuppressLint("ViewConstructor")
final class ControlPanel extends LinearLayout {
    private static final float[] SPEEDS = {1f, 1.25f, 1.5f, 2f};

    /** Time with no interaction before the panel dims and collapses. */
    private static final long IDLE_MS = 3000;
    private static final float IDLE_ALPHA = 0.25f;

    /**
     * Confirms what the speed control actually reached. Flip to false once
     * speed is known good on both apps.
     */
    private static final boolean SHOW_SPEED_TOAST = true;

    private static final int COLOR_PANEL = 0xCC101014;
    private static final int COLOR_CHIP = 0x33FFFFFF;
    private static final int COLOR_CHIP_SELECTED = 0xFF2F6FED;

    private final int touchSlop;
    private final Handler idleHandler = new Handler(Looper.getMainLooper());

    private TextView collapsedChip;
    private LinearLayout expandedRow;
    private TextView aspectChip;
    private final TextView[] speedChips = new TextView[SPEEDS.length];

    // Drag state.
    private float downRawX;
    private float downRawY;
    private int downMarginLeft;
    private int downMarginTop;
    private boolean dragging;

    private final Runnable idleAction = new Runnable() {
        @Override
        public void run() {
            setExpanded(false);
            animate().alpha(IDLE_ALPHA).setDuration(400).start();
        }
    };

    ControlPanel(Context context) {
        super(context);

        touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();

        setOrientation(HORIZONTAL);
        setGravity(Gravity.CENTER_VERTICAL);
        setPadding(dp(6), dp(6), dp(6), dp(6));
        setBackground(rounded(COLOR_PANEL, dp(22)));
        // Sit above the player's own controls, which the app draws in-tree.
        setElevation(dp(8));

        addView(buildDragHandle());
        addView(buildCollapsedChip());
        addView(buildExpandedRow());

        setExpanded(false);
        syncSelection();
        poke();
    }

    FrameLayout.LayoutParams buildLayoutParams() {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        params.gravity = Gravity.TOP | Gravity.START;
        params.leftMargin = Prefs.panelX(dp(16));
        params.topMargin = Prefs.panelY(dp(96));
        return params;
    }

    @Override
    protected void onDetachedFromWindow() {
        idleHandler.removeCallbacks(idleAction);
        super.onDetachedFromWindow();
    }

    // View construction -------------------------------------------------------

    private TextView buildDragHandle() {
        TextView handle = chip("\u2261", false);
        handle.setOnTouchListener(new OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent event) {
                poke();
                return handleDrag(event);
            }
        });
        return handle;
    }

    private TextView buildCollapsedChip() {
        collapsedChip = chip(speedLabel(Prefs.speed()), true);
        collapsedChip.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                poke();
                setExpanded(true);
            }
        });
        return collapsedChip;
    }

    private LinearLayout buildExpandedRow() {
        expandedRow = new LinearLayout(getContext());
        expandedRow.setOrientation(HORIZONTAL);
        expandedRow.setGravity(Gravity.CENTER_VERTICAL);

        for (int i = 0; i < SPEEDS.length; i++) {
            final float speed = SPEEDS[i];
            TextView view = chip(speedLabel(speed), true);
            view.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View v) {
                    poke();
                    applySpeed(speed);
                }
            });
            speedChips[i] = view;
            expandedRow.addView(view);
        }

        aspectChip = chip(AspectRatio.label(Prefs.aspect()), true);
        aspectChip.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                poke();
                toggleAspect();
            }
        });
        expandedRow.addView(aspectChip);

        TextView close = chip("\u00D7", true);
        close.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                setExpanded(false);
                animate().alpha(IDLE_ALPHA).setDuration(200).start();
            }
        });
        expandedRow.addView(close);

        return expandedRow;
    }

    private TextView chip(String text, boolean clickable) {
        TextView view = new TextView(getContext());
        view.setText(text);
        view.setTextColor(Color.WHITE);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        view.setGravity(Gravity.CENTER);
        view.setPadding(dp(10), dp(6), dp(10), dp(6));
        view.setBackground(rounded(COLOR_CHIP, dp(16)));
        view.setClickable(clickable);
        view.setFocusable(clickable);

        LayoutParams params = new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        params.setMargins(dp(3), 0, dp(3), 0);
        view.setLayoutParams(params);
        return view;
    }

    // Behaviour ---------------------------------------------------------------

    /** Wakes the panel and restarts the idle countdown. */
    private void poke() {
        idleHandler.removeCallbacks(idleAction);
        animate().cancel();
        setAlpha(1f);
        idleHandler.postDelayed(idleAction, IDLE_MS);
    }

    private void setExpanded(boolean value) {
        collapsedChip.setVisibility(value ? GONE : VISIBLE);
        expandedRow.setVisibility(value ? VISIBLE : GONE);
    }

    private void applySpeed(float speed) {
        Prefs.speed(speed);
        collapsedChip.setText(speedLabel(speed));
        syncSelection();

        int players = PlayerBridge.setSpeed(speed);

        if (SHOW_SPEED_TOAST) {
            toast(players > 0
                    ? speedLabel(speed) + " \u2192 " + players + " player(s)"
                    : speedLabel(speed) + " \u2014 no player found");
        }
    }

    private void toggleAspect() {
        int mode = AspectRatio.next(Prefs.aspect());
        Prefs.aspect(mode);
        aspectChip.setText(AspectRatio.label(mode));
        AspectRatio.apply(Controls.currentVideo(), mode);
    }

    private void syncSelection() {
        float current = Prefs.speed();
        for (int i = 0; i < SPEEDS.length; i++) {
            boolean selected = Math.abs(SPEEDS[i] - current) < 0.01f;
            speedChips[i].setBackground(rounded(selected ? COLOR_CHIP_SELECTED : COLOR_CHIP, dp(16)));
        }
    }

    private boolean handleDrag(MotionEvent event) {
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) getLayoutParams();

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downRawX = event.getRawX();
                downRawY = event.getRawY();
                downMarginLeft = params.leftMargin;
                downMarginTop = params.topMargin;
                dragging = false;
                return true;

            case MotionEvent.ACTION_MOVE: {
                float dx = event.getRawX() - downRawX;
                float dy = event.getRawY() - downRawY;
                if (!dragging && Math.hypot(dx, dy) < touchSlop) return true;

                dragging = true;
                View parent = (View) getParent();
                int maxLeft = Math.max(0, parent.getWidth() - getWidth());
                int maxTop = Math.max(0, parent.getHeight() - getHeight());

                params.leftMargin = clamp(downMarginLeft + (int) dx, 0, maxLeft);
                params.topMargin = clamp(downMarginTop + (int) dy, 0, maxTop);
                setLayoutParams(params);
                return true;
            }

            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                if (dragging) Prefs.panelPosition(params.leftMargin, params.topMargin);
                dragging = false;
                return true;

            default:
                return false;
        }
    }

    // Helpers -----------------------------------------------------------------

    private void toast(String message) {
        try {
            Toast.makeText(getContext(), message, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // A toast is never worth taking the player down for.
        }
    }

    private static String speedLabel(float speed) {
        return (speed == (int) speed ? String.valueOf((int) speed) : String.valueOf(speed)) + "\u00D7";
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    private static GradientDrawable rounded(int color, float radius) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(radius);
        return drawable;
    }

    private int dp(int value) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics());
    }
}
