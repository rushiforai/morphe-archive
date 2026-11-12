.class public final Lill;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Laln;


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final b()Lg7j;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Landroid/content/Context;Lo2c;)Lxkn;
    .registers 4

    iget-boolean p2, p2, Lo2c;->d:Z

    if-eqz p2, :cond_8

    const p2, 0x7f0402ea

    goto :goto_b

    :cond_8
    const p2, 0x7f0402e9

    :goto_b
    const v0, 0x7f06063b

    invoke-static {p2, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {p0, p1, p1}, Lxkn;->a(Laln;II)Lxkn;

    move-result-object p0

    return-object p0
.end method

.method public final d()Lzkn;
    .registers 1

    sget-object p0, Lhll;->s:Lgpk;

    return-object p0
.end method

.method public final f()I
    .registers 1

    const/4 p0, 0x4

    return p0
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    const-string p0, "THEME_WALLPAPER"

    return-object p0
.end method

.method public final getType()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method
