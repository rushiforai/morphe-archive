.class public Lw3a;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# instance fields
.field public a:Lv3a;

.field public b:Z

.field public final c:Z


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;IZ)V
    .registers 5

    .line 24
    new-instance v0, Lv3a;

    invoke-direct {v0, p1, p2, p3}, Lv3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    const/4 p2, 0x0

    .line 25
    invoke-direct {p0, v0, p2}, Lw3a;-><init>(Lv3a;I)V

    .line 26
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 27
    iput-boolean p3, p0, Lw3a;->c:Z

    return-void
.end method

.method public constructor <init>(Lv3a;)V
    .registers 3

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, v0}, Lw3a;-><init>(Lv3a;I)V

    .line 29
    iget-boolean p1, p1, Lv3a;->d:Z

    iput-boolean p1, p0, Lw3a;->c:Z

    return-void
.end method

.method public constructor <init>(Lv3a;I)V
    .registers 4

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput-object p1, p0, Lw3a;->a:Lv3a;

    iget-object p1, p1, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    iget-object p2, p0, Lw3a;->a:Lv3a;

    iget-object p2, p2, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final b()I
    .registers 1

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p0

    return p0
.end method

.method public final c()I
    .registers 1

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p0

    return p0
.end method

.method public final clearColorFilter()V
    .registers 1

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    return-void
.end method

.method public final d(I)Z
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    move-result p0

    return p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 2

    invoke-virtual {p0}, Lw3a;->e()V

    invoke-virtual {p0, p1}, Lw3a;->a(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final e()V
    .registers 9

    iget-object v0, p0, Lw3a;->a:Lv3a;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_a

    const/4 v2, 0x0

    :cond_a
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    iget-object v1, v0, Lv3a;->e:Landroid/graphics/Rect;

    iget-object v3, v0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    iget v0, v0, Lv3a;->c:I

    const/high16 v4, 0x800000

    and-int/2addr v4, v0

    if-eqz v4, :cond_3c

    const v4, 0x800003

    and-int v5, v0, v4

    const/4 v6, 0x3

    const/4 v7, 0x5

    if-ne v5, v4, :cond_29

    const v4, -0x800004

    and-int/2addr v0, v4

    if-eqz v2, :cond_37

    goto :goto_36

    :cond_29
    const v4, 0x800005

    and-int v5, v0, v4

    if-ne v5, v4, :cond_38

    const v4, -0x800006

    and-int/2addr v0, v4

    if-nez v2, :cond_37

    :goto_36
    move v6, v7

    :cond_37
    or-int/2addr v0, v6

    :cond_38
    const v2, -0x800001

    and-int/2addr v0, v2

    :cond_3c
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    invoke-static {v0, v2, v4, p0, v1}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public final getAlpha()I
    .registers 1

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result p0

    return p0
.end method

.method public final getColorFilter()Landroid/graphics/ColorFilter;
    .registers 1

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->b:Landroid/graphics/ColorFilter;

    return-object p0
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .registers 1

    iget-object p0, p0, Lw3a;->a:Lv3a;

    return-object p0
.end method

.method public final getHotspotBounds(Landroid/graphics/Rect;)V
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->getHotspotBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    iget-boolean v0, p0, Lw3a;->c:Z

    if-eqz v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    invoke-virtual {p0}, Lw3a;->b()I

    move-result p0

    return p0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    iget-boolean v0, p0, Lw3a;->c:Z

    if-eqz v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    invoke-virtual {p0}, Lw3a;->c()I

    move-result p0

    return p0
.end method

.method public final getOpacity()I
    .registers 1

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result p0

    return p0
.end method

.method public final getOutline(Landroid/graphics/Outline;)V
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->getOutline(Landroid/graphics/Outline;)V

    return-void
.end method

.method public final invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final isAutoMirrored()Z
    .registers 1

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isAutoMirrored()Z

    move-result p0

    return p0
.end method

.method public final isStateful()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final mutate()Landroid/graphics/drawable/Drawable;
    .registers 3

    iget-boolean v0, p0, Lw3a;->b:Z

    if-nez v0, :cond_16

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne v0, p0, :cond_16

    iget-object v0, p0, Lw3a;->a:Lv3a;

    new-instance v1, Lv3a;

    invoke-direct {v1, v0}, Lv3a;-><init>(Lv3a;)V

    iput-object v1, p0, Lw3a;->a:Lv3a;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lw3a;->b:Z

    :cond_16
    return-object p0
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    invoke-virtual {p0}, Lw3a;->e()V

    return-void
.end method

.method public final onLayoutDirectionChanged(I)Z
    .registers 2

    invoke-virtual {p0, p1}, Lw3a;->d(I)Z

    move-result p1

    if-nez p1, :cond_11

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget p0, p0, Lv3a;->c:I

    const/high16 p1, 0x800000

    and-int/2addr p0, p1

    if-nez p0, :cond_11

    const/4 p0, 0x0

    return p0

    :cond_11
    const/4 p0, 0x1

    return p0
.end method

.method public final onLevelChange(I)Z
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result p0

    return p0
.end method

.method public final scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 5

    invoke-virtual {p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public final setAlpha(I)V
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    return-void
.end method

.method public final setAutoMirrored(Z)V
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iput-object p1, p0, Lv3a;->b:Landroid/graphics/ColorFilter;

    return-void
.end method

.method public final setHotspot(FF)V
    .registers 3

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    return-void
.end method

.method public final setHotspotBounds(IIII)V
    .registers 5

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setHotspotBounds(IIII)V

    return-void
.end method

.method public final setState([I)Z
    .registers 3

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result p0

    or-int/2addr v0, p0

    return v0
.end method

.method public final setTint(I)V
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    return-void
.end method

.method public final setTintList(Landroid/content/res/ColorStateList;)V
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 2

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public final setVisible(ZZ)Z
    .registers 4

    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v0

    iget-object p0, p0, Lw3a;->a:Lv3a;

    iget-object p0, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p0

    or-int/2addr v0, p0

    return v0
.end method

.method public final unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 3

    invoke-virtual {p0, p2}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    return-void
.end method
