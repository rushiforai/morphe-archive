package app.bin0culars.extension.reddit;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.RecordingCanvas;
import android.graphics.RenderNode;
import android.os.Build;
import java.util.HashMap;
import kotlin.jvm.functions.Function1;

public final class GlassHeaderBlur {

    private static final int MAX_SLOTS = 8;

    static final RenderNode headerNode = new RenderNode("bin0culars_glass_header");
    static final Matrix headerMatrix = new Matrix();

    static {
        headerNode.setClipToBounds(false);
    }

    private static final Matrix SHAPE_MATRIX = new Matrix();
    private static final float[] HEADER_MATRIX_VALUES = new float[9];
    private static final float[] SHAPE_MATRIX_VALUES = new float[9];
    private static final Path CLIP_PATH = new Path();
    private static final HashMap<Long, Slot> SLOTS = new HashMap<>();

    private static boolean headerMode;

    private static final class Slot {
        final RenderNode node = new RenderNode("bin0culars_glass_header_blur");
        float appliedRadius = -1f;
        float relLeft;
        float relTop;
        float width;
        float height;
    }

    private static final Function1<Object, Object> HEADER_DRAW =
            new Function1<Object, Object>() {
                @Override
                public Object invoke(Object scope) {
                    boolean drawn = false;
                    try {
                        GlassBlur.ContentRecorder recState = GlassBlur.recording;
                        Object cc = GlassBlur.composeCanvas(scope);
                        Canvas real = GlassBlur.nativeCanvas(cc);
                        boolean canvasIsRec = recState != null
                                && recState.recCanvas != null
                                && real == recState.recCanvas;
                        if (!GlassBlur.blurActive() || !canvasIsRec) {
                            leaveHeaderMode();
                            drawn = true;
                            GlassNavPatch.drawContent(scope);
                            return null;
                        }

                        long size = GlassNavPatch.drawScopeSize(scope);
                        int w = (int) Math.ceil(Float.intBitsToFloat((int) (size >>> 32)));
                        int h = (int) Math.ceil(Float.intBitsToFloat((int) size));
                        if (w <= 0 || h <= 0) {
                            leaveHeaderMode();
                            drawn = true;
                            GlassNavPatch.drawContent(scope);
                            return null;
                        }

                        real.getMatrix(headerMatrix);
                        headerMode = true;

                        headerNode.setPosition(0, 0, w, h);
                        RecordingCanvas headerRec = headerNode.beginRecording(w, h);
                        // Swap Compose's native canvas so the header records outside ContentRecorder's node.
                        GlassBlur.setNativeCanvas(cc, headerRec);
                        try {
                            drawn = true;
                            GlassNavPatch.drawContent(scope);
                        } finally {
                            GlassBlur.setNativeCanvas(cc, real);
                            headerNode.endRecording();
                        }
                        recState.headerPending = true;
                    } catch (Throwable ignored) {
                        if (!drawn) {
                            try {
                                GlassNavPatch.drawContent(scope);
                            } catch (Throwable ignored2) {
                            }
                        }
                    }
                    return null;
                }
            };

    private GlassHeaderBlur() {}

    public static Object headerModifier(Object modifier) {
        try {
            if (Build.VERSION.SDK_INT < GlassBlur.MIN_SDK || !GlassBlur.glassOn()) {
                return modifier;
            }
            return GlassBlur.drawWithContent(modifier, HEADER_DRAW);
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    static void leaveHeaderMode() {
        try {
            if (!headerMode) {
                return;
            }
            headerMode = false;
            for (Slot slot : SLOTS.values()) {
                slot.node.discardDisplayList();
                slot.appliedRadius = -1f;
            }
            headerNode.discardDisplayList();
        } catch (Throwable ignored) {
        }
    }

    static void drawShapeBlur(Object scope, float left, float top, float w, float h, float radius) {
        try {
            if (!headerMode || !GlassBlur.blurActive() || w <= 0f || h <= 0f) {
                return;
            }
            Canvas canvas = GlassBlur.nativeCanvas(GlassBlur.composeCanvas(scope));
            if (canvas == null || !canvas.isHardwareAccelerated()) {
                return;
            }

            canvas.getMatrix(SHAPE_MATRIX);
            SHAPE_MATRIX.getValues(SHAPE_MATRIX_VALUES);
            float headerRelLeft = SHAPE_MATRIX_VALUES[Matrix.MTRANS_X] + left;
            float headerRelTop = SHAPE_MATRIX_VALUES[Matrix.MTRANS_Y] + top;

            headerMatrix.getValues(HEADER_MATRIX_VALUES);
            float contentLeft = headerRelLeft + HEADER_MATRIX_VALUES[Matrix.MTRANS_X];
            float contentTop = headerRelTop + HEADER_MATRIX_VALUES[Matrix.MTRANS_Y];

            long key = slotKey(headerRelLeft, headerRelTop, w, h);
            Slot slot = SLOTS.get(key);
            if (slot == null) {
                if (SLOTS.size() >= MAX_SLOTS) {
                    for (Slot existing : SLOTS.values()) {
                        existing.node.discardDisplayList();
                    }
                    SLOTS.clear();
                }
                slot = new Slot();
                SLOTS.put(key, slot);
            }
            slot.relLeft = headerRelLeft;
            slot.relTop = headerRelTop;
            slot.width = w;
            slot.height = h;

            slot.appliedRadius = GlassBlur.recordBlurInto(
                    slot.node, slot.appliedRadius, contentLeft, contentTop, w, h);

            int m = (int) Math.ceil(GlassBlur.blurRadiusPx());
            canvas.save();
            try {
                CLIP_PATH.reset();
                CLIP_PATH.addRoundRect(left, top, left + w, top + h, radius, radius, Path.Direction.CW);
                canvas.clipPath(CLIP_PATH);
                canvas.translate(left - m, top - m);
                canvas.drawRenderNode(slot.node);
            } finally {
                canvas.restore();
            }
        } catch (Throwable ignored) {
        }
    }

    static void reRecordSlots() {
        try {
            if (!headerMode || !GlassBlur.blurActive() || GlassBlur.current == null || SLOTS.isEmpty()) {
                return;
            }
            headerMatrix.getValues(HEADER_MATRIX_VALUES);
            float headerTx = HEADER_MATRIX_VALUES[Matrix.MTRANS_X];
            float headerTy = HEADER_MATRIX_VALUES[Matrix.MTRANS_Y];
            for (Slot slot : SLOTS.values()) {
                if (slot.width > 0f && slot.height > 0f) {
                    slot.appliedRadius = GlassBlur.recordBlurInto(
                            slot.node,
                            slot.appliedRadius,
                            slot.relLeft + headerTx,
                            slot.relTop + headerTy,
                            slot.width,
                            slot.height);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static long slotKey(float left, float top, float w, float h) {
        long l = Math.round(left) & 0xFFFFL;
        long t = Math.round(top) & 0xFFFFL;
        long rw = Math.round(w) & 0xFFFFL;
        long rh = Math.round(h) & 0xFFFFL;
        return (l << 48) | (t << 32) | (rw << 16) | rh;
    }
}
