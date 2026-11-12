.class public final Lmri;
.super Lo73;
.source "SourceFile"

# interfaces
.implements Lkri;


# instance fields
.field public final j:Llg;

.field public final k:Lq6e;

.field public final l:Lz0a;

.field public final m:Lcbf;

.field public n:Z


# direct methods
.method public constructor <init>(Llg;Lq6e;Lz0a;Lcbf;)V
    .registers 5

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p1, p0, Lmri;->j:Llg;

    iput-object p2, p0, Lmri;->k:Lq6e;

    iput-object p3, p0, Lmri;->l:Lz0a;

    iput-object p4, p0, Lmri;->m:Lcbf;

    return-void
.end method


# virtual methods
.method public final a(Lq6e;)V
    .registers 2

    iget-boolean p1, p0, Lmri;->n:Z

    if-nez p1, :cond_a

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p1

    if-nez p1, :cond_b

    :cond_a
    return-void

    :cond_b
    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    invoke-virtual {p1}, Litd;->clear()V

    invoke-virtual {p0, p1}, Lmri;->q(Landroid/view/Menu;)V

    return-void
.end method

.method public final d(Landroid/view/View;)I
    .registers 2

    const p0, 0x800003

    return p0
.end method

.method public final e(Landroid/view/View;)I
    .registers 4

    const/high16 v0, 0x40800000    # 4.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    invoke-super {p0, p1}, Lo73;->e(Landroid/view/View;)I

    move-result p0

    invoke-static {p1}, Lcs5;->W(Landroid/view/View;)Z

    move-result p1

    const v1, 0x800003

    invoke-static {v1, p1}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result p1

    and-int/lit8 p1, p1, 0x7

    const/4 v1, 0x3

    if-ne p1, v1, :cond_1f

    neg-int v0, v0

    :cond_1f
    add-int/2addr p0, v0

    return p0
.end method

.method public final h(Landroid/view/View;)I
    .registers 3

    invoke-super {p0, p1}, Lo73;->h(Landroid/view/View;)I

    move-result p0

    const/high16 v0, 0x40800000    # 4.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v0, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    sub-int/2addr p0, p1

    return p0
.end method

.method public final m(Lr9i;Landroid/view/View;)V
    .registers 4

    const/4 p2, 0x0

    iput-boolean p2, p0, Lmri;->n:Z

    iget-object p2, p0, Lo73;->a:Ldkf;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f07084d

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iget-object v0, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lo66;

    iput p2, v0, Lo66;->u:I

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lr9i;->S(Z)V

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    invoke-virtual {p0, p1}, Lmri;->q(Landroid/view/Menu;)V

    iget-object p1, p0, Lmri;->k:Lq6e;

    invoke-virtual {p1, p0}, Lq6e;->a(Lkri;)V

    return-void
.end method

.method public final onDismiss()V
    .registers 2

    iget-object v0, p0, Lmri;->k:Lq6e;

    invoke-virtual {v0, p0}, Lq6e;->m(Lkri;)V

    invoke-super {p0}, Lo73;->onDismiss()V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 5

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Leri;

    if-eqz v0, :cond_2c

    check-cast p1, Leri;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lmri;->n:Z

    iget-object v1, p0, Lmri;->j:Llg;

    invoke-virtual {v1}, Llg;->b()Leri;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    return v0

    :cond_1e
    iget-object v2, p0, Lmri;->m:Lcbf;

    invoke-virtual {v2}, Lcbf;->run()V

    invoke-virtual {v1, p1, v0, v0}, Llg;->f(Leri;ZZ)Z

    iget-object p0, p0, Lmri;->k:Lq6e;

    invoke-virtual {p0, p1}, Lq6e;->k(Leri;)V

    return v0

    :cond_2c
    const/4 p0, 0x0

    return p0
.end method

.method public final q(Landroid/view/Menu;)V
    .registers 12

    iget-object v0, p0, Lmri;->j:Llg;

    invoke-virtual {v0}, Llg;->b()Leri;

    move-result-object v0

    iget-object v1, p0, Lo73;->a:Ldkf;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x41c00000    # 24.0f

    invoke-static {v2, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    new-instance v3, Luri;

    new-instance v4, Loji;

    invoke-direct {v4, p0}, Loji;-><init>(Ljava/lang/Object;)V

    invoke-direct {v3, v1, v4}, Luri;-><init>(Landroid/content/res/Resources;Ltri;)V

    iget-object v1, p0, Lmri;->l:Lz0a;

    invoke-virtual {v1}, Lz0a;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v4, p0, Lmri;->k:Lq6e;

    iget-object v4, v4, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_34
    :goto_34
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_88

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Leri;

    if-eqz v1, :cond_48

    invoke-interface {v5}, Leri;->e()Z

    move-result v6

    if-eqz v6, :cond_34

    :cond_48
    invoke-interface {v5}, Leri;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v6}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v6

    const v7, 0x7f0d00c2

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    invoke-interface {v6}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-interface {v5}, Leri;->b()Z

    move-result v8

    if-eqz v8, :cond_67

    invoke-virtual {v7, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    goto :goto_6b

    :cond_67
    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_6b
    new-instance v8, Llri;

    invoke-direct {v8, p0, v5, v2, v6}, Llri;-><init>(Lmri;Leri;ILandroid/view/MenuItem;)V

    invoke-static {v7}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v9

    if-eqz v9, :cond_79

    invoke-static {v9, v7, v8}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_79
    invoke-virtual {v8, v7}, Llri;->a(Landroid/view/View;)V

    const/4 v7, 0x1

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    invoke-virtual {v0, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    goto :goto_34

    :cond_88
    return-void
.end method
