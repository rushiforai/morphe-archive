.class public final Lnn9;
.super Lzm9;
.source "SourceFile"


# instance fields
.field public f:Landroid/view/View;

.field public g:Landroid/view/View;


# virtual methods
.method public final c()V
    .registers 2

    iget-object v0, p0, Lnn9;->f:Landroid/view/View;

    if-eqz v0, :cond_c

    invoke-static {v0}, Lfsp;->j(Landroid/view/View;)V

    iget-object p0, p0, Lnn9;->g:Landroid/view/View;

    invoke-static {p0}, Lfsp;->j(Landroid/view/View;)V

    :cond_c
    return-void
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Lzm9;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lnn9;->f:Landroid/view/View;

    iget-object v0, p0, Lzm9;->c:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lnn9;->g:Landroid/view/View;

    iget-object v0, p0, Lnn9;->f:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lye1;->a(Landroid/view/View;Z)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lnn9;->g:Landroid/view/View;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lye1;->a(Landroid/view/View;Z)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lvl9;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lvl9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method
