.class Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/VideoFrameDrawer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "YuvUploader"
.end annotation


# instance fields
.field private copyBuffer:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private yuvTextures:[I
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/VideoFrameDrawer$1;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;-><init>()V

    return-void
.end method


# virtual methods
.method public getYuvTextures()[I
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public release()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x3

    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-static {v2, v1, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public uploadFromBuffer(Lcom/bytedance/realx/video/VideoFrame$I420Buffer;)[I
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getStrideY()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getStrideU()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getStrideV()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    filled-new-array {v0, v1, v2}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    filled-new-array {v1, v2, v3}, [Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->uploadYuvData(II[I[Ljava/nio/ByteBuffer;)[I

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public uploadYuvData(II[I[Ljava/nio/ByteBuffer;)[I
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
    if-ge v4, v6, :cond_1

    .line 24
    .line 25
    aget v6, p3, v4

    .line 26
    .line 27
    aget v7, v1, v4

    .line 28
    .line 29
    if-le v6, v7, :cond_0

    .line 30
    .line 31
    aget v6, v2, v4

    .line 32
    .line 33
    mul-int/2addr v7, v6

    .line 34
    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    if-lez v5, :cond_3

    .line 42
    .line 43
    iget-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    if-eqz v4, :cond_2

    .line 46
    .line 47
    invoke-virtual {v4}, Ljava/nio/Buffer;->capacity()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-ge v4, v5, :cond_3

    .line 52
    .line 53
    :cond_2
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    iput-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    :cond_3
    iget-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 60
    .line 61
    const/16 v5, 0xde1

    .line 62
    .line 63
    if-nez v4, :cond_4

    .line 64
    .line 65
    new-array v4, v6, [I

    .line 66
    .line 67
    iput-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 68
    .line 69
    move v4, v3

    .line 70
    :goto_1
    if-ge v4, v6, :cond_4

    .line 71
    .line 72
    iget-object v7, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 73
    .line 74
    invoke-static {v5}, Lcom/bytedance/realx/video/GlUtil;->generateTexture(I)I

    .line 75
    .line 76
    .line 77
    move-result v8

    .line 78
    aput v8, v7, v4

    .line 79
    .line 80
    add-int/lit8 v4, v4, 0x1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_4
    :goto_2
    if-ge v3, v6, :cond_6

    .line 84
    .line 85
    const v4, 0x84c0

    .line 86
    .line 87
    .line 88
    add-int/2addr v4, v3

    .line 89
    invoke-static {v4}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 90
    .line 91
    .line 92
    iget-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 93
    .line 94
    aget v4, v4, v3

    .line 95
    .line 96
    invoke-static {v5, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 97
    .line 98
    .line 99
    aget v8, p3, v3

    .line 100
    .line 101
    aget v10, v1, v3

    .line 102
    .line 103
    if-ne v8, v10, :cond_5

    .line 104
    .line 105
    aget-object v4, p4, v3

    .line 106
    .line 107
    :goto_3
    move-object v15, v4

    .line 108
    goto :goto_4

    .line 109
    :cond_5
    aget-object v7, p4, v3

    .line 110
    .line 111
    iget-object v9, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 112
    .line 113
    aget v12, v2, v3

    .line 114
    .line 115
    move v11, v10

    .line 116
    invoke-static/range {v7 .. v12}, Lcom/bytedance/realx/video/YuvHelper;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 117
    .line 118
    .line 119
    iget-object v4, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :goto_4
    aget v10, v1, v3

    .line 123
    .line 124
    aget v11, v2, v3

    .line 125
    .line 126
    const/16 v13, 0x1909

    .line 127
    .line 128
    const/16 v14, 0x1401

    .line 129
    .line 130
    const/16 v7, 0xde1

    .line 131
    .line 132
    const/4 v8, 0x0

    .line 133
    const/16 v9, 0x1909

    .line 134
    .line 135
    const/4 v12, 0x0

    .line 136
    invoke-static/range {v7 .. v15}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 137
    .line 138
    .line 139
    add-int/lit8 v3, v3, 0x1

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_6
    iget-object v0, v0, Lcom/ss/bytertc/base/media/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 143
    .line 144
    return-object v0
.end method
