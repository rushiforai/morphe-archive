.class public Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;


# instance fields
.field private nativeHandle:J

.field refCounted:Lcom/bytedance/realx/video/memory/RefObject;


# direct methods
.method private constructor <init>(J)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 5
    .line 6
    new-instance p1, Lcom/bytedance/realx/video/memory/RefObject;

    .line 7
    .line 8
    new-instance p2, Ll/ye20;

    .line 9
    .line 10
    invoke-direct {p2, p0}, Ll/ye20;-><init>(Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p1, p2}, Lcom/bytedance/realx/video/memory/RefObject;-><init>(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->refCounted:Lcom/bytedance/realx/video/memory/RefObject;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;)V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeReleaseVideoFrame(J)V

    .line 10
    .line 11
    .line 12
    iput-wide v2, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static createRXVideoFrame(Lcom/bytedance/realx/video/memory/NativeRXByteMemory;JLjava/nio/ByteBuffer;Lcom/bytedance/realx/video/RXColorSpace;Lcom/bytedance/realx/video/RXVideoRotation;)Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;
    .locals 12
    .param p0    # Lcom/bytedance/realx/video/memory/NativeRXByteMemory;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->getNativeHandle()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPixelFormat()Lcom/bytedance/realx/video/RXPixelFormat;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneDataArray()[Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSizeArray()[I

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    move-wide v7, p1

    .line 26
    move-object v9, p3

    .line 27
    move-object/from16 v10, p4

    .line 28
    .line 29
    move-object/from16 v11, p5

    .line 30
    .line 31
    invoke-static/range {v0 .. v11}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeCreateRXVideoFrameFromByteMemory(JIILcom/bytedance/realx/video/RXPixelFormat;[Ljava/nio/ByteBuffer;[IJLjava/nio/ByteBuffer;Lcom/bytedance/realx/video/RXColorSpace;Lcom/bytedance/realx/video/RXVideoRotation;)J

    .line 32
    .line 33
    .line 34
    move-result-wide p0

    .line 35
    new-instance p2, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;

    .line 36
    .line 37
    invoke-direct {p2, p0, p1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;-><init>(J)V

    .line 38
    .line 39
    .line 40
    return-object p2
.end method

.method public static createRXVideoFrame(Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;JLjava/nio/ByteBuffer;Lcom/bytedance/realx/video/RXColorSpace;)Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;
    .locals 11
    .param p0    # Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    if-eqz p1, :cond_0

    .line 41
    invoke-interface {p1}, Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;->getNativeHandle()J

    move-result-wide v0

    :goto_0
    move-wide v4, v0

    goto :goto_1

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0

    .line 42
    :goto_1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->getNativeHandle()J

    move-result-wide v2

    .line 43
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->getRotation()Lcom/bytedance/realx/video/RXVideoRotation;

    move-result-object v10

    move-wide v6, p2

    move-object v8, p4

    move-object/from16 v9, p5

    .line 44
    invoke-static/range {v2 .. v10}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeCreateRXVideoFrameFromOpenGLMemory(JJJLjava/nio/ByteBuffer;Lcom/bytedance/realx/video/RXColorSpace;Lcom/bytedance/realx/video/RXVideoRotation;)J

    move-result-wide p0

    .line 45
    new-instance p2, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;

    invoke-direct {p2, p0, p1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;-><init>(J)V

    return-object p2
.end method

.method private static native nativeCreateRXVideoFrameFromByteMemory(JIILcom/bytedance/realx/video/RXPixelFormat;[Ljava/nio/ByteBuffer;[IJLjava/nio/ByteBuffer;Lcom/bytedance/realx/video/RXColorSpace;Lcom/bytedance/realx/video/RXVideoRotation;)J
.end method

.method private static native nativeCreateRXVideoFrameFromOpenGLMemory(JJJLjava/nio/ByteBuffer;Lcom/bytedance/realx/video/RXColorSpace;Lcom/bytedance/realx/video/RXVideoRotation;)J
.end method

.method private static native nativeGetColorSpace(J)Lcom/bytedance/realx/video/RXColorSpace;
.end method

.method private static native nativeGetFrameMemory(J)Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;
.end method

.method private static native nativeGetRotation(J)Lcom/bytedance/realx/video/RXVideoRotation;
.end method

.method private static native nativeGetSupplementData(J)Ljava/nio/ByteBuffer;
.end method

.method private static native nativeGetTimestampNs(J)J
.end method

.method private static native nativeGetTimestampUs(J)J
.end method

.method private static native nativeReleaseVideoFrame(J)V
.end method

.method private static native nativeSetRotation(JLcom/bytedance/realx/video/RXVideoRotation;)V
.end method

.method private static native nativeSetTimestampNs(JJ)V
.end method

.method private static native nativeSetTimestampUs(JJ)V
.end method

.method private static native nativeToI420(J)Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;
.end method


# virtual methods
.method public getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeGetFrameMemory(J)Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getColorSpace()Lcom/bytedance/realx/video/RXColorSpace;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/bytedance/realx/video/RXColorSpace;->kUnknown:Lcom/bytedance/realx/video/RXColorSpace;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeGetColorSpace(J)Lcom/bytedance/realx/video/RXColorSpace;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getHeight()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-interface {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 14
    .line 15
    .line 16
    return v0
.end method

.method public getNativeHandle()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRotatedHeight()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->getRotation()Lcom/bytedance/realx/video/RXVideoRotation;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoRotation;->value()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    rem-int/lit16 p0, p0, 0xb4

    .line 29
    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    return v2

    .line 33
    :cond_1
    return v1
.end method

.method public getRotatedWidth()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->getRotation()Lcom/bytedance/realx/video/RXVideoRotation;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoRotation;->value()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    rem-int/lit16 p0, p0, 0xb4

    .line 29
    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    return v2
.end method

.method public getRotation()Lcom/bytedance/realx/video/RXVideoRotation;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/bytedance/realx/video/RXVideoRotation;->VIDEO_ROTATION_0:Lcom/bytedance/realx/video/RXVideoRotation;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeGetRotation(J)Lcom/bytedance/realx/video/RXVideoRotation;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getSupplementData()Ljava/nio/ByteBuffer;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeGetSupplementData(J)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getTimestampNs()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeGetTimestampNs(J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    return-wide v0
.end method

.method public getTimestampUs()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeGetTimestampUs(J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    return-wide v0
.end method

.method public getWidth()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-interface {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 14
    .line 15
    .line 16
    return v0
.end method

.method public isNullPointer()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public declared-synchronized release()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->refCounted:Lcom/bytedance/realx/video/memory/RefObject;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/bytedance/realx/video/memory/RefObject;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method

.method public declared-synchronized retain()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->refCounted:Lcom/bytedance/realx/video/memory/RefObject;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/bytedance/realx/video/memory/RefObject;->retain()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method

.method public setRotation(Lcom/bytedance/realx/video/RXVideoRotation;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 9
    .line 10
    invoke-static {v0, v1, p1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeSetRotation(JLcom/bytedance/realx/video/RXVideoRotation;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setTimestampNs(J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 9
    .line 10
    invoke-static {v0, v1, p1, p2}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeSetTimestampNs(JJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setTimestampUs(J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 9
    .line 10
    invoke-static {v0, v1, p1, p2}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeSetTimestampUs(JJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public toI420()Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeHandle:J

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->nativeToI420(J)Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
