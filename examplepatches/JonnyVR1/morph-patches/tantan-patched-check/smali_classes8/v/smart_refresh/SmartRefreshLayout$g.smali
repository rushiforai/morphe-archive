.class public Lv/smart_refresh/SmartRefreshLayout$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/smart_refresh/SmartRefreshLayout;->v(IZLjava/lang/Boolean;)Ll/mvc0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Boolean;

.field public final synthetic d:Z

.field public final synthetic e:Lv/smart_refresh/SmartRefreshLayout;


# direct methods
.method public constructor <init>(Lv/smart_refresh/SmartRefreshLayout;ILjava/lang/Boolean;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iput p2, p0, Lv/smart_refresh/SmartRefreshLayout$g;->b:I

    .line 4
    .line 5
    iput-object p3, p0, Lv/smart_refresh/SmartRefreshLayout$g;->c:Ljava/lang/Boolean;

    .line 6
    .line 7
    iput-boolean p4, p0, Lv/smart_refresh/SmartRefreshLayout$g;->d:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->a:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    if-nez v0, :cond_5

    .line 8
    .line 9
    iget-object v4, v1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 10
    .line 11
    sget-object v5, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 12
    .line 13
    const/4 v6, 0x1

    .line 14
    if-ne v4, v5, :cond_0

    .line 15
    .line 16
    iget-object v7, v1, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 17
    .line 18
    sget-object v8, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 19
    .line 20
    if-ne v7, v8, :cond_0

    .line 21
    .line 22
    iput-object v5, v1, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v7, v1, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    if-eqz v7, :cond_3

    .line 28
    .line 29
    iget-boolean v8, v4, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 30
    .line 31
    if-eqz v8, :cond_3

    .line 32
    .line 33
    iget-boolean v8, v4, Lv/smart_refresh/constant/RefreshState;->isDragging:Z

    .line 34
    .line 35
    if-nez v8, :cond_1

    .line 36
    .line 37
    sget-object v8, Lv/smart_refresh/constant/RefreshState;->RefreshReleased:Lv/smart_refresh/constant/RefreshState;

    .line 38
    .line 39
    if-ne v4, v8, :cond_3

    .line 40
    .line 41
    :cond_1
    const-wide/16 v0, 0x0

    .line 42
    .line 43
    invoke-virtual {v7, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 47
    .line 48
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 54
    .line 55
    iput-object v2, v0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 58
    .line 59
    invoke-interface {v0, v3}, Ll/lvc0;->a(I)Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 64
    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    invoke-virtual {v1, v5}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->PullDownCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 78
    .line 79
    if-ne v4, v2, :cond_4

    .line 80
    .line 81
    iget-object v2, v1, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 82
    .line 83
    if-eqz v2, :cond_4

    .line 84
    .line 85
    iget-object v2, v1, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 86
    .line 87
    if-eqz v2, :cond_4

    .line 88
    .line 89
    add-int/2addr v0, v6

    .line 90
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->a:I

    .line 91
    .line 92
    iget-object v0, v1, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 93
    .line 94
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->b:I

    .line 95
    .line 96
    int-to-long v1, v1

    .line 97
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 101
    .line 102
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->RefreshFinish:Lv/smart_refresh/constant/RefreshState;

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->c:Ljava/lang/Boolean;

    .line 108
    .line 109
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 110
    .line 111
    if-ne v0, v1, :cond_4

    .line 112
    .line 113
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 114
    .line 115
    invoke-virtual {v0, v3}, Lv/smart_refresh/SmartRefreshLayout;->L(Z)Ll/mvc0;

    .line 116
    .line 117
    .line 118
    :cond_4
    :goto_0
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->c:Ljava/lang/Boolean;

    .line 119
    .line 120
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 121
    .line 122
    if-ne v0, v1, :cond_d

    .line 123
    .line 124
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 125
    .line 126
    invoke-virtual {p0, v6}, Lv/smart_refresh/SmartRefreshLayout;->L(Z)Ll/mvc0;

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_5
    iget-object v0, v1, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 131
    .line 132
    iget-boolean v4, p0, Lv/smart_refresh/SmartRefreshLayout$g;->d:Z

    .line 133
    .line 134
    invoke-interface {v0, v1, v4}, Ll/gvc0;->h(Ll/mvc0;Z)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 139
    .line 140
    iget-object v4, v1, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 141
    .line 142
    if-eqz v4, :cond_6

    .line 143
    .line 144
    iget-object v1, v1, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 145
    .line 146
    instance-of v5, v1, Ll/kvc0;

    .line 147
    .line 148
    if-eqz v5, :cond_6

    .line 149
    .line 150
    check-cast v1, Ll/kvc0;

    .line 151
    .line 152
    iget-boolean v5, p0, Lv/smart_refresh/SmartRefreshLayout$g;->d:Z

    .line 153
    .line 154
    invoke-interface {v4, v1, v5}, Ll/xm50;->x0(Ll/kvc0;Z)V

    .line 155
    .line 156
    .line 157
    :cond_6
    const v1, 0x7fffffff

    .line 158
    .line 159
    .line 160
    if-ge v0, v1, :cond_d

    .line 161
    .line 162
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 163
    .line 164
    iget-boolean v4, v1, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 165
    .line 166
    if-nez v4, :cond_7

    .line 167
    .line 168
    iget-boolean v1, v1, Lv/smart_refresh/SmartRefreshLayout;->I0:Z

    .line 169
    .line 170
    if-eqz v1, :cond_9

    .line 171
    .line 172
    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 173
    .line 174
    .line 175
    move-result-wide v4

    .line 176
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 177
    .line 178
    iget-boolean v6, v1, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 179
    .line 180
    if-eqz v6, :cond_8

    .line 181
    .line 182
    iget v6, v1, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 183
    .line 184
    iput v6, v1, Lv/smart_refresh/SmartRefreshLayout;->i:F

    .line 185
    .line 186
    iput v3, v1, Lv/smart_refresh/SmartRefreshLayout;->d:I

    .line 187
    .line 188
    iput-boolean v3, v1, Lv/smart_refresh/SmartRefreshLayout;->n:Z

    .line 189
    .line 190
    iget v9, v1, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 191
    .line 192
    iget v7, v1, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 193
    .line 194
    int-to-float v7, v7

    .line 195
    add-float/2addr v6, v7

    .line 196
    iget v7, v1, Lv/smart_refresh/SmartRefreshLayout;->a:I

    .line 197
    .line 198
    mul-int/lit8 v7, v7, 0x2

    .line 199
    .line 200
    int-to-float v7, v7

    .line 201
    sub-float v10, v6, v7

    .line 202
    .line 203
    const/4 v11, 0x0

    .line 204
    const/4 v8, 0x0

    .line 205
    move-wide v6, v4

    .line 206
    invoke-static/range {v4 .. v11}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 207
    .line 208
    .line 209
    move-result-object v6

    .line 210
    invoke-static {v1, v6}, Lv/smart_refresh/SmartRefreshLayout;->b(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z

    .line 211
    .line 212
    .line 213
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 214
    .line 215
    iget v9, v1, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 216
    .line 217
    iget v6, v1, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 218
    .line 219
    iget v7, v1, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 220
    .line 221
    int-to-float v7, v7

    .line 222
    add-float v10, v6, v7

    .line 223
    .line 224
    const/4 v8, 0x2

    .line 225
    move-wide v6, v4

    .line 226
    invoke-static/range {v4 .. v11}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 227
    .line 228
    .line 229
    move-result-object v6

    .line 230
    invoke-static {v1, v6}, Lv/smart_refresh/SmartRefreshLayout;->c(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z

    .line 231
    .line 232
    .line 233
    :cond_8
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 234
    .line 235
    iget-boolean v6, v1, Lv/smart_refresh/SmartRefreshLayout;->I0:Z

    .line 236
    .line 237
    if-eqz v6, :cond_9

    .line 238
    .line 239
    iput v3, v1, Lv/smart_refresh/SmartRefreshLayout;->H0:I

    .line 240
    .line 241
    iget v9, v1, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 242
    .line 243
    iget v10, v1, Lv/smart_refresh/SmartRefreshLayout;->k:F

    .line 244
    .line 245
    const/4 v11, 0x0

    .line 246
    const/4 v8, 0x1

    .line 247
    move-wide v6, v4

    .line 248
    invoke-static/range {v4 .. v11}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    invoke-static {v1, v4}, Lv/smart_refresh/SmartRefreshLayout;->d(Lv/smart_refresh/SmartRefreshLayout;Landroid/view/MotionEvent;)Z

    .line 253
    .line 254
    .line 255
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 256
    .line 257
    iput-boolean v3, v1, Lv/smart_refresh/SmartRefreshLayout;->I0:Z

    .line 258
    .line 259
    iput v3, v1, Lv/smart_refresh/SmartRefreshLayout;->d:I

    .line 260
    .line 261
    :cond_9
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 262
    .line 263
    iget v4, v1, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 264
    .line 265
    if-lez v4, :cond_b

    .line 266
    .line 267
    iget-object v4, v1, Lv/smart_refresh/SmartRefreshLayout;->z:Landroid/view/animation/Interpolator;

    .line 268
    .line 269
    iget v5, v1, Lv/smart_refresh/SmartRefreshLayout;->f:I

    .line 270
    .line 271
    invoke-virtual {v1, v3, v0, v4, v5}, Lv/smart_refresh/SmartRefreshLayout;->h(IILandroid/view/animation/Interpolator;I)Landroid/animation/ValueAnimator;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 276
    .line 277
    iget-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->O:Z

    .line 278
    .line 279
    if-eqz v1, :cond_a

    .line 280
    .line 281
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 282
    .line 283
    iget p0, p0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 284
    .line 285
    invoke-interface {v1, p0}, Ll/hvc0;->c(I)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    :cond_a
    if-eqz v0, :cond_d

    .line 290
    .line 291
    if-eqz v2, :cond_d

    .line 292
    .line 293
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_b
    if-gez v4, :cond_c

    .line 298
    .line 299
    iget-object p0, v1, Lv/smart_refresh/SmartRefreshLayout;->z:Landroid/view/animation/Interpolator;

    .line 300
    .line 301
    iget v2, v1, Lv/smart_refresh/SmartRefreshLayout;->f:I

    .line 302
    .line 303
    invoke-virtual {v1, v3, v0, p0, v2}, Lv/smart_refresh/SmartRefreshLayout;->h(IILandroid/view/animation/Interpolator;I)Landroid/animation/ValueAnimator;

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :cond_c
    iget-object v0, v1, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 308
    .line 309
    invoke-interface {v0, v3, v3}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 310
    .line 311
    .line 312
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$g;->e:Lv/smart_refresh/SmartRefreshLayout;

    .line 313
    .line 314
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 315
    .line 316
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 317
    .line 318
    invoke-interface {p0, v0}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 319
    .line 320
    .line 321
    :cond_d
    return-void
.end method
