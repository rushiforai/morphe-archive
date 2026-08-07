.class public Ll/ysf;
.super Ll/bs2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bs2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, " precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp vec2 iResolution;\n void main() {\n     highp vec2 uv = textureCoordinate;\n     highp vec2 r = iResolution;\n     float e = step(iResolution.x, iResolution.y);\n     uv = mix(vec2(uv.y, uv.x), uv, e);\n     r = mix(vec2(r.y, r.x), r, e);\n     highp vec2 pv = uv * r;\n     float minH = min(r.x, r.y) * 0.9;\n     if (pv.y < (r.y - minH) * 0.5) {\n         pv.y += 0.5 * minH + 0.25 * r.y;\n     }\n     if (pv.y > (r.y - minH) * 0.5 + minH) {\n         pv.y -= 0.5 * minH + 0.25 * r.y;\n     }\n     float a = abs(abs(pv.y - r.y * 0.5) - minH * 0.5);\n     a = smoothstep(2., 12., a); uv = pv / r;\n     uv = mix(vec2(uv.y, uv.x), uv, e);\n     gl_FragColor = mix(vec4(vec3(0.0), 1.0), texture2D(inputImageTexture0, fract(uv)), a);\n }"

    .line 2
    .line 3
    return-object p0
.end method
