.class public final Lqq4;
.super Lj83;
.source "SourceFile"


# instance fields
.field public final a:Lode;

.field public final b:Lwzg;

.field public final c:Z

.field public d:Loq4;


# direct methods
.method public constructor <init>(Lumi;[[BLwzg;Z)V
    .registers 8

    invoke-direct {p0}, Lj83;-><init>()V

    new-instance v0, Lode;

    invoke-direct {v0}, Lekc;-><init>()V

    new-instance v1, Lfh4;

    const/4 v2, 0x3

    invoke-direct {v1, v0, p2, v2}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, v1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lnml;->a(Ljava/lang/Object;)Loml;

    iput-object v0, p0, Lqq4;->a:Lode;

    iput-object p3, p0, Lqq4;->b:Lwzg;

    iput-boolean p4, p0, Lqq4;->c:Z

    return-void
.end method


# virtual methods
.method public final f0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 4

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Loq4;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Loq4;

    move-result-object p1

    iput-object p1, p0, Lqq4;->d:Loq4;

    iget-object p0, p1, Loq4;->a:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method public final onCreateAnimation(IZI)Landroid/view/animation/Animation;
    .registers 7

    iget-object v0, p0, Lqq4;->b:Lwzg;

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

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p1

    iget-object p2, p0, Lqq4;->d:Loq4;

    new-instance v0, Lnrl;

    iget-object v1, p0, Lqq4;->a:Lode;

    iget-boolean p0, p0, Lqq4;->c:Z

    invoke-direct {v0, p2, v1, p0}, Lnrl;-><init>(Loq4;Lode;Z)V

    new-instance p0, Lk9;

    const/16 p2, 0x18

    invoke-direct {p0, v0, p2}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method
