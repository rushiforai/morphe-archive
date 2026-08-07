.class public Ll/f6k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/f7k;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/f7k;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/f7k;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/f6k;->a:Ll/f7k;

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
    .locals 3
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
    new-instance p2, Lcom/p1/mobile/account_google/data/GoogleActiveData;

    .line 5
    .line 6
    invoke-direct {p2}, Lcom/p1/mobile/account_google/data/GoogleActiveData;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, p2, Lcom/p1/mobile/account_google/data/GoogleActiveData;->thirdPartyId:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p2, Lcom/p1/mobile/account_google/data/GoogleActiveData;->thirdPartyToken:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/f6k;->a:Ll/f7k;

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ll/f7k;->E(Lcom/p1/mobile/account_google/data/GoogleActiveData;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance p2, Lcom/p1/mobile/account_google/data/GoogleSigninData;

    .line 28
    .line 29
    invoke-direct {p2}, Lcom/p1/mobile/account_google/data/GoogleSigninData;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, p2, Lcom/p1/mobile/account_core/request_data/ThirdPartySigninBaseData;->thirdPartyId:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, p2, Lcom/p1/mobile/account_core/request_data/ThirdPartySigninBaseData;->thirdPartyToken:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "device"

    .line 49
    .line 50
    invoke-virtual {p2, v2, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdEmail:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p2, v0, p1}, Lcom/p1/mobile/putong/account/api/a;->T0(Lcom/p1/mobile/account_core/request_data/RequestData;ZLjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/f6k;->a:Ll/f7k;

    .line 59
    .line 60
    invoke-virtual {p1, p2}, Ll/f7k;->F(Lcom/p1/mobile/account_google/data/GoogleSigninData;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance p2, Ll/f6k$a;

    .line 65
    .line 66
    invoke-direct {p2, p0}, Ll/f6k$a;-><init>(Ll/f6k;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
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
    new-instance v0, Lcom/p1/mobile/account_google/data/GoogleVerifyData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_google/data/GoogleVerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/account_google/data/GoogleVerifyData;->thirdPartyId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/account_google/data/GoogleVerifyData;->thirdPartyToken:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Ll/f6k;->a:Ll/f7k;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/f7k;->G(Lcom/p1/mobile/account_google/data/GoogleVerifyData;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/e6k;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/e6k;-><init>()V

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
