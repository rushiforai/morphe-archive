.class public Lcom/p1/mobile/putong/facertification/TTFacertificationClient;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/facertification/TTFacertificationClient$b;,
        Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;,
        Lcom/p1/mobile/putong/facertification/TTFacertificationClient$InternalException;
    }
.end annotation


# instance fields
.field public final a:Ll/wwh0;

.field public b:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wwh0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/wwh0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->a:Ll/wwh0;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->b:I

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Ll/jxh0;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;-><init>()V

    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationProcessParams;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationProcessParams;->toJson()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/x1d0$a;->k(Ll/z1d0;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->t()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;Ll/jxf;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->r(Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;Ll/jxf;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Ll/jxf;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->s(Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Ll/jxf;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/facertification/RxFacertification;->e(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;->a(Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;->b(Lcom/p1/mobile/putong/data/VerificationToken;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Ljava/lang/String;Lorg/json/JSONObject;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 12
    .line 13
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;Landroid/content/Context;Ll/ktl;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/data/VerificationToken;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->u(Landroid/content/Context;Ll/ktl;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/data/VerificationToken;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;->d(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->m(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string v0, "fromPicVerificationDlg"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_3

    .line 19
    .line 20
    const-string v0, "fromNameVerificationDlg"

    .line 21
    .line 22
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-boolean p0, p2, Lcom/p1/mobile/putong/data/VerificationToken;->omitLiveData:Z

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;->e(Lcom/p1/mobile/putong/data/VerificationToken;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_3
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 43
    .line 44
    return-object p0
.end method

.method public static final m(Ljava/lang/String;)Z
    .locals 3

    .line 1
    const-string v0, "aliyunIntl"

    .line 2
    .line 3
    const-string v1, "tencentIntlV2"

    .line 4
    .line 5
    const-string v2, "tencentIntl"

    .line 6
    .line 7
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public static n(Ljava/lang/String;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/users/me/verifications/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Ll/uqb0;->I:Ll/xi5;

    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v3, "anchorVerification"

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v2, Ll/fxh0;

    .line 36
    .line 37
    invoke-direct {v2, v0}, Ll/fxh0;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v2}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v1, p0, v0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public static o(Lcom/p1/mobile/putong/data/VerificationToken;)Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;->FACERTIFICATION_SDK_TYPE_ALI:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object p0, Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;->FACERTIFICATION_SDK_TYPE_TX:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isMoMoProvider()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    sget-object p0, Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;->FACERTIFICATION_SDK_TYPE_MOMO:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProvider()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    sget-object p0, Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;->FACERTIFICATION_SDK_TYPE_TX_INTL:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProviderV2()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    sget-object p0, Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;->FACERTIFICATION_SDK_TYPE_TX_INTL_V2:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isVolcProvider()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_5

    .line 51
    .line 52
    sget-object p0, Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;->FACERTIFICATION_SDK_TYPE_BYTE_VOLC:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isAliyunIntlProvider()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    sget-object p0, Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;->FACERTIFICATION_SDK_TYPE_ALI_INTL:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_6
    sget-object p0, Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;->FACERTIFICATION_SDK_TYPE_EXT:Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 65
    .line 66
    return-object p0
.end method

.method public static p()Lcom/p1/mobile/putong/facertification/TTFacertificationClient;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient$b;->a()Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static q()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "IDArltB0"

    .line 2
    .line 3
    return-object v0
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/users/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "/verifications/"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "?process=new"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationProcessParams;->new_()Lcom/p1/mobile/putong/data/VerificationProcessParams;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationProcessIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationProcessIdentity;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iput-object p1, v2, Lcom/p1/mobile/putong/data/VerificationProcessIdentity;->provider:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p2, v2, Lcom/p1/mobile/putong/data/VerificationProcessIdentity;->certifyId:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v2, v1, Lcom/p1/mobile/putong/data/VerificationProcessParams;->identity:Lcom/p1/mobile/putong/data/VerificationProcessIdentity;

    .line 45
    .line 46
    sget-object p1, Ll/uqb0;->I:Ll/xi5;

    .line 47
    .line 48
    new-instance p2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v2, "processVerificationResult"

    .line 51
    .line 52
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance p2, Ll/axh0;

    .line 63
    .line 64
    invoke-direct {p2, v0, v1}, Ll/axh0;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationProcessParams;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p2}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p1, p0, p2}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method

.method public static y(Lorg/json/JSONObject;)Lrx/c;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/retrieve/verification?process=new"

    .line 2
    .line 3
    invoke-static {v0}, Ll/xi5;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/uqb0;->I:Ll/xi5;

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "accountVerificationResult"

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/pzi0;->o()J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    new-instance v3, Ll/xwh0;

    .line 28
    .line 29
    invoke-direct {v3, v0, p0}, Ll/xwh0;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v3}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v1, v2, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method


# virtual methods
.method public A(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Ll/ktl;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;)Lrx/c;
    .locals 7
    .param p4    # Ll/ktl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;",
            "Ll/ktl;",
            "Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/facertification/RxFacertification$b;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "fromAccountBackH5"

    .line 2
    .line 3
    invoke-static {p6, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->a:Ll/wwh0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1, p2, p3}, Ll/wwh0;->x(Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v1, p2, p3}, Ll/wwh0;->A(Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    new-instance v1, Ll/bxh0;

    .line 21
    .line 22
    invoke-direct {v1, p5}, Ll/bxh0;-><init>(Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/cxh0;

    .line 30
    .line 31
    invoke-direct {v1, p5}, Ll/cxh0;-><init>(Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/dxh0;

    .line 39
    .line 40
    invoke-direct {v1, p6, p5}, Ll/dxh0;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p6

    .line 47
    new-instance v0, Ll/exh0;

    .line 48
    .line 49
    move-object v1, p0

    .line 50
    move-object v2, p1

    .line 51
    move-object v5, p2

    .line 52
    move-object v6, p3

    .line 53
    move-object v3, p4

    .line 54
    move-object v4, p5

    .line 55
    invoke-direct/range {v0 .. v6}, Ll/exh0;-><init>(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;Landroid/content/Context;Ll/ktl;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p6, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;Ll/jxf;)V
    .locals 0

    .line 1
    invoke-interface {p1, p2, p3}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;->c(Lcom/p1/mobile/putong/data/VerificationToken;Ll/jxf;)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->b:I

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    add-int/2addr p1, p2

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->b:I

    .line 9
    .line 10
    if-le p1, p2, :cond_0

    .line 11
    .line 12
    new-instance p1, Lcom/p1/mobile/putong/facertification/TTFacertificationClient$InternalException;

    .line 13
    .line 14
    new-instance p2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string p3, "sdk loaded repeatedly at one time, loadedCount = "

    .line 17
    .line 18
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget p0, p0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->b:I

    .line 22
    .line 23
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p2, 0x0

    .line 31
    invoke-direct {p1, p0, p2}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient$InternalException;-><init>(Ljava/lang/String;Ll/jxh0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Ll/jxf;)Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProvider()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->a:Ll/wwh0;

    .line 8
    .line 9
    invoke-virtual {p0, p2, p1, p3}, Ll/wwh0;->z(Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationToken;Ll/jxf;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-static {p3}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic t()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->b:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->b:I

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic u(Landroid/content/Context;Ll/ktl;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/data/VerificationToken;)Lrx/c;
    .locals 1

    .line 1
    invoke-interface {p2, p6}, Ll/ktl;->a(Lcom/p1/mobile/putong/data/VerificationToken;)Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p1, p2, p6}, Lcom/p1/mobile/putong/facertification/RxFacertification;->d(Landroid/content/Context;Ljava/util/Map;Lcom/p1/mobile/putong/data/VerificationToken;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    new-instance v0, Ll/gxh0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p3, p6}, Ll/gxh0;-><init>(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    new-instance v0, Ll/hxh0;

    .line 19
    .line 20
    invoke-direct {v0, p0, p6, p4}, Ll/hxh0;-><init>(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    new-instance p4, Ll/ixh0;

    .line 28
    .line 29
    invoke-direct {p4, p0}, Ll/ixh0;-><init>(Lcom/p1/mobile/putong/facertification/TTFacertificationClient;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, p4}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance p2, Ll/ywh0;

    .line 37
    .line 38
    invoke-direct {p2, p3, p6}, Ll/ywh0;-><init>(Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Lcom/p1/mobile/putong/data/VerificationToken;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p2}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance p2, Ll/zwh0;

    .line 46
    .line 47
    invoke-direct {p2, p1, p6, p5}, Ll/zwh0;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public w(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Ljava/lang/String;I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/facertification/RxFacertification$b;",
            "Ljava/lang/String;",
            "I)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->x(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Ljava/lang/String;ILorg/json/JSONObject;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public x(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Ljava/lang/String;ILorg/json/JSONObject;)Lrx/c;
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/facertification/RxFacertification$b;",
            "Ljava/lang/String;",
            "I",
            "Lorg/json/JSONObject;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p1

    move/from16 v1, p3

    .line 1
    const-string v2, "7"

    iget-object v3, v0, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->a:Ll/kxf;

    .line 2
    iget-object v4, v0, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    .line 3
    iget-object v5, v0, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 4
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 5
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 6
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 7
    const-string v10, "appId"

    const-string v11, "verifyType"

    const-string v12, "productId"

    const-string v13, "clientStatus"

    const-string v14, ""

    const-string v15, "bytedanceToken"

    const-string v9, "volcEnginePro"

    move-object/from16 v17, v14

    const-string v14, "certifyId"

    move-object/from16 v18, v2

    const-string v2, "aliyun"

    move-object/from16 v19, v10

    const-string v10, "providerAppId"

    move-object/from16 v20, v11

    const-string v11, "publicUserId"

    const-string v0, "orderNo"

    move-object/from16 v21, v7

    const-string v7, "tencent"

    move-object/from16 v22, v12

    const-string v12, "provider"

    move-object/from16 v23, v5

    const/4 v5, 0x2

    if-ne v1, v5, :cond_4

    .line 8
    :try_start_0
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 9
    invoke-virtual {v8, v12, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 10
    iget-object v2, v4, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/TencentToken;->agreementNo:Ljava/lang/String;

    invoke-virtual {v8, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    iget-object v0, v4, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/TencentToken;->userId:Ljava/lang/String;

    invoke-virtual {v8, v11, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v10, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 14
    invoke-virtual {v8, v12, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    iget-object v0, v4, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    invoke-virtual {v8, v14, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 16
    :cond_1
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/VerificationToken;->isVolcProvider()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 17
    invoke-virtual {v8, v12, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    iget-object v0, v4, Lcom/p1/mobile/putong/data/VerificationToken;->volcEngineProToken:Lcom/p1/mobile/putong/data/VolcEngineProToken;

    if-nez v0, :cond_2

    move-object/from16 v14, v17

    goto :goto_0

    .line 19
    :cond_2
    iget-object v14, v0, Lcom/p1/mobile/putong/data/VolcEngineProToken;->bytedanceToken:Ljava/lang/String;

    .line 20
    :goto_0
    invoke-virtual {v8, v15, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    iget-object v0, v3, Ll/kxf;->b:Ljava/lang/String;

    invoke-virtual {v8, v13, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    :cond_3
    :goto_1
    const-string v0, "withPV"

    iget-boolean v2, v4, Lcom/p1/mobile/putong/data/VerificationToken;->withPV:Z

    invoke-virtual {v8, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 23
    const-string v0, "idCard"

    invoke-virtual {v6, v0, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-object/from16 v5, v23

    .line 24
    iget-object v0, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    move-object/from16 v8, v22

    invoke-virtual {v6, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-object/from16 v3, v19

    move-object/from16 v2, v20

    goto/16 :goto_4

    :cond_4
    move-object/from16 v8, v22

    move-object/from16 v5, v23

    .line 25
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    move-result v16

    if-eqz v16, :cond_5

    move-object/from16 v1, v21

    .line 26
    invoke-virtual {v1, v12, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 27
    iget-object v2, v4, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/TencentToken;->agreementNo:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 28
    iget-object v0, v4, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/TencentToken;->userId:Ljava/lang/String;

    invoke-virtual {v1, v11, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v10, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_3

    :cond_5
    move-object/from16 v1, v21

    .line 30
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 31
    invoke-virtual {v1, v12, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 32
    iget-object v0, v4, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    invoke-virtual {v1, v14, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_3

    .line 33
    :cond_6
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/VerificationToken;->isMoMoProvider()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 34
    const-string v0, "momocv"

    invoke-virtual {v1, v12, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    const-string v0, "personID"

    iget-object v2, v3, Ll/kxf;->o:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .line 36
    :cond_7
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProvider()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 37
    const-string v0, "tencentIntl"

    invoke-virtual {v1, v12, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 38
    iget-object v0, v3, Ll/kxf;->n:[B

    const/4 v2, 0x0

    invoke-static {v0, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    .line 39
    const-string v2, "liveData"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .line 40
    :cond_8
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProviderV2()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 41
    const-string v0, "tencentIntlV2"

    invoke-virtual {v1, v12, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    const-string v0, "tencentIntlToken"

    move-object/from16 v2, p1

    iget-object v2, v2, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .line 43
    :cond_9
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/VerificationToken;->isVolcProvider()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 44
    invoke-virtual {v1, v12, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    iget-object v0, v4, Lcom/p1/mobile/putong/data/VerificationToken;->volcEngineProToken:Lcom/p1/mobile/putong/data/VolcEngineProToken;

    if-nez v0, :cond_a

    move-object/from16 v14, v17

    goto :goto_2

    .line 46
    :cond_a
    iget-object v14, v0, Lcom/p1/mobile/putong/data/VolcEngineProToken;->bytedanceToken:Ljava/lang/String;

    .line 47
    :goto_2
    invoke-virtual {v1, v15, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    iget-object v0, v3, Ll/kxf;->b:Ljava/lang/String;

    invoke-virtual {v1, v13, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .line 49
    :cond_b
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/VerificationToken;->isAliyunIntlProvider()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 50
    const-string v0, "aliyunIntl"

    invoke-virtual {v1, v12, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 51
    const-string v0, "transactionId"

    iget-object v2, v4, Lcom/p1/mobile/putong/data/VerificationToken;->transactionId:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 52
    :cond_c
    :goto_3
    iget-object v0, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    move-object/from16 v2, v20

    invoke-virtual {v6, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    iget-object v0, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

    move-object/from16 v3, v19

    invoke-virtual {v6, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 54
    iget-object v0, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    invoke-virtual {v6, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 55
    const-string v0, "picture"

    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :goto_4
    const/4 v0, 0x3

    move/from16 v1, p3

    if-ne v1, v0, :cond_d

    .line 56
    invoke-static/range {p4 .. p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 57
    const-string v0, "ctdid"

    move-object/from16 v1, p4

    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    :cond_d
    iget-object v0, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    const-string v1, "6"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 59
    const-string v0, "groupName"

    invoke-static {}, Ll/v3l0;->e()Ll/v3l0;

    move-result-object v1

    invoke-virtual {v1}, Ll/v3l0;->d()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 60
    :cond_e
    iget-object v0, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 61
    const-string v0, "retrieveID"

    iget-object v4, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->retrieveId:Ljava/lang/String;

    invoke-virtual {v6, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    iget-object v0, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    invoke-virtual {v6, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    iget-object v0, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

    invoke-virtual {v6, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 64
    :cond_f
    const-string v0, "newProcess"

    iget-boolean v2, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->newProcess:Z

    invoke-virtual {v6, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    iget-object v0, v5, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 66
    invoke-static {v6}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->y(Lorg/json/JSONObject;)Lrx/c;

    move-result-object v0

    return-object v0

    :cond_10
    move-object/from16 v0, p0

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->a:Ll/wwh0;

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v6}, Ll/wwh0;->M(Ljava/lang/String;Lorg/json/JSONObject;)Lrx/c;

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    .line 68
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 69
    invoke-static {v0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    move-result-object v0

    return-object v0
.end method

.method public z(Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->a:Ll/wwh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wwh0;->N(Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
