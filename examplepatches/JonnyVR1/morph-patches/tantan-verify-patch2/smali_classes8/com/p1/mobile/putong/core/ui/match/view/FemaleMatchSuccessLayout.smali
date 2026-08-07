.class public Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public final b:Landroid/graphics/PorterDuffXfermode;

.field public c:F

.field public d:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 5
    .line 6
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 7
    .line 8
    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->b:Landroid/graphics/PorterDuffXfermode;

    .line 12
    .line 13
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 18
    .line 19
    int-to-float p1, p1

    .line 20
    const/high16 v0, 0x40000000    # 2.0f

    .line 21
    .line 22
    div-float/2addr p1, v0

    .line 23
    sget v1, Ll/qa00;->h:I

    .line 24
    .line 25
    int-to-float v1, v1

    .line 26
    sub-float/2addr p1, v1

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->c:F

    .line 28
    .line 29
    const/high16 p1, 0x42b40000    # 90.0f

    .line 30
    .line 31
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    int-to-float p1, p1

    .line 36
    div-float/2addr p1, v0

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->d:F

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->a()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 43
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->b:Landroid/graphics/PorterDuffXfermode;

    .line 45
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p1, p1

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    sget v0, Ll/qa00;->h:I

    int-to-float v0, v0

    sub-float/2addr p1, v0

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->c:F

    const/high16 p1, 0x42b40000    # 90.0f

    .line 46
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, p2

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->d:F

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 48
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 49
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->b:Landroid/graphics/PorterDuffXfermode;

    .line 50
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p1, p1

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    sget p3, Ll/qa00;->h:I

    int-to-float p3, p3

    sub-float/2addr p1, p3

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->c:F

    const/high16 p1, 0x42b40000    # 90.0f

    .line 51
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, p2

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->d:F

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->a:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v4, v0

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v5, v0

    .line 11
    const/high16 v0, 0x40000000    # 2.0f

    .line 12
    .line 13
    div-float v1, v4, v0

    .line 14
    .line 15
    div-float v2, v5, v0

    .line 16
    .line 17
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 18
    .line 19
    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->d:F

    .line 21
    .line 22
    float-to-int v1, v1

    .line 23
    mul-int/lit8 v1, v1, 0x2

    .line 24
    .line 25
    invoke-static {v1}, Ll/rsf0;->i(I)F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const v2, 0x3e53dd98    # 0.2069f

    .line 30
    .line 31
    .line 32
    mul-float/2addr v1, v2

    .line 33
    const v2, 0x401a7efa    # 2.414f

    .line 34
    .line 35
    .line 36
    sub-float/2addr v1, v2

    .line 37
    const/high16 v2, 0x41200000    # 10.0f

    .line 38
    .line 39
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    new-instance v2, Landroid/graphics/RectF;

    .line 44
    .line 45
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->c:F

    .line 46
    .line 47
    neg-float v6, v3

    .line 48
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->d:F

    .line 49
    .line 50
    neg-float v8, v7

    .line 51
    invoke-direct {v2, v6, v8, v3, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/rsf0;->c(F)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    int-to-float v3, v3

    .line 59
    invoke-static {v1}, Ll/rsf0;->c(F)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    int-to-float v1, v1

    .line 64
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->a:Landroid/graphics/Paint;

    .line 65
    .line 66
    invoke-virtual {p1, v2, v3, v1, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->a:Landroid/graphics/Paint;

    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->b:Landroid/graphics/PorterDuffXfermode;

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 74
    .line 75
    .line 76
    neg-float v1, v4

    .line 77
    div-float/2addr v1, v0

    .line 78
    neg-float v2, v5

    .line 79
    div-float/2addr v2, v0

    .line 80
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 81
    .line 82
    .line 83
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->a:Landroid/graphics/Paint;

    .line 84
    .line 85
    const/16 v7, 0x1f

    .line 86
    .line 87
    const/4 v2, 0x0

    .line 88
    const/4 v3, 0x0

    .line 89
    move-object v1, p1

    .line 90
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-super {p0, v1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->a:Landroid/graphics/Paint;

    .line 101
    .line 102
    const/4 p1, 0x0

    .line 103
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public setMoveX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->c:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMoveY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->d:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
