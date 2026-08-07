.class public final Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;
.super Lcom/tantan/library/svga/drawer/SGVADrawer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0014\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0000\u0018\u00002\u00020\u0001:\u00016B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0002\u0010\u0006J \u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eH\u0002J0\u0010\u001f\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020\u001e2\u0006\u0010#\u001a\u00020\u001eH\u0016J\u0018\u0010$\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001cH\u0002J\u0018\u0010%\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001cH\u0002J \u0010&\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eH\u0002J(\u0010\'\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010(\u001a\u00020\u000e2\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010)\u001a\u00020*H\u0002J\u001e\u0010+\u001a\u00020\t2\u0006\u0010,\u001a\u00020\u001e2\u000c\u0010-\u001a\u0008\u0012\u0004\u0012\u00020\u001a0.H\u0002J\u001e\u0010/\u001a\u00020\t2\u0006\u0010,\u001a\u00020\u001e2\u000c\u0010-\u001a\u0008\u0012\u0004\u0012\u00020\u001a0.H\u0002J\u0010\u00100\u001a\u0002012\u0006\u00102\u001a\u00020*H\u0002J\u0010\u00103\u001a\u0002042\u0006\u00105\u001a\u000204H\u0002R\u0018\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\nR*\u0010\u000b\u001a\u001e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e0\u000cj\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e`\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0018\u0010\u0010\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\nR\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0016X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00067"
    }
    d2 = {
        "Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;",
        "Lcom/tantan/library/svga/drawer/SGVADrawer;",
        "videoItem",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "dynamicItem",
        "Lcom/tantan/library/svga/compose/SVGADynamicEntity;",
        "(Lcom/tantan/library/svga/compose/SVGAVideoEntity;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V",
        "beginIndexList",
        "",
        "",
        "[Ljava/lang/Boolean;",
        "drawTextCache",
        "Ljava/util/HashMap;",
        "",
        "Landroid/graphics/Bitmap;",
        "Lkotlin/collections/HashMap;",
        "endIndexList",
        "matrixScaleTempValues",
        "",
        "pathCache",
        "Lcom/tantan/library/svga/utils/PathCache;",
        "sharedValues",
        "Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;",
        "drawDynamic",
        "",
        "sprite",
        "Lcom/tantan/library/svga/utils/DrawerSprite;",
        "canvas",
        "Landroid/graphics/Canvas;",
        "frameIndex",
        "",
        "drawFrame",
        "scaleType",
        "Landroid/widget/ImageView$ScaleType;",
        "width",
        "height",
        "drawImage",
        "drawShape",
        "drawSprite",
        "drawTextOnBitmap",
        "drawingBitmap",
        "frameMatrix",
        "Landroid/graphics/Matrix;",
        "isMatteBegin",
        "spriteIndex",
        "sprites",
        "",
        "isMatteEnd",
        "matrixScale",
        "",
        "matrix",
        "shareFrameMatrix",
        "Lcom/tantan/library/svga/utils/FMatrix;",
        "transform",
        "ShareValues",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private beginIndexList:[Ljava/lang/Boolean;
    .annotation build Lorg/jetbrains/annotations/Nullable;
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

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private endIndexList:[Ljava/lang/Boolean;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final matrixScaleTempValues:[F
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final pathCache:Lcom/tantan/library/svga/utils/PathCache;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/SVGAVideoEntity;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/compose/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/compose/SVGADynamicEntity;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/drawer/SGVADrawer;-><init>(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 8
    .line 9
    new-instance p1, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 15
    .line 16
    new-instance p1, Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 22
    .line 23
    new-instance p1, Lcom/tantan/library/svga/utils/PathCache;

    .line 24
    .line 25
    invoke-direct {p1}, Lcom/tantan/library/svga/utils/PathCache;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->pathCache:Lcom/tantan/library/svga/utils/PathCache;

    .line 29
    .line 30
    const/16 p1, 0x10

    .line 31
    .line 32
    new-array p1, p1, [F

    .line 33
    .line 34
    iput-object p1, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->matrixScaleTempValues:[F

    .line 35
    .line 36
    return-void
.end method

.method private final drawDynamic(Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Canvas;I)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getImageKey()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    iget-object v1, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getDynamicDrawer$svga_lib_release()Ljava/util/HashMap;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lkotlin/jvm/functions/Function2;

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMatrix()Lcom/tantan/library/svga/utils/FMatrix;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-direct {p0, v2}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->shareFrameMatrix(Lcom/tantan/library/svga/utils/FMatrix;)Lcom/tantan/library/svga/utils/FMatrix;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2, v2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-interface {v1, p2, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v1, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getDynamicDrawerSized$svga_lib_release()Ljava/util/HashMap;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lkotlin/jvm/functions/Function4;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMatrix()Lcom/tantan/library/svga/utils/FMatrix;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-direct {p0, v1}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->shareFrameMatrix(Lcom/tantan/library/svga/utils/FMatrix;)Lcom/tantan/library/svga/utils/FMatrix;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2, p0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    invoke-virtual {p3}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getLayout()Lcom/tantan/library/svga/utils/FRect;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    invoke-virtual {p3}, Lcom/tantan/library/svga/utils/FRect;->getWidth()F

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    float-to-int p3, p3

    .line 108
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object p3

    .line 112
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p1}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getLayout()Lcom/tantan/library/svga/utils/FRect;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/FRect;->getHeight()F

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    float-to-int p1, p1

    .line 125
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-interface {v0, p2, p0, p3, p1}, Lkotlin/jvm/functions/Function4;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 133
    .line 134
    .line 135
    :cond_2
    :goto_0
    return-void
.end method

.method private final drawImage(Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getImageKey()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_3

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getDynamicHidden$svga_lib_release()Ljava/util/HashMap;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Boolean;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 28
    .line 29
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    goto/16 :goto_3

    .line 36
    .line 37
    :cond_3
    const-string v0, ".matte"

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    const/4 v3, 0x0

    .line 41
    const/4 v4, 0x2

    .line 42
    invoke-static {v1, v0, v3, v4, v2}, Lkotlin/text/d;->w(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-int/lit8 v0, v0, -0x6

    .line 53
    .line 54
    invoke-virtual {v1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    goto :goto_0

    .line 59
    :cond_4
    move-object v0, v1

    .line 60
    :goto_0
    iget-object v2, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 61
    .line 62
    if-eqz v2, :cond_6

    .line 63
    .line 64
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getDynamicImage$svga_lib_release()Ljava/util/HashMap;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    if-eqz v2, :cond_6

    .line 69
    .line 70
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Landroid/graphics/Bitmap;

    .line 75
    .line 76
    if-nez v2, :cond_5

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_5
    move-object v6, v2

    .line 80
    goto :goto_2

    .line 81
    :cond_6
    :goto_1
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/SGVADrawer;->getVideoItem()Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getImageMap()Ljava/util/HashMap;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    move-object v2, v0

    .line 94
    check-cast v2, Landroid/graphics/Bitmap;

    .line 95
    .line 96
    if-nez v2, :cond_5

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :goto_2
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMatrix()Lcom/tantan/library/svga/utils/FMatrix;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-direct {p0, v0}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->shareFrameMatrix(Lcom/tantan/library/svga/utils/FMatrix;)Lcom/tantan/library/svga/utils/FMatrix;

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPaint()Landroid/graphics/Paint;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const/4 v2, 0x1

    .line 118
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getAlpha()F

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    const/high16 v5, 0x437f0000    # 255.0f

    .line 133
    .line 134
    mul-float/2addr v2, v5

    .line 135
    float-to-int v2, v2

    .line 136
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    if-eqz v2, :cond_9

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    if-nez v2, :cond_7

    .line 158
    .line 159
    :goto_3
    return-void

    .line 160
    :cond_7
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 161
    .line 162
    .line 163
    iget-object v5, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 164
    .line 165
    invoke-virtual {v5}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath()Landroid/graphics/Path;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-virtual {v2, v5}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->buildPath(Landroid/graphics/Path;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v5, v7}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p2, v5}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 176
    .line 177
    .line 178
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getLayout()Lcom/tantan/library/svga/utils/FRect;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-virtual {v2}, Lcom/tantan/library/svga/utils/FRect;->getWidth()F

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 191
    .line 192
    .line 193
    move-result v5

    .line 194
    int-to-float v5, v5

    .line 195
    div-float/2addr v2, v5

    .line 196
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    invoke-virtual {v5}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getLayout()Lcom/tantan/library/svga/utils/FRect;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    invoke-virtual {v5}, Lcom/tantan/library/svga/utils/FRect;->getHeight()F

    .line 205
    .line 206
    .line 207
    move-result v5

    .line 208
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    .line 209
    .line 210
    .line 211
    move-result v8

    .line 212
    int-to-float v8, v8

    .line 213
    div-float/2addr v5, v8

    .line 214
    invoke-virtual {v7, v2, v5}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 215
    .line 216
    .line 217
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    if-nez v2, :cond_8

    .line 222
    .line 223
    invoke-virtual {p2, v6, v7, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 224
    .line 225
    .line 226
    :cond_8
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 227
    .line 228
    .line 229
    goto :goto_4

    .line 230
    :cond_9
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getLayout()Lcom/tantan/library/svga/utils/FRect;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    invoke-virtual {v2}, Lcom/tantan/library/svga/utils/FRect;->getWidth()F

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 243
    .line 244
    .line 245
    move-result v5

    .line 246
    int-to-float v5, v5

    .line 247
    div-float/2addr v2, v5

    .line 248
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 249
    .line 250
    .line 251
    move-result-object v5

    .line 252
    invoke-virtual {v5}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getLayout()Lcom/tantan/library/svga/utils/FRect;

    .line 253
    .line 254
    .line 255
    move-result-object v5

    .line 256
    invoke-virtual {v5}, Lcom/tantan/library/svga/utils/FRect;->getHeight()F

    .line 257
    .line 258
    .line 259
    move-result v5

    .line 260
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    .line 261
    .line 262
    .line 263
    move-result v8

    .line 264
    int-to-float v8, v8

    .line 265
    div-float/2addr v5, v8

    .line 266
    invoke-virtual {v7, v2, v5}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 267
    .line 268
    .line 269
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    if-nez v2, :cond_a

    .line 274
    .line 275
    invoke-virtual {p2, v6, v7, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 276
    .line 277
    .line 278
    :cond_a
    :goto_4
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 279
    .line 280
    if-eqz v0, :cond_b

    .line 281
    .line 282
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getDynamicIClickArea$svga_lib_release()Ljava/util/HashMap;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    if-eqz v0, :cond_b

    .line 287
    .line 288
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    check-cast v0, Lcom/tantan/library/svga/compose/SVGADynamicEntity$IClickAreaListener;

    .line 293
    .line 294
    if-eqz v0, :cond_b

    .line 295
    .line 296
    const/16 v2, 0x9

    .line 297
    .line 298
    new-array v2, v2, [F

    .line 299
    .line 300
    fill-array-data v2, :array_0

    .line 301
    .line 302
    .line 303
    invoke-virtual {v7, v2}, Landroid/graphics/Matrix;->getValues([F)V

    .line 304
    .line 305
    .line 306
    aget v5, v2, v4

    .line 307
    .line 308
    float-to-int v5, v5

    .line 309
    const/4 v8, 0x5

    .line 310
    aget v9, v2, v8

    .line 311
    .line 312
    float-to-int v9, v9

    .line 313
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 314
    .line 315
    .line 316
    move-result v10

    .line 317
    int-to-float v10, v10

    .line 318
    aget v3, v2, v3

    .line 319
    .line 320
    mul-float/2addr v10, v3

    .line 321
    aget v3, v2, v4

    .line 322
    .line 323
    add-float/2addr v10, v3

    .line 324
    float-to-int v4, v10

    .line 325
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    .line 326
    .line 327
    .line 328
    move-result v3

    .line 329
    int-to-float v3, v3

    .line 330
    const/4 v10, 0x4

    .line 331
    aget v10, v2, v10

    .line 332
    .line 333
    mul-float/2addr v3, v10

    .line 334
    aget v2, v2, v8

    .line 335
    .line 336
    add-float/2addr v3, v2

    .line 337
    float-to-int v2, v3

    .line 338
    move v3, v5

    .line 339
    move v5, v2

    .line 340
    move v2, v3

    .line 341
    move v3, v9

    .line 342
    invoke-interface/range {v0 .. v5}, Lcom/tantan/library/svga/compose/SVGADynamicEntity$IClickAreaListener;->onResponseArea(Ljava/lang/String;IIII)V

    .line 343
    .line 344
    .line 345
    :cond_b
    invoke-direct {p0, p2, v6, p1, v7}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawTextOnBitmap(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Matrix;)V

    .line 346
    .line 347
    .line 348
    return-void

    .line 349
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

.method private final drawShape(Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Canvas;)V
    .locals 13

    .line 1
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMatrix()Lcom/tantan/library/svga/utils/FMatrix;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->shareFrameMatrix(Lcom/tantan/library/svga/utils/FMatrix;)Lcom/tantan/library/svga/utils/FMatrix;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getShapes()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/Iterable;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_17

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->buildPath()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->getShapePath()Landroid/graphics/Path;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    iget-object v3, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 49
    .line 50
    invoke-virtual {v3}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPaint()Landroid/graphics/Paint;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v3}, Landroid/graphics/Paint;->reset()V

    .line 55
    .line 56
    .line 57
    const/4 v4, 0x1

    .line 58
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-virtual {v5}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getAlpha()F

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    const/high16 v6, 0x437f0000    # 255.0f

    .line 70
    .line 71
    mul-float/2addr v5, v6

    .line 72
    float-to-int v5, v5

    .line 73
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 74
    .line 75
    .line 76
    iget-object v5, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 77
    .line 78
    invoke-virtual {v5}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath()Landroid/graphics/Path;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    .line 83
    .line 84
    .line 85
    iget-object v7, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->pathCache:Lcom/tantan/library/svga/utils/PathCache;

    .line 86
    .line 87
    invoke-virtual {v7, v2}, Lcom/tantan/library/svga/utils/PathCache;->buildPath(Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;)Landroid/graphics/Path;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    if-eqz v7, :cond_1

    .line 92
    .line 93
    invoke-virtual {v5, v7}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 94
    .line 95
    .line 96
    :cond_1
    iget-object v7, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 97
    .line 98
    invoke-virtual {v7}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatrix2()Landroid/graphics/Matrix;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    invoke-virtual {v7}, Landroid/graphics/Matrix;->reset()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->getMatrix()Lcom/tantan/library/svga/utils/FMatrix;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    if-eqz v8, :cond_2

    .line 110
    .line 111
    invoke-virtual {v7, v8}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 112
    .line 113
    .line 114
    :cond_2
    invoke-virtual {v7, v0}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 115
    .line 116
    .line 117
    invoke-virtual {v5, v7}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->getStyles()Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    const/4 v9, 0x0

    .line 125
    const/16 v10, 0xff

    .line 126
    .line 127
    if-eqz v8, :cond_6

    .line 128
    .line 129
    invoke-virtual {v8}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getFill()I

    .line 130
    .line 131
    .line 132
    move-result v8

    .line 133
    if-eqz v8, :cond_6

    .line 134
    .line 135
    sget-object v11, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 136
    .line 137
    invoke-virtual {v3, v11}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 144
    .line 145
    .line 146
    move-result-object v8

    .line 147
    invoke-virtual {v8}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getAlpha()F

    .line 148
    .line 149
    .line 150
    move-result v8

    .line 151
    mul-float/2addr v8, v6

    .line 152
    float-to-int v8, v8

    .line 153
    invoke-static {v9, v8}, Lkotlin/ranges/a;->b(II)I

    .line 154
    .line 155
    .line 156
    move-result v8

    .line 157
    invoke-static {v10, v8}, Lkotlin/ranges/a;->e(II)I

    .line 158
    .line 159
    .line 160
    move-result v8

    .line 161
    if-eq v8, v10, :cond_3

    .line 162
    .line 163
    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 164
    .line 165
    .line 166
    :cond_3
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 167
    .line 168
    .line 169
    move-result-object v8

    .line 170
    invoke-virtual {v8}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 171
    .line 172
    .line 173
    move-result-object v8

    .line 174
    if-eqz v8, :cond_4

    .line 175
    .line 176
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 177
    .line 178
    .line 179
    :cond_4
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 180
    .line 181
    .line 182
    move-result-object v8

    .line 183
    invoke-virtual {v8}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 184
    .line 185
    .line 186
    move-result-object v8

    .line 187
    if-eqz v8, :cond_5

    .line 188
    .line 189
    iget-object v11, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 190
    .line 191
    invoke-virtual {v11}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath2()Landroid/graphics/Path;

    .line 192
    .line 193
    .line 194
    move-result-object v11

    .line 195
    invoke-virtual {v8, v11}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->buildPath(Landroid/graphics/Path;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v11, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p2, v11}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 202
    .line 203
    .line 204
    :cond_5
    invoke-virtual {p2, v5, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 208
    .line 209
    .line 210
    move-result-object v8

    .line 211
    invoke-virtual {v8}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 212
    .line 213
    .line 214
    move-result-object v8

    .line 215
    if-eqz v8, :cond_6

    .line 216
    .line 217
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 218
    .line 219
    .line 220
    :cond_6
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->getStyles()Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 221
    .line 222
    .line 223
    move-result-object v8

    .line 224
    if-eqz v8, :cond_0

    .line 225
    .line 226
    invoke-virtual {v8}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getStrokeWidth()F

    .line 227
    .line 228
    .line 229
    move-result v8

    .line 230
    const/4 v11, 0x0

    .line 231
    cmpl-float v8, v8, v11

    .line 232
    .line 233
    if-lez v8, :cond_0

    .line 234
    .line 235
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 236
    .line 237
    .line 238
    move-result-object v8

    .line 239
    invoke-virtual {v8}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getAlpha()F

    .line 240
    .line 241
    .line 242
    move-result v8

    .line 243
    mul-float/2addr v8, v6

    .line 244
    float-to-int v8, v8

    .line 245
    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 246
    .line 247
    .line 248
    sget-object v8, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 249
    .line 250
    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->getStyles()Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 254
    .line 255
    .line 256
    move-result-object v8

    .line 257
    if-eqz v8, :cond_7

    .line 258
    .line 259
    invoke-virtual {v8}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getStroke()I

    .line 260
    .line 261
    .line 262
    move-result v8

    .line 263
    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 267
    .line 268
    .line 269
    move-result-object v8

    .line 270
    invoke-virtual {v8}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getAlpha()F

    .line 271
    .line 272
    .line 273
    move-result v8

    .line 274
    mul-float/2addr v8, v6

    .line 275
    float-to-int v6, v8

    .line 276
    invoke-static {v9, v6}, Lkotlin/ranges/a;->b(II)I

    .line 277
    .line 278
    .line 279
    move-result v6

    .line 280
    invoke-static {v10, v6}, Lkotlin/ranges/a;->e(II)I

    .line 281
    .line 282
    .line 283
    move-result v6

    .line 284
    if-eq v6, v10, :cond_7

    .line 285
    .line 286
    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 287
    .line 288
    .line 289
    :cond_7
    invoke-direct {p0, v7}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->matrixScale(Landroid/graphics/Matrix;)F

    .line 290
    .line 291
    .line 292
    move-result v6

    .line 293
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->getStyles()Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 294
    .line 295
    .line 296
    move-result-object v7

    .line 297
    if-eqz v7, :cond_8

    .line 298
    .line 299
    invoke-virtual {v7}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getStrokeWidth()F

    .line 300
    .line 301
    .line 302
    move-result v7

    .line 303
    mul-float/2addr v7, v6

    .line 304
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 305
    .line 306
    .line 307
    :cond_8
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->getStyles()Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 308
    .line 309
    .line 310
    move-result-object v7

    .line 311
    const-string v8, "round"

    .line 312
    .line 313
    if-eqz v7, :cond_b

    .line 314
    .line 315
    invoke-virtual {v7}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getLineCap()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v7

    .line 319
    if-eqz v7, :cond_b

    .line 320
    .line 321
    const-string v10, "butt"

    .line 322
    .line 323
    invoke-static {v7, v10, v4}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 324
    .line 325
    .line 326
    move-result v10

    .line 327
    if-eqz v10, :cond_9

    .line 328
    .line 329
    sget-object v7, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    .line 330
    .line 331
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 332
    .line 333
    .line 334
    goto :goto_1

    .line 335
    :cond_9
    invoke-static {v7, v8, v4}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 336
    .line 337
    .line 338
    move-result v10

    .line 339
    if-eqz v10, :cond_a

    .line 340
    .line 341
    sget-object v7, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 342
    .line 343
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 344
    .line 345
    .line 346
    goto :goto_1

    .line 347
    :cond_a
    const-string v10, "square"

    .line 348
    .line 349
    invoke-static {v7, v10, v4}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 350
    .line 351
    .line 352
    move-result v7

    .line 353
    if-eqz v7, :cond_b

    .line 354
    .line 355
    sget-object v7, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    .line 356
    .line 357
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 358
    .line 359
    .line 360
    :cond_b
    :goto_1
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->getStyles()Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 361
    .line 362
    .line 363
    move-result-object v7

    .line 364
    if-eqz v7, :cond_e

    .line 365
    .line 366
    invoke-virtual {v7}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getLineJoin()Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v7

    .line 370
    if-eqz v7, :cond_e

    .line 371
    .line 372
    const-string v10, "miter"

    .line 373
    .line 374
    invoke-static {v7, v10, v4}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 375
    .line 376
    .line 377
    move-result v10

    .line 378
    if-eqz v10, :cond_c

    .line 379
    .line 380
    sget-object v7, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    .line 381
    .line 382
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 383
    .line 384
    .line 385
    goto :goto_2

    .line 386
    :cond_c
    invoke-static {v7, v8, v4}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 387
    .line 388
    .line 389
    move-result v8

    .line 390
    if-eqz v8, :cond_d

    .line 391
    .line 392
    sget-object v7, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    .line 393
    .line 394
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 395
    .line 396
    .line 397
    goto :goto_2

    .line 398
    :cond_d
    const-string v8, "bevel"

    .line 399
    .line 400
    invoke-static {v7, v8, v4}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 401
    .line 402
    .line 403
    move-result v7

    .line 404
    if-eqz v7, :cond_e

    .line 405
    .line 406
    sget-object v7, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    .line 407
    .line 408
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 409
    .line 410
    .line 411
    :cond_e
    :goto_2
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->getStyles()Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 412
    .line 413
    .line 414
    move-result-object v7

    .line 415
    if-eqz v7, :cond_f

    .line 416
    .line 417
    invoke-virtual {v7}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getMiterLimit()I

    .line 418
    .line 419
    .line 420
    move-result v7

    .line 421
    int-to-float v7, v7

    .line 422
    mul-float/2addr v7, v6

    .line 423
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    .line 424
    .line 425
    .line 426
    :cond_f
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->getStyles()Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 427
    .line 428
    .line 429
    move-result-object v2

    .line 430
    if-eqz v2, :cond_14

    .line 431
    .line 432
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getLineDash()[F

    .line 433
    .line 434
    .line 435
    move-result-object v2

    .line 436
    if-eqz v2, :cond_14

    .line 437
    .line 438
    array-length v7, v2

    .line 439
    const/4 v8, 0x3

    .line 440
    if-ne v7, v8, :cond_10

    .line 441
    .line 442
    aget v7, v2, v9

    .line 443
    .line 444
    cmpl-float v7, v7, v11

    .line 445
    .line 446
    if-gtz v7, :cond_11

    .line 447
    .line 448
    aget v7, v2, v4

    .line 449
    .line 450
    cmpl-float v7, v7, v11

    .line 451
    .line 452
    if-lez v7, :cond_10

    .line 453
    .line 454
    goto :goto_3

    .line 455
    :cond_10
    const/4 v2, 0x0

    .line 456
    :cond_11
    :goto_3
    if-eqz v2, :cond_14

    .line 457
    .line 458
    new-instance v7, Landroid/graphics/DashPathEffect;

    .line 459
    .line 460
    aget v8, v2, v9

    .line 461
    .line 462
    const/high16 v10, 0x3f800000    # 1.0f

    .line 463
    .line 464
    cmpg-float v11, v8, v10

    .line 465
    .line 466
    if-gez v11, :cond_12

    .line 467
    .line 468
    move v8, v10

    .line 469
    :cond_12
    mul-float/2addr v8, v6

    .line 470
    aget v10, v2, v4

    .line 471
    .line 472
    const v11, 0x3dcccccd    # 0.1f

    .line 473
    .line 474
    .line 475
    cmpg-float v12, v10, v11

    .line 476
    .line 477
    if-gez v12, :cond_13

    .line 478
    .line 479
    move v10, v11

    .line 480
    :cond_13
    mul-float/2addr v10, v6

    .line 481
    const/4 v11, 0x2

    .line 482
    new-array v12, v11, [F

    .line 483
    .line 484
    aput v8, v12, v9

    .line 485
    .line 486
    aput v10, v12, v4

    .line 487
    .line 488
    aget v2, v2, v11

    .line 489
    .line 490
    mul-float/2addr v2, v6

    .line 491
    invoke-direct {v7, v12, v2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    .line 492
    .line 493
    .line 494
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 495
    .line 496
    .line 497
    :cond_14
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 498
    .line 499
    .line 500
    move-result-object v2

    .line 501
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 502
    .line 503
    .line 504
    move-result-object v2

    .line 505
    if-eqz v2, :cond_15

    .line 506
    .line 507
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 508
    .line 509
    .line 510
    :cond_15
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 511
    .line 512
    .line 513
    move-result-object v2

    .line 514
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 515
    .line 516
    .line 517
    move-result-object v2

    .line 518
    if-eqz v2, :cond_16

    .line 519
    .line 520
    iget-object v4, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 521
    .line 522
    invoke-virtual {v4}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath2()Landroid/graphics/Path;

    .line 523
    .line 524
    .line 525
    move-result-object v4

    .line 526
    invoke-virtual {v2, v4}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->buildPath(Landroid/graphics/Path;)V

    .line 527
    .line 528
    .line 529
    invoke-virtual {v4, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 530
    .line 531
    .line 532
    invoke-virtual {p2, v4}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 533
    .line 534
    .line 535
    :cond_16
    invoke-virtual {p2, v5, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 536
    .line 537
    .line 538
    invoke-virtual {p1}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 539
    .line 540
    .line 541
    move-result-object v2

    .line 542
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 543
    .line 544
    .line 545
    move-result-object v2

    .line 546
    if-eqz v2, :cond_0

    .line 547
    .line 548
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 549
    .line 550
    .line 551
    goto/16 :goto_0

    .line 552
    .line 553
    :cond_17
    return-void
.end method

.method private final drawSprite(Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Canvas;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawImage(Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawShape(Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawDynamic(Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Canvas;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private final drawTextOnBitmap(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Matrix;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_4

    .line 6
    .line 7
    :cond_0
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->isTextDirty$svga_lib_release()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setTextDirty$svga_lib_release(Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-virtual {p3}, Lcom/tantan/library/svga/utils/DrawerSprite;->getImageKey()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    goto/16 :goto_4

    .line 31
    .line 32
    :cond_2
    iget-object v2, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getDynamicText$svga_lib_release()Ljava/util/HashMap;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Ljava/lang/String;

    .line 43
    .line 44
    const/4 v3, 0x1

    .line 45
    const/4 v4, 0x0

    .line 46
    if-eqz v2, :cond_5

    .line 47
    .line 48
    iget-object v5, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 49
    .line 50
    invoke-virtual {v5}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getDynamicTextPaint$svga_lib_release()Ljava/util/HashMap;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    check-cast v5, Landroid/text/TextPaint;

    .line 59
    .line 60
    if-eqz v5, :cond_5

    .line 61
    .line 62
    iget-object v4, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 63
    .line 64
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    check-cast v4, Landroid/graphics/Bitmap;

    .line 69
    .line 70
    if-eqz v4, :cond_3

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 82
    .line 83
    invoke-static {v4, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    new-instance v6, Landroid/graphics/Rect;

    .line 88
    .line 89
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 94
    .line 95
    .line 96
    move-result v8

    .line 97
    invoke-direct {v6, v1, v1, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v5}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    iget v8, v7, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 108
    .line 109
    iget v7, v7, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 110
    .line 111
    if-eqz v4, :cond_4

    .line 112
    .line 113
    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    int-to-float v9, v9

    .line 118
    const/high16 v10, 0x40000000    # 2.0f

    .line 119
    .line 120
    div-float/2addr v8, v10

    .line 121
    sub-float/2addr v9, v8

    .line 122
    div-float/2addr v7, v10

    .line 123
    sub-float/2addr v9, v7

    .line 124
    new-instance v7, Landroid/graphics/Canvas;

    .line 125
    .line 126
    invoke-direct {v7, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    .line 130
    .line 131
    .line 132
    move-result v6

    .line 133
    int-to-float v6, v6

    .line 134
    invoke-virtual {v7, v2, v6, v9, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 135
    .line 136
    .line 137
    :cond_4
    iget-object v2, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 138
    .line 139
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v2, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    check-cast v2, Landroid/graphics/Bitmap;

    .line 147
    .line 148
    :cond_5
    :goto_0
    iget-object v2, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 149
    .line 150
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getDynamicBoringLayoutText$svga_lib_release()Ljava/util/HashMap;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    check-cast v2, Landroid/text/BoringLayout;

    .line 159
    .line 160
    const/4 v5, 0x0

    .line 161
    if-eqz v2, :cond_8

    .line 162
    .line 163
    iget-object v4, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 164
    .line 165
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    check-cast v4, Landroid/graphics/Bitmap;

    .line 170
    .line 171
    if-eqz v4, :cond_6

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_6
    invoke-virtual {v2}, Landroid/text/Layout;->getPaint()Landroid/text/TextPaint;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 182
    .line 183
    .line 184
    move-result v4

    .line 185
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 190
    .line 191
    invoke-static {v4, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 192
    .line 193
    .line 194
    move-result-object v4

    .line 195
    if-eqz v4, :cond_7

    .line 196
    .line 197
    new-instance v6, Landroid/graphics/Canvas;

    .line 198
    .line 199
    invoke-direct {v6, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 203
    .line 204
    .line 205
    move-result v7

    .line 206
    invoke-virtual {v2}, Landroid/text/BoringLayout;->getHeight()I

    .line 207
    .line 208
    .line 209
    move-result v8

    .line 210
    sub-int/2addr v7, v8

    .line 211
    div-int/lit8 v7, v7, 0x2

    .line 212
    .line 213
    int-to-float v7, v7

    .line 214
    invoke-virtual {v6, v5, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v2, v6}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 218
    .line 219
    .line 220
    :cond_7
    iget-object v2, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 221
    .line 222
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v2, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    check-cast v2, Landroid/graphics/Bitmap;

    .line 230
    .line 231
    :cond_8
    :goto_1
    iget-object v2, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 232
    .line 233
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getDynamicStaticLayoutText$svga_lib_release()Ljava/util/HashMap;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    check-cast v2, Landroid/text/StaticLayout;

    .line 242
    .line 243
    if-eqz v2, :cond_b

    .line 244
    .line 245
    iget-object v4, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 246
    .line 247
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v4

    .line 251
    check-cast v4, Landroid/graphics/Bitmap;

    .line 252
    .line 253
    if-eqz v4, :cond_9

    .line 254
    .line 255
    goto/16 :goto_3

    .line 256
    .line 257
    :cond_9
    invoke-virtual {v2}, Landroid/text/Layout;->getPaint()Landroid/text/TextPaint;

    .line 258
    .line 259
    .line 260
    move-result-object v4

    .line 261
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 262
    .line 263
    .line 264
    :try_start_0
    const-class v4, Landroid/text/StaticLayout;

    .line 265
    .line 266
    const-string v6, "mMaximumVisibleLineCount"

    .line 267
    .line 268
    invoke-virtual {v4, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 269
    .line 270
    .line 271
    move-result-object v4

    .line 272
    invoke-virtual {v4, v3}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v4, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    .line 276
    .line 277
    .line 278
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 279
    goto :goto_2

    .line 280
    :catch_0
    const v4, 0x7fffffff

    .line 281
    .line 282
    .line 283
    :goto_2
    invoke-virtual {v2}, Landroid/text/Layout;->getText()Ljava/lang/CharSequence;

    .line 284
    .line 285
    .line 286
    move-result-object v6

    .line 287
    invoke-virtual {v2}, Landroid/text/Layout;->getText()Ljava/lang/CharSequence;

    .line 288
    .line 289
    .line 290
    move-result-object v7

    .line 291
    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    .line 292
    .line 293
    .line 294
    move-result v7

    .line 295
    invoke-virtual {v2}, Landroid/text/Layout;->getPaint()Landroid/text/TextPaint;

    .line 296
    .line 297
    .line 298
    move-result-object v8

    .line 299
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 300
    .line 301
    .line 302
    move-result v9

    .line 303
    invoke-static {v6, v1, v7, v8, v9}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    .line 304
    .line 305
    .line 306
    move-result-object v6

    .line 307
    invoke-virtual {v2}, Landroid/text/Layout;->getAlignment()Landroid/text/Layout$Alignment;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    invoke-virtual {v6, v2}, Landroid/text/StaticLayout$Builder;->setAlignment(Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    invoke-virtual {v2, v4}, Landroid/text/StaticLayout$Builder;->setMaxLines(I)Landroid/text/StaticLayout$Builder;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 320
    .line 321
    invoke-virtual {v2, v4}, Landroid/text/StaticLayout$Builder;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)Landroid/text/StaticLayout$Builder;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    invoke-virtual {v2}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 330
    .line 331
    .line 332
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 333
    .line 334
    .line 335
    move-result v4

    .line 336
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 337
    .line 338
    .line 339
    move-result v6

    .line 340
    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 341
    .line 342
    invoke-static {v4, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 343
    .line 344
    .line 345
    move-result-object v4

    .line 346
    if-eqz v4, :cond_a

    .line 347
    .line 348
    new-instance v6, Landroid/graphics/Canvas;

    .line 349
    .line 350
    invoke-direct {v6, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 354
    .line 355
    .line 356
    move-result v7

    .line 357
    invoke-virtual {v2}, Landroid/text/Layout;->getHeight()I

    .line 358
    .line 359
    .line 360
    move-result v8

    .line 361
    sub-int/2addr v7, v8

    .line 362
    div-int/lit8 v7, v7, 0x2

    .line 363
    .line 364
    int-to-float v7, v7

    .line 365
    invoke-virtual {v6, v5, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 366
    .line 367
    .line 368
    invoke-virtual {v2, v6}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 369
    .line 370
    .line 371
    :cond_a
    iget-object v2, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawTextCache:Ljava/util/HashMap;

    .line 372
    .line 373
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 374
    .line 375
    .line 376
    invoke-virtual {v2, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    check-cast v0, Landroid/graphics/Bitmap;

    .line 381
    .line 382
    :cond_b
    :goto_3
    if-eqz v4, :cond_e

    .line 383
    .line 384
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 385
    .line 386
    invoke-virtual {v0}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPaint()Landroid/graphics/Paint;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 391
    .line 392
    .line 393
    invoke-virtual {p3}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 394
    .line 395
    .line 396
    move-result-object v2

    .line 397
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getAlpha()F

    .line 398
    .line 399
    .line 400
    move-result v2

    .line 401
    const/high16 v5, 0x437f0000    # 255.0f

    .line 402
    .line 403
    mul-float/2addr v2, v5

    .line 404
    float-to-int v2, v2

    .line 405
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 406
    .line 407
    .line 408
    invoke-virtual {p3}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 409
    .line 410
    .line 411
    move-result-object v2

    .line 412
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 413
    .line 414
    .line 415
    move-result-object v2

    .line 416
    if-eqz v2, :cond_d

    .line 417
    .line 418
    invoke-virtual {p3}, Lcom/tantan/library/svga/utils/DrawerSprite;->getFrame()Lcom/tantan/library/svga/compose/entities/SVGAFrame;

    .line 419
    .line 420
    .line 421
    move-result-object p3

    .line 422
    invoke-virtual {p3}, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 423
    .line 424
    .line 425
    move-result-object p3

    .line 426
    if-nez p3, :cond_c

    .line 427
    .line 428
    goto :goto_4

    .line 429
    :cond_c
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 430
    .line 431
    .line 432
    invoke-virtual {p1, p4}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 433
    .line 434
    .line 435
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 436
    .line 437
    .line 438
    move-result p4

    .line 439
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 440
    .line 441
    .line 442
    move-result p2

    .line 443
    invoke-virtual {p1, v1, v1, p4, p2}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 444
    .line 445
    .line 446
    new-instance p2, Landroid/graphics/BitmapShader;

    .line 447
    .line 448
    sget-object p4, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 449
    .line 450
    invoke-direct {p2, v4, p4, p4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 451
    .line 452
    .line 453
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 454
    .line 455
    .line 456
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 457
    .line 458
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath()Landroid/graphics/Path;

    .line 459
    .line 460
    .line 461
    move-result-object p0

    .line 462
    invoke-virtual {p3, p0}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->buildPath(Landroid/graphics/Path;)V

    .line 463
    .line 464
    .line 465
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 466
    .line 467
    .line 468
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 469
    .line 470
    .line 471
    goto :goto_4

    .line 472
    :cond_d
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {p1, v4, p4, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 476
    .line 477
    .line 478
    :cond_e
    :goto_4
    return-void
.end method

.method private final isMatteBegin(ILjava/util/List;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/utils/DrawerSprite;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->beginIndexList:[Ljava/lang/Boolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_8

    .line 5
    .line 6
    move-object v0, p2

    .line 7
    check-cast v0, Ljava/util/Collection;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    new-array v2, v0, [Ljava/lang/Boolean;

    .line 14
    .line 15
    move v3, v1

    .line 16
    :goto_0
    if-ge v3, v0, :cond_0

    .line 17
    .line 18
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 19
    .line 20
    aput-object v4, v2, v3

    .line 21
    .line 22
    add-int/lit8 v3, v3, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move-object v0, p2

    .line 26
    check-cast v0, Ljava/lang/Iterable;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    move v3, v1

    .line 33
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-eqz v4, :cond_7

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    add-int/lit8 v5, v3, 0x1

    .line 44
    .line 45
    if-gez v3, :cond_1

    .line 46
    .line 47
    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwIndexOverflow()V

    .line 48
    .line 49
    .line 50
    :cond_1
    check-cast v4, Lcom/tantan/library/svga/utils/DrawerSprite;

    .line 51
    .line 52
    invoke-virtual {v4}, Lcom/tantan/library/svga/utils/DrawerSprite;->getImageKey()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    const/4 v7, 0x0

    .line 57
    if-eqz v6, :cond_2

    .line 58
    .line 59
    const-string v8, ".matte"

    .line 60
    .line 61
    const/4 v9, 0x2

    .line 62
    invoke-static {v6, v8, v1, v9, v7}, Lkotlin/text/d;->w(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    if-eqz v6, :cond_2

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_2
    invoke-virtual {v4}, Lcom/tantan/library/svga/utils/DrawerSprite;->getMatteKey()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    if-eqz v6, :cond_6

    .line 74
    .line 75
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    if-lez v8, :cond_3

    .line 80
    .line 81
    move-object v7, v6

    .line 82
    :cond_3
    if-eqz v7, :cond_6

    .line 83
    .line 84
    add-int/lit8 v6, v3, -0x1

    .line 85
    .line 86
    invoke-interface {p2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    check-cast v6, Lcom/tantan/library/svga/utils/DrawerSprite;

    .line 91
    .line 92
    invoke-virtual {v6}, Lcom/tantan/library/svga/utils/DrawerSprite;->getMatteKey()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    if-eqz v7, :cond_5

    .line 97
    .line 98
    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    if-nez v7, :cond_4

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_4
    invoke-virtual {v6}, Lcom/tantan/library/svga/utils/DrawerSprite;->getMatteKey()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    invoke-virtual {v4}, Lcom/tantan/library/svga/utils/DrawerSprite;->getMatteKey()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-static {v6, v4}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    if-nez v4, :cond_6

    .line 118
    .line 119
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 120
    .line 121
    aput-object v4, v2, v3

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_5
    :goto_2
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 125
    .line 126
    aput-object v4, v2, v3

    .line 127
    .line 128
    :cond_6
    :goto_3
    move v3, v5

    .line 129
    goto :goto_1

    .line 130
    :cond_7
    iput-object v2, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->beginIndexList:[Ljava/lang/Boolean;

    .line 131
    .line 132
    :cond_8
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->beginIndexList:[Ljava/lang/Boolean;

    .line 133
    .line 134
    if-eqz p0, :cond_9

    .line 135
    .line 136
    aget-object p0, p0, p1

    .line 137
    .line 138
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    return p0

    .line 143
    :cond_9
    return v1
.end method

.method private final isMatteEnd(ILjava/util/List;)Z
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/utils/DrawerSprite;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->endIndexList:[Ljava/lang/Boolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_8

    .line 6
    .line 7
    move-object v0, p2

    .line 8
    check-cast v0, Ljava/util/Collection;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    new-array v4, v3, [Ljava/lang/Boolean;

    .line 15
    .line 16
    move v5, v2

    .line 17
    :goto_0
    if-ge v5, v3, :cond_0

    .line 18
    .line 19
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    aput-object v6, v4, v5

    .line 22
    .line 23
    add-int/lit8 v5, v5, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object v3, p2

    .line 27
    check-cast v3, Ljava/lang/Iterable;

    .line 28
    .line 29
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    move v5, v2

    .line 34
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    if-eqz v6, :cond_7

    .line 39
    .line 40
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    add-int/lit8 v7, v5, 0x1

    .line 45
    .line 46
    if-gez v5, :cond_1

    .line 47
    .line 48
    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwIndexOverflow()V

    .line 49
    .line 50
    .line 51
    :cond_1
    check-cast v6, Lcom/tantan/library/svga/utils/DrawerSprite;

    .line 52
    .line 53
    invoke-virtual {v6}, Lcom/tantan/library/svga/utils/DrawerSprite;->getImageKey()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    if-eqz v8, :cond_2

    .line 58
    .line 59
    const-string v9, ".matte"

    .line 60
    .line 61
    const/4 v10, 0x2

    .line 62
    invoke-static {v8, v9, v2, v10, v1}, Lkotlin/text/d;->w(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v8

    .line 66
    if-eqz v8, :cond_2

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_2
    invoke-virtual {v6}, Lcom/tantan/library/svga/utils/DrawerSprite;->getMatteKey()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v8

    .line 73
    if-eqz v8, :cond_6

    .line 74
    .line 75
    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    if-lez v8, :cond_6

    .line 80
    .line 81
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 82
    .line 83
    .line 84
    move-result v8

    .line 85
    add-int/lit8 v8, v8, -0x1

    .line 86
    .line 87
    if-ne v5, v8, :cond_3

    .line 88
    .line 89
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 90
    .line 91
    aput-object v6, v4, v5

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_3
    invoke-interface {p2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v8

    .line 98
    check-cast v8, Lcom/tantan/library/svga/utils/DrawerSprite;

    .line 99
    .line 100
    invoke-virtual {v8}, Lcom/tantan/library/svga/utils/DrawerSprite;->getMatteKey()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v9

    .line 104
    if-eqz v9, :cond_5

    .line 105
    .line 106
    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    .line 107
    .line 108
    .line 109
    move-result v9

    .line 110
    if-nez v9, :cond_4

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_4
    invoke-virtual {v8}, Lcom/tantan/library/svga/utils/DrawerSprite;->getMatteKey()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v8

    .line 117
    invoke-virtual {v6}, Lcom/tantan/library/svga/utils/DrawerSprite;->getMatteKey()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-static {v8, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    if-nez v6, :cond_6

    .line 126
    .line 127
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 128
    .line 129
    aput-object v6, v4, v5

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_5
    :goto_2
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 133
    .line 134
    aput-object v6, v4, v5

    .line 135
    .line 136
    :cond_6
    :goto_3
    move v5, v7

    .line 137
    goto :goto_1

    .line 138
    :cond_7
    iput-object v4, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->endIndexList:[Ljava/lang/Boolean;

    .line 139
    .line 140
    :cond_8
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->endIndexList:[Ljava/lang/Boolean;

    .line 141
    .line 142
    if-eqz p0, :cond_a

    .line 143
    .line 144
    array-length p2, p0

    .line 145
    if-le p2, p1, :cond_9

    .line 146
    .line 147
    move-object v1, p0

    .line 148
    :cond_9
    if-eqz v1, :cond_a

    .line 149
    .line 150
    aget-object p0, v1, p1

    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    return p0

    .line 157
    :cond_a
    return v2
.end method

.method private final matrixScale(Landroid/graphics/Matrix;)F
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->matrixScaleTempValues:[F

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->matrixScaleTempValues:[F

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    aget v0, p1, v0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    cmpg-float v2, v0, v1

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    float-to-double v2, v0

    .line 18
    const/4 v0, 0x3

    .line 19
    aget v0, p1, v0

    .line 20
    .line 21
    float-to-double v4, v0

    .line 22
    const/4 v0, 0x1

    .line 23
    aget v0, p1, v0

    .line 24
    .line 25
    float-to-double v6, v0

    .line 26
    const/4 v0, 0x4

    .line 27
    aget p1, p1, v0

    .line 28
    .line 29
    float-to-double v8, p1

    .line 30
    mul-double v10, v2, v8

    .line 31
    .line 32
    mul-double v12, v4, v6

    .line 33
    .line 34
    cmpg-double p1, v10, v12

    .line 35
    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    return v1

    .line 39
    :cond_1
    mul-double v0, v2, v2

    .line 40
    .line 41
    mul-double v10, v4, v4

    .line 42
    .line 43
    add-double/2addr v0, v10

    .line 44
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    div-double/2addr v2, v0

    .line 49
    div-double/2addr v4, v0

    .line 50
    mul-double v10, v2, v6

    .line 51
    .line 52
    mul-double v12, v4, v8

    .line 53
    .line 54
    add-double/2addr v10, v12

    .line 55
    mul-double v12, v2, v10

    .line 56
    .line 57
    sub-double/2addr v6, v12

    .line 58
    mul-double/2addr v10, v4

    .line 59
    sub-double/2addr v8, v10

    .line 60
    mul-double v10, v6, v6

    .line 61
    .line 62
    mul-double v12, v8, v8

    .line 63
    .line 64
    add-double/2addr v10, v12

    .line 65
    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    .line 66
    .line 67
    .line 68
    move-result-wide v10

    .line 69
    div-double/2addr v6, v10

    .line 70
    div-double/2addr v8, v10

    .line 71
    mul-double/2addr v2, v8

    .line 72
    mul-double/2addr v4, v6

    .line 73
    cmpg-double p1, v2, v4

    .line 74
    .line 75
    if-gez p1, :cond_2

    .line 76
    .line 77
    neg-double v0, v0

    .line 78
    :cond_2
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/SGVADrawer;->getScaleInfo()Lcom/tantan/library/svga/utils/SVGAScaleInfo;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->getRatioX()Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_3

    .line 87
    .line 88
    double-to-float p0, v0

    .line 89
    :goto_0
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    return p0

    .line 94
    :cond_3
    double-to-float p0, v10

    .line 95
    goto :goto_0
.end method

.method private final shareFrameMatrix(Lcom/tantan/library/svga/utils/FMatrix;)Lcom/tantan/library/svga/utils/FMatrix;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatrix()Lcom/tantan/library/svga/utils/FMatrix;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/SGVADrawer;->getScaleInfo()Lcom/tantan/library/svga/utils/SVGAScaleInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->getScaleFx()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/SGVADrawer;->getScaleInfo()Lcom/tantan/library/svga/utils/SVGAScaleInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->getScaleFy()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/SGVADrawer;->getScaleInfo()Lcom/tantan/library/svga/utils/SVGAScaleInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->getTranFx()F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/SGVADrawer;->getScaleInfo()Lcom/tantan/library/svga/utils/SVGAScaleInfo;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/tantan/library/svga/utils/SVGAScaleInfo;->getTranFy()F

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {v0, v1, p0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 46
    .line 47
    .line 48
    return-object v0
.end method


# virtual methods
.method public drawFrame(Landroid/graphics/Canvas;ILandroid/widget/ImageView$ScaleType;II)V
    .locals 18
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/widget/ImageView$ScaleType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v7, p2

    .line 6
    .line 7
    move/from16 v8, p4

    .line 8
    .line 9
    move/from16 v9, p5

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-super/range {p0 .. p5}, Lcom/tantan/library/svga/drawer/SGVADrawer;->drawFrame(Landroid/graphics/Canvas;ILandroid/widget/ImageView$ScaleType;II)V

    .line 18
    .line 19
    .line 20
    iget-object v2, v0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->pathCache:Lcom/tantan/library/svga/utils/PathCache;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Lcom/tantan/library/svga/utils/PathCache;->onSizeChanged(Landroid/graphics/Canvas;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v7}, Lcom/tantan/library/svga/drawer/SGVADrawer;->requestFrameSprites$svga_lib_release(I)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v10

    .line 29
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    new-instance v11, Ljava/util/LinkedHashMap;

    .line 37
    .line 38
    invoke-direct {v11}, Ljava/util/LinkedHashMap;-><init>()V

    .line 39
    .line 40
    .line 41
    const/4 v12, 0x0

    .line 42
    iput-object v12, v0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->beginIndexList:[Ljava/lang/Boolean;

    .line 43
    .line 44
    iput-object v12, v0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->endIndexList:[Ljava/lang/Boolean;

    .line 45
    .line 46
    move-object v2, v10

    .line 47
    check-cast v2, Ljava/lang/Iterable;

    .line 48
    .line 49
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v13

    .line 53
    const/4 v14, 0x0

    .line 54
    move v2, v14

    .line 55
    const/4 v3, -0x1

    .line 56
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eqz v4, :cond_6

    .line 61
    .line 62
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    add-int/lit8 v16, v2, 0x1

    .line 67
    .line 68
    if-gez v2, :cond_1

    .line 69
    .line 70
    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwIndexOverflow()V

    .line 71
    .line 72
    .line 73
    :cond_1
    check-cast v4, Lcom/tantan/library/svga/utils/DrawerSprite;

    .line 74
    .line 75
    invoke-virtual {v4}, Lcom/tantan/library/svga/utils/DrawerSprite;->getImageKey()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    if-eqz v5, :cond_3

    .line 80
    .line 81
    const-string v6, ".matte"

    .line 82
    .line 83
    const/4 v15, 0x2

    .line 84
    invoke-static {v5, v6, v14, v15, v12}, Lkotlin/text/d;->w(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    if-eqz v6, :cond_3

    .line 89
    .line 90
    invoke-interface {v11, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    :cond_2
    const/4 v2, -0x1

    .line 94
    goto :goto_2

    .line 95
    :cond_3
    invoke-direct {v0, v2, v10}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->isMatteBegin(ILjava/util/List;)Z

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    if-eqz v5, :cond_4

    .line 100
    .line 101
    move-object v5, v4

    .line 102
    int-to-float v4, v8

    .line 103
    move-object v3, v5

    .line 104
    int-to-float v5, v9

    .line 105
    const/4 v6, 0x0

    .line 106
    move v15, v2

    .line 107
    const/4 v2, 0x0

    .line 108
    move-object/from16 v17, v3

    .line 109
    .line 110
    const/4 v3, 0x0

    .line 111
    move-object/from16 v12, v17

    .line 112
    .line 113
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;)I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    goto :goto_1

    .line 118
    :cond_4
    move v15, v2

    .line 119
    move-object v12, v4

    .line 120
    :goto_1
    invoke-direct {v0, v12, v1, v7}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawSprite(Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Canvas;I)V

    .line 121
    .line 122
    .line 123
    invoke-direct {v0, v15, v10}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->isMatteEnd(ILjava/util/List;)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_2

    .line 128
    .line 129
    invoke-virtual {v12}, Lcom/tantan/library/svga/utils/DrawerSprite;->getMatteKey()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-interface {v11, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    check-cast v2, Lcom/tantan/library/svga/utils/DrawerSprite;

    .line 138
    .line 139
    if-eqz v2, :cond_2

    .line 140
    .line 141
    iget-object v4, v0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 142
    .line 143
    invoke-virtual {v4, v8, v9}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->shareMatteCanvas(II)Landroid/graphics/Canvas;

    .line 144
    .line 145
    .line 146
    move-result-object v4

    .line 147
    invoke-direct {v0, v2, v4, v7}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawSprite(Lcom/tantan/library/svga/utils/DrawerSprite;Landroid/graphics/Canvas;I)V

    .line 148
    .line 149
    .line 150
    iget-object v2, v0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 151
    .line 152
    invoke-virtual {v2}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatteBitmap()Landroid/graphics/Bitmap;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    iget-object v4, v0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->sharedValues:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;

    .line 157
    .line 158
    invoke-virtual {v4}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->shareMattePaint()Landroid/graphics/Paint;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    const/4 v5, 0x0

    .line 163
    invoke-virtual {v1, v2, v5, v5, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 164
    .line 165
    .line 166
    const/4 v2, -0x1

    .line 167
    if-eq v3, v2, :cond_5

    .line 168
    .line 169
    invoke-virtual {v1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_5
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 174
    .line 175
    .line 176
    :goto_2
    move/from16 v2, v16

    .line 177
    .line 178
    const/4 v12, 0x0

    .line 179
    goto :goto_0

    .line 180
    :cond_6
    invoke-virtual {v0, v10}, Lcom/tantan/library/svga/drawer/SGVADrawer;->releaseFrameSprites$svga_lib_release(Ljava/util/List;)V

    .line 181
    .line 182
    .line 183
    return-void
.end method
