.class public Ll/u8j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/s8j0;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public b:Lv/VRecyclerView;

.field public c:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

.field public d:Ll/s8j0;

.field public e:Lcom/p1/mobile/putong/app/PutongAct;

.field public f:Ll/i6;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/i6<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u8j0;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/u8j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/u8j0;->i()V

    return-void
.end method

.method private f()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u8j0;->f:Ll/i6;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i6;->C()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private synthetic i()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u8j0;->d:Ll/s8j0;

    .line 2
    .line 3
    const-string v0, "suggest"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/s8j0;->y0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/u8j0;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/v8j0;->b(Ll/u8j0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/s8j0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/u8j0;->d:Ll/s8j0;

    .line 2
    .line 3
    return-void
.end method

.method public d()Ll/i6;
    .locals 3

    .line 1
    new-instance v0, Ll/h8j0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/u8j0;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    iget-object v2, p0, Ll/u8j0;->d:Ll/s8j0;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/h8j0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ll/s8j0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/u8j0;->f:Ll/i6;

    .line 11
    .line 12
    return-object v0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u8j0;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/u8j0;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/s8j0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u8j0;->c(Ll/s8j0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u8j0;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    invoke-direct {p0}, Ll/u8j0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/u8j0;->p()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/u8j0;->q()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u8j0;->f:Ll/i6;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ll/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u8j0;->f:Ll/i6;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/i6;->H(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/u8j0;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->i()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/u8j0;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/u8j0;->j()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u8j0;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u8j0;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u8j0;->b:Lv/VRecyclerView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/u8j0;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u8j0;->b:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/u8j0;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/u8j0;->b:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u8j0;->d()Ll/i6;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/u8j0;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 13
    .line 14
    iget-object v1, p0, Ll/u8j0;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->d4:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/u8j0;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 26
    .line 27
    new-instance v1, Ll/t8j0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/t8j0;-><init>(Ll/u8j0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/u8j0;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 36
    .line 37
    sget v0, Ll/k9c0;->k0:I

    .line 38
    .line 39
    sget v1, Ll/k9c0;->h0:I

    .line 40
    .line 41
    sget v2, Ll/k9c0;->i0:I

    .line 42
    .line 43
    sget v3, Ll/k9c0;->j0:I

    .line 44
    .line 45
    filled-new-array {v0, v1, v2, v3}, [I

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
