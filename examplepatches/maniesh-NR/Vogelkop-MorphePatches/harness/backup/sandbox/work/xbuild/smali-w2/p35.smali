.class public Lp35;
.super Llj;
.source "SourceFile"


# instance fields
.field public final r:Ljava/util/ArrayList;

.field public final s:Ls9;

.field public t:Landroid/view/ViewGroup;

.field public u:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public v:Lcom/opera/android/settings/SettingsManager;

.field public w:Lac1;

.field public x:Lcom/opera/android/ui/catalog/widget/OperaListItem;


# direct methods
.method public constructor <init>()V
    .registers 3

    const v0, 0x7f140fa3

    const v1, 0x7f100011

    invoke-direct {p0, v0, v1}, Llj;-><init>(II)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lp35;->r:Ljava/util/ArrayList;

    new-instance v0, Ls9;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lp35;->s:Ls9;

    return-void
.end method


# virtual methods
.method public final G0()V
    .registers 12

    iget-object v0, p0, Lp35;->v:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "exit_dialog_enabled"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const-class v1, La35;

    invoke-static {v1}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-static {v1}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v1

    iget-object v3, p0, Lp35;->r:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    move v6, v5

    :goto_1a
    if-ge v6, v4, :cond_38

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Lo35;

    iget-object v8, v7, Lo35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v8}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v8

    iget-object v7, v7, Lo35;->a:Lr25;

    iget-object v7, v7, Lr25;->e:La35;

    if-eqz v8, :cond_34

    invoke-virtual {v2, v7}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    :cond_34
    invoke-virtual {v1, v7}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    :cond_38
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-boolean v3, p0, Lx5f;->h:Z

    if-nez v3, :cond_4f

    return-void

    :cond_4f
    iget-object v3, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v3}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v3

    const/16 v6, 0x3e

    invoke-virtual {v3, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lm90;

    const/4 v8, 0x1

    if-nez v7, :cond_77

    new-instance v7, Lm90;

    const/16 v9, 0x98b

    const/16 v10, 0xa

    invoke-direct {v7, v9, v8, v10}, Ljf0;-><init>(III)V

    invoke-virtual {v3, v6, v8, v7}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v3, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Lm90;

    :cond_77
    invoke-virtual {v7, v5, v8, v0}, Ljf0;->r(IIZ)V

    invoke-virtual {v2}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_92

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La35;

    invoke-static {v2}, Lp37;->v(La35;)I

    move-result v2

    invoke-virtual {v7, v2, v8, v8}, Ljf0;->r(IIZ)V

    goto :goto_7e

    :cond_92
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_96
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_aa

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La35;

    invoke-static {v1}, Lp37;->v(La35;)I

    move-result v1

    invoke-virtual {v7, v1, v8, v5}, Ljf0;->r(IIZ)V

    goto :goto_96

    :cond_aa
    invoke-virtual {p0, v4}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final H0()V
    .registers 5

    iget-object v0, p0, Lp35;->x:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v0, :cond_9

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_9
    iget-object p0, p0, Lp35;->r:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_11
    if-ge v2, v0, :cond_21

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lo35;

    iget-object v3, v3, Lo35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_11

    :cond_21
    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    iget-object v0, p0, Lp35;->v:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lp35;->s:Ls9;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    iget-object p0, p0, Lp35;->w:Lac1;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    iget-object v0, p0, Lac1;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-ne p1, v0, :cond_22

    iget p1, p0, Lac1;->b:I

    iget-object p0, p0, Lac1;->d:Ljava/lang/Object;

    check-cast p0, Li35;

    if-nez p1, :cond_1f

    invoke-interface {p0}, Li35;->a0()V

    goto :goto_22

    :cond_1f
    invoke-interface {p0}, Li35;->l()V

    :cond_22
    :goto_22
    const/4 p0, 0x1

    return p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lp35;->v:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lp35;->s:Ls9;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 7

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    iput-object v0, p0, Lp35;->v:Lcom/opera/android/settings/SettingsManager;

    const v0, 0x7f0d0382

    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    const v0, 0x7f0a0417

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/FadingScrollView;

    const v1, 0x7f0a0a5f

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/SideMarginContainer;

    const v2, 0x7f0a0108

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lp35;->t:Landroid/view/ViewGroup;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Luk6;

    const/16 v3, 0x14

    invoke-direct {v2, v0, v3}, Luk6;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v1, Lcom/opera/android/custom_views/SideMarginContainer;->a:Luk6;

    const v0, 0x7f0a0b0f

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p2, p0, Lp35;->u:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p2

    check-cast p2, Lcom/opera/android/BrowserActivity;

    new-instance v0, Lwx;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, p1, v1}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/BrowserActivity;->m1(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 5

    new-instance p1, Lac1;

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v1, Lwth;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v2}, Lwth;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0, v1}, Lac1;-><init>(Landroidx/appcompat/widget/Toolbar;Li35;)V

    iput-object p1, p0, Lp35;->w:Lac1;

    return-void
.end method
