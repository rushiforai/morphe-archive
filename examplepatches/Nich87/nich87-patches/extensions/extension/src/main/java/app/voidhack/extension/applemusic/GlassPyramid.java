package app.voidhack.extension.applemusic;

import android.graphics.RecordingCanvas;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.RuntimeShader;

/** A live, cropped RenderNode backdrop with separately rasterized mip levels. */
final class GlassPyramid {
    private static final int MAX_LEVELS = 6;
    private static final int BASE_SCALE = 4;
    private static final int ALIGN = BASE_SCALE << 4;
    private final RenderNode source;
    private final RenderNode capture = new RenderNode("Glass backdrop capture");
    private final RenderNode[] levels = new RenderNode[MAX_LEVELS - 1];
    // Each entry describes the origin and size of one tile in the input of the face shader.
    private final float[] tiles = new float[MAX_LEVELS * 4];
    private int width;
    private int height;
    private int count;
    private int background;
    private float sourceX;
    private float sourceY;

    GlassPyramid(RenderNode source) {
        this.source = source;
        capture.setRenderEffect(RenderEffect.createRuntimeShaderEffect(
                new RuntimeShader(GlassShaders.DOWNSAMPLE), "scene"));
        RenderEffect filter = RenderEffect.createRuntimeShaderEffect(new RuntimeShader(GlassShaders.MIP), "scene");
        for (int i = 0; i < levels.length; i++) {
            levels[i] = new RenderNode("Glass backdrop mip " + i);
            levels[i].setRenderEffect(filter);
        }
    }

    boolean record(RenderNode atlas, int captureWidth, int captureHeight, float x, float y, int color,
                   float maxRadius) {
        int alignedWidth = (captureWidth + ALIGN - 1) / ALIGN * ALIGN;
        int alignedHeight = (captureHeight + ALIGN - 1) / ALIGN * ALIGN;
        double lod = Math.log(maxRadius < 2f ? 1f + 0.5f * maxRadius : maxRadius) / Math.log(2);
        int needed = Math.min(MAX_LEVELS, (int) Math.ceil(lod) + 1);
        boolean resize = width != alignedWidth || height != alignedHeight || count != needed
                || !atlas.hasDisplayList();
        if (!resize && sourceX == x && sourceY == y && background == color) {
            return false;
        }
        count = needed;
        width = alignedWidth;
        height = alignedHeight;
        sourceX = x;
        sourceY = y;
        background = color;
        capture.setPosition(0, 0, width, height);
        RecordingCanvas canvas = capture.beginRecording();
        canvas.drawColor(color);
        canvas.translate(x, y);
        canvas.drawRenderNode(source);
        capture.endRecording();
        if (resize) recordLevels(atlas);
        return resize;
    }

    private void recordLevels(RenderNode atlas) {
        // Each input is drawn into the atlas and, when needed, into a smaller
        // RenderNode that applies the stencil for the following level.
        RenderNode previous = capture;
        int w = width / BASE_SCALE;
        int h = height / BASE_SCALE;
        int tileX = w;
        int tileY = (height - h) / 2;
        atlas.setPosition(0, 0, width, height);
        RecordingCanvas atlasCanvas = atlas.beginRecording();
        for (int i = 0; i < count; i++) {
            float scale = i == 0 ? 1f / BASE_SCALE : 0.5f;
            int save = atlasCanvas.save();
            atlasCanvas.translate(tileX, tileY);
            // Draw the unfiltered mip into the atlas by replaying its input at the same scale.
            atlasCanvas.clipRect(0, 0, w, h);
            atlasCanvas.scale(scale, scale);
            atlasCanvas.drawRenderNode(previous);
            atlasCanvas.restoreToCount(save);
            int tile = i * 4;
            tiles[tile] = tileX;
            tiles[tile + 1] = tileY;
            tiles[tile + 2] = w;
            tiles[tile + 3] = h;
            tileX += w;
            if (i + 1 < count) {
                RenderNode mip = levels[i];
                mip.setPosition(0, 0, w, h);
                RecordingCanvas mipCanvas = mip.beginRecording();
                mipCanvas.scale(scale, scale);
                mipCanvas.drawRenderNode(previous);
                mip.endRecording();
                previous = mip;
                w = Math.max(1, w / 2);
                h = Math.max(1, h / 2);
            }
        }
        atlas.endRecording();
    }

    void setUniforms(RuntimeShader shader) {
        shader.setFloatUniform("levels", tiles);
        shader.setFloatUniform("lastLevel", (float) (count - 1));
        shader.setFloatUniform("captureSize", (float) width, (float) height);
    }

    void release() {
        capture.discardDisplayList();
        for (RenderNode level : levels) level.discardDisplayList();
    }
}
