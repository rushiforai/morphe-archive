.class Lio/agora/base/internal/video/GPUPBOUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private nativeHandle:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lio/agora/base/internal/video/GPUPBOUtil;->nativeObjectInit()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lio/agora/base/internal/video/GPUPBOUtil;->nativeHandle:J

    .line 9
    .line 10
    return-void
.end method

.method private native nativeObjectInit()J
.end method

.method private native nativeReadFrame(JIIIIZIILjava/nio/ByteBuffer;Z)Z
.end method

.method private native nativeRelease(J)V
.end method


# virtual methods
.method public readFrame(IIIIZIILjava/nio/ByteBuffer;Z)Z
    .locals 12

    .line 1
    iget-wide v1, p0, Lio/agora/base/internal/video/GPUPBOUtil;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    move-object v0, p0

    .line 12
    move v3, p1

    .line 13
    move v4, p2

    .line 14
    move v5, p3

    .line 15
    move/from16 v6, p4

    .line 16
    .line 17
    move/from16 v7, p5

    .line 18
    .line 19
    move/from16 v8, p6

    .line 20
    .line 21
    move/from16 v9, p7

    .line 22
    .line 23
    move-object/from16 v10, p8

    .line 24
    .line 25
    move/from16 v11, p9

    .line 26
    .line 27
    invoke-direct/range {v0 .. v11}, Lio/agora/base/internal/video/GPUPBOUtil;->nativeReadFrame(JIIIIZIILjava/nio/ByteBuffer;Z)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public release()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/GPUPBOUtil;->nativeHandle:J

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
    invoke-direct {p0, v0, v1}, Lio/agora/base/internal/video/GPUPBOUtil;->nativeRelease(J)V

    .line 10
    .line 11
    .line 12
    iput-wide v2, p0, Lio/agora/base/internal/video/GPUPBOUtil;->nativeHandle:J

    .line 13
    .line 14
    :cond_0
    return-void
.end method
