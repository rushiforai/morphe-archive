.class public final Ll/dhg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudFSTAPP;
.implements Ll/kzg0;


# static fields
.field public static final F:Ljava/lang/String;

.field public static G:Ll/dhg0;


# instance fields
.field public A:Z

.field public B:Ll/rog0;

.field public C:Ll/qug0;

.field public D:Ll/xlg0;

.field public E:Ll/hkg0;

.field public final a:Ltech/sud/gip/core/SudLoadMGParamModel;

.field public final b:Landroid/app/Activity;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:J

.field public final f:Ltech/sud/gip/core/ISudFSMMG;

.field public g:Ltech/sud/gip/core/GameInfo;

.field public final h:Landroid/content/Context;

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:Ll/lug0;

.field public final n:Ltech/sud/gip/core/view/SudGameView;

.field public o:Ll/gug0;

.field public p:Ll/bgg0;

.field public q:Landroid/view/View;

.field public final r:Ll/krg0;

.field public final s:Ll/aog0;

.field public final t:Ll/bfg0;

.field public final u:Ll/wyg0;

.field public v:Ll/mkg0;

.field public final w:Ll/iug0;

.field public x:Ltech/sud/gip/core/GameInfo;

.field public y:Ljava/lang/String;

.field public z:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/dhg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ltech/sud/gip/core/SudLoadMGParamModel;Ltech/sud/gip/core/ISudFSMMG;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/dhg0;->i:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/dhg0;->j:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/dhg0;->k:Z

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/dhg0;->l:Z

    .line 13
    .line 14
    new-instance v0, Ll/iug0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/iug0;-><init>(Ll/dhg0;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "\u521d\u59cb\u5316"

    .line 24
    .line 25
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->userId:Ljava/lang/String;

    .line 29
    .line 30
    const-string v3, "userId"

    .line 31
    .line 32
    invoke-static {v3, v2}, Ltech/sud/logger/LogUtils;->buildField(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-object v2, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->roomId:Ljava/lang/String;

    .line 40
    .line 41
    const-string v3, "roomId"

    .line 42
    .line 43
    invoke-static {v3, v2}, Ltech/sud/logger/LogUtils;->buildField(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object v2, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->code:Ljava/lang/String;

    .line 51
    .line 52
    const-string v3, "code"

    .line 53
    .line 54
    invoke-static {v3, v2}, Ltech/sud/logger/LogUtils;->buildField(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget-wide v2, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->mgId:J

    .line 62
    .line 63
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const-string v3, "mgId"

    .line 68
    .line 69
    invoke-static {v3, v2}, Ltech/sud/logger/LogUtils;->buildField(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v2, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->language:Ljava/lang/String;

    .line 77
    .line 78
    const-string v3, "language"

    .line 79
    .line 80
    invoke-static {v3, v2}, Ltech/sud/logger/LogUtils;->buildField(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v2, "ProxySudFSTAPPImpl"

    .line 92
    .line 93
    invoke-static {v2, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    sget-object v1, Ll/dhg0;->G:Ll/dhg0;

    .line 97
    .line 98
    if-eqz v1, :cond_0

    .line 99
    .line 100
    const-string v1, "Hey, guy! You not hold or call the destroyMG, but the instance will be dealloc. Please check it!"

    .line 101
    .line 102
    invoke-static {v2, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    sget-object v2, Ll/dhg0;->F:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v2, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    sget-object v1, Ll/dhg0;->G:Ll/dhg0;

    .line 111
    .line 112
    invoke-virtual {v1}, Ll/dhg0;->destroyMG()Z

    .line 113
    .line 114
    .line 115
    :cond_0
    sput-object p0, Ll/dhg0;->G:Ll/dhg0;

    .line 116
    .line 117
    iput-object p1, p0, Ll/dhg0;->a:Ltech/sud/gip/core/SudLoadMGParamModel;

    .line 118
    .line 119
    iget-object v1, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->activity:Landroid/app/Activity;

    .line 120
    .line 121
    iput-object v1, p0, Ll/dhg0;->b:Landroid/app/Activity;

    .line 122
    .line 123
    iget-object v2, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->userId:Ljava/lang/String;

    .line 124
    .line 125
    iput-object v2, p0, Ll/dhg0;->c:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v3, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->roomId:Ljava/lang/String;

    .line 128
    .line 129
    iput-object v3, p0, Ll/dhg0;->d:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v4, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->code:Ljava/lang/String;

    .line 132
    .line 133
    iget-wide v5, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->mgId:J

    .line 134
    .line 135
    iput-wide v5, p0, Ll/dhg0;->e:J

    .line 136
    .line 137
    iput-object p2, p0, Ll/dhg0;->f:Ltech/sud/gip/core/ISudFSMMG;

    .line 138
    .line 139
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 140
    .line 141
    .line 142
    move-result-object v7

    .line 143
    iput-object v7, p0, Ll/dhg0;->h:Landroid/content/Context;

    .line 144
    .line 145
    iput-object v1, v0, Ll/iug0;->s:Ljava/lang/Object;

    .line 146
    .line 147
    new-instance v0, Ltech/sud/gip/core/GameInfo;

    .line 148
    .line 149
    invoke-direct {v0}, Ltech/sud/gip/core/GameInfo;-><init>()V

    .line 150
    .line 151
    .line 152
    iput-object v0, p0, Ll/dhg0;->g:Ltech/sud/gip/core/GameInfo;

    .line 153
    .line 154
    iget-wide v8, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->mgId:J

    .line 155
    .line 156
    iput-wide v8, v0, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 157
    .line 158
    new-instance v0, Ltech/sud/gip/core/view/SudGameView;

    .line 159
    .line 160
    invoke-direct {v0, v1}, Ltech/sud/gip/core/view/SudGameView;-><init>(Landroid/content/Context;)V

    .line 161
    .line 162
    .line 163
    new-instance v1, Ll/zjg0;

    .line 164
    .line 165
    invoke-direct {v1, p0}, Ll/zjg0;-><init>(Ll/dhg0;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v1}, Ltech/sud/gip/core/view/SudGameView;->setLifecycleListener(Ltech/sud/gip/core/view/SudGameViewLifecycleListener;)V

    .line 169
    .line 170
    .line 171
    iput-object v0, p0, Ll/dhg0;->n:Ltech/sud/gip/core/view/SudGameView;

    .line 172
    .line 173
    iget-wide v0, p1, Ltech/sud/gip/core/SudLoadMGParamModel;->mgId:J

    .line 174
    .line 175
    sget-object p1, Ll/fug0;->a:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-static {p1}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    sget-object v8, Ll/fug0;->d:Ljava/util/HashMap;

    .line 190
    .line 191
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v8, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    sget-object p1, Ll/dlg0;->c:Ll/dlg0;

    .line 199
    .line 200
    if-nez p1, :cond_1

    .line 201
    .line 202
    new-instance p1, Ll/dlg0;

    .line 203
    .line 204
    invoke-direct {p1, v7}, Ll/dlg0;-><init>(Landroid/content/Context;)V

    .line 205
    .line 206
    .line 207
    sput-object p1, Ll/dlg0;->c:Ll/dlg0;

    .line 208
    .line 209
    :cond_1
    new-instance p1, Ll/krg0;

    .line 210
    .line 211
    invoke-direct {p1, p0}, Ll/krg0;-><init>(Ll/dhg0;)V

    .line 212
    .line 213
    .line 214
    iput-object p1, p0, Ll/dhg0;->r:Ll/krg0;

    .line 215
    .line 216
    new-instance p1, Ll/aog0;

    .line 217
    .line 218
    invoke-direct {p1, p0}, Ll/aog0;-><init>(Ll/dhg0;)V

    .line 219
    .line 220
    .line 221
    iput-object p1, p0, Ll/dhg0;->s:Ll/aog0;

    .line 222
    .line 223
    new-instance p1, Ll/bfg0;

    .line 224
    .line 225
    invoke-direct {p1, p0, p0}, Ll/bfg0;-><init>(Ll/dhg0;Ll/dhg0;)V

    .line 226
    .line 227
    .line 228
    iput-object p1, p0, Ll/dhg0;->t:Ll/bfg0;

    .line 229
    .line 230
    new-instance v0, Ll/wyg0;

    .line 231
    .line 232
    invoke-direct {v0, v7}, Ll/wyg0;-><init>(Landroid/content/Context;)V

    .line 233
    .line 234
    .line 235
    iput-object v0, p0, Ll/dhg0;->u:Ll/wyg0;

    .line 236
    .line 237
    if-nez p2, :cond_2

    .line 238
    .line 239
    sget-object p2, Ll/wyg0;->n:Ljava/lang/String;

    .line 240
    .line 241
    const-string v1, "fsmMg2App is null"

    .line 242
    .line 243
    invoke-static {p2, v1}, Ltech/sud/gip/logger/SudLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :cond_2
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 249
    .line 250
    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 251
    .line 252
    .line 253
    iput-object v1, v0, Ll/wyg0;->c:Ljava/lang/ref/WeakReference;

    .line 254
    .line 255
    iput-object v2, v0, Ll/wyg0;->d:Ljava/lang/String;

    .line 256
    .line 257
    iput-object v3, v0, Ll/wyg0;->e:Ljava/lang/String;

    .line 258
    .line 259
    iput-object v4, v0, Ll/wyg0;->f:Ljava/lang/String;

    .line 260
    .line 261
    iput-wide v5, v0, Ll/wyg0;->g:J

    .line 262
    .line 263
    iget-object p2, v0, Ll/wyg0;->j:Ljava/util/HashMap;

    .line 264
    .line 265
    invoke-virtual {p2}, Ljava/util/HashMap;->clear()V

    .line 266
    .line 267
    .line 268
    iget-object p2, v0, Ll/wyg0;->k:Ljava/util/HashMap;

    .line 269
    .line 270
    invoke-virtual {p2}, Ljava/util/HashMap;->clear()V

    .line 271
    .line 272
    .line 273
    iget-object p2, v0, Ll/wyg0;->l:Ljava/util/HashMap;

    .line 274
    .line 275
    invoke-virtual {p2}, Ljava/util/HashMap;->clear()V

    .line 276
    .line 277
    .line 278
    iget-object p2, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 279
    .line 280
    invoke-virtual {p2}, Ljava/util/HashMap;->clear()V

    .line 281
    .line 282
    .line 283
    new-instance p2, Ll/rvg0;

    .line 284
    .line 285
    invoke-direct {p2}, Ll/rvg0;-><init>()V

    .line 286
    .line 287
    .line 288
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 289
    .line 290
    const-string v2, "m2as-set-debug"

    .line 291
    .line 292
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    new-instance p2, Ll/g0h0;

    .line 296
    .line 297
    invoke-direct {p2, v0}, Ll/g0h0;-><init>(Ll/wyg0;)V

    .line 298
    .line 299
    .line 300
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 301
    .line 302
    const-string v2, "m2as-mg-log"

    .line 303
    .line 304
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    new-instance p2, Ll/meg0;

    .line 308
    .line 309
    invoke-direct {p2, v0}, Ll/meg0;-><init>(Ll/wyg0;)V

    .line 310
    .line 311
    .line 312
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 313
    .line 314
    const-string v2, "m2as-get-net-status"

    .line 315
    .line 316
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    new-instance p2, Ll/ugg0;

    .line 320
    .line 321
    invoke-direct {p2, v0}, Ll/ugg0;-><init>(Ll/wyg0;)V

    .line 322
    .line 323
    .line 324
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 325
    .line 326
    const-string v2, "m2as-get-game-view-info"

    .line 327
    .line 328
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    new-instance p2, Ll/uhg0;

    .line 332
    .line 333
    invoke-direct {p2, v0}, Ll/uhg0;-><init>(Ll/wyg0;)V

    .line 334
    .line 335
    .line 336
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 337
    .line 338
    const-string v2, "m2as-get-game-cfg"

    .line 339
    .line 340
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    new-instance p2, Ll/yhg0;

    .line 344
    .line 345
    invoke-direct {p2, v0}, Ll/yhg0;-><init>(Ll/wyg0;)V

    .line 346
    .line 347
    .line 348
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 349
    .line 350
    const-string v2, "m2as-login"

    .line 351
    .line 352
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    new-instance p2, Ll/xmg0;

    .line 356
    .line 357
    invoke-direct {p2, v0}, Ll/xmg0;-><init>(Ll/wyg0;)V

    .line 358
    .line 359
    .line 360
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 361
    .line 362
    const-string v2, "m2as-expire-code"

    .line 363
    .line 364
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    new-instance p2, Ll/eng0;

    .line 368
    .line 369
    invoke-direct {p2, v0}, Ll/eng0;-><init>(Ll/wyg0;)V

    .line 370
    .line 371
    .line 372
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 373
    .line 374
    const-string v2, "m2as-vibrate"

    .line 375
    .line 376
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    new-instance p2, Ll/rxg0;

    .line 380
    .line 381
    invoke-direct {p2, v0}, Ll/rxg0;-><init>(Ll/wyg0;)V

    .line 382
    .line 383
    .line 384
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 385
    .line 386
    const-string v2, "m2as-get-sdk-info"

    .line 387
    .line 388
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    new-instance p2, Ll/ssg0;

    .line 392
    .line 393
    invoke-direct {p2, v0}, Ll/ssg0;-><init>(Ll/wyg0;)V

    .line 394
    .line 395
    .line 396
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 397
    .line 398
    const-string v2, "m2as-get-state"

    .line 399
    .line 400
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    .line 402
    .line 403
    new-instance p2, Ll/xog0;

    .line 404
    .line 405
    invoke-direct {p2, v0}, Ll/xog0;-><init>(Ll/wyg0;)V

    .line 406
    .line 407
    .line 408
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 409
    .line 410
    const-string v2, "m2as-notify-game-load-started"

    .line 411
    .line 412
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    new-instance p2, Ll/wug0;

    .line 416
    .line 417
    invoke-direct {p2, v0}, Ll/wug0;-><init>(Ll/wyg0;)V

    .line 418
    .line 419
    .line 420
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 421
    .line 422
    const-string v2, "m2as-notify-game-load-completed"

    .line 423
    .line 424
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    new-instance p2, Ll/zwg0;

    .line 428
    .line 429
    invoke-direct {p2, v0}, Ll/zwg0;-><init>(Ll/wyg0;)V

    .line 430
    .line 431
    .line 432
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 433
    .line 434
    const-string v2, "m2as-notify-game-started"

    .line 435
    .line 436
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    new-instance p2, Ll/kpg0;

    .line 440
    .line 441
    invoke-direct {p2, v0}, Ll/kpg0;-><init>(Ll/wyg0;)V

    .line 442
    .line 443
    .line 444
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 445
    .line 446
    const-string v2, "mg_common_game_asr"

    .line 447
    .line 448
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    new-instance p2, Ll/qzg0;

    .line 452
    .line 453
    invoke-direct {p2, v0}, Ll/qzg0;-><init>(Ll/wyg0;)V

    .line 454
    .line 455
    .line 456
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 457
    .line 458
    const-string v2, "mg_common_game_load_percent"

    .line 459
    .line 460
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 461
    .line 462
    .line 463
    new-instance p2, Ll/jfg0;

    .line 464
    .line 465
    invoke-direct {p2, v0}, Ll/jfg0;-><init>(Ll/wyg0;)V

    .line 466
    .line 467
    .line 468
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 469
    .line 470
    const-string v2, "mg_common_game_reload"

    .line 471
    .line 472
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    .line 474
    .line 475
    new-instance p2, Ll/dgg0;

    .line 476
    .line 477
    invoke-direct {p2, v0}, Ll/dgg0;-><init>(Ll/wyg0;)V

    .line 478
    .line 479
    .line 480
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 481
    .line 482
    const-string v2, "m2as-ai-common"

    .line 483
    .line 484
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    .line 486
    .line 487
    new-instance p2, Ll/ghg0;

    .line 488
    .line 489
    invoke-direct {p2, v0}, Ll/ghg0;-><init>(Ll/wyg0;)V

    .line 490
    .line 491
    .line 492
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 493
    .line 494
    const-string v2, "m2as-ai-sse"

    .line 495
    .line 496
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    .line 498
    .line 499
    new-instance p2, Ll/hmg0;

    .line 500
    .line 501
    invoke-direct {p2, v0}, Ll/hmg0;-><init>(Ll/wyg0;)V

    .line 502
    .line 503
    .line 504
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 505
    .line 506
    const-string v2, "mg_common_game_player_self_info"

    .line 507
    .line 508
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    new-instance p2, Ll/tyg0;

    .line 512
    .line 513
    invoke-direct {p2, v0}, Ll/tyg0;-><init>(Ll/wyg0;)V

    .line 514
    .line 515
    .line 516
    iget-object v1, v0, Ll/wyg0;->a:Ljava/util/HashMap;

    .line 517
    .line 518
    const-string v2, "mg_common_game_llm_asr"

    .line 519
    .line 520
    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    .line 522
    .line 523
    :goto_0
    iput-object p1, v0, Ll/wyg0;->m:Ll/bfg0;

    .line 524
    .line 525
    iget-object p1, p0, Ll/dhg0;->g:Ltech/sud/gip/core/GameInfo;

    .line 526
    .line 527
    invoke-virtual {p0, p1}, Ll/dhg0;->c(Ltech/sud/gip/core/GameInfo;)V

    .line 528
    .line 529
    .line 530
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dhg0;->p:Ll/bgg0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v0, p0, Ll/dhg0;->g:Ltech/sud/gip/core/GameInfo;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    instance-of v2, v0, Ll/blg0;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    check-cast v0, Ll/blg0;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    instance-of v2, v0, Ll/alg0;

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    check-cast v0, Ll/alg0;

    .line 26
    .line 27
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/dhg0;->n:Ltech/sud/gip/core/view/SudGameView;

    .line 28
    .line 29
    iget-object v2, p0, Ll/dhg0;->q:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Ll/dhg0;->p:Ll/bgg0;

    .line 35
    .line 36
    iput-object v1, p0, Ll/dhg0;->q:Landroid/view/View;

    .line 37
    .line 38
    :cond_2
    iget-object v0, p0, Ll/dhg0;->o:Ll/gug0;

    .line 39
    .line 40
    if-eqz v0, :cond_5

    .line 41
    .line 42
    sget-object v2, Ll/gug0;->i:Ljava/lang/String;

    .line 43
    .line 44
    const-string v3, "stop loading"

    .line 45
    .line 46
    invoke-static {v2, v3}, Ltech/sud/gip/logger/SudLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iput-object v1, v0, Ll/gug0;->e:Ltech/sud/gip/core/GameInfo;

    .line 50
    .line 51
    iget v3, v0, Ll/gug0;->g:I

    .line 52
    .line 53
    iget-object v4, v0, Ll/gug0;->d:Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    const-string v5, "SudGameLoadingModel"

    .line 60
    .line 61
    if-ge v3, v4, :cond_3

    .line 62
    .line 63
    iget-object v3, v0, Ll/gug0;->d:Ljava/util/ArrayList;

    .line 64
    .line 65
    iget v4, v0, Ll/gug0;->g:I

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Ll/bkg0;

    .line 72
    .line 73
    invoke-interface {v3}, Ll/bkg0;->cancel()V

    .line 74
    .line 75
    .line 76
    const/4 v3, 0x0

    .line 77
    iput v3, v0, Ll/gug0;->g:I

    .line 78
    .line 79
    const-string v0, "loading canceled"

    .line 80
    .line 81
    invoke-static {v5, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v2, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    iget-object v3, v0, Ll/gug0;->h:Ll/bgg0;

    .line 89
    .line 90
    if-eqz v3, :cond_4

    .line 91
    .line 92
    const-string v3, "loading done"

    .line 93
    .line 94
    invoke-static {v5, v3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v2, v3}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, v0, Ll/gug0;->h:Ll/bgg0;

    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    .line 104
    .line 105
    :cond_4
    :goto_1
    iput-object v1, p0, Ll/dhg0;->o:Ll/gug0;

    .line 106
    .line 107
    :cond_5
    return-void
.end method

.method public final b(IIIZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onGameLoadingProgress stage:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "  retCode:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "  progress:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "ProxySudFSTAPPImpl"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    sget-object v1, Ll/dhg0;->F:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1, v0}, Ltech/sud/gip/logger/SudLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    if-nez p2, :cond_1

    .line 47
    .line 48
    if-eqz p4, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iput p3, v0, Ll/iug0;->n:I

    .line 52
    .line 53
    iget-object p4, v0, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 54
    .line 55
    invoke-virtual {p4}, Ltech/sud/base/utils/SudStopwatch;->reset()V

    .line 56
    .line 57
    .line 58
    iget-object p4, v0, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 59
    .line 60
    invoke-virtual {p4}, Ltech/sud/base/utils/SudStopwatch;->start()V

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/dhg0;->f:Ltech/sud/gip/core/ISudFSMMG;

    .line 64
    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    invoke-interface {p0, p1, p2, p3}, Ltech/sud/gip/core/ISudFSMMG;->onGameLoadingProgress(III)V

    .line 68
    .line 69
    .line 70
    :cond_2
    return-void
.end method

.method public final c(Ltech/sud/gip/core/GameInfo;)V
    .locals 12

    .line 1
    const-string v0, "ProxySudFSTAPPImpl"

    .line 2
    .line 3
    const-string v1, "_loadGame"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object v2, Ll/dhg0;->F:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v2, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-boolean v1, p0, Ll/dhg0;->i:Z

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    iput-boolean v3, p0, Ll/dhg0;->l:Z

    .line 18
    .line 19
    iget-object v4, p0, Ll/dhg0;->w:Ll/iug0;

    .line 20
    .line 21
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    new-instance v5, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v6, "startLoad:"

    .line 27
    .line 28
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-wide v6, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 32
    .line 33
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    const-string v6, "LoadGameStatsManager"

    .line 41
    .line 42
    invoke-static {v6, v5}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    new-instance v5, Ll/ukg0;

    .line 46
    .line 47
    const-string v6, "loadGameFinished"

    .line 48
    .line 49
    invoke-direct {v5, v6}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iput-object v5, v4, Ll/iug0;->a:Ll/ukg0;

    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    iput-object v6, v5, Ll/ukg0;->m:Ljava/lang/Integer;

    .line 59
    .line 60
    new-instance v5, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v5, v4, Ll/iug0;->b:Ljava/util/ArrayList;

    .line 66
    .line 67
    iget-object v5, v4, Ll/iug0;->a:Ll/ukg0;

    .line 68
    .line 69
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 70
    .line 71
    iput-object v6, v5, Ll/ukg0;->l:Ljava/lang/Boolean;

    .line 72
    .line 73
    iput-object v6, v5, Ll/ukg0;->k:Ljava/lang/Boolean;

    .line 74
    .line 75
    iget-wide v6, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 76
    .line 77
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    iput-object v6, v5, Ll/ukg0;->g:Ljava/lang/String;

    .line 82
    .line 83
    iget-wide v5, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 84
    .line 85
    iput-wide v5, v4, Ll/iug0;->p:J

    .line 86
    .line 87
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 88
    .line 89
    .line 90
    move-result-wide v5

    .line 91
    const-wide/32 v7, 0xf4240

    .line 92
    .line 93
    .line 94
    div-long/2addr v5, v7

    .line 95
    iput-wide v5, v4, Ll/iug0;->c:J

    .line 96
    .line 97
    invoke-virtual {v4}, Ll/iug0;->a()V

    .line 98
    .line 99
    .line 100
    iget-object v5, v4, Ll/iug0;->j:Ltech/sud/base/utils/SudStopwatch;

    .line 101
    .line 102
    invoke-virtual {v5}, Ltech/sud/base/utils/SudStopwatch;->reset()V

    .line 103
    .line 104
    .line 105
    iget-object v5, v4, Ll/iug0;->k:Ltech/sud/base/utils/SudStopwatch;

    .line 106
    .line 107
    invoke-virtual {v5}, Ltech/sud/base/utils/SudStopwatch;->reset()V

    .line 108
    .line 109
    .line 110
    iget-object v5, v4, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 111
    .line 112
    invoke-virtual {v5}, Ltech/sud/base/utils/SudStopwatch;->reset()V

    .line 113
    .line 114
    .line 115
    iget-object v5, v4, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 116
    .line 117
    invoke-virtual {v5}, Ltech/sud/base/utils/SudStopwatch;->start()V

    .line 118
    .line 119
    .line 120
    iput-boolean v1, v4, Ll/iug0;->g:Z

    .line 121
    .line 122
    iput-boolean v1, v4, Ll/iug0;->i:Z

    .line 123
    .line 124
    iput-boolean v1, v4, Ll/iug0;->h:Z

    .line 125
    .line 126
    iput-boolean v1, v4, Ll/iug0;->f:Z

    .line 127
    .line 128
    const/4 v5, 0x0

    .line 129
    iput-object v5, v4, Ll/iug0;->d:Ll/ffg0;

    .line 130
    .line 131
    iget-object v5, v4, Ll/iug0;->m:Ljava/util/ArrayList;

    .line 132
    .line 133
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 134
    .line 135
    .line 136
    iput-boolean v1, v4, Ll/iug0;->o:Z

    .line 137
    .line 138
    iput v1, v4, Ll/iug0;->n:I

    .line 139
    .line 140
    new-instance v4, Ll/bgg0;

    .line 141
    .line 142
    iget-object v5, p0, Ll/dhg0;->b:Landroid/app/Activity;

    .line 143
    .line 144
    invoke-direct {v4, v5}, Ll/bgg0;-><init>(Landroid/content/Context;)V

    .line 145
    .line 146
    .line 147
    iput-object v4, p0, Ll/dhg0;->p:Ll/bgg0;

    .line 148
    .line 149
    new-instance v6, Ll/gug0;

    .line 150
    .line 151
    iget-object v7, p0, Ll/dhg0;->b:Landroid/app/Activity;

    .line 152
    .line 153
    iget-object v8, p0, Ll/dhg0;->a:Ltech/sud/gip/core/SudLoadMGParamModel;

    .line 154
    .line 155
    iget v9, v8, Ltech/sud/gip/core/SudLoadMGParamModel;->loadMGMode:I

    .line 156
    .line 157
    iget-object v10, v8, Ltech/sud/gip/core/SudLoadMGParamModel;->authorizationSecret:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v11, p0, Ll/dhg0;->r:Ll/krg0;

    .line 160
    .line 161
    invoke-direct/range {v6 .. v11}, Ll/gug0;-><init>(Landroid/content/Context;Ltech/sud/gip/core/SudLoadMGParamModel;ILjava/lang/String;Ll/krg0;)V

    .line 162
    .line 163
    .line 164
    iput-object v6, p0, Ll/dhg0;->o:Ll/gug0;

    .line 165
    .line 166
    iget-object v4, p0, Ll/dhg0;->p:Ll/bgg0;

    .line 167
    .line 168
    iget-object v5, v4, Ll/bgg0;->f:Landroid/view/View;

    .line 169
    .line 170
    iput-object v5, p0, Ll/dhg0;->q:Landroid/view/View;

    .line 171
    .line 172
    iget-object v7, p0, Ll/dhg0;->s:Ll/aog0;

    .line 173
    .line 174
    iput-object v7, v4, Ll/wmg0;->a:Ll/aog0;

    .line 175
    .line 176
    iput-object v4, v6, Ll/gug0;->h:Ll/bgg0;

    .line 177
    .line 178
    iget-object v4, p0, Ll/dhg0;->n:Ltech/sud/gip/core/view/SudGameView;

    .line 179
    .line 180
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Ll/dhg0;->p:Ll/bgg0;

    .line 184
    .line 185
    iget-object p0, p0, Ll/wmg0;->a:Ll/aog0;

    .line 186
    .line 187
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 188
    .line 189
    .line 190
    const-string v4, "onLoadingStart"

    .line 191
    .line 192
    invoke-static {v0, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    invoke-static {v2, v4}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    iget-object p0, p0, Ll/aog0;->a:Ll/dhg0;

    .line 199
    .line 200
    iget-object p0, p0, Ll/dhg0;->o:Ll/gug0;

    .line 201
    .line 202
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 203
    .line 204
    .line 205
    sget-object v0, Ll/gug0;->i:Ljava/lang/String;

    .line 206
    .line 207
    const-string v2, "start loading"

    .line 208
    .line 209
    invoke-static {v0, v2}, Ltech/sud/gip/logger/SudLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    iput-object p1, p0, Ll/gug0;->e:Ltech/sud/gip/core/GameInfo;

    .line 213
    .line 214
    iget-object p1, p0, Ll/gug0;->h:Ll/bgg0;

    .line 215
    .line 216
    if-eqz p1, :cond_1

    .line 217
    .line 218
    const/16 v0, 0xa

    .line 219
    .line 220
    iput v0, p1, Ll/bgg0;->c:I

    .line 221
    .line 222
    iget-object v2, p1, Ll/bgg0;->i:Landroid/widget/ProgressBar;

    .line 223
    .line 224
    invoke-virtual {v2, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p1, Ll/bgg0;->m:Landroid/view/View;

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 230
    .line 231
    .line 232
    sget-boolean v0, Ll/nkg0;->a:Z

    .line 233
    .line 234
    const/4 v2, 0x4

    .line 235
    if-eqz v0, :cond_0

    .line 236
    .line 237
    iget-boolean v0, p1, Ll/bgg0;->s:Z

    .line 238
    .line 239
    if-nez v0, :cond_0

    .line 240
    .line 241
    iget-object v0, p1, Ll/bgg0;->k:Landroid/widget/TextView;

    .line 242
    .line 243
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 244
    .line 245
    .line 246
    goto :goto_0

    .line 247
    :cond_0
    iget-object v0, p1, Ll/bgg0;->k:Landroid/widget/TextView;

    .line 248
    .line 249
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 250
    .line 251
    .line 252
    :goto_0
    iget-object v0, p1, Ll/wmg0;->a:Ll/aog0;

    .line 253
    .line 254
    iget v4, p1, Ll/bgg0;->c:I

    .line 255
    .line 256
    iget-object v0, v0, Ll/aog0;->a:Ll/dhg0;

    .line 257
    .line 258
    invoke-virtual {v0, v3, v1, v4, v1}, Ll/dhg0;->b(IIIZ)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {p1}, Ll/bgg0;->g()V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p1}, Ll/bgg0;->a()V

    .line 265
    .line 266
    .line 267
    iget v0, p1, Ll/bgg0;->c:I

    .line 268
    .line 269
    invoke-virtual {p1, v1, v3, v0, v1}, Ll/bgg0;->c(IZIZ)V

    .line 270
    .line 271
    .line 272
    iget-object p1, p1, Ll/bgg0;->g:Landroid/widget/TextView;

    .line 273
    .line 274
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 275
    .line 276
    .line 277
    :cond_1
    iget p1, p0, Ll/gug0;->g:I

    .line 278
    .line 279
    if-eqz p1, :cond_2

    .line 280
    .line 281
    iget-object v0, p0, Ll/gug0;->d:Ljava/util/ArrayList;

    .line 282
    .line 283
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-ge p1, v0, :cond_2

    .line 288
    .line 289
    iget-object p1, p0, Ll/gug0;->d:Ljava/util/ArrayList;

    .line 290
    .line 291
    iget v0, p0, Ll/gug0;->g:I

    .line 292
    .line 293
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    check-cast p1, Ll/bkg0;

    .line 298
    .line 299
    invoke-interface {p1}, Ll/bkg0;->cancel()V

    .line 300
    .line 301
    .line 302
    :cond_2
    iput v1, p0, Ll/gug0;->g:I

    .line 303
    .line 304
    iget-object p1, p0, Ll/gug0;->d:Ljava/util/ArrayList;

    .line 305
    .line 306
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    check-cast p1, Ll/bkg0;

    .line 311
    .line 312
    iget-object v0, p0, Ll/gug0;->e:Ltech/sud/gip/core/GameInfo;

    .line 313
    .line 314
    iget v1, p0, Ll/gug0;->b:I

    .line 315
    .line 316
    iget-object p0, p0, Ll/gug0;->c:Ljava/lang/String;

    .line 317
    .line 318
    invoke-interface {p1, v0, v1, p0}, Ll/bkg0;->a(Ltech/sud/gip/core/GameInfo;ILjava/lang/String;)V

    .line 319
    .line 320
    .line 321
    return-void
.end method

.method public final destroyMG()Z
    .locals 7

    .line 1
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "destroyMG"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v2, "ProxySudFSTAPPImpl"

    .line 9
    .line 10
    invoke-static {v2, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-boolean v1, p0, Ll/dhg0;->k:Z

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    const/4 v4, 0x0

    .line 17
    if-nez v1, :cond_7

    .line 18
    .line 19
    iput-boolean v3, p0, Ll/dhg0;->k:Z

    .line 20
    .line 21
    const-string v1, "_destroyMGInternal"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 30
    .line 31
    iput-boolean v3, v0, Ll/iug0;->i:Z

    .line 32
    .line 33
    iget-object v1, v0, Ll/iug0;->j:Ltech/sud/base/utils/SudStopwatch;

    .line 34
    .line 35
    invoke-virtual {v1}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 36
    .line 37
    .line 38
    iget-object v1, v0, Ll/iug0;->k:Ltech/sud/base/utils/SudStopwatch;

    .line 39
    .line 40
    invoke-virtual {v1}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 41
    .line 42
    .line 43
    iget-object v1, v0, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 44
    .line 45
    invoke-virtual {v1}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ll/iug0;->a()V

    .line 49
    .line 50
    .line 51
    iget-object v1, v0, Ll/iug0;->a:Ll/ukg0;

    .line 52
    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    const/16 v2, -0x283d

    .line 56
    .line 57
    iput v2, v1, Ll/ukg0;->e:I

    .line 58
    .line 59
    :cond_0
    if-eqz v1, :cond_1

    .line 60
    .line 61
    const-string v2, "\u9500\u6bc1\u6e38\u620f"

    .line 62
    .line 63
    iput-object v2, v1, Ll/ukg0;->f:Ljava/lang/String;

    .line 64
    .line 65
    :cond_1
    invoke-virtual {v0}, Ll/iug0;->h()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/dhg0;->a()V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 72
    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    invoke-interface {v0}, Ltech/sud/gip/core/ISudFSTAPP;->destroyMG()Z

    .line 76
    .line 77
    .line 78
    iput-object v4, p0, Ll/dhg0;->m:Ll/lug0;

    .line 79
    .line 80
    :cond_2
    iget-wide v0, p0, Ll/dhg0;->e:J

    .line 81
    .line 82
    sget-object v2, Ll/fug0;->d:Ljava/util/HashMap;

    .line 83
    .line 84
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/dhg0;->B:Ll/rog0;

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/rog0;->a()V

    .line 96
    .line 97
    .line 98
    iput-object v4, p0, Ll/dhg0;->B:Ll/rog0;

    .line 99
    .line 100
    :cond_3
    iget-object v0, p0, Ll/dhg0;->C:Ll/qug0;

    .line 101
    .line 102
    if-eqz v0, :cond_6

    .line 103
    .line 104
    iget-object v1, v0, Ll/qug0;->a:Ljava/lang/String;

    .line 105
    .line 106
    new-instance v2, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v5, "destroy isRunning:"

    .line 109
    .line 110
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object v6, v0, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 114
    .line 115
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 116
    .line 117
    .line 118
    move-result v6

    .line 119
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-static {v1, v2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    new-instance v1, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object v2, v0, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 135
    .line 136
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    const-string v2, "SudGIPWebSocket"

    .line 148
    .line 149
    invoke-static {v2, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    iget-object v1, v0, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 153
    .line 154
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-nez v1, :cond_4

    .line 159
    .line 160
    goto :goto_0

    .line 161
    :cond_4
    iget-object v1, v0, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 162
    .line 163
    const/4 v2, 0x0

    .line 164
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 165
    .line 166
    .line 167
    iget-object v1, v0, Ll/qug0;->g:Landroid/os/Handler;

    .line 168
    .line 169
    iget-object v2, v0, Ll/qug0;->i:Ll/yog0;

    .line 170
    .line 171
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 172
    .line 173
    .line 174
    iget-object v1, v0, Ll/qug0;->h:Ll/hsp0;

    .line 175
    .line 176
    if-eqz v1, :cond_5

    .line 177
    .line 178
    const/16 v2, 0x3e8

    .line 179
    .line 180
    const-string v5, "destroy"

    .line 181
    .line 182
    invoke-interface {v1, v2, v5}, Ll/hsp0;->close(ILjava/lang/String;)Z

    .line 183
    .line 184
    .line 185
    iput-object v4, v0, Ll/qug0;->h:Ll/hsp0;

    .line 186
    .line 187
    :cond_5
    :goto_0
    iput-object v4, p0, Ll/dhg0;->C:Ll/qug0;

    .line 188
    .line 189
    :cond_6
    iget-object v0, p0, Ll/dhg0;->v:Ll/mkg0;

    .line 190
    .line 191
    if-eqz v0, :cond_7

    .line 192
    .line 193
    iget-object v0, v0, Ll/mkg0;->a:Ltech/sud/gip/asr/base/BaseRealSudASRImpl;

    .line 194
    .line 195
    if-eqz v0, :cond_7

    .line 196
    .line 197
    invoke-interface {v0, v3}, Ltech/sud/gip/asr/base/Sudtry;->stopASR(Z)V

    .line 198
    .line 199
    .line 200
    :cond_7
    sget-object v0, Ll/dhg0;->G:Ll/dhg0;

    .line 201
    .line 202
    if-ne v0, p0, :cond_8

    .line 203
    .line 204
    sput-object v4, Ll/dhg0;->G:Ll/dhg0;

    .line 205
    .line 206
    :cond_8
    return v3
.end method

.method public final getAiAgent()Ltech/sud/gip/core/ISudAiAgent;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/dhg0;->B:Ll/rog0;

    .line 3
    .line 4
    if-nez v0, :cond_2

    .line 5
    .line 6
    new-instance v0, Ll/rog0;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/rog0;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/dhg0;->B:Ll/rog0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/dhg0;->D:Ll/xlg0;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-boolean v2, v1, Ll/xlg0;->a:Z

    .line 18
    .line 19
    iput-boolean v2, v0, Ll/rog0;->m:Z

    .line 20
    .line 21
    iget-boolean v1, v1, Ll/xlg0;->c:Z

    .line 22
    .line 23
    iput-boolean v1, v0, Ll/rog0;->n:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    iget-wide v1, p0, Ll/dhg0;->e:J

    .line 29
    .line 30
    iput-wide v1, v0, Ll/rog0;->b:J

    .line 31
    .line 32
    iget-object v1, p0, Ll/dhg0;->d:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Ll/rog0;->c:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Ll/dhg0;->c:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Ll/rog0;->d:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p0, Ll/dhg0;->a:Ltech/sud/gip/core/SudLoadMGParamModel;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    iget-object v1, v1, Ltech/sud/gip/core/SudLoadMGParamModel;->language:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Ll/rog0;->g:Ljava/lang/String;

    .line 47
    .line 48
    :cond_1
    iget-object v1, p0, Ll/dhg0;->E:Ll/hkg0;

    .line 49
    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    iput-object v1, v0, Ll/rog0;->o:Ll/hkg0;

    .line 53
    .line 54
    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    iget-object p0, p0, Ll/dhg0;->B:Ll/rog0;

    .line 56
    .line 57
    return-object p0

    .line 58
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    throw v0
.end method

.method public final getGameState(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "Please call on UI or Main thread"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Ll/dhg0;->k:Z

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ltech/sud/gip/core/ISudFSTAPP;->getGameState(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string p0, "{}"

    .line 28
    .line 29
    return-object p0
.end method

.method public final getGameView()Landroid/view/View;
    .locals 2

    .line 1
    const-string v0, "ProxySudFSTAPPImpl"

    .line 2
    .line 3
    const-string v1, "getGameView"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/dhg0;->n:Ltech/sud/gip/core/view/SudGameView;

    .line 9
    .line 10
    return-object p0
.end method

.method public final getPlayerState(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "Please call on UI or Main thread"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Ll/dhg0;->k:Z

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-interface {p0, p1, p2}, Ltech/sud/gip/core/ISudFSTAPP;->getPlayerState(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string p0, "{}"

    .line 28
    .line 29
    return-object p0
.end method

.method public final notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V
    .locals 2

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "Please call on UI or Main thread"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Ll/dhg0;->k:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v0, "notifyStateChange \u6e38\u620f\u5df2\u9500\u6bc1 state:"

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p1, "  dataJson:"

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "ProxySudFSTAPPImpl"

    .line 41
    .line 42
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Ll/dhg0;->F:Ljava/lang/String;

    .line 46
    .line 47
    const-string p1, "This SudFSTAPP instance has been destroyed. Please attention"

    .line 48
    .line 49
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    if-eqz p3, :cond_2

    .line 53
    .line 54
    const/4 p0, -0x1

    .line 55
    invoke-interface {p3, p0, p1}, Ltech/sud/gip/core/ISudListenerNotifyStateChange;->onFailure(ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    if-nez v0, :cond_2

    .line 60
    .line 61
    iget-object p0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 62
    .line 63
    if-eqz p0, :cond_2

    .line 64
    .line 65
    invoke-interface {p0, p1, p2, p3}, Ltech/sud/gip/core/ISudFSTAPP;->notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    return-void
.end method

.method public final pauseMG()V
    .locals 4

    .line 1
    const-string v0, "ProxySudFSTAPPImpl"

    .line 2
    .line 3
    const-string v1, "pauseMG"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "Please call on UI or Main thread"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-boolean v0, p0, Ll/dhg0;->k:Z

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ltech/sud/gip/core/ISudFSTAPP;->pauseMG()V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object p0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->getUIHandler()Landroid/os/Handler;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/qrg0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/qrg0;-><init>(Ll/iug0;)V

    .line 44
    .line 45
    .line 46
    const-wide/16 v2, 0x1

    .line 47
    .line 48
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final playMG()V
    .locals 4

    .line 1
    const-string v0, "ProxySudFSTAPPImpl"

    .line 2
    .line 3
    const-string v1, "playMG"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "Please call on UI or Main thread"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-boolean v0, p0, Ll/dhg0;->k:Z

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ltech/sud/gip/core/ISudFSTAPP;->playMG()V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object p0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->getUIHandler()Landroid/os/Handler;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/fog0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/fog0;-><init>(Ll/iug0;)V

    .line 44
    .line 45
    .line 46
    const-wide/16 v2, 0x1

    .line 47
    .line 48
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final pushAudio(Ljava/nio/ByteBuffer;I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/dhg0;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    if-lez p2, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/dhg0;->v:Ll/mkg0;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/mkg0;->a:Ltech/sud/gip/asr/base/BaseRealSudASRImpl;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0, p1, p2}, Ltech/sud/gip/asr/base/Sudtry;->pushAudio(Ljava/nio/ByteBuffer;I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final reloadMG()V
    .locals 2

    .line 1
    const-string v0, "ProxySudFSTAPPImpl"

    .line 2
    .line 3
    const-string v1, "reloadMG"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "Please call on UI or Main thread"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    sget-object v0, Ll/arg0;->a:Ll/pjg0;

    .line 22
    .line 23
    iget-boolean v0, v0, Ll/pjg0;->b:Z

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-boolean v0, p0, Ll/dhg0;->i:Z

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/iug0;->h()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/dhg0;->a()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/dhg0;->g:Ltech/sud/gip/core/GameInfo;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/dhg0;->c(Ltech/sud/gip/core/GameInfo;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public final startMG()V
    .locals 2

    .line 1
    const-string v0, "ProxySudFSTAPPImpl"

    .line 2
    .line 3
    const-string v1, "startMG"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "Please call on UI or Main thread"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-boolean v0, p0, Ll/dhg0;->k:Z

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    invoke-interface {p0}, Ltech/sud/gip/core/ISudFSTAPP;->startMG()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final stopMG()V
    .locals 2

    .line 1
    const-string v0, "ProxySudFSTAPPImpl"

    .line 2
    .line 3
    const-string v1, "stopMG"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "Please call on UI or Main thread"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-boolean v0, p0, Ll/dhg0;->k:Z

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    invoke-interface {p0}, Ltech/sud/gip/core/ISudFSTAPP;->stopMG()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final updateCode(Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "updateCode:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "ProxySudFSTAPPImpl"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, "Please call on UI or Main thread"

    .line 29
    .line 30
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-boolean v0, p0, Ll/dhg0;->k:Z

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 38
    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    invoke-interface {p0, p1, p2}, Ltech/sud/gip/core/ISudFSTAPP;->updateCode(Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method
