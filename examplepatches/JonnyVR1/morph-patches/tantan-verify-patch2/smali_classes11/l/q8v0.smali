.class public final Ll/q8v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kbw0;


# static fields
.field public static final d:Ljava/util/regex/Pattern;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/rdw0;

.field public final c:Ll/cew0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "([^;]+=[^;]+)(;\\s|$)"

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Ll/q8v0;->d:Ljava/util/regex/Pattern;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ll/cew0;Ll/rdw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q8v0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/q8v0;->c:Ll/cew0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/q8v0;->b:Ll/rdw0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/p8v0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/p8v0;->b(Ll/p8v0;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "http_timeout_millis"

    .line 8
    .line 9
    const v2, 0xea60

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    invoke-static {p1}, Ll/p8v0;->a(Ll/p8v0;)Ll/s4t0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/s4t0;->a()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, -0x2

    .line 25
    const-string v3, ""

    .line 26
    .line 27
    const/4 v4, 0x1

    .line 28
    if-ne v1, v2, :cond_9

    .line 29
    .line 30
    new-instance v6, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ll/p8v0;->a(Ll/p8v0;)Ll/s4t0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/s4t0;->h()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_6

    .line 44
    .line 45
    iget-object v0, p0, Ll/q8v0;->a:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_6

    .line 52
    .line 53
    sget-object v0, Ll/sgs0;->O0:Ll/dgs0;

    .line 54
    .line 55
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget-object v1, p0, Ll/q8v0;->a:Ljava/lang/String;

    .line 70
    .line 71
    const-string v2, "Cookie"

    .line 72
    .line 73
    if-eqz v0, :cond_5

    .line 74
    .line 75
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_0

    .line 80
    .line 81
    move-object v1, v3

    .line 82
    goto :goto_1

    .line 83
    :cond_0
    sget-object v0, Ll/q8v0;->d:Ljava/util/regex/Pattern;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    move-object v1, v3

    .line 90
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    if-eqz v7, :cond_4

    .line 95
    .line 96
    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    if-eqz v7, :cond_1

    .line 101
    .line 102
    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 103
    .line 104
    invoke-virtual {v7, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v9

    .line 108
    const-string v10, "id="

    .line 109
    .line 110
    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result v9

    .line 114
    if-nez v9, :cond_2

    .line 115
    .line 116
    invoke-virtual {v7, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    const-string v9, "ide="

    .line 121
    .line 122
    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 123
    .line 124
    .line 125
    move-result v8

    .line 126
    if-eqz v8, :cond_1

    .line 127
    .line 128
    :cond_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v8

    .line 132
    if-nez v8, :cond_3

    .line 133
    .line 134
    const-string v8, "; "

    .line 135
    .line 136
    invoke-virtual {v1, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    :cond_3
    invoke-virtual {v1, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    goto :goto_0

    .line 145
    :cond_4
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_6

    .line 150
    .line 151
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_5
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    :cond_6
    :goto_2
    invoke-static {p1}, Ll/p8v0;->a(Ll/p8v0;)Ll/s4t0;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ll/s4t0;->i()Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_7

    .line 167
    .line 168
    invoke-static {p1}, Ll/p8v0;->b(Ll/p8v0;)Lorg/json/JSONObject;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-static {v6, v0}, Ll/r8v0;->a(Ljava/util/Map;Lorg/json/JSONObject;)V

    .line 173
    .line 174
    .line 175
    :cond_7
    invoke-static {p1}, Ll/p8v0;->a(Ll/p8v0;)Ll/s4t0;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    if-eqz v0, :cond_8

    .line 180
    .line 181
    invoke-static {p1}, Ll/p8v0;->a(Ll/p8v0;)Ll/s4t0;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {v0}, Ll/s4t0;->d()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-nez v0, :cond_8

    .line 194
    .line 195
    invoke-static {p1}, Ll/p8v0;->a(Ll/p8v0;)Ll/s4t0;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v0}, Ll/s4t0;->d()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    :cond_8
    iget-object v0, p0, Ll/q8v0;->c:Ll/cew0;

    .line 204
    .line 205
    iget-object p0, p0, Ll/q8v0;->b:Ll/rdw0;

    .line 206
    .line 207
    invoke-interface {p0, v4}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 211
    .line 212
    .line 213
    move-object p0, v3

    .line 214
    new-instance v3, Ll/g8v0;

    .line 215
    .line 216
    invoke-static {p1}, Ll/p8v0;->a(Ll/p8v0;)Ll/s4t0;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {v0}, Ll/s4t0;->e()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v4

    .line 224
    sget-object v0, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 225
    .line 226
    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 227
    .line 228
    .line 229
    move-result-object v7

    .line 230
    invoke-static {p1}, Ll/p8v0;->a(Ll/p8v0;)Ll/s4t0;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-virtual {p0}, Ll/s4t0;->i()Z

    .line 235
    .line 236
    .line 237
    move-result v9

    .line 238
    const-string v8, ""

    .line 239
    .line 240
    invoke-direct/range {v3 .. v9}, Ll/g8v0;-><init>(Ljava/lang/String;ILjava/util/Map;[BLjava/lang/String;Z)V

    .line 241
    .line 242
    .line 243
    return-object v3

    .line 244
    :cond_9
    invoke-virtual {v0}, Ll/s4t0;->a()I

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-ne p1, v4, :cond_b

    .line 249
    .line 250
    invoke-virtual {v0}, Ll/s4t0;->f()Ljava/util/List;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    if-eqz p1, :cond_a

    .line 255
    .line 256
    invoke-virtual {v0}, Ll/s4t0;->f()Ljava/util/List;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    const-string v0, ", "

    .line 261
    .line 262
    invoke-static {v0, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    invoke-static {v3}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    :cond_a
    const-string p1, "Error building request URL: "

    .line 270
    .line 271
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    new-instance v0, Lcom/google/android/gms/internal/ads/zzead;

    .line 280
    .line 281
    const/4 v1, 0x2

    .line 282
    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/ads/zzead;-><init>(ILjava/lang/String;)V

    .line 283
    .line 284
    .line 285
    goto :goto_3

    .line 286
    :cond_b
    new-instance v0, Lcom/google/android/gms/internal/ads/zzead;

    .line 287
    .line 288
    invoke-direct {v0, v4}, Lcom/google/android/gms/internal/ads/zzead;-><init>(I)V

    .line 289
    .line 290
    .line 291
    :goto_3
    iget-object p1, p0, Ll/q8v0;->c:Ll/cew0;

    .line 292
    .line 293
    iget-object p0, p0, Ll/q8v0;->b:Ll/rdw0;

    .line 294
    .line 295
    invoke-interface {p0, v0}, Ll/rdw0;->b(Ljava/lang/Throwable;)Ll/rdw0;

    .line 296
    .line 297
    .line 298
    const/4 v1, 0x0

    .line 299
    invoke-interface {p0, v1}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 300
    .line 301
    .line 302
    invoke-virtual {p1, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 303
    .line 304
    .line 305
    throw v0
.end method
