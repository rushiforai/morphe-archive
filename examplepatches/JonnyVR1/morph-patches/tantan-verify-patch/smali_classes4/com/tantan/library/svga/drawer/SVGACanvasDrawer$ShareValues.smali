.class public final Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ShareValues"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0011J\u0006\u0010\u0005\u001a\u00020\u0006J\u0006\u0010\u0007\u001a\u00020\u0008J\u0006\u0010\t\u001a\u00020\u0013J\u0006\u0010\n\u001a\u00020\u000bJ\u0006\u0010\u000c\u001a\u00020\u0006J\u0006\u0010\r\u001a\u00020\u000eJ\u0006\u0010\u000f\u001a\u00020\u000eR\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;",
        "",
        "()V",
        "shareMatteCanvas",
        "Landroid/graphics/Canvas;",
        "shareMattePaint",
        "Landroid/graphics/Paint;",
        "sharedMatrix",
        "Lcom/tantan/library/svga/utils/FMatrix;",
        "sharedMatrix2",
        "sharedMatteBitmap",
        "Landroid/graphics/Bitmap;",
        "sharedPaint",
        "sharedPath",
        "Landroid/graphics/Path;",
        "sharedPath2",
        "width",
        "",
        "height",
        "Landroid/graphics/Matrix;",
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


# instance fields
.field private shareMatteCanvas:Landroid/graphics/Canvas;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final shareMattePaint:Landroid/graphics/Paint;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final sharedMatrix:Lcom/tantan/library/svga/utils/FMatrix;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final sharedMatrix2:Lcom/tantan/library/svga/utils/FMatrix;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private sharedMatteBitmap:Landroid/graphics/Bitmap;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final sharedPaint:Landroid/graphics/Paint;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final sharedPath:Landroid/graphics/Path;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final sharedPath2:Landroid/graphics/Path;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPaint:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath:Landroid/graphics/Path;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Path;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath2:Landroid/graphics/Path;

    .line 24
    .line 25
    new-instance v0, Lcom/tantan/library/svga/utils/FMatrix;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/tantan/library/svga/utils/FMatrix;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatrix:Lcom/tantan/library/svga/utils/FMatrix;

    .line 31
    .line 32
    new-instance v0, Lcom/tantan/library/svga/utils/FMatrix;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/tantan/library/svga/utils/FMatrix;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatrix2:Lcom/tantan/library/svga/utils/FMatrix;

    .line 38
    .line 39
    new-instance v0, Landroid/graphics/Paint;

    .line 40
    .line 41
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->shareMattePaint:Landroid/graphics/Paint;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public final shareMatteCanvas(II)Landroid/graphics/Canvas;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->shareMatteCanvas:Landroid/graphics/Canvas;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 6
    .line 7
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatteBitmap:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    :cond_0
    new-instance p1, Landroid/graphics/Canvas;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatteBitmap:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-direct {p1, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 21
    .line 22
    .line 23
    return-object p1
.end method

.method public final shareMattePaint()Landroid/graphics/Paint;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->shareMattePaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    .line 4
    .line 5
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    .line 6
    .line 7
    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->shareMattePaint:Landroid/graphics/Paint;

    .line 14
    .line 15
    return-object p0
.end method

.method public final sharedMatrix()Lcom/tantan/library/svga/utils/FMatrix;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatrix:Lcom/tantan/library/svga/utils/FMatrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatrix:Lcom/tantan/library/svga/utils/FMatrix;

    .line 7
    .line 8
    return-object p0
.end method

.method public final sharedMatrix2()Landroid/graphics/Matrix;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatrix2:Lcom/tantan/library/svga/utils/FMatrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatrix2:Lcom/tantan/library/svga/utils/FMatrix;

    .line 7
    .line 8
    return-object p0
.end method

.method public final sharedMatteBitmap()Landroid/graphics/Bitmap;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedMatteBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final sharedPaint()Landroid/graphics/Paint;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPaint:Landroid/graphics/Paint;

    .line 7
    .line 8
    return-object p0
.end method

.method public final sharedPath()Landroid/graphics/Path;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath:Landroid/graphics/Path;

    .line 7
    .line 8
    return-object p0
.end method

.method public final sharedPath2()Landroid/graphics/Path;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath2:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer$ShareValues;->sharedPath2:Landroid/graphics/Path;

    .line 7
    .line 8
    return-object p0
.end method
