.class final enum Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat$2;
.super Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;
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
    invoke-direct {p0, p1, p2, v0}, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;-><init>(Ljava/lang/String;ILcom/bytedance/realx/video/HardwareVideoEncoder$1;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public fillBuffer(Ljava/nio/ByteBuffer;Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
    .locals 21

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-interface/range {p2 .. p2}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->getPixelFormat()Lcom/bytedance/realx/video/RXPixelFormat;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/bytedance/realx/video/RXPixelFormat;->kNv12:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    const/4 v4, 0x0

    .line 19
    if-ne v1, v2, :cond_2

    .line 20
    .line 21
    instance-of v1, v0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 22
    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    move-object v1, v0

    .line 26
    check-cast v1, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 27
    .line 28
    invoke-virtual {v1, v4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {v1, v4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    invoke-virtual {v1, v3}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    invoke-virtual {v1, v3}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    invoke-interface/range {p2 .. p2}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v10

    .line 48
    invoke-interface/range {p2 .. p2}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v11

    .line 52
    move-object/from16 v9, p1

    .line 53
    .line 54
    invoke-static/range {v5 .. v11}, Lcom/bytedance/realx/video/YuvHelper;->NV12Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    invoke-interface/range {p2 .. p2}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->toI420()Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    if-nez v1, :cond_3

    .line 63
    .line 64
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    if-nez v2, :cond_4

    .line 73
    .line 74
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 75
    .line 76
    .line 77
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    instance-of v5, v2, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 82
    .line 83
    if-nez v5, :cond_5

    .line 84
    .line 85
    invoke-interface {v2}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 86
    .line 87
    .line 88
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 89
    .line 90
    .line 91
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_5
    move-object v5, v2

    .line 96
    check-cast v5, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 97
    .line 98
    invoke-virtual {v5, v4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 99
    .line 100
    .line 101
    move-result-object v12

    .line 102
    invoke-virtual {v5, v4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 103
    .line 104
    .line 105
    move-result v13

    .line 106
    invoke-virtual {v5, v3}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 107
    .line 108
    .line 109
    move-result-object v14

    .line 110
    invoke-virtual {v5, v3}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 111
    .line 112
    .line 113
    move-result v15

    .line 114
    const/4 v3, 0x2

    .line 115
    invoke-virtual {v5, v3}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 116
    .line 117
    .line 118
    move-result-object v16

    .line 119
    invoke-virtual {v5, v3}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 120
    .line 121
    .line 122
    move-result v17

    .line 123
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getWidth()I

    .line 124
    .line 125
    .line 126
    move-result v19

    .line 127
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getHeight()I

    .line 128
    .line 129
    .line 130
    move-result v20

    .line 131
    move-object/from16 v18, p1

    .line 132
    .line 133
    invoke-static/range {v12 .. v20}, Lcom/bytedance/realx/video/YuvHelper;->I420ToNV12(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 134
    .line 135
    .line 136
    invoke-interface {v2}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 137
    .line 138
    .line 139
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 140
    .line 141
    .line 142
    :goto_1
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 143
    .line 144
    .line 145
    return-void
.end method
