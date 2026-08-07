.class public Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;
.super Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;
.source "SourceFile"


# static fields
.field private static final UNIFORM_TEXTURE_ALPHA:Ljava/lang/String; = "inputImageTexture2"


# instance fields
.field protected alphaHandler:I

.field protected alphaTexture:I

.field protected mmcvInfo:Ll/omw;

.field private notSampleHandler:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->alphaTexture:I

    .line 6
    .line 7
    return-void
.end method

.method public static byteToLuminanceTexture([BII)I
    .locals 14

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 6
    .line 7
    .line 8
    aget v0, v1, v2

    .line 9
    .line 10
    const/16 v3, 0xde1

    .line 11
    .line 12
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 13
    .line 14
    .line 15
    const/16 v0, 0x2800

    .line 16
    .line 17
    const v4, 0x46180400    # 9729.0f

    .line 18
    .line 19
    .line 20
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0x2801

    .line 24
    .line 25
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 26
    .line 27
    .line 28
    const/16 v0, 0x2802

    .line 29
    .line 30
    const v4, 0x47012f00    # 33071.0f

    .line 31
    .line 32
    .line 33
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 34
    .line 35
    .line 36
    const/16 v0, 0x2803

    .line 37
    .line 38
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 39
    .line 40
    .line 41
    const/16 v12, 0x1401

    .line 42
    .line 43
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    .line 46
    move-result-object v13

    .line 47
    const/16 v5, 0xde1

    .line 48
    .line 49
    const/4 v6, 0x0

    .line 50
    const/16 v7, 0x1909

    .line 51
    .line 52
    const/4 v10, 0x0

    .line 53
    const/16 v11, 0x1909

    .line 54
    .line 55
    move v8, p1

    .line 56
    move/from16 v9, p2

    .line 57
    .line 58
    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 59
    .line 60
    .line 61
    aget p0, v1, v2

    .line 62
    .line 63
    return p0
.end method

.method public static byteToLuminanceTextureBytextureId(I[BII)I
    .locals 10

    .line 1
    const/16 v0, 0xde1

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 4
    .line 5
    .line 6
    const/16 v8, 0x1401

    .line 7
    .line 8
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object v9

    .line 12
    const/16 v1, 0xde1

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/16 v3, 0x1909

    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    const/16 v7, 0x1909

    .line 19
    .line 20
    move v4, p2

    .line 21
    move v5, p3

    .line 22
    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 23
    .line 24
    .line 25
    return p0
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->alphaTexture:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    filled-new-array {v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 12
    .line 13
    .line 14
    iput v2, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->alphaTexture:I

    .line 15
    .line 16
    :cond_0
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture2;\nvarying vec2 textureCoordinate;\nuniform float notSampler;\nvoid main(){\n   vec4 whiteColor = vec4(1.0, 1.0, 1.0, 1.0);\n   vec4 colorAlpha = texture2D(inputImageTexture2, vec2(textureCoordinate.x, 1.0 - textureCoordinate.y));\n   gl_FragColor = mix(colorAlpha, whiteColor, notSampler);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public handleSizeChange()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->alphaTexture:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->alphaTexture:I

    .line 18
    .line 19
    :cond_0
    return-void
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
    const-string v1, "inputImageTexture2"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->alphaHandler:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "notSampler"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->notSampleHandler:I

    .line 23
    .line 24
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/wej;->setWidth(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-virtual {p0, p2}, Ll/wej;->setHeight(I)V

    .line 13
    .line 14
    .line 15
    invoke-super {p0, p1, p0, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public passShaderValues()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->processSegment()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public processSegment()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v2, v0, Ll/omw;->g:[B

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {v0}, Ll/omw;->m()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v3, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->mmcvInfo:Ll/omw;

    .line 17
    .line 18
    invoke-virtual {v3}, Ll/omw;->t()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    iget-object v4, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->mmcvInfo:Ll/omw;

    .line 23
    .line 24
    iget v5, v4, Ll/omw;->d:I

    .line 25
    .line 26
    iget-boolean v4, v4, Ll/omw;->a:Z

    .line 27
    .line 28
    invoke-static {v2, v0, v3, v5, v4}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->process([BIIIZ)Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-lez v2, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-lez v2, :cond_2

    .line 51
    .line 52
    const v1, 0x84c3

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->alphaTexture:I

    .line 59
    .line 60
    if-nez v1, :cond_1

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getWidth()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-static {v1, v2, v0}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->byteToLuminanceTexture([BII)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput v0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->alphaTexture:I

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getHeight()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-static {v1, v2, v3, v0}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->byteToLuminanceTextureBytextureId(I[BII)I

    .line 94
    .line 95
    .line 96
    :goto_0
    iget v0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->alphaHandler:I

    .line 97
    .line 98
    const/4 v1, 0x3

    .line 99
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 100
    .line 101
    .line 102
    iget p0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->notSampleHandler:I

    .line 103
    .line 104
    const/4 v0, 0x0

    .line 105
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    iget p0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->notSampleHandler:I

    .line 110
    .line 111
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_3
    :goto_1
    iget p0, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->notSampleHandler:I

    .line 116
    .line 117
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    return-void
.end method
