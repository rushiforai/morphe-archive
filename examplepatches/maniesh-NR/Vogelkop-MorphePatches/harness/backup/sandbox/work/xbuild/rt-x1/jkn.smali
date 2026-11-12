.class public abstract Ljkn;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Landroid/graphics/Bitmap$Config;

.field public static final b:Landroid/graphics/Bitmap$Config;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    sput-object v0, Ljkn;->a:Landroid/graphics/Bitmap$Config;

    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    sput-object v0, Ljkn;->b:Landroid/graphics/Bitmap$Config;

    return-void
.end method

.method public static a(Landroid/graphics/Bitmap;III)[Lhkn;
    .registers 13

    mul-int v0, p2, p3

    new-array v2, v0, [I

    const/4 v3, 0x0

    const/4 v5, 0x0

    move v7, p2

    move-object v1, p0

    move v6, p1

    move v4, p2

    move v8, p3

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    new-array p0, v0, [Lhkn;

    const/4 p1, 0x0

    :goto_11
    if-ge p1, v0, :cond_23

    new-instance p2, Lhkn;

    aget p3, v2, p1

    invoke-static {p3}, Lp37;->t(I)F

    move-result v1

    invoke-direct {p2, p3, v1}, Lhkn;-><init>(IF)V

    aput-object p2, p0, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_11

    :cond_23
    return-object p0
.end method

.method public static b(Landroid/graphics/Bitmap;)Likn;
    .registers 5

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x3d

    if-gt v0, v2, :cond_20

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-gt v0, v2, :cond_20

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {p0, v1, v0, v2}, Ljkn;->a(Landroid/graphics/Bitmap;III)[Lhkn;

    move-result-object p0

    invoke-static {p0}, Ljkn;->c([Lhkn;)Likn;

    move-result-object p0

    return-object p0

    :cond_20
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {p0, v0, v2, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    invoke-static {p0}, Ljkn;->b(Landroid/graphics/Bitmap;)Likn;

    move-result-object v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    return-object v0
.end method

.method public static c([Lhkn;)Likn;
    .registers 6

    new-instance v0, Lomj;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lomj;-><init>(B)V

    invoke-static {p0, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    array-length v0, p0

    div-int/lit8 v0, v0, 0x2

    aget-object v0, p0, v0

    iget v1, v0, Lhkn;->b:F

    const v2, 0x3f19999a    # 0.6f

    cmpl-float v1, v1, v2

    const/4 v2, 0x0

    if-lez v1, :cond_35

    move v1, v2

    :goto_1a
    array-length v3, p0

    if-ge v1, v3, :cond_2b

    aget-object v3, p0, v1

    iget v3, v3, Lhkn;->b:F

    const v4, 0x3e4ccccd    # 0.2f

    cmpl-float v3, v3, v4

    if-gtz v3, :cond_2b

    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    :cond_2b
    mul-int/lit8 v3, v1, 0x64

    array-length v4, p0

    div-int/2addr v3, v4

    const/16 v4, 0x14

    if-le v3, v4, :cond_35

    aget-object v0, p0, v1

    :cond_35
    new-instance v1, Likn;

    iget v0, v0, Lhkn;->a:I

    aget-object v2, p0, v2

    iget v2, v2, Lhkn;->b:F

    array-length v3, p0

    add-int/lit8 v3, v3, -0x1

    aget-object p0, p0, v3

    iget p0, p0, Lhkn;->b:F

    invoke-direct {v1, v0, v2, p0}, Likn;-><init>(IFF)V

    return-object v1
.end method

.method public static d(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .registers 5

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v0

    if-nez v0, :cond_7

    return-object p0

    :cond_7
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {v0, v1, p1}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_17

    return-object v0

    :cond_17
    const/high16 v1, -0x1000000

    invoke-virtual {p1, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v2, 0x0

    invoke-virtual {v1, p0, v2, v2, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-object p1
.end method
