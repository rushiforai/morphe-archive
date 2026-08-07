.class public Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# instance fields
.field private mBufferTex:Ljava/nio/FloatBuffer;

.field private mBufferVer:Ljava/nio/FloatBuffer;

.field private mByteBufTex:Ljava/nio/ByteBuffer;

.field private mByteBufVer:Ljava/nio/ByteBuffer;

.field private mDefaultSkinThreshold:[I

.field private mDefaultSkinThresholdHandle:I

.field private mFaceWidthHandle:I

.field private mHighSkinThreshold:[I

.field private mHighSkinThresholdHandle:I

.field private mLowSkinThreshold:[I

.field private mLowSkinThresholdHandle:I

.field private mMMCVHeight:F

.field private mMMCVWidth:F

.field private mMmcvInfo:Ll/omw;

.field private mSkinSmoothScale:F

.field private mSkinSmoothScaleHandle:I

.field private mTexelHeight:F

.field private mTexelHeightHandle:I

.field private mTexelWidth:F

.field private mTexelWidthHandle:I

.field private mWinSize:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mWinSize:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    filled-new-array {v1, v1, v1}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mLowSkinThreshold:[I

    .line 13
    .line 14
    const/16 v1, 0xff

    .line 15
    .line 16
    filled-new-array {v1, v1, v1}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mHighSkinThreshold:[I

    .line 21
    .line 22
    const/16 v1, 0x78

    .line 23
    .line 24
    const/16 v2, 0x6e

    .line 25
    .line 26
    const/16 v3, 0xa0

    .line 27
    .line 28
    filled-new-array {v3, v1, v2}, [I

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mDefaultSkinThreshold:[I

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    iput v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mSkinSmoothScale:F

    .line 36
    .line 37
    iput v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMMCVWidth:F

    .line 38
    .line 39
    iput v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMMCVHeight:F

    .line 40
    .line 41
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->init(I)V

    .line 42
    .line 43
    .line 44
    const/high16 v0, 0x3f000000    # 0.5f

    .line 45
    .line 46
    const/high16 v1, 0x3f800000    # 1.0f

    .line 47
    .line 48
    invoke-virtual {p0, v0, v0, v0, v1}, Ll/wej;->setBackgroundColour(FFFF)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private facePassShaderValues(I)V
    .locals 8

    .line 1
    const v0, 0x84c0

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 5
    .line 6
    .line 7
    const/16 v0, 0xde1

    .line 8
    .line 9
    iget v1, p0, Ll/wej;->texture_in:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mSkinSmoothScaleHandle:I

    .line 21
    .line 22
    iget v2, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mSkinSmoothScale:F

    .line 23
    .line 24
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 25
    .line 26
    .line 27
    iget v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mLowSkinThresholdHandle:I

    .line 28
    .line 29
    iget-object v2, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mLowSkinThreshold:[I

    .line 30
    .line 31
    aget v3, v2, v1

    .line 32
    .line 33
    int-to-float v3, v3

    .line 34
    const/high16 v4, 0x437f0000    # 255.0f

    .line 35
    .line 36
    div-float/2addr v3, v4

    .line 37
    const/4 v5, 0x1

    .line 38
    aget v6, v2, v5

    .line 39
    .line 40
    int-to-float v6, v6

    .line 41
    div-float/2addr v6, v4

    .line 42
    const/4 v7, 0x2

    .line 43
    aget v2, v2, v7

    .line 44
    .line 45
    int-to-float v2, v2

    .line 46
    div-float/2addr v2, v4

    .line 47
    invoke-static {v0, v3, v6, v2}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 48
    .line 49
    .line 50
    iget v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mHighSkinThresholdHandle:I

    .line 51
    .line 52
    iget-object v2, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mHighSkinThreshold:[I

    .line 53
    .line 54
    aget v3, v2, v1

    .line 55
    .line 56
    int-to-float v3, v3

    .line 57
    div-float/2addr v3, v4

    .line 58
    aget v6, v2, v5

    .line 59
    .line 60
    int-to-float v6, v6

    .line 61
    div-float/2addr v6, v4

    .line 62
    aget v2, v2, v7

    .line 63
    .line 64
    int-to-float v2, v2

    .line 65
    div-float/2addr v2, v4

    .line 66
    invoke-static {v0, v3, v6, v2}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 67
    .line 68
    .line 69
    iget v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mDefaultSkinThresholdHandle:I

    .line 70
    .line 71
    iget-object v2, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mDefaultSkinThreshold:[I

    .line 72
    .line 73
    aget v1, v2, v1

    .line 74
    .line 75
    int-to-float v1, v1

    .line 76
    div-float/2addr v1, v4

    .line 77
    aget v3, v2, v5

    .line 78
    .line 79
    int-to-float v3, v3

    .line 80
    div-float/2addr v3, v4

    .line 81
    aget v2, v2, v7

    .line 82
    .line 83
    int-to-float v2, v2

    .line 84
    div-float/2addr v2, v4

    .line 85
    invoke-static {v0, v1, v3, v2}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 86
    .line 87
    .line 88
    iget v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mTexelWidthHandle:I

    .line 89
    .line 90
    iget v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mTexelWidth:F

    .line 91
    .line 92
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 93
    .line 94
    .line 95
    iget v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mTexelHeightHandle:I

    .line 96
    .line 97
    iget v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mTexelHeight:F

    .line 98
    .line 99
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 103
    .line 104
    if-eqz v0, :cond_0

    .line 105
    .line 106
    invoke-virtual {v0}, Ll/omw;->n()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-lez v0, :cond_0

    .line 111
    .line 112
    iget v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mFaceWidthHandle:I

    .line 113
    .line 114
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 115
    .line 116
    invoke-virtual {v1, p1}, Ll/omw;->j(I)Ll/nuf;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1}, Ll/nuf;->r()[F

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget v1, p0, Ll/wej;->width:I

    .line 125
    .line 126
    int-to-float v1, v1

    .line 127
    iget p0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMMCVWidth:F

    .line 128
    .line 129
    div-float/2addr v1, p0

    .line 130
    invoke-static {p1, v1}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceTriangulationWidth([FF)F

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 135
    .line 136
    .line 137
    :cond_0
    return-void
.end method

.method private init(I)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mWinSize:I

    .line 2
    .line 3
    iget-object p1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mLowSkinThreshold:[I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    aput v0, p1, v0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    aput v0, p1, v1

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aput v0, p1, v2

    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mHighSkinThreshold:[I

    .line 15
    .line 16
    const/16 p1, 0xff

    .line 17
    .line 18
    aput p1, p0, v0

    .line 19
    .line 20
    aput p1, p0, v1

    .line 21
    .line 22
    aput p1, p0, v2

    .line 23
    .line 24
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

.method public drawSub()V
    .locals 12

    .line 1
    iget v0, p0, Ll/wej;->width:I

    .line 2
    .line 3
    iget v1, p0, Ll/wej;->height:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-static {v0, v1, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 26
    .line 27
    .line 28
    const/16 v0, 0x4100

    .line 29
    .line 30
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 31
    .line 32
    .line 33
    iget v0, p0, Ll/wej;->programHandle:I

    .line 34
    .line 35
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/omw;->n()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-lez v0, :cond_3

    .line 47
    .line 48
    move v0, v2

    .line 49
    :goto_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/omw;->n()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-ge v0, v1, :cond_2

    .line 56
    .line 57
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->facePassShaderValues(I)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1}, Ll/nuf;->r()[F

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    const/4 v5, 0x0

    .line 79
    invoke-static {v1, v3, v4, v5}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceTriangulation([FII[F)[[F

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    aget-object v3, v1, v2

    .line 84
    .line 85
    const/4 v4, 0x1

    .line 86
    aget-object v1, v1, v4

    .line 87
    .line 88
    iget-object v4, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mByteBufTex:Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    const/4 v5, 0x4

    .line 91
    if-nez v4, :cond_0

    .line 92
    .line 93
    array-length v4, v3

    .line 94
    mul-int/2addr v4, v5

    .line 95
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    iput-object v4, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mByteBufVer:Ljava/nio/ByteBuffer;

    .line 100
    .line 101
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-virtual {v4, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    .line 108
    iget-object v4, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mByteBufVer:Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    iput-object v4, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mBufferVer:Ljava/nio/FloatBuffer;

    .line 115
    .line 116
    :cond_0
    iget-object v4, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mBufferVer:Ljava/nio/FloatBuffer;

    .line 117
    .line 118
    invoke-virtual {v4}, Ljava/nio/FloatBuffer;->rewind()Ljava/nio/Buffer;

    .line 119
    .line 120
    .line 121
    iget-object v4, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mBufferVer:Ljava/nio/FloatBuffer;

    .line 122
    .line 123
    invoke-virtual {v4, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 124
    .line 125
    .line 126
    iget-object v3, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mBufferVer:Ljava/nio/FloatBuffer;

    .line 127
    .line 128
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 129
    .line 130
    .line 131
    iget v6, p0, Ll/wej;->positionHandle:I

    .line 132
    .line 133
    const/4 v10, 0x0

    .line 134
    iget-object v11, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mBufferVer:Ljava/nio/FloatBuffer;

    .line 135
    .line 136
    const/4 v7, 0x2

    .line 137
    const/16 v8, 0x1406

    .line 138
    .line 139
    const/4 v9, 0x0

    .line 140
    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 141
    .line 142
    .line 143
    iget v3, p0, Ll/wej;->positionHandle:I

    .line 144
    .line 145
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 146
    .line 147
    .line 148
    iget-object v3, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mByteBufTex:Ljava/nio/ByteBuffer;

    .line 149
    .line 150
    if-nez v3, :cond_1

    .line 151
    .line 152
    array-length v3, v1

    .line 153
    mul-int/2addr v3, v5

    .line 154
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    iput-object v3, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mByteBufTex:Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 165
    .line 166
    .line 167
    iget-object v3, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mByteBufTex:Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    iput-object v3, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mBufferTex:Ljava/nio/FloatBuffer;

    .line 174
    .line 175
    :cond_1
    iget-object v3, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mBufferTex:Ljava/nio/FloatBuffer;

    .line 176
    .line 177
    invoke-virtual {v3}, Ljava/nio/FloatBuffer;->rewind()Ljava/nio/Buffer;

    .line 178
    .line 179
    .line 180
    iget-object v3, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mBufferTex:Ljava/nio/FloatBuffer;

    .line 181
    .line 182
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 183
    .line 184
    .line 185
    iget-object v3, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mBufferTex:Ljava/nio/FloatBuffer;

    .line 186
    .line 187
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 188
    .line 189
    .line 190
    iget v6, p0, Ll/wej;->texCoordHandle:I

    .line 191
    .line 192
    const/4 v10, 0x0

    .line 193
    iget-object v11, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mBufferTex:Ljava/nio/FloatBuffer;

    .line 194
    .line 195
    const/4 v7, 0x2

    .line 196
    const/16 v8, 0x1406

    .line 197
    .line 198
    const/4 v9, 0x0

    .line 199
    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 200
    .line 201
    .line 202
    iget v3, p0, Ll/wej;->texCoordHandle:I

    .line 203
    .line 204
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 205
    .line 206
    .line 207
    array-length v1, v1

    .line 208
    div-int/lit8 v1, v1, 0x2

    .line 209
    .line 210
    invoke-static {v5, v2, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 211
    .line 212
    .line 213
    add-int/lit8 v0, v0, 0x1

    .line 214
    .line 215
    goto/16 :goto_0

    .line 216
    .line 217
    :cond_2
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 218
    .line 219
    .line 220
    :cond_3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float amount;\nuniform vec3 lowSkinThreshold;\nuniform vec3 highSkinThreshold;\nuniform float texelWidthOffset; \nuniform float texelHeightOffset; \nfloat minstep = 3.0;\nuniform vec3 skinDefaultRGB;\nuniform float faceWidth;\nvoid main() {\n    float epslone = 0.006 * amount * amount;\n    float faceWidthFactor = min(faceWidth / 360.0, 1.4);\n    float xInc = minstep * 1.0 / 480.0 * faceWidthFactor;\n    float yInc = minstep * 1.0 / (480.0 / texelWidthOffset * texelHeightOffset) * faceWidthFactor;\n    vec4 a = vec4(0., 0., 0., 0.);\n    vec4 b = vec4(0., 0., 0., 0.);\n    vec4 meanI = vec4(0., 0., 0., 0.);\n    vec4 meanII = vec4(0., 0., 0., 0.);\n    vec4 temp = vec4(0., 0., 0., 0.);\n    vec4 sourceColor = texture2D(inputImageTexture0,textureCoordinate);\n    vec3 relation = vec3(1.) + min((sourceColor.xyz - skinDefaultRGB), vec3(0.0));\n    float meanrelation =(relation.x + relation.y + relation.z) / 3.0;\n    float r = 1. / (1. + exp(24. - 30. * meanrelation));\n    float eps = epslone * r;\n    if (eps < 0.000001) {\n         gl_FragColor = vec4(0.5, 0.5, 0.5, 1.0);\n         return;\n    }\n    float x = textureCoordinate.x + (-float("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mWinSize:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ") * 0.5 * xInc);\n    float y = textureCoordinate.y + (-float("

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mWinSize:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ") * 0.5 * yInc);\n    for (int i = 0; i < "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mWinSize:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "; i++) {\n          for (int j = 0; j < "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mWinSize:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "; j++) {\n              temp = texture2D(inputImageTexture0, vec2(x + float(i) * xInc, y + float(j) * yInc));\n              meanI += temp;\n              meanII += temp * temp;\n          }\n    }\n    meanI /= float("

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mWinSize:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "*"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v2, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mWinSize:I

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v2, ");\n    meanII /= float("

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v2, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mWinSize:I

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget p0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mWinSize:I

    .line 77
    .line 78
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p0, ");\n    temp = meanII - meanI * meanI;\n    a = clamp(temp / (temp + vec4(vec3(eps), 1.0)), 0.0, 1.0);\n    b = meanI - a * meanI;\n    vec4 temp3 = a * sourceColor + b;\n    gl_FragColor = vec4(temp3.xyz - sourceColor.xyz + vec3(0.5, 0.5, 0.5), 1.0);\n    return;\n}\n"

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0
.end method

.method public getSkinSmoothScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mSkinSmoothScale:F

    .line 2
    .line 3
    return p0
.end method

.method public handleSizeChange()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v0, v0

    .line 9
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mTexelWidth:F

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mTexelHeight:F

    .line 17
    .line 18
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
    const-string v1, "amount"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mSkinSmoothScaleHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "lowSkinThreshold"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mLowSkinThresholdHandle:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "highSkinThreshold"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mHighSkinThresholdHandle:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "skinDefaultRGB"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mDefaultSkinThresholdHandle:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "texelWidthOffset"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mTexelWidthHandle:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "texelHeightOffset"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mTexelHeightHandle:I

    .line 63
    .line 64
    iget v0, p0, Ll/wej;->programHandle:I

    .line 65
    .line 66
    const-string v1, "faceWidth"

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mFaceWidthHandle:I

    .line 73
    .line 74
    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mLowSkinThreshold:[I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    aput v1, v0, v1

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    aput v1, v0, v2

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    aput v1, v0, v3

    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mHighSkinThreshold:[I

    .line 15
    .line 16
    const/16 v4, 0xff

    .line 17
    .line 18
    aput v4, v0, v1

    .line 19
    .line 20
    aput v4, v0, v2

    .line 21
    .line 22
    aput v4, v0, v3

    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mDefaultSkinThreshold:[I

    .line 25
    .line 26
    const/16 v4, 0xa0

    .line 27
    .line 28
    aput v4, v0, v1

    .line 29
    .line 30
    const/16 v1, 0x78

    .line 31
    .line 32
    aput v1, v0, v2

    .line 33
    .line 34
    const/16 v1, 0x6e

    .line 35
    .line 36
    aput v1, v0, v3

    .line 37
    .line 38
    iget v0, p1, Ll/omw;->c:I

    .line 39
    .line 40
    rem-int/lit8 v1, v0, 0x5a

    .line 41
    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    rem-int/lit16 v0, v0, 0xb4

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget v0, p1, Ll/omw;->f:I

    .line 49
    .line 50
    int-to-float v0, v0

    .line 51
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMMCVWidth:F

    .line 52
    .line 53
    iget p1, p1, Ll/omw;->e:I

    .line 54
    .line 55
    int-to-float p1, p1

    .line 56
    iput p1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMMCVHeight:F

    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    iget v0, p1, Ll/omw;->e:I

    .line 60
    .line 61
    int-to-float v0, v0

    .line 62
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMMCVWidth:F

    .line 63
    .line 64
    iget p1, p1, Ll/omw;->f:I

    .line 65
    .line 66
    int-to-float p1, p1

    .line 67
    iput p1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mMMCVHeight:F

    .line 68
    .line 69
    return-void
.end method

.method public setSkinSmoothScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/skin/AIFaceSkinSmoothFilter;->mSkinSmoothScale:F

    .line 2
    .line 3
    return-void
.end method
