.class Lio/agora/rtc2/video/VideoCaptureCamera1$12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/video/SurfaceTextureHelper$IVideoCapture;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/video/VideoCaptureCamera1;->listenForTextureFrames()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/video/VideoCaptureCamera1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFrame(Lio/agora/base/VideoFrame;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 2
    .line 3
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$1200(Lio/agora/rtc2/video/VideoCaptureCamera1;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 11
    .line 12
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$1300(Lio/agora/rtc2/video/VideoCaptureCamera1;)Z

    .line 13
    .line 14
    .line 15
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 19
    .line 20
    invoke-static {p0}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$1200(Lio/agora/rtc2/video/VideoCaptureCamera1;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 33
    .line 34
    iget-boolean v2, v1, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableTextureCopy:Z

    .line 35
    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    iget-object v0, v1, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 39
    .line 40
    check-cast v0, Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 41
    .line 42
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lio/agora/base/VideoFrame$TextureBuffer;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lio/agora/base/internal/video/SurfaceTextureHelper;->textureCopy(Lio/agora/base/VideoFrame$TextureBuffer;)Lio/agora/base/VideoFrame$TextureBuffer;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p1

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    if-nez v0, :cond_2

    .line 56
    .line 57
    const/16 p1, 0x9

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->onFrameDropped(I)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$000()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string v0, "TextureVideoSinkListener copy frame error"

    .line 67
    .line 68
    invoke-static {p1, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 72
    .line 73
    invoke-static {p0}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$1200(Lio/agora/rtc2/video/VideoCaptureCamera1;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    :try_start_2
    new-instance v1, Lio/agora/base/VideoFrame;

    .line 82
    .line 83
    move-object v2, v0

    .line 84
    check-cast v2, Lio/agora/base/TextureBuffer;

    .line 85
    .line 86
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 87
    .line 88
    iget-boolean v3, v3, Lio/agora/rtc2/video/VideoCapture;->mInvertDeviceOrientationReadings:Z

    .line 89
    .line 90
    const/4 v4, 0x1

    .line 91
    xor-int/2addr v3, v4

    .line 92
    const/4 v5, 0x0

    .line 93
    invoke-static {v2, v3, v5}, Lio/agora/rtc2/video/VideoCapture;->createTextureBufferWithModifiedTransformMatrix(Lio/agora/base/TextureBuffer;ZI)Lio/agora/base/VideoFrame$TextureBuffer;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 98
    .line 99
    invoke-virtual {v3}, Lio/agora/rtc2/video/VideoCapture;->getCameraRotation()I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getTimestampNs()J

    .line 104
    .line 105
    .line 106
    move-result-wide v5

    .line 107
    invoke-direct {v1, v2, v3, v5, v6}, Lio/agora/base/VideoFrame;-><init>(Lio/agora/base/VideoFrame$Buffer;IJ)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 111
    .line 112
    invoke-virtual {p1, v1}, Lio/agora/rtc2/video/VideoCaptureCamera;->attachPerFrameMetaInfos(Lio/agora/base/VideoFrame;)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 116
    .line 117
    invoke-virtual {p1, v1}, Lio/agora/rtc2/video/VideoCapture;->onFrameCaptured(Lio/agora/base/VideoFrame;)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 121
    .line 122
    iget-boolean p1, p1, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableTextureCopy:Z

    .line 123
    .line 124
    if-eqz p1, :cond_3

    .line 125
    .line 126
    invoke-interface {v0}, Lio/agora/base/VideoFrame$Buffer;->release()V

    .line 127
    .line 128
    .line 129
    :cond_3
    invoke-virtual {v1}, Lio/agora/base/VideoFrame;->release()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 133
    .line 134
    invoke-static {p1}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$1200(Lio/agora/rtc2/video/VideoCaptureCamera1;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 142
    .line 143
    invoke-static {p1}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$1400(Lio/agora/rtc2/video/VideoCaptureCamera1;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-nez p1, :cond_4

    .line 148
    .line 149
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$000()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    const-string v0, "first frame captured."

    .line 154
    .line 155
    invoke-static {p1, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 159
    .line 160
    invoke-static {p1, v4}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$1402(Lio/agora/rtc2/video/VideoCaptureCamera1;Z)Z

    .line 161
    .line 162
    .line 163
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 164
    .line 165
    invoke-static {p0}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$1500(Lio/agora/rtc2/video/VideoCaptureCamera1;)V

    .line 166
    .line 167
    .line 168
    :cond_4
    return-void

    .line 169
    :goto_1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 170
    .line 171
    invoke-static {p0}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$1200(Lio/agora/rtc2/video/VideoCaptureCamera1;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 176
    .line 177
    .line 178
    throw p1
.end method

.method public onFrameDropped(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera1$12;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lio/agora/rtc2/video/VideoCaptureCamera1;->access$1601(Lio/agora/rtc2/video/VideoCaptureCamera1;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
