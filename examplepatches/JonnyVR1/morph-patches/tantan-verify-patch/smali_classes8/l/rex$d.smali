.class public Ll/rex$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# direct methods
.method public static bridge synthetic a(Ll/rex;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rex$d;->c(Ll/rex;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static b(Ll/rex;Landroid/view/View;)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    invoke-static {p0, v0}, Ll/rex;->T(Ll/rex;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 5
    .line 6
    .line 7
    check-cast p1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/rex;->b0(Ll/rex;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lv/VImage;

    .line 25
    .line 26
    invoke-static {p0, v2}, Ll/rex;->f0(Ll/rex;Lv/VImage;)V

    .line 27
    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lv/VText;

    .line 35
    .line 36
    invoke-static {p0, v3}, Ll/rex;->X(Ll/rex;Lv/VText;)V

    .line 37
    .line 38
    .line 39
    const/4 v3, 0x3

    .line 40
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Landroid/widget/TextView;

    .line 45
    .line 46
    invoke-static {p0, v3}, Ll/rex;->S(Ll/rex;Landroid/widget/TextView;)V

    .line 47
    .line 48
    .line 49
    const/4 v3, 0x4

    .line 50
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Lv/VText;

    .line 55
    .line 56
    invoke-static {p0, v4}, Ll/rex;->Y(Ll/rex;Lv/VText;)V

    .line 57
    .line 58
    .line 59
    const/4 v4, 0x5

    .line 60
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Landroidx/constraintlayout/widget/Guideline;

    .line 65
    .line 66
    invoke-static {p0, v4}, Ll/rex;->N(Ll/rex;Landroidx/constraintlayout/widget/Guideline;)V

    .line 67
    .line 68
    .line 69
    const/4 v4, 0x6

    .line 70
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    check-cast v5, Lv/VRelative;

    .line 75
    .line 76
    invoke-static {p0, v5}, Ll/rex;->P(Ll/rex;Lv/VRelative;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    check-cast v5, Landroid/view/ViewGroup;

    .line 84
    .line 85
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    check-cast v5, Lv/VDraweeView;

    .line 90
    .line 91
    invoke-static {p0, v5}, Ll/rex;->O(Ll/rex;Lv/VDraweeView;)V

    .line 92
    .line 93
    .line 94
    const/4 v5, 0x7

    .line 95
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    check-cast v6, Lv/VRelative;

    .line 100
    .line 101
    invoke-static {p0, v6}, Ll/rex;->R(Ll/rex;Lv/VRelative;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    check-cast v5, Landroid/view/ViewGroup;

    .line 109
    .line 110
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    check-cast v5, Lv/VDraweeView;

    .line 115
    .line 116
    invoke-static {p0, v5}, Ll/rex;->Q(Ll/rex;Lv/VDraweeView;)V

    .line 117
    .line 118
    .line 119
    const/16 v5, 0x8

    .line 120
    .line 121
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    check-cast v5, Lv/VImage;

    .line 126
    .line 127
    invoke-static {p0, v5}, Ll/rex;->V(Ll/rex;Lv/VImage;)V

    .line 128
    .line 129
    .line 130
    const/16 v5, 0x9

    .line 131
    .line 132
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    check-cast v5, Lv/VImage;

    .line 137
    .line 138
    invoke-static {p0, v5}, Ll/rex;->U(Ll/rex;Lv/VImage;)V

    .line 139
    .line 140
    .line 141
    const/16 v5, 0xa

    .line 142
    .line 143
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    check-cast v5, Lv/VDraweeView;

    .line 148
    .line 149
    invoke-static {p0, v5}, Ll/rex;->W(Ll/rex;Lv/VDraweeView;)V

    .line 150
    .line 151
    .line 152
    const/16 v5, 0xb

    .line 153
    .line 154
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    check-cast v5, Landroid/widget/TextView;

    .line 159
    .line 160
    invoke-static {p0, v5}, Ll/rex;->B(Ll/rex;Landroid/widget/TextView;)V

    .line 161
    .line 162
    .line 163
    const/16 v5, 0xc

    .line 164
    .line 165
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    check-cast v5, Landroid/widget/TextView;

    .line 170
    .line 171
    invoke-static {p0, v5}, Ll/rex;->E(Ll/rex;Landroid/widget/TextView;)V

    .line 172
    .line 173
    .line 174
    const/16 v5, 0xd

    .line 175
    .line 176
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v6

    .line 180
    check-cast v6, Landroid/widget/LinearLayout;

    .line 181
    .line 182
    invoke-static {p0, v6}, Ll/rex;->H(Ll/rex;Landroid/widget/LinearLayout;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v6

    .line 189
    check-cast v6, Landroid/view/ViewGroup;

    .line 190
    .line 191
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v6

    .line 195
    check-cast v6, Lv/VEditText;

    .line 196
    .line 197
    invoke-static {p0, v6}, Ll/rex;->G(Ll/rex;Lv/VEditText;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    check-cast v5, Landroid/view/ViewGroup;

    .line 205
    .line 206
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    check-cast v1, Lv/VText;

    .line 211
    .line 212
    invoke-static {p0, v1}, Ll/rex;->c0(Ll/rex;Lv/VText;)V

    .line 213
    .line 214
    .line 215
    const/16 v1, 0xe

    .line 216
    .line 217
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 218
    .line 219
    .line 220
    move-result-object v5

    .line 221
    check-cast v5, Lv/VLinear;

    .line 222
    .line 223
    invoke-static {p0, v5}, Ll/rex;->I(Ll/rex;Lv/VLinear;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v5

    .line 230
    check-cast v5, Landroid/view/ViewGroup;

    .line 231
    .line 232
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 233
    .line 234
    .line 235
    move-result-object v5

    .line 236
    check-cast v5, Landroid/widget/FrameLayout;

    .line 237
    .line 238
    invoke-static {p0, v5}, Ll/rex;->J(Ll/rex;Landroid/widget/FrameLayout;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v5

    .line 245
    check-cast v5, Landroid/view/ViewGroup;

    .line 246
    .line 247
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v5

    .line 251
    check-cast v5, Landroid/view/ViewGroup;

    .line 252
    .line 253
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 254
    .line 255
    .line 256
    move-result-object v5

    .line 257
    check-cast v5, Lv/VText;

    .line 258
    .line 259
    invoke-static {p0, v5}, Ll/rex;->K(Ll/rex;Lv/VText;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    check-cast v5, Landroid/view/ViewGroup;

    .line 267
    .line 268
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    check-cast v5, Landroid/widget/FrameLayout;

    .line 273
    .line 274
    invoke-static {p0, v5}, Ll/rex;->Z(Ll/rex;Landroid/widget/FrameLayout;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 278
    .line 279
    .line 280
    move-result-object v5

    .line 281
    check-cast v5, Landroid/view/ViewGroup;

    .line 282
    .line 283
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    check-cast v2, Landroid/view/ViewGroup;

    .line 288
    .line 289
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    check-cast v2, Lv/VText;

    .line 294
    .line 295
    invoke-static {p0, v2}, Ll/rex;->a0(Ll/rex;Lv/VText;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    check-cast v2, Landroid/view/ViewGroup;

    .line 303
    .line 304
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 305
    .line 306
    .line 307
    move-result-object v2

    .line 308
    check-cast v2, Landroid/widget/FrameLayout;

    .line 309
    .line 310
    invoke-static {p0, v2}, Ll/rex;->d0(Ll/rex;Landroid/widget/FrameLayout;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    check-cast v2, Landroid/view/ViewGroup;

    .line 318
    .line 319
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    check-cast v2, Landroid/view/ViewGroup;

    .line 324
    .line 325
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    check-cast v2, Lv/VText;

    .line 330
    .line 331
    invoke-static {p0, v2}, Ll/rex;->e0(Ll/rex;Lv/VText;)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    check-cast v2, Landroid/view/ViewGroup;

    .line 339
    .line 340
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    check-cast v2, Landroid/widget/FrameLayout;

    .line 345
    .line 346
    invoke-static {p0, v2}, Ll/rex;->L(Ll/rex;Landroid/widget/FrameLayout;)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 350
    .line 351
    .line 352
    move-result-object v1

    .line 353
    check-cast v1, Landroid/view/ViewGroup;

    .line 354
    .line 355
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    check-cast v1, Landroid/view/ViewGroup;

    .line 360
    .line 361
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    check-cast v0, Lv/VText;

    .line 366
    .line 367
    invoke-static {p0, v0}, Ll/rex;->M(Ll/rex;Lv/VText;)V

    .line 368
    .line 369
    .line 370
    const/16 v0, 0xf

    .line 371
    .line 372
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    check-cast v0, Landroid/widget/TextView;

    .line 377
    .line 378
    invoke-static {p0, v0}, Ll/rex;->C(Ll/rex;Landroid/widget/TextView;)V

    .line 379
    .line 380
    .line 381
    const/16 v0, 0x10

    .line 382
    .line 383
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 384
    .line 385
    .line 386
    move-result-object p1

    .line 387
    check-cast p1, Lv/VImage;

    .line 388
    .line 389
    invoke-static {p0, p1}, Ll/rex;->F(Ll/rex;Lv/VImage;)V

    .line 390
    .line 391
    .line 392
    return-void
.end method

.method public static c(Ll/rex;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->n7:I

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
    invoke-static {p0, p1}, Ll/rex$d;->b(Ll/rex;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
