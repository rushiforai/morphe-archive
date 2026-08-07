.class public Lv/smart_refresh/SmartRefreshLayout$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/smart_refresh/SmartRefreshLayout;->q(IZZ)Ll/mvc0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:I

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Lv/smart_refresh/SmartRefreshLayout;


# direct methods
.method public constructor <init>(Lv/smart_refresh/SmartRefreshLayout;IZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iput p2, p0, Lv/smart_refresh/SmartRefreshLayout$h;->b:I

    .line 4
    .line 5
    iput-boolean p3, p0, Lv/smart_refresh/SmartRefreshLayout$h;->c:Z

    .line 6
    .line 7
    iput-boolean p4, p0, Lv/smart_refresh/SmartRefreshLayout$h;->d:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout$h;->a:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public run()V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout$h;->a:I

    .line 4
    .line 5
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 6
    .line 7
    const-wide/16 v3, 0x0

    .line 8
    .line 9
    const/4 v5, 0x1

    .line 10
    const/4 v6, 0x0

    .line 11
    if-nez v1, :cond_5

    .line 12
    .line 13
    iget-object v7, v2, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 14
    .line 15
    sget-object v8, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 16
    .line 17
    if-ne v7, v8, :cond_0

    .line 18
    .line 19
    iget-object v9, v2, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 20
    .line 21
    sget-object v10, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 22
    .line 23
    if-ne v9, v10, :cond_0

    .line 24
    .line 25
    iput-object v8, v2, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v9, v2, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    if-eqz v9, :cond_3

    .line 31
    .line 32
    iget-boolean v10, v7, Lv/smart_refresh/constant/RefreshState;->isDragging:Z

    .line 33
    .line 34
    if-nez v10, :cond_1

    .line 35
    .line 36
    sget-object v10, Lv/smart_refresh/constant/RefreshState;->LoadReleased:Lv/smart_refresh/constant/RefreshState;

    .line 37
    .line 38
    if-ne v7, v10, :cond_3

    .line 39
    .line 40
    :cond_1
    iget-boolean v10, v7, Lv/smart_refresh/constant/RefreshState;->isFooter:Z

    .line 41
    .line 42
    if-eqz v10, :cond_3

    .line 43
    .line 44
    invoke-virtual {v9, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    .line 47
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 48
    .line 49
    iget-object v1, v1, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 52
    .line 53
    .line 54
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    iput-object v2, v1, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    iget-object v1, v1, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 60
    .line 61
    invoke-interface {v1, v6}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 66
    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    invoke-virtual {v2, v8}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->PullUpCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 74
    .line 75
    invoke-virtual {v2, v1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    sget-object v3, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 80
    .line 81
    if-ne v7, v3, :cond_4

    .line 82
    .line 83
    iget-object v3, v2, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 84
    .line 85
    if-eqz v3, :cond_4

    .line 86
    .line 87
    iget-object v3, v2, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 88
    .line 89
    if-eqz v3, :cond_4

    .line 90
    .line 91
    add-int/2addr v1, v5

    .line 92
    iput v1, v0, Lv/smart_refresh/SmartRefreshLayout$h;->a:I

    .line 93
    .line 94
    iget-object v1, v2, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 95
    .line 96
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->b:I

    .line 97
    .line 98
    int-to-long v2, v2

    .line 99
    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 100
    .line 101
    .line 102
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 103
    .line 104
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->LoadFinish:Lv/smart_refresh/constant/RefreshState;

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_4
    :goto_0
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout$h;->c:Z

    .line 111
    .line 112
    if-eqz v1, :cond_e

    .line 113
    .line 114
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 115
    .line 116
    invoke-virtual {v0, v5}, Lv/smart_refresh/SmartRefreshLayout;->L(Z)Ll/mvc0;

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_5
    iget-object v1, v2, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 121
    .line 122
    iget-boolean v7, v0, Lv/smart_refresh/SmartRefreshLayout$h;->d:Z

    .line 123
    .line 124
    invoke-interface {v1, v2, v7}, Ll/gvc0;->h(Ll/mvc0;Z)I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 129
    .line 130
    iget-object v7, v2, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 131
    .line 132
    if-eqz v7, :cond_6

    .line 133
    .line 134
    iget-object v2, v2, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 135
    .line 136
    instance-of v8, v2, Ll/jvc0;

    .line 137
    .line 138
    if-eqz v8, :cond_6

    .line 139
    .line 140
    check-cast v2, Ll/jvc0;

    .line 141
    .line 142
    iget-boolean v8, v0, Lv/smart_refresh/SmartRefreshLayout$h;->d:Z

    .line 143
    .line 144
    invoke-interface {v7, v2, v8}, Ll/xm50;->j(Ll/jvc0;Z)V

    .line 145
    .line 146
    .line 147
    :cond_6
    const v2, 0x7fffffff

    .line 148
    .line 149
    .line 150
    if-ge v1, v2, :cond_e

    .line 151
    .line 152
    iget-boolean v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->c:Z

    .line 153
    .line 154
    if-eqz v2, :cond_7

    .line 155
    .line 156
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 157
    .line 158
    iget-boolean v7, v2, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 159
    .line 160
    if-eqz v7, :cond_7

    .line 161
    .line 162
    iget v7, v2, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 163
    .line 164
    if-gez v7, :cond_7

    .line 165
    .line 166
    iget-object v2, v2, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 167
    .line 168
    invoke-interface {v2}, Ll/hvc0;->g()Z

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    if-eqz v2, :cond_7

    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_7
    move v5, v6

    .line 176
    :goto_1
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 177
    .line 178
    iget v7, v2, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 179
    .line 180
    if-eqz v5, :cond_8

    .line 181
    .line 182
    iget v2, v2, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 183
    .line 184
    neg-int v2, v2

    .line 185
    invoke-static {v7, v2}, Ljava/lang/Math;->max(II)I

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    goto :goto_2

    .line 190
    :cond_8
    move v2, v6

    .line 191
    :goto_2
    sub-int/2addr v7, v2

    .line 192
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 193
    .line 194
    iget-boolean v5, v2, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 195
    .line 196
    if-nez v5, :cond_9

    .line 197
    .line 198
    iget-boolean v2, v2, Lv/smart_refresh/SmartRefreshLayout;->I0:Z

    .line 199
    .line 200
    if-eqz v2, :cond_c

    .line 201
    .line 202
    :cond_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 203
    .line 204
    .line 205
    move-result-wide v8

    .line 206
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 207
    .line 208
    iget-boolean v5, v2, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 209
    .line 210
    if-eqz v5, :cond_b

    .line 211
    .line 212
    iget v5, v2, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 213
    .line 214
    iput v5, v2, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 215
    .line 216
    iget v10, v2, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 217
    .line 218
    sub-int/2addr v10, v7

    .line 219
    iput v10, v2, Lv/smart_refresh/SmartRefreshLayout;->d:I

    .line 220
    .line 221
    iput-boolean v6, v2, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 222
    .line 223
    iget-boolean v10, v2, Lv/smart_refresh/SmartRefreshLayout;->G:Z

    .line 224
    .line 225
    if-eqz v10, :cond_a

    .line 226
    .line 227
    move v10, v7

    .line 228
    goto :goto_3

    .line 229
    :cond_a
    move v10, v6

    .line 230
    :goto_3
    iget v13, v2, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 231
    .line 232
    int-to-float v10, v10

    .line 233
    add-float/2addr v5, v10

    .line 234
    iget v11, v2, Lv/smart_refresh/SmartRefreshLayout;->a:I

    .line 235
    .line 236
    mul-int/lit8 v11, v11, 0x2

    .line 237
    .line 238
    int-to-float v11, v11

    .line 239
    add-float v14, v5, v11

    .line 240
    .line 241
    const/4 v15, 0x0

    .line 242
    const/4 v12, 0x0

    .line 243
    move v5, v10

    .line 244
    move-wide v10, v8

    .line 245
    invoke-static/range {v8 .. v15}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 246
    .line 247
    .line 248
    move-result-object v10

    .line 249
    invoke-static {v2, v10}, Lv/smart_refresh/SmartRefreshLayout;->e(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z

    .line 250
    .line 251
    .line 252
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 253
    .line 254
    iget v13, v2, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 255
    .line 256
    iget v10, v2, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 257
    .line 258
    add-float v14, v10, v5

    .line 259
    .line 260
    const/4 v12, 0x2

    .line 261
    move-wide v10, v8

    .line 262
    invoke-static/range {v8 .. v15}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    invoke-static {v2, v5}, Lv/smart_refresh/SmartRefreshLayout;->f(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z

    .line 267
    .line 268
    .line 269
    :cond_b
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 270
    .line 271
    iget-boolean v5, v2, Lv/smart_refresh/SmartRefreshLayout;->I0:Z

    .line 272
    .line 273
    if-eqz v5, :cond_c

    .line 274
    .line 275
    iput v6, v2, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 276
    .line 277
    iget v13, v2, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 278
    .line 279
    iget v14, v2, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 280
    .line 281
    const/4 v15, 0x0

    .line 282
    const/4 v12, 0x1

    .line 283
    move-wide v10, v8

    .line 284
    invoke-static/range {v8 .. v15}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 285
    .line 286
    .line 287
    move-result-object v5

    .line 288
    invoke-static {v2, v5}, Lv/smart_refresh/SmartRefreshLayout;->g(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z

    .line 289
    .line 290
    .line 291
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 292
    .line 293
    iput-boolean v6, v2, Lv/smart_refresh/SmartRefreshLayout;->I0:Z

    .line 294
    .line 295
    iput v6, v2, Lv/smart_refresh/SmartRefreshLayout;->d:I

    .line 296
    .line 297
    :cond_c
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 298
    .line 299
    iget-object v2, v2, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 300
    .line 301
    new-instance v5, Lv/smart_refresh/SmartRefreshLayout$h$a;

    .line 302
    .line 303
    invoke-direct {v5, v0, v7}, Lv/smart_refresh/SmartRefreshLayout$h$a;-><init>(Lv/smart_refresh/SmartRefreshLayout$h;I)V

    .line 304
    .line 305
    .line 306
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout$h;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 307
    .line 308
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 309
    .line 310
    if-gez v0, :cond_d

    .line 311
    .line 312
    int-to-long v3, v1

    .line 313
    :cond_d
    invoke-virtual {v2, v5, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 314
    .line 315
    .line 316
    :cond_e
    return-void
.end method
