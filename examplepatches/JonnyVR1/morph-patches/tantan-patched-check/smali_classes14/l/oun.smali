.class public Ll/oun;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;",
        ">;"
    }
.end annotation


# instance fields
.field public final f:Ljava/lang/String;

.field public g:Ll/wyd0;

.field public final h:Z

.field public final i:Ll/egj0;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final j:Ll/ft5;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;ZLl/egj0;)V
    .locals 1
    .param p4    # Ll/egj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/oun;->f:Ljava/lang/String;

    .line 13
    .line 14
    new-instance p1, Ll/wyd0;

    .line 15
    .line 16
    new-instance p2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v0, "intl_live_active_start_live_times"

    .line 19
    .line 20
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const-string v0, ""

    .line 35
    .line 36
    invoke-direct {p1, p2, v0}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/oun;->g:Ll/wyd0;

    .line 40
    .line 41
    new-instance p1, Ll/ft5;

    .line 42
    .line 43
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Ll/oun;->j:Ll/ft5;

    .line 47
    .line 48
    iput-boolean p3, p0, Ll/oun;->h:Z

    .line 49
    .line 50
    iput-object p4, p0, Ll/oun;->i:Ll/egj0;

    .line 51
    .line 52
    return-void
.end method

.method public static G3()Z
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
    const/4 v1, 0x1

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {v0}, Ll/t4u;->k(Z)V

    .line 22
    .line 23
    .line 24
    return v1

    .line 25
    :cond_0
    invoke-static {}, Ll/t4u;->c()Lrx/subjects/a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    xor-int/2addr v0, v1

    .line 40
    return v0
.end method

.method public static synthetic P2(Ll/oun;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oun;->p3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Q2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    invoke-static {p0}, Ll/t4u;->n(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic R2(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/live/base/data/BLiveCounter;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic S2(Ll/oun;ZZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/oun;->u3(ZZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic T2(Ll/oun;Ll/qrr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oun;->o3(Ll/qrr;)V

    return-void
.end method

.method public static synthetic U2(Ljava/lang/Boolean;)Ljava/lang/Boolean;
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

.method public static synthetic V2(Ll/oun;Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/oun;->s3(Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic W2(Ll/oun;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oun;->q3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic X2(Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic Y2(Ll/oun;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oun;->r3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Z2(Ll/oun;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oun;->n3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic a3(Ll/oun;ZLl/qrr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/oun;->x3(ZLl/qrr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->getLiveActivitySummaryInSquare()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c3(Ll/oun;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oun;->w3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d3(Ll/oun;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oun;->v3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic f3(Ll/oun;ZLl/qrr;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/oun;->y3(ZLl/qrr;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Lcom/p1/mobile/putong/data/Followship;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->otherUser:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic h3(Ll/oun;ZZLl/qrr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/oun;->t3(ZZLl/qrr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method private i3()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/qrr;",
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
    iget-object p0, p0, Ll/gm3;->b:Lrx/subjects/a;

    .line 10
    .line 11
    return-object p0
.end method

.method private synthetic p3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic q3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->A(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic r3(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->z()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Ll/oun;->B3(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public B3(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/oun;->C3(ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public C3(ZZ)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->getLiveActivitySummaryInSquare()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/aun;

    .line 10
    .line 11
    invoke-direct {v1, p0, p2, p1}, Ll/aun;-><init>(Ll/oun;ZZ)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/bun;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/bun;-><init>(Ll/oun;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public D3(Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final E3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ppi0;->y()Lrx/c;

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
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/ztn;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/ztn;-><init>(Ll/oun;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public F3(ZZ)V
    .locals 3

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
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/gm3;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/gm3;->j()V

    .line 21
    .line 22
    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/qrr;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/qrr;->a()Ll/qrr;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ll/qrr;

    .line 69
    .line 70
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-nez p2, :cond_2

    .line 75
    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/qrr;->j()Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-nez p2, :cond_1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    const-string p2, "clearActivitySquareDetailUnread"

    .line 86
    .line 87
    invoke-static {p2}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveCounterApi;->patchReddot(Ljava/lang/String;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    new-instance v1, Ll/vtn;

    .line 92
    .line 93
    invoke-direct {v1}, Ll/vtn;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    new-instance v1, Ll/fun;

    .line 101
    .line 102
    invoke-direct {v1}, Ll/fun;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    new-instance v1, Ll/gun;

    .line 110
    .line 111
    invoke-direct {v1, p0, p1, v0}, Ll/gun;-><init>(Ll/oun;ZLl/qrr;)V

    .line 112
    .line 113
    .line 114
    new-instance v2, Ll/hun;

    .line 115
    .line 116
    invoke-direct {v2, p0, p1, v0}, Ll/hun;-><init>(Ll/oun;ZLl/qrr;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iget-object p0, p0, Ll/oun;->j:Ll/ft5;

    .line 128
    .line 129
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 130
    .line 131
    .line 132
    :cond_2
    :goto_0
    return-void
.end method

.method public H3(Ll/qrr;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oun;->i:Ll/egj0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/egj0;->v()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/vun;->b(Ll/qrr;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public I2()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

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
    new-instance v1, Ll/iun;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/iun;-><init>(Ll/oun;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/jun;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/jun;-><init>(Ll/oun;)V

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
    new-instance v1, Ll/kun;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/kun;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/lun;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/lun;-><init>(Ll/oun;)V

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
    new-instance v1, Ll/mun;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/mun;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/nun;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/nun;-><init>(Ll/oun;)V

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
    invoke-virtual {p0}, Ll/oun;->E3()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public I3(Ll/qrr;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oun;->i:Ll/egj0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/egj0;->v()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/vun;->c(Ll/qrr;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public J3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oun;->i:Ll/egj0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/egj0;->v()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/vun;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public K3()V
    .locals 8

    .line 1
    const-string v0, ":"

    .line 2
    .line 3
    const-string v1, ":1"

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->n()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    :try_start_0
    iget-object v4, p0, Ll/oun;->g:Ll/wyd0;

    .line 10
    .line 11
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    check-cast v4, Ljava/lang/CharSequence;

    .line 16
    .line 17
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_0

    .line 22
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    goto :goto_1

    .line 39
    :catch_0
    move-exception v0

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v4, p0, Ll/oun;->g:Ll/wyd0;

    .line 42
    .line 43
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    const/4 v5, 0x0

    .line 54
    aget-object v6, v4, v5

    .line 55
    .line 56
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 57
    .line 58
    .line 59
    move-result-wide v6

    .line 60
    cmp-long v6, v6, v2

    .line 61
    .line 62
    if-nez v6, :cond_1

    .line 63
    .line 64
    new-instance v6, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    aget-object v5, v4, v5

    .line 70
    .line 71
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x1

    .line 78
    aget-object v4, v4, v0

    .line 79
    .line 80
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    goto :goto_1

    .line 91
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    goto :goto_1

    .line 107
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    :goto_1
    iget-object v1, p0, Ll/oun;->g:Ll/wyd0;

    .line 126
    .line 127
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Ll/oun;->i:Ll/egj0;

    .line 131
    .line 132
    invoke-interface {p0}, Ll/egj0;->v()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {p0}, Ll/vun;->f(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public L3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oun;->i:Ll/egj0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/egj0;->v()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_live_recommend"

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/oun;->i:Ll/egj0;

    .line 16
    .line 17
    invoke-interface {v0}, Ll/egj0;->v()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "p_live_nearby"

    .line 22
    .line 23
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/oun;->i:Ll/egj0;

    .line 32
    .line 33
    invoke-interface {p0}, Ll/egj0;->v()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/vun;->g(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public j3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oun;->i:Ll/egj0;

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

.method public final k3()I
    .locals 5

    .line 1
    iget-object p0, p0, Ll/oun;->g:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Ll/pzi0;->n()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const/4 v2, 0x0

    .line 14
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    return v2

    .line 21
    :cond_0
    const-string v3, ":"

    .line 22
    .line 23
    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    aget-object v3, p0, v2

    .line 28
    .line 29
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 30
    .line 31
    .line 32
    move-result-wide v3

    .line 33
    cmp-long v0, v3, v0

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    aget-object p0, p0, v0

    .line 39
    .line 40
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    return p0

    .line 45
    :catch_0
    move-exception p0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    return v2

    .line 48
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    return v2
.end method

.method public m3(Ljava/lang/String;)V
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
    if-le v0, v1, :cond_0

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
    if-eqz v0, :cond_0

    .line 21
    .line 22
    aget-object p1, p1, v1

    .line 23
    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->getLiveActivitySignInRecommendRoom(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Ll/wtn;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/wtn;-><init>(Ll/oun;)V

    .line 35
    .line 36
    .line 37
    new-instance p0, Ll/xtn;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/xtn;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    const/4 p0, 0x2

    .line 51
    invoke-static {p0}, Ll/t4u;->n(I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/oun;->j:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 5

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
    if-nez v0, :cond_1

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
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-static {v0}, Ll/t4u;->n(I)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 36
    .line 37
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const/4 v3, 0x1

    .line 51
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->M(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string v3, "sign-in-suggested"

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v0, v1, v2}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Ll/oun;->i:Ll/egj0;

    .line 70
    .line 71
    invoke-interface {v1}, Ll/egj0;->v()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 88
    .line 89
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 96
    .line 97
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v1, v2, v3}, Ll/vun;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 103
    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 105
    .line 106
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-nez v1, :cond_0

    .line 111
    .line 112
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 113
    .line 114
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 115
    .line 116
    new-instance v2, Ll/ytn;

    .line 117
    .line 118
    invoke-direct {v2, p1}, Ll/ytn;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_0

    .line 130
    .line 131
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    .line 136
    .line 137
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Followship;->isFollowed(Lcom/p1/mobile/putong/data/Followship;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_0

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->g2(Landroid/content/Context;)Landroid/content/Intent;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 156
    .line 157
    .line 158
    :cond_0
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_1
    const/4 p0, 0x2

    .line 167
    invoke-static {p0}, Ll/t4u;->n(I)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public final synthetic o3(Ll/qrr;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->E(Ll/qrr;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s3(Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 3

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
    new-instance v0, Ll/qrr;

    .line 22
    .line 23
    invoke-direct {v0, p2}, Ll/qrr;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ll/qrr;->e()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->type:Ljava/lang/String;

    .line 31
    .line 32
    const-string v1, "sign-in"

    .line 33
    .line 34
    invoke-static {v1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_0

    .line 39
    .line 40
    sget-object p2, Ll/itd0;->e:Ll/itd0;

    .line 41
    .line 42
    invoke-static {p2}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Ll/fm3;

    .line 47
    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 49
    .line 50
    .line 51
    move-result-wide v1

    .line 52
    invoke-virtual {p2, v1, v2}, Ll/fm3;->g(J)V

    .line 53
    .line 54
    .line 55
    const/4 p2, 0x3

    .line 56
    invoke-virtual {v0, p2}, Ll/qrr;->b(I)Ll/qrr;

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/oun;->G3()Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_1

    .line 64
    .line 65
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    invoke-virtual {v0}, Ll/qrr;->e()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->type:Ljava/lang/String;

    .line 78
    .line 79
    const-string v1, "start-live"

    .line 80
    .line 81
    invoke-static {v1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-eqz p2, :cond_1

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/oun;->k3()I

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    invoke-virtual {v0}, Ll/qrr;->e()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->displayTime:I

    .line 96
    .line 97
    if-ge p2, v1, :cond_1

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/qrr;->e()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->title:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    if-nez p2, :cond_1

    .line 110
    .line 111
    const/4 p1, 0x4

    .line 112
    invoke-virtual {v0, p1}, Ll/qrr;->b(I)Ll/qrr;

    .line 113
    .line 114
    .line 115
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_1
    if-eqz p1, :cond_2

    .line 124
    .line 125
    invoke-interface {p1}, Ll/x20;->call()V

    .line 126
    .line 127
    .line 128
    :cond_2
    return-void
.end method

.method public final synthetic t3(ZZLl/qrr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveCounterApi;->refreshLiveCounter(Z)V

    .line 5
    .line 6
    .line 7
    :cond_0
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/qrr;

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p2, Ll/qrr;

    .line 27
    .line 28
    invoke-direct {p2, p4}, Ll/qrr;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ll/qrr;->l(Ll/qrr;)Ll/qrr;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ll/qrr;->a()Ll/qrr;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    :goto_0
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, p3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic u3(ZZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 7

    .line 1
    new-instance v0, Ll/qrr;

    .line 2
    .line 3
    invoke-direct {v0, p3}, Ll/qrr;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/qrr;->a()Ll/qrr;

    .line 7
    .line 8
    .line 9
    move-result-object v5

    .line 10
    new-instance v1, Ll/cun;

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move v3, p1

    .line 14
    move v4, p2

    .line 15
    move-object v6, p3

    .line 16
    invoke-direct/range {v1 .. v6}, Ll/cun;-><init>(Ll/oun;ZZLl/qrr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, v2, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 22
    .line 23
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->m(Ll/qrr;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Ll/oun;->z3(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveCounterApi;->refreshLiveCounter(Z)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-interface {v1}, Ll/x20;->call()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic v3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/oun;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/qrr;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/qrr;-><init>(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ll/qrr;->a()Ll/qrr;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic w3(Ljava/lang/Boolean;)V
    .locals 2

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
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Ll/oun;->B3(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/oun;->i:Ll/egj0;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/egj0;->v()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "p_audio_explore_recommend"

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast p0, Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    xor-int/lit8 p1, p1, 0x1

    .line 44
    .line 45
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public final synthetic x3(ZLl/qrr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fk3;

    .line 8
    .line 9
    const-string v1, "live_activities_entry"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/fk3;->I(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p2, p1}, Ll/qrr;->b(I)Ll/qrr;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance p1, Ll/qrr;

    .line 34
    .line 35
    invoke-direct {p1, p3}, Ll/qrr;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ll/qrr;->a()Ll/qrr;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic y3(ZLl/qrr;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p2, p1}, Ll/qrr;->b(I)Ll/qrr;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-direct {p0}, Ll/oun;->i3()Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p1, Ll/qrr;

    .line 21
    .line 22
    invoke-direct {p1, p3}, Ll/qrr;-><init>(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ll/qrr;->a()Ll/qrr;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final z3(Ll/x20;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->getLiveActivityEntranceInfo()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/dun;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/dun;-><init>(Ll/oun;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/eun;

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ll/eun;-><init>(Ll/x20;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method
