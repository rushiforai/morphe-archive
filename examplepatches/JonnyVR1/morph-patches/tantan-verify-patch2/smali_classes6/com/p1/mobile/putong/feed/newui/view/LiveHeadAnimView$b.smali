.class public Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/graphics/Matrix;

.field public b:Landroid/graphics/Matrix;

.field public final c:Landroid/graphics/Bitmap;

.field public d:F

.field public final synthetic e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->b:Landroid/graphics/Matrix;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->c:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 3

    .line 1
    const v0, 0x3f333333    # 0.7f

    .line 2
    .line 3
    .line 4
    cmpg-float v1, p1, v0

    .line 5
    .line 6
    const v2, 0x3e2e147b    # 0.17f

    .line 7
    .line 8
    .line 9
    if-gtz v1, :cond_0

    .line 10
    .line 11
    div-float/2addr p1, v0

    .line 12
    mul-float/2addr p1, v2

    .line 13
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    sub-float/2addr v0, p1

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->d:F

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sub-float/2addr p1, v0

    .line 20
    mul-float/2addr p1, v2

    .line 21
    const v0, 0x3e99999a    # 0.3f

    .line 22
    .line 23
    .line 24
    div-float/2addr p1, v0

    .line 25
    const v0, 0x3f547ae1    # 0.83f

    .line 26
    .line 27
    .line 28
    add-float/2addr p1, v0

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->d:F

    .line 30
    .line 31
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->b:Landroid/graphics/Matrix;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->b:Landroid/graphics/Matrix;

    .line 37
    .line 38
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->d:F

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    shr-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    int-to-float v1, v1

    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    shr-int/lit8 p0, p0, 0x1

    .line 56
    .line 57
    int-to-float p0, p0

    .line 58
    invoke-virtual {p1, v0, v0, v1, p0}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public b(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->f()Landroid/graphics/Paint;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->h()Landroid/graphics/Path;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 42
    .line 43
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->c()Landroid/graphics/Matrix;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->c(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const/4 v3, 0x1

    .line 56
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 60
    .line 61
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    shr-int/2addr v4, v3

    .line 66
    int-to-float v4, v4

    .line 67
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 68
    .line 69
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    shr-int/lit8 v3, v5, 0x1

    .line 74
    .line 75
    int-to-float v3, v3

    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e()F

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    const/high16 v6, 0x40000000    # 2.0f

    .line 81
    .line 82
    div-float/2addr v5, v6

    .line 83
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->d:F

    .line 84
    .line 85
    mul-float/2addr v5, v6

    .line 86
    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 87
    .line 88
    invoke-virtual {v1, v4, v3, v5, v6}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->c:Landroid/graphics/Bitmap;

    .line 95
    .line 96
    invoke-virtual {p1, v3, v2, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 103
    .line 104
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->b(Landroid/graphics/Matrix;)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 112
    .line 113
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->g(Landroid/graphics/Path;)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 121
    .line 122
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->e(Landroid/graphics/Paint;)V

    .line 127
    .line 128
    .line 129
    :cond_1
    :goto_0
    return-void
.end method

.method public final c(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->a:Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->b:Landroid/graphics/Matrix;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public final d()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->a:Landroid/graphics/Matrix;

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Matrix;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->a:Landroid/graphics/Matrix;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->j()Landroid/graphics/RectF;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->j()Landroid/graphics/RectF;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->c:Landroid/graphics/Bitmap;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    int-to-float v2, v2

    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->c:Landroid/graphics/Bitmap;

    .line 40
    .line 41
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    int-to-float v3, v3

    .line 46
    const/4 v4, 0x0

    .line 47
    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->c:Landroid/graphics/Bitmap;

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->c:Landroid/graphics/Bitmap;

    .line 57
    .line 58
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-lt v2, v3, :cond_0

    .line 63
    .line 64
    const/4 v2, 0x1

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const/4 v2, 0x0

    .line 67
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->c:Landroid/graphics/Bitmap;

    .line 68
    .line 69
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    int-to-float v3, v3

    .line 74
    add-float/2addr v3, v4

    .line 75
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->c:Landroid/graphics/Bitmap;

    .line 76
    .line 77
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    int-to-float v5, v5

    .line 82
    add-float/2addr v5, v4

    .line 83
    div-float/2addr v3, v5

    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e()F

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-eqz v2, :cond_1

    .line 89
    .line 90
    mul-float/2addr v4, v3

    .line 91
    :cond_1
    if-eqz v2, :cond_2

    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e()F

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    goto :goto_1

    .line 98
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e()F

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    div-float/2addr v2, v3

    .line 103
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 104
    .line 105
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    int-to-float v3, v3

    .line 110
    sub-float/2addr v3, v4

    .line 111
    const/high16 v5, 0x40000000    # 2.0f

    .line 112
    .line 113
    div-float/2addr v3, v5

    .line 114
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 115
    .line 116
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    int-to-float v6, v6

    .line 121
    sub-float/2addr v6, v2

    .line 122
    div-float/2addr v6, v5

    .line 123
    add-float/2addr v4, v3

    .line 124
    add-float/2addr v2, v6

    .line 125
    invoke-virtual {v1, v3, v6, v4, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 126
    .line 127
    .line 128
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->a:Landroid/graphics/Matrix;

    .line 129
    .line 130
    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    .line 131
    .line 132
    invoke-virtual {v2, v0, v1, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 133
    .line 134
    .line 135
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 136
    .line 137
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->i(Landroid/graphics/RectF;)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 145
    .line 146
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->i(Landroid/graphics/RectF;)V

    .line 151
    .line 152
    .line 153
    :cond_3
    return-void
.end method
