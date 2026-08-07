.class public Ll/hp50;
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

.method public static synthetic a(Ll/hp50;Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hp50;->d(Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/SignInGrantType;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p3, Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;

    .line 2
    .line 3
    invoke-direct {p3}, Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p3, Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;->providerToken:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, p3, Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;->accessCode:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/hp50;->c()Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iput-object p0, p3, Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;->operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->a()Ll/orb;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p3}, Ll/orb;->H(Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public c()Lcom/p1/mobile/account_core/request_data/OperatorType;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->e()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ll/hp50$a;->a:[I

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    aget p0, v0, p0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-eq p0, v0, :cond_2

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    if-eq p0, v0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    if-eq p0, v0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0

    .line 24
    :cond_0
    sget-object p0, Lcom/p1/mobile/account_core/request_data/OperatorType;->china_telecom:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    sget-object p0, Lcom/p1/mobile/account_core/request_data/OperatorType;->china_unicom:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    sget-object p0, Lcom/p1/mobile/account_core/request_data/OperatorType;->china_mobile:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 31
    .line 32
    return-object p0
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hp50;->h(Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/data/SignInData;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignInData;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance p2, Lcom/p1/mobile/account_cosmos/data/CosmosActiveData;

    .line 4
    .line 5
    invoke-direct {p2}, Lcom/p1/mobile/account_cosmos/data/CosmosActiveData;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/hp50;->c()Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosActiveData;->operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyAccessCode:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosActiveData;->accessCode:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosActiveData;->providerToken:Ljava/lang/String;

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->a()Ll/orb;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, p2}, Ll/orb;->G(Lcom/p1/mobile/account_cosmos/data/CosmosActiveData;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_0
    new-instance p2, Lcom/p1/mobile/account_cosmos/data/CosmosSignInData;

    .line 40
    .line 41
    invoke-direct {p2}, Lcom/p1/mobile/account_cosmos/data/CosmosSignInData;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/hp50;->c()Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosSignInData;->operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 49
    .line 50
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyAccessCode:Ljava/lang/String;

    .line 51
    .line 52
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosSignInData;->accessCode:Ljava/lang/String;

    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 55
    .line 56
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosSignInData;->providerToken:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "device"

    .line 67
    .line 68
    invoke-virtual {p2, p1, p0}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    const/4 p0, 0x1

    .line 72
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->a()Ll/orb;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0, p2}, Ll/orb;->I(Lcom/p1/mobile/account_cosmos/data/CosmosSignInData;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
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
    new-instance v1, Ll/gp50;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/gp50;-><init>(Ll/hp50;Lcom/p1/mobile/putong/data/SignUpData;)V

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

.method public g(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            "Lcom/p1/mobile/putong/data/SignInGrantType;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p2, Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;

    .line 2
    .line 3
    invoke-direct {p2}, Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hp50;->c()Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;->operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;->providerToken:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyAccessCode:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;->accessCode:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    new-instance p0, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->id:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->token:Ljava/lang/String;

    .line 40
    .line 41
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;->thirdPartyAccount:Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 42
    .line 43
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 44
    .line 45
    iput-object p0, p2, Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;->providerUserId:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "device"

    .line 56
    .line 57
    invoke-virtual {p2, p1, p0}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    const/4 v0, 0x1

    .line 64
    invoke-virtual {p0, p2, p1, v0}, Ll/pw;->A(Lcom/p1/mobile/account_core/request_data/SignupData;IZ)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->a()Ll/orb;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0, p2}, Ll/orb;->J(Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method

.method public final h(Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->chinaMobile:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const-string v3, "no-password"

    .line 7
    .line 8
    const-string v4, "female"

    .line 9
    .line 10
    const-string v5, "device"

    .line 11
    .line 12
    if-ne v0, v1, :cond_2

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/account_mobile/data/MobileSignupData;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/p1/mobile/account_mobile/data/MobileSignupData;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/hp50;->c()Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object p0, v0, Lcom/p1/mobile/account_mobile/data/MobileSignupData;->operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p0, v0, Lcom/p1/mobile/account_mobile/data/MobileSignupData;->providerToken:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, v5, p0}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p0, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->name:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 47
    .line 48
    .line 49
    move-result-wide v6

    .line 50
    invoke-static {v6, v7}, Ll/dy;->n0(D)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iput-object p0, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->birthdate:Ljava/lang/String;

    .line 55
    .line 56
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 57
    .line 58
    invoke-static {p0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/account_core/request_data/Gender;->female:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    sget-object p0, Lcom/p1/mobile/account_core/request_data/Gender;->male:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 68
    .line 69
    :goto_0
    iput-object p0, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->gender:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 70
    .line 71
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, v5, p0}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast p0, Ljava/lang/String;

    .line 85
    .line 86
    iput-object p0, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->pictureUrl:Ljava/lang/String;

    .line 87
    .line 88
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, p0}, Lcom/p1/mobile/account_mobile/data/MobileSignupData;->setPassword(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_1

    .line 100
    .line 101
    iput-object v3, v0, Lcom/p1/mobile/account_mobile/data/MobileSignupData;->signupType:Ljava/lang/String;

    .line 102
    .line 103
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 104
    .line 105
    iput-object p0, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->appsflyerId:Ljava/lang/String;

    .line 106
    .line 107
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 108
    .line 109
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 110
    .line 111
    check-cast p2, Ljava/lang/Long;

    .line 112
    .line 113
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 114
    .line 115
    .line 116
    move-result-wide v3

    .line 117
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->newProfilePath:Ljava/util/List;

    .line 118
    .line 119
    invoke-static {v3, v4, p1}, Ll/cp;->j(JLjava/util/List;)I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    invoke-virtual {p0, v0, p1, v2}, Ll/pw;->A(Lcom/p1/mobile/account_core/request_data/SignupData;IZ)V

    .line 124
    .line 125
    .line 126
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->f()Ll/ie00;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0, v0}, Ll/ie00;->A(Lcom/p1/mobile/account_mobile/data/MobileSignupData;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    return-object p0

    .line 139
    :cond_2
    new-instance p0, Lcom/p1/mobile/account_unicom/data/UnicomSignupData;

    .line 140
    .line 141
    invoke-direct {p0}, Lcom/p1/mobile/account_unicom/data/UnicomSignupData;-><init>()V

    .line 142
    .line 143
    .line 144
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 145
    .line 146
    iput-object v0, p0, Lcom/p1/mobile/account_unicom/data/UnicomSignupData;->providerToken:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {p0, v5, v0}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 160
    .line 161
    iput-object v0, p0, Lcom/p1/mobile/account_core/request_data/SignupData;->name:Ljava/lang/String;

    .line 162
    .line 163
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 166
    .line 167
    .line 168
    move-result-wide v0

    .line 169
    invoke-static {v0, v1}, Ll/dy;->n0(D)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iput-object v0, p0, Lcom/p1/mobile/account_core/request_data/SignupData;->birthdate:Ljava/lang/String;

    .line 174
    .line 175
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 176
    .line 177
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-eqz v0, :cond_3

    .line 182
    .line 183
    sget-object v0, Lcom/p1/mobile/account_core/request_data/Gender;->female:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_3
    sget-object v0, Lcom/p1/mobile/account_core/request_data/Gender;->male:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 187
    .line 188
    :goto_1
    iput-object v0, p0, Lcom/p1/mobile/account_core/request_data/SignupData;->gender:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 189
    .line 190
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {p0, v5, v0}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 202
    .line 203
    check-cast v0, Ljava/lang/String;

    .line 204
    .line 205
    iput-object v0, p0, Lcom/p1/mobile/account_core/request_data/SignupData;->pictureUrl:Ljava/lang/String;

    .line 206
    .line 207
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Lcom/p1/mobile/account_unicom/data/UnicomSignupData;->setPassword(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 213
    .line 214
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-eqz v0, :cond_4

    .line 219
    .line 220
    iput-object v3, p0, Lcom/p1/mobile/account_unicom/data/UnicomSignupData;->signupType:Ljava/lang/String;

    .line 221
    .line 222
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 223
    .line 224
    iput-object v0, p0, Lcom/p1/mobile/account_core/request_data/SignupData;->appsflyerId:Ljava/lang/String;

    .line 225
    .line 226
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 227
    .line 228
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 229
    .line 230
    check-cast p2, Ljava/lang/Long;

    .line 231
    .line 232
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 233
    .line 234
    .line 235
    move-result-wide v3

    .line 236
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->newProfilePath:Ljava/util/List;

    .line 237
    .line 238
    invoke-static {v3, v4, p1}, Ll/cp;->j(JLjava/util/List;)I

    .line 239
    .line 240
    .line 241
    move-result p1

    .line 242
    invoke-virtual {v0, p0, p1, v2}, Ll/pw;->A(Lcom/p1/mobile/account_core/request_data/SignupData;IZ)V

    .line 243
    .line 244
    .line 245
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->g()Ll/lxj0;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    invoke-virtual {p1, p0}, Ll/lxj0;->A(Lcom/p1/mobile/account_unicom/data/UnicomSignupData;)Lrx/c;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    return-object p0
.end method
