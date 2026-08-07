.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;,
        Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/txn;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$b;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->g:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->h:Ljava/util/List;

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;->LIVE:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->i:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;

    .line 21
    .line 22
    new-instance p1, Ll/txn;

    .line 23
    .line 24
    invoke-direct {p1, p3}, Ll/txn;-><init>(Lv/VDraweeView;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic P2(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->n3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Q2(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->g3(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic R2(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->b3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic S2(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->c3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T2(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->m3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic U2(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->e3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V2(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->f3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W2(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->d3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X2(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic Y2(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->a3(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic a3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/y6u;->m(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;->GAME:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->i:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p1}, Ll/y6u;->o(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;->LIVE:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->i:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;->VOICE:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->i:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;

    .line 26
    .line 27
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->o3()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic b3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/txn;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/txn;->j(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic d3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->j3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->o3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/txn;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/txn;->d()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->jumpUri:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p0, v0}, Ll/mbs;->T(Lcom/p1/mobile/android/app/Act;Landroid/net/Uri;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->jumpUri:Ljava/lang/String;

    .line 22
    .line 23
    const-string p1, "moment/liveGroup"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const-string p0, "e_live_group_icon"

    .line 32
    .line 33
    const-string p1, "p_live_recommend"

    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->h3()V

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
    new-instance v1, Ll/gxn;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/gxn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V

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
    new-instance v1, Ll/ixn;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/ixn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V

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
    new-instance v0, Ll/jxn;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Ll/jxn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->k3(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$b;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 89
    .line 90
    check-cast v0, Ll/txn;

    .line 91
    .line 92
    iget-object v0, v0, Ll/txn;->b:Lv/VDraweeView;

    .line 93
    .line 94
    new-instance v1, Ll/kxn;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/kxn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public Z2()Ljava/util/List;
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
    sget-object v1, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$a;->a:[I

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->i:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;

    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    aget v1, v1, v2

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    if-eq v1, v2, :cond_1

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    if-eq v1, v2, :cond_0

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->h:Ljava/util/List;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->g:Ljava/util/List;

    .line 27
    .line 28
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x0

    .line 33
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_2

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;

    .line 44
    .line 45
    new-instance v4, Ll/r7o;

    .line 46
    .line 47
    add-int/lit8 v2, v2, 0x1

    .line 48
    .line 49
    invoke-direct {v4, v3, v2}, Ll/r7o;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;I)V

    .line 50
    .line 51
    .line 52
    new-instance v5, Ll/lxn;

    .line 53
    .line 54
    invoke-direct {v5, p0, v3}, Ll/lxn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, v5}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    :goto_2
    return-object v0
.end method

.method public final synthetic c3(Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p1, Ll/evs;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/evs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    const-string p1, "e_live_recommend_setting"

    .line 19
    .line 20
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic f3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->o3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic g3(Landroid/net/NetworkInfo;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->getSquareMenuItems()Lrx/c;

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
    new-instance v0, Ll/oxn;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/oxn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/pxn;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/pxn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->getVoiceSquareMenuItems()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/qxn;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/qxn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/hxn;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/hxn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public h3()V
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
    new-instance v1, Ll/mxn;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/mxn;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/nxn;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/nxn;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public i3(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->f:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$b;->a(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/txn;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->Z2()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p1, p0}, Ll/txn;->f(Landroid/view/View;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public k3(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->f:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$b;

    .line 2
    .line 3
    return-void
.end method

.method public final m3(Ljava/util/List;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->g:Ljava/util/List;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->o3()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final n3(Ljava/util/List;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->h:Ljava/util/List;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->h:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->o3()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final o3()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->i:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter$TabType;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eq v0, v2, :cond_3

    .line 14
    .line 15
    const/4 v3, 0x2

    .line 16
    if-eq v0, v3, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x3

    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Ll/txn;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->h:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    xor-int/2addr p0, v2

    .line 33
    invoke-virtual {v0, p0}, Ll/txn;->i(Z)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    new-instance v0, Ll/evs;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/evs;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ljava/lang/String;

    .line 47
    .line 48
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->g:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-nez v3, :cond_2

    .line 55
    .line 56
    const-string v3, "p_audio_explore_recommend"

    .line 57
    .line 58
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    move v1, v2

    .line 65
    :cond_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 66
    .line 67
    check-cast p0, Ll/txn;

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Ll/txn;->i(Z)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 74
    .line 75
    check-cast p0, Ll/txn;

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Ll/txn;->i(Z)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
