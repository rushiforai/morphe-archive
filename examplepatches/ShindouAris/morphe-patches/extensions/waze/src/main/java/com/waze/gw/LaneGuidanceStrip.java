package com.waze.gw;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.view.View;

/**
 * Compact, resolution-independent lane renderer shared by Bubble and HUD.
 *
 * Waze supplies signed angles in degrees: negative is left, zero is straight, positive is right,
 * and exactly +/-180 is a U-turn. Selected/recommended angles are white; alternatives are muted gray.
 */
final class LaneGuidanceStrip extends View {
    private static final int SELECTED = Color.WHITE;
    private static final int ALTERNATIVE = 0xFF6F7278;
    private static final int SEPARATOR = 0x66FFFFFF;

    private final Paint arrow = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint head = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint separator = new Paint(Paint.ANTI_ALIAS_FLAG);
    private Gateway.LaneSnapshot snapshot = Gateway.LaneSnapshot.EMPTY;
    private String signature = "";

    LaneGuidanceStrip(Context context) {
        super(context);
        arrow.setStyle(Paint.Style.STROKE);
        arrow.setStrokeCap(Paint.Cap.ROUND);
        arrow.setStrokeJoin(Paint.Join.ROUND);
        head.setStyle(Paint.Style.FILL);
        separator.setColor(SEPARATOR);
        setVisibility(GONE);
    }

    boolean setSnapshot(Gateway.LaneSnapshot next) {
        if (next == null) next = Gateway.LaneSnapshot.EMPTY;
        String nextSignature = next.signature();
        if (nextSignature.equals(signature)) return false;
        signature = nextSignature;
        snapshot = next;
        setVisibility(next.size() > 0 ? VISIBLE : GONE);
        invalidate();
        requestLayout();
        return true;
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        Gateway.LaneSnapshot lanes = snapshot;
        int count = lanes.size();
        if (count <= 0 || getWidth() <= 0 || getHeight() <= 0) return;

        float laneWidth = getWidth() / (float) count;
        float h = getHeight();
        separator.setStrokeWidth(Math.max(1f, h * 0.025f));
        for (int lane = 0; lane < count; lane++) {
            if (lane > 0) {
                float x = lane * laneWidth;
                canvas.drawLine(x, h * 0.24f, x, h * 0.78f, separator);
            }
            float left = lane * laneWidth;
            int angleCount = lanes.angleCount(lane);
            // A lane may advertise more than one maneuver. Draw alternatives
            // first so their order in Waze's protobuf can never cover the
            // selected/recommended arrow.
            for (int i = 0; i < angleCount; i++) {
                // Native Waze suppresses an unselected +/-180 entry when the lane also
                // contains another maneuver. Such entries are commonly attached to a
                // straight/right lane as an alternative and otherwise render as a false
                // U-turn loop at the arrow head.
                if (!lanes.isSelected(lane, i)
                        && !(angleCount > 1 && isUTurn(lanes.angleAt(lane, i)))) {
                    drawArrow(canvas, left, laneWidth, h, lanes.angleAt(lane, i), false);
                }
            }
            for (int i = 0; i < angleCount; i++) {
                if (lanes.isSelected(lane, i)) {
                    drawArrow(canvas, left, laneWidth, h, lanes.angleAt(lane, i), true);
                }
            }
        }
    }

    private void drawArrow(Canvas canvas, float left, float width, float height,
                           int angleDegrees, boolean selected) {
        int color = selected ? SELECTED : ALTERNATIVE;
        float stroke = Math.max(2f, Math.min(width, height) * (selected ? 0.115f : 0.10f));
        arrow.setColor(color);
        arrow.setStrokeWidth(stroke);
        head.setColor(color);

        float cx = left + width * 0.5f;
        float startY = height * 0.83f;
        float bendY = height * 0.53f;
        float length = Math.min(width * 0.35f, height * 0.30f);
        int degrees = Math.max(-180, Math.min(180, angleDegrees));

        // Waze's native LaneGuidanceView reserves exactly +/-180 for U-turns. Treating
        // sharp turns (150..179) as U-turns adds a false loop to normal arrows.
        if (isUTurn(degrees)) {
            drawUTurn(canvas, cx, startY, width, height, degrees < 0, stroke);
            return;
        }

        double radians = Math.toRadians(degrees);
        float dx = (float) Math.sin(radians);
        float dy = (float) -Math.cos(radians);
        float endX = cx + dx * length;
        float endY = bendY + dy * length;
        float headLength = stroke * 2.25f;
        // Stop the rounded shaft inside the filled arrow head. Drawing it all the way to the tip
        // leaves Paint.Cap.ROUND visible as a small dot at the point of the arrow.
        float shaftEndX = endX - dx * headLength * 0.52f;
        float shaftEndY = endY - dy * headLength * 0.52f;

        Path body = new Path();
        body.moveTo(cx, startY);
        body.lineTo(cx, bendY + Math.max(0f, dy) * length * 0.18f);
        body.quadTo(cx, bendY, shaftEndX, shaftEndY);
        canvas.drawPath(body, arrow);
        drawHead(canvas, endX, endY, dx, dy, stroke);
    }

    private static boolean isUTurn(int degrees) {
        return Math.abs(Math.max(-180, Math.min(180, degrees))) == 180;
    }

    private void drawUTurn(Canvas canvas, float cx, float startY, float width, float height,
                           boolean leftTurn, float stroke) {
        float side = leftTurn ? -1f : 1f;
        float radius = Math.min(width * 0.24f, height * 0.18f);
        float top = height * 0.27f;
        Path body = new Path();
        body.moveTo(cx, startY);
        body.lineTo(cx, top + radius);
        body.cubicTo(cx, top - radius * 0.25f,
                cx + side * radius * 2f, top - radius * 0.25f,
                cx + side * radius * 2f, top + radius - stroke * 1.17f);
        canvas.drawPath(body, arrow);
        drawHead(canvas, cx + side * radius * 2f, top + radius, 0f, 1f, stroke);
    }

    private void drawHead(Canvas canvas, float x, float y, float dx, float dy, float stroke) {
        float length = stroke * 2.25f;
        float halfWidth = stroke * 1.25f;
        float px = -dy;
        float py = dx;
        Path triangle = new Path();
        triangle.moveTo(x, y);
        triangle.lineTo(x - dx * length + px * halfWidth, y - dy * length + py * halfWidth);
        triangle.lineTo(x - dx * length - px * halfWidth, y - dy * length - py * halfWidth);
        triangle.close();
        canvas.drawPath(triangle, head);
    }
}
