.class public Ll/pw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/hp50;

.field public b:Ll/gvf;

.field public c:Ll/awi0;

.field public d:Ll/gmj0;

.field public e:Ll/f6k;

.field public f:Ll/hue;

.field public g:Ll/h9i0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hp50;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/hp50;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pw;->a:Ll/hp50;

    .line 10
    .line 11
    new-instance v0, Ll/gvf;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/gvf;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/pw;->b:Ll/gvf;

    .line 17
    .line 18
    new-instance v0, Ll/awi0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/awi0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/pw;->c:Ll/awi0;

    .line 24
    .line 25
    new-instance v0, Ll/gmj0;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/gmj0;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/pw;->d:Ll/gmj0;

    .line 31
    .line 32
    new-instance v0, Ll/f6k;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/f6k;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/pw;->e:Ll/f6k;

    .line 38
    .line 39
    new-instance v0, Ll/hue;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/hue;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/pw;->f:Ll/hue;

    .line 45
    .line 46
    new-instance v0, Ll/h9i0;

    .line 47
    .line 48
    invoke-direct {v0}, Ll/h9i0;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/pw;->g:Ll/h9i0;

    .line 52
    .line 53
    return-void
.end method

.method public static synthetic a(Ljava/lang/Boolean;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/putong/account/data/AccountTestGroup;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->new_()Lcom/p1/mobile/putong/account/data/AccountTestGroup;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/Data;->thirdPartyStatus:Lcom/p1/mobile/account_core/reponse_data/ThirdPartyStatus;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/account_core/reponse_data/ThirdPartyStatus;->facebook:Z

    .line 14
    .line 15
    iput-boolean v1, v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->facebookEntry:Z

    .line 16
    .line 17
    iget-boolean p0, p0, Lcom/p1/mobile/account_core/reponse_data/ThirdPartyStatus;->google_ttt:Z

    .line 18
    .line 19
    iput-boolean p0, v0, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->googleEntry:Z

    .line 20
    .line 21
    :cond_0
    return-object v0
.end method

.method public static synthetic c(Ll/pw;Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pw;->D(Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/Boolean;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/Long;)Lcom/p1/mobile/putong/data/DownloadDataCheck;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DownloadDataCheck;->new_()Lcom/p1/mobile/putong/data/DownloadDataCheck;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DownloadDataCheck;->last_apply_time:J

    .line 10
    .line 11
    return-object v0
.end method

.method public static synthetic g(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/account_core/reponse_data/Token;
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

.method public static synthetic h(Lcom/p1/mobile/putong/data/VerifyDataV2;Landroid/util/Pair;)Ll/uxj0;
    .locals 7

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_4

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const-string v2, "ttt-signup"

    .line 19
    .line 20
    const-string v3, "pending"

    .line 21
    .line 22
    const-string v4, "signup"

    .line 23
    .line 24
    const-string v5, "signin"

    .line 25
    .line 26
    const/4 v6, -0x1

    .line 27
    sparse-switch v1, :sswitch_data_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :sswitch_0
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v6, 0x3

    .line 39
    goto :goto_0

    .line 40
    :sswitch_1
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v6, 0x2

    .line 48
    goto :goto_0

    .line 49
    :sswitch_2
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const/4 v6, 0x1

    .line 57
    goto :goto_0

    .line 58
    :sswitch_3
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_3

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    const/4 v6, 0x0

    .line 66
    :goto_0
    packed-switch v6, :pswitch_data_0

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :pswitch_0
    invoke-static {v2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :pswitch_1
    invoke-static {v3}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 82
    .line 83
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast p1, Ljava/lang/String;

    .line 86
    .line 87
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :pswitch_2
    invoke-static {v4}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :pswitch_3
    invoke-static {v5}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 102
    .line 103
    :goto_1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 104
    .line 105
    return-object p0

    .line 106
    :cond_4
    new-instance p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 107
    .line 108
    const p1, 0x9c4e

    .line 109
    .line 110
    .line 111
    const-string v0, ""

    .line 112
    .line 113
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    throw p0

    .line 117
    :sswitch_data_0
    .sparse-switch
        -0x35ca905e -> :sswitch_3
        -0x35ca8ee8 -> :sswitch_2
        -0x28af7669 -> :sswitch_1
        0x8ffbf11 -> :sswitch_0
    .end sparse-switch

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/data/VerifyData;Ljava/lang/Throwable;)Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v0, "bind_mobile"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    move-object p0, p1

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 17
    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 19
    .line 20
    const v0, 0x9c4b

    .line 21
    .line 22
    .line 23
    if-ne p0, v0, :cond_0

    .line 24
    .line 25
    new-instance p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 26
    .line 27
    const v0, 0x9c7c

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    invoke-static {p1}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public static synthetic j(Ljava/lang/Boolean;)Lcom/p1/mobile/putong/data/AccountErrorResponse;
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
    invoke-static {}, Lcom/p1/mobile/putong/data/AccountErrorResponse;->new_()Lcom/p1/mobile/putong/data/AccountErrorResponse;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 13
    .line 14
    const v0, 0x9c4b

    .line 15
    .line 16
    .line 17
    const-string v1, ""

    .line 18
    .line 19
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    throw p0
.end method

.method public static synthetic k(Ll/pw;Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pw;->E(Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/account_phone/data/PhoneSigninData;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V
    .locals 4

    .line 1
    const-string v0, "live_region_tag_"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    :cond_0
    const-string v1, "AccountSdkApi/phone/signin"

    .line 14
    .line 15
    invoke-static {v1, p0}, Ll/qw;->a(Ljava/lang/String;Lcom/p1/mobile/account_core/request_data/JsonData;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 19
    .line 20
    if-eqz p0, :cond_3

    .line 21
    .line 22
    const-string v1, "regionTag"

    .line 23
    .line 24
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_3

    .line 29
    .line 30
    iget-object p0, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 31
    .line 32
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_3

    .line 43
    .line 44
    :try_start_0
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LiveRegionTag;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sput-object v1, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/account_core/reponse_data/Token;->userId:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    const-string v2, ""

    .line 61
    .line 62
    if-nez v1, :cond_2

    .line 63
    .line 64
    :try_start_1
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->data:Lcom/p1/mobile/account_core/reponse_data/Data;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/Data;->token:Lcom/p1/mobile/account_core/reponse_data/Token;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/Token;->userId:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    move-object p1, v2

    .line 72
    :goto_0
    new-instance v1, Ll/wyd0;

    .line 73
    .line 74
    new-instance v3, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-direct {v1, p1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 90
    .line 91
    .line 92
    :catch_0
    :cond_3
    return-void
.end method

.method public static synthetic m(Ljava/lang/Boolean;)Lcom/p1/mobile/putong/data/AccountErrorResponse;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/AccountErrorResponse;->new_()Lcom/p1/mobile/putong/data/AccountErrorResponse;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/data/VerifyData;Ljava/lang/Throwable;)Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    const-string v0, "bind_mobile"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    move-object p0, p1

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 17
    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 19
    .line 20
    const v0, 0x9c4b

    .line 21
    .line 22
    .line 23
    if-ne p0, v0, :cond_0

    .line 24
    .line 25
    new-instance p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 26
    .line 27
    const v0, 0x9c7c

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    invoke-static {p1}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public static synthetic o(JLjava/util/List;)Landroid/util/Pair;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    sub-long/2addr v0, p0

    .line 15
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p2, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic p(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v0, "e_signup_upload_picture_fail"

    .line 5
    .line 6
    invoke-static {v0, p0}, Ll/g4g0;->c(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic q(Landroid/util/Pair;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/data/VerifyData;Lkotlin/Pair;)Ll/uxj0;
    .locals 7

    .line 1
    invoke-virtual {p1}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_4

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const-string v2, "ttt-signup"

    .line 21
    .line 22
    const-string v3, "pending"

    .line 23
    .line 24
    const-string v4, "signup"

    .line 25
    .line 26
    const-string v5, "signin"

    .line 27
    .line 28
    const/4 v6, -0x1

    .line 29
    sparse-switch v1, :sswitch_data_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :sswitch_0
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v6, 0x3

    .line 41
    goto :goto_0

    .line 42
    :sswitch_1
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    const/4 v6, 0x2

    .line 50
    goto :goto_0

    .line 51
    :sswitch_2
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const/4 v6, 0x1

    .line 59
    goto :goto_0

    .line 60
    :sswitch_3
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    const/4 v6, 0x0

    .line 68
    :goto_0
    packed-switch v6, :pswitch_data_0

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :pswitch_0
    invoke-static {v2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :pswitch_1
    invoke-static {v3}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 84
    .line 85
    invoke-virtual {p1}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Ljava/lang/String;

    .line 90
    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->ttt_signin_token:Ljava/lang/String;

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :pswitch_2
    invoke-static {v4}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :pswitch_3
    invoke-static {v5}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 106
    .line 107
    :goto_1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 108
    .line 109
    return-object p0

    .line 110
    :cond_4
    new-instance p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 111
    .line 112
    const p1, 0x9c4e

    .line 113
    .line 114
    .line 115
    const-string v0, ""

    .line 116
    .line 117
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(ILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    throw p0

    .line 121
    :sswitch_data_0
    .sparse-switch
        -0x35ca905e -> :sswitch_3
        -0x35ca8ee8 -> :sswitch_2
        -0x28af7669 -> :sswitch_1
        0x8ffbf11 -> :sswitch_0
    .end sparse-switch

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public A(Lcom/p1/mobile/account_core/request_data/SignupData;IZ)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/pw;->B(Lcom/p1/mobile/account_core/request_data/SignupData;IZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B(Lcom/p1/mobile/account_core/request_data/SignupData;IZLjava/lang/String;)V
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
    invoke-static {}, Ll/hxk;->g()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_3

    .line 86
    .line 87
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Ll/hxk;->h()Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_3

    .line 96
    .line 97
    const-string p0, "adReferrer"

    .line 98
    .line 99
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-virtual {p2}, Ll/hxk;->d()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 108
    .line 109
    .line 110
    const-string p0, "adClickTime"

    .line 111
    .line 112
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    invoke-virtual {p2}, Ll/hxk;->a()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 121
    .line 122
    .line 123
    const-string p0, "adInstallTime"

    .line 124
    .line 125
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-virtual {p2}, Ll/hxk;->b()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 134
    .line 135
    .line 136
    const-string p0, "track"

    .line 137
    .line 138
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-virtual {p2}, Ll/hxk;->e()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    .line 148
    .line 149
    :cond_3
    sget-object p0, Ll/ls4;->a:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-nez p0, :cond_4

    .line 156
    .line 157
    sget-object p0, Ll/ls4;->a:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    const-string p2, "douyin"

    .line 164
    .line 165
    invoke-virtual {p0, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-eqz p0, :cond_4

    .line 170
    .line 171
    const-string p0, "toutiao_channel"

    .line 172
    .line 173
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 174
    .line 175
    invoke-static {p2}, Lcom/bytedance/hume/readapk/HumeSDK;->getChannel(Landroid/content/Context;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 180
    .line 181
    .line 182
    :cond_4
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    if-nez p0, :cond_5

    .line 187
    .line 188
    const-string p0, "thirdPartyEmail"

    .line 189
    .line 190
    invoke-virtual {v0, p0, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 191
    .line 192
    .line 193
    :cond_5
    const-string p0, "extra"

    .line 194
    .line 195
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    .line 201
    .line 202
    :catch_0
    return-void
.end method

.method public C()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/H5Token;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cn5;->s()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic D(Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/account_phone/data/PhoneSignupData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_phone/data/PhoneSignupData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    new-instance v1, Ljava/lang/RuntimeException;

    .line 15
    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, "BirthDateNullException please ignore, class = "

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v3, ", phoneNumber = "

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->name:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    invoke-static {v1, v2}, Ll/dy;->n0(D)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->birthdate:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 71
    .line 72
    const-string v2, "female"

    .line 73
    .line 74
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    sget-object v1, Lcom/p1/mobile/account_core/request_data/Gender;->female:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    sget-object v1, Lcom/p1/mobile/account_core/request_data/Gender;->male:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 84
    .line 85
    :goto_0
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->gender:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 86
    .line 87
    iget v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 88
    .line 89
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupData;->code:I

    .line 90
    .line 91
    iget v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 92
    .line 93
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupData;->countryCode:I

    .line 94
    .line 95
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupData;->mobileNumber:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const-string v2, "device"

    .line 108
    .line 109
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_2

    .line 119
    .line 120
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 121
    .line 122
    const-string v2, "verifyType"

    .line 123
    .line 124
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_2
    iget-object v1, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 128
    .line 129
    check-cast v1, Ljava/lang/String;

    .line 130
    .line 131
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->pictureUrl:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Lcom/p1/mobile/account_phone/data/PhoneSignupData;->setPassword(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 139
    .line 140
    iput-object v1, v0, Lcom/p1/mobile/account_core/request_data/SignupData;->appsflyerId:Ljava/lang/String;

    .line 141
    .line 142
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->firebaseId:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    if-nez v1, :cond_3

    .line 149
    .line 150
    const-string v1, "firebaseId"

    .line 151
    .line 152
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->firebaseId:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    :cond_3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-eqz v1, :cond_4

    .line 164
    .line 165
    const-string v1, "no-password"

    .line 166
    .line 167
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupData;->signupType:Ljava/lang/String;

    .line 168
    .line 169
    :cond_4
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 170
    .line 171
    check-cast p2, Ljava/lang/Long;

    .line 172
    .line 173
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 174
    .line 175
    .line 176
    move-result-wide v1

    .line 177
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->newProfilePath:Ljava/util/List;

    .line 178
    .line 179
    invoke-static {v1, v2, p1}, Ll/cp;->j(JLjava/util/List;)I

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    const/4 p2, 0x1

    .line 184
    invoke-virtual {p0, v0, p1, p2}, Ll/pw;->A(Lcom/p1/mobile/account_core/request_data/SignupData;IZ)V

    .line 185
    .line 186
    .line 187
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 188
    .line 189
    invoke-virtual {p0, v0}, Ll/b270;->Q(Lcom/p1/mobile/account_phone/data/PhoneSignupData;)Lrx/c;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    return-object p0
.end method

.method public final synthetic E(Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;
    .locals 11

    .line 1
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/util/Pair;

    .line 4
    .line 5
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p2, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_1a

    .line 14
    .line 15
    sget-object p2, Ll/ino;->INSTANCE:Ll/ino;

    .line 16
    .line 17
    invoke-virtual {p2}, Ll/ino;->j()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/account/sdk/IntlSignupData;

    .line 24
    .line 25
    invoke-direct {v1}, Lcom/p1/mobile/putong/account/sdk/IntlSignupData;-><init>()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    new-instance v1, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;

    .line 30
    .line 31
    invoke-direct {v1}, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;-><init>()V

    .line 32
    .line 33
    .line 34
    :goto_0
    const-string v2, "verified"

    .line 35
    .line 36
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;->stage:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 39
    .line 40
    sget-object v3, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->nameInfoSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 41
    .line 42
    const-string v4, "name-saved"

    .line 43
    .line 44
    if-ne v2, v3, :cond_1

    .line 45
    .line 46
    invoke-static {v4}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;->currentStages:Ljava/util/List;

    .line 51
    .line 52
    goto/16 :goto_2

    .line 53
    .line 54
    :cond_1
    sget-object v3, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->genderInfoSave:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 55
    .line 56
    const-string v5, "gender-saved"

    .line 57
    .line 58
    if-ne v2, v3, :cond_2

    .line 59
    .line 60
    invoke-static {v5}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;->currentStages:Ljava/util/List;

    .line 65
    .line 66
    goto/16 :goto_2

    .line 67
    .line 68
    :cond_2
    sget-object v3, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->birthInfoSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 69
    .line 70
    const-string v6, "birth-saved"

    .line 71
    .line 72
    if-ne v2, v3, :cond_3

    .line 73
    .line 74
    invoke-static {v6}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;->currentStages:Ljava/util/List;

    .line 79
    .line 80
    goto/16 :goto_2

    .line 81
    .line 82
    :cond_3
    sget-object v3, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->media:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 83
    .line 84
    if-ne v2, v3, :cond_4

    .line 85
    .line 86
    const-string v2, "finished"

    .line 87
    .line 88
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;->stage:Ljava/lang/String;

    .line 89
    .line 90
    const-string v2, "picture-saved"

    .line 91
    .line 92
    invoke-static {v2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;->currentStages:Ljava/util/List;

    .line 97
    .line 98
    goto/16 :goto_2

    .line 99
    .line 100
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->basic:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 101
    .line 102
    if-ne v2, v3, :cond_6

    .line 103
    .line 104
    filled-new-array {v4, v6, v5}, [Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    if-eqz p2, :cond_5

    .line 113
    .line 114
    const-string v3, "new-gender-saved"

    .line 115
    .line 116
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    :cond_5
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;->currentStages:Ljava/util/List;

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_6
    sget-object v3, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->intlFriendPurposeSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 123
    .line 124
    if-eq v2, v3, :cond_7

    .line 125
    .line 126
    sget-object v4, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->ethnicitySaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 127
    .line 128
    if-eq v2, v4, :cond_7

    .line 129
    .line 130
    sget-object v4, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->languageSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 131
    .line 132
    if-ne v2, v4, :cond_b

    .line 133
    .line 134
    :cond_7
    const-string v2, "extensions-saved"

    .line 135
    .line 136
    invoke-static {v2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;->currentStages:Ljava/util/List;

    .line 141
    .line 142
    new-instance v2, Lcom/p1/mobile/putong/data/Extensions;

    .line 143
    .line 144
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 145
    .line 146
    .line 147
    new-instance v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 148
    .line 149
    invoke-direct {v4}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;-><init>()V

    .line 150
    .line 151
    .line 152
    iput-object v4, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 153
    .line 154
    iget-object v4, p1, Lcom/p1/mobile/putong/data/SignUpData;->intlFriendPurpose:Ljava/util/List;

    .line 155
    .line 156
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    if-nez v4, :cond_8

    .line 161
    .line 162
    iget-object v4, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 163
    .line 164
    if-ne v4, v3, :cond_8

    .line 165
    .line 166
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 167
    .line 168
    iget-object v4, p1, Lcom/p1/mobile/putong/data/SignUpData;->intlFriendPurpose:Ljava/util/List;

    .line 169
    .line 170
    iput-object v4, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurpose:Ljava/util/List;

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_8
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SignUpData;->ethnicity:Ljava/util/List;

    .line 174
    .line 175
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    if-nez v3, :cond_9

    .line 180
    .line 181
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 182
    .line 183
    sget-object v4, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->ethnicitySaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 184
    .line 185
    if-ne v3, v4, :cond_9

    .line 186
    .line 187
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 188
    .line 189
    iget-object v4, p1, Lcom/p1/mobile/putong/data/SignUpData;->ethnicity:Ljava/util/List;

    .line 190
    .line 191
    iput-object v4, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_9
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SignUpData;->language:Ljava/util/List;

    .line 195
    .line 196
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    if-nez v3, :cond_a

    .line 201
    .line 202
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 203
    .line 204
    sget-object v4, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->languageSaved:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 205
    .line 206
    if-ne v3, v4, :cond_a

    .line 207
    .line 208
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 209
    .line 210
    iget-object v4, p1, Lcom/p1/mobile/putong/data/SignUpData;->language:Ljava/util/List;

    .line 211
    .line 212
    iput-object v4, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    .line 213
    .line 214
    :cond_a
    :goto_1
    const-string v3, "extensions"

    .line 215
    .line 216
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Extensions;->toJson()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    :cond_b
    :goto_2
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 224
    .line 225
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/SignupData;->name:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 228
    .line 229
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    if-eqz v2, :cond_e

    .line 234
    .line 235
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 236
    .line 237
    iget-wide v3, v2, Lcom/p1/mobile/putong/api/api/Network;->lastElapsedRealtime:J

    .line 238
    .line 239
    const-wide/16 v5, 0x0

    .line 240
    .line 241
    cmp-long v3, v3, v5

    .line 242
    .line 243
    if-lez v3, :cond_c

    .line 244
    .line 245
    iget-wide v2, v2, Lcom/p1/mobile/putong/api/api/Network;->lastServerTime:J

    .line 246
    .line 247
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 248
    .line 249
    .line 250
    move-result-wide v7

    .line 251
    sget-object v4, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 252
    .line 253
    iget-wide v9, v4, Lcom/p1/mobile/putong/api/api/Network;->lastElapsedRealtime:J

    .line 254
    .line 255
    sub-long/2addr v7, v9

    .line 256
    add-long/2addr v2, v7

    .line 257
    goto :goto_3

    .line 258
    :cond_c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 259
    .line 260
    .line 261
    move-result-wide v2

    .line 262
    :goto_3
    new-instance v4, Ljava/text/SimpleDateFormat;

    .line 263
    .line 264
    const-string v7, "yyyy-MM-dd"

    .line 265
    .line 266
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 267
    .line 268
    invoke-direct {v4, v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 269
    .line 270
    .line 271
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 272
    .line 273
    .line 274
    move-result-object v7

    .line 275
    invoke-virtual {v4, v7}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v7

    .line 279
    cmp-long v2, v2, v5

    .line 280
    .line 281
    if-nez v2, :cond_d

    .line 282
    .line 283
    goto :goto_4

    .line 284
    :cond_d
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 285
    .line 286
    invoke-virtual {v4, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v7

    .line 290
    :goto_4
    iput-object v7, v1, Lcom/p1/mobile/account_core/request_data/SignupData;->birthdate:Ljava/lang/String;

    .line 291
    .line 292
    :cond_e
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 293
    .line 294
    if-nez v2, :cond_f

    .line 295
    .line 296
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 297
    .line 298
    if-eqz v3, :cond_13

    .line 299
    .line 300
    :cond_f
    if-eqz p2, :cond_11

    .line 301
    .line 302
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 303
    .line 304
    if-eqz p2, :cond_11

    .line 305
    .line 306
    move-object v2, v1

    .line 307
    check-cast v2, Lcom/p1/mobile/putong/account/sdk/IntlSignupData;

    .line 308
    .line 309
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object p2

    .line 313
    iput-object p2, v2, Lcom/p1/mobile/putong/account/sdk/IntlSignupData;->newGender:Ljava/lang/String;

    .line 314
    .line 315
    sget-object p2, Lcom/p1/mobile/account_core/request_data/Gender;->male:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 316
    .line 317
    iput-object p2, v2, Lcom/p1/mobile/account_core/request_data/SignupData;->gender:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 318
    .line 319
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->subGenderOption:Ljava/lang/String;

    .line 320
    .line 321
    if-eqz p2, :cond_10

    .line 322
    .line 323
    iput-object p2, v2, Lcom/p1/mobile/putong/account/sdk/IntlSignupData;->subGender:Ljava/lang/String;

    .line 324
    .line 325
    :cond_10
    iget-boolean p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 326
    .line 327
    iput-boolean p2, v2, Lcom/p1/mobile/putong/account/sdk/IntlSignupData;->showOnProfile:Z

    .line 328
    .line 329
    goto :goto_6

    .line 330
    :cond_11
    const-string p2, "female"

    .line 331
    .line 332
    invoke-static {v2, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 333
    .line 334
    .line 335
    move-result p2

    .line 336
    if-eqz p2, :cond_12

    .line 337
    .line 338
    sget-object p2, Lcom/p1/mobile/account_core/request_data/Gender;->female:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 339
    .line 340
    goto :goto_5

    .line 341
    :cond_12
    sget-object p2, Lcom/p1/mobile/account_core/request_data/Gender;->male:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 342
    .line 343
    :goto_5
    iput-object p2, v1, Lcom/p1/mobile/account_core/request_data/SignupData;->gender:Lcom/p1/mobile/account_core/request_data/Gender;

    .line 344
    .line 345
    :cond_13
    :goto_6
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 346
    .line 347
    .line 348
    move-result-object p2

    .line 349
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object p2

    .line 353
    const-string v2, "device"

    .line 354
    .line 355
    invoke-virtual {v1, v2, p2}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 359
    .line 360
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 361
    .line 362
    .line 363
    move-result p2

    .line 364
    if-nez p2, :cond_14

    .line 365
    .line 366
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 367
    .line 368
    const-string v2, "verifyType"

    .line 369
    .line 370
    invoke-virtual {v1, v2, p2}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    :cond_14
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 374
    .line 375
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 376
    .line 377
    .line 378
    move-result p2

    .line 379
    if-nez p2, :cond_15

    .line 380
    .line 381
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 382
    .line 383
    invoke-virtual {v1, p2}, Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;->setPassword(Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    :cond_15
    iget-object p2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 387
    .line 388
    check-cast p2, Ljava/lang/CharSequence;

    .line 389
    .line 390
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 391
    .line 392
    .line 393
    move-result p2

    .line 394
    if-nez p2, :cond_16

    .line 395
    .line 396
    iget-object p2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 397
    .line 398
    move-object v2, p2

    .line 399
    check-cast v2, Ljava/lang/String;

    .line 400
    .line 401
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/SignupData;->pictureUrl:Ljava/lang/String;

    .line 402
    .line 403
    check-cast p2, Ljava/lang/String;

    .line 404
    .line 405
    invoke-static {p2}, Ll/uuf;->b(Ljava/lang/String;)Z

    .line 406
    .line 407
    .line 408
    move-result p2

    .line 409
    iput-boolean p2, v1, Lcom/p1/mobile/account_core/request_data/SignupData;->hasFace:Z

    .line 410
    .line 411
    :cond_16
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 412
    .line 413
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 414
    .line 415
    .line 416
    move-result p2

    .line 417
    if-nez p2, :cond_17

    .line 418
    .line 419
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 420
    .line 421
    iput-object p2, v1, Lcom/p1/mobile/account_core/request_data/SignupData;->appsflyerId:Ljava/lang/String;

    .line 422
    .line 423
    :cond_17
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->firebaseId:Ljava/lang/String;

    .line 424
    .line 425
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 426
    .line 427
    .line 428
    move-result p2

    .line 429
    if-nez p2, :cond_18

    .line 430
    .line 431
    const-string p2, "firebaseId"

    .line 432
    .line 433
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->firebaseId:Ljava/lang/String;

    .line 434
    .line 435
    invoke-virtual {v1, p2, v2}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    :cond_18
    invoke-static {}, Ll/qzd;->b()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object p2

    .line 442
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 443
    .line 444
    .line 445
    move-result p2

    .line 446
    if-nez p2, :cond_19

    .line 447
    .line 448
    invoke-static {}, Ll/qzd;->b()Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object p2

    .line 452
    iput-object p2, v1, Lcom/p1/mobile/account_core/request_data/SignupData;->advertisingId:Ljava/lang/String;

    .line 453
    .line 454
    :cond_19
    iget-object p2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 455
    .line 456
    check-cast p2, Ljava/lang/Long;

    .line 457
    .line 458
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 459
    .line 460
    .line 461
    move-result-wide v2

    .line 462
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->newProfilePath:Ljava/util/List;

    .line 463
    .line 464
    invoke-static {v2, v3, p1}, Ll/cp;->j(JLjava/util/List;)I

    .line 465
    .line 466
    .line 467
    move-result p1

    .line 468
    const/4 p2, 0x1

    .line 469
    invoke-virtual {p0, v1, p1, p2}, Ll/pw;->A(Lcom/p1/mobile/account_core/request_data/SignupData;IZ)V

    .line 470
    .line 471
    .line 472
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 473
    .line 474
    invoke-virtual {p0, v1}, Ll/cn5;->v(Lcom/p1/mobile/account_core/request_data/SignupEarlyUIDData;)Lrx/c;

    .line 475
    .line 476
    .line 477
    move-result-object p0

    .line 478
    return-object p0

    .line 479
    :cond_1a
    new-instance p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 480
    .line 481
    const p1, 0x9c80

    .line 482
    .line 483
    .line 484
    const-string p2, ""

    .line 485
    .line 486
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(ILjava/lang/String;)V

    .line 487
    .line 488
    .line 489
    throw p0
.end method

.method public F(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_core/request_data/ReportData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_core/request_data/ReportData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/account_core/request_data/ReportData;->name:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/cn5;->u(Lcom/p1/mobile/account_core/request_data/ReportData;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Ll/iw;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/iw;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public G(Lcom/p1/mobile/putong/data/ForgetPasswordData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/ForgetPasswordData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_phone/data/PhoneResetPasswordData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_phone/data/PhoneResetPasswordData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/data/ForgetPasswordData;->code:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneResetPasswordData;->code:I

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/ForgetPasswordData;->new_:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/account_phone/data/PhoneResetPasswordData;->setPassword(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget v1, p1, Lcom/p1/mobile/putong/data/ForgetPasswordData;->countryCode:I

    .line 16
    .line 17
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->countryCode:I

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ForgetPasswordData;->mobileNumber:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->mobileNumber:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/b270;->P(Lcom/p1/mobile/account_phone/data/PhoneResetPasswordData;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public H(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/RiskVerification;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ll/pw;->u(Lcom/p1/mobile/putong/data/VerifyReason;)Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->action:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 18
    .line 19
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 20
    .line 21
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->countryCode:I

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->mobileNumber:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->language:Ljava/lang/String;

    .line 30
    .line 31
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 32
    .line 33
    const/4 v2, 0x4

    .line 34
    if-eq v1, v2, :cond_0

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->codeLength:I

    .line 37
    .line 38
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    new-instance v1, Ll/og4;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/og4;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 52
    .line 53
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Captcha;->captchaID:Ljava/lang/String;

    .line 54
    .line 55
    iput-object v3, v1, Ll/og4;->captchaID:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Captcha;->captchaOutput:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v3, v1, Ll/og4;->captchaOutput:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Captcha;->genTime:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v3, v1, Ll/og4;->genTime:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Captcha;->lotNumber:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v3, v1, Ll/og4;->lotNumber:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Captcha;->passToken:Ljava/lang/String;

    .line 70
    .line 71
    iput-object v3, v1, Ll/og4;->passToken:Ljava/lang/String;

    .line 72
    .line 73
    const/4 v3, 0x1

    .line 74
    iput-boolean v3, v2, Lcom/p1/mobile/putong/data/Captcha;->localExpired:Z

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->captcha:Ll/og4;

    .line 77
    .line 78
    :cond_1
    invoke-static {}, Ll/r8f0;->f()Ll/r8f0;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Ll/r8f0;->g()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {}, Ll/bp;->l()Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    const-string v3, ""

    .line 91
    .line 92
    if-eqz v2, :cond_2

    .line 93
    .line 94
    sget-object v2, Lcom/p1/mobile/putong/account/AccountModule;->a:Landroid/app/Application;

    .line 95
    .line 96
    invoke-static {}, Ll/hb00;->b()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-static {v2, v4}, Lcom/immomo/hdata/android/MDevice;->getmmuid(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    sget-object v4, Lcom/p1/mobile/putong/account/AccountModule;->a:Landroid/app/Application;

    .line 105
    .line 106
    invoke-static {v4}, Lcom/immomo/hdata/android/MDevice;->getMMuidV3(Landroid/content/Context;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    goto :goto_0

    .line 111
    :cond_2
    move-object v2, v3

    .line 112
    move-object v4, v2

    .line 113
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-nez v5, :cond_3

    .line 118
    .line 119
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->mmuid:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_3
    iput-object v3, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->mmuid:Ljava/lang/String;

    .line 123
    .line 124
    :goto_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-nez v1, :cond_4

    .line 129
    .line 130
    iput-object v2, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->mmuidv2:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_4
    iput-object v3, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->mmuidv2:Ljava/lang/String;

    .line 134
    .line 135
    :goto_2
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-nez v1, :cond_5

    .line 140
    .line 141
    iput-object v4, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->mmuidv3:Ljava/lang/String;

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_5
    iput-object v3, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->mmuidv3:Ljava/lang/String;

    .line 145
    .line 146
    :goto_3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 147
    .line 148
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->captchaToken:Ljava/lang/String;

    .line 149
    .line 150
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 151
    .line 152
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;->captchaValue:Ljava/lang/String;

    .line 153
    .line 154
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 155
    .line 156
    invoke-virtual {p0, v0}, Ll/gmj0;->j0(Lcom/p1/mobile/account_phone/data/PhoneSendCaptchaData;)Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    new-instance v0, Ll/lw;

    .line 161
    .line 162
    invoke-direct {v0, p1}, Ll/lw;-><init>(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0, v0}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0
.end method

.method public I(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/pw;->w(Lcom/p1/mobile/putong/data/VerifyReason;)Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->action:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->email:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailRequestData;->email:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->language:Ljava/lang/String;

    .line 21
    .line 22
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 23
    .line 24
    const/4 v2, 0x4

    .line 25
    if-eq v1, v2, :cond_0

    .line 26
    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->codeLength:I

    .line 28
    .line 29
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    new-instance v1, Ll/og4;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/og4;-><init>()V

    .line 40
    .line 41
    .line 42
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 43
    .line 44
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Captcha;->captchaID:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v3, v1, Ll/og4;->captchaID:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Captcha;->captchaOutput:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v3, v1, Ll/og4;->captchaOutput:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Captcha;->genTime:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v3, v1, Ll/og4;->genTime:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Captcha;->lotNumber:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v3, v1, Ll/og4;->lotNumber:Ljava/lang/String;

    .line 59
    .line 60
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Captcha;->passToken:Ljava/lang/String;

    .line 61
    .line 62
    iput-object v3, v1, Ll/og4;->passToken:Ljava/lang/String;

    .line 63
    .line 64
    const/4 v3, 0x1

    .line 65
    iput-boolean v3, v2, Lcom/p1/mobile/putong/data/Captcha;->localExpired:Z

    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->captcha:Ll/og4;

    .line 68
    .line 69
    :cond_1
    invoke-static {}, Ll/r8f0;->f()Ll/r8f0;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Ll/r8f0;->g()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {}, Ll/bp;->l()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    const-string v3, ""

    .line 82
    .line 83
    if-eqz v2, :cond_2

    .line 84
    .line 85
    sget-object v2, Lcom/p1/mobile/putong/account/AccountModule;->a:Landroid/app/Application;

    .line 86
    .line 87
    invoke-static {}, Ll/hb00;->b()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-static {v2, v4}, Lcom/immomo/hdata/android/MDevice;->getmmuid(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    sget-object v4, Lcom/p1/mobile/putong/account/AccountModule;->a:Landroid/app/Application;

    .line 96
    .line 97
    invoke-static {v4}, Lcom/immomo/hdata/android/MDevice;->getMMuidV3(Landroid/content/Context;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    goto :goto_0

    .line 102
    :cond_2
    move-object v2, v3

    .line 103
    move-object v4, v2

    .line 104
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-nez v5, :cond_3

    .line 109
    .line 110
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->mmuid:Ljava/lang/String;

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_3
    iput-object v3, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->mmuid:Ljava/lang/String;

    .line 114
    .line 115
    :goto_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-nez v1, :cond_4

    .line 120
    .line 121
    iput-object v2, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->mmuidv2:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_4
    iput-object v3, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->mmuidv2:Ljava/lang/String;

    .line 125
    .line 126
    :goto_2
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-nez v1, :cond_5

    .line 131
    .line 132
    iput-object v4, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->mmuidv3:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_5
    iput-object v3, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->mmuidv3:Ljava/lang/String;

    .line 136
    .line 137
    :goto_3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 138
    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->captchaToken:Ljava/lang/String;

    .line 140
    .line 141
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 142
    .line 143
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->captchaValue:Ljava/lang/String;

    .line 144
    .line 145
    iget-object p0, p0, Ll/pw;->f:Ll/hue;

    .line 146
    .line 147
    invoke-virtual {p0, v0}, Ll/hue;->A(Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;)Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    new-instance v0, Ll/jw;

    .line 152
    .line 153
    invoke-direct {v0, p1}, Ll/jw;-><init>(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v0}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    new-instance p1, Ll/kw;

    .line 161
    .line 162
    invoke-direct {p1}, Ll/kw;-><init>()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0
.end method

.method public J(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
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
    invoke-virtual {p0, p1}, Ll/pw;->Q(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ow;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/ow;-><init>(Ll/pw;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public K(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/pw;->Q(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/bw;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/bw;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/cw;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/cw;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/dw;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/dw;-><init>(Ll/pw;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public L(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
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
    new-instance v0, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;->code:I

    .line 9
    .line 10
    iget v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;->countryCode:I

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;->mobileNumber:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    new-instance v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 27
    .line 28
    invoke-direct {v1}, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->id:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->token:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;->thirdPartyAccount:Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 40
    .line 41
    :cond_0
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string v2, "device"

    .line 50
    .line 51
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_1

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 63
    .line 64
    const-string v1, "verifyType"

    .line 65
    .line 66
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    const/4 p1, 0x0

    .line 70
    const/4 v1, 0x1

    .line 71
    invoke-virtual {p0, v0, p1, v1}, Ll/pw;->A(Lcom/p1/mobile/account_core/request_data/SignupData;IZ)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ll/b270;->R(Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method

.method public M(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->email:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;-><init>()V

    .line 12
    .line 13
    .line 14
    iget v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;->code:I

    .line 17
    .line 18
    iget v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;->countryCode:I

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;->mobileNumber:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    new-instance v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 35
    .line 36
    invoke-direct {v1}, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;-><init>()V

    .line 37
    .line 38
    .line 39
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->id:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v2, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->token:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;->thirdPartyAccount:Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 48
    .line 49
    :cond_0
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string v2, "device"

    .line 58
    .line 59
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_1

    .line 69
    .line 70
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 71
    .line 72
    const-string v2, "verifyType"

    .line 73
    .line 74
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    const/4 v1, 0x0

    .line 78
    const/4 v2, 0x1

    .line 79
    invoke-virtual {p0, v0, v1, v2}, Ll/pw;->A(Lcom/p1/mobile/account_core/request_data/SignupData;IZ)V

    .line 80
    .line 81
    .line 82
    const-string v1, "up_link_sms"

    .line 83
    .line 84
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->verifyType:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 91
    .line 92
    invoke-virtual {p0, v0, p1}, Ll/gmj0;->k0(Lcom/p1/mobile/account_phone/data/PhoneSignupEarlyUIDData;Z)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :cond_2
    iget-object p0, p0, Ll/pw;->f:Ll/hue;

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Ll/hue;->E(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0
.end method

.method public N(Lcom/p1/mobile/putong/data/SignInData;Z)Lrx/c;
    .locals 5
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
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const-string v3, " "

    .line 6
    .line 7
    if-nez p2, :cond_7

    .line 8
    .line 9
    new-instance p0, Lcom/p1/mobile/account_phone/data/PhoneSigninData;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/account_phone/data/PhoneSigninData;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iput p2, p0, Lcom/p1/mobile/account_phone/data/PhoneSigninData;->code:I

    .line 23
    .line 24
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Lcom/p1/mobile/account_phone/data/PhoneSigninData;->setPassword(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    sget-object p2, Lcom/p1/mobile/account_phone/data/PhoneSigninType;->confirmation_code:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 38
    .line 39
    iput-object p2, p0, Lcom/p1/mobile/account_phone/data/PhoneSigninData;->signinType:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    sget-object p2, Lcom/p1/mobile/account_phone/data/PhoneSigninType;->password:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 43
    .line 44
    iput-object p2, p0, Lcom/p1/mobile/account_phone/data/PhoneSigninData;->signinType:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 45
    .line 46
    :goto_0
    :try_start_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    aget-object p2, p2, v2

    .line 53
    .line 54
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iput p2, p0, Lcom/p1/mobile/account_phone/data/PhoneData;->countryCode:I

    .line 59
    .line 60
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    aget-object p2, p2, v1

    .line 67
    .line 68
    iput-object p2, p0, Lcom/p1/mobile/account_phone/data/PhoneData;->mobileNumber:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    :catch_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-nez p2, :cond_2

    .line 77
    .line 78
    new-instance p2, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 79
    .line 80
    invoke-direct {p2}, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;-><init>()V

    .line 81
    .line 82
    .line 83
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v2, p2, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->id:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v2, p2, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->token:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 92
    .line 93
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    iput-object v2, p2, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->type:Ljava/lang/String;

    .line 98
    .line 99
    iput-object p2, p0, Lcom/p1/mobile/account_phone/data/PhoneSigninData;->thirdPartyAccount:Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 100
    .line 101
    :cond_2
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaToken:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-nez p2, :cond_3

    .line 119
    .line 120
    const-string p2, "captchaToken"

    .line 121
    .line 122
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaToken:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaValue:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    if-nez p2, :cond_4

    .line 134
    .line 135
    const-string p2, "captchaValue"

    .line 136
    .line 137
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaValue:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_4
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 143
    .line 144
    .line 145
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result p2

    .line 151
    if-nez p2, :cond_5

    .line 152
    .line 153
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 154
    .line 155
    const-string v0, "signinType"

    .line 156
    .line 157
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :cond_5
    const-string p2, "up_link_sms"

    .line 161
    .line 162
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    const-string p2, "/phone/signin"

    .line 169
    .line 170
    if-eqz p1, :cond_6

    .line 171
    .line 172
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p0}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    const-wide/16 v1, 0x46

    .line 181
    .line 182
    invoke-virtual {p1, p2, v0, v1, v2}, Ll/w24;->e(Ljava/lang/String;Ljava/lang/String;J)Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    goto :goto_1

    .line 187
    :cond_6
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-virtual {p0}, Lcom/p1/mobile/account_core/request_data/JsonData;->toJson()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {p1, p2, v0}, Ll/w24;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    :goto_1
    new-instance p2, Ll/yv;

    .line 200
    .line 201
    invoke-direct {p2, p0}, Ll/yv;-><init>(Lcom/p1/mobile/account_phone/data/PhoneSigninData;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    new-instance p1, Ll/zv;

    .line 209
    .line 210
    invoke-direct {p1}, Ll/zv;-><init>()V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    return-object p0

    .line 218
    :cond_7
    new-instance p2, Lcom/p1/mobile/account_phone/data/PhoneActiveData;

    .line 219
    .line 220
    invoke-direct {p2}, Lcom/p1/mobile/account_phone/data/PhoneActiveData;-><init>()V

    .line 221
    .line 222
    .line 223
    iget-object v4, p1, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 224
    .line 225
    if-eqz v4, :cond_8

    .line 226
    .line 227
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    iput v4, p2, Lcom/p1/mobile/account_phone/data/PhoneActiveData;->code:I

    .line 232
    .line 233
    :cond_8
    iget-object v4, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {p2, v4}, Lcom/p1/mobile/account_phone/data/PhoneActiveData;->setPassword(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    iget-object v4, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 239
    .line 240
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 241
    .line 242
    .line 243
    move-result v4

    .line 244
    if-eqz v4, :cond_9

    .line 245
    .line 246
    sget-object v4, Lcom/p1/mobile/account_phone/data/PhoneSigninType;->confirmation_code:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 247
    .line 248
    iput-object v4, p2, Lcom/p1/mobile/account_phone/data/PhoneActiveData;->activateType:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 249
    .line 250
    goto :goto_2

    .line 251
    :cond_9
    sget-object v4, Lcom/p1/mobile/account_phone/data/PhoneSigninType;->password:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 252
    .line 253
    iput-object v4, p2, Lcom/p1/mobile/account_phone/data/PhoneActiveData;->activateType:Lcom/p1/mobile/account_phone/data/PhoneSigninType;

    .line 254
    .line 255
    :goto_2
    iget-object v4, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 256
    .line 257
    invoke-virtual {v4, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v4

    .line 261
    aget-object v4, v4, v2

    .line 262
    .line 263
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 264
    .line 265
    .line 266
    move-result v4

    .line 267
    iput v4, p2, Lcom/p1/mobile/account_phone/data/PhoneData;->countryCode:I

    .line 268
    .line 269
    iget-object v4, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {v4, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    aget-object v1, v3, v1

    .line 276
    .line 277
    iput-object v1, p2, Lcom/p1/mobile/account_phone/data/PhoneData;->mobileNumber:Ljava/lang/String;

    .line 278
    .line 279
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 280
    .line 281
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    if-nez v1, :cond_a

    .line 286
    .line 287
    new-instance v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 288
    .line 289
    invoke-direct {v1}, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;-><init>()V

    .line 290
    .line 291
    .line 292
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 293
    .line 294
    iput-object v3, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->id:Ljava/lang/String;

    .line 295
    .line 296
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 297
    .line 298
    iput-object v3, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->token:Ljava/lang/String;

    .line 299
    .line 300
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 301
    .line 302
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    iput-object p1, v1, Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;->type:Ljava/lang/String;

    .line 307
    .line 308
    iput-object v1, p2, Lcom/p1/mobile/account_phone/data/PhoneActiveData;->thirdPartyAccount:Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;

    .line 309
    .line 310
    :cond_a
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    invoke-static {p2, v2}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 322
    .line 323
    .line 324
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 325
    .line 326
    invoke-virtual {p0, p2}, Ll/b270;->M(Lcom/p1/mobile/account_phone/data/PhoneActiveData;)Lrx/c;

    .line 327
    .line 328
    .line 329
    move-result-object p0

    .line 330
    return-object p0
.end method

.method public O(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/AccountTestGroup;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_core/request_data/StatusData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_core/request_data/StatusData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/account_core/request_data/StatusData;->channel:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/account_core/request_data/StatusData;->mcc:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/cn5;->w(Lcom/p1/mobile/account_core/request_data/StatusData;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/mw;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/mw;-><init>()V

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

.method public P(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gmj0;->l0(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Q(Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->profileMineType:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 30
    .line 31
    const-string p1, "preprocessed"

    .line 32
    .line 33
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    const-string p1, "login"

    .line 47
    .line 48
    invoke-static {p1}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v2, "profile"

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-static {p0, v2, v3, p1}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    new-instance p1, Ll/ew;

    .line 60
    .line 61
    invoke-direct {p1}, Ll/ew;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    new-instance p1, Ll/fw;

    .line 69
    .line 70
    invoke-direct {p1, v0, v1}, Ll/fw;-><init>(J)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    :cond_0
    const-wide/16 p0, 0x0

    .line 79
    .line 80
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, ""

    .line 85
    .line 86
    invoke-static {p1, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method public R(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/account_phone/data/PhoneVerifyCaptchaData;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/account_phone/data/PhoneVerifyCaptchaData;-><init>()V

    .line 9
    .line 10
    .line 11
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 12
    .line 13
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneVerifyCaptchaData;->code:I

    .line 14
    .line 15
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 16
    .line 17
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->countryCode:I

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->mobileNumber:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ll/pw;->u(Lcom/p1/mobile/putong/data/VerifyReason;)Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneVerifyCaptchaData;->action:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 40
    .line 41
    const-string v2, "verifyType"

    .line 42
    .line 43
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    const-string v1, "up_link_sms"

    .line 47
    .line 48
    iget-object v2, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1}, Ll/gmj0;->m0(Lcom/p1/mobile/account_phone/data/PhoneVerifyCaptchaData;Z)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    new-instance v0, Ll/hw;

    .line 61
    .line 62
    invoke-direct {v0, p1}, Ll/hw;-><init>(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public S(Lcom/p1/mobile/putong/data/VerifyDataV2;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyDataV2;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailVerifyCaptchaData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/EmailVerifyCaptchaData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/account/data/EmailRequestData;->code:I

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailRequestData;->email:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Ll/pw;->u(Lcom/p1/mobile/putong/data/VerifyReason;)Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/account/data/EmailVerifyCaptchaData;->action:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 21
    .line 22
    iget-object p0, p0, Ll/pw;->f:Ll/hue;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/hue;->F(Lcom/p1/mobile/putong/account/data/EmailVerifyCaptchaData;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v0, Ll/aw;

    .line 29
    .line 30
    invoke-direct {v0, p1}, Ll/aw;-><init>(Lcom/p1/mobile/putong/data/VerifyDataV2;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public T(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AccountErrorResponse;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_phone/data/PhoneData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_phone/data/PhoneData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->countryCode:I

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->mobileNumber:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/b270;->S(Lcom/p1/mobile/account_phone/data/PhoneData;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p1, Ll/nw;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/nw;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_phone/data/PhoneBindPhoneData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_phone/data/PhoneBindPhoneData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneBindPhoneData;->code:I

    .line 9
    .line 10
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->countryCode:I

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->mobileNumber:Ljava/lang/String;

    .line 17
    .line 18
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->forceLogin:Z

    .line 19
    .line 20
    iput-boolean p1, v0, Lcom/p1/mobile/account_phone/data/PhoneBindPhoneData;->forceLogin:Z

    .line 21
    .line 22
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/b270;->N(Lcom/p1/mobile/account_phone/data/PhoneBindPhoneData;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public t(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/Token;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_phone/data/PhoneChangePhoneData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_phone/data/PhoneChangePhoneData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneChangePhoneData;->code:I

    .line 9
    .line 10
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->countryCode:I

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p1, v0, Lcom/p1/mobile/account_phone/data/PhoneData;->mobileNumber:Ljava/lang/String;

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
    const-string v1, "device"

    .line 27
    .line 28
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/b270;->O(Lcom/p1/mobile/account_phone/data/PhoneChangePhoneData;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public final u(Lcom/p1/mobile/putong/data/VerifyReason;)Lcom/p1/mobile/account_phone/data/CaptchaAction;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, -0x1

    .line 13
    sparse-switch p1, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string p1, "fix_verify_code_hack"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x6

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string p1, "bind_mobile"

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v0, 0x5

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string p1, "signup_signin"

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v0, 0x4

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string p1, "signup"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v0, 0x3

    .line 60
    goto :goto_0

    .line 61
    :sswitch_4
    const-string p1, "signin"

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    const/4 v0, 0x2

    .line 71
    goto :goto_0

    .line 72
    :sswitch_5
    const-string p1, "change-phone"

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_5

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    const/4 v0, 0x1

    .line 82
    goto :goto_0

    .line 83
    :sswitch_6
    const-string p1, "forgot-password"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-nez p0, :cond_6

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_6
    const/4 v0, 0x0

    .line 93
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 94
    .line 95
    .line 96
    const/4 p0, 0x0

    .line 97
    return-object p0

    .line 98
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->bind_phone:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 99
    .line 100
    return-object p0

    .line 101
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->signup_signin:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 102
    .line 103
    return-object p0

    .line 104
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->signup:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 105
    .line 106
    return-object p0

    .line 107
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->signin:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 108
    .line 109
    return-object p0

    .line 110
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->change_phone:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 111
    .line 112
    return-object p0

    .line 113
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->forgot_password:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 114
    .line 115
    return-object p0

    .line 116
    nop

    .line 117
    :sswitch_data_0
    .sparse-switch
        -0x5b94cdfb -> :sswitch_6
        -0x46951eef -> :sswitch_5
        -0x35ca905e -> :sswitch_4
        -0x35ca8ee8 -> :sswitch_3
        -0x3244ef57 -> :sswitch_2
        -0x233c651c -> :sswitch_1
        0x630658d7 -> :sswitch_0
    .end sparse-switch

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public v(Lcom/p1/mobile/account_core/reponse_data/Token;)Lcom/p1/mobile/putong/data/AuthData;
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/AuthData;->new_()Lcom/p1/mobile/putong/data/AuthData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p1, Lcom/p1/mobile/account_core/reponse_data/Token;->value:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 8
    .line 9
    iget v0, p1, Lcom/p1/mobile/account_core/reponse_data/Token;->expiresIn:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/data/AuthData;->expiresIn:I

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/account_core/reponse_data/Token;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/account_core/reponse_data/ExtraData;->extra:Ljava/util/Map;

    .line 18
    .line 19
    if-eqz v0, :cond_7

    .line 20
    .line 21
    const-string v1, "stage"

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, 0x0

    .line 34
    if-nez v1, :cond_6

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const-string v3, "finished"

    .line 44
    .line 45
    const-string v4, "verified"

    .line 46
    .line 47
    const/4 v5, -0x1

    .line 48
    sparse-switch v1, :sswitch_data_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :sswitch_0
    const-string v1, "birth-saved"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    const/4 v5, 0x5

    .line 62
    goto :goto_0

    .line 63
    :sswitch_1
    const-string v1, "base-info-saved"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    const/4 v5, 0x4

    .line 73
    goto :goto_0

    .line 74
    :sswitch_2
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_2

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    const/4 v5, 0x3

    .line 82
    goto :goto_0

    .line 83
    :sswitch_3
    const-string v1, "gender-saved"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_3

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    const/4 v5, 0x2

    .line 93
    goto :goto_0

    .line 94
    :sswitch_4
    const-string v1, "name-saved"

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_4

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_4
    const/4 v5, 0x1

    .line 104
    goto :goto_0

    .line 105
    :sswitch_5
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_5

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_5
    move v5, v2

    .line 113
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 114
    .line 115
    .line 116
    const-string v0, "unknown_"

    .line 117
    .line 118
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :pswitch_0
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :pswitch_1
    invoke-static {v4}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 137
    .line 138
    :cond_6
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/ExtraData;->extra:Ljava/util/Map;

    .line 139
    .line 140
    const-string v0, "finished_stages"

    .line 141
    .line 142
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    check-cast p1, Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-nez v0, :cond_7

    .line 153
    .line 154
    const-string v0, ","

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    array-length v0, p1

    .line 161
    :goto_2
    if-ge v2, v0, :cond_7

    .line 162
    .line 163
    aget-object v1, p1, v2

    .line 164
    .line 165
    iget-object v3, p0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 166
    .line 167
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    add-int/lit8 v2, v2, 0x1

    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_7
    return-object p0

    .line 178
    nop

    .line 179
    :sswitch_data_0
    .sparse-switch
        -0x76dfe138 -> :sswitch_5
        -0x6d81573b -> :sswitch_4
        -0x69585f85 -> :sswitch_3
        -0x28273f8e -> :sswitch_2
        -0x1c732adc -> :sswitch_1
        0x1b022bf9 -> :sswitch_0
    .end sparse-switch

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public final w(Lcom/p1/mobile/putong/data/VerifyReason;)Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, -0x1

    .line 13
    sparse-switch p1, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :sswitch_0
    const-string p1, "fix_verify_code_hack"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_0
    const/16 v0, 0x8

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :sswitch_1
    const-string p1, "bind-email"

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v0, 0x7

    .line 42
    goto :goto_0

    .line 43
    :sswitch_2
    const-string p1, "bind_mobile"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v0, 0x6

    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    const-string p1, "signup_signin"

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const/4 v0, 0x5

    .line 64
    goto :goto_0

    .line 65
    :sswitch_4
    const-string p1, "signup"

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_4

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const/4 v0, 0x4

    .line 75
    goto :goto_0

    .line 76
    :sswitch_5
    const-string p1, "signin"

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-nez p0, :cond_5

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    const/4 v0, 0x3

    .line 86
    goto :goto_0

    .line 87
    :sswitch_6
    const-string p1, "change-phone"

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-nez p0, :cond_6

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_6
    const/4 v0, 0x2

    .line 97
    goto :goto_0

    .line 98
    :sswitch_7
    const-string p1, "change-email"

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-nez p0, :cond_7

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_7
    const/4 v0, 0x1

    .line 108
    goto :goto_0

    .line 109
    :sswitch_8
    const-string p1, "forgot-password"

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-nez p0, :cond_8

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_8
    const/4 v0, 0x0

    .line 119
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 120
    .line 121
    .line 122
    const/4 p0, 0x0

    .line 123
    return-object p0

    .line 124
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->bind_email:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 125
    .line 126
    return-object p0

    .line 127
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->bind_phone:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 128
    .line 129
    return-object p0

    .line 130
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->signup_signin:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 131
    .line 132
    return-object p0

    .line 133
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->signup:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 134
    .line 135
    return-object p0

    .line 136
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->signin:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 137
    .line 138
    return-object p0

    .line 139
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->change_phone:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 140
    .line 141
    return-object p0

    .line 142
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->change_email:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 143
    .line 144
    return-object p0

    .line 145
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->forgot_password:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 146
    .line 147
    return-object p0

    .line 148
    nop

    .line 149
    :sswitch_data_0
    .sparse-switch
        -0x5b94cdfb -> :sswitch_8
        -0x472e10c1 -> :sswitch_7
        -0x46951eef -> :sswitch_6
        -0x35ca905e -> :sswitch_5
        -0x35ca8ee8 -> :sswitch_4
        -0x3244ef57 -> :sswitch_3
        -0x233c651c -> :sswitch_2
        -0xc945df4 -> :sswitch_1
        0x630658d7 -> :sswitch_0
    .end sparse-switch

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public x(Lcom/p1/mobile/account_core/reponse_data/H5Token;)Lcom/p1/mobile/putong/data/AuthData;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/AuthData;->new_()Lcom/p1/mobile/putong/data/AuthData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p1, Lcom/p1/mobile/account_core/reponse_data/H5Token;->access_token:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 8
    .line 9
    iget v0, p1, Lcom/p1/mobile/account_core/reponse_data/H5Token;->expires_in:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/data/AuthData;->expiresIn:I

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/account_core/reponse_data/H5Token;->user_id:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/H5Token;->token_type:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

    .line 20
    .line 21
    return-object p0
.end method

.method public y()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/DownloadDataCheck;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cn5;->t()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/gw;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/gw;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public z(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AccountErrorResponse;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_core/request_data/ApplyData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_core/request_data/ApplyData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/account_core/request_data/ApplyData;->email:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/account_core/request_data/ApplyData;->mcc:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Ll/pw;->d:Ll/gmj0;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/cn5;->p(Lcom/p1/mobile/account_core/request_data/ApplyData;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/xv;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/xv;-><init>()V

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
