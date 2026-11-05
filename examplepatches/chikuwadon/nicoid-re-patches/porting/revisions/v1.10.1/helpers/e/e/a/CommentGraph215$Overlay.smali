.class final Le/e/a/CommentGraph215$Overlay;
.super Landroid/graphics/drawable/Drawable;
.source "CommentGraph215.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentGraph215;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Overlay"
.end annotation


# instance fields
.field final b:Le/e/a/CommentGraph215$Binding;

.field final bar:[I

.field drawn:Le/e/a/CommentGraph215$Snapshot;

.field oldBase:F

.field oldDensity:F

.field oldLeft:F

.field oldRight:F

.field oldRtl:Z

.field final p:Landroid/graphics/Paint;

.field final path:Landroid/graphics/Path;

.field final root:[I


# direct methods
.method constructor <init>(Le/e/a/CommentGraph215$Binding;)V
    .registers 4

    .line 66
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/CommentGraph215$Overlay;->p:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/CommentGraph215$Overlay;->path:Landroid/graphics/Path;

    const/4 v0, 0x2

    new-array v1, v0, [I

    iput-object v1, p0, Le/e/a/CommentGraph215$Overlay;->root:[I

    new-array v0, v0, [I

    iput-object v0, p0, Le/e/a/CommentGraph215$Overlay;->bar:[I

    iput-object p1, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 15

    .line 67
    iget-object v0, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-object v0, v0, Le/e/a/CommentGraph215$Binding;->snapshot:Le/e/a/CommentGraph215$Snapshot;

    iget-object v1, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-object v1, v1, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CommentGraph215;->enabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_138

    if-eqz v0, :cond_138

    iget v1, v0, Le/e/a/CommentGraph215$Snapshot;->count:I

    if-eqz v1, :cond_138

    iget-object v1, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    invoke-virtual {v1}, Le/e/a/CommentGraph215$Binding;->controlsAlpha()F

    move-result v1

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_25

    goto/16 :goto_138

    :cond_25
    iget-object v1, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-object v1, v1, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    iget-object v2, p0, Le/e/a/CommentGraph215$Overlay;->root:[I

    invoke-virtual {v1, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    iget-object v1, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-object v1, v1, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    iget-object v2, p0, Le/e/a/CommentGraph215$Overlay;->bar:[I

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->getLocationOnScreen([I)V

    iget-object v1, p0, Le/e/a/CommentGraph215$Overlay;->bar:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    iget-object v3, p0, Le/e/a/CommentGraph215$Overlay;->root:[I

    aget v3, v3, v2

    sub-int/2addr v1, v3

    iget-object v3, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-object v3, v3, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getPaddingLeft()I

    move-result v3

    add-int/2addr v1, v3

    int-to-float v1, v1

    iget-object v3, p0, Le/e/a/CommentGraph215$Overlay;->bar:[I

    aget v3, v3, v2

    iget-object v4, p0, Le/e/a/CommentGraph215$Overlay;->root:[I

    aget v4, v4, v2

    sub-int/2addr v3, v4

    iget-object v4, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-object v4, v4, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v4}, Landroid/widget/SeekBar;->getWidth()I

    move-result v4

    add-int/2addr v3, v4

    iget-object v4, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-object v4, v4, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v4}, Landroid/widget/SeekBar;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    iget-object v4, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-object v4, v4, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    iget-object v5, p0, Le/e/a/CommentGraph215$Overlay;->bar:[I

    const/4 v6, 0x1

    aget v5, v5, v6

    iget-object v7, p0, Le/e/a/CommentGraph215$Overlay;->root:[I

    aget v7, v7, v6

    sub-int/2addr v5, v7

    int-to-float v5, v5

    iget-object v7, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-object v7, v7, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v7}, Landroid/widget/SeekBar;->getHeight()I

    move-result v7

    int-to-float v7, v7

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v7, v8

    add-float/2addr v5, v7

    const/high16 v7, 0x40a00000    # 5.0f

    mul-float/2addr v7, v4

    sub-float/2addr v5, v7

    iget v7, v0, Le/e/a/CommentGraph215$Snapshot;->max:I

    if-nez v7, :cond_96

    return-void

    :cond_96
    iget-object v8, p0, Le/e/a/CommentGraph215$Overlay;->p:Landroid/graphics/Paint;

    const v9, -0x66864249

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v8, p0, Le/e/a/CommentGraph215$Overlay;->p:Landroid/graphics/Paint;

    iget-object v9, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    invoke-virtual {v9}, Le/e/a/CommentGraph215$Binding;->controlsAlpha()F

    move-result v9

    const/high16 v10, 0x43190000    # 153.0f

    mul-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v8, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-object v8, v8, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v8}, Landroid/widget/SeekBar;->getLayoutDirection()I

    move-result v8

    if-ne v8, v6, :cond_bb

    goto :goto_bc

    :cond_bb
    move v6, v2

    :goto_bc
    iget-object v8, p0, Le/e/a/CommentGraph215$Overlay;->drawn:Le/e/a/CommentGraph215$Snapshot;

    if-ne v8, v0, :cond_dc

    iget v8, p0, Le/e/a/CommentGraph215$Overlay;->oldLeft:F

    cmpl-float v8, v1, v8

    if-nez v8, :cond_dc

    iget v8, p0, Le/e/a/CommentGraph215$Overlay;->oldRight:F

    cmpl-float v8, v3, v8

    if-nez v8, :cond_dc

    iget v8, p0, Le/e/a/CommentGraph215$Overlay;->oldBase:F

    cmpl-float v8, v5, v8

    if-nez v8, :cond_dc

    iget v8, p0, Le/e/a/CommentGraph215$Overlay;->oldDensity:F

    cmpl-float v8, v4, v8

    if-nez v8, :cond_dc

    iget-boolean v8, p0, Le/e/a/CommentGraph215$Overlay;->oldRtl:Z

    if-eq v6, v8, :cond_100

    :cond_dc
    iput-object v0, p0, Le/e/a/CommentGraph215$Overlay;->drawn:Le/e/a/CommentGraph215$Snapshot;

    iput v1, p0, Le/e/a/CommentGraph215$Overlay;->oldLeft:F

    iput v3, p0, Le/e/a/CommentGraph215$Overlay;->oldRight:F

    iput v5, p0, Le/e/a/CommentGraph215$Overlay;->oldBase:F

    iput v4, p0, Le/e/a/CommentGraph215$Overlay;->oldDensity:F

    iput-boolean v6, p0, Le/e/a/CommentGraph215$Overlay;->oldRtl:Z

    iget-object v8, p0, Le/e/a/CommentGraph215$Overlay;->path:Landroid/graphics/Path;

    invoke-virtual {v8}, Landroid/graphics/Path;->rewind()V

    iget-object v8, p0, Le/e/a/CommentGraph215$Overlay;->path:Landroid/graphics/Path;

    invoke-virtual {v8, v1, v5}, Landroid/graphics/Path;->moveTo(FF)V

    :goto_f2
    const/16 v8, 0xb4

    if-lt v2, v8, :cond_108

    iget-object v0, p0, Le/e/a/CommentGraph215$Overlay;->path:Landroid/graphics/Path;

    invoke-virtual {v0, v3, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Overlay;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    :cond_100
    iget-object v0, p0, Le/e/a/CommentGraph215$Overlay;->path:Landroid/graphics/Path;

    iget-object v1, p0, Le/e/a/CommentGraph215$Overlay;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    :cond_108
    if-eqz v6, :cond_10d

    rsub-int v8, v2, 0xb3

    goto :goto_10e

    :cond_10d
    move v8, v2

    :goto_10e
    iget-object v9, p0, Le/e/a/CommentGraph215$Overlay;->path:Landroid/graphics/Path;

    sub-float v10, v3, v1

    int-to-float v11, v2

    const/high16 v12, 0x3f000000    # 0.5f

    add-float/2addr v11, v12

    mul-float/2addr v10, v11

    const/high16 v11, 0x43340000    # 180.0f

    div-float/2addr v10, v11

    add-float/2addr v10, v1

    iget-object v11, p0, Le/e/a/CommentGraph215$Overlay;->b:Le/e/a/CommentGraph215$Binding;

    iget-boolean v11, v11, Le/e/a/CommentGraph215$Binding;->popup:Z

    if-eqz v11, :cond_124

    const/16 v11, 0xc

    goto :goto_126

    :cond_124
    const/16 v11, 0x14

    :goto_126
    int-to-float v11, v11

    mul-float/2addr v11, v4

    iget-object v12, v0, Le/e/a/CommentGraph215$Snapshot;->bins:[I

    aget v8, v12, v8

    int-to-float v8, v8

    mul-float/2addr v11, v8

    int-to-float v8, v7

    div-float/2addr v11, v8

    sub-float v8, v5, v11

    invoke-virtual {v9, v10, v8}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_f2

    :cond_138
    :goto_138
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 68
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 2

    .line 68
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    .line 68
    return-void
.end method
