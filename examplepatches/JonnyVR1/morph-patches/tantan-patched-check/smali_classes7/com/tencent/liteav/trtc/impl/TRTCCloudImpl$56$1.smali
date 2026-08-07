.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 6
    .line 7
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;

    .line 8
    .line 9
    iget-boolean v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;->val$mute:Z

    .line 10
    .line 11
    iput-boolean v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteAudio:Z

    .line 12
    .line 13
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-wide v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 18
    .line 19
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;

    .line 24
    .line 25
    iget-boolean v4, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;->val$mute:Z

    .line 26
    .line 27
    invoke-virtual {v2, v3, v4}, Lcom/tencent/liteav/audio/TXCAudioEngine;->muteRemoteAudio(Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;

    .line 31
    .line 32
    iget-boolean v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;->val$mute:Z

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 37
    .line 38
    iget-wide v4, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 39
    .line 40
    iget-wide v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 41
    .line 42
    const/4 v8, 0x1

    .line 43
    const/4 v9, 0x1

    .line 44
    invoke-static/range {v3 .. v9}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-object v10, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$56;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 49
    .line 50
    iget-wide v11, v10, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 51
    .line 52
    iget-wide v13, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 53
    .line 54
    const/4 v15, 0x1

    .line 55
    const/16 v16, 0x1

    .line 56
    .line 57
    invoke-static/range {v10 .. v16}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 58
    .line 59
    .line 60
    return-void
.end method
