.class public Ltech/sud/gip/core/view/round/RoundedDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# static fields
.field public static final DEFAULT_BORDER_COLOR:I = -0x1000000

.field public static final TAG:Ljava/lang/String; = "RoundedDrawable"


# instance fields
.field private final mBitmap:Landroid/graphics/Bitmap;

.field private final mBitmapHeight:I

.field private final mBitmapPaint:Landroid/graphics/Paint;

.field private final mBitmapRect:Landroid/graphics/RectF;

.field private final mBitmapWidth:I

.field private mBorderColor:Landroid/content/res/ColorStateList;

.field private final mBorderPaint:Landroid/graphics/Paint;

.field private final mBorderRect:Landroid/graphics/RectF;

.field private mBorderWidth:F

.field private final mBounds:Landroid/graphics/RectF;

.field private mCornerRadius:F

.field private final mCornersRounded:[Z

.field private final mDrawableRect:Landroid/graphics/RectF;

.field private mOval:Z

.field private mRebuildShader:Z

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private final mShaderMatrix:Landroid/graphics/Matrix;

.field private final mSquareCornersRect:Landroid/graphics/RectF;

.field private mTileModeX:Landroid/graphics/Shader$TileMode;

.field private mTileModeY:Landroid/graphics/Shader$TileMode;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 24
    .line 25
    new-instance v1, Landroid/graphics/RectF;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 31
    .line 32
    new-instance v1, Landroid/graphics/Matrix;

    .line 33
    .line 34
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 38
    .line 39
    new-instance v1, Landroid/graphics/RectF;

    .line 40
    .line 41
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mSquareCornersRect:Landroid/graphics/RectF;

    .line 45
    .line 46
    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 47
    .line 48
    iput-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 49
    .line 50
    iput-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 51
    .line 52
    const/4 v1, 0x1

    .line 53
    iput-boolean v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mRebuildShader:Z

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    iput v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 57
    .line 58
    const/4 v3, 0x4

    .line 59
    new-array v3, v3, [Z

    .line 60
    .line 61
    fill-array-data v3, :array_0

    .line 62
    .line 63
    .line 64
    iput-object v3, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 65
    .line 66
    const/4 v3, 0x0

    .line 67
    iput-boolean v3, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mOval:Z

    .line 68
    .line 69
    iput v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 70
    .line 71
    const/high16 v3, -0x1000000

    .line 72
    .line 73
    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    iput-object v4, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 78
    .line 79
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 80
    .line 81
    iput-object v4, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 82
    .line 83
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    iput v4, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapWidth:I

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iput p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapHeight:I

    .line 96
    .line 97
    int-to-float v4, v4

    .line 98
    int-to-float p1, p1

    .line 99
    invoke-virtual {v0, v2, v2, v4, p1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 100
    .line 101
    .line 102
    new-instance p1, Landroid/graphics/Paint;

    .line 103
    .line 104
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 108
    .line 109
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 115
    .line 116
    .line 117
    new-instance p1, Landroid/graphics/Paint;

    .line 118
    .line 119
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 120
    .line 121
    .line 122
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 123
    .line 124
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v0, v1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 143
    .line 144
    .line 145
    iget p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 146
    .line 147
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :array_0
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data
.end method

.method private static all([Z)Z
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_1

    .line 5
    .line 6
    aget-boolean v3, p0, v2

    .line 7
    .line 8
    if-eqz v3, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method private static any([Z)Z
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_1

    .line 5
    .line 6
    aget-boolean v3, p0, v2

    .line 7
    .line 8
    if-eqz v3, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    return v1
.end method

.method public static drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .locals 5

    .line 1
    instance-of v0, p0, Landroid/graphics/drawable/BitmapDrawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    :try_start_0
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 30
    .line 31
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Landroid/graphics/Canvas;

    .line 36
    .line 37
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/4 v4, 0x0

    .line 49
    invoke-virtual {p0, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    :catch_0
    move-exception p0

    .line 57
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 58
    .line 59
    .line 60
    const/4 p0, 0x0

    .line 61
    return-object p0
.end method

.method public static fromBitmap(Landroid/graphics/Bitmap;)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ltech/sud/gip/core/view/round/RoundedDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return-object p0
.end method

.method public static fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    instance-of v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    instance-of v0, p0, Landroid/graphics/drawable/LayerDrawable;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    check-cast p0, Landroid/graphics/drawable/LayerDrawable;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    :goto_0
    if-ge v1, v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-static {v2}, Ltech/sud/gip/core/view/round/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p0, v3, v2}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 34
    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-object p0

    .line 40
    :cond_2
    invoke-static {p0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    new-instance p0, Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 47
    .line 48
    invoke-direct {p0, v0}, Ltech/sud/gip/core/view/round/RoundedDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    return-object p0
.end method

.method private static only(I[Z)Z
    .locals 5

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    const/4 v3, 0x1

    .line 5
    if-ge v2, v0, :cond_2

    .line 6
    .line 7
    aget-boolean v4, p1, v2

    .line 8
    .line 9
    if-ne v2, p0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    move v3, v1

    .line 13
    :goto_1
    if-eq v4, v3, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_2
    return v3
.end method

.method private redrawBitmapForSquareCorners(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 2
    .line 3
    invoke-static {v0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->all([Z)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    cmpl-float v0, v0, v1

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 19
    .line 20
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 21
    .line 22
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-float/2addr v0, v1

    .line 29
    iget-object v3, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    add-float/2addr v3, v2

    .line 36
    iget v4, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 37
    .line 38
    iget-object v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    aget-boolean v5, v5, v6

    .line 42
    .line 43
    if-nez v5, :cond_2

    .line 44
    .line 45
    iget-object v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mSquareCornersRect:Landroid/graphics/RectF;

    .line 46
    .line 47
    add-float v6, v1, v4

    .line 48
    .line 49
    add-float v7, v2, v4

    .line 50
    .line 51
    invoke-virtual {v5, v1, v2, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 52
    .line 53
    .line 54
    iget-object v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mSquareCornersRect:Landroid/graphics/RectF;

    .line 55
    .line 56
    iget-object v6, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 57
    .line 58
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 62
    .line 63
    const/4 v6, 0x1

    .line 64
    aget-boolean v5, v5, v6

    .line 65
    .line 66
    if-nez v5, :cond_3

    .line 67
    .line 68
    iget-object v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mSquareCornersRect:Landroid/graphics/RectF;

    .line 69
    .line 70
    sub-float v6, v0, v4

    .line 71
    .line 72
    invoke-virtual {v5, v6, v2, v0, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mSquareCornersRect:Landroid/graphics/RectF;

    .line 76
    .line 77
    iget-object v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-virtual {p1, v2, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 83
    .line 84
    const/4 v5, 0x2

    .line 85
    aget-boolean v2, v2, v5

    .line 86
    .line 87
    if-nez v2, :cond_4

    .line 88
    .line 89
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mSquareCornersRect:Landroid/graphics/RectF;

    .line 90
    .line 91
    sub-float v5, v0, v4

    .line 92
    .line 93
    sub-float v6, v3, v4

    .line 94
    .line 95
    invoke-virtual {v2, v5, v6, v0, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mSquareCornersRect:Landroid/graphics/RectF;

    .line 99
    .line 100
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 101
    .line 102
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 103
    .line 104
    .line 105
    :cond_4
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 106
    .line 107
    const/4 v2, 0x3

    .line 108
    aget-boolean v0, v0, v2

    .line 109
    .line 110
    if-nez v0, :cond_5

    .line 111
    .line 112
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mSquareCornersRect:Landroid/graphics/RectF;

    .line 113
    .line 114
    sub-float v2, v3, v4

    .line 115
    .line 116
    add-float/2addr v4, v1

    .line 117
    invoke-virtual {v0, v1, v2, v4, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mSquareCornersRect:Landroid/graphics/RectF;

    .line 121
    .line 122
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 123
    .line 124
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 125
    .line 126
    .line 127
    :cond_5
    :goto_0
    return-void
.end method

.method private redrawBorderForSquareCorners(Landroid/graphics/Canvas;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 4
    .line 5
    invoke-static {v1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->all([Z)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget v1, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    cmpl-float v1, v1, v2

    .line 17
    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    goto/16 :goto_2

    .line 21
    .line 22
    :cond_1
    iget-object v1, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 23
    .line 24
    iget v3, v1, Landroid/graphics/RectF;->left:F

    .line 25
    .line 26
    iget v6, v1, Landroid/graphics/RectF;->top:F

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    add-float/2addr v1, v3

    .line 33
    iget-object v2, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    add-float v13, v2, v6

    .line 40
    .line 41
    iget v14, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 42
    .line 43
    iget v2, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 44
    .line 45
    const/high16 v4, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float v15, v2, v4

    .line 48
    .line 49
    iget-object v2, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 50
    .line 51
    const/4 v4, 0x0

    .line 52
    aget-boolean v2, v2, v4

    .line 53
    .line 54
    if-nez v2, :cond_2

    .line 55
    .line 56
    sub-float v5, v3, v15

    .line 57
    .line 58
    add-float v7, v3, v14

    .line 59
    .line 60
    iget-object v9, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 61
    .line 62
    move v8, v6

    .line 63
    move-object/from16 v4, p1

    .line 64
    .line 65
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 66
    .line 67
    .line 68
    sub-float v4, v8, v15

    .line 69
    .line 70
    add-float v6, v8, v14

    .line 71
    .line 72
    iget-object v7, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 73
    .line 74
    move v5, v3

    .line 75
    move-object/from16 v2, p1

    .line 76
    .line 77
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    move v8, v6

    .line 82
    :goto_0
    iget-object v2, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 83
    .line 84
    const/4 v4, 0x1

    .line 85
    aget-boolean v2, v2, v4

    .line 86
    .line 87
    if-nez v2, :cond_3

    .line 88
    .line 89
    sub-float v2, v1, v14

    .line 90
    .line 91
    sub-float v5, v2, v15

    .line 92
    .line 93
    iget-object v9, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 94
    .line 95
    move v6, v8

    .line 96
    move-object/from16 v4, p1

    .line 97
    .line 98
    move v7, v1

    .line 99
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 100
    .line 101
    .line 102
    move v8, v7

    .line 103
    sub-float v9, v6, v15

    .line 104
    .line 105
    add-float v11, v6, v14

    .line 106
    .line 107
    iget-object v12, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 108
    .line 109
    move v10, v8

    .line 110
    move-object/from16 v7, p1

    .line 111
    .line 112
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 113
    .line 114
    .line 115
    move v1, v8

    .line 116
    :cond_3
    iget-object v2, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 117
    .line 118
    const/4 v4, 0x2

    .line 119
    aget-boolean v2, v2, v4

    .line 120
    .line 121
    if-nez v2, :cond_4

    .line 122
    .line 123
    sub-float v2, v1, v14

    .line 124
    .line 125
    sub-float v8, v2, v15

    .line 126
    .line 127
    add-float v10, v1, v15

    .line 128
    .line 129
    iget-object v12, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 130
    .line 131
    move v11, v13

    .line 132
    move-object/from16 v7, p1

    .line 133
    .line 134
    move v9, v13

    .line 135
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 136
    .line 137
    .line 138
    sub-float v13, v9, v14

    .line 139
    .line 140
    iget-object v12, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 141
    .line 142
    move v10, v1

    .line 143
    move v8, v1

    .line 144
    move v11, v9

    .line 145
    move v9, v13

    .line 146
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 147
    .line 148
    .line 149
    move v9, v11

    .line 150
    goto :goto_1

    .line 151
    :cond_4
    move v9, v13

    .line 152
    :goto_1
    iget-object v1, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 153
    .line 154
    const/4 v2, 0x3

    .line 155
    aget-boolean v1, v1, v2

    .line 156
    .line 157
    if-nez v1, :cond_5

    .line 158
    .line 159
    sub-float v8, v3, v15

    .line 160
    .line 161
    add-float v10, v3, v14

    .line 162
    .line 163
    iget-object v12, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 164
    .line 165
    move v11, v9

    .line 166
    move-object/from16 v7, p1

    .line 167
    .line 168
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 169
    .line 170
    .line 171
    sub-float v4, v9, v14

    .line 172
    .line 173
    iget-object v7, v0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 174
    .line 175
    move v5, v3

    .line 176
    move-object/from16 v2, p1

    .line 177
    .line 178
    move v6, v9

    .line 179
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 180
    .line 181
    .line 182
    :cond_5
    :goto_2
    return-void
.end method

.method private updateShaderMatrix()V
    .locals 7

    .line 1
    sget-object v0, Ltech/sud/gip/core/view/round/RoundedDrawable$1;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    .line 2
    .line 3
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    const/high16 v2, 0x40000000    # 2.0f

    .line 13
    .line 14
    const/high16 v3, 0x3f000000    # 0.5f

    .line 15
    .line 16
    if-eq v0, v1, :cond_7

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-eq v0, v1, :cond_5

    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    if-eq v0, v1, :cond_3

    .line 23
    .line 24
    const/4 v1, 0x5

    .line 25
    if-eq v0, v1, :cond_2

    .line 26
    .line 27
    const/4 v1, 0x6

    .line 28
    if-eq v0, v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 31
    .line 32
    const/4 v3, 0x7

    .line 33
    if-eq v0, v3, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 41
    .line 42
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 43
    .line 44
    iget-object v3, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 45
    .line 46
    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    .line 47
    .line 48
    invoke-virtual {v0, v1, v3, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 52
    .line 53
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 59
    .line 60
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 61
    .line 62
    div-float/2addr v1, v2

    .line 63
    invoke-virtual {v0, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 67
    .line 68
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 69
    .line 70
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 71
    .line 72
    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 73
    .line 74
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 75
    .line 76
    .line 77
    goto/16 :goto_2

    .line 78
    .line 79
    :cond_0
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 85
    .line 86
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 87
    .line 88
    div-float/2addr v1, v2

    .line 89
    invoke-virtual {v0, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 98
    .line 99
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 100
    .line 101
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 102
    .line 103
    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 104
    .line 105
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 106
    .line 107
    .line 108
    goto/16 :goto_2

    .line 109
    .line 110
    :cond_1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 111
    .line 112
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 118
    .line 119
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 120
    .line 121
    iget-object v3, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 122
    .line 123
    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    .line 124
    .line 125
    invoke-virtual {v0, v1, v3, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 129
    .line 130
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 136
    .line 137
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 138
    .line 139
    div-float/2addr v1, v2

    .line 140
    invoke-virtual {v0, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 144
    .line 145
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 146
    .line 147
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 148
    .line 149
    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 150
    .line 151
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 152
    .line 153
    .line 154
    goto/16 :goto_2

    .line 155
    .line 156
    :cond_2
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 157
    .line 158
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 164
    .line 165
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 166
    .line 167
    iget-object v3, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 168
    .line 169
    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    .line 170
    .line 171
    invoke-virtual {v0, v1, v3, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 175
    .line 176
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 182
    .line 183
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 184
    .line 185
    div-float/2addr v1, v2

    .line 186
    invoke-virtual {v0, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 190
    .line 191
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 192
    .line 193
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 194
    .line 195
    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 196
    .line 197
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 198
    .line 199
    .line 200
    goto/16 :goto_2

    .line 201
    .line 202
    :cond_3
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 203
    .line 204
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 205
    .line 206
    .line 207
    iget v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapWidth:I

    .line 208
    .line 209
    int-to-float v0, v0

    .line 210
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 211
    .line 212
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    cmpg-float v0, v0, v1

    .line 217
    .line 218
    if-gtz v0, :cond_4

    .line 219
    .line 220
    iget v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapHeight:I

    .line 221
    .line 222
    int-to-float v0, v0

    .line 223
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 224
    .line 225
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    cmpg-float v0, v0, v1

    .line 230
    .line 231
    if-gtz v0, :cond_4

    .line 232
    .line 233
    const/high16 v0, 0x3f800000    # 1.0f

    .line 234
    .line 235
    goto :goto_0

    .line 236
    :cond_4
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 237
    .line 238
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapWidth:I

    .line 243
    .line 244
    int-to-float v1, v1

    .line 245
    div-float/2addr v0, v1

    .line 246
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 247
    .line 248
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    iget v4, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapHeight:I

    .line 253
    .line 254
    int-to-float v4, v4

    .line 255
    div-float/2addr v1, v4

    .line 256
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    :goto_0
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 261
    .line 262
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    iget v4, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapWidth:I

    .line 267
    .line 268
    int-to-float v4, v4

    .line 269
    mul-float/2addr v4, v0

    .line 270
    sub-float/2addr v1, v4

    .line 271
    mul-float/2addr v1, v3

    .line 272
    add-float/2addr v1, v3

    .line 273
    float-to-int v1, v1

    .line 274
    int-to-float v1, v1

    .line 275
    iget-object v4, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 276
    .line 277
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 278
    .line 279
    .line 280
    move-result v4

    .line 281
    iget v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapHeight:I

    .line 282
    .line 283
    int-to-float v5, v5

    .line 284
    mul-float/2addr v5, v0

    .line 285
    sub-float/2addr v4, v5

    .line 286
    mul-float/2addr v4, v3

    .line 287
    add-float/2addr v4, v3

    .line 288
    float-to-int v3, v4

    .line 289
    int-to-float v3, v3

    .line 290
    iget-object v4, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 291
    .line 292
    invoke-virtual {v4, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 296
    .line 297
    invoke-virtual {v0, v1, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 298
    .line 299
    .line 300
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 301
    .line 302
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 303
    .line 304
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 305
    .line 306
    .line 307
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 308
    .line 309
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 310
    .line 311
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 312
    .line 313
    .line 314
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 315
    .line 316
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 317
    .line 318
    div-float/2addr v1, v2

    .line 319
    invoke-virtual {v0, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 320
    .line 321
    .line 322
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 323
    .line 324
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 325
    .line 326
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 327
    .line 328
    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 329
    .line 330
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 331
    .line 332
    .line 333
    goto/16 :goto_2

    .line 334
    .line 335
    :cond_5
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 336
    .line 337
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 338
    .line 339
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 340
    .line 341
    .line 342
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 343
    .line 344
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 345
    .line 346
    div-float/2addr v1, v2

    .line 347
    invoke-virtual {v0, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 348
    .line 349
    .line 350
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 351
    .line 352
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 353
    .line 354
    .line 355
    iget v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapWidth:I

    .line 356
    .line 357
    int-to-float v0, v0

    .line 358
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 359
    .line 360
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 361
    .line 362
    .line 363
    move-result v1

    .line 364
    mul-float/2addr v1, v0

    .line 365
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 366
    .line 367
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 368
    .line 369
    .line 370
    move-result v0

    .line 371
    iget v4, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapHeight:I

    .line 372
    .line 373
    int-to-float v4, v4

    .line 374
    mul-float/2addr v0, v4

    .line 375
    cmpl-float v0, v1, v0

    .line 376
    .line 377
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 378
    .line 379
    const/4 v4, 0x0

    .line 380
    if-lez v0, :cond_6

    .line 381
    .line 382
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 383
    .line 384
    .line 385
    move-result v0

    .line 386
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapHeight:I

    .line 387
    .line 388
    int-to-float v1, v1

    .line 389
    div-float/2addr v0, v1

    .line 390
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 391
    .line 392
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 393
    .line 394
    .line 395
    move-result v1

    .line 396
    iget v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapWidth:I

    .line 397
    .line 398
    int-to-float v5, v5

    .line 399
    mul-float/2addr v5, v0

    .line 400
    sub-float/2addr v1, v5

    .line 401
    mul-float/2addr v1, v3

    .line 402
    move v6, v4

    .line 403
    move v4, v1

    .line 404
    move v1, v6

    .line 405
    goto :goto_1

    .line 406
    :cond_6
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 407
    .line 408
    .line 409
    move-result v0

    .line 410
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapWidth:I

    .line 411
    .line 412
    int-to-float v1, v1

    .line 413
    div-float/2addr v0, v1

    .line 414
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 415
    .line 416
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 417
    .line 418
    .line 419
    move-result v1

    .line 420
    iget v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapHeight:I

    .line 421
    .line 422
    int-to-float v5, v5

    .line 423
    mul-float/2addr v5, v0

    .line 424
    sub-float/2addr v1, v5

    .line 425
    mul-float/2addr v1, v3

    .line 426
    :goto_1
    iget-object v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 427
    .line 428
    invoke-virtual {v5, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 429
    .line 430
    .line 431
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 432
    .line 433
    add-float/2addr v4, v3

    .line 434
    float-to-int v4, v4

    .line 435
    int-to-float v4, v4

    .line 436
    iget v5, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 437
    .line 438
    div-float/2addr v5, v2

    .line 439
    add-float/2addr v4, v5

    .line 440
    add-float/2addr v1, v3

    .line 441
    float-to-int v1, v1

    .line 442
    int-to-float v1, v1

    .line 443
    add-float/2addr v5, v1

    .line 444
    invoke-virtual {v0, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 445
    .line 446
    .line 447
    goto :goto_2

    .line 448
    :cond_7
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 449
    .line 450
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 451
    .line 452
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 453
    .line 454
    .line 455
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 456
    .line 457
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 458
    .line 459
    div-float/2addr v1, v2

    .line 460
    invoke-virtual {v0, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 461
    .line 462
    .line 463
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 464
    .line 465
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 466
    .line 467
    .line 468
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 469
    .line 470
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 471
    .line 472
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 473
    .line 474
    .line 475
    move-result v1

    .line 476
    iget v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapWidth:I

    .line 477
    .line 478
    int-to-float v2, v2

    .line 479
    sub-float/2addr v1, v2

    .line 480
    mul-float/2addr v1, v3

    .line 481
    add-float/2addr v1, v3

    .line 482
    float-to-int v1, v1

    .line 483
    int-to-float v1, v1

    .line 484
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 485
    .line 486
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 487
    .line 488
    .line 489
    move-result v2

    .line 490
    iget v4, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapHeight:I

    .line 491
    .line 492
    int-to-float v4, v4

    .line 493
    sub-float/2addr v2, v4

    .line 494
    mul-float/2addr v2, v3

    .line 495
    add-float/2addr v2, v3

    .line 496
    float-to-int v2, v2

    .line 497
    int-to-float v2, v2

    .line 498
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 499
    .line 500
    .line 501
    :goto_2
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 502
    .line 503
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 504
    .line 505
    invoke-virtual {v0, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 506
    .line 507
    .line 508
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mRebuildShader:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/BitmapShader;

    .line 6
    .line 7
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 10
    .line 11
    iget-object v3, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 17
    .line 18
    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 19
    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 23
    .line 24
    if-ne v1, v2, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput-boolean v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mRebuildShader:Z

    .line 38
    .line 39
    :cond_1
    iget-boolean v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mOval:Z

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    iget v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 45
    .line 46
    cmpl-float v0, v0, v1

    .line 47
    .line 48
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 49
    .line 50
    if-lez v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 58
    .line 59
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {p1, v1, p0}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 72
    .line 73
    invoke-static {v0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->any([Z)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_5

    .line 78
    .line 79
    iget v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 80
    .line 81
    iget v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 82
    .line 83
    cmpl-float v1, v2, v1

    .line 84
    .line 85
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 86
    .line 87
    if-lez v1, :cond_4

    .line 88
    .line 89
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 90
    .line 91
    invoke-virtual {p1, v2, v0, v0, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 95
    .line 96
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 97
    .line 98
    invoke-virtual {p1, v1, v0, v0, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 99
    .line 100
    .line 101
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->redrawBitmapForSquareCorners(Landroid/graphics/Canvas;)V

    .line 102
    .line 103
    .line 104
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->redrawBorderForSquareCorners(Landroid/graphics/Canvas;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_4
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 109
    .line 110
    invoke-virtual {p1, v2, v0, v0, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 111
    .line 112
    .line 113
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->redrawBitmapForSquareCorners(Landroid/graphics/Canvas;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_5
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 118
    .line 119
    iget-object v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 120
    .line 121
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 122
    .line 123
    .line 124
    iget v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 125
    .line 126
    cmpl-float v0, v0, v1

    .line 127
    .line 128
    if-lez v0, :cond_6

    .line 129
    .line 130
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 131
    .line 132
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 133
    .line 134
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 135
    .line 136
    .line 137
    :cond_6
    return-void
.end method

.method public getAlpha()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Paint;->getAlpha()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getBorderColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getBorderColors()Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBorderWidth()F
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 2
    .line 3
    return p0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getCornerRadius()F
    .locals 0

    .line 12
    iget p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    return p0
.end method

.method public getCornerRadius(I)F
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 2
    .line 3
    aget-boolean p1, v0, p1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getOpacity()I
    .locals 0

    const/4 p0, -0x3

    return p0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourceBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTileModeX()Landroid/graphics/Shader$TileMode;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTileModeY()Landroid/graphics/Shader$TileMode;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public isOval()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mOval:Z

    .line 2
    .line 3
    return p0
.end method

.method public isStateful()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->isStateful()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->updateShaderMatrix()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onStateChange([I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p1, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/graphics/Paint;->getColor()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eq v1, v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onStateChange([I)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setBorderColor(I)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 0

    .line 27
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setBorderColor(Landroid/content/res/ColorStateList;)Ltech/sud/gip/core/view/round/RoundedDrawable;

    move-result-object p0

    return-object p0
.end method

.method public setBorderColor(Landroid/content/res/ColorStateList;)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const/4 p1, 0x0

    .line 5
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 10
    .line 11
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/high16 v2, -0x1000000

    .line 18
    .line 19
    invoke-virtual {p1, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public setBorderWidth(F)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 1

    .line 1
    iget v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderWidth:F

    .line 8
    .line 9
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->updateShaderMatrix()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-object p0
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setCornerRadius(F)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 0

    .line 153
    invoke-virtual {p0, p1, p1, p1, p1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setCornerRadius(FFFF)Ltech/sud/gip/core/view/round/RoundedDrawable;

    return-object p0
.end method

.method public setCornerRadius(FFFF)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 5

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/4 v3, 0x0

    .line 48
    const/4 v4, 0x1

    .line 49
    if-gt v2, v4, :cond_6

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/lang/Float;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-static {v0}, Ljava/lang/Float;->isInfinite(F)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-nez v2, :cond_0

    .line 76
    .line 77
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-nez v2, :cond_0

    .line 82
    .line 83
    cmpg-float v2, v0, v1

    .line 84
    .line 85
    if-ltz v2, :cond_0

    .line 86
    .line 87
    iput v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    const-string p0, "Invalid radius value: "

    .line 91
    .line 92
    invoke-static {p0, v0}, Ll/hnd0;->a(Ljava/lang/String;F)V

    .line 93
    .line 94
    .line 95
    return-object v3

    .line 96
    :cond_1
    iput v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 97
    .line 98
    :goto_0
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    .line 99
    .line 100
    cmpl-float p1, p1, v1

    .line 101
    .line 102
    const/4 v2, 0x0

    .line 103
    if-lez p1, :cond_2

    .line 104
    .line 105
    move p1, v4

    .line 106
    goto :goto_1

    .line 107
    :cond_2
    move p1, v2

    .line 108
    :goto_1
    aput-boolean p1, v0, v2

    .line 109
    .line 110
    cmpl-float p1, p2, v1

    .line 111
    .line 112
    if-lez p1, :cond_3

    .line 113
    .line 114
    move p1, v4

    .line 115
    goto :goto_2

    .line 116
    :cond_3
    move p1, v2

    .line 117
    :goto_2
    aput-boolean p1, v0, v4

    .line 118
    .line 119
    cmpl-float p1, p3, v1

    .line 120
    .line 121
    if-lez p1, :cond_4

    .line 122
    .line 123
    move p1, v4

    .line 124
    goto :goto_3

    .line 125
    :cond_4
    move p1, v2

    .line 126
    :goto_3
    const/4 p2, 0x2

    .line 127
    aput-boolean p1, v0, p2

    .line 128
    .line 129
    cmpl-float p1, p4, v1

    .line 130
    .line 131
    if-lez p1, :cond_5

    .line 132
    .line 133
    goto :goto_4

    .line 134
    :cond_5
    move v4, v2

    .line 135
    :goto_4
    const/4 p1, 0x3

    .line 136
    aput-boolean v4, v0, p1

    .line 137
    .line 138
    return-object p0

    .line 139
    :cond_6
    const-string p0, "Multiple nonzero corner radii not yet supported."

    .line 140
    .line 141
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-object v3
.end method

.method public setCornerRadius(IF)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 4

    const/4 v0, 0x0

    cmpl-float v1, p2, v0

    if-eqz v1, :cond_1

    .line 145
    iget v2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    cmpl-float v3, v2, v0

    if-eqz v3, :cond_1

    cmpl-float v2, v2, p2

    if-nez v2, :cond_0

    goto :goto_0

    .line 146
    :cond_0
    const-string p0, "Multiple nonzero corner radii not yet supported."

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_1
    :goto_0
    if-nez v1, :cond_3

    .line 147
    iget-object p2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    invoke-static {p1, p2}, Ltech/sud/gip/core/view/round/RoundedDrawable;->only(I[Z)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 148
    iput v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 149
    :cond_2
    iget-object p2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    const/4 v0, 0x0

    aput-boolean v0, p2, p1

    return-object p0

    .line 150
    :cond_3
    iget v1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    cmpl-float v0, v1, v0

    if-nez v0, :cond_4

    .line 151
    iput p2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornerRadius:F

    .line 152
    :cond_4
    iget-object p2, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mCornersRounded:[Z

    const/4 v0, 0x1

    aput-boolean v0, p2, p1

    return-object p0
.end method

.method public setDither(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFilterBitmap(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOval(Z)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mOval:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 6
    .line 7
    if-eq v0, p1, :cond_1

    .line 8
    .line 9
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 10
    .line 11
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->updateShaderMatrix()V

    .line 12
    .line 13
    .line 14
    :cond_1
    return-object p0
.end method

.method public setTileModeX(Landroid/graphics/Shader$TileMode;)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mRebuildShader:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-object p0
.end method

.method public setTileModeY(Landroid/graphics/Shader$TileMode;)Ltech/sud/gip/core/view/round/RoundedDrawable;
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/RoundedDrawable;->mRebuildShader:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-object p0
.end method

.method public toBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-static {p0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
