.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;

.field final synthetic val$volumeInfos:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask$1;->val$volumeInfos:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-wide v0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getRemotePlayoutVolumeLevel(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-lez p1, :cond_0

    .line 16
    .line 17
    new-instance v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVolumeInfo;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/tencent/trtc/TRTCCloudDef$TRTCVolumeInfo;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object p2, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVolumeInfo;->userId:Ljava/lang/String;

    .line 25
    .line 26
    iput p1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVolumeInfo;->volume:I

    .line 27
    .line 28
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VolumeLevelNotifyTask$1;->val$volumeInfos:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
