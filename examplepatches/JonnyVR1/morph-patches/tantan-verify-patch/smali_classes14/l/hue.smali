.class public Ll/hue;
.super Lcom/p1/mobile/putong/account/api/b;
.source "SourceFile"


# instance fields
.field public g:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/api/b;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/hue;->g:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/account/data/EmailVerifyCaptchaData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/Data;->action:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    :goto_0
    const-string p1, "EmailAccountApi/email/code/verify"

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Landroid/util/Pair;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/account_core/reponse_data/Data;->action:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    const-string v2, "tttAction"

    .line 10
    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/String;

    .line 16
    .line 17
    const-string v2, "signin"

    .line 18
    .line 19
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    const-string v2, "signup"

    .line 26
    .line 27
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    const-string v2, "pending"

    .line 34
    .line 35
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    const-string v2, "ttt-signup"

    .line 42
    .line 43
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    :cond_0
    move-object v0, v1

    .line 50
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 51
    .line 52
    const-string v1, "tttToken"

    .line 53
    .line 54
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Ljava/lang/String;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    const-string p0, ""

    .line 62
    .line 63
    :goto_0
    new-instance v1, Landroid/util/Pair;

    .line 64
    .line 65
    invoke-direct {v1, v0, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    return-object v1
.end method

.method public static synthetic i(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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

.method public static synthetic j(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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

.method public static synthetic k(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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

.method public static synthetic l(Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    const-string p1, "EmailAccountApi/ttt-signup"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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

.method public static synthetic n(Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->meta:Lcom/p1/mobile/account_core/reponse_data/Meta;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    return-void

    .line 9
    :cond_1
    :goto_0
    const-string p1, "EmailAccountApi/email/code/send"

    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/account/data/EmailBindPhoneData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    const-string p1, "EmailAccountApi/change-email"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/account/data/EmailActiveData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    const-string p1, "EmailAccountApi/email/activate"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    const-string p1, "EmailAccountApi/email/stage/signup"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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

.method public static synthetic s(Lcom/p1/mobile/putong/account/data/EmailRequestData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    const-string p1, "EmailAccountApi/email/signin"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/account/data/EmailBindPhoneData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
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
    const-string p1, "EmailAccountApi/bind-email"

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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

.method public static synthetic v(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->meta:Lcom/p1/mobile/account_core/reponse_data/Meta;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/account_core/reponse_data/Meta;->code:I

    .line 4
    .line 5
    const v0, 0x30d40

    .line 6
    .line 7
    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
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
    const-string v0, "/email/code/send"

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
    new-instance v0, Ll/rte;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/rte;-><init>(Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/yte;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/yte;-><init>()V

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

.method public B(Lcom/p1/mobile/putong/data/SignInData;Z)Lrx/c;
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
    const-string v0, "device"

    .line 2
    .line 3
    if-nez p2, :cond_4

    .line 4
    .line 5
    new-instance p2, Lcom/p1/mobile/putong/account/data/EmailRequestData;

    .line 6
    .line 7
    invoke-direct {p2}, Lcom/p1/mobile/putong/account/data/EmailRequestData;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/account/data/EmailRequestData;->setPassword(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/account_phone/data/PhoneSigninType;->confirmation_code:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 24
    .line 25
    iput-object v1, p2, Lcom/p1/mobile/putong/account/data/EmailRequestData;->signinType:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget-object v1, Lcom/p1/mobile/account_phone/data/PhoneSigninType;->password:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 29
    .line 30
    iput-object v1, p2, Lcom/p1/mobile/putong/account/data/EmailRequestData;->signinType:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 31
    .line 32
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iput v1, p2, Lcom/p1/mobile/putong/account/data/EmailRequestData;->code:I

    .line 41
    .line 42
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, p2, Lcom/p1/mobile/putong/account/data/EmailRequestData;->email:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaToken:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    const-string v0, "captchaToken"

    .line 66
    .line 67
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaToken:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaValue:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_3

    .line 79
    .line 80
    const-string v0, "captchaValue"

    .line 81
    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaValue:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    const/4 p1, 0x1

    .line 88
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, p2}, Ll/hue;->D(Lcom/p1/mobile/putong/account/data/EmailRequestData;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :cond_4
    new-instance p2, Lcom/p1/mobile/putong/account/data/EmailActiveData;

    .line 97
    .line 98
    invoke-direct {p2}, Lcom/p1/mobile/putong/account/data/EmailActiveData;-><init>()V

    .line 99
    .line 100
    .line 101
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/account/data/EmailActiveData;->setPassword(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 107
    .line 108
    if-eqz v1, :cond_5

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    iput v1, p2, Lcom/p1/mobile/putong/account/data/EmailActiveData;->code:I

    .line 115
    .line 116
    :cond_5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-eqz v1, :cond_6

    .line 123
    .line 124
    sget-object v1, Lcom/p1/mobile/account_phone/data/PhoneSigninType;->confirmation_code:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 125
    .line 126
    iput-object v1, p2, Lcom/p1/mobile/putong/account/data/EmailActiveData;->activateType:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_6
    sget-object v1, Lcom/p1/mobile/account_phone/data/PhoneSigninType;->password:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 130
    .line 131
    iput-object v1, p2, Lcom/p1/mobile/putong/account/data/EmailActiveData;->activateType:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 132
    .line 133
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 134
    .line 135
    iput-object p1, p2, Lcom/p1/mobile/putong/account/data/EmailActiveData;->email:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    const/4 p1, 0x0

    .line 149
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, p2}, Ll/hue;->w(Lcom/p1/mobile/putong/account/data/EmailActiveData;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    return-object p0
.end method

.method public C(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
    .locals 3
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
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;->code:I

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->email:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;->email:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    new-instance v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 23
    .line 24
    invoke-direct {v1}, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->id:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->token:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;->thirdPartyAccount:Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 36
    .line 37
    :cond_0
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string v1, "device"

    .line 46
    .line 47
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {p0, v0, v1, p1, v1}, Ll/hue;->z(Lcom/p1/mobile/account_core/request_data/SignupData;IZZ)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "/email/stage/signup"

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p0, p1, v1}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    new-instance p1, Ll/ute;

    .line 70
    .line 71
    invoke-direct {p1, v0}, Ll/ute;-><init>(Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-instance p1, Ll/vte;

    .line 79
    .line 80
    invoke-direct {p1}, Ll/vte;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public D(Lcom/p1/mobile/putong/account/data/EmailRequestData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/EmailRequestData;",
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
    const-string v0, "/email/signin"

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
    new-instance v0, Ll/bue;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/bue;-><init>(Lcom/p1/mobile/putong/account/data/EmailRequestData;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/cue;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/cue;-><init>()V

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

.method public E(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
    .locals 3
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
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;->code:I

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->email:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;->email:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    new-instance v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 23
    .line 24
    invoke-direct {v1}, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->id:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->token:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;->thirdPartyAccount:Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 36
    .line 37
    :cond_0
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string v1, "device"

    .line 46
    .line 47
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {p0, v0, v1, p1, v1}, Ll/hue;->z(Lcom/p1/mobile/account_core/request_data/SignupData;IZZ)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "/ttt-signup"

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p0, p1, v1}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    new-instance p1, Ll/fue;

    .line 70
    .line 71
    invoke-direct {p1, v0}, Ll/fue;-><init>(Lcom/p1/mobile/putong/account/data/EmailSignupEarlyUIDData;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-instance p1, Ll/gue;

    .line 79
    .line 80
    invoke-direct {p1}, Ll/gue;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public F(Lcom/p1/mobile/putong/account/data/EmailVerifyCaptchaData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/EmailVerifyCaptchaData;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "/email/code/verify"

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
    new-instance v0, Ll/wte;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/wte;-><init>(Lcom/p1/mobile/putong/account/data/EmailVerifyCaptchaData;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/xte;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/xte;-><init>()V

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

.method public final w(Lcom/p1/mobile/putong/account/data/EmailActiveData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/EmailActiveData;",
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
    const-string v0, "/email/activate"

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
    new-instance v0, Ll/zte;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/zte;-><init>(Lcom/p1/mobile/putong/account/data/EmailActiveData;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/aue;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/aue;-><init>()V

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

.method public x(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyDataV2;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/account/data/EmailBindPhoneData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/EmailBindPhoneData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 7
    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/account/data/EmailRequestData;->code:I

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/EmailRequestData;->email:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "/email/bind"

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p1, v0, v1}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/due;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/due;-><init>(Lcom/p1/mobile/putong/account/data/EmailBindPhoneData;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Ll/eue;

    .line 38
    .line 39
    invoke-direct {p1}, Ll/eue;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public y(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyDataV2;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/account/data/EmailBindPhoneData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/EmailBindPhoneData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 7
    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/account/data/EmailRequestData;->code:I

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/EmailRequestData;->email:Ljava/lang/String;

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/account_phone/data/PhoneSigninType;->confirmation_code:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/EmailRequestData;->signinType:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 17
    .line 18
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "device"

    .line 27
    .line 28
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "/email/change"

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
    new-instance v0, Ll/ste;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/ste;-><init>(Lcom/p1/mobile/putong/account/data/EmailBindPhoneData;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance p1, Ll/tte;

    .line 55
    .line 56
    invoke-direct {p1}, Ll/tte;-><init>()V

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

.method public final z(Lcom/p1/mobile/account_core/request_data/SignupData;IZZ)V
    .locals 3

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 6
    .line 7
    .line 8
    if-eqz p3, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ll/r8f0;->f()Ll/r8f0;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    invoke-virtual {p3}, Ll/r8f0;->g()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {}, Ll/v3q0;->K3()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    const-string v2, "mmuid"

    .line 29
    .line 30
    invoke-virtual {v0, v2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-nez p3, :cond_1

    .line 38
    .line 39
    const-string p3, "inviteCode"

    .line 40
    .line 41
    invoke-virtual {v0, p3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    :cond_1
    const-string p3, "browserUA"

    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 47
    .line 48
    invoke-static {v1}, Ll/gsp0;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, p3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    const-string p3, "deviceModelRaw"

    .line 56
    .line 57
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, p3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 60
    .line 61
    .line 62
    if-lez p2, :cond_2

    .line 63
    .line 64
    const-string p3, "pictureDelaySeconds"

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    .line 80
    .line 81
    :cond_2
    if-eqz p4, :cond_3

    .line 82
    .line 83
    invoke-static {}, Ll/hxk;->g()Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_3

    .line 88
    .line 89
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ll/hxk;->h()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-eqz p0, :cond_3

    .line 98
    .line 99
    const-string p0, "adReferrer"

    .line 100
    .line 101
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    invoke-virtual {p2}, Ll/hxk;->d()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 110
    .line 111
    .line 112
    const-string p0, "adClickTime"

    .line 113
    .line 114
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-virtual {p2}, Ll/hxk;->a()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 123
    .line 124
    .line 125
    const-string p0, "adInstallTime"

    .line 126
    .line 127
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {p2}, Ll/hxk;->b()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 136
    .line 137
    .line 138
    const-string p0, "track"

    .line 139
    .line 140
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-virtual {p2}, Ll/hxk;->e()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 149
    .line 150
    .line 151
    :cond_3
    sget-object p0, Ll/ls4;->a:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    if-nez p0, :cond_4

    .line 158
    .line 159
    sget-object p0, Ll/ls4;->a:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    const-string p2, "douyin"

    .line 166
    .line 167
    invoke-virtual {p0, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-eqz p0, :cond_4

    .line 172
    .line 173
    const-string p0, "toutiao_channel"

    .line 174
    .line 175
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 176
    .line 177
    invoke-static {p2}, Lcom/bytedance/hume/readapk/HumeSDK;->getChannel(Landroid/content/Context;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 182
    .line 183
    .line 184
    :cond_4
    const-string p0, "extra"

    .line 185
    .line 186
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    .line 192
    .line 193
    :catch_0
    return-void
.end method
