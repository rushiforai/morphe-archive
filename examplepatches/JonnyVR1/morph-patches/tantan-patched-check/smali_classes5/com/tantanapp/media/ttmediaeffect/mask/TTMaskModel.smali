.class public Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private maskModel:Lcom/momo/mcamera/mask/MaskModel;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/momo/mcamera/mask/MaskModel;

    invoke-direct {v0}, Lcom/momo/mcamera/mask/MaskModel;-><init>()V

    iput-object v0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    return-void
.end method

.method public constructor <init>(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Lcom/momo/mcamera/mask/MaskModel;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/momo/mcamera/mask/MaskModel;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 15
    .line 16
    return-void
.end method

.method public static FACEWARPTYPE_AWL_FACE()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "awlface"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_BEAUTY()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "beauty"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_BIG_HEAD()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "bighead"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_BIG_HEAD_2()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "big_head_2"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_FAT_FACE_SMALL_CHIN()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "fat_face_small_chin"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_FAT_FACE_THIN_LIP()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "fat_face_thin_lip"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_PEARFACE_SMALLEYE_BIGMOUTH()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "pear_face_small_eye_big_mouth"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_RECTANGLEFACE_SMALLFEATURE()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "rectangle_face_small_feature"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_ROUND_FACE()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "round_face"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_SHORT_FACE()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "shortface"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_SMALLFACE_BIGEYE()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "small_face_big_eye"

    .line 2
    .line 3
    return-object v0
.end method

.method public static FACEWARPTYPE_TINYFACE_BIGEYE()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "tiny_face_big_eye"

    .line 2
    .line 3
    return-object v0
.end method

.method public static TYPE_FACE_EXPRESSION()I
    .locals 1

    const/4 v0, 0x7

    return v0
.end method

.method public static TYPE_GAME_STICKER()I
    .locals 1

    const/4 v0, 0x6

    return v0
.end method

.method public static TYPE_HANI_STICKER()I
    .locals 1

    const/4 v0, 0x5

    return v0
.end method

.method public static TYPE_LIVE_GAME()I
    .locals 1

    const/16 v0, 0x8

    return v0
.end method

.method public static TYPE_MOMENT()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static TYPE_VIDEO_DECORATE()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public static TYPE_VIDEO_EFFECT()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public static TYPE_VIDEO_GESTURE_DETECT_EFFECT()I
    .locals 1

    const/4 v0, 0x4

    return v0
.end method

.method public static TYPE_VIDEO_GIFT()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static TYPE_VIDEO_GIFT_ADDITION()I
    .locals 1

    const/16 v0, 0xb

    return v0
.end method

.method public static TYPE_VIDEO_INTERACTIVE_EFFECT()I
    .locals 1

    const/16 v0, 0xa

    return v0
.end method

.method public static TYPE_VIDEO_SCENE()I
    .locals 1

    const/16 v0, 0x9

    return v0
.end method


# virtual methods
.method public getAdditionalInfo()Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;-><init>(Lcom/momo/mcamera/mask/AdditionalInfo;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public getBeautyFace()Lcom/momo/mcamera/mask/BeautyFace;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getBeautyFace()Lcom/momo/mcamera/mask/BeautyFace;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDistortionList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Mask;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getDistortionList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getDuration()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getEffectList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/bean/EffectFilterItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getEffectList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getFaceFacialFeatureScale()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getFaceFacialFeatureScale()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFaceScale()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getFaceScale()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFacialLandmarksCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getFacialLandmarksCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFilterDisable()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getFilterDisable()Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getFolderPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getFolderPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getFrameRate()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getFrameRate()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLookUpFilters()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/LookUpModel;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getLookUpFilters()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMaskModel()Lcom/momo/mcamera/mask/MaskModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaskTransferSticker()Lcom/momo/mcamera/mask/Sticker;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getMaskTransferSticker()Lcom/momo/mcamera/mask/Sticker;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMasks()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Mask;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getMasks()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getModelType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPollGroupNum()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getPollGroupNum()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getPreviewPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getPreviewPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSound()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getSound()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSoundId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getSoundId()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSoundPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getSoundPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSoundPitchMode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getSoundPitchMode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getStickers()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Sticker;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTriggerRegion()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getTriggerRegion()[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTriggerTip()Lcom/momo/mcamera/mask/TriggerTip;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getTriggerTip()Lcom/momo/mcamera/mask/TriggerTip;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTriggerType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getTriggerType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getWrapType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getWrapType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getXengineEsPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->getXengineEsPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public isDecorationGiftPack()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskModel;->isDecorationGiftPack()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setAdditionalInfo(Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediaeffect/bean/TTAdditionalInfo;->getRealAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setAdditionalInfo(Lcom/momo/mcamera/mask/AdditionalInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setBeautyFace(Lcom/momo/mcamera/mask/BeautyFace;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setBeautyFace(Lcom/momo/mcamera/mask/BeautyFace;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDecorationGiftPack(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setDecorationGiftPack(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDistortionList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Mask;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setDistortionList(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDuration(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/MaskModel;->setDuration(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setEffectList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/bean/EffectFilterItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setEffectList(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFaceFacialFeatureScale(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setFaceFacialFeatureScale(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFaceScale(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setFaceScale(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFacialLandmarksCount(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setFacialLandmarksCount(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFilterDisable(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setFilterDisable(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFolderPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setFolderPath(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setFrameRate(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLookUpFilters(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/LookUpModel;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setLookUpFilters(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMasks(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Mask;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setMasks(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setModelType(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setModelType(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setName(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPollGroupNum(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setPollGroupNum(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPreviewPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setPreviewPath(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSound(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setSound(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSoundId(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setSoundId(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSoundPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setSoundPath(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSoundPitchMode(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setSoundPitchMode(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setStickers(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Sticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setStickers(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTriggerRegion([I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setTriggerRegion([I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTriggerTip(Lcom/momo/mcamera/mask/TriggerTip;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setTriggerTip(Lcom/momo/mcamera/mask/TriggerTip;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTriggerType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setTriggerType(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setWrapType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setWrapType(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setXengineEsPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->maskModel:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setXengineEsPath(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
