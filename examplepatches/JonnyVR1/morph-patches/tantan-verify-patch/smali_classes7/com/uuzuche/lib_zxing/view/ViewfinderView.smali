.class public final Lcom/uuzuche/lib_zxing/view/ViewfinderView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private final a:Landroid/graphics/Paint;

.field private b:Landroid/graphics/Bitmap;

.field private final c:I

.field private final d:I

.field private final e:I

.field private f:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ll/s5d0;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ll/s5d0;",
            ">;"
        }
    .end annotation
.end field

.field private h:I

.field private i:I

.field private j:Landroid/graphics/Bitmap;

.field private k:Z

.field private l:I

.field private m:I

.field private n:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 60
    invoke-direct {p0, p1, v0}, Lcom/uuzuche/lib_zxing/view/ViewfinderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    .line 59
    invoke-direct {p0, p1, p2, v0}, Lcom/uuzuche/lib_zxing/view/ViewfinderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    sget v0, Ll/p9c0;->c:I

    .line 16
    .line 17
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->c:I

    .line 22
    .line 23
    sget v0, Ll/p9c0;->b:I

    .line 24
    .line 25
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->d:I

    .line 30
    .line 31
    sget v0, Ll/p9c0;->a:I

    .line 32
    .line 33
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->e:I

    .line 38
    .line 39
    new-instance v0, Ljava/util/HashSet;

    .line 40
    .line 41
    const/4 v1, 0x5

    .line 42
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->f:Ljava/util/Collection;

    .line 46
    .line 47
    sget v0, Ll/ubc0;->a:I

    .line 48
    .line 49
    invoke-static {p3, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    iput-object p3, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->j:Landroid/graphics/Bitmap;

    .line 54
    .line 55
    invoke-direct {p0, p1, p2}, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private b(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget-object v2, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 6
    .line 7
    iget v3, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->l:I

    .line 8
    .line 9
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object v2, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    iget v2, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->n:I

    .line 20
    .line 21
    iget v3, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->m:I

    .line 22
    .line 23
    iget v4, v1, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    int-to-float v6, v4

    .line 26
    iget v5, v1, Landroid/graphics/Rect;->top:I

    .line 27
    .line 28
    int-to-float v7, v5

    .line 29
    add-int/2addr v4, v2

    .line 30
    int-to-float v8, v4

    .line 31
    add-int/2addr v5, v3

    .line 32
    int-to-float v9, v5

    .line 33
    iget-object v10, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 34
    .line 35
    move-object/from16 v5, p1

    .line 36
    .line 37
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 38
    .line 39
    .line 40
    iget v4, v1, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    int-to-float v12, v4

    .line 43
    iget v5, v1, Landroid/graphics/Rect;->top:I

    .line 44
    .line 45
    int-to-float v13, v5

    .line 46
    add-int/2addr v4, v3

    .line 47
    int-to-float v14, v4

    .line 48
    add-int/2addr v5, v2

    .line 49
    int-to-float v15, v5

    .line 50
    iget-object v4, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 51
    .line 52
    move-object/from16 v11, p1

    .line 53
    .line 54
    move-object/from16 v16, v4

    .line 55
    .line 56
    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 60
    .line 61
    sub-int v5, v4, v2

    .line 62
    .line 63
    int-to-float v12, v5

    .line 64
    iget v5, v1, Landroid/graphics/Rect;->top:I

    .line 65
    .line 66
    int-to-float v13, v5

    .line 67
    int-to-float v14, v4

    .line 68
    add-int/2addr v5, v3

    .line 69
    int-to-float v15, v5

    .line 70
    iget-object v4, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 71
    .line 72
    move-object/from16 v16, v4

    .line 73
    .line 74
    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 75
    .line 76
    .line 77
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 78
    .line 79
    sub-int v5, v4, v3

    .line 80
    .line 81
    int-to-float v12, v5

    .line 82
    iget v5, v1, Landroid/graphics/Rect;->top:I

    .line 83
    .line 84
    int-to-float v13, v5

    .line 85
    int-to-float v14, v4

    .line 86
    add-int/2addr v5, v2

    .line 87
    int-to-float v15, v5

    .line 88
    iget-object v4, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 89
    .line 90
    move-object/from16 v16, v4

    .line 91
    .line 92
    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 93
    .line 94
    .line 95
    iget v4, v1, Landroid/graphics/Rect;->left:I

    .line 96
    .line 97
    int-to-float v12, v4

    .line 98
    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    .line 99
    .line 100
    sub-int v6, v5, v3

    .line 101
    .line 102
    int-to-float v13, v6

    .line 103
    add-int/2addr v4, v2

    .line 104
    int-to-float v14, v4

    .line 105
    int-to-float v15, v5

    .line 106
    iget-object v4, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 107
    .line 108
    move-object/from16 v16, v4

    .line 109
    .line 110
    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 111
    .line 112
    .line 113
    iget v4, v1, Landroid/graphics/Rect;->left:I

    .line 114
    .line 115
    int-to-float v12, v4

    .line 116
    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    .line 117
    .line 118
    sub-int v6, v5, v2

    .line 119
    .line 120
    int-to-float v13, v6

    .line 121
    add-int/2addr v4, v3

    .line 122
    int-to-float v14, v4

    .line 123
    int-to-float v15, v5

    .line 124
    iget-object v4, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 125
    .line 126
    move-object/from16 v16, v4

    .line 127
    .line 128
    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 129
    .line 130
    .line 131
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 132
    .line 133
    sub-int v5, v4, v2

    .line 134
    .line 135
    int-to-float v12, v5

    .line 136
    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    .line 137
    .line 138
    sub-int v6, v5, v3

    .line 139
    .line 140
    int-to-float v13, v6

    .line 141
    int-to-float v14, v4

    .line 142
    int-to-float v15, v5

    .line 143
    iget-object v4, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 144
    .line 145
    move-object/from16 v16, v4

    .line 146
    .line 147
    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 148
    .line 149
    .line 150
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 151
    .line 152
    sub-int v3, v4, v3

    .line 153
    .line 154
    int-to-float v12, v3

    .line 155
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 156
    .line 157
    sub-int v2, v1, v2

    .line 158
    .line 159
    int-to-float v13, v2

    .line 160
    int-to-float v14, v4

    .line 161
    int-to-float v15, v1

    .line 162
    iget-object v0, v0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 163
    .line 164
    move-object/from16 v16, v0

    .line 165
    .line 166
    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method private c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->h:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p2, Landroid/graphics/Rect;->top:I

    .line 6
    .line 7
    iput v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->h:I

    .line 8
    .line 9
    :cond_0
    iget v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->h:I

    .line 10
    .line 11
    iget v1, p2, Landroid/graphics/Rect;->bottom:I

    .line 12
    .line 13
    add-int/lit8 v1, v1, -0x1e

    .line 14
    .line 15
    if-lt v0, v1, :cond_1

    .line 16
    .line 17
    iget v0, p2, Landroid/graphics/Rect;->top:I

    .line 18
    .line 19
    iput v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->h:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget v1, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->i:I

    .line 23
    .line 24
    add-int/2addr v0, v1

    .line 25
    iput v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->h:I

    .line 26
    .line 27
    :goto_0
    new-instance v0, Landroid/graphics/Rect;

    .line 28
    .line 29
    iget v1, p2, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    iget v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->h:I

    .line 32
    .line 33
    iget p2, p2, Landroid/graphics/Rect;->right:I

    .line 34
    .line 35
    add-int/lit8 v3, v2, 0x1e

    .line 36
    .line 37
    invoke-direct {v0, v1, v2, p2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->j:Landroid/graphics/Bitmap;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 44
    .line 45
    invoke-virtual {p1, p2, v1, v0, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private e(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    sget-object v0, Ll/yhc0;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/yhc0;->f:I

    .line 8
    .line 9
    const/high16 v0, -0x40800000    # -1.0f

    .line 10
    .line 11
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    cmpl-float v0, p2, v0

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    float-to-int p2, p2

    .line 20
    sput p2, Ll/x94;->m:I

    .line 21
    .line 22
    :cond_0
    sget p2, Ll/yhc0;->j:I

    .line 23
    .line 24
    sget v0, Ll/w5e;->a:I

    .line 25
    .line 26
    div-int/lit8 v0, v0, 0x2

    .line 27
    .line 28
    int-to-float v0, v0

    .line 29
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    float-to-int p2, p2

    .line 34
    sput p2, Ll/x94;->k:I

    .line 35
    .line 36
    sget p2, Ll/yhc0;->e:I

    .line 37
    .line 38
    sget v0, Ll/w5e;->a:I

    .line 39
    .line 40
    div-int/lit8 v0, v0, 0x2

    .line 41
    .line 42
    int-to-float v0, v0

    .line 43
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    float-to-int p2, p2

    .line 48
    sput p2, Ll/x94;->l:I

    .line 49
    .line 50
    sget p2, Ll/yhc0;->b:I

    .line 51
    .line 52
    const-string v0, "#45DDDD"

    .line 53
    .line 54
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    iput p2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->l:I

    .line 63
    .line 64
    sget p2, Ll/yhc0;->c:I

    .line 65
    .line 66
    const/high16 v0, 0x42820000    # 65.0f

    .line 67
    .line 68
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    float-to-int p2, p2

    .line 73
    iput p2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->m:I

    .line 74
    .line 75
    sget p2, Ll/yhc0;->d:I

    .line 76
    .line 77
    const/high16 v0, 0x41700000    # 15.0f

    .line 78
    .line 79
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    float-to-int p2, p2

    .line 84
    iput p2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->n:I

    .line 85
    .line 86
    sget p2, Ll/yhc0;->g:I

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    sget v0, Ll/yhc0;->g:I

    .line 96
    .line 97
    sget v1, Ll/ubc0;->a:I

    .line 98
    .line 99
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-static {p2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    iput-object p2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->j:Landroid/graphics/Bitmap;

    .line 108
    .line 109
    sget p2, Ll/yhc0;->i:I

    .line 110
    .line 111
    const/4 v0, 0x5

    .line 112
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    iput p2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->i:I

    .line 117
    .line 118
    sget p2, Ll/yhc0;->h:I

    .line 119
    .line 120
    const/4 v0, 0x1

    .line 121
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    iput-boolean p2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->k:Z

    .line 126
    .line 127
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 128
    .line 129
    .line 130
    return-void
.end method


# virtual methods
.method public a(Ll/s5d0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->f:Ljava/util/Collection;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->b:Landroid/graphics/Bitmap;

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {v1}, Ll/x94;->f()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v7

    .line 9
    if-nez v7, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v8

    .line 20
    iget-object v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->b:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    iget v3, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->d:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget v3, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->c:I

    .line 30
    .line 31
    :goto_0
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 32
    .line 33
    .line 34
    int-to-float v4, v1

    .line 35
    iget v1, v7, Landroid/graphics/Rect;->top:I

    .line 36
    .line 37
    int-to-float v5, v1

    .line 38
    iget-object v6, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    const/4 v3, 0x0

    .line 42
    move-object v1, p1

    .line 43
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 44
    .line 45
    .line 46
    move v9, v4

    .line 47
    iget v1, v7, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    int-to-float v3, v1

    .line 50
    iget v1, v7, Landroid/graphics/Rect;->left:I

    .line 51
    .line 52
    int-to-float v4, v1

    .line 53
    iget v1, v7, Landroid/graphics/Rect;->bottom:I

    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    int-to-float v5, v1

    .line 58
    iget-object v6, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 59
    .line 60
    move-object v1, p1

    .line 61
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 62
    .line 63
    .line 64
    iget v1, v7, Landroid/graphics/Rect;->right:I

    .line 65
    .line 66
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    int-to-float v2, v1

    .line 69
    iget v1, v7, Landroid/graphics/Rect;->top:I

    .line 70
    .line 71
    int-to-float v3, v1

    .line 72
    iget v1, v7, Landroid/graphics/Rect;->bottom:I

    .line 73
    .line 74
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    int-to-float v5, v1

    .line 77
    iget-object v6, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 78
    .line 79
    move-object v1, p1

    .line 80
    move v4, v9

    .line 81
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 82
    .line 83
    .line 84
    iget v1, v7, Landroid/graphics/Rect;->bottom:I

    .line 85
    .line 86
    add-int/lit8 v1, v1, 0x1

    .line 87
    .line 88
    int-to-float v3, v1

    .line 89
    int-to-float v5, v8

    .line 90
    iget-object v6, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 91
    .line 92
    const/4 v2, 0x0

    .line 93
    move-object v1, p1

    .line 94
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->b:Landroid/graphics/Bitmap;

    .line 98
    .line 99
    const/16 v3, 0xff

    .line 100
    .line 101
    if-eqz v2, :cond_2

    .line 102
    .line 103
    iget-object v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 104
    .line 105
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->b:Landroid/graphics/Bitmap;

    .line 109
    .line 110
    iget v3, v7, Landroid/graphics/Rect;->left:I

    .line 111
    .line 112
    int-to-float v3, v3

    .line 113
    iget v4, v7, Landroid/graphics/Rect;->top:I

    .line 114
    .line 115
    int-to-float v4, v4

    .line 116
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 117
    .line 118
    invoke-virtual {p1, v2, v3, v4, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_2
    invoke-direct {p0, p1, v7}, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->b(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 123
    .line 124
    .line 125
    invoke-direct {p0, p1, v7}, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 126
    .line 127
    .line 128
    iget-object v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->f:Ljava/util/Collection;

    .line 129
    .line 130
    iget-object v4, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->g:Ljava/util/Collection;

    .line 131
    .line 132
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result v5

    .line 136
    if-eqz v5, :cond_3

    .line 137
    .line 138
    const/4 v2, 0x0

    .line 139
    iput-object v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->g:Ljava/util/Collection;

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_3
    new-instance v5, Ljava/util/HashSet;

    .line 143
    .line 144
    const/4 v6, 0x5

    .line 145
    invoke-direct {v5, v6}, Ljava/util/HashSet;-><init>(I)V

    .line 146
    .line 147
    .line 148
    iput-object v5, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->f:Ljava/util/Collection;

    .line 149
    .line 150
    iput-object v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->g:Ljava/util/Collection;

    .line 151
    .line 152
    iget-object v5, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 153
    .line 154
    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 155
    .line 156
    .line 157
    iget-object v3, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 158
    .line 159
    iget v5, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->e:I

    .line 160
    .line 161
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 162
    .line 163
    .line 164
    iget-boolean v3, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->k:Z

    .line 165
    .line 166
    if-eqz v3, :cond_4

    .line 167
    .line 168
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    if-eqz v3, :cond_4

    .line 177
    .line 178
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    check-cast v3, Ll/s5d0;

    .line 183
    .line 184
    iget v5, v7, Landroid/graphics/Rect;->left:I

    .line 185
    .line 186
    int-to-float v5, v5

    .line 187
    invoke-virtual {v3}, Ll/s5d0;->c()F

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    add-float/2addr v5, v6

    .line 192
    iget v6, v7, Landroid/graphics/Rect;->top:I

    .line 193
    .line 194
    int-to-float v6, v6

    .line 195
    invoke-virtual {v3}, Ll/s5d0;->d()F

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    add-float/2addr v6, v3

    .line 200
    const/high16 v3, 0x40c00000    # 6.0f

    .line 201
    .line 202
    iget-object v8, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 203
    .line 204
    invoke-virtual {p1, v5, v6, v3, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 205
    .line 206
    .line 207
    goto :goto_1

    .line 208
    :cond_4
    :goto_2
    if-eqz v4, :cond_5

    .line 209
    .line 210
    iget-object v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 211
    .line 212
    const/16 v3, 0x7f

    .line 213
    .line 214
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 215
    .line 216
    .line 217
    iget-object v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 218
    .line 219
    iget v3, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->e:I

    .line 220
    .line 221
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 222
    .line 223
    .line 224
    iget-boolean v2, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->k:Z

    .line 225
    .line 226
    if-eqz v2, :cond_5

    .line 227
    .line 228
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    if-eqz v3, :cond_5

    .line 237
    .line 238
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    check-cast v3, Ll/s5d0;

    .line 243
    .line 244
    iget v4, v7, Landroid/graphics/Rect;->left:I

    .line 245
    .line 246
    int-to-float v4, v4

    .line 247
    invoke-virtual {v3}, Ll/s5d0;->c()F

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    add-float/2addr v4, v5

    .line 252
    iget v5, v7, Landroid/graphics/Rect;->top:I

    .line 253
    .line 254
    int-to-float v5, v5

    .line 255
    invoke-virtual {v3}, Ll/s5d0;->d()F

    .line 256
    .line 257
    .line 258
    move-result v3

    .line 259
    add-float/2addr v5, v3

    .line 260
    const/high16 v3, 0x40400000    # 3.0f

    .line 261
    .line 262
    iget-object v6, p0, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->a:Landroid/graphics/Paint;

    .line 263
    .line 264
    invoke-virtual {p1, v4, v5, v3, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 265
    .line 266
    .line 267
    goto :goto_3

    .line 268
    :cond_5
    iget v3, v7, Landroid/graphics/Rect;->left:I

    .line 269
    .line 270
    iget v4, v7, Landroid/graphics/Rect;->top:I

    .line 271
    .line 272
    iget v5, v7, Landroid/graphics/Rect;->right:I

    .line 273
    .line 274
    iget v6, v7, Landroid/graphics/Rect;->bottom:I

    .line 275
    .line 276
    const-wide/16 v1, 0x64

    .line 277
    .line 278
    move-object v0, p0

    .line 279
    invoke-virtual/range {v0 .. v6}, Landroid/view/View;->postInvalidateDelayed(JIIII)V

    .line 280
    .line 281
    .line 282
    return-void
.end method
