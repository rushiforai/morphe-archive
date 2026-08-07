.class public Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator$SavedState;
    }
.end annotation


# instance fields
.field public a:F

.field public final b:Landroid/graphics/Paint;

.field public final c:Landroid/graphics/Paint;

.field public final d:Landroid/graphics/Paint;

.field public e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

.field public f:I

.field public g:I

.field public h:I

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:I

.field public m:F

.field public n:I

.field public o:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 159
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 158
    sget v0, Ll/o8c0;->l:I

    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->b:Landroid/graphics/Paint;

    .line 11
    .line 12
    new-instance v2, Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v2, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->c:Landroid/graphics/Paint;

    .line 18
    .line 19
    new-instance v3, Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-direct {v3, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iput-object v3, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->d:Landroid/graphics/Paint;

    .line 25
    .line 26
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->j:Z

    .line 27
    .line 28
    const/high16 v4, -0x40800000    # -1.0f

    .line 29
    .line 30
    iput v4, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->m:F

    .line 31
    .line 32
    const/4 v4, -0x1

    .line 33
    iput v4, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->n:I

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    if-eqz v5, :cond_0

    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    sget-object v5, Ll/hhc0;->j:[I

    .line 43
    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-virtual {p1, p2, v5, p3, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    sget p3, Ll/hhc0;->m:I

    .line 50
    .line 51
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->i:Z

    .line 56
    .line 57
    sget p3, Ll/hhc0;->k:I

    .line 58
    .line 59
    invoke-virtual {p2, p3, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 60
    .line 61
    .line 62
    move-result p3

    .line 63
    iput p3, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->h:I

    .line 64
    .line 65
    sget-object p3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 66
    .line 67
    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 68
    .line 69
    .line 70
    sget v5, Ll/hhc0;->q:I

    .line 71
    .line 72
    invoke-virtual {p2, v5, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 77
    .line 78
    .line 79
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 80
    .line 81
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 82
    .line 83
    .line 84
    sget v0, Ll/hhc0;->t:I

    .line 85
    .line 86
    invoke-virtual {p2, v0, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 91
    .line 92
    .line 93
    sget v0, Ll/hhc0;->u:I

    .line 94
    .line 95
    const/4 v5, 0x0

    .line 96
    invoke-virtual {p2, v0, v5}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v3, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 104
    .line 105
    .line 106
    sget p3, Ll/hhc0;->o:I

    .line 107
    .line 108
    invoke-virtual {p2, p3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 109
    .line 110
    .line 111
    move-result p3

    .line 112
    invoke-virtual {v3, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 113
    .line 114
    .line 115
    sget p3, Ll/hhc0;->r:I

    .line 116
    .line 117
    const/high16 v0, 0x42c80000    # 100.0f

    .line 118
    .line 119
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 120
    .line 121
    .line 122
    move-result p3

    .line 123
    iput p3, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->a:F

    .line 124
    .line 125
    sget p3, Ll/hhc0;->n:I

    .line 126
    .line 127
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 128
    .line 129
    .line 130
    move-result p3

    .line 131
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->k:Z

    .line 132
    .line 133
    sget p3, Ll/hhc0;->l:I

    .line 134
    .line 135
    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 136
    .line 137
    .line 138
    move-result-object p3

    .line 139
    if-eqz p3, :cond_1

    .line 140
    .line 141
    invoke-virtual {p0, p3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 142
    .line 143
    .line 144
    :cond_1
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 145
    .line 146
    .line 147
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-static {p1}, Ll/nkl0;->j(Landroid/view/ViewConfiguration;)I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->l:I

    .line 156
    .line 157
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->f:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->f:I

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->g:I

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final c(I)I
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    if-eq v0, v1, :cond_2

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/cf60;->getCount()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    add-int/2addr v2, v3

    .line 35
    int-to-float v2, v2

    .line 36
    mul-int/lit8 v3, v1, 0x2

    .line 37
    .line 38
    int-to-float v3, v3

    .line 39
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->a:F

    .line 40
    .line 41
    mul-float/2addr v3, p0

    .line 42
    add-float/2addr v2, v3

    .line 43
    add-int/lit8 v1, v1, -0x1

    .line 44
    .line 45
    int-to-float v1, v1

    .line 46
    mul-float/2addr v1, p0

    .line 47
    const/high16 p0, 0x40000000    # 2.0f

    .line 48
    .line 49
    mul-float/2addr v1, p0

    .line 50
    add-float/2addr v2, v1

    .line 51
    const/high16 p0, 0x3f800000    # 1.0f

    .line 52
    .line 53
    add-float/2addr v2, p0

    .line 54
    float-to-int p0, v2

    .line 55
    const/high16 v1, -0x80000000

    .line 56
    .line 57
    if-ne v0, v1, :cond_1

    .line 58
    .line 59
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    :cond_1
    return p0

    .line 64
    :cond_2
    :goto_0
    return p1
.end method

.method public final d(I)I
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    return p1

    .line 14
    :cond_0
    const/high16 v1, 0x40000000    # 2.0f

    .line 15
    .line 16
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->a:F

    .line 17
    .line 18
    mul-float/2addr v2, v1

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    add-float/2addr v2, v1

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    int-to-float p0, p0

    .line 30
    add-float/2addr v2, p0

    .line 31
    const/high16 p0, 0x3f800000    # 1.0f

    .line 32
    .line 33
    add-float/2addr v2, p0

    .line 34
    float-to-int p0, v2

    .line 35
    const/high16 v1, -0x80000000

    .line 36
    .line 37
    if-ne v0, v1, :cond_1

    .line 38
    .line 39
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    :cond_1
    return p0
.end method

.method public e(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->setViewPager(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->setCurrentItem(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 5
    .line 6
    if-eqz v0, :cond_b

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_b

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    instance-of v0, v0, Ll/v5w;

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_4

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorCount()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto/16 :goto_4

    .line 35
    .line 36
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->f:I

    .line 37
    .line 38
    if-lt v1, v0, :cond_2

    .line 39
    .line 40
    add-int/lit8 v0, v0, -0x1

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->setCurrentItem(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->h:I

    .line 47
    .line 48
    if-nez v1, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    goto :goto_0

    .line 67
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    :goto_0
    iget v5, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->a:F

    .line 84
    .line 85
    const/high16 v6, 0x40800000    # 4.0f

    .line 86
    .line 87
    mul-float/2addr v6, v5

    .line 88
    int-to-float v4, v4

    .line 89
    add-float/2addr v4, v5

    .line 90
    int-to-float v7, v2

    .line 91
    add-float/2addr v7, v5

    .line 92
    iget-boolean v8, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->i:Z

    .line 93
    .line 94
    const/high16 v9, 0x40000000    # 2.0f

    .line 95
    .line 96
    if-eqz v8, :cond_4

    .line 97
    .line 98
    sub-int/2addr v1, v2

    .line 99
    sub-int/2addr v1, v3

    .line 100
    int-to-float v1, v1

    .line 101
    add-int/lit8 v2, v0, -0x1

    .line 102
    .line 103
    int-to-float v2, v2

    .line 104
    mul-float/2addr v2, v6

    .line 105
    sub-float/2addr v1, v2

    .line 106
    mul-float v2, v5, v9

    .line 107
    .line 108
    sub-float/2addr v1, v2

    .line 109
    div-float/2addr v1, v9

    .line 110
    add-float/2addr v7, v1

    .line 111
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->c:Landroid/graphics/Paint;

    .line 112
    .line 113
    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    const/4 v2, 0x0

    .line 118
    cmpl-float v1, v1, v2

    .line 119
    .line 120
    if-lez v1, :cond_5

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->c:Landroid/graphics/Paint;

    .line 123
    .line 124
    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    div-float/2addr v1, v9

    .line 129
    sub-float/2addr v5, v1

    .line 130
    :cond_5
    const/4 v1, 0x0

    .line 131
    :goto_1
    if-ge v1, v0, :cond_9

    .line 132
    .line 133
    int-to-float v2, v1

    .line 134
    mul-float/2addr v2, v6

    .line 135
    add-float/2addr v2, v7

    .line 136
    iget v3, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->h:I

    .line 137
    .line 138
    if-nez v3, :cond_6

    .line 139
    .line 140
    move v3, v4

    .line 141
    goto :goto_2

    .line 142
    :cond_6
    move v3, v2

    .line 143
    move v2, v4

    .line 144
    :goto_2
    iget-object v8, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->b:Landroid/graphics/Paint;

    .line 145
    .line 146
    invoke-virtual {v8}, Landroid/graphics/Paint;->getAlpha()I

    .line 147
    .line 148
    .line 149
    move-result v8

    .line 150
    if-lez v8, :cond_7

    .line 151
    .line 152
    iget-object v8, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->b:Landroid/graphics/Paint;

    .line 153
    .line 154
    invoke-virtual {p1, v2, v3, v5, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 155
    .line 156
    .line 157
    :cond_7
    iget v8, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->a:F

    .line 158
    .line 159
    cmpl-float v9, v5, v8

    .line 160
    .line 161
    if-eqz v9, :cond_8

    .line 162
    .line 163
    iget-object v9, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->c:Landroid/graphics/Paint;

    .line 164
    .line 165
    invoke-virtual {p1, v2, v3, v8, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 166
    .line 167
    .line 168
    :cond_8
    add-int/lit8 v1, v1, 0x1

    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_9
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->g:I

    .line 172
    .line 173
    int-to-float v0, v0

    .line 174
    mul-float/2addr v0, v6

    .line 175
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->h:I

    .line 176
    .line 177
    if-nez v1, :cond_a

    .line 178
    .line 179
    add-float/2addr v7, v0

    .line 180
    move v10, v7

    .line 181
    move v7, v4

    .line 182
    move v4, v10

    .line 183
    goto :goto_3

    .line 184
    :cond_a
    add-float/2addr v7, v0

    .line 185
    :goto_3
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->a:F

    .line 186
    .line 187
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->d:Landroid/graphics/Paint;

    .line 188
    .line 189
    invoke-virtual {p1, v4, v7, v0, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 190
    .line 191
    .line 192
    :cond_b
    :goto_4
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->h:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->c(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->d(I)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->d(I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->c(I)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator$SavedState;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/AbsSavedState;->getSuperState()Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-super {p0, v0}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    iget p1, p1, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator$SavedState;->currentPage:I

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->f:I

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->g:I

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator$SavedState;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->f:I

    .line 11
    .line 12
    iput p0, v1, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator$SavedState;->currentPage:I

    .line 13
    .line 14
    return-object v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v0, :cond_10

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    and-int/lit16 v0, v0, 0xff

    .line 31
    .line 32
    if-eqz v0, :cond_e

    .line 33
    .line 34
    const/4 v3, 0x3

    .line 35
    if-eq v0, v1, :cond_9

    .line 36
    .line 37
    const/4 v4, 0x2

    .line 38
    if-eq v0, v4, :cond_6

    .line 39
    .line 40
    if-eq v0, v3, :cond_9

    .line 41
    .line 42
    const/4 v3, 0x5

    .line 43
    if-eq v0, v3, :cond_5

    .line 44
    .line 45
    const/4 v3, 0x6

    .line 46
    if-eq v0, v3, :cond_2

    .line 47
    .line 48
    goto/16 :goto_0

    .line 49
    .line 50
    :cond_2
    invoke-static {p1}, Ll/u610;->b(Landroid/view/MotionEvent;)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-static {p1, v0}, Ll/u610;->d(Landroid/view/MotionEvent;I)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    iget v4, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->n:I

    .line 59
    .line 60
    if-ne v3, v4, :cond_4

    .line 61
    .line 62
    if-nez v0, :cond_3

    .line 63
    .line 64
    move v2, v1

    .line 65
    :cond_3
    invoke-static {p1, v2}, Ll/u610;->d(Landroid/view/MotionEvent;I)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->n:I

    .line 70
    .line 71
    :cond_4
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->n:I

    .line 72
    .line 73
    invoke-static {p1, v0}, Ll/u610;->a(Landroid/view/MotionEvent;I)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-static {p1, v0}, Ll/u610;->e(Landroid/view/MotionEvent;I)F

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->m:F

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :cond_5
    invoke-static {p1}, Ll/u610;->b(Landroid/view/MotionEvent;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-static {p1, v0}, Ll/u610;->e(Landroid/view/MotionEvent;I)F

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    iput v2, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->m:F

    .line 94
    .line 95
    invoke-static {p1, v0}, Ll/u610;->d(Landroid/view/MotionEvent;I)I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->n:I

    .line 100
    .line 101
    goto/16 :goto_0

    .line 102
    .line 103
    :cond_6
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->n:I

    .line 104
    .line 105
    invoke-static {p1, v0}, Ll/u610;->a(Landroid/view/MotionEvent;I)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    invoke-static {p1, v0}, Ll/u610;->e(Landroid/view/MotionEvent;I)F

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->m:F

    .line 114
    .line 115
    sub-float v0, p1, v0

    .line 116
    .line 117
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->o:Z

    .line 118
    .line 119
    if-nez v2, :cond_7

    .line 120
    .line 121
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    iget v3, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->l:I

    .line 126
    .line 127
    int-to-float v3, v3

    .line 128
    cmpl-float v2, v2, v3

    .line 129
    .line 130
    if-lez v2, :cond_7

    .line 131
    .line 132
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->o:Z

    .line 133
    .line 134
    :cond_7
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->o:Z

    .line 135
    .line 136
    if-eqz v2, :cond_f

    .line 137
    .line 138
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->m:F

    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 141
    .line 142
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->C()Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-nez p1, :cond_8

    .line 147
    .line 148
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 149
    .line 150
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->f()Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eqz p1, :cond_f

    .line 155
    .line 156
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->u(F)V

    .line 159
    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_9
    iget-boolean v4, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->o:Z

    .line 163
    .line 164
    if-nez v4, :cond_d

    .line 165
    .line 166
    iget-boolean v4, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->k:Z

    .line 167
    .line 168
    if-eqz v4, :cond_d

    .line 169
    .line 170
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 171
    .line 172
    invoke-virtual {v4}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    invoke-virtual {v4}, Ll/cf60;->getCount()I

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 181
    .line 182
    .line 183
    move-result v5

    .line 184
    int-to-float v5, v5

    .line 185
    const/high16 v6, 0x40000000    # 2.0f

    .line 186
    .line 187
    div-float v6, v5, v6

    .line 188
    .line 189
    const/high16 v7, 0x40c00000    # 6.0f

    .line 190
    .line 191
    div-float/2addr v5, v7

    .line 192
    iget v7, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->f:I

    .line 193
    .line 194
    if-lez v7, :cond_b

    .line 195
    .line 196
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 197
    .line 198
    .line 199
    move-result v7

    .line 200
    sub-float v8, v6, v5

    .line 201
    .line 202
    cmpg-float v7, v7, v8

    .line 203
    .line 204
    if-gez v7, :cond_b

    .line 205
    .line 206
    if-eq v0, v3, :cond_a

    .line 207
    .line 208
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 209
    .line 210
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->f:I

    .line 211
    .line 212
    sub-int/2addr p0, v1

    .line 213
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 214
    .line 215
    .line 216
    :cond_a
    return v1

    .line 217
    :cond_b
    iget v7, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->f:I

    .line 218
    .line 219
    sub-int/2addr v4, v1

    .line 220
    if-ge v7, v4, :cond_d

    .line 221
    .line 222
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    add-float/2addr v6, v5

    .line 227
    cmpl-float p1, p1, v6

    .line 228
    .line 229
    if-lez p1, :cond_d

    .line 230
    .line 231
    if-eq v0, v3, :cond_c

    .line 232
    .line 233
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 234
    .line 235
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->f:I

    .line 236
    .line 237
    add-int/2addr p0, v1

    .line 238
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 239
    .line 240
    .line 241
    :cond_c
    return v1

    .line 242
    :cond_d
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->o:Z

    .line 243
    .line 244
    const/4 p1, -0x1

    .line 245
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->n:I

    .line 246
    .line 247
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 248
    .line 249
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->C()Z

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    if-eqz p1, :cond_f

    .line 254
    .line 255
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 256
    .line 257
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->s()V

    .line 258
    .line 259
    .line 260
    goto :goto_0

    .line 261
    :cond_e
    invoke-static {p1, v2}, Ll/u610;->d(Landroid/view/MotionEvent;I)I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->n:I

    .line 266
    .line 267
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->m:F

    .line 272
    .line 273
    :cond_f
    :goto_0
    return v1

    .line 274
    :cond_10
    :goto_1
    return v2
.end method

.method public setCurrentItem(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->l0(I)V

    .line 14
    .line 15
    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->f:I

    .line 17
    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->g:I

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string p0, "ViewPager has not been bound."

    .line 25
    .line 26
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public setViewPager(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-eqz v0, :cond_1

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 10
    .line 11
    .line 12
    :cond_1
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setIndicatorPageChangeListener(Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_2
    const-string p0, "ViewPager does not have adapter instance."

    .line 28
    .line 29
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
