.class public Ll/hyh;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p0, v2, p1}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/eyh;

    .line 17
    .line 18
    invoke-direct {p1, p2}, Ll/eyh;-><init>(Z)V

    .line 19
    .line 20
    .line 21
    new-instance p2, Ll/fyh;

    .line 22
    .line 23
    invoke-direct {p2}, Ll/fyh;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/User;ZLl/y20;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 21
    .line 22
    const-string v0, "matched"

    .line 23
    .line 24
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/data/Followship;->new_()Lcom/p1/mobile/putong/data/Followship;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "followed"

    .line 35
    .line 36
    invoke-static {v0}, Lcom/p1/mobile/putong/data/FollowshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 48
    .line 49
    const-string v0, "following"

    .line 50
    .line 51
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/data/Followship;->new_()Lcom/p1/mobile/putong/data/Followship;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v0, "default"

    .line 62
    .line 63
    invoke-static {v0}, Lcom/p1/mobile/putong/data/FollowshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 70
    .line 71
    :cond_1
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 72
    .line 73
    invoke-virtual {p1, p0, v1}, Ll/jka;->Ic(Lcom/p1/mobile/putong/data/User;Z)V

    .line 74
    .line 75
    .line 76
    :cond_2
    invoke-static {}, Ll/mrb0;->I()Lrx/c;

    .line 77
    .line 78
    .line 79
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 80
    .line 81
    invoke-virtual {p1, p3, p0, v1, v1}, Ll/jka;->Kc(Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 82
    .line 83
    .line 84
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_3

    .line 89
    .line 90
    invoke-interface {p2, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    :cond_3
    return-void
.end method

.method public static synthetic c(ZLcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->M0:I

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic d(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v4, Ll/gyh;

    .line 6
    .line 7
    invoke-direct {v4, p2, p3, p4}, Ll/gyh;-><init>(Lcom/p1/mobile/putong/data/User;ZLl/y20;)V

    .line 8
    .line 9
    .line 10
    new-instance v5, Ll/fyh;

    .line 11
    .line 12
    invoke-direct {v5}, Ll/fyh;-><init>()V

    .line 13
    .line 14
    .line 15
    move v1, p0

    .line 16
    move-object v2, p1

    .line 17
    move-object v3, p2

    .line 18
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Q7(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Zj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/ksg;->U(Lcom/p1/mobile/putong/data/ConversationStatus;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->m8(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    invoke-interface {p3, p0, p1, p2, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Sr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/dyh;

    .line 62
    .line 63
    invoke-direct {v1, p1, p2, p3}, Ll/dyh;-><init>(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V

    .line 64
    .line 65
    .line 66
    invoke-static {p0, v0, v1}, Ll/k3h;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/y20;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Zj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/ksg;->U(Lcom/p1/mobile/putong/data/ConversationStatus;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->m8(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/4 v3, 0x1

    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    move v5, v3

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v0, 0x0

    .line 42
    move v5, v0

    .line 43
    :goto_0
    invoke-static {p1}, Ll/hyh;->h(Lcom/p1/mobile/putong/data/User;)Z

    .line 44
    .line 45
    .line 46
    move-result v8

    .line 47
    if-eqz v5, :cond_2

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-interface {p3, p0, p1, p2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Sr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    new-instance v4, Ll/cyh;

    .line 60
    .line 61
    move-object v6, p0

    .line 62
    move-object v7, p1

    .line 63
    move-object v9, p3

    .line 64
    invoke-direct/range {v4 .. v9}, Ll/cyh;-><init>(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;)V

    .line 65
    .line 66
    .line 67
    const-string p0, "\u786e\u5b9a\u53d6\u6d88\u559c\u6b22\u5417\uff1f"

    .line 68
    .line 69
    invoke-static {v6, p0, v4}, Ll/k3h;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 12
    .line 13
    const-string v0, "matched"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static h(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Ll/hyh;->g(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 18
    .line 19
    const-string v0, "following"

    .line 20
    .line 21
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method public static i(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p0}, Ll/hyh;->l(Lcom/p1/mobile/putong/data/User;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {p0}, Ll/hyh;->g(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public static j(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 6
    .line 7
    const-string v1, "unknown_"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 18
    .line 19
    const-string v1, "default"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 30
    .line 31
    const-string v1, "liked"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 54
    .line 55
    const-string v1, "DEFAULT"

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 66
    .line 67
    const-string v0, "disliked"

    .line 68
    .line 69
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/4 p0, 0x0

    .line 77
    return p0

    .line 78
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 79
    return p0
.end method

.method public static k(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static l(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-static {p0}, Ll/hyh;->j(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isRelationshipMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    return v0

    .line 19
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method
