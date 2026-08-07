.class public Ll/prh;
.super Ll/erh;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/erh;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/frh$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/prh;->h(Ll/frh$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/frh$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/prh;->i(Ll/frh$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Ll/frh$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/erh;->e()Lcom/p1/mobile/putong/data/Counter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/erh;->e()Lcom/p1/mobile/putong/data/Counter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    invoke-static {v1}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ll/nmp;->a()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object v2, p1, Ll/frh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 32
    .line 33
    const/4 v7, 0x0

    .line 34
    iget-object v8, p1, Ll/frh$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    const-string v3, "p_home,likelimit"

    .line 37
    .line 38
    const/4 v5, 0x0

    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-static/range {v2 .. v8}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    new-instance v1, Ll/prh$a;

    .line 45
    .line 46
    invoke-direct {v1, p0, v0, p1}, Ll/prh$a;-><init>(Ll/prh;Lcom/p1/mobile/putong/data/CounterLikeLimit;Ll/frh$a;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ll/prh$a;->run()V

    .line 50
    .line 51
    .line 52
    :goto_1
    iget-object p0, p1, Ll/frh$a;->g:Ll/ttl;

    .line 53
    .line 54
    iget-object p1, p1, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 55
    .line 56
    const-string v0, "failExhaustSwipe"

    .line 57
    .line 58
    invoke-interface {p0, p1, v0}, Ll/ttl;->k2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 62
    .line 63
    return-object p0
.end method

.method public i(Ll/frh$a;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/erh;->e()Lcom/p1/mobile/putong/data/Counter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 10
    .line 11
    :goto_0
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget v1, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    cmp-long v0, v0, v2

    .line 24
    .line 25
    if-lez v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/erh;->g(Ll/frh$a;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method
