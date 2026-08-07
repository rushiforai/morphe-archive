.class public final Ll/dku0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cmu0;


# instance fields
.field public A:J

.field public B:Ll/ytt0;

.field public final a:Landroid/content/Context;

.field public final b:Ll/fmu0;

.field public final c:Lorg/json/JSONObject;

.field public final d:Ll/qru0;

.field public final e:Ll/ulu0;

.field public final f:Ll/v2s0;

.field public final g:Ll/h7u0;

.field public final h:Ll/g6u0;

.field public final i:Ll/egu0;

.field public final j:Ll/q6w0;

.field public final k:Lcom/google/android/gms/internal/ads/zzcei;

.field public final l:Ll/o7w0;

.field public final m:Ll/hvt0;

.field public final n:Ll/enu0;

.field public final o:Lcom/google/android/gms/common/util/Clock;

.field public final p:Ll/agu0;

.field public final q:Ll/yew0;

.field public final r:Ll/cew0;

.field public final s:Ll/qbv0;

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:Landroid/graphics/Point;

.field public y:Landroid/graphics/Point;

.field public z:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/fmu0;Lorg/json/JSONObject;Ll/qru0;Ll/ulu0;Ll/v2s0;Ll/h7u0;Ll/g6u0;Ll/egu0;Ll/q6w0;Lcom/google/android/gms/internal/ads/zzcei;Ll/o7w0;Ll/hvt0;Ll/enu0;Lcom/google/android/gms/common/util/Clock;Ll/agu0;Ll/yew0;Ll/cew0;Ll/qbv0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/dku0;->t:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/dku0;->v:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/dku0;->w:Z

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Point;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/dku0;->x:Landroid/graphics/Point;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Point;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/dku0;->y:Landroid/graphics/Point;

    .line 24
    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .line 27
    iput-wide v0, p0, Ll/dku0;->z:J

    .line 28
    .line 29
    iput-wide v0, p0, Ll/dku0;->A:J

    .line 30
    .line 31
    iput-object p1, p0, Ll/dku0;->a:Landroid/content/Context;

    .line 32
    .line 33
    iput-object p2, p0, Ll/dku0;->b:Ll/fmu0;

    .line 34
    .line 35
    iput-object p3, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 36
    .line 37
    iput-object p4, p0, Ll/dku0;->d:Ll/qru0;

    .line 38
    .line 39
    iput-object p5, p0, Ll/dku0;->e:Ll/ulu0;

    .line 40
    .line 41
    iput-object p6, p0, Ll/dku0;->f:Ll/v2s0;

    .line 42
    .line 43
    iput-object p7, p0, Ll/dku0;->g:Ll/h7u0;

    .line 44
    .line 45
    iput-object p8, p0, Ll/dku0;->h:Ll/g6u0;

    .line 46
    .line 47
    iput-object p9, p0, Ll/dku0;->i:Ll/egu0;

    .line 48
    .line 49
    iput-object p10, p0, Ll/dku0;->j:Ll/q6w0;

    .line 50
    .line 51
    iput-object p11, p0, Ll/dku0;->k:Lcom/google/android/gms/internal/ads/zzcei;

    .line 52
    .line 53
    iput-object p12, p0, Ll/dku0;->l:Ll/o7w0;

    .line 54
    .line 55
    iput-object p13, p0, Ll/dku0;->m:Ll/hvt0;

    .line 56
    .line 57
    move-object/from16 p1, p14

    .line 58
    .line 59
    iput-object p1, p0, Ll/dku0;->n:Ll/enu0;

    .line 60
    .line 61
    move-object/from16 p1, p15

    .line 62
    .line 63
    iput-object p1, p0, Ll/dku0;->o:Lcom/google/android/gms/common/util/Clock;

    .line 64
    .line 65
    move-object/from16 p1, p16

    .line 66
    .line 67
    iput-object p1, p0, Ll/dku0;->p:Ll/agu0;

    .line 68
    .line 69
    move-object/from16 p1, p17

    .line 70
    .line 71
    iput-object p1, p0, Ll/dku0;->q:Ll/yew0;

    .line 72
    .line 73
    move-object/from16 p1, p18

    .line 74
    .line 75
    iput-object p1, p0, Ll/dku0;->r:Ll/cew0;

    .line 76
    .line 77
    move-object/from16 p1, p19

    .line 78
    .line 79
    iput-object p1, p0, Ll/dku0;->s:Ll/qbv0;

    .line 80
    .line 81
    return-void
.end method

.method public static bridge synthetic x(Ll/dku0;)Ll/g6u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dku0;->h:Ll/g6u0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic y(Ll/dku0;)Ll/h7u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dku0;->g:Ll/h7u0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic z(Ll/dku0;)Ll/egu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dku0;->i:Ll/egu0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final A(Landroid/view/View;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;ZZ)V
    .locals 5
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    const-string v0, "tracking_urls_and_actions"

    .line 2
    .line 3
    const-string v1, "has_custom_click_handler"

    .line 4
    .line 5
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v3, "ad"

    .line 11
    .line 12
    iget-object v4, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 13
    .line 14
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    const-string v3, "asset_view_signal"

    .line 18
    .line 19
    invoke-virtual {v2, v3, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    const-string p3, "ad_view_signal"

    .line 23
    .line 24
    invoke-virtual {v2, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string p2, "click_signal"

    .line 28
    .line 29
    invoke-virtual {v2, p2, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 30
    .line 31
    .line 32
    const-string p2, "scroll_view_signal"

    .line 33
    .line 34
    invoke-virtual {v2, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    const-string p2, "lock_screen_signal"

    .line 38
    .line 39
    invoke-virtual {v2, p2, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Ll/dku0;->b:Ll/fmu0;

    .line 43
    .line 44
    iget-object p3, p0, Ll/dku0;->e:Ll/ulu0;

    .line 45
    .line 46
    invoke-virtual {p3}, Ll/ulu0;->a()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-virtual {p2, p3}, Ll/fmu0;->c(Ljava/lang/String;)Ll/lms0;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    const/4 p3, 0x0

    .line 55
    const/4 p4, 0x1

    .line 56
    if-eqz p2, :cond_0

    .line 57
    .line 58
    move p2, p4

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    move p2, p3

    .line 61
    :goto_0
    invoke-virtual {v2, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    const-string p2, "provided_signals"

    .line 65
    .line 66
    invoke-virtual {v2, p2, p8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    .line 68
    .line 69
    new-instance p2, Lorg/json/JSONObject;

    .line 70
    .line 71
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string p5, "asset_id"

    .line 75
    .line 76
    invoke-virtual {p2, p5, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    const-string p5, "template"

    .line 80
    .line 81
    iget-object p6, p0, Ll/dku0;->e:Ll/ulu0;

    .line 82
    .line 83
    invoke-virtual {p6}, Ll/ulu0;->P()I

    .line 84
    .line 85
    .line 86
    move-result p6

    .line 87
    invoke-virtual {p2, p5, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    const-string p5, "view_aware_api_used"

    .line 91
    .line 92
    invoke-virtual {p2, p5, p9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 93
    .line 94
    .line 95
    const-string p5, "custom_mute_requested"

    .line 96
    .line 97
    iget-object p6, p0, Ll/dku0;->l:Ll/o7w0;

    .line 98
    .line 99
    iget-object p6, p6, Ll/o7w0;->i:Lcom/google/android/gms/internal/ads/zzbjb;

    .line 100
    .line 101
    if-eqz p6, :cond_1

    .line 102
    .line 103
    iget-boolean p6, p6, Lcom/google/android/gms/internal/ads/zzbjb;->zzg:Z

    .line 104
    .line 105
    if-eqz p6, :cond_1

    .line 106
    .line 107
    move p6, p4

    .line 108
    goto :goto_1

    .line 109
    :cond_1
    move p6, p3

    .line 110
    :goto_1
    invoke-virtual {p2, p5, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 111
    .line 112
    .line 113
    const-string p5, "custom_mute_enabled"

    .line 114
    .line 115
    iget-object p6, p0, Ll/dku0;->e:Ll/ulu0;

    .line 116
    .line 117
    invoke-virtual {p6}, Ll/ulu0;->h()Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object p6

    .line 121
    invoke-interface {p6}, Ljava/util/List;->isEmpty()Z

    .line 122
    .line 123
    .line 124
    move-result p6

    .line 125
    if-nez p6, :cond_2

    .line 126
    .line 127
    iget-object p6, p0, Ll/dku0;->e:Ll/ulu0;

    .line 128
    .line 129
    invoke-virtual {p6}, Ll/ulu0;->X()Ll/rfv0;

    .line 130
    .line 131
    .line 132
    move-result-object p6

    .line 133
    if-eqz p6, :cond_2

    .line 134
    .line 135
    move p6, p4

    .line 136
    goto :goto_2

    .line 137
    :cond_2
    move p6, p3

    .line 138
    :goto_2
    invoke-virtual {p2, p5, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 139
    .line 140
    .line 141
    iget-object p5, p0, Ll/dku0;->n:Ll/enu0;

    .line 142
    .line 143
    invoke-virtual {p5}, Ll/enu0;->a()Ll/kns0;

    .line 144
    .line 145
    .line 146
    move-result-object p5

    .line 147
    if-eqz p5, :cond_3

    .line 148
    .line 149
    iget-object p5, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 150
    .line 151
    const-string p6, "custom_one_point_five_click_enabled"

    .line 152
    .line 153
    invoke-virtual {p5, p6, p3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 154
    .line 155
    .line 156
    move-result p5

    .line 157
    if-eqz p5, :cond_3

    .line 158
    .line 159
    const-string p5, "custom_one_point_five_click_eligible"

    .line 160
    .line 161
    invoke-virtual {p2, p5, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 162
    .line 163
    .line 164
    :cond_3
    const-string p5, "timestamp"

    .line 165
    .line 166
    iget-object p6, p0, Ll/dku0;->o:Lcom/google/android/gms/common/util/Clock;

    .line 167
    .line 168
    invoke-interface {p6}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 169
    .line 170
    .line 171
    move-result-wide p6

    .line 172
    invoke-virtual {p2, p5, p6, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 173
    .line 174
    .line 175
    iget-boolean p5, p0, Ll/dku0;->w:Z

    .line 176
    .line 177
    if-eqz p5, :cond_4

    .line 178
    .line 179
    invoke-virtual {p0}, Ll/dku0;->v()Z

    .line 180
    .line 181
    .line 182
    move-result p5

    .line 183
    if-eqz p5, :cond_4

    .line 184
    .line 185
    const-string p5, "custom_click_gesture_eligible"

    .line 186
    .line 187
    invoke-virtual {p2, p5, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 188
    .line 189
    .line 190
    :cond_4
    if-eqz p10, :cond_5

    .line 191
    .line 192
    const-string p5, "is_custom_click_gesture"

    .line 193
    .line 194
    invoke-virtual {p2, p5, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 195
    .line 196
    .line 197
    :cond_5
    iget-object p5, p0, Ll/dku0;->b:Ll/fmu0;

    .line 198
    .line 199
    iget-object p6, p0, Ll/dku0;->e:Ll/ulu0;

    .line 200
    .line 201
    invoke-virtual {p6}, Ll/ulu0;->a()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p6

    .line 205
    invoke-virtual {p5, p6}, Ll/fmu0;->c(Ljava/lang/String;)Ll/lms0;

    .line 206
    .line 207
    .line 208
    move-result-object p5

    .line 209
    if-eqz p5, :cond_6

    .line 210
    .line 211
    move p3, p4

    .line 212
    :cond_6
    invoke-virtual {p2, v1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 213
    .line 214
    .line 215
    const-string p3, "click_signals"
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 216
    .line 217
    const/4 p5, 0x0

    .line 218
    :try_start_1
    iget-object p6, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 219
    .line 220
    invoke-virtual {p6, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 221
    .line 222
    .line 223
    move-result-object p6

    .line 224
    if-nez p6, :cond_7

    .line 225
    .line 226
    new-instance p6, Lorg/json/JSONObject;

    .line 227
    .line 228
    invoke-direct {p6}, Lorg/json/JSONObject;-><init>()V

    .line 229
    .line 230
    .line 231
    goto :goto_3

    .line 232
    :catch_0
    move-exception p1

    .line 233
    goto :goto_4

    .line 234
    :cond_7
    :goto_3
    const-string p7, "click_string"

    .line 235
    .line 236
    invoke-virtual {p6, p7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p6

    .line 240
    iget-object p7, p0, Ll/dku0;->f:Ll/v2s0;

    .line 241
    .line 242
    invoke-virtual {p7}, Ll/v2s0;->c()Ll/r2s0;

    .line 243
    .line 244
    .line 245
    move-result-object p7

    .line 246
    iget-object p8, p0, Ll/dku0;->a:Landroid/content/Context;

    .line 247
    .line 248
    invoke-interface {p7, p8, p6, p1}, Ll/r2s0;->c(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 252
    goto :goto_5

    .line 253
    :goto_4
    :try_start_2
    const-string p6, "Exception obtaining click signals"

    .line 254
    .line 255
    invoke-static {p6, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 256
    .line 257
    .line 258
    move-object p1, p5

    .line 259
    :goto_5
    invoke-virtual {p2, p3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 260
    .line 261
    .line 262
    sget-object p1, Ll/sgs0;->z4:Ll/dgs0;

    .line 263
    .line 264
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 265
    .line 266
    .line 267
    move-result-object p3

    .line 268
    invoke-virtual {p3, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    check-cast p1, Ljava/lang/Boolean;

    .line 273
    .line 274
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    if-eqz p1, :cond_8

    .line 279
    .line 280
    const-string p1, "open_chrome_custom_tab"

    .line 281
    .line 282
    invoke-virtual {p2, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 283
    .line 284
    .line 285
    :cond_8
    sget-object p1, Ll/sgs0;->x8:Ll/dgs0;

    .line 286
    .line 287
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 288
    .line 289
    .line 290
    move-result-object p3

    .line 291
    invoke-virtual {p3, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    check-cast p1, Ljava/lang/Boolean;

    .line 296
    .line 297
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    if-eqz p1, :cond_9

    .line 302
    .line 303
    invoke-static {}, Lcom/google/android/gms/common/util/PlatformVersion;->isAtLeastR()Z

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    if-eqz p1, :cond_9

    .line 308
    .line 309
    const-string p1, "try_fallback_for_deep_link"

    .line 310
    .line 311
    invoke-virtual {p2, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 312
    .line 313
    .line 314
    :cond_9
    sget-object p1, Ll/sgs0;->y8:Ll/dgs0;

    .line 315
    .line 316
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 317
    .line 318
    .line 319
    move-result-object p3

    .line 320
    invoke-virtual {p3, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    check-cast p1, Ljava/lang/Boolean;

    .line 325
    .line 326
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 327
    .line 328
    .line 329
    move-result p1

    .line 330
    if-eqz p1, :cond_a

    .line 331
    .line 332
    invoke-static {}, Lcom/google/android/gms/common/util/PlatformVersion;->isAtLeastR()Z

    .line 333
    .line 334
    .line 335
    move-result p1

    .line 336
    if-eqz p1, :cond_a

    .line 337
    .line 338
    const-string p1, "in_app_link_handling_for_android_11_enabled"

    .line 339
    .line 340
    invoke-virtual {p2, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 341
    .line 342
    .line 343
    :cond_a
    const-string p1, "click"

    .line 344
    .line 345
    invoke-virtual {v2, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 346
    .line 347
    .line 348
    new-instance p1, Lorg/json/JSONObject;

    .line 349
    .line 350
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 351
    .line 352
    .line 353
    iget-object p2, p0, Ll/dku0;->o:Lcom/google/android/gms/common/util/Clock;

    .line 354
    .line 355
    invoke-interface {p2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 356
    .line 357
    .line 358
    move-result-wide p2

    .line 359
    const-string p4, "time_from_last_touch_down"

    .line 360
    .line 361
    iget-wide p6, p0, Ll/dku0;->z:J

    .line 362
    .line 363
    sub-long p6, p2, p6

    .line 364
    .line 365
    invoke-virtual {p1, p4, p6, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 366
    .line 367
    .line 368
    const-string p4, "time_from_last_touch"

    .line 369
    .line 370
    iget-wide p6, p0, Ll/dku0;->A:J

    .line 371
    .line 372
    sub-long/2addr p2, p6

    .line 373
    invoke-virtual {p1, p4, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 374
    .line 375
    .line 376
    const-string p2, "touch_signal"

    .line 377
    .line 378
    invoke-virtual {v2, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 379
    .line 380
    .line 381
    iget-object p1, p0, Ll/dku0;->j:Ll/q6w0;

    .line 382
    .line 383
    iget-boolean p1, p1, Ll/q6w0;->j0:Z

    .line 384
    .line 385
    if-eqz p1, :cond_c

    .line 386
    .line 387
    iget-object p1, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 388
    .line 389
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    check-cast p1, Lorg/json/JSONObject;

    .line 394
    .line 395
    if-eqz p1, :cond_b

    .line 396
    .line 397
    const-string p2, "gws_query_id"

    .line 398
    .line 399
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object p5

    .line 403
    :cond_b
    if-eqz p5, :cond_c

    .line 404
    .line 405
    iget-object p1, p0, Ll/dku0;->s:Ll/qbv0;

    .line 406
    .line 407
    iget-object p2, p0, Ll/dku0;->e:Ll/ulu0;

    .line 408
    .line 409
    invoke-virtual {p1, p5, p2}, Ll/qbv0;->w8(Ljava/lang/String;Ll/ulu0;)V

    .line 410
    .line 411
    .line 412
    :cond_c
    iget-object p0, p0, Ll/dku0;->d:Ll/qru0;

    .line 413
    .line 414
    const-string p1, "google.afma.nativeAds.handleClick"

    .line 415
    .line 416
    invoke-virtual {p0, p1, v2}, Ll/qru0;->d(Ljava/lang/String;Lorg/json/JSONObject;)Ll/hpr;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    const-string p1, "Error during performing handleClick"

    .line 421
    .line 422
    invoke-static {p0, p1}, Ll/rct0;->a(Ll/hpr;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 423
    .line 424
    .line 425
    return-void

    .line 426
    :catch_1
    move-exception p0

    .line 427
    const-string p1, "Unable to create click JSON."

    .line 428
    .line 429
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 430
    .line 431
    .line 432
    return-void
.end method

.method public final J()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dku0;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final a(Landroid/view/View;Landroid/view/View;Ljava/util/Map;Ljava/util/Map;ZLandroid/widget/ImageView$ScaleType;)V
    .locals 11
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Landroid/widget/ImageView$ScaleType;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v3, p0, Ll/dku0;->a:Landroid/content/Context;

    .line 2
    .line 3
    move-object/from16 v5, p6

    .line 4
    .line 5
    invoke-static {v3, p3, p4, p2, v5}, Ll/d4t0;->d(Landroid/content/Context;Ljava/util/Map;Ljava/util/Map;Landroid/view/View;Landroid/widget/ImageView$ScaleType;)Lorg/json/JSONObject;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    invoke-static {v3, p2}, Ll/d4t0;->g(Landroid/content/Context;Landroid/view/View;)Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    move-result-object v5

    .line 13
    move-object v6, v4

    .line 14
    invoke-static {p2}, Ll/d4t0;->f(Landroid/view/View;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    move-object v7, v5

    .line 19
    invoke-static {v3, p2}, Ll/d4t0;->e(Landroid/content/Context;Landroid/view/View;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-virtual {p0, p1, p3}, Ll/dku0;->r(Landroid/view/View;Ljava/util/Map;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v9, p0, Ll/dku0;->y:Landroid/graphics/Point;

    .line 28
    .line 29
    iget-object v10, p0, Ll/dku0;->x:Landroid/graphics/Point;

    .line 30
    .line 31
    invoke-static {v2, v3, v9, v10}, Ll/d4t0;->c(Ljava/lang/String;Landroid/content/Context;Landroid/graphics/Point;Landroid/graphics/Point;)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    sget-object v9, Ll/sgs0;->w3:Ll/dgs0;

    .line 36
    .line 37
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 38
    .line 39
    .line 40
    move-result-object v10

    .line 41
    invoke-virtual {v10, v9}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v9

    .line 45
    check-cast v9, Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    .line 48
    .line 49
    .line 50
    move-result v9

    .line 51
    const/4 v10, 0x1

    .line 52
    if-ne v10, v9, :cond_0

    .line 53
    .line 54
    move-object v1, p2

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    move-object v1, p1

    .line 57
    :goto_0
    const/4 v8, 0x0

    .line 58
    const/4 v10, 0x0

    .line 59
    move-object v0, v6

    .line 60
    move-object v6, v2

    .line 61
    move-object v2, v7

    .line 62
    move-object v7, v3

    .line 63
    move-object v3, v0

    .line 64
    move-object v0, p0

    .line 65
    move/from16 v9, p5

    .line 66
    .line 67
    invoke-virtual/range {v0 .. v10}, Ll/dku0;->A(Landroid/view/View;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;ZZ)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/dku0;->w:Z

    .line 3
    .line 4
    return-void
.end method

.method public final c(Ll/czt0;)V
    .locals 3
    .param p1    # Ll/czt0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-boolean v0, p0, Ll/dku0;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Ll/dku0;->e:Ll/ulu0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/ulu0;->X()Ll/rfv0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/dku0;->v:Z

    .line 18
    .line 19
    iget-object p1, p0, Ll/dku0;->q:Ll/yew0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/ulu0;->X()Ll/rfv0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/rfv0;->zzf()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Ll/dku0;->r:Ll/cew0;

    .line 30
    .line 31
    invoke-virtual {p1, v0, v1}, Ll/yew0;->c(Ljava/lang/String;Ll/cew0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/dku0;->zzg()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iput-boolean v0, p0, Ll/dku0;->v:Z

    .line 39
    .line 40
    iget-object v0, p0, Ll/dku0;->q:Ll/yew0;

    .line 41
    .line 42
    invoke-interface {p1}, Ll/czt0;->zzf()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v1, p0, Ll/dku0;->r:Ll/cew0;

    .line 47
    .line 48
    invoke-virtual {v0, p1, v1}, Ll/yew0;->c(Ljava/lang/String;Ll/cew0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/dku0;->zzg()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :catch_0
    move-exception p0

    .line 56
    const-string p1, "#007 Could not call remote method."

    .line 57
    .line 58
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final d(Landroid/os/Bundle;)Z
    .locals 10

    .line 1
    const-string v0, "impression_reporting"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/dku0;->s(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "The ad slot cannot handle external impression events. You must be in the allow list to be able to report your impression events."

    .line 10
    .line 11
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, p1, v1}, Ll/obt0;->l(Landroid/os/Bundle;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    move-result-object v8

    .line 25
    sget-object p1, Ll/sgs0;->Pa:Ll/dgs0;

    .line 26
    .line 27
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Ll/dku0;->q(Landroid/view/View;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    :cond_1
    move-object v7, v1

    .line 48
    const/4 v6, 0x0

    .line 49
    const/4 v9, 0x0

    .line 50
    const/4 v3, 0x0

    .line 51
    const/4 v4, 0x0

    .line 52
    const/4 v5, 0x0

    .line 53
    move-object v2, p0

    .line 54
    invoke-virtual/range {v2 .. v9}, Ll/dku0;->w(Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Z)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0
.end method

.method public final e(Landroid/view/View;Ljava/util/Map;Ljava/util/Map;Landroid/widget/ImageView$ScaleType;)Lorg/json/JSONObject;
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/widget/ImageView$ScaleType;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dku0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0, p2, p3, p1, p4}, Ll/d4t0;->d(Landroid/content/Context;Ljava/util/Map;Ljava/util/Map;Landroid/view/View;Landroid/widget/ImageView$ScaleType;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p0, p1}, Ll/d4t0;->g(Landroid/content/Context;Landroid/view/View;)Lorg/json/JSONObject;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-static {p1}, Ll/d4t0;->f(Landroid/view/View;)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    invoke-static {p0, p1}, Ll/d4t0;->e(Landroid/content/Context;Landroid/view/View;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 20
    .line 21
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v0, "asset_view_signal"

    .line 25
    .line 26
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    const-string p2, "ad_view_signal"

    .line 30
    .line 31
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    const-string p2, "scroll_view_signal"

    .line 35
    .line 36
    invoke-virtual {p1, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    const-string p2, "lock_screen_signal"

    .line 40
    .line 41
    invoke-virtual {p1, p2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    return-object p1

    .line 45
    :catch_0
    move-exception p0

    .line 46
    const-string p1, "Unable to create native ad view signals JSON."

    .line 47
    .line 48
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    return-object p0
.end method

.method public final f(Landroid/view/View;Landroid/view/View;Ljava/util/Map;Ljava/util/Map;ZLandroid/widget/ImageView$ScaleType;I)V
    .locals 16
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Landroid/widget/ImageView$ScaleType;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    move-object/from16 v0, p3

    .line 6
    .line 7
    iget-object v3, v1, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 8
    .line 9
    const-string v4, "allow_sdk_custom_click_gesture"

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    sget-object v3, Ll/sgs0;->Ua:Ll/dgs0;

    .line 19
    .line 20
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    const/4 v5, 0x1

    .line 37
    :cond_0
    if-nez v5, :cond_3

    .line 38
    .line 39
    iget-boolean v3, v1, Ll/dku0;->w:Z

    .line 40
    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    const-string v0, "Custom click reporting failed. enableCustomClickGesture is not set."

    .line 44
    .line 45
    invoke-static {v0}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-virtual {v1}, Ll/dku0;->v()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const-string v0, "Custom click reporting failed. Ad unit id not in the allow list."

    .line 57
    .line 58
    invoke-static {v0}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    :goto_0
    iget-object v3, v1, Ll/dku0;->a:Landroid/content/Context;

    .line 63
    .line 64
    move-object/from16 v4, p4

    .line 65
    .line 66
    move-object/from16 v6, p6

    .line 67
    .line 68
    invoke-static {v3, v0, v4, v2, v6}, Ll/d4t0;->d(Landroid/content/Context;Ljava/util/Map;Ljava/util/Map;Landroid/view/View;Landroid/widget/ImageView$ScaleType;)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    iget-object v3, v1, Ll/dku0;->a:Landroid/content/Context;

    .line 73
    .line 74
    invoke-static {v3, v2}, Ll/d4t0;->g(Landroid/content/Context;Landroid/view/View;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    move v6, v5

    .line 79
    invoke-static {v2}, Ll/d4t0;->f(Landroid/view/View;)Lorg/json/JSONObject;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    iget-object v7, v1, Ll/dku0;->a:Landroid/content/Context;

    .line 84
    .line 85
    invoke-static {v7, v2}, Ll/d4t0;->e(Landroid/content/Context;Landroid/view/View;)Lorg/json/JSONObject;

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    move-object/from16 v8, p1

    .line 90
    .line 91
    invoke-virtual {v1, v8, v0}, Ll/dku0;->r(Landroid/view/View;Ljava/util/Map;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    iget-object v0, v1, Ll/dku0;->a:Landroid/content/Context;

    .line 96
    .line 97
    iget-object v9, v1, Ll/dku0;->y:Landroid/graphics/Point;

    .line 98
    .line 99
    iget-object v10, v1, Ll/dku0;->x:Landroid/graphics/Point;

    .line 100
    .line 101
    invoke-static {v8, v0, v9, v10}, Ll/d4t0;->c(Ljava/lang/String;Landroid/content/Context;Landroid/graphics/Point;Landroid/graphics/Point;)Lorg/json/JSONObject;

    .line 102
    .line 103
    .line 104
    move-result-object v9

    .line 105
    if-eqz v6, :cond_6

    .line 106
    .line 107
    :try_start_0
    iget-object v6, v1, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 108
    .line 109
    const-string v10, "custom_click_gesture_signal"

    .line 110
    .line 111
    iget-object v0, v1, Ll/dku0;->y:Landroid/graphics/Point;

    .line 112
    .line 113
    iget-object v11, v1, Ll/dku0;->x:Landroid/graphics/Point;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 114
    .line 115
    :try_start_1
    new-instance v12, Lorg/json/JSONObject;

    .line 116
    .line 117
    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 118
    .line 119
    .line 120
    :try_start_2
    new-instance v13, Lorg/json/JSONObject;

    .line 121
    .line 122
    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 123
    .line 124
    .line 125
    new-instance v14, Lorg/json/JSONObject;

    .line 126
    .line 127
    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 128
    .line 129
    .line 130
    const-string v15, "y"

    .line 131
    .line 132
    const-string v1, "x"

    .line 133
    .line 134
    if-eqz v0, :cond_4

    .line 135
    .line 136
    :try_start_3
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 137
    .line 138
    invoke-virtual {v13, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 139
    .line 140
    .line 141
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 142
    .line 143
    invoke-virtual {v13, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :catch_0
    move-exception v0

    .line 148
    goto :goto_2

    .line 149
    :cond_4
    :goto_1
    if-eqz v11, :cond_5

    .line 150
    .line 151
    iget v0, v11, Landroid/graphics/Point;->x:I

    .line 152
    .line 153
    invoke-virtual {v14, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 154
    .line 155
    .line 156
    iget v0, v11, Landroid/graphics/Point;->y:I

    .line 157
    .line 158
    invoke-virtual {v14, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 159
    .line 160
    .line 161
    :cond_5
    const-string v0, "start_point"

    .line 162
    .line 163
    invoke-virtual {v12, v0, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    .line 165
    .line 166
    const-string v0, "end_point"

    .line 167
    .line 168
    invoke-virtual {v12, v0, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 169
    .line 170
    .line 171
    const-string v0, "duration_ms"

    .line 172
    .line 173
    move/from16 v1, p7

    .line 174
    .line 175
    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 176
    .line 177
    .line 178
    goto :goto_3

    .line 179
    :catch_1
    move-exception v0

    .line 180
    const/4 v12, 0x0

    .line 181
    :goto_2
    :try_start_4
    const-string v1, "Error occurred while grabbing custom click gesture signals."

    .line 182
    .line 183
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 184
    .line 185
    .line 186
    :goto_3
    invoke-virtual {v6, v10, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    .line 187
    .line 188
    .line 189
    :cond_6
    :goto_4
    move-object v6, v7

    .line 190
    move-object v7, v8

    .line 191
    move-object v8, v9

    .line 192
    goto :goto_5

    .line 193
    :catch_2
    move-exception v0

    .line 194
    const-string v1, "Error occurred while adding CustomClickGestureSignals to adJson."

    .line 195
    .line 196
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 197
    .line 198
    .line 199
    const-string v1, "FirstPartyNativeAdCore.performCustomClickGesture"

    .line 200
    .line 201
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {v2, v0, v1}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    goto :goto_4

    .line 209
    :goto_5
    const/4 v9, 0x0

    .line 210
    const/4 v11, 0x1

    .line 211
    move-object/from16 v1, p0

    .line 212
    .line 213
    move-object/from16 v2, p2

    .line 214
    .line 215
    move/from16 v10, p5

    .line 216
    .line 217
    invoke-virtual/range {v1 .. v11}, Ll/dku0;->A(Landroid/view/View;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;ZZ)V

    .line 218
    .line 219
    .line 220
    return-void
.end method

.method public final g(Landroid/view/View;Ljava/util/Map;Ljava/util/Map;Landroid/widget/ImageView$ScaleType;)Lorg/json/JSONObject;
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/widget/ImageView$ScaleType;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/dku0;->e(Landroid/view/View;Ljava/util/Map;Ljava/util/Map;Landroid/widget/ImageView$ScaleType;)Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-boolean p3, p0, Ll/dku0;->w:Z

    .line 11
    .line 12
    if-eqz p3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/dku0;->v()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const-string p0, "custom_click_gesture_eligible"

    .line 21
    .line 22
    const/4 p3, 0x1

    .line 23
    invoke-virtual {p2, p0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    if-eqz p1, :cond_1

    .line 30
    .line 31
    const-string p0, "nas"

    .line 32
    .line 33
    invoke-virtual {p2, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    :cond_1
    return-object p2

    .line 37
    :goto_1
    const-string p1, "Unable to create native click meta data JSON."

    .line 38
    .line 39
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    return-object p2
.end method

.method public final h(Landroid/view/View;Landroid/view/MotionEvent;Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p2, p3}, Ll/d4t0;->a(Landroid/view/MotionEvent;Landroid/view/View;)Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/dku0;->x:Landroid/graphics/Point;

    .line 6
    .line 7
    iget-object p1, p0, Ll/dku0;->o:Lcom/google/android/gms/common/util/Clock;

    .line 8
    .line 9
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Ll/dku0;->A:J

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iput-wide v0, p0, Ll/dku0;->z:J

    .line 22
    .line 23
    iget-object p1, p0, Ll/dku0;->x:Landroid/graphics/Point;

    .line 24
    .line 25
    iput-object p1, p0, Ll/dku0;->y:Landroid/graphics/Point;

    .line 26
    .line 27
    :cond_0
    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p2, p0, Ll/dku0;->x:Landroid/graphics/Point;

    .line 32
    .line 33
    iget p3, p2, Landroid/graphics/Point;->x:I

    .line 34
    .line 35
    int-to-float p3, p3

    .line 36
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 37
    .line 38
    int-to-float p2, p2

    .line 39
    invoke-virtual {p1, p3, p2}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/dku0;->f:Ll/v2s0;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/v2s0;->d(Landroid/view/MotionEvent;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final i(Landroid/view/View;Ljava/util/Map;Ljava/util/Map;Landroid/widget/ImageView$ScaleType;)V
    .locals 9
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/widget/ImageView$ScaleType;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/dku0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0, p2, p3, p1, p4}, Ll/d4t0;->d(Landroid/content/Context;Ljava/util/Map;Ljava/util/Map;Landroid/view/View;Landroid/widget/ImageView$ScaleType;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    invoke-static {v0, p1}, Ll/d4t0;->g(Landroid/content/Context;Landroid/view/View;)Lorg/json/JSONObject;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {p1}, Ll/d4t0;->f(Landroid/view/View;)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-static {v0, p1}, Ll/d4t0;->e(Landroid/content/Context;Landroid/view/View;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-virtual {p0, p1}, Ll/dku0;->q(Landroid/view/View;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    iget-object p1, p0, Ll/dku0;->j:Ll/q6w0;

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/d4t0;->h(Landroid/content/Context;Ll/q6w0;)Z

    .line 26
    .line 27
    .line 28
    move-result v8

    .line 29
    const/4 v7, 0x0

    .line 30
    move-object v1, p0

    .line 31
    invoke-virtual/range {v1 .. v8}, Ll/dku0;->w(Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Z)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final j(Landroid/os/Bundle;)V
    .locals 13
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "Click data is null. No click is reported."

    .line 4
    .line 5
    invoke-static {p0}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "click_reporting"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/dku0;->s(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string p0, "The ad slot cannot handle external click events. You must be part of the allow list to be able to report your click events."

    .line 18
    .line 19
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string v0, "click_signal"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const-string v2, "asset_id"

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    move-object v8, v0

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    move-object v8, v1

    .line 41
    :goto_0
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, p1, v1}, Ll/obt0;->l(Landroid/os/Bundle;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    move-result-object v10

    .line 49
    const/4 v11, 0x0

    .line 50
    const/4 v12, 0x0

    .line 51
    const/4 v3, 0x0

    .line 52
    const/4 v4, 0x0

    .line 53
    const/4 v5, 0x0

    .line 54
    const/4 v6, 0x0

    .line 55
    const/4 v7, 0x0

    .line 56
    const/4 v9, 0x0

    .line 57
    move-object v2, p0

    .line 58
    invoke-virtual/range {v2 .. v12}, Ll/dku0;->A(Landroid/view/View;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;ZZ)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final k(Landroid/view/View;Ljava/util/Map;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance p2, Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-direct {p2}, Landroid/graphics/Point;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/dku0;->x:Landroid/graphics/Point;

    .line 7
    .line 8
    new-instance p2, Landroid/graphics/Point;

    .line 9
    .line 10
    invoke-direct {p2}, Landroid/graphics/Point;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/dku0;->y:Landroid/graphics/Point;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p2, p0, Ll/dku0;->p:Ll/agu0;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Ll/agu0;->z0(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Ll/dku0;->u:Z

    .line 24
    .line 25
    return-void
.end method

.method public final l(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 2
    .line 3
    const-string v1, "custom_one_point_five_click_enabled"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string p0, "setClickConfirmingView: Your account need to be in the allow list to use this feature.\nContact your account manager for more information."

    .line 13
    .line 14
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p0, p0, Ll/dku0;->n:Ll/enu0;

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/enu0;->g:Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    return-void
.end method

.method public final m(Landroid/view/View;Ljava/util/Map;Ljava/util/Map;Landroid/view/View$OnTouchListener;Landroid/view/View$OnClickListener;)V
    .locals 2
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/dku0;->x:Landroid/graphics/Point;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Point;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/dku0;->y:Landroid/graphics/Point;

    .line 14
    .line 15
    iget-boolean v0, p0, Ll/dku0;->u:Z

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/dku0;->p:Ll/agu0;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/agu0;->w0(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iput-boolean v1, p0, Ll/dku0;->u:Z

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/dku0;->m:Ll/hvt0;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ll/hvt0;->k(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/dku0;->k:Lcom/google/android/gms/internal/ads/zzcei;

    .line 42
    .line 43
    iget p0, p0, Lcom/google/android/gms/internal/ads/zzcei;->zzc:I

    .line 44
    .line 45
    invoke-static {p0}, Ll/d4t0;->i(I)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p2, :cond_3

    .line 50
    .line 51
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_3

    .line 64
    .line 65
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    check-cast p2, Ljava/util/Map$Entry;

    .line 70
    .line 71
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    check-cast p2, Ljava/lang/ref/WeakReference;

    .line 76
    .line 77
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    check-cast p2, Landroid/view/View;

    .line 82
    .line 83
    if-eqz p2, :cond_1

    .line 84
    .line 85
    if-eqz p0, :cond_2

    .line 86
    .line 87
    invoke-virtual {p2, p4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    invoke-virtual {p2, v1}, Landroid/view/View;->setClickable(Z)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2, p5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    if-eqz p3, :cond_6

    .line 98
    .line 99
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    :cond_4
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_6

    .line 112
    .line 113
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    check-cast p2, Ljava/util/Map$Entry;

    .line 118
    .line 119
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    check-cast p2, Ljava/lang/ref/WeakReference;

    .line 124
    .line 125
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    check-cast p2, Landroid/view/View;

    .line 130
    .line 131
    if-eqz p2, :cond_4

    .line 132
    .line 133
    if-eqz p0, :cond_5

    .line 134
    .line 135
    invoke-virtual {p2, p4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 136
    .line 137
    .line 138
    :cond_5
    const/4 p3, 0x0

    .line 139
    invoke-virtual {p2, p3}, Landroid/view/View;->setClickable(Z)V

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_6
    return-void
.end method

.method public final n(Landroid/os/Bundle;)V
    .locals 3
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "Touch event data is null. No touch event is reported."

    .line 4
    .line 5
    invoke-static {p0}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "touch_reporting"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/dku0;->s(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string p0, "The ad slot cannot handle external touch events. You must be in the allow list to be able to report your touch events."

    .line 18
    .line 19
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string v0, "x"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    float-to-int v0, v0

    .line 30
    const-string v1, "y"

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    float-to-int v1, v1

    .line 37
    const-string v2, "duration_ms"

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget-object p0, p0, Ll/dku0;->f:Ll/v2s0;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/v2s0;->c()Ll/r2s0;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p0, v0, v1, p1}, Ll/r2s0;->b(III)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final o(Ll/kns0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 2
    .line 3
    const-string v1, "custom_one_point_five_click_enabled"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string p0, "setUnconfirmedClickListener: Your account need to be in the allow list to use this feature.\nContact your account manager for more information."

    .line 13
    .line 14
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p0, p0, Ll/dku0;->n:Ll/enu0;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/enu0;->c(Ll/kns0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final p(Ll/ytt0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dku0;->B:Ll/ytt0;

    .line 2
    .line 3
    return-void
.end method

.method public final q(Landroid/view/View;)Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/sgs0;->p3:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return-object v1

    .line 21
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/dku0;->f:Ll/v2s0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/v2s0;->c()Ll/r2s0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p0, p0, Ll/dku0;->a:Landroid/content/Context;

    .line 28
    .line 29
    invoke-interface {v0, p0, p1, v1}, Ll/r2s0;->h(Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    return-object p0

    .line 34
    :catch_0
    const-string p0, "Exception getting data."

    .line 35
    .line 36
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-object v1
.end method

.method public final r(Landroid/view/View;Ljava/util/Map;)Ljava/lang/String;
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/util/Map$Entry;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Ljava/lang/String;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_1
    iget-object p0, p0, Ll/dku0;->e:Ll/ulu0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/ulu0;->P()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    const/4 p1, 0x1

    .line 57
    if-eq p0, p1, :cond_4

    .line 58
    .line 59
    const/4 p1, 0x2

    .line 60
    if-eq p0, p1, :cond_3

    .line 61
    .line 62
    const/4 p1, 0x6

    .line 63
    if-eq p0, p1, :cond_2

    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return-object p0

    .line 67
    :cond_2
    const-string p0, "3099"

    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_3
    const-string p0, "2099"

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_4
    const-string p0, "1099"

    .line 74
    .line 75
    return-object p0
.end method

.method public final s(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 2
    .line 3
    const-string v0, "allow_pub_event_reporting"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    return v0
.end method

.method public final t()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/dku0;->zza()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Ll/sgs0;->Ua:Ll/dgs0;

    .line 8
    .line 9
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p0, p0, Ll/dku0;->l:Ll/o7w0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/o7w0;->i:Lcom/google/android/gms/internal/ads/zzbjb;

    .line 29
    .line 30
    iget-boolean p0, p0, Lcom/google/android/gms/internal/ads/zzbjb;->zzj:Z

    .line 31
    .line 32
    return p0

    .line 33
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method public final u(Ljava/lang/String;)V
    .locals 11

    .line 1
    const/4 v9, 0x0

    .line 2
    const/4 v10, 0x0

    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    const/4 v4, 0x0

    .line 7
    const/4 v5, 0x0

    .line 8
    const/4 v7, 0x0

    .line 9
    const/4 v8, 0x0

    .line 10
    move-object v0, p0

    .line 11
    move-object v6, p1

    .line 12
    invoke-virtual/range {v0 .. v10}, Ll/dku0;->A(Landroid/view/View;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;ZZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final v()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 2
    .line 3
    const-string v0, "allow_custom_click_gesture"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final w(Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Z)Z
    .locals 3
    .param p1    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ad"

    .line 7
    .line 8
    iget-object v2, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "asset_view_signal"

    .line 14
    .line 15
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    const-string p2, "ad_view_signal"

    .line 19
    .line 20
    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    const-string p1, "scroll_view_signal"

    .line 24
    .line 25
    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    const-string p1, "lock_screen_signal"

    .line 29
    .line 30
    invoke-virtual {v0, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    const-string p1, "provided_signals"

    .line 34
    .line 35
    invoke-virtual {v0, p1, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    sget-object p1, Ll/sgs0;->p3:Ll/dgs0;

    .line 39
    .line 40
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    const-string p1, "view_signals"

    .line 57
    .line 58
    invoke-virtual {v0, p1, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    :cond_0
    const-string p1, "policy_validator_enabled"

    .line 62
    .line 63
    invoke-virtual {v0, p1, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 64
    .line 65
    .line 66
    const-string p1, "screen"

    .line 67
    .line 68
    iget-object p2, p0, Ll/dku0;->a:Landroid/content/Context;

    .line 69
    .line 70
    new-instance p3, Lorg/json/JSONObject;

    .line 71
    .line 72
    invoke-direct {p3}, Lorg/json/JSONObject;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 76
    .line 77
    .line 78
    const-string p4, "window"

    .line 79
    .line 80
    invoke-virtual {p2, p4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p4

    .line 84
    check-cast p4, Landroid/view/WindowManager;

    .line 85
    .line 86
    invoke-static {p4}, Lcom/google/android/gms/ads/internal/util/b;->U(Landroid/view/WindowManager;)Landroid/util/DisplayMetrics;

    .line 87
    .line 88
    .line 89
    move-result-object p4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 90
    const/4 p5, 0x0

    .line 91
    :try_start_1
    const-string p6, "width"

    .line 92
    .line 93
    iget p7, p4, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 94
    .line 95
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1, p2, p7}, Ll/obt0;->e(Landroid/content/Context;I)I

    .line 100
    .line 101
    .line 102
    move-result p7

    .line 103
    invoke-virtual {p3, p6, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    const-string p6, "height"

    .line 107
    .line 108
    iget p4, p4, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 109
    .line 110
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 111
    .line 112
    .line 113
    move-result-object p7

    .line 114
    invoke-virtual {p7, p2, p4}, Ll/obt0;->e(Landroid/content/Context;I)I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    invoke-virtual {p3, p6, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :catch_0
    move-object p3, p5

    .line 123
    :goto_0
    :try_start_2
    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    .line 125
    .line 126
    sget-object p1, Ll/sgs0;->t8:Ll/dgs0;

    .line 127
    .line 128
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    check-cast p1, Ljava/lang/Boolean;

    .line 137
    .line 138
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 139
    .line 140
    .line 141
    move-result p1
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 142
    iget-object p2, p0, Ll/dku0;->d:Ll/qru0;

    .line 143
    .line 144
    if-eqz p1, :cond_1

    .line 145
    .line 146
    :try_start_3
    const-string p1, "/clickRecorded"

    .line 147
    .line 148
    new-instance p3, Ll/aku0;

    .line 149
    .line 150
    invoke-direct {p3, p0, p5}, Ll/aku0;-><init>(Ll/dku0;Ll/zju0;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p2, p1, p3}, Ll/qru0;->i(Ljava/lang/String;Ll/bqs0;)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_1
    const-string p1, "/logScionEvent"

    .line 158
    .line 159
    new-instance p3, Ll/yju0;

    .line 160
    .line 161
    invoke-direct {p3, p0, p5}, Ll/yju0;-><init>(Ll/dku0;Ll/xju0;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p2, p1, p3}, Ll/qru0;->i(Ljava/lang/String;Ll/bqs0;)V

    .line 165
    .line 166
    .line 167
    :goto_1
    iget-object p1, p0, Ll/dku0;->d:Ll/qru0;

    .line 168
    .line 169
    const-string p2, "/nativeImpression"

    .line 170
    .line 171
    new-instance p3, Ll/cku0;

    .line 172
    .line 173
    invoke-direct {p3, p0, p5}, Ll/cku0;-><init>(Ll/dku0;Ll/bku0;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1, p2, p3}, Ll/qru0;->i(Ljava/lang/String;Ll/bqs0;)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Ll/dku0;->d:Ll/qru0;

    .line 180
    .line 181
    const-string p2, "google.afma.nativeAds.handleImpression"

    .line 182
    .line 183
    invoke-virtual {p1, p2, v0}, Ll/qru0;->d(Ljava/lang/String;Lorg/json/JSONObject;)Ll/hpr;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    const-string p2, "Error during performing handleImpression"

    .line 188
    .line 189
    invoke-static {p1, p2}, Ll/rct0;->a(Ll/hpr;Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 190
    .line 191
    .line 192
    iget-boolean p1, p0, Ll/dku0;->t:Z

    .line 193
    .line 194
    if-nez p1, :cond_2

    .line 195
    .line 196
    iget-object p1, p0, Ll/dku0;->a:Landroid/content/Context;

    .line 197
    .line 198
    iget-object p2, p0, Ll/dku0;->k:Lcom/google/android/gms/internal/ads/zzcei;

    .line 199
    .line 200
    iget-object p3, p0, Ll/dku0;->j:Ll/q6w0;

    .line 201
    .line 202
    iget-object p4, p0, Ll/dku0;->l:Ll/o7w0;

    .line 203
    .line 204
    invoke-static {}, Ll/bxy0;->u()Ll/d6s0;

    .line 205
    .line 206
    .line 207
    move-result-object p5

    .line 208
    iget-object p2, p2, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 209
    .line 210
    iget-object p3, p3, Ll/q6w0;->D:Lorg/json/JSONObject;

    .line 211
    .line 212
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p3

    .line 216
    iget-object p4, p4, Ll/o7w0;->f:Ljava/lang/String;

    .line 217
    .line 218
    invoke-virtual {p5, p1, p2, p3, p4}, Ll/d6s0;->n(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    iput-boolean p1, p0, Ll/dku0;->t:Z

    .line 223
    .line 224
    :cond_2
    const/4 p0, 0x1

    .line 225
    return p0

    .line 226
    :catch_1
    move-exception p0

    .line 227
    const-string p1, "Unable to create impression JSON."

    .line 228
    .line 229
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 230
    .line 231
    .line 232
    const/4 p0, 0x0

    .line 233
    return p0
.end method

.method public final zza()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dku0;->l:Ll/o7w0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/o7w0;->i:Lcom/google/android/gms/internal/ads/zzbjb;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Ll/sgs0;->Ua:Ll/dgs0;

    .line 8
    .line 9
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p0, p0, Ll/dku0;->l:Ll/o7w0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/o7w0;->i:Lcom/google/android/gms/internal/ads/zzbjb;

    .line 29
    .line 30
    iget p0, p0, Lcom/google/android/gms/internal/ads/zzbjb;->zzi:I

    .line 31
    .line 32
    return p0

    .line 33
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public final zzg()V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/dku0;->B:Ll/ytt0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/ytt0;->zze()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "#007 Could not call remote method."

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final zzh()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 2
    .line 3
    const-string v1, "custom_one_point_five_click_enabled"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ll/dku0;->n:Ll/enu0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/enu0;->b()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final zzi()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dku0;->d:Ll/qru0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qru0;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzp()V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ad"

    .line 7
    .line 8
    iget-object v2, p0, Ll/dku0;->c:Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/dku0;->d:Ll/qru0;

    .line 14
    .line 15
    const-string v1, "google.afma.nativeAds.handleDownloadedImpression"

    .line 16
    .line 17
    invoke-virtual {p0, v1, v0}, Ll/qru0;->d(Ljava/lang/String;Lorg/json/JSONObject;)Ll/hpr;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "Error during performing handleDownloadedImpression"

    .line 22
    .line 23
    invoke-static {p0, v0}, Ll/rct0;->a(Ll/hpr;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    const-string v0, ""

    .line 29
    .line 30
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final zzr()V
    .locals 8

    .line 1
    const/4 v6, 0x0

    .line 2
    const/4 v7, 0x0

    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    const/4 v4, 0x0

    .line 7
    const/4 v5, 0x0

    .line 8
    move-object v0, p0

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/dku0;->w(Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Z)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method
