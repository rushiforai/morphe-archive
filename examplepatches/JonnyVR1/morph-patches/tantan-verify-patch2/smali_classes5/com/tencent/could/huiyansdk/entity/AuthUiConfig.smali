.class public Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public authCircleCorrectColor:I

.field public authCircleErrorColor:I

.field public authLayoutBgColor:I

.field public authLayoutResId:I

.field public authWithLongCheck720LayoutResId:I

.field public cancelTxtColor:I

.field public countDownTxtColor:I

.field public feedBackErrorColor:I

.field public feedBackExtraTipColor:I

.field public feedBackTxtColor:I

.field public isHideAvatarGuideFrame:Z

.field public isHideFrontCircleViewOnCheck:Z

.field public isHideFrontCircleViewOnReflect:Z

.field public isHideFrontCircleViewOnStart:Z

.field public isShowCountdown:Z

.field public isShowErrorDialog:Z

.field public isTransparentStatusBar:Z

.field public landAuthLayoutResId:I

.field public loadingStageBgColor:I

.field public loadingStageTipsColor:I

.field public mainActivityThemeId:I

.field public statusBarColor:I

.field public transparentStatusBarMoveHeight:I

.field public useDeepColorStatusBarIcon:Z

.field public videoSize:Lcom/tencent/could/huiyansdk/enums/VideoSize;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/VideoSize;->SIZE_480P:Lcom/tencent/could/huiyansdk/enums/VideoSize;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->videoSize:Lcom/tencent/could/huiyansdk/enums/VideoSize;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isShowCountdown:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isShowErrorDialog:Z

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authLayoutResId:I

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->landAuthLayoutResId:I

    .line 17
    .line 18
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authWithLongCheck720LayoutResId:I

    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->feedBackErrorColor:I

    .line 21
    .line 22
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->feedBackExtraTipColor:I

    .line 23
    .line 24
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->feedBackTxtColor:I

    .line 25
    .line 26
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authCircleErrorColor:I

    .line 27
    .line 28
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authCircleCorrectColor:I

    .line 29
    .line 30
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authLayoutBgColor:I

    .line 31
    .line 32
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->loadingStageBgColor:I

    .line 33
    .line 34
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->loadingStageTipsColor:I

    .line 35
    .line 36
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->mainActivityThemeId:I

    .line 37
    .line 38
    const/16 v1, -0xa

    .line 39
    .line 40
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->cancelTxtColor:I

    .line 41
    .line 42
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->countDownTxtColor:I

    .line 43
    .line 44
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->statusBarColor:I

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isTransparentStatusBar:Z

    .line 48
    .line 49
    const/16 v1, 0xf

    .line 50
    .line 51
    iput v1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->transparentStatusBarMoveHeight:I

    .line 52
    .line 53
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->useDeepColorStatusBarIcon:Z

    .line 54
    .line 55
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnStart:Z

    .line 56
    .line 57
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnCheck:Z

    .line 58
    .line 59
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnReflect:Z

    .line 60
    .line 61
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideAvatarGuideFrame:Z

    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public getAuthCircleCorrectColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authCircleCorrectColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getAuthCircleErrorColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authCircleErrorColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getAuthLayoutBgColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authLayoutBgColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getAuthLayoutResId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authLayoutResId:I

    .line 2
    .line 3
    return p0
.end method

.method public getAuthWithLongCheck720LayoutResId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authWithLongCheck720LayoutResId:I

    .line 2
    .line 3
    return p0
.end method

.method public getCancelTxtColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->cancelTxtColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getCountDownTxtColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->countDownTxtColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getFeedBackErrorColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->feedBackErrorColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getFeedBackExtraTipColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->feedBackExtraTipColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getFeedBackTxtColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->feedBackTxtColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getLandAuthLayoutResId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->landAuthLayoutResId:I

    .line 2
    .line 3
    return p0
.end method

.method public getLoadingStageBgColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->loadingStageBgColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getLoadingStageTipsColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->loadingStageTipsColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getMainActivityThemeId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->mainActivityThemeId:I

    .line 2
    .line 3
    return p0
.end method

.method public getStatusBarColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->statusBarColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getTransparentStatusBarMoveHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->transparentStatusBarMoveHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoSize()Lcom/tencent/could/huiyansdk/enums/VideoSize;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->videoSize:Lcom/tencent/could/huiyansdk/enums/VideoSize;

    .line 2
    .line 3
    return-object p0
.end method

.method public isHideAvatarGuideFrame()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideAvatarGuideFrame:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHideFrontCircleViewOnCheck()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnCheck:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHideFrontCircleViewOnReflect()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnReflect:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHideFrontCircleViewOnStart()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnStart:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowCountdown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isShowCountdown:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowErrorDialog()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isShowErrorDialog:Z

    .line 2
    .line 3
    return p0
.end method

.method public isTransparentStatusBar()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isTransparentStatusBar:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUseDeepColorStatusBarIcon()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->useDeepColorStatusBarIcon:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAuthCircleCorrectColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authCircleCorrectColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setAuthCircleErrorColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authCircleErrorColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setAuthLayoutBgColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authLayoutBgColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setAuthLayoutResId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authLayoutResId:I

    .line 2
    .line 3
    return-void
.end method

.method public setAuthWithLongCheck720LayoutResId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->authWithLongCheck720LayoutResId:I

    .line 2
    .line 3
    return-void
.end method

.method public setCancelTxtColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->cancelTxtColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setCountDownTxtColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->countDownTxtColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setFeedBackErrorColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->feedBackErrorColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setFeedBackExtraTipColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->feedBackExtraTipColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setFeedBackTxtColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->feedBackTxtColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setHideAvatarGuideFrame(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideAvatarGuideFrame:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHideFrontCircleViewOnCheck(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnCheck:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHideFrontCircleViewOnReflect(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnReflect:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHideFrontCircleViewOnStart(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnStart:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLandAuthLayoutResId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->landAuthLayoutResId:I

    .line 2
    .line 3
    return-void
.end method

.method public setLoadingStageBgColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->loadingStageBgColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setLoadingStageTipsColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->loadingStageTipsColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setMainActivityThemeId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->mainActivityThemeId:I

    .line 2
    .line 3
    return-void
.end method

.method public setShowCountdown(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isShowCountdown:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShowErrorDialog(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isShowErrorDialog:Z

    .line 2
    .line 3
    return-void
.end method

.method public setStatusBarColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->statusBarColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setTransparentStatusBar(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isTransparentStatusBar:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTransparentStatusBarMoveHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->transparentStatusBarMoveHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setUseDeepColorStatusBarIcon(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->useDeepColorStatusBarIcon:Z

    .line 2
    .line 3
    return-void
.end method

.method public setVideoSize(Lcom/tencent/could/huiyansdk/enums/VideoSize;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->videoSize:Lcom/tencent/could/huiyansdk/enums/VideoSize;

    .line 2
    .line 3
    return-void
.end method
