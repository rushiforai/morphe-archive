.class public Lcom/idv/identity/face/ui/widget/CircleHoleView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "SourceFile"


# static fields
.field private static final m:Landroid/graphics/Xfermode;


# instance fields
.field private c:Landroid/graphics/Bitmap;

.field private d:Landroid/graphics/Paint;

.field private e:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field private j:Z

.field private k:Z

.field private l:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->XOR:Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->m:Landroid/graphics/Xfermode;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    const/high16 p1, -0x40800000    # -1.0f

    .line 30
    iput p1, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->f:F

    .line 31
    iput p1, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->g:F

    .line 32
    iput p1, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h:F

    .line 33
    iput p1, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->i:F

    const/4 p1, 0x0

    .line 34
    iput-boolean p1, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->j:Z

    .line 35
    iput-boolean p1, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->k:Z

    const/4 p1, -0x1

    .line 36
    iput p1, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->l:I

    .line 37
    invoke-direct {p0}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->f:F

    .line 7
    .line 8
    iput v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->g:F

    .line 9
    .line 10
    iput v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h:F

    .line 11
    .line 12
    iput v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->i:F

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->j:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->k:Z

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    iput v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->l:I

    .line 21
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->g(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p3, -0x40800000    # -1.0f

    .line 39
    iput p3, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->f:F

    .line 40
    iput p3, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->g:F

    .line 41
    iput p3, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h:F

    .line 42
    iput p3, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->i:F

    const/4 p3, 0x0

    .line 43
    iput-boolean p3, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->j:Z

    .line 44
    iput-boolean p3, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->k:Z

    const/4 p3, -0x1

    .line 45
    iput p3, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->l:I

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->g(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    invoke-direct {p0}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h()V

    return-void
.end method

.method private g(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget-object v0, Ll/dhc0;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p2, Ll/dhc0;->d:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    iput p2, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->f:F

    .line 17
    .line 18
    sget p2, Ll/dhc0;->e:I

    .line 19
    .line 20
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iput p2, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->g:F

    .line 25
    .line 26
    sget p2, Ll/dhc0;->g:I

    .line 27
    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput p2, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h:F

    .line 33
    .line 34
    sget p2, Ll/dhc0;->c:I

    .line 35
    .line 36
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iput p2, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->i:F

    .line 41
    .line 42
    sget p2, Ll/dhc0;->b:I

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput-boolean p2, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->j:Z

    .line 50
    .line 51
    sget p2, Ll/dhc0;->f:I

    .line 52
    .line 53
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput-boolean p2, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->k:Z

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method private h()V
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
    iput-object v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d:Landroid/graphics/Paint;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public d(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->l:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()Landroid/graphics/Bitmap;
    .locals 12

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-lez v0, :cond_8

    .line 11
    .line 12
    if-gtz v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_3

    .line 15
    .line 16
    :cond_0
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 17
    .line 18
    :try_start_0
    invoke-static {v0, v1, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    new-instance v1, Landroid/graphics/Canvas;

    .line 23
    .line 24
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Landroid/graphics/Paint;

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 34
    .line 35
    .line 36
    const/4 v3, -0x1

    .line 37
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    int-to-float v3, v3

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    int-to-float v4, v4

    .line 50
    iget v5, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->f:F

    .line 51
    .line 52
    const/high16 v6, -0x40800000    # -1.0f

    .line 53
    .line 54
    cmpl-float v7, v5, v6

    .line 55
    .line 56
    const/4 v8, 0x0

    .line 57
    if-lez v7, :cond_1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    move v5, v8

    .line 61
    :goto_0
    iget-boolean v7, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->j:Z

    .line 62
    .line 63
    const/high16 v9, 0x40000000    # 2.0f

    .line 64
    .line 65
    if-eqz v7, :cond_2

    .line 66
    .line 67
    div-float v5, v3, v9

    .line 68
    .line 69
    iget v7, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h:F

    .line 70
    .line 71
    div-float/2addr v7, v9

    .line 72
    sub-float/2addr v5, v7

    .line 73
    cmpg-float v7, v5, v8

    .line 74
    .line 75
    if-gez v7, :cond_2

    .line 76
    .line 77
    move v5, v8

    .line 78
    :cond_2
    sub-float v7, v4, v3

    .line 79
    .line 80
    div-float/2addr v7, v9

    .line 81
    iget v10, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->g:F

    .line 82
    .line 83
    cmpl-float v11, v10, v6

    .line 84
    .line 85
    if-lez v11, :cond_3

    .line 86
    .line 87
    move v7, v10

    .line 88
    :cond_3
    iget-boolean v10, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->k:Z

    .line 89
    .line 90
    if-eqz v10, :cond_5

    .line 91
    .line 92
    div-float/2addr v4, v9

    .line 93
    iget v7, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->i:F

    .line 94
    .line 95
    div-float/2addr v7, v9

    .line 96
    sub-float/2addr v4, v7

    .line 97
    cmpg-float v7, v4, v8

    .line 98
    .line 99
    if-gez v7, :cond_4

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_4
    move v8, v4

    .line 103
    goto :goto_1

    .line 104
    :cond_5
    move v8, v7

    .line 105
    :goto_1
    iget v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h:F

    .line 106
    .line 107
    cmpl-float v7, v4, v6

    .line 108
    .line 109
    if-lez v7, :cond_6

    .line 110
    .line 111
    add-float/2addr v4, v5

    .line 112
    goto :goto_2

    .line 113
    :cond_6
    move v4, v3

    .line 114
    :goto_2
    add-float/2addr v3, v8

    .line 115
    iget p0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->i:F

    .line 116
    .line 117
    cmpl-float v6, p0, v6

    .line 118
    .line 119
    if-lez v6, :cond_7

    .line 120
    .line 121
    add-float v3, v8, p0

    .line 122
    .line 123
    :cond_7
    new-instance p0, Landroid/graphics/RectF;

    .line 124
    .line 125
    invoke-direct {p0, v5, v8, v4, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, p0, v2}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 129
    .line 130
    .line 131
    return-object v0

    .line 132
    :catch_0
    move-exception p0

    .line 133
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    :cond_8
    :goto_3
    return-object v2
.end method

.method public invalidate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->e:Ljava/lang/ref/WeakReference;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->c:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-super {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_7

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-float v4, v0

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v5, v0

    .line 17
    const/4 v6, 0x0

    .line 18
    const/16 v7, 0x1f

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x0

    .line 22
    move-object v1, p1

    .line 23
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    :try_start_0
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->e:Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Landroid/graphics/Bitmap;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    move-object p0, v0

    .line 41
    goto/16 :goto_5

    .line 42
    .line 43
    :catch_0
    move-exception v0

    .line 44
    move-object p0, v0

    .line 45
    goto/16 :goto_3

    .line 46
    .line 47
    :cond_0
    move-object v0, v2

    .line 48
    :goto_0
    const/4 v3, 0x0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_5

    .line 56
    .line 57
    :cond_1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    .line 60
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    if-eqz v4, :cond_5

    .line 62
    .line 63
    :try_start_1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 72
    .line 73
    invoke-static {v0, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 74
    .line 75
    .line 76
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    :try_start_2
    new-instance v5, Landroid/graphics/Canvas;

    .line 78
    .line 79
    invoke-direct {v5, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 87
    .line 88
    .line 89
    move-result v7

    .line 90
    const/4 v8, 0x0

    .line 91
    invoke-virtual {v4, v8, v8, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 95
    .line 96
    .line 97
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->c:Landroid/graphics/Bitmap;

    .line 98
    .line 99
    if-eqz v4, :cond_2

    .line 100
    .line 101
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    if-eqz v4, :cond_3

    .line 106
    .line 107
    :cond_2
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->f()Landroid/graphics/Bitmap;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    iput-object v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->c:Landroid/graphics/Bitmap;

    .line 112
    .line 113
    :cond_3
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->c:Landroid/graphics/Bitmap;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 114
    .line 115
    if-nez v4, :cond_4

    .line 116
    .line 117
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_4
    :try_start_3
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d:Landroid/graphics/Paint;

    .line 122
    .line 123
    invoke-virtual {v4}, Landroid/graphics/Paint;->reset()V

    .line 124
    .line 125
    .line 126
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d:Landroid/graphics/Paint;

    .line 127
    .line 128
    invoke-virtual {v4, v8}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 129
    .line 130
    .line 131
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d:Landroid/graphics/Paint;

    .line 132
    .line 133
    sget-object v6, Lcom/idv/identity/face/ui/widget/CircleHoleView;->m:Landroid/graphics/Xfermode;

    .line 134
    .line 135
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 136
    .line 137
    .line 138
    iget v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->l:I

    .line 139
    .line 140
    invoke-virtual {v5, v4}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 141
    .line 142
    .line 143
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->c:Landroid/graphics/Bitmap;

    .line 144
    .line 145
    iget-object v6, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d:Landroid/graphics/Paint;

    .line 146
    .line 147
    invoke-virtual {v5, v4, v3, v3, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 148
    .line 149
    .line 150
    new-instance v4, Ljava/lang/ref/WeakReference;

    .line 151
    .line 152
    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    iput-object v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->e:Ljava/lang/ref/WeakReference;

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :catch_1
    move-exception v0

    .line 159
    move-object p0, v0

    .line 160
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 165
    .line 166
    .line 167
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 168
    .line 169
    .line 170
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_5
    :goto_1
    if-eqz v0, :cond_6

    .line 175
    .line 176
    :try_start_4
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d:Landroid/graphics/Paint;

    .line 177
    .line 178
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 179
    .line 180
    .line 181
    iget-object p0, p0, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d:Landroid/graphics/Paint;

    .line 182
    .line 183
    invoke-virtual {v1, v0, v3, v3, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :cond_6
    :goto_2
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 191
    .line 192
    .line 193
    goto :goto_4

    .line 194
    :goto_3
    :try_start_5
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 199
    .line 200
    .line 201
    goto :goto_2

    .line 202
    :goto_4
    return-void

    .line 203
    :goto_5
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 204
    .line 205
    .line 206
    throw p0

    .line 207
    :cond_7
    move-object v1, p1

    .line 208
    invoke-super {p0, v1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 209
    .line 210
    .line 211
    return-void
.end method
