.class public Ll/ind0;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/RectF;

.field public final b:Landroid/graphics/RectF;

.field public final c:Landroid/graphics/RectF;

.field public final d:Landroid/graphics/Bitmap;

.field public final e:Landroid/graphics/Paint;

.field public final f:I

.field public final g:I

.field public final h:Landroid/graphics/RectF;

.field public final i:Landroid/graphics/Paint;

.field public final j:Landroid/graphics/Matrix;

.field public final k:Landroid/graphics/RectF;

.field public l:Landroid/graphics/Shader$TileMode;

.field public m:Landroid/graphics/Shader$TileMode;

.field public n:Z

.field public o:F

.field public final p:[Z

.field public q:Z

.field public r:F

.field public s:Landroid/content/res/ColorStateList;

.field public t:Landroid/widget/ImageView$ScaleType;


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
    iput-object v0, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ind0;->b:Landroid/graphics/RectF;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 24
    .line 25
    new-instance v1, Landroid/graphics/RectF;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 31
    .line 32
    new-instance v1, Landroid/graphics/Matrix;

    .line 33
    .line 34
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 38
    .line 39
    new-instance v1, Landroid/graphics/RectF;

    .line 40
    .line 41
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Ll/ind0;->k:Landroid/graphics/RectF;

    .line 45
    .line 46
    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 47
    .line 48
    iput-object v1, p0, Ll/ind0;->l:Landroid/graphics/Shader$TileMode;

    .line 49
    .line 50
    iput-object v1, p0, Ll/ind0;->m:Landroid/graphics/Shader$TileMode;

    .line 51
    .line 52
    const/4 v1, 0x1

    .line 53
    iput-boolean v1, p0, Ll/ind0;->n:Z

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    iput v2, p0, Ll/ind0;->o:F

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
    iput-object v3, p0, Ll/ind0;->p:[Z

    .line 65
    .line 66
    const/4 v3, 0x0

    .line 67
    iput-boolean v3, p0, Ll/ind0;->q:Z

    .line 68
    .line 69
    iput v2, p0, Ll/ind0;->r:F

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
    iput-object v4, p0, Ll/ind0;->s:Landroid/content/res/ColorStateList;

    .line 78
    .line 79
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 80
    .line 81
    iput-object v4, p0, Ll/ind0;->t:Landroid/widget/ImageView$ScaleType;

    .line 82
    .line 83
    iput-object p1, p0, Ll/ind0;->d:Landroid/graphics/Bitmap;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    iput v4, p0, Ll/ind0;->f:I

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iput p1, p0, Ll/ind0;->g:I

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
    iput-object p1, p0, Ll/ind0;->e:Landroid/graphics/Paint;

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
    iput-object p1, p0, Ll/ind0;->i:Landroid/graphics/Paint;

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
    iget-object v0, p0, Ll/ind0;->s:Landroid/content/res/ColorStateList;

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
    iget p0, p0, Ll/ind0;->r:F

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

.method public static a([Z)Z
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

.method public static b([Z)Z
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

.method public static c(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
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
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    :catchall_0
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

.method public static d(Landroid/graphics/Bitmap;)Ll/ind0;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/ind0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/ind0;-><init>(Landroid/graphics/Bitmap;)V

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

.method public static e(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    instance-of v0, p0, Ll/ind0;

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
    if-eqz v0, :cond_3

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_1
    check-cast p0, Landroid/graphics/drawable/LayerDrawable;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x0

    .line 33
    :goto_0
    if-ge v1, v0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-static {v2}, Ll/ind0;->e(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {p0, v3, v2}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 48
    .line 49
    .line 50
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    return-object p0

    .line 54
    :cond_3
    invoke-static {p0}, Ll/ind0;->c(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    new-instance p0, Ll/ind0;

    .line 61
    .line 62
    invoke-direct {p0, v0}, Ll/ind0;-><init>(Landroid/graphics/Bitmap;)V

    .line 63
    .line 64
    .line 65
    :cond_4
    return-object p0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 4
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Ll/ind0;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/BitmapShader;

    .line 6
    .line 7
    iget-object v1, p0, Ll/ind0;->d:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    iget-object v2, p0, Ll/ind0;->l:Landroid/graphics/Shader$TileMode;

    .line 10
    .line 11
    iget-object v3, p0, Ll/ind0;->m:Landroid/graphics/Shader$TileMode;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/ind0;->l:Landroid/graphics/Shader$TileMode;

    .line 17
    .line 18
    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 19
    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Ll/ind0;->m:Landroid/graphics/Shader$TileMode;

    .line 23
    .line 24
    if-ne v1, v2, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v1, p0, Ll/ind0;->e:Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput-boolean v0, p0, Ll/ind0;->n:Z

    .line 38
    .line 39
    :cond_1
    iget-boolean v0, p0, Ll/ind0;->q:Z

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    iget v0, p0, Ll/ind0;->r:F

    .line 45
    .line 46
    cmpl-float v0, v0, v1

    .line 47
    .line 48
    iget-object v1, p0, Ll/ind0;->b:Landroid/graphics/RectF;

    .line 49
    .line 50
    if-lez v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Ll/ind0;->e:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 58
    .line 59
    iget-object p0, p0, Ll/ind0;->i:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    iget-object p0, p0, Ll/ind0;->e:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {p1, v1, p0}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    iget-object v0, p0, Ll/ind0;->p:[Z

    .line 72
    .line 73
    invoke-static {v0}, Ll/ind0;->b([Z)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_5

    .line 78
    .line 79
    iget v0, p0, Ll/ind0;->o:F

    .line 80
    .line 81
    iget v2, p0, Ll/ind0;->r:F

    .line 82
    .line 83
    cmpl-float v1, v2, v1

    .line 84
    .line 85
    iget-object v2, p0, Ll/ind0;->b:Landroid/graphics/RectF;

    .line 86
    .line 87
    if-lez v1, :cond_4

    .line 88
    .line 89
    iget-object v1, p0, Ll/ind0;->e:Landroid/graphics/Paint;

    .line 90
    .line 91
    invoke-virtual {p1, v2, v0, v0, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 95
    .line 96
    iget-object v2, p0, Ll/ind0;->i:Landroid/graphics/Paint;

    .line 97
    .line 98
    invoke-virtual {p1, v1, v0, v0, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p1}, Ll/ind0;->f(Landroid/graphics/Canvas;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ll/ind0;->g(Landroid/graphics/Canvas;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_4
    iget-object v1, p0, Ll/ind0;->e:Landroid/graphics/Paint;

    .line 109
    .line 110
    invoke-virtual {p1, v2, v0, v0, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, p1}, Ll/ind0;->f(Landroid/graphics/Canvas;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_5
    iget-object v0, p0, Ll/ind0;->b:Landroid/graphics/RectF;

    .line 118
    .line 119
    iget-object v2, p0, Ll/ind0;->e:Landroid/graphics/Paint;

    .line 120
    .line 121
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 122
    .line 123
    .line 124
    iget v0, p0, Ll/ind0;->r:F

    .line 125
    .line 126
    cmpl-float v0, v0, v1

    .line 127
    .line 128
    if-lez v0, :cond_6

    .line 129
    .line 130
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 131
    .line 132
    iget-object p0, p0, Ll/ind0;->i:Landroid/graphics/Paint;

    .line 133
    .line 134
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 135
    .line 136
    .line 137
    :cond_6
    return-void
.end method

.method public final f(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ind0;->p:[Z

    .line 2
    .line 3
    invoke-static {v0}, Ll/ind0;->a([Z)Z

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
    iget v0, p0, Ll/ind0;->o:F

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
    iget-object v0, p0, Ll/ind0;->b:Landroid/graphics/RectF;

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
    iget-object v3, p0, Ll/ind0;->b:Landroid/graphics/RectF;

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
    iget v4, p0, Ll/ind0;->o:F

    .line 37
    .line 38
    iget-object v5, p0, Ll/ind0;->p:[Z

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
    iget-object v5, p0, Ll/ind0;->k:Landroid/graphics/RectF;

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
    iget-object v5, p0, Ll/ind0;->k:Landroid/graphics/RectF;

    .line 55
    .line 56
    iget-object v6, p0, Ll/ind0;->e:Landroid/graphics/Paint;

    .line 57
    .line 58
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object v5, p0, Ll/ind0;->p:[Z

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
    iget-object v5, p0, Ll/ind0;->k:Landroid/graphics/RectF;

    .line 69
    .line 70
    sub-float v6, v0, v4

    .line 71
    .line 72
    invoke-virtual {v5, v6, v2, v0, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/ind0;->k:Landroid/graphics/RectF;

    .line 76
    .line 77
    iget-object v5, p0, Ll/ind0;->e:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-virtual {p1, v2, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    iget-object v2, p0, Ll/ind0;->p:[Z

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
    iget-object v2, p0, Ll/ind0;->k:Landroid/graphics/RectF;

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
    iget-object v0, p0, Ll/ind0;->k:Landroid/graphics/RectF;

    .line 99
    .line 100
    iget-object v2, p0, Ll/ind0;->e:Landroid/graphics/Paint;

    .line 101
    .line 102
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 103
    .line 104
    .line 105
    :cond_4
    iget-object v0, p0, Ll/ind0;->p:[Z

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
    iget-object v0, p0, Ll/ind0;->k:Landroid/graphics/RectF;

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
    iget-object v0, p0, Ll/ind0;->k:Landroid/graphics/RectF;

    .line 121
    .line 122
    iget-object p0, p0, Ll/ind0;->e:Landroid/graphics/Paint;

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

.method public final g(Landroid/graphics/Canvas;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/ind0;->p:[Z

    .line 4
    .line 5
    invoke-static {v1}, Ll/ind0;->a([Z)Z

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
    iget v1, v0, Ll/ind0;->o:F

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
    iget-object v1, v0, Ll/ind0;->b:Landroid/graphics/RectF;

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
    iget-object v2, v0, Ll/ind0;->b:Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    add-float v13, v6, v2

    .line 40
    .line 41
    iget v14, v0, Ll/ind0;->o:F

    .line 42
    .line 43
    iget v2, v0, Ll/ind0;->r:F

    .line 44
    .line 45
    const/high16 v4, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float v15, v2, v4

    .line 48
    .line 49
    iget-object v2, v0, Ll/ind0;->p:[Z

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
    iget-object v9, v0, Ll/ind0;->i:Landroid/graphics/Paint;

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
    iget-object v7, v0, Ll/ind0;->i:Landroid/graphics/Paint;

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
    iget-object v2, v0, Ll/ind0;->p:[Z

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
    iget-object v9, v0, Ll/ind0;->i:Landroid/graphics/Paint;

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
    iget-object v12, v0, Ll/ind0;->i:Landroid/graphics/Paint;

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
    iget-object v2, v0, Ll/ind0;->p:[Z

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
    iget-object v12, v0, Ll/ind0;->i:Landroid/graphics/Paint;

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
    iget-object v12, v0, Ll/ind0;->i:Landroid/graphics/Paint;

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
    iget-object v1, v0, Ll/ind0;->p:[Z

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
    iget-object v12, v0, Ll/ind0;->i:Landroid/graphics/Paint;

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
    iget-object v7, v0, Ll/ind0;->i:Landroid/graphics/Paint;

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

.method public getAlpha()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ind0;->e:Landroid/graphics/Paint;

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

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ind0;->e:Landroid/graphics/Paint;

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

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ind0;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ind0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public h(Landroid/content/res/ColorStateList;)Ll/ind0;
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
    iput-object p1, p0, Ll/ind0;->s:Landroid/content/res/ColorStateList;

    .line 10
    .line 11
    iget-object v0, p0, Ll/ind0;->i:Landroid/graphics/Paint;

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

.method public i(F)Ll/ind0;
    .locals 1

    .line 1
    iput p1, p0, Ll/ind0;->r:F

    .line 2
    .line 3
    iget-object v0, p0, Ll/ind0;->i:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public isStateful()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ind0;->s:Landroid/content/res/ColorStateList;

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

.method public j(FFFF)Ll/ind0;
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
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

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
    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Set;->size()I

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
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

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
    iput v0, p0, Ll/ind0;->o:F

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
    iput v1, p0, Ll/ind0;->o:F

    .line 97
    .line 98
    :goto_0
    iget-object v0, p0, Ll/ind0;->p:[Z

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

.method public k(Z)Ll/ind0;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ind0;->q:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Landroid/widget/ImageView$ScaleType;)Ll/ind0;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Ll/ind0;->t:Landroid/widget/ImageView$ScaleType;

    .line 6
    .line 7
    if-eq v0, p1, :cond_1

    .line 8
    .line 9
    iput-object p1, p0, Ll/ind0;->t:Landroid/widget/ImageView$ScaleType;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ind0;->o()V

    .line 12
    .line 13
    .line 14
    :cond_1
    return-object p0
.end method

.method public m(Landroid/graphics/Shader$TileMode;)Ll/ind0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ind0;->l:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/ind0;->l:Landroid/graphics/Shader$TileMode;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/ind0;->n:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-object p0
.end method

.method public n(Landroid/graphics/Shader$TileMode;)Ll/ind0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ind0;->m:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/ind0;->m:Landroid/graphics/Shader$TileMode;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/ind0;->n:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-object p0
.end method

.method public final o()V
    .locals 9

    .line 1
    sget-object v0, Ll/ind0$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Ll/ind0;->t:Landroid/widget/ImageView$ScaleType;

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
    const/high16 v1, 0x3f000000    # 0.5f

    .line 12
    .line 13
    const/high16 v2, 0x40000000    # 2.0f

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    if-eq v0, v3, :cond_7

    .line 17
    .line 18
    const/4 v4, 0x2

    .line 19
    if-eq v0, v4, :cond_5

    .line 20
    .line 21
    const/4 v4, 0x3

    .line 22
    if-eq v0, v4, :cond_3

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
    iget-object v1, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 31
    .line 32
    const/4 v4, 0x7

    .line 33
    if-eq v0, v4, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 41
    .line 42
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 43
    .line 44
    iget-object v4, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 45
    .line 46
    sget-object v5, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    .line 47
    .line 48
    invoke-virtual {v0, v1, v4, v5}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 52
    .line 53
    iget-object v1, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 59
    .line 60
    iget v1, p0, Ll/ind0;->r:F

    .line 61
    .line 62
    div-float v4, v1, v2

    .line 63
    .line 64
    div-float/2addr v1, v2

    .line 65
    invoke-virtual {v0, v4, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 69
    .line 70
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 71
    .line 72
    iget-object v2, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 73
    .line 74
    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 75
    .line 76
    invoke-virtual {v0, v1, v2, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 77
    .line 78
    .line 79
    goto/16 :goto_2

    .line 80
    .line 81
    :cond_0
    iget-object v0, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 87
    .line 88
    iget v1, p0, Ll/ind0;->r:F

    .line 89
    .line 90
    div-float v4, v1, v2

    .line 91
    .line 92
    div-float/2addr v1, v2

    .line 93
    invoke-virtual {v0, v4, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 102
    .line 103
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 104
    .line 105
    iget-object v2, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 106
    .line 107
    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 108
    .line 109
    invoke-virtual {v0, v1, v2, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 110
    .line 111
    .line 112
    goto/16 :goto_2

    .line 113
    .line 114
    :cond_1
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 115
    .line 116
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 122
    .line 123
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 124
    .line 125
    iget-object v4, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 126
    .line 127
    sget-object v5, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    .line 128
    .line 129
    invoke-virtual {v0, v1, v4, v5}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 133
    .line 134
    iget-object v1, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 140
    .line 141
    iget v1, p0, Ll/ind0;->r:F

    .line 142
    .line 143
    div-float v4, v1, v2

    .line 144
    .line 145
    div-float/2addr v1, v2

    .line 146
    invoke-virtual {v0, v4, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 150
    .line 151
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 152
    .line 153
    iget-object v2, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 154
    .line 155
    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 156
    .line 157
    invoke-virtual {v0, v1, v2, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 158
    .line 159
    .line 160
    goto/16 :goto_2

    .line 161
    .line 162
    :cond_2
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 163
    .line 164
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 170
    .line 171
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 172
    .line 173
    iget-object v4, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 174
    .line 175
    sget-object v5, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    .line 176
    .line 177
    invoke-virtual {v0, v1, v4, v5}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 181
    .line 182
    iget-object v1, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 188
    .line 189
    iget v1, p0, Ll/ind0;->r:F

    .line 190
    .line 191
    div-float v4, v1, v2

    .line 192
    .line 193
    div-float/2addr v1, v2

    .line 194
    invoke-virtual {v0, v4, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 198
    .line 199
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 200
    .line 201
    iget-object v2, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 202
    .line 203
    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 204
    .line 205
    invoke-virtual {v0, v1, v2, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 206
    .line 207
    .line 208
    goto/16 :goto_2

    .line 209
    .line 210
    :cond_3
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 211
    .line 212
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 213
    .line 214
    .line 215
    iget v0, p0, Ll/ind0;->f:I

    .line 216
    .line 217
    int-to-float v0, v0

    .line 218
    iget-object v4, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 219
    .line 220
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    cmpg-float v0, v0, v4

    .line 225
    .line 226
    if-gtz v0, :cond_4

    .line 227
    .line 228
    iget v0, p0, Ll/ind0;->g:I

    .line 229
    .line 230
    int-to-float v0, v0

    .line 231
    iget-object v4, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 232
    .line 233
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 234
    .line 235
    .line 236
    move-result v4

    .line 237
    cmpg-float v0, v0, v4

    .line 238
    .line 239
    if-gtz v0, :cond_4

    .line 240
    .line 241
    const/high16 v0, 0x3f800000    # 1.0f

    .line 242
    .line 243
    goto :goto_0

    .line 244
    :cond_4
    iget-object v0, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 245
    .line 246
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    iget v4, p0, Ll/ind0;->f:I

    .line 251
    .line 252
    int-to-float v4, v4

    .line 253
    div-float/2addr v0, v4

    .line 254
    iget-object v4, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 255
    .line 256
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 257
    .line 258
    .line 259
    move-result v4

    .line 260
    iget v5, p0, Ll/ind0;->g:I

    .line 261
    .line 262
    int-to-float v5, v5

    .line 263
    div-float/2addr v4, v5

    .line 264
    invoke-static {v0, v4}, Ljava/lang/Math;->min(FF)F

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    :goto_0
    iget-object v4, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 269
    .line 270
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 271
    .line 272
    .line 273
    move-result v4

    .line 274
    iget v5, p0, Ll/ind0;->f:I

    .line 275
    .line 276
    int-to-float v5, v5

    .line 277
    mul-float/2addr v5, v0

    .line 278
    sub-float/2addr v4, v5

    .line 279
    mul-float/2addr v4, v1

    .line 280
    add-float/2addr v4, v1

    .line 281
    float-to-int v4, v4

    .line 282
    int-to-float v4, v4

    .line 283
    iget-object v5, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 284
    .line 285
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 286
    .line 287
    .line 288
    move-result v5

    .line 289
    iget v6, p0, Ll/ind0;->g:I

    .line 290
    .line 291
    int-to-float v6, v6

    .line 292
    mul-float/2addr v6, v0

    .line 293
    sub-float/2addr v5, v6

    .line 294
    mul-float/2addr v5, v1

    .line 295
    add-float/2addr v5, v1

    .line 296
    float-to-int v1, v5

    .line 297
    int-to-float v1, v1

    .line 298
    iget-object v5, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 299
    .line 300
    invoke-virtual {v5, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 301
    .line 302
    .line 303
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 304
    .line 305
    invoke-virtual {v0, v4, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 306
    .line 307
    .line 308
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 309
    .line 310
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 311
    .line 312
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 313
    .line 314
    .line 315
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 316
    .line 317
    iget-object v1, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 318
    .line 319
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 320
    .line 321
    .line 322
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 323
    .line 324
    iget v1, p0, Ll/ind0;->r:F

    .line 325
    .line 326
    div-float v4, v1, v2

    .line 327
    .line 328
    div-float/2addr v1, v2

    .line 329
    invoke-virtual {v0, v4, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 330
    .line 331
    .line 332
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 333
    .line 334
    iget-object v1, p0, Ll/ind0;->c:Landroid/graphics/RectF;

    .line 335
    .line 336
    iget-object v2, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 337
    .line 338
    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 339
    .line 340
    invoke-virtual {v0, v1, v2, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 341
    .line 342
    .line 343
    goto/16 :goto_2

    .line 344
    .line 345
    :cond_5
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 346
    .line 347
    iget-object v4, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 348
    .line 349
    invoke-virtual {v0, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 350
    .line 351
    .line 352
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 353
    .line 354
    iget v4, p0, Ll/ind0;->r:F

    .line 355
    .line 356
    div-float v5, v4, v2

    .line 357
    .line 358
    div-float/2addr v4, v2

    .line 359
    invoke-virtual {v0, v5, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 360
    .line 361
    .line 362
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 363
    .line 364
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 365
    .line 366
    .line 367
    iget v0, p0, Ll/ind0;->f:I

    .line 368
    .line 369
    int-to-float v0, v0

    .line 370
    iget-object v4, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 371
    .line 372
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 373
    .line 374
    .line 375
    move-result v4

    .line 376
    mul-float/2addr v0, v4

    .line 377
    iget-object v4, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 378
    .line 379
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 380
    .line 381
    .line 382
    move-result v4

    .line 383
    iget v5, p0, Ll/ind0;->g:I

    .line 384
    .line 385
    int-to-float v5, v5

    .line 386
    mul-float/2addr v4, v5

    .line 387
    cmpl-float v0, v0, v4

    .line 388
    .line 389
    iget-object v4, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 390
    .line 391
    const/4 v5, 0x0

    .line 392
    if-lez v0, :cond_6

    .line 393
    .line 394
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    iget v4, p0, Ll/ind0;->g:I

    .line 399
    .line 400
    int-to-float v4, v4

    .line 401
    div-float/2addr v0, v4

    .line 402
    iget-object v4, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 403
    .line 404
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 405
    .line 406
    .line 407
    move-result v4

    .line 408
    iget v6, p0, Ll/ind0;->f:I

    .line 409
    .line 410
    int-to-float v6, v6

    .line 411
    mul-float/2addr v6, v0

    .line 412
    sub-float/2addr v4, v6

    .line 413
    mul-float/2addr v4, v1

    .line 414
    move v8, v5

    .line 415
    move v5, v4

    .line 416
    move v4, v8

    .line 417
    goto :goto_1

    .line 418
    :cond_6
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 419
    .line 420
    .line 421
    move-result v0

    .line 422
    iget v4, p0, Ll/ind0;->f:I

    .line 423
    .line 424
    int-to-float v4, v4

    .line 425
    div-float/2addr v0, v4

    .line 426
    iget-object v4, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 427
    .line 428
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 429
    .line 430
    .line 431
    move-result v4

    .line 432
    iget v6, p0, Ll/ind0;->g:I

    .line 433
    .line 434
    int-to-float v6, v6

    .line 435
    mul-float/2addr v6, v0

    .line 436
    sub-float/2addr v4, v6

    .line 437
    mul-float/2addr v4, v1

    .line 438
    :goto_1
    iget-object v6, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 439
    .line 440
    invoke-virtual {v6, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 441
    .line 442
    .line 443
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 444
    .line 445
    add-float/2addr v5, v1

    .line 446
    float-to-int v5, v5

    .line 447
    int-to-float v5, v5

    .line 448
    iget v6, p0, Ll/ind0;->r:F

    .line 449
    .line 450
    div-float v7, v6, v2

    .line 451
    .line 452
    add-float/2addr v5, v7

    .line 453
    add-float/2addr v4, v1

    .line 454
    float-to-int v1, v4

    .line 455
    int-to-float v1, v1

    .line 456
    div-float/2addr v6, v2

    .line 457
    add-float/2addr v1, v6

    .line 458
    invoke-virtual {v0, v5, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 459
    .line 460
    .line 461
    goto :goto_2

    .line 462
    :cond_7
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 463
    .line 464
    iget-object v4, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 465
    .line 466
    invoke-virtual {v0, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 467
    .line 468
    .line 469
    iget-object v0, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 470
    .line 471
    iget v4, p0, Ll/ind0;->r:F

    .line 472
    .line 473
    div-float v5, v4, v2

    .line 474
    .line 475
    div-float/2addr v4, v2

    .line 476
    invoke-virtual {v0, v5, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 477
    .line 478
    .line 479
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 480
    .line 481
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 482
    .line 483
    .line 484
    iget-object v0, p0, Ll/ind0;->j:Landroid/graphics/Matrix;

    .line 485
    .line 486
    iget-object v2, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 487
    .line 488
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 489
    .line 490
    .line 491
    move-result v2

    .line 492
    iget v4, p0, Ll/ind0;->f:I

    .line 493
    .line 494
    int-to-float v4, v4

    .line 495
    sub-float/2addr v2, v4

    .line 496
    mul-float/2addr v2, v1

    .line 497
    add-float/2addr v2, v1

    .line 498
    float-to-int v2, v2

    .line 499
    int-to-float v2, v2

    .line 500
    iget-object v4, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 501
    .line 502
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 503
    .line 504
    .line 505
    move-result v4

    .line 506
    iget v5, p0, Ll/ind0;->g:I

    .line 507
    .line 508
    int-to-float v5, v5

    .line 509
    sub-float/2addr v4, v5

    .line 510
    mul-float/2addr v4, v1

    .line 511
    add-float/2addr v4, v1

    .line 512
    float-to-int v1, v4

    .line 513
    int-to-float v1, v1

    .line 514
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 515
    .line 516
    .line 517
    :goto_2
    iget-object v0, p0, Ll/ind0;->b:Landroid/graphics/RectF;

    .line 518
    .line 519
    iget-object v1, p0, Ll/ind0;->h:Landroid/graphics/RectF;

    .line 520
    .line 521
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 522
    .line 523
    .line 524
    iput-boolean v3, p0, Ll/ind0;->n:Z

    .line 525
    .line 526
    return-void
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ind0;->a:Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ind0;->o()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onStateChange([I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ind0;->s:Landroid/content/res/ColorStateList;

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
    iget-object v1, p0, Ll/ind0;->i:Landroid/graphics/Paint;

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
    iget-object p0, p0, Ll/ind0;->i:Landroid/graphics/Paint;

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
    iget-object v0, p0, Ll/ind0;->e:Landroid/graphics/Paint;

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

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ind0;->e:Landroid/graphics/Paint;

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

.method public setDither(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ind0;->e:Landroid/graphics/Paint;

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
    iget-object v0, p0, Ll/ind0;->e:Landroid/graphics/Paint;

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
