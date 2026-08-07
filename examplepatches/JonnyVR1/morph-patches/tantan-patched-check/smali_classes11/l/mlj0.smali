.class public final Ll/mlj0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public static a(Landroid/text/Spannable;IILl/nlj0;Ll/klj0;Ljava/util/Map;I)V
    .locals 8
    .param p4    # Ll/klj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/Spannable;",
            "II",
            "Ll/nlj0;",
            "Ll/klj0;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/nlj0;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ll/nlj0;->l()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x21

    .line 6
    .line 7
    const/4 v2, -0x1

    .line 8
    if-eq v0, v2, :cond_0

    .line 9
    .line 10
    new-instance v0, Landroid/text/style/StyleSpan;

    .line 11
    .line 12
    invoke-virtual {p3}, Ll/nlj0;->l()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0, v0, p1, p2, v1}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p3}, Ll/nlj0;->s()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    new-instance v0, Landroid/text/style/StrikethroughSpan;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/text/style/StrikethroughSpan;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-interface {p0, v0, p1, p2, v1}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-virtual {p3}, Ll/nlj0;->t()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    new-instance v0, Landroid/text/style/UnderlineSpan;

    .line 43
    .line 44
    invoke-direct {v0}, Landroid/text/style/UnderlineSpan;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-interface {p0, v0, p1, p2, v1}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 48
    .line 49
    .line 50
    :cond_2
    invoke-virtual {p3}, Ll/nlj0;->q()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 57
    .line 58
    invoke-virtual {p3}, Ll/nlj0;->c()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 63
    .line 64
    .line 65
    invoke-static {p0, v0, p1, p2, v1}, Ll/tuf0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 66
    .line 67
    .line 68
    :cond_3
    invoke-virtual {p3}, Ll/nlj0;->p()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    .line 75
    .line 76
    invoke-virtual {p3}, Ll/nlj0;->b()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    invoke-direct {v0, v3}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    .line 81
    .line 82
    .line 83
    invoke-static {p0, v0, p1, p2, v1}, Ll/tuf0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 84
    .line 85
    .line 86
    :cond_4
    invoke-virtual {p3}, Ll/nlj0;->d()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-eqz v0, :cond_5

    .line 91
    .line 92
    new-instance v0, Landroid/text/style/TypefaceSpan;

    .line 93
    .line 94
    invoke-virtual {p3}, Ll/nlj0;->d()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-direct {v0, v3}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-static {p0, v0, p1, p2, v1}, Ll/tuf0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 102
    .line 103
    .line 104
    :cond_5
    invoke-virtual {p3}, Ll/nlj0;->o()Ll/qri0;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const/4 v3, 0x3

    .line 109
    const/4 v4, 0x2

    .line 110
    const/4 v5, 0x1

    .line 111
    if-eqz v0, :cond_a

    .line 112
    .line 113
    invoke-virtual {p3}, Ll/nlj0;->o()Ll/qri0;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Ll/qri0;

    .line 122
    .line 123
    iget v6, v0, Ll/qri0;->a:I

    .line 124
    .line 125
    if-ne v6, v2, :cond_8

    .line 126
    .line 127
    if-eq p6, v4, :cond_7

    .line 128
    .line 129
    if-ne p6, v5, :cond_6

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_6
    move v6, v5

    .line 133
    goto :goto_1

    .line 134
    :cond_7
    :goto_0
    move v6, v3

    .line 135
    :goto_1
    move p6, v5

    .line 136
    goto :goto_2

    .line 137
    :cond_8
    iget p6, v0, Ll/qri0;->b:I

    .line 138
    .line 139
    :goto_2
    iget v0, v0, Ll/qri0;->c:I

    .line 140
    .line 141
    const/4 v7, -0x2

    .line 142
    if-ne v0, v7, :cond_9

    .line 143
    .line 144
    move v0, v5

    .line 145
    :cond_9
    new-instance v7, Ll/rri0;

    .line 146
    .line 147
    invoke-direct {v7, v6, p6, v0}, Ll/rri0;-><init>(III)V

    .line 148
    .line 149
    .line 150
    invoke-static {p0, v7, p1, p2, v1}, Ll/tuf0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 151
    .line 152
    .line 153
    :cond_a
    invoke-virtual {p3}, Ll/nlj0;->j()I

    .line 154
    .line 155
    .line 156
    move-result p6

    .line 157
    if-eq p6, v4, :cond_c

    .line 158
    .line 159
    if-eq p6, v3, :cond_b

    .line 160
    .line 161
    const/4 p4, 0x4

    .line 162
    if-eq p6, p4, :cond_b

    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_b
    new-instance p4, Ll/hvd;

    .line 166
    .line 167
    invoke-direct {p4}, Ll/hvd;-><init>()V

    .line 168
    .line 169
    .line 170
    invoke-interface {p0, p4, p1, p2, v1}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 171
    .line 172
    .line 173
    goto :goto_4

    .line 174
    :cond_c
    invoke-static {p4, p5}, Ll/mlj0;->d(Ll/klj0;Ljava/util/Map;)Ll/klj0;

    .line 175
    .line 176
    .line 177
    move-result-object p4

    .line 178
    if-nez p4, :cond_d

    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_d
    invoke-static {p4, p5}, Ll/mlj0;->e(Ll/klj0;Ljava/util/Map;)Ll/klj0;

    .line 182
    .line 183
    .line 184
    move-result-object p6

    .line 185
    if-nez p6, :cond_e

    .line 186
    .line 187
    goto :goto_4

    .line 188
    :cond_e
    invoke-virtual {p6}, Ll/klj0;->g()I

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-ne v0, v5, :cond_11

    .line 193
    .line 194
    const/4 v0, 0x0

    .line 195
    invoke-virtual {p6, v0}, Ll/klj0;->f(I)Ll/klj0;

    .line 196
    .line 197
    .line 198
    move-result-object v6

    .line 199
    iget-object v6, v6, Ll/klj0;->b:Ljava/lang/String;

    .line 200
    .line 201
    if-eqz v6, :cond_11

    .line 202
    .line 203
    invoke-virtual {p6, v0}, Ll/klj0;->f(I)Ll/klj0;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    iget-object v0, v0, Ll/klj0;->b:Ljava/lang/String;

    .line 208
    .line 209
    invoke-static {v0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    check-cast v0, Ljava/lang/String;

    .line 214
    .line 215
    iget-object v6, p6, Ll/klj0;->f:Ll/nlj0;

    .line 216
    .line 217
    invoke-virtual {p6}, Ll/klj0;->l()[Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p6

    .line 221
    invoke-static {v6, p6, p5}, Ll/mlj0;->f(Ll/nlj0;[Ljava/lang/String;Ljava/util/Map;)Ll/nlj0;

    .line 222
    .line 223
    .line 224
    move-result-object p6

    .line 225
    if-eqz p6, :cond_f

    .line 226
    .line 227
    invoke-virtual {p6}, Ll/nlj0;->i()I

    .line 228
    .line 229
    .line 230
    move-result p6

    .line 231
    goto :goto_3

    .line 232
    :cond_f
    move p6, v2

    .line 233
    :goto_3
    if-ne p6, v2, :cond_10

    .line 234
    .line 235
    iget-object v2, p4, Ll/klj0;->f:Ll/nlj0;

    .line 236
    .line 237
    invoke-virtual {p4}, Ll/klj0;->l()[Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p4

    .line 241
    invoke-static {v2, p4, p5}, Ll/mlj0;->f(Ll/nlj0;[Ljava/lang/String;Ljava/util/Map;)Ll/nlj0;

    .line 242
    .line 243
    .line 244
    move-result-object p4

    .line 245
    if-eqz p4, :cond_10

    .line 246
    .line 247
    invoke-virtual {p4}, Ll/nlj0;->i()I

    .line 248
    .line 249
    .line 250
    move-result p6

    .line 251
    :cond_10
    new-instance p4, Ll/uqd0;

    .line 252
    .line 253
    invoke-direct {p4, v0, p6}, Ll/uqd0;-><init>(Ljava/lang/String;I)V

    .line 254
    .line 255
    .line 256
    invoke-interface {p0, p4, p1, p2, v1}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 257
    .line 258
    .line 259
    goto :goto_4

    .line 260
    :cond_11
    const-string p4, "TtmlRenderUtil"

    .line 261
    .line 262
    const-string p5, "Skipping rubyText node without exactly one text child."

    .line 263
    .line 264
    invoke-static {p4, p5}, Ll/kyv;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    :goto_4
    invoke-virtual {p3}, Ll/nlj0;->n()Z

    .line 268
    .line 269
    .line 270
    move-result p4

    .line 271
    if-eqz p4, :cond_12

    .line 272
    .line 273
    new-instance p4, Ll/fhl;

    .line 274
    .line 275
    invoke-direct {p4}, Ll/fhl;-><init>()V

    .line 276
    .line 277
    .line 278
    invoke-static {p0, p4, p1, p2, v1}, Ll/tuf0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 279
    .line 280
    .line 281
    :cond_12
    invoke-virtual {p3}, Ll/nlj0;->f()I

    .line 282
    .line 283
    .line 284
    move-result p4

    .line 285
    if-eq p4, v5, :cond_15

    .line 286
    .line 287
    if-eq p4, v4, :cond_14

    .line 288
    .line 289
    if-eq p4, v3, :cond_13

    .line 290
    .line 291
    return-void

    .line 292
    :cond_13
    new-instance p4, Landroid/text/style/RelativeSizeSpan;

    .line 293
    .line 294
    invoke-virtual {p3}, Ll/nlj0;->e()F

    .line 295
    .line 296
    .line 297
    move-result p3

    .line 298
    const/high16 p5, 0x42c80000    # 100.0f

    .line 299
    .line 300
    div-float/2addr p3, p5

    .line 301
    invoke-direct {p4, p3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 302
    .line 303
    .line 304
    invoke-static {p0, p4, p1, p2, v1}, Ll/tuf0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 305
    .line 306
    .line 307
    return-void

    .line 308
    :cond_14
    new-instance p4, Landroid/text/style/RelativeSizeSpan;

    .line 309
    .line 310
    invoke-virtual {p3}, Ll/nlj0;->e()F

    .line 311
    .line 312
    .line 313
    move-result p3

    .line 314
    invoke-direct {p4, p3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 315
    .line 316
    .line 317
    invoke-static {p0, p4, p1, p2, v1}, Ll/tuf0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :cond_15
    new-instance p4, Landroid/text/style/AbsoluteSizeSpan;

    .line 322
    .line 323
    invoke-virtual {p3}, Ll/nlj0;->e()F

    .line 324
    .line 325
    .line 326
    move-result p3

    .line 327
    float-to-int p3, p3

    .line 328
    invoke-direct {p4, p3, v5}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 329
    .line 330
    .line 331
    invoke-static {p0, p4, p1, p2, v1}, Ll/tuf0;->a(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 332
    .line 333
    .line 334
    return-void
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "\r\n"

    .line 2
    .line 3
    const-string v1, "\n"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, " *\n *"

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, " "

    .line 16
    .line 17
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v1, "[ \t\\x0B\u000c\r]+"

    .line 22
    .line 23
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static c(Landroid/text/SpannableStringBuilder;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/16 v2, 0x20

    .line 14
    .line 15
    if-ne v1, v2, :cond_0

    .line 16
    .line 17
    add-int/lit8 v0, v0, -0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    if-ltz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/16 v1, 0xa

    .line 27
    .line 28
    if-eq v0, v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public static d(Ll/klj0;Ljava/util/Map;)Ll/klj0;
    .locals 2
    .param p0    # Ll/klj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/klj0;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/nlj0;",
            ">;)",
            "Ll/klj0;"
        }
    .end annotation

    .line 1
    :goto_0
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/klj0;->f:Ll/nlj0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/klj0;->l()[Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1, p1}, Ll/mlj0;->f(Ll/nlj0;[Ljava/lang/String;Ljava/util/Map;)Ll/nlj0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/nlj0;->j()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    iget-object p0, p0, Ll/klj0;->j:Ll/klj0;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public static e(Ll/klj0;Ljava/util/Map;)Ll/klj0;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/klj0;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/nlj0;",
            ">;)",
            "Ll/klj0;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {v0, p0}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_2

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/klj0;

    .line 20
    .line 21
    iget-object v1, p0, Ll/klj0;->f:Ll/nlj0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/klj0;->l()[Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v1, v2, p1}, Ll/mlj0;->f(Ll/nlj0;[Ljava/lang/String;Ljava/util/Map;)Ll/nlj0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/nlj0;->j()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, 0x3

    .line 38
    if-ne v1, v2, :cond_1

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_1
    invoke-virtual {p0}, Ll/klj0;->g()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    add-int/lit8 v1, v1, -0x1

    .line 46
    .line 47
    :goto_0
    if-ltz v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Ll/klj0;->f(I)Ll/klj0;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {v0, v2}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    add-int/lit8 v1, v1, -0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    const/4 p0, 0x0

    .line 60
    return-object p0
.end method

.method public static f(Ll/nlj0;[Ljava/lang/String;Ljava/util/Map;)Ll/nlj0;
    .locals 3
    .param p0    # Ll/nlj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nlj0;",
            "[",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/nlj0;",
            ">;)",
            "Ll/nlj0;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p0, :cond_3

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    array-length v2, p1

    .line 10
    if-ne v2, v1, :cond_1

    .line 11
    .line 12
    aget-object p0, p1, v0

    .line 13
    .line 14
    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ll/nlj0;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    array-length v2, p1

    .line 22
    if-le v2, v1, :cond_5

    .line 23
    .line 24
    new-instance p0, Ll/nlj0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/nlj0;-><init>()V

    .line 27
    .line 28
    .line 29
    array-length v1, p1

    .line 30
    :goto_0
    if-ge v0, v1, :cond_2

    .line 31
    .line 32
    aget-object v2, p1, v0

    .line 33
    .line 34
    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ll/nlj0;

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Ll/nlj0;->a(Ll/nlj0;)Ll/nlj0;

    .line 41
    .line 42
    .line 43
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    return-object p0

    .line 47
    :cond_3
    if-eqz p1, :cond_4

    .line 48
    .line 49
    array-length v2, p1

    .line 50
    if-ne v2, v1, :cond_4

    .line 51
    .line 52
    aget-object p1, p1, v0

    .line 53
    .line 54
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Ll/nlj0;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ll/nlj0;->a(Ll/nlj0;)Ll/nlj0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_4
    if-eqz p1, :cond_5

    .line 66
    .line 67
    array-length v2, p1

    .line 68
    if-le v2, v1, :cond_5

    .line 69
    .line 70
    array-length v1, p1

    .line 71
    :goto_1
    if-ge v0, v1, :cond_5

    .line 72
    .line 73
    aget-object v2, p1, v0

    .line 74
    .line 75
    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Ll/nlj0;

    .line 80
    .line 81
    invoke-virtual {p0, v2}, Ll/nlj0;->a(Ll/nlj0;)Ll/nlj0;

    .line 82
    .line 83
    .line 84
    add-int/lit8 v0, v0, 0x1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_5
    return-object p0
.end method
