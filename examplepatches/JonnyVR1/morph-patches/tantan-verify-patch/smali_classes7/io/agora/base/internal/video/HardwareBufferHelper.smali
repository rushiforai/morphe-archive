.class public Lio/agora/base/internal/video/HardwareBufferHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final nativeHandle:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lio/agora/base/internal/video/HardwareBufferHelper;->nativeObjectInit()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lio/agora/base/internal/video/HardwareBufferHelper;->nativeHandle:J

    .line 9
    .line 10
    return-void
.end method

.method private native nativeGetOesTextureId(J)I
.end method

.method private native nativeObjectInit()J
.end method

.method private native nativePrepare(JIIIJZ)Z
.end method

.method private native nativeReadFrame(JIIIILjava/nio/ByteBuffer;)Z
.end method

.method private native nativeRelease(J)V
.end method


# virtual methods
.method public getOesTextureId()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/HardwareBufferHelper;->nativeHandle:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lio/agora/base/internal/video/HardwareBufferHelper;->nativeGetOesTextureId(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public prepare(IIIJZ)Z
    .locals 9

    .line 1
    iget-wide v1, p0, Lio/agora/base/internal/video/HardwareBufferHelper;->nativeHandle:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v3, p1

    .line 5
    move v4, p2

    .line 6
    move v5, p3

    .line 7
    move-wide v6, p4

    .line 8
    move v8, p6

    .line 9
    invoke-direct/range {v0 .. v8}, Lio/agora/base/internal/video/HardwareBufferHelper;->nativePrepare(JIIIJZ)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public readFrame(IIIILjava/nio/ByteBuffer;)Z
    .locals 8

    .line 1
    iget-wide v1, p0, Lio/agora/base/internal/video/HardwareBufferHelper;->nativeHandle:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v3, p1

    .line 5
    move v4, p2

    .line 6
    move v5, p3

    .line 7
    move v6, p4

    .line 8
    move-object v7, p5

    .line 9
    invoke-direct/range {v0 .. v7}, Lio/agora/base/internal/video/HardwareBufferHelper;->nativeReadFrame(JIIIILjava/nio/ByteBuffer;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/HardwareBufferHelper;->nativeHandle:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lio/agora/base/internal/video/HardwareBufferHelper;->nativeRelease(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
