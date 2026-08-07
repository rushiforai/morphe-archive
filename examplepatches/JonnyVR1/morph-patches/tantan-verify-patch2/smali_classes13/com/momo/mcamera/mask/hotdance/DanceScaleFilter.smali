.class public Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private alpha:F

.field private final alphaAnimator:Landroid/animation/ValueAnimator;

.field private alphaHandle:I

.field private final alphaModels:[Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;

.field private final animator:Landroid/animation/ValueAnimator;

.field private final animatorSet:Landroid/animation/AnimatorSet;

.field private final danceModels:[Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;

.field private flash:Z

.field private flashHandle:I

.field private matrix:[F

.field private matrix1:[F

.field private matrixHandle:I

.field private matrixHandle1:I

.field private scale:F

.field private scale1:F

.field private translateX:F

.field private translateX1:F

.field private translateY:F

.field private translateY1:F


# direct methods
.method public constructor <init>()V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jt2;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x10

    .line 7
    .line 8
    new-array v2, v1, [F

    .line 9
    .line 10
    iput-object v2, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrix:[F

    .line 11
    .line 12
    new-array v1, v1, [F

    .line 13
    .line 14
    iput-object v1, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrix1:[F

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput v1, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrixHandle:I

    .line 18
    .line 19
    iput v1, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrixHandle1:I

    .line 20
    .line 21
    const/high16 v2, 0x3f800000    # 1.0f

    .line 22
    .line 23
    iput v2, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->scale:F

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    iput v3, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateX:F

    .line 27
    .line 28
    iput v3, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateY:F

    .line 29
    .line 30
    iput v2, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->scale1:F

    .line 31
    .line 32
    iput v3, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateX1:F

    .line 33
    .line 34
    iput v3, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateY1:F

    .line 35
    .line 36
    iput v3, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alpha:F

    .line 37
    .line 38
    iput-boolean v1, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->flash:Z

    .line 39
    .line 40
    const/4 v2, 0x3

    .line 41
    new-array v3, v2, [F

    .line 42
    .line 43
    fill-array-data v3, :array_0

    .line 44
    .line 45
    .line 46
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iput-object v3, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animator:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    const/4 v3, 0x2

    .line 53
    new-array v4, v3, [F

    .line 54
    .line 55
    fill-array-data v4, :array_1

    .line 56
    .line 57
    .line 58
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    iput-object v4, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaAnimator:Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v4, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animatorSet:Landroid/animation/AnimatorSet;

    .line 70
    .line 71
    new-array v4, v2, [Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;

    .line 72
    .line 73
    iput-object v4, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->danceModels:[Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;

    .line 74
    .line 75
    new-array v2, v2, [Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;

    .line 76
    .line 77
    iput-object v2, v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaModels:[Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;

    .line 78
    .line 79
    new-instance v5, Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;

    .line 80
    .line 81
    const/4 v12, 0x2

    .line 82
    const-wide/16 v13, 0xc8

    .line 83
    .line 84
    const/high16 v6, 0x3f800000    # 1.0f

    .line 85
    .line 86
    const v7, 0x3f666666    # 0.9f

    .line 87
    .line 88
    .line 89
    const/4 v8, 0x0

    .line 90
    const v9, 0x3d4ccccd    # 0.05f

    .line 91
    .line 92
    .line 93
    const/4 v10, 0x0

    .line 94
    const v11, 0x3d4ccccd    # 0.05f

    .line 95
    .line 96
    .line 97
    invoke-direct/range {v5 .. v14}, Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;-><init>(FFFFFFIJ)V

    .line 98
    .line 99
    .line 100
    aput-object v5, v4, v1

    .line 101
    .line 102
    new-instance v6, Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;

    .line 103
    .line 104
    const/4 v13, 0x0

    .line 105
    const-wide/16 v14, 0x190

    .line 106
    .line 107
    const/high16 v7, 0x3f800000    # 1.0f

    .line 108
    .line 109
    const v8, 0x3f666666    # 0.9f

    .line 110
    .line 111
    .line 112
    const/4 v9, 0x0

    .line 113
    const v10, 0x3d4ccccd    # 0.05f

    .line 114
    .line 115
    .line 116
    const/4 v11, 0x0

    .line 117
    const v12, 0x3d4ccccd    # 0.05f

    .line 118
    .line 119
    .line 120
    invoke-direct/range {v6 .. v15}, Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;-><init>(FFFFFFIJ)V

    .line 121
    .line 122
    .line 123
    const/4 v0, 0x1

    .line 124
    aput-object v6, v4, v0

    .line 125
    .line 126
    new-instance v7, Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;

    .line 127
    .line 128
    const/4 v14, 0x0

    .line 129
    const-wide/16 v15, 0xc8

    .line 130
    .line 131
    const/high16 v8, 0x3f800000    # 1.0f

    .line 132
    .line 133
    const/high16 v9, 0x3f800000    # 1.0f

    .line 134
    .line 135
    const/4 v10, 0x0

    .line 136
    const/4 v12, 0x0

    .line 137
    const/4 v13, 0x0

    .line 138
    invoke-direct/range {v7 .. v16}, Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;-><init>(FFFFFFIJ)V

    .line 139
    .line 140
    .line 141
    aput-object v7, v4, v3

    .line 142
    .line 143
    new-instance v8, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;

    .line 144
    .line 145
    const/16 v18, 0x3

    .line 146
    .line 147
    const-wide/16 v19, 0x64

    .line 148
    .line 149
    const/high16 v10, 0x3f800000    # 1.0f

    .line 150
    .line 151
    const/4 v14, 0x0

    .line 152
    const v15, 0x3ecccccd    # 0.4f

    .line 153
    .line 154
    .line 155
    const v16, 0x3f333333    # 0.7f

    .line 156
    .line 157
    .line 158
    const/16 v17, 0x1

    .line 159
    .line 160
    invoke-direct/range {v8 .. v20}, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;-><init>(FFFFFFFFZIJ)V

    .line 161
    .line 162
    .line 163
    aput-object v8, v2, v1

    .line 164
    .line 165
    new-instance v9, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;

    .line 166
    .line 167
    const/16 v19, 0x0

    .line 168
    .line 169
    const-wide/16 v20, 0x190

    .line 170
    .line 171
    const v11, 0x3f666666    # 0.9f

    .line 172
    .line 173
    .line 174
    const v13, 0x3d4ccccd    # 0.05f

    .line 175
    .line 176
    .line 177
    const v15, 0x3d4ccccd    # 0.05f

    .line 178
    .line 179
    .line 180
    const/high16 v16, 0x3f800000    # 1.0f

    .line 181
    .line 182
    const/high16 v17, 0x3f800000    # 1.0f

    .line 183
    .line 184
    const/16 v18, 0x0

    .line 185
    .line 186
    invoke-direct/range {v9 .. v21}, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;-><init>(FFFFFFFFZIJ)V

    .line 187
    .line 188
    .line 189
    aput-object v9, v2, v0

    .line 190
    .line 191
    new-instance v10, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;

    .line 192
    .line 193
    const/16 v20, 0x0

    .line 194
    .line 195
    const-wide/16 v21, 0xc8

    .line 196
    .line 197
    const/high16 v11, 0x3f800000    # 1.0f

    .line 198
    .line 199
    const/high16 v12, 0x3f800000    # 1.0f

    .line 200
    .line 201
    const/4 v13, 0x0

    .line 202
    const/4 v15, 0x0

    .line 203
    const/16 v16, 0x0

    .line 204
    .line 205
    const/16 v17, 0x0

    .line 206
    .line 207
    const v18, 0x3f4ccccd    # 0.8f

    .line 208
    .line 209
    .line 210
    const/16 v19, 0x1

    .line 211
    .line 212
    invoke-direct/range {v10 .. v22}, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;-><init>(FFFFFFFFZIJ)V

    .line 213
    .line 214
    .line 215
    aput-object v10, v2, v3

    .line 216
    .line 217
    return-void

    .line 218
    nop

    .line 219
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->scale:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$102(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateX:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$202(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateY:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->scale1:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$402(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateX1:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$502(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateY1:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$602(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alpha:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$702(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->flash:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animatorSet:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animatorSet:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animator:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animator:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaAnimator:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaAnimator:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform float alpha;\nuniform float flash;\nvoid main(){\n    float offset = 0.02;\n    vec2 uv = textureCoordinate;\n    vec2 uv1 = textureCoordinate1;\n    vec4 color = texture2D(inputImageTexture0, uv);\n    vec4 color1 = texture2D(inputImageTexture0, uv1);\n    color1.r = texture2D(inputImageTexture0, vec2(uv1.x - offset, uv1.y)).r;\n    color1.g = texture2D(inputImageTexture0, vec2(uv1.x, uv1.y)).g;\n    color1.b = texture2D(inputImageTexture0, vec2(uv1.x + offset, uv1.y)).b;\n    vec4 color2 = vec4(1.0, 1.0, 1.0, 1.0);\n    vec4 color3 = mix(color1, color2, flash);\n    gl_FragColor = mix(color, color3, alpha);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform mat4 matrix;\nuniform mat4 matrix1;\nvoid main() {\n  textureCoordinate = (matrix * inputTextureCoordinate).xy;\n  textureCoordinate1 = (matrix1 * inputTextureCoordinate).xy;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "matrix"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrixHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "matrix1"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrixHandle1:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "alpha"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaHandle:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "flash"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->flashHandle:I

    .line 43
    .line 44
    return-void
.end method

.method public onMusicBeatDetect(I)V
    .locals 4

    .line 1
    const/4 v0, 0x3

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x4

    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_1
    const/4 p1, 0x2

    .line 12
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->danceModels:[Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;

    .line 13
    .line 14
    aget-object v0, v0, p1

    .line 15
    .line 16
    iget-object v1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animator:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animator:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    iget-wide v2, v0, Lcom/momo/mcamera/mask/hotdance/DanceModel;->duration:J

    .line 24
    .line 25
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animator:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    iget v2, v0, Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;->repeatCount:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animator:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    new-instance v2, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$1;

    .line 38
    .line 39
    invoke-direct {v2, p0, v0}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$1;-><init>(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;Lcom/momo/mcamera/mask/hotdance/ScaleDanceModel;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animator:Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    new-instance v1, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$2;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$2;-><init>(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaModels:[Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;

    .line 56
    .line 57
    aget-object p1, v0, p1

    .line 58
    .line 59
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaAnimator:Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaAnimator:Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    iget-wide v1, p1, Lcom/momo/mcamera/mask/hotdance/DanceModel;->duration:J

    .line 67
    .line 68
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaAnimator:Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    iget v1, p1, Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;->repeatCount:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaAnimator:Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    new-instance v1, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$3;

    .line 81
    .line 82
    invoke-direct {v1, p0, p1}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$3;-><init>(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;Lcom/momo/mcamera/mask/hotdance/AlphaDanceModel;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaAnimator:Landroid/animation/ValueAnimator;

    .line 89
    .line 90
    new-instance v0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$4;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter$4;-><init>(Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animatorSet:Landroid/animation/AnimatorSet;

    .line 99
    .line 100
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animator:Landroid/animation/ValueAnimator;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaAnimator:Landroid/animation/ValueAnimator;

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->animatorSet:Landroid/animation/AnimatorSet;

    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public passShaderValues()V
    .locals 7

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrix:[F

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrix:[F

    .line 11
    .line 12
    iget v2, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateX:F

    .line 13
    .line 14
    iget v3, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateY:F

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrix:[F

    .line 21
    .line 22
    iget v2, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->scale:F

    .line 23
    .line 24
    const/high16 v3, 0x3f800000    # 1.0f

    .line 25
    .line 26
    invoke-static {v0, v1, v2, v2, v3}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrixHandle:I

    .line 30
    .line 31
    iget-object v2, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrix:[F

    .line 32
    .line 33
    const/4 v5, 0x1

    .line 34
    invoke-static {v0, v5, v1, v2, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrix1:[F

    .line 38
    .line 39
    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrix1:[F

    .line 43
    .line 44
    iget v2, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateX1:F

    .line 45
    .line 46
    iget v6, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->translateY1:F

    .line 47
    .line 48
    invoke-static {v0, v1, v2, v6, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrix1:[F

    .line 52
    .line 53
    iget v2, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->scale1:F

    .line 54
    .line 55
    invoke-static {v0, v1, v2, v2, v3}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 56
    .line 57
    .line 58
    iget v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrixHandle1:I

    .line 59
    .line 60
    iget-object v2, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->matrix1:[F

    .line 61
    .line 62
    invoke-static {v0, v5, v1, v2, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 63
    .line 64
    .line 65
    iget v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alphaHandle:I

    .line 66
    .line 67
    iget v1, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->alpha:F

    .line 68
    .line 69
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 70
    .line 71
    .line 72
    iget v0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->flashHandle:I

    .line 73
    .line 74
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->flash:Z

    .line 75
    .line 76
    if-eqz p0, :cond_0

    .line 77
    .line 78
    move v4, v3

    .line 79
    :cond_0
    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 80
    .line 81
    .line 82
    return-void
.end method
