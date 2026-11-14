package android.view;

import android.graphics.Canvas;

/**
 * Android 9's hidden android.view.DisplayListCanvas (AOSP android-9.0.0_r1), the members the Android 9 extension uses.
 * On Android 9 it extends the hidden android.view.RecordingCanvas, a Canvas.
 */
public final class DisplayListCanvas extends Canvas {
    public void insertReorderBarrier() {
        throw new RuntimeException("Stub");
    }

    public void insertInorderBarrier() {
        throw new RuntimeException("Stub");
    }

    public void drawRenderNode(RenderNode renderNode) {
        throw new RuntimeException("Stub");
    }
}
