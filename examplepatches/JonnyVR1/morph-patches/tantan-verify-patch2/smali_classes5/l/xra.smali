.class public Ll/xra;
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

.method public static a()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "avatar_cards_enable"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    return v0
.end method

.method public static b()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "book_movies_pic_2_txt"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    return v0
.end method

.method public static c()Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->xo()Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static d()Lcom/p1/mobile/putong/core/data/PhotoLowConfig;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "low_photo_config"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/PhotoLowConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/PhotoLowConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :catch_0
    const/4 v0, 0x0

    .line 17
    return-object v0
.end method

.method public static e()Lcom/p1/mobile/putong/core/data/ProfileUiUpgradeExpConfig;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "profile_mytab_optimize_config"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileUiUpgradeExpConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileUiUpgradeExpConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :catch_0
    const/4 v0, 0x0

    .line 17
    return-object v0
.end method

.method public static f()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->f4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static g()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Hr()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static h()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->lc()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static i()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->cr()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static j()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ho()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static k()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l6()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static l()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->We()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static m()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->p0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static n()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->rc()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static o()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public static p()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ij()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static q()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->X5()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static r()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;
    .locals 5

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->w()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "home_completion_config"

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "profile_dating_completion_config"

    .line 35
    .line 36
    sget-object v2, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catch_0
    const/4 v0, 0x0

    .line 46
    :goto_0
    if-nez v0, :cond_3

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->new_()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->new_()Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 57
    .line 58
    new-instance v2, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    :goto_1
    const/16 v2, 0x9

    .line 67
    .line 68
    const/16 v3, 0xa

    .line 69
    .line 70
    const/4 v4, 0x5

    .line 71
    if-ge v1, v2, :cond_2

    .line 72
    .line 73
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 74
    .line 75
    if-nez v1, :cond_1

    .line 76
    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 78
    .line 79
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_1
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 88
    .line 89
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 100
    .line 101
    iput v3, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 102
    .line 103
    iput v4, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->question:I

    .line 104
    .line 105
    iput v4, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->socialPersonalityTest:I

    .line 106
    .line 107
    iput v3, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->information:I

    .line 108
    .line 109
    iput v4, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 110
    .line 111
    iput v4, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->myAssets:I

    .line 112
    .line 113
    iput v4, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->idealType:I

    .line 114
    .line 115
    iput v4, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->others:I

    .line 116
    .line 117
    :cond_3
    return-object v0
.end method

.method public static t(Z)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Industries;",
            ">;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "new_profile_industries_departments"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfessionConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfessionConfig;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfessionConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    .line 19
    const-string v1, "{\"ch\":[{\"name\":\"\u6682\u4e0d\u900f\u9732\",\"departments\":[\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"IT/\u4e92\u8054\u7f51/\u901a\u4fe1\",\"departments\":[\"\u7814\u53d1\",\"\u4ea7\u54c1\",\"\u6570\u636e\u5206\u6790\",\"\u9500\u552e\",\"\u8bbe\u8ba1\",\"\u6d4b\u8bd5\",\"\u8fd0\u8425\",\"\u7f16\u8f91\",\"\u5e02\u573a\u5546\u52a1\",\"\u516c\u5173\",\"\u8fd0\u7ef4\",\"\u884c\u653f\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u91c7\u8d2d\u7269\u6d41\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u54a8\u8be2\u987e\u95ee\",\"\u5ba2\u670d\",\"\u751f\u4ea7\u5236\u9020\",\"\u7ffb\u8bd1\",\"\u79d1\u7814\u4eba\u5458\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u515a\u653f\u673a\u5173/\u4e8b\u4e1a\u5355\u4f4d\",\"departments\":[\"\u516c\u52a1\u5458\",\"\u4e8b\u4e1a\u7f16\"]},{\"name\":\"\u91d1\u878d\u4e1a\",\"departments\":[\"\u94f6\u884c\",\"\u4fdd\u9669\",\"\u98ce\u6295\",\"\u5206\u6790\u5e08\",\"\u4ea4\u6613\u5458\",\"\u62cd\u5356\u5e08\",\"\u5178\u5f53\u4e1a\u52a1\",\"\u7814\u53d1\",\"\u4ea7\u54c1\",\"\u9500\u552e\",\"\u8bbe\u8ba1\",\"\u6d4b\u8bd5\",\"\u8fd0\u8425\",\"\u7f16\u8f91\",\"\u5e02\u573a\u5546\u52a1\",\"\u516c\u5173\",\"\u8fd0\u7ef4\",\"\u884c\u653f\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u54a8\u8be2\u987e\u95ee\",\"\u5ba2\u670d\",\"\u7ffb\u8bd1\",\"\u79d1\u7814\u4eba\u5458\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u623f\u5730\u4ea7\u4e1a/\u5efa\u7b51\u4e1a\",\"departments\":[\"\u9500\u552e\",\"\u623f\u4ea7\u4e2d\u4ecb\",\"\u7269\u4e1a\",\"\u5de5\u7a0b\u5e08\",\"\u5efa\u7b51\u5e08\",\"\u88c5\u4fee\u65bd\u5de5\",\"\u64cd\u4f5c\u5de5\",\"\u91c7\u8d2d\u7269\u6d41\",\"\u8d28\u68c0\",\"\u751f\u4ea7\u5236\u9020\",\"\u7814\u53d1\",\"\u4ea7\u54c1\",\"\u8bbe\u8ba1\",\"\u8fd0\u8425\",\"\u5e02\u573a\u5546\u52a1\",\"\u516c\u5173\",\"\u8fd0\u7ef4\",\"\u884c\u653f\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u5ba2\u670d\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u533b\u7597/\u533b\u836f\",\"departments\":[\"\u533b\u751f\",\"\u62a4\u7406/\u62a4\u58eb\",\"\u8f85\u8bca/\u836f\u5242\",\"\u9500\u552e\",\"\u79d1\u7814\u4eba\u5458\",\"\u533b\u836f\u751f\u4ea7\",\"\u533b\u52a1\",\"\u7406\u7597\",\"\u7f8e\u5bb9\u987e\u95ee\",\"\u8425\u517b\u5e08\",\"\u5ba0\u7269\u533b\u7597\",\"\u533b\u7597\u5668\u68b0\",\"\u7814\u53d1\",\"\u4ea7\u54c1\",\"\u6570\u636e\u5206\u6790\",\"\u8bbe\u8ba1\",\"\u8fd0\u8425\",\"\u5e02\u573a\u5546\u52a1\",\"\u516c\u5173\",\"\u8fd0\u7ef4\",\"\u884c\u653f\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u91c7\u8d2d\u7269\u6d41\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u54a8\u8be2\u987e\u95ee\",\"\u5ba2\u670d\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u6587\u5316/\u4f20\u5a92/\u5e7f\u544a\",\"departments\":[\"\u9500\u552e\",\"\u7b56\u5212\",\"\u8bbe\u8ba1/\u52a8\u753b\",\"\u8fd0\u8425\",\"\u7f16\u8f91\",\"\u8bb0\u8005\",\"\u516c\u5173\",\"\u7f16\u5bfc\u5236\u4f5c\",\"\u6444\u5f71/\u6444\u50cf\",\"\u573a\u52a1\",\"\u5316\u5986\u5e08/\u9020\u578b\u5e08\",\"\u6f14\u5458/\u6b4c\u624b/\u6a21\u7279\",\"\u64ad\u97f3\u4e3b\u6301/\u4e3b\u64ad\",\"\u4f5c\u5bb6/\u7f16\u5267\",\"\u914d\u97f3\u5458\",\"\u7814\u53d1\",\"\u4ea7\u54c1\",\"\u6570\u636e\u5206\u6790\",\"\u5e02\u573a\u5546\u52a1\",\"\u884c\u653f\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u54a8\u8be2\u987e\u95ee\",\"\u5ba2\u670d\",\"\u7ffb\u8bd1\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u5236\u9020\u4e1a\",\"departments\":[\"\u9500\u552e\",\"\u8bbe\u8ba1\",\"\u7814\u53d1\",\"\u751f\u4ea7\u5236\u9020\",\"\u91c7\u8d2d\u7269\u6d41\",\"\u8d28\u68c0\",\"\u64cd\u4f5c\u5de5\",\"\u95e8\u5e97\u7ba1\u7406\",\"\u8425\u4e1a\u5458\",\"\u5de5\u7a0b\u5e08\",\"\u4ea7\u54c1\",\"\u6570\u636e\u5206\u6790\",\"\u8fd0\u8425\",\"\u7f16\u8f91\",\"\u5e02\u573a\u5546\u52a1\",\"\u516c\u5173\",\"\u884c\u653f\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u54a8\u8be2\u987e\u95ee\",\"\u5ba2\u670d\",\"\u7ffb\u8bd1\",\"\u79d1\u7814\u4eba\u5458\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u6559\u80b2/\u57f9\u8bad/\u79d1\u7814\",\"departments\":[\"\u6559\u5e08\",\"\u79d1\u7814\u4eba\u5458\",\"\u9500\u552e\",\"\u6559\u52a1\",\"\u6559\u7ec3\",\"\u7814\u53d1\",\"\u4ea7\u54c1\",\"\u6570\u636e\u5206\u6790\",\"\u8bbe\u8ba1\",\"\u8fd0\u8425\",\"\u7f16\u8f91\",\"\u5e02\u573a\u5546\u52a1\",\"\u516c\u5173\",\"\u884c\u653f\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u54a8\u8be2\u987e\u95ee\",\"\u5ba2\u670d\",\"\u7ffb\u8bd1\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u8d38\u6613/\u6279\u53d1/\u96f6\u552e\",\"departments\":[\"\u9500\u552e\",\"\u8d38\u6613\u8fdb\u51fa\u53e3\",\"\u91c7\u8d2d\u7269\u6d41\",\"\u95e8\u5e97\u7ba1\u7406\",\"\u8425\u4e1a\u5458\",\"\u7f51\u5e97\u7ba1\u7406\",\"\u8d28\u68c0\",\"\u64cd\u4f5c\u5de5\",\"\u7814\u53d1\",\"\u4ea7\u54c1\",\"\u6570\u636e\u5206\u6790\",\"\u8bbe\u8ba1\",\"\u8fd0\u8425\",\"\u7f16\u8f91\",\"\u5e02\u573a\u5546\u52a1\",\"\u516c\u5173\",\"\u884c\u653f\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u54a8\u8be2\u987e\u95ee\",\"\u5ba2\u670d\",\"\u7ffb\u8bd1\",\"\u79d1\u7814\u4eba\u5458\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u670d\u52a1\u4e1a\",\"departments\":[\"\u9500\u552e\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u54a8\u8be2\u987e\u95ee\",\"\u884c\u653f\",\"\u5e02\u573a\u5546\u52a1\",\"\u5ba2\u670d\",\"\u5b89\u4fdd\",\"\u95e8\u5e97\u7ba1\u7406\",\"\u8425\u4e1a\u5458\",\"\u7f51\u5e97\u7ba1\u7406\",\"\u53a8\u5e08\",\"\u91c7\u8d2d\u7269\u6d41\",\"\u5bfc\u6e38\",\"\u7f8e\u5bb9\u987e\u95ee\",\"\u5065\u8eab\u6559\u7ec3\",\"\u6444\u5f71/\u6444\u50cf\",\"\u53f8\u673a\",\"\u64cd\u4f5c\u5de5\",\"\u5bb6\u653f\u670d\u52a1\",\"\u5f8b\u5e08\",\"\u7ffb\u8bd1\",\"\u730e\u5934\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u80fd\u6e90/\u77ff\u4ea7/\u7535\u529b\",\"departments\":[\"\u751f\u4ea7\u5236\u9020\",\"\u8bbe\u8ba1\",\"\u5de5\u7a0b\u5e08\",\"\u64cd\u4f5c\u5de5\",\"\u9500\u552e\",\"\u91c7\u8d2d\u7269\u6d41\",\"\u8d28\u68c0\",\"\u5e02\u573a\u5546\u52a1\",\"\u516c\u5173\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u884c\u653f\",\"\u5ba2\u670d\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u54a8\u8be2\u987e\u95ee\",\"\u7814\u53d1\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u519c\u6797\u7267\u6e14\",\"departments\":[\"\u9500\u552e\",\"\u519c\u4e1a\u79cd\u690d\",\"\u6797\u4e1a\u6280\u672f\",\"\u517b\u6b96\",\"\u79d1\u7814\u4eba\u5458\",\"\u751f\u4ea7\u5236\u9020\",\"\u91c7\u8d2d\u7269\u6d41\",\"\u8d28\u68c0\",\"\u64cd\u4f5c\u5de5\",\"\u5e02\u573a\u5546\u52a1\",\"\u516c\u5173\",\"\u4eba\u529b\u8d44\u6e90\uff08HR\uff09\",\"\u884c\u653f\",\"\u5ba2\u670d\",\"\u8d22\u7a0e\u5ba1\u8ba1\",\"\u6cd5\u52a1\",\"\u54a8\u8be2\u987e\u95ee\",\"\u8bbe\u8ba1\",\"\u5de5\u7a0b\u5e08\",\"\u5176\u4ed6\",\"\u6682\u4e0d\u900f\u9732\"]},{\"name\":\"\u5b66\u751f\",\"departments\":[\"\u5b66\u751f\"]},{\"name\":\"\u5176\u4ed6\",\"departments\":[\"\u5176\u4ed6\"]}]}"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfessionConfig;

    .line 26
    .line 27
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_4

    .line 32
    .line 33
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/ProfessionConfig;->ch:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v2, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/ProfessionConfig;->eh:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v2, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    return-object v2

    .line 55
    :cond_1
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v2, "zh"

    .line 60
    .line 61
    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_3

    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string v1, "zh_HK"

    .line 72
    .line 73
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_2

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/ProfessionConfig;->eh:Ljava/util/List;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_3
    :goto_0
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/ProfessionConfig;->ch:Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    return-object p0

    .line 86
    :catch_0
    :cond_4
    const/4 p0, 0x0

    .line 87
    return-object p0
.end method

.method public static u()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Rn()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static v()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->q0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static w()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->w()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method
