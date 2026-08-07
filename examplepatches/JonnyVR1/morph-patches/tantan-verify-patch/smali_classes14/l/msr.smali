.class public Ll/msr;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;",
        ">;"
    }
.end annotation


# instance fields
.field public final f:Ll/egj0;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final g:Ll/ft5;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Ll/egj0;)V
    .locals 0
    .param p3    # Ll/egj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/msr;->g:Ll/ft5;

    .line 10
    .line 11
    iput-object p3, p0, Ll/msr;->f:Ll/egj0;

    .line 12
    .line 13
    return-void
.end method

.method public static C3()Z
    .locals 2

    .line 1
    sget-object v0, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fm3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/fm3;->b()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    xor-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    return v0
.end method

.method public static D3()Z
    .locals 2

    .line 1
    sget-object v0, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fm3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/fm3;->a()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    xor-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    return v0
.end method

.method public static synthetic P2(Ll/msr;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msr;->q3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Q2(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msr;->w3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V

    return-void
.end method

.method public static synthetic R2(Ll/msr;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msr;->r3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S2(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic T2(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msr;->u3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic U2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic V2(Ll/msr;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/msr;->p3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic W2(Ll/msr;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msr;->n3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X2(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msr;->m3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic Y2(Ll/msr;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msr;->x3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Z2(Ll/msr;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msr;->v3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a3(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/msr;->s3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b3(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/msr;->t3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/data/Followship;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->otherUser:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic d3(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msr;->o3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V

    return-void
.end method

.method public static synthetic e3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static g3(I)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "no"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "read"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_2
    const-string p0, "unread"

    .line 19
    .line 20
    return-object p0
.end method

.method private synthetic p3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->x(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public B3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V
    .locals 2

    .line 1
    sget-object v0, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fm3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/fm3;->e()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->needShowActivitiesRedDot()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/msr;->E3()Lrx/subjects/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->hasUnreadCount()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    const/4 v0, 0x5

    .line 37
    if-eq p1, v0, :cond_1

    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    const-string p1, "clearActivitySquareDetailUnread"

    .line 41
    .line 42
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->patchReddot(Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/wrr;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/wrr;-><init>(Ll/msr;)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Ll/dsr;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/dsr;-><init>(Ll/msr;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-object p0, p0, Ll/msr;->g:Ll/ft5;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final E3()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->c:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/gm3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/gm3;->a:Lrx/subjects/a;

    .line 10
    .line 11
    return-object p0
.end method

.method public F3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->hasError()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {v0}, Ll/msr;->g3(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v1, 0x5

    .line 21
    if-ne p1, v1, :cond_1

    .line 22
    .line 23
    const-string p1, "big"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const-string p1, "small"

    .line 27
    .line 28
    :goto_0
    iget-object v1, p0, Ll/msr;->f:Ll/egj0;

    .line 29
    .line 30
    invoke-interface {v1}, Ll/egj0;->v()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Ll/msr;->f:Ll/egj0;

    .line 41
    .line 42
    invoke-interface {p0}, Ll/egj0;->v()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v1, "show_type"

    .line 47
    .line 48
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "window_type"

    .line 53
    .line 54
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    filled-new-array {v0, p1}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v0, "e_bubble_live_followed"

    .line 63
    .line 64
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    :goto_1
    return-void
.end method

.method public G3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->hasError()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {v0}, Ll/msr;->g3(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v1, 0x5

    .line 21
    if-ne p1, v1, :cond_1

    .line 22
    .line 23
    const-string p1, "big"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const-string p1, "small"

    .line 27
    .line 28
    :goto_0
    iget-object v1, p0, Ll/msr;->f:Ll/egj0;

    .line 29
    .line 30
    invoke-interface {v1}, Ll/egj0;->v()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Ll/msr;->f:Ll/egj0;

    .line 41
    .line 42
    invoke-interface {p0}, Ll/egj0;->v()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v1, "show_type"

    .line 47
    .line 48
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "window_type"

    .line 53
    .line 54
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    filled-new-array {v0, p1}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v0, "e_bubble_live_followed"

    .line 63
    .line 64
    invoke-static {v0, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    :goto_1
    return-void
.end method

.method public H3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "liveRecommendCategory"

    .line 7
    .line 8
    const-string v1, "sign"

    .line 9
    .line 10
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string v0, "anchorId"

    .line 14
    .line 15
    invoke-interface {p0, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    const-string p2, "liveId"

    .line 19
    .line 20
    invoke-interface {p0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/bfu;->e(Ljava/lang/String;Ljava/util/Map;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public I2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/msr;->E3()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/gsr;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/gsr;-><init>(Ll/msr;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/hsr;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/hsr;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/isr;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/isr;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/jsr;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/jsr;-><init>(Ll/msr;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/cyr;->lifecycle()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/ksr;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/ksr;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/lsr;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/lsr;-><init>(Ll/msr;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ll/ppi0;->y()Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    new-instance v1, Ll/xrr;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Ll/xrr;-><init>(Ll/msr;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public f3(Ljava/lang/String;Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/tbs;->f:Ll/j6t;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v4, "live-activity-entrance"

    .line 20
    .line 21
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v1, v2, v3}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "e_bubble_live_followed"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0, p1}, Ll/kfd0$a;->r(Ljava/lang/String;)Ll/kfd0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "basic"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ll/kfd0$a;->s(Ljava/lang/String;)Ll/kfd0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string v0, "common_live"

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v0, "NA"

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ll/kfd0$a;->g(Ljava/lang/String;)Ll/kfd0$a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const-string v1, "on"

    .line 69
    .line 70
    invoke-virtual {p1, v1}, Ll/kfd0$a;->u(Ljava/lang/String;)Ll/kfd0$a;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-eqz p2, :cond_0

    .line 75
    .line 76
    const-string p2, "big"

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    const-string p2, "small"

    .line 80
    .line 81
    :goto_0
    invoke-virtual {p1, p2}, Ll/kfd0$a;->D(Ljava/lang/String;)Ll/kfd0$a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1, v0}, Ll/kfd0$a;->C(Ljava/lang/String;)Ll/kfd0$a;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0}, Ll/msr;->h3()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {p1, p0}, Ll/bfu;->c(Ll/kfd0;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public h3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msr;->f:Ll/egj0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/egj0;->v()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i3(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "\\?"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    array-length v0, p1

    .line 8
    const/4 v1, 0x1

    .line 9
    if-le v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    aget-object v0, p1, v0

    .line 13
    .line 14
    const-string v2, "tantanapp://live/audience/suggest"

    .line 15
    .line 16
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    aget-object p1, p1, v1

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveActivitySignInRecommendRoom(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/yrr;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/yrr;-><init>(Ll/msr;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/zrr;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/zrr;-><init>(Ll/msr;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->g2(Landroid/content/Context;)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public j3()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->getEntryInfo()Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->getScheme()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "clicked :,EntryInfo is null "

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v4, 0x1

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    move v5, v4

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v5, v3

    .line 31
    :goto_0
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const-string v5, "[live]activityEntry"

    .line 39
    .line 40
    invoke-static {v5, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    invoke-virtual {p0, v0}, Ll/msr;->F3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast v2, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    .line 52
    .line 53
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->getState()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    const/4 v5, 0x3

    .line 58
    if-ne v2, v5, :cond_2

    .line 59
    .line 60
    sget-object v0, Ll/itd0;->e:Ll/itd0;

    .line 61
    .line 62
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ll/fm3;

    .line 67
    .line 68
    invoke-static {}, Ll/pzi0;->o()J

    .line 69
    .line 70
    .line 71
    move-result-wide v2

    .line 72
    invoke-virtual {v0, v2, v3}, Ll/fm3;->g(J)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v1}, Ll/msr;->i3(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/msr;->z3()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 83
    .line 84
    check-cast v2, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    .line 85
    .line 86
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->getState()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    const/4 v5, 0x4

    .line 91
    if-ne v2, v5, :cond_3

    .line 92
    .line 93
    sget-object v0, Ll/itd0;->e:Ll/itd0;

    .line 94
    .line 95
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Ll/fm3;

    .line 100
    .line 101
    invoke-static {}, Ll/pzi0;->o()J

    .line 102
    .line 103
    .line 104
    move-result-wide v2

    .line 105
    invoke-virtual {v0, v2, v3}, Ll/fm3;->f(J)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v0, v1}, Ll/ujt;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ll/msr;->z3()V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_3
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-static {v2}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->g2(Landroid/content/Context;)Landroid/content/Intent;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 139
    .line 140
    check-cast v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    .line 141
    .line 142
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->s:Ll/fur;

    .line 143
    .line 144
    invoke-virtual {v1}, Ll/fur;->b()Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    if-eqz v1, :cond_4

    .line 149
    .line 150
    invoke-virtual {p0}, Ll/msr;->h3()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-static {v1, v4}, Ll/sft;->e(Ljava/lang/String;Z)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_4
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 159
    .line 160
    check-cast v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    .line 161
    .line 162
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->s:Ll/fur;

    .line 163
    .line 164
    invoke-virtual {v1}, Ll/fur;->c()Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-eqz v1, :cond_5

    .line 169
    .line 170
    invoke-virtual {p0}, Ll/msr;->h3()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-static {v1, v3}, Ll/sft;->e(Ljava/lang/String;Z)V

    .line 175
    .line 176
    .line 177
    :cond_5
    :goto_1
    invoke-virtual {p0, v0}, Ll/msr;->B3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method public k3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/msr;->B3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/msr;->h3()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0}, Ll/sft;->d(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic m3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 42
    .line 43
    sget-object v2, Ll/tbs;->f:Ll/j6t;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v4, v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const/4 v5, 0x1

    .line 58
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->M(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    const-string v5, "sign-in-suggested"

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v2, v3, v4}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    iget-object v3, p0, Ll/msr;->f:Ll/egj0;

    .line 77
    .line 78
    invoke-interface {v3}, Ll/egj0;->v()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 83
    .line 84
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {p0, v3, v1, v4}, Ll/msr;->H3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 102
    .line 103
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-nez v1, :cond_1

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 110
    .line 111
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 112
    .line 113
    new-instance v1, Ll/csr;

    .line 114
    .line 115
    invoke-direct {v1, v0}, Ll/csr;-><init>(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 116
    .line 117
    .line 118
    invoke-static {p1, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    .line 123
    .line 124
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Followship;->isFollowed(Lcom/p1/mobile/putong/data/Followship;)Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-eqz p1, :cond_1

    .line 129
    .line 130
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->g2(Landroid/content/Context;)Landroid/content/Intent;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 143
    .line 144
    .line 145
    :cond_1
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->g2(Landroid/content/Context;)Landroid/content/Intent;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/msr;->g:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->g2(Landroid/content/Context;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic o3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->B(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic q3(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->E()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic r3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Landroid/view/View;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/msr;->z3()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    xor-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic s3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/msr;->E3()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic t3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 22
    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 31
    .line 32
    const-string v0, "sign-in"

    .line 33
    .line 34
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->type:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    invoke-static {}, Ll/msr;->C3()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->setEntranceSummary(Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V

    .line 49
    .line 50
    .line 51
    const/4 p2, 0x3

    .line 52
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->forceState(I)Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const-string v0, "start-live"

    .line 57
    .line 58
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->type:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->title:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_1

    .line 73
    .line 74
    invoke-static {}, Ll/msr;->D3()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->setEntranceSummary(Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V

    .line 81
    .line 82
    .line 83
    const/4 p2, 0x4

    .line 84
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->forceState(I)Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 85
    .line 86
    .line 87
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/msr;->E3()Lrx/subjects/a;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final synthetic u3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->showReddot()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/msr;->y3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/msr;->E3()Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic v3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/msr;->E3()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;-><init>(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic w3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/msr;->z3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/msr;->E3()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;-><init>(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final y3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveActivityEntranceInfo()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/asr;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/asr;-><init>(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/bsr;

    .line 11
    .line 12
    invoke-direct {v2, p0, p1}, Ll/bsr;-><init>(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public z3()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveActivitySummaryInSquare()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/esr;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/esr;-><init>(Ll/msr;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/fsr;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/fsr;-><init>(Ll/msr;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method
