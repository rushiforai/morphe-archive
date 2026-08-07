.class public Lorg/apmem/tools/layouts/FlowLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;
    }
.end annotation


# static fields
.field public static final HORIZONTAL:I = 0x0

.field public static final LAYOUT_DIRECTION_LTR:I = 0x0

.field public static final LAYOUT_DIRECTION_RTL:I = 0x1

.field public static final VERTICAL:I = 0x1


# instance fields
.field private final config:Lorg/apmem/tools/layouts/LayoutConfiguration;

.field lines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/apmem/tools/layouts/LineDefinition;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, p1, v1}, Lorg/apmem/tools/layouts/LayoutConfiguration;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 20
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 22
    new-instance v0, Lorg/apmem/tools/layouts/LayoutConfiguration;

    invoke-direct {v0, p1, p2}, Lorg/apmem/tools/layouts/LayoutConfiguration;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 24
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 25
    new-instance p3, Lorg/apmem/tools/layouts/LayoutConfiguration;

    invoke-direct {p3, p1, p2}, Lorg/apmem/tools/layouts/LayoutConfiguration;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object p3, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    return-void
.end method

.method private applyGravityToLine(Lorg/apmem/tools/layouts/LineDefinition;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Lorg/apmem/tools/layouts/LineDefinition;->getViews()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-gtz v2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    move v6, v3

    .line 18
    move v5, v4

    .line 19
    :goto_0
    if-ge v5, v2, :cond_1

    .line 20
    .line 21
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    check-cast v7, Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    check-cast v7, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 32
    .line 33
    invoke-direct {v0, v7}, Lorg/apmem/tools/layouts/FlowLayout;->getWeight(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)F

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    add-float/2addr v6, v7

    .line 38
    add-int/lit8 v5, v5, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    add-int/lit8 v5, v2, -0x1

    .line 42
    .line 43
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    check-cast v5, Landroid/view/View;

    .line 48
    .line 49
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    check-cast v5, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 54
    .line 55
    invoke-virtual/range {p1 .. p1}, Lorg/apmem/tools/layouts/LineDefinition;->getLineLength()I

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    invoke-virtual {v5}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getLength()I

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    invoke-virtual {v5}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getSpacingLength()I

    .line 64
    .line 65
    .line 66
    move-result v9

    .line 67
    add-int/2addr v8, v9

    .line 68
    invoke-virtual {v5}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getInlineStartLength()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    add-int/2addr v8, v5

    .line 73
    sub-int/2addr v7, v8

    .line 74
    move v5, v4

    .line 75
    move v8, v5

    .line 76
    :goto_1
    if-ge v5, v2, :cond_3

    .line 77
    .line 78
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v9

    .line 82
    check-cast v9, Landroid/view/View;

    .line 83
    .line 84
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 85
    .line 86
    .line 87
    move-result-object v9

    .line 88
    check-cast v9, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 89
    .line 90
    invoke-direct {v0, v9}, Lorg/apmem/tools/layouts/FlowLayout;->getWeight(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)F

    .line 91
    .line 92
    .line 93
    move-result v10

    .line 94
    invoke-direct {v0, v9}, Lorg/apmem/tools/layouts/FlowLayout;->getGravity(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)I

    .line 95
    .line 96
    .line 97
    move-result v11

    .line 98
    cmpl-float v12, v6, v3

    .line 99
    .line 100
    if-nez v12, :cond_2

    .line 101
    .line 102
    div-int v10, v7, v2

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_2
    int-to-float v12, v7

    .line 106
    mul-float/2addr v12, v10

    .line 107
    div-float/2addr v12, v6

    .line 108
    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    .line 109
    .line 110
    .line 111
    move-result v10

    .line 112
    :goto_2
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getLength()I

    .line 113
    .line 114
    .line 115
    move-result v12

    .line 116
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getSpacingLength()I

    .line 117
    .line 118
    .line 119
    move-result v13

    .line 120
    add-int/2addr v12, v13

    .line 121
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getThickness()I

    .line 122
    .line 123
    .line 124
    move-result v13

    .line 125
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getSpacingThickness()I

    .line 126
    .line 127
    .line 128
    move-result v14

    .line 129
    add-int/2addr v13, v14

    .line 130
    new-instance v14, Landroid/graphics/Rect;

    .line 131
    .line 132
    invoke-direct {v14}, Landroid/graphics/Rect;-><init>()V

    .line 133
    .line 134
    .line 135
    iput v4, v14, Landroid/graphics/Rect;->top:I

    .line 136
    .line 137
    iput v8, v14, Landroid/graphics/Rect;->left:I

    .line 138
    .line 139
    add-int v15, v12, v10

    .line 140
    .line 141
    add-int/2addr v15, v8

    .line 142
    iput v15, v14, Landroid/graphics/Rect;->right:I

    .line 143
    .line 144
    invoke-virtual/range {p1 .. p1}, Lorg/apmem/tools/layouts/LineDefinition;->getLineThickness()I

    .line 145
    .line 146
    .line 147
    move-result v15

    .line 148
    iput v15, v14, Landroid/graphics/Rect;->bottom:I

    .line 149
    .line 150
    new-instance v15, Landroid/graphics/Rect;

    .line 151
    .line 152
    invoke-direct {v15}, Landroid/graphics/Rect;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-static {v11, v12, v13, v14, v15}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 156
    .line 157
    .line 158
    add-int/2addr v8, v10

    .line 159
    iget v10, v15, Landroid/graphics/Rect;->left:I

    .line 160
    .line 161
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getInlineStartLength()I

    .line 162
    .line 163
    .line 164
    move-result v11

    .line 165
    add-int/2addr v10, v11

    .line 166
    invoke-virtual {v9, v10}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setInlineStartLength(I)V

    .line 167
    .line 168
    .line 169
    iget v10, v15, Landroid/graphics/Rect;->top:I

    .line 170
    .line 171
    invoke-virtual {v9, v10}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setInlineStartThickness(I)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v15}, Landroid/graphics/Rect;->width()I

    .line 175
    .line 176
    .line 177
    move-result v10

    .line 178
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getSpacingLength()I

    .line 179
    .line 180
    .line 181
    move-result v11

    .line 182
    sub-int/2addr v10, v11

    .line 183
    invoke-virtual {v9, v10}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setLength(I)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v15}, Landroid/graphics/Rect;->height()I

    .line 187
    .line 188
    .line 189
    move-result v10

    .line 190
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getSpacingThickness()I

    .line 191
    .line 192
    .line 193
    move-result v11

    .line 194
    sub-int/2addr v10, v11

    .line 195
    invoke-virtual {v9, v10}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setThickness(I)V

    .line 196
    .line 197
    .line 198
    add-int/lit8 v5, v5, 0x1

    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_3
    :goto_3
    return-void
.end method

.method private applyGravityToLines(Ljava/util/List;II)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/apmem/tools/layouts/LineDefinition;",
            ">;II)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    add-int/lit8 v1, v0, -0x1

    .line 9
    .line 10
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lorg/apmem/tools/layouts/LineDefinition;

    .line 15
    .line 16
    invoke-virtual {v1}, Lorg/apmem/tools/layouts/LineDefinition;->getLineThickness()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v1}, Lorg/apmem/tools/layouts/LineDefinition;->getLineStartThickness()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v2, v1

    .line 25
    sub-int/2addr p3, v2

    .line 26
    const/4 v1, 0x0

    .line 27
    if-gez p3, :cond_1

    .line 28
    .line 29
    move p3, v1

    .line 30
    :cond_1
    move v2, v1

    .line 31
    move v3, v2

    .line 32
    :goto_0
    if-ge v2, v0, :cond_2

    .line 33
    .line 34
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    check-cast v4, Lorg/apmem/tools/layouts/LineDefinition;

    .line 39
    .line 40
    const/4 v5, 0x0

    .line 41
    invoke-direct {p0, v5}, Lorg/apmem/tools/layouts/FlowLayout;->getGravity(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    div-int v6, p3, v0

    .line 46
    .line 47
    int-to-float v6, v6

    .line 48
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/LineDefinition;->getLineLength()I

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/LineDefinition;->getLineThickness()I

    .line 57
    .line 58
    .line 59
    move-result v8

    .line 60
    new-instance v9, Landroid/graphics/Rect;

    .line 61
    .line 62
    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    .line 63
    .line 64
    .line 65
    iput v3, v9, Landroid/graphics/Rect;->top:I

    .line 66
    .line 67
    iput v1, v9, Landroid/graphics/Rect;->left:I

    .line 68
    .line 69
    iput p2, v9, Landroid/graphics/Rect;->right:I

    .line 70
    .line 71
    add-int v10, v8, v6

    .line 72
    .line 73
    add-int/2addr v10, v3

    .line 74
    iput v10, v9, Landroid/graphics/Rect;->bottom:I

    .line 75
    .line 76
    new-instance v10, Landroid/graphics/Rect;

    .line 77
    .line 78
    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {v5, v7, v8, v9, v10}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 82
    .line 83
    .line 84
    add-int/2addr v3, v6

    .line 85
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/LineDefinition;->getLineStartLength()I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    iget v6, v10, Landroid/graphics/Rect;->left:I

    .line 90
    .line 91
    add-int/2addr v5, v6

    .line 92
    invoke-virtual {v4, v5}, Lorg/apmem/tools/layouts/LineDefinition;->setLineStartLength(I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/LineDefinition;->getLineStartThickness()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    iget v6, v10, Landroid/graphics/Rect;->top:I

    .line 100
    .line 101
    add-int/2addr v5, v6

    .line 102
    invoke-virtual {v4, v5}, Lorg/apmem/tools/layouts/LineDefinition;->setLineStartThickness(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    invoke-virtual {v4, v5}, Lorg/apmem/tools/layouts/LineDefinition;->setLength(I)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    invoke-virtual {v4, v5}, Lorg/apmem/tools/layouts/LineDefinition;->setThickness(I)V

    .line 117
    .line 118
    .line 119
    add-int/lit8 v2, v2, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_2
    :goto_1
    return-void
.end method

.method private applyPositionsToViews(Lorg/apmem/tools/layouts/LineDefinition;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/LineDefinition;->getViews()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_1

    .line 11
    .line 12
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    check-cast v4, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 23
    .line 24
    iget-object v5, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 25
    .line 26
    invoke-virtual {v5}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    const/high16 v6, 0x40000000    # 2.0f

    .line 31
    .line 32
    if-nez v5, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/LineDefinition;->getLineStartLength()I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    add-int/2addr v5, v7

    .line 43
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getInlineStartLength()I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    add-int/2addr v5, v7

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/LineDefinition;->getLineStartThickness()I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    add-int/2addr v7, v8

    .line 57
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getInlineStartThickness()I

    .line 58
    .line 59
    .line 60
    move-result v8

    .line 61
    add-int/2addr v7, v8

    .line 62
    invoke-virtual {v4, v5, v7}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setPosition(II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getLength()I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getThickness()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    invoke-virtual {v3, v5, v4}, Landroid/view/View;->measure(II)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/LineDefinition;->getLineStartThickness()I

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    add-int/2addr v5, v7

    .line 94
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getInlineStartThickness()I

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    add-int/2addr v5, v7

    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/LineDefinition;->getLineStartLength()I

    .line 104
    .line 105
    .line 106
    move-result v8

    .line 107
    add-int/2addr v7, v8

    .line 108
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getInlineStartLength()I

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    add-int/2addr v7, v8

    .line 113
    invoke-virtual {v4, v5, v7}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setPosition(II)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getThickness()I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getLength()I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    invoke-virtual {v3, v5, v4}, Landroid/view/View;->measure(II)V

    .line 133
    .line 134
    .line 135
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_1
    return-void
.end method

.method private calculateLinesAndChildPosition(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/apmem/tools/layouts/LineDefinition;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v1, p0, :cond_1

    .line 9
    .line 10
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    check-cast v3, Lorg/apmem/tools/layouts/LineDefinition;

    .line 15
    .line 16
    invoke-virtual {v3, v2}, Lorg/apmem/tools/layouts/LineDefinition;->setLineStartThickness(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v3}, Lorg/apmem/tools/layouts/LineDefinition;->getLineThickness()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    add-int/2addr v2, v4

    .line 24
    invoke-virtual {v3}, Lorg/apmem/tools/layouts/LineDefinition;->getViews()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    move v5, v0

    .line 33
    move v6, v5

    .line 34
    :goto_1
    if-ge v5, v4, :cond_0

    .line 35
    .line 36
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    check-cast v7, Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    check-cast v7, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 47
    .line 48
    invoke-virtual {v7, v6}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setInlineStartLength(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v7}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getLength()I

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    invoke-virtual {v7}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getSpacingLength()I

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    add-int/2addr v8, v7

    .line 60
    add-int/2addr v6, v8

    .line 61
    add-int/lit8 v5, v5, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    return-void
.end method

.method private createPaint(I)Landroid/graphics/Paint;
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    const/high16 p1, 0x40000000    # 2.0f

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method private debugDraw()Z
    .locals 3

    .line 1
    :try_start_0
    const-class v0, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const-string v1, "debugDraw"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 12
    .line 13
    .line 14
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return p0

    .line 29
    :catch_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method private drawDebugInfo(Landroid/graphics/Canvas;Landroid/view/View;)V
    .locals 13

    .line 1
    invoke-virtual {p0}, Lorg/apmem/tools/layouts/FlowLayout;->isDebugDraw()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    const/16 v0, -0x100

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lorg/apmem/tools/layouts/FlowLayout;->createPaint(I)Landroid/graphics/Paint;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    const/high16 v0, -0x10000

    .line 16
    .line 17
    invoke-direct {p0, v0}, Lorg/apmem/tools/layouts/FlowLayout;->createPaint(I)Landroid/graphics/Paint;

    .line 18
    .line 19
    .line 20
    move-result-object v12

    .line 21
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 26
    .line 27
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 28
    .line 29
    const/high16 v7, 0x40000000    # 2.0f

    .line 30
    .line 31
    const/high16 v8, 0x40800000    # 4.0f

    .line 32
    .line 33
    if-lez v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v2, v1

    .line 40
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    int-to-float v1, v1

    .line 45
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    int-to-float v3, v3

    .line 50
    div-float/2addr v3, v7

    .line 51
    add-float v5, v1, v3

    .line 52
    .line 53
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 54
    .line 55
    int-to-float v1, v1

    .line 56
    add-float v4, v2, v1

    .line 57
    .line 58
    move v3, v5

    .line 59
    move-object v1, p1

    .line 60
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 61
    .line 62
    .line 63
    move v9, v2

    .line 64
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 65
    .line 66
    int-to-float v2, v1

    .line 67
    add-float/2addr v2, v9

    .line 68
    sub-float/2addr v2, v8

    .line 69
    sub-float v5, v3, v8

    .line 70
    .line 71
    int-to-float v1, v1

    .line 72
    add-float v4, v9, v1

    .line 73
    .line 74
    move v1, v5

    .line 75
    move v5, v3

    .line 76
    move v3, v1

    .line 77
    move-object v1, p1

    .line 78
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 79
    .line 80
    .line 81
    move v3, v5

    .line 82
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 83
    .line 84
    int-to-float v2, v1

    .line 85
    add-float/2addr v2, v9

    .line 86
    sub-float/2addr v2, v8

    .line 87
    add-float v5, v3, v8

    .line 88
    .line 89
    int-to-float v1, v1

    .line 90
    add-float v4, v9, v1

    .line 91
    .line 92
    move v1, v5

    .line 93
    move v5, v3

    .line 94
    move v3, v1

    .line 95
    move-object v1, p1

    .line 96
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 97
    .line 98
    .line 99
    :cond_1
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 100
    .line 101
    if-lez v1, :cond_2

    .line 102
    .line 103
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    int-to-float v2, v1

    .line 108
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    int-to-float v1, v1

    .line 113
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    int-to-float v3, v3

    .line 118
    div-float/2addr v3, v7

    .line 119
    add-float v5, v1, v3

    .line 120
    .line 121
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 122
    .line 123
    int-to-float v1, v1

    .line 124
    sub-float v4, v2, v1

    .line 125
    .line 126
    move v3, v5

    .line 127
    move-object v1, p1

    .line 128
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 129
    .line 130
    .line 131
    move v9, v2

    .line 132
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 133
    .line 134
    int-to-float v2, v1

    .line 135
    sub-float v2, v9, v2

    .line 136
    .line 137
    add-float/2addr v2, v8

    .line 138
    sub-float v5, v3, v8

    .line 139
    .line 140
    int-to-float v1, v1

    .line 141
    sub-float v4, v9, v1

    .line 142
    .line 143
    move v1, v5

    .line 144
    move v5, v3

    .line 145
    move v3, v1

    .line 146
    move-object v1, p1

    .line 147
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 148
    .line 149
    .line 150
    move v3, v5

    .line 151
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 152
    .line 153
    int-to-float v2, v1

    .line 154
    sub-float v2, v9, v2

    .line 155
    .line 156
    add-float/2addr v2, v8

    .line 157
    add-float v5, v3, v8

    .line 158
    .line 159
    int-to-float v1, v1

    .line 160
    sub-float v4, v9, v1

    .line 161
    .line 162
    move v1, v5

    .line 163
    move v5, v3

    .line 164
    move v3, v1

    .line 165
    move-object v1, p1

    .line 166
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 167
    .line 168
    .line 169
    :cond_2
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 170
    .line 171
    if-lez v1, :cond_3

    .line 172
    .line 173
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    int-to-float v1, v1

    .line 178
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    int-to-float v2, v2

    .line 183
    div-float/2addr v2, v7

    .line 184
    add-float v4, v1, v2

    .line 185
    .line 186
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    int-to-float v3, v1

    .line 191
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 192
    .line 193
    int-to-float v1, v1

    .line 194
    add-float v5, v3, v1

    .line 195
    .line 196
    move v2, v4

    .line 197
    move-object v1, p1

    .line 198
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 199
    .line 200
    .line 201
    move v9, v3

    .line 202
    sub-float v4, v2, v8

    .line 203
    .line 204
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 205
    .line 206
    int-to-float v3, v1

    .line 207
    add-float/2addr v3, v9

    .line 208
    sub-float/2addr v3, v8

    .line 209
    int-to-float v1, v1

    .line 210
    add-float v5, v9, v1

    .line 211
    .line 212
    move v1, v4

    .line 213
    move v4, v2

    .line 214
    move v2, v1

    .line 215
    move-object v1, p1

    .line 216
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 217
    .line 218
    .line 219
    move v2, v4

    .line 220
    add-float v4, v2, v8

    .line 221
    .line 222
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 223
    .line 224
    int-to-float v3, v1

    .line 225
    add-float/2addr v3, v9

    .line 226
    sub-float/2addr v3, v8

    .line 227
    int-to-float v1, v1

    .line 228
    add-float v5, v9, v1

    .line 229
    .line 230
    move v1, v4

    .line 231
    move v4, v2

    .line 232
    move v2, v1

    .line 233
    move-object v1, p1

    .line 234
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 235
    .line 236
    .line 237
    :cond_3
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 238
    .line 239
    if-lez v1, :cond_4

    .line 240
    .line 241
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    int-to-float v1, v1

    .line 246
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    int-to-float v2, v2

    .line 251
    div-float/2addr v2, v7

    .line 252
    add-float v4, v1, v2

    .line 253
    .line 254
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    int-to-float v3, v1

    .line 259
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 260
    .line 261
    int-to-float v1, v1

    .line 262
    sub-float v5, v3, v1

    .line 263
    .line 264
    move v2, v4

    .line 265
    move-object v1, p1

    .line 266
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 267
    .line 268
    .line 269
    move v9, v3

    .line 270
    sub-float v4, v2, v8

    .line 271
    .line 272
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 273
    .line 274
    int-to-float v3, v1

    .line 275
    sub-float v3, v9, v3

    .line 276
    .line 277
    add-float/2addr v3, v8

    .line 278
    int-to-float v1, v1

    .line 279
    sub-float v5, v9, v1

    .line 280
    .line 281
    move v1, v4

    .line 282
    move v4, v2

    .line 283
    move v2, v1

    .line 284
    move-object v1, p1

    .line 285
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 286
    .line 287
    .line 288
    move v2, v4

    .line 289
    add-float v4, v2, v8

    .line 290
    .line 291
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 292
    .line 293
    int-to-float v3, v1

    .line 294
    sub-float v3, v9, v3

    .line 295
    .line 296
    add-float/2addr v3, v8

    .line 297
    int-to-float v1, v1

    .line 298
    sub-float v5, v9, v1

    .line 299
    .line 300
    move v1, v4

    .line 301
    move v4, v2

    .line 302
    move v2, v1

    .line 303
    move-object v1, p1

    .line 304
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 305
    .line 306
    .line 307
    :cond_4
    invoke-virtual {v0}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->isNewLine()Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-eqz v0, :cond_6

    .line 312
    .line 313
    iget-object p0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 314
    .line 315
    invoke-virtual {p0}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 316
    .line 317
    .line 318
    move-result p0

    .line 319
    const/high16 v0, 0x40c00000    # 6.0f

    .line 320
    .line 321
    if-nez p0, :cond_5

    .line 322
    .line 323
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 324
    .line 325
    .line 326
    move-result p0

    .line 327
    int-to-float v8, p0

    .line 328
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 329
    .line 330
    .line 331
    move-result p0

    .line 332
    int-to-float p0, p0

    .line 333
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 334
    .line 335
    .line 336
    move-result v1

    .line 337
    int-to-float v1, v1

    .line 338
    div-float/2addr v1, v7

    .line 339
    add-float/2addr p0, v1

    .line 340
    sub-float v9, p0, v0

    .line 341
    .line 342
    add-float v11, p0, v0

    .line 343
    .line 344
    move v10, v8

    .line 345
    move-object v7, p1

    .line 346
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 347
    .line 348
    .line 349
    return-void

    .line 350
    :cond_5
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 351
    .line 352
    .line 353
    move-result p0

    .line 354
    int-to-float p0, p0

    .line 355
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 356
    .line 357
    .line 358
    move-result v1

    .line 359
    int-to-float v1, v1

    .line 360
    div-float/2addr v1, v7

    .line 361
    add-float/2addr p0, v1

    .line 362
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 363
    .line 364
    .line 365
    move-result v1

    .line 366
    int-to-float v9, v1

    .line 367
    sub-float v8, p0, v0

    .line 368
    .line 369
    add-float v10, p0, v0

    .line 370
    .line 371
    move v11, v9

    .line 372
    move-object v7, p1

    .line 373
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 374
    .line 375
    .line 376
    :cond_6
    :goto_0
    return-void
.end method

.method private findSize(III)I
    .locals 0

    .line 1
    const/high16 p0, -0x80000000

    .line 2
    .line 3
    if-eq p1, p0, :cond_1

    .line 4
    .line 5
    const/high16 p0, 0x40000000    # 2.0f

    .line 6
    .line 7
    if-eq p1, p0, :cond_0

    .line 8
    .line 9
    return p3

    .line 10
    :cond_0
    return p2

    .line 11
    :cond_1
    invoke-static {p3, p2}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private getGravity(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getGravity()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->gravitySpecified()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getGravity()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move p1, v0

    .line 21
    :goto_0
    invoke-direct {p0, p1}, Lorg/apmem/tools/layouts/FlowLayout;->getGravityFromRelative(I)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-direct {p0, v0}, Lorg/apmem/tools/layouts/FlowLayout;->getGravityFromRelative(I)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    and-int/lit8 v0, p1, 0x7

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    and-int/lit8 v0, p0, 0x7

    .line 34
    .line 35
    or-int/2addr p1, v0

    .line 36
    :cond_1
    and-int/lit8 v0, p1, 0x70

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    and-int/lit8 p0, p0, 0x70

    .line 41
    .line 42
    or-int/2addr p1, p0

    .line 43
    :cond_2
    and-int/lit8 p0, p1, 0x7

    .line 44
    .line 45
    if-nez p0, :cond_3

    .line 46
    .line 47
    or-int/lit8 p1, p1, 0x3

    .line 48
    .line 49
    :cond_3
    and-int/lit8 p0, p1, 0x70

    .line 50
    .line 51
    if-nez p0, :cond_4

    .line 52
    .line 53
    or-int/lit8 p0, p1, 0x30

    .line 54
    .line 55
    return p0

    .line 56
    :cond_4
    return p1
.end method

.method private getGravityFromRelative(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x800000

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne v0, v2, :cond_0

    .line 11
    .line 12
    and-int v0, p1, v1

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    and-int/lit8 v0, p1, 0x7

    .line 17
    .line 18
    shl-int/lit8 v0, v0, 0x4

    .line 19
    .line 20
    and-int/lit8 p1, p1, 0x70

    .line 21
    .line 22
    shr-int/lit8 p1, p1, 0x4

    .line 23
    .line 24
    or-int/2addr p1, v0

    .line 25
    :cond_0
    iget-object p0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 26
    .line 27
    invoke-virtual {p0}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getLayoutDirection()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-ne p0, v2, :cond_3

    .line 32
    .line 33
    and-int p0, p1, v1

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    and-int/lit8 p0, p1, 0x3

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    const/4 v1, 0x5

    .line 41
    const/4 v2, 0x3

    .line 42
    if-ne p0, v2, :cond_1

    .line 43
    .line 44
    move p0, v1

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    move p0, v0

    .line 47
    :goto_0
    and-int/2addr p1, v1

    .line 48
    if-ne p1, v1, :cond_2

    .line 49
    .line 50
    move v0, v2

    .line 51
    :cond_2
    or-int/2addr p0, v0

    .line 52
    return p0

    .line 53
    :cond_3
    return p1
.end method

.method private getWeight(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)F
    .locals 1

    .line 1
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->weightSpecified()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->getWeight()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 13
    .line 14
    invoke-virtual {p0}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getWeightDefault()F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method


# virtual methods
.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 2
    .line 3
    return p0
.end method

.method public drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    invoke-direct {p0, p1, p2}, Lorg/apmem/tools/layouts/FlowLayout;->drawDebugInfo(Landroid/graphics/Canvas;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return p3
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 8
    invoke-virtual {p0}, Lorg/apmem/tools/layouts/FlowLayout;->generateDefaultLayoutParams()Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public generateDefaultLayoutParams()Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;
    .locals 1

    .line 1
    new-instance p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    invoke-direct {p0, v0, v0}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 12
    invoke-virtual {p0, p1}, Lorg/apmem/tools/layouts/FlowLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 11
    invoke-virtual {p0, p1}, Lorg/apmem/tools/layouts/FlowLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;
    .locals 1

    .line 1
    new-instance v0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;
    .locals 0

    .line 13
    new-instance p0, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    invoke-direct {p0, p1}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public getGravity()I
    .locals 0

    .line 57
    iget-object p0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    invoke-virtual {p0}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getGravity()I

    move-result p0

    return p0
.end method

.method public getLayoutDirection()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getLayoutDirection()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getOrientation()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getWeightDefault()F
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getWeightDefault()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isDebugDraw()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/apmem/tools/layouts/LayoutConfiguration;->isDebugDraw()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-direct {p0}, Lorg/apmem/tools/layouts/FlowLayout;->debugDraw()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    :goto_0
    if-ge p2, p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    check-cast p4, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 17
    .line 18
    invoke-static {p4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->access$100(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)I

    .line 19
    .line 20
    .line 21
    move-result p5

    .line 22
    iget v0, p4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 23
    .line 24
    add-int/2addr p5, v0

    .line 25
    invoke-static {p4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->access$200(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget v1, p4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 30
    .line 31
    add-int/2addr v0, v1

    .line 32
    invoke-static {p4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->access$100(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget v2, p4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 37
    .line 38
    add-int/2addr v1, v2

    .line 39
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    add-int/2addr v1, v2

    .line 44
    invoke-static {p4}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->access$200(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iget p4, p4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 49
    .line 50
    add-int/2addr v2, p4

    .line 51
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    .line 52
    .line 53
    .line 54
    move-result p4

    .line 55
    add-int/2addr v2, p4

    .line 56
    invoke-virtual {p3, p5, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 p2, p2, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 13

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

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
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    iget-object v4, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 38
    .line 39
    invoke-virtual {v4}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-nez v4, :cond_0

    .line 44
    .line 45
    move v4, v0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move v4, v1

    .line 48
    :goto_0
    iget-object v5, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 49
    .line 50
    invoke-virtual {v5}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-nez v5, :cond_1

    .line 55
    .line 56
    move v0, v1

    .line 57
    :cond_1
    iget-object v1, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 58
    .line 59
    invoke-virtual {v1}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    move v2, v3

    .line 67
    :goto_1
    iget-object v1, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 68
    .line 69
    invoke-virtual {v1}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 75
    .line 76
    .line 77
    new-instance v1, Lorg/apmem/tools/layouts/LineDefinition;

    .line 78
    .line 79
    invoke-direct {v1, v4}, Lorg/apmem/tools/layouts/LineDefinition;-><init>(I)V

    .line 80
    .line 81
    .line 82
    iget-object v5, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    const/4 v6, 0x0

    .line 92
    move v7, v6

    .line 93
    :goto_2
    if-ge v7, v5, :cond_9

    .line 94
    .line 95
    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v8

    .line 99
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    .line 100
    .line 101
    .line 102
    move-result v9

    .line 103
    const/16 v10, 0x8

    .line 104
    .line 105
    if-ne v9, v10, :cond_3

    .line 106
    .line 107
    goto/16 :goto_5

    .line 108
    .line 109
    :cond_3
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 110
    .line 111
    .line 112
    move-result-object v9

    .line 113
    check-cast v9, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 114
    .line 115
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 116
    .line 117
    .line 118
    move-result v10

    .line 119
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 120
    .line 121
    .line 122
    move-result v11

    .line 123
    add-int/2addr v10, v11

    .line 124
    iget v11, v9, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 125
    .line 126
    invoke-static {p1, v10, v11}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 127
    .line 128
    .line 129
    move-result v10

    .line 130
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 131
    .line 132
    .line 133
    move-result v11

    .line 134
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 135
    .line 136
    .line 137
    move-result v12

    .line 138
    add-int/2addr v11, v12

    .line 139
    iget v12, v9, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 140
    .line 141
    invoke-static {p2, v11, v12}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 142
    .line 143
    .line 144
    move-result v11

    .line 145
    invoke-virtual {v8, v10, v11}, Landroid/view/View;->measure(II)V

    .line 146
    .line 147
    .line 148
    iget-object v10, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 149
    .line 150
    invoke-virtual {v10}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 151
    .line 152
    .line 153
    move-result v10

    .line 154
    invoke-static {v9, v10}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->access$002(Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;I)I

    .line 155
    .line 156
    .line 157
    iget-object v10, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 158
    .line 159
    invoke-virtual {v10}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 160
    .line 161
    .line 162
    move-result v10

    .line 163
    if-nez v10, :cond_4

    .line 164
    .line 165
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    .line 166
    .line 167
    .line 168
    move-result v10

    .line 169
    invoke-virtual {v9, v10}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setLength(I)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    .line 173
    .line 174
    .line 175
    move-result v10

    .line 176
    invoke-virtual {v9, v10}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setThickness(I)V

    .line 177
    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_4
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    .line 181
    .line 182
    .line 183
    move-result v10

    .line 184
    invoke-virtual {v9, v10}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setLength(I)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    .line 188
    .line 189
    .line 190
    move-result v10

    .line 191
    invoke-virtual {v9, v10}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->setThickness(I)V

    .line 192
    .line 193
    .line 194
    :goto_3
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;->isNewLine()Z

    .line 195
    .line 196
    .line 197
    move-result v9

    .line 198
    const/4 v10, 0x1

    .line 199
    if-nez v9, :cond_5

    .line 200
    .line 201
    if-eqz v2, :cond_7

    .line 202
    .line 203
    invoke-virtual {v1, v8}, Lorg/apmem/tools/layouts/LineDefinition;->canFit(Landroid/view/View;)Z

    .line 204
    .line 205
    .line 206
    move-result v9

    .line 207
    if-nez v9, :cond_7

    .line 208
    .line 209
    :cond_5
    new-instance v1, Lorg/apmem/tools/layouts/LineDefinition;

    .line 210
    .line 211
    invoke-direct {v1, v4}, Lorg/apmem/tools/layouts/LineDefinition;-><init>(I)V

    .line 212
    .line 213
    .line 214
    iget-object v9, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 215
    .line 216
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 217
    .line 218
    .line 219
    move-result v9

    .line 220
    if-ne v9, v10, :cond_6

    .line 221
    .line 222
    iget-object v9, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 223
    .line 224
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getLayoutDirection()I

    .line 225
    .line 226
    .line 227
    move-result v9

    .line 228
    if-ne v9, v10, :cond_6

    .line 229
    .line 230
    iget-object v9, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 231
    .line 232
    invoke-interface {v9, v6, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 233
    .line 234
    .line 235
    goto :goto_4

    .line 236
    :cond_6
    iget-object v9, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 237
    .line 238
    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    :cond_7
    :goto_4
    iget-object v9, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 242
    .line 243
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 244
    .line 245
    .line 246
    move-result v9

    .line 247
    if-nez v9, :cond_8

    .line 248
    .line 249
    iget-object v9, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 250
    .line 251
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getLayoutDirection()I

    .line 252
    .line 253
    .line 254
    move-result v9

    .line 255
    if-ne v9, v10, :cond_8

    .line 256
    .line 257
    invoke-virtual {v1, v6, v8}, Lorg/apmem/tools/layouts/LineDefinition;->addView(ILandroid/view/View;)V

    .line 258
    .line 259
    .line 260
    goto :goto_5

    .line 261
    :cond_8
    invoke-virtual {v1, v8}, Lorg/apmem/tools/layouts/LineDefinition;->addView(Landroid/view/View;)V

    .line 262
    .line 263
    .line 264
    :goto_5
    add-int/lit8 v7, v7, 0x1

    .line 265
    .line 266
    goto/16 :goto_2

    .line 267
    .line 268
    :cond_9
    iget-object v5, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 269
    .line 270
    invoke-direct {p0, v5}, Lorg/apmem/tools/layouts/FlowLayout;->calculateLinesAndChildPosition(Ljava/util/List;)V

    .line 271
    .line 272
    .line 273
    iget-object v5, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 274
    .line 275
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 276
    .line 277
    .line 278
    move-result v5

    .line 279
    move v7, v6

    .line 280
    move v8, v7

    .line 281
    :goto_6
    if-ge v7, v5, :cond_a

    .line 282
    .line 283
    iget-object v9, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 284
    .line 285
    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v9

    .line 289
    check-cast v9, Lorg/apmem/tools/layouts/LineDefinition;

    .line 290
    .line 291
    invoke-virtual {v9}, Lorg/apmem/tools/layouts/LineDefinition;->getLineLength()I

    .line 292
    .line 293
    .line 294
    move-result v9

    .line 295
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    .line 296
    .line 297
    .line 298
    move-result v8

    .line 299
    add-int/lit8 v7, v7, 0x1

    .line 300
    .line 301
    goto :goto_6

    .line 302
    :cond_a
    invoke-virtual {v1}, Lorg/apmem/tools/layouts/LineDefinition;->getLineStartThickness()I

    .line 303
    .line 304
    .line 305
    move-result v7

    .line 306
    invoke-virtual {v1}, Lorg/apmem/tools/layouts/LineDefinition;->getLineThickness()I

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    add-int/2addr v7, v1

    .line 311
    invoke-direct {p0, v2, v4, v8}, Lorg/apmem/tools/layouts/FlowLayout;->findSize(III)I

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    invoke-direct {p0, v3, v0, v7}, Lorg/apmem/tools/layouts/FlowLayout;->findSize(III)I

    .line 316
    .line 317
    .line 318
    move-result v0

    .line 319
    iget-object v2, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 320
    .line 321
    invoke-direct {p0, v2, v1, v0}, Lorg/apmem/tools/layouts/FlowLayout;->applyGravityToLines(Ljava/util/List;II)V

    .line 322
    .line 323
    .line 324
    :goto_7
    if-ge v6, v5, :cond_b

    .line 325
    .line 326
    iget-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->lines:Ljava/util/List;

    .line 327
    .line 328
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    check-cast v0, Lorg/apmem/tools/layouts/LineDefinition;

    .line 333
    .line 334
    invoke-direct {p0, v0}, Lorg/apmem/tools/layouts/FlowLayout;->applyGravityToLine(Lorg/apmem/tools/layouts/LineDefinition;)V

    .line 335
    .line 336
    .line 337
    invoke-direct {p0, v0}, Lorg/apmem/tools/layouts/FlowLayout;->applyPositionsToViews(Lorg/apmem/tools/layouts/LineDefinition;)V

    .line 338
    .line 339
    .line 340
    add-int/lit8 v6, v6, 0x1

    .line 341
    .line 342
    goto :goto_7

    .line 343
    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 344
    .line 345
    .line 346
    move-result v0

    .line 347
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    add-int/2addr v0, v1

    .line 352
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 353
    .line 354
    .line 355
    move-result v1

    .line 356
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 357
    .line 358
    .line 359
    move-result v2

    .line 360
    add-int/2addr v1, v2

    .line 361
    iget-object v2, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 362
    .line 363
    invoke-virtual {v2}, Lorg/apmem/tools/layouts/LayoutConfiguration;->getOrientation()I

    .line 364
    .line 365
    .line 366
    move-result v2

    .line 367
    if-nez v2, :cond_c

    .line 368
    .line 369
    add-int/2addr v0, v8

    .line 370
    add-int/2addr v1, v7

    .line 371
    goto :goto_8

    .line 372
    :cond_c
    add-int/2addr v0, v7

    .line 373
    add-int/2addr v1, v8

    .line 374
    :goto_8
    invoke-static {v0, p1}, Landroid/view/View;->resolveSize(II)I

    .line 375
    .line 376
    .line 377
    move-result p1

    .line 378
    invoke-static {v1, p2}, Landroid/view/View;->resolveSize(II)I

    .line 379
    .line 380
    .line 381
    move-result p2

    .line 382
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 383
    .line 384
    .line 385
    return-void
.end method

.method public setDebugDraw(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/apmem/tools/layouts/LayoutConfiguration;->setDebugDraw(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setGravity(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/apmem/tools/layouts/LayoutConfiguration;->setGravity(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setLayoutDirection(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/apmem/tools/layouts/LayoutConfiguration;->setLayoutDirection(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOrientation(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/apmem/tools/layouts/LayoutConfiguration;->setOrientation(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setWeightDefault(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apmem/tools/layouts/FlowLayout;->config:Lorg/apmem/tools/layouts/LayoutConfiguration;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/apmem/tools/layouts/LayoutConfiguration;->setWeightDefault(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
