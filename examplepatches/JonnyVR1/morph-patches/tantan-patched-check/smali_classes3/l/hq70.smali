.class public Ll/hq70;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/PictureView;Landroid/view/View;)V
    .locals 7

    .line 1
    sget v0, Ll/adc0;->N5:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VDraweeView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    sget v0, Ll/adc0;->Y5:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VDraweeView;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 20
    .line 21
    move-object v0, p1

    .line 22
    check-cast v0, Landroid/view/ViewGroup;

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->c:Landroid/view/View;

    .line 30
    .line 31
    const/4 v2, 0x3

    .line 32
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Landroid/widget/LinearLayout;

    .line 37
    .line 38
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->d:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Landroid/view/ViewGroup;

    .line 45
    .line 46
    const/4 v4, 0x0

    .line 47
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lv/VImage;

    .line 52
    .line 53
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->e:Lv/VImage;

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Landroid/view/ViewGroup;

    .line 60
    .line 61
    const/4 v5, 0x1

    .line 62
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lv/VText;

    .line 67
    .line 68
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->f:Lv/VText;

    .line 69
    .line 70
    sget v3, Ll/adc0;->O0:I

    .line 71
    .line 72
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lv/VFrame_ColorFilter;

    .line 77
    .line 78
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 79
    .line 80
    sget v3, Ll/adc0;->qa:I

    .line 81
    .line 82
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    check-cast v3, Lv/VImage;

    .line 87
    .line 88
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->h:Lv/VImage;

    .line 89
    .line 90
    sget v3, Ll/adc0;->F7:I

    .line 91
    .line 92
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    check-cast v3, Lv/VProgressBar;

    .line 97
    .line 98
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->i:Lv/VProgressBar;

    .line 99
    .line 100
    sget v3, Ll/adc0;->t9:I

    .line 101
    .line 102
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    check-cast v3, Lv/VImage;

    .line 107
    .line 108
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->j:Lv/VImage;

    .line 109
    .line 110
    sget v3, Ll/adc0;->S6:I

    .line 111
    .line 112
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Landroid/widget/LinearLayout;

    .line 117
    .line 118
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 119
    .line 120
    const/4 v3, 0x5

    .line 121
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v6

    .line 125
    check-cast v6, Landroid/view/ViewGroup;

    .line 126
    .line 127
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    check-cast v6, Lv/VText;

    .line 132
    .line 133
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->l:Lv/VText;

    .line 134
    .line 135
    sget v6, Ll/adc0;->ma:I

    .line 136
    .line 137
    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v6

    .line 141
    check-cast v6, Lv/VText;

    .line 142
    .line 143
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->m:Lv/VText;

    .line 144
    .line 145
    sget v6, Ll/adc0;->u8:I

    .line 146
    .line 147
    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    check-cast v6, Lv/VImage;

    .line 152
    .line 153
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->n:Lv/VImage;

    .line 154
    .line 155
    sget v6, Ll/adc0;->q9:I

    .line 156
    .line 157
    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    check-cast v6, Lv/VText;

    .line 162
    .line 163
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 164
    .line 165
    sget v6, Ll/adc0;->g5:I

    .line 166
    .line 167
    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    check-cast v6, Landroid/widget/LinearLayout;

    .line 172
    .line 173
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->p:Landroid/widget/LinearLayout;

    .line 174
    .line 175
    sget v6, Ll/adc0;->i5:I

    .line 176
    .line 177
    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    check-cast v6, Lv/VText;

    .line 182
    .line 183
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->q:Lv/VText;

    .line 184
    .line 185
    sget v6, Ll/adc0;->h5:I

    .line 186
    .line 187
    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    check-cast p1, Lv/VText;

    .line 192
    .line 193
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->r:Lv/VText;

    .line 194
    .line 195
    const/4 p1, 0x7

    .line 196
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v6

    .line 200
    check-cast v6, Lv/VLinear;

    .line 201
    .line 202
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 203
    .line 204
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    check-cast v6, Landroid/view/ViewGroup;

    .line 209
    .line 210
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object v6

    .line 214
    check-cast v6, Lv/VImage;

    .line 215
    .line 216
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->t:Lv/VImage;

    .line 217
    .line 218
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 219
    .line 220
    .line 221
    move-result-object v6

    .line 222
    check-cast v6, Landroid/view/ViewGroup;

    .line 223
    .line 224
    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 225
    .line 226
    .line 227
    move-result-object v6

    .line 228
    check-cast v6, Lv/VText;

    .line 229
    .line 230
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->u:Lv/VText;

    .line 231
    .line 232
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 233
    .line 234
    .line 235
    move-result-object v6

    .line 236
    check-cast v6, Landroid/view/ViewGroup;

    .line 237
    .line 238
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    check-cast v1, Lv/VText;

    .line 243
    .line 244
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->v:Lv/VText;

    .line 245
    .line 246
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    check-cast v1, Landroid/view/ViewGroup;

    .line 251
    .line 252
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    check-cast v1, Lv/VImage;

    .line 257
    .line 258
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->w:Lv/VImage;

    .line 259
    .line 260
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    check-cast v1, Landroid/view/ViewGroup;

    .line 265
    .line 266
    const/4 v2, 0x4

    .line 267
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    check-cast v1, Lv/VText;

    .line 272
    .line 273
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->x:Lv/VText;

    .line 274
    .line 275
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    check-cast v1, Landroid/view/ViewGroup;

    .line 280
    .line 281
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 286
    .line 287
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->y:Landroid/widget/RelativeLayout;

    .line 288
    .line 289
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    check-cast p1, Landroid/view/ViewGroup;

    .line 294
    .line 295
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    check-cast p1, Landroid/view/ViewGroup;

    .line 300
    .line 301
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    check-cast p1, Lv/VButton;

    .line 306
    .line 307
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->z:Lv/VButton;

    .line 308
    .line 309
    const/16 p1, 0x8

    .line 310
    .line 311
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    check-cast v1, Landroid/widget/LinearLayout;

    .line 316
    .line 317
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->A:Landroid/widget/LinearLayout;

    .line 318
    .line 319
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    check-cast v1, Landroid/view/ViewGroup;

    .line 324
    .line 325
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->B:Landroid/view/View;

    .line 330
    .line 331
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    check-cast p1, Landroid/view/ViewGroup;

    .line 336
    .line 337
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    check-cast p1, Landroid/widget/ImageView;

    .line 342
    .line 343
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->C:Landroid/widget/ImageView;

    .line 344
    .line 345
    const/16 p1, 0x9

    .line 346
    .line 347
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    check-cast p1, Lv/VDraweeView;

    .line 352
    .line 353
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->D:Lv/VDraweeView;

    .line 354
    .line 355
    return-void
.end method
