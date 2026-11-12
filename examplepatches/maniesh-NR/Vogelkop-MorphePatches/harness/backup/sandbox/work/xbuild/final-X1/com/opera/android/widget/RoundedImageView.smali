.class public Lcom/opera/android/widget/RoundedImageView;
.super Lcom/opera/android/custom_views/StylingImageView;
.source "SourceFile"


# static fields
.field public static final synthetic n:I


# instance fields
.field public k:I

.field public l:I

.field public m:[F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 11
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object v1, Lkhh;->D:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    const/4 v1, 0x4

    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/opera/android/widget/RoundedImageView;->k:I

    const/4 v2, 0x3

    invoke-virtual {p1, v2, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/opera/android/widget/RoundedImageView;->l:I

    const/4 v3, 0x5

    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    const/4 v5, 0x6

    const/4 v6, 0x1

    const/4 v7, 0x2

    if-nez v4, :cond_38

    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-nez v4, :cond_38

    invoke-virtual {p1, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-nez v4, :cond_38

    invoke-virtual {p1, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_5b

    :cond_38
    new-array v1, v1, [F

    iput-object v1, p0, Lcom/opera/android/widget/RoundedImageView;->m:[F

    int-to-float p2, p2

    invoke-virtual {p1, v3, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v3

    aput v3, v1, v0

    iget-object v0, p0, Lcom/opera/android/widget/RoundedImageView;->m:[F

    invoke-virtual {p1, v5, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    aput v1, v0, v6

    iget-object v0, p0, Lcom/opera/android/widget/RoundedImageView;->m:[F

    invoke-virtual {p1, v7, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    aput v1, v0, v7

    iget-object p0, p0, Lcom/opera/android/widget/RoundedImageView;->m:[F

    invoke-virtual {p1, v6, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    aput p2, p0, v2

    :cond_5b
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final f(II)V
    .registers 5

    iget v0, p0, Lcom/opera/android/widget/RoundedImageView;->k:I

    if-ne v0, p1, :cond_c

    iget v0, p0, Lcom/opera/android/widget/RoundedImageView;->l:I

    if-ne v0, p2, :cond_c

    iget-object v0, p0, Lcom/opera/android/widget/RoundedImageView;->m:[F

    if-eqz v0, :cond_23

    :cond_c
    iput p1, p0, Lcom/opera/android/widget/RoundedImageView;->k:I

    iput p2, p0, Lcom/opera/android/widget/RoundedImageView;->l:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/widget/RoundedImageView;->m:[F

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v1, v0, Lb9i;

    if-eqz v1, :cond_1f

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :cond_1f
    instance-of p0, v0, Lq8i;

    if-nez p0, :cond_24

    :cond_23
    return-void

    :cond_24
    check-cast v0, Lq8i;

    invoke-virtual {v0, p1, p2}, Lq8i;->a(II)V

    return-void
.end method

.method public final setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 5

    iget v0, p0, Lcom/opera/android/widget/RoundedImageView;->k:I

    if-nez v0, :cond_c

    iget v0, p0, Lcom/opera/android/widget/RoundedImageView;->l:I

    if-nez v0, :cond_c

    iget-object v0, p0, Lcom/opera/android/widget/RoundedImageView;->m:[F

    if-eqz v0, :cond_50

    :cond_c
    instance-of v0, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_50

    move-object v0, p1

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_50

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-lez v1, :cond_50

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-lez v1, :cond_50

    invoke-virtual {p0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object p1

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    if-ne p1, v1, :cond_37

    iget-object p1, p0, Lcom/opera/android/widget/RoundedImageView;->m:[F

    if-nez p1, :cond_37

    new-instance p1, Lb9i;

    invoke-direct {p1, p0, v0}, Lb9i;-><init>(Lcom/opera/android/widget/RoundedImageView;Landroid/graphics/Bitmap;)V

    goto :goto_50

    :cond_37
    iget-object p1, p0, Lcom/opera/android/widget/RoundedImageView;->m:[F

    if-eqz p1, :cond_44

    sget-object v1, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v1, Lq8i;

    invoke-direct {v1, v0, p1}, Lq8i;-><init>(Landroid/graphics/Bitmap;[F)V

    move-object p1, v1

    goto :goto_50

    :cond_44
    iget p1, p0, Lcom/opera/android/widget/RoundedImageView;->k:I

    iget v1, p0, Lcom/opera/android/widget/RoundedImageView;->l:I

    sget-object v2, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v2, Lq8i;

    invoke-direct {v2, v0, p1, v1}, Lq8i;-><init>(Landroid/graphics/Bitmap;II)V

    move-object p1, v2

    :cond_50
    :goto_50
    invoke-super {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
