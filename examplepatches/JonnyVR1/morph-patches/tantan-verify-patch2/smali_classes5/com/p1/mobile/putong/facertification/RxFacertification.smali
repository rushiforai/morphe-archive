.class public Lcom/p1/mobile/putong/facertification/RxFacertification;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/facertification/RxFacertification$b;,
        Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;
    }
.end annotation


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

.method public static synthetic a(Landroid/content/Context;Ljava/util/Map;Lcom/p1/mobile/putong/data/VerificationToken;Ll/gcg0;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/cwh0;->a()Ll/ltl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->o(Lcom/p1/mobile/putong/data/VerificationToken;)Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    new-instance v2, Lcom/p1/mobile/putong/facertification/RxFacertification$a;

    .line 15
    .line 16
    invoke-direct {v2, p3, p1}, Lcom/p1/mobile/putong/facertification/RxFacertification$a;-><init>(Ll/gcg0;Ljava/util/Map;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, p0, v1, p2, v2}, Ll/ltl;->a(Landroid/content/Context;Ljava/util/HashMap;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ll/ltl$a;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Landroid/content/Context;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ll/gcg0;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const-string v2, "option-key-token"

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProvider()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->response:Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ReflectResponse;->reflectSequence:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProviderV2()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isMoMoProvider()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    const-string v1, "option-key-mode"

    .line 50
    .line 51
    const-string v3, "VERIFY_SILENT"

    .line 52
    .line 53
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    const/4 v1, 0x4

    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v3, "option-key-action-count"

    .line 62
    .line 63
    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isAliyunIntlProvider()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->transactionId:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->isVolcProvider()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    const-string v1, "option-key-verity-type"

    .line 84
    .line 85
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->volcEngineProToken:Lcom/p1/mobile/putong/data/VolcEngineProToken;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VolcEngineProToken;->bytedanceToken:Ljava/lang/String;

    .line 93
    .line 94
    const-string v2, "option-key-bytedance_token"

    .line 95
    .line 96
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->volcEngineProToken:Lcom/p1/mobile/putong/data/VolcEngineProToken;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VolcEngineProToken;->clientConfig:Ljava/lang/String;

    .line 102
    .line 103
    const-string v2, "option-key-client_config"

    .line 104
    .line 105
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    :cond_5
    invoke-static {}, Ll/cwh0;->a()Ll/ltl;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    new-instance v2, Ll/erd0;

    .line 113
    .line 114
    invoke-direct {v2, p4, p0, p1}, Ll/erd0;-><init>(Ll/gcg0;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V

    .line 115
    .line 116
    .line 117
    invoke-interface {v1, p2, p3, v0, v2}, Ll/ltl;->b(Landroid/content/Context;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ljava/util/HashMap;Ll/ltl$b;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public static synthetic c(Ll/gcg0;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Ll/kxf;)V
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    .line 2
    .line 3
    invoke-direct {v0, p3, p1, p2}, Lcom/p1/mobile/putong/facertification/RxFacertification$b;-><init>(Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p0}, Ll/bb50;->onCompleted()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p1

    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static d(Landroid/content/Context;Ljava/util/Map;Lcom/p1/mobile/putong/data/VerificationToken;)Lrx/c;
    .locals 1
    .param p2    # Lcom/p1/mobile/putong/data/VerificationToken;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/p1/mobile/putong/data/VerificationToken;",
            ")",
            "Lrx/c<",
            "Ll/jxf;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/drd0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/drd0;-><init>(Landroid/content/Context;Ljava/util/Map;Lcom/p1/mobile/putong/data/VerificationToken;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static e(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/data/VerificationToken;",
            "Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/facertification/RxFacertification$b;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->o(Lcom/p1/mobile/putong/data/VerificationToken;)Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/crd0;

    .line 6
    .line 7
    invoke-direct {v1, p1, p2, p0, v0}, Ll/crd0;-><init>(Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Landroid/content/Context;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
