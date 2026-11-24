package app.liquidmusic.extension;

import android.annotation.TargetApi;
import android.graphics.RenderEffect;
import android.graphics.RuntimeShader;
import android.os.Build;

/**
 * AGSL {@link RuntimeShader} for Liquid Glass edge refraction, chromatic aberration,
 * and specular rim highlights on Android 13+ (API 33+).
 */
@TargetApi(Build.VERSION_CODES.TIRAMISU)
final class GlassShader {

    private static final String AGSL_SOURCE =
            "uniform shader content;\n"
            + "uniform float2 resolution;\n"
            + "uniform float cornerRadius;\n"
            + "uniform float refractionHeight;\n"
            + "uniform float refractionAmount;\n"
            + "uniform float chromaticAberration;\n"
            + "uniform float highlightStrength;\n"
            + "\n"
            + "float sdRoundedRect(float2 p, float2 halfSize, float r) {\n"
            + "    float2 q = abs(p) - halfSize + r;\n"
            + "    return min(max(q.x, q.y), 0.0) + length(max(q, 0.0)) - r;\n"
            + "}\n"
            + "\n"
            + "half4 sampleClamped(float2 coord) {\n"
            + "    float2 c = clamp(coord, float2(0.5), resolution - float2(0.5));\n"
            + "    return content.eval(c);\n"
            + "}\n"
            + "\n"
            + "half4 main(float2 fragCoord) {\n"
            + "    float2 halfSize = resolution * 0.5;\n"
            + "    float r = clamp(cornerRadius, 0.0, min(halfSize.x, halfSize.y));\n"
            + "    float2 p = fragCoord - halfSize;\n"
            + "    float d = sdRoundedRect(p, halfSize, r);\n"
            + "    if (d > 0.5) {\n"
            + "        return half4(0.0);\n"
            + "    }\n"
            + "\n"
            + "    float eps = 1.0;\n"
            + "    float dx = sdRoundedRect(p + float2(eps, 0.0), halfSize, r) - sdRoundedRect(p - float2(eps, 0.0), halfSize, r);\n"
            + "    float dy = sdRoundedRect(p + float2(0.0, eps), halfSize, r) - sdRoundedRect(p - float2(0.0, eps), halfSize, r);\n"
            + "    float2 grad = float2(dx, dy);\n"
            + "    float gradLen = length(grad);\n"
            + "    float2 normal = gradLen > 0.0001 ? grad / gradLen : float2(0.0, -1.0);\n"
            + "\n"
            + "    float edgeDist = max(-d, 0.0);\n"
            + "    float2 sampleCoord = fragCoord;\n"
            + "    float lens = 0.0;\n"
            + "    if (refractionHeight > 0.5 && refractionAmount > 0.05) {\n"
            + "        float t = clamp(1.0 - edgeDist / refractionHeight, 0.0, 1.0);\n"
            + "        lens = t * t * (3.0 - 2.0 * t);\n"
            + "        sampleCoord = fragCoord - normal * (lens * refractionAmount);\n"
            + "    }\n"
            + "\n"
            + "    half4 color;\n"
            + "    if (chromaticAberration > 0.5 && lens > 0.01) {\n"
            + "        float2 disp = normal * (lens * refractionAmount * 0.14);\n"
            + "        half4 rSample = sampleClamped(sampleCoord + disp);\n"
            + "        half4 gSample = sampleClamped(sampleCoord);\n"
            + "        half4 bSample = sampleClamped(sampleCoord - disp);\n"
            + "        color = half4(rSample.r, gSample.g, bSample.b, gSample.a);\n"
            + "    } else {\n"
            + "        color = sampleClamped(sampleCoord);\n"
            + "    }\n"
            + "\n"
            + "    if (highlightStrength > 0.005) {\n"
            + "        float rimMask = 1.0 - smoothstep(0.0, 2.2, edgeDist);\n"
            + "        float lightDot = dot(normal, normalize(float2(-0.65, -0.76)));\n"
            + "        float specular = pow(max(lightDot, 0.0), 1.8) * 0.58 + pow(max(-lightDot, 0.0), 2.4) * 0.22 + 0.12;\n"
            + "        float rimAlpha = rimMask * specular * highlightStrength;\n"
            + "        color.rgb = mix(color.rgb, half3(1.0), half(clamp(rimAlpha, 0.0, 0.85)));\n"
            + "    }\n"
            + "\n"
            + "    return color;\n"
            + "}\n";

    private final RuntimeShader shader;

    GlassShader() {
        this.shader = new RuntimeShader(AGSL_SOURCE);
    }

    RenderEffect createEffect(
            int width,
            int height,
            float cornerRadiusPx,
            float refractionHeightPx,
            float refractionAmountPx,
            boolean chromaticAberration,
            float highlightStrength
    ) {
        shader.setFloatUniform("resolution", (float) width, (float) height);
        shader.setFloatUniform("cornerRadius", cornerRadiusPx);
        shader.setFloatUniform("refractionHeight", refractionHeightPx);
        shader.setFloatUniform("refractionAmount", refractionAmountPx);
        shader.setFloatUniform("chromaticAberration", chromaticAberration ? 1.0f : 0.0f);
        shader.setFloatUniform("highlightStrength", highlightStrength);
        return RenderEffect.createRuntimeShaderEffect(shader, "content");
    }
}
