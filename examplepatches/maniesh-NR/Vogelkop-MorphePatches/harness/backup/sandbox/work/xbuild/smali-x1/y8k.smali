.class public final Ly8k;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"

# interfaces
.implements Leak;


# instance fields
.field public final a:Lmcj;

.field public final b:Lwsf;

.field public final c:Likc;

.field public final d:Lpde;

.field public e:Z


# direct methods
.method public constructor <init>(Lmcj;Lwsf;Likc;)V
    .registers 4

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    iput-object p1, p0, Ly8k;->a:Lmcj;

    iput-object p2, p0, Ly8k;->b:Lwsf;

    iput-object p3, p0, Ly8k;->c:Likc;

    new-instance p1, Lpde;

    sget-object p2, Lkl0;->j:Lkl0;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Ly8k;->d:Lpde;

    return-void
.end method


# virtual methods
.method public final T()Likc;
    .registers 1

    iget-object p0, p0, Ly8k;->d:Lpde;

    return-object p0
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    check-cast p1, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {p1}, Lcom/opera/android/startup/WelcomeActivity;->T()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/startup/WelcomeActivity;->V(Z)V

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p1

    new-instance p2, Ln6k;

    const/4 p3, 0x6

    invoke-direct {p2, p0, p3}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance p3, Lw4i;

    const/16 v0, 0xd

    invoke-direct {p3, p2, v0}, Lw4i;-><init>(Ljava/lang/Object;B)V

    iget-object p2, p0, Ly8k;->c:Likc;

    invoke-virtual {p2, p1, p3}, Lekc;->j(Lndc;Lf7f;)V

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    new-instance p2, Lch5;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Lch5;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p3

    new-instance v0, Lkkf;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, v0}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    new-instance p3, Lssi;

    const/4 v0, 0x7

    invoke-direct {p3, p2, p1, v0}, Lssi;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2, p3}, Lkff;->a(Landroid/view/View;Ljava/lang/Runnable;)Lkff;

    invoke-virtual {p2}, Ld4;->m()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p3

    check-cast p3, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {p3}, Lcom/opera/android/startup/WelcomeActivity;->Y()V

    new-instance p3, Lg9;

    const/16 v0, 0x1b

    invoke-direct {p3, p0, p1, p2, v0}, Lg9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lue5;

    const p1, 0x57dc6009

    const/4 v0, 0x1

    invoke-direct {p0, p1, p3, v0}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {p2, p0}, Lch5;->o(Lkotlin/jvm/functions/Function2;)V

    return-object p2
.end method
