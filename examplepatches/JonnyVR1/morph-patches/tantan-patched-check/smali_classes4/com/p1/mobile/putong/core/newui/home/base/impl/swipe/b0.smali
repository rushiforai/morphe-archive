.class public final Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001f\u0010\u0013\u001a\u00020\u000c2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0;",
        "Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;",
        "params",
        "",
        "r",
        "(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z",
        "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
        "p",
        "(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
        "",
        "q",
        "(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V",
        "Lcom/p1/mobile/putong/core/data/SwipeDirection;",
        "direction",
        "",
        "id",
        "s",
        "(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ljava/lang/String;)V",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0;->r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/qap;->Companion:Ll/qap$a;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/qap$a;->k()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMeSlideCardTop:Z

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/joa;->f4()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/qap$a;->p()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 35
    .line 36
    .line 37
    move-result-wide p0

    .line 38
    invoke-virtual {v0, p0, p1}, Ll/qap$a;->u(J)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    invoke-virtual {v0, p0}, Ll/qap$a;->s(Z)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0;->s(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, p0}, Ll/qap$a;->y(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 88
    .line 89
    invoke-virtual {p1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->N7()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    const-string v2, ""

    .line 111
    .line 112
    invoke-virtual {v0, p0, p1, v2, v1}, Ll/qap$a;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;I)V

    .line 113
    .line 114
    .line 115
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 116
    .line 117
    .line 118
    move-result-wide p0

    .line 119
    invoke-virtual {v0, p0, p1}, Ll/qap$a;->u(J)V

    .line 120
    .line 121
    .line 122
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 123
    .line 124
    return-object p0
.end method

.method public final q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 8

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0$a;->a:[I

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    aget p0, v0, p0

    .line 14
    .line 15
    :goto_0
    const/4 v0, 0x1

    .line 16
    if-eq p0, v0, :cond_3

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    if-eq p0, v0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    if-eq p0, v0, :cond_1

    .line 23
    .line 24
    const-string p0, ""

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    const-string p0, "up"

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    const-string p0, "right"

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_3
    const-string p0, "left"

    .line 34
    .line 35
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/ik4;->g()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "moments_user_id"

    .line 42
    .line 43
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string p1, "card_name"

    .line 48
    .line 49
    const-string v0, "vas_show_he_liked"

    .line 50
    .line 51
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string p1, "show_he_liked"

    .line 56
    .line 57
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    const-string p1, "direction"

    .line 64
    .line 65
    const-string v0, "dislike"

    .line 66
    .line 67
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/r4a;->b()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const-string v0, "card_order"

    .line 84
    .line 85
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    const-string p1, "is_guided_action"

    .line 90
    .line 91
    const-string v0, "0"

    .line 92
    .line 93
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    const-string p1, "swipe_directions"

    .line 98
    .line 99
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    filled-new-array/range {v1 .. v7}, [Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string p1, "e_card"

    .line 108
    .line 109
    const-string v0, "p_suggest_users_home_view"

    .line 110
    .line 111
    invoke-static {p1, v0, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/qap;->Companion:Ll/qap$a;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Ll/qap$a;->s(Z)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x1

    .line 23
    if-nez v2, :cond_4

    .line 24
    .line 25
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMeSlideCardTop:Z

    .line 32
    .line 33
    if-eqz v2, :cond_4

    .line 34
    .line 35
    invoke-static {}, Ll/joa;->f4()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_4

    .line 40
    .line 41
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 42
    .line 43
    invoke-virtual {v2}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iget-object v4, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 48
    .line 49
    invoke-virtual {v4}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v0, v2, v4}, Ll/qap$a;->n(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_4

    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 60
    .line 61
    if-nez p0, :cond_0

    .line 62
    .line 63
    const/4 p0, -0x1

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0$a;->a:[I

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    aget p0, v0, p0

    .line 72
    .line 73
    :goto_0
    if-eq p0, v3, :cond_3

    .line 74
    .line 75
    const/4 v0, 0x2

    .line 76
    if-eq p0, v0, :cond_2

    .line 77
    .line 78
    const/4 v0, 0x3

    .line 79
    if-eq p0, v0, :cond_1

    .line 80
    .line 81
    const-string p0, ""

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    const-string p0, "up"

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    const-string p0, "right"

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_3
    const-string p0, "left"

    .line 91
    .line 92
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 93
    .line 94
    invoke-virtual {p1}, Ll/ik4;->g()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const-string v0, "moments_user_id"

    .line 99
    .line 100
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const-string v0, "card_name"

    .line 105
    .line 106
    const-string v2, "svip_see_enhance"

    .line 107
    .line 108
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    const-string v2, "show_he_liked"

    .line 113
    .line 114
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 115
    .line 116
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 123
    .line 124
    invoke-virtual {v3}, Ll/r4a;->b()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    const-string v4, "card_order"

    .line 133
    .line 134
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    const-string v4, "swipe_directions"

    .line 139
    .line 140
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    filled-new-array {p1, v0, v2, v3, p0}, [Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    const-string p1, "e_card"

    .line 149
    .line 150
    const-string v0, "p_suggest_users_home_view"

    .line 151
    .line 152
    invoke-static {p1, v0, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 153
    .line 154
    .line 155
    return v1

    .line 156
    :cond_4
    invoke-virtual {v0}, Ll/qap$a;->k()Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-eqz v2, :cond_5

    .line 161
    .line 162
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 163
    .line 164
    invoke-virtual {v2}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMeSlideCardTop:Z

    .line 169
    .line 170
    if-eqz v2, :cond_5

    .line 171
    .line 172
    invoke-static {}, Ll/joa;->f4()Z

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    if-eqz v2, :cond_5

    .line 177
    .line 178
    invoke-virtual {v0}, Ll/qap$a;->p()Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-eqz v2, :cond_5

    .line 183
    .line 184
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 185
    .line 186
    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0, v1}, Ll/qap$a;->y(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 199
    .line 200
    .line 201
    return v3

    .line 202
    :cond_5
    return v1
.end method

.method public final s(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ljava/lang/String;)V
    .locals 7

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-eq p0, p1, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_0

    .line 17
    .line 18
    const-string p0, ""

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p0, "up"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string p0, "right"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    const-string p0, "left"

    .line 28
    .line 29
    :goto_0
    const-string v0, "show_he_liked"

    .line 30
    .line 31
    invoke-static {v0, p1}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string p1, "card_name"

    .line 36
    .line 37
    const-string v0, "vas_show_he_liked"

    .line 38
    .line 39
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const-string p1, "swipe_directions"

    .line 44
    .line 45
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/r4a;->b()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    const-string p1, "card_order"

    .line 58
    .line 59
    invoke-static {p1, p0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const-string p0, "is_guided_action"

    .line 64
    .line 65
    const-string p1, "0"

    .line 66
    .line 67
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    const-string p0, "moments_user_id"

    .line 72
    .line 73
    invoke-static {p0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    filled-new-array/range {v1 .. v6}, [Ll/sfj0$a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "e_card"

    .line 82
    .line 83
    const-string p2, "p_suggest_users_home_view"

    .line 84
    .line 85
    invoke-static {p1, p2, p0}, Ll/sfj0;->g(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
