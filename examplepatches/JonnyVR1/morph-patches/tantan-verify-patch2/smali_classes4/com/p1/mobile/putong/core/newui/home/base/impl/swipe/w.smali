.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/w;
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

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/f1g0;->y()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/w;->r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/w;->s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->t0:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/igh0;

    .line 25
    .line 26
    invoke-direct {v1, p1}, Ll/igh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/jgh0;

    .line 30
    .line 31
    invoke-direct {v2, p1}, Ll/jgh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 32
    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    invoke-static {p0, v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->y1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 41
    .line 42
    const-string v1, "failFirstSwipe"

    .line 43
    .line 44
    invoke-virtual {p0, v0, v1}, Ll/b240;->P8(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/b240;->c5()V

    .line 50
    .line 51
    .line 52
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 53
    .line 54
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/d09;->g()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->k(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->t0:Ll/jxd0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method
