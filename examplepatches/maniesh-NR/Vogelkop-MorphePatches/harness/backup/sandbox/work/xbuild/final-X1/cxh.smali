.class public abstract Lcxh;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public final a(Landroid/content/Context;)I
    .registers 3

    instance-of v0, p0, Lgxh;

    if-eqz v0, :cond_9

    check-cast p0, Lgxh;

    iget p0, p0, Lgxh;->a:I

    return p0

    :cond_9
    instance-of v0, p0, Lfxh;

    if-eqz v0, :cond_16

    check-cast p0, Lfxh;

    iget p0, p0, Lfxh;->a:I

    invoke-virtual {p1, p0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    return p0

    :cond_16
    instance-of v0, p0, Ldxh;

    if-eqz v0, :cond_23

    check-cast p0, Ldxh;

    iget p0, p0, Ldxh;->a:I

    invoke-static {p0, p1}, Lj7h;->k(ILandroid/content/Context;)I

    move-result p0

    return p0

    :cond_23
    instance-of p1, p0, Lexh;

    if-eqz p1, :cond_30

    check-cast p0, Lexh;

    iget-object p0, p0, Lexh;->a:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    return p0

    :cond_30
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0
.end method

.method public final b(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    instance-of v0, p0, Lgxh;

    if-eqz v0, :cond_d

    check-cast p0, Lgxh;

    iget p0, p0, Lgxh;->a:I

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_d
    instance-of v0, p0, Lfxh;

    if-eqz v0, :cond_23

    check-cast p0, Lfxh;

    iget p0, p0, Lfxh;->a:I

    invoke-static {p0, p1}, Lnb6;->v(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_1c

    return-object p0

    :cond_1c
    const/16 p0, -0x100

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_23
    instance-of v0, p0, Ldxh;

    if-eqz v0, :cond_30

    check-cast p0, Ldxh;

    iget p0, p0, Ldxh;->a:I

    invoke-static {p0, p1}, Lj7h;->l(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_30
    instance-of p1, p0, Lexh;

    if-eqz p1, :cond_39

    check-cast p0, Lexh;

    iget-object p0, p0, Lexh;->a:Landroid/content/res/ColorStateList;

    return-object p0

    :cond_39
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0
.end method
