.class public abstract Lbmn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:B

.field public final b:Lqln;

.field public final c:Lorm;

.field public final d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Lvkn;

.field public g:I

.field public final h:Leej;

.field public final i:Lgjm;


# direct methods
.method public constructor <init>(ILqln;Lorm;Leej;Lgjm;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lbmn;->a:B

    iput-object p2, p0, Lbmn;->b:Lqln;

    iput-object p3, p0, Lbmn;->c:Lorm;

    iput-object p4, p0, Lbmn;->h:Leej;

    iput-object p5, p0, Lbmn;->i:Lgjm;

    invoke-virtual {p2}, Lqln;->i()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lbmn;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/RecyclerView;Ljvg;)V
    .registers 10

    new-instance v0, Lvkn;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lbmn;->c(Landroid/content/Context;)Lvjn;

    move-result-object v3

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v4

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    new-instance v6, Lyln;

    invoke-direct {v6, p0, p2}, Lyln;-><init>(Lbmn;Ljvg;)V

    iget-object v1, p0, Lbmn;->b:Lqln;

    move-object v2, p1

    invoke-direct/range {v0 .. v6}, Lvkn;-><init>(Lqln;Landroidx/recyclerview/widget/RecyclerView;Ln1;IILtjn;)V

    iput-object v0, p0, Lbmn;->f:Lvkn;

    new-instance p1, Lsvk;

    const/16 p2, 0x1c

    invoke-direct {p1, p0, p2}, Lsvk;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_41

    invoke-static {p2, v2, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_41
    iget-object p1, p0, Lbmn;->f:Lvkn;

    invoke-virtual {p0}, Lbmn;->d()Ljava/util/List;

    move-result-object p0

    iget-object p2, p1, Lvkn;->a:Lujn;

    invoke-virtual {p2, p0}, Lujn;->T(Ljava/util/List;)V

    iget-object p0, p1, Lvkn;->b:Landroidx/recyclerview/widget/RecyclerView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    return-void
.end method

.method public abstract b(Landroid/content/Context;Lqf;Ljvg;)Landroid/widget/FrameLayout;
.end method

.method public c(Landroid/content/Context;)Lvjn;
    .registers 4

    new-instance p0, Lvjn;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lvjn;-><init>(Landroid/content/Context;ZZ)V

    return-object p0
.end method

.method public abstract d()Ljava/util/List;
.end method

.method public e(Ljava/lang/String;)V
    .registers 6

    iget-object v0, p0, Lbmn;->b:Lqln;

    invoke-virtual {v0}, Lqln;->i()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    iget-object v2, p0, Lbmn;->f:Lvkn;

    if-nez v2, :cond_11

    :cond_10
    return-void

    :cond_11
    if-eqz v2, :cond_19

    iget-object v2, v2, Lvkn;->f:Lplk;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lplk;->r(Ljava/lang/String;)V

    :cond_19
    iget-object v2, p0, Lbmn;->f:Lvkn;

    if-eqz v2, :cond_24

    iput-object p1, p0, Lbmn;->e:Ljava/lang/String;

    iget-object v2, v2, Lvkn;->e:Lplk;

    invoke-virtual {v2, p1}, Lplk;->r(Ljava/lang/String;)V

    :cond_24
    new-instance v2, Ls2g;

    const/16 v3, 0xd

    invoke-direct {v2, v3, p0, p1, v1}, Ls2g;-><init>(BLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p1, p0, v2}, Lqln;->l(Ljava/lang/String;ILcom/opera/api/Callback;)V

    return-void
.end method

.method public final f(Lru0;Ljava/lang/String;)V
    .registers 13

    iget-object v0, p0, Lbmn;->b:Lqln;

    invoke-virtual {v0}, Lqln;->i()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lbmn;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    const/4 v0, 0x0

    :cond_f
    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    iget-byte v4, p0, Lbmn;->a:B

    if-eqz v4, :cond_28

    if-eq v4, v3, :cond_25

    if-eq v4, v2, :cond_22

    if-eq v4, v1, :cond_1f

    sget-object v4, Ltu0;->b:Ltu0;

    goto :goto_2a

    :cond_1f
    sget-object v4, Ltu0;->f:Ltu0;

    goto :goto_2a

    :cond_22
    sget-object v4, Ltu0;->e:Ltu0;

    goto :goto_2a

    :cond_25
    sget-object v4, Ltu0;->d:Ltu0;

    goto :goto_2a

    :cond_28
    sget-object v4, Ltu0;->c:Ltu0;

    :goto_2a
    iget-object p0, p0, Lbmn;->c:Lorm;

    check-cast p0, Lx5f;

    iget-boolean v5, p0, Lx5f;->h:Z

    if-nez v5, :cond_33

    return-void

    :cond_33
    iget-object v5, p0, Lx5f;->d:Lzpa;

    new-instance v6, Lsu0;

    const/4 v7, -0x1

    const/4 v8, 0x4

    const/16 v9, 0x98b

    invoke-direct {v6, v9, v7, v8}, Ljf0;-><init>(III)V

    invoke-virtual {v6, v2, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v2, 0x0

    invoke-virtual {v6, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz v0, :cond_48

    move v2, v3

    :cond_48
    invoke-virtual {v6, v3, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p2, :cond_50

    invoke-virtual {v6, v1, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_50
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v5}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p2

    invoke-virtual {p2, v5}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p2

    const/16 v0, 0x24

    invoke-virtual {p2, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_72

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_72

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, v0, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_7b

    :cond_72
    invoke-static {p2, v0, v3}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, v0, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_7b
    invoke-virtual {v2, v6}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public g(Landroid/view/View;Lqf;)V
    .registers 4

    sget-object p1, Lru0;->d:Lru0;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lbmn;->f(Lru0;Ljava/lang/String;)V

    invoke-virtual {p2}, Ldej;->b()V

    invoke-virtual {p0}, Lbmn;->h()V

    return-void
.end method

.method public final h()V
    .registers 4

    new-instance v0, Lrkn;

    iget-byte v1, p0, Lbmn;->a:B

    if-eqz v1, :cond_15

    const/4 v2, 0x1

    if-eq v1, v2, :cond_12

    const/4 v2, 0x2

    if-eq v1, v2, :cond_f

    sget-object v1, Lvln;->c:Lvln;

    goto :goto_17

    :cond_f
    sget-object v1, Lvln;->f:Lvln;

    goto :goto_17

    :cond_12
    sget-object v1, Lvln;->e:Lvln;

    goto :goto_17

    :cond_15
    sget-object v1, Lvln;->d:Lvln;

    :goto_17
    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lrkn;-><init>(Lvln;Landroid/os/Bundle;)V

    iget-object p0, p0, Lbmn;->i:Lgjm;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void
.end method
