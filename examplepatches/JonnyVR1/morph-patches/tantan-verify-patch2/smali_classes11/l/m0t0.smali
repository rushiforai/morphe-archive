.class public final Ll/m0t0;
.super Ll/s0t0;
.source "SourceFile"


# static fields
.field public static final u:Ljava/util/Set;


# instance fields
.field public c:Ljava/lang/String;

.field public d:Z

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public final k:Ljava/lang/Object;

.field public final l:Ll/wit0;

.field public final m:Landroid/app/Activity;

.field public n:Ll/xkt0;

.field public o:Landroid/widget/ImageView;

.field public p:Landroid/widget/LinearLayout;

.field public final q:Ll/t0t0;

.field public r:Landroid/widget/PopupWindow;

.field public s:Landroid/widget/RelativeLayout;

.field public t:Landroid/view/ViewGroup;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const-string v5, "bottom-right"

    .line 2
    .line 3
    const-string v6, "bottom-center"

    .line 4
    .line 5
    const-string v0, "top-left"

    .line 6
    .line 7
    const-string v1, "top-right"

    .line 8
    .line 9
    const-string v2, "top-center"

    .line 10
    .line 11
    const-string v3, "center"

    .line 12
    .line 13
    const-string v4, "bottom-left"

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/google/android/gms/common/util/CollectionUtils;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/m0t0;->u:Ljava/util/Set;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Ll/wit0;Ll/t0t0;)V
    .locals 2

    .line 1
    const-string v0, "resize"

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/s0t0;-><init>(Ll/wit0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "top-right"

    .line 7
    .line 8
    iput-object v0, p0, Ll/m0t0;->c:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/m0t0;->d:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Ll/m0t0;->e:I

    .line 15
    .line 16
    iput v0, p0, Ll/m0t0;->f:I

    .line 17
    .line 18
    const/4 v1, -0x1

    .line 19
    iput v1, p0, Ll/m0t0;->g:I

    .line 20
    .line 21
    iput v0, p0, Ll/m0t0;->h:I

    .line 22
    .line 23
    iput v0, p0, Ll/m0t0;->i:I

    .line 24
    .line 25
    iput v1, p0, Ll/m0t0;->j:I

    .line 26
    .line 27
    new-instance v0, Ljava/lang/Object;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/m0t0;->k:Ljava/lang/Object;

    .line 33
    .line 34
    iput-object p1, p0, Ll/m0t0;->l:Ll/wit0;

    .line 35
    .line 36
    invoke-interface {p1}, Ll/wit0;->zzi()Landroid/app/Activity;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Ll/m0t0;->m:Landroid/app/Activity;

    .line 41
    .line 42
    iput-object p2, p0, Ll/m0t0;->q:Ll/t0t0;

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public final h(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m0t0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/m0t0;->r:Landroid/widget/PopupWindow;

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    sget-object v1, Ll/sgs0;->pa:Ll/dgs0;

    .line 9
    .line 10
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    if-eq v1, v2, :cond_0

    .line 39
    .line 40
    sget-object v1, Ll/oct0;->e:Ll/xvw0;

    .line 41
    .line 42
    new-instance v2, Ll/k0t0;

    .line 43
    .line 44
    invoke-direct {v2, p0, p1}, Ll/k0t0;-><init>(Ll/m0t0;Z)V

    .line 45
    .line 46
    .line 47
    invoke-interface {v1, v2}, Ll/xvw0;->a(Ljava/lang/Runnable;)Ll/hpr;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    invoke-virtual {p0, p1}, Ll/m0t0;->n(Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    monitor-exit v0

    .line 57
    return-void

    .line 58
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method public final i(Ljava/util/Map;)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const-string v2, "Cannot show popup window: "

    .line 6
    .line 7
    iget-object v3, v1, Ll/m0t0;->k:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v3

    .line 10
    :try_start_0
    iget-object v4, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 11
    .line 12
    if-nez v4, :cond_0

    .line 13
    .line 14
    const-string v0, "Not an activity context. Cannot resize."

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    monitor-exit v3

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto/16 :goto_f

    .line 23
    .line 24
    :cond_0
    iget-object v4, v1, Ll/m0t0;->l:Ll/wit0;

    .line 25
    .line 26
    invoke-interface {v4}, Ll/wit0;->zzO()Ll/xkt0;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    if-nez v4, :cond_1

    .line 31
    .line 32
    const-string v0, "Webview is not yet available, size is not set."

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    monitor-exit v3

    .line 38
    return-void

    .line 39
    :cond_1
    iget-object v4, v1, Ll/m0t0;->l:Ll/wit0;

    .line 40
    .line 41
    invoke-interface {v4}, Ll/wit0;->zzO()Ll/xkt0;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v4}, Ll/xkt0;->i()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_2

    .line 50
    .line 51
    const-string v0, "Is interstitial. Cannot resize an interstitial."

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    monitor-exit v3

    .line 57
    return-void

    .line 58
    :cond_2
    iget-object v4, v1, Ll/m0t0;->l:Ll/wit0;

    .line 59
    .line 60
    invoke-interface {v4}, Ll/wit0;->a0()Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    if-eqz v4, :cond_3

    .line 65
    .line 66
    const-string v0, "Cannot resize an expanded banner."

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    monitor-exit v3

    .line 72
    return-void

    .line 73
    :cond_3
    const-string v4, "width"

    .line 74
    .line 75
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    check-cast v4, Ljava/lang/CharSequence;

    .line 80
    .line 81
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-nez v4, :cond_4

    .line 86
    .line 87
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 88
    .line 89
    .line 90
    const-string v4, "width"

    .line 91
    .line 92
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    check-cast v4, Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v4}, Lcom/google/android/gms/ads/internal/util/b;->n(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    iput v4, v1, Ll/m0t0;->j:I

    .line 103
    .line 104
    :cond_4
    const-string v4, "height"

    .line 105
    .line 106
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    check-cast v4, Ljava/lang/CharSequence;

    .line 111
    .line 112
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    if-nez v4, :cond_5

    .line 117
    .line 118
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 119
    .line 120
    .line 121
    const-string v4, "height"

    .line 122
    .line 123
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    check-cast v4, Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {v4}, Lcom/google/android/gms/ads/internal/util/b;->n(Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    iput v4, v1, Ll/m0t0;->g:I

    .line 134
    .line 135
    :cond_5
    const-string v4, "offsetX"

    .line 136
    .line 137
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    check-cast v4, Ljava/lang/CharSequence;

    .line 142
    .line 143
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    if-nez v4, :cond_6

    .line 148
    .line 149
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 150
    .line 151
    .line 152
    const-string v4, "offsetX"

    .line 153
    .line 154
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    check-cast v4, Ljava/lang/String;

    .line 159
    .line 160
    invoke-static {v4}, Lcom/google/android/gms/ads/internal/util/b;->n(Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    iput v4, v1, Ll/m0t0;->h:I

    .line 165
    .line 166
    :cond_6
    const-string v4, "offsetY"

    .line 167
    .line 168
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    check-cast v4, Ljava/lang/CharSequence;

    .line 173
    .line 174
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    if-nez v4, :cond_7

    .line 179
    .line 180
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 181
    .line 182
    .line 183
    const-string v4, "offsetY"

    .line 184
    .line 185
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    check-cast v4, Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {v4}, Lcom/google/android/gms/ads/internal/util/b;->n(Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result v4

    .line 195
    iput v4, v1, Ll/m0t0;->i:I

    .line 196
    .line 197
    :cond_7
    const-string v4, "allowOffscreen"

    .line 198
    .line 199
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    check-cast v4, Ljava/lang/CharSequence;

    .line 204
    .line 205
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    if-nez v4, :cond_8

    .line 210
    .line 211
    const-string v4, "allowOffscreen"

    .line 212
    .line 213
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v4

    .line 217
    check-cast v4, Ljava/lang/String;

    .line 218
    .line 219
    invoke-static {v4}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    iput-boolean v4, v1, Ll/m0t0;->d:Z

    .line 224
    .line 225
    :cond_8
    const-string v4, "customClosePosition"

    .line 226
    .line 227
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    check-cast v0, Ljava/lang/String;

    .line 232
    .line 233
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 234
    .line 235
    .line 236
    move-result v4

    .line 237
    if-nez v4, :cond_9

    .line 238
    .line 239
    iput-object v0, v1, Ll/m0t0;->c:Ljava/lang/String;

    .line 240
    .line 241
    :cond_9
    iget v0, v1, Ll/m0t0;->j:I

    .line 242
    .line 243
    if-ltz v0, :cond_1f

    .line 244
    .line 245
    iget v0, v1, Ll/m0t0;->g:I

    .line 246
    .line 247
    if-ltz v0, :cond_1f

    .line 248
    .line 249
    iget-object v0, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 250
    .line 251
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    if-eqz v0, :cond_1e

    .line 256
    .line 257
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 258
    .line 259
    .line 260
    move-result-object v4

    .line 261
    if-nez v4, :cond_a

    .line 262
    .line 263
    goto/16 :goto_e

    .line 264
    .line 265
    :cond_a
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 266
    .line 267
    .line 268
    iget-object v4, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 269
    .line 270
    invoke-static {v4}, Lcom/google/android/gms/ads/internal/util/b;->u(Landroid/app/Activity;)[I

    .line 271
    .line 272
    .line 273
    move-result-object v4

    .line 274
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 275
    .line 276
    .line 277
    iget-object v5, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 278
    .line 279
    invoke-static {v5}, Lcom/google/android/gms/ads/internal/util/b;->q(Landroid/app/Activity;)[I

    .line 280
    .line 281
    .line 282
    move-result-object v5

    .line 283
    const/4 v6, 0x0

    .line 284
    aget v7, v4, v6

    .line 285
    .line 286
    const/4 v8, 0x1

    .line 287
    aget v4, v4, v8

    .line 288
    .line 289
    iget v9, v1, Ll/m0t0;->j:I

    .line 290
    .line 291
    const/16 v10, 0x32

    .line 292
    .line 293
    const/4 v11, 0x0

    .line 294
    if-lt v9, v10, :cond_16

    .line 295
    .line 296
    if-le v9, v7, :cond_b

    .line 297
    .line 298
    goto/16 :goto_9

    .line 299
    .line 300
    :cond_b
    iget v12, v1, Ll/m0t0;->g:I

    .line 301
    .line 302
    if-lt v12, v10, :cond_15

    .line 303
    .line 304
    if-le v12, v4, :cond_c

    .line 305
    .line 306
    goto/16 :goto_8

    .line 307
    .line 308
    :cond_c
    if-ne v12, v4, :cond_d

    .line 309
    .line 310
    if-ne v9, v7, :cond_d

    .line 311
    .line 312
    const-string v4, "Cannot resize to a full-screen ad."

    .line 313
    .line 314
    invoke-static {v4}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    goto/16 :goto_a

    .line 318
    .line 319
    :cond_d
    iget-boolean v4, v1, Ll/m0t0;->d:Z

    .line 320
    .line 321
    if-eqz v4, :cond_10

    .line 322
    .line 323
    iget-object v4, v1, Ll/m0t0;->c:Ljava/lang/String;

    .line 324
    .line 325
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 326
    .line 327
    .line 328
    move-result v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 329
    sparse-switch v13, :sswitch_data_0

    .line 330
    .line 331
    .line 332
    goto/16 :goto_3

    .line 333
    .line 334
    :sswitch_0
    const-string v12, "top-center"

    .line 335
    .line 336
    invoke-virtual {v4, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 337
    .line 338
    .line 339
    move-result v4

    .line 340
    if-eqz v4, :cond_e

    .line 341
    .line 342
    :try_start_1
    iget v4, v1, Ll/m0t0;->e:I

    .line 343
    .line 344
    iget v12, v1, Ll/m0t0;->h:I

    .line 345
    .line 346
    shr-int/2addr v9, v8

    .line 347
    add-int/2addr v4, v12

    .line 348
    add-int/2addr v4, v9

    .line 349
    add-int/lit8 v4, v4, -0x19

    .line 350
    .line 351
    iget v9, v1, Ll/m0t0;->f:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 352
    .line 353
    goto/16 :goto_4

    .line 354
    .line 355
    :goto_0
    add-int/2addr v9, v12

    .line 356
    goto/16 :goto_5

    .line 357
    .line 358
    :sswitch_1
    const-string v13, "bottom-center"

    .line 359
    .line 360
    invoke-virtual {v4, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 361
    .line 362
    .line 363
    move-result v4

    .line 364
    if-eqz v4, :cond_e

    .line 365
    .line 366
    :try_start_2
    iget v4, v1, Ll/m0t0;->e:I

    .line 367
    .line 368
    iget v13, v1, Ll/m0t0;->h:I

    .line 369
    .line 370
    shr-int/2addr v9, v8

    .line 371
    add-int/2addr v4, v13

    .line 372
    add-int/2addr v4, v9

    .line 373
    add-int/lit8 v4, v4, -0x19

    .line 374
    .line 375
    iget v9, v1, Ll/m0t0;->f:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 376
    .line 377
    goto :goto_2

    .line 378
    :goto_1
    add-int/2addr v9, v13

    .line 379
    add-int/2addr v9, v12

    .line 380
    add-int/lit8 v9, v9, -0x32

    .line 381
    .line 382
    goto :goto_5

    .line 383
    :sswitch_2
    const-string v13, "bottom-right"

    .line 384
    .line 385
    invoke-virtual {v4, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 386
    .line 387
    .line 388
    move-result v4

    .line 389
    if-eqz v4, :cond_e

    .line 390
    .line 391
    :try_start_3
    iget v4, v1, Ll/m0t0;->e:I

    .line 392
    .line 393
    iget v13, v1, Ll/m0t0;->h:I

    .line 394
    .line 395
    add-int/2addr v4, v13

    .line 396
    add-int/2addr v4, v9

    .line 397
    add-int/lit8 v4, v4, -0x32

    .line 398
    .line 399
    iget v9, v1, Ll/m0t0;->f:I

    .line 400
    .line 401
    :goto_2
    iget v13, v1, Ll/m0t0;->i:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 402
    .line 403
    goto :goto_1

    .line 404
    :sswitch_3
    const-string v13, "bottom-left"

    .line 405
    .line 406
    invoke-virtual {v4, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 407
    .line 408
    .line 409
    move-result v4

    .line 410
    if-eqz v4, :cond_e

    .line 411
    .line 412
    :try_start_4
    iget v4, v1, Ll/m0t0;->e:I

    .line 413
    .line 414
    iget v9, v1, Ll/m0t0;->h:I

    .line 415
    .line 416
    add-int/2addr v4, v9

    .line 417
    iget v9, v1, Ll/m0t0;->f:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 418
    .line 419
    goto :goto_2

    .line 420
    :sswitch_4
    const-string v12, "top-left"

    .line 421
    .line 422
    invoke-virtual {v4, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 423
    .line 424
    .line 425
    move-result v4

    .line 426
    if-eqz v4, :cond_e

    .line 427
    .line 428
    :try_start_5
    iget v4, v1, Ll/m0t0;->e:I

    .line 429
    .line 430
    iget v9, v1, Ll/m0t0;->h:I

    .line 431
    .line 432
    add-int/2addr v4, v9

    .line 433
    iget v9, v1, Ll/m0t0;->f:I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 434
    .line 435
    goto :goto_4

    .line 436
    :sswitch_5
    const-string v13, "center"

    .line 437
    .line 438
    invoke-virtual {v4, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 439
    .line 440
    .line 441
    move-result v4

    .line 442
    if-eqz v4, :cond_e

    .line 443
    .line 444
    :try_start_6
    iget v4, v1, Ll/m0t0;->e:I

    .line 445
    .line 446
    iget v13, v1, Ll/m0t0;->h:I

    .line 447
    .line 448
    shr-int/2addr v9, v8

    .line 449
    add-int/2addr v4, v13

    .line 450
    add-int/2addr v4, v9

    .line 451
    add-int/lit8 v4, v4, -0x19

    .line 452
    .line 453
    iget v9, v1, Ll/m0t0;->f:I

    .line 454
    .line 455
    iget v13, v1, Ll/m0t0;->i:I

    .line 456
    .line 457
    add-int/2addr v9, v13

    .line 458
    shr-int/2addr v12, v8

    .line 459
    add-int/2addr v9, v12

    .line 460
    add-int/lit8 v9, v9, -0x19

    .line 461
    .line 462
    goto :goto_5

    .line 463
    :cond_e
    :goto_3
    iget v4, v1, Ll/m0t0;->e:I

    .line 464
    .line 465
    iget v12, v1, Ll/m0t0;->h:I

    .line 466
    .line 467
    add-int/2addr v4, v12

    .line 468
    add-int/2addr v4, v9

    .line 469
    add-int/lit8 v4, v4, -0x32

    .line 470
    .line 471
    iget v9, v1, Ll/m0t0;->f:I

    .line 472
    .line 473
    :goto_4
    iget v12, v1, Ll/m0t0;->i:I

    .line 474
    .line 475
    goto :goto_0

    .line 476
    :goto_5
    if-ltz v4, :cond_17

    .line 477
    .line 478
    add-int/2addr v4, v10

    .line 479
    if-gt v4, v7, :cond_17

    .line 480
    .line 481
    aget v4, v5, v6

    .line 482
    .line 483
    if-lt v9, v4, :cond_17

    .line 484
    .line 485
    add-int/2addr v9, v10

    .line 486
    aget v4, v5, v8

    .line 487
    .line 488
    if-le v9, v4, :cond_f

    .line 489
    .line 490
    goto :goto_a

    .line 491
    :cond_f
    iget v4, v1, Ll/m0t0;->e:I

    .line 492
    .line 493
    iget v5, v1, Ll/m0t0;->h:I

    .line 494
    .line 495
    add-int/2addr v4, v5

    .line 496
    iget v5, v1, Ll/m0t0;->f:I

    .line 497
    .line 498
    iget v7, v1, Ll/m0t0;->i:I

    .line 499
    .line 500
    add-int/2addr v5, v7

    .line 501
    filled-new-array {v4, v5}, [I

    .line 502
    .line 503
    .line 504
    move-result-object v11

    .line 505
    goto :goto_a

    .line 506
    :cond_10
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 507
    .line 508
    .line 509
    iget-object v4, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 510
    .line 511
    invoke-static {v4}, Lcom/google/android/gms/ads/internal/util/b;->u(Landroid/app/Activity;)[I

    .line 512
    .line 513
    .line 514
    move-result-object v4

    .line 515
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 516
    .line 517
    .line 518
    iget-object v5, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 519
    .line 520
    invoke-static {v5}, Lcom/google/android/gms/ads/internal/util/b;->q(Landroid/app/Activity;)[I

    .line 521
    .line 522
    .line 523
    move-result-object v5

    .line 524
    aget v4, v4, v6

    .line 525
    .line 526
    iget v7, v1, Ll/m0t0;->e:I

    .line 527
    .line 528
    iget v9, v1, Ll/m0t0;->h:I

    .line 529
    .line 530
    add-int/2addr v7, v9

    .line 531
    iget v9, v1, Ll/m0t0;->f:I

    .line 532
    .line 533
    iget v11, v1, Ll/m0t0;->i:I

    .line 534
    .line 535
    add-int/2addr v9, v11

    .line 536
    if-gez v7, :cond_11

    .line 537
    .line 538
    move v7, v6

    .line 539
    goto :goto_6

    .line 540
    :cond_11
    iget v11, v1, Ll/m0t0;->j:I

    .line 541
    .line 542
    add-int v12, v7, v11

    .line 543
    .line 544
    if-le v12, v4, :cond_12

    .line 545
    .line 546
    sub-int v7, v4, v11

    .line 547
    .line 548
    :cond_12
    :goto_6
    aget v4, v5, v6

    .line 549
    .line 550
    if-ge v9, v4, :cond_13

    .line 551
    .line 552
    move v9, v4

    .line 553
    goto :goto_7

    .line 554
    :cond_13
    iget v4, v1, Ll/m0t0;->g:I

    .line 555
    .line 556
    add-int v11, v9, v4

    .line 557
    .line 558
    aget v5, v5, v8

    .line 559
    .line 560
    if-le v11, v5, :cond_14

    .line 561
    .line 562
    sub-int v9, v5, v4

    .line 563
    .line 564
    :cond_14
    :goto_7
    filled-new-array {v7, v9}, [I

    .line 565
    .line 566
    .line 567
    move-result-object v11

    .line 568
    goto :goto_a

    .line 569
    :cond_15
    :goto_8
    const-string v4, "Height is too small or too large."

    .line 570
    .line 571
    invoke-static {v4}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 572
    .line 573
    .line 574
    goto :goto_a

    .line 575
    :cond_16
    :goto_9
    const-string v4, "Width is too small or too large."

    .line 576
    .line 577
    invoke-static {v4}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 578
    .line 579
    .line 580
    :cond_17
    :goto_a
    if-nez v11, :cond_18

    .line 581
    .line 582
    const-string v0, "Resize location out of screen or close button is not visible."

    .line 583
    .line 584
    invoke-virtual {v1, v0}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 585
    .line 586
    .line 587
    monitor-exit v3

    .line 588
    return-void

    .line 589
    :cond_18
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 590
    .line 591
    .line 592
    iget-object v4, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 593
    .line 594
    iget v5, v1, Ll/m0t0;->j:I

    .line 595
    .line 596
    invoke-static {v4, v5}, Ll/obt0;->z(Landroid/content/Context;I)I

    .line 597
    .line 598
    .line 599
    move-result v4

    .line 600
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 601
    .line 602
    .line 603
    iget-object v5, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 604
    .line 605
    iget v7, v1, Ll/m0t0;->g:I

    .line 606
    .line 607
    invoke-static {v5, v7}, Ll/obt0;->z(Landroid/content/Context;I)I

    .line 608
    .line 609
    .line 610
    move-result v5

    .line 611
    iget-object v7, v1, Ll/m0t0;->l:Ll/wit0;

    .line 612
    .line 613
    check-cast v7, Landroid/view/View;

    .line 614
    .line 615
    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 616
    .line 617
    .line 618
    move-result-object v7

    .line 619
    if-eqz v7, :cond_1d

    .line 620
    .line 621
    instance-of v9, v7, Landroid/view/ViewGroup;

    .line 622
    .line 623
    if-eqz v9, :cond_1d

    .line 624
    .line 625
    check-cast v7, Landroid/view/ViewGroup;

    .line 626
    .line 627
    iget-object v9, v1, Ll/m0t0;->l:Ll/wit0;

    .line 628
    .line 629
    check-cast v9, Landroid/view/View;

    .line 630
    .line 631
    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 632
    .line 633
    .line 634
    iget-object v9, v1, Ll/m0t0;->r:Landroid/widget/PopupWindow;

    .line 635
    .line 636
    if-nez v9, :cond_19

    .line 637
    .line 638
    iput-object v7, v1, Ll/m0t0;->t:Landroid/view/ViewGroup;

    .line 639
    .line 640
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 641
    .line 642
    .line 643
    iget-object v7, v1, Ll/m0t0;->l:Ll/wit0;

    .line 644
    .line 645
    move-object v9, v7

    .line 646
    check-cast v9, Landroid/view/View;

    .line 647
    .line 648
    invoke-virtual {v9, v8}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 649
    .line 650
    .line 651
    move-object v9, v7

    .line 652
    check-cast v9, Landroid/view/View;

    .line 653
    .line 654
    invoke-virtual {v9}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    .line 655
    .line 656
    .line 657
    move-result-object v9

    .line 658
    invoke-static {v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 659
    .line 660
    .line 661
    move-result-object v9

    .line 662
    check-cast v7, Landroid/view/View;

    .line 663
    .line 664
    invoke-virtual {v7, v6}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 665
    .line 666
    .line 667
    new-instance v7, Landroid/widget/ImageView;

    .line 668
    .line 669
    iget-object v12, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 670
    .line 671
    invoke-direct {v7, v12}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 672
    .line 673
    .line 674
    iput-object v7, v1, Ll/m0t0;->o:Landroid/widget/ImageView;

    .line 675
    .line 676
    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 677
    .line 678
    .line 679
    iget-object v7, v1, Ll/m0t0;->l:Ll/wit0;

    .line 680
    .line 681
    invoke-interface {v7}, Ll/wit0;->zzO()Ll/xkt0;

    .line 682
    .line 683
    .line 684
    move-result-object v7

    .line 685
    iput-object v7, v1, Ll/m0t0;->n:Ll/xkt0;

    .line 686
    .line 687
    iget-object v7, v1, Ll/m0t0;->t:Landroid/view/ViewGroup;

    .line 688
    .line 689
    iget-object v9, v1, Ll/m0t0;->o:Landroid/widget/ImageView;

    .line 690
    .line 691
    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 692
    .line 693
    .line 694
    goto :goto_b

    .line 695
    :cond_19
    invoke-virtual {v9}, Landroid/widget/PopupWindow;->dismiss()V

    .line 696
    .line 697
    .line 698
    :goto_b
    new-instance v7, Landroid/widget/RelativeLayout;

    .line 699
    .line 700
    iget-object v9, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 701
    .line 702
    invoke-direct {v7, v9}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 703
    .line 704
    .line 705
    iput-object v7, v1, Ll/m0t0;->s:Landroid/widget/RelativeLayout;

    .line 706
    .line 707
    invoke-virtual {v7, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 708
    .line 709
    .line 710
    iget-object v7, v1, Ll/m0t0;->s:Landroid/widget/RelativeLayout;

    .line 711
    .line 712
    new-instance v9, Landroid/view/ViewGroup$LayoutParams;

    .line 713
    .line 714
    invoke-direct {v9, v4, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 715
    .line 716
    .line 717
    invoke-virtual {v7, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 718
    .line 719
    .line 720
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 721
    .line 722
    .line 723
    iget-object v7, v1, Ll/m0t0;->s:Landroid/widget/RelativeLayout;

    .line 724
    .line 725
    new-instance v9, Landroid/widget/PopupWindow;

    .line 726
    .line 727
    invoke-direct {v9, v7, v4, v5, v6}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 728
    .line 729
    .line 730
    iput-object v9, v1, Ll/m0t0;->r:Landroid/widget/PopupWindow;

    .line 731
    .line 732
    invoke-virtual {v9, v6}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 733
    .line 734
    .line 735
    iget-object v7, v1, Ll/m0t0;->r:Landroid/widget/PopupWindow;

    .line 736
    .line 737
    invoke-virtual {v7, v8}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 738
    .line 739
    .line 740
    iget-object v7, v1, Ll/m0t0;->r:Landroid/widget/PopupWindow;

    .line 741
    .line 742
    iget-boolean v9, v1, Ll/m0t0;->d:Z

    .line 743
    .line 744
    xor-int/2addr v9, v8

    .line 745
    invoke-virtual {v7, v9}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    .line 746
    .line 747
    .line 748
    iget-object v7, v1, Ll/m0t0;->s:Landroid/widget/RelativeLayout;

    .line 749
    .line 750
    iget-object v9, v1, Ll/m0t0;->l:Ll/wit0;

    .line 751
    .line 752
    check-cast v9, Landroid/view/View;

    .line 753
    .line 754
    const/4 v12, -0x1

    .line 755
    invoke-virtual {v7, v9, v12, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 756
    .line 757
    .line 758
    new-instance v7, Landroid/widget/LinearLayout;

    .line 759
    .line 760
    iget-object v9, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 761
    .line 762
    invoke-direct {v7, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 763
    .line 764
    .line 765
    iput-object v7, v1, Ll/m0t0;->p:Landroid/widget/LinearLayout;

    .line 766
    .line 767
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    .line 768
    .line 769
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 770
    .line 771
    .line 772
    iget-object v9, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 773
    .line 774
    invoke-static {v9, v10}, Ll/obt0;->z(Landroid/content/Context;I)I

    .line 775
    .line 776
    .line 777
    move-result v9

    .line 778
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 779
    .line 780
    .line 781
    iget-object v12, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 782
    .line 783
    invoke-static {v12, v10}, Ll/obt0;->z(Landroid/content/Context;I)I

    .line 784
    .line 785
    .line 786
    move-result v10

    .line 787
    invoke-direct {v7, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 788
    .line 789
    .line 790
    iget-object v9, v1, Ll/m0t0;->c:Ljava/lang/String;

    .line 791
    .line 792
    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    .line 793
    .line 794
    .line 795
    move-result v10
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 796
    const/16 v12, 0x9

    .line 797
    .line 798
    const/16 v13, 0xe

    .line 799
    .line 800
    const/16 v14, 0xb

    .line 801
    .line 802
    const/16 v15, 0xc

    .line 803
    .line 804
    move/from16 p1, v8

    .line 805
    .line 806
    const/16 v8, 0xa

    .line 807
    .line 808
    sparse-switch v10, :sswitch_data_1

    .line 809
    .line 810
    .line 811
    goto :goto_c

    .line 812
    :sswitch_6
    const-string v10, "top-center"

    .line 813
    .line 814
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 815
    .line 816
    .line 817
    move-result v9

    .line 818
    if-eqz v9, :cond_1a

    .line 819
    .line 820
    :try_start_7
    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 821
    .line 822
    .line 823
    invoke-virtual {v7, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 824
    .line 825
    .line 826
    goto :goto_d

    .line 827
    :sswitch_7
    const-string v10, "bottom-center"

    .line 828
    .line 829
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 830
    .line 831
    .line 832
    move-result v9

    .line 833
    if-eqz v9, :cond_1a

    .line 834
    .line 835
    :try_start_8
    invoke-virtual {v7, v15}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 836
    .line 837
    .line 838
    invoke-virtual {v7, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 839
    .line 840
    .line 841
    goto :goto_d

    .line 842
    :sswitch_8
    const-string v10, "bottom-right"

    .line 843
    .line 844
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 845
    .line 846
    .line 847
    move-result v9

    .line 848
    if-eqz v9, :cond_1a

    .line 849
    .line 850
    :try_start_9
    invoke-virtual {v7, v15}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 851
    .line 852
    .line 853
    invoke-virtual {v7, v14}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 854
    .line 855
    .line 856
    goto :goto_d

    .line 857
    :sswitch_9
    const-string v10, "bottom-left"

    .line 858
    .line 859
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 860
    .line 861
    .line 862
    move-result v9

    .line 863
    if-eqz v9, :cond_1a

    .line 864
    .line 865
    :try_start_a
    invoke-virtual {v7, v15}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 866
    .line 867
    .line 868
    invoke-virtual {v7, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 869
    .line 870
    .line 871
    goto :goto_d

    .line 872
    :sswitch_a
    const-string v10, "top-left"

    .line 873
    .line 874
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 875
    .line 876
    .line 877
    move-result v9

    .line 878
    if-eqz v9, :cond_1a

    .line 879
    .line 880
    :try_start_b
    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 881
    .line 882
    .line 883
    invoke-virtual {v7, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 884
    .line 885
    .line 886
    goto :goto_d

    .line 887
    :sswitch_b
    const-string v10, "center"

    .line 888
    .line 889
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 890
    .line 891
    .line 892
    move-result v9

    .line 893
    if-eqz v9, :cond_1a

    .line 894
    .line 895
    const/16 v8, 0xd

    .line 896
    .line 897
    :try_start_c
    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 898
    .line 899
    .line 900
    goto :goto_d

    .line 901
    :cond_1a
    :goto_c
    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 902
    .line 903
    .line 904
    invoke-virtual {v7, v14}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 905
    .line 906
    .line 907
    :goto_d
    iget-object v8, v1, Ll/m0t0;->p:Landroid/widget/LinearLayout;

    .line 908
    .line 909
    new-instance v9, Ll/l0t0;

    .line 910
    .line 911
    invoke-direct {v9, v1}, Ll/l0t0;-><init>(Ll/m0t0;)V

    .line 912
    .line 913
    .line 914
    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 915
    .line 916
    .line 917
    iget-object v8, v1, Ll/m0t0;->p:Landroid/widget/LinearLayout;

    .line 918
    .line 919
    const-string v9, "Close button"

    .line 920
    .line 921
    invoke-virtual {v8, v9}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 922
    .line 923
    .line 924
    iget-object v8, v1, Ll/m0t0;->s:Landroid/widget/RelativeLayout;

    .line 925
    .line 926
    iget-object v9, v1, Ll/m0t0;->p:Landroid/widget/LinearLayout;

    .line 927
    .line 928
    invoke-virtual {v8, v9, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 929
    .line 930
    .line 931
    :try_start_d
    iget-object v7, v1, Ll/m0t0;->r:Landroid/widget/PopupWindow;

    .line 932
    .line 933
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 934
    .line 935
    .line 936
    move-result-object v0

    .line 937
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 938
    .line 939
    .line 940
    iget-object v8, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 941
    .line 942
    aget v9, v11, v6

    .line 943
    .line 944
    invoke-static {v8, v9}, Ll/obt0;->z(Landroid/content/Context;I)I

    .line 945
    .line 946
    .line 947
    move-result v8

    .line 948
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 949
    .line 950
    .line 951
    iget-object v9, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 952
    .line 953
    aget v10, v11, p1

    .line 954
    .line 955
    invoke-static {v9, v10}, Ll/obt0;->z(Landroid/content/Context;I)I

    .line 956
    .line 957
    .line 958
    move-result v9

    .line 959
    invoke-virtual {v7, v0, v6, v8, v9}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
    :try_end_d
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 960
    .line 961
    .line 962
    :try_start_e
    aget v0, v11, v6

    .line 963
    .line 964
    aget v2, v11, p1

    .line 965
    .line 966
    iget-object v7, v1, Ll/m0t0;->q:Ll/t0t0;

    .line 967
    .line 968
    if-eqz v7, :cond_1b

    .line 969
    .line 970
    iget v8, v1, Ll/m0t0;->j:I

    .line 971
    .line 972
    iget v9, v1, Ll/m0t0;->g:I

    .line 973
    .line 974
    invoke-interface {v7, v0, v2, v8, v9}, Ll/t0t0;->a(IIII)V

    .line 975
    .line 976
    .line 977
    :cond_1b
    iget-object v0, v1, Ll/m0t0;->l:Ll/wit0;

    .line 978
    .line 979
    invoke-static {v4, v5}, Ll/xkt0;->b(II)Ll/xkt0;

    .line 980
    .line 981
    .line 982
    move-result-object v2

    .line 983
    invoke-interface {v0, v2}, Ll/wit0;->G(Ll/xkt0;)V

    .line 984
    .line 985
    .line 986
    aget v0, v11, v6

    .line 987
    .line 988
    aget v2, v11, p1

    .line 989
    .line 990
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 991
    .line 992
    .line 993
    iget-object v4, v1, Ll/m0t0;->m:Landroid/app/Activity;

    .line 994
    .line 995
    invoke-static {v4}, Lcom/google/android/gms/ads/internal/util/b;->q(Landroid/app/Activity;)[I

    .line 996
    .line 997
    .line 998
    move-result-object v4

    .line 999
    aget v4, v4, v6

    .line 1000
    .line 1001
    sub-int/2addr v2, v4

    .line 1002
    iget v4, v1, Ll/m0t0;->j:I

    .line 1003
    .line 1004
    iget v5, v1, Ll/m0t0;->g:I

    .line 1005
    .line 1006
    invoke-virtual {v1, v0, v2, v4, v5}, Ll/s0t0;->f(IIII)V

    .line 1007
    .line 1008
    .line 1009
    const-string v0, "resized"

    .line 1010
    .line 1011
    invoke-virtual {v1, v0}, Ll/s0t0;->g(Ljava/lang/String;)V

    .line 1012
    .line 1013
    .line 1014
    monitor-exit v3

    .line 1015
    return-void

    .line 1016
    :catch_0
    move-exception v0

    .line 1017
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v0

    .line 1021
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1022
    .line 1023
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1024
    .line 1025
    .line 1026
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1027
    .line 1028
    .line 1029
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v0

    .line 1033
    invoke-virtual {v1, v0}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 1034
    .line 1035
    .line 1036
    iget-object v0, v1, Ll/m0t0;->s:Landroid/widget/RelativeLayout;

    .line 1037
    .line 1038
    iget-object v2, v1, Ll/m0t0;->l:Ll/wit0;

    .line 1039
    .line 1040
    check-cast v2, Landroid/view/View;

    .line 1041
    .line 1042
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1043
    .line 1044
    .line 1045
    iget-object v0, v1, Ll/m0t0;->t:Landroid/view/ViewGroup;

    .line 1046
    .line 1047
    if-eqz v0, :cond_1c

    .line 1048
    .line 1049
    iget-object v2, v1, Ll/m0t0;->o:Landroid/widget/ImageView;

    .line 1050
    .line 1051
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1052
    .line 1053
    .line 1054
    iget-object v0, v1, Ll/m0t0;->t:Landroid/view/ViewGroup;

    .line 1055
    .line 1056
    iget-object v2, v1, Ll/m0t0;->l:Ll/wit0;

    .line 1057
    .line 1058
    check-cast v2, Landroid/view/View;

    .line 1059
    .line 1060
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1061
    .line 1062
    .line 1063
    iget-object v0, v1, Ll/m0t0;->l:Ll/wit0;

    .line 1064
    .line 1065
    iget-object v1, v1, Ll/m0t0;->n:Ll/xkt0;

    .line 1066
    .line 1067
    invoke-interface {v0, v1}, Ll/wit0;->G(Ll/xkt0;)V

    .line 1068
    .line 1069
    .line 1070
    :cond_1c
    monitor-exit v3

    .line 1071
    return-void

    .line 1072
    :cond_1d
    const-string v0, "Webview is detached, probably in the middle of a resize or expand."

    .line 1073
    .line 1074
    invoke-virtual {v1, v0}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 1075
    .line 1076
    .line 1077
    monitor-exit v3

    .line 1078
    return-void

    .line 1079
    :cond_1e
    :goto_e
    const-string v0, "Activity context is not ready, cannot get window or decor view."

    .line 1080
    .line 1081
    invoke-virtual {v1, v0}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 1082
    .line 1083
    .line 1084
    monitor-exit v3

    .line 1085
    return-void

    .line 1086
    :cond_1f
    const-string v0, "Invalid width and height options. Cannot resize."

    .line 1087
    .line 1088
    invoke-virtual {v1, v0}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 1089
    .line 1090
    .line 1091
    monitor-exit v3

    .line 1092
    return-void

    .line 1093
    :goto_f
    monitor-exit v3
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .line 1094
    throw v0

    .line 1095
    :sswitch_data_0
    .sparse-switch
        -0x514d33ab -> :sswitch_5
        -0x3c587281 -> :sswitch_4
        -0x27103597 -> :sswitch_3
        0x455fe3fa -> :sswitch_2
        0x4ccee637 -> :sswitch_1
        0x68a23bcd -> :sswitch_0
    .end sparse-switch

    .line 1096
    .line 1097
    .line 1098
    .line 1099
    .line 1100
    .line 1101
    .line 1102
    .line 1103
    .line 1104
    .line 1105
    .line 1106
    .line 1107
    .line 1108
    .line 1109
    .line 1110
    .line 1111
    .line 1112
    .line 1113
    .line 1114
    .line 1115
    .line 1116
    .line 1117
    .line 1118
    .line 1119
    .line 1120
    .line 1121
    :sswitch_data_1
    .sparse-switch
        -0x514d33ab -> :sswitch_b
        -0x3c587281 -> :sswitch_a
        -0x27103597 -> :sswitch_9
        0x455fe3fa -> :sswitch_8
        0x4ccee637 -> :sswitch_7
        0x68a23bcd -> :sswitch_6
    .end sparse-switch
.end method

.method public final synthetic j(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m0t0;->n(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final k(IIZ)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/m0t0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p3

    .line 4
    :try_start_0
    iput p1, p0, Ll/m0t0;->e:I

    .line 5
    .line 6
    iput p2, p0, Ll/m0t0;->f:I

    .line 7
    .line 8
    monitor-exit p3

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p0
.end method

.method public final l(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/m0t0;->e:I

    .line 2
    .line 3
    iput p2, p0, Ll/m0t0;->f:I

    .line 4
    .line 5
    return-void
.end method

.method public final m()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m0t0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/m0t0;->r:Landroid/widget/PopupWindow;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    monitor-exit v0

    .line 12
    return p0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public final n(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m0t0;->r:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/m0t0;->s:Landroid/widget/RelativeLayout;

    .line 7
    .line 8
    iget-object v1, p0, Ll/m0t0;->l:Ll/wit0;

    .line 9
    .line 10
    check-cast v1, Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/m0t0;->t:Landroid/view/ViewGroup;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/m0t0;->o:Landroid/widget/ImageView;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/m0t0;->t:Landroid/view/ViewGroup;

    .line 25
    .line 26
    iget-object v1, p0, Ll/m0t0;->l:Ll/wit0;

    .line 27
    .line 28
    check-cast v1, Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/m0t0;->l:Ll/wit0;

    .line 34
    .line 35
    iget-object v1, p0, Ll/m0t0;->n:Ll/xkt0;

    .line 36
    .line 37
    invoke-interface {v0, v1}, Ll/wit0;->G(Ll/xkt0;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    if-eqz p1, :cond_1

    .line 41
    .line 42
    const-string p1, "default"

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/s0t0;->g(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/m0t0;->q:Ll/t0t0;

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    invoke-interface {p1}, Ll/t0t0;->zzb()V

    .line 52
    .line 53
    .line 54
    :cond_1
    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Ll/m0t0;->r:Landroid/widget/PopupWindow;

    .line 56
    .line 57
    iput-object p1, p0, Ll/m0t0;->s:Landroid/widget/RelativeLayout;

    .line 58
    .line 59
    iput-object p1, p0, Ll/m0t0;->t:Landroid/view/ViewGroup;

    .line 60
    .line 61
    iput-object p1, p0, Ll/m0t0;->p:Landroid/widget/LinearLayout;

    .line 62
    .line 63
    return-void
.end method
