.class public Ll/wji0;
.super Ll/wc00;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/wc00;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Ll/wji0;Lorg/json/JSONObject;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wji0;->n0(Lorg/json/JSONObject;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic L(Ll/wji0;Lorg/json/JSONObject;Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/wji0;->m0(Lorg/json/JSONObject;Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic M(Ll/wji0;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wji0;->h0(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static synthetic N(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 1

    .line 1
    const-string v0, "retrieveId"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "fromAccountBackH5"

    .line 19
    .line 20
    invoke-static {p1, v0, p0}, Ll/pq4;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic O(Ll/wji0;Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/facertification/RxFacertification$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/wji0;->o0(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/facertification/RxFacertification$b;)V

    return-void
.end method

.method public static synthetic P(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;Lkotlin/Unit;)Lrx/c;
    .locals 9

    .line 1
    :try_start_0
    const-string p5, "megface"

    .line 2
    .line 3
    invoke-static {p5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    :catchall_0
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->p()Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->builder()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object p5

    .line 18
    const-string v2, "idCardName"

    .line 19
    .line 20
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {p5, v2}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->setIdName(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object p5

    .line 28
    const-string v2, "idCardNumber"

    .line 29
    .line 30
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {p5, v2}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->setIdNumber(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/4 p5, 0x1

    .line 43
    invoke-static {p0, p5}, Ll/ixf;->c(Landroid/content/Context;Z)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const-string p0, "productId"

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    const-string p0, "retrieveId"

    .line 54
    .line 55
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    const/4 v5, 0x0

    .line 60
    const-string v6, ""

    .line 61
    .line 62
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->useAccountBackTemplate(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->build()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    new-instance v4, Ll/wq8;

    .line 71
    .line 72
    invoke-direct {v4}, Ll/wq8;-><init>()V

    .line 73
    .line 74
    .line 75
    move-object v2, p1

    .line 76
    move-object v5, p3

    .line 77
    move-object v6, p4

    .line 78
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->A(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Ll/ktl;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method

.method public static synthetic Q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic R(Ljava/lang/String;Lorg/json/JSONObject;)Ll/x1d0;
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

.method public static synthetic S(Ll/wji0;Ll/xc00;Lorg/json/JSONObject;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/wji0;->i0(Ll/xc00;Lorg/json/JSONObject;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.method public static synthetic T(Ll/wji0;Lorg/json/JSONObject;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wji0;->j0(Lorg/json/JSONObject;Ll/xc00;)V

    return-void
.end method

.method public static synthetic U(Ljava/lang/String;)Ll/x1d0;
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

.method public static synthetic V(Ll/wji0;Lorg/json/JSONObject;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wji0;->q0(Lorg/json/JSONObject;Ll/xc00;)V

    return-void
.end method

.method public static synthetic W(Ll/wji0;Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/wji0;->l0(Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;)V

    return-void
.end method

.method public static synthetic X(Ll/wji0;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wji0;->k0(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static synthetic Y(Ll/wji0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wji0;->p0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Z(Ll/wji0;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a0(Ll/wji0;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p0, Ll/oji0;

    .line 5
    .line 6
    invoke-direct {p0, p2, p1}, Ll/oji0;-><init>(Lorg/json/JSONObject;Ll/xc00;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final c0(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "/users/me/verifications/"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Ll/uqb0;->I:Ll/xi5;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "anchorVerification"

    .line 24
    .line 25
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v1, Ll/hji0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/hji0;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 41
    .line 42
    invoke-static {v1, p0}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public final d0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance p3, Ll/wji0$a;

    .line 2
    .line 3
    invoke-direct {p3, p0, p4, p1, p2}, Ll/wji0$a;-><init>(Ll/wji0;Lorg/json/JSONObject;Ll/xc00;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p3
.end method

.method public final e0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p1, Ll/rji0;

    .line 2
    .line 3
    invoke-direct {p1, p0, p2}, Ll/rji0;-><init>(Ll/wji0;Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    new-instance v0, Ll/pji0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/pji0;-><init>(Ll/wji0;Lorg/json/JSONObject;Ll/xc00;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final g0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    new-instance p1, Ll/qji0;

    .line 2
    .line 3
    invoke-direct {p1, p0, p2}, Ll/qji0;-><init>(Ll/wji0;Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic h0(Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "from"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "findPhonenumber"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Ll/esf0;->g:Ll/wyd0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, p1, v0}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final synthetic i0(Ll/xc00;Lorg/json/JSONObject;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    if-eqz p5, :cond_0

    .line 2
    .line 3
    move-object p5, p4

    .line 4
    const-string p4, "fromAccountBackH5"

    .line 5
    .line 6
    invoke-virtual/range {p0 .. p5}, Ll/wji0;->s0(Ll/xc00;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance p1, Lorg/json/JSONObject;

    .line 11
    .line 12
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 13
    .line 14
    .line 15
    :try_start_0
    const-string p3, "code"

    .line 16
    .line 17
    const-string p4, "300002"

    .line 18
    .line 19
    invoke-virtual {p1, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    :catch_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p2, p1}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic j0(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 11

    .line 1
    const-string v0, "idCardName"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "idCardNumber"

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "productId"

    .line 14
    .line 15
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v3, "retrieveId"

    .line 20
    .line 21
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const-string v4, "publicId"

    .line 26
    .line 27
    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v9

    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    invoke-virtual {p2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sget v1, Lcom/p1/mobile/putong/core/R$string;->g0:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "fromAccountBackH5"

    .line 73
    .line 74
    invoke-virtual {p0, p2, v1, v0, p1}, Ll/wji0;->d0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    .line 75
    .line 76
    .line 77
    move-result-object v10

    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v1, "android.permission.CAMERA"

    .line 83
    .line 84
    filled-new-array {v1}, [Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const/4 v1, 0x0

    .line 93
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const/4 v1, 0x1

    .line 98
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v5, Ll/vji0;

    .line 103
    .line 104
    move-object v6, p0

    .line 105
    move-object v8, p1

    .line 106
    move-object v7, p2

    .line 107
    invoke-direct/range {v5 .. v10}, Ll/vji0;-><init>(Ll/wji0;Ll/xc00;Lorg/json/JSONObject;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->l(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {v7}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 119
    .line 120
    .line 121
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic k0(Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 58
    .line 59
    const-string v2, "verified"

    .line 60
    .line 61
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_0

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 76
    .line 77
    const-string v1, "pending"

    .line 78
    .line 79
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    const/4 v0, 0x2

    .line 86
    goto :goto_0

    .line 87
    :cond_1
    const/4 v0, 0x0

    .line 88
    :goto_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0, p1, v0}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    return-void
.end method

.method public final synthetic l0(Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p5, Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;->data:Lcom/p1/mobile/putong/core/data/CoreData;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const-string v0, "code"

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    :try_start_0
    iget-object v1, p5, Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 22
    .line 23
    iget v1, v1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 24
    .line 25
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    const-string v0, "data"

    .line 29
    .line 30
    iget-object p5, p5, Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;->data:Lcom/p1/mobile/putong/core/data/CoreData;

    .line 31
    .line 32
    iget-object p5, p5, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p5

    .line 38
    check-cast p5, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 39
    .line 40
    invoke-virtual {p5}, Lcom/p1/mobile/putong/core/data/VerificationCenter;->toJson()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p5

    .line 44
    invoke-virtual {p2, v0, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    :catch_0
    const-string p5, "sdk_name"

    .line 48
    .line 49
    iget-object v0, p3, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p5, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p5

    .line 55
    const-string v0, "verification_result_code"

    .line 56
    .line 57
    invoke-static {v0, p1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p3, p3, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 62
    .line 63
    const-string v0, "identity"

    .line 64
    .line 65
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    if-eqz p3, :cond_0

    .line 70
    .line 71
    const-string p3, "id_ability"

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    const-string p3, "avatar_ability"

    .line 75
    .line 76
    :goto_0
    const-string v0, "verification_type"

    .line 77
    .line 78
    invoke-static {v0, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    const-string v0, "verification_scene"

    .line 83
    .line 84
    const-string v1, "change_bind_new_phone"

    .line 85
    .line 86
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    filled-new-array {p5, p1, p3, v0}, [Ll/sfj0$a;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const-string p3, "e_verification_scanface_submit"

    .line 95
    .line 96
    const-string p5, "p_profile_picture_verification_pageShow"

    .line 97
    .line 98
    invoke-static {p3, p5, p1}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_1
    :try_start_1
    const-string p1, "-1"

    .line 103
    .line 104
    invoke-virtual {p2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 105
    .line 106
    .line 107
    :catch_1
    :goto_1
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p0, p4, p1}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final synthetic m0(Lorg/json/JSONObject;Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p5, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    const-string v1, "code"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    move-object v0, p5

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 11
    .line 12
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "300001"

    .line 21
    .line 22
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    :goto_0
    invoke-virtual {p2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Dr:I

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p3, p1}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const-string p0, "sdk_name"

    .line 53
    .line 54
    iget-object p1, p4, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p5, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 61
    .line 62
    iget p1, p5, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 63
    .line 64
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const-string p2, "verification_result_code"

    .line 69
    .line 70
    invoke-static {p2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p2, p4, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 75
    .line 76
    const-string p3, "identity"

    .line 77
    .line 78
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-eqz p2, :cond_1

    .line 83
    .line 84
    const-string p2, "id_ability"

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_1
    const-string p2, "avatar_ability"

    .line 88
    .line 89
    :goto_1
    const-string p3, "verification_type"

    .line 90
    .line 91
    invoke-static {p3, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    const-string p3, "verification_scene"

    .line 96
    .line 97
    const-string p4, "change_bind_new_phone"

    .line 98
    .line 99
    invoke-static {p3, p4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    filled-new-array {p0, p1, p2, p3}, [Ll/sfj0$a;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string p1, "e_verification_scanface_submit"

    .line 108
    .line 109
    const-string p2, "p_profile_picture_verification_pageShow"

    .line 110
    .line 111
    invoke-static {p1, p2, p0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final synthetic n0(Lorg/json/JSONObject;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance p2, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "code"

    .line 7
    .line 8
    const-string v1, "-1"

    .line 9
    .line 10
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p0, p1, p2}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    :catch_0
    return-void
.end method

.method public final synthetic o0(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/facertification/RxFacertification$b;)V
    .locals 13

    .line 1
    move-object/from16 v4, p4

    .line 2
    .line 3
    iget-object v0, v4, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 4
    .line 5
    const-string v6, "change_bind_new_phone"

    .line 6
    .line 7
    const-string v7, "verification_scene"

    .line 8
    .line 9
    const-string v8, "avatar_ability"

    .line 10
    .line 11
    const-string v9, "id_ability"

    .line 12
    .line 13
    const-string v10, "identity"

    .line 14
    .line 15
    const-string v11, "verification_type"

    .line 16
    .line 17
    const-string v12, "p_profile_picture_verification_pageShow"

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    move-object v0, v9

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move-object v0, v8

    .line 32
    :goto_0
    invoke-static {v11, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v7, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    filled-new-array {v0, v1}, [Ll/sfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "e_verification_scanface_request"

    .line 45
    .line 46
    invoke-static {v1, v12, v0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v2, v4, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 50
    .line 51
    move-object v0, p0

    .line 52
    move-object v1, p1

    .line 53
    move-object v3, p2

    .line 54
    move-object/from16 v5, p3

    .line 55
    .line 56
    invoke-virtual/range {v0 .. v5}, Ll/wji0;->r0(Ll/xc00;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lorg/json/JSONObject;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, v4, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 62
    .line 63
    const-string p1, "sdk_name"

    .line 64
    .line 65
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string p1, "verification_result_code"

    .line 70
    .line 71
    const/4 p2, 0x0

    .line 72
    invoke-static {p1, p2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p2, v4, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    .line 77
    .line 78
    iget-object p2, p2, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p2, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-eqz p2, :cond_2

    .line 85
    .line 86
    move-object v8, v9

    .line 87
    :cond_2
    invoke-static {v11, v8}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-static {v7, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    filled-new-array {p0, p1, p2, v0}, [Ll/sfj0$a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string p1, "e_verification_scanface_finish"

    .line 100
    .line 101
    invoke-static {p1, v12, p0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final synthetic p0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wc00;->x()Ll/ad00;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "tantan_verification_getSlideSuccessData"

    .line 6
    .line 7
    filled-new-array {p1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, v0, p1}, Ll/ad00;->e(Ljava/lang/String;[Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic q0(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/SliderData;->new_()Lcom/p1/mobile/putong/data/SliderData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_3

    .line 10
    .line 11
    const-string v1, "uuid"

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "supplier"

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->supplier:I

    .line 26
    .line 27
    const-string v1, "retryClose"

    .line 28
    .line 29
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->retryClose:I

    .line 34
    .line 35
    const-string v1, "delayClose"

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->delayClose:I

    .line 42
    .line 43
    const-string v1, "allowClose"

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->allowClose:I

    .line 50
    .line 51
    const-string v1, "projectType"

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget-object v1, v1, Ll/esf0;->m:Ll/jxd0;

    .line 62
    .line 63
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    iget-object v2, v2, Ll/esf0;->a:Lrx/subjects/b;

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    new-instance v2, Ll/tji0;

    .line 83
    .line 84
    invoke-direct {v2, p0}, Ll/tji0;-><init>(Ll/wji0;)V

    .line 85
    .line 86
    .line 87
    new-instance v3, Ll/uji0;

    .line 88
    .line 89
    invoke-direct {v3}, Ll/uji0;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    const-string v1, "accountGetBackType"

    .line 100
    .line 101
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_0

    .line 106
    .line 107
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1, v1}, Ll/esf0;->w(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_2

    .line 119
    .line 120
    invoke-virtual {p0, p2, v0}, Ll/wji0;->w0(Ll/xc00;Lcom/p1/mobile/putong/data/SliderData;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_0
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v1, v0}, Ll/esf0;->v(Lcom/p1/mobile/putong/data/SliderData;)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/esf0;->k()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_2

    .line 144
    .line 145
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_1

    .line 150
    .line 151
    invoke-virtual {p0, p2, p1}, Ll/wji0;->v0(Ll/xc00;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0}, Ll/esf0;->z()Lrx/subjects/b;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 164
    .line 165
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    :cond_2
    return-void

    .line 169
    :cond_3
    const-string p2, "0"

    .line 170
    .line 171
    invoke-virtual {p0, p1, p2}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public final r0(Ll/xc00;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lorg/json/JSONObject;)V
    .locals 6
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object v0, p3

    .line 2
    new-instance p3, Lorg/json/JSONObject;

    .line 3
    .line 4
    invoke-direct {p3}, Lorg/json/JSONObject;-><init>()V

    .line 5
    .line 6
    .line 7
    move-object v1, p4

    .line 8
    iget-object p4, v1, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    .line 9
    .line 10
    new-instance v2, Lorg/json/JSONObject;

    .line 11
    .line 12
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->a:Ll/kxf;

    .line 16
    .line 17
    iget-boolean v3, v1, Ll/kxf;->h:Z

    .line 18
    .line 19
    if-nez v3, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 26
    .line 27
    .line 28
    :try_start_0
    const-string p1, "code"

    .line 29
    .line 30
    iget-object p2, v1, Ll/kxf;->b:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p3, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    const-string p1, "data"

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/kxf;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p3, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p5, p1}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    :catch_0
    return-void

    .line 52
    :cond_0
    :try_start_1
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    .line 53
    .line 54
    .line 55
    move-result v3
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 56
    const-string v4, "provider"

    .line 57
    .line 58
    if-eqz v3, :cond_1

    .line 59
    .line 60
    :try_start_2
    const-string v3, "tencent"

    .line 61
    .line 62
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    const-string v3, "orderNo"

    .line 66
    .line 67
    iget-object v4, p4, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 68
    .line 69
    iget-object v4, v4, Lcom/p1/mobile/putong/data/TencentToken;->agreementNo:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    .line 73
    .line 74
    const-string v3, "publicUserId"

    .line 75
    .line 76
    iget-object v4, p4, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 77
    .line 78
    iget-object v4, v4, Lcom/p1/mobile/putong/data/TencentToken;->userId:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    const-string v3, "providerAppId"

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-eqz v3, :cond_2

    .line 98
    .line 99
    const-string v3, "aliyun"

    .line 100
    .line 101
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 102
    .line 103
    .line 104
    const-string v3, "certifyId"

    .line 105
    .line 106
    iget-object v4, p4, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    :cond_2
    :goto_0
    const-string v3, "withPV"

    .line 112
    .line 113
    iget-boolean v4, p4, Lcom/p1/mobile/putong/data/VerificationToken;->withPV:Z

    .line 114
    .line 115
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 116
    .line 117
    .line 118
    const-string v3, "idCard"

    .line 119
    .line 120
    invoke-virtual {p5, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 121
    .line 122
    .line 123
    const-string v2, "productId"

    .line 124
    .line 125
    iget-object v3, p2, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p5, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 128
    .line 129
    .line 130
    const-string v2, "retrieveID"

    .line 131
    .line 132
    iget-object v3, p2, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->retrieveId:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p5, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 135
    .line 136
    .line 137
    const-string v2, "appId"

    .line 138
    .line 139
    iget-object v3, p2, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {p5, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 142
    .line 143
    .line 144
    const-string v2, "verifyType"

    .line 145
    .line 146
    iget-object p2, p2, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {p5, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 149
    .line 150
    .line 151
    :catch_1
    iget-object p2, v1, Ll/kxf;->b:Ljava/lang/String;

    .line 152
    .line 153
    const-string v1, "2006"

    .line 154
    .line 155
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    if-eqz p2, :cond_3

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Ll/wji0;->c0(Ljava/lang/String;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    goto :goto_1

    .line 166
    :cond_3
    invoke-virtual {p0, v0, p5}, Ll/wji0;->t0(Ljava/lang/String;Lorg/json/JSONObject;)Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    :goto_1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    move-object p2, p1

    .line 179
    move-object p1, p0

    .line 180
    new-instance p0, Ll/lji0;

    .line 181
    .line 182
    invoke-direct/range {p0 .. p5}, Ll/lji0;-><init>(Ll/wji0;Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;Lorg/json/JSONObject;)V

    .line 183
    .line 184
    .line 185
    move-object v1, p5

    .line 186
    move-object p5, p4

    .line 187
    move-object p4, v1

    .line 188
    move-object v1, p0

    .line 189
    new-instance p0, Ll/mji0;

    .line 190
    .line 191
    move-object v5, p3

    .line 192
    move-object p3, p2

    .line 193
    move-object p2, v5

    .line 194
    invoke-direct/range {p0 .. p5}, Ll/mji0;-><init>(Ll/wji0;Lorg/json/JSONObject;Ll/xc00;Lorg/json/JSONObject;Lcom/p1/mobile/putong/data/VerificationToken;)V

    .line 195
    .line 196
    .line 197
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 202
    .line 203
    .line 204
    return-void
.end method

.method public final s0(Ll/xc00;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "facertification"

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->r(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/iji0;

    .line 25
    .line 26
    move-object v2, p1

    .line 27
    move-object v4, p2

    .line 28
    move-object v3, p3

    .line 29
    move-object v6, p4

    .line 30
    move-object v5, p5

    .line 31
    invoke-direct/range {v1 .. v6}, Ll/iji0;-><init>(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance p2, Ll/jji0;

    .line 39
    .line 40
    invoke-direct {p2, p0, v2, v3, v4}, Ll/jji0;-><init>(Ll/wji0;Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 41
    .line 42
    .line 43
    new-instance p3, Ll/kji0;

    .line 44
    .line 45
    invoke-direct {p3, p0, v4}, Ll/kji0;-><init>(Ll/wji0;Lorg/json/JSONObject;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final t0(Ljava/lang/String;Lorg/json/JSONObject;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/NullPointerException;

    .line 8
    .line 9
    const-string p1, "empty userId"

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    const-string p0, "/retrieve/verification?process=new"

    .line 20
    .line 21
    invoke-static {p0}, Ll/xi5;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Ll/uqb0;->I:Ll/xi5;

    .line 26
    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "accountVerificationResult"

    .line 30
    .line 31
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v1, Ll/nji0;

    .line 42
    .line 43
    invoke-direct {v1, p0, p2}, Ll/nji0;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/data/VerificationCoreEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 47
    .line 48
    invoke-static {v1, p0}, Ll/qi20;->f(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p0, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public final u0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    new-instance v0, Ll/sji0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/sji0;-><init>(Ll/wji0;Lorg/json/JSONObject;Ll/xc00;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public v(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch p2, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
    const-string p2, "showCaptchaVerification"

    .line 16
    .line 17
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x4

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string p2, "isStudentVerified"

    .line 27
    .line 28
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-nez p2, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v2, 0x3

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string p2, "ctdidVerification"

    .line 38
    .line 39
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v2, 0x2

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    const-string p2, "identifierVerification"

    .line 49
    .line 50
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-nez p2, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    move v2, v1

    .line 58
    goto :goto_0

    .line 59
    :sswitch_4
    const-string p2, "getSliderDataByFrom"

    .line 60
    .line 61
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-nez p2, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    move v2, v0

    .line 69
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 70
    .line 71
    .line 72
    return v0

    .line 73
    :pswitch_0
    invoke-virtual {p0, p1, p4}, Ll/wji0;->u0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 74
    .line 75
    .line 76
    return v1

    .line 77
    :pswitch_1
    invoke-virtual {p0, p1, p4}, Ll/wji0;->g0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 78
    .line 79
    .line 80
    return v1

    .line 81
    :pswitch_2
    invoke-virtual {p0, p1, p4}, Ll/wji0;->b0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 82
    .line 83
    .line 84
    return v1

    .line 85
    :pswitch_3
    invoke-virtual {p0, p1, p4}, Ll/wji0;->f0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 86
    .line 87
    .line 88
    return v1

    .line 89
    :pswitch_4
    invoke-virtual {p0, p1, p4}, Ll/wji0;->e0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 90
    .line 91
    .line 92
    return v1

    .line 93
    :sswitch_data_0
    .sparse-switch
        -0x4edc9fde -> :sswitch_4
        -0x3e48de9c -> :sswitch_3
        0x1f64ba9 -> :sswitch_2
        0x59e20b99 -> :sswitch_1
        0x7f5b4f78 -> :sswitch_0
    .end sparse-switch

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public v0(Ll/xc00;Ljava/lang/String;)V
    .locals 7

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string v0, ""

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/u17;->z()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    move-object v2, p0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object v2, v0

    .line 20
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 35
    .line 36
    move-object v3, p0

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move-object v3, v0

    .line 39
    :goto_1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/esf0;->i()Lcom/p1/mobile/putong/data/SliderData;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    const/4 v6, 0x1

    .line 52
    move-object v5, p2

    .line 53
    invoke-virtual/range {v1 .. v6}, Ll/esf0;->m(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SliderData;Ljava/lang/String;Z)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-nez p2, :cond_2

    .line 62
    .line 63
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    invoke-static {p2, v0, p0, v1, v1}, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->n2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string p2, "hideNavigationBar"

    .line 71
    .line 72
    invoke-virtual {p0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    const-string p2, "skipLoading"

    .line 76
    .line 77
    invoke-virtual {p0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    return-void
.end method

.method public w0(Ll/xc00;Lcom/p1/mobile/putong/data/SliderData;)V
    .locals 7

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string v0, ""

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/u17;->z()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    move-object v2, p0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object v2, v0

    .line 20
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 43
    .line 44
    move-object v3, p0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    move-object v3, v0

    .line 47
    :goto_1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v5, "chang_bind_new_phone"

    .line 52
    .line 53
    const/4 v6, 0x1

    .line 54
    move-object v4, p2

    .line 55
    invoke-virtual/range {v1 .. v6}, Ll/esf0;->m(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SliderData;Ljava/lang/String;Z)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-nez p2, :cond_2

    .line 64
    .line 65
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 66
    .line 67
    const/4 v1, 0x1

    .line 68
    invoke-static {p2, v0, p0, v1, v1}, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->n2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p2, "hideNavigationBar"

    .line 73
    .line 74
    invoke-virtual {p0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    const-string p2, "skipLoading"

    .line 78
    .line 79
    invoke-virtual {p0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    return-void
.end method
