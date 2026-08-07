.class public Ll/h800;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Landroid/view/View;)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/LinearLayout;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Landroid/widget/RelativeLayout;

    .line 15
    .line 16
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->v:Landroid/widget/RelativeLayout;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lv/VDraweeView;

    .line 29
    .line 30
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->w:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Landroid/view/ViewGroup;

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Landroid/widget/FrameLayout;

    .line 44
    .line 45
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->x:Landroid/widget/FrameLayout;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Landroid/view/ViewGroup;

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Landroid/view/ViewGroup;

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Lv/VDraweeView;

    .line 64
    .line 65
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->y:Lv/VDraweeView;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Landroid/view/ViewGroup;

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    check-cast v2, Landroid/view/ViewGroup;

    .line 78
    .line 79
    const/4 v4, 0x2

    .line 80
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Lv/VImage;

    .line 85
    .line 86
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->z:Lv/VImage;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Landroid/view/ViewGroup;

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Landroid/view/ViewGroup;

    .line 99
    .line 100
    const/4 v5, 0x3

    .line 101
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Landroid/widget/FrameLayout;

    .line 106
    .line 107
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->A:Landroid/widget/FrameLayout;

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    check-cast v2, Landroid/view/ViewGroup;

    .line 114
    .line 115
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Lv/VLinear;

    .line 120
    .line 121
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->B:Lv/VLinear;

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Landroid/view/ViewGroup;

    .line 128
    .line 129
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    check-cast v2, Landroid/view/ViewGroup;

    .line 134
    .line 135
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    check-cast v2, Lv/VText;

    .line 140
    .line 141
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->C:Lv/VText;

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Landroid/view/ViewGroup;

    .line 148
    .line 149
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    check-cast v2, Landroid/view/ViewGroup;

    .line 154
    .line 155
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    check-cast v2, Lv/VText;

    .line 160
    .line 161
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->D:Lv/VText;

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    check-cast v2, Landroid/view/ViewGroup;

    .line 168
    .line 169
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    check-cast v2, Lv/VText;

    .line 174
    .line 175
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->E:Lv/VText;

    .line 176
    .line 177
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    check-cast v2, Landroid/view/ViewGroup;

    .line 182
    .line 183
    const/4 v6, 0x4

    .line 184
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    check-cast v2, Lv/VText;

    .line 189
    .line 190
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F:Lv/VText;

    .line 191
    .line 192
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    check-cast v2, Landroid/view/ViewGroup;

    .line 197
    .line 198
    const/4 v6, 0x5

    .line 199
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    check-cast v2, Landroid/widget/TextView;

    .line 204
    .line 205
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G:Landroid/widget/TextView;

    .line 206
    .line 207
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    check-cast v2, Landroid/widget/LinearLayout;

    .line 212
    .line 213
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H:Landroid/widget/LinearLayout;

    .line 214
    .line 215
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    check-cast v0, Landroid/view/ViewGroup;

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    check-cast v0, Landroid/widget/LinearLayout;

    .line 226
    .line 227
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I:Landroid/widget/LinearLayout;

    .line 228
    .line 229
    sget v0, Ll/edc0;->V1:I

    .line 230
    .line 231
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    check-cast v0, Lv/VImage;

    .line 236
    .line 237
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J:Lv/VImage;

    .line 238
    .line 239
    move-object v0, p1

    .line 240
    check-cast v0, Landroid/view/ViewGroup;

    .line 241
    .line 242
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    check-cast v2, Landroid/view/ViewGroup;

    .line 247
    .line 248
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    check-cast v1, Landroid/view/ViewGroup;

    .line 253
    .line 254
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    check-cast v1, Lv/VText;

    .line 259
    .line 260
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K:Lv/VText;

    .line 261
    .line 262
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    check-cast v1, Landroid/view/ViewGroup;

    .line 267
    .line 268
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    check-cast v1, Landroid/widget/LinearLayout;

    .line 273
    .line 274
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L:Landroid/widget/LinearLayout;

    .line 275
    .line 276
    sget v1, Ll/edc0;->h2:I

    .line 277
    .line 278
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    check-cast v1, Lv/VImage;

    .line 283
    .line 284
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M:Lv/VImage;

    .line 285
    .line 286
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    check-cast v1, Landroid/view/ViewGroup;

    .line 291
    .line 292
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    check-cast v1, Landroid/view/ViewGroup;

    .line 297
    .line 298
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    check-cast v1, Lv/VText;

    .line 303
    .line 304
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N:Lv/VText;

    .line 305
    .line 306
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    check-cast v1, Landroid/view/ViewGroup;

    .line 311
    .line 312
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 313
    .line 314
    .line 315
    move-result-object v1

    .line 316
    check-cast v1, Landroid/widget/LinearLayout;

    .line 317
    .line 318
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->O:Landroid/widget/LinearLayout;

    .line 319
    .line 320
    sget v1, Ll/edc0;->w4:I

    .line 321
    .line 322
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    check-cast v1, Lv/VImage;

    .line 327
    .line 328
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P:Lv/VImage;

    .line 329
    .line 330
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    check-cast v1, Landroid/view/ViewGroup;

    .line 335
    .line 336
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 337
    .line 338
    .line 339
    move-result-object v1

    .line 340
    check-cast v1, Landroid/view/ViewGroup;

    .line 341
    .line 342
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    check-cast v1, Lv/VText;

    .line 347
    .line 348
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q:Lv/VText;

    .line 349
    .line 350
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    check-cast v1, Landroid/view/ViewGroup;

    .line 355
    .line 356
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    check-cast v1, Landroid/widget/LinearLayout;

    .line 361
    .line 362
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->R:Landroid/widget/LinearLayout;

    .line 363
    .line 364
    sget v1, Ll/edc0;->T4:I

    .line 365
    .line 366
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 367
    .line 368
    .line 369
    move-result-object p1

    .line 370
    check-cast p1, Lv/VImage;

    .line 371
    .line 372
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->S:Lv/VImage;

    .line 373
    .line 374
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    check-cast p1, Landroid/view/ViewGroup;

    .line 379
    .line 380
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 381
    .line 382
    .line 383
    move-result-object p1

    .line 384
    check-cast p1, Landroid/view/ViewGroup;

    .line 385
    .line 386
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 387
    .line 388
    .line 389
    move-result-object p1

    .line 390
    check-cast p1, Lv/VText;

    .line 391
    .line 392
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->T:Lv/VText;

    .line 393
    .line 394
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/qec0;->a4:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/h800;->a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
