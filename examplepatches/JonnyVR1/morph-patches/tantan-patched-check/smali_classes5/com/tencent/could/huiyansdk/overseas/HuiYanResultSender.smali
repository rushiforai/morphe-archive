.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$HuiYanResultSenderHolder;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "HuiYanResultSender"

.field public static final TIMEOUT_MS:I = 0xea60


# instance fields
.field public authCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;

.field public configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

.field public resultCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;

.field public resultDataCallBack:Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;


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

.method public static synthetic access$100(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getLiveTypeErrorEvent(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->startHuiYanNextStep(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->cleanAllCallBack()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Ljava/lang/String;)[Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getBackIpUrls(Ljava/lang/String;)[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$500(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendErrorResult(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->resultDataCallBack:Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->authCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;)Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->authCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;

    .line 2
    .line 3
    return-object p1
.end method

.method private cleanAllCallBack()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->resultCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->resultCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;

    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 13
    .line 14
    :cond_1
    sget-object p0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/api/j;->f()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static getBackIpUrl()Ljava/lang/String;
    .locals 1

    const-string v0, "https://101.89.42.66"

    return-object v0
.end method

.method public static getBackIpUrls(Ljava/lang/String;)[Ljava/lang/String;
    .locals 4

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getOsConfig()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getBackUpIPs()[Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    const/4 v1, 0x0

    .line 18
    :goto_0
    array-length v2, v0

    .line 19
    if-ge v1, v2, :cond_1

    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v3, "https://"

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    aget-object v3, v0, v1

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v2}, Lcom/tencent/could/huiyansdk/utils/d;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    aput-object v2, v0, v1

    .line 45
    .line 46
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return-object v0
.end method

.method public static getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$HuiYanResultSenderHolder;->access$000()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static getLiveTypeErrorEvent(Ljava/lang/String;)V
    .locals 11

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x2

    .line 5
    const-string v3, "GetLiveTypeDateUseTime"

    .line 6
    .line 7
    invoke-virtual {v0, v3, v2, v1, p0}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v4, v0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 11
    .line 12
    if-eqz v4, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v9

    .line 18
    const-string v5, "GetLiveTypeData"

    .line 19
    .line 20
    const/4 v6, 0x1

    .line 21
    const-wide/16 v7, 0x0

    .line 22
    .line 23
    invoke-virtual/range {v4 .. v10}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static getVerifyHost()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/c;->a()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity;->getMainHost()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Lcom/tencent/cloud/overseas/R$string;->hy_overseas_illegal_token_error:I

    .line 17
    .line 18
    invoke-static {v1}, Lcom/tencent/could/huiyansdk/utils/d;->a(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/16 v2, 0x120

    .line 23
    .line 24
    invoke-virtual {v0, v2, v1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendFailBackCall(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string v0, ""

    .line 28
    .line 29
    return-object v0
.end method

.method private sendErrorResult(ILjava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/api/e;->a(Lcom/tencent/could/huiyansdk/entity/CompareResult;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private startHuiYanNextStep(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "lightData: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "HuiYanResultSender"

    .line 16
    .line 17
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    new-instance v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;-><init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApi;->startAuthByLightData(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public sendAuthGetLive(Ljava/lang/String;)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/utils/c;->a(Z)Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    sget p1, Lcom/tencent/cloud/overseas/R$string;->hy_overseas_illegal_token_error:I

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/utils/d;->a(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/16 v0, 0x120

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendAuthOnFail(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->closeCurrentFragment()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget-object v2, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 24
    .line 25
    const-string v3, "GetLiveTypeDateUseTime"

    .line 26
    .line 27
    const-string v4, ""

    .line 28
    .line 29
    const/4 v5, 0x1

    .line 30
    invoke-virtual {v2, v3, v5, v0, v4}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IZLjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v3, v1, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->first:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v3, Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v3, "/api/v1/crypt/light"

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v2}, Lcom/tencent/could/huiyansdk/utils/d;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    new-instance v4, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    iget-object v1, v1, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->second:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v1, Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1}, Lcom/tencent/could/huiyansdk/utils/d;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    new-instance v4, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getBackIpUrl()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-static {v4}, Lcom/tencent/could/huiyansdk/utils/d;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    invoke-static {v3}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getBackIpUrls(Ljava/lang/String;)[Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    const/4 v4, 0x3

    .line 108
    if-nez v3, :cond_1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    array-length v3, v3

    .line 112
    add-int/2addr v4, v3

    .line 113
    :goto_0
    sget-object v3, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 114
    .line 115
    new-instance v6, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v7, "requestUrl: "

    .line 118
    .line 119
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    const-string v7, "HuiYanResultSender"

    .line 130
    .line 131
    invoke-virtual {v3, v5, v7, v6}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    new-instance v3, Lcom/google/gson/Gson;

    .line 135
    .line 136
    invoke-direct {v3}, Lcom/google/gson/Gson;-><init>()V

    .line 137
    .line 138
    .line 139
    new-instance v5, Lcom/tencent/could/huiyansdk/entity/LightDataRequest;

    .line 140
    .line 141
    invoke-direct {v5, p1}, Lcom/tencent/could/huiyansdk/entity/LightDataRequest;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v3, v5}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-static {}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->newBuilder()Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-virtual {v5, p1}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setRequestData(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1, v2}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setUrl(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p1, v1}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setDeputyUrl(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {p1, v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setRetryTimes(I)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    sget-object v1, Lcom/tencent/could/component/common/ai/net/HttpMethod;->POST:Lcom/tencent/could/component/common/ai/net/HttpMethod;

    .line 169
    .line 170
    invoke-virtual {p1, v1}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setHttpMethod(Lcom/tencent/could/component/common/ai/net/HttpMethod;)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    const v1, 0xea60

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1, v1}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setTimeOutTimes(I)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p1, v1}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setConnectTimeOut(I)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {p1, v0}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setGzip(Z)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p1}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->createNetWorkParam()Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    new-instance v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$1;

    .line 194
    .line 195
    invoke-direct {v0, p0, v3}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$1;-><init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;Lcom/google/gson/Gson;)V

    .line 196
    .line 197
    .line 198
    invoke-static {p1, v0}, Lcom/tencent/could/huiyansdk/utils/c;->a(Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;Lcom/tencent/could/component/common/ai/net/IJsonDataListener;)V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public sendAuthOnFail(ILjava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "send auth fail, code: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, " msg: "

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x2

    .line 26
    const-string v3, "HuiYanResultSender"

    .line 27
    .line 28
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->authCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getCurrentToken()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {v0, p1, p2, v1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;->onFail(ILjava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const-string v0, "authCallBack is null!"

    .line 48
    .line 49
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->authCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->authCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;

    .line 58
    .line 59
    :cond_1
    sget-object p0, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 60
    .line 61
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/huiyansdk/operate/a;->a(ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/operate/a;->b()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public sendConfigSuccess(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->base64EncodeToString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;->onSuccess(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public sendFailBackCall(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;->onFail(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->resultCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-interface {v0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;->onFail(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->resultCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendAuthOnFail(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_2
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->cleanAllCallBack()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public sendResultSuccess(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->resultCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/OverSeaResult;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/OverSeaResult;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/tencent/could/huiyansdk/entity/OverSeaResult;->setValidateData(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Lcom/google/gson/Gson;

    .line 14
    .line 15
    invoke-direct {p1}, Lcom/google/gson/Gson;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/utils/GZipUtils;->compress(Ljava/lang/String;)[B

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->resultCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;

    .line 27
    .line 28
    invoke-interface {v0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;->onSuccess([BLjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->isNeedCleanListener()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->cleanAllCallBack()V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public setAuthCallBack(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->authCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;

    .line 2
    .line 3
    return-void
.end method

.method public setConfigCallback(Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 2
    .line 3
    return-void
.end method

.method public setResultCallBack(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->resultCallBack:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->configCallback:Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setResultDataCallBack(Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->resultDataCallBack:Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;

    .line 2
    .line 3
    return-void
.end method
