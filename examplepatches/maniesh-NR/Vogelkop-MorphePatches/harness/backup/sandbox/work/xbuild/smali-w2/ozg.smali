.class public final Lozg;
.super Lj83;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lp0h;

.field public final c:Lwzg;

.field public final d:Lx5f;

.field public final e:Z

.field public f:Lor2;


# direct methods
.method public constructor <init>(Lumi;Lp0h;Lwzg;Lx5f;Z)V
    .registers 6

    invoke-direct {p0}, Lj83;-><init>()V

    iput-object p1, p0, Lozg;->a:Lumi;

    iput-object p2, p0, Lozg;->b:Lp0h;

    iput-object p3, p0, Lozg;->c:Lwzg;

    iput-object p4, p0, Lozg;->d:Lx5f;

    iput-boolean p5, p0, Lozg;->e:Z

    return-void
.end method


# virtual methods
.method public final f0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11

    const v0, 0x7f0d034a

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a038a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/FrameLayout;

    if-eqz v3, :cond_45

    const p2, 0x7f0a056b

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_45

    const p2, 0x7f0a0898

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/widget/FrameLayout;

    if-eqz v5, :cond_45

    const p2, 0x7f0a0ce2

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_45

    new-instance v1, Lor2;

    move-object v2, p1

    check-cast v2, Landroid/widget/LinearLayout;

    const/16 v7, 0x17

    invoke-direct/range {v1 .. v7}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lozg;->f:Lor2;

    return-object v2

    :cond_45
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final h0([[BLandroid/widget/TextView;)V
    .registers 6

    if-eqz p1, :cond_1b

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lphj;->D0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lnzg;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, p2, v2}, Lnzg;-><init>(Lozg;[[BLandroid/widget/TextView;B)V

    invoke-static {p2, v0, v1}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    :cond_1b
    return-void
.end method

.method public final onCreateAnimation(IZI)Landroid/view/animation/Animation;
    .registers 7

    iget-object v0, p0, Lozg;->c:Lwzg;

    if-eqz p2, :cond_27

    iget-object v1, v0, Lwzg;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v2}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v2

    iget-object v0, v0, Lwzg;->c:Ljava/lang/Object;

    check-cast v0, Lkze;

    if-eqz v2, :cond_1d

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_47

    :cond_1d
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_47

    :cond_27
    iget-object v1, v0, Lwzg;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v2

    iget-object v0, v0, Lwzg;->c:Ljava/lang/Object;

    check-cast v0, Lkze;

    if-eqz v2, :cond_3e

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_47

    :cond_3e
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    :goto_47
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onCreateAnimation(IZI)Landroid/view/animation/Animation;

    move-result-object p0

    return-object p0
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lozg;->f:Lor2;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lozg;->b:Lp0h;

    iget-object p1, p1, Lp0h;->f:Lkze;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    new-instance v0, Ld8d;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, v1}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method
