.class public Lcom/p1/mobile/putong/core/view/CardLabelShowView3;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/view/CardLabelShowView3$a;,
        Lcom/p1/mobile/putong/core/view/CardLabelShowView3$LayoutData;
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/Paint;

.field public f:I

.field public g:I

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/view/CardLabelShowView3$LayoutData;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public j:I

.field public k:I

.field public volatile l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation
.end field

.field public volatile m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation
.end field

.field public o:I

.field public p:I

.field public q:I

.field public r:Z

.field public s:Lcom/p1/mobile/putong/core/view/CardLabelShowView3$a;

.field public t:Z

.field public u:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->h:Ljava/util/List;

    .line 10
    .line 11
    new-instance p3, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->i:Ljava/util/Map;

    .line 17
    .line 18
    new-instance p3, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 24
    .line 25
    new-instance p3, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->m:Ljava/util/List;

    .line 31
    .line 32
    new-instance p3, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->n:Ljava/util/List;

    .line 38
    .line 39
    const/4 p3, 0x0

    .line 40
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->t:Z

    .line 41
    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->c(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static b(F)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 12
    .line 13
    mul-float/2addr v0, p0

    .line 14
    float-to-int p0, v0

    .line 15
    return p0
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/view/CardLabelShowView3$LayoutData;

    .line 18
    .line 19
    iget v2, v1, Lcom/p1/mobile/putong/core/view/CardLabelShowView3$LayoutData;->line:I

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->i:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->i:Ljava/util/Map;

    .line 30
    .line 31
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ljava/lang/Float;

    .line 40
    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/high16 v3, 0x40000000    # 2.0f

    .line 48
    .line 49
    div-float/2addr v2, v3

    .line 50
    iget v3, v1, Landroid/graphics/RectF;->left:F

    .line 51
    .line 52
    add-float/2addr v3, v2

    .line 53
    iput v3, v1, Landroid/graphics/RectF;->left:F

    .line 54
    .line 55
    iget v3, v1, Landroid/graphics/RectF;->right:F

    .line 56
    .line 57
    add-float/2addr v3, v2

    .line 58
    iput v3, v1, Landroid/graphics/RectF;->right:F

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-void
.end method

.method public final c(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    .line 1
    sget-object v0, Ll/khc0;->x:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/khc0;->y:I

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/c9c0;->S:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    sget v0, Ll/khc0;->F:I

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->r:Z

    .line 33
    .line 34
    sget v0, Ll/khc0;->B:I

    .line 35
    .line 36
    const/16 v2, 0x64

    .line 37
    .line 38
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->p:I

    .line 43
    .line 44
    sget v0, Ll/khc0;->A:I

    .line 45
    .line 46
    const/4 v2, 0x5

    .line 47
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->q:I

    .line 52
    .line 53
    sget v0, Ll/khc0;->C:I

    .line 54
    .line 55
    const/high16 v2, 0x41200000    # 10.0f

    .line 56
    .line 57
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->k:I

    .line 66
    .line 67
    sget v0, Ll/khc0;->z:I

    .line 68
    .line 69
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    const/4 v2, 0x1

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    sget v0, Ll/khc0;->D:I

    .line 77
    .line 78
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 79
    .line 80
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    sget v4, Ll/c9c0;->T:I

    .line 85
    .line 86
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {p1, v0, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    sget v3, Ll/khc0;->E:I

    .line 95
    .line 96
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    iput v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->o:I

    .line 101
    .line 102
    new-instance v3, Landroid/graphics/Paint;

    .line 103
    .line 104
    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->c:Landroid/graphics/Paint;

    .line 108
    .line 109
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 110
    .line 111
    .line 112
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->c:Landroid/graphics/Paint;

    .line 113
    .line 114
    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->c:Landroid/graphics/Paint;

    .line 118
    .line 119
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 120
    .line 121
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->c:Landroid/graphics/Paint;

    .line 125
    .line 126
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->o:I

    .line 127
    .line 128
    int-to-float v3, v3

    .line 129
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 130
    .line 131
    .line 132
    :cond_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 133
    .line 134
    .line 135
    new-instance p1, Landroid/graphics/Paint;

    .line 136
    .line 137
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 138
    .line 139
    .line 140
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->a:Landroid/graphics/Paint;

    .line 141
    .line 142
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->a:Landroid/graphics/Paint;

    .line 146
    .line 147
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->a:Landroid/graphics/Paint;

    .line 151
    .line 152
    sget-object p2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 153
    .line 154
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 155
    .line 156
    .line 157
    new-instance p1, Landroid/graphics/Paint;

    .line 158
    .line 159
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 160
    .line 161
    .line 162
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b:Landroid/graphics/Paint;

    .line 163
    .line 164
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b:Landroid/graphics/Paint;

    .line 168
    .line 169
    const/high16 v0, 0x7000000

    .line 170
    .line 171
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b:Landroid/graphics/Paint;

    .line 175
    .line 176
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 177
    .line 178
    .line 179
    new-instance p1, Landroid/graphics/Paint;

    .line 180
    .line 181
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 182
    .line 183
    .line 184
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->d:Landroid/graphics/Paint;

    .line 185
    .line 186
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 187
    .line 188
    .line 189
    new-instance p1, Landroid/graphics/Paint;

    .line 190
    .line 191
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 192
    .line 193
    .line 194
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e:Landroid/graphics/Paint;

    .line 195
    .line 196
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 197
    .line 198
    .line 199
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e:Landroid/graphics/Paint;

    .line 200
    .line 201
    const/4 p2, 0x3

    .line 202
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 203
    .line 204
    .line 205
    move-result-object p2

    .line 206
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 207
    .line 208
    .line 209
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e:Landroid/graphics/Paint;

    .line 210
    .line 211
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 212
    .line 213
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    sget v0, Ll/c9c0;->q0:I

    .line 218
    .line 219
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 220
    .line 221
    .line 222
    move-result p2

    .line 223
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 224
    .line 225
    .line 226
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e:Landroid/graphics/Paint;

    .line 227
    .line 228
    const/high16 p2, 0x41600000    # 14.0f

    .line 229
    .line 230
    invoke-static {p2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 231
    .line 232
    .line 233
    move-result p2

    .line 234
    int-to-float p2, p2

    .line 235
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 236
    .line 237
    .line 238
    new-instance p1, Landroid/graphics/Rect;

    .line 239
    .line 240
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 241
    .line 242
    .line 243
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e:Landroid/graphics/Paint;

    .line 244
    .line 245
    const-string v0, "\u9ad8"

    .line 246
    .line 247
    invoke-virtual {p2, v0, v1, v2, p1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 248
    .line 249
    .line 250
    iget p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 251
    .line 252
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 253
    .line 254
    sub-int/2addr p2, p1

    .line 255
    const/high16 p1, 0x42300000    # 44.0f

    .line 256
    .line 257
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    sub-int/2addr p1, p2

    .line 262
    div-int/lit8 p1, p1, 0x2

    .line 263
    .line 264
    add-int/2addr p1, p2

    .line 265
    const/high16 p2, 0x3f800000    # 1.0f

    .line 266
    .line 267
    invoke-static {p2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 268
    .line 269
    .line 270
    move-result p2

    .line 271
    sub-int/2addr p1, p2

    .line 272
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->g:I

    .line 273
    .line 274
    return-void
.end method

.method public d(Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_4

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->m:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->m:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eq v0, v2, :cond_1

    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    move v2, v0

    .line 32
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-ge v2, v3, :cond_3

    .line 37
    .line 38
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 43
    .line 44
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->m:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    check-cast v4, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 53
    .line 54
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-nez v3, :cond_2

    .line 61
    .line 62
    return v1

    .line 63
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    return v0

    .line 67
    :cond_4
    :goto_1
    return v1
.end method

.method public e(III)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->q:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->p:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->k:I

    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    move v1, v0

    .line 6
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->n:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v1, v2, :cond_5

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->h:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/p1/mobile/putong/core/view/CardLabelShowView3$LayoutData;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->n:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 29
    .line 30
    iget-boolean v4, v3, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 31
    .line 32
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->k:I

    .line 33
    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    int-to-float v4, v5

    .line 37
    int-to-float v5, v5

    .line 38
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->a:Landroid/graphics/Paint;

    .line 39
    .line 40
    invoke-virtual {p1, v2, v4, v5, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    int-to-float v4, v5

    .line 45
    int-to-float v5, v5

    .line 46
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b:Landroid/graphics/Paint;

    .line 47
    .line 48
    invoke-virtual {p1, v2, v4, v5, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 49
    .line 50
    .line 51
    :goto_1
    if-nez v1, :cond_1

    .line 52
    .line 53
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->t:Z

    .line 54
    .line 55
    if-eqz v4, :cond_1

    .line 56
    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->s:Lcom/p1/mobile/putong/core/view/CardLabelShowView3$a;

    .line 58
    .line 59
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-eqz v4, :cond_1

    .line 64
    .line 65
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->s:Lcom/p1/mobile/putong/core/view/CardLabelShowView3$a;

    .line 66
    .line 67
    iget v5, v2, Landroid/graphics/RectF;->left:F

    .line 68
    .line 69
    float-to-int v5, v5

    .line 70
    iget v6, v2, Landroid/graphics/RectF;->right:F

    .line 71
    .line 72
    float-to-int v6, v6

    .line 73
    iget v7, v2, Landroid/graphics/RectF;->bottom:F

    .line 74
    .line 75
    iget v8, v2, Landroid/graphics/RectF;->top:F

    .line 76
    .line 77
    sub-float/2addr v7, v8

    .line 78
    float-to-int v7, v7

    .line 79
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 80
    .line 81
    invoke-interface {v4, v5, v6, v7, v3}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3$a;->a(IIIZ)V

    .line 82
    .line 83
    .line 84
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->c:Landroid/graphics/Paint;

    .line 85
    .line 86
    if-eqz v3, :cond_2

    .line 87
    .line 88
    new-instance v3, Landroid/graphics/RectF;

    .line 89
    .line 90
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 91
    .line 92
    .line 93
    iget v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->o:I

    .line 94
    .line 95
    div-int/lit8 v4, v4, 0x2

    .line 96
    .line 97
    int-to-float v4, v4

    .line 98
    iget v5, v2, Landroid/graphics/RectF;->top:F

    .line 99
    .line 100
    add-float/2addr v5, v4

    .line 101
    iput v5, v3, Landroid/graphics/RectF;->top:F

    .line 102
    .line 103
    iget v5, v2, Landroid/graphics/RectF;->left:F

    .line 104
    .line 105
    add-float/2addr v5, v4

    .line 106
    iput v5, v3, Landroid/graphics/RectF;->left:F

    .line 107
    .line 108
    iget v5, v2, Landroid/graphics/RectF;->right:F

    .line 109
    .line 110
    sub-float/2addr v5, v4

    .line 111
    iput v5, v3, Landroid/graphics/RectF;->right:F

    .line 112
    .line 113
    iget v5, v2, Landroid/graphics/RectF;->bottom:F

    .line 114
    .line 115
    sub-float/2addr v5, v4

    .line 116
    iput v5, v3, Landroid/graphics/RectF;->bottom:F

    .line 117
    .line 118
    iget v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->k:I

    .line 119
    .line 120
    int-to-float v5, v4

    .line 121
    int-to-float v4, v4

    .line 122
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->c:Landroid/graphics/Paint;

    .line 123
    .line 124
    invoke-virtual {p1, v3, v5, v4, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 125
    .line 126
    .line 127
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->n:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    check-cast v3, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 134
    .line 135
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 136
    .line 137
    new-instance v4, Landroid/graphics/Rect;

    .line 138
    .line 139
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 140
    .line 141
    .line 142
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e:Landroid/graphics/Paint;

    .line 143
    .line 144
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    invoke-virtual {v5, v3, v0, v6, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 149
    .line 150
    .line 151
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e:Landroid/graphics/Paint;

    .line 152
    .line 153
    const/4 v6, 0x3

    .line 154
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 155
    .line 156
    .line 157
    move-result-object v6

    .line 158
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 159
    .line 160
    .line 161
    iget v5, v4, Landroid/graphics/Rect;->right:I

    .line 162
    .line 163
    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 164
    .line 165
    sub-int/2addr v5, v4

    .line 166
    int-to-float v4, v5

    .line 167
    iget v5, v2, Landroid/graphics/RectF;->right:F

    .line 168
    .line 169
    iget v6, v2, Landroid/graphics/RectF;->left:F

    .line 170
    .line 171
    sub-float/2addr v5, v6

    .line 172
    const/high16 v6, 0x41800000    # 16.0f

    .line 173
    .line 174
    invoke-static {v6}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 175
    .line 176
    .line 177
    move-result v7

    .line 178
    int-to-float v7, v7

    .line 179
    sub-float/2addr v5, v7

    .line 180
    cmpg-float v7, v4, v5

    .line 181
    .line 182
    if-gtz v7, :cond_3

    .line 183
    .line 184
    iget v4, v2, Landroid/graphics/RectF;->left:F

    .line 185
    .line 186
    invoke-static {v6}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 187
    .line 188
    .line 189
    move-result v5

    .line 190
    int-to-float v5, v5

    .line 191
    add-float/2addr v4, v5

    .line 192
    iget v2, v2, Landroid/graphics/RectF;->top:F

    .line 193
    .line 194
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->g:I

    .line 195
    .line 196
    int-to-float v5, v5

    .line 197
    add-float/2addr v2, v5

    .line 198
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e:Landroid/graphics/Paint;

    .line 199
    .line 200
    invoke-virtual {p1, v3, v4, v2, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_3
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    int-to-float v7, v7

    .line 209
    div-float/2addr v5, v4

    .line 210
    mul-float/2addr v7, v5

    .line 211
    float-to-int v4, v7

    .line 212
    const/4 v5, 0x1

    .line 213
    if-le v4, v5, :cond_4

    .line 214
    .line 215
    add-int/lit8 v4, v4, -0x1

    .line 216
    .line 217
    :cond_4
    invoke-virtual {v3, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    const-string v4, "..."

    .line 222
    .line 223
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    iget v4, v2, Landroid/graphics/RectF;->left:F

    .line 228
    .line 229
    invoke-static {v6}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    int-to-float v5, v5

    .line 234
    add-float/2addr v4, v5

    .line 235
    iget v2, v2, Landroid/graphics/RectF;->top:F

    .line 236
    .line 237
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->g:I

    .line 238
    .line 239
    int-to-float v5, v5

    .line 240
    add-float/2addr v2, v5

    .line 241
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e:Landroid/graphics/Paint;

    .line 242
    .line 243
    invoke-virtual {p1, v3, v4, v2, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 244
    .line 245
    .line 246
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :cond_5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->t:Z

    .line 251
    .line 252
    return-void
.end method

.method public onMeasure(II)V
    .locals 13

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->f:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->f:I

    .line 12
    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->d(Ljava/util/List;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    if-lez p2, :cond_0

    .line 24
    .line 25
    iget v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->j:I

    .line 26
    .line 27
    if-ne p2, v0, :cond_0

    .line 28
    .line 29
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->j:I

    .line 34
    .line 35
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->h:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->n:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    const/4 v0, 0x0

    .line 56
    const/4 v1, 0x1

    .line 57
    if-lez p2, :cond_1

    .line 58
    .line 59
    move p2, v1

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    move p2, v0

    .line 62
    :goto_0
    const/4 v2, 0x0

    .line 63
    move v3, v0

    .line 64
    move v4, v2

    .line 65
    :goto_1
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-ge v3, v5, :cond_9

    .line 72
    .line 73
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->p:I

    .line 74
    .line 75
    if-eqz v5, :cond_2

    .line 76
    .line 77
    if-lt v3, v5, :cond_2

    .line 78
    .line 79
    goto/16 :goto_6

    .line 80
    .line 81
    :cond_2
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    check-cast v5, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 88
    .line 89
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-eqz v5, :cond_3

    .line 96
    .line 97
    goto/16 :goto_5

    .line 98
    .line 99
    :cond_3
    add-int/lit8 v5, p2, -0x1

    .line 100
    .line 101
    const/high16 v6, 0x42500000    # 52.0f

    .line 102
    .line 103
    invoke-static {v6}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 104
    .line 105
    .line 106
    move-result v7

    .line 107
    mul-int/2addr v5, v7

    .line 108
    new-instance v7, Lcom/p1/mobile/putong/core/view/CardLabelShowView3$LayoutData;

    .line 109
    .line 110
    invoke-direct {v7}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3$LayoutData;-><init>()V

    .line 111
    .line 112
    .line 113
    iget-object v8, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e:Landroid/graphics/Paint;

    .line 114
    .line 115
    iget-object v9, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 116
    .line 117
    invoke-interface {v9, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v9

    .line 121
    check-cast v9, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 122
    .line 123
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 126
    .line 127
    .line 128
    move-result v8

    .line 129
    add-float v9, v4, v8

    .line 130
    .line 131
    const/high16 v10, 0x42200000    # 40.0f

    .line 132
    .line 133
    invoke-static {v10}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 134
    .line 135
    .line 136
    move-result v10

    .line 137
    int-to-float v10, v10

    .line 138
    add-float/2addr v9, v10

    .line 139
    iput p2, v7, Lcom/p1/mobile/putong/core/view/CardLabelShowView3$LayoutData;->line:I

    .line 140
    .line 141
    iget v10, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->f:I

    .line 142
    .line 143
    int-to-float v10, v10

    .line 144
    cmpl-float v10, v9, v10

    .line 145
    .line 146
    const/high16 v11, 0x42300000    # 44.0f

    .line 147
    .line 148
    const/high16 v12, 0x42000000    # 32.0f

    .line 149
    .line 150
    if-lez v10, :cond_6

    .line 151
    .line 152
    add-int/lit8 v4, p2, 0x1

    .line 153
    .line 154
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->p:I

    .line 155
    .line 156
    if-le v4, v5, :cond_4

    .line 157
    .line 158
    move p2, v5

    .line 159
    goto/16 :goto_6

    .line 160
    .line 161
    :cond_4
    invoke-static {v12}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 162
    .line 163
    .line 164
    move-result v5

    .line 165
    int-to-float v5, v5

    .line 166
    add-float/2addr v8, v5

    .line 167
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->f:I

    .line 168
    .line 169
    int-to-float v9, v5

    .line 170
    cmpl-float v9, v8, v9

    .line 171
    .line 172
    if-lez v9, :cond_5

    .line 173
    .line 174
    int-to-float v5, v5

    .line 175
    goto :goto_2

    .line 176
    :cond_5
    move v5, v8

    .line 177
    :goto_2
    invoke-static {v6}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    mul-int/2addr p2, v6

    .line 182
    iput v2, v7, Landroid/graphics/RectF;->left:F

    .line 183
    .line 184
    int-to-float v6, p2

    .line 185
    iput v6, v7, Landroid/graphics/RectF;->top:F

    .line 186
    .line 187
    iput v5, v7, Landroid/graphics/RectF;->right:F

    .line 188
    .line 189
    invoke-static {v11}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 190
    .line 191
    .line 192
    move-result v6

    .line 193
    add-int/2addr v6, p2

    .line 194
    int-to-float p2, v6

    .line 195
    iput p2, v7, Landroid/graphics/RectF;->bottom:F

    .line 196
    .line 197
    iput v4, v7, Lcom/p1/mobile/putong/core/view/CardLabelShowView3$LayoutData;->line:I

    .line 198
    .line 199
    iget p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->f:I

    .line 200
    .line 201
    int-to-float p2, p2

    .line 202
    sub-float/2addr p2, v5

    .line 203
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->i:Ljava/util/Map;

    .line 204
    .line 205
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 206
    .line 207
    .line 208
    move-result-object v8

    .line 209
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    invoke-interface {v6, v8, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->h:Ljava/util/List;

    .line 217
    .line 218
    invoke-interface {p2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->n:Ljava/util/List;

    .line 222
    .line 223
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 224
    .line 225
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v6

    .line 229
    check-cast v6, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 230
    .line 231
    invoke-interface {p2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move p2, v4

    .line 235
    move v4, v5

    .line 236
    goto :goto_5

    .line 237
    :cond_6
    cmpl-float v6, v4, v2

    .line 238
    .line 239
    if-nez v6, :cond_7

    .line 240
    .line 241
    move v4, v2

    .line 242
    goto :goto_3

    .line 243
    :cond_7
    const/high16 v10, 0x41000000    # 8.0f

    .line 244
    .line 245
    invoke-static {v10}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 246
    .line 247
    .line 248
    move-result v10

    .line 249
    int-to-float v10, v10

    .line 250
    add-float/2addr v4, v10

    .line 251
    :goto_3
    iput v4, v7, Landroid/graphics/RectF;->left:F

    .line 252
    .line 253
    int-to-float v4, v5

    .line 254
    iput v4, v7, Landroid/graphics/RectF;->top:F

    .line 255
    .line 256
    if-nez v6, :cond_8

    .line 257
    .line 258
    invoke-static {v12}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 259
    .line 260
    .line 261
    move-result v4

    .line 262
    int-to-float v4, v4

    .line 263
    add-float/2addr v8, v4

    .line 264
    move v4, v8

    .line 265
    goto :goto_4

    .line 266
    :cond_8
    move v4, v9

    .line 267
    :goto_4
    iput v4, v7, Landroid/graphics/RectF;->right:F

    .line 268
    .line 269
    invoke-static {v11}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 270
    .line 271
    .line 272
    move-result v6

    .line 273
    add-int/2addr v6, v5

    .line 274
    int-to-float v5, v6

    .line 275
    iput v5, v7, Landroid/graphics/RectF;->bottom:F

    .line 276
    .line 277
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->h:Ljava/util/List;

    .line 278
    .line 279
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->n:Ljava/util/List;

    .line 283
    .line 284
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 285
    .line 286
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v6

    .line 290
    check-cast v6, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 291
    .line 292
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->f:I

    .line 296
    .line 297
    int-to-float v5, v5

    .line 298
    sub-float/2addr v5, v4

    .line 299
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->i:Ljava/util/Map;

    .line 300
    .line 301
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 302
    .line 303
    .line 304
    move-result-object v7

    .line 305
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    :goto_5
    add-int/lit8 v3, v3, 0x1

    .line 313
    .line 314
    goto/16 :goto_1

    .line 315
    .line 316
    :cond_9
    :goto_6
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->r:Z

    .line 317
    .line 318
    if-eqz v2, :cond_a

    .line 319
    .line 320
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->a()V

    .line 321
    .line 322
    .line 323
    :cond_a
    if-lez p2, :cond_b

    .line 324
    .line 325
    mul-int/lit8 v0, p2, 0x2c

    .line 326
    .line 327
    sub-int/2addr p2, v1

    .line 328
    mul-int/lit8 p2, p2, 0x8

    .line 329
    .line 330
    add-int/2addr v0, p2

    .line 331
    int-to-float p2, v0

    .line 332
    invoke-static {p2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->b(F)I

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    :cond_b
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->j:I

    .line 337
    .line 338
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->m:Ljava/util/List;

    .line 339
    .line 340
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 341
    .line 342
    .line 343
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->m:Ljava/util/List;

    .line 344
    .line 345
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 346
    .line 347
    invoke-interface {p2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 348
    .line 349
    .line 350
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 351
    .line 352
    .line 353
    move-result p1

    .line 354
    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 355
    .line 356
    .line 357
    return-void
.end method

.method public setFirstLabelShowCallback(Lcom/p1/mobile/putong/core/view/CardLabelShowView3$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->s:Lcom/p1/mobile/putong/core/view/CardLabelShowView3$a;

    .line 2
    .line 3
    return-void
.end method

.method public setLabel(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->d(Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->t:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->n:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->l:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setTagBackgroundPaintLight(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTestKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
