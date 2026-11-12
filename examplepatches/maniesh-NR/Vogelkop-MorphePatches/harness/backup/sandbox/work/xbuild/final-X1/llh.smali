.class public final synthetic Lllh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr1o;


# instance fields
.field public final synthetic a:Lnlh;

.field public final synthetic b:Ldx3;

.field public final synthetic c:Lilh;

.field public final synthetic d:Z

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lnlh;Ldx3;Lilh;ZZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lllh;->a:Lnlh;

    iput-object p2, p0, Lllh;->b:Ldx3;

    iput-object p3, p0, Lllh;->c:Lilh;

    iput-boolean p4, p0, Lllh;->d:Z

    iput-boolean p5, p0, Lllh;->e:Z

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 11

    const/4 v0, -0x1

    if-ne p1, v0, :cond_fc

    if-eqz p2, :cond_fc

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_fc

    invoke-virtual {p2}, Landroid/content/Intent;->getFlags()I

    move-result v0

    const/4 v1, 0x3

    and-int/2addr v0, v1

    iget-boolean v5, p0, Lllh;->d:Z

    iget-boolean v6, p0, Lllh;->e:Z

    if-ne v0, v1, :cond_7e

    iget-object v0, p0, Lllh;->b:Ldx3;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    invoke-static {v0, p1}, Ldd7;->e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object v1

    invoke-virtual {v1}, Lrlj;->g()Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lllh;->c:Lilh;

    iget-object v2, v4, Lilh;->f:Ljava/lang/String;

    const-string v3, "content://"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_41

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v0, v2}, Ldd7;->e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object v0

    invoke-virtual {v0}, Lrlj;->g()Ljava/lang/String;

    move-result-object v0

    goto :goto_64

    :cond_41
    const-string v0, "file://"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5b

    new-instance v0, Ljava/io/File;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_64

    :cond_5b
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_64
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7e

    iget-object v3, p0, Lllh;->a:Lnlh;

    iget-object p0, v3, Lnlh;->D:Lglh;

    iget-wide v0, v4, Lilh;->a:J

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Lhvc;

    const/4 v7, 0x1

    invoke-direct/range {v2 .. v7}, Lhvc;-><init>(Ljava/lang/Object;Ljava/lang/Object;ZZB)V

    invoke-virtual {p0, v2, p1, v0, v1}, Lglh;->h(Ljava/lang/Runnable;Ljava/lang/String;J)V

    return-void

    :cond_7e
    invoke-virtual {p2}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object p0

    const-string p2, "multipart/related"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b2

    const-string v0, "message/rfc822"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a0

    const-string v0, "application/octet-stream"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b0

    :cond_a0
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls29;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "mhtml"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b2

    :cond_b0
    const/4 p0, 0x0

    goto :goto_bd

    :cond_b2
    new-instance p0, Ljava/util/HashMap;

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Ljava/util/HashMap;-><init>(I)V

    const-string v0, "X-Chrome-intent-type"

    invoke-virtual {p0, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_bd
    sget-object p2, Llqm;->m:Llqm;

    const/4 v0, 0x0

    if-eqz p0, :cond_e3

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_e3

    new-instance v1, Llsc;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Lksc;-><init>(Ljava/lang/String;I)V

    iput-object p0, v1, Lksc;->f:Ljava/util/HashMap;

    new-instance p0, Lvx3;

    invoke-direct {p0, p2}, Lvx3;-><init>(Llqm;)V

    new-instance p1, Lxx3;

    invoke-direct {p1, v1}, Lxx3;-><init>(Llsc;)V

    iget-object p2, p0, Lvx3;->p:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_eb

    :cond_e3
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p2, v0}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    :goto_eb
    xor-int/lit8 p1, v5, 0x1

    invoke-virtual {p0, p1}, Lvx3;->a(Z)V

    invoke-virtual {p0, v5}, Lvx3;->d(Z)V

    invoke-virtual {p0, v5}, Lvx3;->c(Z)V

    invoke-virtual {p0, v6}, Lvx3;->e(Z)V

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    :cond_fc
    return-void
.end method
