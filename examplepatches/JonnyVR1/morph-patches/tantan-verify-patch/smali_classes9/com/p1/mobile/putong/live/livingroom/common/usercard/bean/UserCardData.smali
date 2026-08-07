.class public Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;,
        Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$OpenUserCardDialogSource;,
        Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$OpenUserCardDialogScene;,
        Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$OpenUserCardDialogTrackFrom;,
        Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$OpenUserCardDialogTo;,
        Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$OpenUserCardDialogIdentity;,
        Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$OpenUserCardDialogFrom;
    }
.end annotation


# instance fields
.field private from:I

.field private fromIdentity:Ljava/lang/String;

.field private final giftSource:Ljava/lang/String;

.field private final isAnchor:Z

.field private final jumpToOtherRoomClick:Ll/x20;

.field private final liveId:Ljava/lang/String;

.field private final messageId:J

.field private final multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final roomId:Ljava/lang/String;

.field private scene:Ljava/lang/String;

.field private final showShadow:Z

.field private source:Ljava/lang/String;

.field private to:Ljava/lang/String;

.field private final trackFrom:Ljava/lang/String;

.field private final userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->source:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->source:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->fromIdentity:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->fromIdentity:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->to:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->to:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->scene:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->scene:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->k(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->c(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->isAnchor:Z

    .line 31
    .line 32
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->i(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->showShadow:Z

    .line 37
    .line 38
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->d(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ll/x20;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->jumpToOtherRoomClick:Ll/x20;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->h(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->roomId:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->e(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->liveId:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->j(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->trackFrom:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->f(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)J

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->messageId:J

    .line 67
    .line 68
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->b(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->giftSource:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->a(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->from:I

    .line 79
    .line 80
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->g(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 85
    .line 86
    return-void
.end method

.method public static builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public getFrom()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->from:I

    .line 2
    .line 3
    return p0
.end method

.method public getFromIdentity()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->fromIdentity:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->liveId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMessageId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->messageId:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getMultiCall()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScene()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->scene:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->source:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->to:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isFromJs()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->source:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "js"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isShowShadow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->showShadow:Z

    .line 2
    .line 3
    return p0
.end method

.method public jumpOtherRoomCallBack()Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->jumpToOtherRoomClick:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->to:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public userId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
