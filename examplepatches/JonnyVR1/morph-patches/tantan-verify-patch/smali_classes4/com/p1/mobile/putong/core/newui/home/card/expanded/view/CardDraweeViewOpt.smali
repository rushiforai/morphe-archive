.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;
.super Lv/VDraweeView;
.source "SourceFile"


# instance fields
.field public o:[F

.field public p:[F

.field public q:[F

.field public r:Landroid/graphics/Paint;

.field public s:Landroid/graphics/Paint;

.field public t:Landroid/graphics/PorterDuffXfermode;

.field public u:Landroid/graphics/Path;

.field public v:Z

.field public w:F

.field public x:I

.field public final y:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x8

    .line 5
    .line 6
    new-array v0, p1, [F

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->o:[F

    .line 12
    .line 13
    new-array v0, p1, [F

    .line 14
    .line 15
    fill-array-data v0, :array_1

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->p:[F

    .line 19
    .line 20
    new-array p1, p1, [F

    .line 21
    .line 22
    fill-array-data p1, :array_2

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->q:[F

    .line 26
    .line 27
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 28
    .line 29
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 30
    .line 31
    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->t:Landroid/graphics/PorterDuffXfermode;

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->v:Z

    .line 38
    .line 39
    const/high16 p1, 0x3f800000    # 1.0f

    .line 40
    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w:F

    .line 42
    .line 43
    const/4 v0, 0x2

    .line 44
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->x:I

    .line 45
    .line 46
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->y:I

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->v()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 57
    invoke-direct {p0, p1, p2}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x8

    .line 58
    new-array p2, p1, [F

    fill-array-data p2, :array_0

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->o:[F

    .line 59
    new-array p2, p1, [F

    fill-array-data p2, :array_1

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->p:[F

    .line 60
    new-array p1, p1, [F

    fill-array-data p1, :array_2

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->q:[F

    .line 61
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->t:Landroid/graphics/PorterDuffXfermode;

    const/4 p1, 0x0

    .line 62
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->v:Z

    const/high16 p1, 0x3f800000    # 1.0f

    .line 63
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w:F

    const/4 p2, 0x2

    .line 64
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->x:I

    .line 65
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->y:I

    .line 66
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->v()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 67
    invoke-direct {p0, p1, p2, p3}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x8

    .line 68
    new-array p2, p1, [F

    fill-array-data p2, :array_0

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->o:[F

    .line 69
    new-array p2, p1, [F

    fill-array-data p2, :array_1

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->p:[F

    .line 70
    new-array p1, p1, [F

    fill-array-data p1, :array_2

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->q:[F

    .line 71
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->t:Landroid/graphics/PorterDuffXfermode;

    const/4 p1, 0x0

    .line 72
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->v:Z

    const/high16 p1, 0x3f800000    # 1.0f

    .line 73
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w:F

    const/4 p2, 0x2

    .line 74
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->x:I

    .line 75
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->y:I

    .line 76
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->v()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private v()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->r:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u:Landroid/graphics/Path;

    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->s:Landroid/graphics/Paint;

    .line 25
    .line 26
    const/high16 v2, -0x10000

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->s:Landroid/graphics/Paint;

    .line 32
    .line 33
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->s:Landroid/graphics/Paint;

    .line 39
    .line 40
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->v:Z

    .line 4
    .line 5
    const/4 v8, -0x1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v4, v1

    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v5, v1

    .line 18
    const/4 v6, 0x0

    .line 19
    const/16 v7, 0x1f

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x0

    .line 23
    move-object/from16 v1, p1

    .line 24
    .line 25
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move-object/from16 v1, p1

    .line 31
    .line 32
    move v2, v8

    .line 33
    :goto_0
    invoke-super/range {p0 .. p1}, Lv/VDraweeView;->onDraw(Landroid/graphics/Canvas;)V

    .line 34
    .line 35
    .line 36
    iget-boolean v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->v:Z

    .line 37
    .line 38
    if-eqz v3, :cond_6

    .line 39
    .line 40
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->r:Landroid/graphics/Paint;

    .line 41
    .line 42
    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 43
    .line 44
    .line 45
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u:Landroid/graphics/Path;

    .line 46
    .line 47
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 48
    .line 49
    .line 50
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u:Landroid/graphics/Path;

    .line 51
    .line 52
    sget-object v4, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/gra;->N3()Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u:Landroid/graphics/Path;

    .line 62
    .line 63
    const/4 v10, 0x1

    .line 64
    if-eqz v3, :cond_1

    .line 65
    .line 66
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->y:I

    .line 67
    .line 68
    neg-int v5, v3

    .line 69
    int-to-float v5, v5

    .line 70
    neg-int v3, v3

    .line 71
    int-to-float v6, v3

    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    iget v7, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->y:I

    .line 77
    .line 78
    add-int/2addr v3, v7

    .line 79
    int-to-float v7, v3

    .line 80
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    iget v8, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->y:I

    .line 85
    .line 86
    add-int/2addr v3, v8

    .line 87
    int-to-float v8, v3

    .line 88
    sget-object v9, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 89
    .line 90
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    add-int/2addr v3, v10

    .line 99
    int-to-float v7, v3

    .line 100
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    add-int/2addr v3, v10

    .line 105
    int-to-float v8, v3

    .line 106
    sget-object v9, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 107
    .line 108
    const/high16 v5, -0x40800000    # -1.0f

    .line 109
    .line 110
    const/high16 v6, -0x40800000    # -1.0f

    .line 111
    .line 112
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 113
    .line 114
    .line 115
    :goto_1
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->x:I

    .line 116
    .line 117
    const/high16 v4, 0x40000000    # 2.0f

    .line 118
    .line 119
    if-ne v3, v10, :cond_3

    .line 120
    .line 121
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u:Landroid/graphics/Path;

    .line 130
    .line 131
    if-le v5, v3, :cond_2

    .line 132
    .line 133
    sub-int/2addr v5, v3

    .line 134
    int-to-float v3, v5

    .line 135
    div-float v8, v3, v4

    .line 136
    .line 137
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    int-to-float v9, v3

    .line 142
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    int-to-float v10, v3

    .line 147
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->p:[F

    .line 148
    .line 149
    sget-object v12, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 150
    .line 151
    const/4 v7, 0x0

    .line 152
    invoke-virtual/range {v6 .. v12}, Landroid/graphics/Path;->addRoundRect(FFFF[FLandroid/graphics/Path$Direction;)V

    .line 153
    .line 154
    .line 155
    goto/16 :goto_2

    .line 156
    .line 157
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    int-to-float v9, v3

    .line 162
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    int-to-float v10, v3

    .line 167
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->p:[F

    .line 168
    .line 169
    sget-object v12, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 170
    .line 171
    const/4 v7, 0x0

    .line 172
    const/4 v8, 0x0

    .line 173
    invoke-virtual/range {v6 .. v12}, Landroid/graphics/Path;->addRoundRect(FFFF[FLandroid/graphics/Path$Direction;)V

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_3
    const/4 v5, 0x3

    .line 178
    if-ne v3, v5, :cond_5

    .line 179
    .line 180
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-le v5, v3, :cond_4

    .line 189
    .line 190
    sub-int/2addr v5, v3

    .line 191
    int-to-float v3, v5

    .line 192
    div-float v4, v3, v4

    .line 193
    .line 194
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->p:[F

    .line 195
    .line 196
    const/4 v6, 0x0

    .line 197
    aget v5, v5, v6

    .line 198
    .line 199
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->o:[F

    .line 200
    .line 201
    aget v7, v7, v6

    .line 202
    .line 203
    sub-float v7, v5, v7

    .line 204
    .line 205
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->q:[F

    .line 206
    .line 207
    aget v6, v8, v6

    .line 208
    .line 209
    sub-float/2addr v5, v6

    .line 210
    div-float/2addr v5, v7

    .line 211
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 212
    .line 213
    .line 214
    move-result v6

    .line 215
    int-to-float v6, v6

    .line 216
    mul-float/2addr v3, v5

    .line 217
    add-float v11, v6, v3

    .line 218
    .line 219
    mul-float/2addr v5, v4

    .line 220
    sub-float v9, v4, v5

    .line 221
    .line 222
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u:Landroid/graphics/Path;

    .line 223
    .line 224
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    int-to-float v10, v3

    .line 229
    iget-object v12, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->q:[F

    .line 230
    .line 231
    sget-object v13, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 232
    .line 233
    const/4 v8, 0x0

    .line 234
    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->addRoundRect(FFFF[FLandroid/graphics/Path$Direction;)V

    .line 235
    .line 236
    .line 237
    goto :goto_2

    .line 238
    :cond_4
    iget-object v14, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u:Landroid/graphics/Path;

    .line 239
    .line 240
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    int-to-float v3, v3

    .line 245
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 246
    .line 247
    .line 248
    move-result v4

    .line 249
    int-to-float v4, v4

    .line 250
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->q:[F

    .line 251
    .line 252
    sget-object v20, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 253
    .line 254
    const/4 v15, 0x0

    .line 255
    const/16 v16, 0x0

    .line 256
    .line 257
    move/from16 v17, v3

    .line 258
    .line 259
    move/from16 v18, v4

    .line 260
    .line 261
    move-object/from16 v19, v5

    .line 262
    .line 263
    invoke-virtual/range {v14 .. v20}, Landroid/graphics/Path;->addRoundRect(FFFF[FLandroid/graphics/Path$Direction;)V

    .line 264
    .line 265
    .line 266
    goto :goto_2

    .line 267
    :cond_5
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u:Landroid/graphics/Path;

    .line 268
    .line 269
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 270
    .line 271
    .line 272
    move-result v3

    .line 273
    int-to-float v9, v3

    .line 274
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 275
    .line 276
    .line 277
    move-result v3

    .line 278
    int-to-float v10, v3

    .line 279
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->o:[F

    .line 280
    .line 281
    sget-object v12, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 282
    .line 283
    const/4 v7, 0x0

    .line 284
    const/4 v8, 0x0

    .line 285
    invoke-virtual/range {v6 .. v12}, Landroid/graphics/Path;->addRoundRect(FFFF[FLandroid/graphics/Path$Direction;)V

    .line 286
    .line 287
    .line 288
    :goto_2
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->r:Landroid/graphics/Paint;

    .line 289
    .line 290
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->t:Landroid/graphics/PorterDuffXfermode;

    .line 291
    .line 292
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 293
    .line 294
    .line 295
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u:Landroid/graphics/Path;

    .line 296
    .line 297
    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 298
    .line 299
    .line 300
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u:Landroid/graphics/Path;

    .line 301
    .line 302
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->r:Landroid/graphics/Paint;

    .line 303
    .line 304
    invoke-virtual {v1, v3, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 308
    .line 309
    .line 310
    :cond_6
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->p:[F

    .line 17
    .line 18
    int-to-float p1, p1

    .line 19
    const/high16 p2, 0x40000000    # 2.0f

    .line 20
    .line 21
    div-float/2addr p1, p2

    .line 22
    const/4 p2, 0x0

    .line 23
    aput p1, p0, p2

    .line 24
    .line 25
    const/4 p2, 0x1

    .line 26
    aput p1, p0, p2

    .line 27
    .line 28
    const/4 p2, 0x2

    .line 29
    aput p1, p0, p2

    .line 30
    .line 31
    const/4 p2, 0x3

    .line 32
    aput p1, p0, p2

    .line 33
    .line 34
    const/4 p2, 0x4

    .line 35
    aput p1, p0, p2

    .line 36
    .line 37
    const/4 p2, 0x5

    .line 38
    aput p1, p0, p2

    .line 39
    .line 40
    const/4 p2, 0x6

    .line 41
    aput p1, p0, p2

    .line 42
    .line 43
    const/4 p2, 0x7

    .line 44
    aput p1, p0, p2

    .line 45
    .line 46
    return-void
.end method

.method public setCircleToRoundTransition(F)V
    .locals 6

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    cmpl-float v0, p1, v0

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->x:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    cmpl-float v1, p1, v0

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->x:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v1, 0x3

    .line 23
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->x:I

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    div-int/2addr v1, v2

    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->o:[F

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    aget v4, v3, v4

    .line 42
    .line 43
    int-to-float v1, v1

    .line 44
    sub-float v5, v1, v4

    .line 45
    .line 46
    sub-float/2addr v0, p1

    .line 47
    mul-float/2addr v5, v0

    .line 48
    add-float/2addr v4, v5

    .line 49
    float-to-int p1, v4

    .line 50
    aget v2, v3, v2

    .line 51
    .line 52
    sub-float v4, v1, v2

    .line 53
    .line 54
    mul-float/2addr v4, v0

    .line 55
    add-float/2addr v2, v4

    .line 56
    float-to-int v2, v2

    .line 57
    const/4 v4, 0x4

    .line 58
    aget v4, v3, v4

    .line 59
    .line 60
    sub-float v5, v1, v4

    .line 61
    .line 62
    mul-float/2addr v5, v0

    .line 63
    add-float/2addr v4, v5

    .line 64
    float-to-int v4, v4

    .line 65
    const/4 v5, 0x6

    .line 66
    aget v3, v3, v5

    .line 67
    .line 68
    sub-float/2addr v1, v3

    .line 69
    mul-float/2addr v1, v0

    .line 70
    add-float/2addr v3, v1

    .line 71
    float-to-int v0, v3

    .line 72
    invoke-virtual {p0, p1, v2, v4, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->u(IIII)V

    .line 73
    .line 74
    .line 75
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public setCurState(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->x:I

    .line 2
    .line 3
    return-void
.end method

.method public u(IIII)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->q:[F

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    const/4 v0, 0x1

    .line 5
    aput p1, p0, v0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    aput p1, p0, v0

    .line 9
    .line 10
    int-to-float p1, p2

    .line 11
    const/4 p2, 0x3

    .line 12
    aput p1, p0, p2

    .line 13
    .line 14
    const/4 p2, 0x2

    .line 15
    aput p1, p0, p2

    .line 16
    .line 17
    int-to-float p1, p3

    .line 18
    const/4 p2, 0x5

    .line 19
    aput p1, p0, p2

    .line 20
    .line 21
    const/4 p2, 0x4

    .line 22
    aput p1, p0, p2

    .line 23
    .line 24
    int-to-float p1, p4

    .line 25
    const/4 p2, 0x7

    .line 26
    aput p1, p0, p2

    .line 27
    .line 28
    const/4 p2, 0x6

    .line 29
    aput p1, p0, p2

    .line 30
    .line 31
    return-void
.end method

.method public w(IIII)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->o:[F

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    const/4 v1, 0x0

    .line 5
    aput p1, v0, v1

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    aput p1, v0, v2

    .line 9
    .line 10
    int-to-float p1, p2

    .line 11
    const/4 p2, 0x2

    .line 12
    aput p1, v0, p2

    .line 13
    .line 14
    const/4 p2, 0x3

    .line 15
    aput p1, v0, p2

    .line 16
    .line 17
    int-to-float p1, p3

    .line 18
    const/4 p2, 0x4

    .line 19
    aput p1, v0, p2

    .line 20
    .line 21
    const/4 p2, 0x5

    .line 22
    aput p1, v0, p2

    .line 23
    .line 24
    int-to-float p1, p4

    .line 25
    const/4 p2, 0x6

    .line 26
    aput p1, v0, p2

    .line 27
    .line 28
    const/4 p2, 0x7

    .line 29
    aput p1, v0, p2

    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->v:Z

    .line 32
    .line 33
    :goto_0
    const/16 p1, 0x8

    .line 34
    .line 35
    if-ge v1, p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->o:[F

    .line 38
    .line 39
    aget p1, p1, v1

    .line 40
    .line 41
    const/4 p2, 0x0

    .line 42
    cmpl-float p1, p1, p2

    .line 43
    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->v:Z

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 53
    .line 54
    .line 55
    return-void
.end method
