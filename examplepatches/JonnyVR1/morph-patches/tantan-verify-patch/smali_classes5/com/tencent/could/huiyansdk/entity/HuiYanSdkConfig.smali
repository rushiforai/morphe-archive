.class public Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public actions:[Lcom/tencent/could/huiyansdk/enums/HuiYanAction;

.field public authLicense:Ljava/lang/String;

.field public authLicenseStr:Ljava/lang/String;

.field public authTimeOutMs:J

.field public bestImageContinuousFrameNum:I

.field public bestImagePitch:F

.field public bestImageRoll:F

.field public bestImageYaw:F

.field public bigFaceRatioThreshold:F

.field public changePointNum:I

.field public checkEnvRiskTimeout:J

.field public contextWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field public cutVideoDuration:J

.field public delayTimeMsOfLoadFragment:I

.field public disableSystemRecordScreen:Z

.field public encryptMode:Lcom/tencent/could/huiyansdk/enums/HuiYanEncryptMode;

.field public faceOcclusionLevel:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

.field public huiYanLiveMode:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

.field public isAutoScreenBrightness:Z

.field public isBackgroundStopAuth:Z

.field public isCloseEncrypt:Z

.field public isCutRecordVideo:Z

.field public isDeleteVideoCache:Z

.field public isLandMode:Z

.field public isNeedCropBestImageMode:Z

.field public isOpenAngleDetect:Z

.field public isOpenLightReflectAnim:Z

.field public isOpenLog:Z

.field public isOpenLongCheck:Z

.field public isOtherActionCheckMouthOpen:Z

.field public isRecordVideo:Z

.field public isRelaxed:Z

.field public isShowActionTimeout:Z

.field public isShowLongCheckTimeout:Z

.field public isShowPrepareTimeout:Z

.field public isUseBackCamera:Z

.field public isUseBestFaceImage:Z

.field public justCheckRawCamera:Z

.field public landCloseRatio:F

.field public languageCode:Ljava/lang/String;

.field public languageStyle:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

.field public longCheckBestImageQuality:I

.field public longCheckCloseEyeLeftThreshold:F

.field public longCheckCloseEyeRightThreshold:F

.field public longCheckCloseMouthThreshold:F

.field public longCheckFaceMaxHeightThreshold:F

.field public longCheckFaceMinHeightThreshold:F

.field public longCheckFaceRealMinHeightThreshold:F

.field public longCheckNeedBestOriginalSize:I

.field public longCheckTimeOutMs:J

.field public longCheckUseBlurMode:Z

.field public longCheckUseLocalCloseMouthThreshold:Z

.field public mustDiffMinAndMaxFps:Z

.field public openCheckRiskMode:Z

.field public openFullLog:Z

.field public packageTest:Lcom/tencent/could/huiyansdk/enums/PackageTest;

.field public pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

.field public policyDialogResId:I

.field public portraitCloseRatio:F

.field public prepareFaceTimeOutMs:J

.field public showDebugView:Z

.field public showPrivacyPolicyDialog:Z

.field public transitionTime:J

.field public useCustomerModelPath:Ljava/lang/String;

.field public useTransition:Z

.field public waitingUserCompare:Z

.field public zoomLevel:Lcom/tencent/could/aicamare/enums/CameraZoom;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->changePointNum:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isDeleteVideoCache:Z

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authLicense:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authLicenseStr:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->useCustomerModelPath:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/PageColorStyle;->Light:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 19
    .line 20
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 21
    .line 22
    const-wide/16 v2, 0x7530

    .line 23
    .line 24
    iput-wide v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->prepareFaceTimeOutMs:J

    .line 25
    .line 26
    iput-wide v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authTimeOutMs:J

    .line 27
    .line 28
    iput-wide v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckTimeOutMs:J

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCloseEncrypt:Z

    .line 32
    .line 33
    sget-object v3, Lcom/tencent/could/huiyansdk/entity/LanguageStyle;->AUTO:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 34
    .line 35
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->languageStyle:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 36
    .line 37
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->languageCode:Ljava/lang/String;

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isRecordVideo:Z

    .line 40
    .line 41
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCutRecordVideo:Z

    .line 42
    .line 43
    const-wide/16 v3, 0x7d0

    .line 44
    .line 45
    iput-wide v3, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->cutVideoDuration:J

    .line 46
    .line 47
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/PackageTest;->MEDIUM:Lcom/tencent/could/huiyansdk/enums/PackageTest;

    .line 48
    .line 49
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->packageTest:Lcom/tencent/could/huiyansdk/enums/PackageTest;

    .line 50
    .line 51
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isBackgroundStopAuth:Z

    .line 52
    .line 53
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->waitingUserCompare:Z

    .line 54
    .line 55
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->disableSystemRecordScreen:Z

    .line 56
    .line 57
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBackCamera:Z

    .line 58
    .line 59
    const/high16 v1, 0x41f00000    # 30.0f

    .line 60
    .line 61
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageRoll:F

    .line 62
    .line 63
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageYaw:F

    .line 64
    .line 65
    const/high16 v1, 0x42200000    # 40.0f

    .line 66
    .line 67
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImagePitch:F

    .line 68
    .line 69
    const v1, 0x3f4ccccd    # 0.8f

    .line 70
    .line 71
    .line 72
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMaxHeightThreshold:F

    .line 73
    .line 74
    const v3, 0x3f19999a    # 0.6f

    .line 75
    .line 76
    .line 77
    iput v3, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMinHeightThreshold:F

    .line 78
    .line 79
    const/high16 v3, 0x3e800000    # 0.25f

    .line 80
    .line 81
    iput v3, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseMouthThreshold:F

    .line 82
    .line 83
    iput v3, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeRightThreshold:F

    .line 84
    .line 85
    iput v3, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeLeftThreshold:F

    .line 86
    .line 87
    const v3, 0x3ecccccd    # 0.4f

    .line 88
    .line 89
    .line 90
    iput v3, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceRealMinHeightThreshold:F

    .line 91
    .line 92
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isNeedCropBestImageMode:Z

    .line 93
    .line 94
    iput v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckNeedBestOriginalSize:I

    .line 95
    .line 96
    const/16 v3, 0x5a

    .line 97
    .line 98
    iput v3, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckBestImageQuality:I

    .line 99
    .line 100
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bigFaceRatioThreshold:F

    .line 101
    .line 102
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageContinuousFrameNum:I

    .line 103
    .line 104
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;->ACTION_REFLECT_MODE:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 105
    .line 106
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->huiYanLiveMode:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 107
    .line 108
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/HuiYanEncryptMode;->AES:Lcom/tencent/could/huiyansdk/enums/HuiYanEncryptMode;

    .line 109
    .line 110
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->encryptMode:Lcom/tencent/could/huiyansdk/enums/HuiYanEncryptMode;

    .line 111
    .line 112
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLog:Z

    .line 113
    .line 114
    sget-object v1, Lcom/tencent/could/aicamare/enums/CameraZoom;->ZOOM_1X:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 115
    .line 116
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->zoomLevel:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 117
    .line 118
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->mustDiffMinAndMaxFps:Z

    .line 119
    .line 120
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenAngleDetect:Z

    .line 121
    .line 122
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isAutoScreenBrightness:Z

    .line 123
    .line 124
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLongCheck:Z

    .line 125
    .line 126
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBestFaceImage:Z

    .line 127
    .line 128
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLandMode:Z

    .line 129
    .line 130
    const v1, 0x3eb33333    # 0.35f

    .line 131
    .line 132
    .line 133
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->landCloseRatio:F

    .line 134
    .line 135
    const/high16 v1, 0x3f000000    # 0.5f

    .line 136
    .line 137
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->portraitCloseRatio:F

    .line 138
    .line 139
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowPrepareTimeout:Z

    .line 140
    .line 141
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowLongCheckTimeout:Z

    .line 142
    .line 143
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowActionTimeout:Z

    .line 144
    .line 145
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckUseLocalCloseMouthThreshold:Z

    .line 146
    .line 147
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckUseBlurMode:Z

    .line 148
    .line 149
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->openFullLog:Z

    .line 150
    .line 151
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->showDebugView:Z

    .line 152
    .line 153
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->justCheckRawCamera:Z

    .line 154
    .line 155
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLightReflectAnim:Z

    .line 156
    .line 157
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->useTransition:Z

    .line 158
    .line 159
    const-wide/16 v3, 0xbb8

    .line 160
    .line 161
    iput-wide v3, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->transitionTime:J

    .line 162
    .line 163
    iput-wide v3, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->checkEnvRiskTimeout:J

    .line 164
    .line 165
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->openCheckRiskMode:Z

    .line 166
    .line 167
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->showPrivacyPolicyDialog:Z

    .line 168
    .line 169
    const/4 v1, -0x1

    .line 170
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->policyDialogResId:I

    .line 171
    .line 172
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isRelaxed:Z

    .line 173
    .line 174
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOtherActionCheckMouthOpen:Z

    .line 175
    .line 176
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->delayTimeMsOfLoadFragment:I

    .line 177
    .line 178
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;->STRICT:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 179
    .line 180
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->faceOcclusionLevel:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 181
    .line 182
    return-void
.end method


# virtual methods
.method public getActions()[Lcom/tencent/could/huiyansdk/enums/HuiYanAction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->actions:[Lcom/tencent/could/huiyansdk/enums/HuiYanAction;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAuthLicense()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authLicense:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAuthLicenseStr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authLicenseStr:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAuthTimeOutMs()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authTimeOutMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getBestImageContinuousFrameNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageContinuousFrameNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getBestImagePitch()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImagePitch:F

    .line 2
    .line 3
    return p0
.end method

.method public getBestImageRoll()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageRoll:F

    .line 2
    .line 3
    return p0
.end method

.method public getBestImageYaw()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageYaw:F

    .line 2
    .line 3
    return p0
.end method

.method public getBigFaceRatioThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bigFaceRatioThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getChangePointNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->changePointNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getCheckEnvRiskTimeout()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->checkEnvRiskTimeout:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getCutVideoDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->cutVideoDuration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getDelayTimeMsOfLoadFragment()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->delayTimeMsOfLoadFragment:I

    .line 2
    .line 3
    return p0
.end method

.method public getEncryptMode()Lcom/tencent/could/huiyansdk/enums/HuiYanEncryptMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->encryptMode:Lcom/tencent/could/huiyansdk/enums/HuiYanEncryptMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceOcclusionLevel()Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->faceOcclusionLevel:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHuiYanLiveMode()Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->huiYanLiveMode:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLandCloseRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->landCloseRatio:F

    .line 2
    .line 3
    return p0
.end method

.method public getLanguageCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->languageCode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLanguageStyle()Lcom/tencent/could/huiyansdk/entity/LanguageStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->languageStyle:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLongCheckBestImageQuality()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckBestImageQuality:I

    .line 2
    .line 3
    return p0
.end method

.method public getLongCheckCloseEyeLeftThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeLeftThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getLongCheckCloseEyeRightThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeRightThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getLongCheckCloseMouthThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseMouthThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getLongCheckFaceMaxHeightThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMaxHeightThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getLongCheckFaceMinHeightThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMinHeightThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getLongCheckFaceRealMinHeightThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceRealMinHeightThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getLongCheckNeedBestOriginalSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckNeedBestOriginalSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getLongCheckTimeOutMs()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckTimeOutMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPackageTest()Lcom/tencent/could/huiyansdk/enums/PackageTest;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->packageTest:Lcom/tencent/could/huiyansdk/enums/PackageTest;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageColorStyle()Lcom/tencent/could/huiyansdk/enums/PageColorStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPolicyDialogResId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->policyDialogResId:I

    .line 2
    .line 3
    return p0
.end method

.method public getPortraitCloseRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->portraitCloseRatio:F

    .line 2
    .line 3
    return p0
.end method

.method public getPrepareFaceTimeOutMs()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->prepareFaceTimeOutMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getStartActivityContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->contextWeakReference:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/content/Context;

    .line 12
    .line 13
    return-object p0
.end method

.method public getTransitionTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->transitionTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUseCustomerModelPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->useCustomerModelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getZoomLevel()Lcom/tencent/could/aicamare/enums/CameraZoom;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->zoomLevel:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAutoScreenBrightness()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isAutoScreenBrightness:Z

    .line 2
    .line 3
    return p0
.end method

.method public isBackgroundStopAuth()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isBackgroundStopAuth:Z

    .line 2
    .line 3
    return p0
.end method

.method public isCloseEncrypt()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCloseEncrypt:Z

    .line 2
    .line 3
    return p0
.end method

.method public isCutRecordVideo()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCutRecordVideo:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDeleteVideoCache()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isDeleteVideoCache:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDisableSystemRecordScreen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->disableSystemRecordScreen:Z

    .line 2
    .line 3
    return p0
.end method

.method public isJustCheckRawCamera()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->justCheckRawCamera:Z

    .line 2
    .line 3
    return p0
.end method

.method public isLandMode()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLandMode:Z

    .line 2
    .line 3
    return p0
.end method

.method public isLongCheckUseBlurMode()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckUseBlurMode:Z

    .line 2
    .line 3
    return p0
.end method

.method public isLongCheckUseLocalCloseMouthThreshold()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckUseLocalCloseMouthThreshold:Z

    .line 2
    .line 3
    return p0
.end method

.method public isMustDiffMinAndMaxFps()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->mustDiffMinAndMaxFps:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNeedCropBestImageMode()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isNeedCropBestImageMode:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpenAngleDetect()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenAngleDetect:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpenCheckRiskMode()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->openCheckRiskMode:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpenFullLog()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->openFullLog:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpenLightReflectAnim()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLightReflectAnim:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpenLog()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLog:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpenLongCheck()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLongCheck:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOtherActionCheckMouthOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOtherActionCheckMouthOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method public isRecordVideo()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isRecordVideo:Z

    .line 2
    .line 3
    return p0
.end method

.method public isRelaxed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isRelaxed:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowActionTimeout()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowActionTimeout:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowDebugView()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->showDebugView:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowLongCheckTimeout()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowLongCheckTimeout:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowPrepareTimeout()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowPrepareTimeout:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowPrivacyPolicyDialog()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->showPrivacyPolicyDialog:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUseBackCamera()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBackCamera:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUseBestFaceImage()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBestFaceImage:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUseTransition()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->useTransition:Z

    .line 2
    .line 3
    return p0
.end method

.method public isWaitingUserCompare()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->waitingUserCompare:Z

    .line 2
    .line 3
    return p0
.end method

.method public setActions([Lcom/tencent/could/huiyansdk/enums/HuiYanAction;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->actions:[Lcom/tencent/could/huiyansdk/enums/HuiYanAction;

    .line 2
    .line 3
    return-void
.end method

.method public setAuthLicense(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authLicense:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAuthLicenseStr(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authLicenseStr:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAuthTimeOutMs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authTimeOutMs:J

    .line 2
    .line 3
    return-void
.end method

.method public setAutoScreenBrightness(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isAutoScreenBrightness:Z

    .line 2
    .line 3
    return-void
.end method

.method public setBackgroundStopAuth(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isBackgroundStopAuth:Z

    .line 2
    .line 3
    return-void
.end method

.method public setBestImageContinuousFrameNum(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ge p1, v0, :cond_0

    .line 3
    .line 4
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageContinuousFrameNum:I

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/16 v0, 0x1e

    .line 8
    .line 9
    if-le p1, v0, :cond_1

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageContinuousFrameNum:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageContinuousFrameNum:I

    .line 15
    .line 16
    return-void
.end method

.method public setBestImagePitch(F)V
    .locals 2

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    cmpg-float v1, p1, v0

    .line 4
    .line 5
    if-gez v1, :cond_0

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImagePitch:F

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/high16 v0, 0x42200000    # 40.0f

    .line 11
    .line 12
    cmpl-float v1, p1, v0

    .line 13
    .line 14
    if-lez v1, :cond_1

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImagePitch:F

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImagePitch:F

    .line 20
    .line 21
    return-void
.end method

.method public setBestImageRoll(F)V
    .locals 2

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    cmpg-float v1, p1, v0

    .line 4
    .line 5
    if-gez v1, :cond_0

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageRoll:F

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/high16 v0, 0x41f00000    # 30.0f

    .line 11
    .line 12
    cmpl-float v1, p1, v0

    .line 13
    .line 14
    if-lez v1, :cond_1

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageRoll:F

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageRoll:F

    .line 20
    .line 21
    return-void
.end method

.method public setBestImageYaw(F)V
    .locals 2

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    cmpg-float v1, p1, v0

    .line 4
    .line 5
    if-gez v1, :cond_0

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageYaw:F

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/high16 v0, 0x41f00000    # 30.0f

    .line 11
    .line 12
    cmpl-float v1, p1, v0

    .line 13
    .line 14
    if-lez v1, :cond_1

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageYaw:F

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageYaw:F

    .line 20
    .line 21
    return-void
.end method

.method public setBigFaceRatioThreshold(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bigFaceRatioThreshold:F

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpl-float v1, p1, v0

    .line 12
    .line 13
    if-lez v1, :cond_1

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bigFaceRatioThreshold:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bigFaceRatioThreshold:F

    .line 19
    .line 20
    return-void
.end method

.method public setChangePointNum(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->changePointNum:I

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v1, 0x8

    .line 16
    .line 17
    if-le v0, v1, :cond_1

    .line 18
    .line 19
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->changePointNum:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->changePointNum:I

    .line 27
    .line 28
    return-void
.end method

.method public setCheckEnvRiskTimeout(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->checkEnvRiskTimeout:J

    .line 2
    .line 3
    return-void
.end method

.method public setCloseEncrypt(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCloseEncrypt:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCutRecordVideo(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCutRecordVideo:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCutVideoDuration(J)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x7d0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-gez v2, :cond_0

    .line 6
    .line 7
    iput-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->cutVideoDuration:J

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-wide/16 v0, 0x1770

    .line 11
    .line 12
    cmp-long v2, p1, v0

    .line 13
    .line 14
    if-lez v2, :cond_1

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->cutVideoDuration:J

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->cutVideoDuration:J

    .line 20
    .line 21
    return-void
.end method

.method public setDelayTimeMsOfLoadFragment(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->delayTimeMsOfLoadFragment:I

    .line 2
    .line 3
    return-void
.end method

.method public setDeleteVideoCache(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isDeleteVideoCache:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDisableSystemRecordScreen(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->disableSystemRecordScreen:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEncryptMode(Lcom/tencent/could/huiyansdk/enums/HuiYanEncryptMode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->encryptMode:Lcom/tencent/could/huiyansdk/enums/HuiYanEncryptMode;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceOcclusionLevel(Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->faceOcclusionLevel:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 2
    .line 3
    return-void
.end method

.method public setHuiYanLiveMode(Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->huiYanLiveMode:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 2
    .line 3
    return-void
.end method

.method public setJustCheckRawCamera(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->justCheckRawCamera:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLandCloseRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->landCloseRatio:F

    .line 2
    .line 3
    return-void
.end method

.method public setLandMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLandMode:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLanguageCode(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->languageCode:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLanguageStyle(Lcom/tencent/could/huiyansdk/entity/LanguageStyle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->languageStyle:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 2
    .line 3
    return-void
.end method

.method public setLongCheckBestImageQuality(I)V
    .locals 1

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckBestImageQuality:I

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/16 v0, 0x64

    .line 8
    .line 9
    if-le p1, v0, :cond_1

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckBestImageQuality:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckBestImageQuality:I

    .line 15
    .line 16
    return-void
.end method

.method public setLongCheckCloseEyeLeftThreshold(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeLeftThreshold:F

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpl-float v1, p1, v0

    .line 12
    .line 13
    if-lez v1, :cond_1

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeLeftThreshold:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeLeftThreshold:F

    .line 19
    .line 20
    return-void
.end method

.method public setLongCheckCloseEyeRightThreshold(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeRightThreshold:F

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpl-float v1, p1, v0

    .line 12
    .line 13
    if-lez v1, :cond_1

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeRightThreshold:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeRightThreshold:F

    .line 19
    .line 20
    return-void
.end method

.method public setLongCheckCloseMouthThreshold(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseMouthThreshold:F

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpl-float v1, p1, v0

    .line 12
    .line 13
    if-lez v1, :cond_1

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseMouthThreshold:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseMouthThreshold:F

    .line 19
    .line 20
    return-void
.end method

.method public setLongCheckFaceMaxHeightThreshold(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMaxHeightThreshold:F

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpl-float v1, p1, v0

    .line 12
    .line 13
    if-lez v1, :cond_1

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMaxHeightThreshold:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMaxHeightThreshold:F

    .line 19
    .line 20
    return-void
.end method

.method public setLongCheckFaceMinHeightThreshold(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMinHeightThreshold:F

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpl-float v1, p1, v0

    .line 12
    .line 13
    if-lez v1, :cond_1

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMinHeightThreshold:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMinHeightThreshold:F

    .line 19
    .line 20
    return-void
.end method

.method public setLongCheckFaceRealMinHeightThreshold(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceRealMinHeightThreshold:F

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpl-float v1, p1, v0

    .line 12
    .line 13
    if-lez v1, :cond_1

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceRealMinHeightThreshold:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceRealMinHeightThreshold:F

    .line 19
    .line 20
    return-void
.end method

.method public setLongCheckNeedBestOriginalSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckNeedBestOriginalSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setLongCheckTimeOutMs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckTimeOutMs:J

    .line 2
    .line 3
    return-void
.end method

.method public setLongCheckUseBlurMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckUseBlurMode:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLongCheckUseLocalCloseMouthThreshold(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckUseLocalCloseMouthThreshold:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMustDiffMinAndMaxFps(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->mustDiffMinAndMaxFps:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNeedCropBestImageMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isNeedCropBestImageMode:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOpenAngleDetect(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenAngleDetect:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOpenCheckRiskMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->openCheckRiskMode:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOpenFullLog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->openFullLog:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOpenLightReflectAnim(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLightReflectAnim:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOpenLog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLog:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOpenLongCheck(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLongCheck:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOtherActionCheckMouthOpen(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOtherActionCheckMouthOpen:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPackageTest(Lcom/tencent/could/huiyansdk/enums/PackageTest;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->packageTest:Lcom/tencent/could/huiyansdk/enums/PackageTest;

    .line 2
    .line 3
    return-void
.end method

.method public setPageColorStyle(Lcom/tencent/could/huiyansdk/enums/PageColorStyle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 2
    .line 3
    return-void
.end method

.method public setPolicyDialogResId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->policyDialogResId:I

    .line 2
    .line 3
    return-void
.end method

.method public setPortraitCloseRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->portraitCloseRatio:F

    .line 2
    .line 3
    return-void
.end method

.method public setPrepareFaceTimeOutMs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->prepareFaceTimeOutMs:J

    .line 2
    .line 3
    return-void
.end method

.method public setRecordVideo(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isRecordVideo:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRelaxed(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isRelaxed:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShowActionTimeout(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowActionTimeout:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShowDebugView(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->showDebugView:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShowLongCheckTimeout(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowLongCheckTimeout:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShowPrepareTimeout(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowPrepareTimeout:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShowPrivacyPolicyDialog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->showPrivacyPolicyDialog:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSmallFaceRatioThreshold(F)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLandMode:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setLandCloseRatio(F)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->setPortraitCloseRatio(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setStartActivityContext(Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->contextWeakReference:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method

.method public setTransitionTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->transitionTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setUseBackCamera(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBackCamera:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUseBestFaceImage(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBestFaceImage:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUseCustomerModelPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->useCustomerModelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUseTransition(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->useTransition:Z

    .line 2
    .line 3
    return-void
.end method

.method public setWaitingUserCompare(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->waitingUserCompare:Z

    .line 2
    .line 3
    return-void
.end method

.method public setZoomLevel(Lcom/tencent/could/aicamare/enums/CameraZoom;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->zoomLevel:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "HuiYanSdkConfig{ changePointNum=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->changePointNum:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", isDeleteVideoCache="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isDeleteVideoCache:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", authLicense=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authLicense:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', useCustomerModelPath=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->useCustomerModelPath:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', pageColorStyle="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", prepareFaceTimeOutMs="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-wide v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->prepareFaceTimeOutMs:J

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", authTimeOutMs="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-wide v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->authTimeOutMs:J

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", isCloseEncrypt="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCloseEncrypt:Z

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", languageStyle="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->languageStyle:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", languageCode=\'"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->languageCode:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "\', isRecordVideo="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isRecordVideo:Z

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", isCutRecordVideo="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCutRecordVideo:Z

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ", packageTest="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->packageTest:Lcom/tencent/could/huiyansdk/enums/PackageTest;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, ", isBackgroundStopAuth="

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isBackgroundStopAuth:Z

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, ", waitingUserCompare="

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->waitingUserCompare:Z

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, ", disableSystemRecordScreen="

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->disableSystemRecordScreen:Z

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, ", isUseBackCamera="

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBackCamera:Z

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, ", bestImageRoll="

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageRoll:F

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, ", bestImageYaw="

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageYaw:F

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v1, ", bestImagePitch="

    .line 194
    .line 195
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImagePitch:F

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v1, ", bestImageContinuousFrameNum="

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bestImageContinuousFrameNum:I

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string v1, ", huiYanLiveMode="

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->huiYanLiveMode:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 219
    .line 220
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v1, ", encryptMode="

    .line 224
    .line 225
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->encryptMode:Lcom/tencent/could/huiyansdk/enums/HuiYanEncryptMode;

    .line 229
    .line 230
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v1, ", isOpenAngleDetect="

    .line 234
    .line 235
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenAngleDetect:Z

    .line 239
    .line 240
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v1, ", isAutoScreenBrightness="

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isAutoScreenBrightness:Z

    .line 249
    .line 250
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    const-string v1, ", isOpenLongCheck="

    .line 254
    .line 255
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLongCheck:Z

    .line 259
    .line 260
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v1, ", longCheckTimeOutMs="

    .line 264
    .line 265
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    iget-wide v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckTimeOutMs:J

    .line 269
    .line 270
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    const-string v1, ", longCheckFaceMaxHeightThreshold="

    .line 274
    .line 275
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMaxHeightThreshold:F

    .line 279
    .line 280
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v1, ", longCheckFaceMinHeightThreshold="

    .line 284
    .line 285
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckFaceMinHeightThreshold:F

    .line 289
    .line 290
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    const-string v1, ", longCheckCloseMouthThreshold="

    .line 294
    .line 295
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseMouthThreshold:F

    .line 299
    .line 300
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    const-string v1, ", longCheckCloseEyeRightThreshold="

    .line 304
    .line 305
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeRightThreshold:F

    .line 309
    .line 310
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    const-string v1, ", longCheckCloseEyeLeftThreshold="

    .line 314
    .line 315
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->longCheckCloseEyeLeftThreshold:F

    .line 319
    .line 320
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    const-string v1, ", bigFaceRatioThreshold="

    .line 324
    .line 325
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->bigFaceRatioThreshold:F

    .line 329
    .line 330
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    const-string v1, ", actions="

    .line 334
    .line 335
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->actions:[Lcom/tencent/could/huiyansdk/enums/HuiYanAction;

    .line 339
    .line 340
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    const/16 p0, 0x7d

    .line 348
    .line 349
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    return-object p0
.end method
