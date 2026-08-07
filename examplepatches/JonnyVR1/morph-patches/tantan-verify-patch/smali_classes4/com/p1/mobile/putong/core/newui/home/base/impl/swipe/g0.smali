.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g0;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g0;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->h()Lcom/p1/mobile/putong/data/Counter;

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
    invoke-static {}, Ll/ric0;->m()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->c2:Ll/dw6;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/dw6;->t3()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_3

    .line 26
    .line 27
    :cond_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_3

    .line 32
    .line 33
    iget v1, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 34
    .line 35
    const/16 v2, 0x14

    .line 36
    .line 37
    if-eq v1, v2, :cond_2

    .line 38
    .line 39
    const/16 v2, 0xa

    .line 40
    .line 41
    if-ne v1, v2, :cond_3

    .line 42
    .line 43
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    const-wide/16 v2, 0x0

    .line 48
    .line 49
    cmp-long v0, v0, v2

    .line 50
    .line 51
    if-lez v0, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->k(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    invoke-static {}, Ll/s8d0;->i()Ll/s8d0;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/s8d0;->o()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_3

    .line 68
    .line 69
    invoke-static {}, Ll/rsh0;->e()Ll/rsh0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ll/rsh0;->c()Ll/ssh0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance p1, Ll/xrd;

    .line 78
    .line 79
    invoke-direct {p1}, Ll/xrd;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v0, "swipe"

    .line 83
    .line 84
    invoke-virtual {p0, v0, p1}, Ll/ssh0;->a(Ljava/lang/String;Ll/a5m;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    const/4 p0, 0x0

    .line 88
    return p0
.end method
