.class public Ll/g23;
.super Ll/n33;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n33;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 13

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    cmpl-float v2, v0, v1

    .line 14
    .line 15
    const/high16 v3, 0x40000000    # 2.0f

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    if-lez v2, :cond_0

    .line 19
    .line 20
    sub-float/2addr v0, v1

    .line 21
    div-float/2addr v0, v3

    .line 22
    move v2, v1

    .line 23
    move v1, v0

    .line 24
    move v0, v2

    .line 25
    move v2, v4

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sub-float/2addr v1, v0

    .line 28
    div-float/2addr v1, v3

    .line 29
    move v2, v1

    .line 30
    move v1, v4

    .line 31
    :goto_0
    int-to-float v3, p1

    .line 32
    const/high16 v5, 0x3f800000    # 1.0f

    .line 33
    .line 34
    mul-float/2addr v5, v3

    .line 35
    div-float/2addr v5, v0

    .line 36
    new-instance v11, Landroid/graphics/Matrix;

    .line 37
    .line 38
    invoke-direct {v11}, Landroid/graphics/Matrix;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v11, v5, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 42
    .line 43
    .line 44
    float-to-int v7, v1

    .line 45
    float-to-int v8, v2

    .line 46
    float-to-int v9, v0

    .line 47
    const/4 v12, 0x1

    .line 48
    move v10, v9

    .line 49
    move-object v6, p0

    .line 50
    invoke-static/range {v6 .. v12}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance v0, Landroid/graphics/BitmapShader;

    .line 55
    .line 56
    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 57
    .line 58
    invoke-direct {v0, p0, v1, v1}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 62
    .line 63
    invoke-static {p1, p1, p0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    new-instance p1, Landroid/graphics/Canvas;

    .line 68
    .line 69
    invoke-direct {p1, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 70
    .line 71
    .line 72
    new-instance v1, Landroid/graphics/Paint;

    .line 73
    .line 74
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 75
    .line 76
    .line 77
    const/4 v2, 0x1

    .line 78
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 82
    .line 83
    .line 84
    new-instance v0, Landroid/graphics/RectF;

    .line 85
    .line 86
    invoke-direct {v0, v4, v4, v3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 87
    .line 88
    .line 89
    int-to-float p2, p2

    .line 90
    invoke-virtual {p1, v0, p2, p2, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 91
    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_1
    const-string p0, "Bitmap can\'t be null"

    .line 95
    .line 96
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const/4 p0, 0x0

    .line 100
    return-object p0
.end method

.method public static b(Ljava/lang/String;ILandroid/text/TextPaint;)Ljava/lang/String;
    .locals 5

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    if-lez p1, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_2

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    move-object v1, p0

    .line 13
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v0, v2, :cond_1

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v3, "..."

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    int-to-float v4, p1

    .line 35
    cmpl-float v3, v3, v4

    .line 36
    .line 37
    if-lez v3, :cond_0

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 41
    .line 42
    move-object v1, v2

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    :goto_1
    return-object v1

    .line 45
    :cond_2
    return-object p0
.end method

.method public static c(Ljava/lang/String;IIII)Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-static/range {v0 .. v5}, Ll/g23;->d(Ljava/lang/String;IIIILandroid/graphics/Typeface;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static d(Ljava/lang/String;IIIILandroid/graphics/Typeface;)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    new-instance v0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p5, 0x2

    .line 17
    invoke-static {p5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 18
    .line 19
    .line 20
    move-result-object p5

    .line 21
    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 22
    .line 23
    .line 24
    :goto_0
    int-to-float p1, p1

    .line 25
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFlags()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    or-int/lit16 p1, p1, 0x80

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    iget p3, p3, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 55
    .line 56
    sub-float p3, p1, p3

    .line 57
    .line 58
    float-to-int p3, p3

    .line 59
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 60
    .line 61
    .line 62
    move-result p5

    .line 63
    float-to-int p5, p5

    .line 64
    if-nez p2, :cond_1

    .line 65
    .line 66
    move v1, p5

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    invoke-static {p5, p2}, Ljava/lang/Math;->min(II)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    :goto_1
    if-eqz p2, :cond_2

    .line 73
    .line 74
    if-le p5, p2, :cond_2

    .line 75
    .line 76
    invoke-static {p0, p2, v0}, Ll/g23;->b(Ljava/lang/String;ILandroid/text/TextPaint;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    :cond_2
    sget-object p2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 81
    .line 82
    invoke-static {v1, p3, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    new-instance p5, Landroid/graphics/Canvas;

    .line 87
    .line 88
    invoke-direct {p5, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p5, p4}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 92
    .line 93
    .line 94
    int-to-float p3, p3

    .line 95
    sub-float/2addr p3, p1

    .line 96
    const/4 p1, 0x0

    .line 97
    invoke-virtual {p5, p0, p1, p3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 98
    .line 99
    .line 100
    return-object p2
.end method

.method public static e(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/hk70;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/g23;->f(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/hk70;Ll/fn2;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static f(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/hk70;Ll/fn2;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->y(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/dkq;

    .line 10
    .line 11
    invoke-direct {v1, p2, p1}, Ll/dkq;-><init>(Ll/hk70;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {}, Ll/f9j;->g()Ll/lq70;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p2, v0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->E(Ll/lde;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Ll/lq70;

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Ll/lq70;

    .line 41
    .line 42
    new-instance p2, Ll/am2$b;

    .line 43
    .line 44
    invoke-direct {p2, p3}, Ll/am2$b;-><init>(Ll/fn2;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Ll/lq70;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static g(I)Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    rsub-int/lit8 p0, p0, 0x64

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    div-int/2addr p0, v0

    .line 5
    new-instance v1, Ll/pf60;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {v1, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-object v1
.end method
