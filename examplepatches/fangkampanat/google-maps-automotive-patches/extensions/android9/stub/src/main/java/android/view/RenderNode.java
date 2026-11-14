package android.view;

import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;

/** Android 9's hidden android.view.RenderNode (AOSP android-9.0.0_r1), the members the Android 9 extension uses. */
public class RenderNode {
    public static RenderNode create(String name, View owningView) {
        throw new RuntimeException("Stub");
    }

    public DisplayListCanvas start(int width, int height) {
        throw new RuntimeException("Stub");
    }

    public void end(DisplayListCanvas canvas) {
        throw new RuntimeException("Stub");
    }

    public void discardDisplayList() {
        throw new RuntimeException("Stub");
    }

    public boolean isValid() {
        throw new RuntimeException("Stub");
    }

    public void getMatrix(Matrix outMatrix) {
        throw new RuntimeException("Stub");
    }

    public boolean setLayerType(int layerType) {
        throw new RuntimeException("Stub");
    }

    public boolean setLayerPaint(Paint paint) {
        throw new RuntimeException("Stub");
    }

    public boolean setClipToBounds(boolean clipToBounds) {
        throw new RuntimeException("Stub");
    }

    public boolean setOutline(Outline outline) {
        throw new RuntimeException("Stub");
    }

    public boolean setSpotShadowColor(int color) {
        throw new RuntimeException("Stub");
    }

    public boolean setAmbientShadowColor(int color) {
        throw new RuntimeException("Stub");
    }

    public boolean setClipToOutline(boolean clipToOutline) {
        throw new RuntimeException("Stub");
    }

    public boolean setAlpha(float alpha) {
        throw new RuntimeException("Stub");
    }

    public boolean setHasOverlappingRendering(boolean hasOverlappingRendering) {
        throw new RuntimeException("Stub");
    }

    public boolean setElevation(float lift) {
        throw new RuntimeException("Stub");
    }

    public boolean setTranslationX(float translationX) {
        throw new RuntimeException("Stub");
    }

    public boolean setScaleX(float scaleX) {
        throw new RuntimeException("Stub");
    }

    public boolean setScaleY(float scaleY) {
        throw new RuntimeException("Stub");
    }

    public boolean setPivotX(float pivotX) {
        throw new RuntimeException("Stub");
    }

    public boolean setPivotY(float pivotY) {
        throw new RuntimeException("Stub");
    }

    public boolean setCameraDistance(float distance) {
        throw new RuntimeException("Stub");
    }

    public boolean setLeftTopRightBottom(int left, int top, int right, int bottom) {
        throw new RuntimeException("Stub");
    }
}
