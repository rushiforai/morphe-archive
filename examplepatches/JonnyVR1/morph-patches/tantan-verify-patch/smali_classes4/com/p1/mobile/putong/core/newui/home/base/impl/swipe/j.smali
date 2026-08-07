.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/g6m<",
        "Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;",
        "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;

    .line 10
    .line 11
    invoke-static {}, Ll/d09;->g()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k1;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k1;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ll/gra;->F3()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/y0;

    .line 32
    .line 33
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/y0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-static {}, Ll/gra;->E2()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/p;

    .line 46
    .line 47
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/p;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    invoke-static {}, Ll/gra;->J3()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k;

    .line 60
    .line 61
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 65
    .line 66
    .line 67
    :cond_3
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;

    .line 68
    .line 69
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i0;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 73
    .line 74
    .line 75
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q;

    .line 76
    .line 77
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 81
    .line 82
    .line 83
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f0;

    .line 84
    .line 85
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f0;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 89
    .line 90
    .line 91
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e0;

    .line 92
    .line 93
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e0;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 97
    .line 98
    .line 99
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/z0;

    .line 100
    .line 101
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/z0;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Ll/gra;->G2()Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-nez v1, :cond_4

    .line 112
    .line 113
    invoke-static {}, Ll/gra;->H2()Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_5

    .line 118
    .line 119
    :cond_4
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/h;

    .line 120
    .line 121
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/h;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 125
    .line 126
    .line 127
    :cond_5
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/r;

    .line 128
    .line 129
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/r;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 133
    .line 134
    .line 135
    invoke-static {}, Ll/gra;->L3()Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_6

    .line 140
    .line 141
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;

    .line 142
    .line 143
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 147
    .line 148
    .line 149
    :cond_6
    invoke-static {}, Ll/gra;->Z2()Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_7

    .line 154
    .line 155
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g;

    .line 156
    .line 157
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 161
    .line 162
    .line 163
    :cond_7
    invoke-static {}, Ll/s7a;->w()Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-eqz v1, :cond_8

    .line 168
    .line 169
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/l1;

    .line 170
    .line 171
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/l1;-><init>()V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 175
    .line 176
    .line 177
    :cond_8
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 178
    .line 179
    invoke-virtual {v1}, Ll/gta;->b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;->wf()Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_9

    .line 188
    .line 189
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0;

    .line 190
    .line 191
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b0;-><init>()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 195
    .line 196
    .line 197
    :cond_9
    invoke-static {}, Ll/gra;->r1()Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    if-eqz v1, :cond_a

    .line 202
    .line 203
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;

    .line 204
    .line 205
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 209
    .line 210
    .line 211
    :cond_a
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/p0;

    .line 212
    .line 213
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/p0;-><init>()V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 217
    .line 218
    .line 219
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n1;

    .line 220
    .line 221
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n1;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 225
    .line 226
    .line 227
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u0;

    .line 228
    .line 229
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u0;-><init>()V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 233
    .line 234
    .line 235
    invoke-static {}, Ll/spl0;->o()Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    if-eqz v1, :cond_b

    .line 240
    .line 241
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m;

    .line 242
    .line 243
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m;-><init>()V

    .line 244
    .line 245
    .line 246
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 247
    .line 248
    .line 249
    :cond_b
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b1;

    .line 250
    .line 251
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b1;-><init>()V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 255
    .line 256
    .line 257
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g0;

    .line 258
    .line 259
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g0;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 263
    .line 264
    .line 265
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/h0;

    .line 266
    .line 267
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/h0;-><init>()V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 271
    .line 272
    .line 273
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j1;

    .line 274
    .line 275
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j1;-><init>()V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 279
    .line 280
    .line 281
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g1;

    .line 282
    .line 283
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/g1;-><init>()V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 287
    .line 288
    .line 289
    invoke-static {}, Ll/spl0;->u()Z

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    if-nez v1, :cond_c

    .line 294
    .line 295
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/v0;

    .line 296
    .line 297
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/v0;-><init>()V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 301
    .line 302
    .line 303
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/w0;

    .line 304
    .line 305
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/w0;-><init>()V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 309
    .line 310
    .line 311
    :cond_c
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/c1;

    .line 312
    .line 313
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/c1;-><init>()V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 317
    .line 318
    .line 319
    invoke-static {}, Ll/d79;->j0()Z

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    if-eqz v1, :cond_d

    .line 324
    .line 325
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e1;

    .line 326
    .line 327
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/e1;-><init>()V

    .line 328
    .line 329
    .line 330
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 331
    .line 332
    .line 333
    :cond_d
    invoke-static {}, Ll/d79;->e0()Z

    .line 334
    .line 335
    .line 336
    move-result v1

    .line 337
    if-eqz v1, :cond_e

    .line 338
    .line 339
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/y;

    .line 340
    .line 341
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/y;-><init>()V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 345
    .line 346
    .line 347
    :cond_e
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;

    .line 348
    .line 349
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;-><init>()V

    .line 350
    .line 351
    .line 352
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 353
    .line 354
    .line 355
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d1;

    .line 356
    .line 357
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d1;-><init>()V

    .line 358
    .line 359
    .line 360
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 361
    .line 362
    .line 363
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x;

    .line 364
    .line 365
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x;-><init>()V

    .line 366
    .line 367
    .line 368
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 369
    .line 370
    .line 371
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/w;

    .line 372
    .line 373
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/w;-><init>()V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 377
    .line 378
    .line 379
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/h1;

    .line 380
    .line 381
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/h1;-><init>()V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 385
    .line 386
    .line 387
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i1;

    .line 388
    .line 389
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i1;-><init>()V

    .line 390
    .line 391
    .line 392
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 393
    .line 394
    .line 395
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/v;

    .line 396
    .line 397
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/v;-><init>()V

    .line 398
    .line 399
    .line 400
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 401
    .line 402
    .line 403
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a1;

    .line 404
    .line 405
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_alert_dislike_who_liked_me_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 406
    .line 407
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v2

    .line 411
    const/4 v3, 0x0

    .line 412
    invoke-direct {v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a1;-><init>(Ljava/lang/String;Z)V

    .line 413
    .line 414
    .line 415
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 416
    .line 417
    .line 418
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;

    .line 419
    .line 420
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_alert_positioning_authority_open_guide_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 421
    .line 422
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v2

    .line 426
    const/4 v4, 0x1

    .line 427
    invoke-direct {v1, v2, v4}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;-><init>(Ljava/lang/String;Z)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 431
    .line 432
    .line 433
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n;

    .line 434
    .line 435
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_profile_picture_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 436
    .line 437
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    invoke-direct {v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n;-><init>(Ljava/lang/String;Z)V

    .line 442
    .line 443
    .line 444
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 445
    .line 446
    .line 447
    invoke-static {}, Ll/spl0;->z()Z

    .line 448
    .line 449
    .line 450
    move-result v1

    .line 451
    if-nez v1, :cond_f

    .line 452
    .line 453
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;

    .line 454
    .line 455
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->real_person_guide:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 456
    .line 457
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object v2

    .line 461
    invoke-direct {v1, v2, v4}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;-><init>(Ljava/lang/String;Z)V

    .line 462
    .line 463
    .line 464
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 465
    .line 466
    .line 467
    :cond_f
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n0;

    .line 468
    .line 469
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n0;-><init>()V

    .line 470
    .line 471
    .line 472
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 473
    .line 474
    .line 475
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k0;

    .line 476
    .line 477
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/k0;-><init>()V

    .line 478
    .line 479
    .line 480
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 481
    .line 482
    .line 483
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/l0;

    .line 484
    .line 485
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/l0;-><init>()V

    .line 486
    .line 487
    .line 488
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 489
    .line 490
    .line 491
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/z;

    .line 492
    .line 493
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/z;-><init>()V

    .line 494
    .line 495
    .line 496
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 497
    .line 498
    .line 499
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;

    .line 500
    .line 501
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d0;-><init>()V

    .line 502
    .line 503
    .line 504
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 505
    .line 506
    .line 507
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/c0;

    .line 508
    .line 509
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/c0;-><init>()V

    .line 510
    .line 511
    .line 512
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 513
    .line 514
    .line 515
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j0;

    .line 516
    .line 517
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j0;-><init>()V

    .line 518
    .line 519
    .line 520
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 521
    .line 522
    .line 523
    invoke-static {}, Ll/gra;->R1()Z

    .line 524
    .line 525
    .line 526
    move-result v1

    .line 527
    if-eqz v1, :cond_10

    .line 528
    .line 529
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/s;

    .line 530
    .line 531
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/s;-><init>()V

    .line 532
    .line 533
    .line 534
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 535
    .line 536
    .line 537
    :cond_10
    invoke-static {}, Ll/gra;->r3()Z

    .line 538
    .line 539
    .line 540
    move-result v1

    .line 541
    if-eqz v1, :cond_11

    .line 542
    .line 543
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/r0;

    .line 544
    .line 545
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/r0;-><init>()V

    .line 546
    .line 547
    .line 548
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 549
    .line 550
    .line 551
    :cond_11
    invoke-static {}, Ll/ric0;->m()Z

    .line 552
    .line 553
    .line 554
    move-result v1

    .line 555
    if-eqz v1, :cond_12

    .line 556
    .line 557
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/l;

    .line 558
    .line 559
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/l;-><init>()V

    .line 560
    .line 561
    .line 562
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 563
    .line 564
    .line 565
    :cond_12
    invoke-static {}, Ll/s7a;->k()Z

    .line 566
    .line 567
    .line 568
    move-result v1

    .line 569
    if-eqz v1, :cond_13

    .line 570
    .line 571
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t;

    .line 572
    .line 573
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t;-><init>()V

    .line 574
    .line 575
    .line 576
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 577
    .line 578
    .line 579
    :cond_13
    invoke-static {}, Ll/gra;->U1()Z

    .line 580
    .line 581
    .line 582
    move-result v1

    .line 583
    if-eqz v1, :cond_14

    .line 584
    .line 585
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/c;

    .line 586
    .line 587
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/c;-><init>()V

    .line 588
    .line 589
    .line 590
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 591
    .line 592
    .line 593
    :cond_14
    invoke-static {}, Ll/gra;->f1()Lcom/p1/mobile/putong/core/data/SpringFestivalMarriageActivitiesConfig;

    .line 594
    .line 595
    .line 596
    move-result-object v1

    .line 597
    if-eqz v1, :cond_15

    .line 598
    .line 599
    invoke-static {}, Ll/gra;->f1()Lcom/p1/mobile/putong/core/data/SpringFestivalMarriageActivitiesConfig;

    .line 600
    .line 601
    .line 602
    move-result-object v1

    .line 603
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/SpringFestivalMarriageActivitiesConfig;->activities:Z

    .line 604
    .line 605
    if-eqz v1, :cond_15

    .line 606
    .line 607
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i;

    .line 608
    .line 609
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i;-><init>()V

    .line 610
    .line 611
    .line 612
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 613
    .line 614
    .line 615
    :cond_15
    invoke-static {}, Ll/spl0;->T()Z

    .line 616
    .line 617
    .line 618
    move-result v1

    .line 619
    if-eqz v1, :cond_16

    .line 620
    .line 621
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x0;

    .line 622
    .line 623
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x0;-><init>()V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 627
    .line 628
    .line 629
    :cond_16
    invoke-static {}, Ll/gra;->e2()Z

    .line 630
    .line 631
    .line 632
    move-result v1

    .line 633
    if-eqz v1, :cond_17

    .line 634
    .line 635
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o0;

    .line 636
    .line 637
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o0;-><init>()V

    .line 638
    .line 639
    .line 640
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 641
    .line 642
    .line 643
    :cond_17
    invoke-static {}, Ll/gra;->A()Z

    .line 644
    .line 645
    .line 646
    move-result v1

    .line 647
    if-eqz v1, :cond_18

    .line 648
    .line 649
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d;

    .line 650
    .line 651
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/d;-><init>()V

    .line 652
    .line 653
    .line 654
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 655
    .line 656
    .line 657
    :cond_18
    invoke-static {}, Ll/gra;->L3()Z

    .line 658
    .line 659
    .line 660
    move-result v1

    .line 661
    if-eqz v1, :cond_19

    .line 662
    .line 663
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o;

    .line 664
    .line 665
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o;-><init>()V

    .line 666
    .line 667
    .line 668
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 669
    .line 670
    .line 671
    :cond_19
    invoke-static {}, Ll/gra;->c3()Z

    .line 672
    .line 673
    .line 674
    move-result v1

    .line 675
    if-eqz v1, :cond_1a

    .line 676
    .line 677
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f;

    .line 678
    .line 679
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f;-><init>()V

    .line 680
    .line 681
    .line 682
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 683
    .line 684
    .line 685
    :cond_1a
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a0;

    .line 686
    .line 687
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a0;-><init>()V

    .line 688
    .line 689
    .line 690
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 691
    .line 692
    .line 693
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;

    .line 694
    .line 695
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;-><init>()V

    .line 696
    .line 697
    .line 698
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 699
    .line 700
    .line 701
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j;->d()V

    .line 702
    .line 703
    .line 704
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue$StrategyType;->swipe:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue$StrategyType;

    .line 705
    .line 706
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->e(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue$StrategyType;)V

    .line 707
    .line 708
    .line 709
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j;->e(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->d()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/g6m;

    .line 22
    .line 23
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;

    .line 28
    .line 29
    invoke-interface {v0, p1}, Ll/g6m;->b(Ll/e2m;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {v0, p1}, Ll/g6m;->a(Ll/e2m;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return-object p0
.end method

.method public d()V
    .locals 5

    .line 1
    invoke-static {}, Ll/spl0;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "e_swipe_before"

    .line 16
    .line 17
    const-string v2, "p_suggest_users_home_view"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/rj50;->W(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    iget-object v2, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 52
    .line 53
    const-string v3, "local"

    .line 54
    .line 55
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_0

    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;

    .line 62
    .line 63
    new-instance v3, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/s0;

    .line 64
    .line 65
    iget-object v4, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 68
    .line 69
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    .line 70
    .line 71
    xor-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    invoke-direct {v3, v4, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/s0;-><init>(Ljava/lang/String;Z)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method
