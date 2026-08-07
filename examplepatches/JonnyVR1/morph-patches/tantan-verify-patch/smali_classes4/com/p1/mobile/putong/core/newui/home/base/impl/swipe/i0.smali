.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# instance fields
.field public g:I

.field public h:[J

.field public i:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gra;->g1()Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->enable:Z

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/gra;->g1()Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->countPerSecond:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v1

    .line 21
    :goto_0
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;->g:I

    .line 22
    .line 23
    new-array v0, v0, [J

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;->h:[J

    .line 26
    .line 27
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;->i:I

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

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
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 10

    .line 1
    invoke-static {}, Ll/gra;->g1()Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->enable:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;->i:I

    .line 16
    .line 17
    add-int/lit8 v3, p1, 0x1

    .line 18
    .line 19
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;->g:I

    .line 20
    .line 21
    if-lt v3, v4, :cond_1

    .line 22
    .line 23
    move v3, v0

    .line 24
    :cond_1
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;->h:[J

    .line 25
    .line 26
    aget-wide v6, v5, v3

    .line 27
    .line 28
    sub-long v6, v1, v6

    .line 29
    .line 30
    const-wide/16 v8, 0x3e8

    .line 31
    .line 32
    cmp-long v3, v6, v8

    .line 33
    .line 34
    const/4 v6, 0x1

    .line 35
    if-gez v3, :cond_2

    .line 36
    .line 37
    return v6

    .line 38
    :cond_2
    aput-wide v1, v5, p1

    .line 39
    .line 40
    add-int/2addr p1, v6

    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;->i:I

    .line 42
    .line 43
    if-lt p1, v4, :cond_3

    .line 44
    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;->i:I

    .line 46
    .line 47
    :cond_3
    return v0
.end method
