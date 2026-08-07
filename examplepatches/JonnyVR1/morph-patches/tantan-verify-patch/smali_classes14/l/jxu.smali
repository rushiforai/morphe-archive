.class public Ll/jxu;
.super Ll/dvs;
.source "SourceFile"

# interfaces
.implements Ll/sm50;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jxu$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/mxu;",
        ">;",
        "Ll/sm50;"
    }
.end annotation


# instance fields
.field public f:Ll/jxu$b;

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
.method public constructor <init>(Ll/ner;Ll/nus;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVChatView;)V
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
    iput-object p1, p0, Ll/jxu;->g:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ll/mxu;

    .line 12
    .line 13
    iget-object p2, p3, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVChatView;->c:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-direct {p1, p2}, Ll/mxu;-><init>(Lv/VDraweeView;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic P2(Ll/jxu;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jxu;->c3(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic Q2(Ll/jxu;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jxu;->e3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic R2(Ll/jxu;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jxu;->f3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic S2(Ll/jxu;Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jxu;->b3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T2(Ll/jxu;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jxu;->Z2(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic U2(Ll/jxu;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jxu;->d3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic V2(Ll/jxu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jxu;->a3(Ljava/lang/String;)V

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

.method private Y2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jxu;->g:Ljava/util/List;

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
    new-instance v2, Ll/evs;

    .line 10
    .line 11
    invoke-direct {v2}, Ll/evs;-><init>()V

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
    check-cast v3, Ll/mxu;

    .line 23
    .line 24
    iput-boolean v1, v3, Ll/mxu;->e:Z

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string v1, "p_live_video_quickchat"

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v1, 0x0

    .line 39
    :goto_0
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast v2, Ll/mxu;

    .line 42
    .line 43
    invoke-virtual {v2, v1}, Ll/mxu;->j(Z)V

    .line 44
    .line 45
    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    iget-object p0, p0, Ll/jxu;->f:Ll/jxu$b;

    .line 49
    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    invoke-interface {p0}, Ll/jxu$b;->b()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method private synthetic Z2(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jxu;->j3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic a3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mxu;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/mxu;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic b3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jxu;->i3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private i3(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/mxu;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mxu;->e()V

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string p1, "9"

    .line 24
    .line 25
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const-string p0, "e_live_anchor_center_entrance"

    .line 32
    .line 33
    const-string p1, "p_live_video_quickchat"

    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method private m3(Ljava/util/List;)V
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
    iget-object v0, p0, Ll/jxu;->g:Ljava/util/List;

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
    iget-object p0, p0, Ll/jxu;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public S(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/mxu;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/mxu;->d(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jxu;->g3()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveVideoChatEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;->refreshVideoChat()Ll/v3f$c;

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
    new-instance v1, Ll/axu;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/axu;-><init>(Ll/jxu;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->skinConfig()Ll/v3f$d;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lrx/c;

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/bxu;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/bxu;-><init>(Ll/jxu;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    new-instance v0, Ll/jxu$a;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/jxu$a;-><init>(Ll/jxu;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/jxu;->k3(Ll/jxu$b;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 81
    .line 82
    check-cast v0, Ll/mxu;

    .line 83
    .line 84
    iget-object v0, v0, Ll/mxu;->b:Lv/VDraweeView;

    .line 85
    .line 86
    new-instance v1, Ll/cxu;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/cxu;-><init>(Ll/jxu;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
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
    iget-object v1, p0, Ll/jxu;->g:Ljava/util/List;

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
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_1

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
    new-instance v5, Ll/fxu;

    .line 33
    .line 34
    invoke-direct {v5, p0, v3}, Ll/fxu;-><init>(Ll/jxu;Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V

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
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->id:Ljava/lang/String;

    .line 44
    .line 45
    const-string v4, "9"

    .line 46
    .line 47
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_0

    .line 52
    .line 53
    const-string v3, "e_live_anchor_center_entrance"

    .line 54
    .line 55
    const-string v4, "p_live_video_quickchat"

    .line 56
    .line 57
    invoke-static {v3, v4}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-object v0
.end method

.method public b2(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "videoChat"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic c3(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jxu;->j3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/mxu;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput-boolean p1, v0, Ll/mxu;->d:Z

    .line 10
    .line 11
    invoke-direct {p0}, Ll/jxu;->Y2()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic e3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/gm3;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 10
    .line 11
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->isAnchor:Z

    .line 12
    .line 13
    iput-boolean v1, v0, Ll/gm3;->h:Z

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->menuItems:Ljava/util/List;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ll/jxu;->m3(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Ll/jxu;->Y2()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic f3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jxu;->Y2()V

    .line 2
    .line 3
    .line 4
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
    new-instance v1, Ll/gxu;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/gxu;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/hxu;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/hxu;-><init>(Ll/jxu;)V

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
    new-instance v1, Ll/ixu;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/ixu;-><init>(Ll/jxu;)V

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
    iget-object v0, p0, Ll/jxu;->f:Ll/jxu$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/jxu$b;->a(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/mxu;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/jxu;->X2()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object p0, p0, Ll/jxu;->f:Ll/jxu$b;

    .line 17
    .line 18
    invoke-virtual {v0, p1, v1, p0}, Ll/mxu;->i(Landroid/view/View;Ljava/util/List;Ll/jxu$b;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final j3()V
    .locals 3

    .line 1
    invoke-static {}, Ll/jwu;->J()Lrx/c;

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
    new-instance v1, Ll/dxu;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/dxu;-><init>(Ll/jxu;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/exu;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/exu;-><init>(Ll/jxu;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public k3(Ll/jxu$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jxu;->f:Ll/jxu$b;

    .line 2
    .line 3
    return-void
.end method
