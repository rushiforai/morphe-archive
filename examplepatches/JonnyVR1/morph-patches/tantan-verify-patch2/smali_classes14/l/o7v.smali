.class public Ll/o7v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/j7v;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;

.field public b:Ll/j7v;

.field public c:Ll/r0u;

.field public d:Ll/h2u;

.field public e:Landroid/view/View;

.field public f:Lv/VRecyclerView;

.field public g:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

.field public h:Landroidx/recyclerview/widget/GridLayoutManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o7v;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/o7v;Ll/uxr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o7v;->k(Ll/uxr;)V

    return-void
.end method

.method public static synthetic b(Ll/o7v;Ll/r0u;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o7v;->l(Ll/r0u;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Ll/wys;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static bridge synthetic d(Ll/o7v;)Ll/j7v;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o7v;->b:Ll/j7v;

    return-object p0
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
    iget-object v0, p0, Ll/o7v;->c:Ll/r0u;

    .line 2
    .line 3
    iget-object v1, p0, Ll/o7v;->d:Ll/h2u;

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
    iput-object v0, p0, Ll/o7v;->d:Ll/h2u;

    .line 26
    .line 27
    iget-object p1, p0, Ll/o7v;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

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
    iget-object p1, p0, Ll/o7v;->d:Ll/h2u;

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
    iget-object p1, p0, Ll/o7v;->c:Ll/r0u;

    .line 54
    .line 55
    iget-object p0, p0, Ll/o7v;->d:Ll/h2u;

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->E(Ll/d3q;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
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
    iget-object v0, p0, Ll/o7v;->c:Ll/r0u;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/n7v;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/n7v;-><init>(Ll/o7v;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/o7v;->c:Ll/r0u;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-direct {p0, p1, p2, p3}, Ll/o7v;->j(Ljava/util/List;ZZ)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public f(Ll/j7v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o7v;->b:Ll/j7v;

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
    iput-object v1, p0, Ll/o7v;->h:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 18
    .line 19
    new-instance v2, Ll/o7v$b;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0}, Ll/o7v$b;-><init>(Ll/o7v;Ll/r0u;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/o7v;->f:Lv/VRecyclerView;

    .line 28
    .line 29
    iget-object v2, p0, Ll/o7v;->h:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/o7v;->f:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/o7v;->f:Lv/VRecyclerView;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/o7v;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;

    .line 46
    .line 47
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/l7v;

    .line 51
    .line 52
    invoke-direct {v2, v1}, Ll/l7v;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;)V

    .line 53
    .line 54
    .line 55
    sget-object v3, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;->g:Lrx/subjects/b;

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2, v3}, Ll/v6u;->o0(Lcom/p1/mobile/android/app/Frag;Ll/pcj;Lrx/subjects/b;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->X(Z)V

    .line 61
    .line 62
    .line 63
    new-instance v1, Ll/m7v;

    .line 64
    .line 65
    invoke-direct {v1, p0, v0}, Ll/m7v;-><init>(Ll/o7v;Ll/r0u;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 69
    .line 70
    .line 71
    return-object v0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/j7v;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/o7v;->f(Ll/j7v;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/xec0;->e2:I

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
    iput-object p1, p0, Ll/o7v;->e:Landroid/view/View;

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
    iput-object p1, p0, Ll/o7v;->f:Lv/VRecyclerView;

    .line 19
    .line 20
    iget-object p1, p0, Ll/o7v;->e:Landroid/view/View;

    .line 21
    .line 22
    sget p2, Ll/ldc0;->e0:I

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 29
    .line 30
    iput-object p1, p0, Ll/o7v;->g:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 31
    .line 32
    iget-object p0, p0, Ll/o7v;->e:Landroid/view/View;

    .line 33
    .line 34
    return-object p0
.end method

.method public final synthetic k(Ll/uxr;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/o7v;->c:Ll/r0u;

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
    iget-object p0, p0, Ll/o7v;->b:Ll/j7v;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/j7v;->P2()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public m()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/o7v;->c:Ll/r0u;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public n(ZIJ)V
    .locals 0

    .line 1
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
    iget-object v0, p0, Ll/o7v;->c:Ll/r0u;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/o7v;->i()Ll/r0u;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/o7v;->c:Ll/r0u;

    .line 10
    .line 11
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/o7v;->c:Ll/r0u;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-le v0, v1, :cond_1

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Ll/o7v;->c:Ll/r0u;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/o7v;->g:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 33
    .line 34
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->a(I)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, p1, p2, p3}, Ll/o7v;->j(Ljava/util/List;ZZ)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/o7v;->c:Ll/r0u;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/v6u;->k0()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o7v;->c:Ll/r0u;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/o7v;->g:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->b()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o7v;->g:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;

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
    iget-object v0, p0, Ll/o7v;->f:Lv/VRecyclerView;

    .line 13
    .line 14
    new-instance v1, Ll/o7v$a;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/o7v$a;-><init>(Ll/o7v;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public s(Ll/xys;)V
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/o7v;->c:Ll/r0u;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/k7v;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/k7v;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/wys;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/xys;->h()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    invoke-virtual {v0}, Ll/wys;->P()J

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    cmp-long v1, v1, v3

    .line 33
    .line 34
    if-lez v1, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ll/wys;->R(Ll/xys;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/o7v;->c:Ll/r0u;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    :catch_0
    :cond_0
    return-void
.end method
