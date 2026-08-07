.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->destroy()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeSetAudioPlayoutTunnelEnabled(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeLock:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 11
    .line 12
    iget-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 13
    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    cmp-long v2, v2, v4

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    const-string v2, "destroy context"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 26
    .line 27
    iget-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeDestroyContext(J)V

    .line 30
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
    :goto_0
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 36
    .line 37
    iput-wide v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 38
    .line 39
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    const/4 v0, 0x0

    .line 41
    iput-object v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 42
    .line 43
    iput-object v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 44
    .line 45
    const/16 v2, 0x64

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioCaptureVolume(I)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioPlayoutVolume(I)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;->getInstance()Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/audio/TXCSoundEffectPlayer;->setSoundEffectListener(Lcom/tencent/liteav/audio/c;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->clean()V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 70
    .line 71
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 72
    .line 73
    monitor-enter v1

    .line 74
    :try_start_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 79
    .line 80
    .line 81
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 82
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSubClouds:Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_2

    .line 95
    .line 96
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 107
    .line 108
    if-eqz v1, :cond_1

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->destroy()V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSubClouds:Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Lcom/tencent/liteav/audio/a;->a()Lcom/tencent/liteav/audio/a;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$2;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/audio/a;->a(I)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :catchall_1
    move-exception p0

    .line 136
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 137
    throw p0

    .line 138
    :goto_2
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 139
    throw p0
.end method
