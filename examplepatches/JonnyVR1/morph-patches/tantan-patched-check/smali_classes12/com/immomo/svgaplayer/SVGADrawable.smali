.class public final Lcom/immomo/svgaplayer/SVGADrawable;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0002\u0010\u0007J\u0012\u0010!\u001a\u00020\"2\u0008\u0010#\u001a\u0004\u0018\u00010$H\u0016J\u0008\u0010%\u001a\u00020\u000fH\u0016J\u0010\u0010&\u001a\u00020\"2\u0006\u0010\'\u001a\u00020\u000fH\u0016J\u0012\u0010(\u001a\u00020\"2\u0008\u0010)\u001a\u0004\u0018\u00010*H\u0016R$\u0010\n\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\t@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000eR$\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0008\u001a\u00020\u000f@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012\"\u0004\u0008\u0013\u0010\u0014R\u000e\u0010\u0015\u001a\u00020\u0016X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018R\u001a\u0010\u0019\u001a\u00020\u001aX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001b\u0010\u001c\"\u0004\u0008\u001d\u0010\u001eR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001f\u0010 \u00a8\u0006+"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/SVGADrawable;",
        "Landroid/graphics/drawable/Drawable;",
        "videoItem",
        "Lcom/immomo/svgaplayer/SVGAVideoEntity;",
        "(Lcom/immomo/svgaplayer/SVGAVideoEntity;)V",
        "dynamicItem",
        "Lcom/immomo/svgaplayer/SVGADynamicEntity;",
        "(Lcom/immomo/svgaplayer/SVGAVideoEntity;Lcom/immomo/svgaplayer/SVGADynamicEntity;)V",
        "value",
        "",
        "cleared",
        "getCleared",
        "()Z",
        "setCleared$svgalibrary_release",
        "(Z)V",
        "",
        "currentFrame",
        "getCurrentFrame",
        "()I",
        "setCurrentFrame$svgalibrary_release",
        "(I)V",
        "drawer",
        "Lcom/immomo/svgaplayer/SVGACanvasDrawer;",
        "getDynamicItem",
        "()Lcom/immomo/svgaplayer/SVGADynamicEntity;",
        "scaleType",
        "Landroid/widget/ImageView$ScaleType;",
        "getScaleType",
        "()Landroid/widget/ImageView$ScaleType;",
        "setScaleType",
        "(Landroid/widget/ImageView$ScaleType;)V",
        "getVideoItem",
        "()Lcom/immomo/svgaplayer/SVGAVideoEntity;",
        "draw",
        "",
        "canvas",
        "Landroid/graphics/Canvas;",
        "getOpacity",
        "setAlpha",
        "alpha",
        "setColorFilter",
        "colorFilter",
        "Landroid/graphics/ColorFilter;",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field private cleared:Z

.field private currentFrame:I

.field private final drawer:Lcom/immomo/svgaplayer/SVGACanvasDrawer;

.field private final dynamicItem:Lcom/immomo/svgaplayer/SVGADynamicEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private scaleType:Landroid/widget/ImageView$ScaleType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/SVGAVideoEntity;)V
    .locals 1
    .param p1    # Lcom/immomo/svgaplayer/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    new-instance v0, Lcom/immomo/svgaplayer/SVGADynamicEntity;

    invoke-direct {v0}, Lcom/immomo/svgaplayer/SVGADynamicEntity;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/immomo/svgaplayer/SVGADrawable;-><init>(Lcom/immomo/svgaplayer/SVGAVideoEntity;Lcom/immomo/svgaplayer/SVGADynamicEntity;)V

    return-void
.end method

.method public constructor <init>(Lcom/immomo/svgaplayer/SVGAVideoEntity;Lcom/immomo/svgaplayer/SVGADynamicEntity;)V
    .locals 1
    .param p1    # Lcom/immomo/svgaplayer/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/svgaplayer/SVGADynamicEntity;
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
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGADrawable;->videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/immomo/svgaplayer/SVGADrawable;->dynamicItem:Lcom/immomo/svgaplayer/SVGADynamicEntity;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->cleared:Z

    .line 16
    .line 17
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->scaleType:Landroid/widget/ImageView$ScaleType;

    .line 20
    .line 21
    new-instance v0, Lcom/immomo/svgaplayer/SVGACanvasDrawer;

    .line 22
    .line 23
    invoke-direct {v0, p1, p2}, Lcom/immomo/svgaplayer/SVGACanvasDrawer;-><init>(Lcom/immomo/svgaplayer/SVGAVideoEntity;Lcom/immomo/svgaplayer/SVGADynamicEntity;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->drawer:Lcom/immomo/svgaplayer/SVGACanvasDrawer;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->cleared:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->drawer:Lcom/immomo/svgaplayer/SVGACanvasDrawer;

    .line 9
    .line 10
    iget v1, p0, Lcom/immomo/svgaplayer/SVGADrawable;->currentFrame:I

    .line 11
    .line 12
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->scaleType:Landroid/widget/ImageView$ScaleType;

    .line 13
    .line 14
    invoke-virtual {v0, p1, v1, p0}, Lcom/immomo/svgaplayer/SVGACanvasDrawer;->drawFrame(Landroid/graphics/Canvas;ILandroid/widget/ImageView$ScaleType;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public final getCleared()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->cleared:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getCurrentFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->currentFrame:I

    .line 2
    .line 3
    return p0
.end method

.method public final getDynamicItem()Lcom/immomo/svgaplayer/SVGADynamicEntity;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->dynamicItem:Lcom/immomo/svgaplayer/SVGADynamicEntity;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpacity()I
    .locals 0

    const/4 p0, -0x2

    return p0
.end method

.method public final getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->scaleType:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getVideoItem()Lcom/immomo/svgaplayer/SVGAVideoEntity;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public final setCleared$svgalibrary_release(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->cleared:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGADrawable;->cleared:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 9
    .line 10
    .line 11
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

.method public final setCurrentFrame$svgalibrary_release(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/immomo/svgaplayer/SVGADrawable;->currentFrame:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/immomo/svgaplayer/SVGADrawable;->currentFrame:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 0
    .param p1    # Landroid/widget/ImageView$ScaleType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGADrawable;->scaleType:Landroid/widget/ImageView$ScaleType;

    .line 5
    .line 6
    return-void
.end method
