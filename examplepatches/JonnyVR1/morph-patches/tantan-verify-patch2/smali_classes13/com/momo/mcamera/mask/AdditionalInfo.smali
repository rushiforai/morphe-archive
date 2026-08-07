.class public Lcom/momo/mcamera/mask/AdditionalInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;
    }
.end annotation


# instance fields
.field private animojiDetectEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "animojiDetectEnable"
    .end annotation
.end field

.field private backTip:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "backTips"
    .end annotation
.end field

.field private bodyDetectEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bodyDetectEnable"
    .end annotation
.end field

.field private bodySegmentDetectEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bodySegmentDetectEnable"
    .end annotation
.end field

.field private boogerpickingSwitch:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "boogerpickingSwitch"
    .end annotation
.end field

.field private cartoonFaceEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cartoonFaceEnable"
    .end annotation
.end field

.field private cartoonFaceType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cartoonFaceType"
    .end annotation
.end field

.field private comic:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comic"
    .end annotation
.end field

.field private coverMosaicWhenNoFace:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "coverMosaicWhenNoFace"
    .end annotation
.end field

.field private detectARGift:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "detectARGift"
    .end annotation
.end field

.field private detectAction:Lcom/momo/mcamera/mask/ActionInfo;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "detectAction"
    .end annotation
.end field

.field private detectGanCryingFace:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "detectGanCryingFace"
    .end annotation
.end field

.field private detectQRCode:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "detectQRCode"
    .end annotation
.end field

.field private engineAr:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "engineAr"
    .end annotation
.end field

.field private expressionDetectEnable:Z

.field private face3DGame:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "face3DGame"
    .end annotation
.end field

.field private faceAlignmentVersion:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "faceAlignmentVersion"
    .end annotation
.end field

.field private frontTip:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "frontTips"
    .end annotation
.end field

.field private handGestureDetectEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "handGestureDetectEnable"
    .end annotation
.end field

.field private handGestureType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "handGestureType"
    .end annotation
.end field

.field private handSegmentDetector:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "handSegmentDetector"
    .end annotation
.end field

.field private heartProgressDetector:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "heartProgressDetector"
    .end annotation
.end field

.field private makeUpSwitch:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "makeUpSwitch"
    .end annotation
.end field

.field private mosaicTriggerAngle:[F

.field private multiFaceSwitchEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "multiFaceSwitchEnable"
    .end annotation
.end field

.field private multiFaces:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "multiFaces"
    .end annotation
.end field

.field private objectDetectEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "objectDetectEnable"
    .end annotation
.end field

.field private specialEffectCombinedSwitch:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "specialEffectCombinedSwitch"
    .end annotation
.end field

.field private stylizeFaceEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "stylizeFaceEnable"
    .end annotation
.end field

.field private videoMatch:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "videoMatch"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/VideoMatchInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->bodyDetectEnable:Z

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->cartoonFaceType:I

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->specialEffectCombinedSwitch:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getBackTip()Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->backTip:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCartoonFaceType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->cartoonFaceType:I

    .line 2
    .line 3
    return p0
.end method

.method public getDetectAction()Lcom/momo/mcamera/mask/ActionInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->detectAction:Lcom/momo/mcamera/mask/ActionInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceAlignmentVersion()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->faceAlignmentVersion:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrontTip()Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->frontTip:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHandGestureType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->handGestureType:I

    .line 2
    .line 3
    return p0
.end method

.method public getMosaicTriggerAngle()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->mosaicTriggerAngle:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getMultiFaces()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->multiFaces:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoMatch()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/VideoMatchInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->videoMatch:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAnimojiDetectEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->animojiDetectEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public isBodyDetectEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->bodyDetectEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public isBodySegmentDetectEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->bodySegmentDetectEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public isBoogerpickingSwitch()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->boogerpickingSwitch:Z

    .line 2
    .line 3
    return p0
.end method

.method public isCartoonFaceEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->cartoonFaceEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public isComic()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->comic:Z

    .line 2
    .line 3
    return p0
.end method

.method public isCoverMosaicWhenNoFace()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->coverMosaicWhenNoFace:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDetectARGift()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->detectARGift:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDetectGanCryingFace()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->detectGanCryingFace:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDetectQRCode()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->detectQRCode:Z

    .line 2
    .line 3
    return p0
.end method

.method public isEngineAr()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->engineAr:Z

    .line 2
    .line 3
    return p0
.end method

.method public isExpressionDetectEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->expressionDetectEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public isFace3DGame()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->face3DGame:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHandGestureDetectEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->handGestureDetectEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHandSegmentDetector()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->handSegmentDetector:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHeartProgressDetector()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->heartProgressDetector:Z

    .line 2
    .line 3
    return p0
.end method

.method public isMakeUpSwitch()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->makeUpSwitch:Z

    .line 2
    .line 3
    return p0
.end method

.method public isMultiFaceSwitchEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->multiFaceSwitchEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public isObjectDetectEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->objectDetectEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSpecialEffectCombinedSwitch()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->specialEffectCombinedSwitch:Z

    .line 2
    .line 3
    return p0
.end method

.method public isStylizeFaceEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->stylizeFaceEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAnimojiDetectEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->animojiDetectEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setBackTip(Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->backTip:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setBodyDetectEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->bodyDetectEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setBodySegmentDetectEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->bodySegmentDetectEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setBoogerpickingSwitch(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->boogerpickingSwitch:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCartoonFaceEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->cartoonFaceEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCartoonFaceType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->cartoonFaceType:I

    .line 2
    .line 3
    return-void
.end method

.method public setComic(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->comic:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCoverMosaicWhenNoFace(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->coverMosaicWhenNoFace:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDetectARGift(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->detectARGift:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDetectAction(Lcom/momo/mcamera/mask/ActionInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->detectAction:Lcom/momo/mcamera/mask/ActionInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setDetectGanCryingFace(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->detectGanCryingFace:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDetectQRCode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->detectQRCode:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEngineAr(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->engineAr:Z

    .line 2
    .line 3
    return-void
.end method

.method public setExpressionDetectEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->expressionDetectEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFace3DGame(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->face3DGame:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFaceAlignmentVersion(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->faceAlignmentVersion:I

    .line 2
    .line 3
    return-void
.end method

.method public setFrontTip(Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->frontTip:Lcom/momo/mcamera/mask/AdditionalInfo$TipInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setHandGestureDetectEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->handGestureDetectEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHandGestureType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->handGestureType:I

    .line 2
    .line 3
    return-void
.end method

.method public setHandSegmentDetector(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->handSegmentDetector:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHeartProgressDetector(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->heartProgressDetector:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMakeUpSwitch(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->makeUpSwitch:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMosaicTriggerAngle([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->mosaicTriggerAngle:[F

    .line 2
    .line 3
    return-void
.end method

.method public setMultiFaceSwitchEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->multiFaceSwitchEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMultiFaces(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->multiFaces:I

    .line 2
    .line 3
    return-void
.end method

.method public setObjectDetectEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->objectDetectEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSpecialEffectCombinedSwitch(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->specialEffectCombinedSwitch:Z

    .line 2
    .line 3
    return-void
.end method

.method public setStylizeFaceEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->stylizeFaceEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setVideoMatch(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/VideoMatchInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/AdditionalInfo;->videoMatch:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
