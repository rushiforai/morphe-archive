.class public Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public liveId:Ljava/lang/String;

.field public liveMode:Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;

.field public rewardPoint:J

.field public roomId:Ljava/lang/String;

.field public template:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->rewardPoint:J

    .line 5
    .line 6
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->roomId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->liveId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->liveMode:Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;

    .line 11
    .line 12
    iput-object p6, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->template:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method
