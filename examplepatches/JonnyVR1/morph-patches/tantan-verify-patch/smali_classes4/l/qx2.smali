.class public abstract Ll/qx2;
.super Ll/ox2;
.source "SourceFile"


# instance fields
.field public x:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public y:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ox2;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/qx2;->x:Lrx/subjects/b;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Ll/qx2;->y:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z
    .locals 13

    .line 1
    invoke-virtual {p0}, Ll/ox2;->G()Ll/txl0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_c

    .line 7
    .line 8
    sget-boolean v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v2, p0, Ll/ox2;->i:Ll/vo0;

    .line 16
    .line 17
    iget v3, v0, Ll/txl0;->k:I

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Ll/vo0;->a(I)V

    .line 20
    .line 21
    .line 22
    iget-object v2, v0, Ll/txl0;->a:Landroid/view/View;

    .line 23
    .line 24
    iget-object v3, p0, Ll/ox2;->f:Ll/udj0;

    .line 25
    .line 26
    invoke-virtual {v3}, Ll/udj0;->e()V

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Ll/ox2;->i:Ll/vo0;

    .line 30
    .line 31
    invoke-virtual {v3}, Ll/vo0;->b()V

    .line 32
    .line 33
    .line 34
    iget-object v3, p0, Ll/ox2;->e:Ll/nx2;

    .line 35
    .line 36
    invoke-virtual {v3, v2}, Ll/nx2;->j(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    iget-object v3, p0, Ll/ox2;->i:Ll/vo0;

    .line 40
    .line 41
    iget v4, v0, Ll/txl0;->k:I

    .line 42
    .line 43
    invoke-virtual {v3, v4}, Ll/vo0;->h(I)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    if-eqz p2, :cond_2

    .line 50
    .line 51
    sget-boolean v3, Ll/vo0;->y:Z

    .line 52
    .line 53
    if-nez v3, :cond_2

    .line 54
    .line 55
    sget-boolean p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 56
    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    :cond_1
    return v1

    .line 63
    :cond_2
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 64
    .line 65
    if-eqz v1, :cond_3

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->PRE_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 71
    .line 72
    iput-object v1, v0, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 73
    .line 74
    new-instance v1, Ll/nh4;

    .line 75
    .line 76
    iget v3, v0, Ll/txl0;->k:I

    .line 77
    .line 78
    invoke-direct {v1, v3, v0}, Ll/nh4;-><init>(ILl/txl0;)V

    .line 79
    .line 80
    .line 81
    sget-wide v3, Ll/vo0;->i:J

    .line 82
    .line 83
    iput-wide v3, v1, Ll/nh4;->d:J

    .line 84
    .line 85
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 86
    .line 87
    iput-object v3, v1, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 88
    .line 89
    iput-object p1, v1, Ll/nh4;->h:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 90
    .line 91
    const/4 v3, 0x1

    .line 92
    if-eqz p2, :cond_4

    .line 93
    .line 94
    sget-boolean p2, Ll/vo0;->y:Z

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    move p2, v3

    .line 98
    :goto_0
    iput-boolean p2, v1, Ll/nh4;->i:Z

    .line 99
    .line 100
    new-instance p2, Ll/mo0;

    .line 101
    .line 102
    invoke-direct {p2}, Ll/mo0;-><init>()V

    .line 103
    .line 104
    .line 105
    iget v4, v0, Ll/txl0;->k:I

    .line 106
    .line 107
    invoke-virtual {v1, v4}, Ll/nh4;->a(I)V

    .line 108
    .line 109
    .line 110
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 111
    .line 112
    filled-new-array {v4}, [Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-virtual {v1, v4}, Ll/nh4;->b([Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;)V

    .line 117
    .line 118
    .line 119
    iput-object p2, v1, Ll/nh4;->f:Ll/mo0;

    .line 120
    .line 121
    const/4 v4, -0x1

    .line 122
    iput v4, v1, Ll/nh4;->e:I

    .line 123
    .line 124
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    iget-object v0, v0, Ll/txl0;->a:Landroid/view/View;

    .line 133
    .line 134
    invoke-virtual {p2, v0}, Ll/mo0;->e(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    iget v0, p2, Ll/mo0;->c:F

    .line 138
    .line 139
    const/4 v6, 0x0

    .line 140
    cmpl-float v0, v0, v6

    .line 141
    .line 142
    if-nez v0, :cond_5

    .line 143
    .line 144
    iget v0, p2, Ll/mo0;->a:F

    .line 145
    .line 146
    cmpl-float v0, v0, v6

    .line 147
    .line 148
    if-nez v0, :cond_5

    .line 149
    .line 150
    div-int/lit8 v0, v4, 0x2

    .line 151
    .line 152
    int-to-float v0, v0

    .line 153
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotX(F)V

    .line 154
    .line 155
    .line 156
    div-int/lit8 v0, v5, 0x5

    .line 157
    .line 158
    int-to-float v0, v0

    .line 159
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotY(F)V

    .line 160
    .line 161
    .line 162
    :cond_5
    sget-object v0, Ll/qx2$b;->a:[I

    .line 163
    .line 164
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    aget v0, v0, v2

    .line 169
    .line 170
    const-wide/16 v7, 0x2

    .line 171
    .line 172
    const-wide/16 v9, 0x1

    .line 173
    .line 174
    const/high16 v2, -0x40800000    # -1.0f

    .line 175
    .line 176
    const/high16 v11, 0x3f800000    # 1.0f

    .line 177
    .line 178
    if-eq v0, v3, :cond_9

    .line 179
    .line 180
    const/4 v12, 0x2

    .line 181
    if-eq v0, v12, :cond_7

    .line 182
    .line 183
    const/4 v4, 0x3

    .line 184
    if-eq v0, v4, :cond_6

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_6
    sget v0, Ll/vo0;->o:F

    .line 188
    .line 189
    mul-float/2addr v0, v2

    .line 190
    int-to-float v2, v5

    .line 191
    mul-float/2addr v0, v2

    .line 192
    iput v0, p2, Ll/mo0;->b:F

    .line 193
    .line 194
    iput v11, p2, Ll/mo0;->f:F

    .line 195
    .line 196
    iput v6, p2, Ll/mo0;->h:F

    .line 197
    .line 198
    sget-wide v4, Ll/vo0;->i:J

    .line 199
    .line 200
    iput-wide v4, v1, Ll/nh4;->d:J

    .line 201
    .line 202
    iput v11, p2, Ll/mo0;->l:F

    .line 203
    .line 204
    goto :goto_1

    .line 205
    :cond_7
    sget v0, Ll/vo0;->o:F

    .line 206
    .line 207
    int-to-float v2, v4

    .line 208
    mul-float/2addr v0, v2

    .line 209
    iput v0, p2, Ll/mo0;->d:F

    .line 210
    .line 211
    iput v11, p2, Ll/mo0;->f:F

    .line 212
    .line 213
    sget v0, Ll/vo0;->q:F

    .line 214
    .line 215
    iput v0, p2, Ll/mo0;->h:F

    .line 216
    .line 217
    sget-wide v4, Ll/vo0;->m:J

    .line 218
    .line 219
    cmp-long v0, v4, v9

    .line 220
    .line 221
    if-lez v0, :cond_8

    .line 222
    .line 223
    neg-long v4, v4

    .line 224
    div-long/2addr v4, v7

    .line 225
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 226
    .line 227
    .line 228
    move-result-wide v7

    .line 229
    sget-wide v9, Ll/vo0;->m:J

    .line 230
    .line 231
    rem-long/2addr v7, v9

    .line 232
    add-long/2addr v4, v7

    .line 233
    sget-wide v7, Ll/vo0;->l:J

    .line 234
    .line 235
    mul-long/2addr v4, v7

    .line 236
    long-to-float v0, v4

    .line 237
    iput v0, p2, Ll/mo0;->b:F

    .line 238
    .line 239
    :cond_8
    iput v11, p2, Ll/mo0;->l:F

    .line 240
    .line 241
    goto :goto_1

    .line 242
    :cond_9
    sget v0, Ll/vo0;->o:F

    .line 243
    .line 244
    mul-float/2addr v0, v2

    .line 245
    int-to-float v4, v4

    .line 246
    mul-float/2addr v0, v4

    .line 247
    iput v0, p2, Ll/mo0;->d:F

    .line 248
    .line 249
    iput v11, p2, Ll/mo0;->f:F

    .line 250
    .line 251
    sget v0, Ll/vo0;->q:F

    .line 252
    .line 253
    mul-float/2addr v0, v2

    .line 254
    iput v0, p2, Ll/mo0;->h:F

    .line 255
    .line 256
    sget-wide v4, Ll/vo0;->m:J

    .line 257
    .line 258
    cmp-long v0, v4, v9

    .line 259
    .line 260
    if-lez v0, :cond_a

    .line 261
    .line 262
    neg-long v4, v4

    .line 263
    div-long/2addr v4, v7

    .line 264
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 265
    .line 266
    .line 267
    move-result-wide v7

    .line 268
    sget-wide v9, Ll/vo0;->m:J

    .line 269
    .line 270
    rem-long/2addr v7, v9

    .line 271
    add-long/2addr v4, v7

    .line 272
    sget-wide v7, Ll/vo0;->l:J

    .line 273
    .line 274
    mul-long/2addr v4, v7

    .line 275
    long-to-float v0, v4

    .line 276
    iput v0, p2, Ll/mo0;->b:F

    .line 277
    .line 278
    :cond_a
    iput v11, p2, Ll/mo0;->l:F

    .line 279
    .line 280
    :goto_1
    new-instance p2, Landroid/view/animation/PathInterpolator;

    .line 281
    .line 282
    sget v0, Ll/vo0;->p:F

    .line 283
    .line 284
    invoke-direct {p2, v0, v6, v11, v11}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v1, p2}, Ll/nh4;->p(Landroid/view/animation/Interpolator;)V

    .line 288
    .line 289
    .line 290
    iget-object p2, p0, Ll/ox2;->d:Ll/vr2;

    .line 291
    .line 292
    invoke-virtual {p2, v1}, Ll/vr2;->f(Ll/nh4;)V

    .line 293
    .line 294
    .line 295
    iget-object p0, p0, Ll/ox2;->i:Ll/vo0;

    .line 296
    .line 297
    filled-new-array {v1}, [Ll/nh4;

    .line 298
    .line 299
    .line 300
    move-result-object p2

    .line 301
    invoke-virtual {p0, p2}, Ll/vo0;->d([Ll/nh4;)V

    .line 302
    .line 303
    .line 304
    sget-boolean p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 305
    .line 306
    if-eqz p0, :cond_b

    .line 307
    .line 308
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    :cond_b
    return v3

    .line 312
    :cond_c
    return v1
.end method

.method public a()V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-boolean v1, Ll/vo0;->C:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/qx2;->y0()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "notify begin "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/ox2;->Y(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    new-instance v3, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v4, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v5, v0, Ll/ox2;->a:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v5}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    iget-object v6, v0, Ll/ox2;->a:Ljava/util/List;

    .line 42
    .line 43
    const/4 v7, 0x1

    .line 44
    const/4 v8, 0x0

    .line 45
    if-eqz v6, :cond_2

    .line 46
    .line 47
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    if-eqz v6, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    move v6, v8

    .line 55
    goto :goto_1

    .line 56
    :cond_2
    :goto_0
    move v6, v7

    .line 57
    :goto_1
    const/4 v9, 0x0

    .line 58
    const/4 v10, -0x1

    .line 59
    :cond_3
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v11

    .line 63
    if-eqz v11, :cond_d

    .line 64
    .line 65
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v11

    .line 69
    check-cast v11, Ll/txl0;

    .line 70
    .line 71
    iget-object v12, v11, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 72
    .line 73
    sget-object v13, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->PRE_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 74
    .line 75
    if-ne v12, v13, :cond_8

    .line 76
    .line 77
    iget-object v12, v11, Ll/txl0;->b:Ljava/lang/String;

    .line 78
    .line 79
    iget v13, v11, Ll/txl0;->e:I

    .line 80
    .line 81
    invoke-virtual {v0, v12, v13}, Ll/qx2;->w0(Ljava/lang/String;I)Z

    .line 82
    .line 83
    .line 84
    move-result v12

    .line 85
    if-eqz v12, :cond_4

    .line 86
    .line 87
    if-gez v10, :cond_3

    .line 88
    .line 89
    iget v10, v11, Ll/txl0;->e:I

    .line 90
    .line 91
    add-int/2addr v10, v7

    .line 92
    goto :goto_2

    .line 93
    :cond_4
    iget-object v12, v0, Ll/ox2;->i:Ll/vo0;

    .line 94
    .line 95
    iget v13, v11, Ll/txl0;->k:I

    .line 96
    .line 97
    invoke-virtual {v12, v13}, Ll/vo0;->a(I)V

    .line 98
    .line 99
    .line 100
    invoke-interface {v4, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 107
    .line 108
    .line 109
    move-result-object v12

    .line 110
    iget-object v13, v11, Ll/txl0;->a:Landroid/view/View;

    .line 111
    .line 112
    invoke-virtual {v12, v13}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 113
    .line 114
    .line 115
    move-result v12

    .line 116
    sget-boolean v13, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 117
    .line 118
    if-eqz v13, :cond_6

    .line 119
    .line 120
    if-gez v12, :cond_5

    .line 121
    .line 122
    iget-object v12, v11, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 123
    .line 124
    invoke-static {v12}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    iget-object v12, v11, Ll/txl0;->a:Landroid/view/View;

    .line 128
    .line 129
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    .line 130
    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_5
    iget-object v12, v11, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 134
    .line 135
    invoke-static {v12}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    iget-object v12, v11, Ll/txl0;->a:Landroid/view/View;

    .line 139
    .line 140
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    .line 141
    .line 142
    .line 143
    :cond_6
    :goto_3
    invoke-virtual {v0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 144
    .line 145
    .line 146
    move-result-object v12

    .line 147
    iget-object v13, v11, Ll/txl0;->a:Landroid/view/View;

    .line 148
    .line 149
    invoke-virtual {v12, v13}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    if-gez v10, :cond_7

    .line 153
    .line 154
    iget v10, v11, Ll/txl0;->e:I

    .line 155
    .line 156
    :cond_7
    sget-object v11, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_8
    sget-object v14, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 160
    .line 161
    if-eq v12, v14, :cond_a

    .line 162
    .line 163
    sget-object v14, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->INIT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 164
    .line 165
    if-ne v12, v14, :cond_9

    .line 166
    .line 167
    goto :goto_4

    .line 168
    :cond_9
    if-ne v12, v13, :cond_3

    .line 169
    .line 170
    iget v9, v11, Ll/txl0;->e:I

    .line 171
    .line 172
    move v10, v9

    .line 173
    move-object v9, v11

    .line 174
    goto :goto_2

    .line 175
    :cond_a
    :goto_4
    invoke-interface {v4, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 182
    .line 183
    .line 184
    move-result-object v12

    .line 185
    iget-object v13, v11, Ll/txl0;->a:Landroid/view/View;

    .line 186
    .line 187
    invoke-virtual {v12, v13}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 188
    .line 189
    .line 190
    move-result v12

    .line 191
    sget-boolean v13, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 192
    .line 193
    if-eqz v13, :cond_c

    .line 194
    .line 195
    if-gez v12, :cond_b

    .line 196
    .line 197
    iget-object v12, v11, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 198
    .line 199
    invoke-static {v12}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    iget-object v12, v11, Ll/txl0;->a:Landroid/view/View;

    .line 203
    .line 204
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    .line 205
    .line 206
    .line 207
    goto :goto_5

    .line 208
    :cond_b
    iget-object v12, v11, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 209
    .line 210
    invoke-static {v12}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    iget-object v12, v11, Ll/txl0;->a:Landroid/view/View;

    .line 214
    .line 215
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    .line 216
    .line 217
    .line 218
    invoke-virtual {v11}, Ljava/lang/Object;->hashCode()I

    .line 219
    .line 220
    .line 221
    :cond_c
    :goto_5
    invoke-virtual {v0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 222
    .line 223
    .line 224
    move-result-object v12

    .line 225
    iget-object v13, v11, Ll/txl0;->a:Landroid/view/View;

    .line 226
    .line 227
    invoke-virtual {v12, v13}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 228
    .line 229
    .line 230
    if-gez v10, :cond_3

    .line 231
    .line 232
    iget v10, v11, Ll/txl0;->e:I

    .line 233
    .line 234
    goto/16 :goto_2

    .line 235
    .line 236
    :cond_d
    sget-boolean v5, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 237
    .line 238
    const-string v7, "|"

    .line 239
    .line 240
    if-eqz v5, :cond_e

    .line 241
    .line 242
    const-string v5, " setp1:"

    .line 243
    .line 244
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 248
    .line 249
    .line 250
    move-result-wide v11

    .line 251
    sub-long/2addr v11, v1

    .line 252
    invoke-virtual {v3, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 259
    .line 260
    .line 261
    move-result-wide v1

    .line 262
    :cond_e
    if-gez v10, :cond_f

    .line 263
    .line 264
    move v10, v8

    .line 265
    :cond_f
    iget-object v5, v0, Ll/ox2;->e:Ll/nx2;

    .line 266
    .line 267
    invoke-virtual {v5}, Ll/nx2;->f()I

    .line 268
    .line 269
    .line 270
    move-result v5

    .line 271
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 272
    .line 273
    .line 274
    move-result-object v11

    .line 275
    invoke-virtual {v11}, Ll/qn2;->m()I

    .line 276
    .line 277
    .line 278
    move-result v11

    .line 279
    invoke-static {v5, v11}, Ljava/lang/Math;->min(II)I

    .line 280
    .line 281
    .line 282
    move-result v5

    .line 283
    invoke-static {v8, v5}, Ljava/lang/Math;->max(II)I

    .line 284
    .line 285
    .line 286
    move-result v5

    .line 287
    new-instance v11, Ljava/util/ArrayList;

    .line 288
    .line 289
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 290
    .line 291
    .line 292
    new-instance v12, Ljava/util/ArrayList;

    .line 293
    .line 294
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 295
    .line 296
    .line 297
    sget-object v13, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 298
    .line 299
    sget-boolean v13, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 300
    .line 301
    if-eqz v13, :cond_10

    .line 302
    .line 303
    const-string v13, " setp1.1:"

    .line 304
    .line 305
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 309
    .line 310
    .line 311
    move-result-wide v13

    .line 312
    sub-long/2addr v13, v1

    .line 313
    invoke-virtual {v3, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    :cond_10
    move v13, v8

    .line 320
    move v14, v13

    .line 321
    :goto_6
    if-ge v13, v5, :cond_1c

    .line 322
    .line 323
    add-int v15, v13, v10

    .line 324
    .line 325
    iget-object v8, v0, Ll/ox2;->e:Ll/nx2;

    .line 326
    .line 327
    invoke-virtual {v8}, Ll/nx2;->f()I

    .line 328
    .line 329
    .line 330
    move-result v8

    .line 331
    if-lt v15, v8, :cond_11

    .line 332
    .line 333
    move-wide/from16 v16, v1

    .line 334
    .line 335
    goto :goto_7

    .line 336
    :cond_11
    iget-object v8, v0, Ll/ox2;->e:Ll/nx2;

    .line 337
    .line 338
    invoke-virtual {v8, v15}, Ll/nx2;->h(I)I

    .line 339
    .line 340
    .line 341
    move-result v8

    .line 342
    move-wide/from16 v16, v1

    .line 343
    .line 344
    iget-object v1, v0, Ll/ox2;->e:Ll/nx2;

    .line 345
    .line 346
    invoke-virtual {v1, v15}, Ll/nx2;->i(I)Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    if-eqz v9, :cond_12

    .line 351
    .line 352
    iget-object v2, v9, Ll/txl0;->b:Ljava/lang/String;

    .line 353
    .line 354
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 355
    .line 356
    .line 357
    move-result v2

    .line 358
    if-eqz v2, :cond_12

    .line 359
    .line 360
    iget v2, v9, Ll/txl0;->d:I

    .line 361
    .line 362
    if-ne v2, v8, :cond_12

    .line 363
    .line 364
    :goto_7
    move-object/from16 v18, v4

    .line 365
    .line 366
    move/from16 v19, v5

    .line 367
    .line 368
    move/from16 v20, v6

    .line 369
    .line 370
    goto/16 :goto_a

    .line 371
    .line 372
    :cond_12
    sget-boolean v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 373
    .line 374
    if-eqz v2, :cond_13

    .line 375
    .line 376
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 377
    .line 378
    .line 379
    :cond_13
    invoke-virtual {v0, v4, v8, v1}, Ll/qx2;->v0(Ljava/util/List;ILjava/lang/String;)Ll/txl0;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    sget-boolean v18, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 384
    .line 385
    if-eqz v18, :cond_14

    .line 386
    .line 387
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 388
    .line 389
    .line 390
    :cond_14
    if-nez v2, :cond_17

    .line 391
    .line 392
    new-instance v2, Ll/txl0;

    .line 393
    .line 394
    invoke-direct {v2}, Ll/txl0;-><init>()V

    .line 395
    .line 396
    .line 397
    move-object/from16 v18, v4

    .line 398
    .line 399
    iget-object v4, v0, Ll/ox2;->k:Ll/xi80;

    .line 400
    .line 401
    invoke-virtual {v4, v8}, Ll/xi80;->a(I)Landroid/view/View;

    .line 402
    .line 403
    .line 404
    move-result-object v4

    .line 405
    if-nez v4, :cond_15

    .line 406
    .line 407
    invoke-virtual {v0}, Ll/ox2;->r()Landroid/content/Context;

    .line 408
    .line 409
    .line 410
    move-result-object v4

    .line 411
    invoke-static {v4}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 412
    .line 413
    .line 414
    move-result-object v4

    .line 415
    move/from16 v19, v5

    .line 416
    .line 417
    iget-object v5, v0, Ll/ox2;->e:Ll/nx2;

    .line 418
    .line 419
    move/from16 v20, v6

    .line 420
    .line 421
    invoke-virtual {v0}, Ll/ox2;->r()Landroid/content/Context;

    .line 422
    .line 423
    .line 424
    move-result-object v6

    .line 425
    invoke-virtual {v5, v8, v6, v4}, Ll/nx2;->e(ILandroid/content/Context;Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 426
    .line 427
    .line 428
    move-result-object v4

    .line 429
    sget-boolean v5, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 430
    .line 431
    if-eqz v5, :cond_16

    .line 432
    .line 433
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 434
    .line 435
    .line 436
    goto :goto_8

    .line 437
    :cond_15
    move/from16 v19, v5

    .line 438
    .line 439
    move/from16 v20, v6

    .line 440
    .line 441
    sget-boolean v5, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 442
    .line 443
    if-eqz v5, :cond_16

    .line 444
    .line 445
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 446
    .line 447
    .line 448
    :cond_16
    :goto_8
    iput v8, v2, Ll/txl0;->d:I

    .line 449
    .line 450
    iput-object v4, v2, Ll/txl0;->a:Landroid/view/View;

    .line 451
    .line 452
    goto :goto_9

    .line 453
    :cond_17
    move-object/from16 v18, v4

    .line 454
    .line 455
    move/from16 v19, v5

    .line 456
    .line 457
    move/from16 v20, v6

    .line 458
    .line 459
    sget-boolean v4, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 460
    .line 461
    if-eqz v4, :cond_18

    .line 462
    .line 463
    iget-object v4, v2, Ll/txl0;->a:Landroid/view/View;

    .line 464
    .line 465
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 466
    .line 467
    .line 468
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 469
    .line 470
    .line 471
    :cond_18
    :goto_9
    sget-boolean v4, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 472
    .line 473
    if-eqz v4, :cond_19

    .line 474
    .line 475
    iget-object v4, v2, Ll/txl0;->a:Landroid/view/View;

    .line 476
    .line 477
    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 478
    .line 479
    .line 480
    move-result-object v4

    .line 481
    if-eqz v4, :cond_19

    .line 482
    .line 483
    iget-object v4, v2, Ll/txl0;->a:Landroid/view/View;

    .line 484
    .line 485
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 486
    .line 487
    .line 488
    :cond_19
    iget-object v4, v2, Ll/txl0;->a:Landroid/view/View;

    .line 489
    .line 490
    invoke-static {v4}, Ll/qn2;->n(Landroid/view/View;)V

    .line 491
    .line 492
    .line 493
    iget-object v4, v0, Ll/ox2;->e:Ll/nx2;

    .line 494
    .line 495
    invoke-virtual {v4, v15}, Ll/nx2;->g(I)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object v4

    .line 499
    invoke-virtual {v2, v1, v4}, Ll/txl0;->c(Ljava/lang/String;Ljava/lang/Object;)V

    .line 500
    .line 501
    .line 502
    iput v15, v2, Ll/txl0;->e:I

    .line 503
    .line 504
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->INIT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 505
    .line 506
    iput-object v1, v2, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 507
    .line 508
    iput v14, v2, Ll/txl0;->f:I

    .line 509
    .line 510
    invoke-interface {v11, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 511
    .line 512
    .line 513
    iget-object v1, v0, Ll/ox2;->e:Ll/nx2;

    .line 514
    .line 515
    invoke-virtual {v1, v15}, Ll/nx2;->g(I)Ljava/lang/Object;

    .line 516
    .line 517
    .line 518
    move-result-object v1

    .line 519
    instance-of v4, v1, Ll/jk4;

    .line 520
    .line 521
    if-eqz v4, :cond_1a

    .line 522
    .line 523
    check-cast v1, Ll/jk4;

    .line 524
    .line 525
    invoke-virtual {v0, v1, v12, v2}, Ll/qx2;->r0(Ll/jk4;Ljava/util/List;Ll/txl0;)I

    .line 526
    .line 527
    .line 528
    move-result v1

    .line 529
    add-int/2addr v14, v1

    .line 530
    :cond_1a
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 531
    .line 532
    if-eqz v1, :cond_1b

    .line 533
    .line 534
    new-instance v1, Ljava/lang/StringBuilder;

    .line 535
    .line 536
    const-string v2, " setp1.2."

    .line 537
    .line 538
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 539
    .line 540
    .line 541
    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    const-string v2, ":"

    .line 545
    .line 546
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 547
    .line 548
    .line 549
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object v1

    .line 553
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 554
    .line 555
    .line 556
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 557
    .line 558
    .line 559
    move-result-wide v1

    .line 560
    sub-long v1, v1, v16

    .line 561
    .line 562
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 563
    .line 564
    .line 565
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 566
    .line 567
    .line 568
    :cond_1b
    :goto_a
    add-int/lit8 v13, v13, 0x1

    .line 569
    .line 570
    move-wide/from16 v1, v16

    .line 571
    .line 572
    move-object/from16 v4, v18

    .line 573
    .line 574
    move/from16 v5, v19

    .line 575
    .line 576
    move/from16 v6, v20

    .line 577
    .line 578
    const/4 v8, 0x0

    .line 579
    goto/16 :goto_6

    .line 580
    .line 581
    :cond_1c
    move-wide/from16 v16, v1

    .line 582
    .line 583
    move-object/from16 v18, v4

    .line 584
    .line 585
    move/from16 v20, v6

    .line 586
    .line 587
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 588
    .line 589
    if-eqz v1, :cond_1d

    .line 590
    .line 591
    const-string v1, " setp2:"

    .line 592
    .line 593
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 594
    .line 595
    .line 596
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 597
    .line 598
    .line 599
    move-result-wide v1

    .line 600
    sub-long v1, v1, v16

    .line 601
    .line 602
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 603
    .line 604
    .line 605
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 606
    .line 607
    .line 608
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 609
    .line 610
    .line 611
    move-result-wide v1

    .line 612
    goto :goto_b

    .line 613
    :cond_1d
    move-wide/from16 v1, v16

    .line 614
    .line 615
    :goto_b
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->isEmpty()Z

    .line 616
    .line 617
    .line 618
    move-result v4

    .line 619
    if-nez v4, :cond_1e

    .line 620
    .line 621
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 622
    .line 623
    .line 624
    move-result-object v4

    .line 625
    :goto_c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 626
    .line 627
    .line 628
    move-result v5

    .line 629
    if-eqz v5, :cond_1e

    .line 630
    .line 631
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 632
    .line 633
    .line 634
    move-result-object v5

    .line 635
    check-cast v5, Ll/txl0;

    .line 636
    .line 637
    invoke-virtual {v0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 638
    .line 639
    .line 640
    move-result-object v6

    .line 641
    iget-object v8, v5, Ll/txl0;->a:Landroid/view/View;

    .line 642
    .line 643
    invoke-virtual {v6, v8}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 644
    .line 645
    .line 646
    iget-object v6, v0, Ll/ox2;->k:Ll/xi80;

    .line 647
    .line 648
    invoke-virtual {v6, v5}, Ll/xi80;->b(Ll/txl0;)V

    .line 649
    .line 650
    .line 651
    iget-object v6, v0, Ll/ox2;->e:Ll/nx2;

    .line 652
    .line 653
    iget-object v5, v5, Ll/txl0;->a:Landroid/view/View;

    .line 654
    .line 655
    const/4 v8, 0x0

    .line 656
    invoke-virtual {v6, v5, v8}, Ll/nx2;->l(Landroid/view/View;Z)V

    .line 657
    .line 658
    .line 659
    goto :goto_c

    .line 660
    :cond_1e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 661
    .line 662
    .line 663
    sget-boolean v4, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 664
    .line 665
    if-eqz v4, :cond_1f

    .line 666
    .line 667
    invoke-interface {v11}, Ljava/util/List;->size()I

    .line 668
    .line 669
    .line 670
    :cond_1f
    sget-boolean v4, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 671
    .line 672
    if-eqz v4, :cond_20

    .line 673
    .line 674
    const-string v4, " setp3:"

    .line 675
    .line 676
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 677
    .line 678
    .line 679
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 680
    .line 681
    .line 682
    move-result-wide v4

    .line 683
    sub-long/2addr v4, v1

    .line 684
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 685
    .line 686
    .line 687
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 688
    .line 689
    .line 690
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 691
    .line 692
    .line 693
    move-result-wide v1

    .line 694
    :cond_20
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 695
    .line 696
    .line 697
    move-result-object v4

    .line 698
    :cond_21
    :goto_d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 699
    .line 700
    .line 701
    move-result v5

    .line 702
    if-eqz v5, :cond_26

    .line 703
    .line 704
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 705
    .line 706
    .line 707
    move-result-object v5

    .line 708
    check-cast v5, Ll/txl0;

    .line 709
    .line 710
    sget-boolean v6, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 711
    .line 712
    if-eqz v6, :cond_22

    .line 713
    .line 714
    iget-object v6, v5, Ll/txl0;->b:Ljava/lang/String;

    .line 715
    .line 716
    iget-object v6, v5, Ll/txl0;->a:Landroid/view/View;

    .line 717
    .line 718
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    .line 719
    .line 720
    .line 721
    :cond_22
    iget-object v6, v0, Ll/ox2;->a:Ljava/util/List;

    .line 722
    .line 723
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 724
    .line 725
    .line 726
    sget-boolean v6, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 727
    .line 728
    if-eqz v6, :cond_23

    .line 729
    .line 730
    iget-object v6, v5, Ll/txl0;->a:Landroid/view/View;

    .line 731
    .line 732
    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 733
    .line 734
    .line 735
    move-result-object v6

    .line 736
    if-eqz v6, :cond_23

    .line 737
    .line 738
    iget-object v6, v5, Ll/txl0;->a:Landroid/view/View;

    .line 739
    .line 740
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    .line 741
    .line 742
    .line 743
    :cond_23
    invoke-virtual {v0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 744
    .line 745
    .line 746
    move-result-object v6

    .line 747
    iget-object v8, v5, Ll/txl0;->a:Landroid/view/View;

    .line 748
    .line 749
    invoke-virtual {v6, v8}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->s(Landroid/view/View;)V

    .line 750
    .line 751
    .line 752
    invoke-static {v12}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 753
    .line 754
    .line 755
    move-result v6

    .line 756
    iget-object v8, v0, Ll/ox2;->e:Ll/nx2;

    .line 757
    .line 758
    if-eqz v6, :cond_24

    .line 759
    .line 760
    iget-object v6, v5, Ll/txl0;->a:Landroid/view/View;

    .line 761
    .line 762
    iget v9, v5, Ll/txl0;->e:I

    .line 763
    .line 764
    invoke-virtual {v8, v6, v9}, Ll/nx2;->d(Landroid/view/View;I)V

    .line 765
    .line 766
    .line 767
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 768
    .line 769
    goto :goto_e

    .line 770
    :cond_24
    iget-object v6, v5, Ll/txl0;->a:Landroid/view/View;

    .line 771
    .line 772
    iget v9, v5, Ll/txl0;->e:I

    .line 773
    .line 774
    invoke-virtual {v8, v6, v9}, Ll/nx2;->d(Landroid/view/View;I)V

    .line 775
    .line 776
    .line 777
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 778
    .line 779
    :goto_e
    sget-boolean v6, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 780
    .line 781
    if-eqz v6, :cond_25

    .line 782
    .line 783
    const-string v6, " setp bind:"

    .line 784
    .line 785
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 786
    .line 787
    .line 788
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 789
    .line 790
    .line 791
    move-result-wide v8

    .line 792
    sub-long/2addr v8, v1

    .line 793
    invoke-virtual {v3, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 794
    .line 795
    .line 796
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 797
    .line 798
    .line 799
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 800
    .line 801
    .line 802
    move-result-wide v1

    .line 803
    :cond_25
    sget-boolean v6, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 804
    .line 805
    if-eqz v6, :cond_21

    .line 806
    .line 807
    iget-object v5, v5, Ll/txl0;->a:Landroid/view/View;

    .line 808
    .line 809
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    .line 810
    .line 811
    .line 812
    goto :goto_d

    .line 813
    :cond_26
    sget-boolean v4, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 814
    .line 815
    if-eqz v4, :cond_27

    .line 816
    .line 817
    const-string v4, " setp4:"

    .line 818
    .line 819
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 820
    .line 821
    .line 822
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 823
    .line 824
    .line 825
    move-result-wide v4

    .line 826
    sub-long/2addr v4, v1

    .line 827
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 828
    .line 829
    .line 830
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 831
    .line 832
    .line 833
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 834
    .line 835
    .line 836
    move-result-wide v1

    .line 837
    :cond_27
    sget-boolean v4, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 838
    .line 839
    if-eqz v4, :cond_28

    .line 840
    .line 841
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 842
    .line 843
    .line 844
    :cond_28
    if-eqz v20, :cond_29

    .line 845
    .line 846
    invoke-virtual {v0}, Ll/qx2;->s0()V

    .line 847
    .line 848
    .line 849
    goto :goto_f

    .line 850
    :cond_29
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 851
    .line 852
    .line 853
    move-result v4

    .line 854
    if-lez v4, :cond_2a

    .line 855
    .line 856
    iget-object v4, v0, Ll/ox2;->i:Ll/vo0;

    .line 857
    .line 858
    invoke-virtual {v4, v12}, Ll/vo0;->e(Ljava/util/List;)V

    .line 859
    .line 860
    .line 861
    :cond_2a
    :goto_f
    sget-boolean v4, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 862
    .line 863
    if-eqz v4, :cond_2b

    .line 864
    .line 865
    const-string v4, " setp5:"

    .line 866
    .line 867
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 868
    .line 869
    .line 870
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 871
    .line 872
    .line 873
    move-result-wide v4

    .line 874
    sub-long/2addr v4, v1

    .line 875
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 876
    .line 877
    .line 878
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 879
    .line 880
    .line 881
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 882
    .line 883
    .line 884
    move-result-wide v1

    .line 885
    :cond_2b
    sget-boolean v4, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 886
    .line 887
    if-eqz v4, :cond_2c

    .line 888
    .line 889
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 890
    .line 891
    .line 892
    :cond_2c
    iget-object v4, v0, Ll/ox2;->c:Ll/qn2;

    .line 893
    .line 894
    invoke-virtual {v4}, Ll/qn2;->f()V

    .line 895
    .line 896
    .line 897
    sget-boolean v4, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 898
    .line 899
    if-eqz v4, :cond_2d

    .line 900
    .line 901
    const-string v4, " setp6:"

    .line 902
    .line 903
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 904
    .line 905
    .line 906
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 907
    .line 908
    .line 909
    move-result-wide v4

    .line 910
    sub-long/2addr v4, v1

    .line 911
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 912
    .line 913
    .line 914
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 915
    .line 916
    .line 917
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 918
    .line 919
    .line 920
    :cond_2d
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 921
    .line 922
    const-string v1, "notify data "

    .line 923
    .line 924
    invoke-virtual {v0, v1}, Ll/ox2;->Y(Ljava/lang/String;)V

    .line 925
    .line 926
    .line 927
    invoke-virtual {v0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 928
    .line 929
    .line 930
    move-result-object v0

    .line 931
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 932
    .line 933
    .line 934
    return-void
.end method

.method public b()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "notify"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ox2;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r0(Ll/jk4;Ljava/util/List;Ll/txl0;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jk4;",
            "Ljava/util/List<",
            "Ll/nh4;",
            ">;",
            "Ll/txl0;",
            ")I"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/jk4;->getPreBackOperation()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x1

    .line 7
    if-ltz v0, :cond_3

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    if-eq v0, v2, :cond_1

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_3
    :goto_0
    const/4 v0, 0x0

    .line 26
    :goto_1
    invoke-interface {p1}, Ll/jk4;->resetPreAction()V

    .line 27
    .line 28
    .line 29
    if-eqz v0, :cond_8

    .line 30
    .line 31
    iget p1, p3, Ll/txl0;->e:I

    .line 32
    .line 33
    if-nez p1, :cond_8

    .line 34
    .line 35
    sget-boolean p1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 36
    .line 37
    if-eqz p1, :cond_4

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    :cond_4
    new-instance p1, Ll/nh4;

    .line 43
    .line 44
    iget v3, p3, Ll/txl0;->k:I

    .line 45
    .line 46
    invoke-direct {p1, v3, p3}, Ll/nh4;-><init>(ILl/txl0;)V

    .line 47
    .line 48
    .line 49
    new-instance v3, Ll/vo0$a;

    .line 50
    .line 51
    invoke-direct {v3}, Ll/vo0$a;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v3, p1, Ll/nh4;->a:Landroid/view/animation/Interpolator;

    .line 55
    .line 56
    iget-object v3, p0, Ll/ox2;->d:Ll/vr2;

    .line 57
    .line 58
    invoke-virtual {v3}, Ll/vr2;->d()Landroid/view/animation/Interpolator;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iput-object v3, p1, Ll/nh4;->a:Landroid/view/animation/Interpolator;

    .line 63
    .line 64
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_INSERT:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 65
    .line 66
    iput-object v3, p1, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 67
    .line 68
    sget-wide v3, Ll/vo0;->j:J

    .line 69
    .line 70
    iput-wide v3, p1, Ll/nh4;->d:J

    .line 71
    .line 72
    iget-object v3, p0, Ll/ox2;->f:Ll/udj0;

    .line 73
    .line 74
    invoke-virtual {v3}, Ll/udj0;->e()V

    .line 75
    .line 76
    .line 77
    new-instance v3, Ll/mo0;

    .line 78
    .line 79
    invoke-direct {v3}, Ll/mo0;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3}, Ll/mo0;->b()V

    .line 83
    .line 84
    .line 85
    sget-object v4, Ll/qx2$b;->a:[I

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    aget v4, v4, v5

    .line 92
    .line 93
    const/high16 v5, 0x3f800000    # 1.0f

    .line 94
    .line 95
    const/4 v6, 0x0

    .line 96
    if-eq v4, v2, :cond_7

    .line 97
    .line 98
    if-eq v4, v1, :cond_6

    .line 99
    .line 100
    const/4 v1, 0x3

    .line 101
    if-eq v4, v1, :cond_5

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_5
    iput v6, v3, Ll/mo0;->c:F

    .line 105
    .line 106
    iget-object p0, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    int-to-float p0, p0

    .line 113
    const/high16 v1, -0x40800000    # -1.0f

    .line 114
    .line 115
    mul-float/2addr p0, v1

    .line 116
    iput p0, v3, Ll/mo0;->a:F

    .line 117
    .line 118
    iput v5, v3, Ll/mo0;->e:F

    .line 119
    .line 120
    iput v6, v3, Ll/mo0;->g:F

    .line 121
    .line 122
    iget-object v1, p3, Ll/txl0;->a:Landroid/view/View;

    .line 123
    .line 124
    invoke-virtual {v1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_6
    iget-object p0, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    int-to-float p0, p0

    .line 135
    const v1, 0x3f99999a    # 1.2f

    .line 136
    .line 137
    .line 138
    mul-float/2addr p0, v1

    .line 139
    iput p0, v3, Ll/mo0;->c:F

    .line 140
    .line 141
    iput v6, v3, Ll/mo0;->a:F

    .line 142
    .line 143
    iput v5, v3, Ll/mo0;->e:F

    .line 144
    .line 145
    const/high16 p0, -0x3e900000    # -15.0f

    .line 146
    .line 147
    iput p0, v3, Ll/mo0;->g:F

    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_7
    iget-object p0, p0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    int-to-float p0, p0

    .line 157
    const v1, -0x40666666    # -1.2f

    .line 158
    .line 159
    .line 160
    mul-float/2addr p0, v1

    .line 161
    iput p0, v3, Ll/mo0;->c:F

    .line 162
    .line 163
    iput v6, v3, Ll/mo0;->a:F

    .line 164
    .line 165
    iput v5, v3, Ll/mo0;->e:F

    .line 166
    .line 167
    const/high16 p0, 0x41700000    # 15.0f

    .line 168
    .line 169
    iput p0, v3, Ll/mo0;->g:F

    .line 170
    .line 171
    :goto_2
    iput-object v0, p3, Ll/txl0;->i:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 172
    .line 173
    iget p0, p3, Ll/txl0;->k:I

    .line 174
    .line 175
    invoke-virtual {p1, p0}, Ll/nh4;->a(I)V

    .line 176
    .line 177
    .line 178
    iput-object v3, p1, Ll/nh4;->f:Ll/mo0;

    .line 179
    .line 180
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    const/4 p0, -0x1

    .line 184
    return p0

    .line 185
    :cond_8
    const/4 p0, 0x0

    .line 186
    return p0
.end method

.method public final s0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const v2, 0x3f666666    # 0.9f

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/view/View;->setScaleX(F)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, v2}, Landroid/view/View;->setScaleY(F)V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/qx2$a;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/qx2$a;-><init>(Ll/qx2;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 40
    .line 41
    .line 42
    const-wide/16 v1, 0x1f4

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-wide/16 v0, 0xc8

    .line 49
    .line 50
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/high16 v0, 0x3f800000    # 1.0f

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final t0(Ll/txl0;IILjava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/txl0;",
            "II",
            "Ljava/util/List<",
            "Ll/nh4;",
            ">;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/txl0;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0}, Ll/qn2;->n(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ox2;->e:Ll/nx2;

    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ll/nx2;->i(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/ox2;->e:Ll/nx2;

    .line 13
    .line 14
    invoke-virtual {v1, p2}, Ll/nx2;->g(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p1, v0, v1}, Ll/txl0;->c(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iput p2, p1, Ll/txl0;->e:I

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->INIT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 24
    .line 25
    iput-object v0, p1, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 26
    .line 27
    iput p3, p1, Ll/txl0;->f:I

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p1, Ll/txl0;->h:Z

    .line 31
    .line 32
    iget-object v0, p0, Ll/ox2;->e:Ll/nx2;

    .line 33
    .line 34
    invoke-virtual {v0, p2}, Ll/nx2;->g(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    instance-of v0, p2, Ll/jk4;

    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    check-cast p2, Ll/jk4;

    .line 43
    .line 44
    invoke-virtual {p0, p2, p4, p1}, Ll/qx2;->r0(Ll/jk4;Ljava/util/List;Ll/txl0;)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    add-int/2addr p3, p0

    .line 49
    :cond_0
    return p3
.end method

.method public u0()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qx2;->x:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final v0(Ljava/util/List;ILjava/lang/String;)Ll/txl0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/txl0;",
            ">;I",
            "Ljava/lang/String;",
            ")",
            "Ll/txl0;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ll/txl0;

    .line 24
    .line 25
    iget v2, v1, Ll/txl0;->d:I

    .line 26
    .line 27
    if-ne v2, p2, :cond_1

    .line 28
    .line 29
    iget-object v2, v1, Ll/txl0;->b:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 38
    .line 39
    .line 40
    return-object v1

    .line 41
    :cond_2
    invoke-static {p1}, Lcom/google/common/collect/Lists;->q(Ljava/util/List;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    :cond_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_4

    .line 54
    .line 55
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Ll/txl0;

    .line 60
    .line 61
    iget p3, p1, Ll/txl0;->d:I

    .line 62
    .line 63
    if-ne p3, p2, :cond_3

    .line 64
    .line 65
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 66
    .line 67
    .line 68
    return-object p1

    .line 69
    :cond_4
    return-object v0
.end method

.method public final w0(Ljava/lang/String;I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ox2;->e:Ll/nx2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/nx2;->f()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_1

    .line 10
    .line 11
    iget-object v3, p0, Ll/ox2;->e:Ll/nx2;

    .line 12
    .line 13
    invoke-virtual {v3, v2}, Ll/nx2;->i(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    if-ne p2, v2, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return v1
.end method

.method public final x0()V
    .locals 5

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    if-ge v1, v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v4, " : "

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v4, " ,"

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public final y0()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Ll/qx2;->y:Z

    .line 5
    .line 6
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, v0, Ll/ox2;->a:Ljava/util/List;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v2, v3

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    move v2, v1

    .line 23
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    iget-object v4, v0, Ll/ox2;->a:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v4}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v0}, Ll/ox2;->A()Ll/qn2;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {v5}, Ll/qn2;->m()I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    iget-object v6, v0, Ll/ox2;->e:Ll/nx2;

    .line 41
    .line 42
    invoke-virtual {v6}, Ll/nx2;->f()I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    invoke-static {v6, v5}, Ljava/lang/Math;->min(II)I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    new-instance v6, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    const/4 v7, -0x1

    .line 56
    move v9, v3

    .line 57
    move v10, v9

    .line 58
    move v8, v7

    .line 59
    :goto_2
    invoke-interface {v4}, Ljava/util/ListIterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v11

    .line 63
    if-nez v11, :cond_c

    .line 64
    .line 65
    if-ge v9, v5, :cond_2

    .line 66
    .line 67
    goto/16 :goto_6

    .line 68
    .line 69
    :cond_2
    iget-object v4, v0, Ll/ox2;->a:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v4}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    :goto_3
    invoke-interface {v4}, Ljava/util/ListIterator;->hasNext()Z

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    if-eqz v5, :cond_7

    .line 80
    .line 81
    invoke-interface {v4}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    check-cast v5, Ll/txl0;

    .line 86
    .line 87
    iget-boolean v7, v5, Ll/txl0;->g:Z

    .line 88
    .line 89
    if-eqz v7, :cond_3

    .line 90
    .line 91
    iget-object v7, v0, Ll/ox2;->b:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 92
    .line 93
    iget-object v8, v5, Ll/txl0;->a:Landroid/view/View;

    .line 94
    .line 95
    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    iget-object v7, v0, Ll/ox2;->e:Ll/nx2;

    .line 99
    .line 100
    iget-object v8, v5, Ll/txl0;->a:Landroid/view/View;

    .line 101
    .line 102
    invoke-virtual {v7, v8, v3}, Ll/nx2;->l(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    sget-object v7, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v7, v0, Ll/ox2;->k:Ll/xi80;

    .line 108
    .line 109
    invoke-virtual {v7, v5}, Ll/xi80;->b(Ll/txl0;)V

    .line 110
    .line 111
    .line 112
    invoke-interface {v4}, Ljava/util/ListIterator;->remove()V

    .line 113
    .line 114
    .line 115
    goto :goto_4

    .line 116
    :cond_3
    iget-boolean v7, v5, Ll/txl0;->h:Z

    .line 117
    .line 118
    if-eqz v7, :cond_6

    .line 119
    .line 120
    iget-object v7, v0, Ll/ox2;->e:Ll/nx2;

    .line 121
    .line 122
    iget-object v8, v5, Ll/txl0;->a:Landroid/view/View;

    .line 123
    .line 124
    iget v9, v5, Ll/txl0;->e:I

    .line 125
    .line 126
    invoke-virtual {v7, v8, v9}, Ll/nx2;->d(Landroid/view/View;I)V

    .line 127
    .line 128
    .line 129
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 130
    .line 131
    invoke-virtual {v7}, Ll/vr2;->h()Z

    .line 132
    .line 133
    .line 134
    move-result v7

    .line 135
    if-eqz v7, :cond_6

    .line 136
    .line 137
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 138
    .line 139
    invoke-virtual {v7}, Ll/vr2;->a()F

    .line 140
    .line 141
    .line 142
    move-result v7

    .line 143
    const/high16 v8, 0x3f800000    # 1.0f

    .line 144
    .line 145
    cmpg-float v7, v7, v8

    .line 146
    .line 147
    if-gez v7, :cond_6

    .line 148
    .line 149
    iget v7, v5, Ll/txl0;->e:I

    .line 150
    .line 151
    if-ne v7, v1, :cond_4

    .line 152
    .line 153
    iget-object v7, v0, Ll/ox2;->d:Ll/vr2;

    .line 154
    .line 155
    invoke-virtual {v7}, Ll/vr2;->a()F

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    iget-object v9, v0, Ll/ox2;->d:Ll/vr2;

    .line 160
    .line 161
    invoke-virtual {v9}, Ll/vr2;->a()F

    .line 162
    .line 163
    .line 164
    move-result v9

    .line 165
    invoke-static {v9, v7}, Ljava/lang/Math;->max(FF)F

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    invoke-static {v8, v7}, Ljava/lang/Math;->min(FF)F

    .line 170
    .line 171
    .line 172
    move-result v7

    .line 173
    iget-object v8, v5, Ll/txl0;->a:Landroid/view/View;

    .line 174
    .line 175
    invoke-virtual {v8, v7}, Landroid/view/View;->setAlpha(F)V

    .line 176
    .line 177
    .line 178
    goto :goto_4

    .line 179
    :cond_4
    iget-object v9, v5, Ll/txl0;->a:Landroid/view/View;

    .line 180
    .line 181
    const/4 v10, 0x2

    .line 182
    if-ne v7, v10, :cond_5

    .line 183
    .line 184
    const/4 v7, 0x0

    .line 185
    invoke-virtual {v9, v7}, Landroid/view/View;->setAlpha(F)V

    .line 186
    .line 187
    .line 188
    goto :goto_4

    .line 189
    :cond_5
    invoke-virtual {v9, v8}, Landroid/view/View;->setAlpha(F)V

    .line 190
    .line 191
    .line 192
    :cond_6
    :goto_4
    iput-boolean v3, v5, Ll/txl0;->g:Z

    .line 193
    .line 194
    iput-boolean v3, v5, Ll/txl0;->h:Z

    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_7
    if-eqz v2, :cond_8

    .line 198
    .line 199
    invoke-virtual {v0}, Ll/qx2;->s0()V

    .line 200
    .line 201
    .line 202
    goto :goto_5

    .line 203
    :cond_8
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-lez v1, :cond_9

    .line 208
    .line 209
    iget-object v1, v0, Ll/ox2;->i:Ll/vo0;

    .line 210
    .line 211
    invoke-virtual {v1, v6}, Ll/vo0;->e(Ljava/util/List;)V

    .line 212
    .line 213
    .line 214
    :cond_9
    :goto_5
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 215
    .line 216
    if-eqz v1, :cond_a

    .line 217
    .line 218
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 219
    .line 220
    .line 221
    :cond_a
    iget-object v1, v0, Ll/ox2;->c:Ll/qn2;

    .line 222
    .line 223
    invoke-virtual {v1}, Ll/qn2;->f()V

    .line 224
    .line 225
    .line 226
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 227
    .line 228
    if-eqz v1, :cond_b

    .line 229
    .line 230
    iget-object v1, v0, Ll/ox2;->a:Ljava/util/List;

    .line 231
    .line 232
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 233
    .line 234
    .line 235
    :cond_b
    const-string v1, "notify data "

    .line 236
    .line 237
    invoke-virtual {v0, v1}, Ll/ox2;->Y(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    .line 245
    .line 246
    .line 247
    iput-boolean v3, v0, Ll/qx2;->y:Z

    .line 248
    .line 249
    invoke-virtual {v0}, Ll/qx2;->x0()V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0}, Ll/ox2;->s()Ll/kj2;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    iget-object v0, v0, Ll/ox2;->e:Ll/nx2;

    .line 257
    .line 258
    invoke-virtual {v0}, Ll/nx2;->f()I

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    invoke-interface {v1, v0}, Ll/kj2;->a(I)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :cond_c
    :goto_6
    add-int/lit8 v11, v7, 0x1

    .line 267
    .line 268
    invoke-interface {v4}, Ljava/util/ListIterator;->hasNext()Z

    .line 269
    .line 270
    .line 271
    move-result v12

    .line 272
    if-eqz v12, :cond_12

    .line 273
    .line 274
    invoke-interface {v4}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v12

    .line 278
    check-cast v12, Ll/txl0;

    .line 279
    .line 280
    sget-boolean v14, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 281
    .line 282
    if-eqz v14, :cond_d

    .line 283
    .line 284
    iget-object v14, v12, Ll/txl0;->b:Ljava/lang/String;

    .line 285
    .line 286
    :cond_d
    iput-boolean v1, v12, Ll/txl0;->g:Z

    .line 287
    .line 288
    iget-object v14, v12, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 289
    .line 290
    sget-object v15, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->ANIM_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 291
    .line 292
    if-ne v14, v15, :cond_e

    .line 293
    .line 294
    iput-boolean v3, v12, Ll/txl0;->g:Z

    .line 295
    .line 296
    goto :goto_8

    .line 297
    :cond_e
    sget-object v15, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->PRE_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 298
    .line 299
    if-ne v14, v15, :cond_11

    .line 300
    .line 301
    iget-object v14, v12, Ll/txl0;->b:Ljava/lang/String;

    .line 302
    .line 303
    iget v15, v12, Ll/txl0;->e:I

    .line 304
    .line 305
    invoke-virtual {v0, v14, v15}, Ll/qx2;->w0(Ljava/lang/String;I)Z

    .line 306
    .line 307
    .line 308
    move-result v14

    .line 309
    if-eqz v14, :cond_10

    .line 310
    .line 311
    if-gez v8, :cond_f

    .line 312
    .line 313
    iget v7, v12, Ll/txl0;->e:I

    .line 314
    .line 315
    add-int/2addr v7, v1

    .line 316
    move v8, v7

    .line 317
    :cond_f
    iput-boolean v3, v12, Ll/txl0;->g:Z

    .line 318
    .line 319
    :goto_7
    move v7, v11

    .line 320
    goto/16 :goto_2

    .line 321
    .line 322
    :cond_10
    iget-object v14, v0, Ll/ox2;->i:Ll/vo0;

    .line 323
    .line 324
    iget v15, v12, Ll/txl0;->k:I

    .line 325
    .line 326
    invoke-virtual {v14, v15}, Ll/vo0;->a(I)V

    .line 327
    .line 328
    .line 329
    :cond_11
    if-lt v9, v5, :cond_13

    .line 330
    .line 331
    :goto_8
    goto :goto_7

    .line 332
    :cond_12
    const/4 v12, 0x0

    .line 333
    :cond_13
    if-gez v8, :cond_14

    .line 334
    .line 335
    move v8, v3

    .line 336
    :cond_14
    add-int v14, v8, v9

    .line 337
    .line 338
    iget-object v15, v0, Ll/ox2;->e:Ll/nx2;

    .line 339
    .line 340
    invoke-virtual {v15}, Ll/nx2;->f()I

    .line 341
    .line 342
    .line 343
    move-result v15

    .line 344
    if-lt v14, v15, :cond_15

    .line 345
    .line 346
    add-int/lit8 v9, v9, 0x1

    .line 347
    .line 348
    goto :goto_7

    .line 349
    :cond_15
    if-eqz v12, :cond_17

    .line 350
    .line 351
    iget v15, v12, Ll/txl0;->d:I

    .line 352
    .line 353
    iget-object v13, v0, Ll/ox2;->e:Ll/nx2;

    .line 354
    .line 355
    invoke-virtual {v13, v14}, Ll/nx2;->h(I)I

    .line 356
    .line 357
    .line 358
    move-result v13

    .line 359
    if-eq v15, v13, :cond_17

    .line 360
    .line 361
    add-int/lit8 v13, v14, 0x1

    .line 362
    .line 363
    iget-object v15, v0, Ll/ox2;->e:Ll/nx2;

    .line 364
    .line 365
    invoke-virtual {v15}, Ll/nx2;->f()I

    .line 366
    .line 367
    .line 368
    move-result v15

    .line 369
    if-ge v13, v15, :cond_16

    .line 370
    .line 371
    iget v12, v12, Ll/txl0;->d:I

    .line 372
    .line 373
    iget-object v15, v0, Ll/ox2;->e:Ll/nx2;

    .line 374
    .line 375
    invoke-virtual {v15, v13}, Ll/nx2;->h(I)I

    .line 376
    .line 377
    .line 378
    move-result v13

    .line 379
    if-ne v12, v13, :cond_16

    .line 380
    .line 381
    invoke-interface {v4}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 382
    .line 383
    .line 384
    move-result v12

    .line 385
    if-eqz v12, :cond_16

    .line 386
    .line 387
    invoke-interface {v4}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    sget-object v12, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 391
    .line 392
    move v12, v1

    .line 393
    goto :goto_9

    .line 394
    :cond_16
    move v12, v3

    .line 395
    :goto_9
    sget-object v13, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 396
    .line 397
    const/4 v13, 0x0

    .line 398
    goto :goto_a

    .line 399
    :cond_17
    move-object v13, v12

    .line 400
    move v12, v3

    .line 401
    :goto_a
    if-eqz v13, :cond_19

    .line 402
    .line 403
    iget v15, v13, Ll/txl0;->d:I

    .line 404
    .line 405
    iget-object v3, v0, Ll/ox2;->e:Ll/nx2;

    .line 406
    .line 407
    invoke-virtual {v3, v14}, Ll/nx2;->h(I)I

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    if-ne v15, v3, :cond_18

    .line 412
    .line 413
    iget-object v3, v0, Ll/ox2;->e:Ll/nx2;

    .line 414
    .line 415
    iget-object v7, v13, Ll/txl0;->a:Landroid/view/View;

    .line 416
    .line 417
    invoke-virtual {v3, v7, v1}, Ll/nx2;->l(Landroid/view/View;Z)V

    .line 418
    .line 419
    .line 420
    invoke-virtual {v0, v13, v14, v10, v6}, Ll/qx2;->t0(Ll/txl0;IILjava/util/List;)I

    .line 421
    .line 422
    .line 423
    move-result v3

    .line 424
    const/4 v15, 0x0

    .line 425
    iput-boolean v15, v13, Ll/txl0;->g:Z

    .line 426
    .line 427
    add-int/lit8 v9, v9, 0x1

    .line 428
    .line 429
    sget-object v7, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 430
    .line 431
    move/from16 v16, v2

    .line 432
    .line 433
    move v10, v3

    .line 434
    :goto_b
    move v7, v11

    .line 435
    goto :goto_e

    .line 436
    :cond_18
    const/4 v15, 0x0

    .line 437
    goto :goto_c

    .line 438
    :cond_19
    move v15, v3

    .line 439
    :goto_c
    iget-object v3, v0, Ll/ox2;->e:Ll/nx2;

    .line 440
    .line 441
    invoke-virtual {v3, v14}, Ll/nx2;->h(I)I

    .line 442
    .line 443
    .line 444
    move-result v3

    .line 445
    new-instance v13, Ll/txl0;

    .line 446
    .line 447
    invoke-direct {v13}, Ll/txl0;-><init>()V

    .line 448
    .line 449
    .line 450
    iget-object v1, v0, Ll/ox2;->k:Ll/xi80;

    .line 451
    .line 452
    invoke-virtual {v1, v3}, Ll/xi80;->a(I)Landroid/view/View;

    .line 453
    .line 454
    .line 455
    move-result-object v1

    .line 456
    if-nez v1, :cond_1a

    .line 457
    .line 458
    invoke-virtual {v0}, Ll/ox2;->r()Landroid/content/Context;

    .line 459
    .line 460
    .line 461
    move-result-object v1

    .line 462
    invoke-static {v1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 463
    .line 464
    .line 465
    move-result-object v1

    .line 466
    iget-object v15, v0, Ll/ox2;->e:Ll/nx2;

    .line 467
    .line 468
    move/from16 v16, v2

    .line 469
    .line 470
    invoke-virtual {v0}, Ll/ox2;->r()Landroid/content/Context;

    .line 471
    .line 472
    .line 473
    move-result-object v2

    .line 474
    invoke-virtual {v15, v3, v2, v1}, Ll/nx2;->e(ILandroid/content/Context;Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 475
    .line 476
    .line 477
    move-result-object v1

    .line 478
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 479
    .line 480
    goto :goto_d

    .line 481
    :cond_1a
    move/from16 v16, v2

    .line 482
    .line 483
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 484
    .line 485
    :goto_d
    iput v3, v13, Ll/txl0;->d:I

    .line 486
    .line 487
    iput-object v1, v13, Ll/txl0;->a:Landroid/view/View;

    .line 488
    .line 489
    invoke-virtual {v0, v13, v14, v10, v6}, Ll/qx2;->t0(Ll/txl0;IILjava/util/List;)I

    .line 490
    .line 491
    .line 492
    move-result v1

    .line 493
    invoke-virtual {v0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 494
    .line 495
    .line 496
    move-result-object v2

    .line 497
    iget-object v3, v13, Ll/txl0;->a:Landroid/view/View;

    .line 498
    .line 499
    invoke-virtual {v0}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 500
    .line 501
    .line 502
    move-result-object v10

    .line 503
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getChildCount()I

    .line 504
    .line 505
    .line 506
    move-result v10

    .line 507
    invoke-static {v11, v10}, Ljava/lang/Math;->min(II)I

    .line 508
    .line 509
    .line 510
    move-result v10

    .line 511
    invoke-virtual {v2, v3, v10}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->t(Landroid/view/View;I)V

    .line 512
    .line 513
    .line 514
    if-nez v12, :cond_1b

    .line 515
    .line 516
    add-int/lit8 v11, v7, 0x2

    .line 517
    .line 518
    :cond_1b
    add-int/lit8 v9, v9, 0x1

    .line 519
    .line 520
    invoke-interface {v4, v13}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 521
    .line 522
    .line 523
    iget-object v2, v0, Ll/ox2;->c:Ll/qn2;

    .line 524
    .line 525
    iget-object v3, v13, Ll/txl0;->a:Landroid/view/View;

    .line 526
    .line 527
    invoke-virtual {v2, v3, v14, v13}, Ll/qn2;->h(Landroid/view/View;ILl/txl0;)V

    .line 528
    .line 529
    .line 530
    move v10, v1

    .line 531
    goto :goto_b

    .line 532
    :goto_e
    move/from16 v2, v16

    .line 533
    .line 534
    const/4 v1, 0x1

    .line 535
    const/4 v3, 0x0

    .line 536
    goto/16 :goto_2
.end method

.method public z0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ox2;->G()Ll/txl0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/ox2;->i:Ll/vo0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/vo0;->b()V

    .line 10
    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;->RENDING:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 13
    .line 14
    iput-object v1, v0, Ll/txl0;->j:Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 15
    .line 16
    new-instance v2, Ll/nh4;

    .line 17
    .line 18
    iget v3, v0, Ll/txl0;->k:I

    .line 19
    .line 20
    invoke-direct {v2, v3, v0}, Ll/nh4;-><init>(ILl/txl0;)V

    .line 21
    .line 22
    .line 23
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 24
    .line 25
    iput-object v3, v2, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 26
    .line 27
    iget v0, v0, Ll/txl0;->k:I

    .line 28
    .line 29
    invoke-virtual {v2, v0}, Ll/nh4;->a(I)V

    .line 30
    .line 31
    .line 32
    filled-new-array {v1}, [Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v2, v0}, Ll/nh4;->b([Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/mo0;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/mo0;-><init>()V

    .line 42
    .line 43
    .line 44
    sget-wide v3, Ll/vo0;->k:J

    .line 45
    .line 46
    iput-wide v3, v2, Ll/nh4;->d:J

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    iput v3, v2, Ll/nh4;->e:I

    .line 50
    .line 51
    filled-new-array {v1}, [Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v2, v1}, Ll/nh4;->b([Lcom/p1/mobile/putong/core/newui/home/opt/VirtualState;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/ox2;->G()Ll/txl0;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v1, v1, Ll/txl0;->a:Landroid/view/View;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/mo0;->e(Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ll/mo0;->b()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v0}, Ll/nh4;->n(Ll/mo0;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/ox2;->i:Ll/vo0;

    .line 74
    .line 75
    filled-new-array {v2}, [Ll/nh4;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Ll/vo0;->d([Ll/nh4;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    return-void
.end method
