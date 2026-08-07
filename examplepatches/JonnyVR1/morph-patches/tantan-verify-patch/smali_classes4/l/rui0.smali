.class public Ll/rui0;
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

.method public static synthetic h(Ll/sfh0$a;ILcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sfh0$a;->b:Ll/yfl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yfl;->E1(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/sfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rui0;->i(Ll/sfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Ll/rui0;->j(Ll/sfh0$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i(Ll/sfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
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
    invoke-static {}, Ll/b240;->p5()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const-string v0, "p_home,superlike"

    .line 20
    .line 21
    :cond_0
    move-object v2, v0

    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-object v0, p1, Ll/sfh0$a;->c:Ll/ik4;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-static {}, Ll/spl0;->Z()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    if-le p0, v0, :cond_1

    .line 54
    .line 55
    iget-object v0, p1, Ll/sfh0$a;->b:Ll/yfl;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/qui0;

    .line 62
    .line 63
    invoke-direct {v1, p1, p0}, Ll/qui0;-><init>(Ll/sfh0$a;I)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v2, p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/a30;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    iget-object p0, p1, Ll/sfh0$a;->b:Ll/yfl;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    iget-object p0, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 80
    .line 81
    iget-object p1, p1, Ll/sfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 82
    .line 83
    const-string v0, "failExhaustSuperlike"

    .line 84
    .line 85
    invoke-virtual {p0, p1, v0}, Ll/tel;->I2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    iget-object p0, p1, Ll/sfh0$a;->b:Ll/yfl;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/yfl;->R()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 96
    .line 97
    iget-object p0, p1, Ll/sfh0$a;->c:Ll/ik4;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    const/4 v4, 0x0

    .line 104
    const/4 v5, 0x0

    .line 105
    const/4 v6, 0x0

    .line 106
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 110
    .line 111
    iget-object p1, p1, Ll/sfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 112
    .line 113
    const-string v0, "failLessVipSuperLike"

    .line 114
    .line 115
    invoke-virtual {p0, p1, v0}, Ll/tel;->I2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 119
    .line 120
    return-object p0
.end method

.method public j(Ll/sfh0$a;)Z
    .locals 5

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
    iget-object v0, p1, Ll/sfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    move v0, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v3

    .line 20
    :goto_0
    invoke-static {}, Ll/d79;->j0()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v1, p1, Ll/sfh0$a;->a:Ll/tel;

    .line 29
    .line 30
    iget-object v4, p1, Ll/sfh0$a;->c:Ll/ik4;

    .line 31
    .line 32
    invoke-virtual {v4}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v1, v4}, Ll/tel;->O1(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    return v3

    .line 45
    :cond_1
    invoke-static {}, Ll/spl0;->Z()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_4

    .line 50
    .line 51
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object p1, p1, Ll/sfh0$a;->c:Ll/ik4;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v1, p1}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-static {v0}, Ll/a5i0;->w0(I)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-lt v0, p1, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    invoke-static {p0}, Ll/a5i0;->w0(I)I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-nez p0, :cond_3

    .line 88
    .line 89
    :cond_2
    return v2

    .line 90
    :cond_3
    return v3

    .line 91
    :cond_4
    if-eqz v0, :cond_5

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    invoke-static {p0}, Ll/a5i0;->w0(I)I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-nez p0, :cond_5

    .line 102
    .line 103
    return v2

    .line 104
    :cond_5
    return v3
.end method
