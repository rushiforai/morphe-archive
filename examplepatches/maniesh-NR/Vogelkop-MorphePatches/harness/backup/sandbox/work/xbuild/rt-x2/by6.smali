.class public final Lby6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Laln;


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b()Lg7j;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Landroid/content/Context;Lo2c;)Lxkn;
    .registers 13

    iget-boolean p2, p2, Lo2c;->c:Z

    if-eqz p2, :cond_8

    const p2, 0x7f080281

    goto :goto_b

    :cond_8
    const p2, 0x7f080280

    :goto_b
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "android.resource://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const v4, -0x845f34

    invoke-static {v4}, Lp37;->u0(I)Z

    move-result p1

    xor-int/lit8 v7, p1, 0x1

    new-instance v1, Lxkn;

    move v5, v4

    move v6, v4

    move v8, v7

    move v9, v7

    move-object v2, p0

    invoke-direct/range {v1 .. v9}, Lxkn;-><init>(Laln;Ljava/lang/String;IIIZZZ)V

    return-object v1
.end method

.method public final f()I
    .registers 1

    const/4 p0, 0x4

    return p0
.end method

.method public final g(Landroid/content/Context;Lo2c;)Lh06;
    .registers 10

    new-instance v0, Lh06;

    const-string v5, "Opera"

    const-string v6, "https://www.opera.com/"

    const-string v1, "Down Peak"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v6}, Lh06;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    const-string p0, "NETWORK_529"

    return-object p0
.end method

.method public final getType()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method
