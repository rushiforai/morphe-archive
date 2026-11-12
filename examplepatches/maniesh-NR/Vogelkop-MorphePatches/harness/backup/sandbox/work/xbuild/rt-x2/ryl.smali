.class public Lryl;
.super Landroidx/fragment/app/i;
.source "SourceFile"

# interfaces
.implements Lbtj;


# instance fields
.field public a:Z

.field public b:Lbtj;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroidx/fragment/app/i;-><init>()V

    return-void
.end method


# virtual methods
.method public final I()V
    .registers 1

    iget-object p0, p0, Lryl;->b:Lbtj;

    if-eqz p0, :cond_7

    invoke-interface {p0}, Lbtj;->I()V

    :cond_7
    return-void
.end method

.method public g0()V
    .registers 2

    iget-boolean v0, p0, Lryl;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lryl;->i0()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-virtual {p0, v0}, Lryl;->h0(Landroidx/fragment/app/w;)V

    :cond_12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lryl;->a:Z

    return-void
.end method

.method public h0(Landroidx/fragment/app/w;)V
    .registers 2

    invoke-virtual {p1}, Landroidx/fragment/app/w;->X()Z

    return-void
.end method

.method public final i0()Z
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    iget-boolean v1, p0, Lryl;->a:Z

    if-nez v1, :cond_16

    if-eqz v0, :cond_16

    iget-boolean v0, v0, Landroidx/fragment/app/w;->L:Z

    if-nez v0, :cond_16

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    move-result p0

    if-nez p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public j0(Lbtj;)V
    .registers 2

    iput-object p1, p0, Lryl;->b:Lbtj;

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/fragment/app/i;->setShowsDialog(Z)V

    return-void
.end method

.method public onDestroy()V
    .registers 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewModelStore()Lv7n;

    move-result-object p0

    invoke-virtual {p0}, Lv7n;->a()V

    return-void
.end method

.method public final z(Lo93;Lmim;)I
    .registers 3

    iget-object p0, p0, Lryl;->b:Lbtj;

    if-eqz p0, :cond_9

    invoke-interface {p0, p1, p2}, Lbtj;->z(Lo93;Lmim;)I

    move-result p0

    return p0

    :cond_9
    const/4 p0, 0x3

    return p0
.end method
