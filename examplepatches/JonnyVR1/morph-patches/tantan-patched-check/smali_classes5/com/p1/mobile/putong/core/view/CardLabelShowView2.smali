.class public Lcom/p1/mobile/putong/core/view/CardLabelShowView2;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/view/CardLabelShowView2$a;
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:I

.field public f:I

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field public i:I

.field public j:I

.field public volatile k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation
.end field

.field public volatile l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation
.end field

.field public volatile n:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 63
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->g:Ljava/util/List;

    .line 10
    .line 11
    new-instance p3, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->h:Ljava/util/List;

    .line 17
    .line 18
    const/high16 p3, 0x41200000    # 10.0f

    .line 19
    .line 20
    invoke-static {p3}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    iput p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->j:I

    .line 25
    .line 26
    new-instance p3, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 32
    .line 33
    new-instance p3, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->l:Ljava/util/List;

    .line 39
    .line 40
    new-instance p3, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->m:Ljava/util/List;

    .line 46
    .line 47
    new-instance p3, Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->n:Ljava/util/HashMap;

    .line 53
    .line 54
    const/16 p3, -0x1a1e

    .line 55
    .line 56
    iput p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->s:I

    .line 57
    .line 58
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static a(F)I
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
.method public final b(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    sget-object v0, Ll/khc0;->q:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/khc0;->r:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->r:I

    .line 26
    .line 27
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->s:I

    .line 28
    .line 29
    sget p2, Ll/khc0;->u:I

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->p:I

    .line 37
    .line 38
    sget p2, Ll/khc0;->t:I

    .line 39
    .line 40
    const/4 v1, 0x5

    .line 41
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->q:I

    .line 46
    .line 47
    sget p2, Ll/khc0;->s:I

    .line 48
    .line 49
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    const/4 v1, 0x1

    .line 54
    if-eqz p2, :cond_0

    .line 55
    .line 56
    sget p2, Ll/khc0;->v:I

    .line 57
    .line 58
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 59
    .line 60
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    sget v3, Ll/c9c0;->T:I

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    sget v2, Ll/khc0;->w:I

    .line 75
    .line 76
    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    iput v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->o:I

    .line 81
    .line 82
    new-instance v2, Landroid/graphics/Paint;

    .line 83
    .line 84
    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->b:Landroid/graphics/Paint;

    .line 88
    .line 89
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->b:Landroid/graphics/Paint;

    .line 93
    .line 94
    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->b:Landroid/graphics/Paint;

    .line 98
    .line 99
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 100
    .line 101
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 102
    .line 103
    .line 104
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->b:Landroid/graphics/Paint;

    .line 105
    .line 106
    iget v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->o:I

    .line 107
    .line 108
    int-to-float v2, v2

    .line 109
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 110
    .line 111
    .line 112
    :cond_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 113
    .line 114
    .line 115
    new-instance p1, Landroid/graphics/Paint;

    .line 116
    .line 117
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 118
    .line 119
    .line 120
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a:Landroid/graphics/Paint;

    .line 121
    .line 122
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a:Landroid/graphics/Paint;

    .line 126
    .line 127
    iget p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->r:I

    .line 128
    .line 129
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a:Landroid/graphics/Paint;

    .line 133
    .line 134
    sget-object p2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 135
    .line 136
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 137
    .line 138
    .line 139
    new-instance p1, Landroid/graphics/Paint;

    .line 140
    .line 141
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->c:Landroid/graphics/Paint;

    .line 145
    .line 146
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 147
    .line 148
    .line 149
    new-instance p1, Landroid/graphics/Paint;

    .line 150
    .line 151
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 152
    .line 153
    .line 154
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->d:Landroid/graphics/Paint;

    .line 155
    .line 156
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->d:Landroid/graphics/Paint;

    .line 160
    .line 161
    const/4 p2, 0x3

    .line 162
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->d:Landroid/graphics/Paint;

    .line 170
    .line 171
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 172
    .line 173
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    sget v2, Ll/c9c0;->q0:I

    .line 178
    .line 179
    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 180
    .line 181
    .line 182
    move-result p2

    .line 183
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->d:Landroid/graphics/Paint;

    .line 187
    .line 188
    const/high16 p2, 0x41600000    # 14.0f

    .line 189
    .line 190
    invoke-static {p2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    int-to-float p2, p2

    .line 195
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 196
    .line 197
    .line 198
    new-instance p1, Landroid/graphics/Rect;

    .line 199
    .line 200
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 201
    .line 202
    .line 203
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->d:Landroid/graphics/Paint;

    .line 204
    .line 205
    const-string v2, "\u9ad8"

    .line 206
    .line 207
    invoke-virtual {p2, v2, v0, v1, p1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 208
    .line 209
    .line 210
    iget p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 211
    .line 212
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 213
    .line 214
    sub-int/2addr p2, p1

    .line 215
    const/high16 p1, 0x42300000    # 44.0f

    .line 216
    .line 217
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    sub-int/2addr p1, p2

    .line 222
    div-int/lit8 p1, p1, 0x2

    .line 223
    .line 224
    add-int/2addr p1, p2

    .line 225
    const/high16 p2, 0x3f800000    # 1.0f

    .line 226
    .line 227
    invoke-static {p2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 228
    .line 229
    .line 230
    move-result p2

    .line 231
    sub-int/2addr p1, p2

    .line 232
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->f:I

    .line 233
    .line 234
    return-void
.end method

.method public c(Ljava/util/List;)Z
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
    if-nez v0, :cond_5

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->l:Ljava/util/List;

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
    goto :goto_2

    .line 17
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->l:Ljava/util/List;

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
    if-ge v2, v3, :cond_4

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->l:Ljava/util/List;

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
    if-eqz v3, :cond_3

    .line 61
    .line 62
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 67
    .line 68
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 69
    .line 70
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->l:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    check-cast v4, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 77
    .line 78
    iget-boolean v4, v4, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 79
    .line 80
    if-eq v3, v4, :cond_2

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    :goto_1
    return v1

    .line 87
    :cond_4
    return v0

    .line 88
    :cond_5
    :goto_2
    return v1
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->m:Ljava/util/List;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->m:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->g:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Landroid/graphics/RectF;

    .line 29
    .line 30
    iget-boolean v4, v2, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 31
    .line 32
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a:Landroid/graphics/Paint;

    .line 33
    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    iget v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->s:I

    .line 37
    .line 38
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    iget v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->r:I

    .line 43
    .line 44
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 45
    .line 46
    .line 47
    :goto_1
    iget v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->j:I

    .line 48
    .line 49
    int-to-float v5, v4

    .line 50
    int-to-float v4, v4

    .line 51
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a:Landroid/graphics/Paint;

    .line 52
    .line 53
    invoke-virtual {p1, v3, v5, v4, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 54
    .line 55
    .line 56
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->b:Landroid/graphics/Paint;

    .line 57
    .line 58
    if-eqz v4, :cond_1

    .line 59
    .line 60
    new-instance v4, Landroid/graphics/RectF;

    .line 61
    .line 62
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 63
    .line 64
    .line 65
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->o:I

    .line 66
    .line 67
    div-int/lit8 v5, v5, 0x2

    .line 68
    .line 69
    int-to-float v5, v5

    .line 70
    iget v6, v3, Landroid/graphics/RectF;->top:F

    .line 71
    .line 72
    add-float/2addr v6, v5

    .line 73
    iput v6, v4, Landroid/graphics/RectF;->top:F

    .line 74
    .line 75
    iget v6, v3, Landroid/graphics/RectF;->left:F

    .line 76
    .line 77
    add-float/2addr v6, v5

    .line 78
    iput v6, v4, Landroid/graphics/RectF;->left:F

    .line 79
    .line 80
    iget v6, v3, Landroid/graphics/RectF;->right:F

    .line 81
    .line 82
    sub-float/2addr v6, v5

    .line 83
    iput v6, v4, Landroid/graphics/RectF;->right:F

    .line 84
    .line 85
    iget v6, v3, Landroid/graphics/RectF;->bottom:F

    .line 86
    .line 87
    sub-float/2addr v6, v5

    .line 88
    iput v6, v4, Landroid/graphics/RectF;->bottom:F

    .line 89
    .line 90
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->j:I

    .line 91
    .line 92
    int-to-float v6, v5

    .line 93
    int-to-float v5, v5

    .line 94
    iget-object v7, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->b:Landroid/graphics/Paint;

    .line 95
    .line 96
    invoke-virtual {p1, v4, v6, v5, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 97
    .line 98
    .line 99
    :cond_1
    iget v2, v2, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 100
    .line 101
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->n:Ljava/util/HashMap;

    .line 106
    .line 107
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    if-eqz v4, :cond_2

    .line 112
    .line 113
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->n:Ljava/util/HashMap;

    .line 114
    .line 115
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    check-cast v4, Landroid/graphics/Bitmap;

    .line 120
    .line 121
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    if-nez v4, :cond_2

    .line 126
    .line 127
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->n:Ljava/util/HashMap;

    .line 128
    .line 129
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    check-cast v2, Landroid/graphics/Bitmap;

    .line 134
    .line 135
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->h:Ljava/util/List;

    .line 136
    .line 137
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    check-cast v4, Landroid/graphics/RectF;

    .line 142
    .line 143
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->c:Landroid/graphics/Paint;

    .line 144
    .line 145
    const/4 v6, 0x0

    .line 146
    invoke-virtual {p1, v2, v6, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 147
    .line 148
    .line 149
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->m:Ljava/util/List;

    .line 150
    .line 151
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    check-cast v2, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 156
    .line 157
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 158
    .line 159
    new-instance v4, Landroid/graphics/Rect;

    .line 160
    .line 161
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 162
    .line 163
    .line 164
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->d:Landroid/graphics/Paint;

    .line 165
    .line 166
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 167
    .line 168
    .line 169
    move-result v6

    .line 170
    invoke-virtual {v5, v2, v0, v6, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 171
    .line 172
    .line 173
    iget v5, v4, Landroid/graphics/Rect;->right:I

    .line 174
    .line 175
    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 176
    .line 177
    sub-int/2addr v5, v4

    .line 178
    int-to-float v4, v5

    .line 179
    iget v5, v3, Landroid/graphics/RectF;->right:F

    .line 180
    .line 181
    iget v6, v3, Landroid/graphics/RectF;->left:F

    .line 182
    .line 183
    sub-float/2addr v5, v6

    .line 184
    const/high16 v6, 0x42180000    # 38.0f

    .line 185
    .line 186
    invoke-static {v6}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 187
    .line 188
    .line 189
    move-result v7

    .line 190
    int-to-float v7, v7

    .line 191
    sub-float/2addr v5, v7

    .line 192
    cmpg-float v7, v4, v5

    .line 193
    .line 194
    if-gtz v7, :cond_3

    .line 195
    .line 196
    iget v4, v3, Landroid/graphics/RectF;->left:F

    .line 197
    .line 198
    invoke-static {v6}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    int-to-float v5, v5

    .line 203
    add-float/2addr v4, v5

    .line 204
    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 205
    .line 206
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->f:I

    .line 207
    .line 208
    int-to-float v5, v5

    .line 209
    add-float/2addr v3, v5

    .line 210
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->d:Landroid/graphics/Paint;

    .line 211
    .line 212
    invoke-virtual {p1, v2, v4, v3, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 213
    .line 214
    .line 215
    goto :goto_2

    .line 216
    :cond_3
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 217
    .line 218
    .line 219
    move-result v7

    .line 220
    int-to-float v7, v7

    .line 221
    div-float/2addr v5, v4

    .line 222
    mul-float/2addr v7, v5

    .line 223
    float-to-int v4, v7

    .line 224
    const/4 v5, 0x1

    .line 225
    if-le v4, v5, :cond_4

    .line 226
    .line 227
    add-int/lit8 v4, v4, -0x1

    .line 228
    .line 229
    :cond_4
    invoke-virtual {v2, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    const-string v4, "..."

    .line 234
    .line 235
    invoke-virtual {v2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    iget v4, v3, Landroid/graphics/RectF;->left:F

    .line 240
    .line 241
    invoke-static {v6}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 242
    .line 243
    .line 244
    move-result v5

    .line 245
    int-to-float v5, v5

    .line 246
    add-float/2addr v4, v5

    .line 247
    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 248
    .line 249
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->f:I

    .line 250
    .line 251
    int-to-float v5, v5

    .line 252
    add-float/2addr v3, v5

    .line 253
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->d:Landroid/graphics/Paint;

    .line 254
    .line 255
    invoke-virtual {p1, v2, v4, v3, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 256
    .line 257
    .line 258
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 259
    .line 260
    goto/16 :goto_0

    .line 261
    .line 262
    :cond_5
    return-void
.end method

.method public onMeasure(II)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/high16 v2, 0x40a00000    # 5.0f

    .line 8
    .line 9
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    sub-int/2addr v1, v2

    .line 14
    iput v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->e:I

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget v2, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->e:I

    .line 21
    .line 22
    if-lez v2, :cond_0

    .line 23
    .line 24
    iget-object v2, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->c(Ljava/util/List;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    if-lez v1, :cond_0

    .line 33
    .line 34
    iget v2, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->i:I

    .line 35
    .line 36
    if-ne v1, v2, :cond_0

    .line 37
    .line 38
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget v2, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->i:I

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->g:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 51
    .line 52
    .line 53
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->m:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 56
    .line 57
    .line 58
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->h:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 61
    .line 62
    .line 63
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    const/4 v2, 0x0

    .line 70
    const/4 v3, 0x1

    .line 71
    if-lez v1, :cond_1

    .line 72
    .line 73
    move v1, v3

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    move v1, v2

    .line 76
    :goto_0
    const/4 v4, 0x0

    .line 77
    move v5, v2

    .line 78
    move v6, v4

    .line 79
    :goto_1
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    if-ge v5, v7, :cond_c

    .line 86
    .line 87
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    check-cast v7, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 94
    .line 95
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    if-eqz v7, :cond_2

    .line 102
    .line 103
    goto/16 :goto_7

    .line 104
    .line 105
    :cond_2
    add-int/lit8 v7, v1, -0x1

    .line 106
    .line 107
    const/high16 v8, 0x42500000    # 52.0f

    .line 108
    .line 109
    invoke-static {v8}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 110
    .line 111
    .line 112
    move-result v9

    .line 113
    mul-int/2addr v7, v9

    .line 114
    new-instance v9, Landroid/graphics/RectF;

    .line 115
    .line 116
    invoke-direct {v9}, Landroid/graphics/RectF;-><init>()V

    .line 117
    .line 118
    .line 119
    iget-object v10, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->d:Landroid/graphics/Paint;

    .line 120
    .line 121
    iget-object v11, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {v11, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v11

    .line 127
    check-cast v11, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 128
    .line 129
    iget-object v11, v11, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 132
    .line 133
    .line 134
    move-result v10

    .line 135
    add-float v11, v6, v10

    .line 136
    .line 137
    const/high16 v12, 0x42780000    # 62.0f

    .line 138
    .line 139
    invoke-static {v12}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 140
    .line 141
    .line 142
    move-result v12

    .line 143
    int-to-float v12, v12

    .line 144
    add-float/2addr v11, v12

    .line 145
    iget v12, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->e:I

    .line 146
    .line 147
    int-to-float v12, v12

    .line 148
    cmpl-float v12, v11, v12

    .line 149
    .line 150
    const/high16 v13, 0x42300000    # 44.0f

    .line 151
    .line 152
    const/high16 v14, 0x42580000    # 54.0f

    .line 153
    .line 154
    if-lez v12, :cond_9

    .line 155
    .line 156
    if-ne v1, v3, :cond_3

    .line 157
    .line 158
    cmpl-float v6, v6, v4

    .line 159
    .line 160
    if-nez v6, :cond_3

    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 164
    .line 165
    :goto_2
    iget v6, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->p:I

    .line 166
    .line 167
    if-le v1, v6, :cond_4

    .line 168
    .line 169
    move v1, v6

    .line 170
    goto/16 :goto_8

    .line 171
    .line 172
    :cond_4
    invoke-static {v14}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 173
    .line 174
    .line 175
    move-result v6

    .line 176
    int-to-float v6, v6

    .line 177
    add-float/2addr v10, v6

    .line 178
    iget v6, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->e:I

    .line 179
    .line 180
    int-to-float v7, v6

    .line 181
    cmpl-float v7, v10, v7

    .line 182
    .line 183
    if-lez v7, :cond_7

    .line 184
    .line 185
    int-to-float v6, v6

    .line 186
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 187
    .line 188
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v7

    .line 192
    check-cast v7, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 193
    .line 194
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 197
    .line 198
    .line 199
    move-result v7

    .line 200
    :cond_5
    add-int/lit8 v7, v7, -0x1

    .line 201
    .line 202
    iget-object v10, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->d:Landroid/graphics/Paint;

    .line 203
    .line 204
    new-instance v11, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .line 208
    .line 209
    iget-object v12, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 210
    .line 211
    invoke-interface {v12, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v12

    .line 215
    check-cast v12, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 216
    .line 217
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 218
    .line 219
    invoke-virtual {v12, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v12

    .line 223
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    const-string v15, "..."

    .line 227
    .line 228
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v12, v15}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v11

    .line 235
    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 236
    .line 237
    .line 238
    move-result v10

    .line 239
    invoke-static {v14}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 240
    .line 241
    .line 242
    move-result v11

    .line 243
    int-to-float v11, v11

    .line 244
    add-float/2addr v10, v11

    .line 245
    iget v11, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->e:I

    .line 246
    .line 247
    int-to-float v11, v11

    .line 248
    cmpl-float v10, v10, v11

    .line 249
    .line 250
    if-ltz v10, :cond_6

    .line 251
    .line 252
    if-gtz v7, :cond_5

    .line 253
    .line 254
    :cond_6
    iget-object v10, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 255
    .line 256
    invoke-interface {v10, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v10

    .line 260
    check-cast v10, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 261
    .line 262
    iget-object v11, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 263
    .line 264
    invoke-interface {v11, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object v11

    .line 268
    check-cast v11, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 269
    .line 270
    iget-object v11, v11, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 271
    .line 272
    invoke-virtual {v11, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v7

    .line 276
    invoke-virtual {v7, v15}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v7

    .line 280
    iput-object v7, v10, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 281
    .line 282
    goto :goto_3

    .line 283
    :cond_7
    move v6, v10

    .line 284
    :goto_3
    if-ne v1, v3, :cond_8

    .line 285
    .line 286
    cmpl-float v7, v6, v4

    .line 287
    .line 288
    if-nez v7, :cond_8

    .line 289
    .line 290
    move v7, v2

    .line 291
    goto :goto_4

    .line 292
    :cond_8
    add-int/lit8 v7, v1, -0x1

    .line 293
    .line 294
    invoke-static {v8}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 295
    .line 296
    .line 297
    move-result v8

    .line 298
    mul-int/2addr v7, v8

    .line 299
    :goto_4
    iput v4, v9, Landroid/graphics/RectF;->left:F

    .line 300
    .line 301
    int-to-float v8, v7

    .line 302
    iput v8, v9, Landroid/graphics/RectF;->top:F

    .line 303
    .line 304
    iput v6, v9, Landroid/graphics/RectF;->right:F

    .line 305
    .line 306
    invoke-static {v13}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 307
    .line 308
    .line 309
    move-result v8

    .line 310
    add-int/2addr v8, v7

    .line 311
    int-to-float v7, v8

    .line 312
    iput v7, v9, Landroid/graphics/RectF;->bottom:F

    .line 313
    .line 314
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->g:Ljava/util/List;

    .line 315
    .line 316
    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 317
    .line 318
    .line 319
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->m:Ljava/util/List;

    .line 320
    .line 321
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 322
    .line 323
    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v8

    .line 327
    check-cast v8, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 328
    .line 329
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    goto :goto_7

    .line 333
    :cond_9
    cmpl-float v8, v6, v4

    .line 334
    .line 335
    if-nez v8, :cond_a

    .line 336
    .line 337
    move v6, v4

    .line 338
    goto :goto_5

    .line 339
    :cond_a
    const/high16 v12, 0x41000000    # 8.0f

    .line 340
    .line 341
    invoke-static {v12}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 342
    .line 343
    .line 344
    move-result v12

    .line 345
    int-to-float v12, v12

    .line 346
    add-float/2addr v6, v12

    .line 347
    :goto_5
    iput v6, v9, Landroid/graphics/RectF;->left:F

    .line 348
    .line 349
    int-to-float v6, v7

    .line 350
    iput v6, v9, Landroid/graphics/RectF;->top:F

    .line 351
    .line 352
    if-nez v8, :cond_b

    .line 353
    .line 354
    invoke-static {v14}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 355
    .line 356
    .line 357
    move-result v6

    .line 358
    int-to-float v6, v6

    .line 359
    add-float/2addr v10, v6

    .line 360
    move v6, v10

    .line 361
    goto :goto_6

    .line 362
    :cond_b
    move v6, v11

    .line 363
    :goto_6
    iput v6, v9, Landroid/graphics/RectF;->right:F

    .line 364
    .line 365
    invoke-static {v13}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 366
    .line 367
    .line 368
    move-result v8

    .line 369
    add-int/2addr v8, v7

    .line 370
    int-to-float v7, v8

    .line 371
    iput v7, v9, Landroid/graphics/RectF;->bottom:F

    .line 372
    .line 373
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->g:Ljava/util/List;

    .line 374
    .line 375
    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 376
    .line 377
    .line 378
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->m:Ljava/util/List;

    .line 379
    .line 380
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 381
    .line 382
    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    move-result-object v8

    .line 386
    check-cast v8, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 387
    .line 388
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 389
    .line 390
    .line 391
    :goto_7
    add-int/lit8 v5, v5, 0x1

    .line 392
    .line 393
    goto/16 :goto_1

    .line 394
    .line 395
    :cond_c
    :goto_8
    move v4, v2

    .line 396
    :goto_9
    iget-object v5, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->m:Ljava/util/List;

    .line 397
    .line 398
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 399
    .line 400
    .line 401
    move-result v5

    .line 402
    if-ge v4, v5, :cond_d

    .line 403
    .line 404
    iget-object v5, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->g:Ljava/util/List;

    .line 405
    .line 406
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 407
    .line 408
    .line 409
    move-result-object v5

    .line 410
    check-cast v5, Landroid/graphics/RectF;

    .line 411
    .line 412
    new-instance v6, Landroid/graphics/RectF;

    .line 413
    .line 414
    invoke-direct {v6}, Landroid/graphics/RectF;-><init>()V

    .line 415
    .line 416
    .line 417
    iget v7, v5, Landroid/graphics/RectF;->top:F

    .line 418
    .line 419
    const/high16 v8, 0x41300000    # 11.0f

    .line 420
    .line 421
    invoke-static {v8}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 422
    .line 423
    .line 424
    move-result v8

    .line 425
    int-to-float v8, v8

    .line 426
    add-float/2addr v7, v8

    .line 427
    iput v7, v6, Landroid/graphics/RectF;->top:F

    .line 428
    .line 429
    iget v5, v5, Landroid/graphics/RectF;->left:F

    .line 430
    .line 431
    const/high16 v7, 0x41400000    # 12.0f

    .line 432
    .line 433
    invoke-static {v7}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 434
    .line 435
    .line 436
    move-result v7

    .line 437
    int-to-float v7, v7

    .line 438
    add-float/2addr v5, v7

    .line 439
    iput v5, v6, Landroid/graphics/RectF;->left:F

    .line 440
    .line 441
    const/high16 v7, 0x41b00000    # 22.0f

    .line 442
    .line 443
    invoke-static {v7}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 444
    .line 445
    .line 446
    move-result v8

    .line 447
    int-to-float v8, v8

    .line 448
    add-float/2addr v5, v8

    .line 449
    iput v5, v6, Landroid/graphics/RectF;->right:F

    .line 450
    .line 451
    iget v5, v6, Landroid/graphics/RectF;->top:F

    .line 452
    .line 453
    invoke-static {v7}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 454
    .line 455
    .line 456
    move-result v7

    .line 457
    int-to-float v7, v7

    .line 458
    add-float/2addr v5, v7

    .line 459
    iput v5, v6, Landroid/graphics/RectF;->bottom:F

    .line 460
    .line 461
    iget-object v5, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->h:Ljava/util/List;

    .line 462
    .line 463
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 464
    .line 465
    .line 466
    add-int/lit8 v4, v4, 0x1

    .line 467
    .line 468
    goto :goto_9

    .line 469
    :cond_d
    if-lez v1, :cond_e

    .line 470
    .line 471
    mul-int/lit8 v2, v1, 0x2c

    .line 472
    .line 473
    sub-int/2addr v1, v3

    .line 474
    mul-int/lit8 v1, v1, 0x8

    .line 475
    .line 476
    add-int/2addr v2, v1

    .line 477
    int-to-float v1, v2

    .line 478
    invoke-static {v1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->a(F)I

    .line 479
    .line 480
    .line 481
    move-result v2

    .line 482
    :cond_e
    iput v2, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->i:I

    .line 483
    .line 484
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->l:Ljava/util/List;

    .line 485
    .line 486
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 487
    .line 488
    .line 489
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->l:Ljava/util/List;

    .line 490
    .line 491
    iget-object v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 492
    .line 493
    invoke-interface {v1, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 494
    .line 495
    .line 496
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 497
    .line 498
    .line 499
    move-result v1

    .line 500
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 501
    .line 502
    .line 503
    return-void
.end method

.method public setBgColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->r:I

    .line 2
    .line 3
    return-void
.end method

.method public setItemMaxNumber(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->p:I

    .line 2
    .line 3
    return-void
.end method

.method public setLabel(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->c(Ljava/util/List;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->m:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->n:Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-ge p1, v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->k:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 44
    .line 45
    iget v0, v0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->n:Ljava/util/HashMap;

    .line 58
    .line 59
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public setLabelShowListener(Lcom/p1/mobile/putong/core/view/CardLabelShowView2$a;)V
    .locals 0

    return-void
.end method

.method public setLightBgColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->s:I

    .line 2
    .line 3
    return-void
.end method
