.class public final Ll/ygy0;
.super Ll/avr0;
.source "SourceFile"


# instance fields
.field public final b:Ll/sdr0;


# direct methods
.method public constructor <init>(Ll/sdr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/avr0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ygy0;->b:Ll/sdr0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/String;Ll/gix0;Ljava/util/List;)Ll/ewr0;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/gix0;",
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;)",
            "Ll/ewr0;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-string v1, "setEventName"

    .line 9
    .line 10
    const-string v2, "setParamValue"

    .line 11
    .line 12
    const-string v3, "getParams"

    .line 13
    .line 14
    const/4 v4, 0x2

    .line 15
    const-string v5, "getParamValue"

    .line 16
    .line 17
    const-string v6, "getTimestamp"

    .line 18
    .line 19
    const-string v7, "getEventName"

    .line 20
    .line 21
    const/4 v8, 0x1

    .line 22
    const/4 v9, 0x0

    .line 23
    const/4 v10, -0x1

    .line 24
    sparse-switch v0, :sswitch_data_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :sswitch_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v10, 0x5

    .line 36
    goto :goto_0

    .line 37
    :sswitch_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 v10, 0x4

    .line 45
    goto :goto_0

    .line 46
    :sswitch_2
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    const/4 v10, 0x3

    .line 54
    goto :goto_0

    .line 55
    :sswitch_3
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_3

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    move v10, v4

    .line 63
    goto :goto_0

    .line 64
    :sswitch_4
    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_4

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    move v10, v8

    .line 72
    goto :goto_0

    .line 73
    :sswitch_5
    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_5

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    move v10, v9

    .line 81
    :goto_0
    packed-switch v10, :pswitch_data_0

    .line 82
    .line 83
    .line 84
    invoke-super {p0, p1, p2, p3}, Ll/avr0;->c(Ljava/lang/String;Ll/gix0;Ljava/util/List;)Ll/ewr0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :pswitch_0
    invoke-static {v1, v8, p3}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 90
    .line 91
    .line 92
    invoke-interface {p3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Ll/ewr0;

    .line 97
    .line 98
    invoke-virtual {p2, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    sget-object p2, Ll/ewr0;->w0:Ll/ewr0;

    .line 103
    .line 104
    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-nez p2, :cond_6

    .line 109
    .line 110
    sget-object p2, Ll/ewr0;->x0:Ll/ewr0;

    .line 111
    .line 112
    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-nez p2, :cond_6

    .line 117
    .line 118
    iget-object p0, p0, Ll/ygy0;->b:Ll/sdr0;

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/sdr0;->d()Ll/efr0;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p0, p2}, Ll/efr0;->f(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    new-instance p0, Ll/vyr0;

    .line 132
    .line 133
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-direct {p0, p1}, Ll/vyr0;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-object p0

    .line 141
    :cond_6
    const-string p0, "Illegal event name"

    .line 142
    .line 143
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    const/4 p0, 0x0

    .line 147
    return-object p0

    .line 148
    :pswitch_1
    invoke-static {v2, v4, p3}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 149
    .line 150
    .line 151
    invoke-interface {p3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    check-cast p1, Ll/ewr0;

    .line 156
    .line 157
    invoke-virtual {p2, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-interface {p3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p3

    .line 169
    check-cast p3, Ll/ewr0;

    .line 170
    .line 171
    invoke-virtual {p2, p3}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    iget-object p0, p0, Ll/ygy0;->b:Ll/sdr0;

    .line 176
    .line 177
    invoke-virtual {p0}, Ll/sdr0;->d()Ll/efr0;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-static {p2}, Ll/tqw0;->d(Ll/ewr0;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p3

    .line 185
    invoke-virtual {p0, p1, p3}, Ll/efr0;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 186
    .line 187
    .line 188
    return-object p2

    .line 189
    :pswitch_2
    invoke-static {v3, v9, p3}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 190
    .line 191
    .line 192
    iget-object p0, p0, Ll/ygy0;->b:Ll/sdr0;

    .line 193
    .line 194
    invoke-virtual {p0}, Ll/sdr0;->d()Ll/efr0;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-virtual {p0}, Ll/efr0;->g()Ljava/util/Map;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    new-instance p1, Ll/avr0;

    .line 203
    .line 204
    invoke-direct {p1}, Ll/avr0;-><init>()V

    .line 205
    .line 206
    .line 207
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 208
    .line 209
    .line 210
    move-result-object p2

    .line 211
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 212
    .line 213
    .line 214
    move-result-object p2

    .line 215
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 216
    .line 217
    .line 218
    move-result p3

    .line 219
    if-eqz p3, :cond_7

    .line 220
    .line 221
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object p3

    .line 225
    check-cast p3, Ljava/lang/String;

    .line 226
    .line 227
    invoke-interface {p0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-static {v0}, Lcom/google/android/gms/internal/measurement/r0;->b(Ljava/lang/Object;)Ll/ewr0;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {p1, p3, v0}, Ll/avr0;->a(Ljava/lang/String;Ll/ewr0;)V

    .line 236
    .line 237
    .line 238
    goto :goto_1

    .line 239
    :cond_7
    return-object p1

    .line 240
    :pswitch_3
    invoke-static {v5, v8, p3}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 241
    .line 242
    .line 243
    invoke-interface {p3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    check-cast p1, Ll/ewr0;

    .line 248
    .line 249
    invoke-virtual {p2, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    iget-object p0, p0, Ll/ygy0;->b:Ll/sdr0;

    .line 258
    .line 259
    invoke-virtual {p0}, Ll/sdr0;->d()Ll/efr0;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-virtual {p0, p1}, Ll/efr0;->b(Ljava/lang/String;)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    invoke-static {p0}, Lcom/google/android/gms/internal/measurement/r0;->b(Ljava/lang/Object;)Ll/ewr0;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    return-object p0

    .line 272
    :pswitch_4
    invoke-static {v6, v9, p3}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 273
    .line 274
    .line 275
    iget-object p0, p0, Ll/ygy0;->b:Ll/sdr0;

    .line 276
    .line 277
    invoke-virtual {p0}, Ll/sdr0;->d()Ll/efr0;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    new-instance p1, Ll/glr0;

    .line 282
    .line 283
    invoke-virtual {p0}, Ll/efr0;->a()J

    .line 284
    .line 285
    .line 286
    move-result-wide p2

    .line 287
    long-to-double p2, p2

    .line 288
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    invoke-direct {p1, p0}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 293
    .line 294
    .line 295
    return-object p1

    .line 296
    :pswitch_5
    invoke-static {v7, v9, p3}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 297
    .line 298
    .line 299
    iget-object p0, p0, Ll/ygy0;->b:Ll/sdr0;

    .line 300
    .line 301
    invoke-virtual {p0}, Ll/sdr0;->d()Ll/efr0;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    new-instance p1, Ll/vyr0;

    .line 306
    .line 307
    invoke-virtual {p0}, Ll/efr0;->e()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    invoke-direct {p1, p0}, Ll/vyr0;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    return-object p1

    .line 315
    :sswitch_data_0
    .sparse-switch
        0x149f58f -> :sswitch_5
        0x2b69a60 -> :sswitch_4
        0x8bc90da -> :sswitch_3
        0x29c21c7c -> :sswitch_2
        0x36e0dee6 -> :sswitch_1
        0x5d9db603 -> :sswitch_0
    .end sparse-switch

    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
