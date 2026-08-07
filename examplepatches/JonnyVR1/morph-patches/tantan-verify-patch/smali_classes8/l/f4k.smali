.class public Ll/f4k;
.super Ll/zr2;
.source "SourceFile"


# instance fields
.field c:I

.field d:I

.field e:Ll/qv40;

.field f:Ll/ixk;

.field g:Ll/rkf;

.field i:Ll/yrf;

.field j:Ll/x0q;

.field k:Ll/h2g0;

.field l:Ll/z43;

.field m:Ll/kc00;

.field n:Ll/lc00;

.field private o:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/zr2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/f4k;->o:Z

    .line 6
    .line 7
    return-void
.end method

.method private Q1(II)V
    .locals 2

    .line 1
    iput p1, p0, Ll/f4k;->c:I

    .line 2
    .line 3
    iput p2, p0, Ll/f4k;->d:I

    .line 4
    .line 5
    new-instance p1, Ll/qv40;

    .line 6
    .line 7
    invoke-direct {p1}, Ll/qv40;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/f4k;->e:Ll/qv40;

    .line 11
    .line 12
    new-instance p1, Ll/rkf;

    .line 13
    .line 14
    iget p2, p0, Ll/f4k;->c:I

    .line 15
    .line 16
    div-int/lit8 p2, p2, 0x4

    .line 17
    .line 18
    iget v0, p0, Ll/f4k;->d:I

    .line 19
    .line 20
    div-int/lit8 v0, v0, 0x4

    .line 21
    .line 22
    invoke-direct {p1, p2, v0}, Ll/rkf;-><init>(II)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/f4k;->g:Ll/rkf;

    .line 26
    .line 27
    new-instance p1, Ll/ixk;

    .line 28
    .line 29
    iget p2, p0, Ll/f4k;->c:I

    .line 30
    .line 31
    div-int/lit8 p2, p2, 0x4

    .line 32
    .line 33
    iget v0, p0, Ll/f4k;->d:I

    .line 34
    .line 35
    div-int/lit8 v0, v0, 0x4

    .line 36
    .line 37
    invoke-direct {p1, p2, v0}, Ll/ixk;-><init>(II)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Ll/f4k;->f:Ll/ixk;

    .line 41
    .line 42
    iget p2, p0, Ll/f4k;->c:I

    .line 43
    .line 44
    div-int/lit8 p2, p2, 0x4

    .line 45
    .line 46
    iget v0, p0, Ll/f4k;->d:I

    .line 47
    .line 48
    div-int/lit8 v0, v0, 0x4

    .line 49
    .line 50
    invoke-virtual {p1, p2, v0}, Ll/ogk;->setRenderSize(II)V

    .line 51
    .line 52
    .line 53
    new-instance p1, Ll/yrf;

    .line 54
    .line 55
    invoke-direct {p1}, Ll/yrf;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Ll/f4k;->i:Ll/yrf;

    .line 59
    .line 60
    new-instance p1, Ll/x0q;

    .line 61
    .line 62
    iget p2, p0, Ll/f4k;->c:I

    .line 63
    .line 64
    div-int/lit8 p2, p2, 0x4

    .line 65
    .line 66
    iget v0, p0, Ll/f4k;->d:I

    .line 67
    .line 68
    div-int/lit8 v0, v0, 0x4

    .line 69
    .line 70
    invoke-direct {p1, p2, v0}, Ll/x0q;-><init>(II)V

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Ll/f4k;->j:Ll/x0q;

    .line 74
    .line 75
    iget p2, p0, Ll/f4k;->c:I

    .line 76
    .line 77
    div-int/lit8 p2, p2, 0x4

    .line 78
    .line 79
    iget v0, p0, Ll/f4k;->d:I

    .line 80
    .line 81
    div-int/lit8 v0, v0, 0x4

    .line 82
    .line 83
    invoke-virtual {p1, p2, v0}, Ll/ogk;->setRenderSize(II)V

    .line 84
    .line 85
    .line 86
    new-instance p1, Ll/h2g0;

    .line 87
    .line 88
    iget p2, p0, Ll/f4k;->c:I

    .line 89
    .line 90
    div-int/lit8 p2, p2, 0x4

    .line 91
    .line 92
    iget v0, p0, Ll/f4k;->d:I

    .line 93
    .line 94
    div-int/lit8 v0, v0, 0x4

    .line 95
    .line 96
    invoke-direct {p1, p2, v0}, Ll/h2g0;-><init>(II)V

    .line 97
    .line 98
    .line 99
    iput-object p1, p0, Ll/f4k;->k:Ll/h2g0;

    .line 100
    .line 101
    new-instance p1, Ll/z43;

    .line 102
    .line 103
    iget p2, p0, Ll/f4k;->c:I

    .line 104
    .line 105
    div-int/lit8 p2, p2, 0x4

    .line 106
    .line 107
    iget v0, p0, Ll/f4k;->d:I

    .line 108
    .line 109
    div-int/lit8 v0, v0, 0x4

    .line 110
    .line 111
    invoke-direct {p1, p2, v0}, Ll/z43;-><init>(II)V

    .line 112
    .line 113
    .line 114
    iput-object p1, p0, Ll/f4k;->l:Ll/z43;

    .line 115
    .line 116
    new-instance p1, Ll/kc00;

    .line 117
    .line 118
    invoke-direct {p1}, Ll/kc00;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Ll/f4k;->m:Ll/kc00;

    .line 122
    .line 123
    const p2, 0x3f19999a    # 0.6f

    .line 124
    .line 125
    .line 126
    const v0, 0x3fb33333    # 1.4f

    .line 127
    .line 128
    .line 129
    const v1, 0x3f4ccccd    # 0.8f

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, v1, p2, v0}, Ll/kc00;->Q1(FFF)V

    .line 133
    .line 134
    .line 135
    new-instance p1, Ll/lc00;

    .line 136
    .line 137
    invoke-direct {p1}, Ll/lc00;-><init>()V

    .line 138
    .line 139
    .line 140
    iput-object p1, p0, Ll/f4k;->n:Ll/lc00;

    .line 141
    .line 142
    const/high16 p2, 0x3f800000    # 1.0f

    .line 143
    .line 144
    invoke-virtual {p1, p2, p2, p2}, Ll/lc00;->Q1(FFF)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Ll/f4k;->n:Ll/lc00;

    .line 148
    .line 149
    invoke-virtual {p1, p2, p2, p2}, Ll/lc00;->S1(FFF)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/f4k;->n:Ll/lc00;

    .line 153
    .line 154
    const/4 p2, 0x0

    .line 155
    invoke-virtual {p1, p2, p2, p2}, Ll/lc00;->R1(FFF)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Ll/f4k;->e:Ll/qv40;

    .line 159
    .line 160
    iget-object p2, p0, Ll/f4k;->g:Ll/rkf;

    .line 161
    .line 162
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Ll/f4k;->e:Ll/qv40;

    .line 166
    .line 167
    iget-object p2, p0, Ll/f4k;->f:Ll/ixk;

    .line 168
    .line 169
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Ll/f4k;->g:Ll/rkf;

    .line 173
    .line 174
    iget-object p2, p0, Ll/f4k;->i:Ll/yrf;

    .line 175
    .line 176
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Ll/f4k;->f:Ll/ixk;

    .line 180
    .line 181
    iget-object p2, p0, Ll/f4k;->i:Ll/yrf;

    .line 182
    .line 183
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Ll/f4k;->i:Ll/yrf;

    .line 187
    .line 188
    iget-object p2, p0, Ll/f4k;->g:Ll/rkf;

    .line 189
    .line 190
    const/4 v0, 0x0

    .line 191
    invoke-virtual {p1, p2, v0}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Ll/f4k;->i:Ll/yrf;

    .line 195
    .line 196
    iget-object p2, p0, Ll/f4k;->f:Ll/ixk;

    .line 197
    .line 198
    const/4 v0, 0x1

    .line 199
    invoke-virtual {p1, p2, v0}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Ll/f4k;->i:Ll/yrf;

    .line 203
    .line 204
    iget-object p2, p0, Ll/f4k;->j:Ll/x0q;

    .line 205
    .line 206
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 207
    .line 208
    .line 209
    iget-object p1, p0, Ll/f4k;->i:Ll/yrf;

    .line 210
    .line 211
    iget-object p2, p0, Ll/f4k;->k:Ll/h2g0;

    .line 212
    .line 213
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Ll/f4k;->k:Ll/h2g0;

    .line 217
    .line 218
    iget-object p2, p0, Ll/f4k;->l:Ll/z43;

    .line 219
    .line 220
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Ll/f4k;->j:Ll/x0q;

    .line 224
    .line 225
    iget-object p2, p0, Ll/f4k;->m:Ll/kc00;

    .line 226
    .line 227
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 228
    .line 229
    .line 230
    iget-object p1, p0, Ll/f4k;->k:Ll/h2g0;

    .line 231
    .line 232
    iget-object p2, p0, Ll/f4k;->m:Ll/kc00;

    .line 233
    .line 234
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 235
    .line 236
    .line 237
    iget-object p1, p0, Ll/f4k;->l:Ll/z43;

    .line 238
    .line 239
    iget-object p2, p0, Ll/f4k;->m:Ll/kc00;

    .line 240
    .line 241
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 242
    .line 243
    .line 244
    iget-object p1, p0, Ll/f4k;->m:Ll/kc00;

    .line 245
    .line 246
    iget-object p2, p0, Ll/f4k;->j:Ll/x0q;

    .line 247
    .line 248
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 249
    .line 250
    .line 251
    iget-object p1, p0, Ll/f4k;->m:Ll/kc00;

    .line 252
    .line 253
    iget-object p2, p0, Ll/f4k;->k:Ll/h2g0;

    .line 254
    .line 255
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 256
    .line 257
    .line 258
    iget-object p1, p0, Ll/f4k;->m:Ll/kc00;

    .line 259
    .line 260
    iget-object p2, p0, Ll/f4k;->l:Ll/z43;

    .line 261
    .line 262
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 263
    .line 264
    .line 265
    iget-object p1, p0, Ll/f4k;->e:Ll/qv40;

    .line 266
    .line 267
    iget-object p2, p0, Ll/f4k;->n:Ll/lc00;

    .line 268
    .line 269
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 270
    .line 271
    .line 272
    iget-object p1, p0, Ll/f4k;->m:Ll/kc00;

    .line 273
    .line 274
    iget-object p2, p0, Ll/f4k;->n:Ll/lc00;

    .line 275
    .line 276
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 277
    .line 278
    .line 279
    iget-object p1, p0, Ll/f4k;->n:Ll/lc00;

    .line 280
    .line 281
    iget-object p2, p0, Ll/f4k;->e:Ll/qv40;

    .line 282
    .line 283
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 284
    .line 285
    .line 286
    iget-object p1, p0, Ll/f4k;->n:Ll/lc00;

    .line 287
    .line 288
    iget-object p2, p0, Ll/f4k;->m:Ll/kc00;

    .line 289
    .line 290
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 291
    .line 292
    .line 293
    iget-object p1, p0, Ll/f4k;->n:Ll/lc00;

    .line 294
    .line 295
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 296
    .line 297
    .line 298
    iget-object p1, p0, Ll/f4k;->e:Ll/qv40;

    .line 299
    .line 300
    invoke-virtual {p0, p1}, Ll/lt2;->registerInitialFilter(Ll/jt2;)V

    .line 301
    .line 302
    .line 303
    iget-object p1, p0, Ll/f4k;->g:Ll/rkf;

    .line 304
    .line 305
    invoke-virtual {p0, p1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 306
    .line 307
    .line 308
    iget-object p1, p0, Ll/f4k;->f:Ll/ixk;

    .line 309
    .line 310
    invoke-virtual {p0, p1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 311
    .line 312
    .line 313
    iget-object p1, p0, Ll/f4k;->i:Ll/yrf;

    .line 314
    .line 315
    invoke-virtual {p0, p1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 316
    .line 317
    .line 318
    iget-object p1, p0, Ll/f4k;->j:Ll/x0q;

    .line 319
    .line 320
    invoke-virtual {p0, p1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 321
    .line 322
    .line 323
    iget-object p1, p0, Ll/f4k;->k:Ll/h2g0;

    .line 324
    .line 325
    invoke-virtual {p0, p1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 326
    .line 327
    .line 328
    iget-object p1, p0, Ll/f4k;->l:Ll/z43;

    .line 329
    .line 330
    invoke-virtual {p0, p1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 331
    .line 332
    .line 333
    iget-object p1, p0, Ll/f4k;->m:Ll/kc00;

    .line 334
    .line 335
    invoke-virtual {p0, p1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 336
    .line 337
    .line 338
    iget-object p1, p0, Ll/f4k;->n:Ll/lc00;

    .line 339
    .line 340
    invoke-virtual {p0, p1}, Ll/lt2;->registerTerminalFilter(Ll/jt2;)V

    .line 341
    .line 342
    .line 343
    return-void
.end method


# virtual methods
.method public newTextureReady(ILl/gfj;Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/f4k;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-direct {p0, v0, v1}, Ll/f4k;->Q1(II)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Ll/f4k;->o:Z

    .line 32
    .line 33
    :cond_0
    invoke-super {p0, p1, p2, p3}, Ll/lt2;->newTextureReady(ILl/gfj;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
