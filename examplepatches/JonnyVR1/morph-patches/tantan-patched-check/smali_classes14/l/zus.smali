.class public Ll/zus;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zus$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/cvs;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ll/zus$b;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/zus;->g:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ll/cvs;

    .line 12
    .line 13
    invoke-direct {p1, p3}, Ll/cvs;-><init>(Lv/VDraweeView;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic P2(Ll/zus;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zus;->e3(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic Q2(Ll/zus;Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zus;->b3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R2(Ll/zus;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zus;->Z2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic S2(Ll/zus;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zus;->c3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic T2(Ll/zus;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zus;->f3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic U2(Ll/zus;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zus;->a3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic V2(Ll/zus;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zus;->d3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W2(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic Z2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/cvs;

    .line 4
    .line 5
    invoke-static {p1}, Ll/y6u;->n(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/cvs;->d(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic a3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/cvs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/cvs;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/zus;->g3()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lrx/c;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/qus;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/qus;-><init>(Ll/zus;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->skinConfig()Ll/v3f$d;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lrx/c;

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/rus;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/rus;-><init>(Ll/zus;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    new-instance v0, Ll/zus$a;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Ll/zus$a;-><init>(Ll/zus;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ll/zus;->j3(Ll/zus$b;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 89
    .line 90
    check-cast v0, Ll/cvs;

    .line 91
    .line 92
    iget-object v0, v0, Ll/cvs;->b:Lv/VDraweeView;

    .line 93
    .line 94
    new-instance v1, Ll/sus;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/sus;-><init>(Ll/zus;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public X2()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/zus;->g:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;

    .line 24
    .line 25
    new-instance v4, Ll/o4u;

    .line 26
    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    invoke-direct {v4, v3, v2}, Ll/o4u;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;I)V

    .line 30
    .line 31
    .line 32
    new-instance v5, Ll/tus;

    .line 33
    .line 34
    invoke-direct {v5, p0, v3}, Ll/tus;-><init>(Ll/zus;Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v4, v5}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-object v0
.end method

.method public final Y2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zus;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v1, v0, 0x1

    .line 8
    .line 9
    new-instance v2, Ll/sys;

    .line 10
    .line 11
    invoke-direct {v2}, Ll/sys;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v2}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Ljava/lang/String;

    .line 19
    .line 20
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v3, Ll/cvs;

    .line 23
    .line 24
    iput-boolean v1, v3, Ll/cvs;->e:Z

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    invoke-static {v2}, Ll/y6u;->n(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v1, 0x0

    .line 37
    :goto_0
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast v2, Ll/cvs;

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ll/cvs;->j(Z)V

    .line 42
    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    iget-object p0, p0, Ll/zus;->f:Ll/zus$b;

    .line 47
    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    invoke-interface {p0}, Ll/zus$b;->b()V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final synthetic b3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zus;->i3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c3(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zus;->k3(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/zus;->Y2()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic d3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zus;->Y2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e3(Landroid/net/NetworkInfo;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getSquareMenuItems()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/xus;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/xus;-><init>(Ll/zus;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/yus;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/yus;-><init>(Ll/zus;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic f3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/cvs;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput-boolean p1, v0, Ll/cvs;->d:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zus;->Y2()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public g3()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

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
    new-instance v1, Ll/uus;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/uus;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/vus;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/vus;-><init>(Ll/zus;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/ppi0;->y()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/wus;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/wus;-><init>(Ll/zus;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public h3(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zus;->f:Ll/zus$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/zus$b;->a(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/cvs;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/zus;->X2()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object p0, p0, Ll/zus;->f:Ll/zus$b;

    .line 17
    .line 18
    invoke-virtual {v0, p1, v1, p0}, Ll/cvs;->i(Landroid/view/View;Ljava/util/List;Ll/zus$b;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final i3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/cvs;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/cvs;->e()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->jumpUri:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p0, p1}, Ll/mbs;->T(Lcom/p1/mobile/android/app/Act;Landroid/net/Uri;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public j3(Ll/zus$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zus;->f:Ll/zus$b;

    .line 2
    .line 3
    return-void
.end method

.method public final k3(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zus;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/zus;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
