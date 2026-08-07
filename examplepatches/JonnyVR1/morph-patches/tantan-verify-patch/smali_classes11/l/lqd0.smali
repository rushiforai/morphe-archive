.class public final Ll/lqd0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/zpd0;

.field public final b:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/rtsp/e;Ll/ksx;Landroid/net/Uri;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p2, Ll/ksx;->i:Lcom/google/common/collect/ImmutableMap;

    .line 5
    .line 6
    const-string v1, "control"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v2, "missing attribute control"

    .line 13
    .line 14
    invoke-static {v0, v2}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p2}, Ll/lqd0;->b(Ll/ksx;)Ll/zpd0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/lqd0;->a:Ll/zpd0;

    .line 22
    .line 23
    iget-object p2, p2, Ll/ksx;->i:Lcom/google/common/collect/ImmutableMap;

    .line 24
    .line 25
    invoke-virtual {p2, v1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p2}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1, p3, p2}, Ll/lqd0;->a(Lcom/google/android/exoplayer2/source/rtsp/e;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Ll/lqd0;->b:Landroid/net/Uri;

    .line 42
    .line 43
    return-void
.end method

.method public static a(Lcom/google/android/exoplayer2/source/rtsp/e;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/net/Uri;->isAbsolute()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    const-string v0, "Content-Base"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-string v0, "Content-Location"

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    :cond_2
    :goto_0
    const-string p0, "*"

    .line 54
    .line 55
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_3

    .line 60
    .line 61
    return-object p1

    .line 62
    :cond_3
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, p2}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method public static b(Ll/ksx;)Ll/zpd0;
    .locals 13
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/k$b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Ll/ksx;->e:I

    .line 7
    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->I(I)Lcom/google/android/exoplayer2/k$b;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v1, p0, Ll/ksx;->j:Ll/ksx$c;

    .line 14
    .line 15
    iget v4, v1, Ll/ksx$c;->a:I

    .line 16
    .line 17
    iget-object v7, v1, Ll/ksx$c;->b:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v7}, Ll/zpd0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Ll/ksx;->j:Ll/ksx$c;

    .line 27
    .line 28
    iget v5, v2, Ll/ksx$c;->c:I

    .line 29
    .line 30
    const-string v2, "audio"

    .line 31
    .line 32
    iget-object v3, p0, Ll/ksx;->a:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const/4 v3, -0x1

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    iget-object v2, p0, Ll/ksx;->j:Ll/ksx$c;

    .line 42
    .line 43
    iget v2, v2, Ll/ksx$c;->d:I

    .line 44
    .line 45
    invoke-static {v2, v1}, Ll/lqd0;->d(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-virtual {v6, v2}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    move v2, v3

    .line 58
    :goto_0
    invoke-virtual {p0}, Ll/ksx;->a()Lcom/google/common/collect/ImmutableMap;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    const/16 v8, 0xf0

    .line 67
    .line 68
    const/16 v9, 0x140

    .line 69
    .line 70
    const-string v10, "missing attribute fmtp"

    .line 71
    .line 72
    const/4 v11, 0x0

    .line 73
    const/4 v12, 0x1

    .line 74
    sparse-switch p0, :sswitch_data_0

    .line 75
    .line 76
    .line 77
    goto/16 :goto_9

    .line 78
    .line 79
    :sswitch_0
    const-string p0, "audio/g711-mlaw"

    .line 80
    .line 81
    :goto_1
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    goto/16 :goto_9

    .line 86
    .line 87
    :sswitch_1
    const-string p0, "audio/g711-alaw"

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :sswitch_2
    const-string p0, "video/x-vnd.on2.vp9"

    .line 91
    .line 92
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_9

    .line 97
    .line 98
    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 103
    .line 104
    .line 105
    goto/16 :goto_9

    .line 106
    .line 107
    :sswitch_3
    const-string p0, "video/x-vnd.on2.vp8"

    .line 108
    .line 109
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_9

    .line 114
    .line 115
    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 120
    .line 121
    .line 122
    goto/16 :goto_9

    .line 123
    .line 124
    :sswitch_4
    const-string p0, "audio/opus"

    .line 125
    .line 126
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-eqz p0, :cond_9

    .line 131
    .line 132
    if-eq v2, v3, :cond_2

    .line 133
    .line 134
    move p0, v12

    .line 135
    goto :goto_2

    .line 136
    :cond_2
    move p0, v11

    .line 137
    :goto_2
    invoke-static {p0}, Ll/w11;->a(Z)V

    .line 138
    .line 139
    .line 140
    const p0, 0xbb80

    .line 141
    .line 142
    .line 143
    if-ne v5, p0, :cond_3

    .line 144
    .line 145
    move p0, v12

    .line 146
    goto :goto_3

    .line 147
    :cond_3
    move p0, v11

    .line 148
    :goto_3
    const-string v1, "Invalid OPUS clock rate."

    .line 149
    .line 150
    invoke-static {p0, v1}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    goto/16 :goto_9

    .line 154
    .line 155
    :sswitch_5
    const-string p0, "audio/3gpp"

    .line 156
    .line 157
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-eqz p0, :cond_9

    .line 162
    .line 163
    goto/16 :goto_7

    .line 164
    .line 165
    :sswitch_6
    const-string p0, "video/avc"

    .line 166
    .line 167
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-eqz p0, :cond_9

    .line 172
    .line 173
    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableMap;->isEmpty()Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    xor-int/2addr p0, v12

    .line 178
    invoke-static {p0, v10}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    invoke-static {v0, v6}, Ll/lqd0;->g(Lcom/google/android/exoplayer2/k$b;Lcom/google/common/collect/ImmutableMap;)V

    .line 182
    .line 183
    .line 184
    goto/16 :goto_9

    .line 185
    .line 186
    :sswitch_7
    const-string p0, "video/mp4v-es"

    .line 187
    .line 188
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    if-eqz p0, :cond_9

    .line 193
    .line 194
    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableMap;->isEmpty()Z

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    xor-int/2addr p0, v12

    .line 199
    invoke-static {p0}, Ll/w11;->a(Z)V

    .line 200
    .line 201
    .line 202
    invoke-static {v0, v6}, Ll/lqd0;->i(Lcom/google/android/exoplayer2/k$b;Lcom/google/common/collect/ImmutableMap;)V

    .line 203
    .line 204
    .line 205
    goto/16 :goto_9

    .line 206
    .line 207
    :sswitch_8
    const-string p0, "audio/raw"

    .line 208
    .line 209
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    if-eqz p0, :cond_9

    .line 214
    .line 215
    invoke-static {v7}, Ll/zpd0;->b(Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/k$b;->a0(I)Lcom/google/android/exoplayer2/k$b;

    .line 220
    .line 221
    .line 222
    goto/16 :goto_9

    .line 223
    .line 224
    :sswitch_9
    const-string p0, "audio/ac3"

    .line 225
    .line 226
    goto/16 :goto_1

    .line 227
    .line 228
    :sswitch_a
    const-string p0, "audio/mp4a-latm"

    .line 229
    .line 230
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    if-eqz p0, :cond_9

    .line 235
    .line 236
    if-eq v2, v3, :cond_4

    .line 237
    .line 238
    move p0, v12

    .line 239
    goto :goto_4

    .line 240
    :cond_4
    move p0, v11

    .line 241
    :goto_4
    invoke-static {p0}, Ll/w11;->a(Z)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableMap;->isEmpty()Z

    .line 245
    .line 246
    .line 247
    move-result p0

    .line 248
    xor-int/2addr p0, v12

    .line 249
    invoke-static {p0, v10}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 250
    .line 251
    .line 252
    const-string p0, "MP4A-LATM"

    .line 253
    .line 254
    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    if-eqz p0, :cond_7

    .line 259
    .line 260
    const-string p0, "cpresent"

    .line 261
    .line 262
    invoke-virtual {v6, p0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    if-eqz v1, :cond_5

    .line 267
    .line 268
    invoke-virtual {v6, p0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    check-cast p0, Ljava/lang/String;

    .line 273
    .line 274
    const-string v1, "0"

    .line 275
    .line 276
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    move-result p0

    .line 280
    if-eqz p0, :cond_5

    .line 281
    .line 282
    move p0, v12

    .line 283
    goto :goto_5

    .line 284
    :cond_5
    move p0, v11

    .line 285
    :goto_5
    const-string v1, "Only supports cpresent=0 in AAC audio."

    .line 286
    .line 287
    invoke-static {p0, v1}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 288
    .line 289
    .line 290
    const-string p0, "config"

    .line 291
    .line 292
    invoke-virtual {v6, p0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    check-cast p0, Ljava/lang/String;

    .line 297
    .line 298
    const-string v1, "AAC audio stream must include config fmtp parameter"

    .line 299
    .line 300
    invoke-static {p0, v1}, Ll/w11;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    rem-int/lit8 v1, v1, 0x2

    .line 308
    .line 309
    if-nez v1, :cond_6

    .line 310
    .line 311
    move v1, v12

    .line 312
    goto :goto_6

    .line 313
    :cond_6
    move v1, v11

    .line 314
    :goto_6
    const-string v3, "Malformat MPEG4 config: "

    .line 315
    .line 316
    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v3

    .line 320
    invoke-static {v1, v3}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 321
    .line 322
    .line 323
    invoke-static {p0}, Ll/lqd0;->e(Ljava/lang/String;)Ll/z1$b;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    iget v1, p0, Ll/z1$b;->a:I

    .line 328
    .line 329
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    iget v3, p0, Ll/z1$b;->b:I

    .line 334
    .line 335
    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    iget-object p0, p0, Ll/z1$b;->c:Ljava/lang/String;

    .line 340
    .line 341
    invoke-virtual {v1, p0}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 342
    .line 343
    .line 344
    :cond_7
    invoke-static {v0, v6, v7, v2, v5}, Ll/lqd0;->f(Lcom/google/android/exoplayer2/k$b;Lcom/google/common/collect/ImmutableMap;Ljava/lang/String;II)V

    .line 345
    .line 346
    .line 347
    goto :goto_9

    .line 348
    :sswitch_b
    const-string p0, "audio/amr-wb"

    .line 349
    .line 350
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    move-result p0

    .line 354
    if-eqz p0, :cond_9

    .line 355
    .line 356
    :goto_7
    if-ne v2, v12, :cond_8

    .line 357
    .line 358
    move p0, v12

    .line 359
    goto :goto_8

    .line 360
    :cond_8
    move p0, v11

    .line 361
    :goto_8
    const-string v1, "Multi channel AMR is not currently supported."

    .line 362
    .line 363
    invoke-static {p0, v1}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableMap;->isEmpty()Z

    .line 367
    .line 368
    .line 369
    move-result p0

    .line 370
    xor-int/2addr p0, v12

    .line 371
    const-string v1, "fmtp parameters must include octet-align."

    .line 372
    .line 373
    invoke-static {p0, v1}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 374
    .line 375
    .line 376
    const-string p0, "octet-align"

    .line 377
    .line 378
    invoke-virtual {v6, p0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    move-result p0

    .line 382
    const-string v1, "Only octet aligned mode is currently supported."

    .line 383
    .line 384
    invoke-static {p0, v1}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 385
    .line 386
    .line 387
    const-string p0, "interleaving"

    .line 388
    .line 389
    invoke-virtual {v6, p0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result p0

    .line 393
    xor-int/2addr p0, v12

    .line 394
    const-string v1, "Interleaving mode is not currently supported."

    .line 395
    .line 396
    invoke-static {p0, v1}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 397
    .line 398
    .line 399
    goto :goto_9

    .line 400
    :sswitch_c
    const-string p0, "video/hevc"

    .line 401
    .line 402
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 403
    .line 404
    .line 405
    move-result p0

    .line 406
    if-eqz p0, :cond_9

    .line 407
    .line 408
    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableMap;->isEmpty()Z

    .line 409
    .line 410
    .line 411
    move-result p0

    .line 412
    xor-int/2addr p0, v12

    .line 413
    invoke-static {p0, v10}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 414
    .line 415
    .line 416
    invoke-static {v0, v6}, Ll/lqd0;->h(Lcom/google/android/exoplayer2/k$b;Lcom/google/common/collect/ImmutableMap;)V

    .line 417
    .line 418
    .line 419
    goto :goto_9

    .line 420
    :sswitch_d
    const-string p0, "video/3gpp"

    .line 421
    .line 422
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 423
    .line 424
    .line 425
    move-result p0

    .line 426
    if-eqz p0, :cond_9

    .line 427
    .line 428
    const/16 p0, 0x160

    .line 429
    .line 430
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 431
    .line 432
    .line 433
    move-result-object p0

    .line 434
    const/16 v1, 0x120

    .line 435
    .line 436
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 437
    .line 438
    .line 439
    :cond_9
    :goto_9
    if-lez v5, :cond_a

    .line 440
    .line 441
    move v11, v12

    .line 442
    :cond_a
    invoke-static {v11}, Ll/w11;->a(Z)V

    .line 443
    .line 444
    .line 445
    new-instance v2, Ll/zpd0;

    .line 446
    .line 447
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 448
    .line 449
    .line 450
    move-result-object v3

    .line 451
    invoke-direct/range {v2 .. v7}, Ll/zpd0;-><init>(Lcom/google/android/exoplayer2/k;IILjava/util/Map;Ljava/lang/String;)V

    .line 452
    .line 453
    .line 454
    return-object v2

    .line 455
    :sswitch_data_0
    .sparse-switch
        -0x63306f58 -> :sswitch_d
        -0x63185e82 -> :sswitch_c
        -0x5fc6f775 -> :sswitch_b
        -0x3313c2e -> :sswitch_a
        0xb269698 -> :sswitch_9
        0xb26d66f -> :sswitch_8
        0x46cdc642 -> :sswitch_7
        0x4f62373a -> :sswitch_6
        0x59976a2d -> :sswitch_5
        0x59b2d2d8 -> :sswitch_4
        0x5f50bed8 -> :sswitch_3
        0x5f50bed9 -> :sswitch_2
        0x71710385 -> :sswitch_1
        0x717677f9 -> :sswitch_0
    .end sparse-switch
.end method

.method public static c(Ljava/lang/String;)[B
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    array-length v1, p0

    .line 7
    sget-object v2, Ll/jb20;->a:[B

    .line 8
    .line 9
    array-length v3, v2

    .line 10
    add-int/2addr v1, v3

    .line 11
    new-array v1, v1, [B

    .line 12
    .line 13
    array-length v3, v2

    .line 14
    invoke-static {v2, v0, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 15
    .line 16
    .line 17
    array-length v2, v2

    .line 18
    array-length v3, p0

    .line 19
    invoke-static {p0, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    return-object v1
.end method

.method public static d(ILjava/lang/String;)I
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p0, v0, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    const-string p0, "audio/ac3"

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x6

    .line 14
    return p0

    .line 15
    :cond_1
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public static e(Ljava/lang/String;)Ll/z1$b;
    .locals 4

    .line 1
    new-instance v0, Ll/hg60;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->K(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/hg60;-><init>([B)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    invoke-virtual {v0, p0}, Ll/hg60;->h(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    move v1, p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v1, v2

    .line 21
    :goto_0
    const-string v3, "Only supports audio mux version 0."

    .line 22
    .line 23
    invoke-static {v1, v3}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ll/hg60;->h(I)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-ne v1, p0, :cond_1

    .line 31
    .line 32
    move v1, p0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    const-string v3, "Only supports allStreamsSameTimeFraming."

    .line 36
    .line 37
    invoke-static {v1, v3}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x6

    .line 41
    invoke-virtual {v0, v1}, Ll/hg60;->r(I)V

    .line 42
    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    invoke-virtual {v0, v1}, Ll/hg60;->h(I)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    move v1, p0

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move v1, v2

    .line 54
    :goto_2
    const-string v3, "Only supports one program."

    .line 55
    .line 56
    invoke-static {v1, v3}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    const/4 v1, 0x3

    .line 60
    invoke-virtual {v0, v1}, Ll/hg60;->h(I)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_3

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_3
    move p0, v2

    .line 68
    :goto_3
    const-string v1, "Only supports one numLayer."

    .line 69
    .line 70
    invoke-static {p0, v1}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    :try_start_0
    invoke-static {v0, v2}, Ll/z1;->e(Ll/hg60;Z)Ll/z1$b;

    .line 74
    .line 75
    .line 76
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    return-object p0

    .line 78
    :catch_0
    move-exception p0

    .line 79
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    const/4 p0, 0x0

    .line 83
    return-object p0
.end method

.method public static f(Lcom/google/android/exoplayer2/k$b;Lcom/google/common/collect/ImmutableMap;Ljava/lang/String;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/k$b;",
            "Lcom/google/common/collect/ImmutableMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "II)V"
        }
    .end annotation

    .line 1
    const-string v0, "profile-level-id"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-string v0, "MP4A-LATM"

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    const-string p1, "30"

    .line 20
    .line 21
    :cond_0
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    const/4 p2, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 p2, 0x0

    .line 32
    :goto_0
    const-string v0, "missing profile-level-id param"

    .line 33
    .line 34
    invoke-static {p2, v0}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    new-instance p2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v0, "mp4a.40."

    .line 40
    .line 41
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 52
    .line 53
    .line 54
    invoke-static {p4, p3}, Ll/z1;->a(II)[B

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static g(Lcom/google/android/exoplayer2/k$b;Lcom/google/common/collect/ImmutableMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/k$b;",
            "Lcom/google/common/collect/ImmutableMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "sprop-parameter-sets"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "missing sprop parameter"

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, ","

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bmk0;->a1(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    array-length v1, v0

    .line 31
    const/4 v2, 0x2

    .line 32
    const/4 v3, 0x1

    .line 33
    const/4 v4, 0x0

    .line 34
    if-ne v1, v2, :cond_0

    .line 35
    .line 36
    move v1, v3

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move v1, v4

    .line 39
    :goto_0
    const-string v2, "empty sprop value"

    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    aget-object v1, v0, v4

    .line 45
    .line 46
    invoke-static {v1}, Ll/lqd0;->c(Ljava/lang/String;)[B

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    aget-object v0, v0, v3

    .line 51
    .line 52
    invoke-static {v0}, Ll/lqd0;->c(Ljava/lang/String;)[B

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v1, v0}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 61
    .line 62
    .line 63
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, [B

    .line 68
    .line 69
    sget-object v1, Ll/jb20;->a:[B

    .line 70
    .line 71
    array-length v1, v1

    .line 72
    array-length v2, v0

    .line 73
    invoke-static {v0, v1, v2}, Ll/jb20;->l([BII)Ll/jb20$c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget v1, v0, Ll/jb20$c;->h:F

    .line 78
    .line 79
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/k$b;->c0(F)Lcom/google/android/exoplayer2/k$b;

    .line 80
    .line 81
    .line 82
    iget v1, v0, Ll/jb20$c;->g:I

    .line 83
    .line 84
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 85
    .line 86
    .line 87
    iget v1, v0, Ll/jb20$c;->f:I

    .line 88
    .line 89
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 90
    .line 91
    .line 92
    const-string v1, "profile-level-id"

    .line 93
    .line 94
    invoke-virtual {p1, v1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Ljava/lang/String;

    .line 99
    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    const-string v0, "avc1."

    .line 103
    .line 104
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_1
    iget p1, v0, Ll/jb20$c;->a:I

    .line 113
    .line 114
    iget v1, v0, Ll/jb20$c;->b:I

    .line 115
    .line 116
    iget v0, v0, Ll/jb20$c;->c:I

    .line 117
    .line 118
    invoke-static {p1, v1, v0}, Ll/lc5;->a(III)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public static h(Lcom/google/android/exoplayer2/k$b;Lcom/google/common/collect/ImmutableMap;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/k$b;",
            "Lcom/google/common/collect/ImmutableMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "sprop-max-don-diff"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    move v1, v2

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v1, 0x0

    .line 31
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v4, "non-zero sprop-max-don-diff "

    .line 34
    .line 35
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, " is not supported"

    .line 42
    .line 43
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v1, v0}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    const-string v0, "sprop-vps"

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    const-string v3, "missing sprop-vps parameter"

    .line 60
    .line 61
    invoke-static {v1, v3}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/String;

    .line 75
    .line 76
    const-string v1, "sprop-sps"

    .line 77
    .line 78
    invoke-virtual {p1, v1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    const-string v4, "missing sprop-sps parameter"

    .line 83
    .line 84
    invoke-static {v3, v4}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    check-cast v1, Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Ljava/lang/String;

    .line 98
    .line 99
    const-string v3, "sprop-pps"

    .line 100
    .line 101
    invoke-virtual {p1, v3}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    const-string v5, "missing sprop-pps parameter"

    .line 106
    .line 107
    invoke-static {v4, v5}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v3}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v0}, Ll/lqd0;->c(Ljava/lang/String;)[B

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v1}, Ll/lqd0;->c(Ljava/lang/String;)[B

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-static {p1}, Ll/lqd0;->c(Ljava/lang/String;)[B

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {v0, v1, p1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 139
    .line 140
    .line 141
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    check-cast p1, [B

    .line 146
    .line 147
    sget-object v0, Ll/jb20;->a:[B

    .line 148
    .line 149
    array-length v0, v0

    .line 150
    array-length v1, p1

    .line 151
    invoke-static {p1, v0, v1}, Ll/jb20;->h([BII)Ll/jb20$a;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    iget v0, p1, Ll/jb20$a;->m:F

    .line 156
    .line 157
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/k$b;->c0(F)Lcom/google/android/exoplayer2/k$b;

    .line 158
    .line 159
    .line 160
    iget v0, p1, Ll/jb20$a;->l:I

    .line 161
    .line 162
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iget v1, p1, Ll/jb20$a;->k:I

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 169
    .line 170
    .line 171
    iget v2, p1, Ll/jb20$a;->a:I

    .line 172
    .line 173
    iget-boolean v3, p1, Ll/jb20$a;->b:Z

    .line 174
    .line 175
    iget v4, p1, Ll/jb20$a;->c:I

    .line 176
    .line 177
    iget v5, p1, Ll/jb20$a;->d:I

    .line 178
    .line 179
    iget-object v6, p1, Ll/jb20$a;->h:[I

    .line 180
    .line 181
    iget v7, p1, Ll/jb20$a;->i:I

    .line 182
    .line 183
    invoke-static/range {v2 .. v7}, Ll/lc5;->c(IZII[II)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public static i(Lcom/google/android/exoplayer2/k$b;Lcom/google/common/collect/ImmutableMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/k$b;",
            "Lcom/google/common/collect/ImmutableMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "config"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Ll/bmk0;->K(Ljava/lang/String;)[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/lc5;->f([B)Landroid/util/Pair;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v0, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/16 v0, 0x160

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/16 v1, 0x120

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 59
    .line 60
    .line 61
    :goto_0
    const-string v0, "profile-level-id"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Ljava/lang/String;

    .line 68
    .line 69
    if-nez p1, :cond_1

    .line 70
    .line 71
    const-string p1, "1"

    .line 72
    .line 73
    :cond_1
    const-string v0, "mp4v."

    .line 74
    .line 75
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 80
    .line 81
    .line 82
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Ll/lqd0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ll/lqd0;

    .line 18
    .line 19
    iget-object v2, p0, Ll/lqd0;->a:Ll/zpd0;

    .line 20
    .line 21
    iget-object v3, p1, Ll/lqd0;->a:Ll/zpd0;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ll/zpd0;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Ll/lqd0;->b:Landroid/net/Uri;

    .line 30
    .line 31
    iget-object p1, p1, Ll/lqd0;->b:Landroid/net/Uri;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    return v0

    .line 40
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lqd0;->a:Ll/zpd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zpd0;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xd9

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    mul-int/lit8 v1, v1, 0x1f

    .line 11
    .line 12
    iget-object p0, p0, Ll/lqd0;->b:Landroid/net/Uri;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/net/Uri;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    add-int/2addr v1, p0

    .line 19
    return v1
.end method
