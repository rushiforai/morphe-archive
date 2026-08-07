.class public final Ll/bug0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudListenerInitSDK;


# instance fields
.field public final synthetic a:Ll/hrg0;

.field public final synthetic b:Ll/yng0;

.field public final synthetic c:Ll/hrg0;

.field public final synthetic d:Ll/yng0;

.field public final synthetic e:Ll/chg0;


# direct methods
.method public constructor <init>(Ll/chg0;Ll/hrg0;Ll/yng0;Ll/hrg0;Ll/yng0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bug0;->e:Ll/chg0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bug0;->a:Ll/hrg0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/bug0;->b:Ll/yng0;

    .line 6
    .line 7
    iput-object p4, p0, Ll/bug0;->c:Ll/hrg0;

    .line 8
    .line 9
    iput-object p5, p0, Ll/bug0;->d:Ll/yng0;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final onFailure(ILjava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "initSDK failure:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " retMsg:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "NetworkDetectionTask"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 29
    .line 30
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;-><init>()V

    .line 31
    .line 32
    .line 33
    iput p1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 34
    .line 35
    iput-object p2, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Ll/bug0;->a:Ll/hrg0;

    .line 38
    .line 39
    iget-object v2, p0, Ll/bug0;->b:Ll/yng0;

    .line 40
    .line 41
    iget-object v2, v2, Ll/bpg0;->b:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v2, v1, Ll/hrg0;->c:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v1, v1, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 46
    .line 47
    iget-object v2, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 48
    .line 49
    sget-object v3, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->WAITING:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 50
    .line 51
    if-eq v2, v3, :cond_0

    .line 52
    .line 53
    sget-object v2, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 54
    .line 55
    iput-object v2, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 56
    .line 57
    iput-object v0, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 58
    .line 59
    :cond_0
    iget-object v1, p0, Ll/bug0;->c:Ll/hrg0;

    .line 60
    .line 61
    iget-object v2, p0, Ll/bug0;->d:Ll/yng0;

    .line 62
    .line 63
    iget-object v2, v2, Ll/bpg0;->b:Ljava/lang/String;

    .line 64
    .line 65
    iput-object v2, v1, Ll/hrg0;->c:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v1, v1, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 68
    .line 69
    iget-object v2, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 70
    .line 71
    if-eq v2, v3, :cond_1

    .line 72
    .line 73
    sget-object v2, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 74
    .line 75
    iput-object v2, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 76
    .line 77
    iput-object v0, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 78
    .line 79
    :cond_1
    iget-object p0, p0, Ll/bug0;->e:Ll/chg0;

    .line 80
    .line 81
    invoke-virtual {p0, p1, p2}, Ll/chg0;->g(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final onSuccess()V
    .locals 8

    .line 1
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 2
    .line 3
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 8
    .line 9
    const-string v1, "success"

    .line 10
    .line 11
    iput-object v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p0, Ll/bug0;->a:Ll/hrg0;

    .line 14
    .line 15
    iget-object v2, p0, Ll/bug0;->b:Ll/yng0;

    .line 16
    .line 17
    iget-object v2, v2, Ll/bpg0;->b:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v2, v1, Ll/hrg0;->c:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, v1, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 22
    .line 23
    sget-object v2, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 24
    .line 25
    iput-object v2, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 26
    .line 27
    iput-object v0, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 28
    .line 29
    iget-object v1, p0, Ll/bug0;->c:Ll/hrg0;

    .line 30
    .line 31
    iget-object v3, p0, Ll/bug0;->d:Ll/yng0;

    .line 32
    .line 33
    iget-object v3, v3, Ll/bpg0;->b:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v3, v1, Ll/hrg0;->c:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, v1, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 38
    .line 39
    iput-object v2, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 40
    .line 41
    iput-object v0, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 42
    .line 43
    iget-object p0, p0, Ll/bug0;->e:Ll/chg0;

    .line 44
    .line 45
    iget-boolean v0, p0, Ll/chg0;->d:Z

    .line 46
    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    sget-object v1, Ll/utg0;->b:Ll/uyg0;

    .line 51
    .line 52
    iget-object v2, v1, Ll/uyg0;->c:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v3, Ll/hrg0;

    .line 55
    .line 56
    invoke-direct {v3}, Ll/hrg0;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v0, "getCheckerUrlConfig"

    .line 60
    .line 61
    iput-object v0, v3, Ll/hrg0;->b:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v2, v3, Ll/hrg0;->c:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v0, v3, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 66
    .line 67
    iget v4, p0, Ll/chg0;->i:I

    .line 68
    .line 69
    add-int/lit8 v4, v4, 0x1

    .line 70
    .line 71
    iput v4, p0, Ll/chg0;->i:I

    .line 72
    .line 73
    iput v4, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->identifier:I

    .line 74
    .line 75
    const-string v4, "https"

    .line 76
    .line 77
    iput-object v4, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->protocol:Ljava/lang/String;

    .line 78
    .line 79
    const-string v4, "POST"

    .line 80
    .line 81
    iput-object v4, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->method:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v0, p0, Ll/chg0;->e:Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    new-instance v4, Ll/yng0;

    .line 89
    .line 90
    iget-object v0, v3, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 91
    .line 92
    invoke-direct {v4, v0}, Ll/yng0;-><init>(Ltech/sud/gip/core/network/detection/NetworkDetectionStep;)V

    .line 93
    .line 94
    .line 95
    new-instance v5, Lorg/json/JSONObject;

    .line 96
    .line 97
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 98
    .line 99
    .line 100
    :try_start_0
    iget-object v0, p0, Ll/chg0;->a:Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;

    .line 101
    .line 102
    if-eqz v0, :cond_1

    .line 103
    .line 104
    const-string v6, "app_id"

    .line 105
    .line 106
    iget-object v0, v0, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->appId:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v5, v6, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :catch_0
    move-exception v0

    .line 113
    new-instance v6, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string v7, "getCheckerUrlConfig error:"

    .line 116
    .line 117
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    const-string v6, "NetworkDetectionTask"

    .line 132
    .line 133
    invoke-static {v6, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    :cond_1
    :goto_0
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    new-instance v5, Ll/kwg0;

    .line 141
    .line 142
    invoke-direct {v5, p0, v3}, Ll/kwg0;-><init>(Ll/chg0;Ll/hrg0;)V

    .line 143
    .line 144
    .line 145
    new-instance v6, Ll/neg0;

    .line 146
    .line 147
    invoke-direct {v6}, Ll/neg0;-><init>()V

    .line 148
    .line 149
    .line 150
    iget-object p0, p0, Ll/chg0;->h:Ljava/util/ArrayList;

    .line 151
    .line 152
    invoke-virtual {p0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-object v3, v0

    .line 156
    invoke-virtual/range {v1 .. v6}, Ll/uyg0;->l(Ljava/lang/String;Ljava/lang/String;Ll/yng0;Ll/vlg0;Ll/neg0;)V

    .line 157
    .line 158
    .line 159
    return-void
.end method
