.class public Ll/r35;
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

.method public static a(Ljava/lang/Throwable;I)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 12
    .line 13
    if-ne p0, p1, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v0
.end method

.method public static b(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, ""

    .line 9
    .line 10
    return-object p0
.end method

.method public static c(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 12
    .line 13
    const v2, 0xa809

    .line 14
    .line 15
    .line 16
    if-eq v0, v2, :cond_1

    .line 17
    .line 18
    const v2, 0xa80a

    .line 19
    .line 20
    .line 21
    if-eq v0, v2, :cond_1

    .line 22
    .line 23
    const v2, 0xc745

    .line 24
    .line 25
    .line 26
    if-eq v0, v2, :cond_1

    .line 27
    .line 28
    const v2, 0xa807

    .line 29
    .line 30
    .line 31
    if-eq v0, v2, :cond_1

    .line 32
    .line 33
    const v2, 0xa7f8

    .line 34
    .line 35
    .line 36
    if-eq v0, v2, :cond_1

    .line 37
    .line 38
    const v2, 0xa812

    .line 39
    .line 40
    .line 41
    if-eq v0, v2, :cond_1

    .line 42
    .line 43
    const v2, 0xa813

    .line 44
    .line 45
    .line 46
    if-eq v0, v2, :cond_1

    .line 47
    .line 48
    const v2, 0xa7fe

    .line 49
    .line 50
    .line 51
    if-eq v0, v2, :cond_1

    .line 52
    .line 53
    const v2, 0xa4d8

    .line 54
    .line 55
    .line 56
    if-eq v0, v2, :cond_1

    .line 57
    .line 58
    const v2, 0xa818

    .line 59
    .line 60
    .line 61
    if-eq v0, v2, :cond_1

    .line 62
    .line 63
    const v2, 0xa819

    .line 64
    .line 65
    .line 66
    if-eq v0, v2, :cond_1

    .line 67
    .line 68
    const v2, 0xa81a

    .line 69
    .line 70
    .line 71
    if-eq v0, v2, :cond_1

    .line 72
    .line 73
    const v2, 0xa820

    .line 74
    .line 75
    .line 76
    if-eq v0, v2, :cond_1

    .line 77
    .line 78
    const v2, 0xa82c

    .line 79
    .line 80
    .line 81
    if-eq v0, v2, :cond_1

    .line 82
    .line 83
    const v2, 0xa82d

    .line 84
    .line 85
    .line 86
    if-eq v0, v2, :cond_1

    .line 87
    .line 88
    const v2, 0xa82e

    .line 89
    .line 90
    .line 91
    if-eq v0, v2, :cond_1

    .line 92
    .line 93
    const v2, 0xa841

    .line 94
    .line 95
    .line 96
    if-eq v0, v2, :cond_1

    .line 97
    .line 98
    const v2, 0xa842

    .line 99
    .line 100
    .line 101
    if-eq v0, v2, :cond_1

    .line 102
    .line 103
    const v2, 0xa80c

    .line 104
    .line 105
    .line 106
    if-eq v0, v2, :cond_1

    .line 107
    .line 108
    const v2, 0xa843

    .line 109
    .line 110
    .line 111
    if-eq v0, v2, :cond_1

    .line 112
    .line 113
    const v2, 0xa7fc

    .line 114
    .line 115
    .line 116
    if-eq v0, v2, :cond_1

    .line 117
    .line 118
    const v2, 0xa85c

    .line 119
    .line 120
    .line 121
    if-eq v0, v2, :cond_1

    .line 122
    .line 123
    const v2, 0xa85d

    .line 124
    .line 125
    .line 126
    if-eq v0, v2, :cond_1

    .line 127
    .line 128
    const v2, 0xa85f

    .line 129
    .line 130
    .line 131
    if-eq v0, v2, :cond_1

    .line 132
    .line 133
    const v2, 0xa860

    .line 134
    .line 135
    .line 136
    if-eq v0, v2, :cond_1

    .line 137
    .line 138
    const v2, 0xa85e

    .line 139
    .line 140
    .line 141
    if-eq v0, v2, :cond_1

    .line 142
    .line 143
    const v2, 0xd6db

    .line 144
    .line 145
    .line 146
    if-eq v0, v2, :cond_1

    .line 147
    .line 148
    const v2, 0xd6dd

    .line 149
    .line 150
    .line 151
    if-eq v0, v2, :cond_1

    .line 152
    .line 153
    const v2, 0xd740

    .line 154
    .line 155
    .line 156
    if-eq v0, v2, :cond_1

    .line 157
    .line 158
    const v2, 0xd73d

    .line 159
    .line 160
    .line 161
    if-eq v0, v2, :cond_1

    .line 162
    .line 163
    const v2, 0xd6f0

    .line 164
    .line 165
    .line 166
    if-eq v0, v2, :cond_1

    .line 167
    .line 168
    const v2, 0xd73f

    .line 169
    .line 170
    .line 171
    if-eq v0, v2, :cond_1

    .line 172
    .line 173
    const v2, 0xa814

    .line 174
    .line 175
    .line 176
    if-eq v0, v2, :cond_1

    .line 177
    .line 178
    const v2, 0xea7e

    .line 179
    .line 180
    .line 181
    if-eq v0, v2, :cond_1

    .line 182
    .line 183
    const v2, 0xa802

    .line 184
    .line 185
    .line 186
    if-eq v0, v2, :cond_1

    .line 187
    .line 188
    const v2, 0xa03c

    .line 189
    .line 190
    .line 191
    if-eq v0, v2, :cond_1

    .line 192
    .line 193
    const v2, 0xa890

    .line 194
    .line 195
    .line 196
    if-eq v0, v2, :cond_1

    .line 197
    .line 198
    const v2, 0xa88f

    .line 199
    .line 200
    .line 201
    if-eq v0, v2, :cond_1

    .line 202
    .line 203
    const v2, 0xa891

    .line 204
    .line 205
    .line 206
    if-eq v0, v2, :cond_1

    .line 207
    .line 208
    const v2, 0xd73e

    .line 209
    .line 210
    .line 211
    if-eq v0, v2, :cond_1

    .line 212
    .line 213
    const v2, 0xa870

    .line 214
    .line 215
    .line 216
    if-eq v0, v2, :cond_1

    .line 217
    .line 218
    const v2, 0xa871

    .line 219
    .line 220
    .line 221
    if-eq v0, v2, :cond_1

    .line 222
    .line 223
    const v2, 0xa872

    .line 224
    .line 225
    .line 226
    if-eq v0, v2, :cond_1

    .line 227
    .line 228
    const v2, 0xa873

    .line 229
    .line 230
    .line 231
    if-eq v0, v2, :cond_1

    .line 232
    .line 233
    const v2, 0xa874

    .line 234
    .line 235
    .line 236
    if-eq v0, v2, :cond_1

    .line 237
    .line 238
    const v2, 0xa898

    .line 239
    .line 240
    .line 241
    if-eq v0, v2, :cond_1

    .line 242
    .line 243
    const v2, 0xa89d

    .line 244
    .line 245
    .line 246
    if-eq v0, v2, :cond_1

    .line 247
    .line 248
    const v2, 0xa821

    .line 249
    .line 250
    .line 251
    if-eq v0, v2, :cond_1

    .line 252
    .line 253
    const v2, 0xa89e

    .line 254
    .line 255
    .line 256
    if-eq v0, v2, :cond_1

    .line 257
    .line 258
    const v2, 0xa861

    .line 259
    .line 260
    .line 261
    if-eq v0, v2, :cond_1

    .line 262
    .line 263
    const v2, 0xa862

    .line 264
    .line 265
    .line 266
    if-eq v0, v2, :cond_1

    .line 267
    .line 268
    const v2, 0xa81f

    .line 269
    .line 270
    .line 271
    if-eq v0, v2, :cond_1

    .line 272
    .line 273
    const v2, 0xa884

    .line 274
    .line 275
    .line 276
    if-ne v0, v2, :cond_3

    .line 277
    .line 278
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 279
    .line 280
    goto :goto_0

    .line 281
    :cond_2
    const/4 v0, 0x0

    .line 282
    :cond_3
    :goto_0
    if-nez v1, :cond_4

    .line 283
    .line 284
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->J9:I

    .line 285
    .line 286
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 287
    .line 288
    .line 289
    goto :goto_1

    .line 290
    :cond_4
    invoke-static {v1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 294
    .line 295
    const-string v2, "error cause code = "

    .line 296
    .line 297
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    const-string v0, " message = "

    .line 304
    .line 305
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    const-string v0, "[voice][call]"

    .line 316
    .line 317
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    return-void
.end method
