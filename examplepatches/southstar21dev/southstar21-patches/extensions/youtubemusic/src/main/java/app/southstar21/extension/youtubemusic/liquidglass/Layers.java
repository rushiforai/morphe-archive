package app.southstar21.extension.youtubemusic.liquidglass;

import android.annotation.SuppressLint;
import android.graphics.RecordingCanvas;
import android.graphics.RenderNode;

/**
 * Keeps the result of a node's RenderEffect (blur, refraction) from one frame to the next.
 * <p>
 * The GPU applies a node's effect where the node is drawn, and with the OpenGL renderer (most
 * phones a few years old) it doesn't keep the result: the effect ran again on every frame the
 * app drew, even when nothing under the glass had moved (YouTube Music draws all the time while
 * a song plays: the equalizer on Home, the scrolling title in the player). A layer, though, is
 * kept until what's in it changes. So each node with an effect is drawn only inside a layer of
 * its own, and the effect runs when that layer is drawn again: when what's behind the glass
 * changed.
 */
@SuppressLint("NewApi")
final class Layers {
    private Layers() {
    }

    /**
     * Records {@code holder} (a node with a compositing layer) to draw {@code node} at its
     * origin, and returns it. Changes to {@code node} reach the layer on their own.
     */
    static RenderNode hold(RenderNode holder, RenderNode node) {
        int w = node.getWidth(), h = node.getHeight();
        if (holder.getWidth() != w || holder.getHeight() != h || !holder.hasDisplayList()) {
            holder.setPosition(0, 0, w, h);
            RecordingCanvas canvas = holder.beginRecording(w, h);
            try {
                canvas.drawRenderNode(node);
            } finally {
                holder.endRecording();
            }
        }
        return holder;
    }

    /** A node to hold another's result: {@link #hold}. */
    static RenderNode holder(String name) {
        RenderNode node = new RenderNode(name);
        node.setUseCompositingLayer(true, null);
        return node;
    }
}
