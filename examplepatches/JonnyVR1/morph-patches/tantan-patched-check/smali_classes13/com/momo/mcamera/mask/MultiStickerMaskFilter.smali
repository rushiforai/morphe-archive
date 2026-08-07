.class public Lcom/momo/mcamera/mask/MultiStickerMaskFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/gam;
.implements Ll/suf;
.implements Lcom/momo/mcamera/mask/StickerAdjustFilter$IOrderable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/MultiStickerMaskFilter$StickerFinishListener;
    }
.end annotation


# static fields
.field public static final ATTRIBUTE_DECORATION_SIZE:Ljava/lang/String; = "decorationSize"

.field public static final ATTRIBUTE_MVP_MATRIX:Ljava/lang/String; = "uMVPMatrix"

.field public static final ATTRIBUTE_POSITION_3:Ljava/lang/String; = "position3"

.field protected static final COORDS_PER_VERTEX:I = 0x2

.field protected static final DEFAULT_DURATION:J = 0x1c9c380L

.field public static final POINTS_LENGTH:I = 0x44

.field public static final UNIFORM_ETC1FLAG:Ljava/lang/String; = "etc1Flag"

.field public static final UNIFORM_PREMULTI:Ljava/lang/String; = "isPreMulti"


# instance fields
.field protected context:Landroid/content/Context;

.field protected decorateHandler:I

.field public drawListBuffer:Ljava/nio/ShortBuffer;

.field protected final drawOrder:[S

.field protected faceIndex:I

.field filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

.field public finishListener:Lcom/momo/mcamera/mask/MultiStickerMaskFilter$StickerFinishListener;

.field private final fragmentShaderCode:Ljava/lang/String;

.field private isPreMultiHandle:I

.field private isPreMultiMode:Z

.field protected lastStickerTime:J

.field private lockTexture:Z

.field private mCurrentStickerItem:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/StickerItem;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentTime:J

.field private mETC1Handler:I

.field private mIndex:I

.field private mLastMmcvBoxIsEmpty:Z

.field private mNoBoxCount:I

.field protected mPollTriggerStickerItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/StickerItem;",
            ">;>;"
        }
    .end annotation
.end field

.field protected final mProjectionMatrix:[F

.field private mVPMatrixHandler:I

.field private mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

.field orderedIndex:I

.field protected positionHandle3:I

.field private projectionInit:Z

.field scaleHeightRatio:F

.field scaleWidthRatio:F

.field protected stickerItemDestroyList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/StickerItem;",
            ">;"
        }
    .end annotation
.end field

.field protected stickerItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/StickerItem;",
            ">;"
        }
    .end annotation
.end field

.field protected textureCoord:[F

.field protected vertexBufer:Ljava/nio/FloatBuffer;

.field private final vertexShaderCode:Ljava/lang/String;

.field protected final vertexStride:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    new-array v0, v0, [S

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawOrder:[S

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    iput v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexStride:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->lockTexture:Z

    .line 18
    .line 19
    const/16 v2, 0x10

    .line 20
    .line 21
    new-array v2, v2, [F

    .line 22
    .line 23
    iput-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mProjectionMatrix:[F

    .line 24
    .line 25
    const/high16 v2, 0x3f800000    # 1.0f

    .line 26
    .line 27
    iput v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->scaleWidthRatio:F

    .line 28
    .line 29
    iput v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->scaleHeightRatio:F

    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->isPreMultiMode:Z

    .line 32
    .line 33
    iput v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->faceIndex:I

    .line 34
    .line 35
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->projectionInit:Z

    .line 36
    .line 37
    const-wide/16 v2, 0x0

    .line 38
    .line 39
    iput-wide v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->lastStickerTime:J

    .line 40
    .line 41
    const-string v4, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   inputTextureCoordinate ; attribute vec4   position3 ; varying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform vec2 decorationSize;\nuniform mediump float etc1Flag;\nvoid main() {  gl_Position = position;  vec2 coord = inputTextureCoordinate.xy;  if(etc1Flag > 0.5){\n    vec2 coord1 = position3.xy;    textureCoordinate1 = vec2(1.0 - (coord1.x + 0.5),1.0-(coord1.y + 0.5));\n  }else{\n    coord = (coord) / decorationSize;\n   }\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 42
    .line 43
    iput-object v4, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexShaderCode:Ljava/lang/String;

    .line 44
    .line 45
    const-string v4, "precision mediump float;uniform sampler2D inputImageTexture0;uniform float etc1Flag;\nuniform int isPreMulti;\nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture0,textureCoordinate);\nif(etc1Flag > 0.5){\n   color1.a  = texture2D(inputImageTexture0,textureCoordinate1).r;\n}else{\n   if(isPreMulti == 1){\n       if (color1.a > 0.0) {color1.rgb = color1.rgb/color1.a;}   }\n}\n   gl_FragColor = color1; }"

    .line 46
    .line 47
    iput-object v4, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->fragmentShaderCode:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v4, 0x0

    .line 50
    iput-object v4, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentStickerItem:Ljava/util/List;

    .line 51
    .line 52
    iput v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mIndex:I

    .line 53
    .line 54
    const/4 v4, 0x1

    .line 55
    iput-boolean v4, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mLastMmcvBoxIsEmpty:Z

    .line 56
    .line 57
    iput v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mNoBoxCount:I

    .line 58
    .line 59
    iput-wide v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentTime:J

    .line 60
    .line 61
    iput v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->orderedIndex:I

    .line 62
    .line 63
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 64
    .line 65
    new-instance p1, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 71
    .line 72
    new-instance p1, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 78
    .line 79
    array-length p1, v0

    .line 80
    mul-int/lit8 p1, p1, 0x2

    .line 81
    .line 82
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 103
    .line 104
    invoke-virtual {p0, v1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    nop

    .line 109
    :array_0
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x0s
        0x2s
        0x3s
    .end array-data
.end method

.method private clearMaskWithModeTypeFromList(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/StickerItem;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/momo/mcamera/mask/StickerItem;

    .line 16
    .line 17
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getModelType()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ne v1, p2, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method private drawAbsPostionAdjustResolution(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x43f00000    # 480.0f

    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    const/high16 v1, 0x43b00000    # 352.0f

    .line 18
    .line 19
    div-float/2addr v0, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 22
    .line 23
    :goto_0
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    int-to-float v1, v1

    .line 30
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    int-to-float v2, v2

    .line 35
    const/high16 v3, 0x40000000    # 2.0f

    .line 36
    .line 37
    div-float/2addr v2, v3

    .line 38
    div-float/2addr v1, v2

    .line 39
    mul-float/2addr v1, v0

    .line 40
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getAbsolutePos()Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    new-instance v2, Landroid/graphics/PointF;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    iget v3, v3, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget v0, v0, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 67
    .line 68
    invoke-direct {v2, v3, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 69
    .line 70
    .line 71
    iput-object v2, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    new-instance v0, Landroid/graphics/PointF;

    .line 75
    .line 76
    const/high16 v2, 0x3f000000    # 0.5f

    .line 77
    .line 78
    invoke-direct {v0, v2, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 79
    .line 80
    .line 81
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 82
    .line 83
    :goto_1
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 84
    .line 85
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 86
    .line 87
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getDeviceOrientation()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    int-to-float v0, v0

    .line 94
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 95
    .line 96
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 97
    .line 98
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method private drawAbsolutePostion(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustHeightScale()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    mul-float/2addr v0, v1

    .line 13
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    const/high16 v2, 0x40000000    # 2.0f

    .line 19
    .line 20
    div-float/2addr v1, v2

    .line 21
    div-float/2addr v0, v1

    .line 22
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getAbsolutePos()Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    new-instance v3, Landroid/graphics/PointF;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iget v4, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    iget v5, v5, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 49
    .line 50
    invoke-direct {v3, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 51
    .line 52
    .line 53
    iput-object v3, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    new-instance v3, Landroid/graphics/PointF;

    .line 57
    .line 58
    const/high16 v4, 0x3f000000    # 0.5f

    .line 59
    .line 60
    invoke-direct {v3, v4, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 61
    .line 62
    .line 63
    iput-object v3, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 64
    .line 65
    :goto_0
    instance-of v3, p1, Lcom/momo/mcamera/mask/StickerFixItem;

    .line 66
    .line 67
    if-eqz v3, :cond_1

    .line 68
    .line 69
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    int-to-float v0, v0

    .line 76
    mul-float/2addr v0, v2

    .line 77
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    int-to-float v3, v3

    .line 82
    div-float/2addr v0, v3

    .line 83
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    iget v3, v3, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    iget v4, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->w:F

    .line 94
    .line 95
    mul-float/2addr v3, v4

    .line 96
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    int-to-float v4, v4

    .line 101
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    iget v5, v5, Lcom/momo/mcamera/mask/bean/ObjectRegion;->w:F

    .line 106
    .line 107
    sub-float/2addr v4, v5

    .line 108
    div-float/2addr v4, v2

    .line 109
    add-float/2addr v3, v4

    .line 110
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    iget v2, v2, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iget v1, v1, Lcom/momo/mcamera/mask/bean/ObjectRegion;->h:F

    .line 121
    .line 122
    mul-float/2addr v2, v1

    .line 123
    iget-object v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 124
    .line 125
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    int-to-float v4, v4

    .line 130
    div-float/2addr v3, v4

    .line 131
    iput v3, v1, Landroid/graphics/PointF;->x:F

    .line 132
    .line 133
    iget-object v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 134
    .line 135
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    int-to-float v3, v3

    .line 140
    div-float/2addr v2, v3

    .line 141
    iput v2, v1, Landroid/graphics/PointF;->y:F

    .line 142
    .line 143
    :cond_1
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 144
    .line 145
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 146
    .line 147
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 148
    .line 149
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getDeviceOrientation()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    int-to-float v0, v0

    .line 154
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 155
    .line 156
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 157
    .line 158
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 159
    .line 160
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method private drawAbsolutePostionUseStcikerDim(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    mul-float/2addr v1, v2

    .line 16
    iget-object v2, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getBaseDemensionHeight()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    int-to-float v2, v2

    .line 23
    div-float/2addr v1, v2

    .line 24
    mul-float/2addr v0, v1

    .line 25
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    int-to-float v1, v1

    .line 30
    const/high16 v2, 0x40000000    # 2.0f

    .line 31
    .line 32
    div-float/2addr v1, v2

    .line 33
    div-float/2addr v0, v1

    .line 34
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getAbsolutePos()Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    new-instance v2, Landroid/graphics/PointF;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    iget v3, v3, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->getCenter()Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget v1, v1, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 61
    .line 62
    invoke-direct {v2, v3, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 63
    .line 64
    .line 65
    iput-object v2, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    new-instance v1, Landroid/graphics/PointF;

    .line 69
    .line 70
    const/high16 v2, 0x3f000000    # 0.5f

    .line 71
    .line 72
    invoke-direct {v1, v2, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 73
    .line 74
    .line 75
    iput-object v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 76
    .line 77
    :goto_0
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 78
    .line 79
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 80
    .line 81
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getDeviceOrientation()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    int-to-float v0, v0

    .line 88
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 89
    .line 90
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 91
    .line 92
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 93
    .line 94
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method private drawFaceSticker(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;Ll/omw;[FF)V
    .locals 9

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/Sticker;->isGameSticker:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-eqz p4, :cond_5

    .line 11
    .line 12
    array-length v1, p4

    .line 13
    if-gtz v1, :cond_1

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_1
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFacePositionLeft()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    aget v1, p4, v1

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFacePositionLeft()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    add-int/lit8 v2, v2, 0x44

    .line 28
    .line 29
    aget v2, p4, v2

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFacePositionRight()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    aget v3, p4, v3

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFacePositionRight()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    add-int/lit8 v4, v4, 0x44

    .line 42
    .line 43
    aget v4, p4, v4

    .line 44
    .line 45
    new-instance v5, Landroid/graphics/PointF;

    .line 46
    .line 47
    invoke-direct {v5, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Landroid/graphics/PointF;

    .line 51
    .line 52
    invoke-direct {v1, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 53
    .line 54
    .line 55
    new-instance v2, Landroid/graphics/PointF;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getOffsetX()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    int-to-float v3, v3

    .line 62
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustWidthScale()F

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    mul-float/2addr v3, v4

    .line 67
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getOffsetY()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    int-to-float v4, v4

    .line 72
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustWidthScale()F

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    mul-float/2addr v4, v6

    .line 77
    invoke-direct {v2, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 78
    .line 79
    .line 80
    invoke-static {v2, p5}, Lcom/momo/mcamera/util/PointHelper;->rotatePoint(Landroid/graphics/PointF;F)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->hasCenterPoint()Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    const/4 v4, 0x0

    .line 88
    if-eqz v3, :cond_2

    .line 89
    .line 90
    new-instance v3, Landroid/graphics/PointF;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getCenterIndex()I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    aget v6, p4, v6

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getCenterIndex()I

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    add-int/lit8 v7, v7, 0x44

    .line 103
    .line 104
    aget p4, p4, v7

    .line 105
    .line 106
    invoke-direct {v3, v6, p4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    array-length v3, v3

    .line 115
    const/4 v6, 0x1

    .line 116
    if-ne v3, v6, :cond_3

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    aget v3, v3, v4

    .line 123
    .line 124
    aget v6, p4, v3

    .line 125
    .line 126
    add-int/lit8 v3, v3, 0x44

    .line 127
    .line 128
    aget p4, p4, v3

    .line 129
    .line 130
    new-instance v3, Landroid/graphics/PointF;

    .line 131
    .line 132
    invoke-direct {v3, v6, p4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    aget v3, v3, v4

    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getPointIndexes()[I

    .line 143
    .line 144
    .line 145
    move-result-object v7

    .line 146
    aget v6, v7, v6

    .line 147
    .line 148
    aget v7, p4, v3

    .line 149
    .line 150
    add-int/lit8 v3, v3, 0x44

    .line 151
    .line 152
    aget v3, p4, v3

    .line 153
    .line 154
    aget v8, p4, v6

    .line 155
    .line 156
    add-int/lit8 v6, v6, 0x44

    .line 157
    .line 158
    aget p4, p4, v6

    .line 159
    .line 160
    new-instance v6, Landroid/graphics/PointF;

    .line 161
    .line 162
    invoke-direct {v6, v7, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 163
    .line 164
    .line 165
    new-instance v3, Landroid/graphics/PointF;

    .line 166
    .line 167
    invoke-direct {v3, v8, p4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 168
    .line 169
    .line 170
    invoke-static {v6, v3}, Lcom/momo/mcamera/util/PointHelper;->getCenterPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    :goto_0
    invoke-static {v5, v1}, Lcom/momo/mcamera/util/PointHelper;->getmDistancePoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    .line 175
    .line 176
    .line 177
    move-result-wide v5

    .line 178
    double-to-float p4, v5

    .line 179
    const/high16 v1, 0x43340000    # 180.0f

    .line 180
    .line 181
    div-float/2addr p4, v1

    .line 182
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustWidthScale()F

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    div-float v1, p4, v1

    .line 187
    .line 188
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 189
    .line 190
    .line 191
    move-result v5

    .line 192
    div-int/lit8 v5, v5, 0x2

    .line 193
    .line 194
    int-to-float v5, v5

    .line 195
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    int-to-float v0, v0

    .line 200
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustWidthScale()F

    .line 201
    .line 202
    .line 203
    move-result v6

    .line 204
    mul-float/2addr v0, v6

    .line 205
    div-float/2addr v0, v5

    .line 206
    mul-float/2addr v1, v0

    .line 207
    iget v0, v3, Landroid/graphics/PointF;->x:F

    .line 208
    .line 209
    iget v5, v2, Landroid/graphics/PointF;->x:F

    .line 210
    .line 211
    mul-float/2addr v5, p4

    .line 212
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustWidthScale()F

    .line 213
    .line 214
    .line 215
    move-result v6

    .line 216
    div-float/2addr v5, v6

    .line 217
    add-float/2addr v0, v5

    .line 218
    iput v0, v3, Landroid/graphics/PointF;->x:F

    .line 219
    .line 220
    iget v0, v3, Landroid/graphics/PointF;->y:F

    .line 221
    .line 222
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 223
    .line 224
    mul-float/2addr v2, p4

    .line 225
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustWidthScale()F

    .line 226
    .line 227
    .line 228
    move-result p4

    .line 229
    div-float/2addr v2, p4

    .line 230
    add-float/2addr v0, v2

    .line 231
    iput v0, v3, Landroid/graphics/PointF;->y:F

    .line 232
    .line 233
    new-instance p4, Landroid/graphics/PointF;

    .line 234
    .line 235
    iget v0, v3, Landroid/graphics/PointF;->x:F

    .line 236
    .line 237
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 238
    .line 239
    .line 240
    move-result v2

    .line 241
    int-to-float v2, v2

    .line 242
    div-float/2addr v0, v2

    .line 243
    iget v2, v3, Landroid/graphics/PointF;->y:F

    .line 244
    .line 245
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    int-to-float v3, v3

    .line 250
    div-float/2addr v2, v3

    .line 251
    invoke-direct {p4, v0, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 252
    .line 253
    .line 254
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 255
    .line 256
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 257
    .line 258
    iput-object p4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 259
    .line 260
    iput p5, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 261
    .line 262
    invoke-virtual {p3}, Ll/omw;->n()I

    .line 263
    .line 264
    .line 265
    move-result p4

    .line 266
    if-lez p4, :cond_4

    .line 267
    .line 268
    invoke-virtual {p3, v4}, Ll/omw;->j(I)Ll/nuf;

    .line 269
    .line 270
    .line 271
    move-result-object p4

    .line 272
    invoke-virtual {p4}, Ll/nuf;->l()[F

    .line 273
    .line 274
    .line 275
    move-result-object p4

    .line 276
    iput-object p4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points68:[F

    .line 277
    .line 278
    invoke-virtual {p3, v4}, Ll/omw;->j(I)Ll/nuf;

    .line 279
    .line 280
    .line 281
    move-result-object p4

    .line 282
    invoke-virtual {p4}, Ll/nuf;->m()[F

    .line 283
    .line 284
    .line 285
    move-result-object p4

    .line 286
    iput-object p4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points96:[F

    .line 287
    .line 288
    invoke-virtual {p3, v4}, Ll/omw;->j(I)Ll/nuf;

    .line 289
    .line 290
    .line 291
    move-result-object p4

    .line 292
    invoke-virtual {p4}, Ll/nuf;->j()[F

    .line 293
    .line 294
    .line 295
    move-result-object p4

    .line 296
    iput-object p4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points104:[F

    .line 297
    .line 298
    invoke-virtual {p3, v4}, Ll/omw;->j(I)Ll/nuf;

    .line 299
    .line 300
    .line 301
    move-result-object p3

    .line 302
    invoke-virtual {p3}, Ll/nuf;->z()[F

    .line 303
    .line 304
    .line 305
    move-result-object p3

    .line 306
    iput-object p3, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->warpedPoints104:[F

    .line 307
    .line 308
    :cond_4
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 309
    .line 310
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 311
    .line 312
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 313
    .line 314
    .line 315
    :cond_5
    :goto_1
    return-void
.end method

.method private drawFixedSticker(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    const/high16 v2, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v1, v2

    .line 11
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isShowTop()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    int-to-float v3, v3

    .line 22
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustHeightScale()F

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    mul-float/2addr v3, v4

    .line 27
    div-float/2addr v3, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    int-to-float v3, v3

    .line 34
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    int-to-float v4, v4

    .line 39
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustHeightScale()F

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    mul-float/2addr v4, v5

    .line 44
    div-float/2addr v4, v2

    .line 45
    sub-float/2addr v3, v4

    .line 46
    :goto_0
    new-instance v4, Landroid/graphics/PointF;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    int-to-float v5, v5

    .line 53
    div-float/2addr v1, v5

    .line 54
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    int-to-float v5, v5

    .line 59
    div-float/2addr v3, v5

    .line 60
    invoke-direct {v4, v1, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    int-to-float v1, v1

    .line 70
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustHeightScale()F

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    mul-float/2addr v1, v3

    .line 75
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    int-to-float v3, v3

    .line 80
    div-float/2addr v3, v2

    .line 81
    div-float/2addr v1, v3

    .line 82
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 83
    .line 84
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 85
    .line 86
    iput-object v4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getDeviceOrientation()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    int-to-float v0, v0

    .line 93
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 94
    .line 95
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 96
    .line 97
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 98
    .line 99
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method private drawFullScreenFixed(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    iget-object v3, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 15
    .line 16
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-float v3, v3

    .line 21
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustHeightScale()F

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    mul-float/2addr v3, v4

    .line 26
    sub-float/2addr v2, v3

    .line 27
    div-float/2addr v2, v1

    .line 28
    iget-object v3, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    int-to-float v3, v3

    .line 35
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->getAdjustHeightScale()F

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    mul-float/2addr v3, v4

    .line 40
    div-float/2addr v3, v1

    .line 41
    add-float/2addr v2, v3

    .line 42
    new-instance v3, Landroid/graphics/PointF;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    int-to-float v4, v4

    .line 49
    div-float/2addr v0, v4

    .line 50
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    int-to-float v4, v4

    .line 55
    div-float/2addr v2, v4

    .line 56
    invoke-direct {v3, v0, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const/16 v2, 0x168

    .line 66
    .line 67
    if-le v0, v2, :cond_0

    .line 68
    .line 69
    :goto_0
    move v0, v1

    .line 70
    goto :goto_1

    .line 71
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const/16 v2, 0x2d0

    .line 76
    .line 77
    if-ne v0, v2, :cond_1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :goto_1
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 84
    .line 85
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 86
    .line 87
    iput-object v3, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 88
    .line 89
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getDeviceOrientation()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    int-to-float v0, v0

    .line 96
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 97
    .line 98
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 99
    .line 100
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 101
    .line 102
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method private drawGestureFilter(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isDonotTrack()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawGestureFixedFilter(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private drawGestureFixedFilter(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 11

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->triggerType:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    array-length v2, v0

    .line 43
    const/4 v3, 0x0

    .line 44
    :goto_0
    if-ge v3, v2, :cond_3

    .line 45
    .line 46
    aget-object v4, v0, v3

    .line 47
    .line 48
    iget-object v5, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->triggerType:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v6, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    if-eqz v5, :cond_2

    .line 57
    .line 58
    new-instance v5, Landroid/graphics/RectF;

    .line 59
    .line 60
    iget v6, v4, Lcom/momocv/MMRect;->x_:I

    .line 61
    .line 62
    int-to-float v7, v6

    .line 63
    iget v8, v4, Lcom/momocv/MMRect;->y_:I

    .line 64
    .line 65
    int-to-float v9, v8

    .line 66
    iget v10, v4, Lcom/momocv/MMRect;->width_:I

    .line 67
    .line 68
    add-int/2addr v6, v10

    .line 69
    int-to-float v6, v6

    .line 70
    iget v4, v4, Lcom/momocv/MMRect;->height_:I

    .line 71
    .line 72
    add-int/2addr v8, v4

    .line 73
    int-to-float v4, v8

    .line 74
    invoke-direct {v5, v7, v9, v6, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 75
    .line 76
    .line 77
    iput-object v5, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->gestureRect:Landroid/graphics/RectF;

    .line 78
    .line 79
    iget-object v4, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 80
    .line 81
    iput-object v4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 82
    .line 83
    new-instance v4, Landroid/graphics/PointF;

    .line 84
    .line 85
    invoke-direct {v4, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 86
    .line 87
    .line 88
    iput-object v4, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 89
    .line 90
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 91
    .line 92
    .line 93
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    :goto_1
    return-void

    .line 97
    :cond_4
    :goto_2
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 98
    .line 99
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 100
    .line 101
    new-instance p0, Landroid/graphics/PointF;

    .line 102
    .line 103
    invoke-direct {p0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 104
    .line 105
    .line 106
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 107
    .line 108
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method private drawScaleCenterCrop(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    const/high16 v2, 0x40000000    # 2.0f

    .line 14
    .line 15
    div-float/2addr v1, v2

    .line 16
    div-float/2addr v0, v1

    .line 17
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    iget-object v2, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    int-to-float v2, v2

    .line 31
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    int-to-float v3, v3

    .line 36
    mul-float/2addr v3, v1

    .line 37
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    int-to-float v4, v4

    .line 42
    mul-float/2addr v4, v2

    .line 43
    cmpl-float v3, v3, v4

    .line 44
    .line 45
    if-lez v3, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    int-to-float v1, v1

    .line 52
    div-float/2addr v1, v2

    .line 53
    mul-float/2addr v1, v0

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    int-to-float v2, v2

    .line 60
    div-float/2addr v2, v1

    .line 61
    mul-float v1, v2, v0

    .line 62
    .line 63
    :goto_0
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 64
    .line 65
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 66
    .line 67
    new-instance v0, Landroid/graphics/PointF;

    .line 68
    .line 69
    const/high16 v1, 0x3f000000    # 0.5f

    .line 70
    .line 71
    invoke-direct {v0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 75
    .line 76
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getDeviceOrientation()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    int-to-float v0, v0

    .line 83
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 84
    .line 85
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 86
    .line 87
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 88
    .line 89
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method private drawScaleToFill(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    const/high16 v2, 0x40000000    # 2.0f

    .line 14
    .line 15
    div-float/2addr v1, v2

    .line 16
    div-float/2addr v0, v1

    .line 17
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    iget-object v2, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    int-to-float v2, v2

    .line 29
    div-float/2addr v1, v2

    .line 30
    mul-float/2addr v1, v0

    .line 31
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleH:F

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    int-to-float v1, v1

    .line 38
    iget-object v2, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    int-to-float v2, v2

    .line 45
    div-float/2addr v1, v2

    .line 46
    mul-float/2addr v1, v0

    .line 47
    iput v1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->scaleW:F

    .line 48
    .line 49
    new-instance v0, Landroid/graphics/PointF;

    .line 50
    .line 51
    const/high16 v1, 0x3f000000    # 0.5f

    .line 52
    .line 53
    invoke-direct {v0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->centerPoint:Landroid/graphics/PointF;

    .line 57
    .line 58
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getDeviceOrientation()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    int-to-float v0, v0

    .line 65
    iput v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->angle:F

    .line 66
    .line 67
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 68
    .line 69
    iput-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private drawSubStickerItem(Lcom/momo/mcamera/mask/StickerItem;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    iput v1, p1, Lcom/momo/mcamera/mask/StickerItem;->imageWidth:F

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    iput v1, p1, Lcom/momo/mcamera/mask/StickerItem;->imageHeight:F

    .line 19
    .line 20
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->mvpLists:Ljava/util/List;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz v1, :cond_5

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-lez v1, :cond_5

    .line 30
    .line 31
    iget-boolean v1, p1, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 32
    .line 33
    if-eqz v1, :cond_5

    .line 34
    .line 35
    instance-of v1, p1, Lcom/momo/mcamera/mask/StickerETC1Item;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    move-object v1, p1

    .line 40
    check-cast v1, Lcom/momo/mcamera/mask/StickerETC1Item;

    .line 41
    .line 42
    iget v2, v1, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1_texture_sticker:I

    .line 43
    .line 44
    if-nez v2, :cond_0

    .line 45
    .line 46
    iget-object v2, v1, Lcom/momo/mcamera/mask/StickerETC1Item;->texture:Landroid/opengl/ETC1Util$ETC1Texture;

    .line 47
    .line 48
    invoke-static {v2}, Lcom/core/glcore/util/TextureHelper;->etc1ToTexture(Landroid/opengl/ETC1Util$ETC1Texture;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    iput v2, v1, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1_texture_sticker:I

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto/16 :goto_3

    .line 57
    .line 58
    :cond_0
    :goto_0
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerETC1Item;->updateETC1Coordinate()V

    .line 59
    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Lcom/momo/mcamera/mask/StickerItem;->getMmcvImage(Landroid/content/Context;)Ll/umw;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    if-eqz v1, :cond_3

    .line 70
    .line 71
    invoke-virtual {v1}, Ll/umw;->a()[B

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    if-eqz v3, :cond_3

    .line 76
    .line 77
    iget v3, p1, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 78
    .line 79
    if-nez v3, :cond_2

    .line 80
    .line 81
    invoke-static {v1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    iput v1, p1, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_2
    invoke-static {v3, v1}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    iput v1, p1, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->getBitmap()Landroid/graphics/Bitmap;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    if-eqz v1, :cond_7

    .line 100
    .line 101
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-nez v3, :cond_7

    .line 106
    .line 107
    iget v3, p1, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 108
    .line 109
    if-lez v3, :cond_4

    .line 110
    .line 111
    invoke-static {v1, v3}, Lcom/core/glcore/util/TextureHelper;->updateBitmap(Landroid/graphics/Bitmap;I)V

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_4
    invoke-static {v1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    iput v1, p1, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_5
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getLoopStart()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-lez v1, :cond_6

    .line 129
    .line 130
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 131
    .line 132
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->isAlwaysShow()Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_7

    .line 137
    .line 138
    :cond_6
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 139
    .line 140
    iput v2, v1, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 141
    .line 142
    :cond_7
    :goto_1
    iget-boolean v1, p1, Lcom/momo/mcamera/mask/StickerItem;->isDraw:Z

    .line 143
    .line 144
    if-eqz v1, :cond_a

    .line 145
    .line 146
    iget v1, p1, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 147
    .line 148
    if-nez v1, :cond_8

    .line 149
    .line 150
    if-eqz v2, :cond_a

    .line 151
    .line 152
    :cond_8
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->isPreMultiAlpha()Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->isPreMultiMode:Z

    .line 159
    .line 160
    iget-object v1, p1, Lcom/momo/mcamera/mask/StickerItem;->mvpLists:Ljava/util/List;

    .line 161
    .line 162
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    if-eqz v2, :cond_9

    .line 171
    .line 172
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    check-cast v2, [F

    .line 177
    .line 178
    invoke-virtual {p0, p1, v2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->passStickerShaderValues(Lcom/momo/mcamera/mask/StickerItem;[F)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->getStickerAspectRatio()F

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    invoke-virtual {p0, v2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawStick(F)V

    .line 186
    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_9
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 190
    .line 191
    .line 192
    :cond_a
    monitor-exit v0

    .line 193
    return-void

    .line 194
    :goto_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    throw p0
.end method

.method private drawSubStickerItemByAll(Lcom/momo/mcamera/mask/StickerItem;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->getEffectTimeBean()Ll/ore;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/momo/mcamera/mask/Sticker;->isHaniSticker:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-wide v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentTime:J

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->getEffectTimeBean()Ll/ore;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-wide v2, v2, Ll/ore;->a:J

    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-ltz v0, :cond_0

    .line 24
    .line 25
    iget-wide v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentTime:J

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->getEffectTimeBean()Ll/ore;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-wide v2, v2, Ll/ore;->b:J

    .line 32
    .line 33
    cmp-long v0, v0, v2

    .line 34
    .line 35
    if-gtz v0, :cond_0

    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawSubStickerItem(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void

    .line 41
    :cond_1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawSubStickerItem(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private judgeHaveSameSticker(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/StickerItem;)Z
    .locals 1

    .line 1
    instance-of v0, p2, Lcom/momo/mcamera/mask/StickerDelegateItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p2, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getImageProvider()Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p2, Lcom/momo/mcamera/mask/StickerDelegateItem;

    .line 14
    .line 15
    invoke-virtual {p2, p1}, Lcom/momo/mcamera/mask/StickerDelegateItem;->replaceSticker(Lcom/momo/mcamera/mask/Sticker;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->removeStickerItem(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private removeHaniStickerFromList(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/StickerItem;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/momo/mcamera/mask/StickerItem;

    .line 16
    .line 17
    instance-of v1, v0, Lcom/momo/mcamera/mask/StickerHaniItem;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    move-object v1, v0

    .line 22
    check-cast v1, Lcom/momo/mcamera/mask/StickerHaniItem;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getModelType()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-ne v1, p2, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method private removeStickerFromList(Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/StickerItem;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/momo/mcamera/mask/StickerItem;

    .line 16
    .line 17
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method

.method private setHanniStickerParamInItemList(Ljava/util/List;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/StickerItem;",
            ">;",
            "Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;",
            "I)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x0

    .line 3
    move v1, v0

    .line 4
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-ge v1, v2, :cond_1

    .line 9
    .line 10
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Lcom/momo/mcamera/mask/StickerItem;

    .line 15
    .line 16
    instance-of v3, v2, Lcom/momo/mcamera/mask/StickerHaniItem;

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    move-object p0, v2

    .line 21
    check-cast p0, Lcom/momo/mcamera/mask/StickerHaniItem;

    .line 22
    .line 23
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getModelType()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-ne v3, p3, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/mask/StickerHaniItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 43
    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void
.end method

.method private updateFaceInfoBySingleItem(Ll/omw;F[FZLcom/momo/mcamera/mask/StickerItem;)V
    .locals 3

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->lastStickerTime:J

    .line 2
    .line 3
    invoke-virtual {p5, v0, v1}, Lcom/momo/mcamera/mask/StickerItem;->setCurrentTime(J)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p5, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 7
    .line 8
    move v1, p4

    .line 9
    move-object p4, p3

    .line 10
    move-object p3, p1

    .line 11
    move-object p1, p5

    .line 12
    move p5, p2

    .line 13
    new-instance p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;

    .line 14
    .line 15
    invoke-direct {p2}, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;-><init>()V

    .line 16
    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 21
    .line 22
    iput-object v2, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawAllStickers(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;Z)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    invoke-direct/range {p0 .. p5}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawFaceSticker(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;Ll/omw;[FF)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void

    .line 40
    :cond_1
    invoke-virtual {p0, p1, p2, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawAllStickers(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;Z)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public addSticker(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getEtcTextureBatch()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/momo/mcamera/mask/StickerETC1Item;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 12
    .line 13
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerETC1Item;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "weex"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    new-instance v0, Lcom/momo/mcamera/mask/StickerDelegateItem;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 42
    .line 43
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerDelegateItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-boolean v0, p1, Lcom/momo/mcamera/mask/Sticker;->isGameSticker:Z

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    if-ne v0, v1, :cond_2

    .line 51
    .line 52
    new-instance v0, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 55
    .line 56
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerGameItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const-string v0, "STICKER_TYPE_GAME_FIX_TYPE"

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    new-instance v0, Lcom/momo/mcamera/mask/StickerFixItem;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 75
    .line 76
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerFixItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    iget-boolean v0, p1, Lcom/momo/mcamera/mask/Sticker;->isHaniSticker:Z

    .line 81
    .line 82
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->context:Landroid/content/Context;

    .line 83
    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    new-instance v0, Lcom/momo/mcamera/mask/StickerHaniItem;

    .line 87
    .line 88
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerHaniItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_4
    new-instance v0, Lcom/momo/mcamera/mask/StickerItem;

    .line 93
    .line 94
    invoke-direct {v0, p1, v1}, Lcom/momo/mcamera/mask/StickerItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 95
    .line 96
    .line 97
    :goto_0
    invoke-virtual {v0, p2}, Lcom/momo/mcamera/mask/StickerItem;->setStickerStateChangeListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    .line 101
    .line 102
    .line 103
    move-result-wide v1

    .line 104
    const-wide/16 v3, 0x0

    .line 105
    .line 106
    cmp-long p2, v1, v3

    .line 107
    .line 108
    if-lez p2, :cond_5

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getDuration()J

    .line 111
    .line 112
    .line 113
    move-result-wide p1

    .line 114
    iput-wide p1, v0, Lcom/momo/mcamera/mask/StickerItem;->mStickerDuration:J

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_5
    const-wide/32 p1, 0x1c9c380

    .line 118
    .line 119
    .line 120
    iput-wide p1, v0, Lcom/momo/mcamera/mask/StickerItem;->mStickerDuration:J

    .line 121
    .line 122
    :goto_1
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->addSticker(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 123
    .line 124
    .line 125
    :cond_6
    return-void
.end method

.method public addSticker(Lcom/momo/mcamera/mask/StickerItem;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 126
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mProjectionMatrix:[F

    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/StickerItem;->setProjectionMatrix([F)V

    .line 127
    new-instance v0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;

    invoke-direct {v0, p0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter$1;-><init>(Lcom/momo/mcamera/mask/MultiStickerMaskFilter;Lcom/momo/mcamera/mask/StickerItem;)V

    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/StickerItem;->setFinishListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;)V

    .line 128
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getPollTrigger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 129
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 130
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getGroupNum()I

    move-result v0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 131
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method public bindShaderAttributes()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->bindShaderAttributes()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    const-string v2, "uMVPMatrix"

    .line 8
    .line 9
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget p0, p0, Ll/wej;->programHandle:I

    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    const-string v1, "decorationSize"

    .line 16
    .line 17
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public clearMaskWithModelType(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 12
    .line 13
    invoke-direct {p0, v0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->clearMaskWithModeTypeFromList(Ljava/util/List;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-lez v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ljava/util/List;

    .line 43
    .line 44
    invoke-direct {p0, v1, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->clearMaskWithModeTypeFromList(Ljava/util/List;I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 51
    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 55
    .line 56
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/momo/mcamera/mask/StickerItem;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerItem;->destroy()V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 42
    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-lez v0, :cond_4

    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-eqz v3, :cond_2

    .line 78
    .line 79
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    check-cast v3, Lcom/momo/mcamera/mask/StickerItem;

    .line 84
    .line 85
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerItem;->destroy()V

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 96
    .line 97
    .line 98
    :cond_4
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 99
    .line 100
    if-eqz v0, :cond_6

    .line 101
    .line 102
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-lez v0, :cond_6

    .line 107
    .line 108
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 109
    .line 110
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_5

    .line 119
    .line 120
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Lcom/momo/mcamera/mask/StickerItem;

    .line 125
    .line 126
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/StickerItem;->destroy()V

    .line 127
    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_5
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 131
    .line 132
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 133
    .line 134
    .line 135
    :cond_6
    return-void
.end method

.method public drawAllStickers(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;Z)Z
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v3, "object_follower"

    .line 19
    .line 20
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawGestureFilter(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 30
    .line 31
    .line 32
    goto/16 :goto_0

    .line 33
    .line 34
    :cond_0
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isAlwaysShow()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    if-nez p3, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 43
    .line 44
    .line 45
    goto/16 :goto_0

    .line 46
    .line 47
    :cond_1
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-ne v1, v2, :cond_2

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawFixedSticker(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    const/4 v3, 0x2

    .line 65
    if-ne v1, v3, :cond_3

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 68
    .line 69
    .line 70
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawFullScreenFixed(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    const/4 v3, 0x3

    .line 79
    if-ne v1, v3, :cond_4

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 82
    .line 83
    .line 84
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawScaleToFill(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_4
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    const/16 v3, 0x63

    .line 93
    .line 94
    if-ne v1, v3, :cond_5

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 97
    .line 98
    .line 99
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawScaleCenterCrop(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    const/4 v3, 0x5

    .line 108
    if-ne v1, v3, :cond_6

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 111
    .line 112
    .line 113
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawAbsolutePostion(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_6
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    const/4 v3, 0x6

    .line 122
    if-ne v1, v3, :cond_7

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 125
    .line 126
    .line 127
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawAbsolutePostionUseStcikerDim(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_7
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getType()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    const/4 v3, 0x7

    .line 136
    if-ne v1, v3, :cond_8

    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerItem;->clearPoints()V

    .line 139
    .line 140
    .line 141
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawAbsPostionAdjustResolution(Lcom/momo/mcamera/mask/StickerItem;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 142
    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_8
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isNotHiddenAfterTrigger()Z

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    if-eqz p0, :cond_9

    .line 150
    .line 151
    if-nez p3, :cond_9

    .line 152
    .line 153
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 154
    .line 155
    .line 156
    :goto_0
    return v2

    .line 157
    :cond_9
    const/4 p0, 0x0

    .line 158
    return p0
.end method

.method public drawBackgroundImage()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    const/16 v4, 0x1406

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->decorateHandler:I

    .line 26
    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-static {v0, v2, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setUseETC1(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 36
    .line 37
    const/16 v2, 0x8

    .line 38
    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    new-array v0, v2, [F

    .line 42
    .line 43
    iput-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 44
    .line 45
    :cond_0
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    iget v3, p0, Ll/wej;->curRotation:I

    .line 48
    .line 49
    aget-object v0, v0, v3

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 55
    .line 56
    iget v3, p0, Ll/wej;->curRotation:I

    .line 57
    .line 58
    aget-object v0, v0, v3

    .line 59
    .line 60
    iget-object v3, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->get([F)Ljava/nio/FloatBuffer;

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 66
    .line 67
    const/4 v3, 0x4

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 71
    .line 72
    array-length v0, v0

    .line 73
    mul-int/2addr v0, v3

    .line 74
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 91
    .line 92
    :cond_1
    move v0, v1

    .line 93
    :goto_0
    if-ge v0, v2, :cond_2

    .line 94
    .line 95
    iget-object v4, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 96
    .line 97
    aget v5, v4, v0

    .line 98
    .line 99
    const/high16 v6, -0x40800000    # -1.0f

    .line 100
    .line 101
    mul-float/2addr v5, v6

    .line 102
    const/high16 v6, 0x3f000000    # 0.5f

    .line 103
    .line 104
    add-float/2addr v5, v6

    .line 105
    aput v5, v4, v0

    .line 106
    .line 107
    add-int/lit8 v0, v0, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 116
    .line 117
    iget-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->textureCoord:[F

    .line 118
    .line 119
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 125
    .line 126
    .line 127
    iget v4, p0, Ll/wej;->texCoordHandle:I

    .line 128
    .line 129
    const/16 v8, 0x8

    .line 130
    .line 131
    iget-object v9, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 132
    .line 133
    const/4 v5, 0x2

    .line 134
    const/16 v6, 0x1406

    .line 135
    .line 136
    const/4 v7, 0x0

    .line 137
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 138
    .line 139
    .line 140
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 141
    .line 142
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 143
    .line 144
    .line 145
    const v0, 0x84c0

    .line 146
    .line 147
    .line 148
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 149
    .line 150
    .line 151
    const/16 v0, 0xde1

    .line 152
    .line 153
    iget v2, p0, Ll/wej;->texture_in:I

    .line 154
    .line 155
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 156
    .line 157
    .line 158
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 159
    .line 160
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 161
    .line 162
    .line 163
    const/4 v0, 0x5

    .line 164
    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 168
    .line 169
    .line 170
    iget p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->positionHandle3:I

    .line 171
    .line 172
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public drawStick(F)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->decorateHandler:I

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawOrder:[S

    .line 9
    .line 10
    array-length p1, p1

    .line 11
    const/16 v0, 0x1403

    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawListBuffer:Ljava/nio/ShortBuffer;

    .line 14
    .line 15
    const/4 v2, 0x4

    .line 16
    invoke-static {v2, p1, v0, v1}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 20
    .line 21
    .line 22
    iget p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->positionHandle3:I

    .line 23
    .line 24
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public drawSub()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/wej;->programHandle:I

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 16
    .line 17
    .line 18
    const/high16 v0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v0, v0, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x4100

    .line 25
    .line 26
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawBackgroundImage()V

    .line 30
    .line 31
    .line 32
    const/16 v0, 0xbe2

    .line 33
    .line 34
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 35
    .line 36
    .line 37
    const/16 v1, 0x303

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    const/16 v3, 0x302

    .line 41
    .line 42
    invoke-static {v3, v1, v2, v1}, Landroid/opengl/GLES20;->glBlendFuncSeparate(IIII)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-lez v1, :cond_3

    .line 52
    .line 53
    new-instance v1, Ljava/util/ArrayList;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 56
    .line 57
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_2

    .line 69
    .line 70
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Lcom/momo/mcamera/mask/StickerItem;

    .line 75
    .line 76
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/StickerItem;->destroy()V

    .line 77
    .line 78
    .line 79
    iget-object v4, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v4, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    iget-object v4, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 85
    .line 86
    if-eqz v4, :cond_1

    .line 87
    .line 88
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-lez v4, :cond_1

    .line 93
    .line 94
    iget-object v4, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    if-eqz v5, :cond_1

    .line 105
    .line 106
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    check-cast v5, Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v5, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v6

    .line 116
    if-eqz v6, :cond_0

    .line 117
    .line 118
    invoke-interface {v5, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_1
    iget-object v4, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v4, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 129
    .line 130
    .line 131
    :cond_3
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 132
    .line 133
    if-eqz v1, :cond_4

    .line 134
    .line 135
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-lez v1, :cond_4

    .line 140
    .line 141
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    if-eqz v2, :cond_4

    .line 152
    .line 153
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    check-cast v2, Lcom/momo/mcamera/mask/StickerItem;

    .line 158
    .line 159
    invoke-direct {p0, v2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawSubStickerItemByAll(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 160
    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_4
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentStickerItem:Ljava/util/List;

    .line 164
    .line 165
    if-eqz v1, :cond_5

    .line 166
    .line 167
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-lez v1, :cond_5

    .line 172
    .line 173
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentStickerItem:Ljava/util/List;

    .line 174
    .line 175
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    if-eqz v2, :cond_5

    .line 184
    .line 185
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    check-cast v2, Lcom/momo/mcamera/mask/StickerItem;

    .line 190
    .line 191
    invoke-direct {p0, v2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->drawSubStickerItemByAll(Lcom/momo/mcamera/mask/StickerItem;)V

    .line 192
    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_5
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public getAdjustHeightScale()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x44200000    # 640.0f

    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    mul-float/2addr p0, v2

    .line 21
    div-float/2addr p0, v1

    .line 22
    return p0
.end method

.method public getAdjustWidthScale()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x43f00000    # 480.0f

    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/high16 p0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    div-float/2addr p0, v1

    .line 21
    return p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D inputImageTexture0;uniform float etc1Flag;\nuniform int isPreMulti;\nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture0,textureCoordinate);\nif(etc1Flag > 0.5){\n   color1.a  = texture2D(inputImageTexture0,textureCoordinate1).r;\n}else{\n   if(isPreMulti == 1){\n       if (color1.a > 0.0) {color1.rgb = color1.rgb/color1.a;}   }\n}\n   gl_FragColor = color1; }"

    .line 2
    .line 3
    return-object p0
.end method

.method public getOrderedIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->orderedIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public getScaleHeightRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->scaleHeightRatio:F

    .line 2
    .line 3
    return p0
.end method

.method public getScaleWidthRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->scaleWidthRatio:F

    .line 2
    .line 3
    return p0
.end method

.method public getStickerItemListSize()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-lez v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    add-int/2addr v2, v3

    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    add-int/2addr p0, v2

    .line 54
    monitor-exit v0

    .line 55
    return p0

    .line 56
    :cond_1
    monitor-exit v0

    .line 57
    return v2

    .line 58
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   inputTextureCoordinate ; attribute vec4   position3 ; varying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform vec2 decorationSize;\nuniform mediump float etc1Flag;\nvoid main() {  gl_Position = position;  vec2 coord = inputTextureCoordinate.xy;  if(etc1Flag > 0.5){\n    vec2 coord1 = position3.xy;    textureCoordinate1 = vec2(1.0 - (coord1.x + 0.5),1.0-(coord1.y + 0.5));\n  }else{\n    coord = (coord) / decorationSize;\n   }\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public handleSizeChange()V
    .locals 9

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    int-to-float v1, v1

    .line 26
    div-float/2addr v0, v1

    .line 27
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mProjectionMatrix:[F

    .line 28
    .line 29
    const/high16 v2, -0x40800000    # -1.0f

    .line 30
    .line 31
    div-float v5, v2, v0

    .line 32
    .line 33
    const/high16 v2, 0x3f800000    # 1.0f

    .line 34
    .line 35
    div-float v6, v2, v0

    .line 36
    .line 37
    const/high16 v7, 0x40400000    # 3.0f

    .line 38
    .line 39
    const/high16 v8, 0x40e00000    # 7.0f

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    const/high16 v3, -0x40800000    # -1.0f

    .line 43
    .line 44
    const/high16 v4, 0x3f800000    # 1.0f

    .line 45
    .line 46
    invoke-static/range {v1 .. v8}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 47
    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->projectionInit:Z

    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "position3"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->positionHandle3:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "uMVPMatrix"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mVPMatrixHandler:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "decorationSize"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->decorateHandler:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "etc1Flag"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mETC1Handler:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "isPreMulti"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->isPreMultiHandle:I

    .line 53
    .line 54
    return-void
.end method

.method public isHaveSameSticker(Lcom/momo/mcamera/mask/Sticker;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/momo/mcamera/mask/StickerItem;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iget-object v4, v2, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 36
    .line 37
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    invoke-direct {p0, p1, v2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->judgeHaveSameSticker(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/StickerItem;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0

    .line 52
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-lez v0, :cond_5

    .line 61
    .line 62
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_5

    .line 73
    .line 74
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    :cond_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    if-eqz v3, :cond_3

    .line 89
    .line 90
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    check-cast v3, Lcom/momo/mcamera/mask/StickerItem;

    .line 95
    .line 96
    iget-object v4, v3, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 97
    .line 98
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-eqz v4, :cond_4

    .line 111
    .line 112
    invoke-direct {p0, p1, v3}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->judgeHaveSameSticker(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/StickerItem;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    return p0

    .line 117
    :cond_5
    return v1
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-object p3, p2, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 7
    .line 8
    iput-object p3, p0, Ll/gfj;->inputFrameBuffer:Ll/lej;

    .line 9
    .line 10
    iput p1, p0, Ll/wej;->texture_in:I

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public passStickerShaderValues(Lcom/momo/mcamera/mask/StickerItem;[F)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerItem;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    array-length v3, v2

    .line 12
    mul-int/lit8 v3, v3, 0x4

    .line 13
    .line 14
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iput-object v3, v1, Lcom/momo/mcamera/mask/StickerItem;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    :cond_0
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerItem;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerItem;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 38
    .line 39
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    .line 42
    iget-object v2, v1, Lcom/momo/mcamera/mask/StickerItem;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    invoke-virtual {v2, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    instance-of v2, v1, Lcom/momo/mcamera/mask/StickerETC1Item;

    .line 48
    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    const/4 v3, 0x1

    .line 52
    invoke-virtual {v0, v3}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setUseETC1(Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {v0, v4}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setUseETC1(Z)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget v3, v0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->isPreMultiHandle:I

    .line 60
    .line 61
    iget-boolean v5, v0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->isPreMultiMode:Z

    .line 62
    .line 63
    invoke-static {v3, v5}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 64
    .line 65
    .line 66
    iget v6, v0, Ll/wej;->positionHandle:I

    .line 67
    .line 68
    const/16 v10, 0x8

    .line 69
    .line 70
    iget-object v11, v1, Lcom/momo/mcamera/mask/StickerItem;->fvertexBuffer:Ljava/nio/FloatBuffer;

    .line 71
    .line 72
    const/4 v7, 0x2

    .line 73
    const/16 v8, 0x1406

    .line 74
    .line 75
    const/4 v9, 0x0

    .line 76
    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 77
    .line 78
    .line 79
    iget v12, v0, Ll/wej;->texCoordHandle:I

    .line 80
    .line 81
    const/16 v16, 0x8

    .line 82
    .line 83
    iget-object v3, v1, Lcom/momo/mcamera/mask/StickerItem;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 84
    .line 85
    const/4 v13, 0x2

    .line 86
    const/16 v14, 0x1406

    .line 87
    .line 88
    const/4 v15, 0x0

    .line 89
    move-object/from16 v17, v3

    .line 90
    .line 91
    invoke-static/range {v12 .. v17}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 92
    .line 93
    .line 94
    iget v5, v0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->positionHandle3:I

    .line 95
    .line 96
    const/16 v9, 0x8

    .line 97
    .line 98
    iget-object v10, v1, Lcom/momo/mcamera/mask/StickerItem;->vertexBuffer2:Ljava/nio/FloatBuffer;

    .line 99
    .line 100
    const/4 v6, 0x2

    .line 101
    const/16 v7, 0x1406

    .line 102
    .line 103
    const/4 v8, 0x0

    .line 104
    invoke-static/range {v5 .. v10}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 105
    .line 106
    .line 107
    iget v3, v0, Ll/wej;->positionHandle:I

    .line 108
    .line 109
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 110
    .line 111
    .line 112
    iget v3, v0, Ll/wej;->texCoordHandle:I

    .line 113
    .line 114
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 115
    .line 116
    .line 117
    iget v3, v0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->positionHandle3:I

    .line 118
    .line 119
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 120
    .line 121
    .line 122
    const v3, 0x84c0

    .line 123
    .line 124
    .line 125
    invoke-static {v3}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 126
    .line 127
    .line 128
    const/16 v3, 0xde1

    .line 129
    .line 130
    if-eqz v2, :cond_2

    .line 131
    .line 132
    check-cast v1, Lcom/momo/mcamera/mask/StickerETC1Item;

    .line 133
    .line 134
    iget v1, v1, Lcom/momo/mcamera/mask/StickerETC1Item;->etc1_texture_sticker:I

    .line 135
    .line 136
    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_2
    iget v1, v1, Lcom/momo/mcamera/mask/StickerItem;->texture_sticker:I

    .line 141
    .line 142
    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 143
    .line 144
    .line 145
    :goto_1
    iget v0, v0, Ll/wej;->textureHandle:I

    .line 146
    .line 147
    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public removeHaniSticker(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 12
    .line 13
    invoke-direct {p0, v0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->removeHaniStickerFromList(Ljava/util/List;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ljava/util/List;

    .line 43
    .line 44
    invoke-direct {p0, v1, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->removeHaniStickerFromList(Ljava/util/List;I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-void
.end method

.method public removeSticker(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 12
    .line 13
    invoke-direct {p0, v0, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->removeStickerFromList(Ljava/util/List;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ljava/util/List;

    .line 43
    .line 44
    invoke-direct {p0, v1, p1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->removeStickerFromList(Ljava/util/List;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-void
.end method

.method public removeStickerItem(Lcom/momo/mcamera/mask/StickerItem;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemDestroyList:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public setDeviceOrientation(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/momo/mcamera/mask/StickerItem;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/Sticker;->setDeviceOrientation(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    return-void
.end method

.method public setDownVelocity(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/momo/mcamera/mask/StickerItem;

    .line 18
    .line 19
    instance-of v2, v1, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    check-cast v1, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 24
    .line 25
    iput p1, v1, Lcom/momo/mcamera/mask/StickerGameItem;->downVelocity:F

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 29
    .line 30
    if-eqz v0, :cond_4

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-lez v0, :cond_4

    .line 37
    .line 38
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Lcom/momo/mcamera/mask/StickerItem;

    .line 71
    .line 72
    instance-of v2, v1, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 73
    .line 74
    if-eqz v2, :cond_3

    .line 75
    .line 76
    check-cast v1, Lcom/momo/mcamera/mask/StickerGameItem;

    .line 77
    .line 78
    iput p1, v1, Lcom/momo/mcamera/mask/StickerGameItem;->downVelocity:F

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_4
    return-void
.end method

.method public setEffectTimeInfoByHaniId(Ll/ore;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/momo/mcamera/mask/StickerItem;

    .line 28
    .line 29
    iget-object v1, v0, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getModelType()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-ne v1, p2, :cond_0

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/StickerItem;->setEffectTimeInfo(Ll/ore;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public setFilterTriggerManager(Lcom/momo/mcamera/mask/FilterTriggerManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->filterTriggerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 2
    .line 3
    return-void
.end method

.method public setHaniStickerParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setHanniStickerParamInItemList(Ljava/util/List;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ljava/util/List;

    .line 33
    .line 34
    invoke-direct {p0, v1, p1, p2}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->setHanniStickerParamInItemList(Ljava/util/List;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 10

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->lastStickerTime:J

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->projectionInit:Z

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-float v0, v0

    .line 29
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    int-to-float v2, v2

    .line 34
    div-float/2addr v0, v2

    .line 35
    iget-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mProjectionMatrix:[F

    .line 36
    .line 37
    const/high16 v3, -0x40800000    # -1.0f

    .line 38
    .line 39
    div-float v6, v3, v0

    .line 40
    .line 41
    const/high16 v3, 0x3f800000    # 1.0f

    .line 42
    .line 43
    div-float v7, v3, v0

    .line 44
    .line 45
    const/high16 v8, 0x40400000    # 3.0f

    .line 46
    .line 47
    const/high16 v9, 0x40e00000    # 7.0f

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    const/high16 v4, -0x40800000    # -1.0f

    .line 51
    .line 52
    const/high16 v5, 0x3f800000    # 1.0f

    .line 53
    .line 54
    invoke-static/range {v2 .. v9}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 55
    .line 56
    .line 57
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->projectionInit:Z

    .line 58
    .line 59
    :cond_0
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-gtz v0, :cond_1

    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    const/4 v1, 0x0

    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-virtual {p0, p1, v2, v0, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->updateFaceInfo(Ll/omw;F[FZ)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->faceIndex:I

    .line 73
    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-ge v0, v2, :cond_2

    .line 81
    .line 82
    iget v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->faceIndex:I

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/nuf;->f()F

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->faceIndex:I

    .line 93
    .line 94
    invoke-virtual {p1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v2}, Ll/nuf;->l()[F

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {p0, p1, v0, v2, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->updateFaceInfo(Ll/omw;F[FZ)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_2
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    sub-int/2addr v0, v1

    .line 111
    :goto_0
    if-ltz v0, :cond_3

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v2}, Ll/nuf;->f()F

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v3}, Ll/nuf;->l()[F

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {p0, p1, v2, v3, v1}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->updateFaceInfo(Ll/omw;F[FZ)V

    .line 130
    .line 131
    .line 132
    add-int/lit8 v0, v0, -0x1

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_3
    return-void
.end method

.method public setMainFaceIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->faceIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setMmcvBoxes(Lcom/core/glcore/cv/MMCVBoxes;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentStickerItem:Ljava/util/List;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-lez v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    aget-object v1, v1, v0

    .line 27
    .line 28
    iget-object v1, v1, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/momo/mcamera/mask/StickerItem;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 45
    .line 46
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    iget-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 57
    .line 58
    iget v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mIndex:I

    .line 59
    .line 60
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Ljava/util/List;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentStickerItem:Ljava/util/List;

    .line 67
    .line 68
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mLastMmcvBoxIsEmpty:Z

    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    const/4 v1, 0x1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    iget-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 75
    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-lez p1, :cond_2

    .line 83
    .line 84
    iget-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    array-length p1, p1

    .line 91
    if-lez p1, :cond_2

    .line 92
    .line 93
    iget-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    aget-object p1, p1, v0

    .line 100
    .line 101
    iget-object p1, p1, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v2, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, Lcom/momo/mcamera/mask/StickerItem;

    .line 116
    .line 117
    iget-object v2, v2, Lcom/momo/mcamera/mask/StickerItem;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 118
    .line 119
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_2

    .line 128
    .line 129
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mLastMmcvBoxIsEmpty:Z

    .line 130
    .line 131
    if-eqz p1, :cond_1

    .line 132
    .line 133
    iget p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mIndex:I

    .line 134
    .line 135
    add-int/2addr p1, v1

    .line 136
    iput p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mIndex:I

    .line 137
    .line 138
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 139
    .line 140
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    rem-int/2addr p1, v2

    .line 145
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    check-cast p1, Ljava/util/List;

    .line 150
    .line 151
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentStickerItem:Ljava/util/List;

    .line 152
    .line 153
    :cond_1
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mLastMmcvBoxIsEmpty:Z

    .line 154
    .line 155
    return-void

    .line 156
    :cond_2
    iget p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mNoBoxCount:I

    .line 157
    .line 158
    const/4 v2, 0x3

    .line 159
    if-ne p1, v2, :cond_3

    .line 160
    .line 161
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mLastMmcvBoxIsEmpty:Z

    .line 162
    .line 163
    iput v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mNoBoxCount:I

    .line 164
    .line 165
    :cond_3
    iget p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mNoBoxCount:I

    .line 166
    .line 167
    add-int/2addr p1, v1

    .line 168
    iput p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mNoBoxCount:I

    .line 169
    .line 170
    return-void
.end method

.method public setOrderedIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->orderedIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setPollGroupNumber(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :goto_0
    if-ge v0, p1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 12
    .line 13
    new-instance v2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public setScaleHeightRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->scaleHeightRatio:F

    .line 2
    .line 3
    return-void
.end method

.method public setScaleWidthRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->scaleWidthRatio:F

    .line 2
    .line 3
    return-void
.end method

.method public setStickerFinishListener(Lcom/momo/mcamera/mask/MultiStickerMaskFilter$StickerFinishListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->finishListener:Lcom/momo/mcamera/mask/MultiStickerMaskFilter$StickerFinishListener;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 2

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentTime:J

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/momo/mcamera/mask/StickerItem;

    .line 20
    .line 21
    invoke-virtual {v1, p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setRenderTime(J)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-lez v0, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/momo/mcamera/mask/StickerItem;

    .line 68
    .line 69
    invoke-virtual {v1, p1, p2}, Lcom/momo/mcamera/mask/StickerItem;->setRenderTime(J)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    return-void
.end method

.method public setUseETC1(Z)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mETC1Handler:I

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/high16 p1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public updateFaceInfo(Ll/omw;F[FZ)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->stickerItemList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    move-object v7, v1

    .line 18
    check-cast v7, Lcom/momo/mcamera/mask/StickerItem;

    .line 19
    .line 20
    move-object v2, p0

    .line 21
    move-object v3, p1

    .line 22
    move v4, p2

    .line 23
    move-object v5, p3

    .line 24
    move v6, p4

    .line 25
    invoke-direct/range {v2 .. v7}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->updateFaceInfoBySingleItem(Ll/omw;F[FZLcom/momo/mcamera/mask/StickerItem;)V

    .line 26
    .line 27
    .line 28
    move-object v1, v2

    .line 29
    move-object v2, v3

    .line 30
    move v3, v4

    .line 31
    move-object v4, v5

    .line 32
    move-object p0, v1

    .line 33
    move-object p1, v2

    .line 34
    move p2, v3

    .line 35
    move-object p3, v4

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move-object v1, p0

    .line 38
    move-object v2, p1

    .line 39
    move v3, p2

    .line 40
    move-object v4, p3

    .line 41
    move v5, p4

    .line 42
    iget-object p0, v1, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mPollTriggerStickerItemList:Ljava/util/List;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    iget-object p0, v1, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->mCurrentStickerItem:Ljava/util/List;

    .line 47
    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    move-object v6, p1

    .line 65
    check-cast v6, Lcom/momo/mcamera/mask/StickerItem;

    .line 66
    .line 67
    invoke-direct/range {v1 .. v6}, Lcom/momo/mcamera/mask/MultiStickerMaskFilter;->updateFaceInfoBySingleItem(Ll/omw;F[FZLcom/momo/mcamera/mask/StickerItem;)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    return-void
.end method
