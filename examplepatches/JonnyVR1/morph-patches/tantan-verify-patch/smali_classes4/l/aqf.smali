.class public Ll/aqf;
.super Ll/rpf;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rpf;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/spf$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/aqf;->h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Ll/spf$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/aqf;->i(Ll/spf$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/rpf;->e()Lcom/p1/mobile/putong/data/Counter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    move-object v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 11
    .line 12
    :goto_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget v2, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 15
    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    const-wide/16 v4, 0x0

    .line 23
    .line 24
    cmp-long v0, v2, v4

    .line 25
    .line 26
    if-lez v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/rpf;->g(Ll/spf$a;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p1, Ll/spf$a;->k:Ll/btl;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/spf$a;->a()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    const-string v3, "other"

    .line 41
    .line 42
    invoke-interface {v0, v2, v3}, Ll/btl;->M3(ZLjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-virtual {p0}, Ll/rpf;->e()Lcom/p1/mobile/putong/data/Counter;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/rpf;->e()Lcom/p1/mobile/putong/data/Counter;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 56
    .line 57
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 58
    .line 59
    invoke-static {v0}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    invoke-static {}, Ll/nmp;->a()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    iget-object v2, p1, Ll/spf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 74
    .line 75
    const/4 v7, 0x0

    .line 76
    iget-object v8, p1, Ll/spf$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    const-string v3, "p_home,likelimit"

    .line 79
    .line 80
    const/4 v5, 0x0

    .line 81
    const/4 v6, 0x0

    .line 82
    invoke-static/range {v2 .. v8}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    new-instance v0, Ll/aqf$a;

    .line 87
    .line 88
    invoke-direct {v0, p0, v1, p1}, Ll/aqf$a;-><init>(Ll/aqf;Lcom/p1/mobile/putong/data/CounterLikeLimit;Ll/spf$a;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ll/aqf$a;->run()V

    .line 92
    .line 93
    .line 94
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 95
    .line 96
    return-object p0
.end method

.method public i(Ll/spf$a;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/rpf;->e()Lcom/p1/mobile/putong/data/Counter;

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
    invoke-virtual {p0, p1}, Ll/rpf;->g(Ll/spf$a;)Z

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
