.class public Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry$State;
    }
.end annotation


# static fields
.field public static final ORIGIN:I = 0x2

.field public static final READ:I = 0x1

.field public static final SIGN_IN:I = 0x3

.field public static final START_LIVE:I = 0x4

.field public static final UNREAD:I = 0x0

.field public static final VIDEO_CARD:I = 0x5


# instance fields
.field private final liveActivitySummary:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

.field private liveEntranceSummary:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mState:I

.field private throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveEntranceSummary:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->throwable:Ljava/lang/Throwable;

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->mState:I

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveActivitySummary:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveActivitySummary:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 41
    .line 42
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->calculateState()Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveEntranceSummary:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->throwable:Ljava/lang/Throwable;

    const/4 v0, 0x2

    .line 49
    iput v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->mState:I

    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveActivitySummary:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->throwable:Ljava/lang/Throwable;

    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->calculateState()Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    return-void
.end method

.method private calculateState()Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveActivitySummary:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->mState:I

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveActivitySummary:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 18
    .line 19
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->redDotNum:I

    .line 20
    .line 21
    if-lez v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x1

    .line 26
    :goto_0
    iput v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->mState:I

    .line 27
    .line 28
    return-object p0
.end method


# virtual methods
.method public forceState(I)Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->mState:I

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveActivitySummary()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveActivitySummary:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveEntranceSummary()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveEntranceSummary:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 2
    .line 3
    return-object p0
.end method

.method public getState()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->mState:I

    .line 2
    .line 3
    return p0
.end method

.method public hasError()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public hasUnreadCount()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveActivitySummary:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->redDotNum:I

    .line 8
    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public needShowActivitiesRedDot()Z
    .locals 7

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveActivitySummary:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 8
    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->redDotNum:I

    .line 10
    .line 11
    if-lez v1, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->showRedDot:Z

    .line 15
    .line 16
    if-nez p0, :cond_2

    .line 17
    .line 18
    return v0

    .line 19
    :cond_2
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/vwt;->q3()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_3

    .line 26
    .line 27
    return v0

    .line 28
    :cond_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    sget-object v3, Ll/itd0;->e:Ll/itd0;

    .line 33
    .line 34
    invoke-static {v3}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Ll/fm3;

    .line 39
    .line 40
    iget-object v3, v3, Ll/fm3;->a:Ll/byd0;

    .line 41
    .line 42
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Ljava/lang/Long;

    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 49
    .line 50
    .line 51
    move-result-wide v3

    .line 52
    sub-long/2addr v1, v3

    .line 53
    int-to-long v3, p0

    .line 54
    const-wide/32 v5, 0x5265c00

    .line 55
    .line 56
    .line 57
    mul-long/2addr v3, v5

    .line 58
    cmp-long p0, v1, v3

    .line 59
    .line 60
    if-ltz p0, :cond_4

    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    return p0

    .line 64
    :cond_4
    return v0
.end method

.method public setEntranceSummary(Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->liveEntranceSummary:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 2
    .line 3
    return-void
.end method

.method public showReddot()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->needShowActivitiesRedDot()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->hasUnreadCount()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method
