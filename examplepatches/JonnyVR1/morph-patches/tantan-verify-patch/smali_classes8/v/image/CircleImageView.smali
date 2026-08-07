.class public Lv/image/CircleImageView;
.super Landroid/widget/ImageView;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "AppCompatCustomView"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/image/CircleImageView$a;
    }
.end annotation


# static fields
.field public static final A:Landroid/graphics/Bitmap$Config;

.field public static final z:Landroid/widget/ImageView$ScaleType;


# instance fields
.field public final a:Landroid/graphics/RectF;

.field public final b:Landroid/graphics/RectF;

.field public final c:Landroid/graphics/RectF;

.field public final d:Landroid/graphics/Matrix;

.field public final e:Landroid/graphics/Paint;

.field public final f:Landroid/graphics/Paint;

.field public final g:Landroid/graphics/Paint;

.field public final h:Landroid/graphics/Paint;

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:Landroid/graphics/Bitmap;

.field public o:Landroid/graphics/BitmapShader;

.field public p:I

.field public q:I

.field public r:F

.field public s:F

.field public t:F

.field public u:Landroid/graphics/ColorFilter;

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    sput-object v0, Lv/image/CircleImageView;->z:Landroid/widget/ImageView$ScaleType;

    .line 4
    .line 5
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 6
    .line 7
    sput-object v0, Lv/image/CircleImageView;->A:Landroid/graphics/Bitmap$Config;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 160
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 161
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 162
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lv/image/CircleImageView;->b:Landroid/graphics/RectF;

    .line 163
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lv/image/CircleImageView;->c:Landroid/graphics/RectF;

    .line 164
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lv/image/CircleImageView;->d:Landroid/graphics/Matrix;

    .line 165
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lv/image/CircleImageView;->e:Landroid/graphics/Paint;

    .line 166
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lv/image/CircleImageView;->f:Landroid/graphics/Paint;

    .line 167
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lv/image/CircleImageView;->g:Landroid/graphics/Paint;

    .line 168
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lv/image/CircleImageView;->h:Landroid/graphics/Paint;

    const/high16 p1, -0x1000000

    .line 169
    iput p1, p0, Lv/image/CircleImageView;->i:I

    .line 170
    iput p1, p0, Lv/image/CircleImageView;->j:I

    const/4 p1, 0x0

    .line 171
    iput p1, p0, Lv/image/CircleImageView;->k:I

    .line 172
    iput p1, p0, Lv/image/CircleImageView;->l:I

    .line 173
    iput p1, p0, Lv/image/CircleImageView;->m:I

    .line 174
    invoke-virtual {p0}, Lv/image/CircleImageView;->f()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 159
    invoke-direct {p0, p1, p2, v0}, Lv/image/CircleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    iput-object v0, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lv/image/CircleImageView;->b:Landroid/graphics/RectF;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lv/image/CircleImageView;->c:Landroid/graphics/RectF;

    .line 24
    .line 25
    new-instance v0, Landroid/graphics/Matrix;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lv/image/CircleImageView;->d:Landroid/graphics/Matrix;

    .line 31
    .line 32
    new-instance v0, Landroid/graphics/Paint;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lv/image/CircleImageView;->e:Landroid/graphics/Paint;

    .line 38
    .line 39
    new-instance v0, Landroid/graphics/Paint;

    .line 40
    .line 41
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lv/image/CircleImageView;->f:Landroid/graphics/Paint;

    .line 45
    .line 46
    new-instance v0, Landroid/graphics/Paint;

    .line 47
    .line 48
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lv/image/CircleImageView;->g:Landroid/graphics/Paint;

    .line 52
    .line 53
    new-instance v0, Landroid/graphics/Paint;

    .line 54
    .line 55
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lv/image/CircleImageView;->h:Landroid/graphics/Paint;

    .line 59
    .line 60
    const/high16 v0, -0x1000000

    .line 61
    .line 62
    iput v0, p0, Lv/image/CircleImageView;->i:I

    .line 63
    .line 64
    iput v0, p0, Lv/image/CircleImageView;->j:I

    .line 65
    .line 66
    const/4 v1, 0x0

    .line 67
    iput v1, p0, Lv/image/CircleImageView;->k:I

    .line 68
    .line 69
    iput v1, p0, Lv/image/CircleImageView;->l:I

    .line 70
    .line 71
    iput v1, p0, Lv/image/CircleImageView;->m:I

    .line 72
    .line 73
    sget-object v2, Ll/hhc0;->C5:[I

    .line 74
    .line 75
    invoke-virtual {p1, p2, v2, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    sget p2, Ll/hhc0;->F5:I

    .line 80
    .line 81
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    iput p2, p0, Lv/image/CircleImageView;->k:I

    .line 86
    .line 87
    sget p2, Ll/hhc0;->J5:I

    .line 88
    .line 89
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    iput p2, p0, Lv/image/CircleImageView;->l:I

    .line 94
    .line 95
    sget p2, Ll/hhc0;->D5:I

    .line 96
    .line 97
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    iput p2, p0, Lv/image/CircleImageView;->i:I

    .line 102
    .line 103
    sget p2, Ll/hhc0;->I5:I

    .line 104
    .line 105
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    iput p2, p0, Lv/image/CircleImageView;->j:I

    .line 110
    .line 111
    sget p2, Ll/hhc0;->E5:I

    .line 112
    .line 113
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    iput-boolean p2, p0, Lv/image/CircleImageView;->x:Z

    .line 118
    .line 119
    sget p2, Ll/hhc0;->G5:I

    .line 120
    .line 121
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    if-eqz p2, :cond_0

    .line 126
    .line 127
    sget p2, Ll/hhc0;->G5:I

    .line 128
    .line 129
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    iput p2, p0, Lv/image/CircleImageView;->m:I

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_0
    sget p2, Ll/hhc0;->H5:I

    .line 137
    .line 138
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    if-eqz p2, :cond_1

    .line 143
    .line 144
    sget p2, Ll/hhc0;->H5:I

    .line 145
    .line 146
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    iput p2, p0, Lv/image/CircleImageView;->m:I

    .line 151
    .line 152
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Lv/image/CircleImageView;->f()V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public static bridge synthetic a(Lv/image/CircleImageView;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/image/CircleImageView;->b:Landroid/graphics/RectF;

    return-object p0
.end method


# virtual methods
.method public final b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/image/CircleImageView;->e:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget-object p0, p0, Lv/image/CircleImageView;->u:Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final c()Landroid/graphics/RectF;
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    sub-int/2addr v1, v2

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    sub-int/2addr v1, v2

    .line 29
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    int-to-float v3, v3

    .line 38
    sub-int/2addr v0, v2

    .line 39
    int-to-float v0, v0

    .line 40
    const/high16 v4, 0x40000000    # 2.0f

    .line 41
    .line 42
    div-float/2addr v0, v4

    .line 43
    add-float/2addr v3, v0

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    int-to-float p0, p0

    .line 49
    sub-int/2addr v1, v2

    .line 50
    int-to-float v0, v1

    .line 51
    div-float/2addr v0, v4

    .line 52
    add-float/2addr p0, v0

    .line 53
    new-instance v0, Landroid/graphics/RectF;

    .line 54
    .line 55
    int-to-float v1, v2

    .line 56
    add-float v2, v3, v1

    .line 57
    .line 58
    add-float/2addr v1, p0

    .line 59
    invoke-direct {v0, v3, p0, v2, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 60
    .line 61
    .line 62
    return-object v0
.end method

.method public final d(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    instance-of v0, p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_1
    :try_start_0
    instance-of v0, p1, Landroid/graphics/drawable/ColorDrawable;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    sget-object v0, Lv/image/CircleImageView;->A:Landroid/graphics/Bitmap$Config;

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    invoke-static {v1, v1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception p1

    .line 29
    goto :goto_1

    .line 30
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    sget-object v2, Lv/image/CircleImageView;->A:Landroid/graphics/Bitmap$Config;

    .line 39
    .line 40
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :goto_0
    new-instance v1, Landroid/graphics/Canvas;

    .line 45
    .line 46
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-virtual {p1, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    return-object v0

    .line 65
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 66
    .line 67
    .line 68
    return-object p0
.end method

.method public final e(FF)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lv/image/CircleImageView;->b:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sub-float/2addr p1, v0

    .line 8
    float-to-double v0, p1

    .line 9
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iget-object p1, p0, Lv/image/CircleImageView;->b:Landroid/graphics/RectF;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-float/2addr p2, p1

    .line 22
    float-to-double p1, p2

    .line 23
    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 24
    .line 25
    .line 26
    move-result-wide p1

    .line 27
    add-double/2addr v0, p1

    .line 28
    iget p0, p0, Lv/image/CircleImageView;->s:F

    .line 29
    .line 30
    float-to-double p0, p0

    .line 31
    invoke-static {p0, p1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 32
    .line 33
    .line 34
    move-result-wide p0

    .line 35
    cmpg-double p0, v0, p0

    .line 36
    .line 37
    if-gtz p0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public final f()V
    .locals 2

    .line 1
    sget-object v0, Lv/image/CircleImageView;->z:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    invoke-super {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lv/image/CircleImageView;->v:Z

    .line 8
    .line 9
    new-instance v0, Lv/image/CircleImageView$a;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, p0, v1}, Lv/image/CircleImageView$a;-><init>(Lv/image/CircleImageView;Ll/z45;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Lv/image/CircleImageView;->w:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lv/image/CircleImageView;->h()V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lv/image/CircleImageView;->w:Z

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lv/image/CircleImageView;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lv/image/CircleImageView;->n:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Lv/image/CircleImageView;->d(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lv/image/CircleImageView;->n:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    :goto_0
    invoke-virtual {p0}, Lv/image/CircleImageView;->h()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public getBorderColor()I
    .locals 0

    .line 1
    iget p0, p0, Lv/image/CircleImageView;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public getBorderWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lv/image/CircleImageView;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public getCircleBackgroundColor()I
    .locals 0

    .line 1
    iget p0, p0, Lv/image/CircleImageView;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/image/CircleImageView;->u:Landroid/graphics/ColorFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFillColor()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lv/image/CircleImageView;->getCircleBackgroundColor()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 0

    .line 1
    sget-object p0, Lv/image/CircleImageView;->z:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lv/image/CircleImageView;->v:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lv/image/CircleImageView;->w:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object v0, p0, Lv/image/CircleImageView;->n:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    new-instance v0, Landroid/graphics/BitmapShader;

    .line 31
    .line 32
    iget-object v2, p0, Lv/image/CircleImageView;->n:Landroid/graphics/Bitmap;

    .line 33
    .line 34
    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 35
    .line 36
    invoke-direct {v0, v2, v3, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lv/image/CircleImageView;->o:Landroid/graphics/BitmapShader;

    .line 40
    .line 41
    iget-object v0, p0, Lv/image/CircleImageView;->e:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lv/image/CircleImageView;->e:Landroid/graphics/Paint;

    .line 47
    .line 48
    iget-object v2, p0, Lv/image/CircleImageView;->o:Landroid/graphics/BitmapShader;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lv/image/CircleImageView;->f:Landroid/graphics/Paint;

    .line 54
    .line 55
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lv/image/CircleImageView;->f:Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lv/image/CircleImageView;->f:Landroid/graphics/Paint;

    .line 66
    .line 67
    iget v3, p0, Lv/image/CircleImageView;->i:I

    .line 68
    .line 69
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lv/image/CircleImageView;->f:Landroid/graphics/Paint;

    .line 73
    .line 74
    iget v3, p0, Lv/image/CircleImageView;->k:I

    .line 75
    .line 76
    int-to-float v3, v3

    .line 77
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lv/image/CircleImageView;->g:Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lv/image/CircleImageView;->g:Landroid/graphics/Paint;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lv/image/CircleImageView;->g:Landroid/graphics/Paint;

    .line 91
    .line 92
    iget v2, p0, Lv/image/CircleImageView;->j:I

    .line 93
    .line 94
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lv/image/CircleImageView;->g:Landroid/graphics/Paint;

    .line 98
    .line 99
    iget v2, p0, Lv/image/CircleImageView;->l:I

    .line 100
    .line 101
    int-to-float v2, v2

    .line 102
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lv/image/CircleImageView;->h:Landroid/graphics/Paint;

    .line 106
    .line 107
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 108
    .line 109
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lv/image/CircleImageView;->h:Landroid/graphics/Paint;

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lv/image/CircleImageView;->h:Landroid/graphics/Paint;

    .line 118
    .line 119
    iget v1, p0, Lv/image/CircleImageView;->m:I

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lv/image/CircleImageView;->n:Landroid/graphics/Bitmap;

    .line 125
    .line 126
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iput v0, p0, Lv/image/CircleImageView;->q:I

    .line 131
    .line 132
    iget-object v0, p0, Lv/image/CircleImageView;->n:Landroid/graphics/Bitmap;

    .line 133
    .line 134
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    iput v0, p0, Lv/image/CircleImageView;->p:I

    .line 139
    .line 140
    iget-object v0, p0, Lv/image/CircleImageView;->c:Landroid/graphics/RectF;

    .line 141
    .line 142
    invoke-virtual {p0}, Lv/image/CircleImageView;->c()Landroid/graphics/RectF;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lv/image/CircleImageView;->b:Landroid/graphics/RectF;

    .line 150
    .line 151
    iget-object v1, p0, Lv/image/CircleImageView;->c:Landroid/graphics/RectF;

    .line 152
    .line 153
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 154
    .line 155
    iget v3, p0, Lv/image/CircleImageView;->l:I

    .line 156
    .line 157
    int-to-float v4, v3

    .line 158
    add-float/2addr v2, v4

    .line 159
    iput v2, v0, Landroid/graphics/RectF;->left:F

    .line 160
    .line 161
    iget v2, v1, Landroid/graphics/RectF;->right:F

    .line 162
    .line 163
    int-to-float v4, v3

    .line 164
    sub-float/2addr v2, v4

    .line 165
    iput v2, v0, Landroid/graphics/RectF;->right:F

    .line 166
    .line 167
    iget v2, v1, Landroid/graphics/RectF;->top:F

    .line 168
    .line 169
    int-to-float v4, v3

    .line 170
    add-float/2addr v2, v4

    .line 171
    iput v2, v0, Landroid/graphics/RectF;->top:F

    .line 172
    .line 173
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 174
    .line 175
    int-to-float v2, v3

    .line 176
    sub-float/2addr v1, v2

    .line 177
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 178
    .line 179
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    iget v1, p0, Lv/image/CircleImageView;->k:I

    .line 184
    .line 185
    int-to-float v1, v1

    .line 186
    sub-float/2addr v0, v1

    .line 187
    const/high16 v1, 0x40000000    # 2.0f

    .line 188
    .line 189
    div-float/2addr v0, v1

    .line 190
    iget-object v2, p0, Lv/image/CircleImageView;->b:Landroid/graphics/RectF;

    .line 191
    .line 192
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    iget v3, p0, Lv/image/CircleImageView;->k:I

    .line 197
    .line 198
    int-to-float v3, v3

    .line 199
    sub-float/2addr v2, v3

    .line 200
    div-float/2addr v2, v1

    .line 201
    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    iput v0, p0, Lv/image/CircleImageView;->s:F

    .line 206
    .line 207
    iget-object v0, p0, Lv/image/CircleImageView;->c:Landroid/graphics/RectF;

    .line 208
    .line 209
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    iget v2, p0, Lv/image/CircleImageView;->l:I

    .line 214
    .line 215
    int-to-float v2, v2

    .line 216
    sub-float/2addr v0, v2

    .line 217
    div-float/2addr v0, v1

    .line 218
    iget-object v2, p0, Lv/image/CircleImageView;->c:Landroid/graphics/RectF;

    .line 219
    .line 220
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    iget v3, p0, Lv/image/CircleImageView;->l:I

    .line 225
    .line 226
    int-to-float v3, v3

    .line 227
    sub-float/2addr v2, v3

    .line 228
    div-float/2addr v2, v1

    .line 229
    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    iput v0, p0, Lv/image/CircleImageView;->t:F

    .line 234
    .line 235
    iget-object v0, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 236
    .line 237
    iget-object v2, p0, Lv/image/CircleImageView;->b:Landroid/graphics/RectF;

    .line 238
    .line 239
    invoke-virtual {v0, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 240
    .line 241
    .line 242
    iget-boolean v0, p0, Lv/image/CircleImageView;->x:Z

    .line 243
    .line 244
    if-nez v0, :cond_3

    .line 245
    .line 246
    iget v0, p0, Lv/image/CircleImageView;->k:I

    .line 247
    .line 248
    if-lez v0, :cond_3

    .line 249
    .line 250
    iget-object v2, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 251
    .line 252
    int-to-float v3, v0

    .line 253
    const/high16 v4, 0x3f800000    # 1.0f

    .line 254
    .line 255
    sub-float/2addr v3, v4

    .line 256
    int-to-float v0, v0

    .line 257
    sub-float/2addr v0, v4

    .line 258
    invoke-virtual {v2, v3, v0}, Landroid/graphics/RectF;->inset(FF)V

    .line 259
    .line 260
    .line 261
    :cond_3
    iget-object v0, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 262
    .line 263
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    div-float/2addr v0, v1

    .line 268
    iget-object v2, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 269
    .line 270
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    div-float/2addr v2, v1

    .line 275
    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    iput v0, p0, Lv/image/CircleImageView;->r:F

    .line 280
    .line 281
    invoke-virtual {p0}, Lv/image/CircleImageView;->b()V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0}, Lv/image/CircleImageView;->i()V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 288
    .line 289
    .line 290
    return-void
.end method

.method public final i()V
    .locals 7

    .line 1
    iget-object v0, p0, Lv/image/CircleImageView;->d:Landroid/graphics/Matrix;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Lv/image/CircleImageView;->p:I

    .line 8
    .line 9
    int-to-float v0, v0

    .line 10
    iget-object v1, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    mul-float/2addr v0, v1

    .line 17
    iget-object v1, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget v2, p0, Lv/image/CircleImageView;->q:I

    .line 24
    .line 25
    int-to-float v2, v2

    .line 26
    mul-float/2addr v1, v2

    .line 27
    cmpl-float v0, v0, v1

    .line 28
    .line 29
    iget-object v1, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 30
    .line 31
    const/high16 v2, 0x3f000000    # 0.5f

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    if-lez v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget v1, p0, Lv/image/CircleImageView;->q:I

    .line 41
    .line 42
    int-to-float v1, v1

    .line 43
    div-float/2addr v0, v1

    .line 44
    iget-object v1, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iget v4, p0, Lv/image/CircleImageView;->p:I

    .line 51
    .line 52
    int-to-float v4, v4

    .line 53
    mul-float/2addr v4, v0

    .line 54
    sub-float/2addr v1, v4

    .line 55
    mul-float/2addr v1, v2

    .line 56
    move v6, v3

    .line 57
    move v3, v1

    .line 58
    move v1, v6

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget v1, p0, Lv/image/CircleImageView;->p:I

    .line 65
    .line 66
    int-to-float v1, v1

    .line 67
    div-float/2addr v0, v1

    .line 68
    iget-object v1, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 69
    .line 70
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iget v4, p0, Lv/image/CircleImageView;->q:I

    .line 75
    .line 76
    int-to-float v4, v4

    .line 77
    mul-float/2addr v4, v0

    .line 78
    sub-float/2addr v1, v4

    .line 79
    mul-float/2addr v1, v2

    .line 80
    :goto_0
    iget-object v4, p0, Lv/image/CircleImageView;->d:Landroid/graphics/Matrix;

    .line 81
    .line 82
    invoke-virtual {v4, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lv/image/CircleImageView;->d:Landroid/graphics/Matrix;

    .line 86
    .line 87
    add-float/2addr v3, v2

    .line 88
    float-to-int v3, v3

    .line 89
    int-to-float v3, v3

    .line 90
    iget-object v4, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 91
    .line 92
    iget v5, v4, Landroid/graphics/RectF;->left:F

    .line 93
    .line 94
    add-float/2addr v3, v5

    .line 95
    add-float/2addr v1, v2

    .line 96
    float-to-int v1, v1

    .line 97
    int-to-float v1, v1

    .line 98
    iget v2, v4, Landroid/graphics/RectF;->top:F

    .line 99
    .line 100
    add-float/2addr v1, v2

    .line 101
    invoke-virtual {v0, v3, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lv/image/CircleImageView;->o:Landroid/graphics/BitmapShader;

    .line 105
    .line 106
    iget-object p0, p0, Lv/image/CircleImageView;->d:Landroid/graphics/Matrix;

    .line 107
    .line 108
    invoke-virtual {v0, p0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lv/image/CircleImageView;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lv/image/CircleImageView;->n:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    iget v0, p0, Lv/image/CircleImageView;->m:I

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget v2, p0, Lv/image/CircleImageView;->r:F

    .line 31
    .line 32
    iget-object v3, p0, Lv/image/CircleImageView;->h:Landroid/graphics/Paint;

    .line 33
    .line 34
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object v0, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v1, p0, Lv/image/CircleImageView;->a:Landroid/graphics/RectF;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget v2, p0, Lv/image/CircleImageView;->r:F

    .line 50
    .line 51
    iget-object v3, p0, Lv/image/CircleImageView;->e:Landroid/graphics/Paint;

    .line 52
    .line 53
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 54
    .line 55
    .line 56
    iget v0, p0, Lv/image/CircleImageView;->k:I

    .line 57
    .line 58
    if-lez v0, :cond_3

    .line 59
    .line 60
    iget-object v0, p0, Lv/image/CircleImageView;->b:Landroid/graphics/RectF;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget-object v1, p0, Lv/image/CircleImageView;->b:Landroid/graphics/RectF;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iget v2, p0, Lv/image/CircleImageView;->s:F

    .line 73
    .line 74
    iget-object v3, p0, Lv/image/CircleImageView;->f:Landroid/graphics/Paint;

    .line 75
    .line 76
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 77
    .line 78
    .line 79
    :cond_3
    iget v0, p0, Lv/image/CircleImageView;->l:I

    .line 80
    .line 81
    if-lez v0, :cond_4

    .line 82
    .line 83
    iget-object v0, p0, Lv/image/CircleImageView;->c:Landroid/graphics/RectF;

    .line 84
    .line 85
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iget-object v1, p0, Lv/image/CircleImageView;->c:Landroid/graphics/RectF;

    .line 90
    .line 91
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    iget v2, p0, Lv/image/CircleImageView;->t:F

    .line 96
    .line 97
    iget-object p0, p0, Lv/image/CircleImageView;->g:Landroid/graphics/Paint;

    .line 98
    .line 99
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 100
    .line 101
    .line 102
    :cond_4
    :goto_0
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/image/CircleImageView;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1}, Lv/image/CircleImageView;->e(FF)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public setAdjustViewBounds(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p0, "adjustViewBounds not supported."

    .line 5
    .line 6
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setBorderColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lv/image/CircleImageView;->i:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lv/image/CircleImageView;->i:I

    .line 7
    .line 8
    iget-object p1, p0, Lv/image/CircleImageView;->f:Landroid/graphics/Paint;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lv/image/CircleImageView;->f:Landroid/graphics/Paint;

    .line 15
    .line 16
    iget v0, p0, Lv/image/CircleImageView;->i:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setBorderColorResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Lv/image/CircleImageView;->setBorderColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setBorderOverlay(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lv/image/CircleImageView;->x:Z

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lv/image/CircleImageView;->x:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/image/CircleImageView;->h()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setBorderWidth(I)V
    .locals 1

    .line 1
    iget v0, p0, Lv/image/CircleImageView;->k:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lv/image/CircleImageView;->k:I

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/image/CircleImageView;->h()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setCircleBackgroundColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lv/image/CircleImageView;->m:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lv/image/CircleImageView;->m:I

    .line 7
    .line 8
    iget-object v0, p0, Lv/image/CircleImageView;->h:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setCircleBackgroundColorResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Lv/image/CircleImageView;->setCircleBackgroundColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/image/CircleImageView;->u:Landroid/graphics/ColorFilter;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lv/image/CircleImageView;->u:Landroid/graphics/ColorFilter;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/image/CircleImageView;->b()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setDisableCircularTransformation(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lv/image/CircleImageView;->y:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lv/image/CircleImageView;->y:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/image/CircleImageView;->g()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setFillColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lv/image/CircleImageView;->setCircleBackgroundColor(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setFillColorResource(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lv/image/CircleImageView;->setCircleBackgroundColorResource(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/image/CircleImageView;->g()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/image/CircleImageView;->g()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setImageResource(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/image/CircleImageView;->g()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/image/CircleImageView;->g()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setPadding(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/image/CircleImageView;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setPaddingRelative(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->setPaddingRelative(IIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/image/CircleImageView;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 0

    .line 1
    sget-object p0, Lv/image/CircleImageView;->z:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "ScaleType %s not supported."

    .line 7
    .line 8
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p0, p1}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setSecondaryBorderColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lv/image/CircleImageView;->j:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lv/image/CircleImageView;->j:I

    .line 7
    .line 8
    iget-object v0, p0, Lv/image/CircleImageView;->g:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setSecondaryBorderWidth(I)V
    .locals 1

    .line 1
    iget v0, p0, Lv/image/CircleImageView;->l:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lv/image/CircleImageView;->l:I

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/image/CircleImageView;->h()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
