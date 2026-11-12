.class public final Lz0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public a:Lgwi;

.field public b:Z


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 5

    const/4 p3, 0x0

    const/4 v0, 0x1

    if-eqz p2, :cond_10

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->m()Z

    move-result p2

    if-eqz p2, :cond_10

    move p2, v0

    goto :goto_11

    :cond_10
    move p2, p3

    :goto_11
    if-eqz p1, :cond_1e

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    if-eqz p1, :cond_1e

    move p3, v0

    :cond_1e
    if-ne p2, p3, :cond_21

    return-void

    :cond_21
    invoke-virtual {p0, p2}, Lz0h;->a(Z)V

    return-void
.end method

.method public final a(Z)V
    .registers 4

    iget-object v0, p0, Lz0h;->a:Lgwi;

    if-eqz v0, :cond_24

    if-eqz p1, :cond_20

    sget-object v0, Lwbc;->g:Lwbc;

    invoke-virtual {v0}, Lwbc;->c()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_11

    move v0, v1

    goto :goto_15

    :cond_11
    invoke-static {}, LJ/N;->MFTJCvBh()Z

    move-result v0

    :goto_15
    if-eqz v0, :cond_20

    const-string v0, "IncognitoScreenshot"

    invoke-static {v0}, LJ/N;->M$PqApPr(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    move p1, v1

    :cond_20
    iget-boolean v0, p0, Lz0h;->b:Z

    if-ne p1, v0, :cond_25

    :cond_24
    return-void

    :cond_25
    iput-boolean p1, p0, Lz0h;->b:Z

    iget-object p0, p0, Lz0h;->a:Lgwi;

    invoke-virtual {p0, p1}, Lgwi;->b(Z)V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lz0h;->a(Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lz0h;->a:Lgwi;

    return-void
.end method
