.class public Ll/plp;
.super Ll/ufp;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ufp;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static k(Ll/rfh0$a;)Z
    .locals 5

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/rfh0$a;->c:Ll/ik4;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/rfh0$a;->c:Ll/ik4;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;

    .line 21
    .line 22
    iget-object v2, p0, Ll/rfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 23
    .line 24
    iget-object v3, p0, Ll/rfh0$a;->a:Ll/hjp;

    .line 25
    .line 26
    invoke-virtual {v3}, Ll/hjp;->E1()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    iget-object p0, p0, Ll/rfh0$a;->a:Ll/hjp;

    .line 31
    .line 32
    iget-object v4, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, v4}, Ll/hjp;->C1(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-direct {v1, v0, v2, v3, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/SwipeDirection;ZZ)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1;->d(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 47
    return p0
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/rfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/plp;->i(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Ll/rfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/plp;->j(Ll/rfh0$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 3

    .line 1
    iget-object v0, p1, Ll/rfh0$a;->a:Ll/hjp;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hjp;->F1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p1, Ll/rfh0$a;->a:Ll/hjp;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/hjp;->i1()V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const/4 v0, 0x1

    .line 18
    invoke-virtual {v1, v0}, Ll/hjp;->C2(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/plp$a;

    .line 36
    .line 37
    invoke-direct {v2, p0, p1}, Ll/plp$a;-><init>(Ll/plp;Ll/rfh0$a;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p1, Ll/rfh0$a;->a:Ll/hjp;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/hjp;->i1()V

    .line 46
    .line 47
    .line 48
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 49
    .line 50
    return-object p0
.end method

.method public j(Ll/rfh0$a;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/plp;->k(Ll/rfh0$a;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
