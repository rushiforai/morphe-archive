.class public Ll/oui0;
.super Ll/cui0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cui0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/sfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oui0;->h(Ll/sfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Ll/sfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oui0;->i(Ll/sfh0$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Ll/sfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/cui0;->e()Lcom/p1/mobile/putong/data/Counter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/cui0;->e()Lcom/p1/mobile/putong/data/Counter;

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
    iget-object p0, p1, Ll/sfh0$a;->b:Ll/yfl;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    iget-object p0, p1, Ll/sfh0$a;->c:Ll/ik4;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    const-string v1, "p_home,likelimit"

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    const/4 v4, 0x0

    .line 47
    const/4 v5, 0x0

    .line 48
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    new-instance v1, Ll/oui0$a;

    .line 53
    .line 54
    invoke-direct {v1, p0, v0, p1}, Ll/oui0$a;-><init>(Ll/oui0;Lcom/p1/mobile/putong/data/CounterLikeLimit;Ll/sfh0$a;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ll/oui0$a;->run()V

    .line 58
    .line 59
    .line 60
    :goto_1
    iget-object p0, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 61
    .line 62
    iget-object p1, p1, Ll/sfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 63
    .line 64
    const-string v0, "failExhaustSwipe"

    .line 65
    .line 66
    invoke-virtual {p0, p1, v0}, Ll/tel;->I2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 70
    .line 71
    return-object p0
.end method

.method public i(Ll/sfh0$a;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/cui0;->e()Lcom/p1/mobile/putong/data/Counter;

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
    invoke-virtual {p0, p1}, Ll/cui0;->g(Ll/sfh0$a;)Z

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
