.class public Ll/a9e0;
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

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Ll/a9e0;Ll/abe0;Lcom/p1/mobile/putong/core/data/ShareId;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a9e0;->j(Ll/abe0;Lcom/p1/mobile/putong/core/data/ShareId;)V

    return-void
.end method

.method public static synthetic h(Ll/a9e0;Ll/abe0;Lcom/p1/mobile/putong/core/data/ShareId;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a9e0;->i(Ll/abe0;Lcom/p1/mobile/putong/core/data/ShareId;)V

    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 5
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
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "momentId"

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    const-string v1, " "

    .line 38
    .line 39
    const-string v2, "+"

    .line 40
    .line 41
    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v2, "from_outside_type"

    .line 68
    .line 69
    const-string v3, "moment"

    .line 70
    .line 71
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    filled-new-array {v2}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    const-string v3, "e_suggest_users_home_view_share_h5"

    .line 80
    .line 81
    const-string v4, "p_suggest_users_home_view"

    .line 82
    .line 83
    invoke-static {v3, v4, v2}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 84
    .line 85
    .line 86
    instance-of v2, v1, Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    if-eqz v2, :cond_0

    .line 89
    .line 90
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 95
    .line 96
    invoke-virtual {v2, p2, v0}, Ll/d19;->F3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {v1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    new-instance v0, Ll/w8e0;

    .line 105
    .line 106
    invoke-direct {v0, p0, p1}, Ll/w8e0;-><init>(Ll/a9e0;Ll/abe0;)V

    .line 107
    .line 108
    .line 109
    new-instance p0, Ll/x8e0;

    .line 110
    .line 111
    invoke-direct {p0}, Ll/x8e0;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 125
    .line 126
    invoke-virtual {v1, p2, v0}, Ll/d19;->F3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    new-instance v0, Ll/y8e0;

    .line 131
    .line 132
    invoke-direct {v0, p0, p1}, Ll/y8e0;-><init>(Ll/a9e0;Ll/abe0;)V

    .line 133
    .line 134
    .line 135
    new-instance p0, Ll/z8e0;

    .line 136
    .line 137
    invoke-direct {p0}, Ll/z8e0;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 145
    .line 146
    .line 147
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

.method public final synthetic i(Ll/abe0;Lcom/p1/mobile/putong/core/data/ShareId;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ShareId;->userId:Ljava/lang/String;

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
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ShareId;->momentId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Ll/a9e0;->k(Ll/abe0;Lcom/p1/mobile/putong/core/data/ShareId;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic j(Ll/abe0;Lcom/p1/mobile/putong/core/data/ShareId;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ShareId;->userId:Ljava/lang/String;

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
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ShareId;->momentId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Ll/a9e0;->k(Ll/abe0;Lcom/p1/mobile/putong/core/data/ShareId;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final k(Ll/abe0;Lcom/p1/mobile/putong/core/data/ShareId;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/ShareId;->momentId:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ShareId;->userId:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "scheme"

    .line 14
    .line 15
    invoke-interface {p0, v0, v2, v1, p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentDetailAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
