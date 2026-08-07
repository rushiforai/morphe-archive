.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$HuiYanOsApiImpHolder;
    }
.end annotation


# static fields
.field public static final PRE_PAGE_ClASS_NAME:Ljava/lang/String; = "com.tencent.could.huiyansdk.overseas.fragment.GuideFragment"

.field public static final TAG:Ljava/lang/String; = "HuiYanOsApiImp"


# instance fields
.field public currentToken:Ljava/lang/String;

.field public huiYanAuthEventCallBack:Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

.field public isNeedCleanListener:Z

.field public osConfig:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->currentToken:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->isNeedCleanListener:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic access$100(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getLiveTypeRequest(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->currentToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->huiYanAuthEventCallBack:Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 2
    .line 3
    return-object p0
.end method

.method private changeFaceAngleValidation(Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;)Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getFaceAngleValidation()Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    const/4 p2, 0x1

    .line 12
    if-eq p0, p2, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    if-eq p0, v0, :cond_0

    .line 16
    .line 17
    return-object p1

    .line 18
    :cond_0
    invoke-virtual {p1, p2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setOpenAngleDetect(Z)V

    .line 19
    .line 20
    .line 21
    const/high16 p0, 0x41200000    # 10.0f

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setBestImageYaw(F)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setBestImageRoll(F)V

    .line 27
    .line 28
    .line 29
    return-object p1

    .line 30
    :cond_1
    invoke-virtual {p1, p2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setOpenAngleDetect(Z)V

    .line 31
    .line 32
    .line 33
    const/high16 p0, 0x41a00000    # 20.0f

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setBestImageYaw(F)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setBestImageRoll(F)V

    .line 39
    .line 40
    .line 41
    return-object p1

    .line 42
    :cond_2
    const/4 p0, 0x0

    .line 43
    invoke-virtual {p1, p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setOpenAngleDetect(Z)V

    .line 44
    .line 45
    .line 46
    const/high16 p0, 0x41f00000    # 30.0f

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setBestImageYaw(F)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setBestImageRoll(F)V

    .line 52
    .line 53
    .line 54
    return-object p1
.end method

.method private checkLiveData(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/LiveTypeResult;
    .locals 2

    .line 1
    new-instance p0, Lcom/google/gson/Gson;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/gson/Gson;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-class v0, Lcom/tencent/could/huiyansdk/entity/LiveTypeResult;

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/tencent/could/huiyansdk/entity/LiveTypeResult;
    :try_end_0
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    return-object p0

    .line 15
    :catch_0
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 16
    .line 17
    const-string p1, ""

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    const-string v1, "HuiYanOsApiImp"

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method private createHuiYanConfig(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;)Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "create HuiYanSdkConfig by startConfig:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "HuiYanOsApiImp"

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-virtual {v0, v3, v2, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isDeleteVideoCache()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setDeleteVideoCache(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getAuthLicense()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setAuthLicense(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getPageColorStyle()Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setPageColorStyle(Lcom/tencent/could/huiyansdk/enums/PageColorStyle;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getAuthTimeOutMs()J

    .line 50
    .line 51
    .line 52
    move-result-wide v1

    .line 53
    invoke-virtual {v0, v1, v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setPrepareFaceTimeOutMs(J)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getAuthTimeOutMs()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    invoke-virtual {v0, v1, v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setAuthTimeOutMs(J)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getLanguageStyle()Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setLanguageStyle(Lcom/tencent/could/huiyansdk/entity/LanguageStyle;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getLanguageCode()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setLanguageCode(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setCloseEncrypt(Z)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isUseBackCamera()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setUseBackCamera(Z)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getStartActivityContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setStartActivityContext(Landroid/content/Context;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenLog()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setOpenLog(Z)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenFullLog()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setOpenFullLog(Z)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getLongCheckTimeOutMs()J

    .line 109
    .line 110
    .line 111
    move-result-wide v1

    .line 112
    invoke-virtual {v0, v1, v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setLongCheckTimeOutMs(J)V

    .line 113
    .line 114
    .line 115
    const/4 v1, 0x0

    .line 116
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setOpenCheckRiskMode(Z)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenBOTCheck()Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_0

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenBOTCheck()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setOpenLongCheck(Z)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenBOTCheck()Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setNeedCropBestImageMode(Z)V

    .line 137
    .line 138
    .line 139
    :cond_0
    sget v1, Lcom/tencent/cloud/overseas/R$string;->txy_huiyan_pro_confirm_tips:I

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setPolicyDialogResId(I)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isShowPrivacyPolicyDialog()Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setShowPrivacyPolicyDialog(Z)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getSmallFaceRatioThreshold()F

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setSmallFaceRatioThreshold(F)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getBigFaceRatioThreshold()F

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setBigFaceRatioThreshold(F)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isDisableSystemRecordScreen()Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setDisableSystemRecordScreen(Z)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getZoomLevel()Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setZoomLevel(Lcom/tencent/could/aicamare/enums/CameraZoom;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getDelayTimeMsOfLoadFragment()I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setDelayTimeMsOfLoadFragment(I)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setRelaxed(Z)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getFaceOcclusionLevel()Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setFaceOcclusionLevel(Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOtherActionCheckMouthOpen()Z

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setOtherActionCheckMouthOpen(Z)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isShowGuidePage()Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-eqz v1, :cond_1

    .line 208
    .line 209
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/a$a;->a:Lcom/tencent/could/huiyansdk/manager/a;

    .line 210
    .line 211
    const-string v2, "com.tencent.could.huiyansdk.overseas.fragment.GuideFragment"

    .line 212
    .line 213
    iput-object v2, v1, Lcom/tencent/could/huiyansdk/manager/a;->a:Ljava/lang/String;

    .line 214
    .line 215
    goto :goto_0

    .line 216
    :cond_1
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/a$a;->a:Lcom/tencent/could/huiyansdk/manager/a;

    .line 217
    .line 218
    const-string v2, ""

    .line 219
    .line 220
    iput-object v2, v1, Lcom/tencent/could/huiyansdk/manager/a;->a:Ljava/lang/String;

    .line 221
    .line 222
    :goto_0
    invoke-direct {p0, v0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->changeFaceAngleValidation(Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;)Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    return-object p0
.end method

.method private createLiveResultString(Lcom/tencent/could/huiyansdk/entity/LiveTypeResult;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "errorcode"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    const-string v0, "type"

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    const-string v0, "data"

    .line 19
    .line 20
    const-string v1, "0"

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 23
    .line 24
    .line 25
    const-string v0, "errormsg"

    .line 26
    .line 27
    const-string v1, "OK"

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/LiveTypeResult;->getActionData()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "action_data"

    .line 37
    .line 38
    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/LiveTypeResult;->getColorData()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "color_data"

    .line 46
    .line 47
    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    new-instance v0, Lorg/json/JSONObject;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/LiveTypeResult;->getSelectData()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string p1, "select_data"

    .line 60
    .line 61
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public static getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$HuiYanOsApiImpHolder;->access$000()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private getLiveTypeRequest(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string p0, "select_data"

    .line 2
    .line 3
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Lcom/tencent/could/huiyansdk/entity/OverSeaLiveRequest;

    .line 19
    .line 20
    invoke-direct {p1}, Lcom/tencent/could/huiyansdk/entity/OverSeaLiveRequest;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lcom/tencent/could/huiyansdk/entity/OverSeaLiveRequest;->setSelectData(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Lcom/google/gson/Gson;

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/google/gson/Gson;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendConfigSuccess(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void

    .line 47
    :catch_0
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 48
    .line 49
    const-string p1, "do request content error!"

    .line 50
    .line 51
    const/4 v0, 0x2

    .line 52
    const-string v1, "HuiYanOsApiImp"

    .line 53
    .line 54
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private realStartGetAuthConfigData(ZLcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p3}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->setConfigCallback(Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;)V

    .line 6
    .line 7
    .line 8
    sget-object p3, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 9
    .line 10
    iget-object v0, p3, Lcom/tencent/could/huiyansdk/operate/a;->b:Ljava/util/Map;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p3, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->reset()V

    .line 22
    .line 23
    .line 24
    :cond_1
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->isNeedCleanListener:Z

    .line 26
    .line 27
    if-eqz p2, :cond_4

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenBOTCheck()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getAuthUiConfig()Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    new-instance v1, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 42
    .line 43
    invoke-direct {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;-><init>()V

    .line 44
    .line 45
    .line 46
    :cond_2
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/VideoSize;->SIZE_720P:Lcom/tencent/could/huiyansdk/enums/VideoSize;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->setVideoSize(Lcom/tencent/could/huiyansdk/enums/VideoSize;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->setAuthUiConfig(Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;)V

    .line 52
    .line 53
    .line 54
    :cond_3
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->getAuthUiConfig()Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget-object v2, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 59
    .line 60
    iput-object v1, v2, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 61
    .line 62
    :cond_4
    iput-object p2, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->osConfig:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 63
    .line 64
    invoke-direct {p0, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->createHuiYanConfig(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;)Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p2, p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setWaitingUserCompare(Z)V

    .line 69
    .line 70
    .line 71
    sget-object p1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget-object v2, p3, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 78
    .line 79
    if-eqz v2, :cond_5

    .line 80
    .line 81
    invoke-static {v1}, Lcom/tencent/could/huiyansdk/utils/d;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v2, v1}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setNetWorkType(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_5
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->currentToken:Ljava/lang/String;

    .line 89
    .line 90
    iget-object p3, p3, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 91
    .line 92
    if-eqz p3, :cond_6

    .line 93
    .line 94
    invoke-virtual {p3, v1}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setToken(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_6
    new-instance p3, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$1;

    .line 98
    .line 99
    invoke-direct {p3, p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$1;-><init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)V

    .line 100
    .line 101
    .line 102
    sget-object v1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 103
    .line 104
    iput-object p3, v1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 105
    .line 106
    new-instance p3, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$2;

    .line 107
    .line 108
    invoke-direct {p3, p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$2;-><init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)V

    .line 109
    .line 110
    .line 111
    iput-object p2, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 112
    .line 113
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 114
    .line 115
    new-instance p2, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v2, "sdkConfig getAuthTimeOutMs:"

    .line 118
    .line 119
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v2, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 123
    .line 124
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getAuthTimeOutMs()J

    .line 125
    .line 126
    .line 127
    move-result-wide v2

    .line 128
    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v2, " longCheckTimeOutMs:"

    .line 132
    .line 133
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    iget-object v2, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 137
    .line 138
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckTimeOutMs()J

    .line 139
    .line 140
    .line 141
    move-result-wide v2

    .line 142
    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string v2, " prepareFaceTimeOutMs:"

    .line 146
    .line 147
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    iget-object v2, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 151
    .line 152
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getPrepareFaceTimeOutMs()J

    .line 153
    .line 154
    .line 155
    move-result-wide v2

    .line 156
    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    const-string v2, "HuiYanSdkImp"

    .line 164
    .line 165
    invoke-virtual {p0, v0, v2, p2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    const/4 p2, 0x0

    .line 169
    iput-boolean p2, v1, Lcom/tencent/could/huiyansdk/api/j;->d:Z

    .line 170
    .line 171
    sget-object v3, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 172
    .line 173
    iput-object v3, v1, Lcom/tencent/could/huiyansdk/api/j;->j:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 174
    .line 175
    iput-object p3, v1, Lcom/tencent/could/huiyansdk/api/j;->f:Lcom/tencent/could/huiyansdk/api/f;

    .line 176
    .line 177
    iput-boolean p2, v1, Lcom/tencent/could/huiyansdk/api/j;->e:Z

    .line 178
    .line 179
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 180
    .line 181
    .line 182
    move-result-object p3

    .line 183
    if-nez p3, :cond_7

    .line 184
    .line 185
    const/16 p0, 0xe9

    .line 186
    .line 187
    const-string p1, "context is illegal!"

    .line 188
    .line 189
    invoke-virtual {v1, p0, p1}, Lcom/tencent/could/huiyansdk/api/j;->a(ILjava/lang/String;)V

    .line 190
    .line 191
    .line 192
    return-void

    .line 193
    :cond_7
    new-instance p3, Lcom/tencent/could/huiyansdk/api/i;

    .line 194
    .line 195
    invoke-direct {p3, v1}, Lcom/tencent/could/huiyansdk/api/i;-><init>(Lcom/tencent/could/huiyansdk/api/j;)V

    .line 196
    .line 197
    .line 198
    iput-object p3, p1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 199
    .line 200
    sget-object p3, Lcom/tencent/could/huiyansdk/utils/e$a;->a:Lcom/tencent/could/huiyansdk/utils/e;

    .line 201
    .line 202
    iget-object v3, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 203
    .line 204
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLog()Z

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    iput-boolean v3, p3, Lcom/tencent/could/huiyansdk/utils/e;->a:Z

    .line 209
    .line 210
    new-instance p3, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;

    .line 211
    .line 212
    invoke-direct {p3}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;-><init>()V

    .line 213
    .line 214
    .line 215
    iget-object v3, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 216
    .line 217
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getAuthLicense()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-virtual {p3, v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->setLicense(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    iget-object v3, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 225
    .line 226
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getAuthLicenseStr()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    invoke-virtual {p3, v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->setLicenseStr(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    iget-object v3, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 234
    .line 235
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getUseCustomerModelPath()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    invoke-virtual {p3, v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->setModelPath(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    iget-object v3, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 243
    .line 244
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenCheckRiskMode()Z

    .line 245
    .line 246
    .line 247
    move-result v3

    .line 248
    invoke-virtual {p3, v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->setOpenCheckRiskMode(Z)V

    .line 249
    .line 250
    .line 251
    iget-object v3, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 252
    .line 253
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getHuiYanLiveMode()Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    invoke-virtual {p3, v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->setHuiYanLiveMode(Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;)V

    .line 258
    .line 259
    .line 260
    iget-object v3, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 261
    .line 262
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenCheckRiskMode()Z

    .line 263
    .line 264
    .line 265
    move-result v3

    .line 266
    const/4 v4, 0x2

    .line 267
    if-nez v3, :cond_a

    .line 268
    .line 269
    sget-object v3, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 270
    .line 271
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 272
    .line 273
    .line 274
    iget-object v5, v3, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 275
    .line 276
    if-eqz v5, :cond_9

    .line 277
    .line 278
    iget-boolean v5, v3, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 279
    .line 280
    if-nez v5, :cond_8

    .line 281
    .line 282
    goto :goto_0

    .line 283
    :cond_8
    iput-boolean p2, v3, Lcom/tencent/could/huiyansdk/turing/f;->c:Z

    .line 284
    .line 285
    iget-object p0, v3, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 286
    .line 287
    check-cast p0, Lcom/tencent/could/huiyansdk/turing/EmptyTuringHelper;

    .line 288
    .line 289
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 290
    .line 291
    .line 292
    goto :goto_1

    .line 293
    :cond_9
    :goto_0
    const-string v3, "TuringSdkHelper"

    .line 294
    .line 295
    const-string v5, "init turing module with auth not get instance"

    .line 296
    .line 297
    invoke-virtual {p0, v4, v3, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    :cond_a
    :goto_1
    iget-object p0, v1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 301
    .line 302
    const-string v3, ""

    .line 303
    .line 304
    if-eqz p0, :cond_b

    .line 305
    .line 306
    const-string v5, "StartYTAuthUseTime"

    .line 307
    .line 308
    invoke-interface {p0, v5, v0, p2, v3}, Lcom/tencent/could/huiyansdk/api/b;->onOperateTimeEvent(Ljava/lang/String;IZLjava/lang/String;)V

    .line 309
    .line 310
    .line 311
    :cond_b
    iput-object p3, p1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->c:Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;

    .line 312
    .line 313
    invoke-virtual {p3}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->getLicense()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    invoke-virtual {p3}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->getLicenseStr()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p3

    .line 321
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 322
    .line 323
    .line 324
    move-result v5

    .line 325
    if-nez v5, :cond_c

    .line 326
    .line 327
    sget-object p3, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 328
    .line 329
    invoke-virtual {p3, p0, p2}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;Z)I

    .line 330
    .line 331
    .line 332
    move-result p0

    .line 333
    goto :goto_3

    .line 334
    :catch_0
    move-exception p0

    .line 335
    goto :goto_2

    .line 336
    :cond_c
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 337
    .line 338
    .line 339
    move-result p0

    .line 340
    if-nez p0, :cond_d

    .line 341
    .line 342
    sget-object p0, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 343
    .line 344
    invoke-virtual {p0, p3, v0}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;Z)I

    .line 345
    .line 346
    .line 347
    move-result p0

    .line 348
    goto :goto_3

    .line 349
    :cond_d
    sget-object p0, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 350
    .line 351
    invoke-virtual {p0, v3, p2}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;Z)I

    .line 352
    .line 353
    .line 354
    move-result p0
    :try_end_0
    .catch Lcom/tencent/could/huiyansdk/exception/a; {:try_start_0 .. :try_end_0} :catch_0

    .line 355
    goto :goto_3

    .line 356
    :goto_2
    sget-object p3, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 357
    .line 358
    new-instance v5, Ljava/lang/StringBuilder;

    .line 359
    .line 360
    const-string v6, "init error:"

    .line 361
    .line 362
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    iget-object v6, p0, Lcom/tencent/could/huiyansdk/exception/a;->b:Ljava/lang/String;

    .line 366
    .line 367
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v5

    .line 374
    const-string v6, "HuiYanBaseApi"

    .line 375
    .line 376
    invoke-virtual {p3, v4, v6, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 380
    .line 381
    if-eqz p1, :cond_e

    .line 382
    .line 383
    iget p3, p0, Lcom/tencent/could/huiyansdk/exception/a;->a:I

    .line 384
    .line 385
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/exception/a;->b:Ljava/lang/String;

    .line 386
    .line 387
    invoke-interface {p1, p3, p0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->onFail(ILjava/lang/String;)V

    .line 388
    .line 389
    .line 390
    :cond_e
    const/4 p0, -0x1

    .line 391
    :goto_3
    const-string p1, "InitSDKStage"

    .line 392
    .line 393
    if-eqz p0, :cond_f

    .line 394
    .line 395
    new-instance p2, Ljava/lang/StringBuilder;

    .line 396
    .line 397
    const-string p3, "error code: "

    .line 398
    .line 399
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object p0

    .line 409
    iget-object p2, v1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 410
    .line 411
    if-eqz p2, :cond_15

    .line 412
    .line 413
    const-string p3, "YouTuInitError"

    .line 414
    .line 415
    invoke-interface {p2, p1, p3, p0}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    goto :goto_6

    .line 419
    :cond_f
    iget-object p0, v1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 420
    .line 421
    if-eqz p0, :cond_10

    .line 422
    .line 423
    const-string p3, "YouTuInitSuccess"

    .line 424
    .line 425
    invoke-interface {p0, p1, p3, v3}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    .line 427
    .line 428
    :cond_10
    sget-object p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 429
    .line 430
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 431
    .line 432
    .line 433
    move-result-object p0

    .line 434
    if-nez p0, :cond_11

    .line 435
    .line 436
    const/16 p0, 0xd8

    .line 437
    .line 438
    const-string p1, "please call init() function first!"

    .line 439
    .line 440
    invoke-virtual {v1, p0, p1}, Lcom/tencent/could/huiyansdk/api/j;->a(ILjava/lang/String;)V

    .line 441
    .line 442
    .line 443
    goto :goto_6

    .line 444
    :cond_11
    iget-object p3, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 445
    .line 446
    if-eqz p3, :cond_12

    .line 447
    .line 448
    invoke-virtual {p3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getStartActivityContext()Landroid/content/Context;

    .line 449
    .line 450
    .line 451
    move-result-object p3

    .line 452
    if-eqz p3, :cond_12

    .line 453
    .line 454
    instance-of v4, p3, Landroid/app/Activity;

    .line 455
    .line 456
    if-eqz v4, :cond_12

    .line 457
    .line 458
    move-object p0, p3

    .line 459
    goto :goto_4

    .line 460
    :cond_12
    move p2, v0

    .line 461
    :goto_4
    iget-object p3, v1, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 462
    .line 463
    invoke-virtual {p3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLandMode()Z

    .line 464
    .line 465
    .line 466
    move-result p3

    .line 467
    if-eqz p3, :cond_13

    .line 468
    .line 469
    new-instance p3, Landroid/content/Intent;

    .line 470
    .line 471
    const-class v4, Lcom/tencent/could/huiyansdk/activitys/LandMainAuthActivity;

    .line 472
    .line 473
    invoke-direct {p3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 474
    .line 475
    .line 476
    goto :goto_5

    .line 477
    :cond_13
    new-instance p3, Landroid/content/Intent;

    .line 478
    .line 479
    const-class v4, Lcom/tencent/could/huiyansdk/activitys/MainAuthActivity;

    .line 480
    .line 481
    invoke-direct {p3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 482
    .line 483
    .line 484
    :goto_5
    sget-object v4, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 485
    .line 486
    new-instance v5, Ljava/lang/StringBuilder;

    .line 487
    .line 488
    const-string v6, "useAppContext: "

    .line 489
    .line 490
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 494
    .line 495
    .line 496
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object v5

    .line 500
    invoke-virtual {v4, v0, v2, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 501
    .line 502
    .line 503
    if-eqz p2, :cond_14

    .line 504
    .line 505
    const/high16 p2, 0x10000000

    .line 506
    .line 507
    invoke-virtual {p3, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 508
    .line 509
    .line 510
    :cond_14
    invoke-virtual {p0, p3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 511
    .line 512
    .line 513
    iget-object p0, v1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 514
    .line 515
    if-eqz p0, :cond_15

    .line 516
    .line 517
    const-string p2, "HuiYanInitSuccess"

    .line 518
    .line 519
    invoke-interface {p0, p1, p2, v3}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 520
    .line 521
    .line 522
    :cond_15
    :goto_6
    return-void
.end method

.method private sendLiveData(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->checkLiveData(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/LiveTypeResult;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "check liveData string error!"

    .line 6
    .line 7
    const/16 v1, 0xdc

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    new-instance p0, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/api/e;->a(Lcom/tencent/could/huiyansdk/entity/CompareResult;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    :try_start_0
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->createLiveResultString(Lcom/tencent/could/huiyansdk/entity/LiveTypeResult;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/api/e;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 35
    .line 36
    const-string p1, "create lightData json error!"

    .line 37
    .line 38
    const/4 v2, 0x2

    .line 39
    const-string v3, "HuiYanOsApiImp"

    .line 40
    .line 41
    invoke-virtual {p0, v2, v3, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/api/e;->a(Lcom/tencent/could/huiyansdk/entity/CompareResult;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public getCurrentToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->currentToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOsConfig()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->osConfig:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 13

    .line 1
    const-string p0, "TuringSdkHelper"

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 4
    .line 5
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, 0x0

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_3

    .line 16
    .line 17
    :cond_0
    new-instance v5, Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-direct {v5, v6}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iput-object v5, v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a:Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    if-nez v5, :cond_1

    .line 33
    .line 34
    move v5, v4

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    sget-object v6, Lcom/tencent/could/huiyansdk/utils/f;->b:[Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v5, v6}, Lcom/tencent/could/huiyansdk/utils/f;->a(Landroid/content/Context;[Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    :goto_0
    iput-boolean v5, v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->d:Z

    .line 43
    .line 44
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/e$a;->a:Lcom/tencent/could/huiyansdk/utils/e;

    .line 45
    .line 46
    iget-boolean v5, v0, Lcom/tencent/could/huiyansdk/utils/e;->b:Z

    .line 47
    .line 48
    if-eqz v5, :cond_2

    .line 49
    .line 50
    goto/16 :goto_2

    .line 51
    .line 52
    :cond_2
    iput-boolean v3, v0, Lcom/tencent/could/huiyansdk/utils/e;->b:Z

    .line 53
    .line 54
    invoke-virtual {p1, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v5, "log"

    .line 59
    .line 60
    const-string v6, "cloud-huiyan"

    .line 61
    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    new-instance v7, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    goto :goto_1

    .line 91
    :cond_3
    const-string v0, ""

    .line 92
    .line 93
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v7

    .line 97
    if-eqz v7, :cond_4

    .line 98
    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    :cond_4
    new-instance v5, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;

    .line 130
    .line 131
    invoke-direct {v5}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v5, v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->setDirLog(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0, v3}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->setLogCat(Z)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-string v5, "huiyan-log"

    .line 143
    .line 144
    invoke-virtual {v0, v5}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->setLogName(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const/4 v5, 0x3

    .line 149
    invoke-virtual {v0, v5}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->setMinLevel(I)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    const-string v5, "[hy-sdk-log]"

    .line 154
    .line 155
    invoke-virtual {v0, v5}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->setDefaultTag(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0, v3}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->setOpen(Z)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    const-wide/32 v5, 0xf731400

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v5, v6}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->setFileOutTime(J)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->create()Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    new-instance v5, Lcom/tencent/could/component/common/ai/log/AiLogger;

    .line 175
    .line 176
    invoke-direct {v5, p1, v0}, Lcom/tencent/could/component/common/ai/log/AiLogger;-><init>(Landroid/content/Context;Lcom/tencent/could/component/common/ai/log/AiLogConfig;)V

    .line 177
    .line 178
    .line 179
    invoke-static {v5}, Lcom/tencent/could/component/common/ai/log/AiLog;->init(Lcom/tencent/could/component/common/ai/log/AiLogger;)V

    .line 180
    .line 181
    .line 182
    :goto_2
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 183
    .line 184
    const-string v5, "HuiYanBaseApi"

    .line 185
    .line 186
    const-string v6, "call huiyan init"

    .line 187
    .line 188
    invoke-virtual {v0, v3, v5, v6}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    sget-object v0, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 192
    .line 193
    const-string v5, "v1.0.8.16"

    .line 194
    .line 195
    iput-object v5, v0, Lcom/tencent/could/huiyansdk/common/a;->c:Ljava/lang/String;

    .line 196
    .line 197
    const-string v0, "YTLiveness"

    .line 198
    .line 199
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    :goto_3
    sget-object v5, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 203
    .line 204
    const/4 v6, 0x2

    .line 205
    :try_start_0
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;

    .line 206
    .line 207
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;-><init>()V

    .line 208
    .line 209
    .line 210
    iput-object v0, v5, Lcom/tencent/could/huiyansdk/turing/f;->f:Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;

    .line 211
    .line 212
    invoke-virtual {v5}, Lcom/tencent/could/huiyansdk/turing/f;->c()V

    .line 213
    .line 214
    .line 215
    iput-boolean v4, v5, Lcom/tencent/could/huiyansdk/turing/f;->b:Z

    .line 216
    .line 217
    iget-object v0, v5, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 218
    .line 219
    check-cast v0, Lcom/tencent/could/huiyansdk/turing/EmptyTuringHelper;

    .line 220
    .line 221
    if-eqz v0, :cond_5

    .line 222
    .line 223
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    .line 225
    const-string v7, "call turing interface init finish"

    .line 226
    .line 227
    :try_start_1
    invoke-virtual {v0, v3, p0, v7}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    goto :goto_5

    .line 231
    :catch_0
    move-exception v0

    .line 232
    goto :goto_4

    .line 233
    :catch_1
    move-exception v0

    .line 234
    goto :goto_4

    .line 235
    :catch_2
    move-exception v0

    .line 236
    goto :goto_4

    .line 237
    :cond_5
    throw v2
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    .line 238
    :goto_4
    sget-object v3, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 239
    .line 240
    new-instance v7, Ljava/lang/StringBuilder;

    .line 241
    .line 242
    const-string v8, "create and init turing help error "

    .line 243
    .line 244
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v3, v6, p0, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    iput-object v2, v5, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 262
    .line 263
    iput-boolean v4, v5, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 264
    .line 265
    iput-boolean v4, v5, Lcom/tencent/could/huiyansdk/turing/f;->c:Z

    .line 266
    .line 267
    :goto_5
    invoke-static {}, Lcom/tencent/could/component/common/ai/utils/CloudCrashHandler;->instance()Lcom/tencent/could/component/common/ai/utils/CloudCrashHandler;

    .line 268
    .line 269
    .line 270
    move-result-object v7

    .line 271
    const-string v11, "com.tencent.could"

    .line 272
    .line 273
    const/4 v12, 0x0

    .line 274
    const-string v9, "huiyan"

    .line 275
    .line 276
    const/4 v10, 0x1

    .line 277
    move-object v8, p1

    .line 278
    invoke-virtual/range {v7 .. v12}, Lcom/tencent/could/component/common/ai/utils/CloudCrashHandler;->init(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;Z)V

    .line 279
    .line 280
    .line 281
    invoke-static {}, Lcom/tencent/could/component/common/ai/utils/CloudCrashHandler;->instance()Lcom/tencent/could/component/common/ai/utils/CloudCrashHandler;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    new-instance p1, Lcom/tencent/could/huiyansdk/api/h;

    .line 286
    .line 287
    invoke-direct {p1, v1}, Lcom/tencent/could/huiyansdk/api/h;-><init>(Lcom/tencent/could/huiyansdk/api/j;)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {p0, p1}, Lcom/tencent/could/component/common/ai/utils/CloudCrashHandler;->addCrashListener(Lcom/tencent/could/component/common/ai/callback/CrashListener;)V

    .line 291
    .line 292
    .line 293
    sget-object p0, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 294
    .line 295
    const-string p1, "v1.0.9.36"

    .line 296
    .line 297
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/common/a;->c:Ljava/lang/String;

    .line 298
    .line 299
    sget-object p0, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 300
    .line 301
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 302
    .line 303
    .line 304
    new-instance v0, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 305
    .line 306
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;-><init>()V

    .line 307
    .line 308
    .line 309
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 310
    .line 311
    invoke-static {}, Lcom/tencent/could/component/common/ai/eventreport/utils/DeviceInfoUtil;->getDeviceModel()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setDeviceModel(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 319
    .line 320
    new-instance v1, Ljava/lang/StringBuilder;

    .line 321
    .line 322
    const-string v2, "android-"

    .line 323
    .line 324
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 328
    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setOsVersion(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 340
    .line 341
    const-string v1, "HuiYanSDK_Overseas"

    .line 342
    .line 343
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setSdkName(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 347
    .line 348
    invoke-virtual {v0, p1}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setSdkVersion(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 352
    .line 353
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 354
    .line 355
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 356
    .line 357
    .line 358
    sget-object v0, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 359
    .line 360
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 361
    .line 362
    .line 363
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    invoke-virtual {p1, v0}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setYouTuVersion(Ljava/lang/String;)V

    .line 372
    .line 373
    .line 374
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 375
    .line 376
    sget-object v0, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 377
    .line 378
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/turing/f;->a()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    invoke-virtual {p1, v0}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setTuringVersion(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 386
    .line 387
    invoke-static {v8}, Lcom/tencent/could/component/common/ai/eventreport/utils/DeviceInfoUtil;->getDeviceUuid(Landroid/content/Context;)Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    invoke-virtual {p1, v0}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setDeviceToken(Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 395
    .line 396
    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    invoke-virtual {p1, v0}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setPackageName(Ljava/lang/String;)V

    .line 401
    .line 402
    .line 403
    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 408
    .line 409
    invoke-virtual {v0, p1}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setPackageName(Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    :try_start_2
    invoke-virtual {v0, p1, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 417
    .line 418
    .line 419
    move-result-object p1

    .line 420
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 421
    .line 422
    iget-object p1, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 423
    .line 424
    invoke-virtual {v0, p1}, Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;->setPackageVersion(Ljava/lang/String;)V
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_3

    .line 425
    .line 426
    .line 427
    goto :goto_6

    .line 428
    :catch_3
    move-exception v0

    .line 429
    move-object p1, v0

    .line 430
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 431
    .line 432
    new-instance v1, Ljava/lang/StringBuilder;

    .line 433
    .line 434
    const-string v2, "get package info error: "

    .line 435
    .line 436
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object p1

    .line 443
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object p1

    .line 450
    const-string v1, "OperateInfoManager"

    .line 451
    .line 452
    invoke-virtual {v0, v6, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 453
    .line 454
    .line 455
    :goto_6
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/operate/a;->a()V

    .line 456
    .line 457
    .line 458
    return-void
.end method

.method public isNeedCleanListener()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->isNeedCleanListener:Z

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 7

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iput-object v2, v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/e$a;->a:Lcom/tencent/could/huiyansdk/utils/e;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-boolean v1, v0, Lcom/tencent/could/huiyansdk/utils/e;->b:Z

    .line 16
    .line 17
    invoke-static {}, Lcom/tencent/could/component/common/ai/log/AiLog;->release()V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 21
    .line 22
    iget-object v3, v0, Lcom/tencent/could/huiyansdk/manager/e;->b:Ljava/lang/Object;

    .line 23
    .line 24
    monitor-enter v3

    .line 25
    :try_start_0
    const-string v4, "LoggerManager"

    .line 26
    .line 27
    const-string v5, "release"

    .line 28
    .line 29
    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    iput-object v2, v0, Lcom/tencent/could/huiyansdk/manager/e;->c:Lcom/tencent/could/huiyansdk/callback/LoggerInfoCallBack;

    .line 33
    .line 34
    sget-object v4, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 35
    .line 36
    iput-boolean v1, v4, Lcom/tencent/could/huiyansdk/common/a;->f:Z

    .line 37
    .line 38
    iget-object v4, v0, Lcom/tencent/could/huiyansdk/manager/e;->a:Ljava/util/Map;

    .line 39
    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    invoke-interface {v4}, Ljava/util/Map;->clear()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_3

    .line 48
    :cond_1
    :goto_0
    iget-object v4, v0, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    .line 49
    .line 50
    if-nez v4, :cond_2

    .line 51
    .line 52
    monitor-exit v3

    .line 53
    goto :goto_1

    .line 54
    :cond_2
    iget-object v4, v0, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    .line 55
    .line 56
    invoke-virtual {v4, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    iput-object v2, v0, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    .line 60
    .line 61
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    :goto_1
    sget-object v3, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 63
    .line 64
    const-string v4, "TuringSdkHelper"

    .line 65
    .line 66
    const-string v5, "call release."

    .line 67
    .line 68
    const/4 v6, 0x1

    .line 69
    invoke-virtual {v0, v6, v4, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iput-boolean v1, v3, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 73
    .line 74
    iget-object v0, v3, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 75
    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    iget-object v0, v3, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 79
    .line 80
    check-cast v0, Lcom/tencent/could/huiyansdk/turing/EmptyTuringHelper;

    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    iput-object v2, v3, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 86
    .line 87
    :cond_3
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->f:Lcom/tencent/could/huiyansdk/api/f;

    .line 88
    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/api/j;->f:Lcom/tencent/could/huiyansdk/api/f;

    .line 92
    .line 93
    :cond_4
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->a:Lcom/tencent/could/huiyansdk/api/g;

    .line 94
    .line 95
    if-eqz v0, :cond_5

    .line 96
    .line 97
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/api/j;->a:Lcom/tencent/could/huiyansdk/api/g;

    .line 98
    .line 99
    :cond_5
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/api/j;->e:Z

    .line 100
    .line 101
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/n;->a()Lcom/tencent/could/huiyansdk/utils/n;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/utils/n;->b:Landroid/os/Handler;

    .line 106
    .line 107
    if-nez v0, :cond_6

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_6
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/utils/n;->b:Landroid/os/Handler;

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/utils/n;->b:Landroid/os/Handler;

    .line 116
    .line 117
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/utils/n;->a:Landroid/os/HandlerThread;

    .line 118
    .line 119
    if-eqz v0, :cond_7

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_7

    .line 126
    .line 127
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/utils/n;->a:Landroid/os/HandlerThread;

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 130
    .line 131
    .line 132
    :cond_7
    :goto_2
    return-void

    .line 133
    :goto_3
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    throw p0
.end method

.method public setAuthEventCallBack(Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 4
    .line 5
    const-string p1, "error set HuiYanAuthEventCallBack is null!"

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    const-string v1, "HuiYanOsApiImp"

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->huiYanAuthEventCallBack:Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;

    .line 15
    .line 16
    new-instance p1, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$5;-><init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)V

    .line 19
    .line 20
    .line 21
    sget-object p0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/api/j;->a:Lcom/tencent/could/huiyansdk/api/g;

    .line 24
    .line 25
    return-void
.end method

.method public setCurrentToken(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->currentToken:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setResultDataCallBack(Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->setResultDataCallBack(Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public startAuthByLightData(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/tencent/could/huiyansdk/api/j;->e:Z

    .line 4
    .line 5
    const-string v1, "HuiYanOsApiImp"

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 11
    .line 12
    const-string p1, "current process is stopped\uff01"

    .line 13
    .line 14
    invoke-virtual {p0, v2, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->setResultCallBack(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;)V

    .line 23
    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 28
    .line 29
    const-string p1, "lightData == null"

    .line 30
    .line 31
    invoke-virtual {p0, v2, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 37
    .line 38
    .line 39
    const/16 p1, 0xdb

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 42
    .line 43
    .line 44
    const-string p1, "app stop auth!"

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/api/e;->a(Lcom/tencent/could/huiyansdk/entity/CompareResult;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->sendLiveData(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public startGetAuthConfigData(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->realStartGetAuthConfigData(ZLcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public startHuiYanAuth(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->currentToken:Ljava/lang/String;

    .line 2
    .line 3
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "startHuiYanAuth with: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->currentToken:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x1

    .line 22
    const-string v2, "HuiYanOsApiImp"

    .line 23
    .line 24
    invoke-virtual {p1, v1, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1, p3}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->setAuthCallBack(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;)V

    .line 32
    .line 33
    .line 34
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 35
    .line 36
    new-instance p3, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$3;

    .line 37
    .line 38
    invoke-direct {p3, p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$3;-><init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)V

    .line 39
    .line 40
    .line 41
    iput-object p3, p1, Lcom/tencent/could/huiyansdk/api/j;->h:Lcom/tencent/could/huiyansdk/api/c;

    .line 42
    .line 43
    new-instance p1, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$4;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$4;-><init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0, v1, p2, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->realStartGetAuthConfigData(ZLcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;)V

    .line 49
    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->isNeedCleanListener:Z

    .line 53
    .line 54
    return-void
.end method
