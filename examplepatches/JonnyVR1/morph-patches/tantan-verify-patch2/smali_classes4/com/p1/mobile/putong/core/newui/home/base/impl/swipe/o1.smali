.class public final Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;,
        Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;
    }
.end annotation


# direct methods
.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;->onCancel()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/a5i0;->Y0()V

    .line 6
    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;->a()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static c(Ljava/lang/Object;)V
    .locals 1

    .line 1
    instance-of v0, p0, Ll/f1g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/f1g0;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/f1g0;->d()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ll/f1g0;->d()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    instance-of v0, v0, Ll/q7m;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-interface {p0}, Ll/f1g0;->y()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_8

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;->a:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;->b:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 12
    .line 13
    if-eq v1, v2, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;->c:Z

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    return v0

    .line 21
    :cond_2
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/a5i0;->j1()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_3

    .line 30
    .line 31
    return v0

    .line 32
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;->a:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {}, Ll/s7a;->w()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_4

    .line 41
    .line 42
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2, v1}, Ll/z5h0;->l(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_4

    .line 51
    .line 52
    return v0

    .line 53
    :cond_4
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2, v1}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mf()Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    const/4 v3, 0x1

    .line 74
    if-eqz v2, :cond_5

    .line 75
    .line 76
    invoke-static {}, Ll/a5i0;->v0()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-le v1, v2, :cond_5

    .line 81
    .line 82
    invoke-static {}, Ll/a5i0;->x0()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-gt v1, v2, :cond_5

    .line 87
    .line 88
    return v3

    .line 89
    :cond_5
    invoke-static {}, Ll/a5i0;->L1()Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_8

    .line 94
    .line 95
    invoke-static {}, Ll/a5i0;->J1()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-nez v1, :cond_6

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_6
    invoke-static {}, Ll/d79;->j0()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$b;->d:Z

    .line 109
    .line 110
    if-eqz p0, :cond_7

    .line 111
    .line 112
    return v0

    .line 113
    :cond_7
    return v3

    .line 114
    :cond_8
    :goto_0
    return v0
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    new-instance v0, Ll/b4i0;

    .line 10
    .line 11
    invoke-direct {v0, p2}, Ll/b4i0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/c4i0;

    .line 15
    .line 16
    invoke-direct {v1, p2}, Ll/c4i0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;)V

    .line 17
    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    if-le p1, p2, :cond_0

    .line 21
    .line 22
    invoke-static {p0, p1, v0, v1}, Ll/o5h0;->w(Lcom/p1/mobile/android/app/Act;ILl/x20;Ll/x20;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP_SUPERLIKE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 27
    .line 28
    invoke-static {p0, p1, v0, v1}, Ll/a5i0;->B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
