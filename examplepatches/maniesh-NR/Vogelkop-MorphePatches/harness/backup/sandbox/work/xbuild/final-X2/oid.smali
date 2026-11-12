.class public final synthetic Loid;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvid;
.implements Lmpd;
.implements Lzpd;
.implements Ldkj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lc4j;ZZLnod;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loid;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Loid;->a:Z

    iput-boolean p3, p0, Loid;->b:Z

    iput-object p4, p0, Loid;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;ZZ)V
    .registers 5

    .line 12
    iput-object p1, p0, Loid;->c:Ljava/lang/Object;

    iput-object p2, p0, Loid;->d:Ljava/lang/Object;

    iput-boolean p3, p0, Loid;->a:Z

    iput-boolean p4, p0, Loid;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 9

    iget-object v0, p0, Loid;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lnlh;

    iget-object v0, p0, Loid;->d:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lilh;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, v4, Lilh;->f:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v0, v1}, Lmdb;->i(Landroid/content/Intent;Landroid/net/Uri;)V

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.LOCAL_ONLY"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v1

    invoke-static {v1}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object v3

    iget-object v7, v3, Ldx3;->j:Lqi;

    new-instance v1, Lllh;

    iget-boolean v5, p0, Loid;->a:Z

    iget-boolean v6, p0, Loid;->b:Z

    invoke-direct/range {v1 .. v6}, Lllh;-><init>(Lnlh;Ldx3;Lilh;ZZ)V

    const/4 p0, 0x0

    invoke-virtual {v7, v0, v1, p0}, Lorg/chromium/ui/base/WindowAndroid;->t(Landroid/content/Intent;Lr1o;Ljava/lang/Integer;)Z

    return-void
.end method

.method public final b(Lnod;)V
    .registers 10

    iget-object v0, p0, Loid;->c:Ljava/lang/Object;

    check-cast v0, Laqd;

    iget-object v1, p0, Loid;->d:Ljava/lang/Object;

    check-cast v1, Lqjd;

    iget-object v2, v0, Laqd;->f:Lnpd;

    invoke-static {v1}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object v4

    const/4 v5, -0x1

    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lnpd;->p(Lnod;Lcsh;IJ)Lc5j;

    move-result-object p1

    new-instance v1, Lkm5;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v0, v1, Lkm5;->d:Ljava/lang/Object;

    iput-object v3, v1, Lkm5;->c:Ljava/lang/Object;

    iget-boolean v0, p0, Loid;->a:Z

    iput-boolean v0, v1, Lkm5;->a:Z

    iget-boolean p0, p0, Loid;->b:Z

    iput-boolean p0, v1, Lkm5;->b:Z

    new-instance p0, Lvr9;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v1, v0}, Lvr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v0, Lm97;->a:Lm97;

    invoke-virtual {p1, p0, v0}, Lm4;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public final c(Lmod;I)V
    .registers 10

    iget-object v0, p0, Loid;->c:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lc4j;

    iget-object v0, p0, Loid;->d:Ljava/lang/Object;

    check-cast v0, Lnod;

    iget v6, v0, Lnod;->c:I

    iget-boolean v4, p0, Loid;->a:Z

    iget-boolean v5, p0, Loid;->b:Z

    move-object v1, p1

    move v2, p2

    invoke-interface/range {v1 .. v6}, Lmod;->h(ILc4j;ZZI)V

    return-void
.end method

.method public final run(J)V
    .registers 10

    iget-object v0, p0, Loid;->c:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, [B

    iget-object v0, p0, Loid;->d:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, [Ljava/lang/Object;

    sget-object v0, Lorg/chromium/media/MediaDrmBridge;->n:Ljava/util/UUID;

    iget-boolean v5, p0, Loid;->a:Z

    iget-boolean v6, p0, Loid;->b:Z

    move-wide v1, p1

    invoke-static/range {v1 .. v6}, LJ/N;->Mk8V79M2(JLjava/lang/Object;Ljava/lang/Object;ZZ)V

    return-void
.end method
