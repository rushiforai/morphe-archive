.class final enum Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat$1;
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
    .locals 24

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
    sget-object v2, Lcom/bytedance/realx/video/RXPixelFormat;->kI420:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    const/4 v4, 0x1

    .line 19
    const/4 v5, 0x0

    .line 20
    if-ne v1, v2, :cond_2

    .line 21
    .line 22
    instance-of v1, v0, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    move-object v1, v0

    .line 27
    check-cast v1, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 28
    .line 29
    invoke-virtual {v1, v5}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    invoke-virtual {v1, v5}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    invoke-virtual {v1, v4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v8

    .line 41
    invoke-virtual {v1, v4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 42
    .line 43
    .line 44
    move-result v9

    .line 45
    invoke-virtual {v1, v3}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v10

    .line 49
    invoke-virtual {v1, v3}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 50
    .line 51
    .line 52
    move-result v11

    .line 53
    invoke-interface/range {p2 .. p2}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getWidth()I

    .line 54
    .line 55
    .line 56
    move-result v13

    .line 57
    invoke-interface/range {p2 .. p2}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getHeight()I

    .line 58
    .line 59
    .line 60
    move-result v14

    .line 61
    move-object/from16 v12, p1

    .line 62
    .line 63
    invoke-static/range {v6 .. v14}, Lcom/bytedance/realx/video/YuvHelper;->I420Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    invoke-interface/range {p2 .. p2}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->toI420()Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    if-nez v1, :cond_3

    .line 72
    .line 73
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_3
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getAndRetainVideoFrameMemory()Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    if-nez v2, :cond_4

    .line 82
    .line 83
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 84
    .line 85
    .line 86
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    instance-of v6, v2, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 91
    .line 92
    if-nez v6, :cond_5

    .line 93
    .line 94
    invoke-interface {v2}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 95
    .line 96
    .line 97
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 98
    .line 99
    .line 100
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_5
    move-object v6, v2

    .line 105
    check-cast v6, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 106
    .line 107
    invoke-virtual {v6, v5}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    move-result-object v15

    .line 111
    invoke-virtual {v6, v5}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 112
    .line 113
    .line 114
    move-result v16

    .line 115
    invoke-virtual {v6, v4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 116
    .line 117
    .line 118
    move-result-object v17

    .line 119
    invoke-virtual {v6, v4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 120
    .line 121
    .line 122
    move-result v18

    .line 123
    invoke-virtual {v6, v3}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    .line 126
    move-result-object v19

    .line 127
    invoke-virtual {v6, v3}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 128
    .line 129
    .line 130
    move-result v20

    .line 131
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getWidth()I

    .line 132
    .line 133
    .line 134
    move-result v22

    .line 135
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getHeight()I

    .line 136
    .line 137
    .line 138
    move-result v23

    .line 139
    move-object/from16 v21, p1

    .line 140
    .line 141
    invoke-static/range {v15 .. v23}, Lcom/bytedance/realx/video/YuvHelper;->I420Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 142
    .line 143
    .line 144
    invoke-interface {v2}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 145
    .line 146
    .line 147
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 148
    .line 149
    .line 150
    :goto_1
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoMemoryInterface;->release()V

    .line 151
    .line 152
    .line 153
    return-void
.end method
