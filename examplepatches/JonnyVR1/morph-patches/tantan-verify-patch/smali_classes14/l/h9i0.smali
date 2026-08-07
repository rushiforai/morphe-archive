.class public Ll/h9i0;
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

.method public static synthetic a(Lcom/p1/mobile/putong/account/data/TTCSignInData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    const-string p1, "TanTanTokenApi/signin"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 4
    .line 5
    return-object p0
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/data/SignInData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignInData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/account/data/TTCSignInData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/TTCSignInData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->ttcToken:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/TTCSignInData;->token:Ljava/lang/String;

    .line 9
    .line 10
    const-string p1, "100032"

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/TTCSignInData;->clientID:Ljava/lang/String;

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
    const-string v0, "device"

    .line 23
    .line 24
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "/ttc/tokenSignin"

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p1, v0, v1}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/f9i0;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/f9i0;-><init>(Lcom/p1/mobile/putong/account/data/TTCSignInData;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance p1, Ll/g9i0;

    .line 55
    .line 56
    invoke-direct {p1}, Ll/g9i0;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method
