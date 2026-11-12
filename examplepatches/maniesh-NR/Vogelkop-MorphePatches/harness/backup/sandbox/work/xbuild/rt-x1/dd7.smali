.class public abstract Ldd7;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;
    .registers 3

    new-instance v0, Lrlj;

    invoke-direct {v0}, Lrlj;-><init>()V

    iput-object p0, v0, Lrlj;->b:Landroid/content/Context;

    iput-object p1, v0, Lrlj;->c:Landroid/net/Uri;

    return-object v0
.end method

.method public static f(Landroid/content/Context;Landroid/net/Uri;)Lrlj;
    .registers 4

    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_e

    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    :cond_e
    const/4 v1, 0x0

    if-eqz v0, :cond_27

    invoke-static {p1, v0}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_1d

    new-instance p1, Lrlj;

    invoke-direct {p1, p0, v0}, Lrlj;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    return-object p1

    :cond_1d
    const-string p0, "Failed to build documentUri from a tree: "

    invoke-static {p1, p0}, Lfki;->p(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1

    :cond_27
    const-string p0, "Could not get document ID from Uri: "

    invoke-static {p1, p0}, Lfki;->p(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public abstract a()Z
.end method

.method public abstract b()Z
.end method

.method public abstract c()Z
.end method

.method public abstract d()Z
.end method

.method public abstract g()Ljava/lang/String;
.end method

.method public abstract h()Ljava/lang/String;
.end method

.method public abstract i()Landroid/net/Uri;
.end method

.method public abstract j()J
.end method

.method public abstract k(Ljava/lang/String;)Z
.end method
