.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:I

.field public d:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

.field public e:Lcom/p1/mobile/putong/account/ui/camera/adapter/c;

.field public f:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->c:I

    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->g:Ljava/util/List;

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->h:Ljava/util/List;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->i(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->g(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->h(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/js;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public f(I)V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->e()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    .line 15
    .line 16
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;-><init>(I)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/account/ui/camera/adapter/c;

    .line 22
    .line 23
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/c;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->e:Lcom/p1/mobile/putong/account/ui/camera/adapter/c;

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->e:Lcom/p1/mobile/putong/account/ui/camera/adapter/c;

    .line 34
    .line 35
    new-instance v0, Ll/gs;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/gs;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/adapter/c;->U(Ll/a30;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    .line 44
    .line 45
    new-instance v0, Ll/hs;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/hs;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->K(Ll/a30;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->f:Ll/a30;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->f:Ll/a30;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public getCurrentItem()Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->G()Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->f:Ll/a30;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->f:Ll/a30;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic i(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-ne v0, p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->q(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public j(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->h:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->h:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public k(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public l()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final m(IIZ)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->L(I)V

    .line 6
    .line 7
    .line 8
    if-ltz p2, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public n(IZI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->e:Lcom/p1/mobile/putong/account/ui/camera/adapter/c;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->e:Lcom/p1/mobile/putong/account/ui/camera/adapter/c;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->e()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->h:Ljava/util/List;

    .line 18
    .line 19
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/account/ui/camera/adapter/c;->W(Landroid/content/Context;Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    .line 29
    .line 30
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->J(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->e()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->h:Ljava/util/List;

    .line 40
    .line 41
    invoke-virtual {p1, v0, v1, p2}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->M(Landroid/content/Context;Ljava/util/List;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 45
    .line 46
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 47
    .line 48
    .line 49
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->X()Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->j()Ll/s120;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->e()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    new-instance p3, Ll/is;

    .line 66
    .line 67
    invoke-direct {p3, p0}, Ll/is;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, p2, p3}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public o(II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    if-eq v0, v2, :cond_1

    .line 18
    .line 19
    const/4 p2, 0x3

    .line 20
    if-eq v0, p2, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->p(II)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p0, p1, p2, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->m(IIZ)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->e:Lcom/p1/mobile/putong/account/ui/camera/adapter/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/c;->V(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "\u6ee4\u955c\u8d44\u6e90\u6b63\u5728\u52a0\u8f7d\u4e2d..."

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final q(I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->O()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->o(II)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->L()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->o(II)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->A()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->o(II)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->w()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->o(II)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public setOnItemClicked(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;->f:Ll/a30;

    .line 2
    .line 3
    return-void
.end method
