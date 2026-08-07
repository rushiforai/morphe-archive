.class Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/VideoFrameDrawer;
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

.method public synthetic constructor <init>(Lcom/bytedance/realx/video/VideoFrameDrawer$1;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;-><init>()V

    return-void
.end method


# virtual methods
.method public getYuvTextures()[I
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public release()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

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
    iput-object v0, p0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public uploadFromBuffer(Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;)[I
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getPixelFormat()Lcom/bytedance/realx/video/RXPixelFormat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/bytedance/realx/video/RXPixelFormat;->kI420:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    invoke-interface {p1, v0}, Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;->getPlaneLineSize(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-interface {p1, v2}, Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;->getPlaneLineSize(I)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/4 v4, 0x2

    .line 22
    invoke-interface {p1, v4}, Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;->getPlaneLineSize(I)I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    filled-new-array {v1, v3, v5}, [I

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {p1, v0}, Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {p1, v2}, Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {p1, v4}, Lcom/bytedance/realx/video/memory/RXVideoByteMemoryInterface;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    filled-new-array {v0, v2, v3}, [Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getWidth()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->uploadYuvData(II[I[Ljava/nio/ByteBuffer;)[I

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public uploadYuvData(II[I[Ljava/nio/ByteBuffer;)[I
    .locals 17
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
    iget-object v4, v0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

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
    iput-object v4, v0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    :cond_3
    iget-object v4, v0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

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
    iput-object v4, v0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 68
    .line 69
    move v4, v3

    .line 70
    :goto_1
    if-ge v4, v6, :cond_4

    .line 71
    .line 72
    iget-object v7, v0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

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
    const/16 v4, 0xcf5

    .line 86
    .line 87
    const/4 v7, 0x1

    .line 88
    invoke-static {v4, v7}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    .line 89
    .line 90
    .line 91
    const v7, 0x84c0

    .line 92
    .line 93
    .line 94
    add-int/2addr v7, v3

    .line 95
    invoke-static {v7}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 96
    .line 97
    .line 98
    iget-object v7, v0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 99
    .line 100
    aget v7, v7, v3

    .line 101
    .line 102
    invoke-static {v5, v7}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 103
    .line 104
    .line 105
    aget v9, p3, v3

    .line 106
    .line 107
    aget v11, v1, v3

    .line 108
    .line 109
    if-ne v9, v11, :cond_5

    .line 110
    .line 111
    aget-object v7, p4, v3

    .line 112
    .line 113
    :goto_3
    move-object/from16 v16, v7

    .line 114
    .line 115
    goto :goto_4

    .line 116
    :cond_5
    aget-object v8, p4, v3

    .line 117
    .line 118
    iget-object v10, v0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    aget v13, v2, v3

    .line 121
    .line 122
    move v12, v11

    .line 123
    invoke-static/range {v8 .. v13}, Lcom/bytedance/realx/video/YuvHelper;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 124
    .line 125
    .line 126
    iget-object v7, v0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->copyBuffer:Ljava/nio/ByteBuffer;

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :goto_4
    aget v11, v1, v3

    .line 130
    .line 131
    aget v12, v2, v3

    .line 132
    .line 133
    const/16 v14, 0x1909

    .line 134
    .line 135
    const/16 v15, 0x1401

    .line 136
    .line 137
    const/16 v8, 0xde1

    .line 138
    .line 139
    const/4 v9, 0x0

    .line 140
    const/16 v10, 0x1909

    .line 141
    .line 142
    const/4 v13, 0x0

    .line 143
    invoke-static/range {v8 .. v16}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 144
    .line 145
    .line 146
    const/4 v7, 0x4

    .line 147
    invoke-static {v4, v7}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    .line 148
    .line 149
    .line 150
    add-int/lit8 v3, v3, 0x1

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_6
    iget-object v0, v0, Lcom/bytedance/realx/video/VideoFrameDrawer$YuvUploader;->yuvTextures:[I

    .line 154
    .line 155
    return-object v0
.end method
