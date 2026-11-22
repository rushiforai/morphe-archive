package app.voidhack.extension.applemusic;

/** AGSL optical passes derived from recovered iOS QuartzCore glass kernels. */
final class GlassShaders {
    private GlassShaders() {}

    // RenderEffect shades at the input size. Replicate each filtered sample across its
    // source cell so that drawing the node smaller preserves that sample at the new texel center.
    static final String DOWNSAMPLE = """
            uniform shader scene;
            half4 main(float2 px) {
                float2 p = floor(px * 0.25) * 4.0 + 2.0;
                return (scene.eval(p + float2(-1, -1)) + scene.eval(p + float2(1, -1))
                      + scene.eval(p + float2(-1, 1)) + scene.eval(p + float2(1, 1))) * 0.25;
            }
            """;

    static final String MIP = """
            uniform shader scene;
            half4 main(float2 px) {
                float2 p = floor(px * 0.5) * 2.0 + 1.0;
                const float a = 1.9600850343704224;
                const float b = 3.9206759929656982;
                float4 center = float4(scene.eval(p));
                float4 axial = float4(scene.eval(p + float2(-a, 0))) + float4(scene.eval(p + float2(a, 0)))
                             + float4(scene.eval(p + float2(0, -a))) + float4(scene.eval(p + float2(0, a)));
                float4 diagonal = float4(scene.eval(p + float2(-a, -a))) + float4(scene.eval(p + float2(a, -a)))
                                + float4(scene.eval(p + float2(-a, a))) + float4(scene.eval(p + float2(a, a)));
                float4 outer = float4(scene.eval(p + float2(-b, 0))) + float4(scene.eval(p + float2(b, 0)))
                             + float4(scene.eval(p + float2(0, -b))) + float4(scene.eval(p + float2(0, b)));
                return half4(center * 0.10549700260162354 + axial * 0.090185999870300293
                           + diagonal * 0.077097997069358826 + outer * 0.056340999901294708);
            }
            """;

    // All geometry is in physical pixels. The gradient points out of the shape.
    private static final String SHAPE = """
            float3 field(float2 p, float2 halfSize, float radius, float ovalization) {
                const float k = 1.5286649465560913;
                float r = max(abs(radius), 0.00001);
                float R = r * k;
                // QuartzCore blends toward circular ends as the bounds narrow.
                float2 c = clamp(2.8915570351735034 - 1.4457785175867517 * (2.0 * halfSize) / R, 0.0, 1.0);
                float inset = mix(R, r, max(c.x, c.y));
                float2 ap = abs(p);
                float2 fromInset = ap - halfSize + inset;
                float inside = min(max(fromInset.x, fromInset.y), 0.0);

                float2 v = max((ap - halfSize + R) / R, 0.0);
                float L = length(v);
                float vmax = max(v.x, v.y);
                float t = vmax == 0.0 ? 0.0 : clamp(min(v.x, v.y) / vmax, 0.0, 1.0);
                float P = (((-0.926054 * t + 3.1560099124908447) * t - 3.64122) * t + 1.26803) * t + 0.268531;
                float rounded = L + 1.0 - 1.0 / (1.0 - t * t * min(L, 1.0) * P);
                float circular = 0.6541655659675598 * length(max(k * v - 0.5286649465560913, 0.0))
                               + 0.3458344340324402;
                float sgn = v.y > v.x ? 1.0 : -1.0;
                float cornerDist = mix(mix(rounded, circular, c.x), mix(rounded, circular, c.y),
                                       clamp(0.5 - sgn + sgn * t, 0.0, 1.0));
                float dist = R * (cornerDist - 1.0) + inside;

                float2 ext = max(fromInset, 0.0);
                float2 normal = fromInset.x > fromInset.y ? float2(1, 0) : float2(0, 1);
                if (dot(ext, ext) > 0.0) normal = normalize(ext);
                normal *= mix(float2(-1), float2(1), step(float2(0), p));
                if (ovalization > 0.0) {
                    float2 oval = p * float2(1.0, halfSize.x / max(halfSize.y, 0.00001));
                    oval /= max(length(oval), 0.00001);
                    normal = normalize(mix(normal, oval, ovalization));
                }
                return float3(dist, normal);
            }

            float3 capsuleField(float2 p, float2 halfSize, float ovalization) {
                return field(p, halfSize, min(halfSize.x, halfSize.y), ovalization);
            }

            float offset(float amount, float height, float depth) {
                float t = clamp(depth / max(height, 0.00001), 0.0, 1.0);
                return amount - amount * sqrt(t * (2.0 - t));
            }

            float lodForRadius(float radius) {
                return log2(radius < 2.0 ? 1.0 + 0.5 * radius : radius);
            }

            float luminance(float3 rgb) {
                return dot(rgb, float3(0.2126, 0.7152, 0.0722));
            }

            // Recovered QuartzCore SDF Gaussian shadow CDF polynomial.
            float sdfGaussian(float z) {
                float s = clamp(z * 0.25 + 0.5, 0.0, 1.0) * 4.0 - 2.0;
                float s2 = s * s;
                return clamp(0.5 + s * (((0.002954483 * s2 - 0.034454346) * s2
                        + 0.16821289) * s2 - 0.56054688), 0.0, 1.0);
            }

            // Recovered QuartzCore set_ycc_composite treatment + premultiplied fill.
            float3 applyFaceYcc(float3 rgb, float whitePt, float blackPt, float sat, float fillAlpha, float fillVal) {
                float y = luminance(rgb);
                float3 treated = sat * (rgb - y) + (whitePt - blackPt) * y + blackPt;
                return treated * (1.0 - fillAlpha) + float3(fillVal * fillAlpha);
            }

            // Recovered sdf_diffuse_kf_highlight_lph lobe.
            float keyFillLobe(float depthPx, float2 normal, float2 dir, float heightPx,
                              float threshold, float rolloff, float curvature) {
                float t = clamp(depthPx / max(heightPx, 0.0001), 0.0, 1.0);
                float profile = mix(t < 1.0 ? 1.0 : 0.0, 1.0 - t, curvature);
                float edge = clamp(0.5 + depthPx, 0.0, 1.0) * clamp(0.5 + (heightPx - depthPx), 0.0, 1.0);
                float angular = clamp((dot(dir, normal) - threshold) / max(1.0 - threshold, 0.0001), 0.0, 1.0);
                float k = profile * edge * angular;
                return k / max(1.0 + (1.0 - k) * rolloff, 0.0001);
            }
            """;

    static final String REGULAR = SHAPE + """
            uniform shader atlas;
            uniform float4 levels[6];
            uniform float lastLevel;
            uniform float2 captureSize;
            uniform float2 extent;
            uniform float cornerRadius;
            uniform float2 center;
            uniform float2 light;
            uniform float density;
            uniform float dark;
            uniform float interaction;
            uniform float parallax;

            float4 levelAt(float2 p, int i) {
                float4 level = levels[0];
                if (i == 1) level = levels[1];
                else if (i == 2) level = levels[2];
                else if (i == 3) level = levels[3];
                else if (i == 4) level = levels[4];
                else if (i == 5) level = levels[5];
                float2 texel = clamp(p * level.zw / captureSize, float2(0.5), level.zw - 0.5);
                return float4(atlas.eval(level.xy + texel));
            }

            float4 backdrop4(float2 p, float lod) {
                float level = clamp(lod, 0.0, lastLevel);
                int lower = int(floor(level));
                if (level == float(lower)) return levelAt(p, lower);
                return mix(levelAt(p, lower), levelAt(p, lower + 1), fract(level));
            }

            float3 unpremulRgb(float4 s) {
                return s.rgb / max(s.a, 0.0001);
            }

            float4 faceSample4(float2 p, float lod) {
                float shift = lod;
                return (backdrop4(p + float2(-shift, -shift), lod) + backdrop4(p + float2(shift, -shift), lod)
                      + backdrop4(p + float2(-shift, shift), lod) + backdrop4(p + float2(shift, shift), lod)) * 0.25;
            }

            float blurLod(float a0, float size, float radius) {
                float span = -1.0 - (-0.5 * size);
                float x = span == 0.0 ? 0.0 : clamp((a0 + 0.5 * size) / span, 0.0, 1.0);
                return lodForRadius(radius * (1.0 - 0.5 * x));
            }

            half4 main(float2 px) {
                float2 p = px - center;
                if (abs(p.x) > extent.x * 0.5 + 48.0 * density
                        || abs(p.y) > extent.y * 0.5 + 56.0 * density) return half4(0);
                float minHalf = max(min(extent.x, extent.y) * 0.5, 0.00001);
                float oval = 0.5 * clamp(cornerRadius / minHalf, 0.0, 1.0);
                float3 shape = field(p, extent * 0.5, cornerRadius, oval);
                float d = shape.x / density;
                float2 sampleAt = px - float2(parallax, 0.0);
                float coverage = clamp(0.5 - shape.x, 0.0, 1.0);
                float size = min(extent.x, extent.y) / density;
                float t = clamp((size - 48.0) / 112.0, 0.0, 1.0);

                float shadowOpacity = 0.0;
                float shadowAlpha = 0.0;
                float3 shadowColor = float3(0);
                float outShAlpha = 0.0;
                float3 outShRgb = float3(0);
                if (coverage < 1.0) {
                    float shadowD = field(p - float2(0.0, 8.0) * density, extent * 0.5, cornerRadius, oval).x / density;
                    float sh = sdfGaussian(shadowD / 24.0);
                    shadowOpacity = sh * mix(mix(0.5, 0.4, dark), 0.25, t);
                    shadowAlpha = shadowOpacity * mix(mix(0.12, 0.0, dark), 1.0, t);
                    if (t > 0.0 && shadowOpacity > 0.0001) {
                        float shAmt = offset(min(0.625 * size, 75.0), 0.4 * size, -d);
                        float3 srgb = unpremulRgb(backdrop4(sampleAt + shape.yz * (shAmt * density), lodForRadius(8.0 * density)));
                        float3 shLight = applyFaceYcc(srgb, 1.0, 0.0, 1.8, 0.12, 0.0);
                        float3 shDark = applyFaceYcc(srgb, 0.5, 0.0, 1.0, 0.0, 0.0);
                        shadowColor = t * mix(shLight, shDark, dark);
                    }
                    float floatSh = sdfGaussian(shadowD / 30.0);
                    float floatAlpha = floatSh * 0.10 * (1.0 - dark);
                    outShAlpha = shadowAlpha + floatAlpha * (1.0 - shadowAlpha);
                    outShRgb = shadowColor * shadowOpacity;
                }
                if (coverage == 0.0) {
                    return half4(clamp(outShRgb, 0.0, 1.0), clamp(outShAlpha, 0.0, 1.0));
                }

                float inner = offset(max(-0.8 * size, -60.0), clamp(0.25 * size, 0.0, 20.0), -d);
                float radius = (1.5 + 4.5 * t) * density * 0.4;
                float4 sample4 = faceSample4(sampleAt + shape.yz * (inner * density), blurLod(d + inner, size, radius));

                float edge = clamp((d + 1.0) * density, 0.0, 1.0) * 0.3;
                if (edge > 0.0) {
                    float outer = offset(0.2 * size, 0.125 * size, -d);
                    float4 lip4 = backdrop4(sampleAt + shape.yz * (outer * density), blurLod(d + outer, size, radius));
                    sample4 = mix(sample4, lip4, edge);
                }
                float3 rgb = unpremulRgb(sample4);

                float3 lightFace = applyFaceYcc(rgb, 1.03, 0.5, 1.0, 0.4, 1.0);
                float3 darkFace = applyFaceYcc(rgb, 0.6, 0.2, 1.0, 0.4, 0.0);
                float3 face = mix(lightFace, darkFace, dark);

                if (t > 0.0) {
                    float bleed = offset(0.35 * size, 0.35 * size, -d);
                    float bleedRadius = min(0.7 * size, 160.0) * 0.5 * density * 0.4;
                    float3 brgb = unpremulRgb(backdrop4(sampleAt + shape.yz * (bleed * density), lodForRadius(bleedRadius)));
                    float3 ambientLight = applyFaceYcc(brgb, 1.0, 0.9, 1.2, 0.0, 0.0);
                    float3 ambientDark = applyFaceYcc(brgb, 0.5, 0.0, 1.0, 0.0, 0.0);
                    float3 ambient = mix(ambientLight, ambientDark, dark);
                    float luma = clamp(luminance(face), 0.0, 1.0);
                    float k = mix(luma, 1.0 - luma, dark);
                    float w = k * k * clamp(1.0 - d, 0.0, 1.0);
                    face = mix(face, ambient, w * w * t * mix(0.5, 0.8, dark));
                }

                float depthPx = -shape.x;
                float2 kDir = normalize(light);
                float topRim = keyFillLobe(depthPx, shape.yz, kDir, 1.35 * density, 0.30, 0.8, 0.82);
                float counterRim = 0.32 * keyFillLobe(depthPx, shape.yz, -kDir, 1.25 * density, 0.42, 0.9, 0.85);
                float3 rimTint = clamp(face * 1.15 + float3(0.34), 0.0, 1.0);
                face = mix(face, rimTint, clamp((topRim + counterRim) * mix(0.14, 0.34, dark), 0.0, 0.36));
                face = clamp(face + interaction * mix(-0.035, 0.07, dark), 0.0, 1.0);
                return half4(clamp(face * coverage + outShRgb * (1.0 - coverage), 0.0, 1.0),
                             clamp(coverage + outShAlpha * (1.0 - coverage), 0.0, 1.0));
            }
            """;

    static final String LENS = SHAPE + """
            uniform shader scene;
            uniform float2 extent;
            uniform float2 center;
            uniform float density;
            uniform float lift;
            uniform float dark;

            float3 below(float2 p) {
                float3 shape = capsuleField(p - center, extent * 0.5, 0.5);
                float coverage = clamp(0.5 - shape.x, 0.0, 1.0);
                float depth = -shape.x / density;
                // The closest edge switches across a capsule's medial axis.
                // Taper refraction there so the live backdrop samples join smoothly.
                float radius = min(extent.x, extent.y) * 0.5 / density;
                float taper = smoothstep(0.0, min(6.0, radius * 0.25), radius - depth);
                float sideDamp = mix(0.45, 1.0, shape.z * shape.z);
                float amount = offset(8.0, 36.0, depth) * density * lift * taper * sideDamp;
                return mix(float3(scene.eval(p).rgb),
                           float3(scene.eval(p + amount * shape.yz).rgb), coverage);
            }

            float3 lensBg(float2 p) {
                float3 shape = capsuleField(p - center, extent * 0.5, 0.5);
                float depth = -shape.x / density;
                float shift = offset(-18.0, 7.56, depth) * density;
                float3 t = below(p + shift * shape.yz);
                return mix(0.95 * t + 0.04, 0.96 * t + 0.015, dark);
            }

            half4 main(float2 px) {
                float3 shape = capsuleField(px - center, extent * 0.5, 0.5);
                float coverage = clamp(0.5 - shape.x, 0.0, 1.0);
                if (coverage == 0.0) return half4(0);
                float d = shape.x / density;
                float3 bg = lensBg(px);

                // Recovered 7-tap oblique glass_foreground_lpf spectral prism dispersion.
                float edgeW = clamp((d + 7.2) / 7.2, 0.0, 1.0) * lift;
                float3 face = bg;
                if (edgeW > 0.001) {
                    float2 n = shape.yz;
                    const float c = 0.9659258;
                    const float s = -0.2588190;
                    float2 rot = float2(n.x * c - n.y * s, n.x * s + n.y * c);
                    float2 stepVec = float2(rot.y, rot.x) * (-1.0 * density);
                    float r = 0.0;
                    float g = 0.0;
                    float b = 0.0;
                    for (int i = 0; i < 3; i++) {
                        float t = 1.0 - float(i) / 3.0;
                        float3 smp = lensBg(px + t * stepVec);
                        r += t * smp.r;
                        g += (1.0 - t) * smp.g;
                    }
                    for (int i = 0; i < 4; i++) {
                        float t = float(i) / 3.0;
                        float3 smp = lensBg(px - t * stepVec);
                        g += (1.0 - t) * smp.g;
                        b += t * smp.b;
                    }
                    float3 fg = float3(r * 0.5, g / 3.0, b * 0.5);
                    face = mix(bg, fg, edgeW);
                }

                float topGlow = keyFillLobe(-shape.x, shape.yz, float2(0.0, -1.0), 2.6 * density, 0.52, 1.2, 0.85);
                float botGlow = 0.55 * keyFillLobe(-shape.x, shape.yz, float2(0.0, 1.0), 2.4 * density, 0.56, 1.2, 0.85);
                float3 rimTint = clamp(face * 1.12 + float3(0.26), 0.0, 1.0);
                face = clamp(mix(face, rimTint, clamp((topGlow + botGlow) * mix(0.14, 0.22, dark), 0.0, 0.26)), 0.0, 1.0);
                return half4(face * coverage, coverage);
            }
            """;

    static final String LENS_CONTENT = SHAPE + """
            uniform shader scene;
            uniform float2 extent;
            uniform float2 center;
            uniform float density;
            uniform float lift;

            half4 main(float2 px) {
                float3 shape = capsuleField(px - center, extent * 0.5, 0.5);
                float coverage = clamp(0.5 - shape.x, 0.0, 1.0);
                if (coverage == 0.0) return half4(0);
                float shift = offset(-17.5, 11.2, -shape.x / density) * density;
                half4 warped = scene.eval(px + shift * shape.yz * coverage);
                half4 ink = mix(scene.eval(px), warped, half(min(4.0 * lift, 1.0)));
                return ink * half(coverage);
            }
            """;
}
