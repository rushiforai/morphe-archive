.class public Lcom/hellogroup/mk/business/widget/MKTabLayout;
.super Landroid/widget/HorizontalScrollView;
.source "SourceFile"


# annotations
.annotation runtime Landroidx/viewpager/widget/ViewPager$e;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/widget/MKTabLayout$b;,
        Lcom/hellogroup/mk/business/widget/MKTabLayout$e;,
        Lcom/hellogroup/mk/business/widget/MKTabLayout$g;,
        Lcom/hellogroup/mk/business/widget/MKTabLayout$a;,
        Lcom/hellogroup/mk/business/widget/MKTabLayout$d;,
        Lcom/hellogroup/mk/business/widget/MKTabLayout$i;,
        Lcom/hellogroup/mk/business/widget/MKTabLayout$h;,
        Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;,
        Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;,
        Lcom/hellogroup/mk/business/widget/MKTabLayout$f;,
        Lcom/hellogroup/mk/business/widget/MKTabLayout$c;
    }
.end annotation


# static fields
.field private static final G:Ll/nj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nj80<",
            "Lcom/hellogroup/mk/business/widget/MKTabLayout$f;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:Ll/cf60;

.field private B:Landroid/database/DataSetObserver;

.field private C:Lcom/hellogroup/mk/business/widget/MKTabLayout$h;

.field private D:Lcom/hellogroup/mk/business/widget/MKTabLayout$a;

.field private E:Z

.field private final F:Ll/nj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nj80<",
            "Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;",
            ">;"
        }
    .end annotation
.end field

.field private final a:Ljava/lang/String;

.field private final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/hellogroup/mk/business/widget/MKTabLayout$f;",
            ">;"
        }
    .end annotation
.end field

.field private c:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

.field private final d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

.field e:I

.field f:I

.field g:I

.field h:I

.field i:I

.field j:Landroid/content/res/ColorStateList;

.field k:F

.field l:F

.field final m:I

.field n:I

.field private final o:I

.field private final p:I

.field private final q:I

.field private r:I

.field s:I

.field t:I

.field u:Z

.field private v:Lcom/hellogroup/mk/business/widget/MKTabLayout$c;

.field private final w:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/hellogroup/mk/business/widget/MKTabLayout$c;",
            ">;"
        }
    .end annotation
.end field

.field private x:Lcom/hellogroup/mk/business/widget/MKTabLayout$c;

.field private y:Landroid/animation/ValueAnimator;

.field z:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/rj80;

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/rj80;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->G:Ll/nj80;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 313
    invoke-direct {p0, p1, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 312
    invoke-direct {p0, p1, p2, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const-class v0, Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->a:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 18
    .line 19
    const v0, 0x7fffffff

    .line 20
    .line 21
    .line 22
    iput v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->n:I

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->u:Z

    .line 26
    .line 27
    new-instance v1, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w:Ljava/util/ArrayList;

    .line 33
    .line 34
    new-instance v1, Ll/pj80;

    .line 35
    .line 36
    const/16 v2, 0xc

    .line 37
    .line 38
    invoke-direct {v1, v2}, Ll/pj80;-><init>(I)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->F:Ll/nj80;

    .line 42
    .line 43
    invoke-static {p1}, Ll/hvi0;->a(Landroid/content/Context;)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-virtual {p0, v1}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 51
    .line 52
    invoke-direct {v2, p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;-><init>(Lcom/hellogroup/mk/business/widget/MKTabLayout;Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 56
    .line 57
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 58
    .line 59
    const/4 v4, -0x2

    .line 60
    const/4 v5, -0x1

    .line 61
    invoke-direct {v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 62
    .line 63
    .line 64
    invoke-super {p0, v2, v1, v3}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    sget-object v3, Ll/chc0;->d:[I

    .line 68
    .line 69
    sget v4, Ll/rgc0;->b:I

    .line 70
    .line 71
    invoke-virtual {p1, p2, v3, p3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    sget p3, Ll/chc0;->i:I

    .line 76
    .line 77
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    invoke-virtual {v2, p3}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->i(I)V

    .line 82
    .line 83
    .line 84
    sget v3, Ll/chc0;->h:I

    .line 85
    .line 86
    invoke-virtual {p2, v3, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {v2, v3}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->h(I)V

    .line 91
    .line 92
    .line 93
    sget v2, Ll/chc0;->m:I

    .line 94
    .line 95
    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->h:I

    .line 100
    .line 101
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->g:I

    .line 102
    .line 103
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->f:I

    .line 104
    .line 105
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->e:I

    .line 106
    .line 107
    sget v3, Ll/chc0;->p:I

    .line 108
    .line 109
    invoke-virtual {p2, v3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->e:I

    .line 114
    .line 115
    sget v2, Ll/chc0;->q:I

    .line 116
    .line 117
    iget v3, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->f:I

    .line 118
    .line 119
    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->f:I

    .line 124
    .line 125
    sget v2, Ll/chc0;->o:I

    .line 126
    .line 127
    iget v3, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->g:I

    .line 128
    .line 129
    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->g:I

    .line 134
    .line 135
    sget v2, Ll/chc0;->n:I

    .line 136
    .line 137
    iget v3, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->h:I

    .line 138
    .line 139
    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->h:I

    .line 144
    .line 145
    sget v2, Ll/chc0;->s:I

    .line 146
    .line 147
    sget v3, Ll/rgc0;->a:I

    .line 148
    .line 149
    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->i:I

    .line 154
    .line 155
    sget-object v3, Ll/chc0;->u:[I

    .line 156
    .line 157
    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    :try_start_0
    sget v2, Ll/chc0;->v:I

    .line 162
    .line 163
    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    int-to-float v2, v2

    .line 168
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->k:F

    .line 169
    .line 170
    sget v2, Ll/chc0;->w:I

    .line 171
    .line 172
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    iput-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j:Landroid/content/res/ColorStateList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 177
    .line 178
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 179
    .line 180
    .line 181
    sget p1, Ll/chc0;->t:I

    .line 182
    .line 183
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-eqz p1, :cond_0

    .line 188
    .line 189
    sget p1, Ll/chc0;->t:I

    .line 190
    .line 191
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 196
    .line 197
    :cond_0
    sget p1, Ll/chc0;->r:I

    .line 198
    .line 199
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-eqz p1, :cond_1

    .line 204
    .line 205
    sget p1, Ll/chc0;->r:I

    .line 206
    .line 207
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 212
    .line 213
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    invoke-static {v2, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->m(II)Landroid/content/res/ColorStateList;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 222
    .line 223
    :cond_1
    sget p1, Ll/chc0;->k:I

    .line 224
    .line 225
    invoke-virtual {p2, p1, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->o:I

    .line 230
    .line 231
    sget p1, Ll/chc0;->j:I

    .line 232
    .line 233
    invoke-virtual {p2, p1, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->p:I

    .line 238
    .line 239
    sget p1, Ll/chc0;->e:I

    .line 240
    .line 241
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->m:I

    .line 246
    .line 247
    sget p1, Ll/chc0;->f:I

    .line 248
    .line 249
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->r:I

    .line 254
    .line 255
    sget p1, Ll/chc0;->l:I

    .line 256
    .line 257
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t:I

    .line 262
    .line 263
    sget p1, Ll/chc0;->g:I

    .line 264
    .line 265
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->s:I

    .line 270
    .line 271
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    sget p2, Ll/tac0;->b:I

    .line 279
    .line 280
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 281
    .line 282
    .line 283
    move-result p2

    .line 284
    int-to-float p2, p2

    .line 285
    iput p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->l:F

    .line 286
    .line 287
    sget p2, Ll/tac0;->a:I

    .line 288
    .line 289
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 290
    .line 291
    .line 292
    move-result p1

    .line 293
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->q:I

    .line 294
    .line 295
    invoke-virtual {p0, v1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->setEnableScale(Z)V

    .line 296
    .line 297
    .line 298
    if-nez p3, :cond_2

    .line 299
    .line 300
    invoke-static {p0}, Ll/wyh0;->a(Lcom/hellogroup/mk/business/widget/MKTabLayout;)V

    .line 301
    .line 302
    .line 303
    :cond_2
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j()V

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :catchall_0
    move-exception p0

    .line 308
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 309
    .line 310
    .line 311
    throw p0
.end method

.method private G(Landroidx/viewpager/widget/ViewPager;ZZ)V
    .locals 2
    .param p1    # Landroidx/viewpager/widget/ViewPager;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->z:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->C:Lcom/hellogroup/mk/business/widget/MKTabLayout$h;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->P(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->D:Lcom/hellogroup/mk/business/widget/MKTabLayout$a;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->z:Landroidx/viewpager/widget/ViewPager;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->O(Landroidx/viewpager/widget/ViewPager$i;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->x:Lcom/hellogroup/mk/business/widget/MKTabLayout$c;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->y(Lcom/hellogroup/mk/business/widget/MKTabLayout$c;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->x:Lcom/hellogroup/mk/business/widget/MKTabLayout$c;

    .line 30
    .line 31
    :cond_2
    if-eqz p1, :cond_6

    .line 32
    .line 33
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->z:Landroidx/viewpager/widget/ViewPager;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->C:Lcom/hellogroup/mk/business/widget/MKTabLayout$h;

    .line 36
    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    new-instance v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$h;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$h;-><init>(Lcom/hellogroup/mk/business/widget/MKTabLayout;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->C:Lcom/hellogroup/mk/business/widget/MKTabLayout$h;

    .line 45
    .line 46
    :cond_3
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->C:Lcom/hellogroup/mk/business/widget/MKTabLayout$h;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$h;->a()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->C:Lcom/hellogroup/mk/business/widget/MKTabLayout$h;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$i;

    .line 57
    .line 58
    invoke-direct {v0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$i;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->x:Lcom/hellogroup/mk/business/widget/MKTabLayout$c;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b(Lcom/hellogroup/mk/business/widget/MKTabLayout$c;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    invoke-virtual {p0, v0, p2}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->C(Ll/cf60;Z)V

    .line 73
    .line 74
    .line 75
    :cond_4
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->D:Lcom/hellogroup/mk/business/widget/MKTabLayout$a;

    .line 76
    .line 77
    if-nez v0, :cond_5

    .line 78
    .line 79
    new-instance v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$a;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$a;-><init>(Lcom/hellogroup/mk/business/widget/MKTabLayout;)V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->D:Lcom/hellogroup/mk/business/widget/MKTabLayout$a;

    .line 85
    .line 86
    :cond_5
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->D:Lcom/hellogroup/mk/business/widget/MKTabLayout$a;

    .line 87
    .line 88
    invoke-virtual {v0, p2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$a;->a(Z)V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->D:Lcom/hellogroup/mk/business/widget/MKTabLayout$a;

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->c(Landroidx/viewpager/widget/ViewPager$i;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    const/4 p2, 0x0

    .line 101
    const/4 v0, 0x1

    .line 102
    invoke-virtual {p0, p1, p2, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->D(IFZ)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_6
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->z:Landroidx/viewpager/widget/ViewPager;

    .line 107
    .line 108
    const/4 p1, 0x0

    .line 109
    invoke-virtual {p0, v1, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->C(Ll/cf60;Z)V

    .line 110
    .line 111
    .line 112
    :goto_0
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->E:Z

    .line 113
    .line 114
    return-void
.end method

.method private H()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->l()V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method private I(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->s:I

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const/4 p0, -0x1

    .line 11
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, -0x2

    .line 15
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Lcom/hellogroup/mk/business/widget/MKTabLayout;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ljava/lang/Integer;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, v0}, Landroid/view/View;->scrollTo(II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private f(Lcom/hellogroup/mk/business/widget/TabItem;)V
    .locals 2
    .param p1    # Lcom/hellogroup/mk/business/widget/TabItem;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->v()Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/hellogroup/mk/business/widget/TabItem;->a:Ljava/lang/CharSequence;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->k(Ljava/lang/CharSequence;)Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->h(Ljava/lang/CharSequence;)Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->c(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private g(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->h:Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->n()Landroid/widget/FrameLayout$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v1, v0, p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private getDefaultHeight()I
    .locals 0

    const/16 p0, 0x30

    return p0
.end method

.method private getScrollPosition()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private getTabMinWidth()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->o:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t:I

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->q:I

    .line 12
    .line 13
    return p0

    .line 14
    :cond_1
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method private getTabScrollRange()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    sub-int/2addr v0, v1

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    sub-int/2addr v0, p0

    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method private h(Landroid/view/View;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/hellogroup/mk/business/widget/TabItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/hellogroup/mk/business/widget/TabItem;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->f(Lcom/hellogroup/mk/business/widget/TabItem;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "Only TabItem instances can be added to TabLayout"

    .line 12
    .line 13
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private i(I)V
    .locals 5

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    return-void

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_4

    .line 11
    .line 12
    invoke-static {p0}, Ll/kkl0;->P(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_4

    .line 17
    .line 18
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->d()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-direct {p0, p1, v1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->k(IF)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eq v0, v1, :cond_3

    .line 36
    .line 37
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->y:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    if-nez v2, :cond_2

    .line 40
    .line 41
    new-instance v2, Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    invoke-direct {v2}, Landroid/animation/ValueAnimator;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->y:Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    sget-object v3, Ll/or0;->f:Landroid/view/animation/Interpolator;

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->y:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    const-wide/16 v3, 0x12c

    .line 56
    .line 57
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    .line 60
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->y:Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    new-instance v3, Ll/blw;

    .line 63
    .line 64
    invoke-direct {v3, p0}, Ll/blw;-><init>(Lcom/hellogroup/mk/business/widget/MKTabLayout;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->y:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    filled-new-array {v0, v1}, [I

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v2, v0}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->y:Landroid/animation/ValueAnimator;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 82
    .line 83
    .line 84
    :cond_3
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 85
    .line 86
    const/16 v0, 0x12c

    .line 87
    .line 88
    invoke-virtual {p0, p1, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->c(II)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_4
    :goto_0
    const/4 v0, 0x1

    .line 93
    invoke-virtual {p0, p1, v1, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->D(IFZ)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private j()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->r:I

    .line 7
    .line 8
    iget v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->e:I

    .line 9
    .line 10
    sub-int/2addr v0, v2

    .line 11
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v1

    .line 17
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 18
    .line 19
    invoke-static {v2, v0, v1, v1, v1}, Ll/kkl0;->z0(Landroid/view/View;IIII)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->J(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private k(IF)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_3

    .line 5
    .line 6
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    add-int/lit8 p1, p1, 0x1

    .line 13
    .line 14
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ge p1, v2, :cond_0

    .line 21
    .line 22
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 23
    .line 24
    invoke-virtual {v2, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p1, 0x0

    .line 30
    :goto_0
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move v2, v1

    .line 38
    :goto_1
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    add-int/2addr v2, v1

    .line 49
    int-to-float v1, v2

    .line 50
    mul-float/2addr v1, p2

    .line 51
    const/high16 p2, 0x3f000000    # 0.5f

    .line 52
    .line 53
    mul-float/2addr v1, p2

    .line 54
    float-to-int p2, v1

    .line 55
    add-int/2addr p1, p2

    .line 56
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    div-int/lit8 p2, p2, 0x2

    .line 61
    .line 62
    add-int/2addr p1, p2

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    div-int/lit8 p0, p0, 0x2

    .line 68
    .line 69
    sub-int/2addr p1, p0

    .line 70
    return p1

    .line 71
    :cond_3
    return v1
.end method

.method private l(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;I)V
    .locals 1

    .line 1
    invoke-virtual {p1, p2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->i(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    :goto_0
    add-int/lit8 p2, p2, 0x1

    .line 16
    .line 17
    if-ge p2, p1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 26
    .line 27
    invoke-virtual {v0, p2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->i(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method private static m(II)Landroid/content/res/ColorStateList;
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [[I

    .line 3
    .line 4
    new-array v0, v0, [I

    .line 5
    .line 6
    sget-object v2, Landroid/widget/HorizontalScrollView;->SELECTED_STATE_SET:[I

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    aput-object v2, v1, v3

    .line 10
    .line 11
    aput p1, v0, v3

    .line 12
    .line 13
    sget-object p1, Landroid/widget/HorizontalScrollView;->EMPTY_STATE_SET:[I

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    aput-object p1, v1, v2

    .line 17
    .line 18
    aput p0, v0, v2

    .line 19
    .line 20
    new-instance p0, Landroid/content/res/ColorStateList;

    .line 21
    .line 22
    invoke-direct {p0, v1, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method private n()Landroid/widget/FrameLayout$LayoutParams;
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    const/4 v2, -0x1

    .line 5
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->I(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private o(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;
    .locals 2
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->F:Ll/nj80;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/nj80;->acquire()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-nez v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, p0, v1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;-><init>(Lcom/hellogroup/mk/business/widget/MKTabLayout;Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-virtual {v0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->setTab(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-virtual {v0, p1}, Landroid/view/View;->setFocusable(Z)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->getTabMinWidth()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {v0, p0}, Landroid/view/View;->setMinimumWidth(I)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method private p(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V
    .locals 2
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/hellogroup/mk/business/widget/MKTabLayout$c;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$c;->b(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, -0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method private q(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V
    .locals 2
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/hellogroup/mk/business/widget/MKTabLayout$c;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$c;->c(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, -0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method private r(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V
    .locals 2
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/hellogroup/mk/business/widget/MKTabLayout$c;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$c;->a(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, -0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method private setSelectedTabView(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    move v2, v1

    .line 11
    :goto_0
    if-ge v2, v0, :cond_1

    .line 12
    .line 13
    iget-object v3, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 14
    .line 15
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    if-ne v2, p1, :cond_0

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    move v4, v1

    .line 24
    :goto_1
    invoke-virtual {v3, v4}, Landroid/view/View;->setSelected(Z)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-void
.end method

.method private z(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 12
    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->a()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->F:Ll/nj80;

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ll/nj80;->release(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public A(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->B(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public B(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->p(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->i(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v1, -0x1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v2, v1

    .line 27
    :goto_0
    if-eqz p2, :cond_4

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d()I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-ne p2, v1, :cond_3

    .line 36
    .line 37
    :cond_2
    if-eq v2, v1, :cond_3

    .line 38
    .line 39
    const/4 p2, 0x0

    .line 40
    const/4 v3, 0x1

    .line 41
    invoke-virtual {p0, v2, p2, v3}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->D(IFZ)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    invoke-direct {p0, v2}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->i(I)V

    .line 46
    .line 47
    .line 48
    :goto_1
    if-eq v2, v1, :cond_4

    .line 49
    .line 50
    invoke-direct {p0, v2}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->setSelectedTabView(I)V

    .line 51
    .line 52
    .line 53
    :cond_4
    if-eqz v0, :cond_5

    .line 54
    .line 55
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->r(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 56
    .line 57
    .line 58
    :cond_5
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 59
    .line 60
    if-eqz p1, :cond_6

    .line 61
    .line 62
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->q(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 63
    .line 64
    .line 65
    :cond_6
    return-void
.end method

.method public C(Ll/cf60;Z)V
    .locals 2
    .param p1    # Ll/cf60;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->A:Ll/cf60;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->B:Landroid/database/DataSetObserver;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/cf60;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->A:Ll/cf60;

    .line 13
    .line 14
    if-eqz p2, :cond_2

    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    iget-object p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->B:Landroid/database/DataSetObserver;

    .line 19
    .line 20
    if-nez p2, :cond_1

    .line 21
    .line 22
    new-instance p2, Lcom/hellogroup/mk/business/widget/MKTabLayout$d;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$d;-><init>(Lcom/hellogroup/mk/business/widget/MKTabLayout;)V

    .line 25
    .line 26
    .line 27
    iput-object p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->B:Landroid/database/DataSetObserver;

    .line 28
    .line 29
    :cond_1
    iget-object p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->B:Landroid/database/DataSetObserver;

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ll/cf60;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public D(IFZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setScrollPosition =====------ position:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "\tpositionOffset:"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "\tupdateSelectedText:"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v0, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->E(IFZZ)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public E(IFZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setScrollPosition====-----position:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "\tpositionOffset:"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "\tupdateSelectedText:"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, "\tupdateIndicatorPosition:"

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    int-to-float v0, p1

    .line 45
    add-float/2addr v0, p2

    .line 46
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-ltz v0, :cond_3

    .line 51
    .line 52
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-lt v0, v1, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    if-eqz p4, :cond_1

    .line 62
    .line 63
    iget-object p4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 64
    .line 65
    invoke-virtual {p4, p1, p2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->g(IF)V

    .line 66
    .line 67
    .line 68
    :cond_1
    iget-object p4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->y:Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    if-eqz p4, :cond_2

    .line 71
    .line 72
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 73
    .line 74
    .line 75
    move-result p4

    .line 76
    if-eqz p4, :cond_2

    .line 77
    .line 78
    iget-object p4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->y:Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->cancel()V

    .line 81
    .line 82
    .line 83
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->k(IF)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    const/4 p2, 0x0

    .line 88
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->scrollTo(II)V

    .line 89
    .line 90
    .line 91
    if-eqz p3, :cond_3

    .line 92
    .line 93
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->setSelectedTabView(I)V

    .line 94
    .line 95
    .line 96
    :cond_3
    :goto_0
    return-void
.end method

.method public F(Landroidx/viewpager/widget/ViewPager;Z)V
    .locals 1
    .param p1    # Landroidx/viewpager/widget/ViewPager;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->G(Landroidx/viewpager/widget/ViewPager;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public J(Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->getTabMinWidth()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v1, v2}, Landroid/view/View;->setMinimumWidth(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 28
    .line 29
    invoke-direct {p0, v2}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->I(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    .line 35
    .line 36
    .line 37
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void
.end method

.method public addView(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->h(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public addView(Landroid/view/View;I)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->h(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->h(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->h(Landroid/view/View;)V

    return-void
.end method

.method public b(Lcom/hellogroup/mk/business/widget/MKTabLayout$c;)V
    .locals 1
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V
    .locals 1
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->e(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;IZ)V
    .locals 1
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->g:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 2
    .line 3
    if-ne v0, p0, :cond_1

    .line 4
    .line 5
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->l(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->g(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 9
    .line 10
    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->g()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    const-string p0, "Tab belongs to a different TabLayout."

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public e(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;Z)V
    .locals 1
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0, p2}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;IZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;
    .locals 0

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public getIndicator()Lcom/hellogroup/mk/business/widget/MKTabLayout$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->a(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;)Lcom/hellogroup/mk/business/widget/MKTabLayout$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getSelectedTabPosition()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public getTabCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getTabGravity()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public getTabMaxWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getTabMode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public getTabTextColors()Landroid/content/res/ColorStateList;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-object p0
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->z:Landroidx/viewpager/widget/ViewPager;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v1, v0, Landroidx/viewpager/widget/ViewPager;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-direct {p0, v0, v1, v1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->G(Landroidx/viewpager/widget/ViewPager;ZZ)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->E:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->E:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->getDefaultHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->s(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/2addr v0, v1

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    add-int/2addr v0, v1

    .line 19
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/high16 v2, -0x80000000

    .line 24
    .line 25
    const/high16 v3, 0x40000000    # 2.0f

    .line 26
    .line 27
    if-eq v1, v2, :cond_1

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    invoke-static {p2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    :goto_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->p:I

    .line 60
    .line 61
    if-lez v1, :cond_2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    const/16 v1, 0x38

    .line 65
    .line 66
    invoke-virtual {p0, v1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->s(I)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    sub-int v1, v0, v1

    .line 71
    .line 72
    :goto_1
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->n:I

    .line 73
    .line 74
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    const/4 v0, 0x1

    .line 82
    if-ne p1, v0, :cond_7

    .line 83
    .line 84
    const/4 p1, 0x0

    .line 85
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t:I

    .line 90
    .line 91
    if-eqz v1, :cond_6

    .line 92
    .line 93
    if-eq v1, v0, :cond_4

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eq v0, v1, :cond_5

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_5
    return-void

    .line 108
    :cond_6
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-ge v0, v1, :cond_7

    .line 117
    .line 118
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    add-int/2addr v0, v1

    .line 127
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 132
    .line 133
    invoke-static {p2, v0, v1}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    invoke-static {p0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    invoke-virtual {p1, p0, p2}, Landroid/view/View;->measure(II)V

    .line 146
    .line 147
    .line 148
    :cond_7
    :goto_3
    return-void
.end method

.method public s(I)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    mul-float/2addr p0, p1

    .line 13
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public setEnableScale(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->u:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->u:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->H()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setOnTabSelectedListener(Lcom/hellogroup/mk/business/widget/MKTabLayout$c;)V
    .locals 1
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->v:Lcom/hellogroup/mk/business/widget/MKTabLayout$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->y(Lcom/hellogroup/mk/business/widget/MKTabLayout$c;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->v:Lcom/hellogroup/mk/business/widget/MKTabLayout$c;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b(Lcom/hellogroup/mk/business/widget/MKTabLayout$c;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setSelectedTabIndicatorColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSelectedTabIndicatorHeight(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->i(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSelectedTabSlidingIndicator(Lcom/hellogroup/mk/business/widget/MKTabLayout$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->j(Lcom/hellogroup/mk/business/widget/MKTabLayout$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTabGravity(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->s:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->s:I

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setTabMode(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t:I

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setTabStripGravity(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 14
    .line 15
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setTabTextColors(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->H()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setTabsFromPagerAdapter(Ll/cf60;)V
    .locals 1
    .param p1    # Ll/cf60;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->C(Ll/cf60;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 1
    .param p1    # Landroidx/viewpager/widget/ViewPager;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->F(Landroidx/viewpager/widget/ViewPager;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->getTabScrollRange()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public t(I)Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->getTabCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public v()Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->G:Ll/nj80;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/nj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput-object p0, v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->g:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->o(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iput-object p0, v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->h:Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;

    .line 23
    .line 24
    return-object v0
.end method

.method public w()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->x()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->A:Ll/cf60;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-ge v1, v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->v()Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->A:Ll/cf60;

    .line 20
    .line 21
    invoke-virtual {v3, v1}, Ll/cf60;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v2, v3}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->k(Ljava/lang/CharSequence;)Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p0, v2}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->c(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 30
    .line 31
    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->z:Landroidx/viewpager/widget/ViewPager;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    if-lez v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->getSelectedTabPosition()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eq v0, v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->getTabCount()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-ge v0, v1, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t(I)Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->A(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public x()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->d:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->z(I)V

    .line 12
    .line 13
    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->b:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->f()V

    .line 39
    .line 40
    .line 41
    sget-object v2, Lcom/hellogroup/mk/business/widget/MKTabLayout;->G:Ll/nj80;

    .line 42
    .line 43
    invoke-interface {v2, v1}, Ll/nj80;->release(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const/4 v0, 0x0

    .line 48
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 49
    .line 50
    return-void
.end method

.method public y(Lcom/hellogroup/mk/business/widget/MKTabLayout$c;)V
    .locals 0
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->w:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
