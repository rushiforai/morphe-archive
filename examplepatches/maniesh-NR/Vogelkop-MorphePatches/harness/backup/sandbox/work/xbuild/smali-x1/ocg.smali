.class public final Locg;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"

# interfaces
.implements Leak;


# instance fields
.field public final a:Lkotlin/Pair;

.field public final b:Likc;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Lkotlin/Pair;)V
    .registers 3

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    iput-object p1, p0, Locg;->a:Lkotlin/Pair;

    new-instance p1, Likc;

    sget-object v0, Lkl0;->m:Lkl0;

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Locg;->b:Likc;

    new-instance p1, Lyse;

    const/4 v0, 0x6

    invoke-direct {p1, p0, v0}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Locg;->c:Lzyk;

    return-void
.end method


# virtual methods
.method public final T()Likc;
    .registers 1

    iget-object p0, p0, Locg;->b:Likc;

    return-object p0
.end method

.method public final f0()Lzcg;
    .registers 1

    iget-object p0, p0, Locg;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzcg;

    return-object p0
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    invoke-virtual {p0}, Locg;->f0()Lzcg;

    move-result-object p1

    iget-object p1, p1, Lzcg;->g:Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {p1}, Lcom/opera/android/startup/WelcomeActivity;->T()V

    invoke-virtual {p0}, Locg;->f0()Lzcg;

    move-result-object p0

    iget-object p0, p0, Lzcg;->g:Lcom/opera/android/startup/WelcomeActivity;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/startup/WelcomeActivity;->V(Z)V

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 4

    new-instance p0, Lch5;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1}, Lch5;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    const/4 p2, -0x1

    invoke-direct {p1, p2, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Ld4;->m()V

    return-object p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    check-cast p1, Lch5;

    new-instance p2, Lmcg;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lmcg;-><init>(Locg;B)V

    new-instance p0, Lue5;

    const v0, 0x2002d41b

    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {p1, p0}, Lch5;->o(Lkotlin/jvm/functions/Function2;)V

    return-void
.end method
