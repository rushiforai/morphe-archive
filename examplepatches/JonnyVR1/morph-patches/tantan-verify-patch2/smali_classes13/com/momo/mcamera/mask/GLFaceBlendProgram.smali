.class public Lcom/momo/mcamera/mask/GLFaceBlendProgram;
.super Lcom/momo/mcamera/mask/GLProgram;
.source "SourceFile"


# static fields
.field private static final BLEND_KEY_ADD:Ljava/lang/String; = "Add"

.field private static final BLEND_KEY_COLOR:Ljava/lang/String; = "Color"

.field private static final BLEND_KEY_COLOR_BURN:Ljava/lang/String; = "ColorBurn"

.field private static final BLEND_KEY_COLOR_DODGE:Ljava/lang/String; = "ColorDodge"

.field private static final BLEND_KEY_DARKEN:Ljava/lang/String; = "Darken"

.field private static final BLEND_KEY_DIFFERENCE:Ljava/lang/String; = "Difference"

.field private static final BLEND_KEY_DIVIDE:Ljava/lang/String; = "Divide"

.field private static final BLEND_KEY_EXCLUSION:Ljava/lang/String; = "Exclusion"

.field private static final BLEND_KEY_HARDLIGHT:Ljava/lang/String; = "HardLight"

.field private static final BLEND_KEY_HUE:Ljava/lang/String; = "Hue"

.field private static final BLEND_KEY_LIGHTEN:Ljava/lang/String; = "Lighten"

.field private static final BLEND_KEY_LINEARBURN:Ljava/lang/String; = "LinearBurn"

.field private static final BLEND_KEY_LUMINOSITY:Ljava/lang/String; = "Luminosity"

.field private static final BLEND_KEY_MASK:Ljava/lang/String; = "Mask"

.field private static final BLEND_KEY_MULTIPLY:Ljava/lang/String; = "Multiply"

.field private static final BLEND_KEY_NORMAL:Ljava/lang/String; = "Normal"

.field private static final BLEND_KEY_OVERLAY:Ljava/lang/String; = "Overlay"

.field private static final BLEND_KEY_SATURATION:Ljava/lang/String; = "Saturation"

.field private static final BLEND_KEY_SCREEN_BLEND:Ljava/lang/String; = "Screen"

.field private static final BLEND_KEY_SOFT_LIGHT:Ljava/lang/String; = "SoftLight"

.field private static final BLEND_KEY_SOURCE_OVER:Ljava/lang/String; = "SourceOver"

.field private static final BLEND_KEY_SUBTRACT:Ljava/lang/String; = "Subtract"

.field private static final INTENSITY:Ljava/lang/String; = "intensity"


# instance fields
.field private BLEND_RATIO:F

.field private blendFragmentShaderMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mBlendType:Ljava/lang/String;

.field private mHandleIntensity:I

.field private mIntensity:F

.field protected multiplyFragmentShader:Ljava/lang/String;

.field private normalFragmentShader:Ljava/lang/String;

.field protected overlayFragmentShader:Ljava/lang/String;

.field protected subtractFragmentShader:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0, v0}, Lcom/momo/mcamera/mask/GLProgram;-><init>(II)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mIntensity:F

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mHandleIntensity:I

    .line 17
    .line 18
    const v0, 0x3f4ccccd    # 0.8f

    .line 19
    .line 20
    .line 21
    iput v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->BLEND_RATIO:F

    .line 22
    .line 23
    const-string v0, "Normal"

    .line 24
    .line 25
    iput-object v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mBlendType:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "precision highp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate0;\nvarying vec2 textureCoordinate1;\nuniform float intensity;\n\n"

    .line 30
    .line 31
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->premultiply()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->unpremultiply()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->normalBlend()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v3, "void main(){\n  vec4 uCb = texture2D(inputImageTexture0, textureCoordinate0);\n  vec4 uCf = texture2D(inputImageTexture1, textureCoordinate1);\n  vec4 blendedColor = normalBlend(uCb, uCf);\n  gl_FragColor = mix(uCb,blendedColor,intensity);\n}"

    .line 56
    .line 57
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->normalFragmentShader:Ljava/lang/String;

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->premultiply()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->unpremultiply()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->normalBlend()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->blendBaseAlpha()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->multiplayBlend()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v3, "void main(){\n  vec4 uCb = texture2D(inputImageTexture0, textureCoordinate0);\n  vec4 uCf = texture2D(inputImageTexture1, textureCoordinate1);\n  vec4 blendedColor = multiplyBlend(uCb, uCf);\n  gl_FragColor = mix(uCb,blendedColor,intensity);\n}"

    .line 107
    .line 108
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iput-object v1, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->multiplyFragmentShader:Ljava/lang/String;

    .line 116
    .line 117
    new-instance v1, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->premultiply()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->unpremultiply()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->normalBlend()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->blendBaseAlpha()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->overlayBlendSingleChannel()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->overlayBlend()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string v2, "void main(){\n  vec4 uCb = texture2D(inputImageTexture0, textureCoordinate0);\n  vec4 uCf = texture2D(inputImageTexture1, textureCoordinate1);\n  vec4 blendedColor = overlayBlend(uCb, uCf);\n  gl_FragColor = mix(uCb,blendedColor,intensity);\n}"

    .line 165
    .line 166
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    iput-object v1, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->overlayFragmentShader:Ljava/lang/String;

    .line 174
    .line 175
    const-string v1, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate0;\nvarying vec2 textureCoordinate1;\nuniform float intensity;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture0,textureCoordinate0);\n   vec4 color2 = texture2D(inputImageTexture1,textureCoordinate1);\n   gl_FragColor = mix(vec4(color1.rgb - color2.rgb, color1.a), color1, intensity);\n}\n"

    .line 176
    .line 177
    iput-object v1, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->subtractFragmentShader:Ljava/lang/String;

    .line 178
    .line 179
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 180
    .line 181
    const-string v2, "Multiply"

    .line 182
    .line 183
    iget-object v3, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->multiplyFragmentShader:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 189
    .line 190
    iget-object v2, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->normalFragmentShader:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 196
    .line 197
    const-string v1, "Overlay"

    .line 198
    .line 199
    iget-object p0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->overlayFragmentShader:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    return-void
.end method

.method private blendBaseAlpha()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec4 blendBaseAlpha(vec4 cb, vec4 cs, vec4 b){\n  vec4 cr = vec4((1.0 - cb.a) * cs.rgb + cb.a * clamp(b.rgb, vec3(0.0), vec3(1.0)), cs.a);\n  return normalBlend(cb, cr);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method private multiplayBlend()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec4 multiplyBlend(vec4 cb, vec4 cs){\n  vec4 B = clamp(vec4(cb.rgb * cs.rgb, cs.a), vec4(0), vec4(1));\n  return blendBaseAlpha(cb, cs, B);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method private normalBlend()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec4 normalBlend(vec4 cb, vec4 cs){\n  vec4 dst = premultiply(cb);\n  vec4 src = premultiply(cs);\n  return unpremultiply(src + dst * (1.0 - src.a));\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method private overlayBlend()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\nvec4 overlayBlend(vec4 cb, vec4 cs){\n  vec4 b = vec4(overlayBlendSingleChannel(cb.r, cs.r), overlayBlendSingleChannel(cb.g, cs.g), overlayBlendSingleChannel(cb.b, cs.b), cs.a);\n  return blendBaseAlpha(cb, cs, b);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method private overlayBlendSingleChannel()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "float overlayBlendSingleChannel(float b, float s){\n  return b < 0.5 ? (2.0 * s * b) : (1.0 - 2.0 * (1.0 - b) * (1.0 - s));\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method private premultiply()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec4 premultiply(vec4 s){\n  return vec4(s.rgb * s.a, s.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method private unpremultiply()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec4 unpremultiply(vec4 s){\n  return vec4(s.rgb/max(s.a, 0.00001), s.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/GLProgram;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public drawFrame([[F[I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/mask/GLProgram;->drawFrame([[F[I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getSubFrameShader()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mBlendType:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mBlendType:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    const-string v0, "Normal"

    .line 20
    .line 21
    iput-object v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mBlendType:Ljava/lang/String;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->blendFragmentShaderMap:Ljava/util/HashMap;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mBlendType:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/String;

    .line 32
    .line 33
    return-object p0
.end method

.method public getSubVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/GLProgram;->getSubVertexShader()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/GLProgram;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 5
    .line 6
    const-string v1, "intensity"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mHandleIntensity:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues([[F[I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/mask/GLProgram;->passShaderValues([[F[I)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mHandleIntensity:I

    .line 5
    .line 6
    iget p2, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mIntensity:F

    .line 7
    .line 8
    iget p0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->BLEND_RATIO:F

    .line 9
    .line 10
    mul-float/2addr p2, p0

    .line 11
    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setBlendType(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mBlendType:Ljava/lang/String;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mBlendType:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/GLProgram;->initialized:Z

    .line 10
    .line 11
    return-void
.end method

.method public setDrawType(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/momo/mcamera/mask/GLProgram;->setDrawType(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setIntensity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/GLFaceBlendProgram;->mIntensity:F

    .line 2
    .line 3
    return-void
.end method

.method public setRenderSize(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/mask/GLProgram;->setRenderSize(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
