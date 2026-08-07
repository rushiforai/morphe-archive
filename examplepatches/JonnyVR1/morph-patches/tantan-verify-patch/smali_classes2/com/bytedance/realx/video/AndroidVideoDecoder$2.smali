.class Lcom/bytedance/realx/video/AndroidVideoDecoder$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderByVSync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/AndroidVideoDecoder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->access$100(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    monitor-enter p1

    .line 8
    :try_start_0
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 9
    .line 10
    invoke-static {p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->access$200(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-lez p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 21
    .line 22
    invoke-static {p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->access$200(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    check-cast p2, Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_2

    .line 35
    :cond_0
    const/4 p2, 0x0

    .line 36
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    :try_start_1
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->access$300(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget v0, p2, Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;->bufferIndex:I

    .line 46
    .line 47
    iget-wide v1, p2, Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;->presentationTimestampUs:J

    .line 48
    .line 49
    const-wide/16 v3, 0x3e8

    .line 50
    .line 51
    mul-long/2addr v1, v3

    .line 52
    invoke-interface {p1, v0, v1, v2}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IJ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 56
    .line 57
    iget-wide v0, p2, Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;->presentationTimestampUs:J

    .line 58
    .line 59
    invoke-static {p1, v0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->access$600(Lcom/bytedance/realx/video/AndroidVideoDecoder;J)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :catch_0
    move-exception p1

    .line 64
    const-string p2, "AndroidVideoDecoder"

    .line 65
    .line 66
    const-string v0, "releaseOutputBuffer err:"

    .line 67
    .line 68
    invoke-static {p2, v0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->access$400(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    sget-object p2, Lcom/bytedance/realx/video/VideoCodecStatus;->MEDIACODEC_EXCEPTION:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 80
    .line 81
    const-string v0, "releaseOutputBuffer err"

    .line 82
    .line 83
    invoke-interface {p1, p2, v0}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    sget-object p2, Lcom/bytedance/realx/video/VideoCodecStatus;->DROP_DECODED_FRAME:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 87
    .line 88
    const-string v0, "releaseOutputBuffer err"

    .line 89
    .line 90
    invoke-interface {p1, p2, v0}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 94
    .line 95
    invoke-static {p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->access$508(Lcom/bytedance/realx/video/AndroidVideoDecoder;)J

    .line 96
    .line 97
    .line 98
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 99
    .line 100
    invoke-static {p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->access$700(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_3

    .line 105
    .line 106
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    return-void

    .line 114
    :goto_2
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 115
    throw p0
.end method
