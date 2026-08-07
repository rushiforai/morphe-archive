.class public Ll/mmj$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mmj$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mmj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mmj$b$a;
    }
.end annotation


# static fields
.field public static final v:I

.field public static final w:I

.field public static final x:I


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public final e:Landroid/os/Handler;

.field public final f:Landroid/view/GestureDetector$OnGestureListener;

.field public g:Landroid/view/GestureDetector$OnDoubleTapListener;

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:Landroid/view/MotionEvent;

.field public n:Landroid/view/MotionEvent;

.field public o:Z

.field public p:F

.field public q:F

.field public r:F

.field public s:F

.field public t:Z

.field public u:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x1f4

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sput v0, Ll/mmj$b;->v:I

    .line 12
    .line 13
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x64

    .line 18
    .line 19
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-float v0, v0

    .line 24
    const v1, 0x400ccccd    # 2.2f

    .line 25
    .line 26
    .line 27
    mul-float/2addr v0, v1

    .line 28
    float-to-int v0, v0

    .line 29
    sput v0, Ll/mmj$b;->w:I

    .line 30
    .line 31
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/16 v1, 0x12c

    .line 36
    .line 37
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    sput v0, Ll/mmj$b;->x:I

    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/mmj$b$a;

    .line 7
    .line 8
    invoke-direct {v0, p0, p3}, Ll/mmj$b$a;-><init>(Ll/mmj$b;Landroid/os/Handler;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p3, Ll/mmj$b$a;

    .line 15
    .line 16
    invoke-direct {p3, p0}, Ll/mmj$b$a;-><init>(Ll/mmj$b;)V

    .line 17
    .line 18
    .line 19
    iput-object p3, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 20
    .line 21
    :goto_0
    iput-object p2, p0, Ll/mmj$b;->f:Landroid/view/GestureDetector$OnGestureListener;

    .line 22
    .line 23
    instance-of p3, p2, Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 24
    .line 25
    if-eqz p3, :cond_1

    .line 26
    .line 27
    check-cast p2, Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 28
    .line 29
    invoke-virtual {p0, p2}, Ll/mmj$b;->c(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-virtual {p0, p1}, Ll/mmj$b;->g(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/mmj$b;->t:Z

    .line 2
    .line 3
    return-void
.end method

.method public b(Landroid/view/MotionEvent;)Z
    .locals 12

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 14
    .line 15
    :cond_0
    iget-object v1, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 18
    .line 19
    .line 20
    and-int/lit16 v0, v0, 0xff

    .line 21
    .line 22
    const/4 v1, 0x6

    .line 23
    const/4 v2, 0x1

    .line 24
    const/4 v3, 0x0

    .line 25
    if-ne v0, v1, :cond_1

    .line 26
    .line 27
    move v4, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move v4, v3

    .line 30
    :goto_0
    if-eqz v4, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    goto :goto_1

    .line 37
    :cond_2
    const/4 v5, -0x1

    .line 38
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    const/4 v7, 0x0

    .line 43
    move v8, v3

    .line 44
    move v9, v7

    .line 45
    move v10, v9

    .line 46
    :goto_2
    if-ge v8, v6, :cond_4

    .line 47
    .line 48
    if-ne v5, v8, :cond_3

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_3
    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getX(I)F

    .line 52
    .line 53
    .line 54
    move-result v11

    .line 55
    add-float/2addr v9, v11

    .line 56
    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getY(I)F

    .line 57
    .line 58
    .line 59
    move-result v11

    .line 60
    add-float/2addr v10, v11

    .line 61
    :goto_3
    add-int/lit8 v8, v8, 0x1

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_4
    if-eqz v4, :cond_5

    .line 65
    .line 66
    add-int/lit8 v4, v6, -0x1

    .line 67
    .line 68
    goto :goto_4

    .line 69
    :cond_5
    move v4, v6

    .line 70
    :goto_4
    int-to-float v4, v4

    .line 71
    div-float/2addr v9, v4

    .line 72
    div-float/2addr v10, v4

    .line 73
    const/4 v4, 0x2

    .line 74
    const/4 v5, 0x3

    .line 75
    if-eqz v0, :cond_1c

    .line 76
    .line 77
    const/16 v8, 0x3e8

    .line 78
    .line 79
    if-eq v0, v2, :cond_13

    .line 80
    .line 81
    if-eq v0, v4, :cond_b

    .line 82
    .line 83
    if-eq v0, v5, :cond_a

    .line 84
    .line 85
    const/4 v2, 0x5

    .line 86
    if-eq v0, v2, :cond_9

    .line 87
    .line 88
    if-eq v0, v1, :cond_6

    .line 89
    .line 90
    goto/16 :goto_8

    .line 91
    .line 92
    :cond_6
    iput v9, p0, Ll/mmj$b;->p:F

    .line 93
    .line 94
    iput v9, p0, Ll/mmj$b;->r:F

    .line 95
    .line 96
    iput v10, p0, Ll/mmj$b;->q:F

    .line 97
    .line 98
    iput v10, p0, Ll/mmj$b;->s:F

    .line 99
    .line 100
    iget-object v0, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 101
    .line 102
    iget v1, p0, Ll/mmj$b;->d:I

    .line 103
    .line 104
    int-to-float v1, v1

    .line 105
    invoke-virtual {v0, v8, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    iget-object v2, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 117
    .line 118
    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    iget-object v4, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 123
    .line 124
    invoke-virtual {v4, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    move v4, v3

    .line 129
    :goto_5
    if-ge v4, v6, :cond_11

    .line 130
    .line 131
    if-ne v4, v0, :cond_7

    .line 132
    .line 133
    goto :goto_6

    .line 134
    :cond_7
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    iget-object v8, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 139
    .line 140
    invoke-virtual {v8, v5}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 141
    .line 142
    .line 143
    move-result v8

    .line 144
    mul-float/2addr v8, v2

    .line 145
    iget-object v9, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 146
    .line 147
    invoke-virtual {v9, v5}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    mul-float/2addr v5, v1

    .line 152
    add-float/2addr v8, v5

    .line 153
    cmpg-float v5, v8, v7

    .line 154
    .line 155
    if-gez v5, :cond_8

    .line 156
    .line 157
    iget-object p0, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/view/VelocityTracker;->clear()V

    .line 160
    .line 161
    .line 162
    return v3

    .line 163
    :cond_8
    :goto_6
    add-int/lit8 v4, v4, 0x1

    .line 164
    .line 165
    goto :goto_5

    .line 166
    :cond_9
    iput v9, p0, Ll/mmj$b;->p:F

    .line 167
    .line 168
    iput v9, p0, Ll/mmj$b;->r:F

    .line 169
    .line 170
    iput v10, p0, Ll/mmj$b;->q:F

    .line 171
    .line 172
    iput v10, p0, Ll/mmj$b;->s:F

    .line 173
    .line 174
    invoke-virtual {p0}, Ll/mmj$b;->e()V

    .line 175
    .line 176
    .line 177
    return v3

    .line 178
    :cond_a
    invoke-virtual {p0}, Ll/mmj$b;->d()V

    .line 179
    .line 180
    .line 181
    return v3

    .line 182
    :cond_b
    iget-boolean v0, p0, Ll/mmj$b;->j:Z

    .line 183
    .line 184
    if-eqz v0, :cond_c

    .line 185
    .line 186
    goto :goto_8

    .line 187
    :cond_c
    iget v0, p0, Ll/mmj$b;->p:F

    .line 188
    .line 189
    sub-float/2addr v0, v9

    .line 190
    iget v1, p0, Ll/mmj$b;->q:F

    .line 191
    .line 192
    sub-float/2addr v1, v10

    .line 193
    iget-boolean v6, p0, Ll/mmj$b;->o:Z

    .line 194
    .line 195
    if-eqz v6, :cond_d

    .line 196
    .line 197
    iget-object p0, p0, Ll/mmj$b;->g:Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 198
    .line 199
    invoke-interface {p0, p1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    return p0

    .line 204
    :cond_d
    iget-boolean v6, p0, Ll/mmj$b;->k:Z

    .line 205
    .line 206
    if-eqz v6, :cond_10

    .line 207
    .line 208
    iget v6, p0, Ll/mmj$b;->r:F

    .line 209
    .line 210
    sub-float v6, v9, v6

    .line 211
    .line 212
    float-to-int v6, v6

    .line 213
    iget v7, p0, Ll/mmj$b;->s:F

    .line 214
    .line 215
    sub-float v7, v10, v7

    .line 216
    .line 217
    float-to-int v7, v7

    .line 218
    mul-int/2addr v6, v6

    .line 219
    mul-int/2addr v7, v7

    .line 220
    add-int/2addr v6, v7

    .line 221
    iget v7, p0, Ll/mmj$b;->a:I

    .line 222
    .line 223
    if-le v6, v7, :cond_e

    .line 224
    .line 225
    iget-object v7, p0, Ll/mmj$b;->f:Landroid/view/GestureDetector$OnGestureListener;

    .line 226
    .line 227
    iget-object v8, p0, Ll/mmj$b;->m:Landroid/view/MotionEvent;

    .line 228
    .line 229
    invoke-interface {v7, v8, p1, v0, v1}, Landroid/view/GestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    iput v9, p0, Ll/mmj$b;->p:F

    .line 234
    .line 235
    iput v10, p0, Ll/mmj$b;->q:F

    .line 236
    .line 237
    iput-boolean v3, p0, Ll/mmj$b;->k:Z

    .line 238
    .line 239
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 240
    .line 241
    invoke-virtual {v0, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 245
    .line 246
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 250
    .line 251
    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 252
    .line 253
    .line 254
    goto :goto_7

    .line 255
    :cond_e
    move p1, v3

    .line 256
    :goto_7
    iget v0, p0, Ll/mmj$b;->a:I

    .line 257
    .line 258
    if-le v6, v0, :cond_f

    .line 259
    .line 260
    iput-boolean v3, p0, Ll/mmj$b;->l:Z

    .line 261
    .line 262
    :cond_f
    return p1

    .line 263
    :cond_10
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 264
    .line 265
    .line 266
    move-result v2

    .line 267
    const/high16 v4, 0x3f800000    # 1.0f

    .line 268
    .line 269
    cmpl-float v2, v2, v4

    .line 270
    .line 271
    if-gez v2, :cond_12

    .line 272
    .line 273
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    cmpl-float v2, v2, v4

    .line 278
    .line 279
    if-ltz v2, :cond_11

    .line 280
    .line 281
    goto :goto_9

    .line 282
    :cond_11
    :goto_8
    return v3

    .line 283
    :cond_12
    :goto_9
    iget-object v2, p0, Ll/mmj$b;->f:Landroid/view/GestureDetector$OnGestureListener;

    .line 284
    .line 285
    iget-object v3, p0, Ll/mmj$b;->m:Landroid/view/MotionEvent;

    .line 286
    .line 287
    invoke-interface {v2, v3, p1, v0, v1}, Landroid/view/GestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    .line 288
    .line 289
    .line 290
    move-result p1

    .line 291
    iput v9, p0, Ll/mmj$b;->p:F

    .line 292
    .line 293
    iput v10, p0, Ll/mmj$b;->q:F

    .line 294
    .line 295
    return p1

    .line 296
    :cond_13
    iput-boolean v3, p0, Ll/mmj$b;->h:Z

    .line 297
    .line 298
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    iget-boolean v1, p0, Ll/mmj$b;->o:Z

    .line 303
    .line 304
    if-eqz v1, :cond_14

    .line 305
    .line 306
    iget-object v1, p0, Ll/mmj$b;->g:Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 307
    .line 308
    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    .line 309
    .line 310
    .line 311
    move-result p1

    .line 312
    goto :goto_c

    .line 313
    :cond_14
    iget-boolean v1, p0, Ll/mmj$b;->j:Z

    .line 314
    .line 315
    if-eqz v1, :cond_15

    .line 316
    .line 317
    iget-object p1, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 318
    .line 319
    invoke-virtual {p1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 320
    .line 321
    .line 322
    iput-boolean v3, p0, Ll/mmj$b;->j:Z

    .line 323
    .line 324
    goto :goto_a

    .line 325
    :cond_15
    iget-boolean v1, p0, Ll/mmj$b;->k:Z

    .line 326
    .line 327
    if-eqz v1, :cond_17

    .line 328
    .line 329
    iget-object v1, p0, Ll/mmj$b;->f:Landroid/view/GestureDetector$OnGestureListener;

    .line 330
    .line 331
    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    .line 332
    .line 333
    .line 334
    move-result v1

    .line 335
    iget-boolean v5, p0, Ll/mmj$b;->i:Z

    .line 336
    .line 337
    if-eqz v5, :cond_16

    .line 338
    .line 339
    iget-object v5, p0, Ll/mmj$b;->g:Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 340
    .line 341
    if-eqz v5, :cond_16

    .line 342
    .line 343
    invoke-interface {v5, p1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    .line 344
    .line 345
    .line 346
    :cond_16
    move p1, v1

    .line 347
    goto :goto_c

    .line 348
    :cond_17
    iget-object v1, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 349
    .line 350
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 351
    .line 352
    .line 353
    move-result v5

    .line 354
    iget v6, p0, Ll/mmj$b;->d:I

    .line 355
    .line 356
    int-to-float v6, v6

    .line 357
    invoke-virtual {v1, v8, v6}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 358
    .line 359
    .line 360
    invoke-virtual {v1, v5}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 361
    .line 362
    .line 363
    move-result v6

    .line 364
    invoke-virtual {v1, v5}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 365
    .line 366
    .line 367
    move-result v1

    .line 368
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 369
    .line 370
    .line 371
    move-result v5

    .line 372
    iget v7, p0, Ll/mmj$b;->c:I

    .line 373
    .line 374
    int-to-float v7, v7

    .line 375
    cmpl-float v5, v5, v7

    .line 376
    .line 377
    if-gtz v5, :cond_19

    .line 378
    .line 379
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 380
    .line 381
    .line 382
    move-result v5

    .line 383
    iget v7, p0, Ll/mmj$b;->c:I

    .line 384
    .line 385
    int-to-float v7, v7

    .line 386
    cmpl-float v5, v5, v7

    .line 387
    .line 388
    if-lez v5, :cond_18

    .line 389
    .line 390
    goto :goto_b

    .line 391
    :cond_18
    :goto_a
    move p1, v3

    .line 392
    goto :goto_c

    .line 393
    :cond_19
    :goto_b
    iget-object v5, p0, Ll/mmj$b;->f:Landroid/view/GestureDetector$OnGestureListener;

    .line 394
    .line 395
    iget-object v7, p0, Ll/mmj$b;->m:Landroid/view/MotionEvent;

    .line 396
    .line 397
    invoke-interface {v5, v7, p1, v1, v6}, Landroid/view/GestureDetector$OnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    .line 398
    .line 399
    .line 400
    move-result p1

    .line 401
    :goto_c
    iget-object v1, p0, Ll/mmj$b;->n:Landroid/view/MotionEvent;

    .line 402
    .line 403
    if-eqz v1, :cond_1a

    .line 404
    .line 405
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 406
    .line 407
    .line 408
    :cond_1a
    iput-object v0, p0, Ll/mmj$b;->n:Landroid/view/MotionEvent;

    .line 409
    .line 410
    iget-object v0, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 411
    .line 412
    if-eqz v0, :cond_1b

    .line 413
    .line 414
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 415
    .line 416
    .line 417
    const/4 v0, 0x0

    .line 418
    iput-object v0, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 419
    .line 420
    :cond_1b
    iput-boolean v3, p0, Ll/mmj$b;->o:Z

    .line 421
    .line 422
    iput-boolean v3, p0, Ll/mmj$b;->i:Z

    .line 423
    .line 424
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 425
    .line 426
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 427
    .line 428
    .line 429
    iget-object p0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 430
    .line 431
    invoke-virtual {p0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 432
    .line 433
    .line 434
    return p1

    .line 435
    :cond_1c
    iget-object v0, p0, Ll/mmj$b;->g:Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 436
    .line 437
    if-eqz v0, :cond_1f

    .line 438
    .line 439
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 440
    .line 441
    invoke-virtual {v0, v5}, Landroid/os/Handler;->hasMessages(I)Z

    .line 442
    .line 443
    .line 444
    move-result v0

    .line 445
    if-eqz v0, :cond_1d

    .line 446
    .line 447
    iget-object v1, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 448
    .line 449
    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 450
    .line 451
    .line 452
    :cond_1d
    iget-object v1, p0, Ll/mmj$b;->m:Landroid/view/MotionEvent;

    .line 453
    .line 454
    if-eqz v1, :cond_1e

    .line 455
    .line 456
    iget-object v6, p0, Ll/mmj$b;->n:Landroid/view/MotionEvent;

    .line 457
    .line 458
    if-eqz v6, :cond_1e

    .line 459
    .line 460
    if-eqz v0, :cond_1e

    .line 461
    .line 462
    invoke-virtual {p0, v1, v6, p1}, Ll/mmj$b;->h(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    if-eqz v0, :cond_1e

    .line 467
    .line 468
    iput-boolean v2, p0, Ll/mmj$b;->o:Z

    .line 469
    .line 470
    iget-object v0, p0, Ll/mmj$b;->g:Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 471
    .line 472
    iget-object v1, p0, Ll/mmj$b;->m:Landroid/view/MotionEvent;

    .line 473
    .line 474
    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    .line 475
    .line 476
    .line 477
    move-result v0

    .line 478
    iget-object v1, p0, Ll/mmj$b;->g:Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 479
    .line 480
    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    .line 481
    .line 482
    .line 483
    move-result v1

    .line 484
    or-int/2addr v0, v1

    .line 485
    goto :goto_d

    .line 486
    :cond_1e
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 487
    .line 488
    sget v1, Ll/mmj$b;->x:I

    .line 489
    .line 490
    int-to-long v6, v1

    .line 491
    invoke-virtual {v0, v5, v6, v7}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 492
    .line 493
    .line 494
    :cond_1f
    move v0, v3

    .line 495
    :goto_d
    iput v9, p0, Ll/mmj$b;->p:F

    .line 496
    .line 497
    iput v9, p0, Ll/mmj$b;->r:F

    .line 498
    .line 499
    iput v10, p0, Ll/mmj$b;->q:F

    .line 500
    .line 501
    iput v10, p0, Ll/mmj$b;->s:F

    .line 502
    .line 503
    iget-object v1, p0, Ll/mmj$b;->m:Landroid/view/MotionEvent;

    .line 504
    .line 505
    if-eqz v1, :cond_20

    .line 506
    .line 507
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 508
    .line 509
    .line 510
    :cond_20
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 511
    .line 512
    .line 513
    move-result-object v1

    .line 514
    iput-object v1, p0, Ll/mmj$b;->m:Landroid/view/MotionEvent;

    .line 515
    .line 516
    iput-boolean v2, p0, Ll/mmj$b;->k:Z

    .line 517
    .line 518
    iput-boolean v2, p0, Ll/mmj$b;->l:Z

    .line 519
    .line 520
    iput-boolean v2, p0, Ll/mmj$b;->h:Z

    .line 521
    .line 522
    iput-boolean v3, p0, Ll/mmj$b;->j:Z

    .line 523
    .line 524
    iput-boolean v3, p0, Ll/mmj$b;->i:Z

    .line 525
    .line 526
    iget-boolean v1, p0, Ll/mmj$b;->t:Z

    .line 527
    .line 528
    if-eqz v1, :cond_21

    .line 529
    .line 530
    iget-object v1, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 531
    .line 532
    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 533
    .line 534
    .line 535
    iget-object v1, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 536
    .line 537
    sget v3, Ll/mmj$b;->w:I

    .line 538
    .line 539
    sget v5, Ll/mmj$b;->v:I

    .line 540
    .line 541
    add-int/2addr v3, v5

    .line 542
    int-to-long v5, v3

    .line 543
    invoke-virtual {v1, v4, v5, v6}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 544
    .line 545
    .line 546
    :cond_21
    iget-object v1, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 547
    .line 548
    sget v3, Ll/mmj$b;->w:I

    .line 549
    .line 550
    int-to-long v3, v3

    .line 551
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 552
    .line 553
    .line 554
    iget-object p0, p0, Ll/mmj$b;->f:Landroid/view/GestureDetector$OnGestureListener;

    .line 555
    .line 556
    invoke-interface {p0, p1}, Landroid/view/GestureDetector$OnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    .line 557
    .line 558
    .line 559
    move-result p0

    .line 560
    or-int/2addr p0, v0

    .line 561
    return p0
.end method

.method public c(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mmj$b;->g:Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 2
    .line 3
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Ll/mmj$b;->u:Landroid/view/VelocityTracker;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Ll/mmj$b;->o:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/mmj$b;->h:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/mmj$b;->k:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Ll/mmj$b;->l:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Ll/mmj$b;->i:Z

    .line 37
    .line 38
    iget-boolean v1, p0, Ll/mmj$b;->j:Z

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iput-boolean v0, p0, Ll/mmj$b;->j:Z

    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Ll/mmj$b;->o:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/mmj$b;->k:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Ll/mmj$b;->l:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Ll/mmj$b;->i:Z

    .line 27
    .line 28
    iget-boolean v1, p0, Ll/mmj$b;->j:Z

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/mmj$b;->j:Z

    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mmj$b;->e:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/mmj$b;->i:Z

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/mmj$b;->j:Z

    .line 12
    .line 13
    iget-object v0, p0, Ll/mmj$b;->f:Landroid/view/GestureDetector$OnGestureListener;

    .line 14
    .line 15
    iget-object p0, p0, Ll/mmj$b;->m:Landroid/view/MotionEvent;

    .line 16
    .line 17
    invoke-interface {v0, p0}, Landroid/view/GestureDetector$OnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final g(Landroid/content/Context;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/mmj$b;->f:Landroid/view/GestureDetector$OnGestureListener;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/mmj$b;->t:Z

    .line 9
    .line 10
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledDoubleTapSlop()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iput v2, p0, Ll/mmj$b;->c:I

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Ll/mmj$b;->d:I

    .line 33
    .line 34
    mul-int/2addr v0, v0

    .line 35
    iput v0, p0, Ll/mmj$b;->a:I

    .line 36
    .line 37
    mul-int/2addr v1, v1

    .line 38
    iput v1, p0, Ll/mmj$b;->b:I

    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const-string p0, "OnGestureListener must not be null"

    .line 42
    .line 43
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    const-string p0, "Context must not be null"

    .line 48
    .line 49
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final h(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/mmj$b;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getEventTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v4

    .line 15
    sub-long/2addr v2, v4

    .line 16
    sget p2, Ll/mmj$b;->x:I

    .line 17
    .line 18
    int-to-long v4, p2

    .line 19
    cmp-long p2, v2, v4

    .line 20
    .line 21
    if-lez p2, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    float-to-int p2, p2

    .line 29
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    float-to-int v0, v0

    .line 34
    sub-int/2addr p2, v0

    .line 35
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    float-to-int p1, p1

    .line 40
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    float-to-int p3, p3

    .line 45
    sub-int/2addr p1, p3

    .line 46
    mul-int/2addr p2, p2

    .line 47
    mul-int/2addr p1, p1

    .line 48
    add-int/2addr p2, p1

    .line 49
    iget p0, p0, Ll/mmj$b;->b:I

    .line 50
    .line 51
    if-ge p2, p0, :cond_2

    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    return p0

    .line 55
    :cond_2
    return v1
.end method
