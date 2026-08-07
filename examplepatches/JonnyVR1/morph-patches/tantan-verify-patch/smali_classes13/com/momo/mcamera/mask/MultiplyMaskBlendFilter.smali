.class public Lcom/momo/mcamera/mask/MultiplyMaskBlendFilter;
.super Lcom/momo/mcamera/mask/TriggerBlendFilter;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/TriggerBlendFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\n \n varying mediump vec2 textureCoordinate;\n \n uniform sampler2D inputImageTexture;\n uniform sampler2D inputImageTexture1;\n\n vec4 softlight(vec4 base, vec4 overlay) {\n     float alphaDivisor = base.a + step(base.a, 0.0); // Protect against a divide-by-zero blacking out things in the output\n     return base * (overlay.a * (base / alphaDivisor) + (2.0 * overlay * (1.0 - (base / alphaDivisor)))) + overlay * (1.0 - base.a) + base * (1.0 - overlay.a);\n }\n \n vec4 multiply(vec4 base, vec4 overlayer) {\n     return overlayer * base + overlayer * (1.0 - base.a) + base * (1.0 - overlayer.a);\n }\n \n float lum(lowp vec3 c) {\n     return dot(c, vec3(0.3, 0.59, 0.11));\n }\n \n vec3 clipcolor(lowp vec3 c) {\n     mediump float l = lum(c);\n     lowp float n = min(min(c.r, c.g), c.b);\n     lowp float x = max(max(c.r, c.g), c.b);\n     \n     if (n < 0.0) {\n         c.r = l + ((c.r - l) * l) / (l - n);\n         c.g = l + ((c.g - l) * l) / (l - n);\n         c.b = l + ((c.b - l) * l) / (l - n);\n     }\n     if (x > 1.0) {\n         c.r = l + ((c.r - l) * (1.0 - l)) / (x - l);\n         c.g = l + ((c.g - l) * (1.0 - l)) / (x - l);\n         c.b = l + ((c.b - l) * (1.0 - l)) / (x - l);\n     }\n     \n     return c;\n }\n \n vec3 setlum(lowp vec3 c, mediump float l) {\n     mediump float d = l - lum(c);\n     c = c + vec3(d);\n     return clipcolor(c);\n }\n \n void main() {\n     mediump vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);\n     \n     mediump vec4 base = texture2D(inputImageTexture, textureCoordinate);\n     mediump vec4 overlay = texture2D(inputImageTexture1, textureCoordinate);\n     \n     if (overlay.a > 0.0) {\n         vec4 overlayAlpha = overlay;\n         \n         overlay.rgb = overlay.rgb * overlay.a;\n         \n         overlayAlpha.a = 0.7 * overlay.a;\n         overlayAlpha.rgb = overlayAlpha.rgb * overlayAlpha.a;\n         \n         base = softlight(base,overlay);\n         base = softlight(base,overlay);\n         base = multiply(base,overlayAlpha);\n         \n         mediump vec4 baseColor = base;\n         mediump vec4 overlayColor = overlay;\n         \n         gl_FragColor = vec4(baseColor.rgb * (1.0 - overlayColor.a) + setlum(overlayColor.rgb, lum(baseColor.rgb)) * overlayColor.a, baseColor.a);\n     } else {\n         gl_FragColor = base;\n     }\n     \n }"

    .line 2
    .line 3
    return-object p0
.end method
