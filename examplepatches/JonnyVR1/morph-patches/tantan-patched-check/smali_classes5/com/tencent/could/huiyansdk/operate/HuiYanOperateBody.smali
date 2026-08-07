.class public Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;
.super Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public deviceModel:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "DeviceModel"
    .end annotation
.end field

.field public deviceToken:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "DeviceToken"
    .end annotation
.end field

.field public errorCode:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ErrorCode"
    .end annotation
.end field

.field public errorMessage:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ErrorMessage"
    .end annotation
.end field

.field public netWorkType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "NetWorkType"
    .end annotation
.end field

.field public osVersion:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "OsVersion"
    .end annotation
.end field

.field public packageName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "PackageName"
    .end annotation
.end field

.field public packageVersion:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "PackageVersion"
    .end annotation
.end field

.field public platform:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "Platform"
    .end annotation
.end field

.field public sdkName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "SdkName"
    .end annotation
.end field

.field public sdkVersion:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "SdkVersion"
    .end annotation
.end field

.field public token:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "Token"
    .end annotation
.end field

.field public turingVersion:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "TuringVersion"
    .end annotation
.end field

.field public youTuVersion:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "YouTuVersion"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->errorCode:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->errorMessage:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->deviceModel:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->deviceToken:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->token:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->netWorkType:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->osVersion:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->sdkName:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->sdkVersion:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "Android"

    .line 25
    .line 26
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->packageName:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->packageVersion:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->platform:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->turingVersion:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->youTuVersion:Ljava/lang/String;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDeviceModel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->deviceModel:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDeviceToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->deviceToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getErrorCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->errorCode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->errorMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNetWorkType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->netWorkType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOsVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->osVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->packageName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPackageVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->packageVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlatform()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->platform:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSdkName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->sdkName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSdkVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->sdkVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->token:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTuringVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->turingVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getYouTuVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->youTuVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public initData()V
    .locals 7

    .line 1
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 2
    .line 3
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 4
    .line 5
    const-string v3, "StartHuiYanSdk"

    .line 6
    .line 7
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 14
    .line 15
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 16
    .line 17
    const-string v3, "StartYTAuthUseTime"

    .line 18
    .line 19
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 26
    .line 27
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 28
    .line 29
    const-string v3, "GetConfigUseTime"

    .line 30
    .line 31
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 38
    .line 39
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 40
    .line 41
    const-string v3, "GetLiveTypeDateUseTime"

    .line 42
    .line 43
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 50
    .line 51
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 52
    .line 53
    const-string v3, "MakePackUseTime"

    .line 54
    .line 55
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 62
    .line 63
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 64
    .line 65
    const-string v3, "GetCompareResultUseTime"

    .line 66
    .line 67
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 74
    .line 75
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 76
    .line 77
    const-string v3, "LocalCheckUseTime"

    .line 78
    .line 79
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 86
    .line 87
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 88
    .line 89
    const-string v3, "GetLiveTypeData"

    .line 90
    .line 91
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 98
    .line 99
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 100
    .line 101
    const-string v3, "StartCamera"

    .line 102
    .line 103
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 110
    .line 111
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 112
    .line 113
    const-string v3, "LocalCheck"

    .line 114
    .line 115
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 122
    .line 123
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 124
    .line 125
    const-string v3, "LocalVideo"

    .line 126
    .line 127
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 134
    .line 135
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 136
    .line 137
    const-string v3, "Compare"

    .line 138
    .line 139
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 146
    .line 147
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 148
    .line 149
    const-string v3, "Crash"

    .line 150
    .line 151
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 158
    .line 159
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 160
    .line 161
    const-string v3, "LocalVideoSize"

    .line 162
    .line 163
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 170
    .line 171
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 172
    .line 173
    const-string v3, "LivenessPackSize"

    .line 174
    .line 175
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 182
    .line 183
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 184
    .line 185
    const-string v3, "SendPackSize"

    .line 186
    .line 187
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 194
    .line 195
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 196
    .line 197
    const-string v3, "YTCatchError"

    .line 198
    .line 199
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 206
    .line 207
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 208
    .line 209
    const-string v3, "UserCancel"

    .line 210
    .line 211
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 218
    .line 219
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 220
    .line 221
    const-string v3, "ShowPrivacyDialog"

    .line 222
    .line 223
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 230
    .line 231
    new-instance v2, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 232
    .line 233
    const-string v3, "ShowProtocolPage"

    .line 234
    .line 235
    invoke-direct {v2, v3}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 242
    .line 243
    .line 244
    move-result-wide v5

    .line 245
    const/4 v2, 0x1

    .line 246
    const-wide/16 v3, 0x1

    .line 247
    .line 248
    const-string v1, "StartHuiYanSdk"

    .line 249
    .line 250
    move-object v0, p0

    .line 251
    invoke-virtual/range {v0 .. v6}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 252
    .line 253
    .line 254
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 255
    .line 256
    .line 257
    move-result-wide v5

    .line 258
    const-wide/16 v3, 0x0

    .line 259
    .line 260
    const-string v1, "Crash"

    .line 261
    .line 262
    invoke-virtual/range {v0 .. v6}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 263
    .line 264
    .line 265
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->errorCode:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->errorMessage:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->token:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->netWorkType:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->initData()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public setDeviceModel(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->deviceModel:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDeviceToken(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->deviceToken:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setErrorCode(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->errorCode:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setErrorMessage(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->errorMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setNetWorkType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->netWorkType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOsVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->osVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPackageName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->packageName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPackageVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->packageVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPlatform(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->platform:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSdkName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->sdkName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSdkVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->sdkVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setToken(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->token:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTuringVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->turingVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setYouTuVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->youTuVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
