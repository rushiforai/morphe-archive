package android.graphics;

import android.view.DisplayListCanvas;

import app.morphe.extension.mapsautomotive.android9.Android9;

/**
 * Android 10's public RenderNode for Android 9, where the class does not exist (patch "Android 9 (API 28)").
 * <p>
 * Loaded only on Android 9: classes load parent first, so Android 10 and newer always use their own RenderNode. It
 * holds Android 9's hidden android.view.RenderNode, the class Compose itself used before Android 10, and gives each
 * member Maps uses its Android 10 meaning. Compose's layers (GraphicsLayerV29) then run unchanged. The hidden class is
 * reached through the hidden API exemption that {@link Android9} sets for it on Android 9.
 * <p>
 * beginRecording() returns RecordingCanvas, which does not exist on Android 9. The patch sends Maps' one call of it to
 * RenderNode28.beginRecording, which returns {@link #beginRecording28()}'s canvas as a Canvas.
 */
public final class RenderNode {
    /** View.LAYER_TYPE_HARDWARE, Android 9's layer type for a compositing layer. */
    private static final int LAYER_TYPE_HARDWARE = 2;

    private final android.view.RenderNode node;
    private int width, height;
    private DisplayListCanvas recording;

    public RenderNode(String name) {
        Android9.ensureHiddenApiExemptions();
        node = android.view.RenderNode.create(name, null);
    }

    /** Android 9 only: the hidden node, for Canvas28.drawRenderNode. */
    public android.view.RenderNode viewNode28() {
        return node;
    }

    /**
     * Android 10's signature, for RenderNode28's Android 10 path to compile against; never called on Android 9, where
     * RecordingCanvas does not exist (the patch sends Maps' call to RenderNode28 instead).
     */
    public RecordingCanvas beginRecording() {
        throw new UnsupportedOperationException("Android 9: use RenderNode28.beginRecording");
    }

    /** Android 9 only: beginRecording(), with the node's size as Android 10 uses it. */
    public Canvas beginRecording28() {
        if (recording != null) {
            throw new IllegalStateException("Recording currently in progress - missing #endRecording() call?");
        }
        recording = node.start(width, height);
        return recording;
    }

    public void endRecording() {
        DisplayListCanvas canvas = recording;
        if (canvas == null) {
            throw new IllegalStateException("No recording in progress, forgot to call #beginRecording()?");
        }
        recording = null;
        node.end(canvas);
    }

    public void discardDisplayList() {
        node.discardDisplayList();
    }

    public boolean hasDisplayList() {
        return node.isValid();
    }

    public void getMatrix(Matrix outMatrix) {
        node.getMatrix(outMatrix);
    }

    public boolean setPosition(int left, int top, int right, int bottom) {
        width = right - left;
        height = bottom - top;
        return node.setLeftTopRightBottom(left, top, right, bottom);
    }

    public boolean setAlpha(float alpha) {
        return node.setAlpha(alpha);
    }

    public boolean setHasOverlappingRendering(boolean hasOverlappingRendering) {
        return node.setHasOverlappingRendering(hasOverlappingRendering);
    }

    public boolean setElevation(float elevation) {
        return node.setElevation(elevation);
    }

    public boolean setTranslationX(float translationX) {
        return node.setTranslationX(translationX);
    }

    public boolean setScaleX(float scaleX) {
        return node.setScaleX(scaleX);
    }

    public boolean setScaleY(float scaleY) {
        return node.setScaleY(scaleY);
    }

    public boolean setPivotX(float pivotX) {
        return node.setPivotX(pivotX);
    }

    public boolean setPivotY(float pivotY) {
        return node.setPivotY(pivotY);
    }

    /** Android 10 takes a positive distance and stores it negated; Android 9's node takes the stored value. */
    public boolean setCameraDistance(float distance) {
        if (!Float.isFinite(distance) || distance < 0.0f) {
            throw new IllegalArgumentException("distance must be finite & positive, given=" + distance);
        }
        return node.setCameraDistance(-distance);
    }

    public boolean setClipToBounds(boolean clipToBounds) {
        return node.setClipToBounds(clipToBounds);
    }

    public boolean setOutline(Outline outline) {
        return node.setOutline(outline);
    }

    public boolean setClipToOutline(boolean clipToOutline) {
        return node.setClipToOutline(clipToOutline);
    }

    public boolean setSpotShadowColor(int color) {
        return node.setSpotShadowColor(color);
    }

    public boolean setAmbientShadowColor(int color) {
        return node.setAmbientShadowColor(color);
    }

    /** Android 12's member; Maps calls it only on Android 12 and newer. No render effects on Android 9. */
    public boolean setRenderEffect(RenderEffect renderEffect) {
        return false;
    }

    /** Android 10 forces a hardware layer with this paint; Android 9 sets the layer type and its paint. */
    public boolean setUseCompositingLayer(boolean forceToLayer, Paint paint) {
        boolean changed = node.setLayerType(forceToLayer ? LAYER_TYPE_HARDWARE : 0);
        return node.setLayerPaint(paint) | changed;
    }
}
