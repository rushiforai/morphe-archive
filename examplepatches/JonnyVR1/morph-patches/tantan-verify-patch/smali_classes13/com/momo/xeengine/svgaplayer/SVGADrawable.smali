.class public final Lcom/momo/xeengine/svgaplayer/SVGADrawable;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0016J\u0008\u0010\"\u001a\u00020\u000eH\u0016J\u0010\u0010#\u001a\u00020\u001f2\u0006\u0010$\u001a\u00020\u000eH\u0016J\u0012\u0010%\u001a\u00020\u001f2\u0008\u0010&\u001a\u0004\u0018\u00010\'H\u0016R$\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0008@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\rR$\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0007\u001a\u00020\u000e@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0013R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0016\u001a\u00020\u0017X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019\"\u0004\u0008\u001a\u0010\u001bR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001d\u00a8\u0006("
    }
    d2 = {
        "Lcom/momo/xeengine/svgaplayer/SVGADrawable;",
        "Landroid/graphics/drawable/Drawable;",
        "videoItem",
        "Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;",
        "dynamicItem",
        "Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;",
        "(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;)V",
        "value",
        "",
        "cleared",
        "getCleared",
        "()Z",
        "setCleared$gift_player_release",
        "(Z)V",
        "",
        "currentFrame",
        "getCurrentFrame",
        "()I",
        "setCurrentFrame$gift_player_release",
        "(I)V",
        "drawer",
        "Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;",
        "scaleType",
        "Landroid/widget/ImageView$ScaleType;",
        "getScaleType",
        "()Landroid/widget/ImageView$ScaleType;",
        "setScaleType",
        "(Landroid/widget/ImageView$ScaleType;)V",
        "getVideoItem",
        "()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;",
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
.field private cleared:Z

.field private currentFrame:I

.field private final drawer:Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;

.field private scaleType:Landroid/widget/ImageView$ScaleType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final videoItem:Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;)V
    .locals 1
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
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->videoItem:Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->cleared:Z

    .line 14
    .line 15
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->scaleType:Landroid/widget/ImageView$ScaleType;

    .line 18
    .line 19
    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;

    .line 20
    .line 21
    invoke-direct {v0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;-><init>(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->drawer:Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->cleared:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->drawer:Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;

    .line 10
    .line 11
    iget v1, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->currentFrame:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->scaleType:Landroid/widget/ImageView$ScaleType;

    .line 14
    .line 15
    invoke-virtual {v0, p1, v1, p0}, Lcom/momo/xeengine/svgaplayer/SVGACanvasDrawer;->drawFrame(Landroid/graphics/Canvas;ILandroid/widget/ImageView$ScaleType;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final getCleared()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->cleared:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getCurrentFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->currentFrame:I

    .line 2
    .line 3
    return p0
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
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->scaleType:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->videoItem:Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public final setCleared$gift_player_release(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->cleared:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->cleared:Z

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

.method public final setCurrentFrame$gift_player_release(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->currentFrame:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->currentFrame:I

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
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->scaleType:Landroid/widget/ImageView$ScaleType;

    .line 5
    .line 6
    return-void
.end method
