.class public final Lh/p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt/a;


# instance fields
.field public A:Lh/q;

.field public B:Landroid/view/MenuItem$OnActionExpandListener;

.field public C:Z

.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public e:Ljava/lang/CharSequence;

.field public f:Ljava/lang/CharSequence;

.field public g:Landroid/content/Intent;

.field public h:C

.field public i:I

.field public j:C

.field public k:I

.field public l:Landroid/graphics/drawable/Drawable;

.field public m:I

.field public final n:Lh/n;

.field public o:Lh/F;

.field public p:Landroid/view/MenuItem$OnMenuItemClickListener;

.field public q:Ljava/lang/CharSequence;

.field public r:Ljava/lang/CharSequence;

.field public s:Landroid/content/res/ColorStateList;

.field public t:Landroid/graphics/PorterDuff$Mode;

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:I

.field public y:I

.field public z:Landroid/view/View;


# direct methods
.method public constructor <init>(Lh/n;IIIILjava/lang/CharSequence;I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x1000

    iput v0, p0, Lh/p;->i:I

    iput v0, p0, Lh/p;->k:I

    const/4 v0, 0x0

    iput v0, p0, Lh/p;->m:I

    const/4 v1, 0x0

    iput-object v1, p0, Lh/p;->s:Landroid/content/res/ColorStateList;

    iput-object v1, p0, Lh/p;->t:Landroid/graphics/PorterDuff$Mode;

    iput-boolean v0, p0, Lh/p;->u:Z

    iput-boolean v0, p0, Lh/p;->v:Z

    iput-boolean v0, p0, Lh/p;->w:Z

    const/16 v1, 0x10

    iput v1, p0, Lh/p;->x:I

    iput-boolean v0, p0, Lh/p;->C:Z

    iput-object p1, p0, Lh/p;->n:Lh/n;

    iput p3, p0, Lh/p;->a:I

    iput p2, p0, Lh/p;->b:I

    iput p4, p0, Lh/p;->c:I

    iput p5, p0, Lh/p;->d:I

    iput-object p6, p0, Lh/p;->e:Ljava/lang/CharSequence;

    iput p7, p0, Lh/p;->y:I

    return-void
.end method

.method public static c(Ljava/lang/StringBuilder;IILjava/lang/String;)V
    .locals 0

    and-int/2addr p1, p2

    if-ne p1, p2, :cond_0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    return-void
.end method


# virtual methods
.method public final a()Lh/q;
    .locals 1

    iget-object v0, p0, Lh/p;->A:Lh/q;

    return-object v0
.end method

.method public final b(Lh/q;)Lt/a;
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lh/p;->z:Landroid/view/View;

    iput-object p1, p0, Lh/p;->A:Lh/q;

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    iget-object p1, p0, Lh/p;->A:Lh/q;

    if-eqz p1, :cond_0

    new-instance v0, LC/j;

    const/16 v1, 0xf

    invoke-direct {v0, v1, p0}, LC/j;-><init>(ILjava/lang/Object;)V

    iput-object v0, p1, Lh/q;->a:LC/j;

    iget-object v0, p1, Lh/q;->b:Landroid/view/ActionProvider;

    invoke-virtual {v0, p1}, Landroid/view/ActionProvider;->setVisibilityListener(Landroid/view/ActionProvider$VisibilityListener;)V

    :cond_0
    return-object p0
.end method

.method public final collapseActionView()Z
    .locals 2

    iget v0, p0, Lh/p;->y:I

    and-int/lit8 v0, v0, 0x8

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lh/p;->z:Landroid/view/View;

    if-nez v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    iget-object v0, p0, Lh/p;->B:Landroid/view/MenuItem$OnActionExpandListener;

    if-eqz v0, :cond_3

    invoke-interface {v0, p0}, Landroid/view/MenuItem$OnActionExpandListener;->onMenuItemActionCollapse(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    :goto_0
    iget-object v0, p0, Lh/p;->n:Lh/n;

    invoke-virtual {v0, p0}, Lh/n;->d(Lh/p;)Z

    move-result v0

    return v0
.end method

.method public final d(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 1

    if-eqz p1, :cond_3

    iget-boolean v0, p0, Lh/p;->w:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lh/p;->u:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lh/p;->v:Z

    if-eqz v0, :cond_3

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-boolean v0, p0, Lh/p;->u:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lh/p;->s:Landroid/content/res/ColorStateList;

    invoke-static {p1, v0}, Ls/a;->h(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_1
    iget-boolean v0, p0, Lh/p;->v:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lh/p;->t:Landroid/graphics/PorterDuff$Mode;

    invoke-static {p1, v0}, Ls/a;->i(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lh/p;->w:Z

    :cond_3
    return-object p1
.end method

.method public final e()Z
    .locals 2

    iget v0, p0, Lh/p;->y:I

    and-int/lit8 v0, v0, 0x8

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lh/p;->z:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lh/p;->A:Lh/q;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lh/q;->b:Landroid/view/ActionProvider;

    invoke-virtual {v0, p0}, Landroid/view/ActionProvider;->onCreateActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lh/p;->z:Landroid/view/View;

    :cond_0
    iget-object v0, p0, Lh/p;->z:Landroid/view/View;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    return v1
.end method

.method public final expandActionView()Z
    .locals 1

    invoke-virtual {p0}, Lh/p;->e()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lh/p;->B:Landroid/view/MenuItem$OnActionExpandListener;

    if-eqz v0, :cond_2

    invoke-interface {v0, p0}, Landroid/view/MenuItem$OnActionExpandListener;->onMenuItemActionExpand(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0

    :cond_2
    :goto_1
    iget-object v0, p0, Lh/p;->n:Lh/n;

    invoke-virtual {v0, p0}, Lh/n;->f(Lh/p;)Z

    move-result v0

    return v0
.end method

.method public final f(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget p1, p0, Lh/p;->x:I

    or-int/lit8 p1, p1, 0x20

    iput p1, p0, Lh/p;->x:I

    return-void

    :cond_0
    iget p1, p0, Lh/p;->x:I

    and-int/lit8 p1, p1, -0x21

    iput p1, p0, Lh/p;->x:I

    return-void
.end method

.method public final getActionProvider()Landroid/view/ActionProvider;
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This is not supported, use MenuItemCompat.getActionProvider()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getActionView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lh/p;->z:Landroid/view/View;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    iget-object v0, p0, Lh/p;->A:Lh/q;

    if-eqz v0, :cond_1

    iget-object v0, v0, Lh/q;->b:Landroid/view/ActionProvider;

    invoke-virtual {v0, p0}, Landroid/view/ActionProvider;->onCreateActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lh/p;->z:Landroid/view/View;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getAlphabeticModifiers()I
    .locals 1

    iget v0, p0, Lh/p;->k:I

    return v0
.end method

.method public final getAlphabeticShortcut()C
    .locals 1

    iget-char v0, p0, Lh/p;->j:C

    return v0
.end method

.method public final getContentDescription()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Lh/p;->q:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public final getGroupId()I
    .locals 1

    iget v0, p0, Lh/p;->b:I

    return v0
.end method

.method public final getIcon()Landroid/graphics/drawable/Drawable;
    .locals 2

    iget-object v0, p0, Lh/p;->l:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Lh/p;->d(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    :cond_0
    iget v0, p0, Lh/p;->m:I

    if-eqz v0, :cond_1

    iget-object v1, p0, Lh/p;->n:Lh/n;

    iget-object v1, v1, Lh/n;->a:Landroid/content/Context;

    invoke-static {v1, v0}, LD/g;->s(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    iput v1, p0, Lh/p;->m:I

    iput-object v0, p0, Lh/p;->l:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lh/p;->d(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getIconTintList()Landroid/content/res/ColorStateList;
    .locals 1

    iget-object v0, p0, Lh/p;->s:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public final getIconTintMode()Landroid/graphics/PorterDuff$Mode;
    .locals 1

    iget-object v0, p0, Lh/p;->t:Landroid/graphics/PorterDuff$Mode;

    return-object v0
.end method

.method public final getIntent()Landroid/content/Intent;
    .locals 1

    iget-object v0, p0, Lh/p;->g:Landroid/content/Intent;

    return-object v0
.end method

.method public final getItemId()I
    .locals 1

    iget v0, p0, Lh/p;->a:I

    return v0
.end method

.method public final getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public final getNumericModifiers()I
    .locals 1

    iget v0, p0, Lh/p;->i:I

    return v0
.end method

.method public final getNumericShortcut()C
    .locals 1

    iget-char v0, p0, Lh/p;->h:C

    return v0
.end method

.method public final getOrder()I
    .locals 1

    iget v0, p0, Lh/p;->c:I

    return v0
.end method

.method public final getSubMenu()Landroid/view/SubMenu;
    .locals 1

    iget-object v0, p0, Lh/p;->o:Lh/F;

    return-object v0
.end method

.method public final getTitle()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Lh/p;->e:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public final getTitleCondensed()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Lh/p;->f:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    iget-object v0, p0, Lh/p;->e:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public final getTooltipText()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Lh/p;->r:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public final hasSubMenu()Z
    .locals 1

    iget-object v0, p0, Lh/p;->o:Lh/F;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final isActionViewExpanded()Z
    .locals 1

    iget-boolean v0, p0, Lh/p;->C:Z

    return v0
.end method

.method public final isCheckable()Z
    .locals 2

    iget v0, p0, Lh/p;->x:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final isChecked()Z
    .locals 2

    iget v0, p0, Lh/p;->x:I

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final isEnabled()Z
    .locals 1

    iget v0, p0, Lh/p;->x:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final isVisible()Z
    .locals 3

    iget-object v0, p0, Lh/p;->A:Lh/q;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget-object v0, v0, Lh/q;->b:Landroid/view/ActionProvider;

    invoke-virtual {v0}, Landroid/view/ActionProvider;->overridesItemVisibility()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lh/p;->x:I

    and-int/lit8 v0, v0, 0x8

    if-nez v0, :cond_0

    iget-object v0, p0, Lh/p;->A:Lh/q;

    iget-object v0, v0, Lh/q;->b:Landroid/view/ActionProvider;

    invoke-virtual {v0}, Landroid/view/ActionProvider;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    return v2

    :cond_0
    return v1

    :cond_1
    iget v0, p0, Lh/p;->x:I

    and-int/lit8 v0, v0, 0x8

    if-nez v0, :cond_2

    return v2

    :cond_2
    return v1
.end method

.method public final setActionProvider(Landroid/view/ActionProvider;)Landroid/view/MenuItem;
    .locals 1

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "This is not supported, use MenuItemCompat.setActionProvider()"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setActionView(I)Landroid/view/MenuItem;
    .locals 3

    iget-object v0, p0, Lh/p;->n:Lh/n;

    iget-object v0, v0, Lh/n;->a:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    invoke-virtual {v1, p1, v2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lh/p;->z:Landroid/view/View;

    const/4 v0, 0x0

    iput-object v0, p0, Lh/p;->A:Lh/q;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lh/p;->a:I

    if-lez v0, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/View;->setId(I)V

    :cond_0
    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lh/n;->k:Z

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setActionView(Landroid/view/View;)Landroid/view/MenuItem;
    .locals 2

    iput-object p1, p0, Lh/p;->z:Landroid/view/View;

    const/4 v0, 0x0

    iput-object v0, p0, Lh/p;->A:Lh/q;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lh/p;->a:I

    if-lez v0, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/View;->setId(I)V

    :cond_0
    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lh/n;->k:Z

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setAlphabeticShortcut(C)Landroid/view/MenuItem;
    .locals 1

    iget-char v0, p0, Lh/p;->j:C

    if-ne v0, p1, :cond_0

    return-object p0

    :cond_0
    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p1

    iput-char p1, p0, Lh/p;->j:C

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setAlphabeticShortcut(CI)Landroid/view/MenuItem;
    .locals 1

    iget-char v0, p0, Lh/p;->j:C

    if-ne v0, p1, :cond_0

    iget v0, p0, Lh/p;->k:I

    if-ne v0, p2, :cond_0

    return-object p0

    :cond_0
    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p1

    iput-char p1, p0, Lh/p;->j:C

    invoke-static {p2}, Landroid/view/KeyEvent;->normalizeMetaState(I)I

    move-result p1

    iput p1, p0, Lh/p;->k:I

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setCheckable(Z)Landroid/view/MenuItem;
    .locals 2

    iget v0, p0, Lh/p;->x:I

    and-int/lit8 v1, v0, -0x2

    or-int/2addr p1, v1

    iput p1, p0, Lh/p;->x:I

    if-eq v0, p1, :cond_0

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    :cond_0
    return-object p0
.end method

.method public final setChecked(Z)Landroid/view/MenuItem;
    .locals 9

    iget v0, p0, Lh/p;->x:I

    and-int/lit8 v1, v0, 0x4

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-eqz v1, :cond_5

    iget-object p1, p0, Lh/p;->n:Lh/n;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p1, Lh/n;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p1}, Lh/n;->w()V

    move v4, v3

    :goto_0
    if-ge v4, v1, :cond_4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lh/p;

    iget v6, v5, Lh/p;->b:I

    iget v7, p0, Lh/p;->b:I

    if-ne v6, v7, :cond_3

    iget v6, v5, Lh/p;->x:I

    and-int/lit8 v6, v6, 0x4

    if-eqz v6, :cond_3

    invoke-virtual {v5}, Lh/p;->isCheckable()Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_3

    :cond_0
    if-ne v5, p0, :cond_1

    const/4 v6, 0x1

    goto :goto_1

    :cond_1
    move v6, v3

    :goto_1
    iget v7, v5, Lh/p;->x:I

    and-int/lit8 v8, v7, -0x3

    if-eqz v6, :cond_2

    move v6, v2

    goto :goto_2

    :cond_2
    move v6, v3

    :goto_2
    or-int/2addr v6, v8

    iput v6, v5, Lh/p;->x:I

    if-eq v7, v6, :cond_3

    iget-object v5, v5, Lh/p;->n:Lh/n;

    invoke-virtual {v5, v3}, Lh/n;->p(Z)V

    :cond_3
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lh/n;->v()V

    return-object p0

    :cond_5
    and-int/lit8 v1, v0, -0x3

    if-eqz p1, :cond_6

    goto :goto_4

    :cond_6
    move v2, v3

    :goto_4
    or-int p1, v1, v2

    iput p1, p0, Lh/p;->x:I

    if-eq v0, p1, :cond_7

    iget-object p1, p0, Lh/p;->n:Lh/n;

    invoke-virtual {p1, v3}, Lh/n;->p(Z)V

    :cond_7
    return-object p0
.end method

.method public final bridge synthetic setContentDescription(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .locals 0

    invoke-virtual {p0, p1}, Lh/p;->setContentDescription(Ljava/lang/CharSequence;)Lt/a;

    return-object p0
.end method

.method public final setContentDescription(Ljava/lang/CharSequence;)Lt/a;
    .locals 1

    iput-object p1, p0, Lh/p;->q:Ljava/lang/CharSequence;

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setEnabled(Z)Landroid/view/MenuItem;
    .locals 1

    if-eqz p1, :cond_0

    iget p1, p0, Lh/p;->x:I

    or-int/lit8 p1, p1, 0x10

    iput p1, p0, Lh/p;->x:I

    goto :goto_0

    :cond_0
    iget p1, p0, Lh/p;->x:I

    and-int/lit8 p1, p1, -0x11

    iput p1, p0, Lh/p;->x:I

    :goto_0
    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setIcon(I)Landroid/view/MenuItem;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lh/p;->l:Landroid/graphics/drawable/Drawable;

    iput p1, p0, Lh/p;->m:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lh/p;->w:Z

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lh/p;->m:I

    iput-object p1, p0, Lh/p;->l:Landroid/graphics/drawable/Drawable;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lh/p;->w:Z

    iget-object p1, p0, Lh/p;->n:Lh/n;

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;
    .locals 1

    iput-object p1, p0, Lh/p;->s:Landroid/content/res/ColorStateList;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lh/p;->u:Z

    iput-boolean p1, p0, Lh/p;->w:Z

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setIconTintMode(Landroid/graphics/PorterDuff$Mode;)Landroid/view/MenuItem;
    .locals 1

    iput-object p1, p0, Lh/p;->t:Landroid/graphics/PorterDuff$Mode;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lh/p;->v:Z

    iput-boolean p1, p0, Lh/p;->w:Z

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;
    .locals 0

    iput-object p1, p0, Lh/p;->g:Landroid/content/Intent;

    return-object p0
.end method

.method public final setNumericShortcut(C)Landroid/view/MenuItem;
    .locals 1

    iget-char v0, p0, Lh/p;->h:C

    if-ne v0, p1, :cond_0

    return-object p0

    :cond_0
    iput-char p1, p0, Lh/p;->h:C

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setNumericShortcut(CI)Landroid/view/MenuItem;
    .locals 1

    iget-char v0, p0, Lh/p;->h:C

    if-ne v0, p1, :cond_0

    iget v0, p0, Lh/p;->i:I

    if-ne v0, p2, :cond_0

    return-object p0

    :cond_0
    iput-char p1, p0, Lh/p;->h:C

    invoke-static {p2}, Landroid/view/KeyEvent;->normalizeMetaState(I)I

    move-result p1

    iput p1, p0, Lh/p;->i:I

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;
    .locals 0

    iput-object p1, p0, Lh/p;->B:Landroid/view/MenuItem$OnActionExpandListener;

    return-object p0
.end method

.method public final setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;
    .locals 0

    iput-object p1, p0, Lh/p;->p:Landroid/view/MenuItem$OnMenuItemClickListener;

    return-object p0
.end method

.method public final setShortcut(CC)Landroid/view/MenuItem;
    .locals 0

    iput-char p1, p0, Lh/p;->h:C

    invoke-static {p2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p1

    iput-char p1, p0, Lh/p;->j:C

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setShortcut(CCII)Landroid/view/MenuItem;
    .locals 0

    iput-char p1, p0, Lh/p;->h:C

    invoke-static {p3}, Landroid/view/KeyEvent;->normalizeMetaState(I)I

    move-result p1

    iput p1, p0, Lh/p;->i:I

    invoke-static {p2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p1

    iput-char p1, p0, Lh/p;->j:C

    invoke-static {p4}, Landroid/view/KeyEvent;->normalizeMetaState(I)I

    move-result p1

    iput p1, p0, Lh/p;->k:I

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setShowAsAction(I)V
    .locals 3

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "SHOW_AS_ACTION_ALWAYS, SHOW_AS_ACTION_IF_ROOM, and SHOW_AS_ACTION_NEVER are mutually exclusive."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    iput p1, p0, Lh/p;->y:I

    iget-object p1, p0, Lh/p;->n:Lh/n;

    iput-boolean v1, p1, Lh/n;->k:Z

    invoke-virtual {p1, v1}, Lh/n;->p(Z)V

    return-void
.end method

.method public final setShowAsActionFlags(I)Landroid/view/MenuItem;
    .locals 0

    invoke-virtual {p0, p1}, Lh/p;->setShowAsAction(I)V

    return-object p0
.end method

.method public final setTitle(I)Landroid/view/MenuItem;
    .locals 1

    iget-object v0, p0, Lh/p;->n:Lh/n;

    iget-object v0, v0, Lh/n;->a:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lh/p;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    return-object p0
.end method

.method public final setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .locals 2

    iput-object p1, p0, Lh/p;->e:Ljava/lang/CharSequence;

    iget-object v0, p0, Lh/p;->n:Lh/n;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lh/n;->p(Z)V

    iget-object v0, p0, Lh/p;->o:Lh/F;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lh/F;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;

    :cond_0
    return-object p0
.end method

.method public final setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .locals 1

    iput-object p1, p0, Lh/p;->f:Ljava/lang/CharSequence;

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final bridge synthetic setTooltipText(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .locals 0

    invoke-virtual {p0, p1}, Lh/p;->setTooltipText(Ljava/lang/CharSequence;)Lt/a;

    return-object p0
.end method

.method public final setTooltipText(Ljava/lang/CharSequence;)Lt/a;
    .locals 1

    iput-object p1, p0, Lh/p;->r:Ljava/lang/CharSequence;

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    return-object p0
.end method

.method public final setVisible(Z)Landroid/view/MenuItem;
    .locals 2

    iget v0, p0, Lh/p;->x:I

    and-int/lit8 v1, v0, -0x9

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    or-int/2addr p1, v1

    iput p1, p0, Lh/p;->x:I

    if-eq v0, p1, :cond_1

    iget-object p1, p0, Lh/p;->n:Lh/n;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lh/n;->h:Z

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    :cond_1
    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lh/p;->e:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
