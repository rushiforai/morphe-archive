.class public final Le/e/a/FullscreenViewport209$Band;
.super Landroid/graphics/drawable/Drawable;
.source "FullscreenViewport209.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenViewport209;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Band"
.end annotation


# instance fields
.field private final area:Landroid/graphics/RectF;

.field private final corners:[F

.field private final paint:Landroid/graphics/Paint;

.field private final path:Landroid/graphics/Path;

.field private final post:I

.field private final row:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 6

    .line 104
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 102
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/FullscreenViewport209$Band;->paint:Landroid/graphics/Paint;

    .line 103
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Le/e/a/FullscreenViewport209$Band;->path:Landroid/graphics/Path;

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Le/e/a/FullscreenViewport209$Band;->area:Landroid/graphics/RectF;

    const/16 v1, 0x8

    new-array v1, v1, [F

    iput-object v1, p0, Le/e/a/FullscreenViewport209$Band;->corners:[F

    .line 104
    iput-object p1, p0, Le/e/a/FullscreenViewport209$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const-string v2, "commentpostbutton"

    const-string v3, "id"

    invoke-virtual {v1, v2, v3, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Le/e/a/FullscreenViewport209$Band;->post:I

    const/high16 p1, 0x77000000

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 16

    .line 106
    invoke-virtual {p0}, Le/e/a/FullscreenViewport209$Band;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_7
    iget-object v4, p0, Le/e/a/FullscreenViewport209$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    const/16 v5, 0x8

    if-lt v2, v4, :cond_a2

    .line 107
    iget v2, v0, Landroid/graphics/Rect;->left:I

    iget v4, v0, Landroid/graphics/Rect;->right:I

    sub-int/2addr v4, v3

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 108
    iget-object v3, p0, Le/e/a/FullscreenViewport209$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x40c00000    # 6.0f

    mul-float v3, v3, v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v4, v6

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    const/4 v3, 0x0

    .line 109
    :goto_37
    iget-object v6, p0, Le/e/a/FullscreenViewport209$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-lt v3, v6, :cond_40

    return-void

    :cond_40
    iget-object v6, p0, Le/e/a/FullscreenViewport209$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-ne v7, v5, :cond_4d

    goto :goto_9f

    :cond_4d
    iget v7, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    iget v8, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v1, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    add-int/2addr v8, v2

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 110
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v6

    iget v8, p0, Le/e/a/FullscreenViewport209$Band;->post:I

    if-ne v6, v8, :cond_90

    iget-object v6, p0, Le/e/a/FullscreenViewport209$Band;->path:Landroid/graphics/Path;

    invoke-virtual {v6}, Landroid/graphics/Path;->rewind()V

    iget-object v6, p0, Le/e/a/FullscreenViewport209$Band;->area:Landroid/graphics/RectF;

    int-to-float v2, v2

    iget v8, v0, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    int-to-float v9, v7

    iget v10, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v10, v10

    invoke-virtual {v6, v2, v8, v9, v10}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v2, p0, Le/e/a/FullscreenViewport209$Band;->corners:[F

    const/4 v6, 0x1

    aput v4, v2, v6

    aput v4, v2, v1

    iget-object v6, p0, Le/e/a/FullscreenViewport209$Band;->path:Landroid/graphics/Path;

    iget-object v8, p0, Le/e/a/FullscreenViewport209$Band;->area:Landroid/graphics/RectF;

    sget-object v9, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v6, v8, v2, v9}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    iget-object v2, p0, Le/e/a/FullscreenViewport209$Band;->path:Landroid/graphics/Path;

    iget-object v6, p0, Le/e/a/FullscreenViewport209$Band;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_9e

    :cond_90
    int-to-float v9, v2

    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v10, v2

    int-to-float v11, v7

    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v12, v2

    iget-object v13, p0, Le/e/a/FullscreenViewport209$Band;->paint:Landroid/graphics/Paint;

    move-object v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :goto_9e
    move v2, v7

    :goto_9f
    add-int/lit8 v3, v3, 0x1

    goto :goto_37

    .line 106
    :cond_a2
    iget-object v4, p0, Le/e/a/FullscreenViewport209$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-eq v6, v5, :cond_b9

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int/2addr v3, v4

    :cond_b9
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_7
.end method

.method public getOpacity()I
    .registers 2

    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 113
    iget-object v0, p0, Le/e/a/FullscreenViewport209$Band;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Le/e/a/FullscreenViewport209$Band;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 114
    iget-object v0, p0, Le/e/a/FullscreenViewport209$Band;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/FullscreenViewport209$Band;->invalidateSelf()V

    return-void
.end method
