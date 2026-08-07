.class public Ll/gvf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/owf;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/owf;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/owf;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/gvf;->a:Ll/owf;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ljava/lang/Boolean;)Ll/uxj0;
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
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 11
    .line 12
    const v0, 0x9c65

    .line 13
    .line 14
    .line 15
    const-string v1, "THIRD_PARTY_USER_EXIST"

    .line 16
    .line 17
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw p0
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/data/SignInData;Z)Lrx/c;
    .locals 2
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
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    new-instance p2, Lcom/p1/mobile/account_facebook/data/FacebookActiveData;

    .line 5
    .line 6
    invoke-direct {p2}, Lcom/p1/mobile/account_facebook/data/FacebookActiveData;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, p2, Lcom/p1/mobile/account_facebook/data/FacebookActiveData;->thirdPartyId:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p2, Lcom/p1/mobile/account_facebook/data/FacebookActiveData;->thirdPartyToken:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/gvf;->a:Ll/owf;

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ll/owf;->G(Lcom/p1/mobile/account_facebook/data/FacebookActiveData;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance p2, Lcom/p1/mobile/account_facebook/data/FacebookSigninData;

    .line 28
    .line 29
    invoke-direct {p2}, Lcom/p1/mobile/account_facebook/data/FacebookSigninData;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, p2, Lcom/p1/mobile/account_core/request_data/ThirdPartySigninBaseData;->thirdPartyId:Ljava/lang/String;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p1, p2, Lcom/p1/mobile/account_core/request_data/ThirdPartySigninBaseData;->thirdPartyToken:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v1, "device"

    .line 49
    .line 50
    invoke-virtual {p2, v1, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/gvf;->a:Ll/owf;

    .line 57
    .line 58
    invoke-virtual {p0, p2}, Ll/owf;->H(Lcom/p1/mobile/account_facebook/data/FacebookSigninData;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
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
    new-instance v0, Lcom/p1/mobile/account_facebook/data/FacebookSignupData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_facebook/data/FacebookSignupData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/ThirdPartySignupBaseData;->thirdPartyId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, v0, Lcom/p1/mobile/account_core/request_data/ThirdPartySignupBaseData;->thirdPartyToken:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v1, "device"

    .line 23
    .line 24
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/gvf;->a:Ll/owf;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/owf;->I(Lcom/p1/mobile/account_facebook/data/FacebookSignupData;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_facebook/data/FacebookVerifyData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_facebook/data/FacebookVerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/account_facebook/data/FacebookVerifyData;->thirdPartyId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/account_facebook/data/FacebookVerifyData;->thirdPartyToken:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Ll/gvf;->a:Ll/owf;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/owf;->J(Lcom/p1/mobile/account_facebook/data/FacebookVerifyData;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/fvf;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/fvf;-><init>()V

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
