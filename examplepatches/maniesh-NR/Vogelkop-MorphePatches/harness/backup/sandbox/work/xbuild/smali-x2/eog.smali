.class public Leog;
.super Luim;
.source "SourceFile"


# instance fields
.field public d:Lps5;

.field public e:Landroid/view/LayoutInflater;

.field public f:Landroid/view/View;

.field public g:Landroid/view/ViewGroup;

.field public h:Landroid/view/MenuItem$OnMenuItemClickListener;


# direct methods
.method public static i0(Landroid/content/Context;)Lpyc;
    .registers 3

    new-instance v0, Leog;

    invoke-direct {v0}, Luim;-><init>()V

    new-instance v1, Lps5;

    invoke-direct {v1, p0}, Lbud;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Leog;->d:Lps5;

    iput-object v0, v1, Lbud;->c:Leog;

    iput-object v0, v1, Lps5;->e:Leog;

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroidx/fragment/app/Fragment;->setRetainInstance(Z)V

    new-instance p0, Lpyc;

    invoke-direct {p0, v0}, Ltim;-><init>(Luim;)V

    return-object p0
.end method

.method public static k0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/MenuItem;)V
    .registers 5

    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    new-instance v0, Lqxh;

    invoke-direct {v0, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    new-instance v0, Lqxh;

    invoke-direct {v0, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    return-void

    :cond_34
    new-instance v0, Lqxh;

    invoke-direct {v0, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    return-void
.end method


# virtual methods
.method public final getTheme()I
    .registers 1

    const p0, 0x7f15028e

    return p0
.end method

.method public final j0(Lqtd;)V
    .registers 5

    iget-object v0, p1, Lqtd;->k:Landroid/view/MenuItem$OnMenuItemClickListener;

    const/4 v1, 0x1

    if-eqz v0, :cond_d

    invoke-interface {v0, p1}, Landroid/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_d

    move v0, v1

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    iget-object v2, p0, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    if-eqz v2, :cond_18

    invoke-interface {v2, p1}, Landroid/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p1

    if-nez p1, :cond_19

    :cond_18
    move v1, v0

    :cond_19
    if-eqz v1, :cond_24

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_24

    invoke-virtual {p0}, Luim;->h0()V

    :cond_24
    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 5

    iput-object p1, p0, Leog;->e:Landroid/view/LayoutInflater;

    const p3, 0x7f0d0316

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Leog;->f:Landroid/view/View;

    const p2, 0x7f0a0687

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Leog;->g:Landroid/view/ViewGroup;

    iget-object p1, p0, Leog;->d:Lps5;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lbud;->d(Z)V

    invoke-virtual {p1}, Lps5;->e()V

    iget-object p0, p0, Leog;->f:Landroid/view/View;

    return-object p0
.end method
