.class public Ll/bsv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/asv;


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
.method public a()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/cmp0;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public b()V
    .locals 0

    .line 1
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/cmp0;->a()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/pzm;->c()Ll/pzm;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/pzm;->b()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public c(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/jfv;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {p0, p2}, Ll/z91;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public e()J
    .locals 2

    .line 1
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ifv;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ifv;->c:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    return-wide v0
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/cmp0;->b()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public g()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/cmp0;->f()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getFakeId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h()J
    .locals 2

    .line 1
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ifv;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ifv;->b:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    return-wide v0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/cmp0;->e()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public j(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    invoke-static {p0, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/ere;->t(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;
    .locals 0

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/z91;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/pn0;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/n4o0;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Ll/pn0;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-static {p1, p2}, Ll/pn0;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 2
    .line 3
    return p0
.end method

.method public q(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/ere;->q(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public r(J)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;
    .locals 0

    .line 1
    sget-object p0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/hiv;->f(J)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/data/LiveRegionTag;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/aiv;->Y0(Lcom/p1/mobile/putong/data/LiveRegionTag;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/jfv;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/jfv;->m(Lcom/p1/mobile/putong/data/User;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
