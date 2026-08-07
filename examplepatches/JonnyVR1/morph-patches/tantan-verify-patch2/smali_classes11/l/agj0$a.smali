.class public Ll/agj0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/agj0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:Z

.field public l:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public m:I

.field public n:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public o:I

.field public p:I

.field public q:I

.field public r:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public s:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public t:I

.field public u:I

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ll/dfj0;",
            "Ll/yfj0;",
            ">;"
        }
    .end annotation
.end field

.field public z:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 432
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    .line 433
    iput v0, p0, Ll/agj0$a;->a:I

    .line 434
    iput v0, p0, Ll/agj0$a;->b:I

    .line 435
    iput v0, p0, Ll/agj0$a;->c:I

    .line 436
    iput v0, p0, Ll/agj0$a;->d:I

    .line 437
    iput v0, p0, Ll/agj0$a;->i:I

    .line 438
    iput v0, p0, Ll/agj0$a;->j:I

    const/4 v1, 0x1

    .line 439
    iput-boolean v1, p0, Ll/agj0$a;->k:Z

    .line 440
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    iput-object v1, p0, Ll/agj0$a;->l:Lcom/google/common/collect/ImmutableList;

    const/4 v1, 0x0

    .line 441
    iput v1, p0, Ll/agj0$a;->m:I

    .line 442
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    iput-object v2, p0, Ll/agj0$a;->n:Lcom/google/common/collect/ImmutableList;

    .line 443
    iput v1, p0, Ll/agj0$a;->o:I

    .line 444
    iput v0, p0, Ll/agj0$a;->p:I

    .line 445
    iput v0, p0, Ll/agj0$a;->q:I

    .line 446
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Ll/agj0$a;->r:Lcom/google/common/collect/ImmutableList;

    .line 447
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Ll/agj0$a;->s:Lcom/google/common/collect/ImmutableList;

    .line 448
    iput v1, p0, Ll/agj0$a;->t:I

    .line 449
    iput v1, p0, Ll/agj0$a;->u:I

    .line 450
    iput-boolean v1, p0, Ll/agj0$a;->v:Z

    .line 451
    iput-boolean v1, p0, Ll/agj0$a;->w:Z

    .line 452
    iput-boolean v1, p0, Ll/agj0$a;->x:Z

    .line 453
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ll/agj0$a;->y:Ljava/util/HashMap;

    .line 454
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Ll/agj0$a;->z:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 427
    invoke-direct {p0}, Ll/agj0$a;-><init>()V

    .line 428
    invoke-virtual {p0, p1}, Ll/agj0$a;->H(Landroid/content/Context;)Ll/agj0$a;

    const/4 v0, 0x1

    .line 429
    invoke-virtual {p0, p1, v0}, Ll/agj0$a;->L(Landroid/content/Context;Z)Ll/agj0$a;

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/agj0;->a()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Ll/agj0;->A:Ll/agj0;

    .line 9
    .line 10
    iget v2, v1, Ll/agj0;->a:I

    .line 11
    .line 12
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Ll/agj0$a;->a:I

    .line 17
    .line 18
    invoke-static {}, Ll/agj0;->b()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget v2, v1, Ll/agj0;->b:I

    .line 23
    .line 24
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Ll/agj0$a;->b:I

    .line 29
    .line 30
    invoke-static {}, Ll/agj0;->m()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget v2, v1, Ll/agj0;->c:I

    .line 35
    .line 36
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Ll/agj0$a;->c:I

    .line 41
    .line 42
    invoke-static {}, Ll/agj0;->t()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget v2, v1, Ll/agj0;->d:I

    .line 47
    .line 48
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Ll/agj0$a;->d:I

    .line 53
    .line 54
    invoke-static {}, Ll/agj0;->u()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget v2, v1, Ll/agj0;->e:I

    .line 59
    .line 60
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput v0, p0, Ll/agj0$a;->e:I

    .line 65
    .line 66
    invoke-static {}, Ll/agj0;->v()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget v2, v1, Ll/agj0;->f:I

    .line 71
    .line 72
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iput v0, p0, Ll/agj0$a;->f:I

    .line 77
    .line 78
    invoke-static {}, Ll/agj0;->w()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget v2, v1, Ll/agj0;->g:I

    .line 83
    .line 84
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iput v0, p0, Ll/agj0$a;->g:I

    .line 89
    .line 90
    invoke-static {}, Ll/agj0;->x()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget v2, v1, Ll/agj0;->h:I

    .line 95
    .line 96
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iput v0, p0, Ll/agj0$a;->h:I

    .line 101
    .line 102
    invoke-static {}, Ll/agj0;->y()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iget v2, v1, Ll/agj0;->i:I

    .line 107
    .line 108
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    iput v0, p0, Ll/agj0$a;->i:I

    .line 113
    .line 114
    invoke-static {}, Ll/agj0;->z()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget v2, v1, Ll/agj0;->j:I

    .line 119
    .line 120
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    iput v0, p0, Ll/agj0$a;->j:I

    .line 125
    .line 126
    invoke-static {}, Ll/agj0;->c()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-boolean v2, v1, Ll/agj0;->k:Z

    .line 131
    .line 132
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    iput-boolean v0, p0, Ll/agj0$a;->k:Z

    .line 137
    .line 138
    invoke-static {}, Ll/agj0;->d()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    const/4 v2, 0x0

    .line 147
    new-array v3, v2, [Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v0, v3}, Lcom/google/common/base/a;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, [Ljava/lang/String;

    .line 154
    .line 155
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, p0, Ll/agj0$a;->l:Lcom/google/common/collect/ImmutableList;

    .line 160
    .line 161
    invoke-static {}, Ll/agj0;->e()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget v3, v1, Ll/agj0;->m:I

    .line 166
    .line 167
    invoke-virtual {p1, v0, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    iput v0, p0, Ll/agj0$a;->m:I

    .line 172
    .line 173
    invoke-static {}, Ll/agj0;->f()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    new-array v3, v2, [Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {v0, v3}, Lcom/google/common/base/a;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    check-cast v0, [Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v0}, Ll/agj0$a;->D([Ljava/lang/String;)Lcom/google/common/collect/ImmutableList;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    iput-object v0, p0, Ll/agj0$a;->n:Lcom/google/common/collect/ImmutableList;

    .line 194
    .line 195
    invoke-static {}, Ll/agj0;->g()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iget v3, v1, Ll/agj0;->o:I

    .line 200
    .line 201
    invoke-virtual {p1, v0, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    iput v0, p0, Ll/agj0$a;->o:I

    .line 206
    .line 207
    invoke-static {}, Ll/agj0;->h()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iget v3, v1, Ll/agj0;->p:I

    .line 212
    .line 213
    invoke-virtual {p1, v0, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    iput v0, p0, Ll/agj0$a;->p:I

    .line 218
    .line 219
    invoke-static {}, Ll/agj0;->i()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iget v3, v1, Ll/agj0;->q:I

    .line 224
    .line 225
    invoke-virtual {p1, v0, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    iput v0, p0, Ll/agj0$a;->q:I

    .line 230
    .line 231
    invoke-static {}, Ll/agj0;->j()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    new-array v3, v2, [Ljava/lang/String;

    .line 240
    .line 241
    invoke-static {v0, v3}, Lcom/google/common/base/a;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    check-cast v0, [Ljava/lang/String;

    .line 246
    .line 247
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    iput-object v0, p0, Ll/agj0$a;->r:Lcom/google/common/collect/ImmutableList;

    .line 252
    .line 253
    invoke-static {}, Ll/agj0;->k()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    new-array v3, v2, [Ljava/lang/String;

    .line 262
    .line 263
    invoke-static {v0, v3}, Lcom/google/common/base/a;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    check-cast v0, [Ljava/lang/String;

    .line 268
    .line 269
    invoke-static {v0}, Ll/agj0$a;->D([Ljava/lang/String;)Lcom/google/common/collect/ImmutableList;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    iput-object v0, p0, Ll/agj0$a;->s:Lcom/google/common/collect/ImmutableList;

    .line 274
    .line 275
    invoke-static {}, Ll/agj0;->l()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    iget v3, v1, Ll/agj0;->t:I

    .line 280
    .line 281
    invoke-virtual {p1, v0, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    iput v0, p0, Ll/agj0$a;->t:I

    .line 286
    .line 287
    invoke-static {}, Ll/agj0;->n()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    iget v3, v1, Ll/agj0;->u:I

    .line 292
    .line 293
    invoke-virtual {p1, v0, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    iput v0, p0, Ll/agj0$a;->u:I

    .line 298
    .line 299
    invoke-static {}, Ll/agj0;->o()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    iget-boolean v3, v1, Ll/agj0;->v:Z

    .line 304
    .line 305
    invoke-virtual {p1, v0, v3}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    iput-boolean v0, p0, Ll/agj0$a;->v:Z

    .line 310
    .line 311
    invoke-static {}, Ll/agj0;->p()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    iget-boolean v3, v1, Ll/agj0;->w:Z

    .line 316
    .line 317
    invoke-virtual {p1, v0, v3}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    iput-boolean v0, p0, Ll/agj0$a;->w:Z

    .line 322
    .line 323
    invoke-static {}, Ll/agj0;->q()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    iget-boolean v1, v1, Ll/agj0;->x:Z

    .line 328
    .line 329
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 330
    .line 331
    .line 332
    move-result v0

    .line 333
    iput-boolean v0, p0, Ll/agj0$a;->x:Z

    .line 334
    .line 335
    invoke-static {}, Ll/agj0;->r()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    if-nez v0, :cond_0

    .line 344
    .line 345
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    goto :goto_0

    .line 350
    :cond_0
    sget-object v1, Ll/yfj0;->e:Lcom/google/android/exoplayer2/e$a;

    .line 351
    .line 352
    invoke-static {v1, v0}, Ll/cj3;->d(Lcom/google/android/exoplayer2/e$a;Ljava/util/List;)Lcom/google/common/collect/ImmutableList;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    :goto_0
    new-instance v1, Ljava/util/HashMap;

    .line 357
    .line 358
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 359
    .line 360
    .line 361
    iput-object v1, p0, Ll/agj0$a;->y:Ljava/util/HashMap;

    .line 362
    .line 363
    move v1, v2

    .line 364
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 365
    .line 366
    .line 367
    move-result v3

    .line 368
    if-ge v1, v3, :cond_1

    .line 369
    .line 370
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object v3

    .line 374
    check-cast v3, Ll/yfj0;

    .line 375
    .line 376
    iget-object v4, p0, Ll/agj0$a;->y:Ljava/util/HashMap;

    .line 377
    .line 378
    iget-object v5, v3, Ll/yfj0;->a:Ll/dfj0;

    .line 379
    .line 380
    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    add-int/lit8 v1, v1, 0x1

    .line 384
    .line 385
    goto :goto_1

    .line 386
    :cond_1
    invoke-static {}, Ll/agj0;->s()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getIntArray(Ljava/lang/String;)[I

    .line 391
    .line 392
    .line 393
    move-result-object p1

    .line 394
    new-array v0, v2, [I

    .line 395
    .line 396
    invoke-static {p1, v0}, Lcom/google/common/base/a;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    move-result-object p1

    .line 400
    check-cast p1, [I

    .line 401
    .line 402
    new-instance v0, Ljava/util/HashSet;

    .line 403
    .line 404
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 405
    .line 406
    .line 407
    iput-object v0, p0, Ll/agj0$a;->z:Ljava/util/HashSet;

    .line 408
    .line 409
    array-length v0, p1

    .line 410
    :goto_2
    if-ge v2, v0, :cond_2

    .line 411
    .line 412
    aget v1, p1, v2

    .line 413
    .line 414
    iget-object v3, p0, Ll/agj0$a;->z:Ljava/util/HashSet;

    .line 415
    .line 416
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 417
    .line 418
    .line 419
    move-result-object v1

    .line 420
    invoke-virtual {v3, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    add-int/lit8 v2, v2, 0x1

    .line 424
    .line 425
    goto :goto_2

    .line 426
    :cond_2
    return-void
.end method

.method public constructor <init>(Ll/agj0;)V
    .locals 0

    .line 430
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 431
    invoke-virtual {p0, p1}, Ll/agj0$a;->C(Ll/agj0;)V

    return-void
.end method

.method public static D([Ljava/lang/String;)Lcom/google/common/collect/ImmutableList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, [Ljava/lang/String;

    .line 10
    .line 11
    array-length v1, p0

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    if-ge v2, v1, :cond_0

    .line 14
    .line 15
    aget-object v3, p0, v2

    .line 16
    .line 17
    invoke-static {v3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v3}, Ll/bmk0;->L0(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableList$a;->i(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$a;

    .line 28
    .line 29
    .line 30
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$a;->m()Lcom/google/common/collect/ImmutableList;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static synthetic a(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Ll/agj0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/agj0$a;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Ll/agj0$a;)Lcom/google/common/collect/ImmutableList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agj0$a;->l:Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic n(Ll/agj0$a;)Lcom/google/common/collect/ImmutableList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agj0$a;->n:Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic p(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic q(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic r(Ll/agj0$a;)Lcom/google/common/collect/ImmutableList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agj0$a;->r:Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Ll/agj0$a;)Lcom/google/common/collect/ImmutableList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agj0$a;->s:Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic u(Ll/agj0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/agj0$a;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic v(Ll/agj0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/agj0$a;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic w(Ll/agj0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/agj0$a;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic x(Ll/agj0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/agj0$a;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic y(Ll/agj0$a;)Ljava/util/HashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agj0$a;->y:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z(Ll/agj0$a;)Ljava/util/HashSet;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agj0$a;->z:Ljava/util/HashSet;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A()Ll/agj0;
    .locals 1

    .line 1
    new-instance v0, Ll/agj0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/agj0;-><init>(Ll/agj0$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public B(I)Ll/agj0$a;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/agj0$a;->y:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/yfj0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/yfj0;->b()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ne v1, p1, :cond_0

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-object p0
.end method

.method public final C(Ll/agj0;)V
    .locals 2
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "preferredVideoMimeTypes",
            "preferredAudioLanguages",
            "preferredAudioMimeTypes",
            "preferredTextLanguages",
            "overrides",
            "disabledTrackTypes"
        }
    .end annotation

    .line 1
    iget v0, p1, Ll/agj0;->a:I

    .line 2
    .line 3
    iput v0, p0, Ll/agj0$a;->a:I

    .line 4
    .line 5
    iget v0, p1, Ll/agj0;->b:I

    .line 6
    .line 7
    iput v0, p0, Ll/agj0$a;->b:I

    .line 8
    .line 9
    iget v0, p1, Ll/agj0;->c:I

    .line 10
    .line 11
    iput v0, p0, Ll/agj0$a;->c:I

    .line 12
    .line 13
    iget v0, p1, Ll/agj0;->d:I

    .line 14
    .line 15
    iput v0, p0, Ll/agj0$a;->d:I

    .line 16
    .line 17
    iget v0, p1, Ll/agj0;->e:I

    .line 18
    .line 19
    iput v0, p0, Ll/agj0$a;->e:I

    .line 20
    .line 21
    iget v0, p1, Ll/agj0;->f:I

    .line 22
    .line 23
    iput v0, p0, Ll/agj0$a;->f:I

    .line 24
    .line 25
    iget v0, p1, Ll/agj0;->g:I

    .line 26
    .line 27
    iput v0, p0, Ll/agj0$a;->g:I

    .line 28
    .line 29
    iget v0, p1, Ll/agj0;->h:I

    .line 30
    .line 31
    iput v0, p0, Ll/agj0$a;->h:I

    .line 32
    .line 33
    iget v0, p1, Ll/agj0;->i:I

    .line 34
    .line 35
    iput v0, p0, Ll/agj0$a;->i:I

    .line 36
    .line 37
    iget v0, p1, Ll/agj0;->j:I

    .line 38
    .line 39
    iput v0, p0, Ll/agj0$a;->j:I

    .line 40
    .line 41
    iget-boolean v0, p1, Ll/agj0;->k:Z

    .line 42
    .line 43
    iput-boolean v0, p0, Ll/agj0$a;->k:Z

    .line 44
    .line 45
    iget-object v0, p1, Ll/agj0;->l:Lcom/google/common/collect/ImmutableList;

    .line 46
    .line 47
    iput-object v0, p0, Ll/agj0$a;->l:Lcom/google/common/collect/ImmutableList;

    .line 48
    .line 49
    iget v0, p1, Ll/agj0;->m:I

    .line 50
    .line 51
    iput v0, p0, Ll/agj0$a;->m:I

    .line 52
    .line 53
    iget-object v0, p1, Ll/agj0;->n:Lcom/google/common/collect/ImmutableList;

    .line 54
    .line 55
    iput-object v0, p0, Ll/agj0$a;->n:Lcom/google/common/collect/ImmutableList;

    .line 56
    .line 57
    iget v0, p1, Ll/agj0;->o:I

    .line 58
    .line 59
    iput v0, p0, Ll/agj0$a;->o:I

    .line 60
    .line 61
    iget v0, p1, Ll/agj0;->p:I

    .line 62
    .line 63
    iput v0, p0, Ll/agj0$a;->p:I

    .line 64
    .line 65
    iget v0, p1, Ll/agj0;->q:I

    .line 66
    .line 67
    iput v0, p0, Ll/agj0$a;->q:I

    .line 68
    .line 69
    iget-object v0, p1, Ll/agj0;->r:Lcom/google/common/collect/ImmutableList;

    .line 70
    .line 71
    iput-object v0, p0, Ll/agj0$a;->r:Lcom/google/common/collect/ImmutableList;

    .line 72
    .line 73
    iget-object v0, p1, Ll/agj0;->s:Lcom/google/common/collect/ImmutableList;

    .line 74
    .line 75
    iput-object v0, p0, Ll/agj0$a;->s:Lcom/google/common/collect/ImmutableList;

    .line 76
    .line 77
    iget v0, p1, Ll/agj0;->t:I

    .line 78
    .line 79
    iput v0, p0, Ll/agj0$a;->t:I

    .line 80
    .line 81
    iget v0, p1, Ll/agj0;->u:I

    .line 82
    .line 83
    iput v0, p0, Ll/agj0$a;->u:I

    .line 84
    .line 85
    iget-boolean v0, p1, Ll/agj0;->v:Z

    .line 86
    .line 87
    iput-boolean v0, p0, Ll/agj0$a;->v:Z

    .line 88
    .line 89
    iget-boolean v0, p1, Ll/agj0;->w:Z

    .line 90
    .line 91
    iput-boolean v0, p0, Ll/agj0$a;->w:Z

    .line 92
    .line 93
    iget-boolean v0, p1, Ll/agj0;->x:Z

    .line 94
    .line 95
    iput-boolean v0, p0, Ll/agj0$a;->x:Z

    .line 96
    .line 97
    new-instance v0, Ljava/util/HashSet;

    .line 98
    .line 99
    iget-object v1, p1, Ll/agj0;->z:Lcom/google/common/collect/ImmutableSet;

    .line 100
    .line 101
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 102
    .line 103
    .line 104
    iput-object v0, p0, Ll/agj0$a;->z:Ljava/util/HashSet;

    .line 105
    .line 106
    new-instance v0, Ljava/util/HashMap;

    .line 107
    .line 108
    iget-object p1, p1, Ll/agj0;->y:Lcom/google/common/collect/ImmutableMap;

    .line 109
    .line 110
    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 111
    .line 112
    .line 113
    iput-object v0, p0, Ll/agj0$a;->y:Ljava/util/HashMap;

    .line 114
    .line 115
    return-void
.end method

.method public E(Ll/agj0;)Ll/agj0$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/agj0$a;->C(Ll/agj0;)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public F(I)Ll/agj0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/agj0$a;->u:I

    .line 2
    .line 3
    return-object p0
.end method

.method public G(Ll/yfj0;)Ll/agj0$a;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/yfj0;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/agj0$a;->B(I)Ll/agj0$a;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/agj0$a;->y:Ljava/util/HashMap;

    .line 9
    .line 10
    iget-object v1, p1, Ll/yfj0;->a:Ll/dfj0;

    .line 11
    .line 12
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public H(Landroid/content/Context;)Ll/agj0$a;
    .locals 2

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x13

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/agj0$a;->I(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p0
.end method

.method public final I(Landroid/content/Context;)V
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x13
    .end annotation

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x17

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "captioning"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Landroid/view/accessibility/CaptioningManager;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/accessibility/CaptioningManager;->isEnabled()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/16 v0, 0x440

    .line 32
    .line 33
    iput v0, p0, Ll/agj0$a;->t:I

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/accessibility/CaptioningManager;->getLocale()Ljava/util/Locale;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    invoke-static {p1}, Ll/bmk0;->a0(Ljava/util/Locale;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/agj0$a;->s:Lcom/google/common/collect/ImmutableList;

    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method

.method public J(IZ)Ll/agj0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/agj0$a;->z:Ljava/util/HashSet;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method public K(IIZ)Ll/agj0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/agj0$a;->i:I

    .line 2
    .line 3
    iput p2, p0, Ll/agj0$a;->j:I

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/agj0$a;->k:Z

    .line 6
    .line 7
    return-object p0
.end method

.method public L(Landroid/content/Context;Z)Ll/agj0$a;
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bmk0;->P(Landroid/content/Context;)Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 6
    .line 7
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1, p2}, Ll/agj0$a;->K(IIZ)Ll/agj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
