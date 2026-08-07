.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteLocalAudio(ZLcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$cloud:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$mute:Z


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZLcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->val$mute:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->val$cloud:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 15
    .line 16
    iget-boolean v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->val$mute:Z

    .line 17
    .line 18
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->val$cloud:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 19
    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    if-eq v0, v4, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioStream(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 33
    .line 34
    monitor-enter v0

    .line 35
    :try_start_0
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 36
    .line 37
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 38
    .line 39
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->val$cloud:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 40
    .line 41
    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    throw p0

    .line 54
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 57
    .line 58
    iget-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->val$mute:Z

    .line 59
    .line 60
    iput-boolean v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteLocalAudio:Z

    .line 61
    .line 62
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->val$mute:Z

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->muteLocalAudio(Z)Z

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 72
    .line 73
    iget-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->val$mute:Z

    .line 74
    .line 75
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 79
    .line 80
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioStream(Z)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    if-ne v0, v4, :cond_2

    .line 85
    .line 86
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 89
    .line 90
    iput-boolean v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteLocalAudio:Z

    .line 91
    .line 92
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->val$mute:Z

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->muteLocalAudio(Z)Z

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 102
    .line 103
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$54;->val$mute:Z

    .line 104
    .line 105
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V

    .line 106
    .line 107
    .line 108
    :cond_2
    return-void
.end method
