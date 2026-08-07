.class Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/VideoFrameDrawer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "YuvUploader"
.end annotation


# instance fields
.field private alphaTexture:I

.field private copyAlphaBuffer:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private copyBuffer:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private enableNegativeAlphaData:Z

.field private yuvTextures:[I
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->alphaTexture:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->enableNegativeAlphaData:Z

    .line 9
    .line 10
    return-void
.end method

.method public synthetic constructor <init>(Lio/agora/base/internal/video/VideoFrameDrawer$1;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;-><init>()V

    return-void
.end method


# virtual methods
.method public disableNegativeAlphaData()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->enableNegativeAlphaData:Z

    .line 3
    .line 4
    return-void
.end method

.method public getAlphaTexture()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->alphaTexture:I

    .line 2
    .line 3
    return p0
.end method

.method public getYuvTextures()[I
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public release()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 3
    .line 4
    iput-object v0, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyAlphaBuffer:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    iget-object v1, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 v3, 0x3

    .line 12
    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 16
    .line 17
    :cond_0
    iget v0, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->alphaTexture:I

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    filled-new-array {v0}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 27
    .line 28
    .line 29
    iput v2, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->alphaTexture:I

    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public uploadAlphaData(IILjava/nio/ByteBuffer;Z)I
    .locals 12

    .line 1
    iget v1, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->alphaTexture:I

    .line 2
    .line 3
    const/16 v2, 0xde1

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    invoke-static {v2}, Lio/agora/base/internal/video/GlUtil;->generateTexture(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iput v1, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->alphaTexture:I

    .line 12
    .line 13
    :cond_0
    const/4 v1, 0x0

    .line 14
    if-lez p1, :cond_7

    .line 15
    .line 16
    if-gtz p2, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    mul-int v3, p1, p2

    .line 20
    .line 21
    if-eqz p4, :cond_2

    .line 22
    .line 23
    iget-boolean v4, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->enableNegativeAlphaData:Z

    .line 24
    .line 25
    if-eqz v4, :cond_2

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    :cond_2
    if-eqz v1, :cond_5

    .line 29
    .line 30
    iget-object v4, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyAlphaBuffer:Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    if-eqz v4, :cond_3

    .line 33
    .line 34
    invoke-virtual {v4}, Ljava/nio/Buffer;->capacity()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-ge v4, v3, :cond_4

    .line 39
    .line 40
    :cond_3
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iput-object v3, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyAlphaBuffer:Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    :cond_4
    iget-object v8, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyAlphaBuffer:Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    neg-int v11, p2

    .line 49
    move v9, p1

    .line 50
    move v10, p1

    .line 51
    move v7, p1

    .line 52
    move-object v6, p3

    .line 53
    invoke-static/range {v6 .. v11}, Lio/agora/base/internal/video/YuvHelper;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 54
    .line 55
    .line 56
    :cond_5
    const v3, 0x84c3

    .line 57
    .line 58
    .line 59
    invoke-static {v3}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 60
    .line 61
    .line 62
    iget v3, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->alphaTexture:I

    .line 63
    .line 64
    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 65
    .line 66
    .line 67
    if-eqz v1, :cond_6

    .line 68
    .line 69
    iget-object v1, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyAlphaBuffer:Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    move-object v9, v1

    .line 72
    goto :goto_0

    .line 73
    :cond_6
    move-object v9, p3

    .line 74
    :goto_0
    const/16 v1, 0xde1

    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    const/16 v3, 0x1906

    .line 78
    .line 79
    const/4 v6, 0x0

    .line 80
    const/16 v7, 0x1906

    .line 81
    .line 82
    const/16 v8, 0x1401

    .line 83
    .line 84
    move v4, p1

    .line 85
    move v5, p2

    .line 86
    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 87
    .line 88
    .line 89
    iget v0, p0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->alphaTexture:I

    .line 90
    .line 91
    return v0

    .line 92
    :cond_7
    :goto_1
    return v1
.end method

.method public uploadFromBuffer(Lio/agora/base/VideoFrame$I420Buffer;)[I
    .locals 9
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-interface {p1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideY()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-interface {p1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideU()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-interface {p1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideV()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    filled-new-array {v0, v1, v2}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    invoke-interface {p1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {p1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    filled-new-array {v0, v1, v2}, [Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-interface {p1}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    invoke-interface {p1}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    const/4 v8, 0x1

    .line 42
    move-object v3, p0

    .line 43
    invoke-virtual/range {v3 .. v8}, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->uploadYuvData(II[I[Ljava/nio/ByteBuffer;Z)[I

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public uploadI1010FromBuffer(Lio/agora/base/JavaI010Buffer;)[I
    .locals 9
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Lio/agora/base/JavaI010Buffer;->getStrideY()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Lio/agora/base/JavaI010Buffer;->getStrideU()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Lio/agora/base/JavaI010Buffer;->getStrideV()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    filled-new-array {v0, v1, v2}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    invoke-virtual {p1}, Lio/agora/base/JavaI010Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1}, Lio/agora/base/JavaI010Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1}, Lio/agora/base/JavaI010Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    filled-new-array {v0, v1, v2}, [Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-virtual {p1}, Lio/agora/base/JavaI010Buffer;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    invoke-virtual {p1}, Lio/agora/base/JavaI010Buffer;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    const/4 v8, 0x0

    .line 42
    move-object v3, p0

    .line 43
    invoke-virtual/range {v3 .. v8}, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->uploadYuvData(II[I[Ljava/nio/ByteBuffer;Z)[I

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public uploadYuvData(II[I[Ljava/nio/ByteBuffer;Z)[I
    .locals 16
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    div-int/lit8 v3, v1, 0x2

    .line 8
    .line 9
    filled-new-array {v1, v3, v3}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    div-int/lit8 v3, v2, 0x2

    .line 14
    .line 15
    filled-new-array {v2, v3, v3}, [I

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x0

    .line 20
    move v4, v3

    .line 21
    move v5, v4

    .line 22
    :goto_0
    const/4 v6, 0x3

    .line 23
    if-ge v4, v6, :cond_2

    .line 24
    .line 25
    aget v6, p3, v4

    .line 26
    .line 27
    aget v7, v1, v4

    .line 28
    .line 29
    if-le v6, v7, :cond_1

    .line 30
    .line 31
    if-eqz p5, :cond_0

    .line 32
    .line 33
    aget v6, v2, v4

    .line 34
    .line 35
    mul-int/2addr v7, v6

    .line 36
    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    aget v6, v2, v4

    .line 42
    .line 43
    mul-int/2addr v7, v6

    .line 44
    mul-int/lit8 v7, v7, 0x2

    .line 45
    .line 46
    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    if-lez v5, :cond_4

    .line 54
    .line 55
    iget-object v4, v0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    if-eqz v4, :cond_3

    .line 58
    .line 59
    invoke-virtual {v4}, Ljava/nio/Buffer;->capacity()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-ge v4, v5, :cond_4

    .line 64
    .line 65
    :cond_3
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    iput-object v4, v0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    :cond_4
    iget-object v4, v0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 72
    .line 73
    const/16 v5, 0xde1

    .line 74
    .line 75
    if-nez v4, :cond_5

    .line 76
    .line 77
    new-array v4, v6, [I

    .line 78
    .line 79
    iput-object v4, v0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 80
    .line 81
    move v4, v3

    .line 82
    :goto_2
    if-ge v4, v6, :cond_5

    .line 83
    .line 84
    iget-object v7, v0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 85
    .line 86
    invoke-static {v5}, Lio/agora/base/internal/video/GlUtil;->generateTexture(I)I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    aput v8, v7, v4

    .line 91
    .line 92
    const-string v7, "generateTexture"

    .line 93
    .line 94
    invoke-static {v7}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    add-int/lit8 v4, v4, 0x1

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_5
    :goto_3
    if-ge v3, v6, :cond_9

    .line 101
    .line 102
    const v4, 0x84c0

    .line 103
    .line 104
    .line 105
    add-int/2addr v4, v3

    .line 106
    invoke-static {v4}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 107
    .line 108
    .line 109
    iget-object v4, v0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 110
    .line 111
    aget v4, v4, v3

    .line 112
    .line 113
    invoke-static {v5, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 114
    .line 115
    .line 116
    aget v8, p3, v3

    .line 117
    .line 118
    aget v10, v1, v3

    .line 119
    .line 120
    if-ne v8, v10, :cond_6

    .line 121
    .line 122
    aget-object v4, p4, v3

    .line 123
    .line 124
    :goto_4
    move-object v15, v4

    .line 125
    goto :goto_6

    .line 126
    :cond_6
    if-eqz p5, :cond_7

    .line 127
    .line 128
    aget-object v7, p4, v3

    .line 129
    .line 130
    iget-object v9, v0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 131
    .line 132
    aget v12, v2, v3

    .line 133
    .line 134
    move v11, v10

    .line 135
    invoke-static/range {v7 .. v12}, Lio/agora/base/internal/video/YuvHelper;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 136
    .line 137
    .line 138
    goto :goto_5

    .line 139
    :cond_7
    aget-object v7, p4, v3

    .line 140
    .line 141
    iget-object v9, v0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    aget v12, v2, v3

    .line 144
    .line 145
    move v11, v10

    .line 146
    invoke-static/range {v7 .. v12}, Lio/agora/base/internal/video/YuvHelper;->copyPlane16(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 147
    .line 148
    .line 149
    :goto_5
    iget-object v4, v0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    goto :goto_4

    .line 152
    :goto_6
    if-eqz p5, :cond_8

    .line 153
    .line 154
    aget v10, v1, v3

    .line 155
    .line 156
    aget v11, v2, v3

    .line 157
    .line 158
    const/16 v13, 0x1909

    .line 159
    .line 160
    const/16 v14, 0x1401

    .line 161
    .line 162
    const/16 v7, 0xde1

    .line 163
    .line 164
    const/4 v8, 0x0

    .line 165
    const/16 v9, 0x1909

    .line 166
    .line 167
    const/4 v12, 0x0

    .line 168
    invoke-static/range {v7 .. v15}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 169
    .line 170
    .line 171
    goto :goto_7

    .line 172
    :cond_8
    aget v10, v1, v3

    .line 173
    .line 174
    aget v11, v2, v3

    .line 175
    .line 176
    const/16 v13, 0x190a

    .line 177
    .line 178
    const/16 v14, 0x1401

    .line 179
    .line 180
    const/16 v7, 0xde1

    .line 181
    .line 182
    const/4 v8, 0x0

    .line 183
    const/16 v9, 0x190a

    .line 184
    .line 185
    const/4 v12, 0x0

    .line 186
    invoke-static/range {v7 .. v15}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 187
    .line 188
    .line 189
    :goto_7
    const-string v4, "glTexImage2D"

    .line 190
    .line 191
    invoke-static {v4}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    add-int/lit8 v3, v3, 0x1

    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_9
    iget-object v0, v0, Lio/agora/base/internal/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 198
    .line 199
    return-object v0
.end method
