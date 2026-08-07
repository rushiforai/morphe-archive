.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n1;
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n1;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n1;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ik4;->f()Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->e:Z

    .line 10
    .line 11
    invoke-virtual {p0, v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->I0(Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 18
    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->H(Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    .line 24
    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-object v0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isLivingCard()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    xor-int/lit8 p0, p0, 0x1

    .line 20
    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method
