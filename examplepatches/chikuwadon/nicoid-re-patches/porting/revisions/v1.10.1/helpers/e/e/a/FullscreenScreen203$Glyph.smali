.class final Le/e/a/FullscreenScreen203$Glyph;
.super Landroid/graphics/drawable/Drawable;
.source "FullscreenScreen203.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenScreen203;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Glyph"
.end annotation


# instance fields
.field final original:Landroid/graphics/drawable/Drawable;


# direct methods
.method constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 90
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput-object p1, p0, Le/e/a/FullscreenScreen203$Glyph;->original:Landroid/graphics/drawable/Drawable;

    iget-object p1, p0, Le/e/a/FullscreenScreen203$Glyph;->original:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 6

    .line 91
    invoke-virtual {p0}, Le/e/a/FullscreenScreen203$Glyph;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FullscreenScreen203$Glyph;->original:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v0

    const v3, 0x3fac0831    # 1.344f

    invoke-virtual {p1, v3, v3, v2, v0}, Landroid/graphics/Canvas;->scale(FFFF)V

    iget-object v0, p0, Le/e/a/FullscreenScreen203$Glyph;->original:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public getOpacity()I
    .registers 2

    .line 92
    iget-object v0, p0, Le/e/a/FullscreenScreen203$Glyph;->original:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 92
    invoke-virtual {p0}, Le/e/a/FullscreenScreen203$Glyph;->invalidateSelf()V

    return-void
.end method

.method public isStateful()Z
    .registers 2

    .line 92
    iget-object v0, p0, Le/e/a/FullscreenScreen203$Glyph;->original:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    return v0
.end method

.method protected onStateChange([I)Z
    .registers 3

    .line 92
    iget-object v0, p0, Le/e/a/FullscreenScreen203$Glyph;->original:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result p1

    return p1
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 5

    .line 92
    invoke-virtual {p0, p2, p3, p4}, Le/e/a/FullscreenScreen203$Glyph;->scheduleSelf(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public setAlpha(I)V
    .registers 3

    .line 92
    iget-object v0, p0, Le/e/a/FullscreenScreen203$Glyph;->original:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 92
    iget-object v0, p0, Le/e/a/FullscreenScreen203$Glyph;->original:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 3

    .line 92
    invoke-virtual {p0, p2}, Le/e/a/FullscreenScreen203$Glyph;->unscheduleSelf(Ljava/lang/Runnable;)V

    return-void
.end method
