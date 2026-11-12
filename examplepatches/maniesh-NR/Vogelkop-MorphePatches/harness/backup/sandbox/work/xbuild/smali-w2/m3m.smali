.class public final Lm3m;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final j:Landroid/content/Context;

.field public final k:Lala;

.field public l:Landroid/view/MenuItem;

.field public m:Landroid/view/MenuItem;

.field public n:Landroid/view/MenuItem;

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Ljava/lang/String;

.field public t:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lala;)V
    .registers 4

    invoke-direct {p0}, Lo73;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lm3m;->s:Ljava/lang/String;

    iput-object p1, p0, Lm3m;->j:Landroid/content/Context;

    iput-object p2, p0, Lm3m;->k:Lala;

    return-void
.end method

.method public static q(Ljava/util/Set;Lszb;I)Z
    .registers 5

    if-eqz p1, :cond_20

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li0c;

    iget-object v1, v0, Li0c;->a:Lszb;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    iget p0, v0, Li0c;->b:I

    if-ne p0, p2, :cond_20

    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public static r(Landroid/view/MenuItem;Ljava/lang/String;Z)V
    .registers 4

    invoke-interface {p0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lov0;->e(Landroid/view/View;)Lov0;

    move-result-object p0

    iget-object v0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p2, :cond_17

    const/4 p1, 0x0

    goto :goto_18

    :cond_17
    const/4 p1, 0x4

    :goto_18
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public final j(Landroid/view/View;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final m(Lr9i;Landroid/view/View;)V
    .registers 3

    const p2, 0x7f10003c

    invoke-virtual {p1, p2}, Lr9i;->L(I)V

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    const p2, 0x7f0a0683

    invoke-virtual {p1, p2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p2

    iput-object p2, p0, Lm3m;->l:Landroid/view/MenuItem;

    const p2, 0x7f0a06ae

    invoke-virtual {p1, p2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p2

    iput-object p2, p0, Lm3m;->m:Landroid/view/MenuItem;

    const p2, 0x7f0a06af

    invoke-virtual {p1, p2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lm3m;->n:Landroid/view/MenuItem;

    invoke-virtual {p0}, Lm3m;->s()V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a06ad

    const/4 v1, 0x0

    iget-object p0, p0, Lm3m;->k:Lala;

    const/4 v2, 0x1

    if-ne p1, v0, :cond_39

    iget-object p1, p0, Lala;->e:Ljava/lang/Object;

    check-cast p1, Ly0f;

    sget-object v0, Lrs0;->g:Lrs0;

    invoke-virtual {p1, v0}, Ly0f;->c(Lrs0;)V

    iget-object p1, p0, Lala;->i:Ljava/lang/Object;

    check-cast p1, Lz3m;

    iget-object v0, p0, Lala;->a:Ljava/lang/Object;

    check-cast v0, Lpt1;

    iget-object v0, v0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/BottomIndicatorButton;

    iget-object p0, p0, Lala;->g:Ljava/lang/Object;

    check-cast p0, Lr4m;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lj4m;

    invoke-direct {v3, p0, v1}, Lj4m;-><init>(Lr4m;B)V

    iput-object v3, p1, Lz3m;->o:Lcom/opera/api/Callback;

    const/4 p0, 0x0

    iput-object p0, p1, Lz3m;->p:Lszb;

    iput-boolean v2, p1, Lz3m;->q:Z

    invoke-virtual {p1, v0}, Lo73;->p(Landroid/view/View;)V

    return v2

    :cond_39
    const v0, 0x7f0a0683

    if-ne p1, v0, :cond_42

    invoke-virtual {p0, v1}, Lala;->k(I)V

    return v2

    :cond_42
    const v0, 0x7f0a06ae

    if-ne p1, v0, :cond_4b

    invoke-virtual {p0, v2}, Lala;->k(I)V

    return v2

    :cond_4b
    const v0, 0x7f0a06af

    if-ne p1, v0, :cond_6f

    iget-object p1, p0, Lala;->e:Ljava/lang/Object;

    check-cast p1, Ly0f;

    sget-object v0, Lrs0;->j:Lrs0;

    invoke-virtual {p1, v0}, Ly0f;->c(Lrs0;)V

    iget-object p0, p0, Lala;->g:Ljava/lang/Object;

    check-cast p0, Lr4m;

    iget-object p1, p0, Lr4m;->a:Ll8l;

    iget-object p1, p1, Ll8l;->d:Ljava/lang/String;

    if-nez p1, :cond_64

    return v2

    :cond_64
    new-instance v0, Lnpl;

    const/16 v1, 0xc

    invoke-direct {v0, p0, p1, v1}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    return v2

    :cond_6f
    const v0, 0x7f0a06b2

    if-ne p1, v0, :cond_81

    iget-object p1, p0, Lala;->e:Ljava/lang/Object;

    check-cast p1, Ly0f;

    sget-object v0, Lrs0;->k:Lrs0;

    invoke-virtual {p1, v0}, Ly0f;->c(Lrs0;)V

    invoke-virtual {p0, v1}, Lala;->p(Z)V

    return v2

    :cond_81
    return v1
.end method

.method public final s()V
    .registers 5

    iget-object v0, p0, Lm3m;->l:Landroid/view/MenuItem;

    if-eqz v0, :cond_7e

    iget-object v1, p0, Lm3m;->m:Landroid/view/MenuItem;

    if-eqz v1, :cond_7e

    iget-object v1, p0, Lm3m;->n:Landroid/view/MenuItem;

    if-eqz v1, :cond_7e

    iget-boolean v1, p0, Lm3m;->t:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lm3m;->m:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lm3m;->t:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lm3m;->n:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lm3m;->t:Z

    if-eqz v1, :cond_24

    iget-boolean v1, p0, Lm3m;->o:Z

    if-nez v1, :cond_24

    const/4 v1, 0x0

    goto :goto_25

    :cond_24
    const/4 v1, 0x1

    :goto_25
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lm3m;->n:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lm3m;->o:Z

    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lov0;->e(Landroid/view/View;)Lov0;

    move-result-object v2

    iget-object v2, v2, Lov0;->d:Ljava/lang/Object;

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lm3m;->j:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-boolean v1, p0, Lm3m;->t:Z

    if-eqz v1, :cond_70

    iget-object v1, p0, Lm3m;->l:Landroid/view/MenuItem;

    iget-object v2, p0, Lm3m;->s:Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f140185

    invoke-virtual {v0, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iget-boolean v3, p0, Lm3m;->p:Z

    invoke-static {v1, v2, v3}, Lm3m;->r(Landroid/view/MenuItem;Ljava/lang/String;Z)V

    iget-object v1, p0, Lm3m;->m:Landroid/view/MenuItem;

    iget-object v2, p0, Lm3m;->s:Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f140b0a

    invoke-virtual {v0, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iget-boolean v3, p0, Lm3m;->q:Z

    invoke-static {v1, v2, v3}, Lm3m;->r(Landroid/view/MenuItem;Ljava/lang/String;Z)V

    :cond_70
    iget-object v1, p0, Lm3m;->n:Landroid/view/MenuItem;

    const v2, 0x7f140b0b

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-boolean p0, p0, Lm3m;->r:Z

    invoke-static {v1, v0, p0}, Lm3m;->r(Landroid/view/MenuItem;Ljava/lang/String;Z)V

    :cond_7e
    return-void
.end method
