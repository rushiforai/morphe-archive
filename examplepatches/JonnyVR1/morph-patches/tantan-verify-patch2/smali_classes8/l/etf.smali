.class public Ll/etf;
.super Ll/bs2;
.source "SourceFile"


# instance fields
.field private d:I

.field private e:F


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
.method public Q1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/etf;->e:F

    .line 2
    .line 3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform float iTime;\n uniform highp vec2 iResolution;\n uniform float saturation;\n highp vec3 mod289(highp vec3 x) {\n     return x - floor(x * (1.0 / 289.0)) * 289.0;\n }\n highp vec2 mod289(highp vec2 x) {\n     return x - floor(x * (1.0 / 289.0)) * 289.0;\n }\n highp vec3 permute(highp vec3 x) {\n     return mod289(((x*34.0)+1.0)*x);\n }\n float snoise(highp vec2 v) {\n     const highp vec4 C = vec4(0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439);\n     highp vec2 i = floor(v + dot(v, C.yy) );\n     highp vec2 x0 = v - i + dot(i, C.xx);\n     highp vec2 i1; i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);\n     highp vec4 x12 = x0.xyxy + C.xxzz; x12.xy -= i1;\n     i = mod289(i); highp vec3 p = permute( permute( i.y + vec3(0.0, i1.y, 1.0 )) + i.x + vec3(0.0, i1.x, 1.0 ));\n     highp vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy), dot(x12.zw,x12.zw)), 0.0);\n     m = m*m ; m = m*m ;\n     highp vec3 x = 2.0 * fract(p * C.www) - 1.0; highp vec3 h = abs(x) - 0.5;\n     highp vec3 ox = floor(x + 0.5);\n     highp vec3 a0 = x - ox; m *= 1.79284291400159 - 0.85373472095314 * ( a0*a0 + h*h );\n     highp vec3 g; g.x = a0.x * x0.x + h.x * x0.y;\n     g.yz = a0.yz * x12.xz + h.yz * x12.yw;\n     return 130.0 * dot(m, g);\n }\n void main() {\n     float hue = snoise(vec2(iTime * 0.5, iTime * 0.5 + 999.));\n     highp vec2 vUv = textureCoordinate;\n     gl_FragColor = texture2D(inputImageTexture0, vUv);\n     float angle = hue * 3.14159265;\n     float s = sin(angle);\n     float c = cos(angle);\n     highp vec3 weights = (vec3(2.0 * c, -sqrt(3.0) * s - c, sqrt(3.0) * s - c) + 1.0) / 3.0;\n     float len = length(gl_FragColor.rgb);\n     gl_FragColor.rgb = vec3( dot(gl_FragColor.rgb, weights.xyz), dot(gl_FragColor.rgb, weights.zxy), dot(gl_FragColor.rgb, weights.yzx) );\n     float average = (gl_FragColor.r + gl_FragColor.g + gl_FragColor.b) / 3.0;\n     if (saturation > 0.0) {\n         gl_FragColor.rgb += (average - gl_FragColor.rgb) * (1.0 - 1.0 / (1.001 - saturation));\n     } else {\n         gl_FragColor.rgb += (average - gl_FragColor.rgb) * (-saturation);\n     }\n }"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/bs2;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "saturation"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/etf;->d:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/bs2;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/etf;->d:I

    .line 5
    .line 6
    iget p0, p0, Ll/etf;->e:F

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
