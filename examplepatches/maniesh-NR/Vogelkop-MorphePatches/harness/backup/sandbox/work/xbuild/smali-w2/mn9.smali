.class public final Lmn9;
.super Lzm9;
.source "SourceFile"


# instance fields
.field public f:Landroid/view/View;

.field public g:Landroid/view/View;

.field public h:Z

.field public final synthetic i:Ls65;

.field public final synthetic j:Z

.field public final synthetic k:Lx65;


# direct methods
.method public constructor <init>(Ls65;ZLx65;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmn9;->i:Ls65;

    iput-boolean p2, p0, Lmn9;->j:Z

    iput-object p3, p0, Lmn9;->k:Lx65;

    return-void
.end method


# virtual methods
.method public final c()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lmn9;->h:Z

    iget-object v0, p0, Lmn9;->f:Landroid/view/View;

    if-eqz v0, :cond_f

    invoke-static {v0}, Lfsp;->j(Landroid/view/View;)V

    iget-object p0, p0, Lmn9;->g:Landroid/view/View;

    invoke-static {p0}, Lfsp;->j(Landroid/view/View;)V

    :cond_f
    return-void
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Lmn9;->i:Ls65;

    if-eqz v0, :cond_e

    new-instance v1, Lld9;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v2}, Lld9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Ls65;->run(Ljava/lang/Object;)V

    return-void

    :cond_e
    invoke-virtual {p0}, Lmn9;->f()V

    return-void
.end method

.method public final f()V
    .registers 6

    iget-boolean v0, p0, Lmn9;->h:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lzm9;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lmn9;->f:Landroid/view/View;

    iget-object v0, p0, Lzm9;->c:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lmn9;->g:Landroid/view/View;

    iget-object v1, p0, Lmn9;->f:Landroid/view/View;

    const/4 v2, 0x0

    if-eqz v1, :cond_3a

    if-eqz v0, :cond_3a

    const/4 v0, 0x0

    iget-boolean v3, p0, Lmn9;->j:Z

    invoke-static {v1, v1, v0, v2, v3}, Lye1;->b(Landroid/view/View;Landroid/view/View;Lx65;ZZ)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lmn9;->f:Landroid/view/View;

    iget-object v1, p0, Lmn9;->g:Landroid/view/View;

    iget-object v2, p0, Lmn9;->k:Lx65;

    const/4 v4, 0x1

    invoke-static {v0, v1, v2, v4, v3}, Lye1;->b(Landroid/view/View;Landroid/view/View;Lx65;ZZ)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lvl9;

    invoke-direct {v1, p0, v4}, Lvl9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    return-void

    :cond_3a
    invoke-virtual {p0, v2}, Lzm9;->b(Z)V

    return-void
.end method
