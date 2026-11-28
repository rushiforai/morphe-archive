package com.waze.gw;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

/** Dark oval speedometer with a cyan-to-blue progress arc for HUD V2. */
public final class HudSpeedometerDial extends FrameLayout {
    private final TextView tvSpeed;
    private final TextView tvUnit;
    private final Paint backgroundPaint;
    private final Paint borderPaint;
    private final Paint arcProgressPaint;
    private final Paint arcTrackPaint;
    private final RectF bounds = new RectF();
    private final RectF arcBounds = new RectF();
    private Shader normalProgressShader;

    private float currentSpeed = 0f;
    private float maxSpeed = 160f;
    private boolean overSpeed;

    public HudSpeedometerDial(Context context) {
        this(context, null);
    }

    public HudSpeedometerDial(Context context, AttributeSet attrs) {
        super(context, attrs);
        setWillNotDraw(false);

        backgroundPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        backgroundPaint.setStyle(Paint.Style.FILL);
        backgroundPaint.setColor(0xFF232832);

        borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        borderPaint.setStyle(Paint.Style.STROKE);
        borderPaint.setStrokeWidth(dp(2));
        borderPaint.setColor(0xFF161920);

        arcTrackPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        arcTrackPaint.setStyle(Paint.Style.STROKE);
        arcTrackPaint.setStrokeCap(Paint.Cap.ROUND);
        arcTrackPaint.setColor(0xFF2C323E);

        arcProgressPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        arcProgressPaint.setStyle(Paint.Style.STROKE);
        arcProgressPaint.setStrokeCap(Paint.Cap.ROUND);

        FrameLayout textContainer = new FrameLayout(context);
        addView(textContainer, new LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        tvSpeed = new TextView(context);
        tvSpeed.setText("0");
        tvSpeed.setTextColor(Color.WHITE);
        tvSpeed.setTextSize(42);
        tvSpeed.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        tvSpeed.setGravity(Gravity.CENTER);
        tvSpeed.setIncludeFontPadding(false);
        ModTypeface.applySpeed(tvSpeed);
        LayoutParams speedLp = new LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER);
        speedLp.bottomMargin = dp(8);
        textContainer.addView(tvSpeed, speedLp);

        tvUnit = new TextView(context);
        tvUnit.setText("Km/h");
        tvUnit.setTextColor(0xFFD8DADF);
        tvUnit.setTextSize(16);
        tvUnit.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        tvUnit.setGravity(Gravity.CENTER);
        tvUnit.setIncludeFontPadding(false);
        LayoutParams unitLp = new LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER_HORIZONTAL | Gravity.BOTTOM);
        unitLp.bottomMargin = dp(16);
        textContainer.addView(tvUnit, unitLp);
    }

    @Override protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        float strokeWidth = dp(7);
        arcProgressPaint.setStrokeWidth(strokeWidth);
        arcTrackPaint.setStrokeWidth(strokeWidth);
        bounds.set(strokeWidth, strokeWidth, w - strokeWidth, h - strokeWidth);
        arcBounds.set(strokeWidth, strokeWidth, w - strokeWidth, h - strokeWidth);
        normalProgressShader = new LinearGradient(
                0, h, w, 0,
                new int[]{0xFF00FFCC, 0xFF00E5FF, 0xFF0066FF},
                new float[]{0f, 0.5f, 1f},
                Shader.TileMode.CLAMP);
        arcProgressPaint.setShader(normalProgressShader);
    }

    @Override protected void onDraw(Canvas canvas) {
        canvas.drawOval(bounds, backgroundPaint);
        canvas.drawOval(bounds, borderPaint);

        float startAngle = 135f;
        // Use one complete semicircular progress track.  The 135° start
        // keeps the gauge visually balanced in the HUD while the 270°
        // sweep gives the dial a full half-circle instead of an overrun.
        float sweepAngle = 270f;
        canvas.drawArc(arcBounds, startAngle, sweepAngle, false, arcTrackPaint);

        float progressFactor = Math.min(1f, Math.max(0f, currentSpeed / maxSpeed));
        float currentSweep = sweepAngle * progressFactor;
        if (currentSweep > 0f) {
            if (overSpeed) {
                arcProgressPaint.setShader(null);
                arcProgressPaint.setColor(0xFFE2231A);
            } else {
                arcProgressPaint.setShader(normalProgressShader);
            }
            canvas.drawArc(arcBounds, startAngle, currentSweep, false, arcProgressPaint);
        }
        super.onDraw(canvas);
    }

    public TextView speedText() {
        return tvSpeed;
    }

    /** Resize both labels when the portrait HUD uses a compact or expanded dial. */
    public void setTextSizes(float speedSp, float unitSp) {
        tvSpeed.setTextSize(Math.max(12f, speedSp));
        tvUnit.setTextSize(Math.max(7f, unitSp));
        ViewGroup.LayoutParams speedParams = tvSpeed.getLayoutParams();
        if (speedParams instanceof LayoutParams) {
            ((LayoutParams) speedParams).bottomMargin = dp(Math.max(3f, unitSp * 0.5f));
            tvSpeed.setLayoutParams(speedParams);
        }
        ViewGroup.LayoutParams unitParams = tvUnit.getLayoutParams();
        if (unitParams instanceof LayoutParams) {
            ((LayoutParams) unitParams).bottomMargin = dp(Math.max(5f, unitSp));
            tvUnit.setLayoutParams(unitParams);
        }
    }

    public void setSpeed(int speedValue) {
        currentSpeed = Math.max(0, speedValue);
        tvSpeed.setText(String.valueOf((int) currentSpeed));
        tvUnit.setText(Units.speedUnit("Km/h"));
        invalidate();
    }

    public void setMaxSpeed(float value) {
        maxSpeed = value > 0f ? value : 160f;
        invalidate();
    }

    /** Compatibility entry point used by HudActivity's existing update loop. */
    public void setValues(int speedValue, int legalLimit, boolean over) {
        overSpeed = over;
        setSpeed(speedValue);
        setMaxSpeed(legalLimit >= 10 ? legalLimit : 160f);
        invalidate();
    }

    private int dp(float value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
