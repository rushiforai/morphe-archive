.class public Ll/kbv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fbv;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

.field public b:Ll/fbv;

.field public c:Ll/r0u;

.field public d:Ll/h2u;

.field public e:Landroid/view/View;

.field public f:Lv/VRecyclerView;

.field public g:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

.field public h:Landroidx/recyclerview/widget/GridLayoutManager;

.field public i:Lv/navigationbar/VNavigationBar;

.field public j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public k:Landroid/view/View;

.field public l:Lv/VPullDownRefreshLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/kbv;Ll/uxr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kbv;->k(Ll/uxr;)V

    return-void
.end method

.method public static synthetic b(Ll/kbv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kbv;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/kbv;Ll/r0u;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kbv;->l(Ll/r0u;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic d(Ll/kbv;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kbv;->n(Ll/mvc0;)V

    return-void
.end method

.method private j(Ljava/util/List;ZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ll/d3q<",
            "*>;>;ZZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kbv;->c:Ll/r0u;

    .line 2
    .line 3
    iget-object v1, p0, Ll/kbv;->d:Ll/h2u;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->W(Ll/d3q;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/h2u;

    .line 9
    .line 10
    if-nez p3, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    :goto_0
    const/4 p3, 0x6

    .line 22
    invoke-direct {v0, p3, p2, p1}, Ll/h2u;-><init>(IZZ)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/kbv;->d:Ll/h2u;

    .line 26
    .line 27
    iget-object p1, p0, Ll/kbv;->f:Lv/VRecyclerView;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget p2, Ll/m9c0;->z:I

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {v0, p1}, Ll/h2u;->I(I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/kbv;->d:Ll/h2u;

    .line 43
    .line 44
    sget p2, Lcom/p1/mobile/putong/live/external/R$string;->q:I

    .line 45
    .line 46
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1, p2}, Ll/h2u;->J(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/kbv;->c:Ll/r0u;

    .line 54
    .line 55
    iget-object p0, p0, Ll/kbv;->d:Ll/h2u;

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->E(Ll/d3q;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic n(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kbv;->b:Ll/fbv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fbv;->F2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ljava/util/List;ZZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/uxr<",
            "*>;>;ZZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kbv;->c:Ll/r0u;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/jbv;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/jbv;-><init>(Ll/kbv;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/kbv;->c:Ll/r0u;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-direct {p0, p1, p2, p3}, Ll/kbv;->j(Ljava/util/List;ZZ)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public f(Ll/fbv;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kbv;->b:Ll/fbv;

    .line 2
    .line 3
    return-void
.end method

.method public i()Ll/r0u;
    .locals 6

    .line 1
    invoke-static {}, Ll/r0u;->J0()Ll/r0u;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x6

    .line 12
    const/4 v4, 0x1

    .line 13
    const/4 v5, 0x0

    .line 14
    invoke-direct {v1, v2, v3, v4, v5}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/kbv;->h:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 18
    .line 19
    new-instance v2, Ll/kbv$a;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0}, Ll/kbv$a;-><init>(Ll/kbv;Ll/r0u;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/kbv;->f:Lv/VRecyclerView;

    .line 28
    .line 29
    iget-object v2, p0, Ll/kbv;->h:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/kbv;->f:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/kbv;->f:Lv/VRecyclerView;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/v6u;->l0(Ll/ner;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->X(Z)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Ll/ibv;

    .line 54
    .line 55
    invoke-direct {v1, p0, v0}, Ll/ibv;-><init>(Ll/kbv;Ll/r0u;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 59
    .line 60
    .line 61
    return-object v0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fbv;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kbv;->f(Ll/fbv;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/xec0;->Y1:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/kbv;->e:Landroid/view/View;

    .line 9
    .line 10
    sget p2, Ll/ldc0;->k1:I

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lv/VRecyclerView;

    .line 17
    .line 18
    iput-object p1, p0, Ll/kbv;->f:Lv/VRecyclerView;

    .line 19
    .line 20
    iget-object p1, p0, Ll/kbv;->e:Landroid/view/View;

    .line 21
    .line 22
    sget p2, Ll/ldc0;->N:I

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/kbv;->k:Landroid/view/View;

    .line 29
    .line 30
    iget-object p1, p0, Ll/kbv;->e:Landroid/view/View;

    .line 31
    .line 32
    sget p2, Ll/ldc0;->e0:I

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 39
    .line 40
    iput-object p1, p0, Ll/kbv;->g:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 41
    .line 42
    iget-object p1, p0, Ll/kbv;->e:Landroid/view/View;

    .line 43
    .line 44
    sget p2, Ll/ldc0;->f1:I

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lv/navigationbar/VNavigationBar;

    .line 51
    .line 52
    iput-object p1, p0, Ll/kbv;->i:Lv/navigationbar/VNavigationBar;

    .line 53
    .line 54
    iget-object p1, p0, Ll/kbv;->e:Landroid/view/View;

    .line 55
    .line 56
    sget p2, Ll/ldc0;->E1:I

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 63
    .line 64
    iput-object p1, p0, Ll/kbv;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 65
    .line 66
    iget-object p1, p0, Ll/kbv;->e:Landroid/view/View;

    .line 67
    .line 68
    sget p2, Ll/ldc0;->F1:I

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lv/VPullDownRefreshLayout;

    .line 75
    .line 76
    iput-object p1, p0, Ll/kbv;->l:Lv/VPullDownRefreshLayout;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/kbv;->r()V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/kbv;->e:Landroid/view/View;

    .line 82
    .line 83
    return-object p0
.end method

.method public final synthetic k(Ll/uxr;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kbv;->c:Ll/r0u;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->N(ILl/d3q;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic l(Ll/r0u;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/lit8 p1, p1, -0x2

    .line 10
    .line 11
    if-lt p2, p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/kbv;->b:Ll/fbv;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/fbv;->E2()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public p(Ljava/util/List;ZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/uxr<",
            "*>;>;ZZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kbv;->l:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/kbv;->c:Ll/r0u;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/kbv;->i()Ll/r0u;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/kbv;->c:Ll/r0u;

    .line 15
    .line 16
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/kbv;->c:Ll/r0u;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-le v0, v1, :cond_1

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object v0, p0, Ll/kbv;->c:Ll/r0u;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/kbv;->g:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->a(I)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, p1, p2, p3}, Ll/kbv;->j(Ljava/util/List;ZZ)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/kbv;->c:Ll/r0u;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/v6u;->k0()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kbv;->l:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/kbv;->c:Ll/r0u;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/kbv;->g:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->b()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/kbv;->g:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->C0:I

    .line 4
    .line 5
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->setEmptyText(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lv/VText;

    .line 13
    .line 14
    iget-object v1, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    const-string v1, "\u6211\u7684"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    const/high16 v1, 0x41a80000    # 21.0f

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Ll/m9c0;->C:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    const/4 v2, 0x1

    .line 54
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 58
    .line 59
    .line 60
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 63
    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    sget v2, Ll/qa00;->c:I

    .line 67
    .line 68
    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/kbv;->i:Lv/navigationbar/VNavigationBar;

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setTitleView(Landroid/view/View;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/kbv;->i:Lv/navigationbar/VNavigationBar;

    .line 77
    .line 78
    iget-object v1, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/kbv;->i:Lv/navigationbar/VNavigationBar;

    .line 88
    .line 89
    sget v1, Ll/m9c0;->H:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    new-instance v0, Lv/VImage;

    .line 95
    .line 96
    iget-object v1, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 97
    .line 98
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-direct {v0, v1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    sget v2, Ll/nbc0;->m1:I

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Ll/kbv;->i:Lv/navigationbar/VNavigationBar;

    .line 121
    .line 122
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconView(Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/kbv;->i:Lv/navigationbar/VNavigationBar;

    .line 126
    .line 127
    new-instance v1, Ll/gbv;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/gbv;-><init>(Ll/kbv;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iget-object v1, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 142
    .line 143
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    sget v2, Ll/m9c0;->c:I

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 154
    .line 155
    .line 156
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iget-object v1, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 161
    .line 162
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    sget v2, Ll/m9c0;->c:I

    .line 167
    .line 168
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/kbv;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 176
    .line 177
    const-string v1, "https://auto.tancdn.com/v1/raw/bd5067f0-fa5a-4faf-bd72-06636f0c4d5610.pdf"

    .line 178
    .line 179
    const/4 v2, -0x1

    .line 180
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    instance-of v0, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 190
    .line 191
    if-eqz v0, :cond_0

    .line 192
    .line 193
    iget-object v0, p0, Ll/kbv;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 194
    .line 195
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 200
    .line 201
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 202
    .line 203
    .line 204
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 205
    .line 206
    sget v1, Ll/bnl0;->e:I

    .line 207
    .line 208
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 209
    .line 210
    .line 211
    invoke-static {}, Ll/bnl0;->F0()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 216
    .line 217
    iget-object v1, p0, Ll/kbv;->k:Landroid/view/View;

    .line 218
    .line 219
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 220
    .line 221
    .line 222
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 223
    .line 224
    sget v1, Ll/bnl0;->e:I

    .line 225
    .line 226
    const/high16 v2, 0x42b80000    # 92.0f

    .line 227
    .line 228
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    invoke-static {}, Ll/bnl0;->F0()I

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    add-int/2addr v2, v3

    .line 237
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 238
    .line 239
    .line 240
    iget-object v1, p0, Ll/kbv;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 241
    .line 242
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 243
    .line 244
    .line 245
    :cond_0
    iget-object v0, p0, Ll/kbv;->l:Lv/VPullDownRefreshLayout;

    .line 246
    .line 247
    new-instance v1, Ll/hbv;

    .line 248
    .line 249
    invoke-direct {v1, p0}, Ll/hbv;-><init>(Ll/kbv;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0, v1}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 253
    .line 254
    .line 255
    return-void
.end method
