.class public final Lcom/opera/android/browser/selection_zoom/SelectionZoomController$BitmapCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lzzi;


# direct methods
.method public constructor <init>(Lzzi;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/selection_zoom/SelectionZoomController$BitmapCallback;->a:Lzzi;

    return-void
.end method


# virtual methods
.method public final run(Landroid/graphics/Bitmap;II)V
    .registers 9
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/browser/selection_zoom/SelectionZoomController$BitmapCallback;->a:Lzzi;

    iget-object v0, p0, Lzzi;->b:La0j;

    iget-boolean v1, p0, Lzzi;->e:Z

    if-eqz v1, :cond_55

    iput-object p1, v0, La0j;->b:Ljava/lang/Object;

    new-instance p1, Landroid/graphics/RectF;

    iget-object v1, v0, La0j;->b:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    if-nez v1, :cond_15

    move v1, v2

    goto :goto_19

    :cond_15
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    :goto_19
    int-to-float v1, v1

    iget-object v3, v0, La0j;->b:Ljava/lang/Object;

    check-cast v3, Landroid/graphics/Bitmap;

    if-nez v3, :cond_22

    move v3, v2

    goto :goto_26

    :cond_22
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    :goto_26
    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-direct {p1, v4, v4, v1, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p1, v0, La0j;->h:Ljava/lang/Object;

    iget-object p1, v0, La0j;->f:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p0, p0, Lzzi;->c:Lhuh;

    iget p1, p0, Lhuh;->j:F

    int-to-float p2, p2

    mul-float/2addr p2, p1

    float-to-int p2, p2

    int-to-float p3, p3

    mul-float/2addr p1, p3

    float-to-int p1, p1

    iget p0, p0, Lhuh;->k:F

    float-to-int p0, p0

    add-int/2addr p1, p0

    iget-object p0, v0, La0j;->e:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Point;

    iput p2, p0, Landroid/graphics/Point;->x:I

    iput p1, p0, Landroid/graphics/Point;->y:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_55
    return-void
.end method
