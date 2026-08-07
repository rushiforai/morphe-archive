.class public Lcom/momo/mcamera/mask/SegmentFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# static fields
.field private static final UNIFORM_TEXTURE_ALPHA:Ljava/lang/String; = "inputImageTexture2"


# instance fields
.field protected alphaHandler:I

.field protected alphaTexture:I

.field protected mmcvFrame:Ll/umw;

.field protected mmcvInfo:Ll/omw;

.field protected params:Ll/lnw;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaTexture:I

    .line 6
    .line 7
    new-instance v0, Ll/umw;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 13
    .line 14
    new-instance v0, Ll/lnw;

    .line 15
    .line 16
    const/4 v1, 0x4

    .line 17
    invoke-direct {v0, v1}, Ll/lnw;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public cancelDraw()V
    .locals 0

    return-void
.end method

.method public clearPoints()V
    .locals 0

    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaTexture:I

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
    iput v2, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaTexture:I

    .line 15
    .line 16
    :cond_0
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public drawSub()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture2;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec4 colorAlpha = texture2D(inputImageTexture2, vec2(textureCoordinate.x, 1.0 - textureCoordinate.y));\n   gl_FragColor = colorAlpha;\n}\n"

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
    iget v0, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaTexture:I

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
    iput v2, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaTexture:I

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
    iput v0, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaHandler:I

    .line 13
    .line 14
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
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/mask/SegmentFilter;->processSegment(II)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public processSegment(II)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    iget-object p2, p1, Ll/omw;->g:[B

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Ll/omw;->v()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object p2, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/16 p1, 0x11

    .line 20
    .line 21
    invoke-virtual {p2, p1}, Ll/umw;->h(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p1, 0x4

    .line 26
    invoke-virtual {p2, p1}, Ll/umw;->h(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 30
    .line 31
    const/4 p2, 0x0

    .line 32
    invoke-virtual {p1, p2}, Ll/lnw;->E(Z)V

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 36
    .line 37
    iget-object p2, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 38
    .line 39
    iget-object p2, p2, Ll/omw;->g:[B

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Ll/umw;->g([B)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 45
    .line 46
    iget-object p2, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 47
    .line 48
    iget-object p2, p2, Ll/omw;->g:[B

    .line 49
    .line 50
    array-length p2, p2

    .line 51
    invoke-virtual {p1, p2}, Ll/umw;->f(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 55
    .line 56
    iget-object p2, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 57
    .line 58
    invoke-virtual {p2}, Ll/omw;->t()I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-virtual {p1, p2}, Ll/umw;->m(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 66
    .line 67
    iget-object p2, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 68
    .line 69
    invoke-virtual {p2}, Ll/omw;->m()I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    invoke-virtual {p1, p2}, Ll/umw;->j(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 77
    .line 78
    iget-object p2, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 79
    .line 80
    invoke-virtual {p2}, Ll/omw;->t()I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    invoke-virtual {p1, p2}, Ll/umw;->l(I)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 88
    .line 89
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->isFrontCamera()Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    invoke-virtual {p1, p2}, Ll/lnw;->p(Z)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 97
    .line 98
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->getRotateDegree()I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    invoke-virtual {p1, p2}, Ll/lnw;->A(I)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 106
    .line 107
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->getRestoreDegree()I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    invoke-virtual {p1, p2}, Ll/lnw;->z(I)V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 115
    .line 116
    .line 117
    move-result-wide p1

    .line 118
    iget-object v0, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 121
    .line 122
    iget-object v2, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 123
    .line 124
    invoke-virtual {v2}, Ll/omw;->v()Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    xor-int/lit8 v2, v2, 0x1

    .line 129
    .line 130
    const/4 v3, 0x0

    .line 131
    invoke-static {v0, v1, v2, v3}, Lcom/core/glcore/util/SegmentHelper;->process(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object v1, v0, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 136
    .line 137
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 138
    .line 139
    .line 140
    move-result-wide v2

    .line 141
    sub-long/2addr v2, p1

    .line 142
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p1, v2, v3}, Ll/u6y;->m0(J)V

    .line 147
    .line 148
    .line 149
    const p1, 0x84c3

    .line 150
    .line 151
    .line 152
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 153
    .line 154
    .line 155
    iget p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaTexture:I

    .line 156
    .line 157
    iget p2, v0, Lcom/momocv/segmentation/SegmentationInfo;->mask_width:I

    .line 158
    .line 159
    if-nez p1, :cond_2

    .line 160
    .line 161
    iget p1, v0, Lcom/momocv/segmentation/SegmentationInfo;->mask_height:I

    .line 162
    .line 163
    invoke-static {v1, p2, p1}, Lcom/core/glcore/util/TextureHelper;->byteToLuminanceTexture([BII)I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    iput p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaTexture:I

    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_2
    iget v0, v0, Lcom/momocv/segmentation/SegmentationInfo;->mask_height:I

    .line 171
    .line 172
    invoke-static {p1, v1, p2, v0}, Lcom/core/glcore/util/TextureHelper;->byteToLuminanceTextureBytextureId(I[BII)I

    .line 173
    .line 174
    .line 175
    :goto_1
    iget p0, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaHandler:I

    .line 176
    .line 177
    const/4 p1, 0x3

    .line 178
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_3
    :goto_2
    const-string p0, "lclc"

    .line 183
    .line 184
    const-string p1, "mmcv is null or mmcv.frameInfo is null"

    .line 185
    .line 186
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    return-void
.end method
