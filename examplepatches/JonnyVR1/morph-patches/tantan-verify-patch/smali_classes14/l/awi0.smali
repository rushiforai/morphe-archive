.class public Ll/awi0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Ll/jxd0;

.field public static c:Ll/jxd0;

.field public static d:Ll/jxd0;


# instance fields
.field public a:Ll/qwi0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    const-string v2, "third_show_email_verify"

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/awi0;->b:Ll/jxd0;

    .line 11
    .line 12
    new-instance v0, Ll/jxd0;

    .line 13
    .line 14
    const-string v2, "third_email_verify_skip_enabled"

    .line 15
    .line 16
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/awi0;->c:Ll/jxd0;

    .line 20
    .line 21
    new-instance v0, Ll/jxd0;

    .line 22
    .line 23
    const-string v2, "third_email_verify_skip_finish"

    .line 24
    .line 25
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Ll/awi0;->d:Ll/jxd0;

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qwi0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/qwi0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/awi0;->a:Ll/qwi0;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ljava/lang/Boolean;)Lcom/p1/mobile/putong/account/data/ThirdPartVetify;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/account/data/ThirdPartVetify;->new_()Lcom/p1/mobile/putong/account/data/ThirdPartVetify;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v0, 0xc8

    .line 12
    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/account/data/ThirdPartVetify;->code:I

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 17
    .line 18
    const v0, 0x9c65

    .line 19
    .line 20
    .line 21
    const-string v1, "THIRD_PARTY_USER_EXIST"

    .line 22
    .line 23
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw p0
.end method

.method public static synthetic b(Lcom/p1/mobile/account_core/reponse_data/User;)Lcom/p1/mobile/putong/account/data/WeChatUserInfo;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->new_()Lcom/p1/mobile/putong/account/data/WeChatUserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/account_core/reponse_data/User;->name:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->nickname:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/account_core/reponse_data/User;->unionId:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->unionid:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "male"

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/account_core/reponse_data/User;->gender:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    iput p0, v0, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->sex:I

    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_0
    const-string v1, "female"

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/User;->gender:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x2

    .line 38
    iput p0, v0, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->sex:I

    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_1
    const/4 p0, 0x0

    .line 42
    iput p0, v0, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->sex:I

    .line 43
    .line 44
    return-object v0
.end method

.method public static synthetic c(Lcom/p1/mobile/account_core/reponse_data/ThirdpartyToken;)Lcom/p1/mobile/putong/account/data/WeChatToken;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/data/WeChatToken;->new_()Lcom/p1/mobile/putong/account/data/WeChatToken;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/account_core/reponse_data/ThirdpartyToken;->value:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyAccessToken:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/account_core/reponse_data/ThirdpartyToken;->refreshToken:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyRefreshToken:Ljava/lang/String;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/account_core/reponse_data/ThirdpartyToken;->expiresIn:I

    .line 14
    .line 15
    iput v1, v0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyExpiresIn:I

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/account_core/reponse_data/ThirdpartyToken;->id:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyId:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/ThirdpartyToken;->scope:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p0, v0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyScope:Ljava/lang/String;

    .line 24
    .line 25
    return-object v0
.end method

.method public static synthetic d(Ll/awi0;Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/awi0;->g(Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static k(Lcom/p1/mobile/account_core/reponse_data/Data;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/Data;->thirdpartyEmailVerify:Lcom/p1/mobile/account_core/reponse_data/ThirdPartyEmailVerify;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v1, Ll/awi0;->b:Ll/jxd0;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/p1/mobile/account_core/reponse_data/ThirdPartyEmailVerify;->needEmailVerify:Z

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    sget-object v0, Ll/awi0;->c:Ll/jxd0;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/Data;->thirdpartyEmailVerify:Lcom/p1/mobile/account_core/reponse_data/ThirdPartyEmailVerify;

    .line 21
    .line 22
    iget-boolean p0, p0, Lcom/p1/mobile/account_core/reponse_data/ThirdPartyEmailVerify;->emailVerifySkipEnabled:Z

    .line 23
    .line 24
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget-object p0, Ll/awi0;->b:Ll/jxd0;

    .line 33
    .line 34
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    sget-object p0, Ll/awi0;->c:Ll/jxd0;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    sget-object p0, Ll/awi0;->d:Ll/jxd0;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public e(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/WeChatToken;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/awi0;->a:Ll/qwi0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qwi0;->N(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ll/xvi0;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/xvi0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public f(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/WeChatUserInfo;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyInfoData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyInfoData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyInfoData;->thirdPartyId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyInfoData;->thirdPartyToken:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Ll/awi0;->a:Ll/qwi0;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/qwi0;->O(Lcom/p1/mobile/account_thirdparty/data/ThirdPartyInfoData;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/zvi0;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/zvi0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySignupData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySignupData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->name:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v1, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 11
    .line 12
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->birthdate:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    const-string v2, "female"

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/account_core/request_data/Gender;->female:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget-object v1, Lcom/p1/mobile/account_core/request_data/Gender;->male:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 34
    .line 35
    :goto_0
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->gender:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 36
    .line 37
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "device"

    .line 46
    .line 47
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v1, Ljava/lang/String;

    .line 53
    .line 54
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->pictureUrl:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->appsflyerId:Ljava/lang/String;

    .line 59
    .line 60
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 61
    .line 62
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/ThirdPartySignupBaseData;->thirdPartyId:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/ThirdPartySignupBaseData;->thirdPartyToken:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyUnionid:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/ThirdPartySignupBaseData;->thirdPartyUnionId:Ljava/lang/String;

    .line 71
    .line 72
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 73
    .line 74
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast p2, Ljava/lang/Long;

    .line 77
    .line 78
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 79
    .line 80
    .line 81
    move-result-wide v2

    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->newProfilePath:Ljava/util/List;

    .line 83
    .line 84
    invoke-static {v2, v3, p1}, Ll/cp;->j(JLjava/util/List;)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    const/4 p2, 0x1

    .line 89
    invoke-virtual {v1, v0, p1, p2}, Ll/pw;->A(Lcom/p1/mobile/account_core/request_data/SignupData;IZ)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/awi0;->a:Ll/qwi0;

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Ll/qwi0;->Q(Lcom/p1/mobile/account_thirdparty/data/ThirdPartySignupData;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    new-instance p2, Ll/awi0$a;

    .line 99
    .line 100
    invoke-direct {p2, p0}, Ll/awi0$a;-><init>(Ll/awi0;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0
.end method

.method public h(Lcom/p1/mobile/putong/data/SignInData;ZZ)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignInData;",
            "ZZ)",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "qq"

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    new-instance p2, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyActiveData;

    .line 6
    .line 7
    invoke-direct {p2}, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyActiveData;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, p2, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyActiveData;->thirdPartyId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p1, p2, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyActiveData;->thirdPartyToken:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    iput-object v0, p2, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyActiveData;->thirdPartyType:Ljava/lang/String;

    .line 21
    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/awi0;->a:Ll/qwi0;

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Ll/qwi0;->M(Lcom/p1/mobile/account_thirdparty/data/ThirdPartyActiveData;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    new-instance p2, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySigninData;

    .line 34
    .line 35
    invoke-direct {p2}, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySigninData;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, p2, Lcom/p1/mobile/account_core/request_data/ThirdPartySigninBaseData;->thirdPartyId:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 43
    .line 44
    iput-object p1, p2, Lcom/p1/mobile/account_core/request_data/ThirdPartySigninBaseData;->thirdPartyToken:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz p3, :cond_2

    .line 47
    .line 48
    iput-object v0, p2, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySigninData;->thirdPartyType:Ljava/lang/String;

    .line 49
    .line 50
    :cond_2
    const/4 p1, 0x1

    .line 51
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string p3, "device"

    .line 63
    .line 64
    invoke-virtual {p2, p3, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/awi0;->a:Ll/qwi0;

    .line 68
    .line 69
    invoke-virtual {p1, p2}, Ll/qwi0;->P(Lcom/p1/mobile/account_thirdparty/data/ThirdPartySigninData;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    new-instance p2, Ll/awi0$b;

    .line 74
    .line 75
    invoke-direct {p2, p0}, Ll/awi0$b;-><init>(Ll/awi0;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/pw;->Q(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/yvi0;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/yvi0;-><init>(Ll/awi0;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/data/SignUpData;Z)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySignupEarlyUIDData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySignupEarlyUIDData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "device"

    .line 15
    .line 16
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/ThirdPartySignupBaseData;->thirdPartyId:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/ThirdPartySignupBaseData;->thirdPartyToken:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyUnionid:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/ThirdPartySignupBaseData;->thirdPartyUnionId:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    const-string p2, "qq"

    .line 34
    .line 35
    iput-object p2, v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySignupEarlyUIDData;->thirdPartyType:Ljava/lang/String;

    .line 36
    .line 37
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->facebook:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 40
    .line 41
    if-ne p2, v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    iput-object p2, v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySignupEarlyUIDData;->thirdPartyType:Ljava/lang/String;

    .line 48
    .line 49
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->google:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 52
    .line 53
    if-ne p2, v1, :cond_2

    .line 54
    .line 55
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iput-object p2, v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySignupEarlyUIDData;->thirdPartyType:Ljava/lang/String;

    .line 60
    .line 61
    :cond_2
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 62
    .line 63
    const/4 v2, 0x1

    .line 64
    const/4 v3, 0x0

    .line 65
    if-ne p2, v1, :cond_3

    .line 66
    .line 67
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->email:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-nez p2, :cond_3

    .line 74
    .line 75
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->email:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p2, v0, v3, v2, p1}, Ll/pw;->B(Lcom/p1/mobile/account_core/request_data/SignupData;IZLjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 84
    .line 85
    invoke-virtual {p1, v0, v3, v2}, Ll/pw;->A(Lcom/p1/mobile/account_core/request_data/SignupData;IZ)V

    .line 86
    .line 87
    .line 88
    :goto_0
    iget-object p1, p0, Ll/awi0;->a:Ll/qwi0;

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ll/qwi0;->R(Lcom/p1/mobile/account_thirdparty/data/ThirdPartySignupEarlyUIDData;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance p2, Ll/awi0$c;

    .line 95
    .line 96
    invoke-direct {p2, p0}, Ll/awi0$c;-><init>(Ll/awi0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0
.end method

.method public l(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/ThirdPartVetify;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyVerifyData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyVerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyVerifyData;->thirdPartyId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyVerifyData;->thirdPartyToken:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz p3, :cond_0

    .line 11
    .line 12
    const-string p1, "qq"

    .line 13
    .line 14
    iput-object p1, v0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartyVerifyData;->thirdPartyType:Ljava/lang/String;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/awi0;->a:Ll/qwi0;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/qwi0;->S(Lcom/p1/mobile/account_thirdparty/data/ThirdPartyVerifyData;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/wvi0;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/wvi0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
