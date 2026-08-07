.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static final h:I

.field public static final i:I

.field public static final j:I

.field public static final k:I


# instance fields
.field public a:Z

.field public b:Landroid/graphics/RectF;

.field public c:Landroid/graphics/Paint;

.field public d:I

.field public e:J

.field public f:F

.field public g:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41f00000    # 30.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->h:I

    .line 8
    .line 9
    const/high16 v0, 0x42040000    # 33.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->i:I

    .line 16
    .line 17
    const/high16 v0, 0x41a00000    # 20.0f

    .line 18
    .line 19
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sput v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->j:I

    .line 24
    .line 25
    const/high16 v0, 0x42640000    # 57.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sput v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->k:I

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->d:I

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->g:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->d:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->g:I

    .line 8
    .line 9
    sget-object v0, Ll/shc0;->g:[I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget p2, Ll/shc0;->h:I

    .line 17
    .line 18
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->a:Z

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->g:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    const-string v0, "#383e46"

    .line 16
    .line 17
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, -0x1

    .line 26
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 30
    .line 31
    const/high16 v1, 0x40a00000    # 5.0f

    .line 32
    .line 33
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    int-to-float v1, v1

    .line 38
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 39
    .line 40
    .line 41
    sget v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->i:I

    .line 42
    .line 43
    int-to-float v0, v0

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    div-int/2addr v1, v2

    .line 49
    int-to-float v1, v1

    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    div-int/2addr v3, v2

    .line 55
    int-to-float v2, v3

    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 57
    .line 58
    invoke-virtual {p1, v1, v2, v0, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final b(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-static {}, Ll/a2j0;->h()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->e:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    long-to-float v0, v0

    .line 9
    const/high16 v1, 0x43960000    # 300.0f

    .line 10
    .line 11
    div-float v2, v0, v1

    .line 12
    .line 13
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->f:F

    .line 14
    .line 15
    const/high16 v3, 0x3f800000    # 1.0f

    .line 16
    .line 17
    cmpl-float v4, v2, v3

    .line 18
    .line 19
    if-lez v4, :cond_0

    .line 20
    .line 21
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->f:F

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    const/4 v5, 0x2

    .line 28
    div-int/2addr v4, v5

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    div-int/2addr v6, v5

    .line 34
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 35
    .line 36
    sget-object v8, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 37
    .line 38
    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 39
    .line 40
    .line 41
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v8

    .line 47
    sget v9, Ll/k9c0;->n:I

    .line 48
    .line 49
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    .line 55
    .line 56
    sget v7, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->j:I

    .line 57
    .line 58
    int-to-float v8, v7

    .line 59
    sget v9, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->h:I

    .line 60
    .line 61
    sub-int v7, v9, v7

    .line 62
    .line 63
    int-to-float v7, v7

    .line 64
    iget v10, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->f:F

    .line 65
    .line 66
    sub-float v10, v3, v10

    .line 67
    .line 68
    mul-float/2addr v7, v10

    .line 69
    add-float/2addr v8, v7

    .line 70
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->b:Landroid/graphics/RectF;

    .line 71
    .line 72
    int-to-float v4, v4

    .line 73
    sub-float v10, v4, v8

    .line 74
    .line 75
    iput v10, v7, Landroid/graphics/RectF;->left:F

    .line 76
    .line 77
    int-to-float v6, v6

    .line 78
    sub-float v10, v6, v8

    .line 79
    .line 80
    iput v10, v7, Landroid/graphics/RectF;->top:F

    .line 81
    .line 82
    add-float/2addr v4, v8

    .line 83
    iput v4, v7, Landroid/graphics/RectF;->right:F

    .line 84
    .line 85
    add-float/2addr v6, v8

    .line 86
    iput v6, v7, Landroid/graphics/RectF;->bottom:F

    .line 87
    .line 88
    const/high16 v4, 0x41000000    # 8.0f

    .line 89
    .line 90
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    int-to-float v6, v6

    .line 95
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    sub-int/2addr v9, v7

    .line 100
    int-to-float v7, v9

    .line 101
    iget v8, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->f:F

    .line 102
    .line 103
    sub-float/2addr v3, v8

    .line 104
    mul-float/2addr v7, v3

    .line 105
    add-float/2addr v6, v7

    .line 106
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->b:Landroid/graphics/RectF;

    .line 107
    .line 108
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 109
    .line 110
    invoke-virtual {p1, v3, v6, v6, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 111
    .line 112
    .line 113
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 114
    .line 115
    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 116
    .line 117
    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 118
    .line 119
    .line 120
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 121
    .line 122
    const-string v6, "#4cff3a00"

    .line 123
    .line 124
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v6

    .line 128
    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    .line 130
    .line 131
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 132
    .line 133
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    int-to-float v4, v4

    .line 138
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 139
    .line 140
    .line 141
    cmpg-float v3, v0, v1

    .line 142
    .line 143
    if-gez v3, :cond_1

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    div-int/2addr v0, v5

    .line 150
    int-to-float v0, v0

    .line 151
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    div-int/2addr v1, v5

    .line 156
    int-to-float v1, v1

    .line 157
    sget v3, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->k:I

    .line 158
    .line 159
    int-to-float v3, v3

    .line 160
    mul-float/2addr v2, v3

    .line 161
    const v3, 0x3f666666    # 0.9f

    .line 162
    .line 163
    .line 164
    mul-float/2addr v2, v3

    .line 165
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 166
    .line 167
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 168
    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_1
    sub-float/2addr v0, v1

    .line 172
    const v1, 0x453b8000    # 3000.0f

    .line 173
    .line 174
    .line 175
    div-float/2addr v0, v1

    .line 176
    float-to-double v0, v0

    .line 177
    const-wide v2, 0x400921fb54442d18L    # Math.PI

    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    mul-double/2addr v0, v2

    .line 183
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 184
    .line 185
    mul-double/2addr v0, v2

    .line 186
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 187
    .line 188
    .line 189
    move-result-wide v0

    .line 190
    const-wide v2, 0x3fb9999a00000000L    # 0.10000002384185791

    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    mul-double/2addr v0, v2

    .line 196
    const-wide v2, 0x3fecccccc0000000L    # 0.8999999761581421

    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    add-double/2addr v0, v2

    .line 202
    double-to-float v0, v0

    .line 203
    sget v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->k:I

    .line 204
    .line 205
    int-to-float v1, v1

    .line 206
    mul-float/2addr v0, v1

    .line 207
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    div-int/2addr v1, v5

    .line 212
    int-to-float v1, v1

    .line 213
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    div-int/2addr v2, v5

    .line 218
    int-to-float v2, v2

    .line 219
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 220
    .line 221
    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 222
    .line 223
    .line 224
    :goto_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->d:I

    .line 225
    .line 226
    if-ne p1, v5, :cond_2

    .line 227
    .line 228
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 229
    .line 230
    .line 231
    :cond_2
    return-void
.end method

.method public final c(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/a2j0;->h()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->e:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    long-to-float v0, v0

    .line 9
    const/high16 v1, 0x43960000    # 300.0f

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    const/high16 v1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    cmpl-float v2, v0, v1

    .line 15
    .line 16
    if-lez v2, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->f:F

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    move v2, v0

    .line 23
    move v0, v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v2, 0x1

    .line 26
    :goto_0
    sub-float v0, v1, v0

    .line 27
    .line 28
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->f:F

    .line 29
    .line 30
    mul-float/2addr v0, v3

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    div-int/lit8 v3, v3, 0x2

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    div-int/lit8 v4, v4, 0x2

    .line 42
    .line 43
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 44
    .line 45
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 46
    .line 47
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 48
    .line 49
    .line 50
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    sget v7, Ll/k9c0;->n:I

    .line 57
    .line 58
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 63
    .line 64
    .line 65
    sget v5, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->j:I

    .line 66
    .line 67
    int-to-float v6, v5

    .line 68
    sget v7, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->h:I

    .line 69
    .line 70
    sub-int v5, v7, v5

    .line 71
    .line 72
    int-to-float v5, v5

    .line 73
    sub-float/2addr v1, v0

    .line 74
    mul-float/2addr v5, v1

    .line 75
    add-float/2addr v6, v5

    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->b:Landroid/graphics/RectF;

    .line 77
    .line 78
    int-to-float v3, v3

    .line 79
    sub-float v5, v3, v6

    .line 80
    .line 81
    iput v5, v0, Landroid/graphics/RectF;->left:F

    .line 82
    .line 83
    int-to-float v4, v4

    .line 84
    sub-float v5, v4, v6

    .line 85
    .line 86
    iput v5, v0, Landroid/graphics/RectF;->top:F

    .line 87
    .line 88
    add-float/2addr v3, v6

    .line 89
    iput v3, v0, Landroid/graphics/RectF;->right:F

    .line 90
    .line 91
    add-float/2addr v4, v6

    .line 92
    iput v4, v0, Landroid/graphics/RectF;->bottom:F

    .line 93
    .line 94
    const/high16 v0, 0x41000000    # 8.0f

    .line 95
    .line 96
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    int-to-float v3, v3

    .line 101
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    sub-int/2addr v7, v0

    .line 106
    int-to-float v0, v7

    .line 107
    mul-float/2addr v0, v1

    .line 108
    add-float/2addr v3, v0

    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->b:Landroid/graphics/RectF;

    .line 110
    .line 111
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 112
    .line 113
    invoke-virtual {p1, v0, v3, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 117
    .line 118
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 119
    .line 120
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 124
    .line 125
    const-string v3, "#4cff3a00"

    .line 126
    .line 127
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 135
    .line 136
    const/high16 v3, 0x40c00000    # 6.0f

    .line 137
    .line 138
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    int-to-float v3, v3

    .line 143
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 144
    .line 145
    .line 146
    sget v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->k:I

    .line 147
    .line 148
    int-to-float v3, v0

    .line 149
    sget v4, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->i:I

    .line 150
    .line 151
    const/high16 v5, 0x40000000    # 2.0f

    .line 152
    .line 153
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v5

    .line 157
    add-int/2addr v4, v5

    .line 158
    sub-int/2addr v4, v0

    .line 159
    int-to-float v0, v4

    .line 160
    mul-float/2addr v0, v1

    .line 161
    add-float/2addr v3, v0

    .line 162
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    div-int/lit8 v0, v0, 0x2

    .line 167
    .line 168
    int-to-float v0, v0

    .line 169
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    div-int/lit8 v1, v1, 0x2

    .line 174
    .line 175
    int-to-float v1, v1

    .line 176
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 177
    .line 178
    invoke-virtual {p1, v0, v1, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 179
    .line 180
    .line 181
    if-eqz v2, :cond_1

    .line 182
    .line 183
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 184
    .line 185
    .line 186
    :cond_1
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->b:Landroid/graphics/RectF;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/RectF;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->b:Landroid/graphics/RectF;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance v0, Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c:Landroid/graphics/Paint;

    .line 26
    .line 27
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->d:I

    .line 28
    .line 29
    if-eq v0, v1, :cond_3

    .line 30
    .line 31
    const/4 v1, 0x2

    .line 32
    if-eq v0, v1, :cond_2

    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->b(Landroid/graphics/Canvas;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->a:Z

    .line 40
    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->a(Landroid/graphics/Canvas;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->c(Landroid/graphics/Canvas;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public setState(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->d:I

    .line 2
    .line 3
    invoke-static {}, Ll/a2j0;->h()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->e:J

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setThemeType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->g:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
