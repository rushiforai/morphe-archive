.class public Ll/w4g0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/w4g0$a;
    }
.end annotation


# static fields
.field public static final FACE_3D_MASK_TYPE:Ljava/lang/String; = "3d"

.field public static final FACE_DEFAULT_WIDTH:F = 180.0f

.field public static final FACE_LOOK_UP_TYPE:Ljava/lang/String; = "FACE_LOOK_UP_TYPE"

.field public static final FACE_MASK_TYPE:Ljava/lang/String; = "FACE_MASK_TYPE"

.field public static final LAYER_TYPE_GESTURE:Ljava/lang/String; = "object_follower"

.field public static final LAYER_TYPE_NATIVE:Ljava/lang/String; = "native"

.field public static final STICKER_TYPE_DELEGATE_STICKER:Ljava/lang/String; = "weex"

.field public static final STICKER_TYPE_GAME_FIX_TYPE:Ljava/lang/String; = "STICKER_TYPE_GAME_FIX_TYPE"

.field public static final STICKER_TYPE_VOICE:Ljava/lang/String; = "STICKER_TYPE_VOICE"

.field public static final TYPE_ABSOLUTION_POSITION:I = 0x5

.field public static final TYPE_ABS_POSITION_ADJUST_RESOLUTION:I = 0x7

.field public static final TYPE_ABS_POSITION_USE_STICKER_DIM:I = 0x6

.field public static final TYPE_FACE:I = 0x0

.field public static final TYPE_FIXED:I = 0x1

.field public static final TYPE_FULL_SCREEN_FIXED:I = 0x2

.field public static final TYPE_SCALE_CENTER_CROP:I = 0x63

.field public static final TYPE_SCALE_TO_FILL:I = 0x3


# instance fields
.field private absolutePos:Ll/q6;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "position"
    .end annotation
.end field

.field private additionalInfo:Ll/y4g0;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "additionalInfo"
    .end annotation
.end field

.field private baseDemensionHeight:I

.field private blendMode:Ll/w4g0$a;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "blendMode"
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

.field private etcTextureBatch:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "etcTextureBatch"
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

.field private imagePreName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "folder"
    .end annotation
.end field

.field private imageProvider:Ll/uhm;

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

.field private lookUpModel:Ll/e5w;

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

.field private mask:Ll/z5x;

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

.field private showTop:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "fromTop"
    .end annotation
.end field

.field private soundId:I

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

.field private useImageCache:Z


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
    iput v0, p0, Ll/w4g0;->curIndex:I

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Ll/w4g0;->soundId:I

    .line 9
    .line 10
    iput v1, p0, Ll/w4g0;->playingSoundId:I

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, p0, Ll/w4g0;->useImageCache:Z

    .line 14
    .line 15
    const/16 v1, 0x280

    .line 16
    .line 17
    iput v1, p0, Ll/w4g0;->baseDemensionHeight:I

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/w4g0;->comic:Z

    .line 20
    .line 21
    const/high16 v1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    iput v1, p0, Ll/w4g0;->intensity:F

    .line 24
    .line 25
    iput-boolean v0, p0, Ll/w4g0;->pollTrigger:Z

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public a()Ll/y4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w4g0;->additionalInfo:Ll/y4g0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/w4g0;->imageHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/w4g0;->imageWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/w4g0;->soundId:I

    .line 2
    .line 3
    return p0
.end method

.method public e(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/w4g0;->frameRate:I

    .line 2
    .line 3
    return-void
.end method

.method public f(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/w4g0;->hiddenTriggerType:I

    .line 2
    .line 3
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w4g0;->imageFolderPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public h(Ll/e5w;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w4g0;->lookUpModel:Ll/e5w;

    .line 2
    .line 3
    return-void
.end method

.method public i(Ll/z5x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w4g0;->mask:Ll/z5x;

    .line 2
    .line 3
    return-void
.end method

.method public j(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w4g0;->stickerType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public k(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/w4g0;->triggerType:I

    .line 2
    .line 3
    return-void
.end method
