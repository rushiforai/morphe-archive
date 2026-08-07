.class public Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;
.super Ll/a1u;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a1u<",
        "Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;",
        ">;"
    }
.end annotation


# instance fields
.field public l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public m:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;

.field public n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/eyu;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ll/p5u;

.field public p:Z

.field public q:Z


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/a1u;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private R3()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->o:Ll/p5u;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ubu;->t()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->p:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->W3()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/rg80;->a()Ll/rg80;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Ll/rg80;->e(Z)V

    .line 26
    .line 27
    .line 28
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->p:Z

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->o:Ll/p5u;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/ubu;->r()Lcom/p1/mobile/putong/data/Pagination;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 37
    .line 38
    iget-object v5, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 39
    .line 40
    const-string v7, "liveTabSource=live-independent-tab-suggested"

    .line 41
    .line 42
    const/4 v8, 0x0

    .line 43
    const-string v1, "suggested"

    .line 44
    .line 45
    const-string v2, "square-curated"

    .line 46
    .line 47
    const-string v3, ""

    .line 48
    .line 49
    const/16 v4, 0xf

    .line 50
    .line 51
    const/4 v6, 0x0

    .line 52
    invoke-static/range {v1 .. v8}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveListV2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;Z)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/h3u;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/h3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 63
    .line 64
    .line 65
    new-instance v2, Ll/i3u;

    .line 66
    .line 67
    invoke-direct {v2, p0}, Ll/i3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic U2(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->isOnLive()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return-object v0
.end method

.method public static synthetic V2(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->M3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W2(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->E3(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic X2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y2(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z2(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->F3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ll/p5u;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->H3(Ll/p5u;)V

    return-void
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->G3(Ljava/lang/Throwable;)V

    return-void
.end method

.method private c()V
    .locals 8

    .line 1
    const-string v6, "liveTabSource=live-independent-tab-suggested"

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    const-string v0, "suggested"

    .line 5
    .line 6
    const-string v1, "square-curated"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/16 v3, 0xf

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, 0x0

    .line 13
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveListV2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;Z)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/a4u;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/a4u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/f3u;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Ll/f3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->D3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->j()Z

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

.method public static synthetic e3(Landroid/net/NetworkInfo;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ljava/util/ArrayList;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->N3(Ljava/util/ArrayList;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->L3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->B3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic i3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->P3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic j3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic k3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ll/p5u;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->I3(Ll/p5u;)V

    return-void
.end method

.method public static synthetic m3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->J3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic n3(Ljava/util/ArrayList;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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

.method public static synthetic o3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->O3()V

    return-void
.end method

.method public static synthetic p3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->K3(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->C3()V

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->z:Lv/VPullDownRefreshLayout;

    .line 6
    .line 7
    new-instance v1, Lv/smart_refresh/header/TTMaterialRefreshHeader;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Lv/smart_refresh/header/TTMaterialRefreshHeader;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lv/VPullDownRefreshLayout;->S(Ll/kvc0;)Ll/mvc0;

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x1

    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;-><init>(Landroid/content/Context;IZ)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->m:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;

    .line 38
    .line 39
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->A:Lv/VRecyclerView;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->A:Lv/VRecyclerView;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->m:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;

    .line 60
    .line 61
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;->a(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger$a;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 70
    .line 71
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->A:Lv/VRecyclerView;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getRecycledViewPool()Landroidx/recyclerview/widget/RecyclerView$u;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0, v2, v3}, Landroidx/recyclerview/widget/RecyclerView$u;->m(II)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 83
    .line 84
    new-instance v1, Ll/g3u;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/g3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic r3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->z3()V

    return-void
.end method

.method public static bridge synthetic s3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    return-object p0
.end method

.method public static bridge synthetic t3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->q:Z

    return p0
.end method

.method public static bridge synthetic u3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->q:Z

    return-void
.end method

.method public static bridge synthetic v3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->U3(Z)V

    return-void
.end method

.method public static synthetic w3(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private y3()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a$b;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/lwr;->e(Ll/ga1;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final synthetic B3(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/sina/weibo/sdk/net/NetStateManager;->isNetworkConnected(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->W3()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->A:Lv/VRecyclerView;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/r3u;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/r3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 46
    .line 47
    .line 48
    const-wide/16 v1, 0x1f4

    .line 49
    .line 50
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final synthetic C3()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->q:Z

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->U3(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic D3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "\u6b63\u5728\u4f7f\u7528\u624b\u673a\u6d41\u91cf\u89c2\u770b\u76f4\u64ad"

    .line 18
    .line 19
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic E3(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->W3()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic F3(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x5

    .line 12
    .line 13
    if-lt p1, v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->R3()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic G3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->p:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic H3(Ll/p5u;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->p:Z

    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object v0, p1, Ll/ubu;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->o:Ll/p5u;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/ubu;->w(Ll/ubu;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->o:Ll/p5u;

    .line 20
    .line 21
    iget-object p1, p1, Ll/ubu;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->x3(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public I2()V
    .locals 3

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
    new-instance v1, Ll/e3u;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/e3u;-><init>()V

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
    new-instance v1, Ll/p3u;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/p3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/t3u;

    .line 28
    .line 29
    invoke-direct {v2}, Ll/t3u;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/u3u;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/u3u;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/v3u;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/v3u;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/w3u;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/w3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->c()V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->r()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->V3()V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final synthetic I3(Ll/p5u;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Ll/ubu;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->o:Ll/p5u;

    .line 13
    .line 14
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->p5()V

    .line 19
    .line 20
    .line 21
    iget-object p1, p1, Ll/ubu;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->x3(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->t5(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic J3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->t5(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic K3(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

    .line 8
    .line 9
    .line 10
    move-result p0

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

.method public final synthetic L3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->X3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a1u;->T2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N3(Ljava/util/ArrayList;)Lrx/c;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->o:Ll/p5u;

    .line 3
    .line 4
    iget-object v1, v1, Ll/ubu;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->o:Ll/p5u;

    .line 13
    .line 14
    iget-object v1, v1, Ll/ubu;->a:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public final synthetic O3()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->q:Z

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->U3(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic P3(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->m:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-ne v1, v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->W3()V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->o:Ll/p5u;

    .line 40
    .line 41
    iget-object v0, v0, Ll/ubu;->a:Ljava/util/List;

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Ll/eyu;

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->W(Ll/d3q;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v0, Ll/s3u;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/s3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 74
    .line 75
    .line 76
    const-wide/16 v1, 0x1f4

    .line 77
    .line 78
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method public R2(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/a1u;->R2(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget p2, Ll/q7c0;->a:I

    .line 9
    .line 10
    sget p3, Ll/q7c0;->b:I

    .line 11
    .line 12
    invoke-virtual {p0, p2, p3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Ll/iyu;->b(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public S3(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->y3()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->j()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string p0, "\u6b63\u5728\u4f7f\u7528\u624b\u673a\u6d41\u91cf\u89c2\u770b\u76f4\u64ad"

    .line 13
    .line 14
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->W3()V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/rg80;->a()Ll/rg80;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-virtual {p0, p1}, Ll/rg80;->e(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public T3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->W3()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->c()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->z:Lv/VPullDownRefreshLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->A:Lv/VRecyclerView;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final U3(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->m:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 19
    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-lez v1, :cond_2

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-ge v0, v1, :cond_2

    .line 35
    .line 36
    const/4 v1, -0x1

    .line 37
    if-le v0, v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/eyu;

    .line 46
    .line 47
    invoke-static {}, Ll/rg80;->a()Ll/rg80;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    rem-int/lit8 v3, v0, 0x2

    .line 52
    .line 53
    if-nez v3, :cond_1

    .line 54
    .line 55
    const/4 v3, 0x1

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const/4 v3, 0x0

    .line 58
    :goto_0
    invoke-virtual {v2, v3}, Ll/rg80;->b(Z)Ll/qwl;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Ll/eyu;->W(Ll/qwl;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Ll/eyu;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ll/eyu;->X(Z)V

    .line 74
    .line 75
    .line 76
    :cond_2
    :goto_1
    return-void
.end method

.method public V3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/a1u;->f:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/a1u;->g:I

    .line 7
    .line 8
    int-to-long v0, v0

    .line 9
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/x3u;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/x3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/y3u;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/y3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/z3u;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/z3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object p0, p0, Ll/a1u;->f:Ll/ft5;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final W3()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->m:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveVideoPagerSnapLinearLayoutManger;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-lez v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ge v0, v1, :cond_0

    .line 24
    .line 25
    const/4 v1, -0x1

    .line 26
    if-le v0, v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ll/eyu;

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/eyu;->V()Landroid/util/Pair;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ll/eyu;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/eyu;->P()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-object v0, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v0, Ljava/lang/Long;

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 57
    .line 58
    .line 59
    move-result-wide v2

    .line 60
    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v0, Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-static {p0, v2, v3, v0}, Ll/iyu;->d(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;JZ)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public final X3()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->o:Ll/p5u;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Ll/ubu;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->o:Ll/p5u;

    .line 15
    .line 16
    iget-object v0, v0, Ll/ubu;->a:Ljava/util/List;

    .line 17
    .line 18
    new-instance v1, Ll/l3u;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/l3u;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/16 v1, 0x64

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->queryCurrentLivesInfo(Ljava/util/List;Z)Lrx/c;

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
    new-instance v1, Ll/m3u;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/m3u;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/n3u;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/n3u;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/o3u;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/o3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/q3u;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/q3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    :cond_1
    :goto_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/a1u;->f:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final x3(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;)V"
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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 16
    .line 17
    new-instance v2, Ll/eyu;

    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 24
    .line 25
    new-instance v4, Ll/j3u;

    .line 26
    .line 27
    invoke-direct {v4, p0}, Ll/j3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {v2, v3, p0, v0, v4}, Ll/eyu;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ll/a1u;ILl/y20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->n:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    new-instance p1, Ll/k3u;

    .line 57
    .line 58
    invoke-direct {p1, p0}, Ll/k3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public final synthetic z3()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->q:Z

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->U3(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
