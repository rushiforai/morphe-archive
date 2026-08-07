.class public Lcom/idv/identity/ocr/IdentityScanView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field private final a:F

.field private b:Landroid/animation/ValueAnimator;

.field private c:F

.field private d:F

.field private e:F

.field private f:F

.field private g:Z

.field private h:Z

.field private i:I

.field private j:F

.field private k:F

.field private l:Landroid/graphics/drawable/Drawable;

.field private m:Z

.field private n:Z

.field private o:Landroid/view/View;

.field private p:Lcom/idv/identity/ocr/widget/RectMaskView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 52
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const p1, 0x3f23fd08

    .line 53
    iput p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->a:F

    const/high16 p1, -0x40800000    # -1.0f

    .line 54
    iput p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 55
    iput p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->d:F

    .line 56
    iput p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->e:F

    .line 57
    iput p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->f:F

    const/4 p1, 0x0

    .line 58
    iput-boolean p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->g:Z

    .line 59
    iput-boolean p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->h:Z

    const/4 v0, -0x1

    .line 60
    iput v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->i:I

    const/4 v0, 0x0

    .line 61
    iput v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->j:F

    .line 62
    iput v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->k:F

    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->l:Landroid/graphics/drawable/Drawable;

    .line 64
    iput-boolean p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->m:Z

    .line 65
    iput-boolean p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->n:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x3f23fd08

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->a:F

    .line 8
    .line 9
    const/high16 v0, -0x40800000    # -1.0f

    .line 10
    .line 11
    iput v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 12
    .line 13
    iput v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->d:F

    .line 14
    .line 15
    iput v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->e:F

    .line 16
    .line 17
    iput v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->f:F

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->g:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->h:Z

    .line 23
    .line 24
    const/4 v1, -0x1

    .line 25
    iput v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->i:I

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->j:F

    .line 29
    .line 30
    iput v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->k:F

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    iput-object v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->l:Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->m:Z

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->n:Z

    .line 38
    .line 39
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Ll/dec0;->l:I

    .line 44
    .line 45
    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/ocr/IdentityScanView;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic a(Lcom/idv/identity/ocr/IdentityScanView;)Lcom/idv/identity/ocr/widget/RectMaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 2
    .line 3
    return-object p0
.end method

.method private e(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    sget-object v0, Ll/ehc0;->h:[I

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
    sget p2, Ll/ehc0;->l:I

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
    iput p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 17
    .line 18
    sget p2, Ll/ehc0;->q:I

    .line 19
    .line 20
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iput p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->d:F

    .line 25
    .line 26
    sget p2, Ll/ehc0;->s:I

    .line 27
    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->e:F

    .line 33
    .line 34
    sget p2, Ll/ehc0;->k:I

    .line 35
    .line 36
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iput p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->f:F

    .line 41
    .line 42
    sget p2, Ll/ehc0;->j:I

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
    iput-boolean p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->g:Z

    .line 50
    .line 51
    sget p2, Ll/ehc0;->r:I

    .line 52
    .line 53
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput-boolean p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->h:Z

    .line 58
    .line 59
    sget p2, Ll/ehc0;->n:I

    .line 60
    .line 61
    const/4 v2, -0x1

    .line 62
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    iput p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->i:I

    .line 67
    .line 68
    sget p2, Ll/ehc0;->p:I

    .line 69
    .line 70
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    iput p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->j:F

    .line 75
    .line 76
    sget p2, Ll/ehc0;->o:I

    .line 77
    .line 78
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    iput p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->k:F

    .line 83
    .line 84
    sget p2, Ll/ehc0;->m:I

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    iput-object p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->l:Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    sget p2, Ll/ehc0;->i:I

    .line 93
    .line 94
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    iput-boolean p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->m:Z

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 101
    .line 102
    .line 103
    :cond_0
    sget p1, Ll/rcc0;->K0:I

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iput-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->o:Landroid/view/View;

    .line 110
    .line 111
    sget p1, Ll/rcc0;->M0:I

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 118
    .line 119
    iput-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 120
    .line 121
    iget p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectLeft(F)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 127
    .line 128
    iget p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->d:F

    .line 129
    .line 130
    float-to-int p2, p2

    .line 131
    invoke-virtual {p1, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectTop(I)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 135
    .line 136
    iget p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->f:F

    .line 137
    .line 138
    float-to-int p2, p2

    .line 139
    invoke-virtual {p1, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectHeight(I)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 143
    .line 144
    iget p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->e:F

    .line 145
    .line 146
    float-to-int p2, p2

    .line 147
    invoke-virtual {p1, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectWidth(I)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 151
    .line 152
    iget p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->j:F

    .line 153
    .line 154
    float-to-int p2, p2

    .line 155
    invoke-virtual {p1, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->setStrokeWidth(I)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 159
    .line 160
    iget p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->k:F

    .line 161
    .line 162
    float-to-int p2, p2

    .line 163
    invoke-virtual {p1, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectRoundCx(I)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 167
    .line 168
    iget p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->i:I

    .line 169
    .line 170
    invoke-virtual {p1, p2}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectColor(I)V

    .line 171
    .line 172
    .line 173
    sget p1, Ll/rcc0;->x:I

    .line 174
    .line 175
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    check-cast p1, Landroid/widget/ImageView;

    .line 180
    .line 181
    iget-boolean p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->m:Z

    .line 182
    .line 183
    if-nez p0, :cond_1

    .line 184
    .line 185
    const/4 p0, 0x4

    .line 186
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 187
    .line 188
    .line 189
    :cond_1
    return-void
.end method


# virtual methods
.method public b()V
    .locals 9

    .line 1
    sget v0, Ll/rcc0;->w:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/ImageView;

    .line 8
    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/idv/identity/ocr/IdentityScanView;->l:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iget v3, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 23
    .line 24
    mul-float/2addr v3, v1

    .line 25
    float-to-int v3, v3

    .line 26
    sub-int/2addr v2, v3

    .line 27
    int-to-float v3, v2

    .line 28
    const v4, 0x3f23fd08

    .line 29
    .line 30
    .line 31
    mul-float/2addr v4, v3

    .line 32
    float-to-int v4, v4

    .line 33
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    const/high16 v7, 0x42bc0000    # 94.0f

    .line 44
    .line 45
    invoke-static {v6, v7}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    const/high16 v8, 0x42a40000    # 82.0f

    .line 56
    .line 57
    invoke-static {v6, v8}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    invoke-static {v6, v7}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    sub-int v6, v4, v6

    .line 72
    .line 73
    div-int/lit8 v6, v6, 0x2

    .line 74
    .line 75
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-static {v6, v8}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    sub-int v6, v2, v6

    .line 86
    .line 87
    int-to-float v6, v6

    .line 88
    iget v7, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 89
    .line 90
    sub-float/2addr v6, v7

    .line 91
    float-to-int v6, v6

    .line 92
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 93
    .line 94
    invoke-virtual {v0, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v6, "imgFrontCardW:"

    .line 100
    .line 101
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v2, ",imgFrontCardH:"

    .line 108
    .line 109
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v2, "   layoutParams.height:"

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget v2, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 121
    .line 122
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v2, "  layoutParams.width:"

    .line 126
    .line 127
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    iget v2, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 131
    .line 132
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v2, " layoutParams.topMargin:"

    .line 136
    .line 137
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget v2, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 141
    .line 142
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string v2, "  layoutParams.leftMargin:"

    .line 146
    .line 147
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    iget v2, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 151
    .line 152
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    const-string v2, "autoLayout"

    .line 160
    .line 161
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    iput v3, p0, Lcom/idv/identity/ocr/IdentityScanView;->e:F

    .line 165
    .line 166
    int-to-float v0, v4

    .line 167
    iput v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->f:F

    .line 168
    .line 169
    :cond_0
    sget v0, Ll/rcc0;->K0:I

    .line 170
    .line 171
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    if-eqz v0, :cond_1

    .line 176
    .line 177
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    iget v3, p0, Lcom/idv/identity/ocr/IdentityScanView;->d:F

    .line 182
    .line 183
    float-to-int v3, v3

    .line 184
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 185
    .line 186
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 187
    .line 188
    .line 189
    :cond_1
    sget v0, Ll/rcc0;->I0:I

    .line 190
    .line 191
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    if-eqz v0, :cond_2

    .line 196
    .line 197
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    iget v3, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 202
    .line 203
    float-to-int v3, v3

    .line 204
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 205
    .line 206
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 207
    .line 208
    .line 209
    :cond_2
    sget v0, Ll/rcc0;->J0:I

    .line 210
    .line 211
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    if-eqz v0, :cond_3

    .line 216
    .line 217
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    iget v3, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 222
    .line 223
    float-to-int v3, v3

    .line 224
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 225
    .line 226
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 227
    .line 228
    .line 229
    :cond_3
    sget v0, Ll/rcc0;->x:I

    .line 230
    .line 231
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    if-eqz v0, :cond_4

    .line 236
    .line 237
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    if-eqz v2, :cond_4

    .line 242
    .line 243
    iget v3, p0, Lcom/idv/identity/ocr/IdentityScanView;->e:F

    .line 244
    .line 245
    iget p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 246
    .line 247
    mul-float/2addr p0, v1

    .line 248
    add-float/2addr v3, p0

    .line 249
    float-to-int p0, v3

    .line 250
    iput p0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 251
    .line 252
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 253
    .line 254
    .line 255
    :cond_4
    return-void
.end method

.method public c(ILandroid/animation/Animator$AnimatorListener;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/IdentityScanView;->j()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectHeigth()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/high16 v1, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float v1, v0, v1

    .line 13
    .line 14
    iget-object v2, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectTop()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    new-instance v3, Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-direct {v3}, Landroid/animation/ValueAnimator;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    new-array v4, v4, [F

    .line 27
    .line 28
    const/4 v5, 0x0

    .line 29
    const/4 v6, 0x0

    .line 30
    aput v6, v4, v5

    .line 31
    .line 32
    const/4 v6, 0x1

    .line 33
    aput v1, v4, v6

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 36
    .line 37
    .line 38
    int-to-long v6, p1

    .line 39
    invoke-virtual {v3, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    .line 42
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    .line 43
    .line 44
    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v5}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 51
    .line 52
    .line 53
    new-instance p1, Lcom/idv/identity/ocr/IdentityScanView$c;

    .line 54
    .line 55
    invoke-direct {p1, p0, v2, v0}, Lcom/idv/identity/ocr/IdentityScanView$c;-><init>(Lcom/idv/identity/ocr/IdentityScanView;FF)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 59
    .line 60
    .line 61
    new-instance p1, Lcom/idv/identity/ocr/IdentityScanView$d;

    .line 62
    .line 63
    invoke-direct {p1, p0, v2, v0, p2}, Lcom/idv/identity/ocr/IdentityScanView$d;-><init>(Lcom/idv/identity/ocr/IdentityScanView;FFLandroid/animation/Animator$AnimatorListener;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->start()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public d(Lcom/idv/identity/ocr/OcrType;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/ocr/widget/RectMaskView;->getDrawTrapezoid()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sget-object v1, Lcom/idv/identity/ocr/IdentityScanView$e;->a:[I

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    aget p1, v1, p1

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq p1, v1, :cond_1

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    if-eq p1, v2, :cond_1

    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    if-eq p1, v2, :cond_1

    .line 23
    .line 24
    const/4 v2, 0x4

    .line 25
    if-eq p1, v2, :cond_0

    .line 26
    .line 27
    const/4 v2, 0x5

    .line 28
    if-eq p1, v2, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    if-nez v0, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setDrawTrapezoid(Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    if-eqz v0, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setDrawTrapezoid(Z)V

    .line 45
    .line 46
    .line 47
    :cond_2
    :goto_0
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/idv/identity/ocr/IdentityScanView;->j()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->n:Z

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 2
    .line 3
    iget v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 4
    .line 5
    float-to-int v1, v1

    .line 6
    int-to-float v1, v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectLeft(F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 11
    .line 12
    iget v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->d:F

    .line 13
    .line 14
    float-to-int v1, v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectTop(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 19
    .line 20
    iget v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->f:F

    .line 21
    .line 22
    float-to-int v1, v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectHeight(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 27
    .line 28
    iget v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->e:F

    .line 29
    .line 30
    float-to-int v1, v1

    .line 31
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectWidth(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 35
    .line 36
    iget v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->j:F

    .line 37
    .line 38
    float-to-int v1, v1

    .line 39
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setStrokeWidth(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 43
    .line 44
    iget v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->k:F

    .line 45
    .line 46
    float-to-int v1, v1

    .line 47
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectRoundCx(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 51
    .line 52
    iget v1, p0, Lcom/idv/identity/ocr/IdentityScanView;->i:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/idv/identity/ocr/widget/RectMaskView;->invalidate()V

    .line 60
    .line 61
    .line 62
    sget v0, Ll/rcc0;->N0:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    invoke-direct {v1}, Landroid/animation/ValueAnimator;-><init>()V

    .line 71
    .line 72
    .line 73
    const-wide/16 v2, 0x1f4

    .line 74
    .line 75
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 76
    .line 77
    .line 78
    const/4 v2, 0x2

    .line 79
    new-array v2, v2, [F

    .line 80
    .line 81
    fill-array-data v2, :array_0

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 85
    .line 86
    .line 87
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 88
    .line 89
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 93
    .line 94
    .line 95
    const/4 v2, 0x0

    .line 96
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 97
    .line 98
    .line 99
    new-instance v2, Lcom/idv/identity/ocr/IdentityScanView$a;

    .line 100
    .line 101
    invoke-direct {v2, p0, v0}, Lcom/idv/identity/ocr/IdentityScanView$a;-><init>(Lcom/idv/identity/ocr/IdentityScanView;Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public getHoleHeight()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->f:F

    .line 2
    .line 3
    return p0
.end method

.method public getHoleLeft()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public getHolePicture()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->l:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHoleTop()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public getHoleWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public getMaskScale()F
    .locals 0

    const p0, 0x3f23fd08

    return p0
.end method

.method public h(Landroid/graphics/drawable/Drawable;ZZ)V
    .locals 8

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->l:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    sget v0, Ll/rcc0;->w:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/ImageView;

    .line 10
    .line 11
    sget v1, Ll/rcc0;->y:I

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/ImageView;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget v3, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 26
    .line 27
    const/high16 v4, 0x40000000    # 2.0f

    .line 28
    .line 29
    mul-float/2addr v3, v4

    .line 30
    float-to-int v3, v3

    .line 31
    sub-int/2addr v2, v3

    .line 32
    const v3, 0x3f23fd08

    .line 33
    .line 34
    .line 35
    int-to-float v5, v2

    .line 36
    mul-float/2addr v5, v3

    .line 37
    float-to-int v3, v5

    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 43
    .line 44
    const/high16 v6, 0x42a40000    # 82.0f

    .line 45
    .line 46
    const/high16 v7, 0x42bc0000    # 94.0f

    .line 47
    .line 48
    if-eqz p3, :cond_0

    .line 49
    .line 50
    const/4 p2, 0x0

    .line 51
    invoke-virtual {v1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {p2, v7}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    sub-int/2addr v3, p2

    .line 63
    div-int/lit8 p3, v3, 0x2

    .line 64
    .line 65
    iget v7, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 66
    .line 67
    float-to-int v7, v7

    .line 68
    sub-int/2addr p3, v7

    .line 69
    iput p2, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-static {p2, v6}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    iput p2, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 80
    .line 81
    iput p3, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 82
    .line 83
    iget p2, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 84
    .line 85
    float-to-int p2, p2

    .line 86
    iput p2, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    check-cast p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 93
    .line 94
    sub-int/2addr v3, p3

    .line 95
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result p3

    .line 99
    mul-int/lit8 p3, p3, 0x2

    .line 100
    .line 101
    sub-int/2addr v3, p3

    .line 102
    iget p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 103
    .line 104
    mul-float/2addr v4, p0

    .line 105
    float-to-int p3, v4

    .line 106
    sub-int/2addr v2, p3

    .line 107
    iput v2, p2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 108
    .line 109
    float-to-int p3, p0

    .line 110
    iput p3, p2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 111
    .line 112
    float-to-int p0, p0

    .line 113
    iput p0, p2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 114
    .line 115
    iput v3, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 116
    .line 117
    invoke-virtual {v1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_0
    const/16 p3, 0x8

    .line 122
    .line 123
    invoke-virtual {v1, p3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 124
    .line 125
    .line 126
    if-eqz p2, :cond_1

    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-static {p2, v7}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    iput p2, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-static {p2, v6}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    iput p2, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 147
    .line 148
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-static {p2, v7}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    sub-int/2addr v3, p2

    .line 157
    div-int/lit8 v3, v3, 0x2

    .line 158
    .line 159
    iput v3, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-static {p2, v6}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    sub-int/2addr v2, p2

    .line 170
    int-to-float p2, v2

    .line 171
    iget p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 172
    .line 173
    sub-float/2addr p2, p0

    .line 174
    float-to-int p0, p2

    .line 175
    iput p0, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    const/high16 p3, 0x42700000    # 60.0f

    .line 183
    .line 184
    invoke-static {p2, p3}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    iput p2, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 189
    .line 190
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    const/high16 p3, 0x426c0000    # 59.0f

    .line 195
    .line 196
    invoke-static {p2, p3}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    iput p2, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 201
    .line 202
    iget p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 203
    .line 204
    float-to-int p2, p0

    .line 205
    iput p2, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 206
    .line 207
    float-to-int p0, p0

    .line 208
    mul-int/lit8 p0, p0, 0x2

    .line 209
    .line 210
    iput p0, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 211
    .line 212
    :goto_0
    invoke-virtual {v0, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 216
    .line 217
    .line 218
    :cond_2
    return-void
.end method

.method public i()V
    .locals 6

    .line 1
    sget v0, Ll/rcc0;->x:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/ImageView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget v1, Ll/rcc0;->L0:I

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_1
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v3, Ll/vac0;->d:I

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 32
    .line 33
    .line 34
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 42
    .line 43
    invoke-virtual {v3}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectHeigth()F

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    iget v4, p0, Lcom/idv/identity/ocr/IdentityScanView;->d:F

    .line 48
    .line 49
    add-float/2addr v3, v4

    .line 50
    const/4 v4, 0x2

    .line 51
    new-array v4, v4, [F

    .line 52
    .line 53
    const/4 v5, 0x0

    .line 54
    aput v5, v4, v2

    .line 55
    .line 56
    const/4 v2, 0x1

    .line 57
    aput v3, v4, v2

    .line 58
    .line 59
    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    const/4 v3, -0x1

    .line 65
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 76
    .line 77
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 84
    .line 85
    const-wide/16 v2, 0x5dc

    .line 86
    .line 87
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 91
    .line 92
    new-instance v2, Lcom/idv/identity/ocr/IdentityScanView$b;

    .line 93
    .line 94
    invoke-direct {v2, p0, v1}, Lcom/idv/identity/ocr/IdentityScanView$b;-><init>(Lcom/idv/identity/ocr/IdentityScanView;Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public j()V
    .locals 3

    .line 1
    const-string v0, "ScanAnimation"

    .line 2
    .line 3
    const-string v1, "stopScanAnimation"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v0, Ll/rcc0;->x:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/widget/ImageView;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x4

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    sget v0, Ll/rcc0;->L0:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/4 v2, 0x0

    .line 35
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    iput-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView;->b:Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public setHoleColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->i:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityScanView;->p:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectColor(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setHoleHCenter(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHoleHeight(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->f:F

    .line 2
    .line 3
    return-void
.end method

.method public setHoleLeft(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->c:F

    .line 2
    .line 3
    return-void
.end method

.method public setHoleTop(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->d:F

    .line 2
    .line 3
    return-void
.end method

.method public setHoleVCenter(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHoleWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/ocr/IdentityScanView;->e:F

    .line 2
    .line 3
    return-void
.end method
