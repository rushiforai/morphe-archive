.class Lio/agora/base/internal/video/HardwareVideoEncoder$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/HardwareVideoEncoder;->encodeTextureBuffer(Lio/agora/base/VideoFrame;Lio/agora/base/internal/video/CodecSpecificInfo;)Lio/agora/base/internal/video/VideoCodecStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lio/agora/base/internal/video/VideoCodecStatus;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

.field final synthetic val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

.field final synthetic val$videoFrame:Lio/agora/base/VideoFrame;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/HardwareVideoEncoder;Lio/agora/base/VideoFrame;Lio/agora/base/internal/video/CodecSpecificInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 2
    .line 3
    iput-object p2, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->val$videoFrame:Lio/agora/base/VideoFrame;

    .line 4
    .line 5
    iput-object p3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->val$videoFrame:Lio/agora/base/VideoFrame;

    .line 2
    .line 3
    invoke-virtual {v0}, Lio/agora/base/VideoFrame;->getTimestampNs()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x1f4

    .line 8
    .line 9
    add-long/2addr v0, v2

    .line 10
    const-wide/16 v2, 0x3e8

    .line 11
    .line 12
    div-long/2addr v0, v2

    .line 13
    new-instance v2, Lio/agora/base/internal/video/HardwareVideoEncoder$TimeStamps;

    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    invoke-direct {v2, v3, v4, v0, v1}, Lio/agora/base/internal/video/HardwareVideoEncoder$TimeStamps;-><init>(JJ)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 23
    .line 24
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1400(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Queue;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-interface {v3, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :try_start_0
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 32
    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 36
    .line 37
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1500(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Map;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    iget-object v5, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 46
    .line 47
    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception v3

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    :goto_0
    const/16 v3, 0x4000

    .line 54
    .line 55
    invoke-static {v3}, Landroid/opengl/GLES20;->glClear(I)V

    .line 56
    .line 57
    .line 58
    new-instance v3, Lio/agora/base/VideoFrame;

    .line 59
    .line 60
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->val$videoFrame:Lio/agora/base/VideoFrame;

    .line 61
    .line 62
    invoke-virtual {v4}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    iget-object v5, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->val$videoFrame:Lio/agora/base/VideoFrame;

    .line 67
    .line 68
    invoke-virtual {v5}, Lio/agora/base/VideoFrame;->getTimestampNs()J

    .line 69
    .line 70
    .line 71
    move-result-wide v5

    .line 72
    const/4 v7, 0x0

    .line 73
    invoke-direct {v3, v4, v7, v5, v6}, Lio/agora/base/VideoFrame;-><init>(Lio/agora/base/VideoFrame$Buffer;IJ)V

    .line 74
    .line 75
    .line 76
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 77
    .line 78
    invoke-static {v4}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$900(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/VideoFrameDrawer;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    iget-object v5, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 83
    .line 84
    invoke-static {v5}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$800(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/GlRectDrawer;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    const/4 v6, 0x0

    .line 89
    invoke-virtual {v4, v3, v5, v6}, Lio/agora/base/internal/video/VideoFrameDrawer;->drawFrame(Lio/agora/base/VideoFrame;Lio/agora/base/internal/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;)V

    .line 90
    .line 91
    .line 92
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 93
    .line 94
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$600(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->val$videoFrame:Lio/agora/base/VideoFrame;

    .line 99
    .line 100
    invoke-virtual {v4}, Lio/agora/base/VideoFrame;->getTimestampNs()J

    .line 101
    .line 102
    .line 103
    move-result-wide v4

    .line 104
    invoke-interface {v3, v4, v5}, Lio/agora/base/internal/video/EglBase;->swapBuffers(J)V

    .line 105
    .line 106
    .line 107
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->val$videoFrame:Lio/agora/base/VideoFrame;

    .line 108
    .line 109
    invoke-virtual {v3}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    check-cast v3, Lio/agora/base/VideoFrame$TextureBuffer;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->OK:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 116
    .line 117
    return-object p0

    .line 118
    :goto_1
    const-string v4, "HardwareVideoEncoder"

    .line 119
    .line 120
    const-string v5, "encodeTexture failed"

    .line 121
    .line 122
    invoke-static {v4, v5, v3}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 123
    .line 124
    .line 125
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 126
    .line 127
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1500(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Map;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 139
    .line 140
    invoke-static {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1400(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Queue;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-interface {p0, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->ERROR:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 148
    .line 149
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 150
    invoke-virtual {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder$6;->call()Lio/agora/base/internal/video/VideoCodecStatus;

    move-result-object p0

    return-object p0
.end method
