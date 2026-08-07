.class public final Ll/r0t0;
.super Ll/s0t0;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final c:Ll/wit0;

.field public final d:Landroid/content/Context;

.field public final e:Landroid/view/WindowManager;

.field public final f:Ll/vfs0;

.field public g:Landroid/util/DisplayMetrics;

.field public h:F

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I


# direct methods
.method public constructor <init>(Ll/wit0;Landroid/content/Context;Ll/vfs0;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/s0t0;-><init>(Ll/wit0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    iput v0, p0, Ll/r0t0;->i:I

    .line 8
    .line 9
    iput v0, p0, Ll/r0t0;->j:I

    .line 10
    .line 11
    iput v0, p0, Ll/r0t0;->l:I

    .line 12
    .line 13
    iput v0, p0, Ll/r0t0;->m:I

    .line 14
    .line 15
    iput v0, p0, Ll/r0t0;->n:I

    .line 16
    .line 17
    iput v0, p0, Ll/r0t0;->o:I

    .line 18
    .line 19
    iput-object p1, p0, Ll/r0t0;->c:Ll/wit0;

    .line 20
    .line 21
    iput-object p2, p0, Ll/r0t0;->d:Landroid/content/Context;

    .line 22
    .line 23
    iput-object p3, p0, Ll/r0t0;->f:Ll/vfs0;

    .line 24
    .line 25
    const-string p1, "window"

    .line 26
    .line 27
    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Landroid/view/WindowManager;

    .line 32
    .line 33
    iput-object p1, p0, Ll/r0t0;->e:Landroid/view/WindowManager;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 9

    .line 1
    check-cast p1, Ll/wit0;

    .line 2
    .line 3
    new-instance p1, Landroid/util/DisplayMetrics;

    .line 4
    .line 5
    invoke-direct {p1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/r0t0;->g:Landroid/util/DisplayMetrics;

    .line 9
    .line 10
    iget-object p1, p0, Ll/r0t0;->e:Landroid/view/WindowManager;

    .line 11
    .line 12
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p2, p0, Ll/r0t0;->g:Landroid/util/DisplayMetrics;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Ll/r0t0;->g:Landroid/util/DisplayMetrics;

    .line 22
    .line 23
    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    .line 24
    .line 25
    iput p2, p0, Ll/r0t0;->h:F

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, Ll/r0t0;->k:I

    .line 32
    .line 33
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/r0t0;->g:Landroid/util/DisplayMetrics;

    .line 37
    .line 38
    iget p2, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 39
    .line 40
    invoke-static {p1, p2}, Ll/obt0;->x(Landroid/util/DisplayMetrics;I)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput p1, p0, Ll/r0t0;->i:I

    .line 45
    .line 46
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/r0t0;->g:Landroid/util/DisplayMetrics;

    .line 50
    .line 51
    iget p2, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 52
    .line 53
    invoke-static {p1, p2}, Ll/obt0;->x(Landroid/util/DisplayMetrics;I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput p1, p0, Ll/r0t0;->j:I

    .line 58
    .line 59
    iget-object p1, p0, Ll/r0t0;->c:Ll/wit0;

    .line 60
    .line 61
    invoke-interface {p1}, Ll/wit0;->zzi()Landroid/app/Activity;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const/4 p2, 0x1

    .line 66
    const/4 v1, 0x0

    .line 67
    if-eqz p1, :cond_1

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-nez v0, :cond_0

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 77
    .line 78
    .line 79
    invoke-static {p1}, Lcom/google/android/gms/ads/internal/util/b;->p(Landroid/app/Activity;)[I

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/r0t0;->g:Landroid/util/DisplayMetrics;

    .line 87
    .line 88
    aget v2, p1, v1

    .line 89
    .line 90
    invoke-static {v0, v2}, Ll/obt0;->x(Landroid/util/DisplayMetrics;I)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iput v0, p0, Ll/r0t0;->l:I

    .line 95
    .line 96
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/r0t0;->g:Landroid/util/DisplayMetrics;

    .line 100
    .line 101
    aget p1, p1, p2

    .line 102
    .line 103
    invoke-static {v0, p1}, Ll/obt0;->x(Landroid/util/DisplayMetrics;I)I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    iput p1, p0, Ll/r0t0;->m:I

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_1
    :goto_0
    iget p1, p0, Ll/r0t0;->i:I

    .line 111
    .line 112
    iput p1, p0, Ll/r0t0;->l:I

    .line 113
    .line 114
    iget p1, p0, Ll/r0t0;->j:I

    .line 115
    .line 116
    iput p1, p0, Ll/r0t0;->m:I

    .line 117
    .line 118
    :goto_1
    iget-object p1, p0, Ll/r0t0;->c:Ll/wit0;

    .line 119
    .line 120
    invoke-interface {p1}, Ll/wit0;->zzO()Ll/xkt0;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Ll/xkt0;->i()Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-eqz p1, :cond_2

    .line 129
    .line 130
    iget p1, p0, Ll/r0t0;->i:I

    .line 131
    .line 132
    iput p1, p0, Ll/r0t0;->n:I

    .line 133
    .line 134
    iget p1, p0, Ll/r0t0;->j:I

    .line 135
    .line 136
    iput p1, p0, Ll/r0t0;->o:I

    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_2
    iget-object p1, p0, Ll/r0t0;->c:Ll/wit0;

    .line 140
    .line 141
    invoke-interface {p1, v1, v1}, Ll/wit0;->measure(II)V

    .line 142
    .line 143
    .line 144
    :goto_2
    iget v3, p0, Ll/r0t0;->i:I

    .line 145
    .line 146
    iget v4, p0, Ll/r0t0;->j:I

    .line 147
    .line 148
    iget v5, p0, Ll/r0t0;->l:I

    .line 149
    .line 150
    iget v6, p0, Ll/r0t0;->m:I

    .line 151
    .line 152
    iget v7, p0, Ll/r0t0;->h:F

    .line 153
    .line 154
    iget v8, p0, Ll/r0t0;->k:I

    .line 155
    .line 156
    move-object v2, p0

    .line 157
    invoke-virtual/range {v2 .. v8}, Ll/s0t0;->e(IIIIFI)V

    .line 158
    .line 159
    .line 160
    new-instance p0, Ll/q0t0;

    .line 161
    .line 162
    invoke-direct {p0}, Ll/q0t0;-><init>()V

    .line 163
    .line 164
    .line 165
    iget-object p1, v2, Ll/r0t0;->f:Ll/vfs0;

    .line 166
    .line 167
    new-instance v0, Landroid/content/Intent;

    .line 168
    .line 169
    const-string v3, "android.intent.action.DIAL"

    .line 170
    .line 171
    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    const-string v3, "tel:"

    .line 175
    .line 176
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1, v0}, Ll/vfs0;->a(Landroid/content/Intent;)Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    invoke-virtual {p0, p1}, Ll/q0t0;->e(Z)Ll/q0t0;

    .line 188
    .line 189
    .line 190
    iget-object p1, v2, Ll/r0t0;->f:Ll/vfs0;

    .line 191
    .line 192
    new-instance v0, Landroid/content/Intent;

    .line 193
    .line 194
    const-string v3, "android.intent.action.VIEW"

    .line 195
    .line 196
    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    const-string v3, "sms:"

    .line 200
    .line 201
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1, v0}, Ll/vfs0;->a(Landroid/content/Intent;)Z

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    invoke-virtual {p0, p1}, Ll/q0t0;->c(Z)Ll/q0t0;

    .line 213
    .line 214
    .line 215
    iget-object p1, v2, Ll/r0t0;->f:Ll/vfs0;

    .line 216
    .line 217
    invoke-virtual {p1}, Ll/vfs0;->b()Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    invoke-virtual {p0, p1}, Ll/q0t0;->a(Z)Ll/q0t0;

    .line 222
    .line 223
    .line 224
    iget-object p1, v2, Ll/r0t0;->f:Ll/vfs0;

    .line 225
    .line 226
    invoke-virtual {p1}, Ll/vfs0;->c()Z

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    invoke-virtual {p0, p1}, Ll/q0t0;->d(Z)Ll/q0t0;

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0, p2}, Ll/q0t0;->b(Z)Ll/q0t0;

    .line 234
    .line 235
    .line 236
    invoke-static {p0}, Ll/q0t0;->h(Ll/q0t0;)Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    invoke-static {p0}, Ll/q0t0;->j(Ll/q0t0;)Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    invoke-static {p0}, Ll/q0t0;->f(Ll/q0t0;)Z

    .line 245
    .line 246
    .line 247
    move-result v3

    .line 248
    invoke-static {p0}, Ll/q0t0;->i(Ll/q0t0;)Z

    .line 249
    .line 250
    .line 251
    move-result v4

    .line 252
    invoke-static {p0}, Ll/q0t0;->g(Ll/q0t0;)Z

    .line 253
    .line 254
    .line 255
    move-result p0

    .line 256
    iget-object v5, v2, Ll/r0t0;->c:Ll/wit0;

    .line 257
    .line 258
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    .line 259
    .line 260
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 261
    .line 262
    .line 263
    const-string v7, "sms"

    .line 264
    .line 265
    invoke-virtual {v6, v7, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    const-string v6, "tel"

    .line 270
    .line 271
    invoke-virtual {p1, v6, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    const-string v0, "calendar"

    .line 276
    .line 277
    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    const-string v0, "storePicture"

    .line 282
    .line 283
    invoke-virtual {p1, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    const-string v0, "inlineVideo"

    .line 288
    .line 289
    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 290
    .line 291
    .line 292
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 293
    goto :goto_3

    .line 294
    :catch_0
    move-exception v0

    .line 295
    move-object p0, v0

    .line 296
    const-string p1, "Error occurred while obtaining the MRAID capabilities."

    .line 297
    .line 298
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 299
    .line 300
    .line 301
    const/4 p0, 0x0

    .line 302
    :goto_3
    const-string p1, "onDeviceFeaturesReceived"

    .line 303
    .line 304
    invoke-interface {v5, p1, p0}, Ll/kts0;->q(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 305
    .line 306
    .line 307
    iget-object p0, v2, Ll/r0t0;->c:Ll/wit0;

    .line 308
    .line 309
    const/4 p1, 0x2

    .line 310
    new-array v0, p1, [I

    .line 311
    .line 312
    invoke-interface {p0, v0}, Ll/wit0;->getLocationOnScreen([I)V

    .line 313
    .line 314
    .line 315
    iget-object p0, v2, Ll/r0t0;->d:Landroid/content/Context;

    .line 316
    .line 317
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 318
    .line 319
    .line 320
    move-result-object v3

    .line 321
    aget v1, v0, v1

    .line 322
    .line 323
    invoke-virtual {v3, p0, v1}, Ll/obt0;->e(Landroid/content/Context;I)I

    .line 324
    .line 325
    .line 326
    move-result p0

    .line 327
    iget-object v1, v2, Ll/r0t0;->d:Landroid/content/Context;

    .line 328
    .line 329
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 330
    .line 331
    .line 332
    move-result-object v3

    .line 333
    aget p2, v0, p2

    .line 334
    .line 335
    invoke-virtual {v3, v1, p2}, Ll/obt0;->e(Landroid/content/Context;I)I

    .line 336
    .line 337
    .line 338
    move-result p2

    .line 339
    invoke-virtual {v2, p0, p2}, Ll/r0t0;->h(II)V

    .line 340
    .line 341
    .line 342
    invoke-static {p1}, Ll/dct0;->j(I)Z

    .line 343
    .line 344
    .line 345
    move-result p0

    .line 346
    if-eqz p0, :cond_3

    .line 347
    .line 348
    const-string p0, "Dispatching Ready Event."

    .line 349
    .line 350
    invoke-static {p0}, Ll/dct0;->f(Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    :cond_3
    iget-object p0, v2, Ll/r0t0;->c:Ll/wit0;

    .line 354
    .line 355
    invoke-interface {p0}, Ll/wit0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 360
    .line 361
    invoke-virtual {v2, p0}, Ll/s0t0;->d(Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    return-void
.end method

.method public final h(II)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/r0t0;->d:Landroid/content/Context;

    .line 2
    .line 3
    instance-of v1, v0, Landroid/app/Activity;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 9
    .line 10
    .line 11
    check-cast v0, Landroid/app/Activity;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/b;->q(Landroid/app/Activity;)[I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    aget v0, v0, v2

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v2

    .line 21
    :goto_0
    iget-object v1, p0, Ll/r0t0;->c:Ll/wit0;

    .line 22
    .line 23
    invoke-interface {v1}, Ll/wit0;->zzO()Ll/xkt0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Ll/r0t0;->c:Ll/wit0;

    .line 30
    .line 31
    invoke-interface {v1}, Ll/wit0;->zzO()Ll/xkt0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/xkt0;->i()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_6

    .line 40
    .line 41
    :cond_1
    iget-object v1, p0, Ll/r0t0;->c:Ll/wit0;

    .line 42
    .line 43
    invoke-interface {v1}, Ll/wit0;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-interface {v1}, Ll/wit0;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    sget-object v4, Ll/sgs0;->R:Ll/dgs0;

    .line 52
    .line 53
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {v5, v4}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    check-cast v4, Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz v4, :cond_4

    .line 68
    .line 69
    if-nez v3, :cond_3

    .line 70
    .line 71
    iget-object v3, p0, Ll/r0t0;->c:Ll/wit0;

    .line 72
    .line 73
    invoke-interface {v3}, Ll/wit0;->zzO()Ll/xkt0;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    if-eqz v3, :cond_2

    .line 78
    .line 79
    iget-object v3, p0, Ll/r0t0;->c:Ll/wit0;

    .line 80
    .line 81
    invoke-interface {v3}, Ll/wit0;->zzO()Ll/xkt0;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    iget v3, v3, Ll/xkt0;->c:I

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_2
    move v3, v2

    .line 89
    :cond_3
    :goto_1
    if-nez v1, :cond_4

    .line 90
    .line 91
    iget-object v1, p0, Ll/r0t0;->c:Ll/wit0;

    .line 92
    .line 93
    invoke-interface {v1}, Ll/wit0;->zzO()Ll/xkt0;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    if-eqz v1, :cond_5

    .line 98
    .line 99
    iget-object v1, p0, Ll/r0t0;->c:Ll/wit0;

    .line 100
    .line 101
    invoke-interface {v1}, Ll/wit0;->zzO()Ll/xkt0;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iget v2, v1, Ll/xkt0;->b:I

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_4
    move v2, v1

    .line 109
    :cond_5
    :goto_2
    iget-object v1, p0, Ll/r0t0;->d:Landroid/content/Context;

    .line 110
    .line 111
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v4, v1, v3}, Ll/obt0;->e(Landroid/content/Context;I)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    iput v1, p0, Ll/r0t0;->n:I

    .line 120
    .line 121
    iget-object v1, p0, Ll/r0t0;->d:Landroid/content/Context;

    .line 122
    .line 123
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v3, v1, v2}, Ll/obt0;->e(Landroid/content/Context;I)I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    iput v1, p0, Ll/r0t0;->o:I

    .line 132
    .line 133
    :cond_6
    sub-int v0, p2, v0

    .line 134
    .line 135
    iget v1, p0, Ll/r0t0;->n:I

    .line 136
    .line 137
    iget v2, p0, Ll/r0t0;->o:I

    .line 138
    .line 139
    invoke-virtual {p0, p1, v0, v1, v2}, Ll/s0t0;->b(IIII)V

    .line 140
    .line 141
    .line 142
    iget-object p0, p0, Ll/r0t0;->c:Ll/wit0;

    .line 143
    .line 144
    invoke-interface {p0}, Ll/wit0;->zzN()Ll/nkt0;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-interface {p0, p1, p2}, Ll/nkt0;->zzC(II)V

    .line 149
    .line 150
    .line 151
    return-void
.end method
