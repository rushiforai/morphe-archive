.class public Lcom/tencent/connect/avatar/b;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private a:Landroid/graphics/Rect;

.field private b:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/tencent/connect/avatar/b;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private b()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/connect/avatar/b;->b:Landroid/graphics/Paint;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Landroid/graphics/Rect;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/connect/avatar/b;->a:Landroid/graphics/Rect;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/connect/avatar/b;->a:Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/lit16 v2, v1, -0x8c

    .line 21
    .line 22
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/16 v3, 0x280

    .line 27
    .line 28
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    sub-int/2addr v0, v2

    .line 33
    div-int/lit8 v0, v0, 0x2

    .line 34
    .line 35
    sub-int/2addr v1, v2

    .line 36
    div-int/lit8 v1, v1, 0x2

    .line 37
    .line 38
    add-int v3, v0, v2

    .line 39
    .line 40
    add-int/2addr v2, v1

    .line 41
    iget-object v4, p0, Lcom/tencent/connect/avatar/b;->a:Landroid/graphics/Rect;

    .line 42
    .line 43
    invoke-virtual {v4, v0, v1, v3, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p0, p0, Lcom/tencent/connect/avatar/b;->a:Landroid/graphics/Rect;

    .line 47
    .line 48
    return-object p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tencent/connect/avatar/b;->a()Landroid/graphics/Rect;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    iget-object v4, v0, Lcom/tencent/connect/avatar/b;->b:Landroid/graphics/Paint;

    .line 19
    .line 20
    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 21
    .line 22
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 23
    .line 24
    .line 25
    iget-object v4, v0, Lcom/tencent/connect/avatar/b;->b:Landroid/graphics/Paint;

    .line 26
    .line 27
    const/16 v5, 0x64

    .line 28
    .line 29
    const/4 v6, 0x0

    .line 30
    invoke-static {v5, v6, v6, v6}, Landroid/graphics/Color;->argb(IIII)I

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 35
    .line 36
    .line 37
    int-to-float v11, v2

    .line 38
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 39
    .line 40
    int-to-float v12, v2

    .line 41
    iget-object v13, v0, Lcom/tencent/connect/avatar/b;->b:Landroid/graphics/Paint;

    .line 42
    .line 43
    const/4 v9, 0x0

    .line 44
    const/4 v10, 0x0

    .line 45
    move-object/from16 v8, p1

    .line 46
    .line 47
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 48
    .line 49
    .line 50
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 51
    .line 52
    int-to-float v10, v2

    .line 53
    int-to-float v12, v3

    .line 54
    iget-object v13, v0, Lcom/tencent/connect/avatar/b;->b:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 60
    .line 61
    int-to-float v2, v2

    .line 62
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 63
    .line 64
    int-to-float v3, v3

    .line 65
    iget v4, v1, Landroid/graphics/Rect;->bottom:I

    .line 66
    .line 67
    int-to-float v4, v4

    .line 68
    iget-object v7, v0, Lcom/tencent/connect/avatar/b;->b:Landroid/graphics/Paint;

    .line 69
    .line 70
    const/4 v15, 0x0

    .line 71
    move-object/from16 v14, p1

    .line 72
    .line 73
    move/from16 v16, v2

    .line 74
    .line 75
    move/from16 v17, v3

    .line 76
    .line 77
    move/from16 v18, v4

    .line 78
    .line 79
    move-object/from16 v19, v7

    .line 80
    .line 81
    invoke-virtual/range {v14 .. v19}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 82
    .line 83
    .line 84
    iget v2, v1, Landroid/graphics/Rect;->right:I

    .line 85
    .line 86
    int-to-float v9, v2

    .line 87
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 88
    .line 89
    int-to-float v10, v2

    .line 90
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 91
    .line 92
    int-to-float v12, v2

    .line 93
    iget-object v13, v0, Lcom/tencent/connect/avatar/b;->b:Landroid/graphics/Paint;

    .line 94
    .line 95
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v5, v6, v6, v6}, Landroid/graphics/Color;->argb(IIII)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    invoke-virtual {v8, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 103
    .line 104
    .line 105
    iget-object v2, v0, Lcom/tencent/connect/avatar/b;->b:Landroid/graphics/Paint;

    .line 106
    .line 107
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 108
    .line 109
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 110
    .line 111
    .line 112
    iget-object v2, v0, Lcom/tencent/connect/avatar/b;->b:Landroid/graphics/Paint;

    .line 113
    .line 114
    const/4 v3, -0x1

    .line 115
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 116
    .line 117
    .line 118
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 119
    .line 120
    int-to-float v15, v2

    .line 121
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 122
    .line 123
    int-to-float v2, v2

    .line 124
    iget v3, v1, Landroid/graphics/Rect;->right:I

    .line 125
    .line 126
    add-int/lit8 v3, v3, -0x1

    .line 127
    .line 128
    int-to-float v3, v3

    .line 129
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 130
    .line 131
    int-to-float v1, v1

    .line 132
    iget-object v0, v0, Lcom/tencent/connect/avatar/b;->b:Landroid/graphics/Paint;

    .line 133
    .line 134
    move-object/from16 v19, v0

    .line 135
    .line 136
    move/from16 v18, v1

    .line 137
    .line 138
    move/from16 v16, v2

    .line 139
    .line 140
    move/from16 v17, v3

    .line 141
    .line 142
    move-object v14, v8

    .line 143
    invoke-virtual/range {v14 .. v19}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method
