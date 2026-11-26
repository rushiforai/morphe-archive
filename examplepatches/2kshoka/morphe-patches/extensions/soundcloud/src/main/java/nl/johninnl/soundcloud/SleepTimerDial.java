package nl.johninnl.soundcloud;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.Build;
import android.os.SystemClock;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;

/**
 * Circular time selector. The value is one continuous angle (see {@link SleepTimerMath}), so
 * every full turn adds 60 minutes in either direction and nothing resets at the 60 mark.
 *
 * Gestures: a touch jumps the handle to the finger by the shortest way, dragging follows the
 * finger by deltas (any number of turns), lifting the finger starts an inertial fling that then
 * settles on a whole minute, and holding the finger still saves the value as a favourite.
 *
 * While a timer is running the view is a read-only countdown: the centre shows the time left.
 *
 * The view keeps no reference to an Activity other than the Context it was created with, and it
 * removes all its callbacks when it is detached from the window.
 */
final class SleepTimerDial extends View {
    interface Listener {
        /** Called every time the selected whole minute changes. */
        void onMinutesChanged(int minutes);

        /** Called when the finger is held on the dial. */
        void onLongPressSave(int minutes);

        /** A tap in the centre: starts the timer, or stops it while it runs. */
        void onCenterTap();

        /** The "+5 min" button, shown instead of the caption while the timer runs. */
        void onAddTime();
    }

    private static final int ACCENT = 0xFFFF5500; // SoundCloud orange
    /** Haptics fire per minute change but never more often than this (see the audit notes). */
    private static final long HAPTIC_MIN_INTERVAL_MS = 25;
    private static final double SNAP_RATE = 18.0;
    private static final double JUMP_RATE = 9.0;
    /** Hold time to save a value; the indicator starts after a short delay so that taps stay clean. */
    private static final long HOLD_MS = 800;
    private static final long HOLD_INDICATOR_DELAY_MS = 120;
    private static final long HOLD_FADE_MS = 320;
    /** While the timer runs the handle glides to the time left with the same easing as a jump. */
    private static final double FOLLOW_RATE = 9.0;
    private static final String ADD_LABEL = "+5 мин";
    private static final int RUN_NONE = 0;
    private static final int RUN_PILL = 1;
    private static final int RUN_CENTRE = 2;

    private static final int PHASE_IDLE = 0;
    private static final int PHASE_FLING = 1;
    private static final int PHASE_ANIMATE = 2;

    private final int trackColor;
    private final int tickColor;
    private final int textColor;
    private final int subTextColor;
    private final float density;
    private final int touchSlop;

    private final Paint trackPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint doneTurnsPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint arcPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint minorTickPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint majorTickPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint handlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint handleRingPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint mainTextPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint subTextPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint holdPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint pillFillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint pillStrokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint pillTextPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF oval = new RectF();
    private final RectF holdOval = new RectF();
    private final RectF pillRect = new RectF();

    private float cx;
    private float cy;
    private float ringRadius;
    private float strokeWidth;
    private float handleRadius;
    private float innerTouchRadius;
    private float outerTouchRadius;
    private float centreRadius;
    private float[] minorTicks = new float[0];
    private float[] majorTicks = new float[0];

    private final SleepTimerMath.Drag drag = new SleepTimerMath.Drag();
    private final SleepTimerMath.Velocity velocity = new SleepTimerMath.Velocity();
    private final SleepTimerMath.Inertia inertia = new SleepTimerMath.Inertia();

    private Listener listener;
    private boolean running;
    private long remainingMillis;
    private boolean dragging;
    private boolean longPressFired;
    private boolean touchedCentre;
    private boolean tapCandidate;
    private boolean moved;
    private float downX;
    private float downY;
    private int lastMinute = SleepTimerMath.MIN_MINUTES;
    private long lastHapticAt;

    private int phase = PHASE_IDLE;
    private long lastFrameAt;
    private double animTarget;
    private double animRate = SNAP_RATE;

    // running countdown: the displayed handle angle glides towards the angle of the time left
    private double runDeg;
    private double runTarget;
    private boolean following;
    private boolean everSynced;
    private int runGesture = RUN_NONE;
    private boolean pillPressed;

    // hold-to-save indicator
    private long holdStartAt;
    private long holdDoneAt;

    SleepTimerDial(Context context, boolean dark) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        trackColor = dark ? 0x33FFFFFF : 0x1F000000;
        tickColor = dark ? 0x66FFFFFF : 0x66000000;
        textColor = dark ? 0xFFFFFFFF : 0xFF1A1A1A;
        subTextColor = dark ? 0xB3FFFFFF : 0x99000000;

        trackPaint.setStyle(Paint.Style.STROKE);
        trackPaint.setColor(trackColor);
        doneTurnsPaint.setStyle(Paint.Style.STROKE);
        doneTurnsPaint.setColor((ACCENT & 0x00FFFFFF) | 0x66000000);
        arcPaint.setStyle(Paint.Style.STROKE);
        arcPaint.setStrokeCap(Paint.Cap.ROUND);
        arcPaint.setColor(ACCENT);
        minorTickPaint.setColor(tickColor);
        majorTickPaint.setColor(tickColor);
        handlePaint.setStyle(Paint.Style.FILL);
        handlePaint.setColor(0xFFFFFFFF);
        handleRingPaint.setStyle(Paint.Style.STROKE);
        handleRingPaint.setColor(ACCENT);
        mainTextPaint.setTextAlign(Paint.Align.CENTER);
        mainTextPaint.setTypeface(Typeface.DEFAULT_BOLD);
        mainTextPaint.setColor(textColor);
        subTextPaint.setTextAlign(Paint.Align.CENTER);
        subTextPaint.setColor(subTextColor);
        holdPaint.setStyle(Paint.Style.STROKE);
        holdPaint.setStrokeCap(Paint.Cap.ROUND);
        pillFillPaint.setStyle(Paint.Style.FILL);
        pillStrokePaint.setStyle(Paint.Style.STROKE);
        pillStrokePaint.setColor(ACCENT);
        pillTextPaint.setTextAlign(Paint.Align.CENTER);
        pillTextPaint.setTypeface(Typeface.DEFAULT_BOLD);
        pillTextPaint.setColor(ACCENT);
        setHapticFeedbackEnabled(true);
        setContentDescription("Круговой выбор времени таймера сна");
    }

    void setListener(Listener listener) {
        this.listener = listener;
    }

    int getSelectedMinutes() {
        // While the handle glides to a chosen value, the chosen value is already the selection.
        return SleepTimerMath.minutesOf(phase == PHASE_ANIMATE ? animTarget : drag.total);
    }

    /** Selects a value; with animate=true the handle glides there (any number of turns). */
    void setSelectedMinutes(int minutes, boolean animate) {
        if (running) {
            // The countdown shows the time left; only remember what to return to after a stop.
            drag.total = SleepTimerMath.degreesOf(minutes);
            lastMinute = SleepTimerMath.minutesOf(drag.total);
            if (listener != null) listener.onMinutesChanged(lastMinute);
            return;
        }
        stopMotion();
        double target = SleepTimerMath.degreesOf(minutes);
        if (animate) {
            animTarget = target;
            animRate = JUMP_RATE;
            startFrames(PHASE_ANIMATE);
        } else {
            drag.total = target;
            invalidate();
        }
        lastMinute = SleepTimerMath.minutesOf(target);
        if (listener != null) listener.onMinutesChanged(lastMinute);
    }

    /**
     * Switches between the selector and the countdown. While running, the handle glides to the
     * angle of the time left (so "+5 min" and a restart with another value are animated) and the
     * dial is no longer dragged. When the timer ends or is stopped, the handle glides back to the
     * value that was selected.
     */
    void setRunning(boolean running, long remainingMillis) {
        boolean was = this.running;
        this.remainingMillis = Math.max(0, remainingMillis);
        if (running) {
            runTarget = this.remainingMillis / 60_000.0 * SleepTimerMath.DEGREES_PER_MINUTE;
            if (!was) {
                // keep a glide that is still going on: the chosen value is its target
                double selection = phase == PHASE_ANIMATE ? animTarget : drag.total;
                double shown = drag.total;
                stopMotion();
                drag.total = selection;
                // a window that opens on an already running timer starts at the time left, no glide
                runDeg = everSynced ? shown : runTarget;
            }
            this.running = true;
            startFollow();
        } else if (was) {
            this.running = false;
            stopFollow();
            // glide from the countdown position back to the selected value
            double selection = drag.total;
            drag.total = SleepTimerMath.clampDegrees(runDeg);
            animTarget = selection;
            animRate = JUMP_RATE;
            lastMinute = SleepTimerMath.minutesOf(selection);
            startFrames(PHASE_ANIMATE);
            if (listener != null) listener.onMinutesChanged(lastMinute);
        }
        everSynced = true;
        invalidate();
    }

    // ---- geometry ----------------------------------------------------------------------------

    private float dp(float v) {
        return v * density;
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        float size = Math.min(w, h);
        cx = w / 2f;
        cy = h / 2f;
        strokeWidth = size * 0.07f;
        handleRadius = strokeWidth * 0.95f;
        ringRadius = size / 2f - handleRadius - dp(2);
        oval.set(cx - ringRadius, cy - ringRadius, cx + ringRadius, cy + ringRadius);
        innerTouchRadius = ringRadius * 0.35f;
        centreRadius = ringRadius * 0.64f;
        outerTouchRadius = size / 2f + dp(8);
        holdOval.set(cx - centreRadius, cy - centreRadius, cx + centreRadius, cy + centreRadius);

        trackPaint.setStrokeWidth(strokeWidth);
        doneTurnsPaint.setStrokeWidth(strokeWidth);
        arcPaint.setStrokeWidth(strokeWidth);
        minorTickPaint.setStrokeWidth(Math.max(1f, dp(1)));
        majorTickPaint.setStrokeWidth(Math.max(2f, dp(2)));
        handleRingPaint.setStrokeWidth(Math.max(2f, dp(2.5f)));
        holdPaint.setStrokeWidth(Math.max(2f, dp(3f)));
        pillStrokePaint.setStrokeWidth(Math.max(1.5f, dp(1.5f)));
        mainTextPaint.setTextSize(size * 0.22f);
        subTextPaint.setTextSize(size * 0.072f);

        float outer = ringRadius - strokeWidth * 0.9f;
        minorTicks = new float[48 * 4];
        majorTicks = new float[12 * 4];
        int minor = 0;
        int major = 0;
        for (int i = 0; i < 60; i++) {
            double a = Math.toRadians(i * 6.0);
            float sin = (float) Math.sin(a);
            float cos = (float) Math.cos(a);
            boolean isMajor = i % 5 == 0;
            float inner = outer - (isMajor ? strokeWidth * 0.75f : strokeWidth * 0.35f);
            float[] target = isMajor ? majorTicks : minorTicks;
            int at = isMajor ? major++ * 4 : minor++ * 4;
            target[at] = cx + outer * sin;
            target[at + 1] = cy - outer * cos;
            target[at + 2] = cx + inner * sin;
            target[at + 3] = cy - inner * cos;
        }
    }

    // ---- drawing -----------------------------------------------------------------------------

    @Override
    protected void onDraw(Canvas canvas) {
        double total = running ? Math.max(0, runDeg) : drag.total;

        canvas.drawCircle(cx, cy, ringRadius, trackPaint);
        canvas.drawLines(minorTicks, minorTickPaint);
        canvas.drawLines(majorTicks, majorTickPaint);

        int turns = SleepTimerMath.turnsBehind(total);
        double sweep = SleepTimerMath.sweepOf(total);
        if (turns > 0) canvas.drawCircle(cx, cy, ringRadius, doneTurnsPaint);
        if (sweep > 0) canvas.drawArc(oval, -90f, (float) sweep, false, arcPaint);

        double theta = Math.toRadians(sweep);
        float hx = cx + ringRadius * (float) Math.sin(theta);
        float hy = cy - ringRadius * (float) Math.cos(theta);
        float hr = (dragging && !touchedCentre) ? handleRadius * 1.18f : handleRadius;
        canvas.drawCircle(hx, hy, hr, handlePaint);
        canvas.drawCircle(hx, hy, hr, handleRingPaint);

        drawHoldIndicator(canvas);

        if (running) {
            drawCountdownCentre(canvas);
            return;
        }

        int minutes = SleepTimerMath.minutesOf(drag.total);
        String main = String.valueOf(minutes);
        String sub = "мин";
        String sub2 = minutes >= 60 ? SleepTimerMath.formatMinutes(minutes) : null;
        mainTextPaint.setTextSize(Math.min(getWidth(), getHeight()) * (main.length() > 3 ? 0.17f : 0.22f));
        Paint.FontMetrics mf = mainTextPaint.getFontMetrics();
        Paint.FontMetrics sf = subTextPaint.getFontMetrics();
        float mainH = mf.descent - mf.ascent;
        float subH = sf.descent - sf.ascent;
        float gap = dp(2);
        float block = mainH + gap + subH + (sub2 != null ? gap + subH : 0);
        float top = cy - block / 2f;
        canvas.drawText(main, cx, top - mf.ascent, mainTextPaint);
        float y = top + mainH + gap;
        canvas.drawText(sub, cx, y - sf.ascent, subTextPaint);
        if (sub2 != null) canvas.drawText(sub2, cx, y + subH + gap - sf.ascent, subTextPaint);
    }

    /** Ring that fills while the finger is held (after a short delay) and fades out once saved. */
    private void drawHoldIndicator(Canvas canvas) {
        if (running) return;
        long now = SystemClock.uptimeMillis();
        if (holdStartAt != 0) {
            float p = (now - holdStartAt - HOLD_INDICATOR_DELAY_MS) / (float) (HOLD_MS - HOLD_INDICATOR_DELAY_MS);
            if (p <= 0f) return;
            p = Math.min(1f, p);
            holdPaint.setColor((ACCENT & 0x00FFFFFF) | 0x33000000);
            canvas.drawCircle(cx, cy, centreRadius, holdPaint);
            holdPaint.setColor(ACCENT);
            canvas.drawArc(holdOval, -90f, 360f * p, false, holdPaint);
        } else if (holdDoneAt != 0) {
            float f = (now - holdDoneAt) / (float) HOLD_FADE_MS;
            if (f >= 1f) return;
            int alpha = (int) (255 * (1f - f));
            holdPaint.setColor((ACCENT & 0x00FFFFFF) | (alpha << 24));
            canvas.drawCircle(cx, cy, centreRadius * (1f + 0.06f * f), holdPaint);
        }
    }

    /** Centre while the timer runs: the clock and a "+5 min" button instead of a caption. */
    private void drawCountdownCentre(Canvas canvas) {
        float size = Math.min(getWidth(), getHeight());
        String main = SleepTimerMath.formatClock(remainingMillis);
        mainTextPaint.setTextSize(size * (main.length() > 5 ? 0.15f : 0.19f));
        pillTextPaint.setTextSize(size * 0.072f);

        Paint.FontMetrics mf = mainTextPaint.getFontMetrics();
        Paint.FontMetrics pf = pillTextPaint.getFontMetrics();
        float mainH = mf.descent - mf.ascent;
        float textH = pf.descent - pf.ascent;
        float padX = size * 0.045f;
        float padY = size * 0.02f;
        float pillW = pillTextPaint.measureText(ADD_LABEL) + 2 * padX;
        float pillH = textH + 2 * padY;
        float gap = size * 0.03f;

        float top = cy - (mainH + gap + pillH) / 2f;
        canvas.drawText(main, cx, top - mf.ascent, mainTextPaint);

        float pillTop = top + mainH + gap;
        pillRect.set(cx - pillW / 2f, pillTop, cx + pillW / 2f, pillTop + pillH);
        pillFillPaint.setColor((ACCENT & 0x00FFFFFF) | (pillPressed ? 0x66000000 : 0x26000000));
        canvas.drawRoundRect(pillRect, pillH / 2f, pillH / 2f, pillFillPaint);
        canvas.drawRoundRect(pillRect, pillH / 2f, pillH / 2f, pillStrokePaint);
        canvas.drawText(ADD_LABEL, cx, pillTop + padY - pf.ascent, pillTextPaint);
    }

    private boolean pillHit(float x, float y) {
        float m = dp(8);
        return running && x >= pillRect.left - m && x <= pillRect.right + m
            && y >= pillRect.top - m && y <= pillRect.bottom + m;
    }

    // ---- touch -------------------------------------------------------------------------------

    private final Runnable longPress = new Runnable() {
        @Override
        public void run() {
            if (!dragging || longPressFired) return;
            longPressFired = true;
            holdStartAt = 0;
            holdDoneAt = SystemClock.uptimeMillis();
            removeCallbacks(holdFrame);
            postOnAnimation(holdFrame);
            int minutes = getSelectedMinutes();
            performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            if (listener != null) listener.onLongPressSave(minutes);
        }
    };

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        float dx = event.getX() - cx;
        float dy = event.getY() - cy;
        double dist = Math.hypot(dx, dy);
        if (running) return onRunningTouch(event, dist);

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN: {
                if (dist > outerTouchRadius) return false;
                if (getParent() != null) getParent().requestDisallowInterceptTouchEvent(true);
                boolean centre = dist < centreRadius;
                // A tap in the centre must not disturb a glide that is still going on.
                if (!centre) stopMotion();
                velocity.clear();
                touchedCentre = centre;
                tapCandidate = centre;
                moved = false;
                if (!centre) drag.down(SleepTimerMath.angleOf(dx, dy));
                dragging = true;
                longPressFired = false;
                downX = event.getX();
                downY = event.getY();
                velocity.add(event.getEventTime(), drag.total);
                notifyMinuteChange(true);
                startHold();
                invalidate();
                return true;
            }
            case MotionEvent.ACTION_MOVE: {
                if (!dragging) return false;
                if (longPressFired) return true;
                if (!moved && Math.hypot(event.getX() - downX, event.getY() - downY) > touchSlop) {
                    moved = true;
                    tapCandidate = false;
                    cancelHold();
                    if (touchedCentre) stopMotion(); // a drag that started in the centre takes over
                }
                if (dist >= innerTouchRadius && (!touchedCentre || moved)) {
                    // Leaving the centre mid-gesture starts following from the current finger angle.
                    if (touchedCentre) {
                        drag.down(SleepTimerMath.angleOf(dx, dy));
                        touchedCentre = false;
                    } else {
                        drag.move(SleepTimerMath.angleOf(dx, dy));
                    }
                    velocity.add(event.getEventTime(), drag.total);
                    notifyMinuteChange(true);
                    invalidate();
                }
                return true;
            }
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL: {
                if (!dragging) return false;
                cancelHold();
                dragging = false;
                boolean cancelled = event.getActionMasked() == MotionEvent.ACTION_CANCEL;
                if (tapCandidate && !moved && !longPressFired && !cancelled) {
                    tapCandidate = false;
                    performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
                    invalidate();
                    if (listener != null) listener.onCenterTap();
                    return true;
                }
                if (touchedCentre && !moved) { // held (or cancelled) in the centre without any drag
                    invalidate();
                    return true;
                }
                if (!longPressFired && !cancelled && !touchedCentre) {
                    inertia.start(velocity.perSecond(event.getEventTime()));
                }
                if (inertia.active()) {
                    startFrames(PHASE_FLING);
                } else {
                    animTarget = SleepTimerMath.snapDegrees(drag.total);
                    animRate = SNAP_RATE;
                    startFrames(PHASE_ANIMATE);
                }
                invalidate();
                return true;
            }
            default:
                return true;
        }
    }

    /** While the timer runs the dial is not dragged: the centre stops it, the pill adds time. */
    private boolean onRunningTouch(MotionEvent event, double dist) {
        float x = event.getX();
        float y = event.getY();
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                if (dist > outerTouchRadius) return false;
                if (pillHit(x, y)) runGesture = RUN_PILL;
                else if (dist < centreRadius) runGesture = RUN_CENTRE;
                else return false;
                pillPressed = runGesture == RUN_PILL;
                downX = x;
                downY = y;
                if (getParent() != null) getParent().requestDisallowInterceptTouchEvent(true);
                invalidate();
                return true;
            case MotionEvent.ACTION_MOVE:
                if (runGesture == RUN_NONE) return false;
                if (Math.hypot(x - downX, y - downY) > touchSlop) {
                    runGesture = RUN_NONE;
                    pillPressed = false;
                    invalidate();
                }
                return true;
            case MotionEvent.ACTION_UP: {
                int gesture = runGesture;
                runGesture = RUN_NONE;
                pillPressed = false;
                invalidate();
                if (gesture == RUN_PILL && pillHit(x, y)) {
                    performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
                    if (listener != null) listener.onAddTime();
                } else if (gesture == RUN_CENTRE && dist < centreRadius) {
                    performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
                    if (listener != null) listener.onCenterTap();
                }
                return gesture != RUN_NONE;
            }
            case MotionEvent.ACTION_CANCEL:
                runGesture = RUN_NONE;
                pillPressed = false;
                invalidate();
                return true;
            default:
                return true;
        }
    }

    // ---- motion ------------------------------------------------------------------------------

    private final Runnable frame = new Runnable() {
        @Override
        public void run() {
            long now = SystemClock.uptimeMillis();
            double dt = Math.min(0.05, Math.max(0.0, (now - lastFrameAt) / 1000.0));
            lastFrameAt = now;
            boolean again = false;

            if (phase == PHASE_FLING) {
                double delta = inertia.step(dt);
                double before = drag.total;
                drag.total = SleepTimerMath.clampDegrees(drag.total + delta);
                boolean hitEnd = drag.total == before && delta != 0;
                if (hitEnd) inertia.stop();
                notifyMinuteChange(true);
                if (inertia.active()) {
                    again = true;
                } else {
                    animTarget = SleepTimerMath.snapDegrees(drag.total);
                    animRate = SNAP_RATE;
                    phase = PHASE_ANIMATE;
                }
            }
            if (phase == PHASE_ANIMATE) {
                double diff = animTarget - drag.total;
                if (Math.abs(diff) < 0.05) {
                    drag.total = animTarget;
                    phase = PHASE_IDLE;
                } else {
                    drag.total += diff * (1.0 - Math.exp(-animRate * dt));
                    again = true;
                }
                notifyMinuteChange(false);
            }
            invalidate();
            if (again) postOnAnimation(this);
        }
    };

    private final Runnable holdFrame = new Runnable() {
        @Override
        public void run() {
            long now = SystemClock.uptimeMillis();
            boolean again = false;
            if (holdStartAt != 0) {
                again = true;
            } else if (holdDoneAt != 0) {
                if (now - holdDoneAt < HOLD_FADE_MS) again = true;
                else holdDoneAt = 0;
            }
            invalidate();
            if (again) postOnAnimation(this);
        }
    };

    private void startHold() {
        removeCallbacks(longPress);
        holdStartAt = SystemClock.uptimeMillis();
        holdDoneAt = 0;
        postDelayed(longPress, HOLD_MS);
        removeCallbacks(holdFrame);
        postOnAnimation(holdFrame);
    }

    private void cancelHold() {
        removeCallbacks(longPress);
        holdStartAt = 0;
        invalidate();
    }

    private final Runnable followFrame = new Runnable() {
        @Override
        public void run() {
            long now = SystemClock.uptimeMillis();
            double dt = Math.min(0.05, Math.max(0.0, (now - followLastAt) / 1000.0));
            followLastAt = now;
            double diff = runTarget - runDeg;
            boolean again = false;
            if (Math.abs(diff) < 0.02) {
                runDeg = runTarget;
                following = false;
            } else {
                runDeg += diff * (1.0 - Math.exp(-FOLLOW_RATE * dt));
                again = true;
            }
            invalidate();
            if (again) postOnAnimation(this);
        }
    };
    private long followLastAt;

    private void startFollow() {
        if (following) return;
        following = true;
        followLastAt = SystemClock.uptimeMillis();
        removeCallbacks(followFrame);
        postOnAnimation(followFrame);
    }

    private void stopFollow() {
        following = false;
        removeCallbacks(followFrame);
    }

    private void startFrames(int newPhase) {
        phase = newPhase;
        lastFrameAt = SystemClock.uptimeMillis();
        removeCallbacks(frame);
        postOnAnimation(frame);
    }

    private void stopMotion() {
        removeCallbacks(frame);
        removeCallbacks(longPress);
        removeCallbacks(holdFrame);
        holdStartAt = 0;
        holdDoneAt = 0;
        inertia.stop();
        phase = PHASE_IDLE;
    }

    /** Notifies on every new whole minute; the haptic tick is tied to this change only. */
    private void notifyMinuteChange(boolean haptic) {
        int minutes = SleepTimerMath.minutesOf(drag.total);
        if (minutes == lastMinute) return;
        lastMinute = minutes;
        if (phase == PHASE_ANIMATE) return; // gliding to an already announced value
        if (haptic) tick();
        if (listener != null) listener.onMinutesChanged(minutes);
    }

    private void tick() {
        long now = SystemClock.uptimeMillis();
        if (now - lastHapticAt < HAPTIC_MIN_INTERVAL_MS) return;
        lastHapticAt = now;
        performHapticFeedback(Build.VERSION.SDK_INT >= 34
            ? HapticFeedbackConstants.SEGMENT_FREQUENT_TICK
            : HapticFeedbackConstants.CLOCK_TICK);
    }

    @Override
    protected void onDetachedFromWindow() {
        stopMotion();
        stopFollow();
        super.onDetachedFromWindow();
    }
}
