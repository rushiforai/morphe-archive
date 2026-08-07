.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/SliderBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c()V
    .locals 2

    .line 1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/esf0;->v(Lcom/p1/mobile/putong/data/SliderData;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic d()V
    .locals 2

    .line 1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/esf0;->q(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "ready"

    .line 26
    .line 27
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 34
    .line 35
    iget-object p0, p0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 36
    .line 37
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->fp()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public static synthetic f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/aqq;)V
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/Captcha;->new_()Lcom/p1/mobile/putong/data/Captcha;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object p2, v0, Lcom/p1/mobile/putong/data/Captcha;->genTime:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Captcha;->captchaID:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p3, v0, Lcom/p1/mobile/putong/data/Captcha;->lotNumber:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p4, v0, Lcom/p1/mobile/putong/data/Captcha;->passToken:Ljava/lang/String;

    .line 43
    .line 44
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Captcha;->captchaOutput:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Ll/esf0;->b:Lrx/subjects/b;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p5}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    :goto_0
    invoke-virtual {p5}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public clearClientSliderCache(Ll/aqq;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "clearClientSliderCache"
    .end annotation

    .line 1
    new-instance p0, Ll/yrf0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/yrf0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final h(Ll/aqq;Lcom/p1/mobile/putong/data/ChatAppealCheckData;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object p0, Ll/uqb0;->N:Lcom/p1/mobile/putong/api/api/OtherApi;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/api/api/OtherApi;->userAppealCheck(Lcom/p1/mobile/putong/data/ChatAppealCheckData;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ll/bsf0;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/bsf0;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance p2, Ll/csf0;

    .line 13
    .line 14
    invoke-direct {p2}, Ll/csf0;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setJiYanVerificationResult(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "setJiYanVerificationResult"
    .end annotation

    .line 1
    new-instance p0, Ll/asf0;

    .line 2
    .line 3
    move-object v0, p6

    .line 4
    move-object p6, p1

    .line 5
    move-object p1, p2

    .line 6
    move-object p2, p3

    .line 7
    move-object p3, p4

    .line 8
    move-object p4, p5

    .line 9
    move-object p5, v0

    .line 10
    invoke-direct/range {p0 .. p6}, Ll/asf0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/aqq;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setSliderVerificationResult(Ll/aqq;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 11
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "setSliderVerificationResult"
    .end annotation

    .line 1
    move-object/from16 p0, p5

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/data/SliderVerifyData;->new_()Lcom/p1/mobile/putong/data/SliderVerifyData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const-string v0, "pass"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "reject"

    .line 13
    .line 14
    :goto_0
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SliderVerifyData;->verifyResult:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    move-object v1, p3

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    move-object v1, v0

    .line 23
    :goto_1
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SliderVerifyData;->token:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/esf0;->j()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "accountGetBackType"

    .line 34
    .line 35
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    const-string v1, "p_bind_to_new_phone"

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_2
    const-string v1, "p_captcha_popup"

    .line 45
    .line 46
    :goto_2
    const-string v3, "captcha_supplier"

    .line 47
    .line 48
    invoke-static/range {p6 .. p6}, Ll/esf0;->l(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    const-string v3, "captcha_popup_type"

    .line 57
    .line 58
    const-string v4, "slide"

    .line 59
    .line 60
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    if-eqz p2, :cond_3

    .line 65
    .line 66
    const-string v3, "success"

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_3
    move-object v3, p4

    .line 70
    :goto_3
    const-string v4, "captcha_result_code"

    .line 71
    .line 72
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    const-string v3, "captcha_popup_token"

    .line 77
    .line 78
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    const-string v3, "captcha_page_type"

    .line 83
    .line 84
    const-string v4, "other"

    .line 85
    .line 86
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v9

    .line 90
    const-string v3, "captcha_popup_sence"

    .line 91
    .line 92
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v10

    .line 96
    filled-new-array/range {v5 .. v10}, [Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    const-string v4, "e_captcha_popup_finish"

    .line 101
    .line 102
    invoke-static {v4, v1, v3}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 103
    .line 104
    .line 105
    move/from16 v1, p6

    .line 106
    .line 107
    iput v1, p1, Lcom/p1/mobile/putong/data/SliderVerifyData;->supplier:I

    .line 108
    .line 109
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SliderVerifyData;->uuid:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0}, Ll/esf0;->j()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-eqz p0, :cond_5

    .line 124
    .line 125
    if-eqz p2, :cond_4

    .line 126
    .line 127
    move-object v0, p3

    .line 128
    :cond_4
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SliderVerifyData;->validate:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    iget-object p0, p0, Ll/esf0;->g:Ll/wyd0;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/SliderVerifyData;->toJson()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_5
    sget-object p0, Ll/uqb0;->N:Lcom/p1/mobile/putong/api/api/OtherApi;

    .line 145
    .line 146
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/OtherApi;->verifyContent(Lcom/p1/mobile/putong/data/SliderVerifyData;)Lrx/c;

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public setSliderVerificationResultByType(Ll/aqq;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 13
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "setSliderVerificationResultByType"
    .end annotation

    .line 1
    move-object/from16 v0, p5

    .line 2
    .line 3
    move-object/from16 v1, p7

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/SliderVerifyData;->new_()Lcom/p1/mobile/putong/data/SliderVerifyData;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const-string v3, "pass"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v3, "reject"

    .line 15
    .line 16
    :goto_0
    iput-object v3, v2, Lcom/p1/mobile/putong/data/SliderVerifyData;->verifyResult:Ljava/lang/String;

    .line 17
    .line 18
    const-string v3, ""

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    move-object/from16 v4, p3

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    move-object v4, v3

    .line 26
    :goto_1
    iput-object v4, v2, Lcom/p1/mobile/putong/data/SliderVerifyData;->token:Ljava/lang/String;

    .line 27
    .line 28
    move/from16 v4, p6

    .line 29
    .line 30
    iput v4, v2, Lcom/p1/mobile/putong/data/SliderVerifyData;->supplier:I

    .line 31
    .line 32
    iput-object v0, v2, Lcom/p1/mobile/putong/data/SliderVerifyData;->uuid:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz p2, :cond_2

    .line 35
    .line 36
    move-object/from16 v3, p3

    .line 37
    .line 38
    :cond_2
    iput-object v3, v2, Lcom/p1/mobile/putong/data/SliderVerifyData;->validate:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Ll/esf0;->j()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const-string v5, "accountGetBackType"

    .line 49
    .line 50
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_3

    .line 55
    .line 56
    const-string v3, "p_bind_to_new_phone"

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_3
    const-string v3, "p_captcha_popup"

    .line 60
    .line 61
    :goto_2
    const-string v6, "captcha_supplier"

    .line 62
    .line 63
    invoke-static {v4}, Ll/esf0;->l(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-static {v6, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    const-string v4, "captcha_popup_type"

    .line 72
    .line 73
    const-string v6, "slide"

    .line 74
    .line 75
    invoke-static {v4, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v8

    .line 79
    if-eqz p2, :cond_4

    .line 80
    .line 81
    const-string v4, "success"

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_4
    move-object/from16 v4, p4

    .line 85
    .line 86
    :goto_3
    const-string v6, "captcha_result_code"

    .line 87
    .line 88
    invoke-static {v6, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object v9

    .line 92
    const-string v4, "captcha_popup_token"

    .line 93
    .line 94
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v10

    .line 98
    const-string v4, "captcha_page_type"

    .line 99
    .line 100
    const-string v6, "other"

    .line 101
    .line 102
    invoke-static {v4, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v11

    .line 106
    const-string v4, "captcha_popup_sence"

    .line 107
    .line 108
    invoke-static {v4, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v12

    .line 112
    filled-new-array/range {v7 .. v12}, [Ll/pf60;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    const-string v6, "e_captcha_popup_finish"

    .line 117
    .line 118
    invoke-static {v6, v3, v4}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    iget-object v3, v3, Ll/esf0;->a:Lrx/subjects/b;

    .line 126
    .line 127
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/SliderVerifyData;->toJson()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-virtual {v3, v4}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    const-string v3, "forbid_chat_appeal"

    .line 135
    .line 136
    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_6

    .line 141
    .line 142
    if-eqz p2, :cond_5

    .line 143
    .line 144
    invoke-static {}, Lcom/p1/mobile/putong/data/ChatAppealCheckData;->new_()Lcom/p1/mobile/putong/data/ChatAppealCheckData;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    iput-object v0, p2, Lcom/p1/mobile/putong/data/ChatAppealCheckData;->uuid:Ljava/lang/String;

    .line 149
    .line 150
    const-string v0, "jailed"

    .line 151
    .line 152
    iput-object v0, p2, Lcom/p1/mobile/putong/data/ChatAppealCheckData;->appeal_type:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Ll/esf0;->d()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iput-object v0, p2, Lcom/p1/mobile/putong/data/ChatAppealCheckData;->ticketId:Ljava/lang/String;

    .line 163
    .line 164
    move-object/from16 v0, p3

    .line 165
    .line 166
    iput-object v0, p2, Lcom/p1/mobile/putong/data/ChatAppealCheckData;->token:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/SliderBridgeImplementation;->h(Ll/aqq;Lcom/p1/mobile/putong/data/ChatAppealCheckData;)V

    .line 169
    .line 170
    .line 171
    :cond_5
    return-void

    .line 172
    :cond_6
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0}, Ll/esf0;->j()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-static {p0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-eqz p0, :cond_7

    .line 185
    .line 186
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    iget-object p0, p0, Ll/esf0;->g:Ll/wyd0;

    .line 191
    .line 192
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/SliderVerifyData;->toJson()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_7
    sget-object p0, Ll/uqb0;->N:Lcom/p1/mobile/putong/api/api/OtherApi;

    .line 201
    .line 202
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/api/api/OtherApi;->verifyContent(Lcom/p1/mobile/putong/data/SliderVerifyData;)Lrx/c;

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method public sliderLoadSuccess(Ll/aqq;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "sliderLoadSuccess"
    .end annotation

    .line 1
    new-instance p0, Ll/zrf0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/zrf0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
