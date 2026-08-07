.class public abstract Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/uf3;",
        "A:",
        "Ll/tr2<",
        "TD;>;>",
        "Landroidx/recyclerview/widget/RecyclerView;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

.field public b:Ll/tr2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TA;"
        }
    .end annotation
.end field

.field public c:Ll/ll50;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->init()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p1, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    invoke-direct {p1}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    new-instance p1, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    invoke-direct {p1}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->init()V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->O()V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;ILjava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->N(ILjava/lang/Float;)V

    return-void
.end method

.method public static synthetic G(Landroid/view/View;FZ)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->g(FZ)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;Ll/uf3;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->M(Ll/uf3;Ll/x20;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->L(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method private init()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    .line 6
    .line 7
    new-instance v1, Ll/jg3;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/jg3;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->r(Ll/yfq;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->K()Ll/tr2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->b:Ll/tr2;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->getAdapter()Ll/tr2;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public J(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->getAdapter()Ll/tr2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tr2;->F()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/hg3;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/hg3;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->j()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->getAdapter()Ll/tr2;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2, p1}, Ll/tr2;->E(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/4 v3, 0x1

    .line 36
    if-le v2, v3, :cond_0

    .line 37
    .line 38
    new-instance v1, Ll/kg3;

    .line 39
    .line 40
    invoke-direct {v1, p0, v0, p1}, Ll/kg3;-><init>(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;Ljava/util/List;Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->R(I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public abstract K()Ll/tr2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TA;"
        }
    .end annotation
.end method

.method public final synthetic L(Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    add-int/2addr p1, p2

    .line 10
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic M(Ll/uf3;Ll/x20;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->getAdapter()Ll/tr2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/tr2;->H(Ll/uf3;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->getAdapter()Ll/tr2;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/tr2;->F()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    invoke-interface {p2}, Ll/x20;->call()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public final synthetic N(ILjava/lang/Float;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const v0, 0x3c23d70a    # 0.01f

    .line 8
    .line 9
    .line 10
    cmpl-float p1, p1, v0

    .line 11
    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    add-int/lit8 p1, p1, -0x1

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    instance-of p1, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    check-cast p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;

    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a(F)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final synthetic O()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->getAdapter()Ll/tr2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tr2;->C()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public P(Ll/uf3;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/lg3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/lg3;-><init>(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;Ll/uf3;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Q(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->q(Landroidx/recyclerview/widget/RecyclerView;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R(I)V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 2
    .line 3
    mul-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    if-le p1, v1, :cond_1

    .line 6
    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->k()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/mg3;

    .line 18
    .line 19
    invoke-direct {v0, p0, p1}, Ll/mg3;-><init>(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->Q(Ll/y20;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->c:Ll/ll50;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-interface {p0, p1}, Ll/ll50;->a(Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public bridge synthetic getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->getAdapter()Ll/tr2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getAdapter()Ll/tr2;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TA;"
        }
    .end annotation

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->b:Ll/tr2;

    return-object p0
.end method

.method public onScrolled(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->onScrolled(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->j()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->c:Ll/ll50;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    invoke-interface {p0, p1}, Ll/ll50;->a(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setBottomListener(Ll/ll50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->c:Ll/ll50;

    .line 2
    .line 3
    return-void
.end method

.method public setDataList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->getAdapter()Ll/tr2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/hg3;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/hg3;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {v0, p1}, Ll/tr2;->I(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Ll/ig3;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ll/ig3;-><init>(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method
