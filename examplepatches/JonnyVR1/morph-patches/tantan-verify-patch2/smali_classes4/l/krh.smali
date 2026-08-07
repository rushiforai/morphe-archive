.class public Ll/krh;
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

.method public static synthetic h(Ll/frh$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/frh$a;->g:Ll/ttl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ttl;->y()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i(Ll/frh$a;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/frh$a;->g:Ll/ttl;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/ttl;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/frh$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/krh;->j(Ll/frh$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Ll/krh;->k(Ll/frh$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j(Ll/frh$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 8

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->u0:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object v1, p1, Ll/frh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iget-object p0, p1, Ll/frh$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 17
    .line 18
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v0, ""

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    iget-object p0, p1, Ll/frh$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 50
    .line 51
    const-string v0, "male"

    .line 52
    .line 53
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    new-instance v6, Ll/irh;

    .line 58
    .line 59
    invoke-direct {v6, p1}, Ll/irh;-><init>(Ll/frh$a;)V

    .line 60
    .line 61
    .line 62
    new-instance v7, Ll/jrh;

    .line 63
    .line 64
    invoke-direct {v7, p1}, Ll/jrh;-><init>(Ll/frh$a;)V

    .line 65
    .line 66
    .line 67
    const/4 v2, 0x1

    .line 68
    invoke-static/range {v1 .. v7}, Ll/hl3;->G(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p1, Ll/frh$a;->g:Ll/ttl;

    .line 72
    .line 73
    iget-object p1, p1, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 74
    .line 75
    const-string v0, "failFirstSwipe"

    .line 76
    .line 77
    invoke-interface {p0, p1, v0}, Ll/ttl;->k2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 81
    .line 82
    return-object p0
.end method

.method public k(Ll/frh$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/frh$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->u0:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/rbb0;->t()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/t450;->j()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method
