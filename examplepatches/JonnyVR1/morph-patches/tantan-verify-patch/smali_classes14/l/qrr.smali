.class public Ll/qrr;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ljava/lang/Throwable;

.field public d:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/qrr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 6
    .line 7
    iput-object v0, p0, Ll/qrr;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 8
    .line 9
    iput-object v0, p0, Ll/qrr;->c:Ljava/lang/Throwable;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    iput v0, p0, Ll/qrr;->d:I

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 34
    .line 35
    iput-object v0, p0, Ll/qrr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 36
    .line 37
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    .line 40
    .line 41
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 56
    .line 57
    iput-object p1, p0, Ll/qrr;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Ll/qrr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 62
    iput-object v0, p0, Ll/qrr;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    const/4 v0, 0x2

    .line 63
    iput v0, p0, Ll/qrr;->d:I

    .line 64
    iput-object p1, p0, Ll/qrr;->c:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public a()Ll/qrr;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/qrr;->k()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Ll/qrr;->d:I

    .line 6
    .line 7
    return-object p0
.end method

.method public b(I)Ll/qrr;
    .locals 0

    .line 1
    iput p1, p0, Ll/qrr;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qrr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->counters:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;->squareDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qrr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qrr;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qrr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 9
    .line 10
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/qrr;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrr;->c:Ljava/lang/Throwable;

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

.method public i()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qrr;->f()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qrr;->c()Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->unreadCount:I

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

.method public final k()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/qrr;->c()Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/qrr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    move p0, v2

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move p0, v1

    .line 22
    :goto_0
    const/4 v3, 0x2

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->unreadCount:I

    .line 26
    .line 27
    if-gtz v0, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    if-eqz p0, :cond_2

    .line 31
    .line 32
    return v1

    .line 33
    :cond_2
    return v3

    .line 34
    :cond_3
    :goto_1
    if-eqz p0, :cond_4

    .line 35
    .line 36
    return v2

    .line 37
    :cond_4
    return v3
.end method

.method public l(Ll/qrr;)Ll/qrr;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/qrr;->c()Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget v0, p0, Ll/qrr;->d:I

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/qrr;->c()Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1}, Ll/qrr;->c()Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->unreadCount:I

    .line 23
    .line 24
    iget v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->unreadCount:I

    .line 25
    .line 26
    if-ge v2, v3, :cond_2

    .line 27
    .line 28
    if-nez v2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/qrr;->d()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/qrr;->d()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/qrr;->d()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {p0}, Ll/qrr;->d()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 51
    .line 52
    iput-object p0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 53
    .line 54
    :cond_1
    iget p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->unreadCount:I

    .line 55
    .line 56
    iput p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->unreadCount:I

    .line 57
    .line 58
    :cond_2
    :goto_0
    return-object p1
.end method
