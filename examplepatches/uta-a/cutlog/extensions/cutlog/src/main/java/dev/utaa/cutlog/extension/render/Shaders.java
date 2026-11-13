package dev.utaa.cutlog.extension.render;

/**
 * 自作の効果のフラグメントシェーダー（{@link ShaderEffect#HEADER} の後ろに付ける本体）。
 * uv は 0〜1、uIntensity は 0〜1、uTime は秒。
 */
final class Shaders {
    private Shaders() {}

    /** 粒子ノイズ。フレームごとに変わる白黒のざらつき。 */
    static final String GRAIN = ""
            + "void main() {\n"
            + "  vec2 uv = vTexSamplingCoord;\n"
            + "  vec4 color = texture2D(uTexSampler, uv);\n"
            + "  float frame = floor(uTime * 30.0);\n"
            + "  float noise = rand(floor(uv * uResolution) + vec2(frame * 17.0, frame * 31.0)) - 0.5;\n"
            + "  color.rgb += noise * 0.35 * uIntensity;\n"
            + "  gl_FragColor = vec4(clamp(color.rgb, 0.0, 1.0), color.a);\n"
            + "}\n";

    /** ビネット。周辺を暗くする。縦長・横長でも円く落ちるよう、縦横比で補正する。 */
    static final String VIGNETTE = ""
            + "void main() {\n"
            + "  vec2 uv = vTexSamplingCoord;\n"
            + "  vec4 color = texture2D(uTexSampler, uv);\n"
            + "  vec2 d = uv - 0.5;\n"
            + "  d.x *= uResolution.x / max(uResolution.x, uResolution.y);\n"
            + "  d.y *= uResolution.y / max(uResolution.x, uResolution.y);\n"
            + "  float r = length(d) * 1.6;\n"
            + "  float shade = 1.0 - smoothstep(0.35, 0.95, r) * (0.25 + 0.7 * uIntensity);\n"
            + "  gl_FragColor = vec4(color.rgb * shade, color.a);\n"
            + "}\n";

    /**
     * VHS。横の揺らぎ、赤と青のずれ、走査線、下から上へ流れるノイズの帯、少し色あせた色味。
     */
    static final String VHS = ""
            + "void main() {\n"
            + "  vec2 uv = vTexSamplingCoord;\n"
            + "  float wobble = sin(uv.y * 40.0 + uTime * 6.0) * 0.0015 + sin(uv.y * 7.0 - uTime * 2.0) * 0.002;\n"
            + "  uv.x += wobble * uIntensity;\n"
            + "  float shift = 0.006 * uIntensity;\n"
            + "  float r = texture2D(uTexSampler, vec2(uv.x + shift, uv.y)).r;\n"
            + "  vec4 base = texture2D(uTexSampler, uv);\n"
            + "  float b = texture2D(uTexSampler, vec2(uv.x - shift, uv.y)).b;\n"
            + "  vec3 color = vec3(r, base.g, b);\n"
            + "  float luma = dot(color, vec3(0.299, 0.587, 0.114));\n"
            + "  color = mix(color, vec3(luma) * vec3(1.05, 1.0, 0.92), 0.3 * uIntensity);\n"
            + "  float scan = 0.5 + 0.5 * sin(uv.y * uResolution.y * 1.2);\n"
            + "  color *= 1.0 - scan * 0.18 * uIntensity;\n"
            + "  float band = fract(uv.y * 0.6 - uTime * 0.25);\n"
            + "  float inBand = smoothstep(0.0, 0.03, band) * (1.0 - smoothstep(0.03, 0.06, band));\n"
            + "  float noise = rand(vec2(floor(uv.y * uResolution.y), floor(uTime * 30.0)) + uv.x);\n"
            + "  color += inBand * noise * 0.5 * uIntensity;\n"
            + "  gl_FragColor = vec4(clamp(color, 0.0, 1.0), base.a);\n"
            + "}\n";

    /**
     * グリッチ。一定の間隔で、ランダムな横の帯をずらし、RGB を分ける。強いほど頻繁で大きくずれる。
     */
    static final String GLITCH = ""
            + "void main() {\n"
            + "  vec2 uv = vTexSamplingCoord;\n"
            + "  float tick = floor(uTime * 12.0);\n"
            + "  float active = step(1.0 - (0.25 + 0.6 * uIntensity), rand(vec2(tick, 3.0)));\n"
            + "  float slice = floor(uv.y * (8.0 + 24.0 * rand(vec2(tick, 7.0))));\n"
            + "  float pick = step(1.0 - 0.4 * uIntensity, rand(vec2(slice, tick)));\n"
            + "  float offset = (rand(vec2(slice + 1.0, tick)) - 0.5) * 0.2 * uIntensity * pick * active;\n"
            + "  uv.x = fract(uv.x + offset);\n"
            + "  float split = 0.012 * uIntensity * active;\n"
            + "  float r = texture2D(uTexSampler, vec2(uv.x + split, uv.y)).r;\n"
            + "  vec4 base = texture2D(uTexSampler, uv);\n"
            + "  float b = texture2D(uTexSampler, vec2(uv.x - split, uv.y)).b;\n"
            + "  gl_FragColor = vec4(r, base.g, b, base.a);\n"
            + "}\n";
}
