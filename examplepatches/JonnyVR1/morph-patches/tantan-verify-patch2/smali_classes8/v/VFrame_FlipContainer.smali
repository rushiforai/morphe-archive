.class public Lv/VFrame_FlipContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/VFrame_FlipContainer$b;,
        Lv/VFrame_FlipContainer$a;
    }
.end annotation


# instance fields
.field public final a:Lv/VFrame_FlipContainer$b;

.field public final b:Lv/VFrame_FlipContainer$a;

.field public c:Ll/x20;

.field public d:I

.field public e:I

.field public f:F

.field public g:F

.field public h:I

.field public i:F

.field public j:F

.field public k:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lv/VFrame_FlipContainer$b;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Lv/VFrame_FlipContainer$b;-><init>(Ll/xxk0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lv/VFrame_FlipContainer;->a:Lv/VFrame_FlipContainer$b;

    .line 11
    .line 12
    new-instance v0, Lv/VFrame_FlipContainer$a;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lv/VFrame_FlipContainer$a;-><init>(Ll/xxk0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Lv/VFrame_FlipContainer$a;->e(Lv/VFrame_FlipContainer$a;)Lv/VFrame_FlipContainer$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 22
    .line 23
    const v0, 0x3dcccccd    # 0.1f

    .line 24
    .line 25
    .line 26
    iput v0, p0, Lv/VFrame_FlipContainer;->f:F

    .line 27
    .line 28
    const v0, 0x3f666666    # 0.9f

    .line 29
    .line 30
    .line 31
    iput v0, p0, Lv/VFrame_FlipContainer;->g:F

    .line 32
    .line 33
    const/high16 v0, -0x40800000    # -1.0f

    .line 34
    .line 35
    iput v0, p0, Lv/VFrame_FlipContainer;->i:F

    .line 36
    .line 37
    const/high16 v0, 0x3f800000    # 1.0f

    .line 38
    .line 39
    iput v0, p0, Lv/VFrame_FlipContainer;->j:F

    .line 40
    .line 41
    iput v0, p0, Lv/VFrame_FlipContainer;->k:F

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p0, p1, v1, v0}, Lv/VFrame_FlipContainer;->b(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 48
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    new-instance v0, Lv/VFrame_FlipContainer$b;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lv/VFrame_FlipContainer$b;-><init>(Ll/xxk0;)V

    iput-object v0, p0, Lv/VFrame_FlipContainer;->a:Lv/VFrame_FlipContainer$b;

    .line 50
    new-instance v0, Lv/VFrame_FlipContainer$a;

    invoke-direct {v0, v1}, Lv/VFrame_FlipContainer$a;-><init>(Ll/xxk0;)V

    invoke-static {v0}, Lv/VFrame_FlipContainer$a;->e(Lv/VFrame_FlipContainer$a;)Lv/VFrame_FlipContainer$a;

    move-result-object v0

    iput-object v0, p0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    const v0, 0x3dcccccd    # 0.1f

    .line 51
    iput v0, p0, Lv/VFrame_FlipContainer;->f:F

    const v0, 0x3f666666    # 0.9f

    .line 52
    iput v0, p0, Lv/VFrame_FlipContainer;->g:F

    const/high16 v0, -0x40800000    # -1.0f

    .line 53
    iput v0, p0, Lv/VFrame_FlipContainer;->i:F

    const/high16 v0, 0x3f800000    # 1.0f

    .line 54
    iput v0, p0, Lv/VFrame_FlipContainer;->j:F

    .line 55
    iput v0, p0, Lv/VFrame_FlipContainer;->k:F

    const/4 v0, 0x0

    .line 56
    invoke-virtual {p0, p1, p2, v0}, Lv/VFrame_FlipContainer;->b(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 57
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    new-instance v0, Lv/VFrame_FlipContainer$b;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lv/VFrame_FlipContainer$b;-><init>(Ll/xxk0;)V

    iput-object v0, p0, Lv/VFrame_FlipContainer;->a:Lv/VFrame_FlipContainer$b;

    .line 59
    new-instance v0, Lv/VFrame_FlipContainer$a;

    invoke-direct {v0, v1}, Lv/VFrame_FlipContainer$a;-><init>(Ll/xxk0;)V

    invoke-static {v0}, Lv/VFrame_FlipContainer$a;->e(Lv/VFrame_FlipContainer$a;)Lv/VFrame_FlipContainer$a;

    move-result-object v0

    iput-object v0, p0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    const v0, 0x3dcccccd    # 0.1f

    .line 60
    iput v0, p0, Lv/VFrame_FlipContainer;->f:F

    const v0, 0x3f666666    # 0.9f

    .line 61
    iput v0, p0, Lv/VFrame_FlipContainer;->g:F

    const/high16 v0, -0x40800000    # -1.0f

    .line 62
    iput v0, p0, Lv/VFrame_FlipContainer;->i:F

    const/high16 v0, 0x3f800000    # 1.0f

    .line 63
    iput v0, p0, Lv/VFrame_FlipContainer;->j:F

    .line 64
    iput v0, p0, Lv/VFrame_FlipContainer;->k:F

    .line 65
    invoke-virtual {p0, p1, p2, p3}, Lv/VFrame_FlipContainer;->b(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private getMainChild()Landroid/view/View;
    .locals 1

    .line 1
    iget v0, p0, Lv/VFrame_FlipContainer;->d:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private getOtherChild()Landroid/view/View;
    .locals 1

    .line 1
    iget v0, p0, Lv/VFrame_FlipContainer;->e:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public final a(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 6

    .line 1
    iget v0, p0, Lv/VFrame_FlipContainer;->j:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpl-float v0, v0, v1

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lv/VFrame_FlipContainer;->k:F

    .line 10
    .line 11
    cmpl-float v0, v0, v1

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-object p1

    .line 16
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget v3, p0, Lv/VFrame_FlipContainer;->j:F

    .line 29
    .line 30
    mul-float/2addr v2, v3

    .line 31
    const/high16 v3, 0x40000000    # 2.0f

    .line 32
    .line 33
    div-float/2addr v2, v3

    .line 34
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iget v4, p0, Lv/VFrame_FlipContainer;->k:F

    .line 39
    .line 40
    mul-float/2addr p1, v4

    .line 41
    div-float/2addr p1, v3

    .line 42
    iget-object v3, p0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 43
    .line 44
    invoke-static {v3}, Lv/VFrame_FlipContainer$a;->c(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    sub-float v4, v0, v2

    .line 49
    .line 50
    sub-float v5, v1, p1

    .line 51
    .line 52
    add-float/2addr v0, v2

    .line 53
    add-float/2addr v1, p1

    .line 54
    invoke-virtual {v3, v4, v5, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 58
    .line 59
    invoke-static {p0}, Lv/VFrame_FlipContainer$a;->c(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method public final b(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lv/VFrame_FlipContainer;->d:I

    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    sget-object v0, Ll/hhc0;->Z:[I

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget p2, Ll/hhc0;->a0:I

    .line 14
    .line 15
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Lv/VFrame_FlipContainer;->d:I

    .line 20
    .line 21
    sget p2, Ll/hhc0;->b0:I

    .line 22
    .line 23
    const/4 p3, 0x1

    .line 24
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iput p2, p0, Lv/VFrame_FlipContainer;->e:I

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VFrame_FlipContainer;->a:Lv/VFrame_FlipContainer$b;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lv/VFrame_FlipContainer$b;->a(Lv/VFrame_FlipContainer$b;Landroid/view/View;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    cmpl-float v0, p0, v0

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    cmpl-float p0, p0, v0

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final d()Z
    .locals 1

    .line 1
    iget p0, p0, Lv/VFrame_FlipContainer;->i:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    cmpg-float p0, p0, v0

    .line 5
    .line 6
    if-gtz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lv/VFrame_FlipContainer;->a:Lv/VFrame_FlipContainer$b;

    .line 6
    .line 7
    invoke-static {v2, v0}, Lv/VFrame_FlipContainer$b;->a(Lv/VFrame_FlipContainer$b;Landroid/view/View;)F

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    cmpl-float v3, v2, v3

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v5, 0x4

    .line 16
    const/high16 v6, 0x3f800000    # 1.0f

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    cmpl-float v3, v2, v6

    .line 21
    .line 22
    if-nez v3, :cond_1

    .line 23
    .line 24
    :cond_0
    move/from16 v16, v6

    .line 25
    .line 26
    goto/16 :goto_5

    .line 27
    .line 28
    :cond_1
    iget v3, v0, Lv/VFrame_FlipContainer;->f:F

    .line 29
    .line 30
    cmpg-float v7, v2, v3

    .line 31
    .line 32
    const v8, 0x3ecccccd    # 0.4f

    .line 33
    .line 34
    .line 35
    const v9, 0x40333333    # 2.8f

    .line 36
    .line 37
    .line 38
    const/high16 v10, -0x3d740000    # -70.0f

    .line 39
    .line 40
    const/high16 v11, 0x428c0000    # 70.0f

    .line 41
    .line 42
    const/high16 v12, 0x40c00000    # 6.0f

    .line 43
    .line 44
    const/high16 v13, 0x437f0000    # 255.0f

    .line 45
    .line 46
    const/high16 v14, 0x40000000    # 2.0f

    .line 47
    .line 48
    const/16 v15, 0xff

    .line 49
    .line 50
    if-gtz v7, :cond_5

    .line 51
    .line 52
    div-float v3, v2, v3

    .line 53
    .line 54
    iget-object v7, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 55
    .line 56
    invoke-static {v7}, Lv/VFrame_FlipContainer$a;->a(Lv/VFrame_FlipContainer$a;)Landroid/graphics/Paint;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    mul-float/2addr v3, v13

    .line 61
    float-to-int v3, v3

    .line 62
    invoke-virtual {v7, v3, v15, v15, v15}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 63
    .line 64
    .line 65
    iget v3, v0, Lv/VFrame_FlipContainer;->f:F

    .line 66
    .line 67
    div-float/2addr v3, v14

    .line 68
    sub-float v3, v2, v3

    .line 69
    .line 70
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    iget v7, v0, Lv/VFrame_FlipContainer;->f:F

    .line 75
    .line 76
    div-float/2addr v7, v14

    .line 77
    div-float/2addr v3, v7

    .line 78
    sub-float v3, v6, v3

    .line 79
    .line 80
    iget-object v7, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 81
    .line 82
    invoke-static {v7}, Lv/VFrame_FlipContainer$a;->b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    .line 87
    .line 88
    .line 89
    move-result v7

    .line 90
    div-float/2addr v7, v12

    .line 91
    mul-float/2addr v7, v3

    .line 92
    iget-object v12, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 93
    .line 94
    invoke-static {v12}, Lv/VFrame_FlipContainer$a;->d(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 95
    .line 96
    .line 97
    move-result-object v12

    .line 98
    iget-object v13, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 99
    .line 100
    invoke-static {v13}, Lv/VFrame_FlipContainer$a;->b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 101
    .line 102
    .line 103
    move-result-object v13

    .line 104
    iget v13, v13, Landroid/graphics/RectF;->top:F

    .line 105
    .line 106
    iget-object v15, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 107
    .line 108
    invoke-static {v15}, Lv/VFrame_FlipContainer$a;->b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 109
    .line 110
    .line 111
    move-result-object v15

    .line 112
    invoke-virtual {v15}, Landroid/graphics/RectF;->width()F

    .line 113
    .line 114
    .line 115
    move-result v15

    .line 116
    sub-float/2addr v15, v7

    .line 117
    move/from16 v16, v6

    .line 118
    .line 119
    iget-object v6, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 120
    .line 121
    invoke-static {v6}, Lv/VFrame_FlipContainer$a;->b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 122
    .line 123
    .line 124
    move-result-object v6

    .line 125
    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    .line 126
    .line 127
    invoke-virtual {v12, v7, v13, v15, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 128
    .line 129
    .line 130
    iget-object v6, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 131
    .line 132
    invoke-static {v6}, Lv/VFrame_FlipContainer$a;->d(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    invoke-virtual {v0, v6}, Lv/VFrame_FlipContainer;->a(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    invoke-virtual {v0}, Lv/VFrame_FlipContainer;->d()Z

    .line 141
    .line 142
    .line 143
    move-result v12

    .line 144
    if-eqz v12, :cond_2

    .line 145
    .line 146
    iget-object v12, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 147
    .line 148
    invoke-static {v12}, Lv/VFrame_FlipContainer$a;->a(Lv/VFrame_FlipContainer$a;)Landroid/graphics/Paint;

    .line 149
    .line 150
    .line 151
    move-result-object v12

    .line 152
    invoke-virtual {v1, v6, v12}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 153
    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_2
    iget v12, v0, Lv/VFrame_FlipContainer;->i:F

    .line 157
    .line 158
    iget-object v13, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 159
    .line 160
    invoke-static {v13}, Lv/VFrame_FlipContainer$a;->a(Lv/VFrame_FlipContainer$a;)Landroid/graphics/Paint;

    .line 161
    .line 162
    .line 163
    move-result-object v13

    .line 164
    invoke-virtual {v1, v6, v12, v12, v13}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 165
    .line 166
    .line 167
    :goto_0
    iget v6, v0, Lv/VFrame_FlipContainer;->f:F

    .line 168
    .line 169
    div-float v12, v6, v14

    .line 170
    .line 171
    cmpl-float v12, v2, v12

    .line 172
    .line 173
    if-nez v12, :cond_3

    .line 174
    .line 175
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getOtherChild()Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 180
    .line 181
    .line 182
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getMainChild()Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 187
    .line 188
    .line 189
    invoke-super/range {p0 .. p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 190
    .line 191
    .line 192
    return-void

    .line 193
    :cond_3
    div-float/2addr v6, v14

    .line 194
    cmpg-float v2, v2, v6

    .line 195
    .line 196
    if-gez v2, :cond_4

    .line 197
    .line 198
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getOtherChild()Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 203
    .line 204
    .line 205
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getMainChild()Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 210
    .line 211
    .line 212
    mul-float/2addr v11, v3

    .line 213
    goto :goto_1

    .line 214
    :cond_4
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getOtherChild()Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 219
    .line 220
    .line 221
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getMainChild()Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 226
    .line 227
    .line 228
    mul-float v11, v3, v10

    .line 229
    .line 230
    neg-float v7, v7

    .line 231
    :goto_1
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 232
    .line 233
    .line 234
    iget-object v2, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 235
    .line 236
    mul-float/2addr v7, v9

    .line 237
    mul-float/2addr v3, v8

    .line 238
    sub-float v6, v16, v3

    .line 239
    .line 240
    invoke-static {v2, v1, v11, v7, v6}, Lv/VFrame_FlipContainer$a;->f(Lv/VFrame_FlipContainer$a;Landroid/graphics/Canvas;FFF)V

    .line 241
    .line 242
    .line 243
    invoke-super/range {p0 .. p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :cond_5
    move/from16 v16, v6

    .line 251
    .line 252
    iget v3, v0, Lv/VFrame_FlipContainer;->g:F

    .line 253
    .line 254
    cmpg-float v6, v2, v3

    .line 255
    .line 256
    iget-object v7, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 257
    .line 258
    if-gtz v6, :cond_7

    .line 259
    .line 260
    invoke-static {v7}, Lv/VFrame_FlipContainer$a;->a(Lv/VFrame_FlipContainer$a;)Landroid/graphics/Paint;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    invoke-virtual {v2, v15, v15, v15, v15}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 265
    .line 266
    .line 267
    iget-object v2, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 268
    .line 269
    invoke-static {v2}, Lv/VFrame_FlipContainer$a;->b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    invoke-virtual {v0, v2}, Lv/VFrame_FlipContainer;->a(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    invoke-virtual {v0}, Lv/VFrame_FlipContainer;->d()Z

    .line 278
    .line 279
    .line 280
    move-result v3

    .line 281
    if-eqz v3, :cond_6

    .line 282
    .line 283
    iget-object v3, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 284
    .line 285
    invoke-static {v3}, Lv/VFrame_FlipContainer$a;->a(Lv/VFrame_FlipContainer$a;)Landroid/graphics/Paint;

    .line 286
    .line 287
    .line 288
    move-result-object v3

    .line 289
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 290
    .line 291
    .line 292
    goto :goto_2

    .line 293
    :cond_6
    iget v3, v0, Lv/VFrame_FlipContainer;->i:F

    .line 294
    .line 295
    iget-object v6, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 296
    .line 297
    invoke-static {v6}, Lv/VFrame_FlipContainer$a;->a(Lv/VFrame_FlipContainer$a;)Landroid/graphics/Paint;

    .line 298
    .line 299
    .line 300
    move-result-object v6

    .line 301
    invoke-virtual {v1, v2, v3, v3, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 302
    .line 303
    .line 304
    :goto_2
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getOtherChild()Landroid/view/View;

    .line 305
    .line 306
    .line 307
    move-result-object v2

    .line 308
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 309
    .line 310
    .line 311
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getMainChild()Landroid/view/View;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 316
    .line 317
    .line 318
    invoke-super/range {p0 .. p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 319
    .line 320
    .line 321
    return-void

    .line 322
    :cond_7
    sub-float v6, v2, v3

    .line 323
    .line 324
    sub-float v3, v16, v3

    .line 325
    .line 326
    div-float/2addr v6, v3

    .line 327
    sub-float v6, v16, v6

    .line 328
    .line 329
    invoke-static {v7}, Lv/VFrame_FlipContainer$a;->a(Lv/VFrame_FlipContainer$a;)Landroid/graphics/Paint;

    .line 330
    .line 331
    .line 332
    move-result-object v3

    .line 333
    mul-float/2addr v6, v13

    .line 334
    float-to-int v6, v6

    .line 335
    invoke-virtual {v3, v6, v15, v15, v15}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 336
    .line 337
    .line 338
    iget v3, v0, Lv/VFrame_FlipContainer;->g:F

    .line 339
    .line 340
    sub-float v6, v16, v3

    .line 341
    .line 342
    div-float/2addr v6, v14

    .line 343
    sub-float v6, v16, v6

    .line 344
    .line 345
    sub-float v3, v2, v6

    .line 346
    .line 347
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 348
    .line 349
    .line 350
    move-result v3

    .line 351
    iget v6, v0, Lv/VFrame_FlipContainer;->g:F

    .line 352
    .line 353
    sub-float v6, v16, v6

    .line 354
    .line 355
    div-float/2addr v6, v14

    .line 356
    div-float/2addr v3, v6

    .line 357
    sub-float v6, v16, v3

    .line 358
    .line 359
    iget-object v3, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 360
    .line 361
    invoke-static {v3}, Lv/VFrame_FlipContainer$a;->b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    .line 366
    .line 367
    .line 368
    move-result v3

    .line 369
    div-float/2addr v3, v12

    .line 370
    mul-float/2addr v3, v6

    .line 371
    iget-object v7, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 372
    .line 373
    invoke-static {v7}, Lv/VFrame_FlipContainer$a;->d(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 374
    .line 375
    .line 376
    move-result-object v7

    .line 377
    iget-object v12, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 378
    .line 379
    invoke-static {v12}, Lv/VFrame_FlipContainer$a;->b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 380
    .line 381
    .line 382
    move-result-object v12

    .line 383
    iget v12, v12, Landroid/graphics/RectF;->top:F

    .line 384
    .line 385
    iget-object v13, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 386
    .line 387
    invoke-static {v13}, Lv/VFrame_FlipContainer$a;->b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 388
    .line 389
    .line 390
    move-result-object v13

    .line 391
    invoke-virtual {v13}, Landroid/graphics/RectF;->width()F

    .line 392
    .line 393
    .line 394
    move-result v13

    .line 395
    sub-float/2addr v13, v3

    .line 396
    iget-object v15, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 397
    .line 398
    invoke-static {v15}, Lv/VFrame_FlipContainer$a;->b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 399
    .line 400
    .line 401
    move-result-object v15

    .line 402
    iget v15, v15, Landroid/graphics/RectF;->bottom:F

    .line 403
    .line 404
    invoke-virtual {v7, v3, v12, v13, v15}, Landroid/graphics/RectF;->set(FFFF)V

    .line 405
    .line 406
    .line 407
    iget-object v7, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 408
    .line 409
    invoke-static {v7}, Lv/VFrame_FlipContainer$a;->d(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 410
    .line 411
    .line 412
    move-result-object v7

    .line 413
    invoke-virtual {v0, v7}, Lv/VFrame_FlipContainer;->a(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 414
    .line 415
    .line 416
    move-result-object v7

    .line 417
    invoke-virtual {v0}, Lv/VFrame_FlipContainer;->d()Z

    .line 418
    .line 419
    .line 420
    move-result v12

    .line 421
    if-eqz v12, :cond_8

    .line 422
    .line 423
    iget-object v12, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 424
    .line 425
    invoke-static {v12}, Lv/VFrame_FlipContainer$a;->a(Lv/VFrame_FlipContainer$a;)Landroid/graphics/Paint;

    .line 426
    .line 427
    .line 428
    move-result-object v12

    .line 429
    invoke-virtual {v1, v7, v12}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 430
    .line 431
    .line 432
    goto :goto_3

    .line 433
    :cond_8
    iget v12, v0, Lv/VFrame_FlipContainer;->i:F

    .line 434
    .line 435
    iget-object v13, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 436
    .line 437
    invoke-static {v13}, Lv/VFrame_FlipContainer$a;->a(Lv/VFrame_FlipContainer$a;)Landroid/graphics/Paint;

    .line 438
    .line 439
    .line 440
    move-result-object v13

    .line 441
    invoke-virtual {v1, v7, v12, v12, v13}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 442
    .line 443
    .line 444
    :goto_3
    iget v7, v0, Lv/VFrame_FlipContainer;->g:F

    .line 445
    .line 446
    sub-float v12, v16, v7

    .line 447
    .line 448
    div-float/2addr v12, v14

    .line 449
    sub-float v12, v16, v12

    .line 450
    .line 451
    cmpl-float v12, v2, v12

    .line 452
    .line 453
    if-nez v12, :cond_9

    .line 454
    .line 455
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 456
    .line 457
    .line 458
    move-result-object v2

    .line 459
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 460
    .line 461
    .line 462
    const/4 v2, 0x1

    .line 463
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 464
    .line 465
    .line 466
    move-result-object v2

    .line 467
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 468
    .line 469
    .line 470
    invoke-super/range {p0 .. p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 471
    .line 472
    .line 473
    return-void

    .line 474
    :cond_9
    sub-float v7, v16, v7

    .line 475
    .line 476
    div-float/2addr v7, v14

    .line 477
    sub-float v7, v16, v7

    .line 478
    .line 479
    cmpg-float v2, v2, v7

    .line 480
    .line 481
    if-gez v2, :cond_a

    .line 482
    .line 483
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getOtherChild()Landroid/view/View;

    .line 484
    .line 485
    .line 486
    move-result-object v2

    .line 487
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 488
    .line 489
    .line 490
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getMainChild()Landroid/view/View;

    .line 491
    .line 492
    .line 493
    move-result-object v2

    .line 494
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 495
    .line 496
    .line 497
    mul-float/2addr v11, v6

    .line 498
    goto :goto_4

    .line 499
    :cond_a
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getOtherChild()Landroid/view/View;

    .line 500
    .line 501
    .line 502
    move-result-object v2

    .line 503
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 504
    .line 505
    .line 506
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getMainChild()Landroid/view/View;

    .line 507
    .line 508
    .line 509
    move-result-object v2

    .line 510
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 511
    .line 512
    .line 513
    mul-float v11, v6, v10

    .line 514
    .line 515
    neg-float v3, v3

    .line 516
    :goto_4
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 517
    .line 518
    .line 519
    iget-object v2, v0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 520
    .line 521
    mul-float/2addr v3, v9

    .line 522
    mul-float/2addr v6, v8

    .line 523
    sub-float v6, v16, v6

    .line 524
    .line 525
    invoke-static {v2, v1, v11, v3, v6}, Lv/VFrame_FlipContainer$a;->f(Lv/VFrame_FlipContainer$a;Landroid/graphics/Canvas;FFF)V

    .line 526
    .line 527
    .line 528
    invoke-super/range {p0 .. p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 529
    .line 530
    .line 531
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 532
    .line 533
    .line 534
    return-void

    .line 535
    :goto_5
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getOtherChild()Landroid/view/View;

    .line 536
    .line 537
    .line 538
    move-result-object v3

    .line 539
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 540
    .line 541
    .line 542
    invoke-direct {v0}, Lv/VFrame_FlipContainer;->getMainChild()Landroid/view/View;

    .line 543
    .line 544
    .line 545
    move-result-object v3

    .line 546
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 547
    .line 548
    .line 549
    cmpl-float v2, v2, v16

    .line 550
    .line 551
    if-nez v2, :cond_b

    .line 552
    .line 553
    iget-object v2, v0, Lv/VFrame_FlipContainer;->c:Ll/x20;

    .line 554
    .line 555
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 556
    .line 557
    .line 558
    move-result v2

    .line 559
    if-eqz v2, :cond_b

    .line 560
    .line 561
    iget-object v2, v0, Lv/VFrame_FlipContainer;->c:Ll/x20;

    .line 562
    .line 563
    invoke-interface {v2}, Ll/x20;->call()V

    .line 564
    .line 565
    .line 566
    :cond_b
    invoke-super/range {p0 .. p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 567
    .line 568
    .line 569
    return-void
.end method

.method public e(FF)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-gtz v1, :cond_0

    .line 7
    .line 8
    move p1, v2

    .line 9
    :cond_0
    cmpg-float v0, p2, v0

    .line 10
    .line 11
    if-gtz v0, :cond_1

    .line 12
    .line 13
    move p2, v2

    .line 14
    :cond_1
    iput p1, p0, Lv/VFrame_FlipContainer;->j:F

    .line 15
    .line 16
    iput p2, p0, Lv/VFrame_FlipContainer;->k:F

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget v0, p0, Lv/VFrame_FlipContainer;->h:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lv/VFrame_FlipContainer;->a:Lv/VFrame_FlipContainer$b;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lv/VFrame_FlipContainer$b;->d(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lv/VFrame_FlipContainer;->a:Lv/VFrame_FlipContainer$b;

    .line 11
    .line 12
    invoke-static {v0, p0}, Lv/VFrame_FlipContainer$b;->b(Lv/VFrame_FlipContainer$b;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public g(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VFrame_FlipContainer;->c:Ll/x20;

    .line 2
    .line 3
    iget-object p1, p0, Lv/VFrame_FlipContainer;->a:Lv/VFrame_FlipContainer$b;

    .line 4
    .line 5
    invoke-static {p1, p0}, Lv/VFrame_FlipContainer$b;->b(Lv/VFrame_FlipContainer$b;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getAnimDuration()I
    .locals 0

    .line 1
    iget p0, p0, Lv/VFrame_FlipContainer;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public getRotateBg()F
    .locals 0

    .line 1
    iget p0, p0, Lv/VFrame_FlipContainer;->f:F

    .line 2
    .line 3
    return p0
.end method

.method public getRotateFg()F
    .locals 0

    .line 1
    iget p0, p0, Lv/VFrame_FlipContainer;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lv/VFrame_FlipContainer;->b:Lv/VFrame_FlipContainer$a;

    .line 5
    .line 6
    invoke-static {p3}, Lv/VFrame_FlipContainer$a;->b(Lv/VFrame_FlipContainer$a;)Landroid/graphics/RectF;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    int-to-float p1, p1

    .line 11
    int-to-float p2, p2

    .line 12
    const/4 p4, 0x0

    .line 13
    invoke-virtual {p3, p4, p4, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setAnimDuration(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VFrame_FlipContainer;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public setNum(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lv/VFrame_FlipContainer;->getOtherChild()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setOvalScale(F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p1}, Lv/VFrame_FlipContainer;->e(FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setRotateBg(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VFrame_FlipContainer;->f:F

    .line 2
    .line 3
    return-void
.end method

.method public setRotateFg(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VFrame_FlipContainer;->g:F

    .line 2
    .line 3
    return-void
.end method

.method public setRoundRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VFrame_FlipContainer;->i:F

    .line 2
    .line 3
    return-void
.end method
