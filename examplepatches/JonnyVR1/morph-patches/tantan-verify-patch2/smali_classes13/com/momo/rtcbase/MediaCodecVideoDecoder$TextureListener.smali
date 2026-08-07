.class Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoSink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/MediaCodecVideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TextureListener"
.end annotation


# instance fields
.field private bufferToRender:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

.field private final newFrameLock:Ljava/lang/Object;

.field private renderedBuffer:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

.field private final surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

.field final synthetic this$0:Lcom/momo/rtcbase/MediaCodecVideoDecoder;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/MediaCodecVideoDecoder;Lcom/momo/rtcbase/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->this$0:Lcom/momo/rtcbase/MediaCodecVideoDecoder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/lang/Object;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->newFrameLock:Ljava/lang/Object;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->startListening(Lcom/momo/rtcbase/VideoSink;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public addBufferToRender(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->bufferToRender:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->bufferToRender:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "MediaCodecVideoDecoder"

    .line 9
    .line 10
    const-string p1, "Unexpected addBufferToRender() called while waiting for a texture."

    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "Waiting for a texture."

    .line 16
    .line 17
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public dequeueTextureBuffer(I)Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->newFrameLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->renderedBuffer:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    if-lez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->isWaitingForTexture()Z

    .line 11
    .line 12
    .line 13
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    :try_start_1
    iget-object v1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->newFrameLock:Ljava/lang/Object;

    .line 17
    .line 18
    int-to-long v2, p1

    .line 19
    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 30
    .line 31
    .line 32
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->renderedBuffer:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    iput-object v1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->renderedBuffer:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

    .line 36
    .line 37
    monitor-exit v0

    .line 38
    return-object p1

    .line 39
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 40
    throw p0
.end method

.method public isWaitingForTexture()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->newFrameLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->bufferToRender:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    monitor-exit v0

    .line 12
    return p0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public onFrame(Lcom/momo/rtcbase/VideoFrame;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->newFrameLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->renderedBuffer:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    invoke-virtual/range {p1 .. p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    invoke-interface {v4}, Lcom/momo/rtcbase/VideoFrame$Buffer;->retain()V

    .line 15
    .line 16
    .line 17
    new-instance v3, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

    .line 18
    .line 19
    iget-object v2, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->bufferToRender:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$200(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v5

    .line 25
    iget-object v2, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->bufferToRender:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 26
    .line 27
    invoke-static {v2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$300(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v7

    .line 31
    iget-object v2, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->bufferToRender:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 32
    .line 33
    invoke-static {v2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$400(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 34
    .line 35
    .line 36
    move-result-wide v9

    .line 37
    iget-object v2, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->bufferToRender:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$500(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 40
    .line 41
    .line 42
    move-result-wide v11

    .line 43
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 44
    .line 45
    .line 46
    move-result-wide v13

    .line 47
    iget-object v2, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->bufferToRender:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 48
    .line 49
    invoke-static {v2}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;->access$600(Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;)J

    .line 50
    .line 51
    .line 52
    move-result-wide v15

    .line 53
    sub-long/2addr v13, v15

    .line 54
    invoke-direct/range {v3 .. v14}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;JJJJJ)V

    .line 55
    .line 56
    .line 57
    iput-object v3, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->renderedBuffer:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    iput-object v2, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->bufferToRender:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedOutputBuffer;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->newFrameLock:Ljava/lang/Object;

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 65
    .line 66
    .line 67
    monitor-exit v1

    .line 68
    return-void

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const-string v0, "MediaCodecVideoDecoder"

    .line 72
    .line 73
    const-string v2, "Unexpected onFrame() called while already holding a texture."

    .line 74
    .line 75
    invoke-static {v0, v2}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 79
    .line 80
    const-string v2, "Already holding a texture."

    .line 81
    .line 82
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw v0

    .line 86
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    throw v0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->stopListening()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->newFrameLock:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget-object v1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->renderedBuffer:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->getVideoFrameBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/momo/rtcbase/VideoFrame$Buffer;->release()V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-object v1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->renderedBuffer:Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->dispose()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p0
.end method

.method public setSize(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TextureListener;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/momo/rtcbase/SurfaceTextureHelper;->setTextureSize(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
