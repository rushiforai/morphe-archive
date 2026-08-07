.class public Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/g6m<",
        "Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;",
        "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/f59;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Wd(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p2}, Ll/f59;->f()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const-string p0, "\u5c0f\u7ea2\u82b1\u5df2\u53d1\u9001"

    .line 38
    .line 39
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/f59;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Wd(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p2}, Ll/f59;->f()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const-string p0, "\u793c\u8c8c\u56de\u8c22\u5df2\u53d1\u9001"

    .line 38
    .line 39
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->m(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->p(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->e:Ll/f59;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1}, Ll/epc0;->c(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->l(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    move-object p0, v0

    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    const/4 v6, 0x0

    .line 31
    const-string v7, ""

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    const-string v4, "p_interested_user"

    .line 35
    .line 36
    const/4 v5, 0x0

    .line 37
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Yn(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 41
    .line 42
    return-object p0
.end method

.method public j(Ll/f59;Lcom/p1/mobile/android/app/Act;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "card_user_id"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "e_follow"

    .line 18
    .line 19
    const-string v1, "p_interested_user"

    .line 20
    .line 21
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    iget-object p0, v4, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 39
    .line 40
    const-string p1, "default"

    .line 41
    .line 42
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_0

    .line 47
    .line 48
    iget-object p0, v4, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 51
    .line 52
    const-string p1, "followed"

    .line 53
    .line 54
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_0

    .line 59
    .line 60
    iget-object p0, v4, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 63
    .line 64
    const-string p1, "unknown_"

    .line 65
    .line 66
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_2

    .line 71
    .line 72
    :cond_0
    iget-object p0, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 75
    .line 76
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 77
    .line 78
    if-eqz p0, :cond_1

    .line 79
    .line 80
    sget p0, Lcom/p1/mobile/putong/core/R$string;->P:I

    .line 81
    .line 82
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    const/4 v6, 0x0

    .line 99
    const/4 v7, 0x0

    .line 100
    const/4 v5, 0x1

    .line 101
    invoke-interface/range {v2 .. v7}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->following(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    new-instance p1, Ll/k59;

    .line 110
    .line 111
    invoke-direct {p1}, Ll/k59;-><init>()V

    .line 112
    .line 113
    .line 114
    new-instance p2, Ll/l59;

    .line 115
    .line 116
    invoke-direct {p2}, Ll/l59;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    :cond_2
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)V
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->e:Ll/f59;

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, "card_user_id"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    filled-new-array {v0}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "e_interested_user_card_close"

    .line 39
    .line 40
    const-string v2, "p_interested_user"

    .line 41
    .line 42
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Wd(Ljava/lang/String;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance p1, Ll/g59;

    .line 64
    .line 65
    invoke-direct {p1}, Ll/g59;-><init>()V

    .line 66
    .line 67
    .line 68
    new-instance v0, Ll/h59;

    .line 69
    .line 70
    invoke-direct {v0}, Ll/h59;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    :cond_1
    :goto_0
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)V
    .locals 9

    .line 1
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->e:Ll/f59;

    .line 4
    .line 5
    if-eqz v1, :cond_4

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_4

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_4

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto/16 :goto_1

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    invoke-virtual {p1}, Ll/f59;->d()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Hj()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->vj(Z)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_1

    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 82
    .line 83
    iget p0, p0, Lcom/p1/mobile/putong/data/FeedFlower;->count:I

    .line 84
    .line 85
    if-lez p0, :cond_1

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->V9()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget-object v3, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 100
    .line 101
    const-string p0, "red_flower"

    .line 102
    .line 103
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    new-instance v7, Ll/i59;

    .line 108
    .line 109
    invoke-direct {v7, v8, v1, p1}, Ll/i59;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/f59;)V

    .line 110
    .line 111
    .line 112
    const/4 v4, 0x0

    .line 113
    const/4 v5, 0x0

    .line 114
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Vk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->V9()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    iget-object v3, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 131
    .line 132
    const-string p0, "reply_thanks"

    .line 133
    .line 134
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 135
    .line 136
    .line 137
    move-result-object v6

    .line 138
    new-instance v7, Ll/j59;

    .line 139
    .line 140
    invoke-direct {v7, v8, v1, p1}, Ll/j59;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/f59;)V

    .line 141
    .line 142
    .line 143
    const/4 v4, 0x0

    .line 144
    const/4 v5, 0x0

    .line 145
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Vk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V

    .line 146
    .line 147
    .line 148
    :goto_0
    const-string p0, "moments_user_id"

    .line 149
    .line 150
    iget-object p1, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    filled-new-array {p0}, [Ll/pf60;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    const-string p1, "e_polite_gratitude"

    .line 161
    .line 162
    const-string v0, "p_interested_user"

    .line 163
    .line 164
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_2
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->j(Ll/f59;Lcom/p1/mobile/android/app/Act;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_3
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->j(Ll/f59;Lcom/p1/mobile/android/app/Act;)V

    .line 173
    .line 174
    .line 175
    :cond_4
    :goto_1
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->g:Ll/d39;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->b:Landroid/view/View;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    iget-object v3, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->e:Ll/f59;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2, v3}, Ll/d39;->s(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/f59;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Hj()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 25
    .line 26
    if-ne v0, v1, :cond_1

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 35
    .line 36
    iget v0, v0, Lcom/p1/mobile/putong/data/FeedFlower;->count:I

    .line 37
    .line 38
    if-lez v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->e:Ll/f59;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/f59;->a()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v1, 0x6

    .line 47
    if-ne v0, v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->o(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->l(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)V

    .line 56
    .line 57
    .line 58
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->i(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->o(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->l(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->n(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->k(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)V

    .line 82
    .line 83
    .line 84
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 85
    .line 86
    return-object p0
.end method

.method public final n(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-eq p0, p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public final o(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-eq p0, p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method
