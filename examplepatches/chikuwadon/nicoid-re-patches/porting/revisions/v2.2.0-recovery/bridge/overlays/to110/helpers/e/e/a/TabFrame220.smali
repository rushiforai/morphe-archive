.class final Le/e/a/TabFrame220;
.super Ljava/lang/Object;
.source "TabFrame220.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static snapshot(Landroid/view/View;)Landroid/graphics/Bitmap;
    .registers 10

    .line 10
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-lez v1, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-gtz v1, :cond_0

    goto :goto_2

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 13
    int-to-float v3, v1

    const/high16 v4, 0x43f00000    # 480.0f

    div-float/2addr v4, v3

    int-to-double v5, v1

    int-to-double v7, v2

    mul-double/2addr v5, v7

    const-wide v7, 0x41255cc000000000L    # 700000.0

    div-double/2addr v7, v5

    .line 14
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-float v1, v5

    .line 13
    invoke-static {v4, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 15
    nop

    .line 17
    mul-float/2addr v3, v1

    :try_start_0
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    const/4 v4, 0x1

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v2, v2

    mul-float/2addr v2, v1

    .line 18
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    sget-object v4, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 17
    invoke-static {v3, v2, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_2

    .line 19
    :try_start_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 20
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 21
    invoke-virtual {v3, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 22
    invoke-virtual {p0, v3}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0

    .line 23
    return-object v2

    .line 24
    :catch_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception p0

    goto :goto_1

    :catch_2
    move-exception p0

    goto :goto_0

    :catch_3
    move-exception p0

    :goto_0
    move-object v2, v0

    .line 25
    :goto_1
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 26
    :cond_1
    return-object v0

    .line 10
    :cond_2
    :goto_2
    return-object v0
.end method
