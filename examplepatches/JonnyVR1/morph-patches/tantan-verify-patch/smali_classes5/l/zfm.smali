.class public Ll/zfm;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zfm$a;
    }
.end annotation


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Landroid/graphics/Paint;

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:[I

.field public i:Landroid/graphics/RectF;

.field public j:Landroid/graphics/LinearGradient;


# direct methods
.method public constructor <init>(I[IIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/zfm;->d:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/zfm;->h:[I

    .line 7
    .line 8
    iput p3, p0, Ll/zfm;->e:I

    .line 9
    .line 10
    iput p5, p0, Ll/zfm;->c:I

    .line 11
    .line 12
    iput p6, p0, Ll/zfm;->f:I

    .line 13
    .line 14
    iput p7, p0, Ll/zfm;->g:I

    .line 15
    .line 16
    new-instance p1, Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/zfm;->a:Landroid/graphics/Paint;

    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 25
    .line 26
    .line 27
    const/4 p2, 0x1

    .line 28
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 29
    .line 30
    .line 31
    int-to-float p3, p5

    .line 32
    int-to-float p5, p6

    .line 33
    int-to-float p6, p7

    .line 34
    invoke-virtual {p1, p3, p5, p6, p4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 35
    .line 36
    .line 37
    new-instance p3, Landroid/graphics/PorterDuffXfermode;

    .line 38
    .line 39
    sget-object p4, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    .line 40
    .line 41
    invoke-direct {p3, p4}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 45
    .line 46
    .line 47
    new-instance p1, Landroid/graphics/Paint;

    .line 48
    .line 49
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Ll/zfm;->b:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public synthetic constructor <init>(I[IIIIIILl/agm;)V
    .locals 0

    .line 58
    invoke-direct/range {p0 .. p7}, Ll/zfm;-><init>(I[IIIIII)V

    return-void
.end method

.method public static a(Landroid/view/View;II)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    sub-int/2addr v2, p1

    .line 18
    sub-int/2addr v1, p2

    .line 19
    add-int/2addr v3, p1

    .line 20
    add-int/2addr v0, p2

    .line 21
    invoke-static {p0, v2, v1, v3, v0}, Ll/kkl0;->z0(Landroid/view/View;IIII)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static b(Landroid/view/View;IIIIII)V
    .locals 1

    .line 1
    new-instance v0, Ll/zfm$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zfm$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/zfm$a;->b(I)Ll/zfm$a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1, p2}, Ll/zfm$a;->g(I)Ll/zfm$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1, p3}, Ll/zfm$a;->e(I)Ll/zfm$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, p4}, Ll/zfm$a;->f(I)Ll/zfm$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, p5}, Ll/zfm$a;->c(I)Ll/zfm$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, p6}, Ll/zfm$a;->d(I)Ll/zfm$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ll/zfm$a;->a()Ll/zfm;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const/4 p2, 0x1

    .line 35
    const/4 p3, 0x0

    .line 36
    invoke-virtual {p0, p2, p3}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p0, p5, p6}, Ll/zfm;->a(Landroid/view/View;II)V

    .line 40
    .line 41
    .line 42
    invoke-static {p0, p1}, Ll/kkl0;->m0(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x2

    .line 46
    invoke-virtual {p0, p1, p3}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/zfm;->h:[I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    array-length v2, v0

    .line 7
    if-ne v2, v1, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Ll/zfm;->b:Landroid/graphics/Paint;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    aget v0, v0, v3

    .line 13
    .line 14
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/zfm;->j:Landroid/graphics/LinearGradient;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v2, p0, Ll/zfm;->b:Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    iget v0, p0, Ll/zfm;->d:I

    .line 28
    .line 29
    iget-object v2, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 30
    .line 31
    if-ne v0, v1, :cond_2

    .line 32
    .line 33
    iget v0, p0, Ll/zfm;->e:I

    .line 34
    .line 35
    int-to-float v1, v0

    .line 36
    int-to-float v0, v0

    .line 37
    iget-object v3, p0, Ll/zfm;->a:Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-virtual {p1, v2, v1, v0, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 43
    .line 44
    iget v1, p0, Ll/zfm;->e:I

    .line 45
    .line 46
    int-to-float v2, v1

    .line 47
    int-to-float v1, v1

    .line 48
    iget-object p0, p0, Ll/zfm;->b:Landroid/graphics/Paint;

    .line 49
    .line 50
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object v1, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 59
    .line 60
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    iget-object v2, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    iget-object v3, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 71
    .line 72
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    const/high16 v3, 0x40000000    # 2.0f

    .line 81
    .line 82
    div-float/2addr v2, v3

    .line 83
    iget-object v4, p0, Ll/zfm;->a:Landroid/graphics/Paint;

    .line 84
    .line 85
    invoke-virtual {p1, v0, v1, v2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iget-object v1, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 95
    .line 96
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    iget-object v2, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 101
    .line 102
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    iget-object v4, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 107
    .line 108
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    div-float/2addr v2, v3

    .line 117
    iget-object p0, p0, Ll/zfm;->b:Landroid/graphics/Paint;

    .line 118
    .line 119
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zfm;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBounds(IIII)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RectF;

    .line 5
    .line 6
    iget v1, p0, Ll/zfm;->c:I

    .line 7
    .line 8
    add-int/2addr p1, v1

    .line 9
    iget v2, p0, Ll/zfm;->f:I

    .line 10
    .line 11
    sub-int/2addr p1, v2

    .line 12
    int-to-float p1, p1

    .line 13
    add-int/2addr p2, v1

    .line 14
    iget v3, p0, Ll/zfm;->g:I

    .line 15
    .line 16
    sub-int/2addr p2, v3

    .line 17
    int-to-float p2, p2

    .line 18
    sub-int/2addr p3, v1

    .line 19
    sub-int/2addr p3, v2

    .line 20
    int-to-float p3, p3

    .line 21
    sub-int/2addr p4, v1

    .line 22
    sub-int/2addr p4, v3

    .line 23
    int-to-float p4, p4

    .line 24
    invoke-direct {v0, p1, p2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 28
    .line 29
    iget-object p1, p0, Ll/zfm;->h:[I

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    array-length p1, p1

    .line 34
    const/4 p2, 0x1

    .line 35
    if-le p1, p2, :cond_0

    .line 36
    .line 37
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 38
    .line 39
    iget-object p1, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 40
    .line 41
    iget v1, p1, Landroid/graphics/RectF;->left:F

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    const/high16 p2, 0x40000000    # 2.0f

    .line 48
    .line 49
    div-float v2, p1, p2

    .line 50
    .line 51
    iget-object p1, p0, Ll/zfm;->i:Landroid/graphics/RectF;

    .line 52
    .line 53
    iget v3, p1, Landroid/graphics/RectF;->right:F

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    div-float v4, p1, p2

    .line 60
    .line 61
    iget-object v5, p0, Ll/zfm;->h:[I

    .line 62
    .line 63
    const/4 v6, 0x0

    .line 64
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 65
    .line 66
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Ll/zfm;->j:Landroid/graphics/LinearGradient;

    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/zfm;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    return-void
.end method
