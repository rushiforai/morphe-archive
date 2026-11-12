.class public final Lok3;
.super Lf83;
.source "SourceFile"


# static fields
.field public static final synthetic m:I


# instance fields
.field public final i:Landroid/graphics/Matrix;

.field public final j:Li97;

.field public final k:Landroid/graphics/PointF;

.field public l:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .registers 5

    sget-object v0, Leya;->b:Leya;

    invoke-direct {p0, p1, v0}, Lf83;-><init>(Ljava/util/List;Leya;)V

    iget-object p1, p0, Lf83;->h:Landroid/graphics/Paint;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lf83;->h:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    iget-object p1, p0, Lf83;->h:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/BlurMaskFilter;

    const/high16 v1, 0x41c00000    # 24.0f

    sget-object v2, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v0, v1, v2}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lok3;->i:Landroid/graphics/Matrix;

    new-instance p1, Li97;

    const/4 v0, 0x0

    const/4 v1, 0x7

    invoke-direct {p1, v0, v1}, Li97;-><init>(Landroid/graphics/PointF;I)V

    iput-object p1, p0, Lok3;->j:Li97;

    new-instance p1, Landroid/graphics/PointF;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p1, v0, v0}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object p1, p0, Lok3;->k:Landroid/graphics/PointF;

    return-void
.end method


# virtual methods
.method public final b(Landroid/graphics/Canvas;Lkk7;)V
    .registers 9

    iget-object v0, p2, Lkk7;->b:Li97;

    iget-object v1, v0, Li97;->a:Landroid/graphics/PointF;

    iget v2, v1, Landroid/graphics/PointF;->x:F

    iget v3, v1, Landroid/graphics/PointF;->y:F

    sget-object v4, Li97;->e:Landroid/graphics/PointF;

    invoke-virtual {v1, v4}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    iget-object v4, p2, Lkk7;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, p2, Lkk7;->c:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v4, v5, v0}, Lok3;->f(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Li97;)Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    invoke-super {p0, p1, p2}, Lf83;->b(Landroid/graphics/Canvas;Lkk7;)V

    return-void
.end method

.method public final f(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Li97;)Landroid/graphics/Paint;
    .registers 13

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    const/high16 v1, 0x42400000    # 48.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iget v0, p3, Li97;->c:F

    iget-object v1, p3, Li97;->a:Landroid/graphics/PointF;

    iget-object v2, p3, Li97;->b:Landroid/graphics/PointF;

    mul-float/2addr p1, v0

    iget-object v0, p0, Lf83;->h:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Lok3;->j:Li97;

    if-nez p2, :cond_27

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iput-object p2, p0, Lok3;->l:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Li97;->a()V

    return-object v0

    :cond_27
    iget-object v3, p0, Lok3;->l:Landroid/graphics/Bitmap;

    invoke-static {v3, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, p0, Lok3;->k:Landroid/graphics/PointF;

    if-nez v3, :cond_45

    new-instance v3, Landroid/graphics/BitmapShader;

    sget-object v5, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v3, p2, v5, v5}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iput-object p2, p0, Lok3;->l:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Li97;->a()V

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v4, v3, v3}, Landroid/graphics/PointF;->set(FF)V

    :cond_45
    iget v3, v2, Landroid/graphics/PointF;->x:F

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v3, v5

    iget v5, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    int-to-float p2, p2

    div-float/2addr v5, p2

    sget-object p2, Li97;->e:Landroid/graphics/PointF;

    iget-object p2, p1, Li97;->a:Landroid/graphics/PointF;

    iget-object v6, p1, Li97;->b:Landroid/graphics/PointF;

    iget v7, p2, Landroid/graphics/PointF;->x:F

    iget v8, v1, Landroid/graphics/PointF;->x:F

    sub-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    const v8, 0x3a83126f    # 0.001f

    cmpg-float v7, v7, v8

    if-gez v7, :cond_b0

    iget p2, p2, Landroid/graphics/PointF;->y:F

    iget v7, v1, Landroid/graphics/PointF;->y:F

    sub-float/2addr p2, v7

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpg-float p2, p2, v8

    if-gez p2, :cond_b0

    iget p2, v6, Landroid/graphics/PointF;->x:F

    iget v7, v2, Landroid/graphics/PointF;->x:F

    sub-float/2addr p2, v7

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpg-float p2, p2, v8

    if-gez p2, :cond_b0

    iget p2, v6, Landroid/graphics/PointF;->y:F

    iget v7, v2, Landroid/graphics/PointF;->y:F

    sub-float/2addr p2, v7

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpg-float p2, p2, v8

    if-gez p2, :cond_b0

    iget p2, p1, Li97;->c:F

    iget v7, p3, Li97;->c:F

    sub-float/2addr p2, v7

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpg-float p2, p2, v8

    if-gez p2, :cond_b0

    iget p2, v4, Landroid/graphics/PointF;->x:F

    invoke-static {p2, v3}, Lc26;->C(FF)Z

    move-result p2

    if-eqz p2, :cond_b0

    iget p2, v4, Landroid/graphics/PointF;->y:F

    invoke-static {p2, v5}, Lc26;->C(FF)Z

    move-result p2

    if-eqz p2, :cond_b0

    return-object v0

    :cond_b0
    iget-object p0, p0, Lok3;->i:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Landroid/graphics/Matrix;->reset()V

    sget-object p2, Li97;->e:Landroid/graphics/PointF;

    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_c4

    iget p2, v1, Landroid/graphics/PointF;->x:F

    iget v7, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0, p2, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    :cond_c4
    invoke-virtual {p0, v3, v5}, Landroid/graphics/Matrix;->preScale(FF)Z

    invoke-virtual {v0}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object p2

    invoke-virtual {p2, p0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    iget-object p0, p1, Li97;->a:Landroid/graphics/PointF;

    invoke-virtual {p0, v1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    invoke-virtual {v6, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    iget p0, p3, Li97;->c:F

    iput p0, p1, Li97;->c:F

    iget-object p0, p1, Li97;->d:Landroid/graphics/PointF;

    iget-object p1, p3, Li97;->d:Landroid/graphics/PointF;

    invoke-virtual {p0, p1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    invoke-virtual {v4, v3, v5}, Landroid/graphics/PointF;->set(FF)V

    return-object v0
.end method
