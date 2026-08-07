.class public Ll/j6t;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/bsv;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Ll/asv;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Ll/asv;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/asv;->f()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/asv;->b()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(J)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Ll/asv;->r(J)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p2}, Ll/asv;->l(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public g()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/asv;->h()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/asv;->getFakeId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public i()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/asv;->e()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public j()Ll/asv;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j6t;->a:Ll/bsv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/bsv;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/bsv;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/j6t;->a:Ll/bsv;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/j6t;->a:Ll/bsv;

    .line 13
    .line 14
    return-object p0
.end method

.method public k(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/asv;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public l()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/asv;->i()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public m(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/asv;->p(Landroid/app/Activity;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/asv;->g()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public o(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/asv;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/asv;->q(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/asv;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public r(Lcom/p1/mobile/putong/data/LiveRegionTag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/asv;->s(Lcom/p1/mobile/putong/data/LiveRegionTag;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/asv;->n(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Ll/asv;->j(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Ll/asv;->t(Lcom/p1/mobile/putong/data/User;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j6t;->j()Ll/asv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/asv;->k(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
