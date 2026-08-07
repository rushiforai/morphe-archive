.class public Ll/hh50;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/hh50;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hh50;->p0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Integer;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->TRANS_EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uj4;->b(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)Ll/nql;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-interface {v0, p0}, Ll/nql;->d(I)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic g0(Ll/uxj0;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->di(Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic h0(Ll/hh50;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hh50;->o0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic i0(Ll/hh50;Lrx/Notification;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hh50;->n0(Lrx/Notification;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k0(Ll/hh50;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hh50;->m0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic m0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->r()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/hh50;->l0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    sget-object v3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    .line 19
    invoke-interface {v0, v1, v2, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->personalMediaMomentsFeedPrevious(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/ah50;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/ah50;-><init>(Ll/hh50;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final l0()V
    .locals 4

    .line 1
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/16 v1, 0x1f4

    .line 8
    .line 9
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/bh50;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/bh50;-><init>(Ll/hh50;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/ch50;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/ch50;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/dh50;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/dh50;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/eh50;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/eh50;-><init>(Ll/hh50;)V

    .line 65
    .line 66
    .line 67
    new-instance p0, Ll/fh50;

    .line 68
    .line 69
    invoke-direct {p0}, Ll/fh50;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic n0(Lrx/Notification;)Ljava/lang/Integer;
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->TRANS_EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 2
    .line 3
    invoke-static {p1}, Ll/uj4;->b(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)Ll/nql;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p1, v0, p0}, Ll/nql;->e(Landroid/content/Context;Ll/ner;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic o0(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hh50;->r0(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p0(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p1, Ll/tr90;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tr90;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/hh50;->a:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->K(Lcom/p1/mobile/putong/data/User;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/hh50;->q0()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public q0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hh50;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Ll/hh50;->a:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final r0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/a;->J(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ll/a2i0;->d()Lrx/subjects/b;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/gh50;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/gh50;-><init>(Ll/hh50;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ll/hh50$a;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/hh50$a;-><init>(Ll/hh50;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public s0()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mk8;->x3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
