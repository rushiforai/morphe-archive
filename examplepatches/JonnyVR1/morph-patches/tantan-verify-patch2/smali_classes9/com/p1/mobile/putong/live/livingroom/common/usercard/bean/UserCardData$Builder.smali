.class public Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private from:I

.field fromIdentity:Ljava/lang/String;

.field private giftSource:Ljava/lang/String;

.field private isAnchor:Z

.field private jumpToOtherRoomClick:Ll/x20;

.field private liveId:Ljava/lang/String;

.field private messageId:J

.field private multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private roomId:Ljava/lang/String;

.field scene:Ljava/lang/String;

.field private showShadow:Z

.field source:Ljava/lang/String;

.field to:Ljava/lang/String;

.field private trackFrom:Ljava/lang/String;

.field private userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->from:I

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->from:I

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->giftSource:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->isAnchor:Z

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->jumpToOtherRoomClick:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->liveId:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->messageId:J

    return-wide v0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->roomId:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->showShadow:Z

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "0"

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    .line 20
    .line 21
    const-string v1, "UserCardData userId is null"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public giftSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->giftSource:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public jumpToOtherRoom(Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->roomId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->liveId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->jumpToOtherRoomClick:Ll/x20;

    .line 19
    .line 20
    :cond_1
    :goto_0
    return-object p0
.end method

.method public messageId(J)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->messageId:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->fromIdentity:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setMultiCall(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->scene:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->source:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->to:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public showShadow()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->showShadow:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
