.class public abstract Ldij;
.super Ls0f;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/String;

.field public final d:Lcue;

.field public final e:Z


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .registers 5

    invoke-direct {p0, p1}, Ls0f;-><init>(Landroid/os/Bundle;)V

    const-string v0, "show_news_request_id"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ldij;->c:Ljava/lang/String;

    const-string v0, "show_news_backend"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3b

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "newsfeed"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    sget-object v2, Lcue;->b:Lcue;

    if-eqz v1, :cond_26

    sget-object v1, Lcue;->c:Lcue;

    goto :goto_27

    :cond_26
    move-object v1, v2

    :goto_27
    iput-object v1, p0, Ldij;->d:Lcue;

    if-eq v1, v2, :cond_34

    const-string v0, "show_news_reusable"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Ldij;->e:Z

    return-void

    :cond_34
    new-instance p0, Ldjb;

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_3b
    new-instance p0, Ldjb;

    invoke-direct {p0, v0}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final d(Landroid/content/Context;)Lyhe;
    .registers 5

    invoke-virtual {p0, p1}, Ls0f;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    iget-boolean p0, p0, Ldij;->e:Z

    const/4 v1, 0x0

    if-eqz p0, :cond_16

    sget-object p0, Lmdb;->b:Ljava/util/Random;

    invoke-virtual {p0}, Ljava/util/Random;->nextInt()I

    move-result p0

    const/high16 v2, 0x8000000

    invoke-static {p1, p0, v0, v2, v1}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object p0

    return-object p0

    :cond_16
    sget-object p0, Lmdb;->b:Ljava/util/Random;

    invoke-virtual {p0}, Ljava/util/Random;->nextInt()I

    move-result p0

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {p1, p0, v0, v2, v1}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object p0

    return-object p0
.end method

.method public final g(Landroid/content/Context;)Z
    .registers 3

    sget-object v0, Lcue;->b:Lcue;

    iget-object p0, p0, Ldij;->d:Lcue;

    if-eq p0, v0, :cond_e

    invoke-static {p1}, Lfue;->c(Landroid/content/Context;)Lcue;

    move-result-object p1

    if-ne p0, p1, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method
