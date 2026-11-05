.class public final Le/e/a/FullscreenViewport208$Band;
.super Landroid/graphics/drawable/Drawable;
.source "FullscreenViewport208.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenViewport208;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Band"
.end annotation


# instance fields
.field private final paint:Landroid/graphics/Paint;

.field private final row:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 4

    .line 88
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 87
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/FullscreenViewport208$Band;->paint:Landroid/graphics/Paint;

    .line 88
    iput-object p1, p0, Le/e/a/FullscreenViewport208$Band;->row:Landroid/view/ViewGroup;

    const/high16 p1, 0x77000000

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 18

    .line 90
    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Le/e/a/FullscreenViewport208$Band;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_9
    iget-object v5, v0, Le/e/a/FullscreenViewport208$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    const/16 v6, 0x8

    if-lt v3, v5, :cond_cc

    .line 91
    iget v3, v1, Landroid/graphics/Rect;->left:I

    iget v5, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v5, v4

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget-object v4, v0, Le/e/a/FullscreenViewport208$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, v0, Le/e/a/FullscreenViewport208$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const-string v7, "commentpostbutton"

    const-string v8, "id"

    invoke-virtual {v4, v7, v8, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 92
    iget-object v4, v0, Le/e/a/FullscreenViewport208$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x40c00000    # 6.0f

    mul-float/2addr v4, v7

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v7

    int-to-float v7, v7

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v7, v8

    invoke-static {v4, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    .line 93
    move v4, v2

    :goto_50
    iget-object v8, v0, Le/e/a/FullscreenViewport208$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v8}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-lt v4, v8, :cond_59

    .line 96
    return-void

    .line 93
    :cond_59
    iget-object v8, v0, Le/e/a/FullscreenViewport208$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v8, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    if-ne v9, v6, :cond_66

    goto :goto_c9

    :cond_66
    iget v9, v1, Landroid/graphics/Rect;->right:I

    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    iget v10, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v2, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    add-int/2addr v10, v3

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 94
    invoke-virtual {v8}, Landroid/view/View;->getId()I

    move-result v8

    if-ne v8, v5, :cond_b6

    new-instance v8, Landroid/graphics/Path;

    invoke-direct {v8}, Landroid/graphics/Path;-><init>()V

    new-instance v10, Landroid/graphics/RectF;

    int-to-float v3, v3

    iget v11, v1, Landroid/graphics/Rect;->top:I

    int-to-float v11, v11

    int-to-float v12, v9

    iget v13, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v13, v13

    invoke-direct {v10, v3, v11, v12, v13}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-array v3, v6, [F

    aput v7, v3, v2

    const/4 v11, 0x1

    aput v7, v3, v11

    const/4 v11, 0x2

    const/4 v12, 0x0

    aput v12, v3, v11

    const/4 v11, 0x3

    aput v12, v3, v11

    const/4 v11, 0x4

    aput v12, v3, v11

    const/4 v11, 0x5

    aput v12, v3, v11

    const/4 v11, 0x6

    aput v12, v3, v11

    const/4 v11, 0x7

    aput v12, v3, v11

    sget-object v11, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v8, v10, v3, v11}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    iget-object v3, v0, Le/e/a/FullscreenViewport208$Band;->paint:Landroid/graphics/Paint;

    move-object/from16 v15, p1

    invoke-virtual {v15, v8, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_c8

    :cond_b6
    move-object/from16 v15, p1

    int-to-float v11, v3

    iget v3, v1, Landroid/graphics/Rect;->top:I

    int-to-float v12, v3

    int-to-float v13, v9

    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v14, v3

    iget-object v3, v0, Le/e/a/FullscreenViewport208$Band;->paint:Landroid/graphics/Paint;

    move-object/from16 v10, p1

    move-object v15, v3

    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :goto_c8
    move v3, v9

    .line 93
    :goto_c9
    add-int/lit8 v4, v4, 0x1

    goto :goto_50

    .line 90
    :cond_cc
    iget-object v5, v0, Le/e/a/FullscreenViewport208$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-eq v7, v6, :cond_e3

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iget v5, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    add-int/2addr v4, v5

    :cond_e3
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_9
.end method

.method public getOpacity()I
    .registers 2

    .line 99
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 97
    iget-object v0, p0, Le/e/a/FullscreenViewport208$Band;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Le/e/a/FullscreenViewport208$Band;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 98
    iget-object v0, p0, Le/e/a/FullscreenViewport208$Band;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/FullscreenViewport208$Band;->invalidateSelf()V

    return-void
.end method
