.class public final Lqmd;
.super Lk73;
.source "SourceFile"


# virtual methods
.method public final q(Landroidx/fragment/app/w;)Landroidx/fragment/app/i;
    .registers 4

    const-string v0, "android.support.v7.mediarouter:MediaRouteChooserDialogFragment"

    invoke-virtual {p1, v0}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    new-instance v1, Lpmd;

    invoke-direct {v1, p0}, Lpmd;-><init>(Lqmd;)V

    iget-object p0, p0, Lk73;->c:Ljava/lang/Object;

    check-cast p0, Lvnd;

    invoke-virtual {v1, p0}, Lomd;->i0(Lvnd;)V

    invoke-virtual {v1, p1, v0}, Landroidx/fragment/app/i;->show(Landroidx/fragment/app/w;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/fragment/app/w;->D()V

    return-object v1
.end method
