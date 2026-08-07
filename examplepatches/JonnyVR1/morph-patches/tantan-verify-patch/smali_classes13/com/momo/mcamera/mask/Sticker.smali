.class public Lcom/momo/mcamera/mask/Sticker;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;,
        Lcom/momo/mcamera/mask/Sticker$BlendMode;
    }
.end annotation


# static fields
.field public static final FACE_3D_MASK_TYPE:Ljava/lang/String; = "3d"

.field public static final FACE_DEFAULT_WIDTH:F = 180.0f

.field public static final FACE_LOOK_UP_TYPE:Ljava/lang/String; = "FACE_LOOK_UP_TYPE"

.field public static final FACE_MASK_TYPE:Ljava/lang/String; = "FACE_MASK_TYPE"

.field public static final GESTURE_TYPE_HEART:Ljava/lang/String; = "heart"

.field public static final GESTURE_TYPE_ONE:Ljava/lang/String; = "one"

.field public static final GESTURE_TYPE_YEARH:Ljava/lang/String; = "yearh"

.field public static final LAYER_TYPE_DEFAULT:Ljava/lang/String; = "default"

.field public static final LAYER_TYPE_FACE:Ljava/lang/String; = "face"

.field public static final LAYER_TYPE_GESTURE:Ljava/lang/String; = "object_follower"

.field public static final LAYER_TYPE_NATIVE:Ljava/lang/String; = "native"

.field public static final LAYER_TYPE_VIDEO_FILE:Ljava/lang/String; = "video_file"

.field public static final RESOURCE_TYPE_AUDIO_VISUALIZER:Ljava/lang/String; = "audio_visualizer"

.field public static final STICKER_TYPE_DELEGATE_STICKER:Ljava/lang/String; = "weex"

.field public static final STICKER_TYPE_GAME_FIX_TYPE:Ljava/lang/String; = "STICKER_TYPE_GAME_FIX_TYPE"

.field public static final STICKER_TYPE_VOICE:Ljava/lang/String; = "STICKER_TYPE_VOICE"

.field public static final STICKER_TYPE_WATERMARK:Ljava/lang/String; = "STICKER_TYPE_WATERMARK"

.field public static final TRIGGER_ACTIVE_FACE_EXPRESSION:I = 0x4

.field public static final TRIGGER_ANIMOJI_DETECT:I = 0x100

.field public static final TRIGGER_BODY_DETECT:I = 0x80

.field public static final TRIGGER_EXPRESSION:I = 0x20

.field public static final TRIGGER_EYE_CLASSIFY:I = 0x2

.field public static final TRIGGER_FACE:I = 0x1

.field public static final TRIGGER_OBJECT_GESTURE:I = 0x8

.field public static final TRIGGER_OBJECT_GESTURE_TRACKING:I = 0x10

.field public static final TRIGGER_SEGMENT:I = 0x40

.field public static final TRIGGER_TYPE_MOUSE:I = 0x1

.field public static final TYPE_ABSOLUTION_POSITION:I = 0x5

.field public static final TYPE_ABS_POSITION_ADJUST_RESOLUTION:I = 0x7

.field public static final TYPE_ABS_POSITION_USE_STICKER_DIM:I = 0x6

.field public static final TYPE_FACE:I = 0x0

.field public static final TYPE_FIXED:I = 0x1

.field public static final TYPE_FULL_SCREEN_FIXED:I = 0x2

.field public static final TYPE_SCALE_CENTER_CROP:I = 0x63

.field public static final TYPE_SCALE_TO_FILL:I = 0x3


# instance fields
.field private absolutePos:Lcom/momo/mcamera/mask/bean/AbsolutePosition;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "position"
    .end annotation
.end field

.field private additionalInfo:Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "additionalInfo"
    .end annotation
.end field

.field private baseDemensionHeight:I

.field private baseDemensionWidth:I

.field private blendMode:Lcom/momo/mcamera/mask/Sticker$BlendMode;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "blendMode"
    .end annotation
.end field

.field private bottomAlignIndex:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bottomAlignIndex"
    .end annotation
.end field

.field private clearsBodyArea:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "clearsBodyArea"
    .end annotation
.end field

.field private clearsFaceArea:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "useFacialSegmentationData"
    .end annotation
.end field

.field private comic:Z

.field public curIndex:I

.field private deviceOrientation:I

.field private donotResetOnHide:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "donotResetOnHide"
    .end annotation
.end field

.field private donotTrack:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "donotTrack"
    .end annotation
.end field

.field private duration:J

.field private enable3DAntialiasing:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enable3DAntialiasing"
    .end annotation
.end field

.field private etcTextureBatch:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "etcTextureBatch"
    .end annotation
.end field

.field private extString:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "imageType"
    .end annotation
.end field

.field private facePositionCenter:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pointIndex"
    .end annotation
.end field

.field private frameNumber:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "frames"
    .end annotation
.end field

.field private frameRate:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "frameRate"
    .end annotation
.end field

.field private groupNum:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "groupNum"
    .end annotation
.end field

.field public groupNumber:I

.field private handGestureType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "handGestureType"
    .end annotation
.end field

.field private hiddenObjectTriggerType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "hidingObjectTriggerType"
    .end annotation
.end field

.field private hiddenTriggerType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "hidingTriggerType"
    .end annotation
.end field

.field private imageFolderPath:Ljava/lang/String;

.field private imageHeight:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "height"
    .end annotation
.end field

.field private imageMaskPath:Ljava/lang/String;

.field private imagePreName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "folder"
    .end annotation
.end field

.field private imageProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

.field private imageWidth:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "width"
    .end annotation
.end field

.field private intensity:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "intensity"
    .end annotation
.end field

.field private isAlwaysShow:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "alwaysShow"
    .end annotation
.end field

.field public isCutFaceSticker:Z

.field public isGameSticker:Z

.field public isHaniSticker:Z

.field private isPreMultiAlpha:Z

.field private layerType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "layerType"
    .end annotation
.end field

.field private lookUpModel:Lcom/momo/mcamera/mask/LookUpModel;

.field private loop:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "looping"
    .end annotation
.end field

.field private loopCount:I

.field private loopSound:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "loopSound"
    .end annotation
.end field

.field private loopStart:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "loopingIndex"
    .end annotation
.end field

.field private mask:Lcom/momo/mcamera/mask/Mask;

.field private minHiddenFrameCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "minimumHiddenFrameCount"
    .end annotation
.end field

.field private modelType:I

.field private name:Ljava/lang/String;

.field private noBreakLoop:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "noninterruptible"
    .end annotation
.end field

.field private notHiddenAfterTrigger:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "doNotHideAfterTrigger"
    .end annotation
.end field

.field private objectTriggerType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "objectTriggerType"
    .end annotation
.end field

.field private offsetX:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "offsetX"
    .end annotation
.end field

.field private offsetY:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "offsetY"
    .end annotation
.end field

.field private orderedIndex:I

.field private playingSoundId:I

.field private pointIndexes:[I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pointIndexes"
    .end annotation
.end field

.field private pollTrigger:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pollTrigger"
    .end annotation
.end field

.field private resourceType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "resourceType"
    .end annotation
.end field

.field private segmentType:Ljava/lang/String;

.field private showTop:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "fromTop"
    .end annotation
.end field

.field private sound:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sound"
    .end annotation
.end field

.field private soundId:I

.field private soundNeedsPublish:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "soundNeedsPublish"
    .end annotation
.end field

.field private stickerType:Ljava/lang/String;

.field private strokeColor:[F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "strokeColor"
    .end annotation
.end field

.field private strokeRadius:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "strokeRadius"
    .end annotation
.end field

.field private topAlignIndex:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "topAlignIndex"
    .end annotation
.end field

.field private trackingRegion:Lcom/momo/mcamera/mask/bean/ObjectRegion;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "objectTrackingRegion"
    .end annotation
.end field

.field private triggerFlag:I

.field private triggerRegion:[I

.field private triggerState:I

.field private triggerType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "triggerType"
    .end annotation
.end field

.field private type:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
    .end annotation
.end field

.field private useHandGestureDetectNewVersion:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "useHandGesture"
    .end annotation
.end field

.field private useImageCache:Z

.field private videoFileConfig:Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;

.field private xengineEsPath:Ljava/lang/String;

.field private zoomScale:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "zoomScale"
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
    iput v0, p0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/Sticker;->loopCount:I

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    iput v1, p0, Lcom/momo/mcamera/mask/Sticker;->soundId:I

    .line 11
    .line 12
    iput v1, p0, Lcom/momo/mcamera/mask/Sticker;->playingSoundId:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/Sticker;->useImageCache:Z

    .line 16
    .line 17
    const/16 v1, 0x168

    .line 18
    .line 19
    iput v1, p0, Lcom/momo/mcamera/mask/Sticker;->baseDemensionWidth:I

    .line 20
    .line 21
    const/16 v1, 0x280

    .line 22
    .line 23
    iput v1, p0, Lcom/momo/mcamera/mask/Sticker;->baseDemensionHeight:I

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/Sticker;->comic:Z

    .line 26
    .line 27
    iput v0, p0, Lcom/momo/mcamera/mask/Sticker;->orderedIndex:I

    .line 28
    .line 29
    const/high16 v1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    iput v1, p0, Lcom/momo/mcamera/mask/Sticker;->intensity:F

    .line 32
    .line 33
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/Sticker;->pollTrigger:Z

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public getAbsolutePos()Lcom/momo/mcamera/mask/bean/AbsolutePosition;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->absolutePos:Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAdditionalInfo()Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->additionalInfo:Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBaseDemensionHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->baseDemensionHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getBaseDemensionWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->baseDemensionWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getBitmapWithIndex(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/Sticker;->frameNumber:I

    .line 2
    .line 3
    if-lt p2, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/Sticker;->getImagePathByIndex(Landroid/content/Context;I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public getBlendMode()Lcom/momo/mcamera/mask/Sticker$BlendMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->blendMode:Lcom/momo/mcamera/mask/Sticker$BlendMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBottomAlignIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->bottomAlignIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public getCenterIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->facePositionCenter:I

    .line 2
    .line 3
    return p0
.end method

.method public getCurFrameRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->frameRate:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/16 p0, 0xf

    .line 7
    .line 8
    return p0
.end method

.method public getDeviceOrientation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->deviceOrientation:I

    .line 2
    .line 3
    return p0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/Sticker;->duration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getETC1ImageIndex()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lcom/momo/mcamera/mask/Sticker;->loopStart:I

    .line 14
    .line 15
    iput v0, p0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 16
    .line 17
    :cond_0
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 18
    .line 19
    return p0
.end method

.method public getETC1JsonPath()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "/"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p0, ".json"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public getETC1Path()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "/"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p0, ".pkm"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public getEtcTextureBatch()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->etcTextureBatch:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExtString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "png"

    .line 2
    .line 3
    return-object p0
.end method

.method public getFace3DResPath()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public getFacePositionCenter()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->facePositionCenter:I

    .line 2
    .line 3
    return p0
.end method

.method public getFacePositionLeft()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getFacePositionRight()I
    .locals 0

    const/16 p0, 0x10

    return p0
.end method

.method public getFrameNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->frameNumber:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrameRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->frameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getGroupNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->groupNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getGroupNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->groupNumber:I

    .line 2
    .line 3
    return p0
.end method

.method public getHandGestureType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->handGestureType:I

    .line 2
    .line 3
    return p0
.end method

.method public getHiddenObjectTriggerType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->hiddenObjectTriggerType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHiddenTriggerType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->hiddenTriggerType:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageFolderPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImageHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->imageHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageMaskPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->imageMaskPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImagePath(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/momo/mcamera/mask/Sticker;->getImagePathByIndex(Landroid/content/Context;I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget v0, p0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 8
    .line 9
    add-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    iput v0, p0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    iget v0, p0, Lcom/momo/mcamera/mask/Sticker;->loopStart:I

    .line 20
    .line 21
    iput v0, p0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 22
    .line 23
    :cond_0
    return-object p1
.end method

.method public getImagePathByIndex(Landroid/content/Context;I)Ljava/lang/String;
    .locals 2

    .line 1
    const/16 p1, 0xa

    .line 2
    .line 3
    if-ge p2, p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v0, "_00"

    .line 8
    .line 9
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/16 p1, 0x64

    .line 21
    .line 22
    if-ge p2, p1, :cond_1

    .line 23
    .line 24
    new-instance p1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v0, "_0"

    .line 27
    .line 28
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v0, "_"

    .line 42
    .line 43
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    :goto_0
    iget-object p2, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p2, :cond_3

    .line 56
    .line 57
    iget-object p2, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p2, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v0, "/"

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p1, "."

    .line 94
    .line 95
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getExtString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0

    .line 110
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 111
    return-object p0
.end method

.method public getImagePreName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImageProvider()Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->imageProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImageWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->imageWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageWidthScale()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->zoomScale:F

    .line 7
    .line 8
    mul-float/2addr v0, p0

    .line 9
    const/high16 p0, 0x43340000    # 180.0f

    .line 10
    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getIntensity()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->intensity:F

    .line 2
    .line 3
    return p0
.end method

.method public getLayerType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->layerType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLookUpModel()Lcom/momo/mcamera/mask/LookUpModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->lookUpModel:Lcom/momo/mcamera/mask/LookUpModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLoop()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->loop:I

    .line 2
    .line 3
    return p0
.end method

.method public getLoopStart()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->loopStart:I

    .line 2
    .line 3
    return p0
.end method

.method public getMask()Lcom/momo/mcamera/mask/Mask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->mask:Lcom/momo/mcamera/mask/Mask;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMinHiddenFrameCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->minHiddenFrameCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getModelType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->modelType:I

    .line 2
    .line 3
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getObjectTriggerType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->objectTriggerType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOffsetX()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->offsetX:I

    .line 2
    .line 3
    return p0
.end method

.method public getOffsetY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->offsetY:I

    .line 2
    .line 3
    return p0
.end method

.method public getOrderedIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->orderedIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public getPlayingSoundId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->playingSoundId:I

    .line 2
    .line 3
    return p0
.end method

.method public getPointIndexes()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->pointIndexes:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getPollTrigger()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->pollTrigger:Z

    .line 2
    .line 3
    return p0
.end method

.method public getResourceType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->resourceType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSegmentType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->segmentType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSound()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->sound:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSoundId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->soundId:I

    .line 2
    .line 3
    return p0
.end method

.method public getSoundNeedsPublish()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->soundNeedsPublish:Z

    .line 2
    .line 3
    return p0
.end method

.method public getSoundPath()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/Sticker;->sound:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "/"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->sound:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return-object p0
.end method

.method public getStickerType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->stickerType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStrokeColor()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->strokeColor:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getStrokeRadius()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->strokeRadius:I

    .line 2
    .line 3
    return p0
.end method

.method public getTopAlignIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->topAlignIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public getTrackingRegion()Lcom/momo/mcamera/mask/bean/ObjectRegion;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->trackingRegion:Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTriggerFlag()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->triggerFlag:I

    .line 2
    .line 3
    return p0
.end method

.method public getTriggerPlayStatus()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getAdditionalInfo()Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getAdditionalInfo()Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;->getTriggerPlayStatus()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, -0x1

    .line 17
    return p0
.end method

.method public getTriggerRegion()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->triggerRegion:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getTriggerState()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->triggerState:I

    .line 2
    .line 3
    return p0
.end method

.method public getTriggerType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->triggerType:I

    .line 2
    .line 3
    return p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->type:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoFileConfig()Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->videoFileConfig:Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getXengineEsPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->xengineEsPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getXengineResRelativePath()Ljava/lang/String;
    .locals 4

    .line 1
    invoke-static {}, Lcom/core/glcore/util/XEEngineHelper;->getLibraryPath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget-object v3, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-ge v2, v3, :cond_2

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_2
    return-object v1
.end method

.method public getZoomScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Sticker;->zoomScale:F

    .line 2
    .line 3
    return p0
.end method

.method public hasCenterPoint()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Sticker;->pointIndexes:[I

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    array-length p0, p0

    .line 6
    const/4 v0, 0x2

    .line 7
    if-ge p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public hasETC1Resource()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getETC1Path()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/core/glcore/util/FileUtil;->exist(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isAlwaysShow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->isAlwaysShow:Z

    .line 2
    .line 3
    return p0
.end method

.method public isClearsBodyArea()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->clearsBodyArea:Z

    .line 2
    .line 3
    return p0
.end method

.method public isClearsFaceArea()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->clearsFaceArea:Z

    .line 2
    .line 3
    return p0
.end method

.method public isComic()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->comic:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDonotTrack()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->donotTrack:Z

    .line 2
    .line 3
    return p0
.end method

.method public isEnable3DAntialiasing()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->enable3DAntialiasing:Z

    .line 2
    .line 3
    return p0
.end method

.method public isLoopSound()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->loopSound:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNoBreakLoop()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->noBreakLoop:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNotHiddenAfterTrigger()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->notHiddenAfterTrigger:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNotResetOnHide()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->donotResetOnHide:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPreMultiAlpha()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->isPreMultiAlpha:Z

    .line 2
    .line 3
    return p0
.end method

.method public isShowTop()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->showTop:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUseHandGestureDetectNewVersion()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->useHandGestureDetectNewVersion:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUseImageCache()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Sticker;->useImageCache:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAbsolutePos(Lcom/momo/mcamera/mask/bean/AbsolutePosition;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->absolutePos:Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 2
    .line 3
    return-void
.end method

.method public setAdditionalInfo(Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->additionalInfo:Lcom/momo/mcamera/mask/bean/StickerAdditionalInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setAlwaysShow(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->isAlwaysShow:Z

    .line 2
    .line 3
    return-void
.end method

.method public setBaseDemensionHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->baseDemensionHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setBaseDemensionWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->baseDemensionWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setBlendMode(Lcom/momo/mcamera/mask/Sticker$BlendMode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->blendMode:Lcom/momo/mcamera/mask/Sticker$BlendMode;

    .line 2
    .line 3
    return-void
.end method

.method public setBottomAlignIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->bottomAlignIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setClearsBodyArea(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->clearsBodyArea:Z

    .line 2
    .line 3
    return-void
.end method

.method public setClearsFaceArea(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->clearsFaceArea:Z

    .line 2
    .line 3
    return-void
.end method

.method public setComic(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->comic:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDeviceOrientation(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->deviceOrientation:I

    .line 2
    .line 3
    return-void
.end method

.method public setDonotTrack(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->donotTrack:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/mask/Sticker;->duration:J

    .line 2
    .line 3
    return-void
.end method

.method public setEnable3DAntialiasing(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->enable3DAntialiasing:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEtcTextureBatch(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->etcTextureBatch:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setExtString(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->extString:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFacePositionCenter(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->facePositionCenter:I

    .line 2
    .line 3
    return-void
.end method

.method public setFrameNumber(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->frameNumber:I

    .line 2
    .line 3
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->frameRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setGroupNum(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->groupNum:I

    .line 2
    .line 3
    return-void
.end method

.method public setGroupNumber(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->groupNumber:I

    .line 2
    .line 3
    return-void
.end method

.method public setHandGestureType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->handGestureType:I

    .line 2
    .line 3
    return-void
.end method

.method public setHiddenObjectTriggerType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->hiddenObjectTriggerType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHiddenTriggerType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->hiddenTriggerType:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageFolderPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->imageFolderPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setImageHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->imageHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageMaskPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->imageMaskPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setImagePreName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->imagePreName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setImageProvider(Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->imageProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 2
    .line 3
    return-void
.end method

.method public setImageWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->imageWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setIntensity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->intensity:F

    .line 2
    .line 3
    return-void
.end method

.method public setLayerType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->layerType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLookUpModel(Lcom/momo/mcamera/mask/LookUpModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->lookUpModel:Lcom/momo/mcamera/mask/LookUpModel;

    .line 2
    .line 3
    return-void
.end method

.method public setLoop(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->loop:I

    .line 2
    .line 3
    return-void
.end method

.method public setLoopSound(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->loopSound:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLoopStart(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->loopStart:I

    .line 2
    .line 3
    return-void
.end method

.method public setMask(Lcom/momo/mcamera/mask/Mask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->mask:Lcom/momo/mcamera/mask/Mask;

    .line 2
    .line 3
    return-void
.end method

.method public setMinHiddenFrameCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->minHiddenFrameCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setModelType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->modelType:I

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setNoBreakLoop(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->noBreakLoop:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNotHiddenAfterTrigger(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->notHiddenAfterTrigger:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNotResetOnHide(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->donotResetOnHide:Z

    .line 2
    .line 3
    return-void
.end method

.method public setObjectTriggerType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->objectTriggerType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOffsetX(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->offsetX:I

    .line 2
    .line 3
    return-void
.end method

.method public setOffsetY(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->offsetY:I

    .line 2
    .line 3
    return-void
.end method

.method public setOrderedIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->orderedIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setPlayingSoundId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->playingSoundId:I

    .line 2
    .line 3
    return-void
.end method

.method public setPointIndexes([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->pointIndexes:[I

    .line 2
    .line 3
    return-void
.end method

.method public setPollTrigger(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->pollTrigger:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPreMultiAlpha(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->isPreMultiAlpha:Z

    .line 2
    .line 3
    return-void
.end method

.method public setResourceType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->resourceType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSegmentType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->segmentType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setShowTop(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->showTop:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSound(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->sound:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSoundId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->soundId:I

    .line 2
    .line 3
    return-void
.end method

.method public setSoundNeedsPublish(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->soundNeedsPublish:Z

    .line 2
    .line 3
    return-void
.end method

.method public setStickerType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->stickerType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setStrokeColor([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->strokeColor:[F

    .line 2
    .line 3
    return-void
.end method

.method public setStrokeRadius(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->strokeRadius:I

    .line 2
    .line 3
    return-void
.end method

.method public setTopAlignIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->topAlignIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setTrackingRegion(Lcom/momo/mcamera/mask/bean/ObjectRegion;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->trackingRegion:Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerFlag(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->triggerFlag:I

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerRegion([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->triggerRegion:[I

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerState(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->triggerState:I

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->triggerType:I

    .line 2
    .line 3
    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->type:I

    .line 2
    .line 3
    return-void
.end method

.method public setUseHandGestureDetectNewVersion(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->useHandGestureDetectNewVersion:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUseImageCache(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Sticker;->useImageCache:Z

    .line 2
    .line 3
    return-void
.end method

.method public setVideoFileConfig(Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->videoFileConfig:Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;

    .line 2
    .line 3
    return-void
.end method

.method public setXengineEsPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Sticker;->xengineEsPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setZoomScale(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->zoomScale:F

    .line 3
    .line 4
    return-void
.end method

.method public updateTriggerFlag(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/Sticker;->triggerFlag:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Lcom/momo/mcamera/mask/Sticker;->triggerFlag:I

    .line 5
    .line 6
    return-void
.end method
