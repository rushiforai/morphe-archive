.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/UserBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final c(Ll/bqq;)Ljava/lang/String;
    .locals 10
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string v0, ""

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/bn5;->queryMe()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 23
    .line 24
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v4, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 29
    .line 30
    iget-object v5, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 31
    .line 32
    const/4 v6, 0x0

    .line 33
    if-nez v5, :cond_1

    .line 34
    .line 35
    :goto_0
    move-object v5, v6

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 38
    .line 39
    if-nez v5, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    iget-object v5, v5, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 43
    .line 44
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    if-nez v7, :cond_3

    .line 49
    .line 50
    move-object v7, v6

    .line 51
    goto :goto_2

    .line 52
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 57
    .line 58
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    if-nez p0, :cond_4

    .line 61
    .line 62
    move-object p0, v6

    .line 63
    goto :goto_3

    .line 64
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 65
    .line 66
    :goto_3
    if-nez p0, :cond_5

    .line 67
    .line 68
    move-object v8, v6

    .line 69
    goto :goto_4

    .line 70
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v8

    .line 74
    :goto_4
    if-nez p0, :cond_6

    .line 75
    .line 76
    goto :goto_5

    .line 77
    :cond_6
    invoke-static {p0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    :goto_5
    new-instance p0, Lorg/json/JSONObject;

    .line 82
    .line 83
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 84
    .line 85
    .line 86
    :try_start_0
    const-string v9, "userId"

    .line 87
    .line 88
    invoke-virtual {p0, v9, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 89
    .line 90
    .line 91
    const-string v1, "userName"

    .line 92
    .line 93
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 94
    .line 95
    .line 96
    const-string v1, "gender"

    .line 97
    .line 98
    invoke-virtual {p0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 99
    .line 100
    .line 101
    const-string v1, "token"

    .line 102
    .line 103
    invoke-interface {p1}, Ll/bqq;->getToken()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 108
    .line 109
    .line 110
    const-string p1, "avatarUrl"

    .line 111
    .line 112
    invoke-virtual {p0, p1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 113
    .line 114
    .line 115
    new-instance p1, Lorg/json/JSONObject;

    .line 116
    .line 117
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 118
    .line 119
    .line 120
    const-string v1, "key"

    .line 121
    .line 122
    invoke-virtual {p1, v1, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 123
    .line 124
    .line 125
    const-string v1, "value"

    .line 126
    .line 127
    invoke-virtual {p1, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 128
    .line 129
    .line 130
    const-string v1, "zodiac"

    .line 131
    .line 132
    invoke-virtual {p0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 133
    .line 134
    .line 135
    const-string p1, "age"

    .line 136
    .line 137
    invoke-virtual {p0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 138
    .line 139
    .line 140
    const-string p1, "phoneNumber"

    .line 141
    .line 142
    invoke-virtual {p0, p1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 143
    .line 144
    .line 145
    const-string p1, "country"

    .line 146
    .line 147
    sget v1, Ll/uqb0;->f0:I

    .line 148
    .line 149
    invoke-static {v1}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->d(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    return-object p0

    .line 161
    :catch_0
    move-exception p0

    .line 162
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 163
    .line 164
    .line 165
    return-object v0
.end method

.method public getAbHeader(Ll/aqq;)Ljava/lang/String;
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getAbHeader"
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getAuthorizationHeader(Ll/aqq;)Ljava/lang/String;
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getAuthorizationHeader"
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0, p0}, Ll/irq;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public getAuthorizationHeader(Ll/aqq;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getAuthorizationHeader"
    .end annotation

    const/4 p0, 0x0

    .line 8
    invoke-static {p2, p0}, Ll/irq;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getAuthorizationHeader(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getAuthorizationHeader"
    .end annotation

    .line 7
    invoke-static {p2, p3}, Ll/irq;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getUserInfo(Ll/aqq;)Ljava/lang/String;
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getUserInfo"
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UserBridgeImplementation;->c(Ll/bqq;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
