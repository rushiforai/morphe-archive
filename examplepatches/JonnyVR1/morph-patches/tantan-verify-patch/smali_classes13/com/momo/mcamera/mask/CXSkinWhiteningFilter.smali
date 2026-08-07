.class public Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;
.super Ll/jt2;
.source "SourceFile"


# static fields
.field private static final UNIFORM_ALPHA:Ljava/lang/String; = "alpha"

.field private static final UNIFORM_LEVEL_BLACK:Ljava/lang/String; = "levelBlack"

.field private static final UNIFORM_LEVEL_RANGE_INV:Ljava/lang/String; = "levelRangeInv"


# instance fields
.field private alpha:F

.field private alphaHandle:I

.field private isInit:Z

.field private levelBlack:F

.field private levelBlackHandle:I

.field private levelRangeInv:F

.field private levelRangeInvHandle:I

.field private mEnhancementCurveBitmap:Landroid/graphics/Bitmap;

.field private mEnhancementCurvePath:Ljava/lang/String;

.field private mEnhancementCurveTexture:I

.field private mEnhancementLookupBitmap:Landroid/graphics/Bitmap;

.field private mEnhancementLookupPath:Ljava/lang/String;

.field private mEnhancementLookupTexture:I

.field private mTextureHandle1:I

.field private mTextureHandle2:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->alphaHandle:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->levelBlackHandle:I

    .line 8
    .line 9
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->levelRangeInvHandle:I

    .line 10
    .line 11
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mTextureHandle1:I

    .line 12
    .line 13
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mTextureHandle2:I

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->isInit:Z

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput v1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->alpha:F

    .line 19
    .line 20
    iput v1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->levelBlack:F

    .line 21
    .line 22
    const/high16 v1, 0x3f800000    # 1.0f

    .line 23
    .line 24
    iput v1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->levelRangeInv:F

    .line 25
    .line 26
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurveTexture:I

    .line 27
    .line 28
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupTexture:I

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurvePath:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupPath:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurveBitmap:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupBitmap:Landroid/graphics/Bitmap;

    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform sampler2D inputImageTexture1;\nuniform sampler2D inputImageTexture2;\nuniform float levelBlack;\nuniform float levelRangeInv;\nuniform float alpha;\nvoid main() {\n    vec3 colorOrigin = texture2D(inputImageTexture0,textureCoordinate).rgb;\n    vec3 color = clamp((colorOrigin - vec3(levelBlack)) * levelRangeInv, 0.0, 1.0);\n    vec3 texel;\n    texel.r = texture2D(inputImageTexture2, vec2((color.r * 255.0 + 0.5) / 256.0, 0.5)).r;\n    texel.g = texture2D(inputImageTexture2, vec2((color.g * 255.0 + 0.5) / 256.0, 0.5)).g;\n    texel.b = texture2D(inputImageTexture2, vec2((color.b * 255.0 + 0.5) / 256.0, 0.5)).b;\n    texel.r = texel.r + 0.03;\n    texel.g = texel.g - 0.03;\n    texel.b = texel.b - 0.01;\n    texel = clamp(texel, 0.0, 1.0);\n    texel = mix(color, texel, 0.5);\n    texel = mix(colorOrigin, texel, alpha);\n    \n    float blueColor = texel.b * 15.0;\n    vec2 quad1, quad2;\n    quad1.y = floor(floor(blueColor) * 0.25);\n    quad1.x = floor(blueColor) - (quad1.y * 4.0);\n    quad2.y = floor(ceil(blueColor) * 0.25);\n    quad2.x = ceil(blueColor) - (quad2.y * 4.0);\n    vec2 texPos2, texPos1;\n    texPos2 = texel.rg * 0.234375 + 0.0078125;\n    texPos1 = quad1 * 0.25 + texPos2;\n    texPos2 = quad2 * 0.25 + texPos2;\n    vec4 newColor1 = texture2D(inputImageTexture1, texPos1);\n    vec4 newColor2 = texture2D(inputImageTexture1, texPos2);\n    color = mix(newColor1.rgb, newColor2.rgb, fract(blueColor));\n    color = mix(texel, color, 0.65);\n    gl_FragColor = vec4(mix(colorOrigin, color, alpha*0.9), 1.0);\n}"

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
    const-string v1, "inputImageTexture1"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mTextureHandle1:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "inputImageTexture2"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mTextureHandle2:I

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
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->alphaHandle:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "levelBlack"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->levelBlackHandle:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "levelRangeInv"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->levelRangeInvHandle:I

    .line 53
    .line 54
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurveTexture:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurvePath:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/io/File;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurvePath:Ljava/lang/String;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    new-instance v0, Ll/umw;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurvePath:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurveTexture:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurveTexture:I

    .line 44
    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurveBitmap:Landroid/graphics/Bitmap;

    .line 48
    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurveBitmap:Landroid/graphics/Bitmap;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurveTexture:I

    .line 64
    .line 65
    :cond_1
    :goto_0
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupTexture:I

    .line 66
    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupPath:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_2

    .line 76
    .line 77
    new-instance v0, Ljava/io/File;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupPath:Ljava/lang/String;

    .line 80
    .line 81
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    new-instance v0, Ll/umw;

    .line 91
    .line 92
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupPath:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v0, v1}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupTexture:I

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_2
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupTexture:I

    .line 108
    .line 109
    if-nez v0, :cond_3

    .line 110
    .line 111
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupBitmap:Landroid/graphics/Bitmap;

    .line 112
    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_3

    .line 120
    .line 121
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupBitmap:Landroid/graphics/Bitmap;

    .line 122
    .line 123
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    iput v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupTexture:I

    .line 128
    .line 129
    if-eqz v0, :cond_3

    .line 130
    .line 131
    const/4 v0, 0x0

    .line 132
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupBitmap:Landroid/graphics/Bitmap;

    .line 133
    .line 134
    :cond_3
    :goto_1
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->isInit:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const v0, 0x84c1

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupTexture:I

    .line 16
    .line 17
    const/16 v1, 0xde1

    .line 18
    .line 19
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 20
    .line 21
    .line 22
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mTextureHandle1:I

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 26
    .line 27
    .line 28
    const v0, 0x84c2

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurveTexture:I

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mTextureHandle2:I

    .line 40
    .line 41
    const/4 v1, 0x2

    .line 42
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 43
    .line 44
    .line 45
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->alphaHandle:I

    .line 46
    .line 47
    iget v1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->alpha:F

    .line 48
    .line 49
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 50
    .line 51
    .line 52
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->levelBlackHandle:I

    .line 53
    .line 54
    iget v1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->levelBlack:F

    .line 55
    .line 56
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 57
    .line 58
    .line 59
    iget v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->levelRangeInvHandle:I

    .line 60
    .line 61
    iget p0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->levelRangeInv:F

    .line 62
    .line 63
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public setAlpha(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->alpha:F

    .line 2
    .line 3
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurveBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupBitmap:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->isInit:Z

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setImagepath(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementCurvePath:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ljava/lang/String;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->mEnhancementLookupPath:Ljava/lang/String;

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->isInit:Z

    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method
