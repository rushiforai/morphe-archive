.class public Lv/VSlidingTabStrip;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/VSlidingTabStrip$a;
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:Landroid/graphics/Paint;

.field public c:I

.field public final d:Landroid/graphics/Paint;

.field public final e:I

.field public final f:Landroid/graphics/Paint;

.field public final g:F

.field public h:I

.field public i:F

.field public j:Lv/VSlidingTabs$c;

.field public final k:Lv/VSlidingTabStrip$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 123
    invoke-direct {p0, p1, v0}, Lv/VSlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    invoke-virtual {p0, p2}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    .line 17
    .line 18
    new-instance v0, Landroid/util/TypedValue;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const v1, 0x1010030

    .line 28
    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {p1, v1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 32
    .line 33
    .line 34
    iget p1, v0, Landroid/util/TypedValue;->data:I

    .line 35
    .line 36
    const/16 v0, 0x26

    .line 37
    .line 38
    invoke-static {p1, v0}, Lv/VSlidingTabStrip;->b(IB)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lv/VSlidingTabStrip;->e:I

    .line 43
    .line 44
    new-instance v1, Lv/VSlidingTabStrip$a;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-direct {v1, v2}, Lv/VSlidingTabStrip$a;-><init>(Ll/pzk0;)V

    .line 48
    .line 49
    .line 50
    iput-object v1, p0, Lv/VSlidingTabStrip;->k:Lv/VSlidingTabStrip$a;

    .line 51
    .line 52
    const v2, -0x36d0e1

    .line 53
    .line 54
    .line 55
    filled-new-array {v2}, [I

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, v2}, Lv/VSlidingTabStrip$a;->d([I)V

    .line 60
    .line 61
    .line 62
    const/16 v2, 0x20

    .line 63
    .line 64
    invoke-static {p1, v2}, Lv/VSlidingTabStrip;->b(IB)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    filled-new-array {p1}, [I

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {v1, p1}, Lv/VSlidingTabStrip$a;->c([I)V

    .line 73
    .line 74
    .line 75
    const/4 p1, 0x0

    .line 76
    mul-float/2addr p1, p2

    .line 77
    float-to-int p1, p1

    .line 78
    iput p1, p0, Lv/VSlidingTabStrip;->a:I

    .line 79
    .line 80
    new-instance p1, Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, Lv/VSlidingTabStrip;->b:Landroid/graphics/Paint;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 88
    .line 89
    .line 90
    const/high16 p1, 0x40000000    # 2.0f

    .line 91
    .line 92
    mul-float/2addr p1, p2

    .line 93
    float-to-int p1, p1

    .line 94
    iput p1, p0, Lv/VSlidingTabStrip;->c:I

    .line 95
    .line 96
    new-instance p1, Landroid/graphics/Paint;

    .line 97
    .line 98
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object p1, p0, Lv/VSlidingTabStrip;->d:Landroid/graphics/Paint;

    .line 102
    .line 103
    const/high16 p1, 0x3f000000    # 0.5f

    .line 104
    .line 105
    iput p1, p0, Lv/VSlidingTabStrip;->g:F

    .line 106
    .line 107
    new-instance p1, Landroid/graphics/Paint;

    .line 108
    .line 109
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-object p1, p0, Lv/VSlidingTabStrip;->f:Landroid/graphics/Paint;

    .line 113
    .line 114
    const/high16 p0, 0x3f800000    # 1.0f

    .line 115
    .line 116
    mul-float/2addr p2, p0

    .line 117
    float-to-int p0, p2

    .line 118
    int-to-float p0, p0

    .line 119
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static b(IB)I
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p1, v0, v1, p0}, Landroid/graphics/Color;->argb(IIII)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method


# virtual methods
.method public a(IF)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VSlidingTabStrip;->h:I

    .line 2
    .line 3
    iput p2, p0, Lv/VSlidingTabStrip;->i:F

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget v3, v0, Lv/VSlidingTabStrip;->g:F

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    invoke-static {v4, v3}, Ljava/lang/Math;->max(FF)F

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    const/high16 v5, 0x3f800000    # 1.0f

    .line 19
    .line 20
    invoke-static {v3, v5}, Ljava/lang/Math;->min(FF)F

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    int-to-float v10, v1

    .line 25
    mul-float/2addr v3, v10

    .line 26
    float-to-int v3, v3

    .line 27
    iget-object v6, v0, Lv/VSlidingTabStrip;->j:Lv/VSlidingTabs$c;

    .line 28
    .line 29
    if-eqz v6, :cond_0

    .line 30
    .line 31
    :goto_0
    move-object v12, v6

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    iget-object v6, v0, Lv/VSlidingTabStrip;->k:Lv/VSlidingTabStrip$a;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :goto_1
    if-lez v2, :cond_3

    .line 37
    .line 38
    iget v6, v0, Lv/VSlidingTabStrip;->h:I

    .line 39
    .line 40
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    .line 45
    .line 46
    .line 47
    move-result v7

    .line 48
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    iget v8, v0, Lv/VSlidingTabStrip;->h:I

    .line 53
    .line 54
    invoke-interface {v12, v8}, Lv/VSlidingTabs$c;->a(I)I

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    iget v9, v0, Lv/VSlidingTabStrip;->i:F

    .line 59
    .line 60
    cmpl-float v4, v9, v4

    .line 61
    .line 62
    if-lez v4, :cond_2

    .line 63
    .line 64
    iget v4, v0, Lv/VSlidingTabStrip;->h:I

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 67
    .line 68
    .line 69
    move-result v9

    .line 70
    add-int/lit8 v9, v9, -0x1

    .line 71
    .line 72
    if-ge v4, v9, :cond_2

    .line 73
    .line 74
    iget v4, v0, Lv/VSlidingTabStrip;->h:I

    .line 75
    .line 76
    add-int/lit8 v4, v4, 0x1

    .line 77
    .line 78
    invoke-interface {v12, v4}, Lv/VSlidingTabs$c;->a(I)I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eq v8, v4, :cond_1

    .line 83
    .line 84
    iget v9, v0, Lv/VSlidingTabStrip;->i:F

    .line 85
    .line 86
    invoke-static {v4, v8, v9}, Ll/ye5;->a(IIF)I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    :cond_1
    iget v4, v0, Lv/VSlidingTabStrip;->h:I

    .line 91
    .line 92
    add-int/lit8 v4, v4, 0x1

    .line 93
    .line 94
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    iget v9, v0, Lv/VSlidingTabStrip;->i:F

    .line 99
    .line 100
    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    .line 101
    .line 102
    .line 103
    move-result v11

    .line 104
    int-to-float v11, v11

    .line 105
    mul-float/2addr v9, v11

    .line 106
    iget v11, v0, Lv/VSlidingTabStrip;->i:F

    .line 107
    .line 108
    sub-float v13, v5, v11

    .line 109
    .line 110
    int-to-float v7, v7

    .line 111
    mul-float/2addr v13, v7

    .line 112
    add-float/2addr v9, v13

    .line 113
    float-to-int v7, v9

    .line 114
    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    int-to-float v4, v4

    .line 119
    mul-float/2addr v11, v4

    .line 120
    iget v4, v0, Lv/VSlidingTabStrip;->i:F

    .line 121
    .line 122
    sub-float/2addr v5, v4

    .line 123
    int-to-float v4, v6

    .line 124
    mul-float/2addr v5, v4

    .line 125
    add-float/2addr v11, v5

    .line 126
    float-to-int v6, v11

    .line 127
    :cond_2
    iget-object v4, v0, Lv/VSlidingTabStrip;->d:Landroid/graphics/Paint;

    .line 128
    .line 129
    invoke-virtual {v4, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 130
    .line 131
    .line 132
    int-to-float v7, v7

    .line 133
    iget v4, v0, Lv/VSlidingTabStrip;->c:I

    .line 134
    .line 135
    sub-int v4, v1, v4

    .line 136
    .line 137
    int-to-float v8, v4

    .line 138
    int-to-float v9, v6

    .line 139
    iget-object v11, v0, Lv/VSlidingTabStrip;->d:Landroid/graphics/Paint;

    .line 140
    .line 141
    move-object/from16 v6, p1

    .line 142
    .line 143
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 144
    .line 145
    .line 146
    :cond_3
    iget v4, v0, Lv/VSlidingTabStrip;->a:I

    .line 147
    .line 148
    sub-int v4, v1, v4

    .line 149
    .line 150
    int-to-float v8, v4

    .line 151
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    int-to-float v9, v4

    .line 156
    iget-object v11, v0, Lv/VSlidingTabStrip;->b:Landroid/graphics/Paint;

    .line 157
    .line 158
    const/4 v7, 0x0

    .line 159
    move-object/from16 v6, p1

    .line 160
    .line 161
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 162
    .line 163
    .line 164
    sub-int/2addr v1, v3

    .line 165
    div-int/lit8 v1, v1, 0x2

    .line 166
    .line 167
    const/4 v4, 0x0

    .line 168
    :goto_2
    add-int/lit8 v5, v2, -0x1

    .line 169
    .line 170
    if-ge v4, v5, :cond_4

    .line 171
    .line 172
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    iget-object v6, v0, Lv/VSlidingTabStrip;->f:Landroid/graphics/Paint;

    .line 177
    .line 178
    invoke-interface {v12, v4}, Lv/VSlidingTabs$c;->b(I)I

    .line 179
    .line 180
    .line 181
    move-result v7

    .line 182
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    int-to-float v14, v6

    .line 190
    int-to-float v15, v1

    .line 191
    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    .line 192
    .line 193
    .line 194
    move-result v5

    .line 195
    int-to-float v5, v5

    .line 196
    add-int v6, v1, v3

    .line 197
    .line 198
    int-to-float v6, v6

    .line 199
    iget-object v7, v0, Lv/VSlidingTabStrip;->f:Landroid/graphics/Paint;

    .line 200
    .line 201
    move-object/from16 v13, p1

    .line 202
    .line 203
    move/from16 v16, v5

    .line 204
    .line 205
    move/from16 v17, v6

    .line 206
    .line 207
    move-object/from16 v18, v7

    .line 208
    .line 209
    invoke-virtual/range {v13 .. v18}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 210
    .line 211
    .line 212
    add-int/lit8 v4, v4, 0x1

    .line 213
    .line 214
    goto :goto_2

    .line 215
    :cond_4
    return-void
.end method

.method public setCustomTabColorizer(Lv/VSlidingTabs$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSlidingTabStrip;->j:Lv/VSlidingTabs$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public varargs setDividerColors([I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lv/VSlidingTabStrip;->j:Lv/VSlidingTabs$c;

    .line 3
    .line 4
    iget-object v0, p0, Lv/VSlidingTabStrip;->k:Lv/VSlidingTabStrip$a;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lv/VSlidingTabStrip$a;->c([I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public varargs setSelectedIndicatorColors([I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lv/VSlidingTabStrip;->j:Lv/VSlidingTabs$c;

    .line 3
    .line 4
    iget-object v0, p0, Lv/VSlidingTabStrip;->k:Lv/VSlidingTabStrip$a;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lv/VSlidingTabStrip$a;->d([I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setSelectedIndicatorThickness(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VSlidingTabStrip;->c:I

    .line 2
    .line 3
    return-void
.end method
