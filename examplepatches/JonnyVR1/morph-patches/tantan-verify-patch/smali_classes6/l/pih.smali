.class public Ll/pih;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:I


# direct methods
.method public static synthetic e0(Ll/pih;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pih;->t0(Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f0(Ll/ovb0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ovb0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Integer;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic g0(Ll/uxj0;)Lrx/c;
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->Y3()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/oih;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/oih;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/bih;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/bih;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {p0, v0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic i0(Ll/pih;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pih;->u0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/CouterMoments;->unreadFeeds:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic l0(Ll/pih;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pih;->y0(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Ll/pih;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pih;->x0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic n0(Ll/pih;Ljava/util/List;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pih;->s0(Ljava/util/List;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/CounterActivities;->unread:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic q0(Ljava/lang/Integer;)Lrx/c;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/api/b;->m4(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static r0()Z
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    iget-wide v4, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 37
    .line 38
    double-to-long v4, v4

    .line 39
    invoke-static {v2, v3, v4, v5, v1}, Ll/tzi0;->h(JJI)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    xor-int/2addr v0, v1

    .line 44
    return v0
.end method

.method private z0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->counter()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/aih;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/aih;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Js()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/gih;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/gih;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    new-instance v2, Ll/hih;

    .line 44
    .line 45
    invoke-direct {v2}, Ll/hih;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/iih;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/iih;-><init>(Ll/pih;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/mrb0;->j()Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/jih;

    .line 77
    .line 78
    invoke-direct {v1}, Ll/jih;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/kih;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/kih;-><init>(Ll/pih;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/lih;

    .line 99
    .line 100
    invoke-direct {v1}, Ll/lih;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/mih;

    .line 108
    .line 109
    invoke-direct {v1}, Ll/mih;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v1, Ll/nih;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Ll/nih;-><init>(Ll/pih;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 122
    .line 123
    .line 124
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/pih;->z0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic s0(Ljava/util/List;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Ll/pih;->a:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/16 p1, 0xa

    .line 16
    .line 17
    if-ge p0, p1, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final synthetic t0(Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;->e(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic u0(Ll/pf60;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;->j()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const/4 v0, 0x1

    .line 37
    new-array v0, v0, [I

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    aput v1, v0, v1

    .line 41
    .line 42
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v2, Ll/vg60;

    .line 45
    .line 46
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-lez v2, :cond_2

    .line 53
    .line 54
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v2, Ll/vg60;

    .line 57
    .line 58
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    aput v2, v0, v1

    .line 65
    .line 66
    :cond_2
    aget v2, v0, v1

    .line 67
    .line 68
    iget v3, p0, Ll/pih;->a:I

    .line 69
    .line 70
    if-le v2, v3, :cond_3

    .line 71
    .line 72
    aput v3, v0, v1

    .line 73
    .line 74
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast p1, Ll/vg60;

    .line 82
    .line 83
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 84
    .line 85
    invoke-static {p1}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    aget v0, v0, v1

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    new-instance v0, Ll/cih;

    .line 100
    .line 101
    invoke-direct {v0}, Ll/cih;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    new-instance v0, Ll/dih;

    .line 109
    .line 110
    invoke-direct {v0}, Ll/dih;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    new-instance v0, Ll/eih;

    .line 122
    .line 123
    invoke-direct {v0, p0, v2}, Ll/eih;-><init>(Ll/pih;Ljava/util/List;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    new-instance v0, Ll/fih;

    .line 131
    .line 132
    invoke-direct {v0, p0, v2}, Ll/fih;-><init>(Ll/pih;Ljava/util/List;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public final synthetic x0(Ll/pf60;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-static {}, Ll/pih;->r0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x3

    .line 30
    if-le v0, v1, :cond_3

    .line 31
    .line 32
    :cond_0
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;

    .line 43
    .line 44
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v1, Ljava/lang/Integer;

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;->setMomentMsgNum(I)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v0, Ljava/lang/Integer;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Ll/pih;->b:I

    .line 72
    .line 73
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 74
    .line 75
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;

    .line 76
    .line 77
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast p1, Ljava/lang/Integer;

    .line 80
    .line 81
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-lez p1, :cond_2

    .line 86
    .line 87
    const/4 p1, 0x1

    .line 88
    goto :goto_0

    .line 89
    :cond_2
    const/4 p1, 0x0

    .line 90
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;->setMomentDot(Z)V

    .line 91
    .line 92
    .line 93
    :cond_3
    return-void
.end method

.method public final synthetic y0(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Ll/pih;->a:I

    .line 12
    .line 13
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;

    .line 16
    .line 17
    iget v1, p0, Ll/pih;->b:I

    .line 18
    .line 19
    add-int/2addr p1, v1

    .line 20
    const/4 v1, 0x0

    .line 21
    const/4 v2, 0x1

    .line 22
    if-lez p1, :cond_0

    .line 23
    .line 24
    move p1, v2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move p1, v1

    .line 27
    :goto_0
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;->setMomentDot(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;

    .line 33
    .line 34
    iget v0, p0, Ll/pih;->a:I

    .line 35
    .line 36
    if-lez v0, :cond_1

    .line 37
    .line 38
    move v0, v2

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v0, v1

    .line 41
    :goto_1
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/FeedMomentsEntry;->setPopScale(Z)V

    .line 42
    .line 43
    .line 44
    iget p0, p0, Ll/pih;->a:I

    .line 45
    .line 46
    if-lez p0, :cond_2

    .line 47
    .line 48
    move v1, v2

    .line 49
    :cond_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_3
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 55
    .line 56
    return-object p0
.end method
