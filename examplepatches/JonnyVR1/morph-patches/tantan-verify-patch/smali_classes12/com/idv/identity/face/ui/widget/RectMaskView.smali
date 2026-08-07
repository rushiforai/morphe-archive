.class public Lcom/idv/identity/face/ui/widget/RectMaskView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "SourceFile"


# static fields
.field private static final p:Landroid/graphics/Xfermode;


# instance fields
.field private c:Landroid/graphics/Bitmap;

.field private d:Landroid/graphics/Paint;

.field private e:Landroid/graphics/Paint;

.field private f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private g:F

.field private h:F

.field private i:F

.field private j:F

.field private k:Z

.field private l:Z

.field private m:I

.field private n:I

.field private o:I


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
    sput-object v0, Lcom/idv/identity/face/ui/widget/RectMaskView;->p:Landroid/graphics/Xfermode;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    const/high16 p1, -0x40800000    # -1.0f

    .line 37
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->g:F

    .line 38
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->h:F

    .line 39
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 40
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->k:Z

    .line 42
    iput-boolean p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->l:Z

    const/4 p1, -0x1

    .line 43
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->m:I

    const/4 p1, 0x5

    .line 44
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->n:I

    const/16 p1, 0x23

    .line 45
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->o:I

    .line 46
    invoke-direct {p0}, Lcom/idv/identity/face/ui/widget/RectMaskView;->g()V

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
    iput v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->g:F

    .line 7
    .line 8
    iput v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->h:F

    .line 9
    .line 10
    iput v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 11
    .line 12
    iput v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->k:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->l:Z

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    iput v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->m:I

    .line 21
    .line 22
    const/4 v0, 0x5

    .line 23
    iput v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->n:I

    .line 24
    .line 25
    const/16 v0, 0x23

    .line 26
    .line 27
    iput v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->o:I

    .line 28
    .line 29
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/face/ui/widget/RectMaskView;->f(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/idv/identity/face/ui/widget/RectMaskView;->g()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p3, -0x40800000    # -1.0f

    .line 48
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->g:F

    .line 49
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->h:F

    .line 50
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 51
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    const/4 p3, 0x0

    .line 52
    iput-boolean p3, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->k:Z

    .line 53
    iput-boolean p3, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->l:Z

    const/4 p3, -0x1

    .line 54
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->m:I

    const/4 p3, 0x5

    .line 55
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->n:I

    const/16 p3, 0x23

    .line 56
    iput p3, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->o:I

    .line 57
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/face/ui/widget/RectMaskView;->f(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    invoke-direct {p0}, Lcom/idv/identity/face/ui/widget/RectMaskView;->g()V

    return-void
.end method

.method private f(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    sget-object v0, Ll/dhc0;->y:[I

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
    sget p2, Ll/dhc0;->B:I

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
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->g:F

    .line 17
    .line 18
    sget p2, Ll/dhc0;->D:I

    .line 19
    .line 20
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->h:F

    .line 25
    .line 26
    sget p2, Ll/dhc0;->F:I

    .line 27
    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 33
    .line 34
    sget p2, Ll/dhc0;->A:I

    .line 35
    .line 36
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    .line 41
    .line 42
    sget p2, Ll/dhc0;->z:I

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput-boolean p2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->k:Z

    .line 50
    .line 51
    sget p2, Ll/dhc0;->E:I

    .line 52
    .line 53
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput-boolean p2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->l:Z

    .line 58
    .line 59
    sget p2, Ll/dhc0;->C:I

    .line 60
    .line 61
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    float-to-int p2, p2

    .line 66
    iput p2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->o:I

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method private g()V
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
    iput-object v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->d:Landroid/graphics/Paint;

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->e:Landroid/graphics/Paint;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public d()Landroid/graphics/Bitmap;
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
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Landroid/graphics/Canvas;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Landroid/graphics/Paint;

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 27
    .line 28
    .line 29
    const/4 v3, -0x1

    .line 30
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    int-to-float v3, v3

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    int-to-float v4, v4

    .line 43
    iget v5, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 44
    .line 45
    const/4 v6, 0x0

    .line 46
    cmpg-float v5, v5, v6

    .line 47
    .line 48
    if-gez v5, :cond_0

    .line 49
    .line 50
    iput v3, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 51
    .line 52
    :cond_0
    iget v5, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    .line 53
    .line 54
    cmpg-float v5, v5, v6

    .line 55
    .line 56
    if-gez v5, :cond_1

    .line 57
    .line 58
    iput v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    .line 59
    .line 60
    :cond_1
    iget v5, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->g:F

    .line 61
    .line 62
    const/high16 v7, -0x40800000    # -1.0f

    .line 63
    .line 64
    cmpl-float v8, v5, v7

    .line 65
    .line 66
    if-lez v8, :cond_2

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    move v5, v6

    .line 70
    :goto_0
    iget-boolean v8, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->k:Z

    .line 71
    .line 72
    const/high16 v9, 0x40000000    # 2.0f

    .line 73
    .line 74
    if-eqz v8, :cond_4

    .line 75
    .line 76
    div-float v5, v3, v9

    .line 77
    .line 78
    iget v8, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 79
    .line 80
    div-float/2addr v8, v9

    .line 81
    sub-float/2addr v5, v8

    .line 82
    cmpg-float v8, v5, v6

    .line 83
    .line 84
    if-gez v8, :cond_3

    .line 85
    .line 86
    move v5, v6

    .line 87
    :cond_3
    iput v5, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->g:F

    .line 88
    .line 89
    :cond_4
    sub-float v8, v4, v3

    .line 90
    .line 91
    div-float/2addr v8, v9

    .line 92
    iget v10, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->h:F

    .line 93
    .line 94
    cmpl-float v11, v10, v7

    .line 95
    .line 96
    if-lez v11, :cond_5

    .line 97
    .line 98
    move v8, v10

    .line 99
    :cond_5
    iget-boolean v10, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->l:Z

    .line 100
    .line 101
    if-eqz v10, :cond_7

    .line 102
    .line 103
    div-float/2addr v4, v9

    .line 104
    iget v8, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    .line 105
    .line 106
    div-float/2addr v8, v9

    .line 107
    sub-float/2addr v4, v8

    .line 108
    cmpg-float v8, v4, v6

    .line 109
    .line 110
    if-gez v8, :cond_6

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_6
    move v6, v4

    .line 114
    :goto_1
    iput v6, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->h:F

    .line 115
    .line 116
    move v8, v6

    .line 117
    :cond_7
    iget v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 118
    .line 119
    cmpl-float v6, v4, v7

    .line 120
    .line 121
    if-lez v6, :cond_8

    .line 122
    .line 123
    add-float/2addr v4, v5

    .line 124
    goto :goto_2

    .line 125
    :cond_8
    move v4, v3

    .line 126
    :goto_2
    add-float/2addr v3, v8

    .line 127
    iget v6, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    .line 128
    .line 129
    cmpl-float v7, v6, v7

    .line 130
    .line 131
    if-lez v7, :cond_9

    .line 132
    .line 133
    add-float v3, v8, v6

    .line 134
    .line 135
    :cond_9
    new-instance v6, Landroid/graphics/RectF;

    .line 136
    .line 137
    invoke-direct {v6, v5, v8, v4, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 138
    .line 139
    .line 140
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->o:I

    .line 141
    .line 142
    int-to-float v3, p0

    .line 143
    int-to-float p0, p0

    .line 144
    invoke-virtual {v1, v6, v3, p0, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 145
    .line 146
    .line 147
    return-object v0
.end method

.method public getRectColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getRectHeigth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    .line 2
    .line 3
    return p0
.end method

.method public getRectLeft()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public getRectRoundCx()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public getRectTop()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public getRectWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public getStrokeWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public invalidate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->f:Ljava/lang/ref/WeakReference;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->c:Landroid/graphics/Bitmap;

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
    if-nez v0, :cond_9

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
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->f:Ljava/lang/ref/WeakReference;

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
    goto/16 :goto_3

    .line 42
    .line 43
    :cond_0
    move-object v0, v2

    .line 44
    :goto_0
    const/4 v3, 0x0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eqz v4, :cond_4

    .line 52
    .line 53
    :cond_1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    .line 56
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    if-eqz v4, :cond_4

    .line 58
    .line 59
    :try_start_1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 68
    .line 69
    invoke-static {v0, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 70
    .line 71
    .line 72
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    :try_start_2
    new-instance v5, Landroid/graphics/Canvas;

    .line 74
    .line 75
    invoke-direct {v5, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    const/4 v8, 0x0

    .line 87
    invoke-virtual {v4, v8, v8, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 91
    .line 92
    .line 93
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->c:Landroid/graphics/Bitmap;

    .line 94
    .line 95
    if-eqz v4, :cond_2

    .line 96
    .line 97
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-eqz v4, :cond_3

    .line 102
    .line 103
    :cond_2
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/RectMaskView;->d()Landroid/graphics/Bitmap;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    iput-object v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->c:Landroid/graphics/Bitmap;

    .line 108
    .line 109
    :cond_3
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->d:Landroid/graphics/Paint;

    .line 110
    .line 111
    invoke-virtual {v4}, Landroid/graphics/Paint;->reset()V

    .line 112
    .line 113
    .line 114
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->d:Landroid/graphics/Paint;

    .line 115
    .line 116
    invoke-virtual {v4, v8}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 117
    .line 118
    .line 119
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->d:Landroid/graphics/Paint;

    .line 120
    .line 121
    sget-object v6, Lcom/idv/identity/face/ui/widget/RectMaskView;->p:Landroid/graphics/Xfermode;

    .line 122
    .line 123
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 124
    .line 125
    .line 126
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->c:Landroid/graphics/Bitmap;

    .line 127
    .line 128
    iget-object v6, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->d:Landroid/graphics/Paint;

    .line 129
    .line 130
    invoke-virtual {v5, v4, v3, v3, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 131
    .line 132
    .line 133
    new-instance v4, Ljava/lang/ref/WeakReference;

    .line 134
    .line 135
    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    iput-object v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->f:Ljava/lang/ref/WeakReference;

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :catch_0
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_4
    :goto_1
    if-eqz v0, :cond_8

    .line 149
    .line 150
    :try_start_3
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->d:Landroid/graphics/Paint;

    .line 151
    .line 152
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 153
    .line 154
    .line 155
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->d:Landroid/graphics/Paint;

    .line 156
    .line 157
    invoke-virtual {v1, v0, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 158
    .line 159
    .line 160
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->m:I

    .line 161
    .line 162
    const/4 v2, -0x1

    .line 163
    if-eq v2, v0, :cond_7

    .line 164
    .line 165
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->h:F

    .line 166
    .line 167
    cmpg-float v2, v0, v3

    .line 168
    .line 169
    if-gez v2, :cond_5

    .line 170
    .line 171
    move v0, v3

    .line 172
    :cond_5
    iget v2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->g:F

    .line 173
    .line 174
    cmpg-float v4, v2, v3

    .line 175
    .line 176
    if-gez v4, :cond_6

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_6
    move v3, v2

    .line 180
    :goto_2
    iget v2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 181
    .line 182
    iget v4, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    .line 183
    .line 184
    new-instance v5, Landroid/graphics/RectF;

    .line 185
    .line 186
    add-float/2addr v2, v3

    .line 187
    add-float/2addr v4, v0

    .line 188
    invoke-direct {v5, v3, v0, v2, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->e:Landroid/graphics/Paint;

    .line 192
    .line 193
    iget v2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->m:I

    .line 194
    .line 195
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 196
    .line 197
    .line 198
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->e:Landroid/graphics/Paint;

    .line 199
    .line 200
    iget v2, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->n:I

    .line 201
    .line 202
    int-to-float v2, v2

    .line 203
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->e:Landroid/graphics/Paint;

    .line 207
    .line 208
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 209
    .line 210
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 211
    .line 212
    .line 213
    iget v0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->o:I

    .line 214
    .line 215
    int-to-float v2, v0

    .line 216
    int-to-float v0, v0

    .line 217
    iget-object p0, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->e:Landroid/graphics/Paint;

    .line 218
    .line 219
    invoke-virtual {v1, v5, v2, v0, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 220
    .line 221
    .line 222
    :cond_7
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 223
    .line 224
    .line 225
    return-void

    .line 226
    :catch_1
    :cond_8
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 227
    .line 228
    .line 229
    goto :goto_4

    .line 230
    :goto_3
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 231
    .line 232
    .line 233
    throw p0

    .line 234
    :goto_4
    return-void

    .line 235
    :cond_9
    move-object v1, p1

    .line 236
    invoke-super {p0, v1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public setRectColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public setRectHeight(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->j:F

    .line 3
    .line 4
    return-void
.end method

.method public setRectLeft(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->g:F

    .line 3
    .line 4
    return-void
.end method

.method public setRectRoundCx(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->o:I

    .line 2
    .line 3
    return-void
.end method

.method public setRectTop(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->h:F

    .line 3
    .line 4
    return-void
.end method

.method public setRectWidth(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->i:F

    .line 3
    .line 4
    return-void
.end method

.method public setStrokeWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/RectMaskView;->n:I

    .line 2
    .line 3
    return-void
.end method
