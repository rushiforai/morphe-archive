.class public final Lkve;
.super Lcve;
.source "SourceFile"

# interfaces
.implements Liue;


# instance fields
.field public final h:Lx5f;

.field public final i:Lvm3;


# direct methods
.method public constructor <init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;Lx5f;)V
    .registers 8

    invoke-direct/range {p0 .. p6}, Lcve;-><init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;)V

    iput-object p7, p0, Lkve;->h:Lx5f;

    new-instance p1, Lvm3;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lvm3;-><init>(Lcve;B)V

    iput-object p1, p0, Lkve;->i:Lvm3;

    iget-object p2, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    new-instance p1, Lsp8;

    invoke-direct {p1}, Lqtj;-><init>()V

    iget-object p0, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p0}, Lsp8;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method


# virtual methods
.method public final O(Z)V
    .registers 2

    return-void
.end method

.method public final R()V
    .registers 2

    invoke-super {p0}, Lcve;->R()V

    iget-object p0, p0, Lkve;->i:Lvm3;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lvm3;->b:Z

    return-void
.end method

.method public final e0()Lnu8;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final h0(Landroid/content/Context;)V
    .registers 4

    new-instance p1, Lcom/google/android/material/carousel/CarouselLayoutManager;

    new-instance v0, Lhaa;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lhaa;-><init>(B)V

    iput v1, v0, Lhaa;->d:I

    invoke-direct {p1, v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;-><init>(Lgl4;)V

    iget-object p0, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lcve;->onDestroy()V

    iget-object v0, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p0, p0, Lkve;->i:Lvm3;

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    return-void
.end method
