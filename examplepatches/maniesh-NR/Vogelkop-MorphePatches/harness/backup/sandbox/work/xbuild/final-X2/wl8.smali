.class public final Lwl8;
.super Lxl8;
.source "SourceFile"


# instance fields
.field public d:Z


# virtual methods
.method public final onPause(Lndc;)V
    .registers 2

    const/4 p1, 0x0

    iput-boolean p1, p0, Lwl8;->d:Z

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 3

    iget-boolean v0, p0, Lwl8;->d:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxl8;->b(Ltcc;)V

    return-void
.end method
