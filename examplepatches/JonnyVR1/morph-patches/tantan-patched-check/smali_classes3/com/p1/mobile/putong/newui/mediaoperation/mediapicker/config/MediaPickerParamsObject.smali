.class public Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;
    }
.end annotation


# static fields
.field public static final FROM_CHAT:I = 0x4

.field public static final FROM_CHAT_LIMIT_SHOOT_PIC:I = 0xd

.field public static final FROM_CHAT_SWITCH_BACK_PIC:I = 0xb

.field public static final FROM_CHAT_SWITCH_PIC:I = 0xa

.field public static final FROM_CITY_CENTER_UPLOAD_PIC:I = 0xe

.field public static final FROM_DEFAULT:I = 0x10

.field public static final FROM_FEED:I = 0x2

.field public static final FROM_JS_BRIDGE:I = 0x8

.field public static final FROM_JS_BRIDGE_SWIPE_CARD:I = 0x9

.field public static final FROM_KAN_KAN:I = 0x5

.field public static final FROM_MY_STATES:I = 0x7

.field public static final FROM_PROFILE_GAME:I = 0xf

.field public static final FROM_PROFILE_PAGE:I = 0x1

.field public static final FROM_PROFILE_PET:I = 0x11

.field public static final FROM_PROFILE_WEALTH:I = 0xc

.field public static final FROM_REGISTER:I = 0x3

.field public static final MEDIA_PICKER_REQUEST_CODE:I = 0x42

.field public static final MEDIA_PICKER_RESULT_CODE:I = 0x43

.field public static final MEDIA_PICKER_RESULT_KEY:Ljava/lang/String; = "mediaPickerResult"


# instance fields
.field public alreadySelectedImages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public canPickBothImageAndVideo:Z

.field public croppingNewStyle:Z

.field public finishInAnim:I

.field public finishOutAnim:I

.field public fromType:I

.field public headResource:I

.field public imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

.field public initialShowSelectFold:Z

.field public isHasPostStatusHeader:Z

.field public isNewUIAb:Z

.field public jsBridgeTimestamp:J

.field public mediaPickerPageId:Ljava/lang/String;

.field public mediaPreviewPageId:Ljava/lang/String;

.field public needAllSelectedMediaPreview:Z

.field public needClickItemPreview:Z

.field public radioNeedCheckBox:Z

.field public reportMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public selectedFolderPath:Ljava/lang/String;

.field public submitButtonTitle:Ljava/lang/String;

.field public videoPickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;


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


# virtual methods
.method public canClickSubmitInPreviewWhenNoSelectedMedia(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 2

    .line 1
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->videoPickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->canClickSubmitInPreviewWhenNoSelectedMedia:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    return v0

    .line 17
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->canClickSubmitInPreviewWhenNoSelectedMedia:Z

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    return v1

    .line 26
    :cond_2
    return v0
.end method

.method public getMaxImageSelectCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->maxPickCount:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public getMaxVideoSelectCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->videoPickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->maxPickCount:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public getMinImageSelectCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->minPickCount:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public isRadio()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->isRadio()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->videoPickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->isRadio()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    move p0, v1

    .line 22
    :goto_1
    if-eqz v0, :cond_2

    .line 23
    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    return v1

    .line 27
    :cond_2
    const/4 p0, 0x0

    .line 28
    return p0
.end method
