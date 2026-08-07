.class public Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;
.super Landroidx/recyclerview/widget/RecyclerView$o;
.source "SourceFile"


# static fields
.field public static final l:I


# instance fields
.field public a:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field public b:Landroid/util/SparseBooleanArray;

.field public c:Ll/yfq;

.field public d:I

.field public e:I

.field public f:I

.field public final g:I

.field public final h:I

.field public final i:I

.field public j:I

.field public k:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42c40000    # 98.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$o;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->a:Landroid/util/SparseArray;

    .line 10
    .line 11
    new-instance v0, Landroid/util/SparseBooleanArray;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->b:Landroid/util/SparseBooleanArray;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 20
    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->e:I

    .line 22
    .line 23
    sget v1, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 24
    .line 25
    div-int/lit8 v2, v1, 0x2

    .line 26
    .line 27
    iput v2, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->g:I

    .line 28
    .line 29
    div-int/lit8 v2, v1, 0x3

    .line 30
    .line 31
    iput v2, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->h:I

    .line 32
    .line 33
    div-int/lit8 v1, v1, 0x6

    .line 34
    .line 35
    iput v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i:I

    .line 36
    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->j:I

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->k:Z

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;Landroidx/recyclerview/widget/RecyclerView;Ll/y20;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l(Landroidx/recyclerview/widget/RecyclerView;Ll/y20;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->m()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->n(Ll/y20;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;Landroidx/recyclerview/widget/RecyclerView;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->o(Landroidx/recyclerview/widget/RecyclerView;Ll/y20;)V

    return-void
.end method

.method private h()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingStart()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingEnd()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    return v0
.end method

.method private i()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingBottom()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPaddingTop()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    return v0
.end method


# virtual methods
.method public canScrollHorizontally()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public canScrollVertically()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final g()V
    .locals 10

    .line 1
    sget v0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->a:Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    move v1, v0

    .line 12
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-ge v1, v2, :cond_1

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->a:Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Landroid/graphics/Rect;

    .line 25
    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    new-instance v2, Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget v3, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 34
    .line 35
    invoke-static {}, Ll/bnl0;->y0()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    iget v5, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 40
    .line 41
    sget v6, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 42
    .line 43
    add-int/2addr v5, v6

    .line 44
    invoke-virtual {v2, v0, v3, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 45
    .line 46
    .line 47
    iget v3, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 48
    .line 49
    add-int/2addr v3, v6

    .line 50
    iput v3, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 51
    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->a:Landroid/util/SparseArray;

    .line 53
    .line 54
    invoke-virtual {v3, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    add-int/lit8 v1, v1, -0x1

    .line 65
    .line 66
    iget v2, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 67
    .line 68
    sget v3, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 69
    .line 70
    add-int/2addr v2, v3

    .line 71
    if-le v2, v3, :cond_5

    .line 72
    .line 73
    move v3, v1

    .line 74
    :goto_1
    if-ltz v3, :cond_5

    .line 75
    .line 76
    iget-object v4, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->a:Landroid/util/SparseArray;

    .line 77
    .line 78
    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Landroid/graphics/Rect;

    .line 83
    .line 84
    iget v5, v4, Landroid/graphics/Rect;->top:I

    .line 85
    .line 86
    if-ge v5, v2, :cond_4

    .line 87
    .line 88
    sget v0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 89
    .line 90
    rem-int v1, v2, v0

    .line 91
    .line 92
    int-to-double v5, v1

    .line 93
    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    .line 94
    .line 95
    div-double/2addr v5, v7

    .line 96
    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    .line 97
    .line 98
    .line 99
    move-result-wide v5

    .line 100
    double-to-int v1, v5

    .line 101
    sub-int v1, v0, v1

    .line 102
    .line 103
    if-ne v1, v0, :cond_3

    .line 104
    .line 105
    rem-int v5, v2, v0

    .line 106
    .line 107
    iget v6, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->g:I

    .line 108
    .line 109
    if-gt v5, v6, :cond_2

    .line 110
    .line 111
    rem-int v0, v2, v0

    .line 112
    .line 113
    if-nez v0, :cond_3

    .line 114
    .line 115
    :cond_2
    move v1, v6

    .line 116
    :cond_3
    iget v0, v4, Landroid/graphics/Rect;->bottom:I

    .line 117
    .line 118
    sub-int/2addr v0, v1

    .line 119
    iput v0, v4, Landroid/graphics/Rect;->top:I

    .line 120
    .line 121
    add-int/lit8 v1, v3, -0x1

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_4
    add-int/lit8 v3, v3, -0x1

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_5
    :goto_2
    sget v3, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 128
    .line 129
    mul-int/lit8 v3, v3, 0x2

    .line 130
    .line 131
    const-wide/high16 v4, 0x4018000000000000L    # 6.0

    .line 132
    .line 133
    if-le v2, v3, :cond_9

    .line 134
    .line 135
    move v3, v1

    .line 136
    :goto_3
    if-ltz v3, :cond_9

    .line 137
    .line 138
    iget-object v6, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->a:Landroid/util/SparseArray;

    .line 139
    .line 140
    invoke-virtual {v6, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    check-cast v6, Landroid/graphics/Rect;

    .line 145
    .line 146
    iget v7, v6, Landroid/graphics/Rect;->top:I

    .line 147
    .line 148
    if-ge v7, v2, :cond_8

    .line 149
    .line 150
    iget v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->g:I

    .line 151
    .line 152
    sget v7, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 153
    .line 154
    rem-int v8, v2, v7

    .line 155
    .line 156
    int-to-double v8, v8

    .line 157
    div-double/2addr v8, v4

    .line 158
    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    .line 159
    .line 160
    .line 161
    move-result-wide v8

    .line 162
    double-to-int v8, v8

    .line 163
    sub-int/2addr v1, v8

    .line 164
    iget v8, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->g:I

    .line 165
    .line 166
    if-ne v1, v8, :cond_7

    .line 167
    .line 168
    rem-int v9, v2, v7

    .line 169
    .line 170
    if-gt v9, v8, :cond_6

    .line 171
    .line 172
    rem-int v7, v2, v7

    .line 173
    .line 174
    if-nez v7, :cond_7

    .line 175
    .line 176
    :cond_6
    iget v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->h:I

    .line 177
    .line 178
    :cond_7
    iput v0, v6, Landroid/graphics/Rect;->bottom:I

    .line 179
    .line 180
    sub-int/2addr v0, v1

    .line 181
    iput v0, v6, Landroid/graphics/Rect;->top:I

    .line 182
    .line 183
    add-int/lit8 v1, v3, -0x1

    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_8
    add-int/lit8 v3, v3, -0x1

    .line 187
    .line 188
    goto :goto_3

    .line 189
    :cond_9
    :goto_4
    sget v3, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 190
    .line 191
    mul-int/lit8 v3, v3, 0x3

    .line 192
    .line 193
    if-le v2, v3, :cond_d

    .line 194
    .line 195
    :goto_5
    if-ltz v1, :cond_d

    .line 196
    .line 197
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->a:Landroid/util/SparseArray;

    .line 198
    .line 199
    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    check-cast v3, Landroid/graphics/Rect;

    .line 204
    .line 205
    iget v6, v3, Landroid/graphics/Rect;->top:I

    .line 206
    .line 207
    if-ge v6, v2, :cond_c

    .line 208
    .line 209
    iget v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->h:I

    .line 210
    .line 211
    sget v6, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 212
    .line 213
    rem-int v7, v2, v6

    .line 214
    .line 215
    int-to-double v7, v7

    .line 216
    div-double/2addr v7, v4

    .line 217
    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    .line 218
    .line 219
    .line 220
    move-result-wide v4

    .line 221
    double-to-int v4, v4

    .line 222
    sub-int/2addr v1, v4

    .line 223
    iget v4, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->h:I

    .line 224
    .line 225
    if-ne v1, v4, :cond_b

    .line 226
    .line 227
    rem-int v4, v2, v6

    .line 228
    .line 229
    iget v5, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->g:I

    .line 230
    .line 231
    if-gt v4, v5, :cond_a

    .line 232
    .line 233
    rem-int/2addr v2, v6

    .line 234
    if-nez v2, :cond_b

    .line 235
    .line 236
    :cond_a
    iget v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i:I

    .line 237
    .line 238
    :cond_b
    iput v0, v3, Landroid/graphics/Rect;->bottom:I

    .line 239
    .line 240
    sub-int/2addr v0, v1

    .line 241
    iput v0, v3, Landroid/graphics/Rect;->top:I

    .line 242
    .line 243
    goto :goto_6

    .line 244
    :cond_c
    add-int/lit8 v1, v1, -0x1

    .line 245
    .line 246
    goto :goto_5

    .line 247
    :cond_d
    :goto_6
    iget v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 248
    .line 249
    iput v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->e:I

    .line 250
    .line 251
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i()I

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    iget v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 256
    .line 257
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    iput v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 262
    .line 263
    iget v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 264
    .line 265
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i()I

    .line 266
    .line 267
    .line 268
    move-result v2

    .line 269
    sub-int/2addr v0, v2

    .line 270
    if-le v1, v0, :cond_e

    .line 271
    .line 272
    iget v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 273
    .line 274
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i()I

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    sub-int/2addr v0, v1

    .line 279
    iput v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 280
    .line 281
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->g()V

    .line 282
    .line 283
    .line 284
    :cond_e
    return-void
.end method

.method public generateDefaultLayoutParams()Landroidx/recyclerview/widget/RecyclerView$p;
    .locals 2

    .line 1
    new-instance p0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    const/4 v1, -0x2

    .line 5
    invoke-direct {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public j()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->e:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sub-int/2addr v0, v1

    .line 8
    iget p0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 9
    .line 10
    sub-int/2addr v0, p0

    .line 11
    return v0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic l(Landroidx/recyclerview/widget/RecyclerView;Ll/y20;Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->j:I

    .line 12
    .line 13
    sub-int/2addr v0, v1

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p1, v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->j:I

    .line 29
    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final synthetic m()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->k:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Ll/y20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->k:Z

    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/high16 p0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic o(Landroidx/recyclerview/widget/RecyclerView;Ll/y20;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->j:I

    .line 3
    .line 4
    iget v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    sub-int/2addr v1, v2

    .line 11
    iget v2, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 12
    .line 13
    sub-int/2addr v1, v2

    .line 14
    if-gtz v1, :cond_0

    .line 15
    .line 16
    iget-boolean v2, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->k:Z

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    filled-new-array {v0, v1}, [I

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-wide/16 v1, 0x258

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/yf3;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1, p2}, Ll/yf3;-><init>(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;Landroidx/recyclerview/widget/RecyclerView;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 40
    .line 41
    .line 42
    new-instance p1, Ll/zf3;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Ll/zf3;-><init>(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Ll/ag3;

    .line 48
    .line 49
    invoke-direct {v1, p0, p2}, Ll/ag3;-><init>(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;Ll/y20;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, p1, v1}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->f()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->g()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->p(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public final p(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_7

    .line 6
    .line 7
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->f()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_5

    .line 14
    .line 15
    :cond_0
    new-instance p2, Landroid/graphics/Rect;

    .line 16
    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->h()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget v2, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    add-int/2addr v2, v3

    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-direct {p2, v3, v0, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 37
    .line 38
    .line 39
    move v1, v3

    .line 40
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-ge v1, v2, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    if-nez v2, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedLeft(Landroid/view/View;)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    iput v4, v0, Landroid/graphics/Rect;->left:I

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedTop(Landroid/view/View;)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    iput v4, v0, Landroid/graphics/Rect;->top:I

    .line 64
    .line 65
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedRight(Landroid/view/View;)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    iput v4, v0, Landroid/graphics/Rect;->right:I

    .line 70
    .line 71
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->getDecoratedBottom(Landroid/view/View;)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    iput v4, v0, Landroid/graphics/Rect;->bottom:I

    .line 76
    .line 77
    iget-object v4, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->b:Landroid/util/SparseBooleanArray;

    .line 78
    .line 79
    invoke-virtual {v4, v1}, Landroid/util/SparseBooleanArray;->get(I)Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-eqz v4, :cond_2

    .line 84
    .line 85
    invoke-static {p2, v0}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    if-nez v4, :cond_2

    .line 90
    .line 91
    invoke-virtual {p0, v2, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->removeAndRecycleView(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 92
    .line 93
    .line 94
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->b:Landroid/util/SparseBooleanArray;

    .line 95
    .line 96
    invoke-virtual {v2, v1, v3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 97
    .line 98
    .line 99
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->detachAndScrapAttachedViews(Landroidx/recyclerview/widget/RecyclerView$v;)V

    .line 103
    .line 104
    .line 105
    move v0, v3

    .line 106
    :goto_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-ge v0, v1, :cond_7

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->a:Landroid/util/SparseArray;

    .line 113
    .line 114
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Landroid/graphics/Rect;

    .line 119
    .line 120
    invoke-static {p2, v1}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-eqz v1, :cond_6

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$v;->o(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    invoke-virtual {p0, v5, v3, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->measureChildWithMargins(Landroid/view/View;II)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, v5}, Landroidx/recyclerview/widget/RecyclerView$o;->addView(Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->a:Landroid/util/SparseArray;

    .line 137
    .line 138
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    check-cast v1, Landroid/graphics/Rect;

    .line 143
    .line 144
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 145
    .line 146
    iget v4, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 147
    .line 148
    sub-int v7, v2, v4

    .line 149
    .line 150
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 151
    .line 152
    sub-int v9, v2, v4

    .line 153
    .line 154
    iget v6, v1, Landroid/graphics/Rect;->left:I

    .line 155
    .line 156
    iget v8, v1, Landroid/graphics/Rect;->right:I

    .line 157
    .line 158
    move-object v4, p0

    .line 159
    invoke-virtual/range {v4 .. v9}, Landroidx/recyclerview/widget/RecyclerView$o;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    .line 160
    .line 161
    .line 162
    iget-object p0, v4, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->c:Ll/yfq;

    .line 163
    .line 164
    const/4 v1, 0x1

    .line 165
    if-eqz p0, :cond_5

    .line 166
    .line 167
    sub-int/2addr v9, v7

    .line 168
    int-to-float v2, v9

    .line 169
    sget v6, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 170
    .line 171
    int-to-float v6, v6

    .line 172
    div-float/2addr v2, v6

    .line 173
    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 174
    .line 175
    .line 176
    move-result v6

    .line 177
    sub-int/2addr v6, v1

    .line 178
    if-ne v0, v6, :cond_4

    .line 179
    .line 180
    move v6, v1

    .line 181
    goto :goto_3

    .line 182
    :cond_4
    move v6, v3

    .line 183
    :goto_3
    invoke-interface {p0, v5, v2, v6}, Ll/yfq;->a(Landroid/view/View;FZ)V

    .line 184
    .line 185
    .line 186
    :cond_5
    iget-object p0, v4, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->b:Landroid/util/SparseBooleanArray;

    .line 187
    .line 188
    invoke-virtual {p0, v0, v1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 189
    .line 190
    .line 191
    goto :goto_4

    .line 192
    :cond_6
    move-object v4, p0

    .line 193
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 194
    .line 195
    move-object p0, v4

    .line 196
    goto :goto_2

    .line 197
    :cond_7
    :goto_5
    return-void
.end method

.method public q(Landroidx/recyclerview/widget/RecyclerView;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView;",
            "Ll/y20<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/xf3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/xf3;-><init>(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;Landroidx/recyclerview/widget/RecyclerView;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r(Ll/yfq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->c:Ll/yfq;

    .line 2
    .line 3
    return-void
.end method

.method public scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$o;->scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public scrollToPosition(I)V
    .locals 2

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-le p1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    :cond_1
    sget v0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->l:I

    .line 15
    .line 16
    mul-int/2addr p1, v0

    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sub-int/2addr v0, v1

    .line 24
    if-le p1, v0, :cond_2

    .line 25
    .line 26
    iget p1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    sub-int/2addr p1, v0

    .line 33
    :cond_2
    iput p1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->requestLayout()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 2
    .line 3
    add-int v1, v0, p1

    .line 4
    .line 5
    if-gez v1, :cond_0

    .line 6
    .line 7
    neg-int p1, v0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    add-int/2addr v0, p1

    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    sub-int/2addr v1, v2

    .line 17
    if-le v0, v1, :cond_1

    .line 18
    .line 19
    iget p1, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->d:I

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->i()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    sub-int/2addr p1, v0

    .line 26
    iget v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 27
    .line 28
    sub-int/2addr p1, v0

    .line 29
    :cond_1
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 30
    .line 31
    add-int/2addr v0, p1

    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f:I

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->g()V

    .line 35
    .line 36
    .line 37
    neg-int v0, p1

    .line 38
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->offsetChildrenVertical(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->p(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 42
    .line 43
    .line 44
    return p1
.end method
