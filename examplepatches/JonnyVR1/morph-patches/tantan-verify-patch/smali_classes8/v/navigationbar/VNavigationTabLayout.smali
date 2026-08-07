.class public Lv/navigationbar/VNavigationTabLayout;
.super Landroid/widget/HorizontalScrollView;
.source "SourceFile"


# annotations
.annotation runtime Landroidx/viewpager/widget/ViewPager$e;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;,
        Lv/navigationbar/VNavigationTabLayout$f;,
        Lv/navigationbar/VNavigationTabLayout$TabView;,
        Lv/navigationbar/VNavigationTabLayout$c;,
        Lv/navigationbar/VNavigationTabLayout$g;,
        Lv/navigationbar/VNavigationTabLayout$b;,
        Lv/navigationbar/VNavigationTabLayout$h;,
        Lv/navigationbar/VNavigationTabLayout$e;,
        Lv/navigationbar/VNavigationTabLayout$d;
    }
.end annotation


# static fields
.field public static final E0:I

.field public static final F0:Ll/nj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nj80<",
            "Lv/navigationbar/VNavigationTabLayout$f;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A:I

.field public B:I

.field public final C:I

.field public final D:I

.field public final E:I

.field public F:I

.field public G:I

.field public H:I

.field public I:I

.field public J:I

.field public K:Z

.field public L:Z

.field public M:Z

.field public N:Lv/navigationbar/VNavigationTabLayout$c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final O:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lv/navigationbar/VNavigationTabLayout$c;",
            ">;"
        }
    .end annotation
.end field

.field public P:Lv/navigationbar/VNavigationTabLayout$c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public Q:Landroid/animation/ValueAnimator;

.field public R:Landroidx/viewpager/widget/ViewPager;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public S:Ll/cf60;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public T:Landroid/database/DataSetObserver;

.field public U:Lv/navigationbar/VNavigationTabLayout$g;

.field public V:Lv/navigationbar/VNavigationTabLayout$b;

.field public W:Z

.field public final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lv/navigationbar/VNavigationTabLayout$f;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lv/navigationbar/VNavigationTabLayout$f;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Landroid/graphics/RectF;

.field public final d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:Landroid/content/res/ColorStateList;

.field public k:Landroid/content/res/ColorStateList;

.field public final k0:Ll/nj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nj80<",
            "Lv/navigationbar/VNavigationTabLayout$TabView;",
            ">;"
        }
    .end annotation
.end field

.field public l:Landroid/content/res/ColorStateList;

.field public m:Landroid/graphics/drawable/Drawable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public n:Landroid/graphics/PorterDuff$Mode;

.field public o:F

.field public p:F

.field public p0:F

.field public q:F

.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field public x:F

.field public y:I

.field public z:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Ll/tgc0;->n:I

    .line 2
    .line 3
    sput v0, Lv/navigationbar/VNavigationTabLayout;->E0:I

    .line 4
    .line 5
    new-instance v0, Ll/rj80;

    .line 6
    .line 7
    const/16 v1, 0x10

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/rj80;-><init>(I)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lv/navigationbar/VNavigationTabLayout;->F0:Ll/nj80;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 665
    invoke-direct {p0, p1, v0}, Lv/navigationbar/VNavigationTabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 664
    sget v0, Ll/o8c0;->k:I

    invoke-direct {p0, p1, p2, v0}, Lv/navigationbar/VNavigationTabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 9
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->c:Landroid/graphics/RectF;

    .line 17
    .line 18
    const/high16 p1, -0x40800000    # -1.0f

    .line 19
    .line 20
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->p:F

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout;->r:I

    .line 24
    .line 25
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout;->t:I

    .line 26
    .line 27
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout;->v:I

    .line 28
    .line 29
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout;->w:I

    .line 30
    .line 31
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->x:F

    .line 32
    .line 33
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout;->z:I

    .line 34
    .line 35
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout;->A:I

    .line 36
    .line 37
    const p1, 0x7fffffff

    .line 38
    .line 39
    .line 40
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->B:I

    .line 41
    .line 42
    new-instance p1, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->O:Ljava/util/ArrayList;

    .line 48
    .line 49
    new-instance p1, Ll/pj80;

    .line 50
    .line 51
    const/16 v1, 0xc

    .line 52
    .line 53
    invoke-direct {p1, v1}, Ll/pj80;-><init>(I)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->k0:Ll/nj80;

    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->p0:F

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p0, v0}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 66
    .line 67
    .line 68
    new-instance p1, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 69
    .line 70
    invoke-direct {p1, p0, v1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;-><init>(Lv/navigationbar/VNavigationTabLayout;Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 74
    .line 75
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 76
    .line 77
    const/4 v7, -0x2

    .line 78
    const/4 v8, -0x1

    .line 79
    invoke-direct {v2, v7, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 80
    .line 81
    .line 82
    invoke-super {p0, p1, v0, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    sget-object v3, Ll/hhc0;->j2:[I

    .line 86
    .line 87
    sget v5, Lv/navigationbar/VNavigationTabLayout;->E0:I

    .line 88
    .line 89
    sget v2, Ll/hhc0;->O2:I

    .line 90
    .line 91
    filled-new-array {v2}, [I

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    move-object v2, p2

    .line 96
    move v4, p3

    .line 97
    invoke-static/range {v1 .. v6}, Lcom/google/android/material/internal/ThemeEnforcement;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    instance-of p3, p3, Landroid/graphics/drawable/ColorDrawable;

    .line 106
    .line 107
    if-eqz p3, :cond_0

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    check-cast p3, Landroid/graphics/drawable/ColorDrawable;

    .line 114
    .line 115
    new-instance v2, Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 116
    .line 117
    invoke-direct {v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p3}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    .line 121
    .line 122
    .line 123
    move-result p3

    .line 124
    invoke-static {p3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    invoke-virtual {v2, p3}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2, v1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->initializeElevationOverlay(Landroid/content/Context;)V

    .line 132
    .line 133
    .line 134
    invoke-static {p0}, Ll/kkl0;->t(Landroid/view/View;)F

    .line 135
    .line 136
    .line 137
    move-result p3

    .line 138
    invoke-virtual {v2, p3}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setElevation(F)V

    .line 139
    .line 140
    .line 141
    invoke-static {p0, v2}, Ll/kkl0;->m0(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 142
    .line 143
    .line 144
    :cond_0
    sget p3, Ll/hhc0;->y2:I

    .line 145
    .line 146
    invoke-virtual {p2, p3, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 147
    .line 148
    .line 149
    move-result p3

    .line 150
    invoke-virtual {p1, p3}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->i(I)V

    .line 151
    .line 152
    .line 153
    sget p3, Ll/hhc0;->v2:I

    .line 154
    .line 155
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 156
    .line 157
    .line 158
    move-result p3

    .line 159
    invoke-virtual {p1, p3}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->h(I)V

    .line 160
    .line 161
    .line 162
    sget p1, Ll/hhc0;->t2:I

    .line 163
    .line 164
    invoke-static {v1, p2, p1}, Lcom/google/android/material/resources/MaterialResources;->getDrawable(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 169
    .line 170
    .line 171
    sget p1, Ll/hhc0;->x2:I

    .line 172
    .line 173
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->setSelectedTabIndicatorGravity(I)V

    .line 178
    .line 179
    .line 180
    sget p1, Ll/hhc0;->w2:I

    .line 181
    .line 182
    const/4 p3, 0x1

    .line 183
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->setTabIndicatorFullWidth(Z)V

    .line 188
    .line 189
    .line 190
    sget p1, Ll/hhc0;->F2:I

    .line 191
    .line 192
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->h:I

    .line 197
    .line 198
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->g:I

    .line 199
    .line 200
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->f:I

    .line 201
    .line 202
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->e:I

    .line 203
    .line 204
    sget v2, Ll/hhc0;->I2:I

    .line 205
    .line 206
    invoke-virtual {p2, v2, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->e:I

    .line 211
    .line 212
    sget p1, Ll/hhc0;->J2:I

    .line 213
    .line 214
    iget v2, p0, Lv/navigationbar/VNavigationTabLayout;->f:I

    .line 215
    .line 216
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->f:I

    .line 221
    .line 222
    sget p1, Ll/hhc0;->H2:I

    .line 223
    .line 224
    iget v2, p0, Lv/navigationbar/VNavigationTabLayout;->g:I

    .line 225
    .line 226
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->g:I

    .line 231
    .line 232
    sget p1, Ll/hhc0;->G2:I

    .line 233
    .line 234
    iget v2, p0, Lv/navigationbar/VNavigationTabLayout;->h:I

    .line 235
    .line 236
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->h:I

    .line 241
    .line 242
    sget p1, Ll/hhc0;->O2:I

    .line 243
    .line 244
    sget v2, Ll/tgc0;->h:I

    .line 245
    .line 246
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->i:I

    .line 251
    .line 252
    sget-object v2, Ll/gic0;->V2:[I

    .line 253
    .line 254
    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    :try_start_0
    sget v2, Ll/gic0;->W2:I

    .line 259
    .line 260
    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    int-to-float v2, v2

    .line 265
    iput v2, p0, Lv/navigationbar/VNavigationTabLayout;->o:F

    .line 266
    .line 267
    sget v2, Ll/gic0;->Z2:I

    .line 268
    .line 269
    invoke-static {v1, p1, v2}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    iput-object v2, p0, Lv/navigationbar/VNavigationTabLayout;->j:Landroid/content/res/ColorStateList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 274
    .line 275
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 276
    .line 277
    .line 278
    sget p1, Ll/hhc0;->Q2:I

    .line 279
    .line 280
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    if-eqz p1, :cond_1

    .line 285
    .line 286
    sget p1, Ll/hhc0;->Q2:I

    .line 287
    .line 288
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 289
    .line 290
    .line 291
    move-result p1

    .line 292
    int-to-float p1, p1

    .line 293
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->o:F

    .line 294
    .line 295
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->p:F

    .line 296
    .line 297
    :cond_1
    sget p1, Ll/hhc0;->N2:I

    .line 298
    .line 299
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 300
    .line 301
    .line 302
    move-result p1

    .line 303
    if-eqz p1, :cond_2

    .line 304
    .line 305
    sget p1, Ll/hhc0;->N2:I

    .line 306
    .line 307
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 308
    .line 309
    .line 310
    move-result p1

    .line 311
    int-to-float p1, p1

    .line 312
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->p:F

    .line 313
    .line 314
    :cond_2
    sget p1, Ll/hhc0;->P2:I

    .line 315
    .line 316
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 317
    .line 318
    .line 319
    move-result p1

    .line 320
    const v2, -0x777778

    .line 321
    .line 322
    .line 323
    if-eqz p1, :cond_4

    .line 324
    .line 325
    sget p1, Ll/hhc0;->P2:I

    .line 326
    .line 327
    invoke-static {v1, p2, p1}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 332
    .line 333
    if-eqz p1, :cond_3

    .line 334
    .line 335
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 336
    .line 337
    .line 338
    move-result p1

    .line 339
    goto :goto_0

    .line 340
    :cond_3
    move p1, v2

    .line 341
    :goto_0
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->s:I

    .line 342
    .line 343
    :cond_4
    sget p1, Ll/hhc0;->M2:I

    .line 344
    .line 345
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 346
    .line 347
    .line 348
    move-result p1

    .line 349
    if-eqz p1, :cond_5

    .line 350
    .line 351
    sget p1, Ll/hhc0;->M2:I

    .line 352
    .line 353
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 354
    .line 355
    .line 356
    move-result p1

    .line 357
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 358
    .line 359
    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 360
    .line 361
    .line 362
    move-result v3

    .line 363
    invoke-static {v3, p1}, Lv/navigationbar/VNavigationTabLayout;->o(II)Landroid/content/res/ColorStateList;

    .line 364
    .line 365
    .line 366
    move-result-object v3

    .line 367
    iput-object v3, p0, Lv/navigationbar/VNavigationTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 368
    .line 369
    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 370
    .line 371
    .line 372
    move-result v3

    .line 373
    iput v3, p0, Lv/navigationbar/VNavigationTabLayout;->s:I

    .line 374
    .line 375
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->r:I

    .line 376
    .line 377
    :cond_5
    sget p1, Ll/hhc0;->q2:I

    .line 378
    .line 379
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 380
    .line 381
    .line 382
    move-result p1

    .line 383
    if-eqz p1, :cond_7

    .line 384
    .line 385
    sget p1, Ll/hhc0;->q2:I

    .line 386
    .line 387
    invoke-static {v1, p2, p1}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    .line 388
    .line 389
    .line 390
    move-result-object p1

    .line 391
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->k:Landroid/content/res/ColorStateList;

    .line 392
    .line 393
    if-eqz p1, :cond_6

    .line 394
    .line 395
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 396
    .line 397
    .line 398
    move-result v2

    .line 399
    :cond_6
    iput v2, p0, Lv/navigationbar/VNavigationTabLayout;->u:I

    .line 400
    .line 401
    iput v2, p0, Lv/navigationbar/VNavigationTabLayout;->t:I

    .line 402
    .line 403
    :cond_7
    sget p1, Ll/hhc0;->L2:I

    .line 404
    .line 405
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 406
    .line 407
    .line 408
    move-result p1

    .line 409
    if-eqz p1, :cond_8

    .line 410
    .line 411
    sget p1, Ll/hhc0;->L2:I

    .line 412
    .line 413
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 414
    .line 415
    .line 416
    move-result p1

    .line 417
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout;->k:Landroid/content/res/ColorStateList;

    .line 418
    .line 419
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 420
    .line 421
    .line 422
    move-result v2

    .line 423
    invoke-static {v2, p1}, Lv/navigationbar/VNavigationTabLayout;->o(II)Landroid/content/res/ColorStateList;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    iput-object v2, p0, Lv/navigationbar/VNavigationTabLayout;->k:Landroid/content/res/ColorStateList;

    .line 428
    .line 429
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 430
    .line 431
    .line 432
    move-result v2

    .line 433
    iput v2, p0, Lv/navigationbar/VNavigationTabLayout;->u:I

    .line 434
    .line 435
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->t:I

    .line 436
    .line 437
    :cond_8
    sget p1, Ll/hhc0;->r2:I

    .line 438
    .line 439
    invoke-virtual {p2, p1, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 440
    .line 441
    .line 442
    move-result p1

    .line 443
    const/4 v2, 0x0

    .line 444
    invoke-static {p1, v2}, Lcom/google/android/material/internal/ViewUtils;->parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 445
    .line 446
    .line 447
    move-result-object p1

    .line 448
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->n:Landroid/graphics/PorterDuff$Mode;

    .line 449
    .line 450
    sget p1, Ll/hhc0;->K2:I

    .line 451
    .line 452
    invoke-static {v1, p2, p1}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    .line 453
    .line 454
    .line 455
    move-result-object p1

    .line 456
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->l:Landroid/content/res/ColorStateList;

    .line 457
    .line 458
    sget p1, Ll/hhc0;->u2:I

    .line 459
    .line 460
    const/16 v1, 0x12c

    .line 461
    .line 462
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 463
    .line 464
    .line 465
    move-result p1

    .line 466
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->H:I

    .line 467
    .line 468
    sget p1, Ll/hhc0;->D2:I

    .line 469
    .line 470
    invoke-virtual {p2, p1, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 471
    .line 472
    .line 473
    move-result p1

    .line 474
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->C:I

    .line 475
    .line 476
    sget p1, Ll/hhc0;->C2:I

    .line 477
    .line 478
    invoke-virtual {p2, p1, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 479
    .line 480
    .line 481
    move-result p1

    .line 482
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->D:I

    .line 483
    .line 484
    sget p1, Ll/hhc0;->k2:I

    .line 485
    .line 486
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 487
    .line 488
    .line 489
    move-result p1

    .line 490
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->y:I

    .line 491
    .line 492
    sget p1, Ll/hhc0;->l2:I

    .line 493
    .line 494
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 495
    .line 496
    .line 497
    move-result p1

    .line 498
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->F:I

    .line 499
    .line 500
    sget p1, Ll/hhc0;->E2:I

    .line 501
    .line 502
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 503
    .line 504
    .line 505
    move-result p1

    .line 506
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 507
    .line 508
    sget p1, Ll/hhc0;->m2:I

    .line 509
    .line 510
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 511
    .line 512
    .line 513
    move-result p1

    .line 514
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->G:I

    .line 515
    .line 516
    sget p1, Ll/hhc0;->z2:I

    .line 517
    .line 518
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 519
    .line 520
    .line 521
    move-result p1

    .line 522
    iput-boolean p1, p0, Lv/navigationbar/VNavigationTabLayout;->K:Z

    .line 523
    .line 524
    sget p1, Ll/hhc0;->R2:I

    .line 525
    .line 526
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 527
    .line 528
    .line 529
    move-result p1

    .line 530
    iput-boolean p1, p0, Lv/navigationbar/VNavigationTabLayout;->M:Z

    .line 531
    .line 532
    sget p1, Ll/hhc0;->s2:I

    .line 533
    .line 534
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 535
    .line 536
    .line 537
    move-result p1

    .line 538
    if-eqz p1, :cond_9

    .line 539
    .line 540
    sget p1, Ll/hhc0;->s2:I

    .line 541
    .line 542
    invoke-virtual {p2, p1, v7}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    .line 543
    .line 544
    .line 545
    move-result p1

    .line 546
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->v:I

    .line 547
    .line 548
    :cond_9
    sget p1, Ll/hhc0;->n2:I

    .line 549
    .line 550
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 551
    .line 552
    .line 553
    move-result p1

    .line 554
    if-eqz p1, :cond_a

    .line 555
    .line 556
    sget p1, Ll/hhc0;->n2:I

    .line 557
    .line 558
    invoke-virtual {p2, p1, v7}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    .line 559
    .line 560
    .line 561
    move-result p1

    .line 562
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->w:I

    .line 563
    .line 564
    :cond_a
    sget p1, Ll/hhc0;->p2:I

    .line 565
    .line 566
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 567
    .line 568
    .line 569
    move-result p1

    .line 570
    if-eqz p1, :cond_b

    .line 571
    .line 572
    sget p1, Ll/hhc0;->p2:I

    .line 573
    .line 574
    invoke-virtual {p2, p1, v7}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    .line 575
    .line 576
    .line 577
    move-result p1

    .line 578
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->w:I

    .line 579
    .line 580
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->v:I

    .line 581
    .line 582
    :cond_b
    sget p1, Ll/hhc0;->o2:I

    .line 583
    .line 584
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 585
    .line 586
    .line 587
    move-result p1

    .line 588
    if-eqz p1, :cond_c

    .line 589
    .line 590
    sget p1, Ll/hhc0;->o2:I

    .line 591
    .line 592
    const/high16 p3, 0x3f800000    # 1.0f

    .line 593
    .line 594
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 595
    .line 596
    .line 597
    move-result p1

    .line 598
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->x:F

    .line 599
    .line 600
    :cond_c
    sget p1, Ll/hhc0;->A2:I

    .line 601
    .line 602
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 603
    .line 604
    .line 605
    move-result p1

    .line 606
    if-eqz p1, :cond_d

    .line 607
    .line 608
    sget p1, Ll/hhc0;->A2:I

    .line 609
    .line 610
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 611
    .line 612
    .line 613
    move-result p1

    .line 614
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->z:I

    .line 615
    .line 616
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout;->y:I

    .line 617
    .line 618
    :cond_d
    sget p1, Ll/hhc0;->B2:I

    .line 619
    .line 620
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 621
    .line 622
    .line 623
    move-result p1

    .line 624
    if-eqz p1, :cond_e

    .line 625
    .line 626
    sget p1, Ll/hhc0;->B2:I

    .line 627
    .line 628
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 629
    .line 630
    .line 631
    move-result p1

    .line 632
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->A:I

    .line 633
    .line 634
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout;->y:I

    .line 635
    .line 636
    :cond_e
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 637
    .line 638
    .line 639
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 640
    .line 641
    .line 642
    move-result-object p1

    .line 643
    sget p2, Ll/bac0;->n:I

    .line 644
    .line 645
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 646
    .line 647
    .line 648
    move-result p1

    .line 649
    int-to-float p1, p1

    .line 650
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->q:F

    .line 651
    .line 652
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout;->E:I

    .line 653
    .line 654
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->l()V

    .line 655
    .line 656
    .line 657
    return-void

    .line 658
    :catchall_0
    move-exception v0

    .line 659
    move-object p0, v0

    .line 660
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 661
    .line 662
    .line 663
    throw p0
.end method

.method public static bridge synthetic a(Lv/navigationbar/VNavigationTabLayout;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->c:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic b(II)Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->o(II)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method private getDefaultHeight()I
    .locals 4

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

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
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lv/navigationbar/VNavigationTabLayout$f;

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v2}, Lv/navigationbar/VNavigationTabLayout$f;->e()Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2}, Lv/navigationbar/VNavigationTabLayout$f;->h()Ljava/lang/CharSequence;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_0

    .line 35
    .line 36
    iget-boolean p0, p0, Lv/navigationbar/VNavigationTabLayout;->K:Z

    .line 37
    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    const/16 p0, 0x48

    .line 41
    .line 42
    return p0

    .line 43
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/16 p0, 0x2c

    .line 47
    .line 48
    return p0
.end method

.method private getTabMinWidth()I
    .locals 2

    .line 1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->C:I

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
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_2
    :goto_0
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout;->E:I

    .line 18
    .line 19
    return p0
.end method

.method private getTabScrollRange()I
    .locals 2

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

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

.method public static o(II)Landroid/content/res/ColorStateList;
    .locals 4
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

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

.method private setSelectedTabView(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_2

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    move v2, v1

    .line 11
    :goto_0
    if-ge v2, v0, :cond_2

    .line 12
    .line 13
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 14
    .line 15
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/4 v4, 0x1

    .line 20
    if-ne v2, p1, :cond_0

    .line 21
    .line 22
    move v5, v4

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    move v5, v1

    .line 25
    :goto_1
    invoke-virtual {v3, v5}, Landroid/view/View;->setSelected(Z)V

    .line 26
    .line 27
    .line 28
    if-ne v2, p1, :cond_1

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_1
    move v4, v1

    .line 32
    :goto_2
    invoke-virtual {v3, v4}, Landroid/view/View;->setActivated(Z)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

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
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->C(I)V

    .line 12
    .line 13
    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

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
    check-cast v1, Lv/navigationbar/VNavigationTabLayout$f;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Lv/navigationbar/VNavigationTabLayout$f;->j()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v1}, Lv/navigationbar/VNavigationTabLayout;->z(Lv/navigationbar/VNavigationTabLayout$f;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const/4 v0, 0x0

    .line 46
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->b:Lv/navigationbar/VNavigationTabLayout$f;

    .line 47
    .line 48
    return-void
.end method

.method public B(Lv/navigationbar/VNavigationTabLayout$c;)V
    .locals 0
    .param p1    # Lv/navigationbar/VNavigationTabLayout$c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->O:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final C(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 8
    .line 9
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 12
    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->C()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->k0:Ll/nj80;

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

.method public D(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 1
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lv/navigationbar/VNavigationTabLayout;->E(Lv/navigationbar/VNavigationTabLayout$f;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public E(Lv/navigationbar/VNavigationTabLayout$f;Z)V
    .locals 4
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->b:Lv/navigationbar/VNavigationTabLayout$f;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    if-eqz v0, :cond_7

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->s(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->j(I)V

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
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

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
    const/4 v3, 0x0

    .line 28
    if-eqz p2, :cond_4

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-ne p2, v1, :cond_3

    .line 37
    .line 38
    :cond_2
    if-eq v2, v1, :cond_3

    .line 39
    .line 40
    const/4 p2, 0x1

    .line 41
    invoke-virtual {p0, v2, v3, p2}, Lv/navigationbar/VNavigationTabLayout;->G(IFZ)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    invoke-virtual {p0, v2}, Lv/navigationbar/VNavigationTabLayout;->j(I)V

    .line 46
    .line 47
    .line 48
    :goto_1
    if-eq v2, v1, :cond_4

    .line 49
    .line 50
    invoke-direct {p0, v2}, Lv/navigationbar/VNavigationTabLayout;->setSelectedTabView(I)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->b:Lv/navigationbar/VNavigationTabLayout$f;

    .line 54
    .line 55
    if-eqz v0, :cond_5

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->u(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 58
    .line 59
    .line 60
    :cond_5
    if-eqz p1, :cond_7

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->t(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 66
    .line 67
    invoke-virtual {p0, v3}, Lv/navigationbar/VNavigationTabLayout$TabView;->u(F)F

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    cmpl-float p2, p0, v3

    .line 72
    .line 73
    if-ltz p2, :cond_6

    .line 74
    .line 75
    iget-object p2, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 76
    .line 77
    invoke-static {p2}, Lv/navigationbar/VNavigationTabLayout$TabView;->d(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/widget/TextView;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p2, p0}, Landroid/view/View;->setScaleY(F)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 85
    .line 86
    invoke-static {p2}, Lv/navigationbar/VNavigationTabLayout$TabView;->d(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/widget/TextView;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p2, p0}, Landroid/view/View;->setScaleX(F)V

    .line 91
    .line 92
    .line 93
    :cond_6
    iget-object p0, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 94
    .line 95
    invoke-virtual {p0, v3}, Lv/navigationbar/VNavigationTabLayout$TabView;->t(F)F

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    cmpl-float p2, p0, v3

    .line 100
    .line 101
    if-ltz p2, :cond_7

    .line 102
    .line 103
    iget-object p2, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 104
    .line 105
    invoke-static {p2}, Lv/navigationbar/VNavigationTabLayout$TabView;->c(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/widget/ImageView;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p2, p0}, Landroid/view/View;->setScaleX(F)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 113
    .line 114
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->c(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/widget/ImageView;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleY(F)V

    .line 119
    .line 120
    .line 121
    :cond_7
    return-void
.end method

.method public F(Ll/cf60;Z)V
    .locals 2
    .param p1    # Ll/cf60;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->S:Ll/cf60;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->T:Landroid/database/DataSetObserver;

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
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->S:Ll/cf60;

    .line 13
    .line 14
    if-eqz p2, :cond_2

    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    iget-object p2, p0, Lv/navigationbar/VNavigationTabLayout;->T:Landroid/database/DataSetObserver;

    .line 19
    .line 20
    if-nez p2, :cond_1

    .line 21
    .line 22
    new-instance p2, Lv/navigationbar/VNavigationTabLayout$e;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Lv/navigationbar/VNavigationTabLayout$e;-><init>(Lv/navigationbar/VNavigationTabLayout;)V

    .line 25
    .line 26
    .line 27
    iput-object p2, p0, Lv/navigationbar/VNavigationTabLayout;->T:Landroid/database/DataSetObserver;

    .line 28
    .line 29
    :cond_1
    iget-object p2, p0, Lv/navigationbar/VNavigationTabLayout;->T:Landroid/database/DataSetObserver;

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ll/cf60;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->y()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public G(IFZ)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lv/navigationbar/VNavigationTabLayout;->H(IFZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public H(IFZZ)V
    .locals 5

    .line 1
    int-to-float v0, p1

    .line 2
    add-float/2addr v0, p2

    .line 3
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ltz v0, :cond_6

    .line 8
    .line 9
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-lt v0, v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    if-eqz p4, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 21
    .line 22
    invoke-virtual {v1, p1, p2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->g(IF)V

    .line 23
    .line 24
    .line 25
    :cond_1
    if-eqz p4, :cond_4

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    if-eqz p4, :cond_4

    .line 32
    .line 33
    iget-object p4, p4, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 34
    .line 35
    invoke-virtual {p4, p1, p2}, Lv/navigationbar/VNavigationTabLayout$TabView;->D(IF)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 p4, p1, 0x1

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    cmpl-float v1, p2, v1

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget v1, p0, Lv/navigationbar/VNavigationTabLayout;->p0:F

    .line 46
    .line 47
    float-to-double v1, v1

    .line 48
    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    .line 49
    .line 50
    cmpl-double v1, v1, v3

    .line 51
    .line 52
    if-lez v1, :cond_2

    .line 53
    .line 54
    add-int/lit8 p4, p1, -0x1

    .line 55
    .line 56
    :cond_2
    invoke-virtual {p0, p4}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    iget-object v1, v1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 63
    .line 64
    const/high16 v2, 0x3f800000    # 1.0f

    .line 65
    .line 66
    sub-float/2addr v2, p2

    .line 67
    invoke-virtual {v1, p4, v2}, Lv/navigationbar/VNavigationTabLayout$TabView;->D(IF)V

    .line 68
    .line 69
    .line 70
    :cond_3
    iput p2, p0, Lv/navigationbar/VNavigationTabLayout;->p0:F

    .line 71
    .line 72
    :cond_4
    iget-object p4, p0, Lv/navigationbar/VNavigationTabLayout;->Q:Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    if-eqz p4, :cond_5

    .line 75
    .line 76
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 77
    .line 78
    .line 79
    move-result p4

    .line 80
    if-eqz p4, :cond_5

    .line 81
    .line 82
    iget-object p4, p0, Lv/navigationbar/VNavigationTabLayout;->Q:Landroid/animation/ValueAnimator;

    .line 83
    .line 84
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->cancel()V

    .line 85
    .line 86
    .line 87
    :cond_5
    invoke-virtual {p0, p1, p2}, Lv/navigationbar/VNavigationTabLayout;->m(IF)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    const/4 p2, 0x0

    .line 92
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->scrollTo(II)V

    .line 93
    .line 94
    .line 95
    if-eqz p3, :cond_6

    .line 96
    .line 97
    invoke-direct {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->setSelectedTabView(I)V

    .line 98
    .line 99
    .line 100
    :cond_6
    :goto_0
    return-void
.end method

.method public I(Landroidx/viewpager/widget/ViewPager;Z)V
    .locals 1
    .param p1    # Landroidx/viewpager/widget/ViewPager;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lv/navigationbar/VNavigationTabLayout;->J(Landroidx/viewpager/widget/ViewPager;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final J(Landroidx/viewpager/widget/ViewPager;ZZ)V
    .locals 2
    .param p1    # Landroidx/viewpager/widget/ViewPager;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->R:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->U:Lv/navigationbar/VNavigationTabLayout$g;

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
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->V:Lv/navigationbar/VNavigationTabLayout$b;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->R:Landroidx/viewpager/widget/ViewPager;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->O(Landroidx/viewpager/widget/ViewPager$i;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->P:Lv/navigationbar/VNavigationTabLayout$c;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->B(Lv/navigationbar/VNavigationTabLayout$c;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->P:Lv/navigationbar/VNavigationTabLayout$c;

    .line 30
    .line 31
    :cond_2
    if-eqz p1, :cond_6

    .line 32
    .line 33
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->R:Landroidx/viewpager/widget/ViewPager;

    .line 34
    .line 35
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->U:Lv/navigationbar/VNavigationTabLayout$g;

    .line 36
    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    new-instance v0, Lv/navigationbar/VNavigationTabLayout$g;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Lv/navigationbar/VNavigationTabLayout$g;-><init>(Lv/navigationbar/VNavigationTabLayout;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->U:Lv/navigationbar/VNavigationTabLayout$g;

    .line 45
    .line 46
    :cond_3
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->U:Lv/navigationbar/VNavigationTabLayout$g;

    .line 47
    .line 48
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$g;->a()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->U:Lv/navigationbar/VNavigationTabLayout$g;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Lv/navigationbar/VNavigationTabLayout$h;

    .line 57
    .line 58
    invoke-direct {v0, p1}, Lv/navigationbar/VNavigationTabLayout$h;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->P:Lv/navigationbar/VNavigationTabLayout$c;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->c(Lv/navigationbar/VNavigationTabLayout$c;)V

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
    invoke-virtual {p0, v0, p2}, Lv/navigationbar/VNavigationTabLayout;->F(Ll/cf60;Z)V

    .line 73
    .line 74
    .line 75
    :cond_4
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->V:Lv/navigationbar/VNavigationTabLayout$b;

    .line 76
    .line 77
    if-nez v0, :cond_5

    .line 78
    .line 79
    new-instance v0, Lv/navigationbar/VNavigationTabLayout$b;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Lv/navigationbar/VNavigationTabLayout$b;-><init>(Lv/navigationbar/VNavigationTabLayout;)V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->V:Lv/navigationbar/VNavigationTabLayout$b;

    .line 85
    .line 86
    :cond_5
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->V:Lv/navigationbar/VNavigationTabLayout$b;

    .line 87
    .line 88
    invoke-virtual {v0, p2}, Lv/navigationbar/VNavigationTabLayout$b;->a(Z)V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, Lv/navigationbar/VNavigationTabLayout;->V:Lv/navigationbar/VNavigationTabLayout$b;

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
    invoke-virtual {p0, p1, p2, v0}, Lv/navigationbar/VNavigationTabLayout;->G(IFZ)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_6
    iput-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->R:Landroidx/viewpager/widget/ViewPager;

    .line 107
    .line 108
    const/4 p1, 0x0

    .line 109
    invoke-virtual {p0, v1, p1}, Lv/navigationbar/VNavigationTabLayout;->F(Ll/cf60;Z)V

    .line 110
    .line 111
    .line 112
    :goto_0
    iput-boolean p3, p0, Lv/navigationbar/VNavigationTabLayout;->W:Z

    .line 113
    .line 114
    return-void
.end method

.method public final K()V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

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
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lv/navigationbar/VNavigationTabLayout$f;

    .line 17
    .line 18
    invoke-virtual {v2}, Lv/navigationbar/VNavigationTabLayout$f;->r()V

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

.method public final L(Landroid/widget/LinearLayout$LayoutParams;)V
    .locals 2
    .param p1    # Landroid/widget/LinearLayout$LayoutParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout;->G:I

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 12
    .line 13
    const/high16 p0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p0, -0x2

    .line 19
    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 23
    .line 24
    return-void
.end method

.method public M(Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

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
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {p0}, Lv/navigationbar/VNavigationTabLayout;->getTabMinWidth()I

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
    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 28
    .line 29
    invoke-virtual {p0, v2}, Lv/navigationbar/VNavigationTabLayout;->L(Landroid/widget/LinearLayout$LayoutParams;)V

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
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->i(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public addView(Landroid/view/View;I)V
    .locals 0

    .line 5
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->i(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->i(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 6
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->i(Landroid/view/View;)V

    return-void
.end method

.method public c(Lv/navigationbar/VNavigationTabLayout$c;)V
    .locals 1
    .param p1    # Lv/navigationbar/VNavigationTabLayout$c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->O:Ljava/util/ArrayList;

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
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->O:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public d(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 1
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Lv/navigationbar/VNavigationTabLayout;->f(Lv/navigationbar/VNavigationTabLayout$f;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e(Lv/navigationbar/VNavigationTabLayout$f;IZ)V
    .locals 1
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Lv/navigationbar/VNavigationTabLayout$f;->h:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    if-ne v0, p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lv/navigationbar/VNavigationTabLayout;->n(Lv/navigationbar/VNavigationTabLayout$f;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->h(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 9
    .line 10
    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->k()V

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

.method public f(Lv/navigationbar/VNavigationTabLayout$f;Z)V
    .locals 1
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0, p2}, Lv/navigationbar/VNavigationTabLayout;->e(Lv/navigationbar/VNavigationTabLayout$f;IZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final g(Lv/navigationbar/NavigationTabItem;)V
    .locals 2
    .param p1    # Lv/navigationbar/NavigationTabItem;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->x()Lv/navigationbar/VNavigationTabLayout$f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lv/navigationbar/NavigationTabItem;->a:Ljava/lang/CharSequence;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationTabLayout$f;->q(Ljava/lang/CharSequence;)Lv/navigationbar/VNavigationTabLayout$f;

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v1, p1, Lv/navigationbar/NavigationTabItem;->b:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationTabLayout$f;->o(Landroid/graphics/drawable/Drawable;)Lv/navigationbar/VNavigationTabLayout$f;

    .line 17
    .line 18
    .line 19
    :cond_1
    iget v1, p1, Lv/navigationbar/NavigationTabItem;->c:I

    .line 20
    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationTabLayout$f;->m(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 24
    .line 25
    .line 26
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_3

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationTabLayout$f;->l(Ljava/lang/CharSequence;)Lv/navigationbar/VNavigationTabLayout$f;

    .line 41
    .line 42
    .line 43
    :cond_3
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->d(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;

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

.method public getSelectedTabPosition()I
    .locals 0

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->b:Lv/navigationbar/VNavigationTabLayout$f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

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
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

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
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public getTabIconTint()Landroid/content/res/ColorStateList;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->k:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTabIndicatorGravity()I
    .locals 0

    .line 1
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout;->I:I

    .line 2
    .line 3
    return p0
.end method

.method public getTabMaxWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public getTabMode()I
    .locals 0

    .line 1
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 2
    .line 3
    return p0
.end method

.method public getTabRippleColor()Landroid/content/res/ColorStateList;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->l:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTabSelectedIndicator()Landroid/graphics/drawable/Drawable;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->m:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTabTextColors()Landroid/content/res/ColorStateList;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 2
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationTabLayout$TabView;->setSelected(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 11
    .line 12
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->p()Landroid/widget/LinearLayout$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v1, v0, p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lv/navigationbar/NavigationTabItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lv/navigationbar/NavigationTabItem;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->g(Lv/navigationbar/NavigationTabItem;)V

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

.method public final j(I)V
    .locals 4

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    invoke-static {p0}, Ll/kkl0;->P(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 20
    .line 21
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->e()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0, p1, v2}, Lv/navigationbar/VNavigationTabLayout;->m(IF)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eq v0, v2, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->v()V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout;->Q:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    filled-new-array {v0, v2}, [I

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v3, v0}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->Q:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 56
    .line 57
    iget v2, p0, Lv/navigationbar/VNavigationTabLayout;->H:I

    .line 58
    .line 59
    invoke-virtual {v0, p1, v2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->c(II)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->getSelectedTabPosition()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eq p1, v0, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->getSelectedTabPosition()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    if-eqz p1, :cond_3

    .line 81
    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    iget-object p1, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 85
    .line 86
    const/4 v2, 0x0

    .line 87
    iget v3, p0, Lv/navigationbar/VNavigationTabLayout;->H:I

    .line 88
    .line 89
    invoke-virtual {p1, v2, v3}, Lv/navigationbar/VNavigationTabLayout$TabView;->k(ZI)V

    .line 90
    .line 91
    .line 92
    iget-object p1, v0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 93
    .line 94
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout;->H:I

    .line 95
    .line 96
    invoke-virtual {p1, v1, p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->k(ZI)V

    .line 97
    .line 98
    .line 99
    :cond_3
    :goto_0
    return-void

    .line 100
    :cond_4
    :goto_1
    invoke-virtual {p0, p1, v2, v1}, Lv/navigationbar/VNavigationTabLayout;->G(IFZ)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final k(I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 17
    .line 18
    const p1, 0x800003

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final l()V
    .locals 4

    .line 1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, v2

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->F:I

    .line 13
    .line 14
    iget v3, p0, Lv/navigationbar/VNavigationTabLayout;->e:I

    .line 15
    .line 16
    sub-int/2addr v0, v3

    .line 17
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    :goto_1
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 22
    .line 23
    invoke-static {v3, v0, v2, v2, v2}, Ll/kkl0;->z0(Landroid/view/View;IIII)V

    .line 24
    .line 25
    .line 26
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    if-eq v0, v2, :cond_2

    .line 32
    .line 33
    if-eq v0, v1, :cond_2

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_2
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_3
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->G:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->k(I)V

    .line 45
    .line 46
    .line 47
    :goto_2
    invoke-virtual {p0, v2}, Lv/navigationbar/VNavigationTabLayout;->M(Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final m(IF)I
    .locals 4

    .line 1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x2

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return v1

    .line 11
    :cond_1
    :goto_0
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    add-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 20
    .line 21
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-ge p1, v3, :cond_2

    .line 26
    .line 27
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 28
    .line 29
    invoke-virtual {v3, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    goto :goto_1

    .line 34
    :cond_2
    const/4 p1, 0x0

    .line 35
    :goto_1
    if-eqz v0, :cond_3

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    goto :goto_2

    .line 42
    :cond_3
    move v3, v1

    .line 43
    :goto_2
    if-eqz p1, :cond_4

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    :cond_4
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    div-int/lit8 v0, v3, 0x2

    .line 54
    .line 55
    add-int/2addr p1, v0

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    div-int/2addr v0, v2

    .line 61
    sub-int/2addr p1, v0

    .line 62
    add-int/2addr v3, v1

    .line 63
    int-to-float v0, v3

    .line 64
    const/high16 v1, 0x3f000000    # 0.5f

    .line 65
    .line 66
    mul-float/2addr v0, v1

    .line 67
    mul-float/2addr v0, p2

    .line 68
    float-to-int p2, v0

    .line 69
    invoke-static {p0}, Ll/kkl0;->x(Landroid/view/View;)I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_5

    .line 74
    .line 75
    add-int/2addr p1, p2

    .line 76
    return p1

    .line 77
    :cond_5
    sub-int/2addr p1, p2

    .line 78
    return p1
.end method

.method public final n(Lv/navigationbar/VNavigationTabLayout$f;I)V
    .locals 1
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2}, Lv/navigationbar/VNavigationTabLayout$f;->p(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

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
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lv/navigationbar/VNavigationTabLayout$f;

    .line 26
    .line 27
    invoke-virtual {v0, p2}, Lv/navigationbar/VNavigationTabLayout$f;->p(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/google/android/material/shape/MaterialShapeUtils;->setParentAbsoluteElevation(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->R:Landroidx/viewpager/widget/ViewPager;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v1, v0, Landroidx/viewpager/widget/ViewPager;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p0, v0, v1, v1}, Lv/navigationbar/VNavigationTabLayout;->J(Landroidx/viewpager/widget/ViewPager;ZZ)V

    .line 23
    .line 24
    .line 25
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
    iget-boolean v0, p0, Lv/navigationbar/VNavigationTabLayout;->W:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lv/navigationbar/VNavigationTabLayout;->W:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

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
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    instance-of v2, v1, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    check-cast v1, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 21
    .line 22
    invoke-static {v1, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->f(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/graphics/Canvas;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 2
    .param p1    # Landroid/view/accessibility/AccessibilityNodeInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bc;->T0(Landroid/view/accessibility/AccessibilityNodeInfo;)Ll/bc;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->getTabCount()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 v0, 0x0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v1, p0, v0, v1}, Ll/bc$e;->b(IIZI)Ll/bc$e;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Ll/bc;->q0(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onMeasure(II)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lv/navigationbar/VNavigationTabLayout;->getDefaultHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Lcom/google/android/material/internal/ViewUtils;->dpToPx(Landroid/content/Context;I)F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/high16 v2, -0x80000000

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    const/high16 v4, 0x40000000    # 2.0f

    .line 25
    .line 26
    const/4 v5, 0x1

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
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    add-int/2addr v0, p2

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    add-int/2addr v0, p2

    .line 42
    invoke-static {v0, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-ne v1, v5, :cond_2

    .line 52
    .line 53
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-lt v1, v0, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1, v0}, Landroid/view/View;->setMinimumHeight(I)V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    iget v1, p0, Lv/navigationbar/VNavigationTabLayout;->D:I

    .line 77
    .line 78
    if-lez v1, :cond_3

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_3
    int-to-float v0, v0

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    const/16 v2, 0x38

    .line 87
    .line 88
    invoke-static {v1, v2}, Lcom/google/android/material/internal/ViewUtils;->dpToPx(Landroid/content/Context;I)F

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    sub-float/2addr v0, v1

    .line 93
    float-to-int v1, v0

    .line 94
    :goto_1
    iput v1, p0, Lv/navigationbar/VNavigationTabLayout;->B:I

    .line 95
    .line 96
    :cond_4
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-ne p1, v5, :cond_8

    .line 104
    .line 105
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 110
    .line 111
    if-eqz v0, :cond_7

    .line 112
    .line 113
    if-eq v0, v5, :cond_5

    .line 114
    .line 115
    const/4 v1, 0x2

    .line 116
    if-eq v0, v1, :cond_7

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eq v0, v1, :cond_6

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_6
    return-void

    .line 131
    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-ge v0, v1, :cond_8

    .line 140
    .line 141
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    add-int/2addr v0, v1

    .line 150
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 155
    .line 156
    invoke-static {p2, v0, v1}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    invoke-static {p0, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    invoke-virtual {p1, p0, p2}, Landroid/view/View;->measure(II)V

    .line 169
    .line 170
    .line 171
    :cond_8
    :goto_3
    return-void
.end method

.method public final p()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    const/4 v2, -0x1

    .line 5
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->L(Landroid/widget/LinearLayout$LayoutParams;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public q()Lv/navigationbar/VNavigationTabLayout$f;
    .locals 0

    .line 1
    sget-object p0, Lv/navigationbar/VNavigationTabLayout;->F0:Ll/nj80;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/nj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lv/navigationbar/VNavigationTabLayout$f;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Lv/navigationbar/VNavigationTabLayout$f;

    .line 12
    .line 13
    invoke-direct {p0}, Lv/navigationbar/VNavigationTabLayout$f;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public final r(Lv/navigationbar/VNavigationTabLayout$f;)Lv/navigationbar/VNavigationTabLayout$TabView;
    .locals 2
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->k0:Ll/nj80;

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
    check-cast v0, Lv/navigationbar/VNavigationTabLayout$TabView;

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
    new-instance v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, p0, v1}, Lv/navigationbar/VNavigationTabLayout$TabView;-><init>(Lv/navigationbar/VNavigationTabLayout;Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->setTab(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Lv/navigationbar/VNavigationTabLayout;->getTabMinWidth()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {v0, p0}, Landroid/view/View;->setMinimumWidth(I)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$f;->a(Lv/navigationbar/VNavigationTabLayout$f;)Ljava/lang/CharSequence;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$f;->c(Lv/navigationbar/VNavigationTabLayout$f;)Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    :cond_2
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$f;->a(Lv/navigationbar/VNavigationTabLayout$f;)Ljava/lang/CharSequence;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    return-object v0
.end method

.method public final s(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 2
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->O:Ljava/util/ArrayList;

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
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->O:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lv/navigationbar/VNavigationTabLayout$c;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lv/navigationbar/VNavigationTabLayout$c;->b(Lv/navigationbar/VNavigationTabLayout$f;)V

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

.method public setElevation(F)V
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setElevation(F)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1}, Lcom/google/android/material/shape/MaterialShapeUtils;->setElevation(Landroid/view/View;F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setInlineLabel(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lv/navigationbar/VNavigationTabLayout;->K:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_2

    .line 4
    .line 5
    iput-boolean p1, p0, Lv/navigationbar/VNavigationTabLayout;->K:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :goto_0
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-ge p1, v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v1, v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    check-cast v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->L()V

    .line 29
    .line 30
    .line 31
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->l()V

    .line 35
    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method public setInlineLabelResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/BoolRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->setInlineLabel(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setOnTabSelectedListener(Lv/navigationbar/VNavigationTabLayout$c;)V
    .locals 1
    .param p1    # Lv/navigationbar/VNavigationTabLayout$c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->N:Lv/navigationbar/VNavigationTabLayout$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->B(Lv/navigationbar/VNavigationTabLayout$c;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->N:Lv/navigationbar/VNavigationTabLayout$c;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->c(Lv/navigationbar/VNavigationTabLayout$c;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setOnTabSelectedListener(Lv/navigationbar/VNavigationTabLayout$d;)V
    .locals 0
    .param p1    # Lv/navigationbar/VNavigationTabLayout$d;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 16
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->setOnTabSelectedListener(Lv/navigationbar/VNavigationTabLayout$c;)V

    return-void
.end method

.method public setScrollAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->v()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->Q:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setSelectedTabIndicator(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0, p1}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 20
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->m:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_0

    .line 21
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->m:Landroid/graphics/drawable/Drawable;

    .line 22
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public setSelectedTabIndicatorColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSelectedTabIndicatorGravity(I)V
    .locals 1

    .line 1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->I:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->I:I

    .line 6
    .line 7
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 8
    .line 9
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setSelectedTabIndicatorHeight(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->i(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTabGravity(I)V
    .locals 1

    .line 1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->G:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->G:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->l()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setTabIconTint(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->k:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->k:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->K()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setTabIconTintResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Ll/tu0;->a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->setTabIconTint(Landroid/content/res/ColorStateList;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setTabIndicatorFullWidth(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/navigationbar/VNavigationTabLayout;->L:Z

    .line 2
    .line 3
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 4
    .line 5
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setTabMode(I)V
    .locals 1

    .line 1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->l()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setTabRippleColor(Landroid/content/res/ColorStateList;)V
    .locals 2
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->l:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->l:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :goto_0
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-ge p1, v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v1, v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    check-cast v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v0, v1}, Lv/navigationbar/VNavigationTabLayout$TabView;->i(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method public setTabRippleColorResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Ll/tu0;->a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->setTabRippleColor(Landroid/content/res/ColorStateList;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setTabTextColors(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->K()V

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
    invoke-virtual {p0, p1, v0}, Lv/navigationbar/VNavigationTabLayout;->F(Ll/cf60;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setUnboundedRipple(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lv/navigationbar/VNavigationTabLayout;->M:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput-boolean p1, p0, Lv/navigationbar/VNavigationTabLayout;->M:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :goto_0
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-ge p1, v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->d:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v1, v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    check-cast v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v0, v1}, Lv/navigationbar/VNavigationTabLayout$TabView;->i(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method public setUnboundedRippleResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/BoolRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->setUnboundedRipple(Z)V

    .line 10
    .line 11
    .line 12
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
    invoke-virtual {p0, p1, v0}, Lv/navigationbar/VNavigationTabLayout;->I(Landroidx/viewpager/widget/ViewPager;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lv/navigationbar/VNavigationTabLayout;->getTabScrollRange()I

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

.method public final t(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 2
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->O:Ljava/util/ArrayList;

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
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->O:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lv/navigationbar/VNavigationTabLayout$c;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lv/navigationbar/VNavigationTabLayout$c;->c(Lv/navigationbar/VNavigationTabLayout$f;)V

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

.method public final u(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 2
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->O:Ljava/util/ArrayList;

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
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->O:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lv/navigationbar/VNavigationTabLayout$c;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lv/navigationbar/VNavigationTabLayout$c;->a(Lv/navigationbar/VNavigationTabLayout$f;)V

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

.method public final v()V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->Q:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->Q:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    sget-object v1, Lcom/google/android/material/animation/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->Q:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    iget v1, p0, Lv/navigationbar/VNavigationTabLayout;->H:I

    .line 20
    .line 21
    int-to-long v1, v1

    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->Q:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    new-instance v1, Lv/navigationbar/VNavigationTabLayout$a;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Lv/navigationbar/VNavigationTabLayout$a;-><init>(Lv/navigationbar/VNavigationTabLayout;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public w(I)Lv/navigationbar/VNavigationTabLayout$f;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->getTabCount()I

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
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout;->a:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lv/navigationbar/VNavigationTabLayout$f;

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

.method public x()Lv/navigationbar/VNavigationTabLayout$f;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->q()Lv/navigationbar/VNavigationTabLayout$f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p0, v0, Lv/navigationbar/VNavigationTabLayout$f;->h:Lv/navigationbar/VNavigationTabLayout;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->r(Lv/navigationbar/VNavigationTabLayout$f;)Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iput-object p0, v0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 12
    .line 13
    return-object v0
.end method

.method public y()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->A()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout;->S:Ll/cf60;

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
    move v2, v1

    .line 14
    :goto_0
    if-ge v2, v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->x()Lv/navigationbar/VNavigationTabLayout$f;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v4, p0, Lv/navigationbar/VNavigationTabLayout;->S:Ll/cf60;

    .line 21
    .line 22
    invoke-virtual {v4, v2}, Ll/cf60;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v3, v4}, Lv/navigationbar/VNavigationTabLayout$f;->q(Ljava/lang/CharSequence;)Lv/navigationbar/VNavigationTabLayout$f;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {p0, v3, v1}, Lv/navigationbar/VNavigationTabLayout;->f(Lv/navigationbar/VNavigationTabLayout$f;Z)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout;->R:Landroidx/viewpager/widget/ViewPager;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    if-lez v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->getSelectedTabPosition()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eq v0, v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout;->getTabCount()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-ge v0, v1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout;->D(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public z(Lv/navigationbar/VNavigationTabLayout$f;)Z
    .locals 0

    .line 1
    sget-object p0, Lv/navigationbar/VNavigationTabLayout;->F0:Ll/nj80;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/nj80;->release(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
