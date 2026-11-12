.class public abstract Lbud;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Menu;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/ArrayList;

.field public c:Leog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lbud;->b:Ljava/util/ArrayList;

    iput-object p1, p0, Lbud;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(IIILjava/lang/CharSequence;)Lqtd;
    .registers 11

    new-instance v0, Lqtd;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lqtd;-><init>(Lbud;IIILjava/lang/CharSequence;)V

    invoke-virtual {v1, v2, v4, v0}, Lbud;->b(IILqtd;)V

    return-object v0
.end method

.method public final add(I)Landroid/view/MenuItem;
    .registers 4

    iget-object v0, p0, Lbud;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1, p1}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object p0

    return-object p0
.end method

.method public final add(IIII)Landroid/view/MenuItem;
    .registers 6

    .line 19
    iget-object v0, p0, Lbud;->a:Landroid/content/Context;

    .line 20
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p4

    .line 21
    invoke-virtual {p0, p1, p2, p3, p4}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object p0

    return-object p0
.end method

.method public final add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 5

    .line 17
    invoke-virtual {p0, p1, p2, p3, p4}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object p0

    return-object p0
.end method

.method public final add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 18
    invoke-virtual {p0, v0, v1, v1, p1}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object p0

    return-object p0
.end method

.method public final addIntentOptions(IIILandroid/content/ComponentName;[Landroid/content/Intent;Landroid/content/Intent;I[Landroid/view/MenuItem;)I
    .registers 9

    const/4 p0, 0x0

    return p0
.end method

.method public final addSubMenu(I)Landroid/view/SubMenu;
    .registers 4

    iget-object v0, p0, Lbud;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1, p1}, Lbud;->c(IIILjava/lang/CharSequence;)Lbkk;

    move-result-object p0

    return-object p0
.end method

.method public final addSubMenu(IIII)Landroid/view/SubMenu;
    .registers 6

    .line 19
    iget-object v0, p0, Lbud;->a:Landroid/content/Context;

    .line 20
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p1, p2, p3, p4}, Lbud;->c(IIILjava/lang/CharSequence;)Lbkk;

    move-result-object p0

    return-object p0
.end method

.method public final addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 5

    .line 17
    invoke-virtual {p0, p1, p2, p3, p4}, Lbud;->c(IIILjava/lang/CharSequence;)Lbkk;

    move-result-object p0

    return-object p0
.end method

.method public final addSubMenu(Ljava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 18
    invoke-virtual {p0, v0, v1, v1, p1}, Lbud;->c(IIILjava/lang/CharSequence;)Lbkk;

    move-result-object p0

    return-object p0
.end method

.method public final b(IILqtd;)V
    .registers 8

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_1b

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/MenuItem;

    invoke-interface {v3}, Landroid/view/MenuItem;->getGroupId()I

    move-result v3

    if-ne v3, p1, :cond_18

    move v0, v1

    goto :goto_1b

    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1b
    :goto_1b
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v0, p1, :cond_30

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/MenuItem;->getOrder()I

    move-result p1

    if-lt p2, p1, :cond_30

    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    :cond_30
    invoke-virtual {v2, v0, p3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lbud;->d(Z)V

    return-void
.end method

.method public final c(IIILjava/lang/CharSequence;)Lbkk;
    .registers 11

    new-instance v0, Lbkk;

    iget-object v1, p0, Lbud;->a:Landroid/content/Context;

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lbkk;-><init>(Landroid/content/Context;IIILjava/lang/CharSequence;)V

    iget-object p1, v0, Lbkk;->d:Lqtd;

    invoke-virtual {p0, v2, v4, p1}, Lbud;->b(IILqtd;)V

    return-object v0
.end method

.method public final clear()V
    .registers 2

    iget-object v0, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lbud;->d(Z)V

    return-void
.end method

.method public final close()V
    .registers 2

    iget-object p0, p0, Lbud;->c:Leog;

    if-eqz p0, :cond_b

    iget-object v0, p0, Leog;->f:Landroid/view/View;

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    :cond_b
    return-void
.end method

.method public final d(Z)V
    .registers 9

    iget-object v0, p0, Lbud;->c:Leog;

    if-eqz v0, :cond_ae

    iget-object v1, v0, Leog;->f:Landroid/view/View;

    if-eqz v1, :cond_ae

    const/4 v1, 0x0

    iget-object p0, p0, Lbud;->b:Ljava/util/ArrayList;

    if-eqz p1, :cond_89

    iget-object p1, v0, Leog;->g:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    move v2, v1

    :cond_17
    :goto_17
    if-ge v2, p1, :cond_ae

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Landroid/view/MenuItem;

    invoke-interface {v3}, Landroid/view/MenuItem;->isVisible()Z

    move-result v4

    if-eqz v4, :cond_17

    iget-object v4, v0, Leog;->e:Landroid/view/LayoutInflater;

    const v5, 0x7f0d0317

    iget-object v6, v0, Leog;->g:Landroid/view/ViewGroup;

    invoke-virtual {v4, v5, v6, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-interface {v3}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    if-eqz v5, :cond_4e

    new-instance v5, Lplf;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v4, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->y(Luup;)V

    invoke-interface {v3}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    new-instance v6, Lmxh;

    invoke-direct {v6, v5}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v6}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->v(Lb8h;)V

    :cond_4e
    invoke-interface {v3}, Landroid/view/MenuItem;->getItemId()I

    move-result v5

    invoke-virtual {v4, v5}, Landroidx/constraintlayout/widget/ConstraintLayout;->setId(I)V

    invoke-static {v4, v3}, Leog;->k0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/MenuItem;)V

    invoke-interface {v3}, Landroid/view/MenuItem;->isCheckable()Z

    move-result v5

    if-eqz v5, :cond_76

    new-instance v5, Lbmf;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v4, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B(Li41;)V

    invoke-interface {v3}, Landroid/view/MenuItem;->isChecked()Z

    move-result v5

    invoke-virtual {v4, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance v5, Lmgf;

    const/4 v6, 0x7

    invoke-direct {v5, v0, v3, v6}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v5, v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    goto :goto_7b

    :cond_76
    sget-object v5, Lamf;->l:Lamf;

    invoke-virtual {v4, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B(Li41;)V

    :goto_7b
    new-instance v5, Lwke;

    invoke-direct {v5, v0, v3}, Lwke;-><init>(Leog;Landroid/view/MenuItem;)V

    invoke-virtual {v4, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, v0, Leog;->g:Landroid/view/ViewGroup;

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_17

    :cond_89
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_8d
    if-ge v1, p1, :cond_ae

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Landroid/view/MenuItem;

    iget-object v3, v0, Leog;->g:Landroid/view/ViewGroup;

    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {v3, v2}, Leog;->k0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/MenuItem;)V

    invoke-interface {v2}, Landroid/view/MenuItem;->isChecked()Z

    move-result v2

    invoke-virtual {v3, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    goto :goto_8d

    :cond_ae
    return-void
.end method

.method public final findItem(I)Landroid/view/MenuItem;
    .registers 6

    iget-object p0, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_7
    if-ge v1, v0, :cond_18

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Landroid/view/MenuItem;

    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    if-ne v3, p1, :cond_7

    return-object v2

    :cond_18
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getItem(I)Landroid/view/MenuItem;
    .registers 3

    if-ltz p1, :cond_11

    iget-object p0, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_11

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/MenuItem;

    return-object p0

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method

.method public final hasVisibleItems()Z
    .registers 4

    iget-object p0, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_7
    if-ge v1, v0, :cond_17

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Landroid/view/MenuItem;

    invoke-interface {v2}, Landroid/view/MenuItem;->isVisible()Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_17
    const/4 p0, 0x1

    return p0
.end method

.method public final isShortcutKey(ILandroid/view/KeyEvent;)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method

.method public final performIdentifierAction(II)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method

.method public final performShortcut(ILandroid/view/KeyEvent;I)Z
    .registers 4

    const/4 p0, 0x0

    return p0
.end method

.method public final removeGroup(I)V
    .registers 4

    iget-object v0, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getGroupId()I

    move-result v1

    if-ne v1, p1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_6

    :cond_1c
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lbud;->d(Z)V

    return-void
.end method

.method public final removeItem(I)V
    .registers 3

    invoke-virtual {p0, p1}, Lbud;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-nez p1, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lbud;->d(Z)V

    return-void
.end method

.method public final setGroupCheckable(IZZ)V
    .registers 10

    iget-object p0, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_8
    :goto_8
    if-ge v2, v0, :cond_28

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Landroid/view/MenuItem;

    check-cast v3, Lqtd;

    iget v4, v3, Lqtd;->b:I

    if-ne v4, p1, :cond_8

    iget v4, v3, Lqtd;->l:I

    and-int/lit8 v4, v4, -0x5

    if-eqz p3, :cond_20

    const/4 v5, 0x4

    goto :goto_21

    :cond_20
    move v5, v1

    :goto_21
    or-int/2addr v4, v5

    iput v4, v3, Lqtd;->l:I

    invoke-virtual {v3, p2}, Lqtd;->setCheckable(Z)Landroid/view/MenuItem;

    goto :goto_8

    :cond_28
    return-void
.end method

.method public final setGroupEnabled(IZ)V
    .registers 7

    iget-object p0, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_7
    :goto_7
    if-ge v1, v0, :cond_1b

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Landroid/view/MenuItem;

    invoke-interface {v2}, Landroid/view/MenuItem;->getGroupId()I

    move-result v3

    if-ne v3, p1, :cond_7

    invoke-interface {v2, p2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_7

    :cond_1b
    return-void
.end method

.method public final setGroupVisible(IZ)V
    .registers 7

    iget-object p0, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_7
    :goto_7
    if-ge v1, v0, :cond_1b

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Landroid/view/MenuItem;

    invoke-interface {v2}, Landroid/view/MenuItem;->getGroupId()I

    move-result v3

    if-ne v3, p1, :cond_7

    invoke-interface {v2, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_7

    :cond_1b
    return-void
.end method

.method public final setQwertyMode(Z)V
    .registers 2

    return-void
.end method

.method public final size()I
    .registers 1

    iget-object p0, p0, Lbud;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method
