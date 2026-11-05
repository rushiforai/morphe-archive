.class final Le/e/a/ListActions$Corner;
.super Landroid/graphics/drawable/Drawable;
.source "ListActions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ListActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Corner"
.end annotation


# instance fields
.field alpha:I

.field final paint:Landroid/graphics/Paint;

.field final path:Landroid/graphics/Path;

.field pressed:Z


# direct methods
.method constructor <init>()V
    .registers 3

    .line 20
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 21
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/ListActions$Corner;->paint:Landroid/graphics/Paint;

    .line 22
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/ListActions$Corner;->path:Landroid/graphics/Path;

    const/16 v0, 0xff

    iput v0, p0, Le/e/a/ListActions$Corner;->alpha:I

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 7

    .line 23
    invoke-virtual {p0}, Le/e/a/ListActions$Corner;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x3f100000    # 0.5625f

    mul-float v1, v1, v2

    iget-object v2, p0, Le/e/a/ListActions$Corner;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    iget-object v2, p0, Le/e/a/ListActions$Corner;->path:Landroid/graphics/Path;

    iget v3, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    sub-float/2addr v3, v1

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object v2, p0, Le/e/a/ListActions$Corner;->path:Landroid/graphics/Path;

    iget v3, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    sub-float/2addr v4, v1

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v1, p0, Le/e/a/ListActions$Corner;->path:Landroid/graphics/Path;

    iget v2, v0, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v0

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Le/e/a/ListActions$Corner;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    iget-object v0, p0, Le/e/a/ListActions$Corner;->paint:Landroid/graphics/Paint;

    sget v1, Le/e/a/DialogColors;->LIST_CORNER:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/ListActions$Corner;->paint:Landroid/graphics/Paint;

    iget-boolean v1, p0, Le/e/a/ListActions$Corner;->pressed:Z

    if-eqz v1, :cond_52

    const/16 v1, 0xcc

    goto :goto_54

    :cond_52
    const/16 v1, 0x99

    :goto_54
    iget v2, p0, Le/e/a/ListActions$Corner;->alpha:I

    mul-int v1, v1, v2

    div-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Le/e/a/ListActions$Corner;->path:Landroid/graphics/Path;

    iget-object v1, p0, Le/e/a/ListActions$Corner;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    const/4 v0, -0x3

    return v0
.end method

.method public isStateful()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method protected onStateChange([I)Z
    .registers 9

    .line 28
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_4
    const/4 v4, 0x1

    if-lt v2, v0, :cond_12

    iget-boolean p1, p0, Le/e/a/ListActions$Corner;->pressed:Z

    if-ne v3, p1, :cond_c

    return v1

    :cond_c
    iput-boolean v3, p0, Le/e/a/ListActions$Corner;->pressed:Z

    invoke-virtual {p0}, Le/e/a/ListActions$Corner;->invalidateSelf()V

    return v4

    :cond_12
    aget v5, p1, v2

    const v6, 0x10100a7

    if-eq v5, v6, :cond_1e

    const v6, 0x101009c

    if-ne v5, v6, :cond_1f

    :cond_1e
    const/4 v3, 0x1

    :cond_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_4
.end method

.method public setAlpha(I)V
    .registers 2

    .line 24
    iput p1, p0, Le/e/a/ListActions$Corner;->alpha:I

    invoke-virtual {p0}, Le/e/a/ListActions$Corner;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 25
    iget-object v0, p0, Le/e/a/ListActions$Corner;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Le/e/a/ListActions$Corner;->invalidateSelf()V

    return-void
.end method
