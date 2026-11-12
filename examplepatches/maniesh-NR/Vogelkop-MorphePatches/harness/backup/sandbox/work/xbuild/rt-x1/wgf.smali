.class public final Lwgf;
.super Ls0f;
.source "SourceFile"


# instance fields
.field public final c:Landroid/net/Uri;

.field public final d:Llqm;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Bundle;)V
    .registers 7

    invoke-direct {p0, p2}, Ls0f;-><init>(Landroid/os/Bundle;)V

    const/16 v0, 0xb

    const-string v1, "action_open_url_origin"

    invoke-virtual {p2, v1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Llqm;->d(I)Llqm;

    move-result-object v0

    if-nez v0, :cond_13

    sget-object v0, Llqm;->i:Llqm;

    :cond_13
    const-string v1, "action_open_url"

    invoke-virtual {p2, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p2}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_3e

    invoke-static {p2}, Lmdb;->e(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_37

    sget-object p2, Llk6;->a:Llk6;

    sget-object p2, Lik6;->b:Lik6;

    const/4 v3, 0x0

    invoke-static {v3, p2, v0, p1, v2}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_37

    iput-object v2, p0, Lwgf;->c:Landroid/net/Uri;

    iput-object v0, p0, Lwgf;->d:Llqm;

    return-void

    :cond_37
    new-instance p0, Ldjb;

    const/4 p1, 0x0

    invoke-direct {p0, v1, p1}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_3e
    new-instance p0, Ldjb;

    invoke-direct {p0, v1}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public constructor <init>(Landroid/net/Uri;Llqm;)V
    .registers 3

    .line 68
    invoke-direct {p0}, Ls0f;-><init>()V

    .line 69
    iput-object p1, p0, Lwgf;->c:Landroid/net/Uri;

    .line 70
    iput-object p2, p0, Lwgf;->d:Llqm;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    const-string v0, "com.opera.android.action.OPEN_URL"

    invoke-virtual {p0, p1, v0}, Ls0f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public final c()Landroid/os/Bundle;
    .registers 4

    invoke-super {p0}, Ls0f;->c()Landroid/os/Bundle;

    move-result-object v0

    iget-object v1, p0, Lwgf;->c:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "action_open_url"

    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lwgf;->d:Llqm;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const-string v1, "action_open_url_origin"

    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method

.method public final e(Lcom/opera/android/BrowserActivity;)Z
    .registers 5

    sget-object v0, Llk6;->a:Llk6;

    sget-object v0, Lik6;->a:Lik6;

    const/4 v1, 0x0

    iget-object v2, p0, Lwgf;->d:Llqm;

    iget-object p0, p0, Lwgf;->c:Landroid/net/Uri;

    invoke-static {v1, v0, v2, p1, p0}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    return p0
.end method

.method public final f(Landroid/content/Context;)Landroid/net/Uri;
    .registers 5

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lc37;

    new-instance v1, Lt1;

    const/16 v2, 0xc

    invoke-direct {v1, p1, v2}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance p1, Lrqd;

    const/16 v2, 0x1a

    invoke-direct {p1, v2}, Lrqd;-><init>(B)V

    invoke-direct {v0, v1, p1}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, p0, Lwgf;->c:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lc37;->A(Ljava/lang/String;)Lz0c;

    move-result-object p1

    if-nez p1, :cond_24

    const/4 p0, 0x0

    :cond_24
    return-object p0
.end method

.method public final g(Landroid/content/Context;)Z
    .registers 5

    sget-object v0, Llk6;->a:Llk6;

    sget-object v0, Lik6;->b:Lik6;

    const/4 v1, 0x0

    iget-object v2, p0, Lwgf;->d:Llqm;

    iget-object p0, p0, Lwgf;->c:Landroid/net/Uri;

    invoke-static {v1, v0, v2, p1, p0}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    return p0
.end method
