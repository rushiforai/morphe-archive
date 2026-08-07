.class public Lcom/ss/bytertc/engine/video/converter/WebRTCConverter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "WebRTCConverter"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static convertByteI420Frame2WebrtcI420Frame(Lcom/ss/bytertc/engine/video/IVideoFrame;)Lcom/bytedance/realx/video/VideoFrame;
    .locals 12

    .line 1
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->bufferType()Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoBufferType;->RAW_MEMORY:Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    return-object v2

    .line 11
    :cond_0
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->pixelFormat()Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->I420:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 16
    .line 17
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    return-object v2

    .line 20
    :cond_1
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->addRef()V

    .line 21
    .line 22
    .line 23
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->width()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->height()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-interface {p0, v0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->planeData(I)Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-interface {p0, v1}, Lcom/ss/bytertc/engine/video/IVideoFrame;->planeData(I)Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    const/4 v6, 0x2

    .line 42
    invoke-interface {p0, v6}, Lcom/ss/bytertc/engine/video/IVideoFrame;->planeData(I)Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    .line 45
    move-result-object v9

    .line 46
    invoke-interface {p0, v0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->planeStride(I)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-interface {p0, v1}, Lcom/ss/bytertc/engine/video/IVideoFrame;->planeStride(I)I

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    invoke-interface {p0, v6}, Lcom/ss/bytertc/engine/video/IVideoFrame;->planeStride(I)I

    .line 55
    .line 56
    .line 57
    move-result v10

    .line 58
    :try_start_0
    new-instance v11, Ll/xrp0;

    .line 59
    .line 60
    invoke-direct {v11, p0}, Ll/xrp0;-><init>(Lcom/ss/bytertc/engine/video/IVideoFrame;)V

    .line 61
    .line 62
    .line 63
    move v6, v0

    .line 64
    invoke-static/range {v3 .. v11}, Lcom/bytedance/realx/video/JavaI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Lcom/bytedance/realx/video/VideoFrame;

    .line 69
    .line 70
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->rotation()Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->timestampUs()J

    .line 79
    .line 80
    .line 81
    move-result-wide v4

    .line 82
    invoke-direct {v1, v0, v3, v4, v5}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJ)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .line 84
    .line 85
    return-object v1

    .line 86
    :catch_0
    move-exception v0

    .line 87
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->releaseRef()J

    .line 88
    .line 89
    .line 90
    sget-object p0, Lcom/ss/bytertc/engine/video/converter/WebRTCConverter;->TAG:Ljava/lang/String;

    .line 91
    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v3, "Frame convert failed: "

    .line 95
    .line 96
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-object v2
.end method

.method public static convertByteRGBAFrame2WebrtcI420Frame(Lcom/ss/bytertc/engine/video/IVideoFrame;)Lcom/bytedance/realx/video/VideoFrame;
    .locals 13

    .line 1
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->bufferType()Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoBufferType;->RAW_MEMORY:Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_2

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->pixelFormat()Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->RGBA:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 15
    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->width()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->height()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    const/4 v0, 0x0

    .line 28
    move v12, v4

    .line 29
    invoke-interface {p0, v0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->planeStride(I)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    add-int/lit8 v1, v3, 0x3f

    .line 34
    .line 35
    div-int/lit8 v1, v1, 0x40

    .line 36
    .line 37
    mul-int/lit8 v6, v1, 0x40

    .line 38
    .line 39
    shr-int/lit8 v1, v3, 0x1

    .line 40
    .line 41
    add-int/lit8 v1, v1, 0x3f

    .line 42
    .line 43
    div-int/lit8 v1, v1, 0x40

    .line 44
    .line 45
    mul-int/lit8 v8, v1, 0x40

    .line 46
    .line 47
    invoke-interface {p0, v0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->planeData(I)Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    return-object v2

    .line 54
    :cond_1
    mul-int v1, v6, v12

    .line 55
    .line 56
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    add-int/lit8 v1, v12, 0x1

    .line 61
    .line 62
    shr-int/lit8 v1, v1, 0x1

    .line 63
    .line 64
    mul-int/2addr v1, v8

    .line 65
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    move v10, v8

    .line 74
    move v11, v3

    .line 75
    move-object v3, v0

    .line 76
    invoke-static/range {v3 .. v12}, Lcom/ss/bytertc/engine/utils/ByteBufferUtils;->nativeRGBAToI420(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)I

    .line 77
    .line 78
    .line 79
    move v3, v11

    .line 80
    new-instance v11, Ll/xrp0;

    .line 81
    .line 82
    invoke-direct {v11, p0}, Ll/xrp0;-><init>(Lcom/ss/bytertc/engine/video/IVideoFrame;)V

    .line 83
    .line 84
    .line 85
    move v4, v12

    .line 86
    invoke-static/range {v3 .. v11}, Lcom/bytedance/realx/video/JavaI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Lcom/bytedance/realx/video/VideoFrame;

    .line 91
    .line 92
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->rotation()Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->timestampUs()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    invoke-direct {v1, v0, v2, v3, v4}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJ)V

    .line 105
    .line 106
    .line 107
    return-object v1

    .line 108
    :cond_2
    :goto_0
    return-object v2
.end method

.method public static convertByteTexFrame2WebrtcTexFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;Landroid/os/Looper;)Lcom/bytedance/realx/video/VideoFrame;
    .locals 10

    .line 1
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->bufferType()Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoBufferType;->GL_TEXTURE:Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    return-object v2

    .line 11
    :cond_0
    if-nez p1, :cond_1

    .line 12
    .line 13
    return-object v2

    .line 14
    :cond_1
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->textureMatrix()[F

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->pixelFormat()Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->TEXTURE_2D:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 27
    .line 28
    if-ne v0, v1, :cond_2

    .line 29
    .line 30
    sget-object v0, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->RGB:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 31
    .line 32
    :goto_0
    move-object v4, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_2
    sget-object v0, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->OES:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :goto_1
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->addRef()V

    .line 38
    .line 39
    .line 40
    new-instance v1, Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 41
    .line 42
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->width()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->height()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->textureId()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    new-instance v7, Landroid/os/Handler;

    .line 55
    .line 56
    invoke-direct {v7, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 57
    .line 58
    .line 59
    new-instance v8, Lcom/bytedance/realx/video/YuvConverter;

    .line 60
    .line 61
    invoke-direct {v8}, Lcom/bytedance/realx/video/YuvConverter;-><init>()V

    .line 62
    .line 63
    .line 64
    new-instance v9, Ll/xrp0;

    .line 65
    .line 66
    invoke-direct {v9, p0}, Ll/xrp0;-><init>(Lcom/ss/bytertc/engine/video/IVideoFrame;)V

    .line 67
    .line 68
    .line 69
    invoke-direct/range {v1 .. v9}, Lcom/bytedance/realx/video/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/bytedance/realx/video/YuvConverter;Ljava/lang/Runnable;)V

    .line 70
    .line 71
    .line 72
    new-instance p1, Lcom/bytedance/realx/video/VideoFrame;

    .line 73
    .line 74
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->rotation()Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->timestampUs()J

    .line 83
    .line 84
    .line 85
    move-result-wide v2

    .line 86
    invoke-direct {p1, v1, v0, v2, v3}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJ)V

    .line 87
    .line 88
    .line 89
    return-object p1
.end method
