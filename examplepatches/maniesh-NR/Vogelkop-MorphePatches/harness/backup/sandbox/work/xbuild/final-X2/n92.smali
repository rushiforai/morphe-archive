.class public final Ln92;
.super Lm92;
.source "SourceFile"


# instance fields
.field public final f:Lxbf;

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:I

.field public final k:I


# direct methods
.method public constructor <init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V
    .registers 5

    invoke-direct {p0, p4, p2}, Lm92;-><init>(Landroid/graphics/Bitmap;I)V

    new-instance p2, Lxbf;

    const/16 p4, 0xc

    invoke-direct {p2, p4}, Lxbf;-><init>(B)V

    iput-object p2, p0, Ln92;->f:Lxbf;

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p4, 0x7f0600b0

    invoke-virtual {p3, p4}, Landroid/content/Context;->getColor(I)I

    move-result p3

    iput p3, p0, Ln92;->g:I

    const/high16 p3, 0x40000000    # 2.0f

    invoke-static {p3, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p3

    iput p3, p0, Ln92;->h:I

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    const/4 p3, 0x1

    const/high16 p4, 0x3f800000    # 1.0f

    invoke-static {p3, p4, p2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p2

    float-to-int p2, p2

    iput p2, p0, Ln92;->i:I

    iput p1, p0, Ln92;->k:I

    iput p1, p0, Ln92;->j:I

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 15

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget v3, v0, Landroid/graphics/Rect;->left:I

    iget v4, v0, Landroid/graphics/Rect;->top:I

    iget v5, v0, Landroid/graphics/Rect;->right:I

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    iget v11, p0, Ln92;->i:I

    const/4 v12, 0x0

    iget-object v1, p0, Ln92;->f:Lxbf;

    iget v7, p0, Ln92;->g:I

    const/4 v8, 0x0

    iget v9, p0, Lm92;->e:I

    iget v10, p0, Ln92;->h:I

    move-object v2, p1

    invoke-virtual/range {v1 .. v12}, Lxbf;->y(Landroid/graphics/Canvas;IIIIIIIIIZ)V

    invoke-super {p0, v2}, Lm92;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Ln92;->k:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Ln92;->j:I

    return p0
.end method
