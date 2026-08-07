.class public Ll/vtf;
.super Ll/as2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/as2;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nvarying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform sampler2D inputImageTexture1;\n uniform highp float iTime;\n void main() {\n     highp vec2 uv = textureCoordinate;\n     highp vec2 block = floor(textureCoordinate.xy * vec2(750.0,422.0) / vec2(24));\n     highp vec2 uv_noise = block / vec2(64);\n     uv_noise += floor(vec2(iTime) * vec2(1234.0, 3543.0)) / vec2(64);\n     highp float block_thresh = pow(fract(iTime * 1236.0453), 2.0) * 0.05;\n     highp float line_thresh = pow(fract(iTime * 2236.0453), 3.0) * 0.10;\n     highp vec2 uv_r = uv;\n     highp vec2 uv_g = uv;\n     highp vec2 uv_b = uv;\n     if (texture2D(inputImageTexture1, fract(uv_noise)).r < block_thresh || texture2D(inputImageTexture1, fract(vec2(uv_noise.y, 0.0))).g < line_thresh) {\n         highp vec2 dist = (fract(uv_noise) - 0.5) * 0.3;\n         uv_r += dist * 0.1;\n         uv_g += dist * 0.2;\n         uv_b += dist * 0.125;\n     }\n     gl_FragColor.r = texture2D(inputImageTexture0, fract(uv_r)).r;\n     gl_FragColor.g = texture2D(inputImageTexture0, fract(uv_g)).g;\n     gl_FragColor.b = texture2D(inputImageTexture0, fract(uv_b)).b;\n     if (texture2D(inputImageTexture1, fract(uv_noise)).g < block_thresh) gl_FragColor.rgb = gl_FragColor.ggg;\n     if (texture2D(inputImageTexture1, fract(vec2(uv_noise.y, 0.0))).b * 3.5 < line_thresh) gl_FragColor.rgb = vec3(0.0, dot(gl_FragColor.rgb, vec3(1.0)), 0.0);\n     if (texture2D(inputImageTexture1, fract(uv_noise)).g * 1.5 < block_thresh || texture2D(inputImageTexture1, fract(vec2(uv_noise.y, 0.0))).g * 2.5 < line_thresh) {\n         highp float line = fract(textureCoordinate.y * 422.0 / 3.0);\n         highp vec3 mask = vec3(3.0, 0.0, 0.0);\n         if (line > 0.333) mask = vec3(0.0, 3.0, 0.0);\n         if (line > 0.666) mask = vec3(0.0, 0.0, 3.0);\n         gl_FragColor.xyz *= mask;\n     }\n }"

    .line 2
    .line 3
    return-object p0
.end method
