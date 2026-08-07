.class public Lcom/p1/mobile/putong/core/ui/ShadowButton;
.super Lcom/p1/mobile/putong/core/ui/BounceView;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:I

.field public d:I

.field public e:I

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:Landroid/graphics/Paint;

.field public k:Landroid/graphics/Paint;

.field public l:Landroid/graphics/drawable/Drawable;

.field public m:F

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Landroid/graphics/drawable/Drawable;

.field public t:Landroid/graphics/drawable/Drawable;

.field public u:F

.field public v:I

.field public w:Ll/l01;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/l01<",
            "Ljava/lang/Integer;",
            "Ll/pf60<",
            "Ljava/lang/Float;",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/BounceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->b:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "#ffffff"

    .line 15
    .line 16
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->c:I

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->l:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->r:Z

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->s:Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->t:Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    new-instance v0, Ll/l01;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->e()V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->f(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 46
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/BounceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->b:Ljava/lang/String;

    .line 48
    const-string p3, "#ffffff"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->c:I

    const/4 p3, 0x0

    .line 49
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->l:Landroid/graphics/drawable/Drawable;

    const/4 v0, 0x1

    .line 50
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->r:Z

    .line 51
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->s:Landroid/graphics/drawable/Drawable;

    .line 52
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->t:Landroid/graphics/drawable/Drawable;

    .line 53
    new-instance p3, Ll/l01;

    invoke-direct {p3}, Ll/l01;-><init>()V

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->e()V

    .line 55
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->f(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private f(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    sget-object v0, Ll/xhc0;->K:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/xhc0;->d0:I

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/high16 v2, 0x40800000    # 4.0f

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 26
    .line 27
    mul-float/2addr p1, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    int-to-float p1, p1

    .line 34
    :goto_0
    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 39
    .line 40
    sget p1, Ll/xhc0;->Z:I

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 48
    .line 49
    sget p1, Ll/xhc0;->Y:I

    .line 50
    .line 51
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->h:F

    .line 56
    .line 57
    sget p1, Ll/xhc0;->W:I

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->t:Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->l:Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    sget p1, Ll/xhc0;->X:I

    .line 68
    .line 69
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->s:Landroid/graphics/drawable/Drawable;

    .line 74
    .line 75
    sget p1, Ll/xhc0;->a0:I

    .line 76
    .line 77
    const-string v1, "#3dec543d"

    .line 78
    .line 79
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->d:I

    .line 88
    .line 89
    sget p1, Ll/xhc0;->b0:I

    .line 90
    .line 91
    const-string v1, "#1eec543d"

    .line 92
    .line 93
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->e:I

    .line 102
    .line 103
    sget p1, Ll/xhc0;->L:I

    .line 104
    .line 105
    const/4 v1, 0x0

    .line 106
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->n:Z

    .line 111
    .line 112
    sget p1, Ll/xhc0;->c0:I

    .line 113
    .line 114
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->o:Z

    .line 119
    .line 120
    sget p1, Ll/xhc0;->N:I

    .line 121
    .line 122
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->u:F

    .line 127
    .line 128
    sget p1, Ll/xhc0;->M:I

    .line 129
    .line 130
    const/4 v0, -0x1

    .line 131
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->v:I

    .line 136
    .line 137
    sget p1, Ll/xhc0;->R:I

    .line 138
    .line 139
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->q:Z

    .line 144
    .line 145
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 146
    .line 147
    .line 148
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/a;->e()Ll/syf0;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(IF)I
    .locals 5

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float/2addr p2, p0

    .line 4
    const/high16 v0, 0x41000000    # 8.0f

    .line 5
    .line 6
    mul-float/2addr p2, v0

    .line 7
    add-float/2addr p2, p0

    .line 8
    cmpg-float v0, p2, p0

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move p0, p2

    .line 14
    :goto_0
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/16 v2, 0xc8

    .line 31
    .line 32
    const/16 v3, 0xff

    .line 33
    .line 34
    const/high16 v4, 0x437f0000    # 255.0f

    .line 35
    .line 36
    if-ge p2, v2, :cond_2

    .line 37
    .line 38
    int-to-float p2, p2

    .line 39
    mul-float/2addr p0, p2

    .line 40
    cmpl-float p2, p0, v4

    .line 41
    .line 42
    if-lez p2, :cond_1

    .line 43
    .line 44
    move p2, v3

    .line 45
    goto :goto_3

    .line 46
    :cond_1
    float-to-int p0, p0

    .line 47
    move p2, p0

    .line 48
    goto :goto_3

    .line 49
    :cond_2
    int-to-float v0, v0

    .line 50
    mul-float/2addr v0, p0

    .line 51
    cmpl-float v2, v0, v4

    .line 52
    .line 53
    if-lez v2, :cond_3

    .line 54
    .line 55
    move v0, v3

    .line 56
    goto :goto_1

    .line 57
    :cond_3
    float-to-int v0, v0

    .line 58
    :goto_1
    int-to-float v1, v1

    .line 59
    mul-float/2addr v1, p0

    .line 60
    cmpl-float v2, v1, v4

    .line 61
    .line 62
    if-lez v2, :cond_4

    .line 63
    .line 64
    move v1, v3

    .line 65
    goto :goto_2

    .line 66
    :cond_4
    float-to-int v1, v1

    .line 67
    :goto_2
    int-to-float p1, p1

    .line 68
    mul-float/2addr p1, p0

    .line 69
    cmpl-float p0, p1, v4

    .line 70
    .line 71
    if-lez p0, :cond_5

    .line 72
    .line 73
    move p1, v3

    .line 74
    goto :goto_3

    .line 75
    :cond_5
    float-to-int p0, p1

    .line 76
    move p1, p0

    .line 77
    :goto_3
    invoke-static {p2, v0, v1, p1}, Landroid/graphics/Color;->argb(IIII)I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    return p0
.end method

.method public c(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->k:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->v:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/high16 v1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 29
    .line 30
    mul-float/2addr v0, v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    int-to-float v0, v0

    .line 37
    :goto_0
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->u:F

    .line 38
    .line 39
    cmpg-float v2, v1, v0

    .line 40
    .line 41
    if-gez v2, :cond_1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    move v0, v1

    .line 45
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->k:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 48
    .line 49
    .line 50
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 53
    .line 54
    iget v2, v2, Lcom/p1/mobile/putong/core/ui/a;->d:F

    .line 55
    .line 56
    const/high16 v3, 0x40000000    # 2.0f

    .line 57
    .line 58
    div-float/2addr v2, v3

    .line 59
    sub-float/2addr v2, v0

    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->k:Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-virtual {p1, v1, v1, v2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public d(Landroid/graphics/Canvas;F)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/a;->c:F

    .line 4
    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    div-float/2addr v0, v1

    .line 8
    div-float v0, p2, v0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 11
    .line 12
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->c:I

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 15
    .line 16
    .line 17
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->o:Z

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 23
    .line 24
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 25
    .line 26
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->d:I

    .line 27
    .line 28
    invoke-virtual {p0, v5, v0}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->b(IF)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-virtual {v2, v4, v3, v4, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 33
    .line 34
    .line 35
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 36
    .line 37
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-virtual {p1, v2, v2, p2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 43
    .line 44
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 45
    .line 46
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->e:I

    .line 47
    .line 48
    invoke-virtual {p0, v5, v0}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->b(IF)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-virtual {v2, v4, v3, v3, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 56
    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 58
    .line 59
    invoke-virtual {p1, v2, v2, p2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 63
    .line 64
    invoke-virtual {p2}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->l:Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_3

    .line 74
    .line 75
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->l:Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    check-cast p2, Landroid/graphics/drawable/BitmapDrawable;

    .line 78
    .line 79
    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 84
    .line 85
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 86
    .line 87
    div-float v5, v4, v1

    .line 88
    .line 89
    mul-float/2addr v5, v0

    .line 90
    sub-float v5, v2, v5

    .line 91
    .line 92
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->h:F

    .line 93
    .line 94
    div-float/2addr v6, v1

    .line 95
    mul-float/2addr v6, v0

    .line 96
    sub-float/2addr v2, v6

    .line 97
    cmpl-float v1, v5, v3

    .line 98
    .line 99
    if-lez v1, :cond_3

    .line 100
    .line 101
    cmpl-float v1, v2, v3

    .line 102
    .line 103
    if-lez v1, :cond_3

    .line 104
    .line 105
    float-to-int v1, v5

    .line 106
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->r:Z

    .line 107
    .line 108
    if-nez v2, :cond_1

    .line 109
    .line 110
    mul-float v1, v4, v0

    .line 111
    .line 112
    mul-float/2addr v4, v0

    .line 113
    invoke-static {p2, v1, v4}, Ll/l9k;->a(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 118
    .line 119
    invoke-virtual {p1, p2, v5, v5, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 124
    .line 125
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {v2, v3}, Ll/oof0;->containsKey(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    if-nez v2, :cond_2

    .line 134
    .line 135
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 136
    .line 137
    mul-float v3, v2, v0

    .line 138
    .line 139
    mul-float/2addr v2, v0

    .line 140
    invoke-static {p2, v3, v2}, Ll/l9k;->a(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 145
    .line 146
    invoke-virtual {p1, p2, v5, v5, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 147
    .line 148
    .line 149
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->r:Z

    .line 150
    .line 151
    if-eqz p1, :cond_3

    .line 152
    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 154
    .line 155
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    invoke-virtual {p0, p1, p2}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 172
    .line 173
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {p2, v0}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    check-cast p2, Ll/pf60;

    .line 182
    .line 183
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast p2, Landroid/graphics/Bitmap;

    .line 186
    .line 187
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 188
    .line 189
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-virtual {v0, v2}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    check-cast v0, Ll/pf60;

    .line 198
    .line 199
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 200
    .line 201
    check-cast v0, Ljava/lang/Float;

    .line 202
    .line 203
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 208
    .line 209
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-virtual {v2, v1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    check-cast v1, Ll/pf60;

    .line 218
    .line 219
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 220
    .line 221
    check-cast v1, Ljava/lang/Float;

    .line 222
    .line 223
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 228
    .line 229
    invoke-virtual {p1, p2, v0, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 230
    .line 231
    .line 232
    :cond_3
    return-void
.end method

.method public final e()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->k:Landroid/graphics/Paint;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->k:Landroid/graphics/Paint;

    .line 35
    .line 36
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final g(I)I
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/high16 v0, -0x80000000

    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const/high16 v0, 0x40000000    # 2.0f

    .line 14
    .line 15
    if-eq p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_0
    return p1
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/a;->j()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->d(Landroid/graphics/Canvas;F)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->u:F

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    cmpl-float v0, v0, v1

    .line 17
    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->c(Landroid/graphics/Canvas;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->f:F

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->o:Z

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v1, v2

    .line 17
    :goto_0
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 20
    .line 21
    const/high16 v4, 0x40800000    # 4.0f

    .line 22
    .line 23
    mul-float/2addr v1, v4

    .line 24
    sub-float/2addr v0, v1

    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->q:Z

    .line 26
    .line 27
    invoke-virtual {v3, v0, v1}, Lcom/p1/mobile/putong/core/ui/a;->l(FZ)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 31
    .line 32
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->n:Z

    .line 33
    .line 34
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/a;->i:Z

    .line 35
    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->f:F

    .line 37
    .line 38
    const/high16 v3, 0x40000000    # 2.0f

    .line 39
    .line 40
    div-float/2addr v1, v3

    .line 41
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 42
    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 44
    .line 45
    cmpl-float v3, v1, v2

    .line 46
    .line 47
    if-nez v3, :cond_1

    .line 48
    .line 49
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/a;->d:F

    .line 50
    .line 51
    div-float v1, v0, v4

    .line 52
    .line 53
    :cond_1
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 54
    .line 55
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->h:F

    .line 56
    .line 57
    cmpl-float v2, v0, v2

    .line 58
    .line 59
    if-nez v2, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move v1, v0

    .line 63
    :goto_1
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->h:F

    .line 64
    .line 65
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->p:Z

    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g(I)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/a;->i(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public setBordersize(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->u:F

    .line 2
    .line 3
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->l:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIconHeight(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->h:F

    .line 2
    .line 3
    return-void
.end method

.method public setIconWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 2
    .line 3
    return-void
.end method

.method public setLongPressingListener(Lcom/p1/mobile/putong/core/ui/a$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/a;->l:Lcom/p1/mobile/putong/core/ui/a$d;

    .line 4
    .line 5
    return-void
.end method

.method public setProgress(F)V
    .locals 0

    return-void
.end method
