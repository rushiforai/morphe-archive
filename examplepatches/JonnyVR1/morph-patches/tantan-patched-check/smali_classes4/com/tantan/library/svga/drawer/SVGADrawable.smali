.class public final Lcom/tantan/library/svga/drawer/SVGADrawable;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0002\u0010\u0008J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\u0008\u0010\u0018\u001a\u00020\u000cH\u0016J\r\u0010\u0019\u001a\u00020\u0015H\u0000\u00a2\u0006\u0002\u0008\u001aJ\r\u0010\u001b\u001a\u00020\u0015H\u0000\u00a2\u0006\u0002\u0008\u001cJ\u0010\u0010\u001d\u001a\u00020\u00152\u0006\u0010\u001e\u001a\u00020\u000cH\u0016J\u0012\u0010\u001f\u001a\u00020\u00152\u0008\u0010 \u001a\u0004\u0018\u00010!H\u0016R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R$\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\u000c@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\""
    }
    d2 = {
        "Lcom/tantan/library/svga/drawer/SVGADrawable;",
        "Landroid/graphics/drawable/Drawable;",
        "imageView",
        "Landroid/widget/ImageView;",
        "videoItem",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "dynamicItem",
        "Lcom/tantan/library/svga/compose/SVGADynamicEntity;",
        "(Landroid/widget/ImageView;Lcom/tantan/library/svga/compose/SVGAVideoEntity;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V",
        "audioDrawer",
        "Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;",
        "value",
        "",
        "currentFrame",
        "getCurrentFrame",
        "()I",
        "setCurrentFrame$svga_lib_release",
        "(I)V",
        "drawer",
        "Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;",
        "draw",
        "",
        "canvas",
        "Landroid/graphics/Canvas;",
        "getOpacity",
        "pause",
        "pause$svga_lib_release",
        "resume",
        "resume$svga_lib_release",
        "setAlpha",
        "alpha",
        "setColorFilter",
        "colorFilter",
        "Landroid/graphics/ColorFilter;",
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
.field private final audioDrawer:Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private volatile currentFrame:I

.field private final drawer:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final imageView:Landroid/widget/ImageView;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;Lcom/tantan/library/svga/compose/SVGAVideoEntity;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V
    .locals 0
    .param p1    # Landroid/widget/ImageView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/compose/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/tantan/library/svga/compose/SVGADynamicEntity;
        .annotation build Lorg/jetbrains/annotations/Nullable;
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
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->imageView:Landroid/widget/ImageView;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->dynamicItem:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 15
    .line 16
    new-instance p1, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;

    .line 17
    .line 18
    invoke-direct {p1, p2, p3}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;-><init>(Lcom/tantan/library/svga/compose/SVGAVideoEntity;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->drawer:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;

    .line 22
    .line 23
    new-instance p1, Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;

    .line 24
    .line 25
    invoke-direct {p1, p2}, Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;-><init>(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->audioDrawer:Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->imageView:Landroid/widget/ImageView;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->imageView:Landroid/widget/ImageView;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    sub-int/2addr v0, v1

    .line 23
    iget-object v1, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->imageView:Landroid/widget/ImageView;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    sub-int/2addr v0, v1

    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-static {v0, v1}, Lkotlin/ranges/a;->b(II)I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->imageView:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v2, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->imageView:Landroid/widget/ImageView;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    sub-int/2addr v0, v2

    .line 48
    iget-object v2, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->imageView:Landroid/widget/ImageView;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    sub-int/2addr v0, v2

    .line 55
    invoke-static {v0, v1}, Lkotlin/ranges/a;->b(II)I

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    if-lez v6, :cond_1

    .line 60
    .line 61
    if-gtz v7, :cond_0

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object v2, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->drawer:Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;

    .line 65
    .line 66
    iget v4, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->currentFrame:I

    .line 67
    .line 68
    iget-object v0, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->imageView:Landroid/widget/ImageView;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    move-object v3, p1

    .line 78
    invoke-virtual/range {v2 .. v7}, Lcom/tantan/library/svga/drawer/SVGACanvasDrawer;->drawFrame(Landroid/graphics/Canvas;ILandroid/widget/ImageView$ScaleType;II)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    :goto_0
    return-void

    .line 83
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->audioDrawer:Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iget p0, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->currentFrame:I

    .line 90
    .line 91
    invoke-virtual {p1, v0, p0}, Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;->playAudio$svga_lib_release(ZI)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final getCurrentFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->currentFrame:I

    .line 2
    .line 3
    return p0
.end method

.method public getOpacity()I
    .locals 0

    const/4 p0, -0x2

    return p0
.end method

.method public final pause$svga_lib_release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->audioDrawer:Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;->pause$svga_lib_release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final resume$svga_lib_release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->audioDrawer:Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;->resume$svga_lib_release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public final setCurrentFrame$svga_lib_release(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->currentFrame:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;->currentFrame:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
