.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final LONG_CHECK_OVERSEAS_DEFAULT_TIME_OUT:J = 0x7530L

.field public static final TAG:Ljava/lang/String; = "HuiYanOsConfig"


# instance fields
.field public authLicense:Ljava/lang/String;

.field public authTimeOutMs:J

.field public authUiConfig:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

.field public backUpHost:Ljava/lang/String;

.field public backUpIPs:[Ljava/lang/String;

.field public bigFaceRatioThreshold:F

.field public contextWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field public delayTimeMsOfLoadFragment:I

.field public disableSystemRecordScreen:Z

.field public faceAngleValidation:Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;

.field public faceOcclusionLevel:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

.field public isDeleteVideoCache:Z

.field public isOpenBOTCheck:Z

.field public isOpenFullLog:Z

.field public isOpenLog:Z

.field public isOtherActionCheckMouthOpen:Z

.field public isShowGuidePage:Z

.field public isUseBackCamera:Z

.field public languageCode:Ljava/lang/String;

.field public languageStyle:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

.field public longCheckTimeOutMs:J

.field public pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

.field public showPrivacyPolicyDialog:Z

.field public smallFaceRatioThreshold:F

.field public zoomLevel:Lcom/tencent/could/aicamare/enums/CameraZoom;


# direct methods
.method public constructor <init>()V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isDeleteVideoCache:Z

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->authLicense:Ljava/lang/String;

    .line 10
    .line 11
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/PageColorStyle;->Light:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 12
    .line 13
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 14
    .line 15
    const-wide/16 v2, 0x7530

    .line 16
    .line 17
    iput-wide v2, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->authTimeOutMs:J

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isShowGuidePage:Z

    .line 20
    .line 21
    sget-object v4, Lcom/tencent/could/huiyansdk/entity/LanguageStyle;->AUTO:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 22
    .line 23
    iput-object v4, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->languageStyle:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->languageCode:Ljava/lang/String;

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenLog:Z

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    iput-boolean v4, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenFullLog:Z

    .line 31
    .line 32
    const-string v5, "116.128.171.41"

    .line 33
    .line 34
    const-string v6, "112.65.195.52"

    .line 35
    .line 36
    const-string v7, "101.91.40.22"

    .line 37
    .line 38
    filled-new-array {v7, v5, v6}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    iput-object v5, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->backUpIPs:[Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->backUpHost:Ljava/lang/String;

    .line 45
    .line 46
    iput-boolean v4, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isUseBackCamera:Z

    .line 47
    .line 48
    const/high16 v1, 0x3f000000    # 0.5f

    .line 49
    .line 50
    iput v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->smallFaceRatioThreshold:F

    .line 51
    .line 52
    const v1, 0x3f4ccccd    # 0.8f

    .line 53
    .line 54
    .line 55
    iput v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->bigFaceRatioThreshold:F

    .line 56
    .line 57
    sget-object v1, Lcom/tencent/could/aicamare/enums/CameraZoom;->ZOOM_1X:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 58
    .line 59
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->zoomLevel:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 60
    .line 61
    iput-boolean v4, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenBOTCheck:Z

    .line 62
    .line 63
    iput-wide v2, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->longCheckTimeOutMs:J

    .line 64
    .line 65
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->showPrivacyPolicyDialog:Z

    .line 66
    .line 67
    iput-boolean v4, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->disableSystemRecordScreen:Z

    .line 68
    .line 69
    iput-boolean v4, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOtherActionCheckMouthOpen:Z

    .line 70
    .line 71
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;->LevelLoose:Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;

    .line 72
    .line 73
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->faceAngleValidation:Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;

    .line 74
    .line 75
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;->STRICT:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 76
    .line 77
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->faceOcclusionLevel:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 78
    .line 79
    iput v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->delayTimeMsOfLoadFragment:I

    .line 80
    .line 81
    return-void
.end method


# virtual methods
.method public getAuthLicense()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->authLicense:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAuthTimeOutMs()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->authTimeOutMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getAuthUiConfig()Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->authUiConfig:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackUpHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->backUpHost:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackUpIPs()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->backUpIPs:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBigFaceRatioThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->bigFaceRatioThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getDelayTimeMsOfLoadFragment()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->delayTimeMsOfLoadFragment:I

    .line 2
    .line 3
    return p0
.end method

.method public getFaceAngleValidation()Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->faceAngleValidation:Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceOcclusionLevel()Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->faceOcclusionLevel:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLanguageCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->languageCode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLanguageStyle()Lcom/tencent/could/huiyansdk/entity/LanguageStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->languageStyle:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLongCheckTimeOutMs()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->longCheckTimeOutMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPageColorStyle()Lcom/tencent/could/huiyansdk/enums/PageColorStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSmallFaceRatioThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->smallFaceRatioThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getStartActivityContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->contextWeakReference:Ljava/lang/ref/WeakReference;

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

.method public getZoomLevel()Lcom/tencent/could/aicamare/enums/CameraZoom;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->zoomLevel:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 2
    .line 3
    return-object p0
.end method

.method public isDeleteVideoCache()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isDeleteVideoCache:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDisableSystemRecordScreen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->disableSystemRecordScreen:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpenBOTCheck()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenBOTCheck:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpenFullLog()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenFullLog:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpenLog()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenLog:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOtherActionCheckMouthOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOtherActionCheckMouthOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowGuidePage()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isShowGuidePage:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowPrivacyPolicyDialog()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->showPrivacyPolicyDialog:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUseBackCamera()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isUseBackCamera:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAuthLicense(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->authLicense:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAuthTimeOutMs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->authTimeOutMs:J

    .line 2
    .line 3
    return-void
.end method

.method public setAuthUiConfig(Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->authUiConfig:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 2
    .line 3
    return-void
.end method

.method public setBackUpHost(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->backUpHost:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setBackUpIPs([Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->backUpIPs:[Ljava/lang/String;

    .line 2
    .line 3
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
    iput v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->bigFaceRatioThreshold:F

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
    iput v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->bigFaceRatioThreshold:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->bigFaceRatioThreshold:F

    .line 19
    .line 20
    return-void
.end method

.method public setDelayTimeMsOfLoadFragment(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->delayTimeMsOfLoadFragment:I

    .line 2
    .line 3
    return-void
.end method

.method public setDeleteVideoCache(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isDeleteVideoCache:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDisableSystemRecordScreen(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->disableSystemRecordScreen:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFaceAngleValidation(Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->faceAngleValidation:Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceOcclusionLevel(Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->faceOcclusionLevel:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 2
    .line 3
    return-void
.end method

.method public setLanguageCode(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->languageCode:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLanguageStyle(Lcom/tencent/could/huiyansdk/entity/LanguageStyle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->languageStyle:Lcom/tencent/could/huiyansdk/entity/LanguageStyle;

    .line 2
    .line 3
    return-void
.end method

.method public setLongCheckTimeOutMs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->longCheckTimeOutMs:J

    .line 2
    .line 3
    return-void
.end method

.method public setOpenBOTCheck(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenBOTCheck:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOpenFullLog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenFullLog:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOpenLog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenLog:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOtherActionCheckMouthOpen(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOtherActionCheckMouthOpen:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPageColorStyle(Lcom/tencent/could/huiyansdk/enums/PageColorStyle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 2
    .line 3
    return-void
.end method

.method public setShowGuidePage(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isShowGuidePage:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShowPrivacyPolicyDialog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->showPrivacyPolicyDialog:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSmallFaceRatioThreshold(F)V
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
    iput v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->smallFaceRatioThreshold:F

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
    iput v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->smallFaceRatioThreshold:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->smallFaceRatioThreshold:F

    .line 19
    .line 20
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
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->contextWeakReference:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method

.method public setUseBackCamera(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isUseBackCamera:Z

    .line 2
    .line 3
    return-void
.end method

.method public setZoomLevel(Lcom/tencent/could/aicamare/enums/CameraZoom;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->zoomLevel:Lcom/tencent/could/aicamare/enums/CameraZoom;

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
    const-string v1, "HuiYanOsConfig{isDeleteVideoCache="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isDeleteVideoCache:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", authTimeOutMs="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->authTimeOutMs:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", isShowGuidePage="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isShowGuidePage:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", isUseBackCamera="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isUseBackCamera:Z

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", smallFaceRatioThreshold="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->smallFaceRatioThreshold:F

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", bigFaceRatioThreshold="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->bigFaceRatioThreshold:F

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", isOpenBOTCheck="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenBOTCheck:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", longCheckTimeOutMs="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-wide v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->longCheckTimeOutMs:J

    .line 79
    .line 80
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", showPrivacyPolicyDialog="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->showPrivacyPolicyDialog:Z

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", disableSystemRecordScreen="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->disableSystemRecordScreen:Z

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", isOtherActionCheckMouthOpen="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOtherActionCheckMouthOpen:Z

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", faceAngleValidation="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->faceAngleValidation:Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ", faceOcclusionLevel="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->faceOcclusionLevel:Lcom/tencent/could/huiyansdk/enums/FaceOcclusionLevel;

    .line 129
    .line 130
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const/16 p0, 0x7d

    .line 134
    .line 135
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0
.end method
