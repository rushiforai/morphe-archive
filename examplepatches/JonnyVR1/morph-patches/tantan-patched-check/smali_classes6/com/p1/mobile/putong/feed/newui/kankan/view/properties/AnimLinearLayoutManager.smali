.class public Lcom/p1/mobile/putong/feed/newui/kankan/view/properties/AnimLinearLayoutManager;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    const/high16 v2, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v1, v2

    .line 11
    const/high16 v3, 0x3fc00000    # 1.5f

    .line 12
    .line 13
    mul-float/2addr v3, v1

    .line 14
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    const/4 v5, 0x0

    .line 19
    const/4 v6, 0x0

    .line 20
    move v8, v5

    .line 21
    move v7, v6

    .line 22
    :goto_0
    if-ge v7, v4, :cond_6

    .line 23
    .line 24
    invoke-virtual {v0, v7}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v9

    .line 28
    check-cast v9, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceCategoryView;

    .line 29
    .line 30
    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    .line 31
    .line 32
    .line 33
    move-result v10

    .line 34
    invoke-virtual {v9}, Landroid/view/View;->getRight()I

    .line 35
    .line 36
    .line 37
    move-result v11

    .line 38
    add-int/2addr v10, v11

    .line 39
    int-to-float v10, v10

    .line 40
    div-float/2addr v10, v2

    .line 41
    sub-float v11, v10, v1

    .line 42
    .line 43
    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    .line 44
    .line 45
    .line 46
    move-result v11

    .line 47
    const/high16 v12, 0x42960000    # 75.0f

    .line 48
    .line 49
    invoke-static {v12}, Ll/bnl0;->w(F)I

    .line 50
    .line 51
    .line 52
    move-result v12

    .line 53
    int-to-float v12, v12

    .line 54
    cmpg-float v12, v11, v12

    .line 55
    .line 56
    const/4 v13, 0x1

    .line 57
    if-gez v12, :cond_0

    .line 58
    .line 59
    move v12, v13

    .line 60
    goto :goto_1

    .line 61
    :cond_0
    move v12, v6

    .line 62
    :goto_1
    invoke-virtual {v9, v12}, Landroid/view/View;->setActivated(Z)V

    .line 63
    .line 64
    .line 65
    const/high16 v12, 0x3f800000    # 1.0f

    .line 66
    .line 67
    if-nez v7, :cond_2

    .line 68
    .line 69
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    .line 70
    .line 71
    .line 72
    move-result v14

    .line 73
    int-to-float v14, v14

    .line 74
    div-float v14, v11, v14

    .line 75
    .line 76
    cmpl-float v15, v14, v12

    .line 77
    .line 78
    if-lez v15, :cond_1

    .line 79
    .line 80
    move v14, v12

    .line 81
    :cond_1
    iget-object v15, v9, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceCategoryView;->b:Landroid/widget/ImageView;

    .line 82
    .line 83
    invoke-virtual {v15}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object v15

    .line 87
    sub-float v16, v12, v14

    .line 88
    .line 89
    const/high16 v17, 0x437f0000    # 255.0f

    .line 90
    .line 91
    move/from16 v18, v2

    .line 92
    .line 93
    mul-float v2, v16, v17

    .line 94
    .line 95
    float-to-int v2, v2

    .line 96
    invoke-virtual {v15, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 97
    .line 98
    .line 99
    iget-object v2, v9, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceCategoryView;->b:Landroid/widget/ImageView;

    .line 100
    .line 101
    mul-float v14, v14, v17

    .line 102
    .line 103
    float-to-int v14, v14

    .line 104
    invoke-virtual {v2, v14}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_2
    move/from16 v18, v2

    .line 109
    .line 110
    :goto_2
    div-float/2addr v11, v3

    .line 111
    const v2, 0x3e99999a    # 0.3f

    .line 112
    .line 113
    .line 114
    mul-float/2addr v11, v2

    .line 115
    sub-float v2, v12, v11

    .line 116
    .line 117
    invoke-virtual {v9, v2}, Landroid/view/View;->setScaleX(F)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v9, v2}, Landroid/view/View;->setScaleY(F)V

    .line 121
    .line 122
    .line 123
    cmpl-float v10, v10, v1

    .line 124
    .line 125
    if-lez v10, :cond_3

    .line 126
    .line 127
    const/4 v10, -0x1

    .line 128
    goto :goto_3

    .line 129
    :cond_3
    move v10, v13

    .line 130
    :goto_3
    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    .line 131
    .line 132
    .line 133
    move-result v11

    .line 134
    mul-int/2addr v10, v11

    .line 135
    int-to-float v10, v10

    .line 136
    sub-float/2addr v12, v2

    .line 137
    mul-float/2addr v10, v12

    .line 138
    div-float v10, v10, v18

    .line 139
    .line 140
    add-float/2addr v8, v10

    .line 141
    invoke-virtual {v9, v8}, Landroid/view/View;->setTranslationX(F)V

    .line 142
    .line 143
    .line 144
    cmpl-float v2, v10, v5

    .line 145
    .line 146
    if-lez v2, :cond_4

    .line 147
    .line 148
    if-lt v7, v13, :cond_4

    .line 149
    .line 150
    add-int/lit8 v2, v7, -0x1

    .line 151
    .line 152
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v8

    .line 156
    invoke-virtual {v8}, Landroid/view/View;->getTranslationX()F

    .line 157
    .line 158
    .line 159
    move-result v8

    .line 160
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    mul-float v10, v10, v18

    .line 165
    .line 166
    add-float/2addr v8, v10

    .line 167
    invoke-virtual {v2, v8}, Landroid/view/View;->setTranslationX(F)V

    .line 168
    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_4
    cmpg-float v2, v10, v5

    .line 172
    .line 173
    if-gez v2, :cond_5

    .line 174
    .line 175
    mul-float v10, v10, v18

    .line 176
    .line 177
    move v8, v10

    .line 178
    goto :goto_5

    .line 179
    :cond_5
    :goto_4
    move v8, v5

    .line 180
    :goto_5
    add-int/lit8 v7, v7, 0x1

    .line 181
    .line 182
    move/from16 v2, v18

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :cond_6
    return-void
.end method

.method public getExtraLayoutSpace(Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    mul-int/lit8 p0, p0, 0x2

    .line 6
    .line 7
    return p0
.end method

.method public onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onLayoutCompleted(Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->onLayoutCompleted(Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/properties/AnimLinearLayoutManager;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/properties/AnimLinearLayoutManager;->a()V

    .line 6
    .line 7
    .line 8
    return p1
.end method
