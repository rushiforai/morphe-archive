.class public Lv/VFrame_Shadow;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/VFrame_Shadow$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:Lv/VFrame_Shadow$a;

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, p1, v0}, Lv/VFrame_Shadow;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    invoke-virtual {p0, p1, p2}, Lv/VFrame_Shadow;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    invoke-virtual {p0, p1, p2}, Lv/VFrame_Shadow;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lv/VFrame_Shadow;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VFrame_Shadow;->f(Landroid/view/View;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final b(IIFFFFII)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Landroid/graphics/Canvas;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Landroid/graphics/RectF;

    .line 13
    .line 14
    int-to-float p1, p1

    .line 15
    sub-float/2addr p1, p4

    .line 16
    int-to-float p2, p2

    .line 17
    sub-float/2addr p2, p4

    .line 18
    invoke-direct {v2, p4, p4, p1, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    cmpl-float p2, p6, p1

    .line 23
    .line 24
    if-lez p2, :cond_0

    .line 25
    .line 26
    iget p2, v2, Landroid/graphics/RectF;->top:F

    .line 27
    .line 28
    add-float/2addr p2, p6

    .line 29
    iput p2, v2, Landroid/graphics/RectF;->top:F

    .line 30
    .line 31
    iget p2, v2, Landroid/graphics/RectF;->bottom:F

    .line 32
    .line 33
    sub-float/2addr p2, p6

    .line 34
    iput p2, v2, Landroid/graphics/RectF;->bottom:F

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    cmpg-float p2, p6, p1

    .line 38
    .line 39
    if-gez p2, :cond_1

    .line 40
    .line 41
    iget p2, v2, Landroid/graphics/RectF;->top:F

    .line 42
    .line 43
    invoke-static {p6}, Ljava/lang/Math;->abs(F)F

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    add-float/2addr p2, v3

    .line 48
    iput p2, v2, Landroid/graphics/RectF;->top:F

    .line 49
    .line 50
    iget p2, v2, Landroid/graphics/RectF;->bottom:F

    .line 51
    .line 52
    invoke-static {p6}, Ljava/lang/Math;->abs(F)F

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    sub-float/2addr p2, v3

    .line 57
    iput p2, v2, Landroid/graphics/RectF;->bottom:F

    .line 58
    .line 59
    :cond_1
    :goto_0
    cmpl-float p2, p5, p1

    .line 60
    .line 61
    if-lez p2, :cond_2

    .line 62
    .line 63
    iget p1, v2, Landroid/graphics/RectF;->left:F

    .line 64
    .line 65
    add-float/2addr p1, p5

    .line 66
    iput p1, v2, Landroid/graphics/RectF;->left:F

    .line 67
    .line 68
    iget p1, v2, Landroid/graphics/RectF;->right:F

    .line 69
    .line 70
    sub-float/2addr p1, p5

    .line 71
    iput p1, v2, Landroid/graphics/RectF;->right:F

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    cmpg-float p1, p5, p1

    .line 75
    .line 76
    if-gez p1, :cond_3

    .line 77
    .line 78
    iget p1, v2, Landroid/graphics/RectF;->left:F

    .line 79
    .line 80
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    add-float/2addr p1, p2

    .line 85
    iput p1, v2, Landroid/graphics/RectF;->left:F

    .line 86
    .line 87
    iget p1, v2, Landroid/graphics/RectF;->right:F

    .line 88
    .line 89
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    sub-float/2addr p1, p2

    .line 94
    iput p1, v2, Landroid/graphics/RectF;->right:F

    .line 95
    .line 96
    :cond_3
    :goto_1
    new-instance p1, Landroid/graphics/Paint;

    .line 97
    .line 98
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 99
    .line 100
    .line 101
    const/4 p2, 0x1

    .line 102
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, p8}, Landroid/graphics/Paint;->setColor(I)V

    .line 106
    .line 107
    .line 108
    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-nez p0, :cond_4

    .line 118
    .line 119
    invoke-virtual {p1, p4, p5, p6, p7}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 120
    .line 121
    .line 122
    :cond_4
    invoke-virtual {v1, v2, p3, p3, p1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 123
    .line 124
    .line 125
    return-object v0
.end method

.method public final c(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p2, p3, p0, p0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final d(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    sget-object v0, Ll/hhc0;->F3:[I

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lv/VFrame_Shadow;->c(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_0
    sget p2, Ll/hhc0;->G3:I

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/bac0;->l:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput p2, p0, Lv/VFrame_Shadow;->c:F

    .line 27
    .line 28
    sget p2, Ll/hhc0;->K3:I

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Ll/bac0;->m:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iput p2, p0, Lv/VFrame_Shadow;->b:F

    .line 45
    .line 46
    sget p2, Ll/hhc0;->H3:I

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    iput p2, p0, Lv/VFrame_Shadow;->d:F

    .line 54
    .line 55
    sget p2, Ll/hhc0;->I3:I

    .line 56
    .line 57
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    iput p2, p0, Lv/VFrame_Shadow;->e:F

    .line 62
    .line 63
    sget p2, Ll/hhc0;->J3:I

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sget v1, Ll/z8c0;->C:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    iput p2, p0, Lv/VFrame_Shadow;->a:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :catchall_0
    move-exception p0

    .line 86
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 87
    .line 88
    .line 89
    throw p0
.end method

.method public final e(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lv/VFrame_Shadow;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lv/VFrame_Shadow;->b:F

    .line 5
    .line 6
    iget p2, p0, Lv/VFrame_Shadow;->d:F

    .line 7
    .line 8
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    add-float/2addr p1, p2

    .line 13
    float-to-int p1, p1

    .line 14
    iget p2, p0, Lv/VFrame_Shadow;->b:F

    .line 15
    .line 16
    iget v0, p0, Lv/VFrame_Shadow;->e:F

    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    add-float/2addr p2, v0

    .line 23
    float-to-int p2, p2

    .line 24
    invoke-virtual {p0, p1, p2, p1, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lv/VFrame_Shadow;->g:Z

    .line 3
    .line 4
    iget-object p0, p0, Lv/VFrame_Shadow;->f:Lv/VFrame_Shadow$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lv/VFrame_Shadow$a;->a()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return p1
.end method

.method public final g(II)V
    .locals 9

    .line 1
    iget v3, p0, Lv/VFrame_Shadow;->c:F

    .line 2
    .line 3
    iget v4, p0, Lv/VFrame_Shadow;->b:F

    .line 4
    .line 5
    iget v5, p0, Lv/VFrame_Shadow;->d:F

    .line 6
    .line 7
    iget v6, p0, Lv/VFrame_Shadow;->e:F

    .line 8
    .line 9
    iget v7, p0, Lv/VFrame_Shadow;->a:I

    .line 10
    .line 11
    const/4 v8, 0x0

    .line 12
    move-object v0, p0

    .line 13
    move v1, p1

    .line 14
    move v2, p2

    .line 15
    invoke-virtual/range {v0 .. v8}, Lv/VFrame_Shadow;->b(IIFFFFII)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-direct {p1, p2, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    if-lez p1, :cond_0

    .line 5
    .line 6
    if-lez p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Lv/VFrame_Shadow;->g(II)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setOnLongPressListener(Lv/VFrame_Shadow$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VFrame_Shadow;->f:Lv/VFrame_Shadow$a;

    .line 2
    .line 3
    new-instance p1, Ll/yxk0;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/yxk0;-><init>(Lv/VFrame_Shadow;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setPressed(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    iget-boolean p1, p0, Lv/VFrame_Shadow;->g:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lv/VFrame_Shadow;->f:Lv/VFrame_Shadow$a;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-interface {p1}, Lv/VFrame_Shadow$a;->b()V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lv/VFrame_Shadow;->g:Z

    .line 19
    .line 20
    :cond_1
    return-void
.end method
