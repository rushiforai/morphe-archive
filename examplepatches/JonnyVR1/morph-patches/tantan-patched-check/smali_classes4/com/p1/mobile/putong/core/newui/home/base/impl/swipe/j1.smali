.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j1;
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j1;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j1;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

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
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->t0:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->v0:Ll/jxd0;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->n()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    long-to-double v0, v0

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->n()Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 59
    .line 60
    sub-double/2addr v0, p0

    .line 61
    const-wide p0, 0x41aee62800000000L    # 2.592E8

    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    cmpl-double p0, v0, p0

    .line 67
    .line 68
    if-ltz p0, :cond_1

    .line 69
    .line 70
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->v0:Ll/jxd0;

    .line 75
    .line 76
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->t0:Ll/jxd0;

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_1
    const/4 p0, 0x0

    .line 91
    return p0
.end method
