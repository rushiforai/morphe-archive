.class public Ll/j3h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/i3h0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VPullUpRecyclerView;

.field public c:Ll/i3h0;

.field public d:Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

.field public e:Ll/u2h0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j3h0;->d:Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/j3h0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/j3h0;->d:Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/j3h0;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    sget v1, Ll/dbc0;->P:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/j3h0;->a:Lv/navigationbar/VNavigationBar;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setRightIconClip(Z)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 22
    .line 23
    iget-object v1, p0, Ll/j3h0;->d:Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/j3h0$a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/j3h0$a;-><init>(Ll/j3h0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/j3h0;->b:Lv/VPullUpRecyclerView;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/j3h0;->b:Lv/VPullUpRecyclerView;

    .line 43
    .line 44
    const-wide/16 v1, 0x12c

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Lv/VPullUpRecyclerView;->setPullUpInterval(J)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Landroidx/recyclerview/widget/k;

    .line 50
    .line 51
    iget-object v1, p0, Ll/j3h0;->c:Ll/i3h0;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/i3h0;->j0()Landroidx/recyclerview/widget/k$e;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/j3h0;->b:Lv/VPullUpRecyclerView;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/j3h0;->d:Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/k3h0;->b(Ll/j3h0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/i3h0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j3h0;->c:Ll/i3h0;

    .line 2
    .line 3
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/data/CardPattern;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j3h0;->e:Ll/u2h0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/u2h0;->M(Lcom/p1/mobile/putong/core/data/CardPattern;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    if-lt p1, v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/j3h0;->e:Ll/u2h0;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/core/data/CardPattern;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j3h0;->e:Ll/u2h0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/u2h0;->N(Lcom/p1/mobile/putong/core/data/CardPattern;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    if-lt p1, v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/j3h0;->e:Ll/u2h0;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/j3h0;->e:Ll/u2h0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/u2h0;->C()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/core/data/ActionPageFormat;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j3h0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageTitle:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/j3h0;->e:Ll/u2h0;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/u2h0;

    .line 13
    .line 14
    iget-object v1, p0, Ll/j3h0;->c:Ll/i3h0;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/u2h0;-><init>(Ll/i3h0;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/j3h0;->e:Ll/u2h0;

    .line 20
    .line 21
    iget-object v1, p0, Ll/j3h0;->b:Lv/VPullUpRecyclerView;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/j3h0;->e:Ll/u2h0;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardPatterns:Ljava/util/List;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/u2h0;->O(Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/i3h0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j3h0;->b(Ll/i3h0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/j3h0;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/j3h0;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method
