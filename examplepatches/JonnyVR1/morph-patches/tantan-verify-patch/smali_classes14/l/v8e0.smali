.class public Ll/v8e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Ll/v8e0;Ll/abe0;Landroid/app/Activity;Lcom/p1/mobile/putong/core/data/ShareId;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/v8e0;->i(Ll/abe0;Landroid/app/Activity;Lcom/p1/mobile/putong/core/data/ShareId;)V

    return-void
.end method

.method public static synthetic g(Ll/v8e0;Ll/abe0;Landroid/app/Activity;Lcom/p1/mobile/putong/core/data/ShareId;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/v8e0;->j(Ll/abe0;Landroid/app/Activity;Lcom/p1/mobile/putong/core/data/ShareId;)V

    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "shareId"

    .line 6
    .line 7
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    const-string v0, " "

    .line 20
    .line 21
    const-string v1, "+"

    .line 22
    .line 23
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "from_outside_type"

    .line 46
    .line 47
    const-string v2, "profile"

    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    filled-new-array {v1}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string v2, "e_suggest_users_home_view_share_h5"

    .line 58
    .line 59
    const-string v3, "p_suggest_users_home_view"

    .line 60
    .line 61
    invoke-static {v2, v3, v1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    instance-of v1, v0, Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    const-string v2, ""

    .line 67
    .line 68
    if-eqz v1, :cond_0

    .line 69
    .line 70
    move-object v1, v0

    .line 71
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 76
    .line 77
    invoke-virtual {v3, p2, v2}, Ll/d19;->F3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {v1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    new-instance v1, Ll/r8e0;

    .line 86
    .line 87
    invoke-direct {v1, p0, p1, v0}, Ll/r8e0;-><init>(Ll/v8e0;Ll/abe0;Landroid/app/Activity;)V

    .line 88
    .line 89
    .line 90
    new-instance p0, Ll/s8e0;

    .line 91
    .line 92
    invoke-direct {p0}, Ll/s8e0;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 106
    .line 107
    invoke-virtual {v1, p2, v2}, Ll/d19;->F3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    new-instance v1, Ll/t8e0;

    .line 112
    .line 113
    invoke-direct {v1, p0, p1, v0}, Ll/t8e0;-><init>(Ll/v8e0;Ll/abe0;Landroid/app/Activity;)V

    .line 114
    .line 115
    .line 116
    new-instance p0, Ll/u8e0;

    .line 117
    .line 118
    invoke-direct {p0}, Ll/u8e0;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    :cond_1
    return-void
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic i(Ll/abe0;Landroid/app/Activity;Lcom/p1/mobile/putong/core/data/ShareId;)V
    .locals 1

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/ShareId;->userId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, p3}, Ll/v8e0;->k(Ll/abe0;Landroid/app/Activity;Lcom/p1/mobile/putong/core/data/ShareId;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic j(Ll/abe0;Landroid/app/Activity;Lcom/p1/mobile/putong/core/data/ShareId;)V
    .locals 1

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/ShareId;->userId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, p3}, Ll/v8e0;->k(Ll/abe0;Landroid/app/Activity;Lcom/p1/mobile/putong/core/data/ShareId;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final k(Ll/abe0;Landroid/app/Activity;Lcom/p1/mobile/putong/core/data/ShareId;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v0, "tantanapp://userCard?uid="

    .line 8
    .line 9
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/ShareId;->userId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p2, p1}, Ll/xwa;->h(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
