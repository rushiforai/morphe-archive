.class public final Lbri;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leri;


# virtual methods
.method public final a(ILp6l;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-string p0, ""

    return-object p0
.end method

.method public final b()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final c()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final cancel()V
    .registers 1

    return-void
.end method

.method public final d()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final e()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final f()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final g([BLandroid/util/Size;Landroid/util/Size;Ljava/lang/String;)Llsc;
    .registers 5

    new-instance p0, Llsc;

    const-string p1, ""

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lksc;-><init>(Ljava/lang/String;I)V

    return-object p0
.end method

.method public final getId()J
    .registers 3

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final h(Leh7;Lcom/opera/api/Callback;)Lhh4;
    .registers 3

    const/4 p0, 0x0

    invoke-interface {p2, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    sget-object p0, Lhh4;->Po:Lgpk;

    return-object p0
.end method

.method public final i(Ljava/lang/String;ZLtn;)V
    .registers 4

    sget-object p0, Ll08;->a:Ll08;

    invoke-virtual {p3, p0}, Ltn;->L(Ljava/util/List;)V

    return-void
.end method

.method public final j()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final k()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final m()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
