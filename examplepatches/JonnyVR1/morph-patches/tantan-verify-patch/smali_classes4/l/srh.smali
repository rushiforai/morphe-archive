.class public Ll/srh;
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

.method public static synthetic h(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/frh$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/srh;->i(Ll/frh$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Ll/srh;->j(Ll/frh$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i(Ll/frh$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 8

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object v0, p1, Ll/frh$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {}, Ll/spl0;->Z()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const-string v1, "p_home,superlike"

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    if-le p0, v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p1, Ll/frh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    new-instance v2, Ll/rrh;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/rrh;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/a30;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget-object p0, p1, Ll/frh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :goto_0
    iget-object p0, p1, Ll/frh$a;->g:Ll/ttl;

    .line 57
    .line 58
    iget-object p1, p1, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 59
    .line 60
    const-string v0, "failExhaustSuperlike"

    .line 61
    .line 62
    invoke-interface {p0, p1, v0}, Ll/ttl;->k2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    iget-object v1, p1, Ll/frh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 69
    .line 70
    const/4 v6, 0x0

    .line 71
    iget-object v7, p1, Ll/frh$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    const-string v2, "p_home,superlike"

    .line 74
    .line 75
    const/4 v4, 0x0

    .line 76
    const/4 v5, 0x0

    .line 77
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p1, Ll/frh$a;->g:Ll/ttl;

    .line 81
    .line 82
    iget-object p1, p1, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 83
    .line 84
    const-string v0, "failLessVipSuperLike"

    .line 85
    .line 86
    invoke-interface {p0, p1, v0}, Ll/ttl;->k2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 90
    .line 91
    return-object p0
.end method

.method public j(Ll/frh$a;)Z
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 8
    .line 9
    iget-object v0, p1, Ll/frh$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    move v0, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v2

    .line 20
    :goto_0
    invoke-static {}, Ll/spl0;->Z()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_3

    .line 25
    .line 26
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object p1, p1, Ll/frh$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, p1}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-static {v0}, Ll/a5i0;->w0(I)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-lt v0, p1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-static {p0}, Ll/a5i0;->w0(I)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_2

    .line 59
    .line 60
    :cond_1
    return v3

    .line 61
    :cond_2
    return v2

    .line 62
    :cond_3
    if-eqz v0, :cond_4

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-static {p0}, Ll/a5i0;->w0(I)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-nez p0, :cond_4

    .line 73
    .line 74
    return v3

    .line 75
    :cond_4
    return v2
.end method
