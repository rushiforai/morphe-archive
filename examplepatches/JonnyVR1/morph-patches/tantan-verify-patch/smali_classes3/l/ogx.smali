.class public Ll/ogx;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/View;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->b:Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    const/4 v2, 0x2

    .line 25
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Landroidx/appcompat/widget/AppCompatImageView;

    .line 30
    .line 31
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->d:Landroidx/appcompat/widget/AppCompatImageView;

    .line 32
    .line 33
    const/4 v3, 0x3

    .line 34
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    check-cast v4, Lv/VText;

    .line 39
    .line 40
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->e:Lv/VText;

    .line 41
    .line 42
    const/4 v4, 0x4

    .line 43
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    check-cast v5, Landroid/widget/FrameLayout;

    .line 48
    .line 49
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->f:Landroid/widget/FrameLayout;

    .line 50
    .line 51
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    check-cast v5, Landroid/view/ViewGroup;

    .line 56
    .line 57
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    check-cast v5, Landroid/widget/FrameLayout;

    .line 62
    .line 63
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->g:Landroid/widget/FrameLayout;

    .line 64
    .line 65
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    check-cast v5, Landroid/view/ViewGroup;

    .line 70
    .line 71
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    check-cast v5, Landroid/view/ViewGroup;

    .line 76
    .line 77
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    check-cast v5, Lv/VDraweeView;

    .line 82
    .line 83
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->h:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    check-cast v5, Landroid/view/ViewGroup;

    .line 90
    .line 91
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    check-cast v5, Landroid/view/ViewGroup;

    .line 96
    .line 97
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    check-cast v5, Lv/VImage;

    .line 102
    .line 103
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->i:Lv/VImage;

    .line 104
    .line 105
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    check-cast v5, Landroid/view/ViewGroup;

    .line 110
    .line 111
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    check-cast v5, Landroid/widget/FrameLayout;

    .line 116
    .line 117
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 118
    .line 119
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    check-cast v5, Landroid/view/ViewGroup;

    .line 124
    .line 125
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    check-cast v5, Landroid/view/ViewGroup;

    .line 130
    .line 131
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    check-cast v5, Lv/VDraweeView;

    .line 136
    .line 137
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->k:Lv/VDraweeView;

    .line 138
    .line 139
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    check-cast v5, Landroid/view/ViewGroup;

    .line 144
    .line 145
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    check-cast v5, Landroid/view/ViewGroup;

    .line 150
    .line 151
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    check-cast v5, Lv/VImage;

    .line 156
    .line 157
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->l:Lv/VImage;

    .line 158
    .line 159
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    check-cast v4, Landroid/view/ViewGroup;

    .line 164
    .line 165
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    check-cast v4, Landroid/view/ViewGroup;

    .line 170
    .line 171
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    check-cast v4, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 176
    .line 177
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 178
    .line 179
    const/4 v4, 0x5

    .line 180
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    check-cast v4, Lcom/tantan/library/svga/SVGAnimationView;

    .line 185
    .line 186
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 187
    .line 188
    const/4 v4, 0x6

    .line 189
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    check-cast v4, Lv/VText;

    .line 194
    .line 195
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->o:Lv/VText;

    .line 196
    .line 197
    const/4 v4, 0x7

    .line 198
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    check-cast v4, Lv/VText;

    .line 203
    .line 204
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->p:Lv/VText;

    .line 205
    .line 206
    const/16 v4, 0x8

    .line 207
    .line 208
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v5

    .line 212
    check-cast v5, Lv/VLinear;

    .line 213
    .line 214
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->q:Lv/VLinear;

    .line 215
    .line 216
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    check-cast v5, Landroid/view/ViewGroup;

    .line 221
    .line 222
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 223
    .line 224
    .line 225
    move-result-object v5

    .line 226
    check-cast v5, Lv/VImage;

    .line 227
    .line 228
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->r:Lv/VImage;

    .line 229
    .line 230
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    check-cast v4, Landroid/view/ViewGroup;

    .line 235
    .line 236
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 237
    .line 238
    .line 239
    move-result-object v4

    .line 240
    check-cast v4, Lv/VText;

    .line 241
    .line 242
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->s:Lv/VText;

    .line 243
    .line 244
    const/16 v4, 0x9

    .line 245
    .line 246
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v5

    .line 250
    check-cast v5, Lv/VLinear;

    .line 251
    .line 252
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->t:Lv/VLinear;

    .line 253
    .line 254
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object v5

    .line 258
    check-cast v5, Landroid/view/ViewGroup;

    .line 259
    .line 260
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 261
    .line 262
    .line 263
    move-result-object v5

    .line 264
    check-cast v5, Lv/VText;

    .line 265
    .line 266
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->u:Lv/VText;

    .line 267
    .line 268
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    check-cast v5, Landroid/view/ViewGroup;

    .line 273
    .line 274
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 275
    .line 276
    .line 277
    move-result-object v5

    .line 278
    check-cast v5, Lv/VText;

    .line 279
    .line 280
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->v:Lv/VText;

    .line 281
    .line 282
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 283
    .line 284
    .line 285
    move-result-object v5

    .line 286
    check-cast v5, Landroid/view/ViewGroup;

    .line 287
    .line 288
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    check-cast v2, Lv/VText;

    .line 293
    .line 294
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->w:Lv/VText;

    .line 295
    .line 296
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    check-cast v2, Landroid/view/ViewGroup;

    .line 301
    .line 302
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    check-cast v2, Lv/VText;

    .line 307
    .line 308
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->x:Lv/VText;

    .line 309
    .line 310
    const/16 v2, 0xa

    .line 311
    .line 312
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 313
    .line 314
    .line 315
    move-result-object v3

    .line 316
    check-cast v3, Lv/VLinear;

    .line 317
    .line 318
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->y:Lv/VLinear;

    .line 319
    .line 320
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 321
    .line 322
    .line 323
    move-result-object v3

    .line 324
    check-cast v3, Landroid/view/ViewGroup;

    .line 325
    .line 326
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    check-cast v0, Lv/VEditText;

    .line 331
    .line 332
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->z:Lv/VEditText;

    .line 333
    .line 334
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    check-cast v0, Landroid/view/ViewGroup;

    .line 339
    .line 340
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    check-cast v0, Lv/VText;

    .line 345
    .line 346
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->A:Lv/VText;

    .line 347
    .line 348
    const/16 v0, 0xb

    .line 349
    .line 350
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 351
    .line 352
    .line 353
    move-result-object p1

    .line 354
    check-cast p1, Lv/VImage;

    .line 355
    .line 356
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->B:Lv/VImage;

    .line 357
    .line 358
    return-void
.end method
