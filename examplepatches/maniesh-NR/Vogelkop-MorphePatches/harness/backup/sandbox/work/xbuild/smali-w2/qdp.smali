.class public abstract Lqdp;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "SourceFile"


# virtual methods
.method public final onCapabilitiesChanged(Landroid/net/Network;Landroid/net/NetworkCapabilities;)V
    .registers 3
    .param p1    # Landroid/net/Network;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/net/NetworkCapabilities;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    if-nez p2, :cond_3

    return-void

    :cond_3
    check-cast p0, Lb1p;

    sget-object p1, Ld1p;->a:Lt5p;

    iget-object p0, p0, Lb1p;->a:Landroid/content/Context;

    invoke-static {p0, p2}, Ld1p;->a(Landroid/content/Context;Landroid/net/NetworkCapabilities;)Lt5p;

    move-result-object p0

    invoke-static {p0}, Ld1p;->c(Lt5p;)V

    return-void
.end method

.method public final onLost(Landroid/net/Network;)V
    .registers 2
    .param p1    # Landroid/net/Network;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object p0, Ld1p;->a:Lt5p;

    invoke-static {p0}, Ld1p;->c(Lt5p;)V

    return-void
.end method
