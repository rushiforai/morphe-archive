.class public final Lgch;
.super Llim;
.source "SourceFile"

# interfaces
.implements Llch;


# instance fields
.field public a:Lhch;


# virtual methods
.method public final m(Z)V
    .registers 2

    iget-object p1, p0, Lgch;->a:Lhch;

    if-eqz p1, :cond_10

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, p0, Lgch;->a:Lhch;

    invoke-virtual {p0}, Lhch;->f0()V

    :cond_10
    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lgch;->a:Lhch;

    return-void
.end method
