.class public final Luq8;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:Ljl6;

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lgjf;ILandroid/graphics/Bitmap;)V
    .registers 8

    new-instance v0, Ljl6;

    const v1, 0x7f04047f

    const v2, 0x7f06063b

    invoke-static {v1, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-direct {v0, p4, p2, p3, p1}, Ljl6;-><init>(Landroid/graphics/Bitmap;Lgjf;II)V

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput-object v0, p0, Luq8;->a:Ljl6;

    invoke-virtual {p4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    iput p1, p0, Luq8;->b:I

    invoke-virtual {p4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    iput p1, p0, Luq8;->c:I

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 9

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget v3, v0, Landroid/graphics/Rect;->left:I

    iget v4, v0, Landroid/graphics/Rect;->top:I

    iget v5, v0, Landroid/graphics/Rect;->right:I

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v1, p0, Luq8;->a:Ljl6;

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Ljl6;->g(Landroid/graphics/Canvas;IIII)V

    return-void
.end method

.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Luq8;->c:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Luq8;->b:I

    return p0
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final setAlpha(I)V
    .registers 2

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method
