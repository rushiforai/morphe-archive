.class final enum Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat$1;
.super Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lio/agora/base/internal/video/HardwareVideoEncoder$YuvFormat;-><init>(Ljava/lang/String;ILio/agora/base/internal/video/HardwareVideoEncoder$1;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public fillBuffer(Ljava/nio/ByteBuffer;IILio/agora/base/VideoFrame$Buffer;)V
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-interface/range {p4 .. p4}, Lio/agora/base/VideoFrame$Buffer;->toI420()Lio/agora/base/VideoFrame$I420Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    add-int/lit8 v2, p2, 0x1

    .line 8
    .line 9
    div-int/lit8 v12, v2, 0x2

    .line 10
    .line 11
    add-int/lit8 v2, p3, 0x1

    .line 12
    .line 13
    div-int/lit8 v2, v2, 0x2

    .line 14
    .line 15
    mul-int v3, p2, p3

    .line 16
    .line 17
    mul-int/2addr v2, v12

    .line 18
    mul-int/lit8 v4, v2, 0x2

    .line 19
    .line 20
    add-int/2addr v4, v3

    .line 21
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-lt v5, v4, :cond_0

    .line 26
    .line 27
    add-int/2addr v2, v3

    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v9

    .line 36
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object v11

    .line 43
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    .line 49
    move-result-object v13

    .line 50
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideY()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideU()I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    invoke-interface {v1}, Lio/agora/base/VideoFrame$I420Buffer;->getStrideV()I

    .line 71
    .line 72
    .line 73
    move-result v8

    .line 74
    invoke-interface {v1}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v15

    .line 78
    invoke-interface {v1}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result v16

    .line 82
    move v14, v12

    .line 83
    move/from16 v10, p2

    .line 84
    .line 85
    invoke-static/range {v3 .. v16}, Lio/agora/base/internal/video/YuvHelper;->I420Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 86
    .line 87
    .line 88
    invoke-interface {v1}, Lio/agora/base/VideoFrame$Buffer;->release()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_0
    const-string v1, " was "

    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    const-string v2, "Expected destination buffer capacity to be at least "

    .line 99
    .line 100
    invoke-static {v2, v4, v1, v0}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 101
    .line 102
    .line 103
    return-void
.end method
