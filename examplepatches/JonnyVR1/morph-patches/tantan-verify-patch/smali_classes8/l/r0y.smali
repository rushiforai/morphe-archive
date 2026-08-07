.class public Ll/r0y;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/z0y;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/data/Gender;

.field public i:Ljava/lang/String;

.field public j:Z

.field public k:I

.field public l:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Picture;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Video;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public o:Z

.field public p:Ljava/lang/String;

.field public q:Ll/wzx;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/r0y;->o:Z

    .line 6
    .line 7
    return-void
.end method

.method private synthetic G0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->m(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/z0y;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Ll/z0y;->E(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic H0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/z0y;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/z0y;->w(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic I0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/z0y;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/z0y;->O(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic J0(Ljava/util/List;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/r0y;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 19
    .line 20
    new-instance v3, Ll/f0y;

    .line 21
    .line 22
    invoke-direct {v3, v2}, Ll/f0y;-><init>(Lcom/p1/mobile/putong/data/Media;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->f()V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method private synthetic P0(Landroid/os/Bundle;)V
    .locals 12

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v0, p1

    .line 4
    check-cast v0, Ll/z0y;

    .line 5
    .line 6
    iget v1, p0, Ll/r0y;->f:I

    .line 7
    .line 8
    iget-object v2, p0, Ll/r0y;->i:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v3, p0, Ll/r0y;->g:Ljava/lang/String;

    .line 11
    .line 12
    iget-boolean v4, p0, Ll/r0y;->c:Z

    .line 13
    .line 14
    iget v5, p0, Ll/r0y;->a:I

    .line 15
    .line 16
    iget-boolean v6, p0, Ll/r0y;->j:Z

    .line 17
    .line 18
    iget-object v7, p0, Ll/r0y;->h:Lcom/p1/mobile/putong/data/Gender;

    .line 19
    .line 20
    invoke-virtual/range {v0 .. v7}, Ll/z0y;->C(ILjava/lang/String;Ljava/lang/String;ZIZLcom/p1/mobile/putong/data/Gender;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p1, Ll/z0y;

    .line 26
    .line 27
    iget v0, p0, Ll/r0y;->a:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/z0y;->B(I)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p1, Ll/z0y;

    .line 35
    .line 36
    iget v0, p0, Ll/r0y;->f:I

    .line 37
    .line 38
    iget-boolean v1, p0, Ll/r0y;->c:Z

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Ll/z0y;->z(IZ)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    move-object v0, p1

    .line 46
    check-cast v0, Ll/z0y;

    .line 47
    .line 48
    iget v1, p0, Ll/r0y;->a:I

    .line 49
    .line 50
    iget v2, p0, Ll/r0y;->f:I

    .line 51
    .line 52
    iget-boolean v3, p0, Ll/r0y;->c:Z

    .line 53
    .line 54
    iget v4, p0, Ll/r0y;->k:I

    .line 55
    .line 56
    iget-boolean v5, p0, Ll/r0y;->j:Z

    .line 57
    .line 58
    iget-object v6, p0, Ll/r0y;->h:Lcom/p1/mobile/putong/data/Gender;

    .line 59
    .line 60
    iget-boolean v7, p0, Ll/r0y;->b:Z

    .line 61
    .line 62
    invoke-virtual/range {v0 .. v7}, Ll/z0y;->A(IIZIZLcom/p1/mobile/putong/data/Gender;Z)V

    .line 63
    .line 64
    .line 65
    iget p1, p0, Ll/r0y;->f:I

    .line 66
    .line 67
    sget v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 68
    .line 69
    if-ne p1, v0, :cond_0

    .line 70
    .line 71
    new-instance p1, Ll/j0y;

    .line 72
    .line 73
    invoke-direct {p1}, Ll/j0y;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance v0, Ll/p0y;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Ll/p0y;-><init>(Ll/r0y;)V

    .line 83
    .line 84
    .line 85
    new-instance v1, Ll/q0y;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/q0y;-><init>(Ll/r0y;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    new-instance p1, Ll/yzx;

    .line 98
    .line 99
    invoke-direct {p1}, Ll/yzx;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    new-instance v0, Ll/zzx;

    .line 107
    .line 108
    invoke-direct {v0, p0}, Ll/zzx;-><init>(Ll/r0y;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 116
    .line 117
    .line 118
    goto/16 :goto_3

    .line 119
    .line 120
    :cond_0
    iget p1, p0, Ll/r0y;->a:I

    .line 121
    .line 122
    const/4 v0, 0x0

    .line 123
    const/4 v1, 0x1

    .line 124
    if-lez p1, :cond_1

    .line 125
    .line 126
    move v5, v1

    .line 127
    goto :goto_0

    .line 128
    :cond_1
    move v5, v0

    .line 129
    :goto_0
    iget-boolean v6, p0, Ll/r0y;->c:Z

    .line 130
    .line 131
    new-instance p1, Ll/zux;

    .line 132
    .line 133
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-direct {p1, v2, v5, v6}, Ll/zux;-><init>(Landroid/content/Context;ZZ)V

    .line 138
    .line 139
    .line 140
    if-eqz v5, :cond_2

    .line 141
    .line 142
    invoke-virtual {p1}, Ll/zux;->s()Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    new-instance v3, Ll/a0y;

    .line 147
    .line 148
    invoke-direct {v3, p0}, Ll/a0y;-><init>(Ll/r0y;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1}, Ll/zux;->s()Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    iget-object v3, p0, Ll/r0y;->l:Ll/qcj;

    .line 163
    .line 164
    invoke-static {v3}, Ll/zux;->n(Ll/qcj;)Lrx/c$d;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    invoke-virtual {v2, v3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    new-instance v3, Ll/b0y;

    .line 173
    .line 174
    invoke-direct {v3}, Ll/b0y;-><init>()V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    new-instance v3, Ll/c0y;

    .line 182
    .line 183
    invoke-direct {v3, p0}, Ll/c0y;-><init>(Ll/r0y;)V

    .line 184
    .line 185
    .line 186
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 191
    .line 192
    .line 193
    :cond_2
    if-eqz v6, :cond_3

    .line 194
    .line 195
    invoke-virtual {p1}, Ll/zux;->t()Lrx/c;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    new-instance v3, Ll/d0y;

    .line 200
    .line 201
    invoke-direct {v3, p0}, Ll/d0y;-><init>(Ll/r0y;)V

    .line 202
    .line 203
    .line 204
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p1}, Ll/zux;->t()Lrx/c;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    iget-object v3, p0, Ll/r0y;->m:Ll/qcj;

    .line 216
    .line 217
    invoke-static {v3}, Ll/zux;->n(Ll/qcj;)Lrx/c$d;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-virtual {v2, v3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    new-instance v3, Ll/e0y;

    .line 226
    .line 227
    invoke-direct {v3}, Ll/e0y;-><init>()V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    new-instance v3, Ll/k0y;

    .line 235
    .line 236
    invoke-direct {v3, p0}, Ll/k0y;-><init>(Ll/r0y;)V

    .line 237
    .line 238
    .line 239
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 244
    .line 245
    .line 246
    :cond_3
    invoke-virtual {p1}, Ll/zux;->q()Lrx/c;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    new-instance v3, Ll/l0y;

    .line 251
    .line 252
    invoke-direct {v3, p0}, Ll/l0y;-><init>(Ll/r0y;)V

    .line 253
    .line 254
    .line 255
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 260
    .line 261
    .line 262
    iget-object v2, p0, Ll/r0y;->g:Ljava/lang/String;

    .line 263
    .line 264
    sget-object v3, Ll/fph0;->a:Ljava/lang/String;

    .line 265
    .line 266
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    if-nez v2, :cond_a

    .line 271
    .line 272
    iget-object v2, p0, Ll/r0y;->g:Ljava/lang/String;

    .line 273
    .line 274
    const-string v3, "sign_up_select_image"

    .line 275
    .line 276
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 277
    .line 278
    .line 279
    move-result v2

    .line 280
    if-eqz v2, :cond_4

    .line 281
    .line 282
    goto :goto_1

    .line 283
    :cond_4
    iget-object v2, p0, Ll/r0y;->g:Ljava/lang/String;

    .line 284
    .line 285
    sget-object v3, Ll/fph0;->e:Ljava/lang/String;

    .line 286
    .line 287
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    if-eqz v2, :cond_5

    .line 292
    .line 293
    sget-object v2, Ll/fph0;->e:Ljava/lang/String;

    .line 294
    .line 295
    goto :goto_2

    .line 296
    :cond_5
    iget-object v2, p0, Ll/r0y;->g:Ljava/lang/String;

    .line 297
    .line 298
    sget-object v3, Ll/fph0;->d:Ljava/lang/String;

    .line 299
    .line 300
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 301
    .line 302
    .line 303
    move-result v2

    .line 304
    if-eqz v2, :cond_6

    .line 305
    .line 306
    sget-object v2, Ll/fph0;->d:Ljava/lang/String;

    .line 307
    .line 308
    goto :goto_2

    .line 309
    :cond_6
    iget-object v2, p0, Ll/r0y;->g:Ljava/lang/String;

    .line 310
    .line 311
    sget-object v3, Ll/fph0;->f:Ljava/lang/String;

    .line 312
    .line 313
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 314
    .line 315
    .line 316
    move-result v2

    .line 317
    if-eqz v2, :cond_7

    .line 318
    .line 319
    sget-object v2, Ll/fph0;->f:Ljava/lang/String;

    .line 320
    .line 321
    goto :goto_2

    .line 322
    :cond_7
    iget-object v2, p0, Ll/r0y;->g:Ljava/lang/String;

    .line 323
    .line 324
    sget-object v3, Ll/fph0;->c:Ljava/lang/String;

    .line 325
    .line 326
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 327
    .line 328
    .line 329
    move-result v2

    .line 330
    if-eqz v2, :cond_8

    .line 331
    .line 332
    sget-object v2, Ll/fph0;->c:Ljava/lang/String;

    .line 333
    .line 334
    goto :goto_2

    .line 335
    :cond_8
    iget-object v2, p0, Ll/r0y;->g:Ljava/lang/String;

    .line 336
    .line 337
    const-string v3, "fakeView"

    .line 338
    .line 339
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 340
    .line 341
    .line 342
    move-result v2

    .line 343
    if-eqz v2, :cond_9

    .line 344
    .line 345
    sget-object v2, Ll/fph0;->g:Ljava/lang/String;

    .line 346
    .line 347
    goto :goto_2

    .line 348
    :cond_9
    sget-object v2, Ll/fph0;->b:Ljava/lang/String;

    .line 349
    .line 350
    goto :goto_2

    .line 351
    :cond_a
    :goto_1
    sget-object v2, Ll/fph0;->a:Ljava/lang/String;

    .line 352
    .line 353
    :goto_2
    new-instance v9, Ll/r0y$a;

    .line 354
    .line 355
    invoke-direct {v9, p0, v2}, Ll/r0y$a;-><init>(Ll/r0y;Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    new-instance v10, Ll/r0y$b;

    .line 359
    .line 360
    invoke-direct {v10, p0, v2}, Ll/r0y$b;-><init>(Ll/r0y;Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    new-instance v11, Ll/r0y$c;

    .line 364
    .line 365
    invoke-direct {v11, p0, v2}, Ll/r0y$c;-><init>(Ll/r0y;Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    invoke-static {}, Ll/wzx;->k()Z

    .line 369
    .line 370
    .line 371
    move-result v2

    .line 372
    if-eqz v2, :cond_b

    .line 373
    .line 374
    new-instance v2, Ll/wzx;

    .line 375
    .line 376
    invoke-direct {v2}, Ll/wzx;-><init>()V

    .line 377
    .line 378
    .line 379
    iput-object v2, p0, Ll/r0y;->q:Ll/wzx;

    .line 380
    .line 381
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 382
    .line 383
    .line 384
    move-result-object v3

    .line 385
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    sget v1, Ll/adc0;->u9:I

    .line 390
    .line 391
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 392
    .line 393
    .line 394
    move-result-object v4

    .line 395
    new-instance v7, Ll/m0y;

    .line 396
    .line 397
    invoke-direct {v7, p0, p1}, Ll/m0y;-><init>(Ll/r0y;Ll/zux;)V

    .line 398
    .line 399
    .line 400
    const/4 v8, 0x0

    .line 401
    invoke-virtual/range {v2 .. v11}, Ll/wzx;->e(Landroid/app/Activity;Landroid/view/View;ZZLl/x20;Ll/y20;Ll/l6e;Ll/k6e;Ll/j6e;)V

    .line 402
    .line 403
    .line 404
    goto :goto_3

    .line 405
    :cond_b
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 406
    .line 407
    .line 408
    move-result-object v2

    .line 409
    const-string v3, "android.permission.READ_EXTERNAL_STORAGE"

    .line 410
    .line 411
    filled-new-array {v3}, [Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object v3

    .line 415
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 416
    .line 417
    .line 418
    move-result-object v2

    .line 419
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    new-instance v1, Ll/n0y;

    .line 432
    .line 433
    invoke-direct {v1, p0, p1}, Ll/n0y;-><init>(Ll/r0y;Ll/zux;)V

    .line 434
    .line 435
    .line 436
    new-instance p1, Ll/o0y;

    .line 437
    .line 438
    invoke-direct {p1, p0}, Ll/o0y;-><init>(Ll/r0y;)V

    .line 439
    .line 440
    .line 441
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 442
    .line 443
    .line 444
    move-result-object p1

    .line 445
    invoke-virtual {p1, v11}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->p(Ll/j6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 446
    .line 447
    .line 448
    move-result-object p1

    .line 449
    invoke-virtual {p1, v10}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->t(Ll/k6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 450
    .line 451
    .line 452
    move-result-object p1

    .line 453
    invoke-virtual {p1, v9}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->v(Ll/l6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 454
    .line 455
    .line 456
    move-result-object p1

    .line 457
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 462
    .line 463
    .line 464
    :goto_3
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 465
    .line 466
    check-cast p1, Ll/z0y;

    .line 467
    .line 468
    iget-boolean v0, p0, Ll/r0y;->e:Z

    .line 469
    .line 470
    invoke-virtual {p1, v0}, Ll/z0y;->S(Z)V

    .line 471
    .line 472
    .line 473
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 474
    .line 475
    .line 476
    move-result-object p1

    .line 477
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->a()Ll/bo;

    .line 478
    .line 479
    .line 480
    move-result-object p1

    .line 481
    invoke-interface {p1}, Ll/bo;->a()Z

    .line 482
    .line 483
    .line 484
    move-result p1

    .line 485
    if-eqz p1, :cond_c

    .line 486
    .line 487
    iget-object p1, p0, Ll/r0y;->g:Ljava/lang/String;

    .line 488
    .line 489
    const-string v0, "from_sign_up"

    .line 490
    .line 491
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 492
    .line 493
    .line 494
    move-result p1

    .line 495
    if-eqz p1, :cond_c

    .line 496
    .line 497
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 498
    .line 499
    check-cast p1, Ll/z0y;

    .line 500
    .line 501
    iget-object p0, p0, Ll/r0y;->h:Lcom/p1/mobile/putong/data/Gender;

    .line 502
    .line 503
    const-string v0, "female"

    .line 504
    .line 505
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 506
    .line 507
    .line 508
    move-result p0

    .line 509
    invoke-virtual {p1, p0}, Ll/z0y;->J(Z)V

    .line 510
    .line 511
    .line 512
    :cond_c
    return-void
.end method

.method private synthetic Q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/z0y;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/z0y;->x()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic R0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/z0y;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/z0y;->y(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic U0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/z0y;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/z0y;->M(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/r0y;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r0y;->J0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic f0(Ll/r0y;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r0y;->I0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic g0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->a0:Lcom/p1/mobile/putong/api/api/FacebookApi;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->l()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static synthetic h0(Ll/r0y;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r0y;->S0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic i0(Ljava/util/List;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    new-instance v1, Ll/g0y;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/g0y;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static synthetic j0(Ll/r0y;Ll/zux;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r0y;->L0(Ll/zux;)V

    return-void
.end method

.method public static synthetic k0(Ll/r0y;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r0y;->O0(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.method public static synthetic l0(Ll/r0y;Ll/zux;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r0y;->N0(Ll/zux;)V

    return-void
.end method

.method public static synthetic m0(Ll/v2i0;)Ll/ewi;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ewi;->b(Ll/v2i0;)Ll/ewi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n0(Ll/r0y;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r0y;->G0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic p0(Ll/r0y;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r0y;->H0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic q0(Ll/v2i0;)Ll/ewi;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ewi;->b(Ll/v2i0;)Ll/ewi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r0(Ljava/util/List;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    new-instance v1, Ll/h0y;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/h0y;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static synthetic s0(Ll/r0y;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r0y;->P0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic t0(Ll/r0y;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r0y;->R0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic u0(Ll/r0y;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r0y;->V0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic x0(Ll/r0y;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r0y;->U0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic y0(Ll/r0y;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r0y;->Q0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic z0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->a0:Lcom/p1/mobile/putong/api/api/FacebookApi;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->t()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method


# virtual methods
.method public A0(Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Picture;",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r0y;->l:Ll/qcj;

    .line 2
    .line 3
    return-void
.end method

.method public C0(Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Video;",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r0y;->m:Ll/qcj;

    .line 2
    .line 3
    return-void
.end method

.method public D0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/z0y;

    .line 4
    .line 5
    iget-object p0, p0, Ll/r0y;->n:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/z0y;->v(Ljava/util/ArrayList;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public E0(Ll/ewi;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/z0y;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/z0y;->Q(Ll/ewi;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Ll/r0y;->f:I

    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    sget-object v0, Ll/uqb0;->a0:Lcom/p1/mobile/putong/api/api/FacebookApi;

    .line 15
    .line 16
    iget-object p1, p1, Ll/ewi;->b:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->y(Ljava/lang/String;Z)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v0, Ll/uxj0;->b:Ll/y20;

    .line 24
    .line 25
    new-instance v1, Ll/i0y;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/i0y;-><init>(Ll/r0y;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/z0y;

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    invoke-virtual {p1, v0}, Ll/z0y;->E(Z)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast v0, Ll/z0y;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ll/z0y;->s(Ll/ewi;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast p0, Ll/z0y;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/z0y;->u()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public F0(IZZZZILjava/lang/String;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;ZLl/uyh0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/r0y;->a:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/r0y;->b:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/r0y;->c:Z

    .line 6
    .line 7
    iput-boolean p4, p0, Ll/r0y;->d:Z

    .line 8
    .line 9
    iput-boolean p5, p0, Ll/r0y;->e:Z

    .line 10
    .line 11
    iput p6, p0, Ll/r0y;->f:I

    .line 12
    .line 13
    iput-object p7, p0, Ll/r0y;->g:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p8, p0, Ll/r0y;->h:Lcom/p1/mobile/putong/data/Gender;

    .line 16
    .line 17
    iput-object p9, p0, Ll/r0y;->i:Ljava/lang/String;

    .line 18
    .line 19
    iput-boolean p10, p0, Ll/r0y;->j:Z

    .line 20
    .line 21
    iput p12, p0, Ll/r0y;->k:I

    .line 22
    .line 23
    return-void
.end method

.method public final synthetic L0(Ll/zux;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1, p1}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic N0(Ll/zux;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1, p1}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic O0(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic S0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/z0y;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/z0y;->L(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic V0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/z0y;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/z0y;->N(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public W0(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r0y;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-void
.end method

.method public X0(Ljava/lang/String;)Ll/r0y;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r0y;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public Y0(Z)Ll/r0y;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/r0y;->o:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xzx;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/xzx;-><init>(Ll/r0y;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
