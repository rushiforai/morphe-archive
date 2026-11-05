.class public final Le/e/a/FullscreenViewport206$Band;
.super Landroid/graphics/drawable/Drawable;
.source "FullscreenViewport206.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenViewport206;
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
    .registers 3

    .line 78
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 77
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenViewport206$Band;->paint:Landroid/graphics/Paint;

    .line 78
    iput-object p1, p0, Le/e/a/FullscreenViewport206$Band;->row:Landroid/view/ViewGroup;

    const/high16 p1, 0x77000000

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 10

    .line 79
    invoke-virtual {p0}, Le/e/a/FullscreenViewport206$Band;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_7
    iget-object v4, p0, Le/e/a/FullscreenViewport206$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-lt v2, v4, :cond_29

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->right:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v3, v1

    iget v1, v0, Landroid/graphics/Rect;->top:I

    int-to-float v4, v1

    iget v1, v0, Landroid/graphics/Rect;->right:I

    int-to-float v5, v1

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v0

    iget-object v7, p0, Le/e/a/FullscreenViewport206$Band;->paint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void

    :cond_29
    iget-object v4, p0, Le/e/a/FullscreenViewport206$Band;->row:Landroid/view/ViewGroup;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    const/16 v6, 0x8

    if-eq v5, v6, :cond_42

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int/2addr v3, v4

    :cond_42
    add-int/lit8 v2, v2, 0x1

    goto :goto_7
.end method

.method public getOpacity()I
    .registers 2

    .line 82
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 80
    iget-object v0, p0, Le/e/a/FullscreenViewport206$Band;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Le/e/a/FullscreenViewport206$Band;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 81
    iget-object v0, p0, Le/e/a/FullscreenViewport206$Band;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/FullscreenViewport206$Band;->invalidateSelf()V

    return-void
.end method
