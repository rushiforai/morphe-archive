.class public final Ldr8;
.super Lfr8;
.source "SourceFile"


# instance fields
.field public final s:Landroid/graphics/drawable/Drawable;

.field public final t:Landroid/graphics/Rect;

.field public u:Landroid/graphics/PorterDuffColorFilter;

.field public v:Ld03;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltta;Lvr8;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lfr8;-><init>(Landroid/content/Context;Ltta;Lvr8;)V

    const p3, 0x7f0804e1

    invoke-static {p3, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Ldr8;->s:Landroid/graphics/drawable/Drawable;

    new-instance p1, Landroid/graphics/Rect;

    const/4 p3, 0x0

    iget p2, p2, Ltta;->b:I

    invoke-direct {p1, p3, p3, p2, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p1, p0, Ldr8;->t:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lfr8;->l()V

    return-void
.end method


# virtual methods
.method public final b(Lvr8;Z)V
    .registers 3

    invoke-super {p0, p1, p2}, Lfr8;->b(Lvr8;Z)V

    invoke-virtual {p0}, Lfr8;->e()Ld03;

    move-result-object p1

    iput-object p1, p0, Ldr8;->v:Ld03;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final n(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 8

    iget-object v0, p0, Ldr8;->s:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v2, p0, Ldr8;->u:Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget-object v2, p0, Ldr8;->t:Landroid/graphics/Rect;

    invoke-virtual {v2, v1}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    :cond_1a
    iget-object v1, p0, Ldr8;->v:Ld03;

    if-eqz v1, :cond_26

    invoke-virtual {v1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object p0, p0, Ldr8;->v:Ld03;

    invoke-virtual {p0, p1}, Ld03;->draw(Landroid/graphics/Canvas;)V

    :cond_26
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result p0

    iget v1, p2, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-float/2addr v3, v1

    iget v1, p2, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result p2

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    sub-int/2addr p2, v2

    int-to-float p2, p2

    div-float/2addr p2, v4

    add-float/2addr p2, v1

    invoke-virtual {p1, v3, p2}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public final o()V
    .registers 4

    invoke-super {p0}, Lfr8;->o()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f040480

    const v2, 0x7f0600ae

    invoke-static {v1, v0, v2}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v0, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    iput-object v1, p0, Ldr8;->u:Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
