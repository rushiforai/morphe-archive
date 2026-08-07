.class public final Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;
.super Lcom/momo/xeengine/svgaplayer/SGVADrawer;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000|\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0014\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0007\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J$\u0010!\u001a\u00020\"2\n\u0010#\u001a\u00060$R\u00020\u00012\u0006\u0010%\u001a\u00020&2\u0006\u0010\'\u001a\u00020\u0008H\u0002J \u0010(\u001a\u00020\"2\u0006\u0010%\u001a\u00020&2\u0006\u0010\'\u001a\u00020\u00082\u0006\u0010)\u001a\u00020*H\u0016J\u001c\u0010+\u001a\u00020\"2\n\u0010#\u001a\u00060$R\u00020\u00012\u0006\u0010%\u001a\u00020&H\u0002J\u001c\u0010,\u001a\u00020\"2\n\u0010#\u001a\u00060$R\u00020\u00012\u0006\u0010%\u001a\u00020&H\u0002J$\u0010-\u001a\u00020\"2\n\u0010#\u001a\u00060$R\u00020\u00012\u0006\u0010%\u001a\u00020&2\u0006\u0010\'\u001a\u00020\u0008H\u0002J$\u0010.\u001a\u00020\"2\u0006\u0010%\u001a\u00020&2\u0006\u0010/\u001a\u00020\u00112\n\u0010#\u001a\u00060$R\u00020\u0001H\u0002J\u0010\u00100\u001a\u00020\"2\u0006\u0010\'\u001a\u00020\u0008H\u0002J\u0008\u00101\u001a\u000202H\u0002J\u0010\u00103\u001a\u00020\"2\u0006\u0010%\u001a\u00020&H\u0002J\u0010\u00104\u001a\u00020\"2\u0006\u00105\u001a\u00020\u000cH\u0002J\u0010\u00106\u001a\u00020\"2\u0006\u00107\u001a\u00020\u001bH\u0002R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R*\u0010\n\u001a\u001e\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\r0\u000bj\u000e\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\r`\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R*\u0010\u000f\u001a\u001e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u00110\u000bj\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u0011`\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u0017X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00068"
    }
    d2 = {
        "Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;",
        "Lcom/momo/xeengine/svgaplayer/SGVADrawer;",
        "videoItem",
        "Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;",
        "dynamicItem",
        "Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;",
        "(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;)V",
        "canvasH",
        "",
        "canvasW",
        "drawPathCache",
        "Ljava/util/HashMap;",
        "Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;",
        "Landroid/graphics/Path;",
        "Lkotlin/collections/HashMap;",
        "drawTextCache",
        "",
        "Landroid/graphics/Bitmap;",
        "getDynamicItem",
        "()Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;",
        "mDevPaint",
        "Landroid/graphics/Paint;",
        "matrixArray",
        "",
        "porterDuffXfermode",
        "Landroid/graphics/PorterDuffXfermode;",
        "sharedFrameMatrix",
        "Landroid/graphics/Matrix;",
        "sharedPaint",
        "sharedPath",
        "sharedPath2",
        "sharedShapeMatrix",
        "tValues",
        "drawDynamic",
        "",
        "sprite",
        "Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;",
        "canvas",
        "Landroid/graphics/Canvas;",
        "frameIndex",
        "drawFrame",
        "scaleType",
        "Landroid/widget/ImageView$ScaleType;",
        "drawImage",
        "drawShape",
        "drawSprite",
        "drawText",
        "drawingBitmap",
        "playAudio",
        "requestScale",
        "",
        "resetCachePath",
        "resetShapeStrokePaint",
        "shape",
        "resetShareMatrix",
        "transform",
        "gift_player_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# instance fields
.field private canvasH:I

.field private canvasW:I

.field private final drawPathCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;",
            "Landroid/graphics/Path;",
            ">;"
        }
    .end annotation
.end field

.field private final drawTextCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private mDevPaint:Landroid/graphics/Paint;

.field private matrixArray:[F

.field private final porterDuffXfermode:Landroid/graphics/PorterDuffXfermode;

.field private final sharedFrameMatrix:Landroid/graphics/Matrix;

.field private final sharedPaint:Landroid/graphics/Paint;

.field private final sharedPath:Landroid/graphics/Path;

.field private final sharedPath2:Landroid/graphics/Path;

.field private final sharedShapeMatrix:Landroid/graphics/Matrix;

.field private final tValues:[F


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;-><init>(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 11
    .line 12
    new-instance p1, Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 18
    .line 19
    new-instance p1, Landroid/graphics/Path;

    .line 20
    .line 21
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 25
    .line 26
    new-instance p1, Landroid/graphics/Path;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath2:Landroid/graphics/Path;

    .line 32
    .line 33
    new-instance p1, Landroid/graphics/Matrix;

    .line 34
    .line 35
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedShapeMatrix:Landroid/graphics/Matrix;

    .line 39
    .line 40
    new-instance p1, Landroid/graphics/Matrix;

    .line 41
    .line 42
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 46
    .line 47
    new-instance p1, Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 53
    .line 54
    new-instance p1, Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawPathCache:Ljava/util/HashMap;

    .line 60
    .line 61
    const/16 p1, 0x9

    .line 62
    .line 63
    new-array p1, p1, [F

    .line 64
    .line 65
    fill-array-data p1, :array_0

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->matrixArray:[F

    .line 69
    .line 70
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 71
    .line 72
    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 73
    .line 74
    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->porterDuffXfermode:Landroid/graphics/PorterDuffXfermode;

    .line 78
    .line 79
    const/16 p1, 0x10

    .line 80
    .line 81
    new-array p1, p1, [F

    .line 82
    .line 83
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->tValues:[F

    .line 84
    .line 85
    return-void

    .line 86
    nop

    .line 87
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private final drawDynamic(Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;Landroid/graphics/Canvas;I)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getImageKey()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->getDynamicDrawer$gift_player_release()Ljava/util/HashMap;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lkotlin/jvm/functions/Function2;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getTransform()Landroid/graphics/Matrix;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-direct {p0, p1}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->resetShareMatrix(Landroid/graphics/Matrix;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 36
    .line 37
    invoke-virtual {p2, p0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {v0, p2, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method private final drawImage(Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getImageKey()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    if-eqz v1, :cond_5

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->getDynamicHidden$gift_player_release()Ljava/util/HashMap;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    :goto_0
    if-eqz v0, :cond_1

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->getDynamicImage$gift_player_release()Ljava/util/HashMap;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/graphics/Bitmap;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    :goto_1
    move-object v6, v0

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getImages()Ljava/util/HashMap;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Landroid/graphics/Bitmap;

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :goto_2
    if-eqz v6, :cond_5

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getTransform()Landroid/graphics/Matrix;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-direct {p0, v0}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->resetShareMatrix(Landroid/graphics/Matrix;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getAntiAlias()Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getAntiAlias()Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getAlpha()D

    .line 114
    .line 115
    .line 116
    move-result-wide v2

    .line 117
    const-wide v4, 0x406fe00000000000L    # 255.0

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    mul-double/2addr v2, v4

    .line 123
    double-to-int v2, v2

    .line 124
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    if-eqz v0, :cond_3

    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    if-eqz v0, :cond_5

    .line 146
    .line 147
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 148
    .line 149
    .line 150
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 151
    .line 152
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 153
    .line 154
    .line 155
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 156
    .line 157
    invoke-virtual {v0, v2}, Lcom/momo/xeengine/svgaplayer/SVGAPath;->buildPath(Landroid/graphics/Path;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 161
    .line 162
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 163
    .line 164
    invoke-virtual {v0, v2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 168
    .line 169
    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 173
    .line 174
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getLayout()Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGARect;->getWidth()D

    .line 183
    .line 184
    .line 185
    move-result-wide v2

    .line 186
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    int-to-double v4, v4

    .line 191
    div-double/2addr v2, v4

    .line 192
    double-to-float v2, v2

    .line 193
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-virtual {v3}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getLayout()Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    invoke-virtual {v3}, Lcom/momo/xeengine/svgaplayer/SVGARect;->getWidth()D

    .line 202
    .line 203
    .line 204
    move-result-wide v3

    .line 205
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 206
    .line 207
    .line 208
    move-result v5

    .line 209
    int-to-double v7, v5

    .line 210
    div-double/2addr v3, v7

    .line 211
    double-to-float v3, v3

    .line 212
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 216
    .line 217
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 218
    .line 219
    invoke-virtual {p2, v6, v0, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 223
    .line 224
    .line 225
    goto :goto_3

    .line 226
    :cond_3
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 227
    .line 228
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getLayout()Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGARect;->getWidth()D

    .line 237
    .line 238
    .line 239
    move-result-wide v2

    .line 240
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 241
    .line 242
    .line 243
    move-result v4

    .line 244
    int-to-double v4, v4

    .line 245
    div-double/2addr v2, v4

    .line 246
    double-to-float v2, v2

    .line 247
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    invoke-virtual {v3}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getLayout()Lcom/momo/xeengine/svgaplayer/SVGARect;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    invoke-virtual {v3}, Lcom/momo/xeengine/svgaplayer/SVGARect;->getWidth()D

    .line 256
    .line 257
    .line 258
    move-result-wide v3

    .line 259
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 260
    .line 261
    .line 262
    move-result v5

    .line 263
    int-to-double v7, v5

    .line 264
    div-double/2addr v3, v7

    .line 265
    double-to-float v3, v3

    .line 266
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 267
    .line 268
    .line 269
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 270
    .line 271
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 272
    .line 273
    invoke-virtual {p2, v6, v0, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 274
    .line 275
    .line 276
    :goto_3
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 277
    .line 278
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->getDynamicIClickArea$gift_player_release()Ljava/util/HashMap;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    check-cast v0, Lcom/momo/xeengine/svgaplayer/listener/IClickAreaListener;

    .line 287
    .line 288
    if-eqz v0, :cond_4

    .line 289
    .line 290
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 291
    .line 292
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->matrixArray:[F

    .line 293
    .line 294
    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->getValues([F)V

    .line 295
    .line 296
    .line 297
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->matrixArray:[F

    .line 298
    .line 299
    const/4 v3, 0x2

    .line 300
    aget v4, v2, v3

    .line 301
    .line 302
    float-to-int v4, v4

    .line 303
    const/4 v5, 0x5

    .line 304
    aget v2, v2, v5

    .line 305
    .line 306
    float-to-int v2, v2

    .line 307
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 308
    .line 309
    .line 310
    move-result v7

    .line 311
    int-to-float v7, v7

    .line 312
    iget-object v8, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->matrixArray:[F

    .line 313
    .line 314
    const/4 v9, 0x0

    .line 315
    aget v9, v8, v9

    .line 316
    .line 317
    mul-float/2addr v7, v9

    .line 318
    aget v3, v8, v3

    .line 319
    .line 320
    add-float/2addr v7, v3

    .line 321
    float-to-int v3, v7

    .line 322
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    .line 323
    .line 324
    .line 325
    move-result v7

    .line 326
    int-to-float v7, v7

    .line 327
    iget-object v8, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->matrixArray:[F

    .line 328
    .line 329
    const/4 v9, 0x4

    .line 330
    aget v9, v8, v9

    .line 331
    .line 332
    mul-float/2addr v7, v9

    .line 333
    aget v5, v8, v5

    .line 334
    .line 335
    add-float/2addr v7, v5

    .line 336
    float-to-int v5, v7

    .line 337
    move v10, v3

    .line 338
    move v3, v2

    .line 339
    move v2, v4

    .line 340
    move v4, v10

    .line 341
    invoke-interface/range {v0 .. v5}, Lcom/momo/xeengine/svgaplayer/listener/IClickAreaListener;->onResponseArea(Ljava/lang/String;IIII)V

    .line 342
    .line 343
    .line 344
    :cond_4
    invoke-direct {p0, p2, v6, p1}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawText(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;)V

    .line 345
    .line 346
    .line 347
    :cond_5
    return-void
.end method

.method private final drawShape(Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getTransform()Landroid/graphics/Matrix;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->resetShareMatrix(Landroid/graphics/Matrix;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getShapes()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Iterable;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_8

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->buildPath()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->getShapePath()Landroid/graphics/Path;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 48
    .line 49
    invoke-virtual {v3}, Landroid/graphics/Paint;->reset()V

    .line 50
    .line 51
    .line 52
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getAntiAlias()Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 63
    .line 64
    .line 65
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getAlpha()D

    .line 72
    .line 73
    .line 74
    move-result-wide v4

    .line 75
    const-wide v6, 0x406fe00000000000L    # 255.0

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    mul-double/2addr v4, v6

    .line 81
    double-to-int v4, v4

    .line 82
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 83
    .line 84
    .line 85
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawPathCache:Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-nez v3, :cond_1

    .line 92
    .line 93
    new-instance v3, Landroid/graphics/Path;

    .line 94
    .line 95
    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v2}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawPathCache:Ljava/util/HashMap;

    .line 102
    .line 103
    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    :cond_1
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 107
    .line 108
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 109
    .line 110
    .line 111
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 112
    .line 113
    new-instance v3, Landroid/graphics/Path;

    .line 114
    .line 115
    iget-object v4, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawPathCache:Ljava/util/HashMap;

    .line 116
    .line 117
    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    check-cast v4, Landroid/graphics/Path;

    .line 122
    .line 123
    invoke-direct {v3, v4}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2, v3}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedShapeMatrix:Landroid/graphics/Matrix;

    .line 130
    .line 131
    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->getTransform()Landroid/graphics/Matrix;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    if-eqz v2, :cond_2

    .line 139
    .line 140
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedShapeMatrix:Landroid/graphics/Matrix;

    .line 141
    .line 142
    invoke-virtual {v3, v2}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 143
    .line 144
    .line 145
    :cond_2
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedShapeMatrix:Landroid/graphics/Matrix;

    .line 146
    .line 147
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 148
    .line 149
    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 150
    .line 151
    .line 152
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 153
    .line 154
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedShapeMatrix:Landroid/graphics/Matrix;

    .line 155
    .line 156
    invoke-virtual {v2, v3}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->getStyles()Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    const/4 v3, 0x0

    .line 164
    const/16 v4, 0xff

    .line 165
    .line 166
    if-eqz v2, :cond_5

    .line 167
    .line 168
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;->getFill()I

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    if-eqz v2, :cond_5

    .line 173
    .line 174
    iget-object v5, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 175
    .line 176
    invoke-virtual {v5, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 177
    .line 178
    .line 179
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 180
    .line 181
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 182
    .line 183
    .line 184
    move-result-object v5

    .line 185
    invoke-virtual {v5}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getAlpha()D

    .line 186
    .line 187
    .line 188
    move-result-wide v8

    .line 189
    mul-double/2addr v8, v6

    .line 190
    double-to-int v5, v8

    .line 191
    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    .line 192
    .line 193
    .line 194
    move-result v5

    .line 195
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    if-eqz v2, :cond_3

    .line 211
    .line 212
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 213
    .line 214
    .line 215
    :cond_3
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    if-eqz v2, :cond_4

    .line 224
    .line 225
    iget-object v5, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath2:Landroid/graphics/Path;

    .line 226
    .line 227
    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    .line 228
    .line 229
    .line 230
    iget-object v5, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath2:Landroid/graphics/Path;

    .line 231
    .line 232
    invoke-virtual {v2, v5}, Lcom/momo/xeengine/svgaplayer/SVGAPath;->buildPath(Landroid/graphics/Path;)V

    .line 233
    .line 234
    .line 235
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath2:Landroid/graphics/Path;

    .line 236
    .line 237
    iget-object v5, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 238
    .line 239
    invoke-virtual {v2, v5}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 240
    .line 241
    .line 242
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath2:Landroid/graphics/Path;

    .line 243
    .line 244
    invoke-virtual {p2, v2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 245
    .line 246
    .line 247
    :cond_4
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 248
    .line 249
    iget-object v5, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 250
    .line 251
    invoke-virtual {p2, v2, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    if-eqz v2, :cond_5

    .line 263
    .line 264
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 265
    .line 266
    .line 267
    :cond_5
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->getStyles()Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    if-eqz v2, :cond_0

    .line 272
    .line 273
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;->getStrokeWidth()F

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    const/4 v5, 0x0

    .line 278
    cmpl-float v2, v2, v5

    .line 279
    .line 280
    if-lez v2, :cond_0

    .line 281
    .line 282
    invoke-direct {p0, v1}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->resetShapeStrokePaint(Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;)V

    .line 283
    .line 284
    .line 285
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 286
    .line 287
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getAlpha()D

    .line 292
    .line 293
    .line 294
    move-result-wide v8

    .line 295
    mul-double/2addr v8, v6

    .line 296
    double-to-int v2, v8

    .line 297
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    .line 298
    .line 299
    .line 300
    move-result v2

    .line 301
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 302
    .line 303
    .line 304
    move-result v2

    .line 305
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 313
    .line 314
    .line 315
    move-result-object v1

    .line 316
    if-eqz v1, :cond_6

    .line 317
    .line 318
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 319
    .line 320
    .line 321
    :cond_6
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    if-eqz v1, :cond_7

    .line 330
    .line 331
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath2:Landroid/graphics/Path;

    .line 332
    .line 333
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 334
    .line 335
    .line 336
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath2:Landroid/graphics/Path;

    .line 337
    .line 338
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/svgaplayer/SVGAPath;->buildPath(Landroid/graphics/Path;)V

    .line 339
    .line 340
    .line 341
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath2:Landroid/graphics/Path;

    .line 342
    .line 343
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 344
    .line 345
    invoke-virtual {v1, v2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 346
    .line 347
    .line 348
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath2:Landroid/graphics/Path;

    .line 349
    .line 350
    invoke-virtual {p2, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 351
    .line 352
    .line 353
    :cond_7
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 354
    .line 355
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 356
    .line 357
    invoke-virtual {p2, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 358
    .line 359
    .line 360
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 365
    .line 366
    .line 367
    move-result-object v1

    .line 368
    if-eqz v1, :cond_0

    .line 369
    .line 370
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 371
    .line 372
    .line 373
    goto/16 :goto_0

    .line 374
    .line 375
    :cond_8
    return-void
.end method

.method private final drawSprite(Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;Landroid/graphics/Canvas;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawImage(Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawShape(Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawDynamic(Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;Landroid/graphics/Canvas;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private final drawText(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->isTextDirty$gift_player_release()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    iget-object v2, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 17
    .line 18
    .line 19
    iget-object v2, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->setTextDirty$gift_player_release(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual/range {p3 .. p3}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getImageKey()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eqz v2, :cond_d

    .line 29
    .line 30
    iget-object v4, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 31
    .line 32
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->getDynamicText$gift_player_release()Ljava/util/HashMap;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    check-cast v4, Ljava/lang/String;

    .line 41
    .line 42
    const/4 v5, 0x1

    .line 43
    const/4 v6, 0x0

    .line 44
    if-eqz v4, :cond_2

    .line 45
    .line 46
    iget-object v7, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 47
    .line 48
    invoke-virtual {v7}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->getDynamicTextPaint$gift_player_release()Ljava/util/HashMap;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    invoke-virtual {v7, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    check-cast v7, Landroid/text/TextPaint;

    .line 57
    .line 58
    if-eqz v7, :cond_2

    .line 59
    .line 60
    iget-object v6, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 61
    .line 62
    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    check-cast v6, Landroid/graphics/Bitmap;

    .line 67
    .line 68
    if-eqz v6, :cond_1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 80
    .line 81
    invoke-static {v6, v8, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    if-eqz v6, :cond_2

    .line 86
    .line 87
    new-instance v8, Landroid/graphics/Canvas;

    .line 88
    .line 89
    invoke-direct {v8, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v7, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 93
    .line 94
    .line 95
    new-instance v9, Landroid/graphics/Rect;

    .line 96
    .line 97
    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 101
    .line 102
    .line 103
    move-result v10

    .line 104
    invoke-virtual {v7, v4, v3, v10, v9}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 108
    .line 109
    .line 110
    move-result v10

    .line 111
    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    .line 112
    .line 113
    .line 114
    move-result v9

    .line 115
    sub-int/2addr v10, v9

    .line 116
    int-to-double v9, v10

    .line 117
    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    .line 118
    .line 119
    div-double/2addr v9, v11

    .line 120
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 121
    .line 122
    .line 123
    move-result v11

    .line 124
    int-to-float v11, v11

    .line 125
    invoke-virtual {v7}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 126
    .line 127
    .line 128
    move-result-object v12

    .line 129
    iget v12, v12, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 130
    .line 131
    sub-float/2addr v11, v12

    .line 132
    invoke-virtual {v7}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 133
    .line 134
    .line 135
    move-result-object v12

    .line 136
    iget v12, v12, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 137
    .line 138
    sub-float/2addr v11, v12

    .line 139
    const/high16 v12, 0x40000000    # 2.0f

    .line 140
    .line 141
    div-float/2addr v11, v12

    .line 142
    double-to-float v9, v9

    .line 143
    invoke-virtual {v8, v4, v9, v11, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 144
    .line 145
    .line 146
    iget-object v4, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 147
    .line 148
    invoke-virtual {v4, v2, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    check-cast v4, Landroid/graphics/Bitmap;

    .line 153
    .line 154
    :cond_2
    :goto_0
    iget-object v4, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 155
    .line 156
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->getDynamicBoringLayoutText$gift_player_release()Ljava/util/HashMap;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    check-cast v4, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;

    .line 165
    .line 166
    const-string v7, "null cannot be cast to non-null type android.graphics.Bitmap"

    .line 167
    .line 168
    const/4 v8, 0x0

    .line 169
    if-eqz v4, :cond_7

    .line 170
    .line 171
    iget-object v6, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 172
    .line 173
    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    check-cast v6, Landroid/graphics/Bitmap;

    .line 178
    .line 179
    if-eqz v6, :cond_3

    .line 180
    .line 181
    goto/16 :goto_2

    .line 182
    .line 183
    :cond_3
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getPaint()Landroid/text/TextPaint;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getText()Ljava/lang/CharSequence;

    .line 191
    .line 192
    .line 193
    move-result-object v6

    .line 194
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getPaint()Landroid/text/TextPaint;

    .line 195
    .line 196
    .line 197
    move-result-object v9

    .line 198
    invoke-static {v6, v9}, Landroid/text/BoringLayout;->isBoring(Ljava/lang/CharSequence;Landroid/text/TextPaint;)Landroid/text/BoringLayout$Metrics;

    .line 199
    .line 200
    .line 201
    move-result-object v6

    .line 202
    if-nez v6, :cond_4

    .line 203
    .line 204
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getText()Ljava/lang/CharSequence;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getPaint()Landroid/text/TextPaint;

    .line 209
    .line 210
    .line 211
    move-result-object v9

    .line 212
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 213
    .line 214
    .line 215
    move-result v10

    .line 216
    int-to-float v10, v10

    .line 217
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getEllipsize()Landroid/text/TextUtils$TruncateAt;

    .line 218
    .line 219
    .line 220
    move-result-object v11

    .line 221
    invoke-static {v6, v9, v10, v11}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    .line 222
    .line 223
    .line 224
    move-result-object v13

    .line 225
    new-instance v12, Landroid/text/StaticLayout;

    .line 226
    .line 227
    invoke-interface {v13}, Ljava/lang/CharSequence;->length()I

    .line 228
    .line 229
    .line 230
    move-result v15

    .line 231
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getPaint()Landroid/text/TextPaint;

    .line 232
    .line 233
    .line 234
    move-result-object v16

    .line 235
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 236
    .line 237
    .line 238
    move-result v17

    .line 239
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getAlignment()Landroid/text/Layout$Alignment;

    .line 240
    .line 241
    .line 242
    move-result-object v18

    .line 243
    const/16 v20, 0x0

    .line 244
    .line 245
    const/16 v21, 0x0

    .line 246
    .line 247
    const/4 v14, 0x0

    .line 248
    const/high16 v19, 0x3f800000    # 1.0f

    .line 249
    .line 250
    invoke-direct/range {v12 .. v21}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 251
    .line 252
    .line 253
    goto :goto_1

    .line 254
    :cond_4
    new-instance v13, Landroid/text/BoringLayout;

    .line 255
    .line 256
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getText()Ljava/lang/CharSequence;

    .line 257
    .line 258
    .line 259
    move-result-object v14

    .line 260
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getPaint()Landroid/text/TextPaint;

    .line 261
    .line 262
    .line 263
    move-result-object v15

    .line 264
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 265
    .line 266
    .line 267
    move-result v16

    .line 268
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getAlignment()Landroid/text/Layout$Alignment;

    .line 269
    .line 270
    .line 271
    move-result-object v17

    .line 272
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getText()Ljava/lang/CharSequence;

    .line 273
    .line 274
    .line 275
    move-result-object v6

    .line 276
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getPaint()Landroid/text/TextPaint;

    .line 277
    .line 278
    .line 279
    move-result-object v9

    .line 280
    invoke-static {v6, v9}, Landroid/text/BoringLayout;->isBoring(Ljava/lang/CharSequence;Landroid/text/TextPaint;)Landroid/text/BoringLayout$Metrics;

    .line 281
    .line 282
    .line 283
    move-result-object v20

    .line 284
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/BoringLayoutBean;->getEllipsize()Landroid/text/TextUtils$TruncateAt;

    .line 285
    .line 286
    .line 287
    move-result-object v22

    .line 288
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 289
    .line 290
    .line 291
    move-result v23

    .line 292
    const/high16 v18, 0x3f800000    # 1.0f

    .line 293
    .line 294
    const/16 v19, 0x0

    .line 295
    .line 296
    const/16 v21, 0x0

    .line 297
    .line 298
    invoke-direct/range {v13 .. v23}, Landroid/text/BoringLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;ZLandroid/text/TextUtils$TruncateAt;I)V

    .line 299
    .line 300
    .line 301
    move-object v12, v13

    .line 302
    :goto_1
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 303
    .line 304
    .line 305
    move-result v4

    .line 306
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 307
    .line 308
    .line 309
    move-result v6

    .line 310
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 311
    .line 312
    invoke-static {v4, v6, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    new-instance v6, Landroid/graphics/Canvas;

    .line 317
    .line 318
    if-nez v4, :cond_5

    .line 319
    .line 320
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 321
    .line 322
    .line 323
    :cond_5
    invoke-direct {v6, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 327
    .line 328
    .line 329
    move-result v9

    .line 330
    invoke-virtual {v12}, Landroid/text/Layout;->getHeight()I

    .line 331
    .line 332
    .line 333
    move-result v10

    .line 334
    sub-int/2addr v9, v10

    .line 335
    div-int/lit8 v9, v9, 0x2

    .line 336
    .line 337
    int-to-float v9, v9

    .line 338
    invoke-virtual {v6, v8, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 339
    .line 340
    .line 341
    invoke-virtual {v12, v6}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 342
    .line 343
    .line 344
    iget-object v6, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 345
    .line 346
    if-eqz v4, :cond_6

    .line 347
    .line 348
    invoke-virtual {v6, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v6

    .line 352
    check-cast v6, Landroid/graphics/Bitmap;

    .line 353
    .line 354
    move-object v6, v4

    .line 355
    goto :goto_2

    .line 356
    :cond_6
    invoke-static {v7}, Lb;->a(Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    return-void

    .line 360
    :cond_7
    :goto_2
    iget-object v4, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 361
    .line 362
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;->getDynamicStaticLayoutText$gift_player_release()Ljava/util/HashMap;

    .line 363
    .line 364
    .line 365
    move-result-object v4

    .line 366
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v4

    .line 370
    check-cast v4, Lcom/momo/xeengine/svgaplayer/bean/StaticLayoutBean;

    .line 371
    .line 372
    if-eqz v4, :cond_b

    .line 373
    .line 374
    iget-object v6, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 375
    .line 376
    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v6

    .line 380
    check-cast v6, Landroid/graphics/Bitmap;

    .line 381
    .line 382
    if-eqz v6, :cond_8

    .line 383
    .line 384
    goto :goto_3

    .line 385
    :cond_8
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/StaticLayoutBean;->getPaint()Landroid/text/TextPaint;

    .line 386
    .line 387
    .line 388
    move-result-object v6

    .line 389
    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 390
    .line 391
    .line 392
    new-instance v9, Landroid/text/StaticLayout;

    .line 393
    .line 394
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/StaticLayoutBean;->getText()Ljava/lang/CharSequence;

    .line 395
    .line 396
    .line 397
    move-result-object v10

    .line 398
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/StaticLayoutBean;->getText()Ljava/lang/CharSequence;

    .line 399
    .line 400
    .line 401
    move-result-object v5

    .line 402
    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    .line 403
    .line 404
    .line 405
    move-result v12

    .line 406
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/StaticLayoutBean;->getPaint()Landroid/text/TextPaint;

    .line 407
    .line 408
    .line 409
    move-result-object v13

    .line 410
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 411
    .line 412
    .line 413
    move-result v14

    .line 414
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/bean/StaticLayoutBean;->getAlignment()Landroid/text/Layout$Alignment;

    .line 415
    .line 416
    .line 417
    move-result-object v15

    .line 418
    const/16 v17, 0x0

    .line 419
    .line 420
    const/16 v18, 0x0

    .line 421
    .line 422
    const/4 v11, 0x0

    .line 423
    const/high16 v16, 0x3f800000    # 1.0f

    .line 424
    .line 425
    invoke-direct/range {v9 .. v18}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 426
    .line 427
    .line 428
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 429
    .line 430
    .line 431
    move-result v4

    .line 432
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 433
    .line 434
    .line 435
    move-result v5

    .line 436
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 437
    .line 438
    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 439
    .line 440
    .line 441
    move-result-object v4

    .line 442
    new-instance v5, Landroid/graphics/Canvas;

    .line 443
    .line 444
    if-nez v4, :cond_9

    .line 445
    .line 446
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 447
    .line 448
    .line 449
    :cond_9
    invoke-direct {v5, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 450
    .line 451
    .line 452
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 453
    .line 454
    .line 455
    move-result v6

    .line 456
    invoke-virtual {v9}, Landroid/text/Layout;->getHeight()I

    .line 457
    .line 458
    .line 459
    move-result v10

    .line 460
    sub-int/2addr v6, v10

    .line 461
    div-int/lit8 v6, v6, 0x2

    .line 462
    .line 463
    int-to-float v6, v6

    .line 464
    invoke-virtual {v5, v8, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 465
    .line 466
    .line 467
    invoke-virtual {v9, v5}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 468
    .line 469
    .line 470
    iget-object v5, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 471
    .line 472
    if-eqz v4, :cond_a

    .line 473
    .line 474
    invoke-virtual {v5, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    .line 476
    .line 477
    move-result-object v2

    .line 478
    check-cast v2, Landroid/graphics/Bitmap;

    .line 479
    .line 480
    move-object v6, v4

    .line 481
    goto :goto_3

    .line 482
    :cond_a
    invoke-static {v7}, Lb;->a(Ljava/lang/String;)V

    .line 483
    .line 484
    .line 485
    return-void

    .line 486
    :cond_b
    :goto_3
    if-eqz v6, :cond_d

    .line 487
    .line 488
    iget-object v2, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 489
    .line 490
    invoke-virtual {v2}, Landroid/graphics/Paint;->reset()V

    .line 491
    .line 492
    .line 493
    iget-object v2, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 494
    .line 495
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 496
    .line 497
    .line 498
    move-result-object v4

    .line 499
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getAntiAlias()Z

    .line 500
    .line 501
    .line 502
    move-result v4

    .line 503
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 504
    .line 505
    .line 506
    iget-object v2, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 507
    .line 508
    invoke-virtual/range {p3 .. p3}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 509
    .line 510
    .line 511
    move-result-object v4

    .line 512
    invoke-virtual {v4}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getAlpha()D

    .line 513
    .line 514
    .line 515
    move-result-wide v4

    .line 516
    const-wide v7, 0x406fe00000000000L    # 255.0

    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    mul-double/2addr v4, v7

    .line 522
    double-to-int v4, v4

    .line 523
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 524
    .line 525
    .line 526
    invoke-virtual/range {p3 .. p3}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 527
    .line 528
    .line 529
    move-result-object v2

    .line 530
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 531
    .line 532
    .line 533
    move-result-object v2

    .line 534
    if-eqz v2, :cond_c

    .line 535
    .line 536
    invoke-virtual/range {p3 .. p3}, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 537
    .line 538
    .line 539
    move-result-object v2

    .line 540
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;->getMaskPath()Lcom/momo/xeengine/svgaplayer/SVGAPath;

    .line 541
    .line 542
    .line 543
    move-result-object v2

    .line 544
    if-eqz v2, :cond_d

    .line 545
    .line 546
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 547
    .line 548
    .line 549
    iget-object v4, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 550
    .line 551
    invoke-virtual {v1, v4}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 552
    .line 553
    .line 554
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 555
    .line 556
    .line 557
    move-result v4

    .line 558
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 559
    .line 560
    .line 561
    move-result v5

    .line 562
    invoke-virtual {v1, v3, v3, v4, v5}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 563
    .line 564
    .line 565
    new-instance v3, Landroid/graphics/BitmapShader;

    .line 566
    .line 567
    sget-object v4, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 568
    .line 569
    invoke-direct {v3, v6, v4, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 570
    .line 571
    .line 572
    iget-object v4, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 573
    .line 574
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 575
    .line 576
    .line 577
    iget-object v3, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 578
    .line 579
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 580
    .line 581
    .line 582
    iget-object v3, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 583
    .line 584
    invoke-virtual {v2, v3}, Lcom/momo/xeengine/svgaplayer/SVGAPath;->buildPath(Landroid/graphics/Path;)V

    .line 585
    .line 586
    .line 587
    iget-object v2, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPath:Landroid/graphics/Path;

    .line 588
    .line 589
    iget-object v0, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 590
    .line 591
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 592
    .line 593
    .line 594
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 595
    .line 596
    .line 597
    return-void

    .line 598
    :cond_c
    iget-object v2, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 599
    .line 600
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 601
    .line 602
    .line 603
    move-result-object v3

    .line 604
    invoke-virtual {v3}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getAntiAlias()Z

    .line 605
    .line 606
    .line 607
    move-result v3

    .line 608
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 609
    .line 610
    .line 611
    iget-object v2, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 612
    .line 613
    iget-object v0, v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 614
    .line 615
    invoke-virtual {v1, v6, v2, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 616
    .line 617
    .line 618
    :cond_d
    return-void
.end method

.method private final playAudio(I)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getAudios()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Iterable;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_3

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/momo/xeengine/svgaplayer/SVGAAudioEntity;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAAudioEntity;->getStartFrame()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-ne v2, p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getSoundPool()Landroid/media/SoundPool;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAAudioEntity;->getSoundID()Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    const/4 v8, 0x0

    .line 54
    const/high16 v9, 0x3f800000    # 1.0f

    .line 55
    .line 56
    const/high16 v5, 0x3f800000    # 1.0f

    .line 57
    .line 58
    const/high16 v6, 0x3f800000    # 1.0f

    .line 59
    .line 60
    const/4 v7, 0x1

    .line 61
    invoke-virtual/range {v3 .. v9}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/svgaplayer/SVGAAudioEntity;->setPlayID(Ljava/lang/Integer;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAAudioEntity;->getEndFrame()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-gt v2, p1, :cond_0

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAAudioEntity;->getPlayID()Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    if-eqz v2, :cond_2

    .line 83
    .line 84
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v3}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getSoundPool()Landroid/media/SoundPool;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    if-eqz v3, :cond_2

    .line 97
    .line 98
    invoke-virtual {v3, v2}, Landroid/media/SoundPool;->stop(I)V

    .line 99
    .line 100
    .line 101
    :cond_2
    const/4 v2, 0x0

    .line 102
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/svgaplayer/SVGAAudioEntity;->setPlayID(Ljava/lang/Integer;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    return-void
.end method

.method private final requestScale()F
    .locals 15

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->tValues:[F

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->tValues:[F

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    aget v1, v0, v1

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    cmpg-float v3, v1, v2

    .line 15
    .line 16
    if-nez v3, :cond_0

    .line 17
    .line 18
    return v2

    .line 19
    :cond_0
    float-to-double v3, v1

    .line 20
    const/4 v1, 0x3

    .line 21
    aget v1, v0, v1

    .line 22
    .line 23
    float-to-double v5, v1

    .line 24
    const/4 v1, 0x1

    .line 25
    aget v1, v0, v1

    .line 26
    .line 27
    float-to-double v7, v1

    .line 28
    const/4 v1, 0x4

    .line 29
    aget v0, v0, v1

    .line 30
    .line 31
    float-to-double v0, v0

    .line 32
    mul-double v9, v3, v0

    .line 33
    .line 34
    mul-double v11, v5, v7

    .line 35
    .line 36
    cmpg-double v9, v9, v11

    .line 37
    .line 38
    if-nez v9, :cond_1

    .line 39
    .line 40
    return v2

    .line 41
    :cond_1
    mul-double v9, v3, v3

    .line 42
    .line 43
    mul-double v11, v5, v5

    .line 44
    .line 45
    add-double/2addr v9, v11

    .line 46
    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    .line 47
    .line 48
    .line 49
    move-result-wide v9

    .line 50
    div-double/2addr v3, v9

    .line 51
    div-double/2addr v5, v9

    .line 52
    mul-double v11, v3, v7

    .line 53
    .line 54
    mul-double v13, v5, v0

    .line 55
    .line 56
    add-double/2addr v11, v13

    .line 57
    mul-double v13, v3, v11

    .line 58
    .line 59
    sub-double/2addr v7, v13

    .line 60
    mul-double/2addr v11, v5

    .line 61
    sub-double/2addr v0, v11

    .line 62
    mul-double v11, v7, v7

    .line 63
    .line 64
    mul-double v13, v0, v0

    .line 65
    .line 66
    add-double/2addr v11, v13

    .line 67
    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    .line 68
    .line 69
    .line 70
    move-result-wide v11

    .line 71
    div-double/2addr v7, v11

    .line 72
    div-double/2addr v0, v11

    .line 73
    mul-double/2addr v3, v0

    .line 74
    mul-double/2addr v5, v7

    .line 75
    cmpg-double v0, v3, v5

    .line 76
    .line 77
    if-gez v0, :cond_2

    .line 78
    .line 79
    neg-double v9, v9

    .line 80
    :cond_2
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getScaleEntity()Lcom/momo/xeengine/svgaplayer/ScaleEntity;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/ScaleEntity;->getRatioX()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getScaleEntity()Lcom/momo/xeengine/svgaplayer/ScaleEntity;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/ScaleEntity;->getRatio()F

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    double-to-float v0, v9

    .line 99
    :goto_0
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    div-float/2addr p0, v0

    .line 104
    return p0

    .line 105
    :cond_3
    double-to-float v0, v11

    .line 106
    goto :goto_0
.end method

.method private final resetCachePath(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->canvasW:I

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->canvasH:I

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawPathCache:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->canvasW:I

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->canvasH:I

    .line 33
    .line 34
    return-void
.end method

.method private final resetShapeStrokePaint(Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getAntiAlias()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 20
    .line 21
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->getStyles()Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;->getStroke()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-direct {p0}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->requestScale()F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->getStyles()Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;->getStrokeWidth()F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 56
    .line 57
    mul-float/2addr v1, v0

    .line 58
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 59
    .line 60
    .line 61
    :cond_1
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->getStyles()Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "round"

    .line 66
    .line 67
    const/4 v3, 0x1

    .line 68
    if-eqz v1, :cond_4

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;->getLineCap()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    const-string v4, "butt"

    .line 77
    .line 78
    invoke-static {v1, v4, v3}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eqz v4, :cond_2

    .line 83
    .line 84
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 85
    .line 86
    sget-object v4, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    .line 87
    .line 88
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    invoke-static {v1, v2, v3}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    if-eqz v4, :cond_3

    .line 97
    .line 98
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 99
    .line 100
    sget-object v4, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 101
    .line 102
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    const-string v4, "square"

    .line 107
    .line 108
    invoke-static {v1, v4, v3}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_4

    .line 113
    .line 114
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 115
    .line 116
    sget-object v4, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    .line 117
    .line 118
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 119
    .line 120
    .line 121
    :cond_4
    :goto_0
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->getStyles()Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    if-eqz v1, :cond_7

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;->getLineJoin()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    if-eqz v1, :cond_7

    .line 132
    .line 133
    const-string v4, "miter"

    .line 134
    .line 135
    invoke-static {v1, v4, v3}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    if-eqz v4, :cond_5

    .line 140
    .line 141
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 142
    .line 143
    sget-object v2, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    .line 144
    .line 145
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 146
    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_5
    invoke-static {v1, v2, v3}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-eqz v2, :cond_6

    .line 154
    .line 155
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 156
    .line 157
    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    .line 158
    .line 159
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 160
    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_6
    const-string v2, "bevel"

    .line 164
    .line 165
    invoke-static {v1, v2, v3}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_7

    .line 170
    .line 171
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 172
    .line 173
    sget-object v2, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    .line 174
    .line 175
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 176
    .line 177
    .line 178
    :cond_7
    :goto_1
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->getStyles()Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    if-eqz v1, :cond_8

    .line 183
    .line 184
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;->getMiterLimit()I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 189
    .line 190
    int-to-float v1, v1

    .line 191
    mul-float/2addr v1, v0

    .line 192
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    .line 193
    .line 194
    .line 195
    :cond_8
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity;->getStyles()Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    if-eqz p1, :cond_c

    .line 200
    .line 201
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$Styles;->getLineDash()[F

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    if-eqz p1, :cond_c

    .line 206
    .line 207
    array-length v1, p1

    .line 208
    const/4 v2, 0x3

    .line 209
    if-ne v1, v2, :cond_c

    .line 210
    .line 211
    const/4 v1, 0x0

    .line 212
    aget v2, p1, v1

    .line 213
    .line 214
    const/4 v4, 0x0

    .line 215
    cmpl-float v2, v2, v4

    .line 216
    .line 217
    if-gtz v2, :cond_9

    .line 218
    .line 219
    aget v2, p1, v3

    .line 220
    .line 221
    cmpl-float v2, v2, v4

    .line 222
    .line 223
    if-lez v2, :cond_c

    .line 224
    .line 225
    :cond_9
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedPaint:Landroid/graphics/Paint;

    .line 226
    .line 227
    new-instance v2, Landroid/graphics/DashPathEffect;

    .line 228
    .line 229
    aget v4, p1, v1

    .line 230
    .line 231
    const/high16 v5, 0x3f800000    # 1.0f

    .line 232
    .line 233
    cmpg-float v6, v4, v5

    .line 234
    .line 235
    if-gez v6, :cond_a

    .line 236
    .line 237
    move v4, v5

    .line 238
    :cond_a
    mul-float/2addr v4, v0

    .line 239
    aget v5, p1, v3

    .line 240
    .line 241
    const v6, 0x3dcccccd    # 0.1f

    .line 242
    .line 243
    .line 244
    cmpg-float v7, v5, v6

    .line 245
    .line 246
    if-gez v7, :cond_b

    .line 247
    .line 248
    move v5, v6

    .line 249
    :cond_b
    mul-float/2addr v5, v0

    .line 250
    const/4 v6, 0x2

    .line 251
    new-array v7, v6, [F

    .line 252
    .line 253
    aput v4, v7, v1

    .line 254
    .line 255
    aput v5, v7, v3

    .line 256
    .line 257
    aget p1, p1, v6

    .line 258
    .line 259
    mul-float/2addr p1, v0

    .line 260
    invoke-direct {v2, v7, p1}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 264
    .line 265
    .line 266
    :cond_c
    return-void
.end method

.method private final resetShareMatrix(Landroid/graphics/Matrix;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getScaleEntity()Lcom/momo/xeengine/svgaplayer/ScaleEntity;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/ScaleEntity;->getScaleFx()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getScaleEntity()Lcom/momo/xeengine/svgaplayer/ScaleEntity;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/ScaleEntity;->getScaleFy()F

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getScaleEntity()Lcom/momo/xeengine/svgaplayer/ScaleEntity;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/ScaleEntity;->getTranFx()F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->getScaleEntity()Lcom/momo/xeengine/svgaplayer/ScaleEntity;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Lcom/momo/xeengine/svgaplayer/ScaleEntity;->getTranFy()F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->sharedFrameMatrix:Landroid/graphics/Matrix;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 51
    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public drawFrame(Landroid/graphics/Canvas;ILandroid/widget/ImageView$ScaleType;)V
    .locals 1
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/widget/ImageView$ScaleType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1, p2, p3}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->drawFrame(Landroid/graphics/Canvas;ILandroid/widget/ImageView$ScaleType;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->resetCachePath(Landroid/graphics/Canvas;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p2}, Lcom/momo/xeengine/svgaplayer/SGVADrawer;->requestFrameSprites$gift_player_release(I)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    check-cast p3, Ljava/lang/Iterable;

    .line 18
    .line 19
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;

    .line 34
    .line 35
    invoke-direct {p0, v0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawSprite(Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;Landroid/graphics/Canvas;I)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-direct {p0, p2}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->playAudio(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final getDynamicItem()Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->dynamicItem:Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    .line 2
    .line 3
    return-object p0
.end method
