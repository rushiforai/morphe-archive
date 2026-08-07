.class public Lv/smart_refresh/SmartRefreshLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"

# interfaces
.implements Ll/mvc0;
.implements Ll/ei20;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/smart_refresh/SmartRefreshLayout$n;,
        Lv/smart_refresh/SmartRefreshLayout$m;,
        Lv/smart_refresh/SmartRefreshLayout$l;,
        Lv/smart_refresh/SmartRefreshLayout$k;
    }
.end annotation


# static fields
.field public static q1:Ll/srd;

.field public static r1:Ll/trd;

.field public static s1:Ll/urd;

.field public static t1:Landroid/view/ViewGroup$MarginLayoutParams;


# instance fields
.field public A:[I

.field public B:Z

.field public C:Z

.field public D:Z

.field public E:Z

.field public E0:Ll/tm50;

.field public F:Z

.field public F0:Ll/xm50;

.field public G:Z

.field public G0:Ll/xde0;

.field public H:Z

.field public H0:I

.field public I:Z

.field public I0:Z

.field public J:Z

.field public J0:[I

.field public K:Z

.field public K0:Ll/bi20;

.field public L:Z

.field public L0:Ll/fi20;

.field public M:Z

.field public M0:I

.field public N:Z

.field public N0:Ll/t2e;

.field public O:Z

.field public O0:I

.field public P:Z

.field public P0:Ll/t2e;

.field public Q:Z

.field public Q0:I

.field public R:Z

.field public R0:I

.field public S:Z

.field public S0:F

.field public T:Z

.field public T0:F

.field public U:Z

.field public U0:F

.field public V:Z

.field public V0:F

.field public W:Z

.field public W0:F

.field public X0:Ll/gvc0;

.field public Y0:Ll/gvc0;

.field public Z0:Ll/hvc0;

.field public a:I

.field public a1:Landroid/graphics/Paint;

.field public b:I

.field public b1:Landroid/os/Handler;

.field public c:I

.field public c1:Ll/lvc0;

.field public d:I

.field public d1:Lv/smart_refresh/constant/RefreshState;

.field public e:I

.field public e1:Lv/smart_refresh/constant/RefreshState;

.field public f:I

.field public f1:J

.field public g:I

.field public g1:I

.field public h:F

.field public h1:I

.field public i:F

.field public i1:Z

.field public j:F

.field public j1:Z

.field public k:F

.field public k0:Z

.field public k1:Z

.field public l:F

.field public l1:Z

.field public m:C

.field public m1:Z

.field public n:Z

.field public n1:Landroid/view/MotionEvent;

.field public o:Z

.field public o1:Ljava/lang/Runnable;

.field public p:Z

.field public p0:Ll/jn50;

.field public p1:Landroid/animation/ValueAnimator;

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field public x:Landroid/widget/Scroller;

.field public y:Landroid/view/VelocityTracker;

.field public z:Landroid/view/animation/Interpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lv/smart_refresh/SmartRefreshLayout;->t1:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 736
    invoke-direct {p0, p1, v0}, Lv/smart_refresh/SmartRefreshLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x12c

    .line 5
    .line 6
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout;->e:I

    .line 7
    .line 8
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout;->f:I

    .line 9
    .line 10
    const/high16 v0, 0x3f000000    # 0.5f

    .line 11
    .line 12
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout;->l:F

    .line 13
    .line 14
    const/16 v0, 0x6e

    .line 15
    .line 16
    iput-char v0, p0, Lv/smart_refresh/SmartRefreshLayout;->m:C

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout;->q:I

    .line 20
    .line 21
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout;->r:I

    .line 22
    .line 23
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout;->s:I

    .line 24
    .line 25
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout;->t:I

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 32
    .line 33
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->D:Z

    .line 34
    .line 35
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->E:Z

    .line 36
    .line 37
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->F:Z

    .line 38
    .line 39
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->G:Z

    .line 40
    .line 41
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 42
    .line 43
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->I:Z

    .line 44
    .line 45
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->J:Z

    .line 46
    .line 47
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 48
    .line 49
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->L:Z

    .line 50
    .line 51
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->M:Z

    .line 52
    .line 53
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->N:Z

    .line 54
    .line 55
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->O:Z

    .line 56
    .line 57
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->P:Z

    .line 58
    .line 59
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Q:Z

    .line 60
    .line 61
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->R:Z

    .line 62
    .line 63
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->S:Z

    .line 64
    .line 65
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 66
    .line 67
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 68
    .line 69
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 70
    .line 71
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->W:Z

    .line 72
    .line 73
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->k0:Z

    .line 74
    .line 75
    const/4 v2, 0x2

    .line 76
    new-array v2, v2, [I

    .line 77
    .line 78
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->J0:[I

    .line 79
    .line 80
    new-instance v2, Ll/bi20;

    .line 81
    .line 82
    invoke-direct {v2, p0}, Ll/bi20;-><init>(Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->K0:Ll/bi20;

    .line 86
    .line 87
    new-instance v2, Ll/fi20;

    .line 88
    .line 89
    invoke-direct {v2, p0}, Ll/fi20;-><init>(Landroid/view/ViewGroup;)V

    .line 90
    .line 91
    .line 92
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->L0:Ll/fi20;

    .line 93
    .line 94
    sget-object v2, Ll/t2e;->c:Ll/t2e;

    .line 95
    .line 96
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 97
    .line 98
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 99
    .line 100
    const/high16 v2, 0x40200000    # 2.5f

    .line 101
    .line 102
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 103
    .line 104
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 105
    .line 106
    const/high16 v2, 0x3f800000    # 1.0f

    .line 107
    .line 108
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout;->U0:F

    .line 109
    .line 110
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout;->V0:F

    .line 111
    .line 112
    const v2, 0x3e2aaaab

    .line 113
    .line 114
    .line 115
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout;->W0:F

    .line 116
    .line 117
    new-instance v2, Lv/smart_refresh/SmartRefreshLayout$n;

    .line 118
    .line 119
    invoke-direct {v2, p0}, Lv/smart_refresh/SmartRefreshLayout$n;-><init>(Lv/smart_refresh/SmartRefreshLayout;)V

    .line 120
    .line 121
    .line 122
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 123
    .line 124
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 125
    .line 126
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 127
    .line 128
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 129
    .line 130
    const-wide/16 v2, 0x0

    .line 131
    .line 132
    iput-wide v2, p0, Lv/smart_refresh/SmartRefreshLayout;->f1:J

    .line 133
    .line 134
    iput v1, p0, Lv/smart_refresh/SmartRefreshLayout;->g1:I

    .line 135
    .line 136
    iput v1, p0, Lv/smart_refresh/SmartRefreshLayout;->h1:I

    .line 137
    .line 138
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 139
    .line 140
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->m1:Z

    .line 141
    .line 142
    const/4 v2, 0x0

    .line 143
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->n1:Landroid/view/MotionEvent;

    .line 144
    .line 145
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    new-instance v3, Landroid/os/Handler;

    .line 150
    .line 151
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 156
    .line 157
    .line 158
    iput-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 159
    .line 160
    new-instance v3, Landroid/widget/Scroller;

    .line 161
    .line 162
    invoke-direct {v3, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    .line 163
    .line 164
    .line 165
    iput-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->x:Landroid/widget/Scroller;

    .line 166
    .line 167
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    iput-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->y:Landroid/view/VelocityTracker;

    .line 172
    .line 173
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 182
    .line 183
    iput v3, p0, Lv/smart_refresh/SmartRefreshLayout;->g:I

    .line 184
    .line 185
    new-instance v3, Ll/rsf0;

    .line 186
    .line 187
    sget v4, Ll/rsf0;->b:I

    .line 188
    .line 189
    invoke-direct {v3, v4}, Ll/rsf0;-><init>(I)V

    .line 190
    .line 191
    .line 192
    iput-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->z:Landroid/view/animation/Interpolator;

    .line 193
    .line 194
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    iput v3, p0, Lv/smart_refresh/SmartRefreshLayout;->a:I

    .line 199
    .line 200
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    iput v3, p0, Lv/smart_refresh/SmartRefreshLayout;->u:I

    .line 205
    .line 206
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout;->v:I

    .line 211
    .line 212
    const/high16 v2, 0x42700000    # 60.0f

    .line 213
    .line 214
    invoke-static {v2}, Ll/rsf0;->c(F)I

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 219
    .line 220
    const/high16 v2, 0x42c80000    # 100.0f

    .line 221
    .line 222
    invoke-static {v2}, Ll/rsf0;->c(F)I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 227
    .line 228
    sget-object v2, Ll/hhc0;->j1:[I

    .line 229
    .line 230
    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 231
    .line 232
    .line 233
    move-result-object p2

    .line 234
    sget v2, Ll/hhc0;->l1:I

    .line 235
    .line 236
    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    if-nez v2, :cond_0

    .line 241
    .line 242
    invoke-super {p0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 243
    .line 244
    .line 245
    :cond_0
    sget v2, Ll/hhc0;->k1:I

    .line 246
    .line 247
    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 248
    .line 249
    .line 250
    move-result v2

    .line 251
    if-nez v2, :cond_1

    .line 252
    .line 253
    invoke-super {p0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 254
    .line 255
    .line 256
    :cond_1
    sget-object v2, Lv/smart_refresh/SmartRefreshLayout;->s1:Ll/urd;

    .line 257
    .line 258
    if-eqz v2, :cond_2

    .line 259
    .line 260
    invoke-interface {v2, p1, p0}, Ll/urd;->a(Landroid/content/Context;Ll/mvc0;)V

    .line 261
    .line 262
    .line 263
    :cond_2
    sget p1, Ll/hhc0;->p1:I

    .line 264
    .line 265
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->l:F

    .line 266
    .line 267
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->l:F

    .line 272
    .line 273
    sget p1, Ll/hhc0;->Q1:I

    .line 274
    .line 275
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 276
    .line 277
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 278
    .line 279
    .line 280
    move-result p1

    .line 281
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 282
    .line 283
    sget p1, Ll/hhc0;->L1:I

    .line 284
    .line 285
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 286
    .line 287
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 288
    .line 289
    .line 290
    move-result p1

    .line 291
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 292
    .line 293
    sget p1, Ll/hhc0;->S1:I

    .line 294
    .line 295
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->U0:F

    .line 296
    .line 297
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->U0:F

    .line 302
    .line 303
    sget p1, Ll/hhc0;->N1:I

    .line 304
    .line 305
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->V0:F

    .line 306
    .line 307
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 308
    .line 309
    .line 310
    move-result p1

    .line 311
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->V0:F

    .line 312
    .line 313
    sget p1, Ll/hhc0;->E1:I

    .line 314
    .line 315
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 316
    .line 317
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 318
    .line 319
    .line 320
    move-result p1

    .line 321
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 322
    .line 323
    sget p1, Ll/hhc0;->U1:I

    .line 324
    .line 325
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->f:I

    .line 326
    .line 327
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->f:I

    .line 332
    .line 333
    sget p1, Ll/hhc0;->x1:I

    .line 334
    .line 335
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 336
    .line 337
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 338
    .line 339
    .line 340
    move-result p1

    .line 341
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 342
    .line 343
    sget p1, Ll/hhc0;->O1:I

    .line 344
    .line 345
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 346
    .line 347
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 348
    .line 349
    .line 350
    move-result p1

    .line 351
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 352
    .line 353
    sget p1, Ll/hhc0;->J1:I

    .line 354
    .line 355
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 356
    .line 357
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 358
    .line 359
    .line 360
    move-result p1

    .line 361
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 362
    .line 363
    sget p1, Ll/hhc0;->P1:I

    .line 364
    .line 365
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->Q0:I

    .line 366
    .line 367
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 368
    .line 369
    .line 370
    move-result p1

    .line 371
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->Q0:I

    .line 372
    .line 373
    sget p1, Ll/hhc0;->K1:I

    .line 374
    .line 375
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->R0:I

    .line 376
    .line 377
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 378
    .line 379
    .line 380
    move-result p1

    .line 381
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->R0:I

    .line 382
    .line 383
    sget p1, Ll/hhc0;->o1:I

    .line 384
    .line 385
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->R:Z

    .line 386
    .line 387
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 388
    .line 389
    .line 390
    move-result p1

    .line 391
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->R:Z

    .line 392
    .line 393
    sget p1, Ll/hhc0;->n1:I

    .line 394
    .line 395
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->S:Z

    .line 396
    .line 397
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 398
    .line 399
    .line 400
    move-result p1

    .line 401
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->S:Z

    .line 402
    .line 403
    sget p1, Ll/hhc0;->w1:I

    .line 404
    .line 405
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->F:Z

    .line 406
    .line 407
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 408
    .line 409
    .line 410
    move-result p1

    .line 411
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->F:Z

    .line 412
    .line 413
    sget p1, Ll/hhc0;->v1:I

    .line 414
    .line 415
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->G:Z

    .line 416
    .line 417
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 418
    .line 419
    .line 420
    move-result p1

    .line 421
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->G:Z

    .line 422
    .line 423
    sget p1, Ll/hhc0;->C1:I

    .line 424
    .line 425
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->I:Z

    .line 426
    .line 427
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 428
    .line 429
    .line 430
    move-result p1

    .line 431
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->I:Z

    .line 432
    .line 433
    sget p1, Ll/hhc0;->q1:I

    .line 434
    .line 435
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->L:Z

    .line 436
    .line 437
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 438
    .line 439
    .line 440
    move-result p1

    .line 441
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->L:Z

    .line 442
    .line 443
    sget p1, Ll/hhc0;->A1:I

    .line 444
    .line 445
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->J:Z

    .line 446
    .line 447
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 448
    .line 449
    .line 450
    move-result p1

    .line 451
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->J:Z

    .line 452
    .line 453
    sget p1, Ll/hhc0;->D1:I

    .line 454
    .line 455
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->M:Z

    .line 456
    .line 457
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 458
    .line 459
    .line 460
    move-result p1

    .line 461
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->M:Z

    .line 462
    .line 463
    sget p1, Ll/hhc0;->F1:I

    .line 464
    .line 465
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->N:Z

    .line 466
    .line 467
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 468
    .line 469
    .line 470
    move-result p1

    .line 471
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->N:Z

    .line 472
    .line 473
    sget p1, Ll/hhc0;->G1:I

    .line 474
    .line 475
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->O:Z

    .line 476
    .line 477
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 478
    .line 479
    .line 480
    move-result p1

    .line 481
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->O:Z

    .line 482
    .line 483
    sget p1, Ll/hhc0;->y1:I

    .line 484
    .line 485
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->P:Z

    .line 486
    .line 487
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 488
    .line 489
    .line 490
    move-result p1

    .line 491
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->P:Z

    .line 492
    .line 493
    sget p1, Ll/hhc0;->t1:I

    .line 494
    .line 495
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 496
    .line 497
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 498
    .line 499
    .line 500
    move-result p1

    .line 501
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 502
    .line 503
    sget v2, Ll/hhc0;->u1:I

    .line 504
    .line 505
    invoke-virtual {p2, v2, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 506
    .line 507
    .line 508
    move-result p1

    .line 509
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 510
    .line 511
    sget p1, Ll/hhc0;->s1:I

    .line 512
    .line 513
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->D:Z

    .line 514
    .line 515
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 516
    .line 517
    .line 518
    move-result p1

    .line 519
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->D:Z

    .line 520
    .line 521
    sget p1, Ll/hhc0;->r1:I

    .line 522
    .line 523
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->E:Z

    .line 524
    .line 525
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 526
    .line 527
    .line 528
    move-result p1

    .line 529
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->E:Z

    .line 530
    .line 531
    sget p1, Ll/hhc0;->B1:I

    .line 532
    .line 533
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 534
    .line 535
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 536
    .line 537
    .line 538
    move-result p1

    .line 539
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 540
    .line 541
    sget p1, Ll/hhc0;->I1:I

    .line 542
    .line 543
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->q:I

    .line 544
    .line 545
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 546
    .line 547
    .line 548
    move-result p1

    .line 549
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->q:I

    .line 550
    .line 551
    sget p1, Ll/hhc0;->H1:I

    .line 552
    .line 553
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->r:I

    .line 554
    .line 555
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 556
    .line 557
    .line 558
    move-result p1

    .line 559
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->r:I

    .line 560
    .line 561
    sget p1, Ll/hhc0;->R1:I

    .line 562
    .line 563
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->s:I

    .line 564
    .line 565
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 566
    .line 567
    .line 568
    move-result p1

    .line 569
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->s:I

    .line 570
    .line 571
    sget p1, Ll/hhc0;->M1:I

    .line 572
    .line 573
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->t:I

    .line 574
    .line 575
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 576
    .line 577
    .line 578
    move-result p1

    .line 579
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->t:I

    .line 580
    .line 581
    sget p1, Ll/hhc0;->z1:I

    .line 582
    .line 583
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->Q:Z

    .line 584
    .line 585
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 586
    .line 587
    .line 588
    move-result p1

    .line 589
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->Q:Z

    .line 590
    .line 591
    iget-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->K0:Ll/bi20;

    .line 592
    .line 593
    invoke-virtual {v2, p1}, Ll/bi20;->n(Z)V

    .line 594
    .line 595
    .line 596
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 597
    .line 598
    if-nez p1, :cond_4

    .line 599
    .line 600
    sget p1, Ll/hhc0;->x1:I

    .line 601
    .line 602
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 603
    .line 604
    .line 605
    move-result p1

    .line 606
    if-eqz p1, :cond_3

    .line 607
    .line 608
    goto :goto_0

    .line 609
    :cond_3
    move p1, v1

    .line 610
    goto :goto_1

    .line 611
    :cond_4
    :goto_0
    move p1, v0

    .line 612
    :goto_1
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 613
    .line 614
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->W:Z

    .line 615
    .line 616
    if-nez p1, :cond_6

    .line 617
    .line 618
    sget p1, Ll/hhc0;->w1:I

    .line 619
    .line 620
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 621
    .line 622
    .line 623
    move-result p1

    .line 624
    if-eqz p1, :cond_5

    .line 625
    .line 626
    goto :goto_2

    .line 627
    :cond_5
    move p1, v1

    .line 628
    goto :goto_3

    .line 629
    :cond_6
    :goto_2
    move p1, v0

    .line 630
    :goto_3
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->W:Z

    .line 631
    .line 632
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->k0:Z

    .line 633
    .line 634
    if-nez p1, :cond_8

    .line 635
    .line 636
    sget p1, Ll/hhc0;->v1:I

    .line 637
    .line 638
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 639
    .line 640
    .line 641
    move-result p1

    .line 642
    if-eqz p1, :cond_7

    .line 643
    .line 644
    goto :goto_4

    .line 645
    :cond_7
    move p1, v1

    .line 646
    goto :goto_5

    .line 647
    :cond_8
    :goto_4
    move p1, v0

    .line 648
    :goto_5
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->k0:Z

    .line 649
    .line 650
    sget p1, Ll/hhc0;->O1:I

    .line 651
    .line 652
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 653
    .line 654
    .line 655
    move-result p1

    .line 656
    if-eqz p1, :cond_9

    .line 657
    .line 658
    sget-object p1, Ll/t2e;->i:Ll/t2e;

    .line 659
    .line 660
    goto :goto_6

    .line 661
    :cond_9
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 662
    .line 663
    :goto_6
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 664
    .line 665
    sget p1, Ll/hhc0;->J1:I

    .line 666
    .line 667
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 668
    .line 669
    .line 670
    move-result p1

    .line 671
    if-eqz p1, :cond_a

    .line 672
    .line 673
    sget-object p1, Ll/t2e;->i:Ll/t2e;

    .line 674
    .line 675
    goto :goto_7

    .line 676
    :cond_a
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 677
    .line 678
    :goto_7
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 679
    .line 680
    sget p1, Ll/hhc0;->m1:I

    .line 681
    .line 682
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 683
    .line 684
    .line 685
    move-result p1

    .line 686
    sget v2, Ll/hhc0;->T1:I

    .line 687
    .line 688
    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 689
    .line 690
    .line 691
    move-result v2

    .line 692
    if-eqz v2, :cond_c

    .line 693
    .line 694
    if-eqz p1, :cond_b

    .line 695
    .line 696
    filled-new-array {v2, p1}, [I

    .line 697
    .line 698
    .line 699
    move-result-object p1

    .line 700
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->A:[I

    .line 701
    .line 702
    goto :goto_8

    .line 703
    :cond_b
    filled-new-array {v2}, [I

    .line 704
    .line 705
    .line 706
    move-result-object p1

    .line 707
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->A:[I

    .line 708
    .line 709
    goto :goto_8

    .line 710
    :cond_c
    if-eqz p1, :cond_d

    .line 711
    .line 712
    filled-new-array {v1, p1}, [I

    .line 713
    .line 714
    .line 715
    move-result-object p1

    .line 716
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->A:[I

    .line 717
    .line 718
    :cond_d
    :goto_8
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->M:Z

    .line 719
    .line 720
    if-eqz p1, :cond_e

    .line 721
    .line 722
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 723
    .line 724
    if-nez p1, :cond_e

    .line 725
    .line 726
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 727
    .line 728
    if-nez p1, :cond_e

    .line 729
    .line 730
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 731
    .line 732
    :cond_e
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 733
    .line 734
    .line 735
    return-void
.end method

.method public static synthetic b(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic d(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic e(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic f(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic g(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static setDefaultRefreshFooterCreator(Ll/srd;)V
    .locals 0
    .param p0    # Ll/srd;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sput-object p0, Lv/smart_refresh/SmartRefreshLayout;->q1:Ll/srd;

    .line 2
    .line 3
    return-void
.end method

.method public static setDefaultRefreshHeaderCreator(Ll/trd;)V
    .locals 0
    .param p0    # Ll/trd;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sput-object p0, Lv/smart_refresh/SmartRefreshLayout;->r1:Ll/trd;

    .line 2
    .line 3
    return-void
.end method

.method public static setDefaultRefreshInitializer(Ll/urd;)V
    .locals 0
    .param p0    # Ll/urd;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sput-object p0, Lv/smart_refresh/SmartRefreshLayout;->s1:Ll/urd;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public A(ZLl/gvc0;)Z
    .locals 0
    .param p2    # Ll/gvc0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-boolean p0, p0, Lv/smart_refresh/SmartRefreshLayout;->M:Z

    .line 4
    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-interface {p2}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object p1, Ll/wwf0;->f:Ll/wwf0;

    .line 14
    .line 15
    if-ne p0, p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public B()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

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

.method public C(F)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->I0:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->P:Z

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    cmpg-float v1, p1, v2

    .line 13
    .line 14
    if-gez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 17
    .line 18
    invoke-interface {v1}, Ll/hvc0;->g()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    move v1, v2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move/from16 v1, p1

    .line 27
    .line 28
    :goto_0
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->g:I

    .line 29
    .line 30
    mul-int/lit8 v3, v3, 0x5

    .line 31
    .line 32
    int-to-float v3, v3

    .line 33
    cmpl-float v3, v1, v3

    .line 34
    .line 35
    if-lez v3, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    sget v3, Ll/vcc0;->J0:I

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    if-nez v3, :cond_1

    .line 50
    .line 51
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 52
    .line 53
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->g:I

    .line 54
    .line 55
    int-to-float v5, v4

    .line 56
    const/high16 v6, 0x40c00000    # 6.0f

    .line 57
    .line 58
    div-float/2addr v5, v6

    .line 59
    cmpg-float v3, v3, v5

    .line 60
    .line 61
    if-gez v3, :cond_1

    .line 62
    .line 63
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 64
    .line 65
    int-to-float v4, v4

    .line 66
    const/high16 v5, 0x41800000    # 16.0f

    .line 67
    .line 68
    div-float/2addr v4, v5

    .line 69
    cmpg-float v3, v3, v4

    .line 70
    .line 71
    if-gez v3, :cond_1

    .line 72
    .line 73
    const-string v3, "\u4f60\u8fd9\u4e48\u6b7b\u62c9\uff0c\u81e3\u59be\u505a\u4e0d\u5230\u554a\uff01"

    .line 74
    .line 75
    invoke-static {v3}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    sget v4, Ll/vcc0;->J0:I

    .line 79
    .line 80
    invoke-virtual {v0, v4, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 84
    .line 85
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->TwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 86
    .line 87
    const/4 v5, 0x1

    .line 88
    if-ne v3, v4, :cond_2

    .line 89
    .line 90
    cmpl-float v4, v1, v2

    .line 91
    .line 92
    if-lez v4, :cond_2

    .line 93
    .line 94
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 95
    .line 96
    float-to-int v4, v1

    .line 97
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    invoke-interface {v3, v4, v5}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 106
    .line 107
    .line 108
    goto/16 :goto_3

    .line 109
    .line 110
    :cond_2
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 111
    .line 112
    const-wide/high16 v8, 0x4059000000000000L    # 100.0

    .line 113
    .line 114
    const/high16 v10, 0x41200000    # 10.0f

    .line 115
    .line 116
    if-ne v3, v4, :cond_6

    .line 117
    .line 118
    cmpl-float v4, v1, v2

    .line 119
    .line 120
    if-ltz v4, :cond_6

    .line 121
    .line 122
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 123
    .line 124
    int-to-float v4, v3

    .line 125
    cmpg-float v4, v1, v4

    .line 126
    .line 127
    if-gez v4, :cond_3

    .line 128
    .line 129
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 130
    .line 131
    float-to-int v4, v1

    .line 132
    invoke-interface {v3, v4, v5}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 133
    .line 134
    .line 135
    goto/16 :goto_3

    .line 136
    .line 137
    :cond_3
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 138
    .line 139
    cmpg-float v10, v4, v10

    .line 140
    .line 141
    if-gez v10, :cond_4

    .line 142
    .line 143
    int-to-float v10, v3

    .line 144
    mul-float/2addr v4, v10

    .line 145
    :cond_4
    int-to-float v3, v3

    .line 146
    sub-float/2addr v4, v3

    .line 147
    float-to-double v3, v4

    .line 148
    iget v10, v0, Lv/smart_refresh/SmartRefreshLayout;->g:I

    .line 149
    .line 150
    mul-int/lit8 v10, v10, 0x4

    .line 151
    .line 152
    div-int/lit8 v10, v10, 0x3

    .line 153
    .line 154
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 155
    .line 156
    .line 157
    move-result v13

    .line 158
    invoke-static {v10, v13}, Ljava/lang/Math;->max(II)I

    .line 159
    .line 160
    .line 161
    move-result v10

    .line 162
    iget v13, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 163
    .line 164
    sub-int/2addr v10, v13

    .line 165
    int-to-double v14, v10

    .line 166
    int-to-float v10, v13

    .line 167
    sub-float v10, v1, v10

    .line 168
    .line 169
    iget v13, v0, Lv/smart_refresh/SmartRefreshLayout;->l:F

    .line 170
    .line 171
    mul-float/2addr v10, v13

    .line 172
    invoke-static {v2, v10}, Ljava/lang/Math;->max(FF)F

    .line 173
    .line 174
    .line 175
    move-result v10

    .line 176
    const-wide/16 v16, 0x0

    .line 177
    .line 178
    float-to-double v6, v10

    .line 179
    const-wide/high16 v18, 0x3ff0000000000000L    # 1.0

    .line 180
    .line 181
    neg-double v11, v6

    .line 182
    cmpl-double v10, v14, v16

    .line 183
    .line 184
    if-nez v10, :cond_5

    .line 185
    .line 186
    move-wide/from16 v14, v18

    .line 187
    .line 188
    :cond_5
    div-double/2addr v11, v14

    .line 189
    invoke-static {v8, v9, v11, v12}, Ljava/lang/Math;->pow(DD)D

    .line 190
    .line 191
    .line 192
    move-result-wide v8

    .line 193
    sub-double v11, v18, v8

    .line 194
    .line 195
    mul-double/2addr v3, v11

    .line 196
    invoke-static {v3, v4, v6, v7}, Ljava/lang/Math;->min(DD)D

    .line 197
    .line 198
    .line 199
    move-result-wide v3

    .line 200
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 201
    .line 202
    double-to-int v3, v3

    .line 203
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 204
    .line 205
    add-int/2addr v3, v4

    .line 206
    invoke-interface {v6, v3, v5}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 207
    .line 208
    .line 209
    goto/16 :goto_3

    .line 210
    .line 211
    :cond_6
    const-wide/16 v16, 0x0

    .line 212
    .line 213
    const-wide/high16 v18, 0x3ff0000000000000L    # 1.0

    .line 214
    .line 215
    cmpg-float v4, v1, v2

    .line 216
    .line 217
    if-gez v4, :cond_c

    .line 218
    .line 219
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 220
    .line 221
    if-eq v3, v4, :cond_8

    .line 222
    .line 223
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 224
    .line 225
    if-eqz v3, :cond_7

    .line 226
    .line 227
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 228
    .line 229
    if-eqz v3, :cond_7

    .line 230
    .line 231
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 232
    .line 233
    if-eqz v3, :cond_7

    .line 234
    .line 235
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 236
    .line 237
    invoke-virtual {v0, v3}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 238
    .line 239
    .line 240
    move-result v3

    .line 241
    if-nez v3, :cond_8

    .line 242
    .line 243
    :cond_7
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->L:Z

    .line 244
    .line 245
    if-eqz v3, :cond_c

    .line 246
    .line 247
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 248
    .line 249
    if-nez v3, :cond_c

    .line 250
    .line 251
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 252
    .line 253
    invoke-virtual {v0, v3}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    if-eqz v3, :cond_c

    .line 258
    .line 259
    :cond_8
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 260
    .line 261
    neg-int v4, v3

    .line 262
    int-to-float v4, v4

    .line 263
    cmpl-float v4, v1, v4

    .line 264
    .line 265
    if-lez v4, :cond_9

    .line 266
    .line 267
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 268
    .line 269
    float-to-int v4, v1

    .line 270
    invoke-interface {v3, v4, v5}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 271
    .line 272
    .line 273
    goto/16 :goto_3

    .line 274
    .line 275
    :cond_9
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 276
    .line 277
    cmpg-float v6, v4, v10

    .line 278
    .line 279
    if-gez v6, :cond_a

    .line 280
    .line 281
    int-to-float v6, v3

    .line 282
    mul-float/2addr v4, v6

    .line 283
    :cond_a
    int-to-float v3, v3

    .line 284
    sub-float/2addr v4, v3

    .line 285
    float-to-double v3, v4

    .line 286
    iget v6, v0, Lv/smart_refresh/SmartRefreshLayout;->g:I

    .line 287
    .line 288
    mul-int/lit8 v6, v6, 0x4

    .line 289
    .line 290
    div-int/lit8 v6, v6, 0x3

    .line 291
    .line 292
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 293
    .line 294
    .line 295
    move-result v7

    .line 296
    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    .line 297
    .line 298
    .line 299
    move-result v6

    .line 300
    iget v7, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 301
    .line 302
    sub-int/2addr v6, v7

    .line 303
    int-to-double v10, v6

    .line 304
    int-to-float v6, v7

    .line 305
    add-float/2addr v6, v1

    .line 306
    iget v7, v0, Lv/smart_refresh/SmartRefreshLayout;->l:F

    .line 307
    .line 308
    mul-float/2addr v6, v7

    .line 309
    invoke-static {v2, v6}, Ljava/lang/Math;->min(FF)F

    .line 310
    .line 311
    .line 312
    move-result v6

    .line 313
    neg-float v6, v6

    .line 314
    float-to-double v6, v6

    .line 315
    neg-double v12, v6

    .line 316
    cmpl-double v14, v10, v16

    .line 317
    .line 318
    if-nez v14, :cond_b

    .line 319
    .line 320
    move-wide/from16 v10, v18

    .line 321
    .line 322
    :cond_b
    div-double/2addr v12, v10

    .line 323
    invoke-static {v8, v9, v12, v13}, Ljava/lang/Math;->pow(DD)D

    .line 324
    .line 325
    .line 326
    move-result-wide v8

    .line 327
    sub-double v11, v18, v8

    .line 328
    .line 329
    mul-double/2addr v3, v11

    .line 330
    invoke-static {v3, v4, v6, v7}, Ljava/lang/Math;->min(DD)D

    .line 331
    .line 332
    .line 333
    move-result-wide v3

    .line 334
    neg-double v3, v3

    .line 335
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 336
    .line 337
    double-to-int v3, v3

    .line 338
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 339
    .line 340
    sub-int/2addr v3, v4

    .line 341
    invoke-interface {v6, v3, v5}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 342
    .line 343
    .line 344
    goto/16 :goto_3

    .line 345
    .line 346
    :cond_c
    cmpl-float v3, v1, v2

    .line 347
    .line 348
    if-ltz v3, :cond_f

    .line 349
    .line 350
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 351
    .line 352
    cmpg-float v4, v3, v10

    .line 353
    .line 354
    if-gez v4, :cond_d

    .line 355
    .line 356
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 357
    .line 358
    int-to-float v4, v4

    .line 359
    mul-float/2addr v4, v3

    .line 360
    float-to-double v3, v4

    .line 361
    goto :goto_1

    .line 362
    :cond_d
    float-to-double v3, v3

    .line 363
    :goto_1
    iget v6, v0, Lv/smart_refresh/SmartRefreshLayout;->g:I

    .line 364
    .line 365
    div-int/lit8 v6, v6, 0x2

    .line 366
    .line 367
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 368
    .line 369
    .line 370
    move-result v7

    .line 371
    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    .line 372
    .line 373
    .line 374
    move-result v6

    .line 375
    int-to-double v6, v6

    .line 376
    iget v10, v0, Lv/smart_refresh/SmartRefreshLayout;->l:F

    .line 377
    .line 378
    mul-float/2addr v10, v1

    .line 379
    invoke-static {v2, v10}, Ljava/lang/Math;->max(FF)F

    .line 380
    .line 381
    .line 382
    move-result v10

    .line 383
    float-to-double v10, v10

    .line 384
    neg-double v12, v10

    .line 385
    cmpl-double v14, v6, v16

    .line 386
    .line 387
    if-nez v14, :cond_e

    .line 388
    .line 389
    move-wide/from16 v6, v18

    .line 390
    .line 391
    :cond_e
    div-double/2addr v12, v6

    .line 392
    invoke-static {v8, v9, v12, v13}, Ljava/lang/Math;->pow(DD)D

    .line 393
    .line 394
    .line 395
    move-result-wide v6

    .line 396
    sub-double v6, v18, v6

    .line 397
    .line 398
    mul-double/2addr v3, v6

    .line 399
    invoke-static {v3, v4, v10, v11}, Ljava/lang/Math;->min(DD)D

    .line 400
    .line 401
    .line 402
    move-result-wide v3

    .line 403
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 404
    .line 405
    double-to-int v3, v3

    .line 406
    invoke-interface {v6, v3, v5}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 407
    .line 408
    .line 409
    goto :goto_3

    .line 410
    :cond_f
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 411
    .line 412
    cmpg-float v4, v3, v10

    .line 413
    .line 414
    if-gez v4, :cond_10

    .line 415
    .line 416
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 417
    .line 418
    int-to-float v4, v4

    .line 419
    mul-float/2addr v4, v3

    .line 420
    float-to-double v3, v4

    .line 421
    goto :goto_2

    .line 422
    :cond_10
    float-to-double v3, v3

    .line 423
    :goto_2
    iget v6, v0, Lv/smart_refresh/SmartRefreshLayout;->g:I

    .line 424
    .line 425
    div-int/lit8 v6, v6, 0x2

    .line 426
    .line 427
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 428
    .line 429
    .line 430
    move-result v7

    .line 431
    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    .line 432
    .line 433
    .line 434
    move-result v6

    .line 435
    int-to-double v6, v6

    .line 436
    iget v10, v0, Lv/smart_refresh/SmartRefreshLayout;->l:F

    .line 437
    .line 438
    mul-float/2addr v10, v1

    .line 439
    invoke-static {v2, v10}, Ljava/lang/Math;->min(FF)F

    .line 440
    .line 441
    .line 442
    move-result v10

    .line 443
    neg-float v10, v10

    .line 444
    float-to-double v10, v10

    .line 445
    neg-double v12, v10

    .line 446
    cmpl-double v14, v6, v16

    .line 447
    .line 448
    if-nez v14, :cond_11

    .line 449
    .line 450
    move-wide/from16 v6, v18

    .line 451
    .line 452
    :cond_11
    div-double/2addr v12, v6

    .line 453
    invoke-static {v8, v9, v12, v13}, Ljava/lang/Math;->pow(DD)D

    .line 454
    .line 455
    .line 456
    move-result-wide v6

    .line 457
    sub-double v6, v18, v6

    .line 458
    .line 459
    mul-double/2addr v3, v6

    .line 460
    invoke-static {v3, v4, v10, v11}, Ljava/lang/Math;->min(DD)D

    .line 461
    .line 462
    .line 463
    move-result-wide v3

    .line 464
    neg-double v3, v3

    .line 465
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 466
    .line 467
    double-to-int v3, v3

    .line 468
    invoke-interface {v6, v3, v5}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 469
    .line 470
    .line 471
    :goto_3
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->L:Z

    .line 472
    .line 473
    if-eqz v3, :cond_13

    .line 474
    .line 475
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 476
    .line 477
    if-nez v3, :cond_13

    .line 478
    .line 479
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 480
    .line 481
    invoke-virtual {v0, v3}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 482
    .line 483
    .line 484
    move-result v3

    .line 485
    if-eqz v3, :cond_13

    .line 486
    .line 487
    cmpg-float v1, v1, v2

    .line 488
    .line 489
    if-gez v1, :cond_13

    .line 490
    .line 491
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 492
    .line 493
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 494
    .line 495
    if-eq v1, v2, :cond_13

    .line 496
    .line 497
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 498
    .line 499
    if-eq v1, v2, :cond_13

    .line 500
    .line 501
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->LoadFinish:Lv/smart_refresh/constant/RefreshState;

    .line 502
    .line 503
    if-eq v1, v2, :cond_13

    .line 504
    .line 505
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->S:Z

    .line 506
    .line 507
    if-eqz v1, :cond_12

    .line 508
    .line 509
    const/4 v1, 0x0

    .line 510
    iput-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 511
    .line 512
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 513
    .line 514
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 515
    .line 516
    neg-int v2, v2

    .line 517
    invoke-interface {v1, v2}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 518
    .line 519
    .line 520
    :cond_12
    const/4 v1, 0x0

    .line 521
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->setStateDirectLoading(Z)V

    .line 522
    .line 523
    .line 524
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 525
    .line 526
    new-instance v2, Lv/smart_refresh/SmartRefreshLayout$f;

    .line 527
    .line 528
    invoke-direct {v2, v0}, Lv/smart_refresh/SmartRefreshLayout$f;-><init>(Lv/smart_refresh/SmartRefreshLayout;)V

    .line 529
    .line 530
    .line 531
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->f:I

    .line 532
    .line 533
    int-to-long v3, v0

    .line 534
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 535
    .line 536
    .line 537
    :cond_13
    return-void
.end method

.method public D(Lv/smart_refresh/constant/RefreshState;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    if-eq v0, p1, :cond_3

    .line 4
    .line 5
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 6
    .line 7
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 8
    .line 9
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 10
    .line 11
    iget-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 12
    .line 13
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v1, p0, v0, p1}, Ll/tn50;->f(Ll/mvc0;Lv/smart_refresh/constant/RefreshState;Lv/smart_refresh/constant/RefreshState;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    if-eqz v2, :cond_1

    .line 21
    .line 22
    invoke-interface {v2, p0, v0, p1}, Ll/tn50;->f(Ll/mvc0;Lv/smart_refresh/constant/RefreshState;Lv/smart_refresh/constant/RefreshState;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    if-eqz v3, :cond_2

    .line 26
    .line 27
    invoke-interface {v3, p0, v0, p1}, Ll/tn50;->f(Ll/mvc0;Lv/smart_refresh/constant/RefreshState;Lv/smart_refresh/constant/RefreshState;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->LoadFinish:Lv/smart_refresh/constant/RefreshState;

    .line 31
    .line 32
    if-ne p1, v0, :cond_4

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 36
    .line 37
    return-void

    .line 38
    :cond_3
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 39
    .line 40
    if-eq p1, v0, :cond_4

    .line 41
    .line 42
    iput-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 43
    .line 44
    :cond_4
    return-void
.end method

.method public E()V
    .locals 5

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->TwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->w:I

    .line 8
    .line 9
    const/16 v1, -0x3e8

    .line 10
    .line 11
    if-le v0, v1, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    div-int/lit8 v1, v1, 0x2

    .line 20
    .line 21
    if-le v0, v1, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-interface {v0, v1}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_f

    .line 34
    .line 35
    iget p0, p0, Lv/smart_refresh/SmartRefreshLayout;->e:I

    .line 36
    .line 37
    int-to-long v1, p0

    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 43
    .line 44
    if-eqz v0, :cond_f

    .line 45
    .line 46
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 47
    .line 48
    invoke-interface {p0}, Ll/lvc0;->d()Ll/lvc0;

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    if-eq v0, v1, :cond_d

    .line 56
    .line 57
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 70
    .line 71
    if-gez v0, :cond_2

    .line 72
    .line 73
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    goto/16 :goto_0

    .line 82
    .line 83
    :cond_2
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 84
    .line 85
    sget-object v3, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 86
    .line 87
    if-ne v0, v3, :cond_4

    .line 88
    .line 89
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 90
    .line 91
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 92
    .line 93
    if-le v0, v1, :cond_3

    .line 94
    .line 95
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 96
    .line 97
    invoke-interface {p0, v1}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    if-gez v0, :cond_f

    .line 102
    .line 103
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 104
    .line 105
    invoke-interface {p0, v2}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_4
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 110
    .line 111
    if-ne v0, v4, :cond_5

    .line 112
    .line 113
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 114
    .line 115
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->PullDownCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 116
    .line 117
    invoke-interface {p0, v0}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_5
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 122
    .line 123
    if-ne v0, v4, :cond_6

    .line 124
    .line 125
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 126
    .line 127
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->PullUpCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 128
    .line 129
    invoke-interface {p0, v0}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_6
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->ReleaseToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 134
    .line 135
    if-ne v0, v4, :cond_7

    .line 136
    .line 137
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 138
    .line 139
    invoke-interface {p0, v3}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_7
    sget-object v3, Lv/smart_refresh/constant/RefreshState;->ReleaseToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 144
    .line 145
    if-ne v0, v3, :cond_8

    .line 146
    .line 147
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 148
    .line 149
    invoke-interface {p0, v1}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_8
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->ReleaseToTwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 154
    .line 155
    if-ne v0, v1, :cond_9

    .line 156
    .line 157
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 158
    .line 159
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->TwoLevelReleased:Lv/smart_refresh/constant/RefreshState;

    .line 160
    .line 161
    invoke-interface {p0, v0}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_9
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->RefreshReleased:Lv/smart_refresh/constant/RefreshState;

    .line 166
    .line 167
    if-ne v0, v1, :cond_a

    .line 168
    .line 169
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 170
    .line 171
    if-nez v0, :cond_f

    .line 172
    .line 173
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 174
    .line 175
    iget p0, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 176
    .line 177
    invoke-interface {v0, p0}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_a
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->LoadReleased:Lv/smart_refresh/constant/RefreshState;

    .line 182
    .line 183
    if-ne v0, v1, :cond_b

    .line 184
    .line 185
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 186
    .line 187
    if-nez v0, :cond_f

    .line 188
    .line 189
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 190
    .line 191
    iget p0, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 192
    .line 193
    neg-int p0, p0

    .line 194
    invoke-interface {v0, p0}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_b
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->LoadFinish:Lv/smart_refresh/constant/RefreshState;

    .line 199
    .line 200
    if-ne v0, v1, :cond_c

    .line 201
    .line 202
    goto :goto_1

    .line 203
    :cond_c
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 204
    .line 205
    if-eqz v0, :cond_f

    .line 206
    .line 207
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 208
    .line 209
    invoke-interface {p0, v2}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 210
    .line 211
    .line 212
    return-void

    .line 213
    :cond_d
    :goto_0
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 214
    .line 215
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 216
    .line 217
    neg-int v3, v1

    .line 218
    if-ge v0, v3, :cond_e

    .line 219
    .line 220
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 221
    .line 222
    neg-int v0, v1

    .line 223
    invoke-interface {p0, v0}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :cond_e
    if-lez v0, :cond_f

    .line 228
    .line 229
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 230
    .line 231
    invoke-interface {p0, v2}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 232
    .line 233
    .line 234
    :cond_f
    :goto_1
    return-void
.end method

.method public F(Z)Ll/mvc0;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->L:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public G(Z)Ll/mvc0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 3
    .line 4
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 5
    .line 6
    return-object p0
.end method

.method public H(Z)Ll/mvc0;
    .locals 1

    .line 1
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->P:Z

    .line 2
    .line 3
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ll/hvc0;->b(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p0
.end method

.method public I(Z)Ll/mvc0;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public J(F)Ll/mvc0;
    .locals 3

    .line 1
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 2
    .line 3
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->k1:Z

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    const/high16 v1, 0x41200000    # 10.0f

    .line 12
    .line 13
    cmpg-float v1, p1, v1

    .line 14
    .line 15
    if-gez v1, :cond_0

    .line 16
    .line 17
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 18
    .line 19
    int-to-float v1, v1

    .line 20
    mul-float/2addr p1, v1

    .line 21
    :cond_0
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 22
    .line 23
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 24
    .line 25
    float-to-int p1, p1

    .line 26
    invoke-interface {v0, v1, v2, p1}, Ll/gvc0;->i(Ll/lvc0;II)V

    .line 27
    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/t2e;->c()Ll/t2e;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 37
    .line 38
    return-object p0
.end method

.method public K(F)Ll/mvc0;
    .locals 3

    .line 1
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 2
    .line 3
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->k1:Z

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    const/high16 v1, 0x41200000    # 10.0f

    .line 12
    .line 13
    cmpg-float v1, p1, v1

    .line 14
    .line 15
    if-gez v1, :cond_0

    .line 16
    .line 17
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 18
    .line 19
    int-to-float v1, v1

    .line 20
    mul-float/2addr p1, v1

    .line 21
    :cond_0
    float-to-int p1, p1

    .line 22
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 23
    .line 24
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 25
    .line 26
    invoke-interface {v0, v1, v2, p1}, Ll/gvc0;->i(Ll/lvc0;II)V

    .line 27
    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/t2e;->c()Ll/t2e;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 37
    .line 38
    return-object p0
.end method

.method public L(Z)Ll/mvc0;
    .locals 2

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->x()Ll/mvc0;

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 14
    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->s()Ll/mvc0;

    .line 20
    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 24
    .line 25
    if-eq v0, p1, :cond_3

    .line 26
    .line 27
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 28
    .line 29
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 30
    .line 31
    instance-of v1, v0, Ll/jvc0;

    .line 32
    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    check-cast v0, Ll/jvc0;

    .line 36
    .line 37
    invoke-interface {v0, p1}, Ll/jvc0;->b(Z)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    const/4 p1, 0x1

    .line 44
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 45
    .line 46
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 47
    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 51
    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    iget p1, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 55
    .line 56
    if-lez p1, :cond_3

    .line 57
    .line 58
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 59
    .line 60
    invoke-interface {p1}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    sget-object v0, Ll/wwf0;->d:Ll/wwf0;

    .line 65
    .line 66
    if-ne p1, v0, :cond_3

    .line 67
    .line 68
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_3

    .line 75
    .line 76
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 77
    .line 78
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 79
    .line 80
    invoke-virtual {p0, p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->A(ZLl/gvc0;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 87
    .line 88
    invoke-interface {p1}, Ll/gvc0;->getView()Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 93
    .line 94
    int-to-float v0, v0

    .line 95
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 96
    .line 97
    .line 98
    return-object p0

    .line 99
    :cond_2
    const/4 p1, 0x0

    .line 100
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 101
    .line 102
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 103
    .line 104
    const-string p1, " NoMoreData is not supported.(\u4e0d\u652f\u6301NoMoreData\uff0c\u8bf7\u4f7f\u7528[ClassicsFooter]\u6216\u8005[\u81ea\u5b9a\u4e49Footer\u5e76\u5b9e\u73b0setNoMoreData\u65b9\u6cd5\u4e14\u8fd4\u56detrue])"

    .line 105
    .line 106
    const-string v0, "Footer:"

    .line 107
    .line 108
    invoke-static {v0, p0, p1}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    const/4 p0, 0x0

    .line 112
    :cond_3
    return-object p0
.end method

.method public M(Ll/tm50;)Ll/mvc0;
    .locals 1

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->E0:Ll/tm50;

    .line 2
    .line 3
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 17
    :goto_1
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 18
    .line 19
    return-object p0
.end method

.method public N(Ll/xm50;)Ll/mvc0;
    .locals 0

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 2
    .line 3
    return-object p0
.end method

.method public O(Ll/jn50;)Ll/mvc0;
    .locals 0

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p0:Ll/jn50;

    .line 2
    .line 3
    return-object p0
.end method

.method public P(Ll/kn50;)Ll/mvc0;
    .locals 1

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p0:Ll/jn50;

    .line 2
    .line 3
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->E0:Ll/tm50;

    .line 4
    .line 5
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 19
    :goto_1
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 20
    .line 21
    return-object p0
.end method

.method public Q(Ll/jvc0;)Ll/mvc0;
    .locals 1
    .param p1    # Ll/jvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, v0}, Lv/smart_refresh/SmartRefreshLayout;->R(Ll/jvc0;II)Ll/mvc0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public R(Ll/jvc0;II)Ll/mvc0;
    .locals 2
    .param p1    # Ll/jvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/gvc0;->getView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-super {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 16
    .line 17
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout;->h1:I

    .line 18
    .line 19
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->j1:Z

    .line 22
    .line 23
    sget-object v1, Ll/t2e;->c:Ll/t2e;

    .line 24
    .line 25
    iput-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 26
    .line 27
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v1, v0

    .line 37
    goto :goto_1

    .line 38
    :cond_2
    :goto_0
    const/4 v1, 0x1

    .line 39
    :goto_1
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 40
    .line 41
    if-nez p2, :cond_3

    .line 42
    .line 43
    const/4 p2, -0x1

    .line 44
    :cond_3
    if-nez p3, :cond_4

    .line 45
    .line 46
    const/4 p3, -0x2

    .line 47
    :cond_4
    new-instance v1, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 48
    .line 49
    invoke-direct {v1, p2, p3}, Lv/smart_refresh/SmartRefreshLayout$m;-><init>(II)V

    .line 50
    .line 51
    .line 52
    invoke-interface {p1}, Ll/gvc0;->getView()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    instance-of p2, p1, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 61
    .line 62
    if-eqz p2, :cond_5

    .line 63
    .line 64
    move-object v1, p1

    .line 65
    check-cast v1, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 66
    .line 67
    :cond_5
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 68
    .line 69
    invoke-interface {p1}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-boolean p1, p1, Ll/wwf0;->b:Z

    .line 74
    .line 75
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 76
    .line 77
    if-eqz p1, :cond_6

    .line 78
    .line 79
    invoke-interface {p2}, Ll/gvc0;->getView()Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    invoke-super {p0, p1, p2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_6
    invoke-interface {p2}, Ll/gvc0;->getView()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-super {p0, p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 96
    .line 97
    .line 98
    :goto_2
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->A:[I

    .line 99
    .line 100
    if-eqz p1, :cond_7

    .line 101
    .line 102
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 103
    .line 104
    if-eqz p2, :cond_7

    .line 105
    .line 106
    invoke-interface {p2, p1}, Ll/gvc0;->setPrimaryColors([I)V

    .line 107
    .line 108
    .line 109
    :cond_7
    return-object p0
.end method

.method public S(Ll/kvc0;)Ll/mvc0;
    .locals 1
    .param p1    # Ll/kvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, v0}, Lv/smart_refresh/SmartRefreshLayout;->T(Ll/kvc0;II)Ll/mvc0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public T(Ll/kvc0;II)Ll/mvc0;
    .locals 2
    .param p1    # Ll/kvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/gvc0;->getView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-super {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout;->g1:I

    .line 16
    .line 17
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->i1:Z

    .line 18
    .line 19
    sget-object v1, Ll/t2e;->c:Ll/t2e;

    .line 20
    .line 21
    iput-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 22
    .line 23
    if-nez p2, :cond_1

    .line 24
    .line 25
    const/4 p2, -0x1

    .line 26
    :cond_1
    if-nez p3, :cond_2

    .line 27
    .line 28
    const/4 p3, -0x2

    .line 29
    :cond_2
    new-instance v1, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 30
    .line 31
    invoke-direct {v1, p2, p3}, Lv/smart_refresh/SmartRefreshLayout$m;-><init>(II)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1}, Ll/gvc0;->getView()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    instance-of p2, p1, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 43
    .line 44
    if-eqz p2, :cond_3

    .line 45
    .line 46
    move-object v1, p1

    .line 47
    check-cast v1, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 48
    .line 49
    :cond_3
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 50
    .line 51
    invoke-interface {p1}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-boolean p1, p1, Ll/wwf0;->b:Z

    .line 56
    .line 57
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 58
    .line 59
    if-eqz p1, :cond_4

    .line 60
    .line 61
    invoke-interface {p2}, Ll/gvc0;->getView()Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    invoke-super {p0, p1, p2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_4
    invoke-interface {p2}, Ll/gvc0;->getView()Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-super {p0, p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 78
    .line 79
    .line 80
    :goto_0
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->A:[I

    .line 81
    .line 82
    if-eqz p1, :cond_5

    .line 83
    .line 84
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 85
    .line 86
    if-eqz p2, :cond_5

    .line 87
    .line 88
    invoke-interface {p2, p1}, Ll/gvc0;->setPrimaryColors([I)V

    .line 89
    .line 90
    .line 91
    :cond_5
    return-object p0
.end method

.method public U(F)Z
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p1, v0

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    iget p1, p0, Lv/smart_refresh/SmartRefreshLayout;->w:I

    .line 7
    .line 8
    int-to-float p1, p1

    .line 9
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 10
    .line 11
    const/16 v2, 0x1b

    .line 12
    .line 13
    if-le v1, v2, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 23
    .line 24
    invoke-interface {v1}, Ll/hvc0;->getView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/high16 v3, -0x40800000    # -1.0f

    .line 33
    .line 34
    cmpl-float v2, v2, v3

    .line 35
    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/view/View;->getScaleY()F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    cmpl-float v1, v1, v3

    .line 43
    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    neg-float p1, p1

    .line 47
    :cond_1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->u:I

    .line 52
    .line 53
    int-to-float v2, v2

    .line 54
    cmpl-float v1, v1, v2

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    if-lez v1, :cond_a

    .line 58
    .line 59
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 60
    .line 61
    int-to-float v3, v1

    .line 62
    mul-float/2addr v3, p1

    .line 63
    cmpg-float v3, v3, v0

    .line 64
    .line 65
    if-gez v3, :cond_4

    .line 66
    .line 67
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 68
    .line 69
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 70
    .line 71
    const/4 v5, 0x1

    .line 72
    if-eq v3, v4, :cond_3

    .line 73
    .line 74
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 75
    .line 76
    if-eq v3, v4, :cond_3

    .line 77
    .line 78
    if-gez v1, :cond_2

    .line 79
    .line 80
    iget-boolean v4, p0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 81
    .line 82
    if-eqz v4, :cond_2

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    iget-boolean v3, v3, Lv/smart_refresh/constant/RefreshState;->isReleaseToOpening:Z

    .line 86
    .line 87
    if-eqz v3, :cond_4

    .line 88
    .line 89
    return v5

    .line 90
    :cond_3
    :goto_0
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout$l;

    .line 91
    .line 92
    invoke-direct {v0, p0, p1}, Lv/smart_refresh/SmartRefreshLayout$l;-><init>(Lv/smart_refresh/SmartRefreshLayout;F)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout$l;->a()Ljava/lang/Runnable;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 100
    .line 101
    return v5

    .line 102
    :cond_4
    cmpg-float v3, p1, v0

    .line 103
    .line 104
    if-gez v3, :cond_7

    .line 105
    .line 106
    iget-boolean v3, p0, Lv/smart_refresh/SmartRefreshLayout;->J:Z

    .line 107
    .line 108
    if-eqz v3, :cond_5

    .line 109
    .line 110
    iget-boolean v3, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 111
    .line 112
    if-nez v3, :cond_9

    .line 113
    .line 114
    iget-boolean v3, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 115
    .line 116
    if-nez v3, :cond_9

    .line 117
    .line 118
    :cond_5
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 119
    .line 120
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 121
    .line 122
    if-ne v3, v4, :cond_6

    .line 123
    .line 124
    if-gez v1, :cond_9

    .line 125
    .line 126
    :cond_6
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->L:Z

    .line 127
    .line 128
    if-eqz v1, :cond_7

    .line 129
    .line 130
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 131
    .line 132
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_9

    .line 137
    .line 138
    :cond_7
    cmpl-float v0, p1, v0

    .line 139
    .line 140
    if-lez v0, :cond_a

    .line 141
    .line 142
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->J:Z

    .line 143
    .line 144
    if-eqz v0, :cond_8

    .line 145
    .line 146
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 147
    .line 148
    if-nez v0, :cond_9

    .line 149
    .line 150
    :cond_8
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 151
    .line 152
    if-nez v0, :cond_9

    .line 153
    .line 154
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 155
    .line 156
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 157
    .line 158
    if-ne v0, v1, :cond_a

    .line 159
    .line 160
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 161
    .line 162
    if-gtz v0, :cond_a

    .line 163
    .line 164
    :cond_9
    iput-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->m1:Z

    .line 165
    .line 166
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->x:Landroid/widget/Scroller;

    .line 167
    .line 168
    neg-float p1, p1

    .line 169
    float-to-int v7, p1

    .line 170
    const v10, -0x7fffffff

    .line 171
    .line 172
    .line 173
    const v11, 0x7fffffff

    .line 174
    .line 175
    .line 176
    const/4 v4, 0x0

    .line 177
    const/4 v5, 0x0

    .line 178
    const/4 v6, 0x0

    .line 179
    const/4 v8, 0x0

    .line 180
    const/4 v9, 0x0

    .line 181
    invoke-virtual/range {v3 .. v11}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 182
    .line 183
    .line 184
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->x:Landroid/widget/Scroller;

    .line 185
    .line 186
    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 190
    .line 191
    .line 192
    :cond_a
    return v2
.end method

.method public a(Z)Ll/mvc0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->setNestedScrollingEnabled(Z)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public computeScroll()V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->x:Landroid/widget/Scroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->x:Landroid/widget/Scroller;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_7

    .line 13
    .line 14
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->x:Landroid/widget/Scroller;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/Scroller;->getFinalY()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x1

    .line 21
    if-gez v0, :cond_1

    .line 22
    .line 23
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 24
    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    :cond_0
    iget-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 32
    .line 33
    invoke-interface {v2}, Ll/hvc0;->j()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_3

    .line 38
    .line 39
    :cond_1
    if-lez v0, :cond_6

    .line 40
    .line 41
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 42
    .line 43
    if-nez v2, :cond_2

    .line 44
    .line 45
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 46
    .line 47
    if-eqz v2, :cond_6

    .line 48
    .line 49
    :cond_2
    iget-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 50
    .line 51
    invoke-interface {v2}, Ll/hvc0;->g()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_6

    .line 56
    .line 57
    :cond_3
    iget-boolean v2, p0, Lv/smart_refresh/SmartRefreshLayout;->m1:Z

    .line 58
    .line 59
    if-eqz v2, :cond_5

    .line 60
    .line 61
    iget-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->x:Landroid/widget/Scroller;

    .line 62
    .line 63
    if-lez v0, :cond_4

    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrVelocity()F

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    neg-float v0, v0

    .line 70
    goto :goto_0

    .line 71
    :cond_4
    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrVelocity()F

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    :goto_0
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->i(F)V

    .line 76
    .line 77
    .line 78
    :cond_5
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->x:Landroid/widget/Scroller;

    .line 79
    .line 80
    invoke-virtual {p0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_6
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->m1:Z

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 87
    .line 88
    .line 89
    :cond_7
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 6
    .line 7
    .line 8
    move-result v6

    .line 9
    const/4 v10, 0x0

    .line 10
    const/4 v11, 0x1

    .line 11
    const/4 v2, 0x6

    .line 12
    if-ne v6, v2, :cond_0

    .line 13
    .line 14
    move v3, v11

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v3, v10

    .line 17
    :goto_0
    if-eqz v3, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const/4 v4, -0x1

    .line 25
    :goto_1
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    const/4 v7, 0x0

    .line 30
    move v9, v7

    .line 31
    move v12, v9

    .line 32
    move v8, v10

    .line 33
    :goto_2
    if-ge v8, v5, :cond_3

    .line 34
    .line 35
    if-ne v4, v8, :cond_2

    .line 36
    .line 37
    goto :goto_3

    .line 38
    :cond_2
    invoke-virtual {v1, v8}, Landroid/view/MotionEvent;->getX(I)F

    .line 39
    .line 40
    .line 41
    move-result v13

    .line 42
    add-float/2addr v9, v13

    .line 43
    invoke-virtual {v1, v8}, Landroid/view/MotionEvent;->getY(I)F

    .line 44
    .line 45
    .line 46
    move-result v13

    .line 47
    add-float/2addr v12, v13

    .line 48
    :goto_3
    add-int/lit8 v8, v8, 0x1

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_3
    if-eqz v3, :cond_4

    .line 52
    .line 53
    add-int/lit8 v5, v5, -0x1

    .line 54
    .line 55
    :cond_4
    int-to-float v3, v5

    .line 56
    div-float/2addr v9, v3

    .line 57
    div-float v8, v12, v3

    .line 58
    .line 59
    if-eq v6, v2, :cond_5

    .line 60
    .line 61
    const/4 v2, 0x5

    .line 62
    if-ne v6, v2, :cond_6

    .line 63
    .line 64
    :cond_5
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 65
    .line 66
    if-eqz v2, :cond_6

    .line 67
    .line 68
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 69
    .line 70
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 71
    .line 72
    sub-float v3, v8, v3

    .line 73
    .line 74
    add-float/2addr v2, v3

    .line 75
    iput v2, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 76
    .line 77
    :cond_6
    iput v9, v0, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 78
    .line 79
    iput v8, v0, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 80
    .line 81
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->I0:Z

    .line 82
    .line 83
    const/4 v3, 0x2

    .line 84
    if-eqz v2, :cond_a

    .line 85
    .line 86
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 87
    .line 88
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-ne v6, v3, :cond_9

    .line 93
    .line 94
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 95
    .line 96
    if-ne v2, v3, :cond_9

    .line 97
    .line 98
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 99
    .line 100
    float-to-int v2, v2

    .line 101
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 106
    .line 107
    if-nez v3, :cond_7

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_7
    move v11, v3

    .line 111
    :goto_4
    int-to-float v5, v11

    .line 112
    div-float/2addr v4, v5

    .line 113
    iget-boolean v5, v0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 114
    .line 115
    invoke-virtual {v0, v5}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    if-eqz v5, :cond_8

    .line 120
    .line 121
    iget v5, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 122
    .line 123
    if-lez v5, :cond_8

    .line 124
    .line 125
    iget-object v5, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 126
    .line 127
    if-eqz v5, :cond_8

    .line 128
    .line 129
    invoke-interface {v5}, Ll/gvc0;->e()Z

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    if-eqz v5, :cond_8

    .line 134
    .line 135
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 136
    .line 137
    invoke-interface {v0, v4, v2, v3}, Ll/gvc0;->d(FII)V

    .line 138
    .line 139
    .line 140
    return v1

    .line 141
    :cond_8
    iget-boolean v5, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 142
    .line 143
    invoke-virtual {v0, v5}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-eqz v5, :cond_9

    .line 148
    .line 149
    iget v5, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 150
    .line 151
    if-gez v5, :cond_9

    .line 152
    .line 153
    iget-object v5, v0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 154
    .line 155
    if-eqz v5, :cond_9

    .line 156
    .line 157
    invoke-interface {v5}, Ll/gvc0;->e()Z

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    if-eqz v5, :cond_9

    .line 162
    .line 163
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 164
    .line 165
    invoke-interface {v0, v4, v2, v3}, Ll/gvc0;->d(FII)V

    .line 166
    .line 167
    .line 168
    :cond_9
    return v1

    .line 169
    :cond_a
    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    if-eqz v2, :cond_37

    .line 174
    .line 175
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 176
    .line 177
    if-nez v2, :cond_b

    .line 178
    .line 179
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 180
    .line 181
    if-nez v2, :cond_b

    .line 182
    .line 183
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 184
    .line 185
    if-eqz v2, :cond_37

    .line 186
    .line 187
    :cond_b
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->i1:Z

    .line 188
    .line 189
    if-eqz v2, :cond_d

    .line 190
    .line 191
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 192
    .line 193
    iget-boolean v4, v2, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 194
    .line 195
    if-nez v4, :cond_c

    .line 196
    .line 197
    iget-boolean v4, v2, Lv/smart_refresh/constant/RefreshState;->isFinishing:Z

    .line 198
    .line 199
    if-eqz v4, :cond_d

    .line 200
    .line 201
    :cond_c
    iget-boolean v2, v2, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 202
    .line 203
    if-nez v2, :cond_37

    .line 204
    .line 205
    :cond_d
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->j1:Z

    .line 206
    .line 207
    if-eqz v2, :cond_f

    .line 208
    .line 209
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 210
    .line 211
    iget-boolean v4, v2, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 212
    .line 213
    if-nez v4, :cond_e

    .line 214
    .line 215
    iget-boolean v4, v2, Lv/smart_refresh/constant/RefreshState;->isFinishing:Z

    .line 216
    .line 217
    if-eqz v4, :cond_f

    .line 218
    .line 219
    :cond_e
    iget-boolean v2, v2, Lv/smart_refresh/constant/RefreshState;->isFooter:Z

    .line 220
    .line 221
    if-eqz v2, :cond_f

    .line 222
    .line 223
    goto/16 :goto_d

    .line 224
    .line 225
    :cond_f
    invoke-virtual {v0, v6}, Lv/smart_refresh/SmartRefreshLayout;->y(I)Z

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    if-nez v2, :cond_36

    .line 230
    .line 231
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 232
    .line 233
    iget-boolean v4, v2, Lv/smart_refresh/constant/RefreshState;->isFinishing:Z

    .line 234
    .line 235
    if-nez v4, :cond_36

    .line 236
    .line 237
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 238
    .line 239
    if-ne v2, v4, :cond_10

    .line 240
    .line 241
    iget-boolean v5, v0, Lv/smart_refresh/SmartRefreshLayout;->S:Z

    .line 242
    .line 243
    if-nez v5, :cond_36

    .line 244
    .line 245
    :cond_10
    sget-object v5, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 246
    .line 247
    if-ne v2, v5, :cond_11

    .line 248
    .line 249
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->R:Z

    .line 250
    .line 251
    if-eqz v2, :cond_11

    .line 252
    .line 253
    goto/16 :goto_c

    .line 254
    .line 255
    :cond_11
    const/16 v2, 0x68

    .line 256
    .line 257
    if-eqz v6, :cond_33

    .line 258
    .line 259
    const/4 v5, 0x0

    .line 260
    if-eq v6, v11, :cond_2f

    .line 261
    .line 262
    const/4 v12, 0x3

    .line 263
    if-eq v6, v3, :cond_12

    .line 264
    .line 265
    if-eq v6, v12, :cond_30

    .line 266
    .line 267
    goto/16 :goto_b

    .line 268
    .line 269
    :cond_12
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->h:F

    .line 270
    .line 271
    sub-float/2addr v9, v3

    .line 272
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 273
    .line 274
    sub-float v3, v8, v3

    .line 275
    .line 276
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout;->y:Landroid/view/VelocityTracker;

    .line 277
    .line 278
    invoke-virtual {v6, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 279
    .line 280
    .line 281
    iget-boolean v6, v0, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 282
    .line 283
    if-nez v6, :cond_1f

    .line 284
    .line 285
    iget-boolean v6, v0, Lv/smart_refresh/SmartRefreshLayout;->p:Z

    .line 286
    .line 287
    if-nez v6, :cond_1f

    .line 288
    .line 289
    iget-char v6, v0, Lv/smart_refresh/SmartRefreshLayout;->m:C

    .line 290
    .line 291
    if-eq v6, v2, :cond_1f

    .line 292
    .line 293
    iget-object v13, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 294
    .line 295
    if-eqz v13, :cond_1f

    .line 296
    .line 297
    const/16 v13, 0x76

    .line 298
    .line 299
    if-eq v6, v13, :cond_14

    .line 300
    .line 301
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 302
    .line 303
    .line 304
    move-result v6

    .line 305
    iget v14, v0, Lv/smart_refresh/SmartRefreshLayout;->a:I

    .line 306
    .line 307
    int-to-float v14, v14

    .line 308
    cmpl-float v6, v6, v14

    .line 309
    .line 310
    if-ltz v6, :cond_13

    .line 311
    .line 312
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    .line 313
    .line 314
    .line 315
    move-result v6

    .line 316
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 317
    .line 318
    .line 319
    move-result v14

    .line 320
    cmpg-float v6, v6, v14

    .line 321
    .line 322
    if-gez v6, :cond_13

    .line 323
    .line 324
    goto :goto_5

    .line 325
    :cond_13
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    .line 326
    .line 327
    .line 328
    move-result v4

    .line 329
    iget v6, v0, Lv/smart_refresh/SmartRefreshLayout;->a:I

    .line 330
    .line 331
    int-to-float v6, v6

    .line 332
    cmpl-float v4, v4, v6

    .line 333
    .line 334
    if-ltz v4, :cond_1f

    .line 335
    .line 336
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    .line 337
    .line 338
    .line 339
    move-result v4

    .line 340
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 341
    .line 342
    .line 343
    move-result v6

    .line 344
    cmpl-float v4, v4, v6

    .line 345
    .line 346
    if-lez v4, :cond_1f

    .line 347
    .line 348
    iget-char v4, v0, Lv/smart_refresh/SmartRefreshLayout;->m:C

    .line 349
    .line 350
    if-eq v4, v13, :cond_1f

    .line 351
    .line 352
    iput-char v2, v0, Lv/smart_refresh/SmartRefreshLayout;->m:C

    .line 353
    .line 354
    goto/16 :goto_9

    .line 355
    .line 356
    :cond_14
    :goto_5
    iput-char v13, v0, Lv/smart_refresh/SmartRefreshLayout;->m:C

    .line 357
    .line 358
    cmpl-float v2, v3, v7

    .line 359
    .line 360
    if-lez v2, :cond_17

    .line 361
    .line 362
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 363
    .line 364
    if-ltz v2, :cond_16

    .line 365
    .line 366
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 367
    .line 368
    if-nez v2, :cond_15

    .line 369
    .line 370
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 371
    .line 372
    if-eqz v2, :cond_17

    .line 373
    .line 374
    :cond_15
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 375
    .line 376
    invoke-interface {v2}, Ll/hvc0;->j()Z

    .line 377
    .line 378
    .line 379
    move-result v2

    .line 380
    if-eqz v2, :cond_17

    .line 381
    .line 382
    :cond_16
    iput-boolean v11, v0, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 383
    .line 384
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->a:I

    .line 385
    .line 386
    int-to-float v2, v2

    .line 387
    sub-float v2, v8, v2

    .line 388
    .line 389
    iput v2, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 390
    .line 391
    goto :goto_6

    .line 392
    :cond_17
    cmpg-float v2, v3, v7

    .line 393
    .line 394
    if-gez v2, :cond_1b

    .line 395
    .line 396
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 397
    .line 398
    if-gtz v2, :cond_1a

    .line 399
    .line 400
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 401
    .line 402
    if-nez v2, :cond_18

    .line 403
    .line 404
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 405
    .line 406
    if-eqz v2, :cond_1b

    .line 407
    .line 408
    :cond_18
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 409
    .line 410
    if-ne v2, v4, :cond_19

    .line 411
    .line 412
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 413
    .line 414
    if-nez v2, :cond_1a

    .line 415
    .line 416
    :cond_19
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 417
    .line 418
    invoke-interface {v2}, Ll/hvc0;->g()Z

    .line 419
    .line 420
    .line 421
    move-result v2

    .line 422
    if-eqz v2, :cond_1b

    .line 423
    .line 424
    :cond_1a
    iput-boolean v11, v0, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 425
    .line 426
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->a:I

    .line 427
    .line 428
    int-to-float v2, v2

    .line 429
    add-float/2addr v2, v8

    .line 430
    iput v2, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 431
    .line 432
    :cond_1b
    :goto_6
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 433
    .line 434
    if-eqz v2, :cond_1f

    .line 435
    .line 436
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 437
    .line 438
    sub-float v3, v8, v2

    .line 439
    .line 440
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->o:Z

    .line 441
    .line 442
    if-eqz v2, :cond_1c

    .line 443
    .line 444
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->setAction(I)V

    .line 445
    .line 446
    .line 447
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 448
    .line 449
    .line 450
    :cond_1c
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 451
    .line 452
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 453
    .line 454
    if-gtz v4, :cond_1e

    .line 455
    .line 456
    if-nez v4, :cond_1d

    .line 457
    .line 458
    cmpl-float v4, v3, v7

    .line 459
    .line 460
    if-lez v4, :cond_1d

    .line 461
    .line 462
    goto :goto_7

    .line 463
    :cond_1d
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 464
    .line 465
    goto :goto_8

    .line 466
    :cond_1e
    :goto_7
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 467
    .line 468
    :goto_8
    invoke-interface {v2, v4}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    instance-of v4, v2, Landroid/view/ViewGroup;

    .line 476
    .line 477
    if-eqz v4, :cond_1f

    .line 478
    .line 479
    check-cast v2, Landroid/view/ViewGroup;

    .line 480
    .line 481
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 482
    .line 483
    .line 484
    :cond_1f
    :goto_9
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 485
    .line 486
    if-eqz v2, :cond_2e

    .line 487
    .line 488
    float-to-int v2, v3

    .line 489
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->d:I

    .line 490
    .line 491
    add-int/2addr v2, v4

    .line 492
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 493
    .line 494
    iget-boolean v6, v4, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 495
    .line 496
    if-eqz v6, :cond_20

    .line 497
    .line 498
    if-ltz v2, :cond_21

    .line 499
    .line 500
    iget v6, v0, Lv/smart_refresh/SmartRefreshLayout;->c:I

    .line 501
    .line 502
    if-ltz v6, :cond_21

    .line 503
    .line 504
    :cond_20
    iget-boolean v4, v4, Lv/smart_refresh/constant/RefreshState;->isFooter:Z

    .line 505
    .line 506
    if-eqz v4, :cond_2d

    .line 507
    .line 508
    if-gtz v2, :cond_21

    .line 509
    .line 510
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->c:I

    .line 511
    .line 512
    if-lez v4, :cond_2d

    .line 513
    .line 514
    :cond_21
    iput v2, v0, Lv/smart_refresh/SmartRefreshLayout;->c:I

    .line 515
    .line 516
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 517
    .line 518
    .line 519
    move-result-wide v13

    .line 520
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->n1:Landroid/view/MotionEvent;

    .line 521
    .line 522
    if-nez v1, :cond_22

    .line 523
    .line 524
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout;->h:F

    .line 525
    .line 526
    add-float v18, v1, v9

    .line 527
    .line 528
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 529
    .line 530
    const/16 v20, 0x0

    .line 531
    .line 532
    const/16 v17, 0x0

    .line 533
    .line 534
    move-wide v15, v13

    .line 535
    move/from16 v19, v1

    .line 536
    .line 537
    invoke-static/range {v13 .. v20}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 538
    .line 539
    .line 540
    move-result-object v1

    .line 541
    iput-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->n1:Landroid/view/MotionEvent;

    .line 542
    .line 543
    invoke-super {v0, v1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 544
    .line 545
    .line 546
    :cond_22
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout;->h:F

    .line 547
    .line 548
    add-float v18, v1, v9

    .line 549
    .line 550
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 551
    .line 552
    int-to-float v4, v2

    .line 553
    add-float v19, v1, v4

    .line 554
    .line 555
    const/16 v20, 0x0

    .line 556
    .line 557
    const/16 v17, 0x2

    .line 558
    .line 559
    move-wide v15, v13

    .line 560
    invoke-static/range {v13 .. v20}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 561
    .line 562
    .line 563
    move-result-object v1

    .line 564
    invoke-super {v0, v1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 565
    .line 566
    .line 567
    iget-boolean v4, v0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 568
    .line 569
    if-eqz v4, :cond_23

    .line 570
    .line 571
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->a:I

    .line 572
    .line 573
    int-to-float v4, v4

    .line 574
    cmpl-float v3, v3, v4

    .line 575
    .line 576
    if-lez v3, :cond_23

    .line 577
    .line 578
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 579
    .line 580
    if-gez v3, :cond_23

    .line 581
    .line 582
    iput-boolean v10, v0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 583
    .line 584
    :cond_23
    if-lez v2, :cond_25

    .line 585
    .line 586
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 587
    .line 588
    if-nez v3, :cond_24

    .line 589
    .line 590
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 591
    .line 592
    if-eqz v3, :cond_25

    .line 593
    .line 594
    :cond_24
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 595
    .line 596
    invoke-interface {v3}, Ll/hvc0;->j()Z

    .line 597
    .line 598
    .line 599
    move-result v3

    .line 600
    if-eqz v3, :cond_25

    .line 601
    .line 602
    iput v8, v0, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 603
    .line 604
    iput v8, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 605
    .line 606
    iput v10, v0, Lv/smart_refresh/SmartRefreshLayout;->d:I

    .line 607
    .line 608
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 609
    .line 610
    sget-object v3, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 611
    .line 612
    invoke-interface {v2, v3}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 613
    .line 614
    .line 615
    goto :goto_a

    .line 616
    :cond_25
    if-gez v2, :cond_27

    .line 617
    .line 618
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 619
    .line 620
    if-nez v3, :cond_26

    .line 621
    .line 622
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 623
    .line 624
    if-eqz v3, :cond_27

    .line 625
    .line 626
    :cond_26
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 627
    .line 628
    invoke-interface {v3}, Ll/hvc0;->g()Z

    .line 629
    .line 630
    .line 631
    move-result v3

    .line 632
    if-eqz v3, :cond_27

    .line 633
    .line 634
    iput v8, v0, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 635
    .line 636
    iput v8, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 637
    .line 638
    iput v10, v0, Lv/smart_refresh/SmartRefreshLayout;->d:I

    .line 639
    .line 640
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 641
    .line 642
    sget-object v3, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 643
    .line 644
    invoke-interface {v2, v3}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 645
    .line 646
    .line 647
    goto :goto_a

    .line 648
    :cond_27
    move v10, v2

    .line 649
    :goto_a
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 650
    .line 651
    iget-boolean v3, v2, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 652
    .line 653
    if-eqz v3, :cond_28

    .line 654
    .line 655
    if-ltz v10, :cond_29

    .line 656
    .line 657
    :cond_28
    iget-boolean v2, v2, Lv/smart_refresh/constant/RefreshState;->isFooter:Z

    .line 658
    .line 659
    if-eqz v2, :cond_2b

    .line 660
    .line 661
    if-lez v10, :cond_2b

    .line 662
    .line 663
    :cond_29
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 664
    .line 665
    if-eqz v1, :cond_2a

    .line 666
    .line 667
    invoke-virtual {v0, v7}, Lv/smart_refresh/SmartRefreshLayout;->C(F)V

    .line 668
    .line 669
    .line 670
    :cond_2a
    return v11

    .line 671
    :cond_2b
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->n1:Landroid/view/MotionEvent;

    .line 672
    .line 673
    if-eqz v2, :cond_2c

    .line 674
    .line 675
    iput-object v5, v0, Lv/smart_refresh/SmartRefreshLayout;->n1:Landroid/view/MotionEvent;

    .line 676
    .line 677
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->setAction(I)V

    .line 678
    .line 679
    .line 680
    invoke-super {v0, v1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 681
    .line 682
    .line 683
    :cond_2c
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 684
    .line 685
    .line 686
    move v2, v10

    .line 687
    :cond_2d
    int-to-float v1, v2

    .line 688
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->C(F)V

    .line 689
    .line 690
    .line 691
    return v11

    .line 692
    :cond_2e
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 693
    .line 694
    if-eqz v2, :cond_32

    .line 695
    .line 696
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->a:I

    .line 697
    .line 698
    int-to-float v2, v2

    .line 699
    cmpl-float v2, v3, v2

    .line 700
    .line 701
    if-lez v2, :cond_32

    .line 702
    .line 703
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 704
    .line 705
    if-gez v2, :cond_32

    .line 706
    .line 707
    iput-boolean v10, v0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 708
    .line 709
    goto :goto_b

    .line 710
    :cond_2f
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->y:Landroid/view/VelocityTracker;

    .line 711
    .line 712
    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 713
    .line 714
    .line 715
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->y:Landroid/view/VelocityTracker;

    .line 716
    .line 717
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->v:I

    .line 718
    .line 719
    int-to-float v3, v3

    .line 720
    const/16 v4, 0x3e8

    .line 721
    .line 722
    invoke-virtual {v2, v4, v3}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 723
    .line 724
    .line 725
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->y:Landroid/view/VelocityTracker;

    .line 726
    .line 727
    invoke-virtual {v2}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 728
    .line 729
    .line 730
    move-result v2

    .line 731
    float-to-int v2, v2

    .line 732
    iput v2, v0, Lv/smart_refresh/SmartRefreshLayout;->w:I

    .line 733
    .line 734
    invoke-virtual {v0, v7}, Lv/smart_refresh/SmartRefreshLayout;->U(F)Z

    .line 735
    .line 736
    .line 737
    :cond_30
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->y:Landroid/view/VelocityTracker;

    .line 738
    .line 739
    invoke-virtual {v2}, Landroid/view/VelocityTracker;->clear()V

    .line 740
    .line 741
    .line 742
    const/16 v2, 0x6e

    .line 743
    .line 744
    iput-char v2, v0, Lv/smart_refresh/SmartRefreshLayout;->m:C

    .line 745
    .line 746
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->n1:Landroid/view/MotionEvent;

    .line 747
    .line 748
    if-eqz v2, :cond_31

    .line 749
    .line 750
    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 751
    .line 752
    .line 753
    iput-object v5, v0, Lv/smart_refresh/SmartRefreshLayout;->n1:Landroid/view/MotionEvent;

    .line 754
    .line 755
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 756
    .line 757
    .line 758
    move-result-wide v2

    .line 759
    iget v7, v0, Lv/smart_refresh/SmartRefreshLayout;->h:F

    .line 760
    .line 761
    const/4 v9, 0x0

    .line 762
    move-wide v4, v2

    .line 763
    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 764
    .line 765
    .line 766
    move-result-object v2

    .line 767
    invoke-super {v0, v2}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 768
    .line 769
    .line 770
    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 771
    .line 772
    .line 773
    :cond_31
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->E()V

    .line 774
    .line 775
    .line 776
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 777
    .line 778
    if-eqz v2, :cond_32

    .line 779
    .line 780
    iput-boolean v10, v0, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 781
    .line 782
    return v11

    .line 783
    :cond_32
    :goto_b
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 784
    .line 785
    .line 786
    move-result v0

    .line 787
    return v0

    .line 788
    :cond_33
    iput v10, v0, Lv/smart_refresh/SmartRefreshLayout;->w:I

    .line 789
    .line 790
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->y:Landroid/view/VelocityTracker;

    .line 791
    .line 792
    invoke-virtual {v3, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 793
    .line 794
    .line 795
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->x:Landroid/widget/Scroller;

    .line 796
    .line 797
    invoke-virtual {v3, v11}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 798
    .line 799
    .line 800
    iput v9, v0, Lv/smart_refresh/SmartRefreshLayout;->h:F

    .line 801
    .line 802
    iput v8, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 803
    .line 804
    iput v10, v0, Lv/smart_refresh/SmartRefreshLayout;->c:I

    .line 805
    .line 806
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 807
    .line 808
    iput v3, v0, Lv/smart_refresh/SmartRefreshLayout;->d:I

    .line 809
    .line 810
    iput-boolean v10, v0, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 811
    .line 812
    iput-boolean v10, v0, Lv/smart_refresh/SmartRefreshLayout;->p:Z

    .line 813
    .line 814
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 815
    .line 816
    .line 817
    move-result v3

    .line 818
    iput-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->o:Z

    .line 819
    .line 820
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 821
    .line 822
    sget-object v4, Lv/smart_refresh/constant/RefreshState;->TwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 823
    .line 824
    if-ne v3, v4, :cond_34

    .line 825
    .line 826
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 827
    .line 828
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 829
    .line 830
    .line 831
    move-result v4

    .line 832
    int-to-float v4, v4

    .line 833
    const/high16 v5, 0x3f800000    # 1.0f

    .line 834
    .line 835
    iget v6, v0, Lv/smart_refresh/SmartRefreshLayout;->W0:F

    .line 836
    .line 837
    sub-float/2addr v5, v6

    .line 838
    mul-float/2addr v4, v5

    .line 839
    cmpg-float v3, v3, v4

    .line 840
    .line 841
    if-gez v3, :cond_34

    .line 842
    .line 843
    iput-char v2, v0, Lv/smart_refresh/SmartRefreshLayout;->m:C

    .line 844
    .line 845
    iget-boolean v0, v0, Lv/smart_refresh/SmartRefreshLayout;->o:Z

    .line 846
    .line 847
    return v0

    .line 848
    :cond_34
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 849
    .line 850
    if-eqz v0, :cond_35

    .line 851
    .line 852
    invoke-interface {v0, v1}, Ll/hvc0;->a(Landroid/view/MotionEvent;)V

    .line 853
    .line 854
    .line 855
    :cond_35
    return v11

    .line 856
    :cond_36
    :goto_c
    return v10

    .line 857
    :cond_37
    :goto_d
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 858
    .line 859
    .line 860
    move-result v0

    .line 861
    return v0
.end method

.method public drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 10

    .line 1
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 2
    .line 3
    if-eqz v1, :cond_0

    .line 4
    .line 5
    invoke-interface {v1}, Ll/hvc0;->getView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    :goto_0
    move-object v7, v1

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    goto :goto_0

    .line 13
    :goto_1
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 14
    .line 15
    const/4 v8, 0x1

    .line 16
    if-eqz v1, :cond_8

    .line 17
    .line 18
    invoke-interface {v1}, Ll/gvc0;->getView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-ne v1, p2, :cond_8

    .line 23
    .line 24
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_7

    .line 31
    .line 32
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->I:Z

    .line 33
    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    goto/16 :goto_4

    .line 43
    .line 44
    :cond_1
    if-eqz v7, :cond_8

    .line 45
    .line 46
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {v7}, Landroid/view/View;->getPaddingTop()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    add-int/2addr v1, v2

    .line 55
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 56
    .line 57
    add-int/2addr v1, v2

    .line 58
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->g1:I

    .line 67
    .line 68
    if-eqz v2, :cond_4

    .line 69
    .line 70
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->a1:Landroid/graphics/Paint;

    .line 71
    .line 72
    if-eqz v3, :cond_4

    .line 73
    .line 74
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 78
    .line 79
    invoke-interface {v2}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    iget-boolean v2, v2, Ll/wwf0;->c:Z

    .line 84
    .line 85
    if-eqz v2, :cond_3

    .line 86
    .line 87
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    :cond_2
    :goto_2
    move v9, v1

    .line 92
    goto :goto_3

    .line 93
    :cond_3
    iget-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 94
    .line 95
    invoke-interface {v2}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    sget-object v3, Ll/wwf0;->d:Ll/wwf0;

    .line 100
    .line 101
    if-ne v2, v3, :cond_2

    .line 102
    .line 103
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 108
    .line 109
    add-int/2addr v1, v2

    .line 110
    goto :goto_2

    .line 111
    :goto_3
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    int-to-float v3, v1

    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    int-to-float v4, v1

    .line 121
    int-to-float v5, v9

    .line 122
    iget-object v6, p0, Lv/smart_refresh/SmartRefreshLayout;->a1:Landroid/graphics/Paint;

    .line 123
    .line 124
    const/4 v2, 0x0

    .line 125
    move-object v1, p1

    .line 126
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 127
    .line 128
    .line 129
    move v1, v9

    .line 130
    :cond_4
    iget-boolean v3, p0, Lv/smart_refresh/SmartRefreshLayout;->D:Z

    .line 131
    .line 132
    if-eqz v3, :cond_5

    .line 133
    .line 134
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 135
    .line 136
    invoke-interface {v3}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    sget-object v4, Ll/wwf0;->f:Ll/wwf0;

    .line 141
    .line 142
    if-eq v3, v4, :cond_6

    .line 143
    .line 144
    :cond_5
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 145
    .line 146
    invoke-interface {v3}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    iget-boolean v3, v3, Ll/wwf0;->c:Z

    .line 151
    .line 152
    if-eqz v3, :cond_8

    .line 153
    .line 154
    :cond_6
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 155
    .line 156
    .line 157
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    .line 166
    .line 167
    .line 168
    move-result v5

    .line 169
    invoke-virtual {p1, v3, v4, v5, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 170
    .line 171
    .line 172
    invoke-super/range {p0 .. p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 177
    .line 178
    .line 179
    return v0

    .line 180
    :cond_7
    :goto_4
    return v8

    .line 181
    :cond_8
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 182
    .line 183
    if-eqz v1, :cond_10

    .line 184
    .line 185
    invoke-interface {v1}, Ll/gvc0;->getView()Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    if-ne v1, p2, :cond_10

    .line 190
    .line 191
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 192
    .line 193
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_f

    .line 198
    .line 199
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->I:Z

    .line 200
    .line 201
    if-nez v1, :cond_9

    .line 202
    .line 203
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-eqz v1, :cond_9

    .line 208
    .line 209
    goto/16 :goto_7

    .line 210
    .line 211
    :cond_9
    if-eqz v7, :cond_10

    .line 212
    .line 213
    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    invoke-virtual {v7}, Landroid/view/View;->getPaddingBottom()I

    .line 218
    .line 219
    .line 220
    move-result v3

    .line 221
    sub-int/2addr v1, v3

    .line 222
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 223
    .line 224
    add-int/2addr v1, v3

    .line 225
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->h1:I

    .line 234
    .line 235
    if-eqz v3, :cond_c

    .line 236
    .line 237
    iget-object v4, p0, Lv/smart_refresh/SmartRefreshLayout;->a1:Landroid/graphics/Paint;

    .line 238
    .line 239
    if-eqz v4, :cond_c

    .line 240
    .line 241
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 242
    .line 243
    .line 244
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 245
    .line 246
    invoke-interface {v3}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    iget-boolean v3, v3, Ll/wwf0;->c:Z

    .line 251
    .line 252
    if-eqz v3, :cond_b

    .line 253
    .line 254
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    :cond_a
    :goto_5
    move v7, v1

    .line 259
    goto :goto_6

    .line 260
    :cond_b
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 261
    .line 262
    invoke-interface {v3}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    sget-object v4, Ll/wwf0;->d:Ll/wwf0;

    .line 267
    .line 268
    if-ne v3, v4, :cond_a

    .line 269
    .line 270
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 275
    .line 276
    add-int/2addr v1, v3

    .line 277
    goto :goto_5

    .line 278
    :goto_6
    int-to-float v3, v7

    .line 279
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    int-to-float v4, v1

    .line 284
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    int-to-float v5, v1

    .line 289
    iget-object v6, p0, Lv/smart_refresh/SmartRefreshLayout;->a1:Landroid/graphics/Paint;

    .line 290
    .line 291
    const/4 v2, 0x0

    .line 292
    move-object v1, p1

    .line 293
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 294
    .line 295
    .line 296
    move v1, v7

    .line 297
    :cond_c
    iget-boolean v3, p0, Lv/smart_refresh/SmartRefreshLayout;->E:Z

    .line 298
    .line 299
    if-eqz v3, :cond_d

    .line 300
    .line 301
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 302
    .line 303
    invoke-interface {v3}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    sget-object v4, Ll/wwf0;->f:Ll/wwf0;

    .line 308
    .line 309
    if-eq v3, v4, :cond_e

    .line 310
    .line 311
    :cond_d
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 312
    .line 313
    invoke-interface {v3}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 314
    .line 315
    .line 316
    move-result-object v3

    .line 317
    iget-boolean v3, v3, Ll/wwf0;->c:Z

    .line 318
    .line 319
    if-eqz v3, :cond_10

    .line 320
    .line 321
    :cond_e
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 322
    .line 323
    .line 324
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 325
    .line 326
    .line 327
    move-result v3

    .line 328
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    .line 329
    .line 330
    .line 331
    move-result v4

    .line 332
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 333
    .line 334
    .line 335
    move-result v5

    .line 336
    invoke-virtual {p1, v3, v1, v4, v5}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 337
    .line 338
    .line 339
    invoke-super/range {p0 .. p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 344
    .line 345
    .line 346
    return v0

    .line 347
    :cond_f
    :goto_7
    return v8

    .line 348
    :cond_10
    invoke-super/range {p0 .. p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    return v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Lv/smart_refresh/SmartRefreshLayout$m;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public getLayout()Landroid/view/ViewGroup;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    return-object p0
.end method

.method public getNestedScrollAxes()I
    .locals 0

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->L0:Ll/fi20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fi20;->a()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRefreshFooter()Ll/jvc0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 2
    .line 3
    instance-of v0, p0, Ll/jvc0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/jvc0;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getRefreshHeader()Ll/kvc0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kvc0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/kvc0;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getState()Lv/smart_refresh/constant/RefreshState;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(IILandroid/view/animation/Interpolator;I)Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq v0, p1, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    :cond_0
    iput-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 23
    .line 24
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 25
    .line 26
    filled-new-array {v0, p1}, [I

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    int-to-long v0, p4

    .line 37
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    new-instance p3, Lv/smart_refresh/SmartRefreshLayout$d;

    .line 48
    .line 49
    invoke-direct {p3, p0}, Lv/smart_refresh/SmartRefreshLayout$d;-><init>(Lv/smart_refresh/SmartRefreshLayout;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, p3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    new-instance p3, Lv/smart_refresh/SmartRefreshLayout$e;

    .line 58
    .line 59
    invoke-direct {p3, p0}, Lv/smart_refresh/SmartRefreshLayout$e;-><init>(Lv/smart_refresh/SmartRefreshLayout;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 66
    .line 67
    int-to-long p2, p2

    .line 68
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_1
    return-object v1
.end method

.method public i(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    cmpl-float v1, p1, v0

    .line 7
    .line 8
    if-lez v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 11
    .line 12
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 13
    .line 14
    if-eq v1, v2, :cond_0

    .line 15
    .line 16
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->TwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 17
    .line 18
    if-ne v1, v2, :cond_1

    .line 19
    .line 20
    :cond_0
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout$k;

    .line 21
    .line 22
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 23
    .line 24
    invoke-direct {v0, p0, p1, v1}, Lv/smart_refresh/SmartRefreshLayout$k;-><init>(Lv/smart_refresh/SmartRefreshLayout;FI)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    cmpg-float v0, p1, v0

    .line 31
    .line 32
    if-gez v0, :cond_4

    .line 33
    .line 34
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 35
    .line 36
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 37
    .line 38
    if-eq v0, v1, :cond_3

    .line 39
    .line 40
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_3

    .line 59
    .line 60
    :cond_2
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->L:Z

    .line 61
    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 65
    .line 66
    if-nez v0, :cond_4

    .line 67
    .line 68
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 77
    .line 78
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 79
    .line 80
    if-eq v0, v1, :cond_4

    .line 81
    .line 82
    :cond_3
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout$k;

    .line 83
    .line 84
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 85
    .line 86
    neg-int v1, v1

    .line 87
    invoke-direct {v0, p0, p1, v1}, Lv/smart_refresh/SmartRefreshLayout$k;-><init>(Lv/smart_refresh/SmartRefreshLayout;FI)V

    .line 88
    .line 89
    .line 90
    iput-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 91
    .line 92
    return-void

    .line 93
    :cond_4
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 94
    .line 95
    if-nez v0, :cond_5

    .line 96
    .line 97
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->J:Z

    .line 98
    .line 99
    if-eqz v0, :cond_5

    .line 100
    .line 101
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout$k;

    .line 102
    .line 103
    const/4 v1, 0x0

    .line 104
    invoke-direct {v0, p0, p1, v1}, Lv/smart_refresh/SmartRefreshLayout$k;-><init>(Lv/smart_refresh/SmartRefreshLayout;FI)V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 108
    .line 109
    :cond_5
    return-void
.end method

.method public isNestedScrollingEnabled()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-boolean p0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public j(IIFZ)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout$j;

    .line 20
    .line 21
    invoke-direct {v0, p0, p3, p2, p4}, Lv/smart_refresh/SmartRefreshLayout$j;-><init>(Lv/smart_refresh/SmartRefreshLayout;FIZ)V

    .line 22
    .line 23
    .line 24
    sget-object p2, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 27
    .line 28
    .line 29
    if-lez p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 32
    .line 33
    int-to-long p1, p1

    .line 34
    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 39
    .line 40
    .line 41
    :goto_0
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_1
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public k()Z
    .locals 4

    .line 1
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->f:I

    .line 2
    .line 3
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 4
    .line 5
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->V0:F

    .line 6
    .line 7
    add-float/2addr v1, v2

    .line 8
    const/high16 v2, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v1, v2

    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {p0, v3, v0, v1, v2}, Lv/smart_refresh/SmartRefreshLayout;->j(IIFZ)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public l()Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->k1:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/16 v0, 0x190

    .line 9
    .line 10
    :goto_0
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->f:I

    .line 11
    .line 12
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 13
    .line 14
    iget v4, p0, Lv/smart_refresh/SmartRefreshLayout;->U0:F

    .line 15
    .line 16
    add-float/2addr v3, v4

    .line 17
    const/high16 v4, 0x40000000    # 2.0f

    .line 18
    .line 19
    div-float/2addr v3, v4

    .line 20
    invoke-virtual {p0, v0, v2, v3, v1}, Lv/smart_refresh/SmartRefreshLayout;->m(IIFZ)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public m(IIFZ)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 16
    .line 17
    invoke-interface {v0}, Ll/hvc0;->i()V

    .line 18
    .line 19
    .line 20
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout$i;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3, p2, p4}, Lv/smart_refresh/SmartRefreshLayout$i;-><init>(Lv/smart_refresh/SmartRefreshLayout;FIZ)V

    .line 23
    .line 24
    .line 25
    sget-object p2, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 26
    .line 27
    invoke-virtual {p0, p2}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 28
    .line 29
    .line 30
    if-lez p1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 33
    .line 34
    int-to-long p1, p1

    .line 35
    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 40
    .line 41
    .line 42
    :goto_0
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_1
    const/4 p0, 0x0

    .line 45
    return p0
.end method

.method public n()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->k1:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/16 v0, 0x190

    .line 8
    .line 9
    :goto_0
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->f:I

    .line 10
    .line 11
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 12
    .line 13
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->U0:F

    .line 14
    .line 15
    add-float/2addr v2, v3

    .line 16
    const/high16 v3, 0x40000000    # 2.0f

    .line 17
    .line 18
    div-float/2addr v2, v3

    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-virtual {p0, v0, v1, v2, v3}, Lv/smart_refresh/SmartRefreshLayout;->m(IIFZ)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public o()Ll/mvc0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->r(Z)Ll/mvc0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public onAttachedToWindow()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->k1:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_c

    .line 12
    .line 13
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    sget-object v1, Lv/smart_refresh/SmartRefreshLayout;->r1:Ll/trd;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v1, v2, p0}, Ll/trd;->a(Landroid/content/Context;Ll/mvc0;)Ll/kvc0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->S(Ll/kvc0;)Ll/mvc0;

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-string p0, "DefaultRefreshHeaderCreator can not return null"

    .line 36
    .line 37
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    :goto_0
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    if-nez v1, :cond_3

    .line 45
    .line 46
    sget-object v0, Lv/smart_refresh/SmartRefreshLayout;->q1:Ll/srd;

    .line 47
    .line 48
    if-eqz v0, :cond_6

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v0, v1, p0}, Ll/srd;->a(Landroid/content/Context;Ll/mvc0;)Ll/jvc0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->Q(Ll/jvc0;)Ll/mvc0;

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_2
    const-string p0, "DefaultRefreshFooterCreator can not return null"

    .line 65
    .line 66
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 71
    .line 72
    if-nez v1, :cond_5

    .line 73
    .line 74
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 75
    .line 76
    if-nez v1, :cond_4

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_4
    move v0, v2

    .line 80
    :cond_5
    :goto_1
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 81
    .line 82
    :cond_6
    :goto_2
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 83
    .line 84
    if-nez v0, :cond_a

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    move v1, v2

    .line 91
    :goto_3
    if-ge v1, v0, :cond_a

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    iget-object v4, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 98
    .line 99
    if-eqz v4, :cond_7

    .line 100
    .line 101
    invoke-interface {v4}, Ll/gvc0;->getView()Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    if-eq v3, v4, :cond_9

    .line 106
    .line 107
    :cond_7
    iget-object v4, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 108
    .line 109
    if-eqz v4, :cond_8

    .line 110
    .line 111
    invoke-interface {v4}, Ll/gvc0;->getView()Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    if-eq v3, v4, :cond_9

    .line 116
    .line 117
    :cond_8
    new-instance v4, Ll/ivc0;

    .line 118
    .line 119
    invoke-direct {v4, v3}, Ll/ivc0;-><init>(Landroid/view/View;)V

    .line 120
    .line 121
    .line 122
    iput-object v4, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 123
    .line 124
    :cond_9
    add-int/lit8 v1, v1, 0x1

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_a
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 128
    .line 129
    if-nez v0, :cond_b

    .line 130
    .line 131
    const/high16 v0, 0x41a00000    # 20.0f

    .line 132
    .line 133
    invoke-static {v0}, Ll/rsf0;->c(F)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    new-instance v3, Landroid/widget/TextView;

    .line 138
    .line 139
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    invoke-direct {v3, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 144
    .line 145
    .line 146
    const v4, -0x9a00

    .line 147
    .line 148
    .line 149
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 150
    .line 151
    .line 152
    const/16 v4, 0x11

    .line 153
    .line 154
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 158
    .line 159
    .line 160
    const-string v0, "The content view in SmartRefreshLayout is empty"

    .line 161
    .line 162
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout$m;

    .line 166
    .line 167
    const/4 v4, -0x1

    .line 168
    invoke-direct {v0, v4, v4}, Lv/smart_refresh/SmartRefreshLayout$m;-><init>(II)V

    .line 169
    .line 170
    .line 171
    invoke-super {p0, v3, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 172
    .line 173
    .line 174
    new-instance v0, Ll/ivc0;

    .line 175
    .line 176
    invoke-direct {v0, v3}, Ll/ivc0;-><init>(Landroid/view/View;)V

    .line 177
    .line 178
    .line 179
    iput-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 180
    .line 181
    invoke-interface {v0}, Ll/hvc0;->getView()Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 186
    .line 187
    .line 188
    :cond_b
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->q:I

    .line 189
    .line 190
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->r:I

    .line 195
    .line 196
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 201
    .line 202
    iget-object v4, p0, Lv/smart_refresh/SmartRefreshLayout;->G0:Ll/xde0;

    .line 203
    .line 204
    invoke-interface {v3, v4}, Ll/hvc0;->f(Ll/xde0;)V

    .line 205
    .line 206
    .line 207
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 208
    .line 209
    iget-boolean v4, p0, Lv/smart_refresh/SmartRefreshLayout;->P:Z

    .line 210
    .line 211
    invoke-interface {v3, v4}, Ll/hvc0;->b(Z)V

    .line 212
    .line 213
    .line 214
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 215
    .line 216
    iget-object v4, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 217
    .line 218
    invoke-interface {v3, v4, v0, v1}, Ll/hvc0;->d(Ll/lvc0;Landroid/view/View;Landroid/view/View;)V

    .line 219
    .line 220
    .line 221
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 222
    .line 223
    if-eqz v0, :cond_c

    .line 224
    .line 225
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 226
    .line 227
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 228
    .line 229
    .line 230
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 231
    .line 232
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 233
    .line 234
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->s:I

    .line 235
    .line 236
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->t:I

    .line 237
    .line 238
    invoke-interface {v0, v2, v1, v3}, Ll/hvc0;->e(III)V

    .line 239
    .line 240
    .line 241
    :cond_c
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->A:[I

    .line 242
    .line 243
    if-eqz v0, :cond_e

    .line 244
    .line 245
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 246
    .line 247
    if-eqz v1, :cond_d

    .line 248
    .line 249
    invoke-interface {v1, v0}, Ll/gvc0;->setPrimaryColors([I)V

    .line 250
    .line 251
    .line 252
    :cond_d
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 253
    .line 254
    if-eqz v0, :cond_e

    .line 255
    .line 256
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->A:[I

    .line 257
    .line 258
    invoke-interface {v0, v1}, Ll/gvc0;->setPrimaryColors([I)V

    .line 259
    .line 260
    .line 261
    :cond_e
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 262
    .line 263
    if-eqz v0, :cond_f

    .line 264
    .line 265
    invoke-interface {v0}, Ll/hvc0;->getView()Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-super {p0, v0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 270
    .line 271
    .line 272
    :cond_f
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 273
    .line 274
    if-eqz v0, :cond_10

    .line 275
    .line 276
    invoke-interface {v0}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    iget-boolean v0, v0, Ll/wwf0;->b:Z

    .line 281
    .line 282
    if-eqz v0, :cond_10

    .line 283
    .line 284
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 285
    .line 286
    invoke-interface {v0}, Ll/gvc0;->getView()Landroid/view/View;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-super {p0, v0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 291
    .line 292
    .line 293
    :cond_10
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 294
    .line 295
    if-eqz v0, :cond_11

    .line 296
    .line 297
    invoke-interface {v0}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    iget-boolean v0, v0, Ll/wwf0;->b:Z

    .line 302
    .line 303
    if-eqz v0, :cond_11

    .line 304
    .line 305
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 306
    .line 307
    invoke-interface {v0}, Ll/gvc0;->getView()Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    invoke-super {p0, v0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 312
    .line 313
    .line 314
    :cond_11
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->k1:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 12
    .line 13
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {v3}, Landroid/animation/Animator;->removeAllListeners()V

    .line 18
    .line 19
    .line 20
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 23
    .line 24
    .line 25
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    const-wide/16 v4, 0x0

    .line 28
    .line 29
    invoke-virtual {v3, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->cancel()V

    .line 35
    .line 36
    .line 37
    iput-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    :cond_0
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 40
    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    iget-object v4, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 44
    .line 45
    sget-object v5, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 46
    .line 47
    if-ne v4, v5, :cond_1

    .line 48
    .line 49
    invoke-interface {v3, p0, v0}, Ll/gvc0;->h(Ll/mvc0;Z)I

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 53
    .line 54
    if-eqz v3, :cond_2

    .line 55
    .line 56
    iget-object v4, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 57
    .line 58
    sget-object v5, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 59
    .line 60
    if-ne v4, v5, :cond_2

    .line 61
    .line 62
    invoke-interface {v3, p0, v0}, Ll/gvc0;->h(Ll/mvc0;Z)I

    .line 63
    .line 64
    .line 65
    :cond_2
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 66
    .line 67
    if-eqz v3, :cond_3

    .line 68
    .line 69
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 70
    .line 71
    invoke-interface {v3, v0, v1}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 72
    .line 73
    .line 74
    :cond_3
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 75
    .line 76
    sget-object v3, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 77
    .line 78
    if-eq v1, v3, :cond_4

    .line 79
    .line 80
    invoke-virtual {p0, v3}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 81
    .line 82
    .line 83
    :cond_4
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 84
    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    :cond_5
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 91
    .line 92
    return-void
.end method

.method public onFinishInflate()V
    .locals 11

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x3

    .line 9
    if-gt v0, v1, :cond_11

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    move v5, v2

    .line 14
    move v4, v3

    .line 15
    move v6, v4

    .line 16
    :goto_0
    const/4 v7, 0x2

    .line 17
    const/4 v8, 0x1

    .line 18
    if-ge v4, v0, :cond_4

    .line 19
    .line 20
    invoke-super {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v9

    .line 24
    invoke-static {v9}, Ll/rsf0;->e(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    move-result v10

    .line 28
    if-eqz v10, :cond_1

    .line 29
    .line 30
    if-lt v6, v7, :cond_0

    .line 31
    .line 32
    if-ne v4, v8, :cond_1

    .line 33
    .line 34
    :cond_0
    move v5, v4

    .line 35
    move v6, v7

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    instance-of v7, v9, Ll/gvc0;

    .line 38
    .line 39
    if-nez v7, :cond_3

    .line 40
    .line 41
    if-ge v6, v8, :cond_3

    .line 42
    .line 43
    if-lez v4, :cond_2

    .line 44
    .line 45
    move v6, v8

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    move v6, v3

    .line 48
    :goto_1
    move v5, v4

    .line 49
    :cond_3
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_4
    if-ltz v5, :cond_7

    .line 53
    .line 54
    new-instance v4, Ll/ivc0;

    .line 55
    .line 56
    invoke-super {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    invoke-direct {v4, v6}, Ll/ivc0;-><init>(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    iput-object v4, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 64
    .line 65
    if-ne v5, v8, :cond_6

    .line 66
    .line 67
    if-ne v0, v1, :cond_5

    .line 68
    .line 69
    :goto_3
    move v1, v3

    .line 70
    goto :goto_4

    .line 71
    :cond_5
    move v7, v2

    .line 72
    goto :goto_3

    .line 73
    :cond_6
    if-ne v0, v7, :cond_7

    .line 74
    .line 75
    move v1, v2

    .line 76
    move v7, v8

    .line 77
    goto :goto_4

    .line 78
    :cond_7
    move v1, v2

    .line 79
    move v7, v1

    .line 80
    :goto_4
    move v4, v3

    .line 81
    :goto_5
    if-ge v4, v0, :cond_10

    .line 82
    .line 83
    invoke-super {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    if-eq v4, v1, :cond_d

    .line 88
    .line 89
    if-eq v4, v7, :cond_8

    .line 90
    .line 91
    if-ne v1, v2, :cond_8

    .line 92
    .line 93
    iget-object v6, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 94
    .line 95
    if-nez v6, :cond_8

    .line 96
    .line 97
    instance-of v6, v5, Ll/kvc0;

    .line 98
    .line 99
    if-eqz v6, :cond_8

    .line 100
    .line 101
    goto :goto_9

    .line 102
    :cond_8
    if-eq v4, v7, :cond_9

    .line 103
    .line 104
    if-ne v7, v2, :cond_f

    .line 105
    .line 106
    instance-of v6, v5, Ll/jvc0;

    .line 107
    .line 108
    if-eqz v6, :cond_f

    .line 109
    .line 110
    :cond_9
    iget-boolean v6, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 111
    .line 112
    if-nez v6, :cond_b

    .line 113
    .line 114
    iget-boolean v6, p0, Lv/smart_refresh/SmartRefreshLayout;->V:Z

    .line 115
    .line 116
    if-nez v6, :cond_a

    .line 117
    .line 118
    goto :goto_6

    .line 119
    :cond_a
    move v6, v3

    .line 120
    goto :goto_7

    .line 121
    :cond_b
    :goto_6
    move v6, v8

    .line 122
    :goto_7
    iput-boolean v6, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 123
    .line 124
    instance-of v6, v5, Ll/jvc0;

    .line 125
    .line 126
    if-eqz v6, :cond_c

    .line 127
    .line 128
    check-cast v5, Ll/jvc0;

    .line 129
    .line 130
    goto :goto_8

    .line 131
    :cond_c
    new-instance v6, Lv/smart_refresh/wrapper/RefreshFooterWrapper;

    .line 132
    .line 133
    invoke-direct {v6, v5}, Lv/smart_refresh/wrapper/RefreshFooterWrapper;-><init>(Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    move-object v5, v6

    .line 137
    :goto_8
    iput-object v5, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 138
    .line 139
    goto :goto_b

    .line 140
    :cond_d
    :goto_9
    instance-of v6, v5, Ll/kvc0;

    .line 141
    .line 142
    if-eqz v6, :cond_e

    .line 143
    .line 144
    check-cast v5, Ll/kvc0;

    .line 145
    .line 146
    goto :goto_a

    .line 147
    :cond_e
    new-instance v6, Lv/smart_refresh/wrapper/RefreshHeaderWrapper;

    .line 148
    .line 149
    invoke-direct {v6, v5}, Lv/smart_refresh/wrapper/RefreshHeaderWrapper;-><init>(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    move-object v5, v6

    .line 153
    :goto_a
    iput-object v5, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 154
    .line 155
    :cond_f
    :goto_b
    add-int/lit8 v4, v4, 0x1

    .line 156
    .line 157
    goto :goto_5

    .line 158
    :cond_10
    return-void

    .line 159
    :cond_11
    const-string p0, "\u6700\u591a\u53ea\u652f\u63013\u4e2a\u5b50View\uff0cMost only support three sub view"

    .line 160
    .line 161
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 10
    .line 11
    .line 12
    invoke-super {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    const/4 p4, 0x0

    .line 17
    move p5, p4

    .line 18
    :goto_0
    if-ge p5, p3, :cond_13

    .line 19
    .line 20
    invoke-super {p0, p5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/16 v2, 0x8

    .line 29
    .line 30
    if-eq v1, v2, :cond_12

    .line 31
    .line 32
    sget v1, Ll/vcc0;->J0:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "GONE"

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    goto/16 :goto_c

    .line 47
    .line 48
    :cond_0
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    if-eqz v1, :cond_4

    .line 52
    .line 53
    invoke-interface {v1}, Ll/hvc0;->getView()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    if-ne v1, v0, :cond_4

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->I:Z

    .line 66
    .line 67
    if-eqz v1, :cond_1

    .line 68
    .line 69
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 70
    .line 71
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_1

    .line 76
    .line 77
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 78
    .line 79
    if-eqz v1, :cond_1

    .line 80
    .line 81
    move v1, v2

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    move v1, p4

    .line 84
    :goto_1
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 85
    .line 86
    invoke-interface {v3}, Ll/hvc0;->getView()Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    instance-of v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 95
    .line 96
    if-eqz v5, :cond_2

    .line 97
    .line 98
    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_2
    sget-object v4, Lv/smart_refresh/SmartRefreshLayout;->t1:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 102
    .line 103
    :goto_2
    iget v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 104
    .line 105
    add-int/2addr v5, p1

    .line 106
    iget v4, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 107
    .line 108
    add-int/2addr v4, p2

    .line 109
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    add-int/2addr v6, v5

    .line 114
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 115
    .line 116
    .line 117
    move-result v7

    .line 118
    add-int/2addr v7, v4

    .line 119
    if-eqz v1, :cond_3

    .line 120
    .line 121
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->F:Z

    .line 122
    .line 123
    iget-object v8, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 124
    .line 125
    invoke-virtual {p0, v1, v8}, Lv/smart_refresh/SmartRefreshLayout;->A(ZLl/gvc0;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_3

    .line 130
    .line 131
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 132
    .line 133
    add-int/2addr v4, v1

    .line 134
    add-int/2addr v7, v1

    .line 135
    :cond_3
    invoke-virtual {v3, v5, v4, v6, v7}, Landroid/view/View;->layout(IIII)V

    .line 136
    .line 137
    .line 138
    :cond_4
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 139
    .line 140
    if-eqz v1, :cond_8

    .line 141
    .line 142
    invoke-interface {v1}, Ll/gvc0;->getView()Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    if-ne v1, v0, :cond_8

    .line 147
    .line 148
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v1, :cond_5

    .line 153
    .line 154
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->I:Z

    .line 155
    .line 156
    if-eqz v1, :cond_5

    .line 157
    .line 158
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 159
    .line 160
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eqz v1, :cond_5

    .line 165
    .line 166
    move v1, v2

    .line 167
    goto :goto_3

    .line 168
    :cond_5
    move v1, p4

    .line 169
    :goto_3
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 170
    .line 171
    invoke-interface {v3}, Ll/gvc0;->getView()Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 176
    .line 177
    .line 178
    move-result-object v4

    .line 179
    instance-of v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 180
    .line 181
    if-eqz v5, :cond_6

    .line 182
    .line 183
    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_6
    sget-object v4, Lv/smart_refresh/SmartRefreshLayout;->t1:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 187
    .line 188
    :goto_4
    iget v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 189
    .line 190
    iget v4, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 191
    .line 192
    iget v6, p0, Lv/smart_refresh/SmartRefreshLayout;->Q0:I

    .line 193
    .line 194
    add-int/2addr v4, v6

    .line 195
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    add-int/2addr v6, v5

    .line 200
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 201
    .line 202
    .line 203
    move-result v7

    .line 204
    add-int/2addr v7, v4

    .line 205
    if-nez v1, :cond_7

    .line 206
    .line 207
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 208
    .line 209
    invoke-interface {v1}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    sget-object v8, Ll/wwf0;->d:Ll/wwf0;

    .line 214
    .line 215
    if-ne v1, v8, :cond_7

    .line 216
    .line 217
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 218
    .line 219
    sub-int/2addr v4, v1

    .line 220
    sub-int/2addr v7, v1

    .line 221
    :cond_7
    invoke-virtual {v3, v5, v4, v6, v7}, Landroid/view/View;->layout(IIII)V

    .line 222
    .line 223
    .line 224
    :cond_8
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 225
    .line 226
    if-eqz v1, :cond_12

    .line 227
    .line 228
    invoke-interface {v1}, Ll/gvc0;->getView()Landroid/view/View;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    if-ne v1, v0, :cond_12

    .line 233
    .line 234
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    if-eqz v0, :cond_9

    .line 239
    .line 240
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->I:Z

    .line 241
    .line 242
    if-eqz v0, :cond_9

    .line 243
    .line 244
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 245
    .line 246
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    if-eqz v0, :cond_9

    .line 251
    .line 252
    goto :goto_5

    .line 253
    :cond_9
    move v2, p4

    .line 254
    :goto_5
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 255
    .line 256
    invoke-interface {v0}, Ll/gvc0;->getView()Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    instance-of v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 265
    .line 266
    if-eqz v3, :cond_a

    .line 267
    .line 268
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 269
    .line 270
    goto :goto_6

    .line 271
    :cond_a
    sget-object v1, Lv/smart_refresh/SmartRefreshLayout;->t1:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 272
    .line 273
    :goto_6
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 274
    .line 275
    invoke-interface {v3}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 276
    .line 277
    .line 278
    move-result-object v3

    .line 279
    iget v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 280
    .line 281
    iget v5, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 282
    .line 283
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 284
    .line 285
    .line 286
    move-result v6

    .line 287
    add-int/2addr v5, v6

    .line 288
    iget v6, p0, Lv/smart_refresh/SmartRefreshLayout;->R0:I

    .line 289
    .line 290
    sub-int/2addr v5, v6

    .line 291
    iget-boolean v6, p0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 292
    .line 293
    if-eqz v6, :cond_c

    .line 294
    .line 295
    iget-boolean v6, p0, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 296
    .line 297
    if-eqz v6, :cond_c

    .line 298
    .line 299
    iget-boolean v6, p0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 300
    .line 301
    if-eqz v6, :cond_c

    .line 302
    .line 303
    iget-object v6, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 304
    .line 305
    if-eqz v6, :cond_c

    .line 306
    .line 307
    iget-object v6, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 308
    .line 309
    invoke-interface {v6}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 310
    .line 311
    .line 312
    move-result-object v6

    .line 313
    sget-object v7, Ll/wwf0;->d:Ll/wwf0;

    .line 314
    .line 315
    if-ne v6, v7, :cond_c

    .line 316
    .line 317
    iget-boolean v6, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 318
    .line 319
    invoke-virtual {p0, v6}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 320
    .line 321
    .line 322
    move-result v6

    .line 323
    if-eqz v6, :cond_c

    .line 324
    .line 325
    iget-object v5, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 326
    .line 327
    invoke-interface {v5}, Ll/hvc0;->getView()Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object v5

    .line 331
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 332
    .line 333
    .line 334
    move-result-object v6

    .line 335
    instance-of v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 336
    .line 337
    if-eqz v7, :cond_b

    .line 338
    .line 339
    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 340
    .line 341
    iget v6, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 342
    .line 343
    goto :goto_7

    .line 344
    :cond_b
    move v6, p4

    .line 345
    :goto_7
    add-int v7, p2, p2

    .line 346
    .line 347
    add-int/2addr v7, v6

    .line 348
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    .line 349
    .line 350
    .line 351
    move-result v5

    .line 352
    add-int/2addr v5, v7

    .line 353
    :cond_c
    sget-object v6, Ll/wwf0;->h:Ll/wwf0;

    .line 354
    .line 355
    if-ne v3, v6, :cond_d

    .line 356
    .line 357
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 358
    .line 359
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->R0:I

    .line 360
    .line 361
    sub-int v5, v1, v2

    .line 362
    .line 363
    goto :goto_b

    .line 364
    :cond_d
    if-nez v2, :cond_10

    .line 365
    .line 366
    sget-object v1, Ll/wwf0;->g:Ll/wwf0;

    .line 367
    .line 368
    if-eq v3, v1, :cond_10

    .line 369
    .line 370
    sget-object v1, Ll/wwf0;->f:Ll/wwf0;

    .line 371
    .line 372
    if-ne v3, v1, :cond_e

    .line 373
    .line 374
    goto :goto_a

    .line 375
    :cond_e
    iget-boolean v1, v3, Ll/wwf0;->c:Z

    .line 376
    .line 377
    if-eqz v1, :cond_11

    .line 378
    .line 379
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 380
    .line 381
    if-gez v1, :cond_11

    .line 382
    .line 383
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 384
    .line 385
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    if-eqz v1, :cond_f

    .line 390
    .line 391
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 392
    .line 393
    neg-int v1, v1

    .line 394
    goto :goto_8

    .line 395
    :cond_f
    move v1, p4

    .line 396
    :goto_8
    invoke-static {v1, p4}, Ljava/lang/Math;->max(II)I

    .line 397
    .line 398
    .line 399
    move-result v1

    .line 400
    :goto_9
    sub-int/2addr v5, v1

    .line 401
    goto :goto_b

    .line 402
    :cond_10
    :goto_a
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 403
    .line 404
    goto :goto_9

    .line 405
    :cond_11
    :goto_b
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 406
    .line 407
    .line 408
    move-result v1

    .line 409
    add-int/2addr v1, v4

    .line 410
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 411
    .line 412
    .line 413
    move-result v2

    .line 414
    add-int/2addr v2, v5

    .line 415
    invoke-virtual {v0, v4, v5, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 416
    .line 417
    .line 418
    :cond_12
    :goto_c
    add-int/lit8 p5, p5, 0x1

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :cond_13
    return-void
.end method

.method public onMeasure(II)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->isInEditMode()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->I:Z

    .line 14
    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v3, 0x0

    .line 20
    :goto_0
    invoke-super {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    const/4 v7, 0x0

    .line 25
    const/4 v8, 0x0

    .line 26
    const/4 v9, 0x0

    .line 27
    :goto_1
    if-ge v7, v6, :cond_24

    .line 28
    .line 29
    invoke-super {v0, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v10

    .line 33
    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    .line 34
    .line 35
    .line 36
    move-result v11

    .line 37
    const/16 v12, 0x8

    .line 38
    .line 39
    if-eq v11, v12, :cond_1

    .line 40
    .line 41
    sget v11, Ll/vcc0;->J0:I

    .line 42
    .line 43
    invoke-virtual {v10, v11}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v11

    .line 47
    const-string v12, "GONE"

    .line 48
    .line 49
    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v11

    .line 53
    if-eqz v11, :cond_2

    .line 54
    .line 55
    :cond_1
    move/from16 v17, v3

    .line 56
    .line 57
    const/4 v13, 0x0

    .line 58
    goto/16 :goto_15

    .line 59
    .line 60
    :cond_2
    iget-object v11, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 61
    .line 62
    if-eqz v11, :cond_f

    .line 63
    .line 64
    invoke-interface {v11}, Ll/gvc0;->getView()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v11

    .line 68
    if-ne v11, v10, :cond_f

    .line 69
    .line 70
    iget-object v11, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 71
    .line 72
    invoke-interface {v11}, Ll/gvc0;->getView()Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v11

    .line 76
    const/high16 v16, 0x41200000    # 10.0f

    .line 77
    .line 78
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 79
    .line 80
    .line 81
    move-result-object v12

    .line 82
    instance-of v13, v12, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 83
    .line 84
    if-eqz v13, :cond_3

    .line 85
    .line 86
    move-object v13, v12

    .line 87
    check-cast v13, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_3
    sget-object v13, Lv/smart_refresh/SmartRefreshLayout;->t1:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 91
    .line 92
    :goto_2
    iget v4, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 93
    .line 94
    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 95
    .line 96
    add-int/2addr v4, v14

    .line 97
    iget v14, v12, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 98
    .line 99
    invoke-static {v1, v4, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    iget v14, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 104
    .line 105
    iget-object v5, v0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 106
    .line 107
    iget v15, v5, Ll/t2e;->a:I

    .line 108
    .line 109
    move/from16 v17, v3

    .line 110
    .line 111
    sget-object v3, Ll/t2e;->i:Ll/t2e;

    .line 112
    .line 113
    iget v3, v3, Ll/t2e;->a:I

    .line 114
    .line 115
    if-ge v15, v3, :cond_8

    .line 116
    .line 117
    iget v3, v12, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 118
    .line 119
    if-lez v3, :cond_5

    .line 120
    .line 121
    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 122
    .line 123
    add-int/2addr v3, v14

    .line 124
    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 125
    .line 126
    add-int/2addr v3, v14

    .line 127
    sget-object v14, Ll/t2e;->g:Ll/t2e;

    .line 128
    .line 129
    invoke-virtual {v5, v14}, Ll/t2e;->a(Ll/t2e;)Z

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    if-eqz v5, :cond_4

    .line 134
    .line 135
    iget v5, v12, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 136
    .line 137
    iget v12, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 138
    .line 139
    add-int/2addr v5, v12

    .line 140
    iget v12, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 141
    .line 142
    add-int/2addr v5, v12

    .line 143
    iput v5, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 144
    .line 145
    iput-object v14, v0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 146
    .line 147
    :cond_4
    move v14, v3

    .line 148
    goto :goto_3

    .line 149
    :cond_5
    const/4 v5, -0x2

    .line 150
    if-ne v3, v5, :cond_8

    .line 151
    .line 152
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 153
    .line 154
    invoke-interface {v3}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    sget-object v5, Ll/wwf0;->h:Ll/wwf0;

    .line 159
    .line 160
    if-ne v3, v5, :cond_6

    .line 161
    .line 162
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 163
    .line 164
    iget-boolean v3, v3, Ll/t2e;->b:Z

    .line 165
    .line 166
    if-nez v3, :cond_8

    .line 167
    .line 168
    :cond_6
    invoke-static {v2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    iget v5, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 173
    .line 174
    sub-int/2addr v3, v5

    .line 175
    iget v5, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 176
    .line 177
    sub-int/2addr v3, v5

    .line 178
    const/4 v5, 0x0

    .line 179
    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    const/high16 v5, -0x80000000

    .line 184
    .line 185
    invoke-static {v3, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 186
    .line 187
    .line 188
    move-result v12

    .line 189
    invoke-virtual {v11, v4, v12}, Landroid/view/View;->measure(II)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    if-lez v5, :cond_8

    .line 197
    .line 198
    if-eq v5, v3, :cond_7

    .line 199
    .line 200
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 201
    .line 202
    sget-object v12, Ll/t2e;->e:Ll/t2e;

    .line 203
    .line 204
    invoke-virtual {v3, v12}, Ll/t2e;->a(Ll/t2e;)Z

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    if-eqz v3, :cond_7

    .line 209
    .line 210
    iget v3, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 211
    .line 212
    add-int/2addr v5, v3

    .line 213
    iget v3, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 214
    .line 215
    add-int/2addr v5, v3

    .line 216
    iput v5, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 217
    .line 218
    iput-object v12, v0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 219
    .line 220
    :cond_7
    const/4 v14, -0x1

    .line 221
    :cond_8
    :goto_3
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 222
    .line 223
    invoke-interface {v3}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    sget-object v5, Ll/wwf0;->h:Ll/wwf0;

    .line 228
    .line 229
    if-ne v3, v5, :cond_9

    .line 230
    .line 231
    invoke-static {v2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 232
    .line 233
    .line 234
    move-result v14

    .line 235
    const/4 v3, -0x1

    .line 236
    const/4 v5, 0x0

    .line 237
    goto :goto_7

    .line 238
    :cond_9
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 239
    .line 240
    invoke-interface {v3}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 241
    .line 242
    .line 243
    move-result-object v3

    .line 244
    iget-boolean v3, v3, Ll/wwf0;->c:Z

    .line 245
    .line 246
    if-eqz v3, :cond_b

    .line 247
    .line 248
    if-nez v17, :cond_b

    .line 249
    .line 250
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 251
    .line 252
    invoke-virtual {v0, v3}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    if-eqz v3, :cond_a

    .line 257
    .line 258
    iget v3, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 259
    .line 260
    :goto_4
    const/4 v5, 0x0

    .line 261
    goto :goto_5

    .line 262
    :cond_a
    const/4 v3, 0x0

    .line 263
    goto :goto_4

    .line 264
    :goto_5
    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    .line 265
    .line 266
    .line 267
    move-result v14

    .line 268
    :goto_6
    const/4 v3, -0x1

    .line 269
    goto :goto_7

    .line 270
    :cond_b
    const/4 v5, 0x0

    .line 271
    goto :goto_6

    .line 272
    :goto_7
    if-eq v14, v3, :cond_c

    .line 273
    .line 274
    iget v3, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 275
    .line 276
    sub-int/2addr v14, v3

    .line 277
    iget v3, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 278
    .line 279
    sub-int/2addr v14, v3

    .line 280
    invoke-static {v14, v5}, Ljava/lang/Math;->max(II)I

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    const/high16 v5, 0x40000000    # 2.0f

    .line 285
    .line 286
    invoke-static {v3, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 287
    .line 288
    .line 289
    move-result v3

    .line 290
    invoke-virtual {v11, v4, v3}, Landroid/view/View;->measure(II)V

    .line 291
    .line 292
    .line 293
    :cond_c
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 294
    .line 295
    iget-boolean v4, v3, Ll/t2e;->b:Z

    .line 296
    .line 297
    if-nez v4, :cond_e

    .line 298
    .line 299
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 300
    .line 301
    cmpg-float v5, v4, v16

    .line 302
    .line 303
    if-gez v5, :cond_d

    .line 304
    .line 305
    iget v5, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 306
    .line 307
    int-to-float v5, v5

    .line 308
    mul-float/2addr v4, v5

    .line 309
    :cond_d
    invoke-virtual {v3}, Ll/t2e;->b()Ll/t2e;

    .line 310
    .line 311
    .line 312
    move-result-object v3

    .line 313
    iput-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->N0:Ll/t2e;

    .line 314
    .line 315
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 316
    .line 317
    iget-object v5, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 318
    .line 319
    iget v12, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 320
    .line 321
    float-to-int v4, v4

    .line 322
    invoke-interface {v3, v5, v12, v4}, Ll/gvc0;->i(Ll/lvc0;II)V

    .line 323
    .line 324
    .line 325
    :cond_e
    if-eqz v17, :cond_10

    .line 326
    .line 327
    iget-boolean v3, v0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 328
    .line 329
    invoke-virtual {v0, v3}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 330
    .line 331
    .line 332
    move-result v3

    .line 333
    if-eqz v3, :cond_10

    .line 334
    .line 335
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    .line 336
    .line 337
    .line 338
    move-result v3

    .line 339
    add-int/2addr v8, v3

    .line 340
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    .line 341
    .line 342
    .line 343
    move-result v3

    .line 344
    add-int/2addr v9, v3

    .line 345
    goto :goto_8

    .line 346
    :cond_f
    move/from16 v17, v3

    .line 347
    .line 348
    const/high16 v16, 0x41200000    # 10.0f

    .line 349
    .line 350
    :cond_10
    :goto_8
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 351
    .line 352
    if-eqz v3, :cond_1c

    .line 353
    .line 354
    invoke-interface {v3}, Ll/gvc0;->getView()Landroid/view/View;

    .line 355
    .line 356
    .line 357
    move-result-object v3

    .line 358
    if-ne v3, v10, :cond_1c

    .line 359
    .line 360
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 361
    .line 362
    invoke-interface {v3}, Ll/gvc0;->getView()Landroid/view/View;

    .line 363
    .line 364
    .line 365
    move-result-object v3

    .line 366
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 367
    .line 368
    .line 369
    move-result-object v4

    .line 370
    instance-of v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 371
    .line 372
    if-eqz v5, :cond_11

    .line 373
    .line 374
    move-object v5, v4

    .line 375
    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 376
    .line 377
    goto :goto_9

    .line 378
    :cond_11
    sget-object v5, Lv/smart_refresh/SmartRefreshLayout;->t1:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 379
    .line 380
    :goto_9
    iget v11, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 381
    .line 382
    iget v12, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 383
    .line 384
    add-int/2addr v11, v12

    .line 385
    iget v12, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 386
    .line 387
    invoke-static {v1, v11, v12}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 388
    .line 389
    .line 390
    move-result v11

    .line 391
    iget v12, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 392
    .line 393
    iget-object v13, v0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 394
    .line 395
    iget v14, v13, Ll/t2e;->a:I

    .line 396
    .line 397
    sget-object v15, Ll/t2e;->i:Ll/t2e;

    .line 398
    .line 399
    iget v15, v15, Ll/t2e;->a:I

    .line 400
    .line 401
    if-ge v14, v15, :cond_15

    .line 402
    .line 403
    iget v14, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 404
    .line 405
    if-lez v14, :cond_12

    .line 406
    .line 407
    iget v12, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 408
    .line 409
    add-int/2addr v14, v12

    .line 410
    iget v12, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 411
    .line 412
    add-int/2addr v12, v14

    .line 413
    sget-object v14, Ll/t2e;->g:Ll/t2e;

    .line 414
    .line 415
    invoke-virtual {v13, v14}, Ll/t2e;->a(Ll/t2e;)Z

    .line 416
    .line 417
    .line 418
    move-result v13

    .line 419
    if-eqz v13, :cond_15

    .line 420
    .line 421
    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 422
    .line 423
    iget v13, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 424
    .line 425
    add-int/2addr v4, v13

    .line 426
    iget v13, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 427
    .line 428
    add-int/2addr v4, v13

    .line 429
    iput v4, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 430
    .line 431
    iput-object v14, v0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 432
    .line 433
    goto :goto_a

    .line 434
    :cond_12
    const/4 v4, -0x2

    .line 435
    if-ne v14, v4, :cond_15

    .line 436
    .line 437
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 438
    .line 439
    invoke-interface {v4}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 440
    .line 441
    .line 442
    move-result-object v4

    .line 443
    sget-object v13, Ll/wwf0;->h:Ll/wwf0;

    .line 444
    .line 445
    if-ne v4, v13, :cond_13

    .line 446
    .line 447
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 448
    .line 449
    iget-boolean v4, v4, Ll/t2e;->b:Z

    .line 450
    .line 451
    if-nez v4, :cond_15

    .line 452
    .line 453
    :cond_13
    invoke-static {v2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 454
    .line 455
    .line 456
    move-result v4

    .line 457
    iget v13, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 458
    .line 459
    sub-int/2addr v4, v13

    .line 460
    iget v13, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 461
    .line 462
    sub-int/2addr v4, v13

    .line 463
    const/4 v13, 0x0

    .line 464
    invoke-static {v4, v13}, Ljava/lang/Math;->max(II)I

    .line 465
    .line 466
    .line 467
    move-result v4

    .line 468
    const/high16 v13, -0x80000000

    .line 469
    .line 470
    invoke-static {v4, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 471
    .line 472
    .line 473
    move-result v13

    .line 474
    invoke-virtual {v3, v11, v13}, Landroid/view/View;->measure(II)V

    .line 475
    .line 476
    .line 477
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 478
    .line 479
    .line 480
    move-result v13

    .line 481
    if-lez v13, :cond_15

    .line 482
    .line 483
    if-eq v13, v4, :cond_14

    .line 484
    .line 485
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 486
    .line 487
    sget-object v12, Ll/t2e;->e:Ll/t2e;

    .line 488
    .line 489
    invoke-virtual {v4, v12}, Ll/t2e;->a(Ll/t2e;)Z

    .line 490
    .line 491
    .line 492
    move-result v4

    .line 493
    if-eqz v4, :cond_14

    .line 494
    .line 495
    iget v4, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 496
    .line 497
    add-int/2addr v13, v4

    .line 498
    iget v4, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 499
    .line 500
    add-int/2addr v13, v4

    .line 501
    iput v13, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 502
    .line 503
    iput-object v12, v0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 504
    .line 505
    :cond_14
    const/4 v12, -0x1

    .line 506
    :cond_15
    :goto_a
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 507
    .line 508
    invoke-interface {v4}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 509
    .line 510
    .line 511
    move-result-object v4

    .line 512
    sget-object v13, Ll/wwf0;->h:Ll/wwf0;

    .line 513
    .line 514
    if-ne v4, v13, :cond_16

    .line 515
    .line 516
    invoke-static {v2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 517
    .line 518
    .line 519
    move-result v12

    .line 520
    const/4 v4, -0x1

    .line 521
    const/4 v13, 0x0

    .line 522
    goto :goto_e

    .line 523
    :cond_16
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 524
    .line 525
    invoke-interface {v4}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 526
    .line 527
    .line 528
    move-result-object v4

    .line 529
    iget-boolean v4, v4, Ll/wwf0;->c:Z

    .line 530
    .line 531
    if-eqz v4, :cond_18

    .line 532
    .line 533
    if-nez v17, :cond_18

    .line 534
    .line 535
    iget-boolean v4, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 536
    .line 537
    invoke-virtual {v0, v4}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 538
    .line 539
    .line 540
    move-result v4

    .line 541
    if-eqz v4, :cond_17

    .line 542
    .line 543
    iget v4, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 544
    .line 545
    neg-int v4, v4

    .line 546
    :goto_b
    const/4 v13, 0x0

    .line 547
    goto :goto_c

    .line 548
    :cond_17
    const/4 v4, 0x0

    .line 549
    goto :goto_b

    .line 550
    :goto_c
    invoke-static {v13, v4}, Ljava/lang/Math;->max(II)I

    .line 551
    .line 552
    .line 553
    move-result v12

    .line 554
    :goto_d
    const/4 v4, -0x1

    .line 555
    goto :goto_e

    .line 556
    :cond_18
    const/4 v13, 0x0

    .line 557
    goto :goto_d

    .line 558
    :goto_e
    if-eq v12, v4, :cond_19

    .line 559
    .line 560
    iget v4, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 561
    .line 562
    sub-int/2addr v12, v4

    .line 563
    iget v4, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 564
    .line 565
    sub-int/2addr v12, v4

    .line 566
    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    .line 567
    .line 568
    .line 569
    move-result v4

    .line 570
    const/high16 v5, 0x40000000    # 2.0f

    .line 571
    .line 572
    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 573
    .line 574
    .line 575
    move-result v4

    .line 576
    invoke-virtual {v3, v11, v4}, Landroid/view/View;->measure(II)V

    .line 577
    .line 578
    .line 579
    :cond_19
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 580
    .line 581
    iget-boolean v5, v4, Ll/t2e;->b:Z

    .line 582
    .line 583
    if-nez v5, :cond_1b

    .line 584
    .line 585
    iget v5, v0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 586
    .line 587
    cmpg-float v11, v5, v16

    .line 588
    .line 589
    if-gez v11, :cond_1a

    .line 590
    .line 591
    iget v11, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 592
    .line 593
    int-to-float v11, v11

    .line 594
    mul-float/2addr v5, v11

    .line 595
    :cond_1a
    invoke-virtual {v4}, Ll/t2e;->b()Ll/t2e;

    .line 596
    .line 597
    .line 598
    move-result-object v4

    .line 599
    iput-object v4, v0, Lv/smart_refresh/SmartRefreshLayout;->P0:Ll/t2e;

    .line 600
    .line 601
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 602
    .line 603
    iget-object v11, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 604
    .line 605
    iget v12, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 606
    .line 607
    float-to-int v5, v5

    .line 608
    invoke-interface {v4, v11, v12, v5}, Ll/gvc0;->i(Ll/lvc0;II)V

    .line 609
    .line 610
    .line 611
    :cond_1b
    if-eqz v17, :cond_1d

    .line 612
    .line 613
    iget-boolean v4, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 614
    .line 615
    invoke-virtual {v0, v4}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 616
    .line 617
    .line 618
    move-result v4

    .line 619
    if-eqz v4, :cond_1d

    .line 620
    .line 621
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 622
    .line 623
    .line 624
    move-result v4

    .line 625
    add-int/2addr v8, v4

    .line 626
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 627
    .line 628
    .line 629
    move-result v3

    .line 630
    add-int/2addr v9, v3

    .line 631
    goto :goto_f

    .line 632
    :cond_1c
    const/4 v13, 0x0

    .line 633
    :cond_1d
    :goto_f
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 634
    .line 635
    if-eqz v3, :cond_23

    .line 636
    .line 637
    invoke-interface {v3}, Ll/hvc0;->getView()Landroid/view/View;

    .line 638
    .line 639
    .line 640
    move-result-object v3

    .line 641
    if-ne v3, v10, :cond_23

    .line 642
    .line 643
    iget-object v3, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 644
    .line 645
    invoke-interface {v3}, Ll/hvc0;->getView()Landroid/view/View;

    .line 646
    .line 647
    .line 648
    move-result-object v3

    .line 649
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 650
    .line 651
    .line 652
    move-result-object v4

    .line 653
    instance-of v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 654
    .line 655
    if-eqz v5, :cond_1e

    .line 656
    .line 657
    move-object v5, v4

    .line 658
    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 659
    .line 660
    goto :goto_10

    .line 661
    :cond_1e
    sget-object v5, Lv/smart_refresh/SmartRefreshLayout;->t1:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 662
    .line 663
    :goto_10
    iget-object v10, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 664
    .line 665
    if-eqz v10, :cond_1f

    .line 666
    .line 667
    iget-boolean v10, v0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 668
    .line 669
    invoke-virtual {v0, v10}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 670
    .line 671
    .line 672
    move-result v10

    .line 673
    if-eqz v10, :cond_1f

    .line 674
    .line 675
    iget-boolean v10, v0, Lv/smart_refresh/SmartRefreshLayout;->F:Z

    .line 676
    .line 677
    iget-object v11, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 678
    .line 679
    invoke-virtual {v0, v10, v11}, Lv/smart_refresh/SmartRefreshLayout;->A(ZLl/gvc0;)Z

    .line 680
    .line 681
    .line 682
    move-result v10

    .line 683
    if-eqz v10, :cond_1f

    .line 684
    .line 685
    const/4 v10, 0x1

    .line 686
    goto :goto_11

    .line 687
    :cond_1f
    move v10, v13

    .line 688
    :goto_11
    iget-object v11, v0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 689
    .line 690
    if-eqz v11, :cond_20

    .line 691
    .line 692
    iget-boolean v11, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 693
    .line 694
    invoke-virtual {v0, v11}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 695
    .line 696
    .line 697
    move-result v11

    .line 698
    if-eqz v11, :cond_20

    .line 699
    .line 700
    iget-boolean v11, v0, Lv/smart_refresh/SmartRefreshLayout;->G:Z

    .line 701
    .line 702
    iget-object v12, v0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 703
    .line 704
    invoke-virtual {v0, v11, v12}, Lv/smart_refresh/SmartRefreshLayout;->A(ZLl/gvc0;)Z

    .line 705
    .line 706
    .line 707
    move-result v11

    .line 708
    if-eqz v11, :cond_20

    .line 709
    .line 710
    const/4 v11, 0x1

    .line 711
    goto :goto_12

    .line 712
    :cond_20
    move v11, v13

    .line 713
    :goto_12
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 714
    .line 715
    .line 716
    move-result v12

    .line 717
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 718
    .line 719
    .line 720
    move-result v14

    .line 721
    add-int/2addr v12, v14

    .line 722
    iget v14, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 723
    .line 724
    add-int/2addr v12, v14

    .line 725
    iget v14, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 726
    .line 727
    add-int/2addr v12, v14

    .line 728
    iget v14, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 729
    .line 730
    invoke-static {v1, v12, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 731
    .line 732
    .line 733
    move-result v12

    .line 734
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 735
    .line 736
    .line 737
    move-result v14

    .line 738
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 739
    .line 740
    .line 741
    move-result v15

    .line 742
    add-int/2addr v14, v15

    .line 743
    iget v15, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 744
    .line 745
    add-int/2addr v14, v15

    .line 746
    iget v15, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 747
    .line 748
    add-int/2addr v14, v15

    .line 749
    if-eqz v17, :cond_21

    .line 750
    .line 751
    if-eqz v10, :cond_21

    .line 752
    .line 753
    iget v10, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 754
    .line 755
    goto :goto_13

    .line 756
    :cond_21
    move v10, v13

    .line 757
    :goto_13
    add-int/2addr v14, v10

    .line 758
    if-eqz v17, :cond_22

    .line 759
    .line 760
    if-eqz v11, :cond_22

    .line 761
    .line 762
    iget v10, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 763
    .line 764
    goto :goto_14

    .line 765
    :cond_22
    move v10, v13

    .line 766
    :goto_14
    add-int/2addr v14, v10

    .line 767
    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 768
    .line 769
    invoke-static {v2, v14, v4}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 770
    .line 771
    .line 772
    move-result v4

    .line 773
    invoke-virtual {v3, v12, v4}, Landroid/view/View;->measure(II)V

    .line 774
    .line 775
    .line 776
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 777
    .line 778
    .line 779
    move-result v4

    .line 780
    iget v10, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 781
    .line 782
    add-int/2addr v4, v10

    .line 783
    iget v10, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 784
    .line 785
    add-int/2addr v4, v10

    .line 786
    add-int/2addr v8, v4

    .line 787
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 788
    .line 789
    .line 790
    move-result v3

    .line 791
    iget v4, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 792
    .line 793
    add-int/2addr v3, v4

    .line 794
    iget v4, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 795
    .line 796
    add-int/2addr v3, v4

    .line 797
    add-int/2addr v9, v3

    .line 798
    :cond_23
    :goto_15
    add-int/lit8 v7, v7, 0x1

    .line 799
    .line 800
    move/from16 v3, v17

    .line 801
    .line 802
    goto/16 :goto_1

    .line 803
    .line 804
    :cond_24
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 805
    .line 806
    .line 807
    move-result v3

    .line 808
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 809
    .line 810
    .line 811
    move-result v4

    .line 812
    add-int/2addr v3, v4

    .line 813
    add-int/2addr v8, v3

    .line 814
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 815
    .line 816
    .line 817
    move-result v3

    .line 818
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 819
    .line 820
    .line 821
    move-result v4

    .line 822
    add-int/2addr v3, v4

    .line 823
    add-int/2addr v9, v3

    .line 824
    invoke-super {v0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    .line 825
    .line 826
    .line 827
    move-result v3

    .line 828
    invoke-static {v8, v3}, Ljava/lang/Math;->max(II)I

    .line 829
    .line 830
    .line 831
    move-result v3

    .line 832
    invoke-static {v3, v1}, Landroid/view/View;->resolveSize(II)I

    .line 833
    .line 834
    .line 835
    move-result v1

    .line 836
    invoke-super {v0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    .line 837
    .line 838
    .line 839
    move-result v3

    .line 840
    invoke-static {v9, v3}, Ljava/lang/Math;->max(II)I

    .line 841
    .line 842
    .line 843
    move-result v3

    .line 844
    invoke-static {v3, v2}, Landroid/view/View;->resolveSize(II)I

    .line 845
    .line 846
    .line 847
    move-result v2

    .line 848
    invoke-super {v0, v1, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 849
    .line 850
    .line 851
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 852
    .line 853
    .line 854
    move-result v1

    .line 855
    int-to-float v1, v1

    .line 856
    const/high16 v2, 0x40000000    # 2.0f

    .line 857
    .line 858
    div-float/2addr v1, v2

    .line 859
    iput v1, v0, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 860
    .line 861
    return-void
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->K0:Ll/bi20;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p3, p4}, Ll/bi20;->a(FFZ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    cmpl-float p1, p3, p1

    .line 7
    .line 8
    if-gtz p1, :cond_2

    .line 9
    .line 10
    :cond_0
    neg-float p1, p3

    .line 11
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->U(F)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->K0:Ll/bi20;

    .line 18
    .line 19
    invoke-virtual {p0, p2, p3}, Ll/bi20;->b(FF)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public onNestedPreScroll(Landroid/view/View;II[I)V
    .locals 3
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget p1, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 2
    .line 3
    mul-int v0, p3, p1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_1

    .line 7
    .line 8
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 13
    .line 14
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 19
    .line 20
    if-le p1, v0, :cond_0

    .line 21
    .line 22
    iput v1, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 23
    .line 24
    move v1, v2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sub-int/2addr v2, p3

    .line 27
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 28
    .line 29
    move v1, p3

    .line 30
    :goto_0
    iget p1, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 31
    .line 32
    int-to-float p1, p1

    .line 33
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->C(F)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    if-lez p3, :cond_2

    .line 38
    .line 39
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    sub-int/2addr p1, p3

    .line 44
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 45
    .line 46
    int-to-float p1, p1

    .line 47
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->C(F)V

    .line 48
    .line 49
    .line 50
    move v1, p3

    .line 51
    :cond_2
    :goto_1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->K0:Ll/bi20;

    .line 52
    .line 53
    sub-int/2addr p3, v1

    .line 54
    const/4 p1, 0x0

    .line 55
    invoke-virtual {p0, p2, p3, p4, p1}, Ll/bi20;->c(II[I[I)Z

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    aget p1, p4, p0

    .line 60
    .line 61
    add-int/2addr p1, v1

    .line 62
    aput p1, p4, p0

    .line 63
    .line 64
    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .locals 6
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->K0:Ll/bi20;

    .line 2
    .line 3
    iget-object v5, p0, Lv/smart_refresh/SmartRefreshLayout;->J0:[I

    .line 4
    .line 5
    move v1, p2

    .line 6
    move v2, p3

    .line 7
    move v3, p4

    .line 8
    move v4, p5

    .line 9
    invoke-virtual/range {v0 .. v5}, Ll/bi20;->f(IIII[I)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->J0:[I

    .line 14
    .line 15
    const/4 p3, 0x1

    .line 16
    aget p2, p2, p3

    .line 17
    .line 18
    add-int p5, v4, p2

    .line 19
    .line 20
    if-gez p5, :cond_1

    .line 21
    .line 22
    iget-boolean p2, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 23
    .line 24
    if-nez p2, :cond_0

    .line 25
    .line 26
    iget-boolean p2, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    :cond_0
    iget p2, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 31
    .line 32
    if-nez p2, :cond_3

    .line 33
    .line 34
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->G0:Ll/xde0;

    .line 35
    .line 36
    if-eqz p2, :cond_3

    .line 37
    .line 38
    iget-object p4, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 39
    .line 40
    invoke-interface {p4}, Ll/hvc0;->getView()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p4

    .line 44
    invoke-interface {p2, p4}, Ll/xde0;->b(Landroid/view/View;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-nez p2, :cond_3

    .line 49
    .line 50
    :cond_1
    if-lez p5, :cond_7

    .line 51
    .line 52
    iget-boolean p2, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 53
    .line 54
    if-nez p2, :cond_2

    .line 55
    .line 56
    iget-boolean p2, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 57
    .line 58
    if-eqz p2, :cond_7

    .line 59
    .line 60
    :cond_2
    iget p2, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 61
    .line 62
    if-nez p2, :cond_3

    .line 63
    .line 64
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->G0:Ll/xde0;

    .line 65
    .line 66
    if-eqz p2, :cond_3

    .line 67
    .line 68
    iget-object p4, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 69
    .line 70
    invoke-interface {p4}, Ll/hvc0;->getView()Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p4

    .line 74
    invoke-interface {p2, p4}, Ll/xde0;->a(Landroid/view/View;)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-eqz p2, :cond_7

    .line 79
    .line 80
    :cond_3
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 81
    .line 82
    sget-object p4, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 83
    .line 84
    if-eq p2, p4, :cond_4

    .line 85
    .line 86
    iget-boolean p2, p2, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 87
    .line 88
    if-eqz p2, :cond_6

    .line 89
    .line 90
    :cond_4
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 91
    .line 92
    if-lez p5, :cond_5

    .line 93
    .line 94
    sget-object p4, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_5
    sget-object p4, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 98
    .line 99
    :goto_0
    invoke-interface {p2, p4}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 100
    .line 101
    .line 102
    if-nez p1, :cond_6

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    if-eqz p1, :cond_6

    .line 109
    .line 110
    invoke-interface {p1, p3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 111
    .line 112
    .line 113
    :cond_6
    iget p1, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 114
    .line 115
    sub-int/2addr p1, p5

    .line 116
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 117
    .line 118
    int-to-float p1, p1

    .line 119
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->C(F)V

    .line 120
    .line 121
    .line 122
    :cond_7
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 123
    .line 124
    if-eqz p1, :cond_8

    .line 125
    .line 126
    if-gez v2, :cond_8

    .line 127
    .line 128
    const/4 p1, 0x0

    .line 129
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 130
    .line 131
    :cond_8
    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->L0:Ll/fi20;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ll/fi20;->b(Landroid/view/View;Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->K0:Ll/bi20;

    .line 7
    .line 8
    and-int/lit8 p2, p3, 0x2

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Ll/bi20;->p(I)Z

    .line 11
    .line 12
    .line 13
    iget p1, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 14
    .line 15
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->I0:Z

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->y(I)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->isNestedScrollingEnabled()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    and-int/lit8 p1, p3, 0x2

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->K:Z

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 22
    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    iget-boolean p0, p0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    :cond_0
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->L0:Ll/fi20;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/fi20;->d(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->I0:Z

    .line 8
    .line 9
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 10
    .line 11
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->E()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->K0:Ll/bi20;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/bi20;->r()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public p(I)Ll/mvc0;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->q(IZZ)Ll/mvc0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q(IZZ)Ll/mvc0;
    .locals 4

    .line 1
    shr-int/lit8 v0, p1, 0x10

    .line 2
    .line 3
    shl-int/lit8 p1, p1, 0x10

    .line 4
    .line 5
    shr-int/lit8 p1, p1, 0x10

    .line 6
    .line 7
    new-instance v1, Lv/smart_refresh/SmartRefreshLayout$h;

    .line 8
    .line 9
    invoke-direct {v1, p0, v0, p3, p2}, Lv/smart_refresh/SmartRefreshLayout$h;-><init>(Lv/smart_refresh/SmartRefreshLayout;IZZ)V

    .line 10
    .line 11
    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 15
    .line 16
    int-to-long v2, p1

    .line 17
    invoke-virtual {p2, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public r(Z)Ll/mvc0;
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lv/smart_refresh/SmartRefreshLayout;->f1:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    long-to-int v0, v0

    .line 12
    const/16 v1, 0x12c

    .line 13
    .line 14
    rsub-int v0, v0, 0x12c

    .line 15
    .line 16
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    shl-int/lit8 v0, v0, 0x10

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v0, v2

    .line 28
    :goto_0
    invoke-virtual {p0, v0, p1, v2}, Lv/smart_refresh/SmartRefreshLayout;->q(IZZ)Ll/mvc0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/hvc0;->h()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/kkl0;->Q(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p:Z

    .line 14
    .line 15
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public s()Ll/mvc0;
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lv/smart_refresh/SmartRefreshLayout;->f1:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    long-to-int v0, v0

    .line 9
    const/16 v1, 0x12c

    .line 10
    .line 11
    rsub-int v0, v0, 0x12c

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    shl-int/lit8 v0, v0, 0x10

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {p0, v0, v1, v1}, Lv/smart_refresh/SmartRefreshLayout;->q(IZZ)Ll/mvc0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public setNestedScrollingEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/smart_refresh/SmartRefreshLayout;->Q:Z

    .line 2
    .line 3
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->K0:Ll/bi20;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/bi20;->n(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setStateDirectLoading(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    if-eq v0, v1, :cond_6

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    iput-wide v2, p0, Lv/smart_refresh/SmartRefreshLayout;->f1:J

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->E0:Ll/tm50;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-interface {v0, p0}, Ll/tm50;->a(Ll/mvc0;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    const/16 v0, 0x7d0

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->p(I)Ll/mvc0;

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 39
    .line 40
    const/high16 v1, 0x41200000    # 10.0f

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 45
    .line 46
    cmpg-float v3, v2, v1

    .line 47
    .line 48
    if-gez v3, :cond_2

    .line 49
    .line 50
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 51
    .line 52
    int-to-float v3, v3

    .line 53
    mul-float/2addr v2, v3

    .line 54
    :cond_2
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 55
    .line 56
    float-to-int v2, v2

    .line 57
    invoke-interface {v0, p0, v3, v2}, Ll/gvc0;->g(Ll/mvc0;II)V

    .line 58
    .line 59
    .line 60
    :cond_3
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 61
    .line 62
    if-eqz v0, :cond_6

    .line 63
    .line 64
    iget-object v2, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 65
    .line 66
    instance-of v2, v2, Ll/jvc0;

    .line 67
    .line 68
    if-eqz v2, :cond_6

    .line 69
    .line 70
    if-eqz p1, :cond_4

    .line 71
    .line 72
    invoke-interface {v0, p0}, Ll/tm50;->a(Ll/mvc0;)V

    .line 73
    .line 74
    .line 75
    :cond_4
    iget p1, p0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 76
    .line 77
    cmpg-float v0, p1, v1

    .line 78
    .line 79
    if-gez v0, :cond_5

    .line 80
    .line 81
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 82
    .line 83
    int-to-float v0, v0

    .line 84
    mul-float/2addr p1, v0

    .line 85
    :cond_5
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 86
    .line 87
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 88
    .line 89
    check-cast v1, Ll/jvc0;

    .line 90
    .line 91
    iget p0, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 92
    .line 93
    float-to-int p1, p1

    .line 94
    invoke-interface {v0, v1, p0, p1}, Ll/xm50;->m1(Ll/jvc0;II)V

    .line 95
    .line 96
    .line 97
    :cond_6
    return-void
.end method

.method public setStateLoading(Z)V
    .locals 5

    .line 1
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lv/smart_refresh/SmartRefreshLayout$b;-><init>(Lv/smart_refresh/SmartRefreshLayout;Z)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->LoadReleased:Lv/smart_refresh/constant/RefreshState;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 12
    .line 13
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 14
    .line 15
    neg-int v1, v1

    .line 16
    invoke-interface {p1, v1}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 26
    .line 27
    const/high16 v2, 0x41200000    # 10.0f

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 32
    .line 33
    cmpg-float v4, v3, v2

    .line 34
    .line 35
    if-gez v4, :cond_1

    .line 36
    .line 37
    iget v4, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 38
    .line 39
    int-to-float v4, v4

    .line 40
    mul-float/2addr v3, v4

    .line 41
    :cond_1
    iget v4, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 42
    .line 43
    float-to-int v3, v3

    .line 44
    invoke-interface {v1, p0, v4, v3}, Ll/gvc0;->c(Ll/mvc0;II)V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 48
    .line 49
    if-eqz v1, :cond_4

    .line 50
    .line 51
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 52
    .line 53
    instance-of v4, v3, Ll/jvc0;

    .line 54
    .line 55
    if-eqz v4, :cond_4

    .line 56
    .line 57
    iget v4, p0, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 58
    .line 59
    cmpg-float v2, v4, v2

    .line 60
    .line 61
    if-gez v2, :cond_3

    .line 62
    .line 63
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 64
    .line 65
    int-to-float v2, v2

    .line 66
    mul-float/2addr v4, v2

    .line 67
    :cond_3
    check-cast v3, Ll/jvc0;

    .line 68
    .line 69
    iget p0, p0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 70
    .line 71
    float-to-int v2, v4

    .line 72
    invoke-interface {v1, v3, p0, v2}, Ll/xm50;->W0(Ll/jvc0;II)V

    .line 73
    .line 74
    .line 75
    :cond_4
    if-nez p1, :cond_5

    .line 76
    .line 77
    const/4 p0, 0x0

    .line 78
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 79
    .line 80
    .line 81
    :cond_5
    return-void
.end method

.method public setStateRefreshing(Z)V
    .locals 5

    .line 1
    new-instance v0, Lv/smart_refresh/SmartRefreshLayout$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lv/smart_refresh/SmartRefreshLayout$c;-><init>(Lv/smart_refresh/SmartRefreshLayout;Z)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->RefreshReleased:Lv/smart_refresh/constant/RefreshState;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 12
    .line 13
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 14
    .line 15
    invoke-interface {p1, v1}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 25
    .line 26
    const/high16 v2, 0x41200000    # 10.0f

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    iget v3, p0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 31
    .line 32
    cmpg-float v4, v3, v2

    .line 33
    .line 34
    if-gez v4, :cond_1

    .line 35
    .line 36
    iget v4, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 37
    .line 38
    int-to-float v4, v4

    .line 39
    mul-float/2addr v3, v4

    .line 40
    :cond_1
    float-to-int v3, v3

    .line 41
    iget v4, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 42
    .line 43
    invoke-interface {v1, p0, v4, v3}, Ll/gvc0;->c(Ll/mvc0;II)V

    .line 44
    .line 45
    .line 46
    :cond_2
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 47
    .line 48
    if-eqz v1, :cond_4

    .line 49
    .line 50
    iget-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 51
    .line 52
    instance-of v4, v3, Ll/kvc0;

    .line 53
    .line 54
    if-eqz v4, :cond_4

    .line 55
    .line 56
    iget v4, p0, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 57
    .line 58
    cmpg-float v2, v4, v2

    .line 59
    .line 60
    if-gez v2, :cond_3

    .line 61
    .line 62
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 63
    .line 64
    int-to-float v2, v2

    .line 65
    mul-float/2addr v4, v2

    .line 66
    :cond_3
    float-to-int v2, v4

    .line 67
    check-cast v3, Ll/kvc0;

    .line 68
    .line 69
    iget p0, p0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 70
    .line 71
    invoke-interface {v1, v3, p0, v2}, Ll/xm50;->b0(Ll/kvc0;II)V

    .line 72
    .line 73
    .line 74
    :cond_4
    if-nez p1, :cond_5

    .line 75
    .line 76
    const/4 p0, 0x0

    .line 77
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 78
    .line 79
    .line 80
    :cond_5
    return-void
.end method

.method public setViceState(Lv/smart_refresh/constant/RefreshState;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    iget-boolean v1, v0, Lv/smart_refresh/constant/RefreshState;->isDragging:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 8
    .line 9
    iget-boolean v1, p1, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 19
    .line 20
    if-eq v0, p1, :cond_1

    .line 21
    .line 22
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public t()Ll/mvc0;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->w(Z)Ll/mvc0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public u(I)Ll/mvc0;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 3
    .line 4
    invoke-virtual {p0, p1, v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->v(IZLjava/lang/Boolean;)Ll/mvc0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public v(IZLjava/lang/Boolean;)Ll/mvc0;
    .locals 4

    .line 1
    shr-int/lit8 v0, p1, 0x10

    .line 2
    .line 3
    shl-int/lit8 p1, p1, 0x10

    .line 4
    .line 5
    shr-int/lit8 p1, p1, 0x10

    .line 6
    .line 7
    new-instance v1, Lv/smart_refresh/SmartRefreshLayout$g;

    .line 8
    .line 9
    invoke-direct {v1, p0, v0, p3, p2}, Lv/smart_refresh/SmartRefreshLayout$g;-><init>(Lv/smart_refresh/SmartRefreshLayout;ILjava/lang/Boolean;Z)V

    .line 10
    .line 11
    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 15
    .line 16
    int-to-long v2, p1

    .line 17
    invoke-virtual {p2, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public w(Z)Ll/mvc0;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v1

    .line 8
    iget-wide v3, p0, Lv/smart_refresh/SmartRefreshLayout;->f1:J

    .line 9
    .line 10
    sub-long/2addr v1, v3

    .line 11
    long-to-int p1, v1

    .line 12
    const/16 v1, 0x12c

    .line 13
    .line 14
    rsub-int p1, p1, 0x12c

    .line 15
    .line 16
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    shl-int/lit8 p1, p1, 0x10

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {p0, p1, v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->v(IZLjava/lang/Boolean;)Ll/mvc0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    const/4 p1, 0x0

    .line 35
    invoke-virtual {p0, v0, v0, p1}, Lv/smart_refresh/SmartRefreshLayout;->v(IZLjava/lang/Boolean;)Ll/mvc0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public x()Ll/mvc0;
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lv/smart_refresh/SmartRefreshLayout;->f1:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    long-to-int v0, v0

    .line 9
    const/16 v1, 0x12c

    .line 10
    .line 11
    rsub-int v0, v0, 0x12c

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    shl-int/lit8 v0, v0, 0x10

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1, v2}, Lv/smart_refresh/SmartRefreshLayout;->v(IZLjava/lang/Boolean;)Ll/mvc0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public y(I)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_5

    .line 3
    .line 4
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz p1, :cond_4

    .line 8
    .line 9
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 10
    .line 11
    iget-boolean v2, p1, Lv/smart_refresh/constant/RefreshState;->isFinishing:Z

    .line 12
    .line 13
    if-nez v2, :cond_3

    .line 14
    .line 15
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->TwoLevelReleased:Lv/smart_refresh/constant/RefreshState;

    .line 16
    .line 17
    if-eq p1, v2, :cond_3

    .line 18
    .line 19
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->RefreshReleased:Lv/smart_refresh/constant/RefreshState;

    .line 20
    .line 21
    if-eq p1, v2, :cond_3

    .line 22
    .line 23
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->LoadReleased:Lv/smart_refresh/constant/RefreshState;

    .line 24
    .line 25
    if-ne p1, v2, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->PullDownCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 29
    .line 30
    if-ne p1, v2, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 33
    .line 34
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 35
    .line 36
    invoke-interface {p1, v2}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->PullUpCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 41
    .line 42
    if-ne p1, v2, :cond_2

    .line 43
    .line 44
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 45
    .line 46
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 47
    .line 48
    invoke-interface {p1, v2}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    const-wide/16 v2, 0x0

    .line 54
    .line 55
    invoke-virtual {p1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 61
    .line 62
    .line 63
    iput-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    :goto_1
    return v0

    .line 67
    :cond_4
    :goto_2
    iput-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 68
    .line 69
    :cond_5
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    return v0

    .line 74
    :cond_6
    const/4 p0, 0x0

    .line 75
    return p0
.end method

.method public z(Z)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p0, p0, Lv/smart_refresh/SmartRefreshLayout;->M:Z

    .line 4
    .line 5
    if-nez p0, :cond_0

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
