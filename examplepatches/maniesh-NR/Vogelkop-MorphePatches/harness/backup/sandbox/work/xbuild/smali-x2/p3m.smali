.class public final Lp3m;
.super Lm93;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final A:Lv3m;


# direct methods
.method public constructor <init>(Lv3m;)V
    .registers 4

    const v0, 0x7f130043

    const/4 v1, -0x1

    invoke-direct {p0, v0, v1}, Lm93;-><init>(II)V

    iput-object p1, p0, Lp3m;->A:Lv3m;

    return-void
.end method


# virtual methods
.method public final G0(Ljava/lang/String;)V
    .registers 5

    iget-object p0, p0, Lp3m;->A:Lv3m;

    iget-object p0, p0, Lv3m;->d:Lplk;

    iget-object v0, p0, Lplk;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    new-instance v1, Le4m;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Le4m;-><init>(Lplk;Ljava/lang/String;B)V

    invoke-virtual {v0, v1}, Lxl;->j(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final H0()Ljava/util/Collection;
    .registers 1

    iget-object p0, p0, Lp3m;->A:Lv3m;

    iget-object p0, p0, Lv3m;->d:Lplk;

    iget-object p0, p0, Lplk;->d:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    if-eqz p0, :cond_11

    return-object p0

    :cond_11
    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object p0
.end method

.method public final I0()V
    .registers 4

    iget-object p0, p0, Lp3m;->A:Lv3m;

    iget-object p0, p0, Lv3m;->d:Lplk;

    iget-object v0, p0, Lplk;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    new-instance v1, Ld4m;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ld4m;-><init>(Lplk;B)V

    invoke-virtual {v0, v1}, Lxl;->j(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final J0(Ljava/util/ArrayList;)V
    .registers 5

    iget-object p0, p0, Lp3m;->A:Lv3m;

    iget-object p0, p0, Lv3m;->d:Lplk;

    iget-object v0, p0, Lplk;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    new-instance v1, Liyk;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lxl;->j(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ljava/util/Set;

    iget-object p0, p0, Lm93;->w:Lig;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lm93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lp3m;->A:Lv3m;

    iget-object p1, p1, Lv3m;->d:Lplk;

    iget-object p1, p1, Lplk;->d:Ljava/lang/Object;

    check-cast p1, Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p1, p2, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method
