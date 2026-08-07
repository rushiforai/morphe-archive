.class public Ll/vbd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/tbd0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Landroidx/recyclerview/widget/RecyclerView;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Lv/VButton;

.field public g:Landroidx/constraintlayout/widget/Group;

.field public final h:Lcom/p1/mobile/android/app/Act;

.field public i:Ll/tbd0;

.field public j:Ll/cbd0;

.field public k:Landroidx/recyclerview/widget/GridLayoutManager;

.field public final l:Ll/j9d0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vbd0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/vbd0$a;-><init>(Ll/vbd0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/vbd0;->l:Ll/j9d0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/vbd0;->h:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/vbd0;Ll/d9d0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vbd0;->l(Ll/d9d0;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/vbd0;)Ll/cbd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vbd0;->j:Ll/cbd0;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/vbd0;)Ll/tbd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vbd0;->i:Ll/tbd0;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/vbd0;Ll/d9d0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vbd0;->n(Ll/d9d0;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vbd0;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

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

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/wbd0;->b(Ll/vbd0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/tbd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vbd0;->i:Ll/tbd0;

    .line 2
    .line 3
    return-void
.end method

.method public i(Z)Ll/dbd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vbd0;->j:Ll/cbd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0, p1}, Ll/v9d0;->o(Ljava/util/List;Z)Ll/dbd0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/tbd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vbd0;->f(Ll/tbd0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vbd0;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vbd0;->g:Landroidx/constraintlayout/widget/Group;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vbd0;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/vbd0;->h:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/vbd0;->b:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/vbd0;->C0()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->getManageTitle(Landroid/content/Context;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 22
    .line 23
    iget-object v0, p0, Ll/vbd0;->h:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/vbd0;->k:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 30
    .line 31
    iget-object v0, p0, Ll/vbd0;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Ll/cbd0;

    .line 37
    .line 38
    invoke-direct {p1}, Ll/cbd0;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Ll/vbd0;->j:Ll/cbd0;

    .line 42
    .line 43
    iget-object p0, p0, Ll/vbd0;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic l(Ll/d9d0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vbd0;->i:Ll/tbd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tbd0;->u0(Ll/d9d0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vbd0;->l:Ll/j9d0;

    .line 2
    .line 3
    invoke-static {p1, p2, v0, p3}, Ll/v9d0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ll/j9d0;Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p2, p0, Ll/vbd0;->k:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 8
    .line 9
    new-instance p3, Ll/vbd0$b;

    .line 10
    .line 11
    invoke-direct {p3, p0}, Ll/vbd0$b;-><init>(Ll/vbd0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/vbd0;->j:Ll/cbd0;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/cbd0;->l0(Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final n(Ll/d9d0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/d9d0;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/vbd0;->g:Landroidx/constraintlayout/widget/Group;

    .line 9
    .line 10
    iget-boolean v1, p1, Ll/e9d0;->b:Z

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->R0:I

    .line 16
    .line 17
    iget-object v1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isEquipped()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->q1:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object v1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->canActive()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->K0:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    iget-object v1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isActive()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->R0:I

    .line 48
    .line 49
    :cond_3
    :goto_0
    iget-object v1, p0, Ll/vbd0;->f:Lv/VButton;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/vbd0;->f:Lv/VButton;

    .line 55
    .line 56
    new-instance v1, Ll/ubd0;

    .line 57
    .line 58
    invoke-direct {v1, p0, p1}, Ll/ubd0;-><init>(Ll/vbd0;Ll/d9d0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public p(Ll/ycd0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vbd0;->j:Ll/cbd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cbd0;->m0(Ll/ycd0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
