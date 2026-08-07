.class public Lcom/p1/mobile/putong/api/api/AccountTempApi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;,
        Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;
    }
.end annotation


# static fields
.field public static final i:[C


# instance fields
.field public final a:Ll/kxd0;

.field public final b:Ll/yyd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public final c:Ll/yyd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public final d:Ll/yyd0;

.field public e:Ll/wyd0;

.field public final f:Ll/wyd0;

.field public final g:Ll/wyd0;

.field public final h:Ll/zyd0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "0123456789abcdef"

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->i:[C

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->d:Ll/kxd0;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->a:Ll/kxd0;

    .line 7
    .line 8
    new-instance v0, Ll/yyd0;

    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 11
    .line 12
    const-string v2, "putongMasterUserInfo"

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    const-string v4, "putongPref"

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, v3, v4}, Ll/yyd0;-><init>(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->b:Ll/yyd0;

    .line 21
    .line 22
    new-instance v0, Ll/yyd0;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 25
    .line 26
    const-string v2, "putongSwitchUserInfo"

    .line 27
    .line 28
    invoke-direct {v0, v1, v2, v3, v4}, Ll/yyd0;-><init>(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->c:Ll/yyd0;

    .line 32
    .line 33
    new-instance v0, Ll/yyd0;

    .line 34
    .line 35
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 36
    .line 37
    const-string v2, "putongLastLoginData"

    .line 38
    .line 39
    invoke-direct {v0, v1, v2, v3, v4}, Ll/yyd0;-><init>(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->d:Ll/yyd0;

    .line 43
    .line 44
    new-instance v0, Ll/wyd0;

    .line 45
    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v2, "pref_key_signup_profile_path_arr"

    .line 49
    .line 50
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 54
    .line 55
    invoke-interface {v2}, Ll/bn5;->userId()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v2, ""

    .line 67
    .line 68
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->e:Ll/wyd0;

    .line 72
    .line 73
    new-instance v0, Ll/wyd0;

    .line 74
    .line 75
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 76
    .line 77
    new-instance v3, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v4, "userStudiesTempData"

    .line 80
    .line 81
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object v4, Ll/uqb0;->c0:Ll/bn5;

    .line 85
    .line 86
    invoke-interface {v4}, Ll/bn5;->userId()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-direct {v0, v1, v3, v2}, Ll/wyd0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->f:Ll/wyd0;

    .line 101
    .line 102
    new-instance v0, Ll/wyd0;

    .line 103
    .line 104
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 105
    .line 106
    new-instance v3, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v4, "userBloodTypeTempData"

    .line 109
    .line 110
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    sget-object v4, Ll/uqb0;->c0:Ll/bn5;

    .line 114
    .line 115
    invoke-interface {v4}, Ll/bn5;->userId()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-direct {v0, v1, v3, v2}, Ll/wyd0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->g:Ll/wyd0;

    .line 130
    .line 131
    new-instance v0, Ll/zyd0;

    .line 132
    .line 133
    new-instance v1, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    const-string v2, "userSubscriptionSettings"

    .line 136
    .line 137
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 141
    .line 142
    invoke-interface {v2}, Ll/bn5;->userId()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    const/4 v2, 0x0

    .line 154
    invoke-direct {v0, v1, v2}, Ll/zyd0;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/UserSubscriptionSettings;)V

    .line 155
    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->h:Ll/zyd0;

    .line 158
    .line 159
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/RememberUserInfo;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RememberUserInfo;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RememberUserInfo;->imgUrl:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RememberUserInfo;->auth:Lcom/p1/mobile/putong/data/AuthData;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/o560;->b()Ll/o560;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p1}, Ll/o560;->c(Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/RememberUserInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->imgUrl:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->auth:Lcom/p1/mobile/putong/data/AuthData;

    .line 9
    .line 10
    iput-object p3, v0, Lcom/p1/mobile/putong/data/RememberUserInfo;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/api/AccountTempApi;->a(Lcom/p1/mobile/putong/data/RememberUserInfo;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
