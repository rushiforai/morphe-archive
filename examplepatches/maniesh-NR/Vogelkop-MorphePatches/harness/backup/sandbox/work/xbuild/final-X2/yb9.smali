.class public final Lyb9;
.super Lxb9;
.source "SourceFile"


# virtual methods
.method public final c0(Lhb9;)I
    .registers 2

    const/4 p0, 0x2

    return p0
.end method

.method public final f0(Lja2;)V
    .registers 5

    iget-object v0, p0, Lxb9;->d:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object v0

    new-instance v1, Lvb9;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lvb9;-><init>(Lxb9;Lja2;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
