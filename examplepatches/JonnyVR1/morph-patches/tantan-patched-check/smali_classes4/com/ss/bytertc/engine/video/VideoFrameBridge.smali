.class public Lcom/ss/bytertc/engine/video/VideoFrameBridge;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/video/IVideoFrame;


# instance fields
.field private mCameraId:Lcom/ss/bytertc/engine/data/CameraId;

.field private mNativePtr:J

.field private final mRefCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;


# direct methods
.method public constructor <init>(JIIIIIIJI[Ljava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;I[FLandroid/opengl/EGLContext;Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;I)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 2
    iput-wide v0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mNativePtr:J

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/data/CameraId;->CAMERA_ID_FRONT:Lcom/ss/bytertc/engine/data/CameraId;

    iput-object v0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mCameraId:Lcom/ss/bytertc/engine/data/CameraId;

    .line 5
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mRefCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 6
    iput-wide p1, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mNativePtr:J

    .line 7
    new-instance p1, Lcom/ss/bytertc/engine/data/VideoFrameData;

    invoke-direct {p1}, Lcom/ss/bytertc/engine/data/VideoFrameData;-><init>()V

    iput-object p1, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 8
    invoke-static {p3}, Lcom/ss/bytertc/engine/data/VideoBufferType;->fromId(I)Lcom/ss/bytertc/engine/data/VideoBufferType;

    move-result-object p2

    iput-object p2, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->bufferType:Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 9
    iget-object p1, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    invoke-static {p4}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->fromId(I)Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    move-result-object p2

    iput-object p2, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 10
    iget-object p1, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    invoke-static {p5}, Lcom/ss/bytertc/engine/data/VideoContentType;->fromId(I)Lcom/ss/bytertc/engine/data/VideoContentType;

    move-result-object p2

    iput-object p2, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->contentType:Lcom/ss/bytertc/engine/data/VideoContentType;

    .line 11
    iget-object p1, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    iput p6, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->width:I

    .line 12
    iput p7, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->height:I

    .line 13
    invoke-static {p8}, Lcom/ss/bytertc/engine/data/VideoRotation;->fromId(I)Lcom/ss/bytertc/engine/data/VideoRotation;

    move-result-object p2

    iput-object p2, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->rotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 14
    iget-object p1, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    iput-wide p9, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->timestampUs:J

    .line 15
    iput p11, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->numberOfPlanes:I

    .line 16
    iput-object p12, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->planeData:[Ljava/nio/ByteBuffer;

    .line 17
    iput-object p13, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->planeStride:[I

    move-object/from16 p2, p14

    .line 18
    iput-object p2, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->seiData:Ljava/nio/ByteBuffer;

    move/from16 p2, p15

    .line 19
    iput p2, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->textureId:I

    move-object/from16 p2, p16

    .line 20
    iput-object p2, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->textureMatrix:[F

    move-object/from16 p2, p17

    .line 21
    iput-object p2, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->eglContext:Landroid/opengl/EGLContext;

    move-object/from16 p2, p18

    .line 22
    iput-object p2, p1, Lcom/ss/bytertc/engine/data/VideoFrameData;->fovTileInfo:Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;

    .line 23
    invoke-static/range {p19 .. p19}, Lcom/ss/bytertc/engine/data/CameraId;->fromId(I)Lcom/ss/bytertc/engine/data/CameraId;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mCameraId:Lcom/ss/bytertc/engine/data/CameraId;

    .line 24
    iget-wide p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mNativePtr:J

    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->nativeAddRef(J)V

    return-void
.end method

.method public static ConvertJVideoFrameDataToVideoFrameData(Lcom/ss/bytertc/engine/data/VideoFrameData;)J
    .locals 18
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    new-array v11, v1, [Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget v2, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->numberOfPlanes:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->planeData:[Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    aget-object v2, v2, v1

    .line 14
    .line 15
    invoke-static {v2}, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->ensureDirectBuffer(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    aput-object v2, v11, v1

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v1, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->seiData:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->ensureDirectBuffer(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object v13

    .line 30
    iget-object v1, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->roiData:Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->ensureDirectBuffer(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v14

    .line 36
    iget-object v1, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->bufferType:Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/VideoBufferType;->value()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iget-object v1, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    iget-object v1, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->contentType:Lcom/ss/bytertc/engine/data/VideoContentType;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/VideoContentType;->value()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    iget v5, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->width:I

    .line 55
    .line 56
    iget v6, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->height:I

    .line 57
    .line 58
    iget-object v1, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->rotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    iget-wide v8, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->timestampUs:J

    .line 65
    .line 66
    iget v10, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->numberOfPlanes:I

    .line 67
    .line 68
    iget-object v12, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->planeStride:[I

    .line 69
    .line 70
    iget v15, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->textureId:I

    .line 71
    .line 72
    iget-object v1, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->textureMatrix:[F

    .line 73
    .line 74
    iget-object v0, v0, Lcom/ss/bytertc/engine/data/VideoFrameData;->eglContext:Landroid/opengl/EGLContext;

    .line 75
    .line 76
    move-object/from16 v17, v0

    .line 77
    .line 78
    move-object/from16 v16, v1

    .line 79
    .line 80
    invoke-static/range {v2 .. v17}, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->nativeCreateVideoFrameData(IIIIIIJI[Ljava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I[FLandroid/opengl/EGLContext;)J

    .line 81
    .line 82
    .line 83
    move-result-wide v0

    .line 84
    return-wide v0
.end method

.method public static ConvertVideoFrameToIVideoFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;)J
    .locals 17
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    move-object/from16 v2, p0

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    new-array v10, v0, [Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    new-array v11, v0, [I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->numberOfPlanes()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v2, v0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->planeData(I)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->ensureDirectBuffer(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    aput-object v1, v10, v0

    .line 24
    .line 25
    invoke-interface {v2, v0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->planeStride(I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    aput v1, v11, v0

    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->seiData()Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->ensureDirectBuffer(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v12

    .line 42
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->bufferType()Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoBufferType;->value()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->pixelFormat()Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->contentType()Lcom/ss/bytertc/engine/data/VideoContentType;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoContentType;->value()I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->width()I

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->height()I

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->rotation()Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->numberOfPlanes()I

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->textureId()I

    .line 87
    .line 88
    .line 89
    move-result v13

    .line 90
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->textureMatrix()[F

    .line 91
    .line 92
    .line 93
    move-result-object v14

    .line 94
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->eglContext()Landroid/opengl/EGLContext;

    .line 95
    .line 96
    .line 97
    move-result-object v15

    .line 98
    invoke-interface {v2}, Lcom/ss/bytertc/engine/video/IVideoFrame;->cameraId()Lcom/ss/bytertc/engine/data/CameraId;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/CameraId;->value()I

    .line 103
    .line 104
    .line 105
    move-result v16

    .line 106
    invoke-static/range {v2 .. v16}, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->nativeCreateIVideoFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;IIIIIII[Ljava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;I[FLandroid/opengl/EGLContext;I)J

    .line 107
    .line 108
    .line 109
    move-result-wide v0

    .line 110
    return-wide v0
.end method

.method public static addRefOfVideoFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->addRef()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static ensureDirectBuffer(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->isDirect()Z

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
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    :goto_0
    return-object p0
.end method

.method public static native nativeAddRef(J)V
.end method

.method public static native nativeCreateIVideoFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;IIIIIII[Ljava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;I[FLandroid/opengl/EGLContext;I)J
.end method

.method public static native nativeCreateVideoFrameData(IIIIIIJI[Ljava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I[FLandroid/opengl/EGLContext;)J
.end method

.method public static native nativeReleaseRef(J)J
.end method

.method public static releaseRefOfVideoFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;)J
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->releaseRef()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method


# virtual methods
.method public addRef()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mRefCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mNativePtr:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->nativeAddRef(J)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "addRef on an object that has already been destroyed."

    .line 17
    .line 18
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public bufferType()Lcom/ss/bytertc/engine/data/VideoBufferType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->bufferType:Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 4
    .line 5
    return-object p0
.end method

.method public cameraId()Lcom/ss/bytertc/engine/data/CameraId;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mCameraId:Lcom/ss/bytertc/engine/data/CameraId;

    .line 2
    .line 3
    return-object p0
.end method

.method public contentType()Lcom/ss/bytertc/engine/data/VideoContentType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->contentType:Lcom/ss/bytertc/engine/data/VideoContentType;

    .line 4
    .line 5
    return-object p0
.end method

.method public eglContext()Landroid/opengl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->eglContext:Landroid/opengl/EGLContext;

    .line 4
    .line 5
    return-object p0
.end method

.method public fovTileInfo()Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->fovTileInfo:Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;

    .line 4
    .line 5
    return-object p0
.end method

.method public height()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->height:I

    .line 4
    .line 5
    return p0
.end method

.method public numberOfPlanes()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->numberOfPlanes:I

    .line 4
    .line 5
    return p0
.end method

.method public pixelFormat()Lcom/ss/bytertc/engine/data/VideoPixelFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 4
    .line 5
    return-object p0
.end method

.method public planeData(I)Ljava/nio/ByteBuffer;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget v0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->numberOfPlanes:I

    .line 4
    .line 5
    if-lt p1, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->planeData:[Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    aget-object p0, p0, p1

    .line 12
    .line 13
    return-object p0
.end method

.method public planeStride(I)I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget v0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->numberOfPlanes:I

    .line 4
    .line 5
    if-lt p1, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->planeStride:[I

    .line 10
    .line 11
    aget p0, p0, p1

    .line 12
    .line 13
    return p0
.end method

.method public releaseRef()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mRefCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mNativePtr:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->nativeReleaseRef(J)J

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mRefCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    int-to-long v0, p0

    .line 22
    return-wide v0
.end method

.method public rotation()Lcom/ss/bytertc/engine/data/VideoRotation;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->rotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 4
    .line 5
    return-object p0
.end method

.method public seiData()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->seiData:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    return-object p0
.end method

.method public textureId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->textureId:I

    .line 4
    .line 5
    return p0
.end method

.method public textureMatrix()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->textureMatrix:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public timestampUs()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->timestampUs:J

    .line 4
    .line 5
    return-wide v0
.end method

.method public width()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoFrameBridge;->mVfd:Lcom/ss/bytertc/engine/data/VideoFrameData;

    .line 2
    .line 3
    iget p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->width:I

    .line 4
    .line 5
    return p0
.end method
