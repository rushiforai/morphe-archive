.class public final Lfen;
.super Lmgn;
.source "SourceFile"


# instance fields
.field public j:Lcen;


# virtual methods
.method public final a()Z
    .registers 3

    iget-object p0, p0, Lmgn;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "vpn.tooltip_premium.change_location_closed"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final c()Lcom/opera/android/bar/OmniButtonView;
    .registers 2

    iget-object p0, p0, Lmgn;->d:Lgbf;

    iget-object v0, p0, Lgbf;->b:Lz43;

    invoke-virtual {v0}, Lz43;->q()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lgbf;->r()Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/bar/OmniButtonView;

    return-object p0

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method

.method public final e()Z
    .registers 2

    invoke-super {p0}, Lmgn;->e()Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lmgn;->f:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0}, Lfen;->h(Lb2l;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lmgn;->g:Lydn;

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public final f()V
    .registers 2

    iget-object v0, p0, Lmgn;->c:Lcom/opera/android/BrowserActivity;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltcc;->a(Lmdc;)V

    new-instance v0, Lcen;

    invoke-direct {v0, p0}, Lcen;-><init>(Lfen;)V

    iput-object v0, p0, Lfen;->j:Lcen;

    iget-object p0, p0, Lmgn;->g:Lydn;

    invoke-virtual {p0, v0}, Lydn;->b(Ltdn;)V

    return-void
.end method

.method public final g()V
    .registers 5

    iget-object v0, p0, Lmgn;->c:Lcom/opera/android/BrowserActivity;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    iget-object v0, p0, Lfen;->j:Lcen;

    if-eqz v0, :cond_24

    iget-object v1, v0, Lcen;->b:Lf6l;

    const/4 v2, 0x0

    if-eqz v1, :cond_1b

    iget-object v3, v0, Lcen;->c:Lfen;

    iget-object v3, v3, Lmgn;->f:Lk6l;

    invoke-virtual {v3, v1}, Lk6l;->x(Lj6l;)V

    iput-object v2, v0, Lcen;->b:Lf6l;

    :cond_1b
    iget-object v0, p0, Lmgn;->g:Lydn;

    iget-object v1, p0, Lfen;->j:Lcen;

    invoke-virtual {v0, v1}, Lydn;->A(Ltdn;)V

    iput-object v2, p0, Lfen;->j:Lcen;

    :cond_24
    return-void
.end method

.method public final h(Lb2l;)Z
    .registers 4

    if-eqz p1, :cond_1f

    move-object v0, p1

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->n0()Z

    move-result v1

    if-nez v1, :cond_1f

    invoke-virtual {p0, p1}, Lmgn;->d(Lb2l;)Z

    move-result p1

    if-eqz p1, :cond_1f

    iget-object p0, p0, Lmgn;->g:Lydn;

    invoke-virtual {v0}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lydn;->t(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1f

    const/4 p0, 0x1

    return p0

    :cond_1f
    const/4 p0, 0x0

    return p0
.end method
