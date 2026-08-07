.class public final Ll/igt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public a:Z


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

.method public static b(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I
    .locals 1

    .line 1
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {p0, v0}, Ll/obt0;->z(Landroid/content/Context;I)I

    .line 17
    .line 18
    .line 19
    move-result p3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    goto :goto_0

    .line 21
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v0, "Could not parse "

    .line 24
    .line 25
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, " in a video GMSG: "

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    :goto_0
    invoke-static {}, Ll/d2v0;->m()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    new-instance p0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v0, "Parse pixels for "

    .line 55
    .line 56
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p2, ", got string "

    .line 63
    .line 64
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string p1, ", int "

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string p1, "."

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    return p3
.end method

.method public static c(Lcom/google/android/gms/internal/ads/zzcfz;Ljava/util/Map;)V
    .locals 5

    .line 1
    const-string v0, "minBufferMs"

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "maxBufferMs"

    .line 10
    .line 11
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/String;

    .line 16
    .line 17
    const-string v2, "bufferForPlaybackMs"

    .line 18
    .line 19
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ljava/lang/String;

    .line 24
    .line 25
    const-string v3, "bufferForPlaybackAfterRebufferMs"

    .line 26
    .line 27
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Ljava/lang/String;

    .line 32
    .line 33
    const-string v4, "socketReceiveBufferSize"

    .line 34
    .line 35
    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-virtual {p0, v4}, Lcom/google/android/gms/internal/ads/zzcfz;->d(I)V

    .line 48
    .line 49
    .line 50
    :cond_0
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-virtual {p0, v4}, Lcom/google/android/gms/internal/ads/zzcfz;->c(I)V

    .line 57
    .line 58
    .line 59
    :cond_1
    if-eqz v2, :cond_2

    .line 60
    .line 61
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/ads/zzcfz;->B(I)V

    .line 66
    .line 67
    .line 68
    :cond_2
    if-eqz v3, :cond_3

    .line 69
    .line 70
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/ads/zzcfz;->C(I)V

    .line 75
    .line 76
    .line 77
    :cond_3
    if-eqz p1, :cond_4

    .line 78
    .line 79
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/zzcfz;->f(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :catch_0
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const-string p1, "Could not parse buffer parameters in loadControl video GMSG: (%s, %s)"

    .line 92
    .line 93
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_4
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p1

    .line 6
    .line 7
    check-cast v2, Ll/bft0;

    .line 8
    .line 9
    const-string v3, "action"

    .line 10
    .line 11
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    check-cast v3, Ljava/lang/String;

    .line 16
    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    const-string v0, "Action missing from video GMSG."

    .line 20
    .line 21
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string v4, "playerId"

    .line 26
    .line 27
    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    const/4 v6, 0x0

    .line 32
    if-eqz v5, :cond_1

    .line 33
    .line 34
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    check-cast v4, Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move-object v4, v6

    .line 50
    :goto_0
    invoke-interface {v2}, Ll/bft0;->zzo()Ll/qet0;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    if-eqz v5, :cond_2

    .line 55
    .line 56
    invoke-interface {v2}, Ll/bft0;->zzo()Ll/qet0;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {v5}, Ll/qet0;->b()Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    goto :goto_1

    .line 65
    :cond_2
    move-object v5, v6

    .line 66
    :goto_1
    const-string v7, "load"

    .line 67
    .line 68
    if-eqz v4, :cond_4

    .line 69
    .line 70
    if-eqz v5, :cond_4

    .line 71
    .line 72
    invoke-virtual {v4, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v8

    .line 76
    if-nez v8, :cond_4

    .line 77
    .line 78
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    if-eqz v8, :cond_3

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 86
    .line 87
    filled-new-array {v4, v5}, [Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v2, "Event intended for player %s, but sent to player %d - event ignored"

    .line 92
    .line 93
    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-static {v0}, Ll/dct0;->f(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_4
    :goto_2
    const/4 v5, 0x3

    .line 102
    invoke-static {v5}, Ll/dct0;->j(I)Z

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-eqz v5, :cond_5

    .line 107
    .line 108
    new-instance v5, Lorg/json/JSONObject;

    .line 109
    .line 110
    invoke-direct {v5, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 111
    .line 112
    .line 113
    const-string v8, "google.afma.Notify_dt"

    .line 114
    .line 115
    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    new-instance v8, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v9, "Video GMSG: "

    .line 125
    .line 126
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v9, " "

    .line 133
    .line 134
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    invoke-static {v5}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :cond_5
    const-string v5, "background"

    .line 148
    .line 149
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    const-string v8, "color"

    .line 154
    .line 155
    if-eqz v5, :cond_7

    .line 156
    .line 157
    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    check-cast v0, Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-eqz v1, :cond_6

    .line 168
    .line 169
    const-string v0, "Color parameter missing from background video GMSG."

    .line 170
    .line 171
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_6
    :try_start_0
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    invoke-interface {v2, v0}, Ll/bft0;->setBackgroundColor(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :catch_0
    const-string v0, "Invalid color parameter in background video GMSG."

    .line 184
    .line 185
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :cond_7
    const-string v5, "playerBackground"

    .line 190
    .line 191
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v5

    .line 195
    if-eqz v5, :cond_9

    .line 196
    .line 197
    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    check-cast v0, Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-eqz v1, :cond_8

    .line 208
    .line 209
    const-string v0, "Color parameter missing from playerBackground video GMSG."

    .line 210
    .line 211
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_8
    :try_start_1
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    invoke-interface {v2, v0}, Ll/bft0;->x(I)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :catch_1
    const-string v0, "Invalid color parameter in playerBackground video GMSG."

    .line 224
    .line 225
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_9
    const-string v5, "decoderProps"

    .line 230
    .line 231
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v8

    .line 235
    const-string v9, "onVideoEvent"

    .line 236
    .line 237
    const-string v10, "event"

    .line 238
    .line 239
    const/4 v11, 0x0

    .line 240
    if-eqz v8, :cond_c

    .line 241
    .line 242
    const-string v0, "mimeTypes"

    .line 243
    .line 244
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    check-cast v1, Ljava/lang/String;

    .line 249
    .line 250
    if-nez v1, :cond_a

    .line 251
    .line 252
    const-string v0, "No MIME types specified for decoder properties inspection."

    .line 253
    .line 254
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    new-instance v0, Ljava/util/HashMap;

    .line 258
    .line 259
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-interface {v0, v10, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    const-string v1, "error"

    .line 266
    .line 267
    const-string v3, "missingMimeTypes"

    .line 268
    .line 269
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    invoke-interface {v2, v9, v0}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 273
    .line 274
    .line 275
    return-void

    .line 276
    :cond_a
    new-instance v3, Ljava/util/HashMap;

    .line 277
    .line 278
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 279
    .line 280
    .line 281
    const-string v4, ","

    .line 282
    .line 283
    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    array-length v4, v1

    .line 288
    :goto_3
    if-ge v11, v4, :cond_b

    .line 289
    .line 290
    aget-object v6, v1, v11

    .line 291
    .line 292
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v7

    .line 296
    invoke-static {v7}, Ll/fnt0;->a(Ljava/lang/String;)Ljava/util/List;

    .line 297
    .line 298
    .line 299
    move-result-object v7

    .line 300
    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    add-int/lit8 v11, v11, 0x1

    .line 304
    .line 305
    goto :goto_3

    .line 306
    :cond_b
    new-instance v1, Ljava/util/HashMap;

    .line 307
    .line 308
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 309
    .line 310
    .line 311
    invoke-interface {v1, v10, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    invoke-interface {v2, v9, v1}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :cond_c
    invoke-interface {v2}, Ll/bft0;->zzo()Ll/qet0;

    .line 322
    .line 323
    .line 324
    move-result-object v5

    .line 325
    if-nez v5, :cond_d

    .line 326
    .line 327
    const-string v0, "Could not get underlay container for a video GMSG."

    .line 328
    .line 329
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    return-void

    .line 333
    :cond_d
    const-string v8, "new"

    .line 334
    .line 335
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result v8

    .line 339
    const-string v12, "position"

    .line 340
    .line 341
    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 342
    .line 343
    .line 344
    move-result v12

    .line 345
    const-string v13, "y"

    .line 346
    .line 347
    const-string v14, "x"

    .line 348
    .line 349
    if-nez v8, :cond_29

    .line 350
    .line 351
    if-eqz v12, :cond_e

    .line 352
    .line 353
    goto/16 :goto_8

    .line 354
    .line 355
    :cond_e
    invoke-interface {v2}, Ll/bft0;->a()Ll/yjt0;

    .line 356
    .line 357
    .line 358
    move-result-object v8

    .line 359
    const-string v12, "currentTime"

    .line 360
    .line 361
    if-eqz v8, :cond_12

    .line 362
    .line 363
    const-string v15, "timeupdate"

    .line 364
    .line 365
    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    move-result v15

    .line 369
    if-eqz v15, :cond_10

    .line 370
    .line 371
    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    check-cast v0, Ljava/lang/String;

    .line 376
    .line 377
    if-nez v0, :cond_f

    .line 378
    .line 379
    const-string v0, "currentTime parameter missing from timeupdate video GMSG."

    .line 380
    .line 381
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    return-void

    .line 385
    :cond_f
    :try_start_2
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    invoke-virtual {v8, v1}, Ll/yjt0;->t8(F)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    .line 390
    .line 391
    .line 392
    return-void

    .line 393
    :catch_2
    const-string v1, "Could not parse currentTime parameter from timeupdate video GMSG: "

    .line 394
    .line 395
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    return-void

    .line 403
    :cond_10
    const-string v15, "skip"

    .line 404
    .line 405
    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 406
    .line 407
    .line 408
    move-result v15

    .line 409
    if-nez v15, :cond_11

    .line 410
    .line 411
    goto :goto_4

    .line 412
    :cond_11
    invoke-virtual {v8}, Ll/yjt0;->zzu()V

    .line 413
    .line 414
    .line 415
    return-void

    .line 416
    :cond_12
    :goto_4
    invoke-virtual {v5}, Ll/qet0;->a()Lcom/google/android/gms/internal/ads/zzcfz;

    .line 417
    .line 418
    .line 419
    move-result-object v5

    .line 420
    if-nez v5, :cond_13

    .line 421
    .line 422
    new-instance v0, Ljava/util/HashMap;

    .line 423
    .line 424
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 425
    .line 426
    .line 427
    const-string v1, "no_video_view"

    .line 428
    .line 429
    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    invoke-interface {v2, v9, v0}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 433
    .line 434
    .line 435
    return-void

    .line 436
    :cond_13
    const-string v8, "click"

    .line 437
    .line 438
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 439
    .line 440
    .line 441
    move-result v8

    .line 442
    if-eqz v8, :cond_14

    .line 443
    .line 444
    invoke-interface {v2}, Ll/bft0;->getContext()Landroid/content/Context;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    invoke-static {v0, v1, v14, v11}, Ll/igt0;->b(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    .line 449
    .line 450
    .line 451
    move-result v2

    .line 452
    invoke-static {v0, v1, v13, v11}, Ll/igt0;->b(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    .line 453
    .line 454
    .line 455
    move-result v0

    .line 456
    int-to-float v11, v2

    .line 457
    int-to-float v12, v0

    .line 458
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 459
    .line 460
    .line 461
    move-result-wide v6

    .line 462
    const/4 v10, 0x0

    .line 463
    const/4 v13, 0x0

    .line 464
    move-wide v8, v6

    .line 465
    invoke-static/range {v6 .. v13}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 466
    .line 467
    .line 468
    move-result-object v0

    .line 469
    invoke-virtual {v5, v0}, Lcom/google/android/gms/internal/ads/zzcfz;->A(Landroid/view/MotionEvent;)V

    .line 470
    .line 471
    .line 472
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 473
    .line 474
    .line 475
    return-void

    .line 476
    :cond_14
    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 477
    .line 478
    .line 479
    move-result v8

    .line 480
    if-eqz v8, :cond_16

    .line 481
    .line 482
    const-string v0, "time"

    .line 483
    .line 484
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    .line 486
    .line 487
    move-result-object v0

    .line 488
    check-cast v0, Ljava/lang/String;

    .line 489
    .line 490
    if-nez v0, :cond_15

    .line 491
    .line 492
    const-string v0, "Time parameter missing from currentTime video GMSG."

    .line 493
    .line 494
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 495
    .line 496
    .line 497
    return-void

    .line 498
    :cond_15
    :try_start_3
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 499
    .line 500
    .line 501
    move-result v1

    .line 502
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 503
    .line 504
    mul-float/2addr v1, v2

    .line 505
    float-to-int v1, v1

    .line 506
    invoke-virtual {v5, v1}, Lcom/google/android/gms/internal/ads/zzcfz;->z(I)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    .line 507
    .line 508
    .line 509
    return-void

    .line 510
    :catch_3
    const-string v1, "Could not parse time parameter from currentTime video GMSG: "

    .line 511
    .line 512
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 517
    .line 518
    .line 519
    return-void

    .line 520
    :cond_16
    const-string v8, "hide"

    .line 521
    .line 522
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 523
    .line 524
    .line 525
    move-result v8

    .line 526
    if-eqz v8, :cond_18

    .line 527
    .line 528
    sget-object v0, Ll/sgs0;->G:Ll/dgs0;

    .line 529
    .line 530
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 531
    .line 532
    .line 533
    move-result-object v1

    .line 534
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    check-cast v0, Ljava/lang/Boolean;

    .line 539
    .line 540
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 541
    .line 542
    .line 543
    move-result v0

    .line 544
    if-eqz v0, :cond_17

    .line 545
    .line 546
    const/16 v0, 0x8

    .line 547
    .line 548
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    .line 549
    .line 550
    .line 551
    return-void

    .line 552
    :cond_17
    const/4 v0, 0x4

    .line 553
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    .line 554
    .line 555
    .line 556
    return-void

    .line 557
    :cond_18
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 558
    .line 559
    .line 560
    move-result v7

    .line 561
    if-eqz v7, :cond_19

    .line 562
    .line 563
    invoke-virtual {v5, v4}, Lcom/google/android/gms/internal/ads/zzcfz;->u(Ljava/lang/Integer;)V

    .line 564
    .line 565
    .line 566
    return-void

    .line 567
    :cond_19
    const-string v4, "loadControl"

    .line 568
    .line 569
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 570
    .line 571
    .line 572
    move-result v4

    .line 573
    if-eqz v4, :cond_1a

    .line 574
    .line 575
    invoke-static {v5, v1}, Ll/igt0;->c(Lcom/google/android/gms/internal/ads/zzcfz;Ljava/util/Map;)V

    .line 576
    .line 577
    .line 578
    return-void

    .line 579
    :cond_1a
    const-string v4, "muted"

    .line 580
    .line 581
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 582
    .line 583
    .line 584
    move-result v7

    .line 585
    if-eqz v7, :cond_1c

    .line 586
    .line 587
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 588
    .line 589
    .line 590
    move-result-object v0

    .line 591
    check-cast v0, Ljava/lang/String;

    .line 592
    .line 593
    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 594
    .line 595
    .line 596
    move-result v0

    .line 597
    if-eqz v0, :cond_1b

    .line 598
    .line 599
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/zzcfz;->v()V

    .line 600
    .line 601
    .line 602
    return-void

    .line 603
    :cond_1b
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/zzcfz;->k()V

    .line 604
    .line 605
    .line 606
    return-void

    .line 607
    :cond_1c
    const-string v4, "pause"

    .line 608
    .line 609
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 610
    .line 611
    .line 612
    move-result v4

    .line 613
    if-eqz v4, :cond_1d

    .line 614
    .line 615
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/zzcfz;->x()V

    .line 616
    .line 617
    .line 618
    return-void

    .line 619
    :cond_1d
    const-string v4, "play"

    .line 620
    .line 621
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 622
    .line 623
    .line 624
    move-result v4

    .line 625
    if-eqz v4, :cond_1e

    .line 626
    .line 627
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/zzcfz;->y()V

    .line 628
    .line 629
    .line 630
    return-void

    .line 631
    :cond_1e
    const-string v4, "show"

    .line 632
    .line 633
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 634
    .line 635
    .line 636
    move-result v4

    .line 637
    if-eqz v4, :cond_1f

    .line 638
    .line 639
    invoke-virtual {v5, v11}, Landroid/view/View;->setVisibility(I)V

    .line 640
    .line 641
    .line 642
    return-void

    .line 643
    :cond_1f
    const-string v4, "src"

    .line 644
    .line 645
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 646
    .line 647
    .line 648
    move-result v7

    .line 649
    const/4 v8, 0x1

    .line 650
    if-eqz v7, :cond_24

    .line 651
    .line 652
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 653
    .line 654
    .line 655
    move-result-object v0

    .line 656
    check-cast v0, Ljava/lang/String;

    .line 657
    .line 658
    const-string v3, "periodicReportIntervalMs"

    .line 659
    .line 660
    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 661
    .line 662
    .line 663
    move-result v4

    .line 664
    if-nez v4, :cond_20

    .line 665
    .line 666
    goto :goto_5

    .line 667
    :cond_20
    :try_start_4
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 668
    .line 669
    .line 670
    move-result-object v4

    .line 671
    check-cast v4, Ljava/lang/String;

    .line 672
    .line 673
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 674
    .line 675
    .line 676
    move-result v4

    .line 677
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 678
    .line 679
    .line 680
    move-result-object v6
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_4

    .line 681
    goto :goto_5

    .line 682
    :catch_4
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 683
    .line 684
    .line 685
    move-result-object v3

    .line 686
    check-cast v3, Ljava/lang/String;

    .line 687
    .line 688
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 689
    .line 690
    .line 691
    move-result-object v3

    .line 692
    const-string v4, "Video gmsg invalid numeric parameter \'periodicReportIntervalMs\': "

    .line 693
    .line 694
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 695
    .line 696
    .line 697
    move-result-object v3

    .line 698
    invoke-static {v3}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 699
    .line 700
    .line 701
    :goto_5
    new-array v3, v8, [Ljava/lang/String;

    .line 702
    .line 703
    aput-object v0, v3, v11

    .line 704
    .line 705
    const-string v4, "demuxed"

    .line 706
    .line 707
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 708
    .line 709
    .line 710
    move-result-object v1

    .line 711
    check-cast v1, Ljava/lang/String;

    .line 712
    .line 713
    if-eqz v1, :cond_22

    .line 714
    .line 715
    :try_start_5
    new-instance v3, Lorg/json/JSONArray;

    .line 716
    .line 717
    invoke-direct {v3, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 718
    .line 719
    .line 720
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 721
    .line 722
    .line 723
    move-result v4

    .line 724
    new-array v4, v4, [Ljava/lang/String;

    .line 725
    .line 726
    move v7, v11

    .line 727
    :goto_6
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 728
    .line 729
    .line 730
    move-result v9

    .line 731
    if-ge v7, v9, :cond_21

    .line 732
    .line 733
    invoke-virtual {v3, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 734
    .line 735
    .line 736
    move-result-object v9

    .line 737
    aput-object v9, v4, v7
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5

    .line 738
    .line 739
    add-int/lit8 v7, v7, 0x1

    .line 740
    .line 741
    goto :goto_6

    .line 742
    :cond_21
    move-object v3, v4

    .line 743
    goto :goto_7

    .line 744
    :catch_5
    const-string v3, "Malformed demuxed URL list for playback: "

    .line 745
    .line 746
    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 747
    .line 748
    .line 749
    move-result-object v1

    .line 750
    invoke-static {v1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 751
    .line 752
    .line 753
    new-array v3, v8, [Ljava/lang/String;

    .line 754
    .line 755
    aput-object v0, v3, v11

    .line 756
    .line 757
    :cond_22
    :goto_7
    if-eqz v6, :cond_23

    .line 758
    .line 759
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 760
    .line 761
    .line 762
    move-result v1

    .line 763
    invoke-interface {v2, v1}, Ll/bft0;->D(I)V

    .line 764
    .line 765
    .line 766
    :cond_23
    invoke-virtual {v5, v0, v3}, Lcom/google/android/gms/internal/ads/zzcfz;->g(Ljava/lang/String;[Ljava/lang/String;)V

    .line 767
    .line 768
    .line 769
    return-void

    .line 770
    :cond_24
    const-string v4, "touchMove"

    .line 771
    .line 772
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 773
    .line 774
    .line 775
    move-result v4

    .line 776
    if-eqz v4, :cond_25

    .line 777
    .line 778
    invoke-interface {v2}, Ll/bft0;->getContext()Landroid/content/Context;

    .line 779
    .line 780
    .line 781
    move-result-object v3

    .line 782
    const-string v4, "dx"

    .line 783
    .line 784
    invoke-static {v3, v1, v4, v11}, Ll/igt0;->b(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    .line 785
    .line 786
    .line 787
    move-result v4

    .line 788
    const-string v6, "dy"

    .line 789
    .line 790
    invoke-static {v3, v1, v6, v11}, Ll/igt0;->b(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    .line 791
    .line 792
    .line 793
    move-result v1

    .line 794
    int-to-float v3, v4

    .line 795
    int-to-float v1, v1

    .line 796
    invoke-virtual {v5, v3, v1}, Lcom/google/android/gms/internal/ads/zzcfz;->j(FF)V

    .line 797
    .line 798
    .line 799
    iget-boolean v1, v0, Ll/igt0;->a:Z

    .line 800
    .line 801
    if-nez v1, :cond_30

    .line 802
    .line 803
    invoke-interface {v2}, Ll/bft0;->zzu()V

    .line 804
    .line 805
    .line 806
    iput-boolean v8, v0, Ll/igt0;->a:Z

    .line 807
    .line 808
    return-void

    .line 809
    :cond_25
    const-string v0, "volume"

    .line 810
    .line 811
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 812
    .line 813
    .line 814
    move-result v2

    .line 815
    if-eqz v2, :cond_27

    .line 816
    .line 817
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 818
    .line 819
    .line 820
    move-result-object v0

    .line 821
    check-cast v0, Ljava/lang/String;

    .line 822
    .line 823
    if-nez v0, :cond_26

    .line 824
    .line 825
    const-string v0, "Level parameter missing from volume video GMSG."

    .line 826
    .line 827
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 828
    .line 829
    .line 830
    return-void

    .line 831
    :cond_26
    :try_start_6
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 832
    .line 833
    .line 834
    move-result v1

    .line 835
    invoke-virtual {v5, v1}, Lcom/google/android/gms/internal/ads/zzcfz;->i(F)V
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_6

    .line 836
    .line 837
    .line 838
    return-void

    .line 839
    :catch_6
    const-string v1, "Could not parse volume parameter from volume video GMSG: "

    .line 840
    .line 841
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 842
    .line 843
    .line 844
    move-result-object v0

    .line 845
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 846
    .line 847
    .line 848
    return-void

    .line 849
    :cond_27
    const-string v0, "watermark"

    .line 850
    .line 851
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 852
    .line 853
    .line 854
    move-result v0

    .line 855
    if-eqz v0, :cond_28

    .line 856
    .line 857
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/zzcfz;->q()V

    .line 858
    .line 859
    .line 860
    return-void

    .line 861
    :cond_28
    const-string v0, "Unknown video action: "

    .line 862
    .line 863
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 864
    .line 865
    .line 866
    move-result-object v0

    .line 867
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 868
    .line 869
    .line 870
    return-void

    .line 871
    :cond_29
    :goto_8
    invoke-interface {v2}, Ll/bft0;->getContext()Landroid/content/Context;

    .line 872
    .line 873
    .line 874
    move-result-object v0

    .line 875
    invoke-static {v0, v1, v14, v11}, Ll/igt0;->b(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    .line 876
    .line 877
    .line 878
    move-result v12

    .line 879
    invoke-static {v0, v1, v13, v11}, Ll/igt0;->b(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    .line 880
    .line 881
    .line 882
    move-result v13

    .line 883
    const-string v3, "w"

    .line 884
    .line 885
    const/4 v4, -0x1

    .line 886
    invoke-static {v0, v1, v3, v4}, Ll/igt0;->b(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    .line 887
    .line 888
    .line 889
    move-result v3

    .line 890
    sget-object v6, Ll/sgs0;->K3:Ll/dgs0;

    .line 891
    .line 892
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 893
    .line 894
    .line 895
    move-result-object v7

    .line 896
    invoke-virtual {v7, v6}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 897
    .line 898
    .line 899
    move-result-object v7

    .line 900
    check-cast v7, Ljava/lang/Boolean;

    .line 901
    .line 902
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    .line 903
    .line 904
    .line 905
    move-result v7

    .line 906
    const-string v9, "."

    .line 907
    .line 908
    if-eqz v7, :cond_2b

    .line 909
    .line 910
    if-ne v3, v4, :cond_2a

    .line 911
    .line 912
    invoke-interface {v2}, Ll/bft0;->zzh()I

    .line 913
    .line 914
    .line 915
    move-result v3

    .line 916
    :goto_9
    move v14, v3

    .line 917
    goto :goto_a

    .line 918
    :cond_2a
    invoke-interface {v2}, Ll/bft0;->zzh()I

    .line 919
    .line 920
    .line 921
    move-result v7

    .line 922
    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    .line 923
    .line 924
    .line 925
    move-result v3

    .line 926
    goto :goto_9

    .line 927
    :cond_2b
    invoke-static {}, Ll/d2v0;->m()Z

    .line 928
    .line 929
    .line 930
    move-result v7

    .line 931
    if-eqz v7, :cond_2c

    .line 932
    .line 933
    invoke-interface {v2}, Ll/bft0;->zzh()I

    .line 934
    .line 935
    .line 936
    move-result v7

    .line 937
    new-instance v10, Ljava/lang/StringBuilder;

    .line 938
    .line 939
    const-string v14, "Calculate width with original width "

    .line 940
    .line 941
    invoke-direct {v10, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 942
    .line 943
    .line 944
    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 945
    .line 946
    .line 947
    const-string v14, ", videoHost.getVideoBoundingWidth() "

    .line 948
    .line 949
    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 950
    .line 951
    .line 952
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 953
    .line 954
    .line 955
    const-string v7, ", x "

    .line 956
    .line 957
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 958
    .line 959
    .line 960
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 961
    .line 962
    .line 963
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 964
    .line 965
    .line 966
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 967
    .line 968
    .line 969
    move-result-object v7

    .line 970
    invoke-static {v7}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 971
    .line 972
    .line 973
    :cond_2c
    invoke-interface {v2}, Ll/bft0;->zzh()I

    .line 974
    .line 975
    .line 976
    move-result v7

    .line 977
    sub-int/2addr v7, v12

    .line 978
    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    .line 979
    .line 980
    .line 981
    move-result v3

    .line 982
    goto :goto_9

    .line 983
    :goto_a
    const-string v3, "h"

    .line 984
    .line 985
    invoke-static {v0, v1, v3, v4}, Ll/igt0;->b(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    .line 986
    .line 987
    .line 988
    move-result v0

    .line 989
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 990
    .line 991
    .line 992
    move-result-object v3

    .line 993
    invoke-virtual {v3, v6}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 994
    .line 995
    .line 996
    move-result-object v3

    .line 997
    check-cast v3, Ljava/lang/Boolean;

    .line 998
    .line 999
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1000
    .line 1001
    .line 1002
    move-result v3

    .line 1003
    if-eqz v3, :cond_2e

    .line 1004
    .line 1005
    if-ne v0, v4, :cond_2d

    .line 1006
    .line 1007
    invoke-interface {v2}, Ll/bft0;->zzg()I

    .line 1008
    .line 1009
    .line 1010
    move-result v0

    .line 1011
    :goto_b
    move v15, v0

    .line 1012
    goto :goto_c

    .line 1013
    :cond_2d
    invoke-interface {v2}, Ll/bft0;->zzg()I

    .line 1014
    .line 1015
    .line 1016
    move-result v2

    .line 1017
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 1018
    .line 1019
    .line 1020
    move-result v0

    .line 1021
    goto :goto_b

    .line 1022
    :cond_2e
    invoke-static {}, Ll/d2v0;->m()Z

    .line 1023
    .line 1024
    .line 1025
    move-result v3

    .line 1026
    if-eqz v3, :cond_2f

    .line 1027
    .line 1028
    invoke-interface {v2}, Ll/bft0;->zzg()I

    .line 1029
    .line 1030
    .line 1031
    move-result v3

    .line 1032
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1033
    .line 1034
    const-string v6, "Calculate height with original height "

    .line 1035
    .line 1036
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1037
    .line 1038
    .line 1039
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1040
    .line 1041
    .line 1042
    const-string v6, ", videoHost.getVideoBoundingHeight() "

    .line 1043
    .line 1044
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1045
    .line 1046
    .line 1047
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1048
    .line 1049
    .line 1050
    const-string v3, ", y "

    .line 1051
    .line 1052
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1053
    .line 1054
    .line 1055
    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1056
    .line 1057
    .line 1058
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1059
    .line 1060
    .line 1061
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1062
    .line 1063
    .line 1064
    move-result-object v3

    .line 1065
    invoke-static {v3}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 1066
    .line 1067
    .line 1068
    :cond_2f
    invoke-interface {v2}, Ll/bft0;->zzg()I

    .line 1069
    .line 1070
    .line 1071
    move-result v2

    .line 1072
    sub-int/2addr v2, v13

    .line 1073
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 1074
    .line 1075
    .line 1076
    move-result v0

    .line 1077
    goto :goto_b

    .line 1078
    :goto_c
    :try_start_7
    const-string v0, "player"

    .line 1079
    .line 1080
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1081
    .line 1082
    .line 1083
    move-result-object v0

    .line 1084
    check-cast v0, Ljava/lang/String;

    .line 1085
    .line 1086
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1087
    .line 1088
    .line 1089
    move-result v11
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_7

    .line 1090
    :catch_7
    move/from16 v16, v11

    .line 1091
    .line 1092
    const-string v0, "spherical"

    .line 1093
    .line 1094
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1095
    .line 1096
    .line 1097
    move-result-object v0

    .line 1098
    check-cast v0, Ljava/lang/String;

    .line 1099
    .line 1100
    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 1101
    .line 1102
    .line 1103
    move-result v17

    .line 1104
    if-eqz v8, :cond_31

    .line 1105
    .line 1106
    invoke-virtual {v5}, Ll/qet0;->a()Lcom/google/android/gms/internal/ads/zzcfz;

    .line 1107
    .line 1108
    .line 1109
    move-result-object v0

    .line 1110
    if-nez v0, :cond_31

    .line 1111
    .line 1112
    new-instance v0, Ll/aft0;

    .line 1113
    .line 1114
    const-string v2, "flags"

    .line 1115
    .line 1116
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1117
    .line 1118
    .line 1119
    move-result-object v2

    .line 1120
    check-cast v2, Ljava/lang/String;

    .line 1121
    .line 1122
    invoke-direct {v0, v2}, Ll/aft0;-><init>(Ljava/lang/String;)V

    .line 1123
    .line 1124
    .line 1125
    move-object/from16 v18, v0

    .line 1126
    .line 1127
    move-object v11, v5

    .line 1128
    invoke-virtual/range {v11 .. v18}, Ll/qet0;->d(IIIIIZLl/aft0;)V

    .line 1129
    .line 1130
    .line 1131
    invoke-virtual {v11}, Ll/qet0;->a()Lcom/google/android/gms/internal/ads/zzcfz;

    .line 1132
    .line 1133
    .line 1134
    move-result-object v0

    .line 1135
    if-eqz v0, :cond_30

    .line 1136
    .line 1137
    invoke-static {v0, v1}, Ll/igt0;->c(Lcom/google/android/gms/internal/ads/zzcfz;Ljava/util/Map;)V

    .line 1138
    .line 1139
    .line 1140
    :cond_30
    return-void

    .line 1141
    :cond_31
    move-object v11, v5

    .line 1142
    invoke-virtual {v11, v12, v13, v14, v15}, Ll/qet0;->c(IIII)V

    .line 1143
    .line 1144
    .line 1145
    return-void
.end method
