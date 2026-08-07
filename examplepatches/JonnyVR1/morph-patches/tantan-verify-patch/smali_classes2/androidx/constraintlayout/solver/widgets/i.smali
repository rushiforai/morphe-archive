.class public Landroidx/constraintlayout/solver/widgets/i;
.super Ll/s3d0;
.source "SourceFile"


# instance fields
.field public c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public d:F

.field public e:Landroidx/constraintlayout/solver/widgets/i;

.field public f:F

.field public g:Landroidx/constraintlayout/solver/widgets/i;

.field public h:F

.field public i:I

.field public j:Landroidx/constraintlayout/solver/widgets/i;

.field public k:F

.field public l:Ll/r3d0;

.field public m:I

.field public n:Ll/r3d0;

.field public o:I


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/s3d0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->l:Ll/r3d0;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/i;->m:I

    .line 12
    .line 13
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->n:Ll/r3d0;

    .line 14
    .line 15
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/i;->o:I

    .line 16
    .line 17
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public e()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/s3d0;->e()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/i;->f:F

    .line 9
    .line 10
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->l:Ll/r3d0;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/i;->m:I

    .line 14
    .line 15
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->n:Ll/r3d0;

    .line 16
    .line 17
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/i;->o:I

    .line 18
    .line 19
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 20
    .line 21
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 22
    .line 23
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/i;->d:F

    .line 24
    .line 25
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 26
    .line 27
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/i;->k:F

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 31
    .line 32
    return-void
.end method

.method public f()V
    .locals 8

    .line 1
    iget v0, p0, Ll/s3d0;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    goto/16 :goto_7

    .line 7
    .line 8
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 9
    .line 10
    const/4 v2, 0x4

    .line 11
    if-ne v0, v2, :cond_1

    .line 12
    .line 13
    goto/16 :goto_7

    .line 14
    .line 15
    :cond_1
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->l:Ll/r3d0;

    .line 16
    .line 17
    if-eqz v2, :cond_3

    .line 18
    .line 19
    iget v3, v2, Ll/s3d0;->b:I

    .line 20
    .line 21
    if-eq v3, v1, :cond_2

    .line 22
    .line 23
    goto/16 :goto_7

    .line 24
    .line 25
    :cond_2
    iget v3, p0, Landroidx/constraintlayout/solver/widgets/i;->m:I

    .line 26
    .line 27
    int-to-float v3, v3

    .line 28
    iget v2, v2, Ll/r3d0;->c:F

    .line 29
    .line 30
    mul-float/2addr v3, v2

    .line 31
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/i;->f:F

    .line 32
    .line 33
    :cond_3
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->n:Ll/r3d0;

    .line 34
    .line 35
    if-eqz v2, :cond_5

    .line 36
    .line 37
    iget v3, v2, Ll/s3d0;->b:I

    .line 38
    .line 39
    if-eq v3, v1, :cond_4

    .line 40
    .line 41
    goto/16 :goto_7

    .line 42
    .line 43
    :cond_4
    iget v3, p0, Landroidx/constraintlayout/solver/widgets/i;->o:I

    .line 44
    .line 45
    int-to-float v3, v3

    .line 46
    iget v2, v2, Ll/r3d0;->c:F

    .line 47
    .line 48
    mul-float/2addr v3, v2

    .line 49
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/i;->k:F

    .line 50
    .line 51
    :cond_5
    if-ne v0, v1, :cond_8

    .line 52
    .line 53
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 54
    .line 55
    if-eqz v2, :cond_6

    .line 56
    .line 57
    iget v3, v2, Ll/s3d0;->b:I

    .line 58
    .line 59
    if-ne v3, v1, :cond_8

    .line 60
    .line 61
    :cond_6
    if-nez v2, :cond_7

    .line 62
    .line 63
    iput-object p0, p0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 64
    .line 65
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/i;->f:F

    .line 66
    .line 67
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_7
    iget-object v0, v2, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 71
    .line 72
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 73
    .line 74
    iget v0, v2, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 75
    .line 76
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/i;->f:F

    .line 77
    .line 78
    add-float/2addr v0, v1

    .line 79
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 80
    .line 81
    :goto_0
    invoke-virtual {p0}, Ll/s3d0;->b()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_8
    const/4 v2, 0x2

    .line 86
    const-wide/16 v3, 0x1

    .line 87
    .line 88
    if-ne v0, v2, :cond_11

    .line 89
    .line 90
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 91
    .line 92
    if-eqz v2, :cond_11

    .line 93
    .line 94
    iget v2, v2, Ll/s3d0;->b:I

    .line 95
    .line 96
    if-ne v2, v1, :cond_11

    .line 97
    .line 98
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 99
    .line 100
    if-eqz v2, :cond_11

    .line 101
    .line 102
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 103
    .line 104
    if-eqz v2, :cond_11

    .line 105
    .line 106
    iget v2, v2, Ll/s3d0;->b:I

    .line 107
    .line 108
    if-ne v2, v1, :cond_11

    .line 109
    .line 110
    invoke-static {}, Landroidx/constraintlayout/solver/c;->y()Ll/pa00;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-eqz v0, :cond_9

    .line 115
    .line 116
    invoke-static {}, Landroidx/constraintlayout/solver/c;->y()Ll/pa00;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget-wide v5, v0, Ll/pa00;->w:J

    .line 121
    .line 122
    add-long/2addr v5, v3

    .line 123
    iput-wide v5, v0, Ll/pa00;->w:J

    .line 124
    .line 125
    :cond_9
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 126
    .line 127
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 128
    .line 129
    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 130
    .line 131
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 132
    .line 133
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 134
    .line 135
    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 136
    .line 137
    iput-object v4, v2, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 138
    .line 139
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 140
    .line 141
    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 142
    .line 143
    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 144
    .line 145
    const/4 v6, 0x0

    .line 146
    if-eq v4, v5, :cond_b

    .line 147
    .line 148
    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 149
    .line 150
    if-ne v4, v7, :cond_a

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_a
    move v1, v6

    .line 154
    :cond_b
    :goto_1
    if-eqz v1, :cond_c

    .line 155
    .line 156
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 157
    .line 158
    iget v3, v3, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 159
    .line 160
    sub-float/2addr v0, v3

    .line 161
    goto :goto_2

    .line 162
    :cond_c
    iget v3, v3, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 163
    .line 164
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 165
    .line 166
    sub-float v0, v3, v0

    .line 167
    .line 168
    :goto_2
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 169
    .line 170
    if-eq v4, v3, :cond_e

    .line 171
    .line 172
    if-ne v4, v5, :cond_d

    .line 173
    .line 174
    goto :goto_3

    .line 175
    :cond_d
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 176
    .line 177
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->r()I

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    int-to-float v2, v2

    .line 182
    sub-float/2addr v0, v2

    .line 183
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 184
    .line 185
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 186
    .line 187
    iget v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->a0:F

    .line 188
    .line 189
    goto :goto_4

    .line 190
    :cond_e
    :goto_3
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 191
    .line 192
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->D()I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    int-to-float v2, v2

    .line 197
    sub-float/2addr v0, v2

    .line 198
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 199
    .line 200
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 201
    .line 202
    iget v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->Z:F

    .line 203
    .line 204
    :goto_4
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 205
    .line 206
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 211
    .line 212
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 213
    .line 214
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 219
    .line 220
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 221
    .line 222
    .line 223
    move-result-object v5

    .line 224
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 225
    .line 226
    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 227
    .line 228
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 229
    .line 230
    .line 231
    move-result-object v7

    .line 232
    if-ne v5, v7, :cond_f

    .line 233
    .line 234
    const/high16 v2, 0x3f000000    # 0.5f

    .line 235
    .line 236
    move v4, v6

    .line 237
    goto :goto_5

    .line 238
    :cond_f
    move v6, v3

    .line 239
    :goto_5
    int-to-float v3, v6

    .line 240
    sub-float/2addr v0, v3

    .line 241
    int-to-float v4, v4

    .line 242
    sub-float/2addr v0, v4

    .line 243
    const/high16 v5, 0x3f800000    # 1.0f

    .line 244
    .line 245
    if-eqz v1, :cond_10

    .line 246
    .line 247
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 248
    .line 249
    iget-object v6, v1, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 250
    .line 251
    iget v6, v6, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 252
    .line 253
    add-float/2addr v6, v4

    .line 254
    mul-float v4, v0, v2

    .line 255
    .line 256
    add-float/2addr v6, v4

    .line 257
    iput v6, v1, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 258
    .line 259
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 260
    .line 261
    iget v1, v1, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 262
    .line 263
    sub-float/2addr v1, v3

    .line 264
    sub-float/2addr v5, v2

    .line 265
    mul-float/2addr v0, v5

    .line 266
    sub-float/2addr v1, v0

    .line 267
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 268
    .line 269
    goto :goto_6

    .line 270
    :cond_10
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 271
    .line 272
    iget v1, v1, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 273
    .line 274
    add-float/2addr v1, v3

    .line 275
    mul-float v3, v0, v2

    .line 276
    .line 277
    add-float/2addr v1, v3

    .line 278
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 279
    .line 280
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 281
    .line 282
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 283
    .line 284
    iget v3, v3, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 285
    .line 286
    sub-float/2addr v3, v4

    .line 287
    sub-float/2addr v5, v2

    .line 288
    mul-float/2addr v0, v5

    .line 289
    sub-float/2addr v3, v0

    .line 290
    iput v3, v1, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 291
    .line 292
    :goto_6
    invoke-virtual {p0}, Ll/s3d0;->b()V

    .line 293
    .line 294
    .line 295
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 296
    .line 297
    invoke-virtual {p0}, Ll/s3d0;->b()V

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :cond_11
    const/4 v2, 0x3

    .line 302
    if-ne v0, v2, :cond_13

    .line 303
    .line 304
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 305
    .line 306
    if-eqz v2, :cond_13

    .line 307
    .line 308
    iget v2, v2, Ll/s3d0;->b:I

    .line 309
    .line 310
    if-ne v2, v1, :cond_13

    .line 311
    .line 312
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 313
    .line 314
    if-eqz v2, :cond_13

    .line 315
    .line 316
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 317
    .line 318
    if-eqz v2, :cond_13

    .line 319
    .line 320
    iget v2, v2, Ll/s3d0;->b:I

    .line 321
    .line 322
    if-ne v2, v1, :cond_13

    .line 323
    .line 324
    invoke-static {}, Landroidx/constraintlayout/solver/c;->y()Ll/pa00;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    if-eqz v0, :cond_12

    .line 329
    .line 330
    invoke-static {}, Landroidx/constraintlayout/solver/c;->y()Ll/pa00;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    iget-wide v1, v0, Ll/pa00;->x:J

    .line 335
    .line 336
    add-long/2addr v1, v3

    .line 337
    iput-wide v1, v0, Ll/pa00;->x:J

    .line 338
    .line 339
    :cond_12
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 340
    .line 341
    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 342
    .line 343
    iput-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 344
    .line 345
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 346
    .line 347
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 348
    .line 349
    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 350
    .line 351
    iput-object v3, v1, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 352
    .line 353
    iget v0, v0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 354
    .line 355
    iget v3, p0, Landroidx/constraintlayout/solver/widgets/i;->f:F

    .line 356
    .line 357
    add-float/2addr v0, v3

    .line 358
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 359
    .line 360
    iget v0, v2, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 361
    .line 362
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/i;->f:F

    .line 363
    .line 364
    add-float/2addr v0, v2

    .line 365
    iput v0, v1, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 366
    .line 367
    invoke-virtual {p0}, Ll/s3d0;->b()V

    .line 368
    .line 369
    .line 370
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 371
    .line 372
    invoke-virtual {p0}, Ll/s3d0;->b()V

    .line 373
    .line 374
    .line 375
    return-void

    .line 376
    :cond_13
    const/4 v1, 0x5

    .line 377
    if-ne v0, v1, :cond_14

    .line 378
    .line 379
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 380
    .line 381
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->b:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 382
    .line 383
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->U()V

    .line 384
    .line 385
    .line 386
    :cond_14
    :goto_7
    return-void
.end method

.method public g(Landroidx/constraintlayout/solver/c;)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->g()Landroidx/constraintlayout/solver/SolverVariable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 8
    .line 9
    const/high16 v2, 0x3f000000    # 0.5f

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 14
    .line 15
    add-float/2addr p0, v2

    .line 16
    float-to-int p0, p0

    .line 17
    invoke-virtual {p1, v0, p0}, Landroidx/constraintlayout/solver/c;->f(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/c;->r(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 28
    .line 29
    add-float/2addr p0, v2

    .line 30
    float-to-int p0, p0

    .line 31
    const/4 v2, 0x6

    .line 32
    invoke-virtual {p1, v0, v1, p0, v2}, Landroidx/constraintlayout/solver/c;->e(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/b;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public h(ILandroidx/constraintlayout/solver/widgets/i;I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 4
    .line 5
    int-to-float p1, p3

    .line 6
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/i;->f:F

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i(Landroidx/constraintlayout/solver/widgets/i;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 2
    .line 3
    int-to-float p2, p2

    .line 4
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/i;->f:F

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/i;->e:Landroidx/constraintlayout/solver/widgets/i;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Landroidx/constraintlayout/solver/widgets/i;->l:Ll/r3d0;

    .line 7
    .line 8
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/i;->m:I

    .line 9
    .line 10
    invoke-virtual {p3, p0}, Ll/s3d0;->a(Ll/s3d0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public k()F
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public l(Landroidx/constraintlayout/solver/widgets/i;F)V
    .locals 2

    .line 1
    iget v0, p0, Ll/s3d0;->b:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 6
    .line 7
    if-eq v1, p1, :cond_0

    .line 8
    .line 9
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 10
    .line 11
    cmpl-float v1, v1, p2

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    :goto_0
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 18
    .line 19
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    if-ne v0, p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/s3d0;->c()V

    .line 25
    .line 26
    .line 27
    :cond_2
    invoke-virtual {p0}, Ll/s3d0;->b()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public m(I)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    const-string p0, "DIRECT"

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 p0, 0x2

    .line 8
    if-ne p1, p0, :cond_1

    .line 9
    .line 10
    const-string p0, "CENTER"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    const/4 p0, 0x3

    .line 14
    if-ne p1, p0, :cond_2

    .line 15
    .line 16
    const-string p0, "MATCH"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    const/4 p0, 0x4

    .line 20
    if-ne p1, p0, :cond_3

    .line 21
    .line 22
    const-string p0, "CHAIN"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_3
    const/4 p0, 0x5

    .line 26
    if-ne p1, p0, :cond_4

    .line 27
    .line 28
    const-string p0, "BARRIER"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_4
    const-string p0, "UNCONNECTED"

    .line 32
    .line 33
    return-object p0
.end method

.method public n(Landroidx/constraintlayout/solver/widgets/i;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 2
    .line 3
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/i;->k:F

    .line 4
    .line 5
    return-void
.end method

.method public o(Landroidx/constraintlayout/solver/widgets/i;ILl/r3d0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/i;->j:Landroidx/constraintlayout/solver/widgets/i;

    .line 2
    .line 3
    iput-object p3, p0, Landroidx/constraintlayout/solver/widgets/i;->n:Ll/r3d0;

    .line 4
    .line 5
    iput p2, p0, Landroidx/constraintlayout/solver/widgets/i;->o:I

    .line 6
    .line 7
    return-void
.end method

.method public p(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public q()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->i()Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 15
    .line 16
    if-ne v1, v2, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x4

    .line 19
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 20
    .line 21
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iput v1, v2, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 26
    .line 27
    :cond_1
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->d()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 34
    .line 35
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 36
    .line 37
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 38
    .line 39
    if-eq v2, v3, :cond_2

    .line 40
    .line 41
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 42
    .line 43
    if-ne v2, v3, :cond_3

    .line 44
    .line 45
    :cond_2
    neg-int v1, v1

    .line 46
    :cond_3
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->f()Landroidx/constraintlayout/solver/widgets/i;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0, v1}, Landroidx/constraintlayout/solver/widgets/i;->i(Landroidx/constraintlayout/solver/widgets/i;I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Ll/s3d0;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 7
    .line 8
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 9
    .line 10
    const-string v2, ", RESOLVED: "

    .line 11
    .line 12
    const-string v3, "["

    .line 13
    .line 14
    if-ne v0, p0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, "]  type: "

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/solver/widgets/i;->m(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->g:Landroidx/constraintlayout/solver/widgets/i;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v1, ":"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/i;->h:F

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v1, "] type: "

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 83
    .line 84
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/solver/widgets/i;->m(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v1, "{ "

    .line 99
    .line 100
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/i;->c:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v1, " UNRESOLVED} type: "

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget v1, p0, Landroidx/constraintlayout/solver/widgets/i;->i:I

    .line 114
    .line 115
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/solver/widgets/i;->m(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0
.end method
