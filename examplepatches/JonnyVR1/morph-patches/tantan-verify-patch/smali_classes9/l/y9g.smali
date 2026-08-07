.class public Ll/y9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lag;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/lag;

.field public final b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Ll/i6g;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/i6g;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/i6g;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/y9g;->c:Ll/i6g;

    .line 10
    .line 11
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/y9g;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/y9g;->c:Ll/i6g;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    new-instance p1, Ll/y9g$a;

    .line 36
    .line 37
    invoke-direct {p1, p0}, Ll/y9g$a;-><init>(Ll/y9g;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static bridge synthetic a(Ll/y9g;)Ll/i6g;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y9g;->c:Ll/i6g;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y9g;->b:Landroidx/recyclerview/widget/RecyclerView;

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

.method public b(Ll/lag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y9g;->a:Ll/lag;

    .line 2
    .line 3
    return-void
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y9g;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y9g;->c:Ll/i6g;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/i6g;->f0(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;)Ll/dig;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/y9g;->c:Ll/i6g;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(ZLl/teg;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y9g;->c:Ll/i6g;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y9g;->a:Ll/lag;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p0}, Ll/i6g;->i0(ZLl/teg;Ll/tk2;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(Ll/teg;Ll/yhg;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y9g;->c:Ll/i6g;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y9g;->a:Ll/lag;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p0}, Ll/i6g;->g0(Ll/teg;Ll/yhg;Ll/lag;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i(Ll/mag;Ll/teg;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y9g;->c:Ll/i6g;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y9g;->a:Ll/lag;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p0}, Ll/i6g;->h0(Ll/mag;Ll/teg;Ll/tk2;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y9g;->b(Ll/lag;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
