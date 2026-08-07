.class public Lcom/p1/mobile/putong/core/view/CommonLabelShowView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/view/CommonLabelShowView$a;,
        Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;,
        Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Paint;

.field public g:I

.field public h:I

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public k:I

.field public l:I

.field public volatile m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation
.end field

.field public volatile n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;"
        }
    .end annotation
.end field

.field public p:I

.field public q:I

.field public r:I

.field public s:Z

.field public t:Z

.field public u:Ljava/lang/String;

.field public v:Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

.field public w:I

.field public x:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->i:Ljava/util/List;

    .line 10
    .line 11
    new-instance p3, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->j:Ljava/util/Map;

    .line 17
    .line 18
    new-instance p3, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

    .line 24
    .line 25
    new-instance p3, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->n:Ljava/util/List;

    .line 31
    .line 32
    new-instance p3, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->o:Ljava/util/List;

    .line 38
    .line 39
    const/4 p3, 0x0

    .line 40
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->t:Z

    .line 41
    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->c(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->i:Ljava/util/List;

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
    check-cast v1, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;

    .line 18
    .line 19
    iget v2, v1, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;->line:I

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->j:Ljava/util/Map;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->j:Ljava/util/Map;

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
    sget-object v0, Ll/xhc0;->d:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/xhc0;->e:I

    .line 8
    .line 9
    const/high16 v0, 0x8000000

    .line 10
    .line 11
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    sget v0, Ll/xhc0;->m:I

    .line 16
    .line 17
    const/high16 v1, -0x34000000    # -3.3554432E7f

    .line 18
    .line 19
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sget v1, Ll/xhc0;->l:I

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->s:Z

    .line 31
    .line 32
    sget v1, Ll/xhc0;->h:I

    .line 33
    .line 34
    const/16 v3, 0x64

    .line 35
    .line 36
    invoke-virtual {p1, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iput v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->q:I

    .line 41
    .line 42
    sget v1, Ll/xhc0;->g:I

    .line 43
    .line 44
    const/4 v3, 0x5

    .line 45
    invoke-virtual {p1, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iput v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->r:I

    .line 50
    .line 51
    sget v1, Ll/xhc0;->i:I

    .line 52
    .line 53
    const/high16 v3, 0x41200000    # 10.0f

    .line 54
    .line 55
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    invoke-virtual {p1, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iput v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->l:I

    .line 64
    .line 65
    sget v1, Ll/xhc0;->f:I

    .line 66
    .line 67
    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    const/4 v3, 0x1

    .line 72
    if-eqz v1, :cond_0

    .line 73
    .line 74
    sget v1, Ll/xhc0;->j:I

    .line 75
    .line 76
    const/high16 v4, 0xa000000

    .line 77
    .line 78
    invoke-virtual {p1, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    sget v4, Ll/xhc0;->k:I

    .line 83
    .line 84
    invoke-virtual {p1, v4, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    iput v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->p:I

    .line 89
    .line 90
    new-instance v2, Landroid/graphics/Paint;

    .line 91
    .line 92
    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->c:Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 98
    .line 99
    .line 100
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->c:Landroid/graphics/Paint;

    .line 101
    .line 102
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->c:Landroid/graphics/Paint;

    .line 106
    .line 107
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->c:Landroid/graphics/Paint;

    .line 113
    .line 114
    iget v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->p:I

    .line 115
    .line 116
    int-to-float v2, v2

    .line 117
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 118
    .line 119
    .line 120
    :cond_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 121
    .line 122
    .line 123
    new-instance p1, Landroid/graphics/Paint;

    .line 124
    .line 125
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 126
    .line 127
    .line 128
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->a:Landroid/graphics/Paint;

    .line 129
    .line 130
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->a:Landroid/graphics/Paint;

    .line 134
    .line 135
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->a:Landroid/graphics/Paint;

    .line 139
    .line 140
    sget-object p2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 141
    .line 142
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 143
    .line 144
    .line 145
    new-instance p1, Landroid/graphics/Paint;

    .line 146
    .line 147
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 148
    .line 149
    .line 150
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b:Landroid/graphics/Paint;

    .line 151
    .line 152
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b:Landroid/graphics/Paint;

    .line 156
    .line 157
    const/high16 v1, 0x7000000

    .line 158
    .line 159
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b:Landroid/graphics/Paint;

    .line 163
    .line 164
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 165
    .line 166
    .line 167
    new-instance p1, Landroid/graphics/Paint;

    .line 168
    .line 169
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 170
    .line 171
    .line 172
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->d:Landroid/graphics/Paint;

    .line 173
    .line 174
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 175
    .line 176
    .line 177
    new-instance p1, Landroid/graphics/Paint;

    .line 178
    .line 179
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 180
    .line 181
    .line 182
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->e:Landroid/graphics/Paint;

    .line 183
    .line 184
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->e:Landroid/graphics/Paint;

    .line 188
    .line 189
    const/4 p2, 0x3

    .line 190
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 195
    .line 196
    .line 197
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->e:Landroid/graphics/Paint;

    .line 198
    .line 199
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->e:Landroid/graphics/Paint;

    .line 203
    .line 204
    const/high16 p2, 0x41600000    # 14.0f

    .line 205
    .line 206
    invoke-static {p2}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 207
    .line 208
    .line 209
    move-result p2

    .line 210
    int-to-float p2, p2

    .line 211
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 212
    .line 213
    .line 214
    const/16 p1, 0x2c

    .line 215
    .line 216
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->w:I

    .line 217
    .line 218
    const/16 p1, 0x8

    .line 219
    .line 220
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->x:I

    .line 221
    .line 222
    new-instance p1, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

    .line 223
    .line 224
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;-><init>()V

    .line 225
    .line 226
    .line 227
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->v:Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

    .line 228
    .line 229
    new-instance p1, Landroid/text/TextPaint;

    .line 230
    .line 231
    invoke-direct {p1}, Landroid/text/TextPaint;-><init>()V

    .line 232
    .line 233
    .line 234
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 235
    .line 236
    sget-object p2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 237
    .line 238
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->e()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f()V

    .line 245
    .line 246
    .line 247
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->n:Ljava/util/List;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->n:Ljava/util/List;

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->n:Ljava/util/List;

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

.method public final e()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->v:Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

    .line 4
    .line 5
    iget v1, v1, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->g:F

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->v:Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

    .line 13
    .line 14
    iget v1, v1, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->f:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 36
    .line 37
    const-string v3, "\u4f60\u7b26\u5408"

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    invoke-virtual {v2, v3, v4, v1, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->v:Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

    .line 44
    .line 45
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 46
    .line 47
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    sub-int/2addr v1, v0

    .line 50
    int-to-float v0, v1

    .line 51
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->h:F

    .line 52
    .line 53
    return-void
.end method

.method public final f()V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->e:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    const-string v4, "\u9ad8"

    .line 11
    .line 12
    invoke-virtual {v1, v4, v2, v3, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 16
    .line 17
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 18
    .line 19
    sub-int/2addr v1, v0

    .line 20
    iget v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->w:I

    .line 21
    .line 22
    int-to-float v0, v0

    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    sub-int/2addr v0, v1

    .line 28
    div-int/lit8 v0, v0, 0x2

    .line 29
    .line 30
    add-int/2addr v0, v1

    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    sub-int/2addr v0, v1

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->h:I

    .line 39
    .line 40
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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->o:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v1, v2, :cond_7

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->i:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->o:Ljava/util/List;

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
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->l:I

    .line 33
    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    int-to-float v4, v5

    .line 37
    int-to-float v5, v5

    .line 38
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->a:Landroid/graphics/Paint;

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
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b:Landroid/graphics/Paint;

    .line 47
    .line 48
    invoke-virtual {p1, v2, v4, v5, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 49
    .line 50
    .line 51
    :goto_1
    if-nez v1, :cond_2

    .line 52
    .line 53
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->t:Z

    .line 54
    .line 55
    if-eqz v4, :cond_2

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    if-nez v5, :cond_1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_1
    iget p0, v2, Landroid/graphics/RectF;->left:F

    .line 66
    .line 67
    throw v4

    .line 68
    :cond_2
    :goto_2
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->c:Landroid/graphics/Paint;

    .line 69
    .line 70
    if-eqz v4, :cond_3

    .line 71
    .line 72
    new-instance v4, Landroid/graphics/RectF;

    .line 73
    .line 74
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 75
    .line 76
    .line 77
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->p:I

    .line 78
    .line 79
    div-int/lit8 v5, v5, 0x2

    .line 80
    .line 81
    int-to-float v5, v5

    .line 82
    iget v6, v2, Landroid/graphics/RectF;->top:F

    .line 83
    .line 84
    add-float/2addr v6, v5

    .line 85
    iput v6, v4, Landroid/graphics/RectF;->top:F

    .line 86
    .line 87
    iget v6, v2, Landroid/graphics/RectF;->left:F

    .line 88
    .line 89
    add-float/2addr v6, v5

    .line 90
    iput v6, v4, Landroid/graphics/RectF;->left:F

    .line 91
    .line 92
    iget v6, v2, Landroid/graphics/RectF;->right:F

    .line 93
    .line 94
    sub-float/2addr v6, v5

    .line 95
    iput v6, v4, Landroid/graphics/RectF;->right:F

    .line 96
    .line 97
    iget v6, v2, Landroid/graphics/RectF;->bottom:F

    .line 98
    .line 99
    sub-float/2addr v6, v5

    .line 100
    iput v6, v4, Landroid/graphics/RectF;->bottom:F

    .line 101
    .line 102
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->l:I

    .line 103
    .line 104
    int-to-float v6, v5

    .line 105
    int-to-float v5, v5

    .line 106
    iget-object v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->c:Landroid/graphics/Paint;

    .line 107
    .line 108
    invoke-virtual {p1, v4, v6, v5, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 109
    .line 110
    .line 111
    :cond_3
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->o:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    check-cast v4, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 118
    .line 119
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 120
    .line 121
    new-instance v5, Landroid/graphics/Rect;

    .line 122
    .line 123
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 124
    .line 125
    .line 126
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->e:Landroid/graphics/Paint;

    .line 127
    .line 128
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    invoke-virtual {v6, v4, v0, v7, v5}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 133
    .line 134
    .line 135
    iget v6, v5, Landroid/graphics/Rect;->right:I

    .line 136
    .line 137
    iget v5, v5, Landroid/graphics/Rect;->left:I

    .line 138
    .line 139
    sub-int/2addr v6, v5

    .line 140
    int-to-float v5, v6

    .line 141
    iget v6, v2, Landroid/graphics/RectF;->right:F

    .line 142
    .line 143
    iget v7, v2, Landroid/graphics/RectF;->left:F

    .line 144
    .line 145
    sub-float/2addr v6, v7

    .line 146
    const/high16 v7, 0x41800000    # 16.0f

    .line 147
    .line 148
    invoke-static {v7}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 149
    .line 150
    .line 151
    move-result v8

    .line 152
    int-to-float v8, v8

    .line 153
    sub-float/2addr v6, v8

    .line 154
    cmpg-float v8, v5, v6

    .line 155
    .line 156
    if-gtz v8, :cond_4

    .line 157
    .line 158
    iget v5, v2, Landroid/graphics/RectF;->left:F

    .line 159
    .line 160
    invoke-static {v7}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 161
    .line 162
    .line 163
    move-result v6

    .line 164
    int-to-float v6, v6

    .line 165
    add-float/2addr v5, v6

    .line 166
    iget v6, v2, Landroid/graphics/RectF;->top:F

    .line 167
    .line 168
    iget v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->h:I

    .line 169
    .line 170
    int-to-float v7, v7

    .line 171
    add-float/2addr v6, v7

    .line 172
    iget-object v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->e:Landroid/graphics/Paint;

    .line 173
    .line 174
    invoke-virtual {p1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 175
    .line 176
    .line 177
    goto :goto_3

    .line 178
    :cond_4
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 179
    .line 180
    .line 181
    move-result v8

    .line 182
    int-to-float v8, v8

    .line 183
    div-float/2addr v6, v5

    .line 184
    mul-float/2addr v8, v6

    .line 185
    float-to-int v5, v8

    .line 186
    const/4 v6, 0x1

    .line 187
    if-le v5, v6, :cond_5

    .line 188
    .line 189
    add-int/lit8 v5, v5, -0x1

    .line 190
    .line 191
    :cond_5
    invoke-virtual {v4, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v4

    .line 195
    const-string v5, "..."

    .line 196
    .line 197
    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v4

    .line 201
    iget v5, v2, Landroid/graphics/RectF;->left:F

    .line 202
    .line 203
    invoke-static {v7}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 204
    .line 205
    .line 206
    move-result v6

    .line 207
    int-to-float v6, v6

    .line 208
    add-float/2addr v5, v6

    .line 209
    iget v6, v2, Landroid/graphics/RectF;->top:F

    .line 210
    .line 211
    iget v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->h:I

    .line 212
    .line 213
    int-to-float v7, v7

    .line 214
    add-float/2addr v6, v7

    .line 215
    iget-object v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->e:Landroid/graphics/Paint;

    .line 216
    .line 217
    invoke-virtual {p1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 218
    .line 219
    .line 220
    :goto_3
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/LabelData;->desStr:Ljava/lang/String;

    .line 221
    .line 222
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    if-nez v4, :cond_6

    .line 227
    .line 228
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 229
    .line 230
    const/4 v5, -0x1

    .line 231
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 232
    .line 233
    .line 234
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 235
    .line 236
    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 237
    .line 238
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 239
    .line 240
    .line 241
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 242
    .line 243
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->v:Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

    .line 244
    .line 245
    iget v5, v5, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->i:F

    .line 246
    .line 247
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 248
    .line 249
    .line 250
    iget-object v4, v2, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;->desRect:Landroid/graphics/RectF;

    .line 251
    .line 252
    sget v5, Ll/qa00;->g:I

    .line 253
    .line 254
    int-to-float v6, v5

    .line 255
    int-to-float v7, v5

    .line 256
    iget-object v8, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 257
    .line 258
    invoke-virtual {p1, v4, v6, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 259
    .line 260
    .line 261
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 262
    .line 263
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 264
    .line 265
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 266
    .line 267
    .line 268
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 269
    .line 270
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->v:Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

    .line 271
    .line 272
    iget v6, v6, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->e:I

    .line 273
    .line 274
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 275
    .line 276
    .line 277
    iget-object v4, v2, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;->desRect:Landroid/graphics/RectF;

    .line 278
    .line 279
    int-to-float v6, v5

    .line 280
    int-to-float v5, v5

    .line 281
    iget-object v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 282
    .line 283
    invoke-virtual {p1, v4, v6, v5, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 284
    .line 285
    .line 286
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 287
    .line 288
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->v:Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

    .line 289
    .line 290
    iget v5, v5, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->f:I

    .line 291
    .line 292
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 293
    .line 294
    .line 295
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/LabelData;->desStr:Ljava/lang/String;

    .line 296
    .line 297
    iget-object v2, v2, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;->desRect:Landroid/graphics/RectF;

    .line 298
    .line 299
    iget v4, v2, Landroid/graphics/RectF;->right:F

    .line 300
    .line 301
    iget v5, v2, Landroid/graphics/RectF;->left:F

    .line 302
    .line 303
    add-float/2addr v4, v5

    .line 304
    const/high16 v5, 0x40000000    # 2.0f

    .line 305
    .line 306
    div-float/2addr v4, v5

    .line 307
    iget v6, v2, Landroid/graphics/RectF;->bottom:F

    .line 308
    .line 309
    iget v2, v2, Landroid/graphics/RectF;->top:F

    .line 310
    .line 311
    add-float/2addr v6, v2

    .line 312
    div-float/2addr v6, v5

    .line 313
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->v:Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

    .line 314
    .line 315
    iget v2, v2, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->h:F

    .line 316
    .line 317
    const v5, 0x40133333    # 2.3f

    .line 318
    .line 319
    .line 320
    div-float/2addr v2, v5

    .line 321
    add-float/2addr v6, v2

    .line 322
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 323
    .line 324
    invoke-virtual {p1, v3, v4, v6, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 325
    .line 326
    .line 327
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 328
    .line 329
    goto/16 :goto_0

    .line 330
    .line 331
    :cond_7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->t:Z

    .line 332
    .line 333
    return-void
.end method

.method public onMeasure(II)V
    .locals 12

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->g:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->g:I

    .line 12
    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->d(Ljava/util/List;)Z

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
    iget v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->k:I

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
    iget p2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->k:I

    .line 34
    .line 35
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->i:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->o:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

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
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-ge v3, v5, :cond_b

    .line 72
    .line 73
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->q:I

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
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->r:I

    .line 82
    .line 83
    if-le p2, v5, :cond_3

    .line 84
    .line 85
    goto/16 :goto_6

    .line 86
    .line 87
    :cond_3
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    check-cast v5, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 94
    .line 95
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-eqz v5, :cond_4

    .line 102
    .line 103
    goto/16 :goto_5

    .line 104
    .line 105
    :cond_4
    add-int/lit8 v5, p2, -0x1

    .line 106
    .line 107
    iget v6, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->w:I

    .line 108
    .line 109
    iget v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->x:I

    .line 110
    .line 111
    add-int/2addr v6, v7

    .line 112
    int-to-float v6, v6

    .line 113
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    mul-int/2addr v5, v6

    .line 118
    new-instance v6, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;

    .line 119
    .line 120
    invoke-direct {v6}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;-><init>()V

    .line 121
    .line 122
    .line 123
    iget-object v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->e:Landroid/graphics/Paint;

    .line 124
    .line 125
    iget-object v8, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

    .line 126
    .line 127
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    check-cast v8, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 132
    .line 133
    iget-object v8, v8, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 136
    .line 137
    .line 138
    move-result v7

    .line 139
    add-float v8, v4, v7

    .line 140
    .line 141
    const/high16 v9, 0x42200000    # 40.0f

    .line 142
    .line 143
    invoke-static {v9}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 144
    .line 145
    .line 146
    move-result v9

    .line 147
    int-to-float v9, v9

    .line 148
    add-float/2addr v8, v9

    .line 149
    iput p2, v6, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;->line:I

    .line 150
    .line 151
    iget v9, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->g:I

    .line 152
    .line 153
    int-to-float v9, v9

    .line 154
    cmpl-float v9, v8, v9

    .line 155
    .line 156
    const/high16 v10, 0x42000000    # 32.0f

    .line 157
    .line 158
    if-lez v9, :cond_8

    .line 159
    .line 160
    add-int/lit8 v4, p2, 0x1

    .line 161
    .line 162
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->r:I

    .line 163
    .line 164
    if-le v4, v5, :cond_5

    .line 165
    .line 166
    goto/16 :goto_6

    .line 167
    .line 168
    :cond_5
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->q:I

    .line 169
    .line 170
    if-le v4, v5, :cond_6

    .line 171
    .line 172
    move p2, v5

    .line 173
    goto/16 :goto_6

    .line 174
    .line 175
    :cond_6
    invoke-static {v10}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 176
    .line 177
    .line 178
    move-result v5

    .line 179
    int-to-float v5, v5

    .line 180
    add-float/2addr v7, v5

    .line 181
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->g:I

    .line 182
    .line 183
    int-to-float v8, v5

    .line 184
    cmpl-float v8, v7, v8

    .line 185
    .line 186
    if-lez v8, :cond_7

    .line 187
    .line 188
    int-to-float v5, v5

    .line 189
    goto :goto_2

    .line 190
    :cond_7
    move v5, v7

    .line 191
    :goto_2
    iget v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->w:I

    .line 192
    .line 193
    iget v8, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->x:I

    .line 194
    .line 195
    add-int/2addr v7, v8

    .line 196
    int-to-float v7, v7

    .line 197
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 198
    .line 199
    .line 200
    move-result v7

    .line 201
    mul-int/2addr p2, v7

    .line 202
    iput v2, v6, Landroid/graphics/RectF;->left:F

    .line 203
    .line 204
    int-to-float v7, p2

    .line 205
    iput v7, v6, Landroid/graphics/RectF;->top:F

    .line 206
    .line 207
    iput v5, v6, Landroid/graphics/RectF;->right:F

    .line 208
    .line 209
    iget v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->w:I

    .line 210
    .line 211
    int-to-float v7, v7

    .line 212
    invoke-static {v7}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 213
    .line 214
    .line 215
    move-result v7

    .line 216
    add-int/2addr v7, p2

    .line 217
    int-to-float p2, v7

    .line 218
    iput p2, v6, Landroid/graphics/RectF;->bottom:F

    .line 219
    .line 220
    iput v4, v6, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;->line:I

    .line 221
    .line 222
    iget p2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->g:I

    .line 223
    .line 224
    int-to-float p2, p2

    .line 225
    sub-float/2addr p2, v5

    .line 226
    iget-object v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->j:Ljava/util/Map;

    .line 227
    .line 228
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 229
    .line 230
    .line 231
    move-result-object v8

    .line 232
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 233
    .line 234
    .line 235
    move-result-object p2

    .line 236
    invoke-interface {v7, v8, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->i:Ljava/util/List;

    .line 240
    .line 241
    invoke-interface {p2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->o:Ljava/util/List;

    .line 245
    .line 246
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

    .line 247
    .line 248
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v6

    .line 252
    check-cast v6, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 253
    .line 254
    invoke-interface {p2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move p2, v4

    .line 258
    move v4, v5

    .line 259
    goto :goto_5

    .line 260
    :cond_8
    cmpl-float v9, v4, v2

    .line 261
    .line 262
    if-nez v9, :cond_9

    .line 263
    .line 264
    move v4, v2

    .line 265
    goto :goto_3

    .line 266
    :cond_9
    const/high16 v11, 0x41000000    # 8.0f

    .line 267
    .line 268
    invoke-static {v11}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 269
    .line 270
    .line 271
    move-result v11

    .line 272
    int-to-float v11, v11

    .line 273
    add-float/2addr v4, v11

    .line 274
    :goto_3
    iput v4, v6, Landroid/graphics/RectF;->left:F

    .line 275
    .line 276
    int-to-float v4, v5

    .line 277
    iput v4, v6, Landroid/graphics/RectF;->top:F

    .line 278
    .line 279
    if-nez v9, :cond_a

    .line 280
    .line 281
    invoke-static {v10}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 282
    .line 283
    .line 284
    move-result v4

    .line 285
    int-to-float v4, v4

    .line 286
    add-float/2addr v7, v4

    .line 287
    move v4, v7

    .line 288
    goto :goto_4

    .line 289
    :cond_a
    move v4, v8

    .line 290
    :goto_4
    iput v4, v6, Landroid/graphics/RectF;->right:F

    .line 291
    .line 292
    iget v7, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->w:I

    .line 293
    .line 294
    int-to-float v7, v7

    .line 295
    invoke-static {v7}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 296
    .line 297
    .line 298
    move-result v7

    .line 299
    add-int/2addr v7, v5

    .line 300
    int-to-float v5, v7

    .line 301
    iput v5, v6, Landroid/graphics/RectF;->bottom:F

    .line 302
    .line 303
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->i:Ljava/util/List;

    .line 304
    .line 305
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->o:Ljava/util/List;

    .line 309
    .line 310
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

    .line 311
    .line 312
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v6

    .line 316
    check-cast v6, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 317
    .line 318
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->g:I

    .line 322
    .line 323
    int-to-float v5, v5

    .line 324
    sub-float/2addr v5, v4

    .line 325
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->j:Ljava/util/Map;

    .line 326
    .line 327
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 328
    .line 329
    .line 330
    move-result-object v7

    .line 331
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 332
    .line 333
    .line 334
    move-result-object v5

    .line 335
    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    :goto_5
    add-int/lit8 v3, v3, 0x1

    .line 339
    .line 340
    goto/16 :goto_1

    .line 341
    .line 342
    :cond_b
    :goto_6
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->i:Ljava/util/List;

    .line 343
    .line 344
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 345
    .line 346
    .line 347
    move-result v2

    .line 348
    if-nez v2, :cond_d

    .line 349
    .line 350
    move v2, v0

    .line 351
    :goto_7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->i:Ljava/util/List;

    .line 352
    .line 353
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 354
    .line 355
    .line 356
    move-result v3

    .line 357
    if-ge v2, v3, :cond_d

    .line 358
    .line 359
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->i:Ljava/util/List;

    .line 360
    .line 361
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    check-cast v3, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;

    .line 366
    .line 367
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

    .line 368
    .line 369
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    move-result-object v4

    .line 373
    check-cast v4, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 374
    .line 375
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/LabelData;->desStr:Ljava/lang/String;

    .line 376
    .line 377
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 378
    .line 379
    .line 380
    move-result v5

    .line 381
    if-nez v5, :cond_c

    .line 382
    .line 383
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f:Landroid/graphics/Paint;

    .line 384
    .line 385
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/LabelData;->desStr:Ljava/lang/String;

    .line 386
    .line 387
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 388
    .line 389
    .line 390
    move-result v4

    .line 391
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->v:Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;

    .line 392
    .line 393
    iget v6, v5, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->a:F

    .line 394
    .line 395
    add-float/2addr v4, v6

    .line 396
    iget v6, v5, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->c:F

    .line 397
    .line 398
    add-float/2addr v4, v6

    .line 399
    iget v6, v5, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->h:F

    .line 400
    .line 401
    iget v7, v5, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->b:F

    .line 402
    .line 403
    add-float/2addr v6, v7

    .line 404
    iget v5, v5, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->d:F

    .line 405
    .line 406
    add-float/2addr v6, v5

    .line 407
    new-instance v5, Landroid/graphics/RectF;

    .line 408
    .line 409
    iget v7, v3, Landroid/graphics/RectF;->right:F

    .line 410
    .line 411
    sget v8, Ll/qa00;->c:I

    .line 412
    .line 413
    int-to-float v9, v8

    .line 414
    add-float/2addr v9, v7

    .line 415
    sub-float/2addr v9, v4

    .line 416
    iget v4, v3, Landroid/graphics/RectF;->top:F

    .line 417
    .line 418
    const/high16 v10, 0x40000000    # 2.0f

    .line 419
    .line 420
    div-float/2addr v6, v10

    .line 421
    sub-float v10, v4, v6

    .line 422
    .line 423
    int-to-float v8, v8

    .line 424
    add-float/2addr v7, v8

    .line 425
    add-float/2addr v4, v6

    .line 426
    invoke-direct {v5, v9, v10, v7, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 427
    .line 428
    .line 429
    iput-object v5, v3, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$LayoutData;->desRect:Landroid/graphics/RectF;

    .line 430
    .line 431
    :cond_c
    add-int/lit8 v2, v2, 0x1

    .line 432
    .line 433
    goto :goto_7

    .line 434
    :cond_d
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->s:Z

    .line 435
    .line 436
    if-eqz v2, :cond_e

    .line 437
    .line 438
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->a()V

    .line 439
    .line 440
    .line 441
    :cond_e
    if-lez p2, :cond_f

    .line 442
    .line 443
    iget v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->w:I

    .line 444
    .line 445
    mul-int/2addr v0, p2

    .line 446
    iget v2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->x:I

    .line 447
    .line 448
    sub-int/2addr p2, v1

    .line 449
    mul-int/2addr v2, p2

    .line 450
    add-int/2addr v0, v2

    .line 451
    int-to-float p2, v0

    .line 452
    invoke-static {p2}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->b(F)I

    .line 453
    .line 454
    .line 455
    move-result v0

    .line 456
    :cond_f
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->k:I

    .line 457
    .line 458
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->n:Ljava/util/List;

    .line 459
    .line 460
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 461
    .line 462
    .line 463
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->n:Ljava/util/List;

    .line 464
    .line 465
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

    .line 466
    .line 467
    invoke-interface {p2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 468
    .line 469
    .line 470
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 471
    .line 472
    .line 473
    move-result p1

    .line 474
    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 475
    .line 476
    .line 477
    return-void
.end method

.method public setFirstLabelShowCallback(Lcom/p1/mobile/putong/core/view/CommonLabelShowView$a;)V
    .locals 0

    return-void
.end method

.method public setItemHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->w:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->f()V

    .line 4
    .line 5
    .line 6
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->d(Ljava/util/List;)Z

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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->t:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->o:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->m:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->a:Landroid/graphics/Paint;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
