package dev.utaa.cutlog.extension.render;

import android.content.Context;
import android.opengl.GLES20;
import dev.utaa.cutlog.shaded.androidx.media3.common.VideoFrameProcessingException;
import dev.utaa.cutlog.shaded.androidx.media3.common.util.GlProgram;
import dev.utaa.cutlog.shaded.androidx.media3.common.util.GlUtil;
import dev.utaa.cutlog.shaded.androidx.media3.common.util.Size;
import dev.utaa.cutlog.shaded.androidx.media3.effect.BaseGlShaderProgram;
import dev.utaa.cutlog.shaded.androidx.media3.effect.GlEffect;
import dev.utaa.cutlog.shaded.androidx.media3.effect.GlShaderProgram;

/**
 * 自作のフラグメントシェーダーで 1 枚ずつ描く効果。シェーダーには次の uniform を渡す（使わないものは
 * 宣言しなくてよい）: {@code uTexSampler}（入力）、{@code uTime}（秒）、{@code uIntensity}（0〜1）、
 * {@code uResolution}（入力の幅・高さ）。テクスチャ座標は {@code vTexSamplingCoord}。
 */
final class ShaderEffect implements GlEffect {
    /** media3 の vertex_shader_transformation_es2 と同じ。 */
    private static final String VERTEX = "#version 100\n"
            + "attribute vec4 aFramePosition;\n"
            + "uniform mat4 uTransformationMatrix;\n"
            + "uniform mat4 uTexTransformationMatrix;\n"
            + "varying vec2 vTexSamplingCoord;\n"
            + "void main() {\n"
            + "  gl_Position = uTransformationMatrix * aFramePosition;\n"
            + "  vec4 texturePosition = vec4(aFramePosition.x * 0.5 + 0.5, aFramePosition.y * 0.5 + 0.5, 0.0, 1.0);\n"
            + "  vTexSamplingCoord = (uTexTransformationMatrix * texturePosition).xy;\n"
            + "}\n";

    /** どのシェーダーにも付ける前置き。乱数は精度が要るため、使えれば highp にする。 */
    static final String HEADER = "#version 100\n"
            + "#ifdef GL_FRAGMENT_PRECISION_HIGH\n"
            + "precision highp float;\n"
            + "#else\n"
            + "precision mediump float;\n"
            + "#endif\n"
            + "uniform sampler2D uTexSampler;\n"
            + "uniform float uTime;\n"
            + "uniform float uIntensity;\n"
            + "uniform vec2 uResolution;\n"
            + "varying vec2 vTexSamplingCoord;\n"
            + "float rand(vec2 co) { return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453); }\n";

    private final String fragment;
    private final float intensity;

    ShaderEffect(String fragmentBody, float intensity) {
        this.fragment = HEADER + fragmentBody;
        this.intensity = intensity;
    }

    @Override
    public GlShaderProgram toGlShaderProgram(Context context, boolean useHdr) throws VideoFrameProcessingException {
        return new Program(fragment, intensity, useHdr);
    }

    private static final class Program extends BaseGlShaderProgram {
        private final GlProgram glProgram;
        private final float intensity;
        private float width;
        private float height;

        Program(String fragment, float intensity, boolean useHdr) throws VideoFrameProcessingException {
            super(/* useHighPrecisionColorComponents= */ useHdr, /* texturePoolCapacity= */ 1);
            this.intensity = intensity;
            try {
                glProgram = new GlProgram(VERTEX, fragment);
            } catch (GlUtil.GlException e) {
                throw new VideoFrameProcessingException(e);
            }
            glProgram.setBufferAttribute(
                    "aFramePosition", GlUtil.getNormalizedCoordinateBounds(), GlUtil.HOMOGENEOUS_COORDINATE_VECTOR_SIZE);
            float[] identity = GlUtil.create4x4IdentityMatrix();
            glProgram.setFloatsUniform("uTransformationMatrix", identity);
            glProgram.setFloatsUniform("uTexTransformationMatrix", identity);
        }

        @Override
        public Size configure(int inputWidth, int inputHeight) {
            width = inputWidth;
            height = inputHeight;
            return new Size(inputWidth, inputHeight);
        }

        @Override
        public void drawFrame(int inputTexId, long presentationTimeUs) throws VideoFrameProcessingException {
            try {
                glProgram.use();
                glProgram.setSamplerTexIdUniform("uTexSampler", inputTexId, /* texUnitIndex= */ 0);
                // 長い動画でも sin の精度が落ちないよう、時刻は 1000 秒ごとに巻き戻す。
                glProgram.setFloatsUniformIfPresent("uTime", new float[] {(presentationTimeUs % 1_000_000_000L) / 1_000_000f});
                glProgram.setFloatsUniformIfPresent("uIntensity", new float[] {intensity});
                glProgram.setFloatsUniformIfPresent("uResolution", new float[] {width, height});
                glProgram.bindAttributesAndUniforms();
                GLES20.glDrawArrays(GLES20.GL_TRIANGLE_STRIP, /* first= */ 0, /* count= */ 4);
            } catch (GlUtil.GlException e) {
                throw new VideoFrameProcessingException(e, presentationTimeUs);
            }
        }

        @Override
        public void release() throws VideoFrameProcessingException {
            super.release();
            try {
                glProgram.delete();
            } catch (GlUtil.GlException e) {
                throw new VideoFrameProcessingException(e);
            }
        }
    }
}
