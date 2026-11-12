.class public final Lg1d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Rect;

.field public final b:Lng3;

.field public c:B

.field public d:Landroid/graphics/Bitmap;

.field public e:Luf;


# direct methods
.method public constructor <init>(Lng3;Landroid/graphics/Rect;Lfb;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lg1d;->a:Landroid/graphics/Rect;

    iput-object p1, p0, Lg1d;->b:Lng3;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 13

    iget-object v0, p0, Lg1d;->b:Lng3;

    if-nez v0, :cond_9

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lg1d;->b(I)V

    return-void

    :cond_9
    const/4 v1, 0x6

    invoke-virtual {p0, v1}, Lg1d;->b(I)V

    new-instance v6, Ldnb;

    const/16 v1, 0xf

    invoke-direct {v6, p0, v1}, Ldnb;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lwa;

    const/16 v1, 0x12

    invoke-direct {v5, p0, v1}, Lwa;-><init>(Ljava/lang/Object;B)V

    iget v1, v0, Lng3;->e:F

    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-nez v2, :cond_59

    iget-object v1, v0, Lng3;->d:Lzg;

    iget-object v2, v1, Lzg;->b:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {v2}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_55

    iget-object v3, v1, Lzg;->d:Ljava/lang/Object;

    check-cast v3, Landroid/util/Size;

    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v3

    if-eqz v3, :cond_55

    check-cast v2, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object v2, v2, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    iget v3, v2, Lhuh;->e:F

    invoke-virtual {v2, v3}, Lhuh;->a(F)F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    int-to-float v2, v2

    iget-object v1, v1, Lzg;->d:Ljava/lang/Object;

    check-cast v1, Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v2, v1

    move v1, v2

    goto :goto_57

    :cond_55
    const/high16 v1, 0x3f800000    # 1.0f

    :goto_57
    iput v1, v0, Lng3;->e:F

    :cond_59
    move v7, v1

    iget-object v0, v0, Lng3;->a:Lvzk;

    iget-object v0, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/components/paintpreview/player/PlayerCompositorDelegateImpl;

    iget-wide v2, v0, Lorg/chromium/components/paintpreview/player/PlayerCompositorDelegateImpl;->b:J

    const-wide/16 v0, 0x0

    cmp-long v0, v2, v0

    if-nez v0, :cond_69

    return-void

    :cond_69
    iget-object p0, p0, Lg1d;->a:Landroid/graphics/Rect;

    iget v8, p0, Landroid/graphics/Rect;->left:I

    iget v9, p0, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v10

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v11

    const/4 v4, 0x0

    invoke-static/range {v2 .. v11}, LJ/N;->MiIDqW7F(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;FIIII)I

    return-void
.end method

.method public final b(I)V
    .registers 9

    iput-byte p1, p0, Lg1d;->c:B

    iget-object p0, p0, Lg1d;->e:Luf;

    if-eqz p0, :cond_56

    iget-object v0, p0, Luf;->b:Ljava/lang/Object;

    check-cast v0, Lhoi;

    iget-object v1, p0, Luf;->c:Ljava/lang/Object;

    check-cast v1, Lg1d;

    iget-object v2, p0, Luf;->d:Ljava/lang/Object;

    check-cast v2, Lwa;

    iget-object v3, p0, Luf;->e:Ljava/lang/Object;

    check-cast v3, Landroid/graphics/Rect;

    iget-object p0, p0, Luf;->f:Ljava/lang/Object;

    check-cast p0, Landroid/view/Surface;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x6

    if-eq p1, v4, :cond_56

    iget-object v1, v1, Lg1d;->d:Landroid/graphics/Bitmap;

    const/4 v4, 0x3

    if-ne p1, v4, :cond_4e

    if-eqz v1, :cond_4e

    new-instance p1, Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v4

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v5

    const/4 v6, 0x0

    invoke-direct {p1, v6, v6, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0, p1}, Landroid/view/Surface;->lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;

    move-result-object v4

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/graphics/Canvas;->drawColor(I)V

    const/4 v5, 0x0

    invoke-virtual {v4, v1, v5, p1, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    invoke-virtual {p0, v4}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    iget p0, v0, Lhoi;->e:I

    neg-int p0, p0

    invoke-virtual {v3, v6, p0}, Landroid/graphics/Rect;->offset(II)V

    invoke-virtual {v2, v3}, Lwa;->onResult(Ljava/lang/Object;)V

    return-void

    :cond_4e
    new-instance p0, Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v2, p0}, Lwa;->onResult(Ljava/lang/Object;)V

    :cond_56
    return-void
.end method
