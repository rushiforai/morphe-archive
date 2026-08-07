.class public Ll/ygx;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;Landroid/view/View;)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

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
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    check-cast v1, Lv/VImage;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->f:Lv/VImage;

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
    check-cast v1, Lv/VText;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->g:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/view/ViewGroup;

    .line 51
    .line 52
    const/4 v3, 0x2

    .line 53
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lv/VText;

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h:Lv/VText;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Landroid/view/ViewGroup;

    .line 66
    .line 67
    const/4 v4, 0x3

    .line 68
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lv/VText;

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Landroid/view/ViewGroup;

    .line 81
    .line 82
    const/4 v5, 0x4

    .line 83
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Lv/VText;

    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->j:Lv/VText;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Landroid/view/ViewGroup;

    .line 96
    .line 97
    const/4 v6, 0x5

    .line 98
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Landroid/view/ViewGroup;

    .line 103
    .line 104
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    check-cast v1, Lv/VLinear;

    .line 109
    .line 110
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->k:Lv/VLinear;

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Landroid/view/ViewGroup;

    .line 117
    .line 118
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    check-cast v1, Landroid/view/ViewGroup;

    .line 123
    .line 124
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Landroid/view/ViewGroup;

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    check-cast v1, Lv/VText;

    .line 135
    .line 136
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->l:Lv/VText;

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    check-cast v1, Landroid/view/ViewGroup;

    .line 143
    .line 144
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    check-cast v1, Landroid/view/ViewGroup;

    .line 149
    .line 150
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    check-cast v1, Lv/VLinear;

    .line 155
    .line 156
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->m:Lv/VLinear;

    .line 157
    .line 158
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    check-cast v1, Landroid/view/ViewGroup;

    .line 163
    .line 164
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    check-cast v1, Landroid/view/ViewGroup;

    .line 169
    .line 170
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    check-cast v1, Landroid/view/ViewGroup;

    .line 175
    .line 176
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    check-cast v1, Lv/VText;

    .line 181
    .line 182
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->n:Lv/VText;

    .line 183
    .line 184
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    check-cast v1, Landroid/view/ViewGroup;

    .line 189
    .line 190
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    check-cast v1, Landroid/view/ViewGroup;

    .line 195
    .line 196
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    check-cast v1, Lv/VLinear;

    .line 201
    .line 202
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->o:Lv/VLinear;

    .line 203
    .line 204
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    check-cast v1, Landroid/view/ViewGroup;

    .line 209
    .line 210
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    check-cast v1, Landroid/view/ViewGroup;

    .line 215
    .line 216
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    check-cast v1, Landroid/view/ViewGroup;

    .line 221
    .line 222
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    check-cast v1, Lv/VText;

    .line 227
    .line 228
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->p:Lv/VText;

    .line 229
    .line 230
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    check-cast v1, Landroid/view/ViewGroup;

    .line 235
    .line 236
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    check-cast v1, Landroid/view/ViewGroup;

    .line 241
    .line 242
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    check-cast v1, Lv/VLinear;

    .line 247
    .line 248
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->q:Lv/VLinear;

    .line 249
    .line 250
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    check-cast v1, Landroid/view/ViewGroup;

    .line 255
    .line 256
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    check-cast v1, Landroid/view/ViewGroup;

    .line 261
    .line 262
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    check-cast v1, Landroid/view/ViewGroup;

    .line 267
    .line 268
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    check-cast v1, Lv/VText;

    .line 273
    .line 274
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->r:Lv/VText;

    .line 275
    .line 276
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    check-cast v1, Landroidx/constraintlayout/widget/Guideline;

    .line 281
    .line 282
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->s:Landroidx/constraintlayout/widget/Guideline;

    .line 283
    .line 284
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    check-cast v1, Lv/VDraweeView;

    .line 289
    .line 290
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->t:Lv/VDraweeView;

    .line 291
    .line 292
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    check-cast v1, Lv/VDraweeView;

    .line 297
    .line 298
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->u:Lv/VDraweeView;

    .line 299
    .line 300
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    check-cast v1, Lv/VDraweeView;

    .line 305
    .line 306
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->v:Lv/VDraweeView;

    .line 307
    .line 308
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->w:Landroid/view/View;

    .line 313
    .line 314
    const/4 v1, 0x6

    .line 315
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    check-cast v3, Lv/VFrame;

    .line 320
    .line 321
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->x:Lv/VFrame;

    .line 322
    .line 323
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    check-cast v3, Landroid/view/ViewGroup;

    .line 328
    .line 329
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    check-cast v0, Lv/VImage;

    .line 334
    .line 335
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->y:Lv/VImage;

    .line 336
    .line 337
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    check-cast v0, Landroid/view/ViewGroup;

    .line 342
    .line 343
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    check-cast v0, Lv/VImage;

    .line 348
    .line 349
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->z:Lv/VImage;

    .line 350
    .line 351
    const/4 v0, 0x7

    .line 352
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 353
    .line 354
    .line 355
    move-result-object p1

    .line 356
    check-cast p1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 357
    .line 358
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->A:Lcom/tantan/library/svga/SVGAnimationView;

    .line 359
    .line 360
    return-void
.end method
