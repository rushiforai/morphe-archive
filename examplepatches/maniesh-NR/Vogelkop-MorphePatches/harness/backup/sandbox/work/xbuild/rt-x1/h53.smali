.class public abstract Lh53;
.super Li93;
.source "SourceFile"

# interfaces
.implements Ljbl;
.implements Ljj2;


# virtual methods
.method public final b0()V
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    const-string v0, "BaseAuthPasswordsSettingsFragment"

    const/4 v1, 0x1

    invoke-virtual {p0, v1, v0}, Landroidx/fragment/app/w;->V(ILjava/lang/String;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    sget-object p1, Lwi2;->i:Lwi2;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p0

    iget-object p1, p1, Llj2;->b:Lob;

    invoke-virtual {p0, p1}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public final w0()Z
    .registers 1

    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "BaseAuthPasswordsSettingsFragment"

    return-object p0
.end method
