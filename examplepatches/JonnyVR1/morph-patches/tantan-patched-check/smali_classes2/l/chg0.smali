.class public final Ll/chg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public a:Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;

.field public b:Ltech/sud/gip/core/network/detection/INetworkDetectionListener;

.field public final c:Ll/yfg0;

.field public d:Z

.field public final e:Ljava/util/ArrayList;

.field public f:I

.field public g:I

.field public final h:Ljava/util/ArrayList;

.field public i:I

.field public j:Ll/ukg0;


# direct methods
.method public constructor <init>(Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;Ltech/sud/gip/core/network/detection/INetworkDetectionListener;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/yfg0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/yfg0;-><init>(Ll/chg0;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/chg0;->c:Ll/yfg0;

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/chg0;->e:Ljava/util/ArrayList;

    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/chg0;->h:Ljava/util/ArrayList;

    .line 33
    .line 34
    iput-object p1, p0, Ll/chg0;->a:Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;

    .line 35
    .line 36
    iput-object p2, p0, Ll/chg0;->b:Ltech/sud/gip/core/network/detection/INetworkDetectionListener;

    .line 37
    .line 38
    new-instance p1, Ll/ukg0;

    .line 39
    .line 40
    const-string p2, "networkDetection"

    .line 41
    .line 42
    invoke-direct {p1, p2}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Ll/chg0;->j:Ll/ukg0;

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7

    .line 1
    new-instance v2, Ll/hrg0;

    .line 2
    .line 3
    invoke-direct {v2}, Ll/hrg0;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "getFqs"

    .line 7
    .line 8
    iput-object v0, v2, Ll/hrg0;->b:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, v2, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 11
    .line 12
    iget v1, p0, Ll/chg0;->i:I

    .line 13
    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    iput v1, p0, Ll/chg0;->i:I

    .line 17
    .line 18
    iput v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->identifier:I

    .line 19
    .line 20
    const-string v1, "https"

    .line 21
    .line 22
    iput-object v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->protocol:Ljava/lang/String;

    .line 23
    .line 24
    const-string v3, "GET"

    .line 25
    .line 26
    iput-object v3, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->method:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v0, p0, Ll/chg0;->e:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-object v0, v3

    .line 34
    new-instance v3, Ll/yng0;

    .line 35
    .line 36
    iget-object v4, v2, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 37
    .line 38
    invoke-direct {v3, v4}, Ll/yng0;-><init>(Ltech/sud/gip/core/network/detection/NetworkDetectionStep;)V

    .line 39
    .line 40
    .line 41
    new-instance v4, Ll/hrg0;

    .line 42
    .line 43
    invoke-direct {v4}, Ll/hrg0;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v5, "getSdkToken"

    .line 47
    .line 48
    iput-object v5, v4, Ll/hrg0;->b:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v5, v4, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 51
    .line 52
    iget v6, p0, Ll/chg0;->i:I

    .line 53
    .line 54
    add-int/lit8 v6, v6, 0x1

    .line 55
    .line 56
    iput v6, p0, Ll/chg0;->i:I

    .line 57
    .line 58
    iput v6, v5, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->identifier:I

    .line 59
    .line 60
    iput-object v1, v5, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->protocol:Ljava/lang/String;

    .line 61
    .line 62
    iput-object v0, v5, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->method:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v0, p0, Ll/chg0;->e:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    new-instance v5, Ll/yng0;

    .line 70
    .line 71
    iget-object v0, v4, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 72
    .line 73
    invoke-direct {v5, v0}, Ll/yng0;-><init>(Ltech/sud/gip/core/network/detection/NetworkDetectionStep;)V

    .line 74
    .line 75
    .line 76
    new-instance v0, Ll/xgg0;

    .line 77
    .line 78
    move-object v1, p0

    .line 79
    invoke-direct/range {v0 .. v5}, Ll/xgg0;-><init>(Ll/chg0;Ll/hrg0;Ll/yng0;Ll/hrg0;Ll/yng0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final b(ILjava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;

    .line 2
    .line 3
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;->code:I

    .line 7
    .line 8
    iput-object p2, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;->msg:Ljava/lang/String;

    .line 9
    .line 10
    new-instance p1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/chg0;->e:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x0

    .line 22
    :goto_0
    if-ge v2, v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    check-cast v3, Ll/hrg0;

    .line 31
    .line 32
    iget-object v3, v3, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 33
    .line 34
    invoke-virtual {v3}, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->deepCopy()Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iput-object p1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;->stepList:Ljava/util/List;

    .line 43
    .line 44
    iget-object p1, p0, Ll/chg0;->b:Ltech/sud/gip/core/network/detection/INetworkDetectionListener;

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    invoke-interface {p1, v0}, Ltech/sud/gip/core/network/detection/INetworkDetectionListener;->onCompleted(Ltech/sud/gip/core/network/detection/NetworkDetectionResult;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-virtual {p0, v0}, Ll/chg0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionResult;)V

    .line 52
    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Ll/chg0;->a:Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;

    .line 56
    .line 57
    iput-object p1, p0, Ll/chg0;->b:Ltech/sud/gip/core/network/detection/INetworkDetectionListener;

    .line 58
    .line 59
    return-void
.end method

.method public final synthetic c(Ll/hrg0;Ll/yng0;Ll/hrg0;Ll/yng0;)V
    .locals 8

    .line 1
    new-instance v0, Ltech/sud/gip/core/SudInitSDKParamModel;

    .line 2
    .line 3
    invoke-direct {v0}, Ltech/sud/gip/core/SudInitSDKParamModel;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/chg0;->a:Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v2, v1, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->context:Landroid/content/Context;

    .line 11
    .line 12
    iput-object v2, v0, Ltech/sud/gip/core/SudInitSDKParamModel;->context:Landroid/content/Context;

    .line 13
    .line 14
    iget-object v2, v1, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->appId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v2, v0, Ltech/sud/gip/core/SudInitSDKParamModel;->appId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, v1, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->appKey:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v2, v0, Ltech/sud/gip/core/SudInitSDKParamModel;->appKey:Ljava/lang/String;

    .line 21
    .line 22
    iget-boolean v2, v1, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->isTestEnv:Z

    .line 23
    .line 24
    iput-boolean v2, v0, Ltech/sud/gip/core/SudInitSDKParamModel;->isTestEnv:Z

    .line 25
    .line 26
    iget-object v1, v1, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->userId:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Ltech/sud/gip/core/SudInitSDKParamModel;->userId:Ljava/lang/String;

    .line 29
    .line 30
    :cond_0
    new-instance v2, Ll/bug0;

    .line 31
    .line 32
    move-object v3, p0

    .line 33
    move-object v4, p1

    .line 34
    move-object v5, p2

    .line 35
    move-object v6, p3

    .line 36
    move-object v7, p4

    .line 37
    invoke-direct/range {v2 .. v7}, Ll/bug0;-><init>(Ll/chg0;Ll/hrg0;Ll/yng0;Ll/hrg0;Ll/yng0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v2, v5, v7}, Ll/utg0;->b(Ltech/sud/gip/core/SudInitSDKParamModel;Ltech/sud/gip/core/ISudListenerInitSDK;Ll/yng0;Ll/yng0;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final d(Ltech/sud/gip/core/network/detection/NetworkDetectionResult;)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/chg0;->j:Ll/ukg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lorg/json/JSONArray;

    .line 7
    .line 8
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/chg0;->e:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x0

    .line 18
    move v4, v3

    .line 19
    :goto_0
    if-ge v4, v2, :cond_3

    .line 20
    .line 21
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    add-int/lit8 v4, v4, 0x1

    .line 26
    .line 27
    check-cast v5, Ll/hrg0;

    .line 28
    .line 29
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    new-instance v6, Lorg/json/JSONObject;

    .line 33
    .line 34
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 35
    .line 36
    .line 37
    :try_start_0
    const-string v7, "name"

    .line 38
    .line 39
    iget-object v8, v5, Ll/hrg0;->b:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    const-string v7, "url"

    .line 45
    .line 46
    iget-object v8, v5, Ll/hrg0;->c:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 49
    .line 50
    .line 51
    const-string v7, "identifier"

    .line 52
    .line 53
    iget-object v8, v5, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 54
    .line 55
    iget v8, v8, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->identifier:I

    .line 56
    .line 57
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    const-string v7, "protocol"

    .line 61
    .line 62
    iget-object v8, v5, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 63
    .line 64
    iget-object v8, v8, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->protocol:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    .line 68
    .line 69
    const-string v7, "method"

    .line 70
    .line 71
    iget-object v8, v5, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 72
    .line 73
    iget-object v8, v8, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->method:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    .line 77
    .line 78
    const-string v7, "status"

    .line 79
    .line 80
    iget-object v8, v5, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 81
    .line 82
    iget-object v8, v8, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 83
    .line 84
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    .line 86
    .line 87
    new-instance v7, Lorg/json/JSONArray;

    .line 88
    .line 89
    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 90
    .line 91
    .line 92
    move v8, v3

    .line 93
    :goto_1
    iget-object v9, v5, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 94
    .line 95
    iget-object v9, v9, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->detailList:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v9

    .line 101
    if-ge v8, v9, :cond_1

    .line 102
    .line 103
    iget-object v9, v5, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 104
    .line 105
    iget-object v9, v9, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->detailList:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v9

    .line 111
    check-cast v9, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;

    .line 112
    .line 113
    new-instance v10, Lorg/json/JSONObject;

    .line 114
    .line 115
    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 116
    .line 117
    .line 118
    const-string v11, "type"

    .line 119
    .line 120
    iget-object v12, v9, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;->type:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 121
    .line 122
    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 123
    .line 124
    .line 125
    const-string v11, "timestamp"

    .line 126
    .line 127
    iget-wide v12, v9, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;->timestamp:J

    .line 128
    .line 129
    invoke-virtual {v10, v11, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v7, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 133
    .line 134
    .line 135
    add-int/lit8 v8, v8, 0x1

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :catch_0
    move-exception v5

    .line 139
    goto :goto_2

    .line 140
    :cond_1
    const-string v8, "detailList"

    .line 141
    .line 142
    invoke-virtual {v6, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 143
    .line 144
    .line 145
    iget-object v5, v5, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 146
    .line 147
    iget-object v5, v5, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 148
    .line 149
    if-eqz v5, :cond_2

    .line 150
    .line 151
    const-string v7, "result"

    .line 152
    .line 153
    invoke-virtual {v5}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->toJsonObject()Lorg/json/JSONObject;

    .line 154
    .line 155
    .line 156
    move-result-object v5

    .line 157
    invoke-virtual {v6, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    .line 159
    .line 160
    goto :goto_3

    .line 161
    :goto_2
    new-instance v7, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    const-string v8, "jsonError:"

    .line 164
    .line 165
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-static {v5}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    const-string v7, "InnelNetworkDetectionStep"

    .line 180
    .line 181
    invoke-static {v7, v5}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    :cond_2
    :goto_3
    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 185
    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :cond_3
    iget-object v1, p0, Ll/chg0;->j:Ll/ukg0;

    .line 190
    .line 191
    iget-object v1, v1, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 192
    .line 193
    const-string v2, "stepList"

    .line 194
    .line 195
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    iget-object v0, p0, Ll/chg0;->j:Ll/ukg0;

    .line 199
    .line 200
    iget v1, p1, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;->code:I

    .line 201
    .line 202
    iput v1, v0, Ll/ukg0;->e:I

    .line 203
    .line 204
    iget-object p1, p1, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;->msg:Ljava/lang/String;

    .line 205
    .line 206
    if-eqz p1, :cond_4

    .line 207
    .line 208
    iput-object p1, v0, Ll/ukg0;->f:Ljava/lang/String;

    .line 209
    .line 210
    :cond_4
    invoke-static {v0}, Ll/fug0;->b(Ll/ukg0;)V

    .line 211
    .line 212
    .line 213
    const/4 p1, 0x0

    .line 214
    iput-object p1, p0, Ll/chg0;->j:Ll/ukg0;

    .line 215
    .line 216
    return-void
.end method

.method public final synthetic e()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/chg0;->b:Ltech/sud/gip/core/network/detection/INetworkDetectionListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ltech/sud/gip/core/network/detection/INetworkDetectionListener;->onStarted()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final f()V
    .locals 6

    .line 1
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;

    .line 2
    .line 3
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;->code:I

    .line 8
    .line 9
    const-string v2, "success"

    .line 10
    .line 11
    iput-object v2, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;->msg:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Ll/chg0;->e:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    :goto_0
    if-ge v1, v4, :cond_0

    .line 25
    .line 26
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    check-cast v5, Ll/hrg0;

    .line 33
    .line 34
    iget-object v5, v5, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 35
    .line 36
    invoke-virtual {v5}, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->deepCopy()Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iput-object v2, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;->stepList:Ljava/util/List;

    .line 45
    .line 46
    iget-object v1, p0, Ll/chg0;->b:Ltech/sud/gip/core/network/detection/INetworkDetectionListener;

    .line 47
    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    invoke-interface {v1, v0}, Ltech/sud/gip/core/network/detection/INetworkDetectionListener;->onCompleted(Ltech/sud/gip/core/network/detection/NetworkDetectionResult;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-virtual {p0, v0}, Ll/chg0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionResult;)V

    .line 54
    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    iput-object v0, p0, Ll/chg0;->a:Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;

    .line 58
    .line 59
    iput-object v0, p0, Ll/chg0;->b:Ltech/sud/gip/core/network/detection/INetworkDetectionListener;

    .line 60
    .line 61
    return-void
.end method

.method public final g(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/zgg0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/zgg0;-><init>(Ll/chg0;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final h()V
    .locals 1

    .line 1
    new-instance v0, Ll/ahg0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ahg0;-><init>(Ll/chg0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final i()V
    .locals 1

    .line 1
    new-instance v0, Ll/ygg0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ygg0;-><init>(Ll/chg0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final run()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/chg0;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/chg0;->i()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/chg0;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
