.class public Ll/oek0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->c:Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lv/VFrame;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->d:Lv/VFrame;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/view/ViewGroup;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lv/VImage;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->f:Lv/VImage;

    .line 45
    .line 46
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lv/VText;

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->g:Lv/VText;

    .line 53
    .line 54
    const/4 v1, 0x2

    .line 55
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Lv/VLinear;

    .line 60
    .line 61
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->h:Lv/VLinear;

    .line 62
    .line 63
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Landroid/view/ViewGroup;

    .line 68
    .line 69
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, Lv/VText;

    .line 74
    .line 75
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->i:Lv/VText;

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Landroid/view/ViewGroup;

    .line 82
    .line 83
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    check-cast v3, Lv/VLinear;

    .line 88
    .line 89
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->j:Lv/VLinear;

    .line 90
    .line 91
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Landroid/view/ViewGroup;

    .line 96
    .line 97
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    check-cast v3, Landroid/view/ViewGroup;

    .line 102
    .line 103
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    check-cast v3, Lv/VFrame;

    .line 108
    .line 109
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->k:Lv/VFrame;

    .line 110
    .line 111
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    check-cast v3, Landroid/view/ViewGroup;

    .line 116
    .line 117
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    check-cast v3, Landroid/view/ViewGroup;

    .line 122
    .line 123
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    check-cast v3, Landroid/view/ViewGroup;

    .line 128
    .line 129
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    check-cast v3, Lv/VDraweeView;

    .line 134
    .line 135
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->l:Lv/VDraweeView;

    .line 136
    .line 137
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    check-cast v3, Landroid/view/ViewGroup;

    .line 142
    .line 143
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    check-cast v3, Landroid/view/ViewGroup;

    .line 148
    .line 149
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    check-cast v3, Landroid/view/ViewGroup;

    .line 154
    .line 155
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    check-cast v3, Lv/VImage;

    .line 160
    .line 161
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->m:Lv/VImage;

    .line 162
    .line 163
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    check-cast v3, Landroid/view/ViewGroup;

    .line 168
    .line 169
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    check-cast v3, Landroid/view/ViewGroup;

    .line 174
    .line 175
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    check-cast v3, Lv/VFrame;

    .line 180
    .line 181
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->n:Lv/VFrame;

    .line 182
    .line 183
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    check-cast v3, Landroid/view/ViewGroup;

    .line 188
    .line 189
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Landroid/view/ViewGroup;

    .line 194
    .line 195
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    check-cast v3, Landroid/view/ViewGroup;

    .line 200
    .line 201
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    check-cast v3, Lv/VDraweeView;

    .line 206
    .line 207
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->o:Lv/VDraweeView;

    .line 208
    .line 209
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    check-cast v3, Landroid/view/ViewGroup;

    .line 214
    .line 215
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    check-cast v3, Landroid/view/ViewGroup;

    .line 220
    .line 221
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    check-cast v3, Landroid/view/ViewGroup;

    .line 226
    .line 227
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 228
    .line 229
    .line 230
    move-result-object v3

    .line 231
    check-cast v3, Lv/VImage;

    .line 232
    .line 233
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->p:Lv/VImage;

    .line 234
    .line 235
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    check-cast v3, Landroid/view/ViewGroup;

    .line 240
    .line 241
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    check-cast v3, Landroid/view/ViewGroup;

    .line 246
    .line 247
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    check-cast v3, Lv/VFrame;

    .line 252
    .line 253
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->q:Lv/VFrame;

    .line 254
    .line 255
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    check-cast v3, Landroid/view/ViewGroup;

    .line 260
    .line 261
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    check-cast v3, Landroid/view/ViewGroup;

    .line 266
    .line 267
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    check-cast v3, Landroid/view/ViewGroup;

    .line 272
    .line 273
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    check-cast v0, Lv/VDraweeView;

    .line 278
    .line 279
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->r:Lv/VDraweeView;

    .line 280
    .line 281
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    check-cast v0, Landroid/view/ViewGroup;

    .line 286
    .line 287
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    check-cast v0, Landroid/view/ViewGroup;

    .line 292
    .line 293
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    check-cast v0, Landroid/view/ViewGroup;

    .line 298
    .line 299
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    check-cast v0, Lv/VImage;

    .line 304
    .line 305
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->s:Lv/VImage;

    .line 306
    .line 307
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    check-cast v0, Landroid/view/ViewGroup;

    .line 312
    .line 313
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    check-cast v0, Landroid/view/ViewGroup;

    .line 318
    .line 319
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    check-cast v0, Landroid/view/ViewGroup;

    .line 324
    .line 325
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    check-cast v0, Lv/VText;

    .line 330
    .line 331
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->t:Lv/VText;

    .line 332
    .line 333
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    check-cast v0, Landroid/view/ViewGroup;

    .line 338
    .line 339
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    check-cast v0, Lv/VText;

    .line 344
    .line 345
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->u:Lv/VText;

    .line 346
    .line 347
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    check-cast v0, Landroid/view/ViewGroup;

    .line 352
    .line 353
    const/4 v1, 0x3

    .line 354
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    check-cast v0, Lv/VText;

    .line 359
    .line 360
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->v:Lv/VText;

    .line 361
    .line 362
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;

    .line 367
    .line 368
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->w:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;

    .line 369
    .line 370
    const/4 v0, 0x4

    .line 371
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;

    .line 376
    .line 377
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;

    .line 378
    .line 379
    const/4 v0, 0x5

    .line 380
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 381
    .line 382
    .line 383
    move-result-object p1

    .line 384
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

    .line 385
    .line 386
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->y:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

    .line 387
    .line 388
    return-void
.end method
