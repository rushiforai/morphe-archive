.class public Ll/orb;
.super Ll/cn5;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cn5;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/account_cosmos/data/CosmosSignInData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    const-string p1, "CosmosService/oneclick/signin"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    const-string p1, "CosmosService/oneclick/bind-phone"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/account_cosmos/data/CosmosActiveData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    const-string p1, "CosmosService/oneclick/activate"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    const-string p1, "CosmosService/oneclick/stage/signup"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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

.method public static synthetic F(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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

.method public static synthetic y(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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

.method public static synthetic z(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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
.method public G(Lcom/p1/mobile/account_cosmos/data/CosmosActiveData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/account_cosmos/data/CosmosActiveData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "/oneclick/activate"

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v0, v1}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/irb;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/irb;-><init>(Lcom/p1/mobile/account_cosmos/data/CosmosActiveData;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/jrb;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/jrb;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public H(Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "/oneclick/bind-phone"

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v0, v1}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/grb;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/grb;-><init>(Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/hrb;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/hrb;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public I(Lcom/p1/mobile/account_cosmos/data/CosmosSignInData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/account_cosmos/data/CosmosSignInData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "/oneclick/signin"

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v0, v1}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/krb;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/krb;-><init>(Lcom/p1/mobile/account_cosmos/data/CosmosSignInData;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/lrb;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/lrb;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public J(Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "/oneclick/stage/signup"

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v0, v1}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/mrb;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/mrb;-><init>(Lcom/p1/mobile/account_cosmos/data/CosmosSignupEarlyUIDData;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/nrb;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/nrb;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method
