.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:F

.field public final b:Landroid/graphics/Paint;

.field public final c:Landroid/graphics/Paint;

.field public d:Landroidx/viewpager/widget/ViewPager;

.field public e:I

.field public f:I

.field public g:Z

.field public h:Z

.field public i:F

.field public j:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 120
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 119
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->b:Landroid/graphics/Paint;

    .line 11
    .line 12
    new-instance v2, Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->c:Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    sget v4, Ll/n9c0;->c:I

    .line 31
    .line 32
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    sget v5, Ll/n9c0;->d:I

    .line 37
    .line 38
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    const/high16 v5, 0x40600000    # 3.5f

    .line 43
    .line 44
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    int-to-float v5, v5

    .line 49
    sget-object v6, Ll/vhc0;->h:[I

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    invoke-virtual {p1, p2, v6, p3, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    sget p2, Ll/vhc0;->i:I

    .line 57
    .line 58
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->g:Z

    .line 63
    .line 64
    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 65
    .line 66
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 67
    .line 68
    .line 69
    sget p3, Ll/vhc0;->m:I

    .line 70
    .line 71
    invoke-virtual {p1, p3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 72
    .line 73
    .line 74
    move-result p3

    .line 75
    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 79
    .line 80
    .line 81
    sget p2, Ll/vhc0;->j:I

    .line 82
    .line 83
    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 88
    .line 89
    .line 90
    sget p2, Ll/vhc0;->k:I

    .line 91
    .line 92
    invoke-virtual {p1, p2, v5}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->a:F

    .line 97
    .line 98
    sget p2, Ll/vhc0;->n:I

    .line 99
    .line 100
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->h:Z

    .line 105
    .line 106
    sget p2, Ll/vhc0;->l:I

    .line 107
    .line 108
    const/4 p3, 0x0

    .line 109
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->i:F

    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 116
    .line 117
    .line 118
    return-void
.end method


# virtual methods
.method public a(Landroidx/viewpager/widget/ViewPager;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->setCurrentItem(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->d:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    invoke-virtual {v1}, Ll/cf60;->getCount()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    :goto_0
    return-void

    .line 25
    :cond_2
    iget v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->e:I

    .line 26
    .line 27
    if-lt v2, v1, :cond_3

    .line 28
    .line 29
    add-int/lit8 v1, v1, -0x1

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->setCurrentItem(I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    iget v5, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->a:F

    .line 48
    .line 49
    const/high16 v6, 0x40000000    # 2.0f

    .line 50
    .line 51
    mul-float v7, v5, v6

    .line 52
    .line 53
    iget v8, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->i:F

    .line 54
    .line 55
    add-float/2addr v7, v8

    .line 56
    int-to-float v8, v3

    .line 57
    add-float/2addr v8, v5

    .line 58
    iget-boolean v9, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->g:Z

    .line 59
    .line 60
    if-eqz v9, :cond_4

    .line 61
    .line 62
    sub-int/2addr v2, v3

    .line 63
    sub-int/2addr v2, v4

    .line 64
    int-to-float v2, v2

    .line 65
    add-int/lit8 v3, v1, -0x1

    .line 66
    .line 67
    int-to-float v3, v3

    .line 68
    mul-float/2addr v3, v7

    .line 69
    sub-float/2addr v2, v3

    .line 70
    mul-float/2addr v5, v6

    .line 71
    sub-float/2addr v2, v5

    .line 72
    div-float/2addr v2, v6

    .line 73
    add-float/2addr v8, v2

    .line 74
    :cond_4
    const/4 v2, 0x0

    .line 75
    :goto_1
    if-ge v2, v1, :cond_6

    .line 76
    .line 77
    int-to-float v3, v2

    .line 78
    mul-float/2addr v3, v7

    .line 79
    add-float/2addr v3, v8

    .line 80
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->b:Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-virtual {v4}, Landroid/graphics/Paint;->getAlpha()I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-lez v4, :cond_5

    .line 87
    .line 88
    iget v4, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->a:F

    .line 89
    .line 90
    div-float v5, v4, v6

    .line 91
    .line 92
    sub-float v10, v3, v5

    .line 93
    .line 94
    iget v11, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->j:F

    .line 95
    .line 96
    add-float v12, v3, v5

    .line 97
    .line 98
    add-float v13, v11, v4

    .line 99
    .line 100
    sget v3, Ll/qa00;->c:I

    .line 101
    .line 102
    int-to-float v14, v3

    .line 103
    int-to-float v15, v3

    .line 104
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->b:Landroid/graphics/Paint;

    .line 105
    .line 106
    move-object/from16 v9, p1

    .line 107
    .line 108
    move-object/from16 v16, v3

    .line 109
    .line 110
    invoke-virtual/range {v9 .. v16}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 111
    .line 112
    .line 113
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_6
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->h:Z

    .line 117
    .line 118
    if-eqz v1, :cond_7

    .line 119
    .line 120
    iget v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->f:I

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_7
    iget v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->e:I

    .line 124
    .line 125
    :goto_2
    int-to-float v1, v1

    .line 126
    mul-float/2addr v1, v7

    .line 127
    add-float/2addr v8, v1

    .line 128
    iget v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->a:F

    .line 129
    .line 130
    div-float v2, v1, v6

    .line 131
    .line 132
    sub-float v17, v8, v2

    .line 133
    .line 134
    iget v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->j:F

    .line 135
    .line 136
    add-float v19, v8, v2

    .line 137
    .line 138
    add-float v20, v3, v1

    .line 139
    .line 140
    sget v1, Ll/qa00;->c:I

    .line 141
    .line 142
    int-to-float v2, v1

    .line 143
    int-to-float v1, v1

    .line 144
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->c:Landroid/graphics/Paint;

    .line 145
    .line 146
    move-object/from16 v16, p1

    .line 147
    .line 148
    move-object/from16 v23, v0

    .line 149
    .line 150
    move/from16 v22, v1

    .line 151
    .line 152
    move/from16 v21, v2

    .line 153
    .line 154
    move/from16 v18, v3

    .line 155
    .line 156
    invoke-virtual/range {v16 .. v23}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    int-to-float p1, p1

    .line 9
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->a:F

    .line 10
    .line 11
    sub-float/2addr p1, p2

    .line 12
    const/high16 p2, 0x40000000    # 2.0f

    .line 13
    .line 14
    div-float/2addr p1, p2

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->j:F

    .line 16
    .line 17
    return-void
.end method

.method public setCurrentItem(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->d:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->d:Landroidx/viewpager/widget/ViewPager;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->e:I

    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->f:I

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setViewPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->d:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->d:Landroidx/viewpager/widget/ViewPager;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
