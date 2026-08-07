.class public final Ll/mzg0;
.super Ll/lug0;
.source "SourceFile"


# static fields
.field public static final k:Ljava/lang/String;

.field public static final l:Ljava/util/concurrent/ExecutorService;

.field public static m:Z


# instance fields
.field public final a:Landroid/app/Activity;

.field public final b:Landroid/widget/FrameLayout;

.field public final c:Ljava/lang/String;

.field public final d:J

.field public e:Ll/pgg0;

.field public final f:Ll/qkg0;

.field public final g:Ll/gsg0;

.field public final h:Ll/slg0;

.field public i:Ll/iog0;

.field public j:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-class v0, Ll/mzg0;

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
    sput-object v0, Ll/mzg0;->k:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Ll/mzg0;->l:Ljava/util/concurrent/ExecutorService;

    .line 20
    .line 21
    :try_start_0
    new-instance v0, Ll/twg0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/twg0;-><init>()V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/pgg0;->C:Ll/twg0;

    .line 27
    .line 28
    sput-object v0, Ll/ysg0;->a:Ll/twg0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v2, "\u521d\u59cb\u5316\u5f15\u64ce\u7684\u65e5\u5fd7\u76d1\u542c\u53d1\u751f\u4e86\u5f02\u5e38\uff1a"

    .line 38
    .line 39
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "SUDRealSudFSTAPPImpl"

    .line 54
    .line 55
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;JLandroid/widget/FrameLayout;Ll/wyg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lug0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/mzg0;->j:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/mzg0;->a:Landroid/app/Activity;

    .line 8
    .line 9
    iput-object p5, p0, Ll/mzg0;->b:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    iput-object p2, p0, Ll/mzg0;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput-wide p3, p0, Ll/mzg0;->d:J

    .line 14
    .line 15
    iput-object p6, p0, Ll/mzg0;->h:Ll/slg0;

    .line 16
    .line 17
    new-instance p1, Ll/gsg0;

    .line 18
    .line 19
    invoke-direct {p1, p6}, Ll/gsg0;-><init>(Ll/slg0;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/mzg0;->g:Ll/gsg0;

    .line 23
    .line 24
    new-instance p1, Ll/qkg0;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/qkg0;-><init>(Ll/mzg0;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/mzg0;->f:Ll/qkg0;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic d(Ltech/sud/gip/core/ISudListenerNotifyStateChange;Lorg/json/JSONArray;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    :try_start_0
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p0, p1}, Ltech/sud/gip/core/ISudListenerNotifyStateChange;->onSuccess(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 v0, -0x1

    .line 24
    invoke-interface {p0, v0, p1}, Ltech/sud/gip/core/ISudListenerNotifyStateChange;->onFailure(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-string p1, "{}"

    .line 29
    .line 30
    invoke-interface {p0, p1}, Ltech/sud/gip/core/ISudListenerNotifyStateChange;->onSuccess(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method


# virtual methods
.method public final a(Ll/iog0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mzg0;->i:Ll/iog0;

    .line 2
    .line 3
    return-void
.end method

.method public final b(Ltech/sud/gip/core/GameInfo;Ljava/lang/String;)V
    .locals 13

    .line 1
    const-string v0, "SUDRealSudFSTAPPImpl"

    .line 2
    .line 3
    const-string v1, "_startGame"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/mzg0;->k:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "_startGame"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-boolean v1, p0, Ll/mzg0;->j:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    goto/16 :goto_12

    .line 20
    .line 21
    :cond_0
    new-instance v1, Ll/pgg0;

    .line 22
    .line 23
    iget-object v2, p0, Ll/mzg0;->a:Landroid/app/Activity;

    .line 24
    .line 25
    invoke-direct {v1, v2}, Ll/pgg0;-><init>(Landroid/app/Activity;)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 29
    .line 30
    new-instance v2, Ll/nug0;

    .line 31
    .line 32
    iget-object v3, p0, Ll/mzg0;->g:Ll/gsg0;

    .line 33
    .line 34
    invoke-direct {v2, v3}, Ll/nug0;-><init>(Ll/gsg0;)V

    .line 35
    .line 36
    .line 37
    const-string v3, "custom.CustomCommand"

    .line 38
    .line 39
    invoke-virtual {v1, v3, v2}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 43
    .line 44
    iget-object v2, p0, Ll/mzg0;->f:Ll/qkg0;

    .line 45
    .line 46
    iput-object v2, v1, Ll/pgg0;->h:Ll/qkg0;

    .line 47
    .line 48
    iget-object v2, p0, Ll/mzg0;->b:Landroid/widget/FrameLayout;

    .line 49
    .line 50
    iget-object v1, v1, Ll/pgg0;->j:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 53
    .line 54
    const/4 v4, -0x1

    .line 55
    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 56
    .line 57
    .line 58
    const/4 v5, 0x0

    .line 59
    invoke-virtual {v2, v1, v5, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 63
    .line 64
    iget-object v1, v1, Ll/pgg0;->a:Ll/yxg0;

    .line 65
    .line 66
    if-eqz v1, :cond_26

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/yxg0;->c()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_26

    .line 73
    .line 74
    iget-object v0, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 75
    .line 76
    const-string v1, ""

    .line 77
    .line 78
    iput-object v1, v0, Ll/pgg0;->n:Ljava/lang/String;

    .line 79
    .line 80
    iput-boolean v5, v0, Ll/pgg0;->w:Z

    .line 81
    .line 82
    iput-boolean v5, v0, Ll/pgg0;->v:Z

    .line 83
    .line 84
    const/4 v1, 0x1

    .line 85
    iput-boolean v1, v0, Ll/pgg0;->u:Z

    .line 86
    .line 87
    sget-boolean v2, Ll/nkg0;->a:Z

    .line 88
    .line 89
    if-eqz v2, :cond_1

    .line 90
    .line 91
    iput-boolean v1, v0, Ll/pgg0;->o:Z

    .line 92
    .line 93
    const-string v2, ""

    .line 94
    .line 95
    iput-object v2, v0, Ll/pgg0;->q:Ljava/lang/String;

    .line 96
    .line 97
    iput-boolean v1, v0, Ll/pgg0;->t:Z

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    iput-boolean v5, v0, Ll/pgg0;->o:Z

    .line 101
    .line 102
    const-string v2, ""

    .line 103
    .line 104
    iput-object v2, v0, Ll/pgg0;->q:Ljava/lang/String;

    .line 105
    .line 106
    iput-boolean v5, v0, Ll/pgg0;->t:Z

    .line 107
    .line 108
    :goto_0
    sget-object v2, Ll/arg0;->a:Ll/pjg0;

    .line 109
    .line 110
    iget-object v3, v2, Ll/pjg0;->d:Ljava/util/HashMap;

    .line 111
    .line 112
    const-string v6, "disable_audio_focus"

    .line 113
    .line 114
    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    const-string v6, "true"

    .line 119
    .line 120
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    iput-boolean v3, v0, Ll/pgg0;->A:Z

    .line 125
    .line 126
    iget-object v0, v2, Ll/pjg0;->d:Ljava/util/HashMap;

    .line 127
    .line 128
    const-string v2, "keyboard_bottom_offset"

    .line 129
    .line 130
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Ljava/lang/String;

    .line 135
    .line 136
    if-eqz v0, :cond_2

    .line 137
    .line 138
    :try_start_0
    iget-object v2, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 139
    .line 140
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, v2, Ll/pgg0;->B:Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :catch_0
    move-exception v0

    .line 152
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    const-string v2, "SUDRealSudFSTAPPImpl"

    .line 157
    .line 158
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    :cond_2
    :goto_1
    iget-object v0, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 162
    .line 163
    const-string v2, "local_storage.db"

    .line 164
    .line 165
    iput-object v2, v0, Ll/pgg0;->y:Ljava/lang/String;

    .line 166
    .line 167
    const-string v2, "SudPlugin"

    .line 168
    .line 169
    iput-object v2, v0, Ll/pgg0;->s:Ljava/lang/String;

    .line 170
    .line 171
    new-instance v0, Ll/zhg0;

    .line 172
    .line 173
    invoke-direct {v0}, Ll/zhg0;-><init>()V

    .line 174
    .line 175
    .line 176
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 177
    .line 178
    iget-object v2, p0, Ll/mzg0;->c:Ljava/lang/String;

    .line 179
    .line 180
    iget-wide v6, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 181
    .line 182
    new-instance v3, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    const-string v8, "sud/mgp/user/"

    .line 185
    .line 186
    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    const-string v2, "/"

    .line 193
    .line 194
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string v2, "/data"

    .line 201
    .line 202
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    new-instance v3, Ljava/io/File;

    .line 210
    .line 211
    iget-object v6, p0, Ll/mzg0;->a:Landroid/app/Activity;

    .line 212
    .line 213
    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    invoke-direct {v3, v6, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    iget-object v3, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 225
    .line 226
    iget-object p0, p0, Ll/mzg0;->c:Ljava/lang/String;

    .line 227
    .line 228
    iget-wide v6, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 229
    .line 230
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    iget-object v6, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 235
    .line 236
    if-nez v6, :cond_3

    .line 237
    .line 238
    goto/16 :goto_11

    .line 239
    .line 240
    :cond_3
    iget-boolean v7, v3, Ll/pgg0;->l:Z

    .line 241
    .line 242
    if-eqz v7, :cond_4

    .line 243
    .line 244
    const-string p0, "WXGame"

    .line 245
    .line 246
    const-string p1, "Game.start called more than once, skipped."

    .line 247
    .line 248
    invoke-static {p0, p1}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    goto/16 :goto_11

    .line 252
    .line 253
    :cond_4
    iput-boolean v1, v3, Ll/pgg0;->l:Z

    .line 254
    .line 255
    :try_start_1
    iget v7, v3, Ll/pgg0;->z:I

    .line 256
    .line 257
    const/4 v8, 0x6

    .line 258
    if-eq v7, v8, :cond_5

    .line 259
    .line 260
    const/16 v8, 0x8

    .line 261
    .line 262
    if-eq v7, v8, :cond_5

    .line 263
    .line 264
    if-eqz v7, :cond_5

    .line 265
    .line 266
    if-ne v7, v1, :cond_6

    .line 267
    .line 268
    :cond_5
    const-string v7, "defaultOrientation"

    .line 269
    .line 270
    const-string v8, "1"

    .line 271
    .line 272
    invoke-virtual {v6, v7, v8}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 273
    .line 274
    .line 275
    :cond_6
    new-instance v6, Ljava/lang/StringBuilder;

    .line 276
    .line 277
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v7, "_"

    .line 284
    .line 285
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v6

    .line 295
    if-eqz v2, :cond_7

    .line 296
    .line 297
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 298
    .line 299
    .line 300
    move-result v7

    .line 301
    if-nez v7, :cond_8

    .line 302
    .line 303
    :cond_7
    const-string v2, "{{USER_ID}}/{{GAME_ID}}"

    .line 304
    .line 305
    :cond_8
    new-instance v7, Ljava/io/File;

    .line 306
    .line 307
    invoke-direct {v7, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    invoke-virtual {v7}, Ljava/io/File;->isAbsolute()Z

    .line 311
    .line 312
    .line 313
    move-result v7

    .line 314
    if-nez v7, :cond_9

    .line 315
    .line 316
    new-instance v7, Ljava/io/File;

    .line 317
    .line 318
    iget-object v8, v3, Ll/pgg0;->b:Landroid/app/Activity;

    .line 319
    .line 320
    invoke-virtual {v8}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 321
    .line 322
    .line 323
    move-result-object v8

    .line 324
    invoke-direct {v7, v8, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    :cond_9
    const-string v7, "{{USER_ID}}"

    .line 332
    .line 333
    invoke-virtual {v2, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 334
    .line 335
    .line 336
    move-result v7

    .line 337
    if-nez v7, :cond_a

    .line 338
    .line 339
    const-string v7, "{{GAME_ID}}"

    .line 340
    .line 341
    invoke-virtual {v2, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 342
    .line 343
    .line 344
    move-result v7

    .line 345
    if-nez v7, :cond_a

    .line 346
    .line 347
    new-instance v7, Ljava/io/File;

    .line 348
    .line 349
    const-string v8, "{{USER_ID}}/{{GAME_ID}}"

    .line 350
    .line 351
    invoke-direct {v7, v2, v8}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    :cond_a
    const-string v7, "{{USER_ID}}"

    .line 359
    .line 360
    invoke-virtual {v2, v7, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v2

    .line 364
    const-string v7, "{{GAME_ID}}"

    .line 365
    .line 366
    invoke-virtual {v2, v7, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    iget-object v7, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 371
    .line 372
    iget-object v8, v7, Ll/yxg0;->b:Ll/sxg0;

    .line 373
    .line 374
    iput-object v2, v8, Ll/sxg0;->c:Ljava/lang/String;

    .line 375
    .line 376
    iget-boolean v2, v3, Ll/pgg0;->o:Z

    .line 377
    .line 378
    iput-boolean v2, v8, Ll/sxg0;->a:Z

    .line 379
    .line 380
    new-instance v2, Ljava/lang/StringBuilder;

    .line 381
    .line 382
    const-string v8, ""

    .line 383
    .line 384
    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    iget v8, v3, Ll/pgg0;->p:I

    .line 388
    .line 389
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v2

    .line 396
    const-string v8, "runtime.mode"

    .line 397
    .line 398
    invoke-virtual {v7, v8, v2}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    iget-object v2, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 402
    .line 403
    iget-object v7, v3, Ll/pgg0;->n:Ljava/lang/String;

    .line 404
    .line 405
    const-string v8, "runtime.LoadPath"

    .line 406
    .line 407
    invoke-virtual {v2, v8, v7}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    iget-object v2, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 411
    .line 412
    const-string v7, "wx.launchOptions"

    .line 413
    .line 414
    :try_start_2
    new-instance v8, Lorg/json/JSONObject;

    .line 415
    .line 416
    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 417
    .line 418
    .line 419
    iget-wide v9, v0, Ll/zhg0;->a:J

    .line 420
    .line 421
    const-wide/16 v11, 0x0

    .line 422
    .line 423
    cmp-long v9, v9, v11

    .line 424
    .line 425
    if-nez v9, :cond_b

    .line 426
    .line 427
    const-wide/16 v9, 0x3e9

    .line 428
    .line 429
    iput-wide v9, v0, Ll/zhg0;->a:J

    .line 430
    .line 431
    goto :goto_2

    .line 432
    :catch_1
    move-exception v0

    .line 433
    goto :goto_3

    .line 434
    :cond_b
    :goto_2
    const-string v9, "scene"

    .line 435
    .line 436
    iget-wide v10, v0, Ll/zhg0;->a:J

    .line 437
    .line 438
    invoke-virtual {v8, v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 439
    .line 440
    .line 441
    iget-object v9, v0, Ll/zhg0;->b:Ljava/lang/String;

    .line 442
    .line 443
    if-eqz v9, :cond_c

    .line 444
    .line 445
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 446
    .line 447
    .line 448
    move-result v9

    .line 449
    if-nez v9, :cond_d

    .line 450
    .line 451
    :cond_c
    const-string v9, "{}"

    .line 452
    .line 453
    iput-object v9, v0, Ll/zhg0;->b:Ljava/lang/String;

    .line 454
    .line 455
    :cond_d
    const-string v9, "query"

    .line 456
    .line 457
    iget-object v0, v0, Ll/zhg0;->b:Ljava/lang/String;

    .line 458
    .line 459
    invoke-virtual {v8, v9, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 460
    .line 461
    .line 462
    const-string v0, "shareTicket"

    .line 463
    .line 464
    const-string v9, ""

    .line 465
    .line 466
    invoke-virtual {v8, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 467
    .line 468
    .line 469
    new-instance v0, Lorg/json/JSONObject;

    .line 470
    .line 471
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 472
    .line 473
    .line 474
    const-string v9, "referrerInfo"

    .line 475
    .line 476
    invoke-virtual {v8, v9, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 477
    .line 478
    .line 479
    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 483
    goto :goto_4

    .line 484
    :goto_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 485
    .line 486
    .line 487
    const-string v0, "{}"

    .line 488
    .line 489
    :goto_4
    invoke-virtual {v2, v7, v0}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 490
    .line 491
    .line 492
    iget-object v0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 493
    .line 494
    iget-object v2, v3, Ll/pgg0;->q:Ljava/lang/String;

    .line 495
    .line 496
    const-string v7, "wx.packHost"

    .line 497
    .line 498
    invoke-virtual {v0, v7, v2}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    iget-object v0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 502
    .line 503
    iget-object v2, v3, Ll/pgg0;->r:Ljava/lang/String;

    .line 504
    .line 505
    const-string v7, "wx.packExt"

    .line 506
    .line 507
    invoke-virtual {v0, v7, v2}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 508
    .line 509
    .line 510
    iget-object v0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 511
    .line 512
    iget-object v2, v3, Ll/pgg0;->s:Ljava/lang/String;

    .line 513
    .line 514
    const-string v7, "wx.pluginPath"

    .line 515
    .line 516
    invoke-virtual {v0, v7, v2}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 517
    .line 518
    .line 519
    iget-object v0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 520
    .line 521
    const-string v2, "wx.identification"

    .line 522
    .line 523
    invoke-virtual {v0, v2, v6}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 524
    .line 525
    .line 526
    iget-object v0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 527
    .line 528
    const-string v2, "wx.gameId"

    .line 529
    .line 530
    invoke-virtual {v0, v2, p1}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 531
    .line 532
    .line 533
    iget-object v0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 534
    .line 535
    const-string v2, "wx.userId"

    .line 536
    .line 537
    invoke-virtual {v0, v2, p0}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 538
    .line 539
    .line 540
    iget-object v0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 541
    .line 542
    iget-object v2, v3, Ll/pgg0;->x:Ljava/lang/String;

    .line 543
    .line 544
    const-string v6, "systemLanguage"

    .line 545
    .line 546
    invoke-virtual {v0, v6, v2}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 547
    .line 548
    .line 549
    iget-object v0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 550
    .line 551
    const-string v2, "disableAudioFocus"

    .line 552
    .line 553
    iget-boolean v6, v3, Ll/pgg0;->A:Z

    .line 554
    .line 555
    if-eqz v6, :cond_e

    .line 556
    .line 557
    const-string v6, "true"

    .line 558
    .line 559
    goto :goto_5

    .line 560
    :cond_e
    const-string v6, "false"

    .line 561
    .line 562
    :goto_5
    invoke-virtual {v0, v2, v6}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 563
    .line 564
    .line 565
    iget-object v0, v3, Ll/pgg0;->B:Ljava/lang/Integer;

    .line 566
    .line 567
    if-eqz v0, :cond_f

    .line 568
    .line 569
    iget-object v0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 570
    .line 571
    new-instance v2, Ljava/lang/StringBuilder;

    .line 572
    .line 573
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 574
    .line 575
    .line 576
    iget-object v6, v3, Ll/pgg0;->B:Ljava/lang/Integer;

    .line 577
    .line 578
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 579
    .line 580
    .line 581
    const-string v6, ""

    .line 582
    .line 583
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 584
    .line 585
    .line 586
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v2

    .line 590
    const-string v6, "keyboardBottomOffset"

    .line 591
    .line 592
    invoke-virtual {v0, v6, v2}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    .line 594
    .line 595
    :cond_f
    iget-boolean v0, v3, Ll/pgg0;->u:Z

    .line 596
    .line 597
    if-nez v0, :cond_10

    .line 598
    .line 599
    iget-object v0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 600
    .line 601
    const-string v2, "jsConsole.noLogcat"

    .line 602
    .line 603
    const-string v6, "1"

    .line 604
    .line 605
    invoke-virtual {v0, v2, v6}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 606
    .line 607
    .line 608
    :cond_10
    iget-object v0, v3, Ll/pgg0;->y:Ljava/lang/String;

    .line 609
    .line 610
    if-eqz v0, :cond_11

    .line 611
    .line 612
    const-string v2, "{{USER_ID}}"

    .line 613
    .line 614
    invoke-virtual {v0, v2, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 615
    .line 616
    .line 617
    move-result-object p0

    .line 618
    const-string v0, "{{GAME_ID}}"

    .line 619
    .line 620
    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 621
    .line 622
    .line 623
    move-result-object p0

    .line 624
    iget-object p1, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 625
    .line 626
    const-string v0, "localStorageDb"

    .line 627
    .line 628
    invoke-virtual {p1, v0, p0}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 629
    .line 630
    .line 631
    :cond_11
    iget-boolean p0, v3, Ll/pgg0;->t:Z

    .line 632
    .line 633
    if-eqz p0, :cond_12

    .line 634
    .line 635
    iget-object p0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 636
    .line 637
    const-string p1, "jsConsole"

    .line 638
    .line 639
    const-string v0, "1"

    .line 640
    .line 641
    invoke-virtual {p0, p1, v0}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 642
    .line 643
    .line 644
    iget-object p0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 645
    .line 646
    const-string p1, "jsConsole.autoCreate"

    .line 647
    .line 648
    const-string v0, "0"

    .line 649
    .line 650
    invoke-virtual {p0, p1, v0}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 651
    .line 652
    .line 653
    :cond_12
    iget-boolean p0, v3, Ll/pgg0;->w:Z

    .line 654
    .line 655
    if-nez p0, :cond_13

    .line 656
    .line 657
    iget-object p0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 658
    .line 659
    const-string p1, "sysUIVis"

    .line 660
    .line 661
    const-string v0, "0"

    .line 662
    .line 663
    invoke-virtual {p0, p1, v0}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 664
    .line 665
    .line 666
    :cond_13
    iget-boolean p0, v3, Ll/pgg0;->v:Z

    .line 667
    .line 668
    if-nez p0, :cond_14

    .line 669
    .line 670
    iget-object p0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 671
    .line 672
    const-string p1, "activityLifecycle"

    .line 673
    .line 674
    const-string v0, "0"

    .line 675
    .line 676
    invoke-virtual {p0, p1, v0}, Ll/yxg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    :cond_14
    iget-object p0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 680
    .line 681
    iget-object p1, p0, Ll/yxg0;->e:Ljava/util/HashMap;

    .line 682
    .line 683
    if-nez p1, :cond_15

    .line 684
    .line 685
    new-instance p1, Ljava/util/HashMap;

    .line 686
    .line 687
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 688
    .line 689
    .line 690
    goto :goto_6

    .line 691
    :cond_15
    invoke-virtual {p1}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    .line 692
    .line 693
    .line 694
    move-result-object p1

    .line 695
    check-cast p1, Ljava/util/HashMap;

    .line 696
    .line 697
    :goto_6
    const-string v0, "Entry"

    .line 698
    .line 699
    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    .line 701
    .line 702
    iget-object p2, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 703
    .line 704
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 705
    .line 706
    .line 707
    const-string p2, "0"

    .line 708
    .line 709
    const-string v0, "loadingTimeout"

    .line 710
    .line 711
    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 712
    .line 713
    .line 714
    iget-object p2, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 715
    .line 716
    iget-boolean p2, p2, Ll/sxg0;->a:Z

    .line 717
    .line 718
    if-eqz p2, :cond_16

    .line 719
    .line 720
    const-string p2, "fps.show"

    .line 721
    .line 722
    const-string v0, "true"

    .line 723
    .line 724
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    .line 726
    .line 727
    iget-object p2, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 728
    .line 729
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 730
    .line 731
    .line 732
    const-wide/16 v6, 0x1e

    .line 733
    .line 734
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 735
    .line 736
    .line 737
    move-result-object p2

    .line 738
    invoke-virtual {p2}, Ljava/lang/Long;->toString()Ljava/lang/String;

    .line 739
    .line 740
    .line 741
    move-result-object p2

    .line 742
    const-string v0, "fps.logTime"

    .line 743
    .line 744
    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 745
    .line 746
    .line 747
    :cond_16
    const-string p2, "nativeRender"

    .line 748
    .line 749
    iget-object v0, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 750
    .line 751
    iget-boolean v0, v0, Ll/sxg0;->b:Z

    .line 752
    .line 753
    if-eqz v0, :cond_17

    .line 754
    .line 755
    const-string v0, "NO"

    .line 756
    .line 757
    goto :goto_7

    .line 758
    :cond_17
    const-string v0, "YES"

    .line 759
    .line 760
    :goto_7
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 761
    .line 762
    .line 763
    iget-object p2, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 764
    .line 765
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 766
    .line 767
    .line 768
    const-string p2, "nativeGLBatch"

    .line 769
    .line 770
    const-string v0, "NO"

    .line 771
    .line 772
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 773
    .line 774
    .line 775
    iget-object p2, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 776
    .line 777
    iget-object p2, p2, Ll/sxg0;->c:Ljava/lang/String;

    .line 778
    .line 779
    const-string v0, "cachePath"

    .line 780
    .line 781
    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 782
    .line 783
    .line 784
    iget-object p2, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 785
    .line 786
    iget-object p2, p2, Ll/sxg0;->d:Ljava/lang/String;

    .line 787
    .line 788
    const-string v0, "preloadPath"

    .line 789
    .line 790
    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 791
    .line 792
    .line 793
    iget-object p2, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 794
    .line 795
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 796
    .line 797
    .line 798
    const-string p2, "transparent"

    .line 799
    .line 800
    const-string v0, "0"

    .line 801
    .line 802
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 803
    .line 804
    .line 805
    const-string p2, "immersiveMode"

    .line 806
    .line 807
    iget-object v0, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 808
    .line 809
    iget-boolean v0, v0, Ll/sxg0;->e:Z

    .line 810
    .line 811
    if-eqz v0, :cond_18

    .line 812
    .line 813
    const-string v0, "1"

    .line 814
    .line 815
    goto :goto_8

    .line 816
    :cond_18
    const-string v0, "0"

    .line 817
    .line 818
    :goto_8
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 819
    .line 820
    .line 821
    const-string p2, "useCutout"

    .line 822
    .line 823
    iget-object v0, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 824
    .line 825
    iget-boolean v0, v0, Ll/sxg0;->f:Z

    .line 826
    .line 827
    if-eqz v0, :cond_19

    .line 828
    .line 829
    const-string v0, "1"

    .line 830
    .line 831
    goto :goto_9

    .line 832
    :cond_19
    const-string v0, "0"

    .line 833
    .line 834
    :goto_9
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 835
    .line 836
    .line 837
    iget-object p2, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 838
    .line 839
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 840
    .line 841
    .line 842
    const-string p2, "enableOrientation"

    .line 843
    .line 844
    const-string v0, "0"

    .line 845
    .line 846
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 847
    .line 848
    .line 849
    const-string p2, "SudNative"

    .line 850
    .line 851
    const-string v0, "NativePlayerFactory precreate"

    .line 852
    .line 853
    invoke-static {p2, v0}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 854
    .line 855
    .line 856
    :try_start_3
    new-instance p2, Ltech/sud/runtime/a/c;

    .line 857
    .line 858
    invoke-direct {p2}, Ltech/sud/runtime/a/c;-><init>()V

    .line 859
    .line 860
    .line 861
    iput-object p2, p0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 862
    .line 863
    goto :goto_a

    .line 864
    :catch_2
    move-exception p2

    .line 865
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 866
    .line 867
    .line 868
    new-instance v0, Ljava/lang/StringBuilder;

    .line 869
    .line 870
    const-string v2, "NativePlayerFactory CreatePlayer error:"

    .line 871
    .line 872
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 873
    .line 874
    .line 875
    invoke-static {p2}, Ll/ysg0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 876
    .line 877
    .line 878
    move-result-object p2

    .line 879
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 880
    .line 881
    .line 882
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 883
    .line 884
    .line 885
    move-result-object p2

    .line 886
    const-string v0, "SudNative"

    .line 887
    .line 888
    invoke-static {v0, p2}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 889
    .line 890
    .line 891
    :goto_a
    iget-object p2, p0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 892
    .line 893
    if-nez p2, :cond_1a

    .line 894
    .line 895
    const-string p0, "Unable to create player object."

    .line 896
    .line 897
    invoke-static {p0}, Ll/ysg0;->b(Ljava/lang/String;)V

    .line 898
    .line 899
    .line 900
    goto/16 :goto_11

    .line 901
    .line 902
    :cond_1a
    sget-object p2, Ll/yxg0;->h:Ll/geg0;

    .line 903
    .line 904
    if-nez p2, :cond_1c

    .line 905
    .line 906
    iget-object p2, p0, Ll/yxg0;->f:Ll/geg0;

    .line 907
    .line 908
    if-eqz p2, :cond_1c

    .line 909
    .line 910
    const-class p2, Ll/yxg0;

    .line 911
    .line 912
    monitor-enter p2

    .line 913
    :try_start_4
    sget-object v0, Ll/yxg0;->h:Ll/geg0;

    .line 914
    .line 915
    if-nez v0, :cond_1b

    .line 916
    .line 917
    iget-object v0, p0, Ll/yxg0;->f:Ll/geg0;

    .line 918
    .line 919
    if-eqz v0, :cond_1b

    .line 920
    .line 921
    sput-object v0, Ll/yxg0;->h:Ll/geg0;

    .line 922
    .line 923
    iget-object v2, p0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 924
    .line 925
    invoke-interface {v2, v0}, Ltech/sud/runtime/a/a;->a(Ltech/sud/runtime/a/b;)V

    .line 926
    .line 927
    .line 928
    goto :goto_b

    .line 929
    :catchall_0
    move-exception p0

    .line 930
    goto :goto_c

    .line 931
    :cond_1b
    :goto_b
    monitor-exit p2

    .line 932
    goto :goto_d

    .line 933
    :goto_c
    monitor-exit p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 934
    throw p0

    .line 935
    :cond_1c
    :goto_d
    iget-object p2, p0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 936
    .line 937
    iget-object v0, p0, Ll/yxg0;->a:Landroid/app/Activity;

    .line 938
    .line 939
    invoke-interface {p2, v0, p1}, Ltech/sud/runtime/a/a;->a(Landroid/app/Activity;Ljava/util/HashMap;)V

    .line 940
    .line 941
    .line 942
    iget-object p1, p0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 943
    .line 944
    invoke-interface {p1}, Ltech/sud/runtime/a/a;->e()[Ljava/lang/String;

    .line 945
    .line 946
    .line 947
    move-result-object p1

    .line 948
    array-length p2, p1

    .line 949
    const/4 v0, 0x2

    .line 950
    if-lt p2, v0, :cond_23

    .line 951
    .line 952
    aget-object p2, p1, v5

    .line 953
    .line 954
    aget-object v0, p1, v1

    .line 955
    .line 956
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 957
    .line 958
    .line 959
    move-result p2

    .line 960
    if-nez p2, :cond_1d

    .line 961
    .line 962
    goto/16 :goto_10

    .line 963
    .line 964
    :cond_1d
    aget-object p1, p1, v5

    .line 965
    .line 966
    iget-object p1, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 967
    .line 968
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 969
    .line 970
    .line 971
    iget-object p1, p0, Ll/yxg0;->g:Ljava/util/HashMap;

    .line 972
    .line 973
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 974
    .line 975
    .line 976
    move-result-object p1

    .line 977
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 978
    .line 979
    .line 980
    move-result-object p1

    .line 981
    :goto_e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 982
    .line 983
    .line 984
    move-result p2

    .line 985
    if-eqz p2, :cond_1e

    .line 986
    .line 987
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 988
    .line 989
    .line 990
    move-result-object p2

    .line 991
    check-cast p2, Ljava/util/Map$Entry;

    .line 992
    .line 993
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 994
    .line 995
    .line 996
    move-result-object v0

    .line 997
    check-cast v0, Ljava/lang/String;

    .line 998
    .line 999
    iget-object v2, p0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 1000
    .line 1001
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 1002
    .line 1003
    .line 1004
    move-result-object p2

    .line 1005
    check-cast p2, Ltech/sud/runtime/a/a$a;

    .line 1006
    .line 1007
    invoke-interface {v2, v0, p2}, Ltech/sud/runtime/a/a;->a(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 1008
    .line 1009
    .line 1010
    goto :goto_e

    .line 1011
    :cond_1e
    iget-object p1, p0, Ll/yxg0;->g:Ljava/util/HashMap;

    .line 1012
    .line 1013
    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    .line 1014
    .line 1015
    .line 1016
    iput-boolean v1, p0, Ll/yxg0;->d:Z

    .line 1017
    .line 1018
    iget-object p0, v3, Ll/pgg0;->j:Landroid/widget/FrameLayout;

    .line 1019
    .line 1020
    iget-object p1, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 1021
    .line 1022
    iget-object p1, p1, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 1023
    .line 1024
    if-nez p1, :cond_1f

    .line 1025
    .line 1026
    const/4 p1, 0x0

    .line 1027
    goto :goto_f

    .line 1028
    :cond_1f
    invoke-interface {p1}, Ltech/sud/runtime/a/a;->a()Ljava/lang/Object;

    .line 1029
    .line 1030
    .line 1031
    move-result-object p1

    .line 1032
    check-cast p1, Landroid/widget/FrameLayout;

    .line 1033
    .line 1034
    :goto_f
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 1035
    .line 1036
    invoke-direct {p2, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1037
    .line 1038
    .line 1039
    invoke-virtual {p0, p1, v4, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 1040
    .line 1041
    .line 1042
    iget-object p0, v3, Ll/pgg0;->m:Landroid/widget/FrameLayout;

    .line 1043
    .line 1044
    if-nez p0, :cond_20

    .line 1045
    .line 1046
    new-instance p0, Landroid/widget/FrameLayout;

    .line 1047
    .line 1048
    iget-object p1, v3, Ll/pgg0;->b:Landroid/app/Activity;

    .line 1049
    .line 1050
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 1051
    .line 1052
    .line 1053
    iput-object p0, v3, Ll/pgg0;->m:Landroid/widget/FrameLayout;

    .line 1054
    .line 1055
    :cond_20
    iget-object p0, v3, Ll/pgg0;->j:Landroid/widget/FrameLayout;

    .line 1056
    .line 1057
    iget-object p1, v3, Ll/pgg0;->m:Landroid/widget/FrameLayout;

    .line 1058
    .line 1059
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 1060
    .line 1061
    invoke-direct {p2, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1062
    .line 1063
    .line 1064
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1065
    .line 1066
    .line 1067
    iget-object p0, v3, Ll/pgg0;->j:Landroid/widget/FrameLayout;

    .line 1068
    .line 1069
    iget-object p1, v3, Ll/pgg0;->k:Landroid/widget/FrameLayout;

    .line 1070
    .line 1071
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 1072
    .line 1073
    invoke-direct {p2, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1074
    .line 1075
    .line 1076
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1077
    .line 1078
    .line 1079
    iget-object p0, v3, Ll/pgg0;->g:Ll/sig0;

    .line 1080
    .line 1081
    if-nez p0, :cond_21

    .line 1082
    .line 1083
    new-instance p0, Ll/sig0;

    .line 1084
    .line 1085
    iget-object p1, v3, Ll/pgg0;->b:Landroid/app/Activity;

    .line 1086
    .line 1087
    invoke-direct {p0, p1, v3}, Ll/sig0;-><init>(Landroid/app/Activity;Ll/pgg0;)V

    .line 1088
    .line 1089
    .line 1090
    iput-object p0, v3, Ll/pgg0;->g:Ll/sig0;

    .line 1091
    .line 1092
    :cond_21
    iget-boolean p0, v3, Ll/pgg0;->t:Z

    .line 1093
    .line 1094
    if-eqz p0, :cond_25

    .line 1095
    .line 1096
    iget-object p0, v3, Ll/pgg0;->a:Ll/yxg0;

    .line 1097
    .line 1098
    iget-object p1, v3, Ll/pgg0;->j:Landroid/widget/FrameLayout;

    .line 1099
    .line 1100
    iget-object p0, p0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 1101
    .line 1102
    if-nez p0, :cond_22

    .line 1103
    .line 1104
    goto :goto_12

    .line 1105
    :cond_22
    invoke-interface {p0, p1}, Ltech/sud/runtime/a/a;->a(Landroid/widget/FrameLayout;)V

    .line 1106
    .line 1107
    .line 1108
    goto :goto_12

    .line 1109
    :cond_23
    :goto_10
    array-length p0, p1

    .line 1110
    if-ge v5, p0, :cond_24

    .line 1111
    .line 1112
    new-instance p0, Ljava/lang/StringBuilder;

    .line 1113
    .line 1114
    const-string p2, "index:"

    .line 1115
    .line 1116
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1117
    .line 1118
    .line 1119
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1120
    .line 1121
    .line 1122
    const-string p2, "  version:"

    .line 1123
    .line 1124
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1125
    .line 1126
    .line 1127
    aget-object p2, p1, v5

    .line 1128
    .line 1129
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1130
    .line 1131
    .line 1132
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1133
    .line 1134
    .line 1135
    move-result-object p0

    .line 1136
    invoke-static {p0}, Ll/ysg0;->b(Ljava/lang/String;)V

    .line 1137
    .line 1138
    .line 1139
    add-int/lit8 v5, v5, 0x1

    .line 1140
    .line 1141
    goto :goto_10

    .line 1142
    :cond_24
    const-string p0, "Versions of jar and so are different."

    .line 1143
    .line 1144
    invoke-static {p0}, Ll/ysg0;->b(Ljava/lang/String;)V

    .line 1145
    .line 1146
    .line 1147
    goto :goto_11

    .line 1148
    :catch_3
    move-exception p0

    .line 1149
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 1150
    .line 1151
    .line 1152
    const-string p0, "WXGame"

    .line 1153
    .line 1154
    const-string p1, "read game.json failed"

    .line 1155
    .line 1156
    invoke-static {p0, p1}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 1157
    .line 1158
    .line 1159
    :goto_11
    const-string p0, "SUDRealSudFSTAPPImpl"

    .line 1160
    .line 1161
    const-string p1, "error _game->start failed."

    .line 1162
    .line 1163
    invoke-static {p0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1164
    .line 1165
    .line 1166
    sget-object p0, Ll/mzg0;->k:Ljava/lang/String;

    .line 1167
    .line 1168
    const-string p1, "_game->start failed."

    .line 1169
    .line 1170
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1171
    .line 1172
    .line 1173
    :cond_25
    :goto_12
    return-void

    .line 1174
    :cond_26
    const-string p0, "SUDRealSudFSTAPPImpl"

    .line 1175
    .line 1176
    const-string p1, "error _startGame This device does not support OpenGL ES 2.0."

    .line 1177
    .line 1178
    invoke-static {p0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1179
    .line 1180
    .line 1181
    const-string p0, "_startGame This device does not support OpenGL ES 2.0."

    .line 1182
    .line 1183
    invoke-static {v0, p0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1184
    .line 1185
    .line 1186
    return-void
.end method

.method public final c(Ltech/sud/gip/core/GameInfo;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/mzg0;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "SUDRealSudFSTAPPImpl"

    .line 7
    .line 8
    const-string v1, "exeCommonGameReload"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/pgg0;->a()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 22
    .line 23
    :cond_1
    invoke-virtual {p0, p1, p2}, Ll/mzg0;->b(Ltech/sud/gip/core/GameInfo;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final destroyMG()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/mzg0;->j:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iput-boolean v1, p0, Ll/mzg0;->j:Z

    .line 7
    .line 8
    const-string v0, "SUDRealSudFSTAPPImpl"

    .line 9
    .line 10
    const-string v2, "_destroyMGInternal"

    .line 11
    .line 12
    invoke-static {v0, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Ll/mzg0;->k:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, v2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/pgg0;->a()V

    .line 25
    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    iput-object v2, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 29
    .line 30
    iget-object v2, p0, Ll/mzg0;->h:Ll/slg0;

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    check-cast v2, Ll/wyg0;

    .line 35
    .line 36
    iget-object v2, v2, Ll/wyg0;->c:Ljava/lang/ref/WeakReference;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Ltech/sud/gip/core/ISudFSMMG;

    .line 43
    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    const-string v3, "onGameDestroyed"

    .line 47
    .line 48
    invoke-static {v0, v3}, Ltech/sud/gip/logger/SudLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v2}, Ltech/sud/gip/core/ISudFSMMG;->onGameDestroyed()V

    .line 52
    .line 53
    .line 54
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    .line 55
    .line 56
    new-instance v2, Ll/kog0;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/kog0;-><init>(Ll/mzg0;)V

    .line 59
    .line 60
    .line 61
    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 65
    .line 66
    .line 67
    :cond_1
    return v1
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
    sget-object v0, Ll/mzg0;->k:Ljava/lang/String;

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
    iget-object p0, p0, Ll/mzg0;->h:Ll/slg0;

    .line 15
    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    check-cast p0, Ll/wyg0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/wyg0;->j:Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ljava/lang/String;

    .line 27
    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    const-string p0, "{}"

    .line 31
    .line 32
    :cond_1
    return-object p0

    .line 33
    :cond_2
    const-string p0, ""

    .line 34
    .line 35
    return-object p0
.end method

.method public final getGameView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mzg0;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
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
    sget-object v0, Ll/mzg0;->k:Ljava/lang/String;

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
    iget-object p0, p0, Ll/mzg0;->h:Ll/slg0;

    .line 15
    .line 16
    if-eqz p0, :cond_3

    .line 17
    .line 18
    check-cast p0, Ll/wyg0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/wyg0;->k:Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ljava/util/Map;

    .line 27
    .line 28
    const-string p1, "{}"

    .line 29
    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    return-object p1

    .line 33
    :cond_1
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/String;

    .line 38
    .line 39
    if-nez p0, :cond_2

    .line 40
    .line 41
    return-object p1

    .line 42
    :cond_2
    return-object p0

    .line 43
    :cond_3
    const-string p0, ""

    .line 44
    .line 45
    return-object p0
.end method

.method public final notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V
    .locals 4

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
    sget-object v0, Ll/mzg0;->k:Ljava/lang/String;

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
    iget-object v0, p0, Ll/mzg0;->h:Ll/slg0;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast v0, Ll/wyg0;

    .line 19
    .line 20
    iget-object v0, v0, Ll/wyg0;->l:Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 26
    .line 27
    const/4 v1, -0x1

    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    new-instance v0, Lorg/json/JSONObject;

    .line 31
    .line 32
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 33
    .line 34
    .line 35
    :try_start_0
    const-string v2, "state"

    .line 36
    .line 37
    invoke-virtual {v0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 38
    .line 39
    .line 40
    new-instance p1, Lorg/json/JSONObject;

    .line 41
    .line 42
    invoke-direct {p1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const-string p2, "dataJson"

    .line 46
    .line 47
    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x0

    .line 51
    goto :goto_0

    .line 52
    :catch_0
    move-exception p1

    .line 53
    new-instance p2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v2, "error \u53d1\u9001\u7ed9\u6e38\u620f\u7684\u6d88\u606f\u683c\u5f0f\u9519\u8bef\uff1a"

    .line 56
    .line 57
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    :goto_0
    if-eqz p1, :cond_2

    .line 79
    .line 80
    if-eqz p3, :cond_5

    .line 81
    .line 82
    invoke-interface {p3, v1, p1}, Ltech/sud/gip/core/ISudListenerNotifyStateChange;->onFailure(ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string p2, "notifyStateChange:"

    .line 89
    .line 90
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const-string p2, "SUDRealSudFSTAPPImpl"

    .line 105
    .line 106
    invoke-static {p2, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 110
    .line 111
    new-instance p1, Ll/azg0;

    .line 112
    .line 113
    invoke-direct {p1, p3}, Ll/azg0;-><init>(Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 117
    .line 118
    .line 119
    const-string p2, "custom.CustomCommandEvent"

    .line 120
    .line 121
    iget-object p3, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 122
    .line 123
    if-eqz p3, :cond_5

    .line 124
    .line 125
    :try_start_1
    new-instance p3, Lorg/json/JSONObject;

    .line 126
    .line 127
    invoke-direct {p3}, Lorg/json/JSONObject;-><init>()V

    .line 128
    .line 129
    .line 130
    const-string v1, "cmd"

    .line 131
    .line 132
    invoke-virtual {p3, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 133
    .line 134
    .line 135
    const-string p2, "id"

    .line 136
    .line 137
    iget-object v1, p0, Ll/pgg0;->f:Landroid/util/SparseArray;

    .line 138
    .line 139
    monitor-enter v1
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 140
    :try_start_2
    iget v2, p0, Ll/pgg0;->e:I

    .line 141
    .line 142
    add-int/lit8 v2, v2, 0x1

    .line 143
    .line 144
    iput v2, p0, Ll/pgg0;->e:I

    .line 145
    .line 146
    iget-object v3, p0, Ll/pgg0;->f:Landroid/util/SparseArray;

    .line 147
    .line 148
    invoke-virtual {v3, v2, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    :try_start_3
    invoke-virtual {p3, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 153
    .line 154
    .line 155
    const-string p1, "data"

    .line 156
    .line 157
    invoke-virtual {p3, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 161
    .line 162
    const-string p1, "RTGlobalEvent"

    .line 163
    .line 164
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    iget-object p0, p0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 169
    .line 170
    if-nez p0, :cond_3

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_3
    invoke-interface {p0, p1, p2}, Ltech/sud/runtime/a/a;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 174
    .line 175
    .line 176
    goto :goto_1

    .line 177
    :catchall_0
    move-exception p0

    .line 178
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 179
    :try_start_5
    throw p0
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1

    .line 180
    :catch_1
    move-exception p0

    .line 181
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    const-string p1, "WXGame"

    .line 186
    .line 187
    invoke-static {p1, p0}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_4
    if-eqz p3, :cond_5

    .line 192
    .line 193
    const-string p0, "This game has been destroyed"

    .line 194
    .line 195
    invoke-interface {p3, v1, p0}, Ltech/sud/gip/core/ISudListenerNotifyStateChange;->onFailure(ILjava/lang/String;)V

    .line 196
    .line 197
    .line 198
    :cond_5
    :goto_1
    return-void
.end method

.method public final pauseMG()V
    .locals 3

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
    sget-object v0, Ll/mzg0;->k:Ljava/lang/String;

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
    iget-object v0, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    const-string v0, "{}"

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    const-string v2, "a2ms-notify-pause-game"

    .line 22
    .line 23
    invoke-virtual {p0, v2, v0, v1}, Ll/mzg0;->notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 29
    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 33
    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-interface {p0}, Ltech/sud/runtime/a/a;->c()V

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_0
    return-void
.end method

.method public final playMG()V
    .locals 3

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
    sget-object v0, Ll/mzg0;->k:Ljava/lang/String;

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
    iget-object v0, p0, Ll/mzg0;->e:Ll/pgg0;

    .line 15
    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    iget-object v0, v0, Ll/pgg0;->a:Ll/yxg0;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, v0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-interface {v0}, Ltech/sud/runtime/a/a;->d()V

    .line 28
    .line 29
    .line 30
    :cond_2
    :goto_0
    const-string v0, "{}"

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    const-string v2, "a2ms-notify-resume-game"

    .line 34
    .line 35
    invoke-virtual {p0, v2, v0, v1}, Ll/mzg0;->notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 36
    .line 37
    .line 38
    :cond_3
    return-void
.end method

.method public final pushAudio(Ljava/nio/ByteBuffer;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final reloadMG()V
    .locals 0

    .line 1
    return-void
.end method

.method public final startMG()V
    .locals 1

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/mzg0;->k:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "Please call on UI or Main thread"

    .line 10
    .line 11
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final stopMG()V
    .locals 1

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/mzg0;->k:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "Please call on UI or Main thread"

    .line 10
    .line 11
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final updateCode(Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V
    .locals 3

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
    sget-object v0, Ll/mzg0;->k:Ljava/lang/String;

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
    iget-boolean v0, p0, Ll/mzg0;->j:Z

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    const/4 p0, -0x1

    .line 21
    const-string p1, "This Game has been destroyed"

    .line 22
    .line 23
    invoke-interface {p2, p0, p1}, Ltech/sud/gip/core/ISudListenerNotifyStateChange;->onFailure(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void

    .line 27
    :cond_2
    iget-object v0, p0, Ll/mzg0;->h:Ll/slg0;

    .line 28
    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    check-cast v0, Ll/wyg0;

    .line 32
    .line 33
    iput-object p1, v0, Ll/wyg0;->f:Ljava/lang/String;

    .line 34
    .line 35
    :cond_3
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 36
    .line 37
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v1, "ret_code"

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    const-string v1, "ret_msg"

    .line 47
    .line 48
    const-string v2, "success"

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    const-string v1, "code"

    .line 54
    .line 55
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    goto :goto_0

    .line 63
    :catch_0
    move-exception p1

    .line 64
    sget-object v0, Ll/mzg0;->k:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {v0, p1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    const-string p1, ""

    .line 74
    .line 75
    :goto_0
    const-string v0, "a2ms-update-code"

    .line 76
    .line 77
    invoke-virtual {p0, v0, p1, p2}, Ll/mzg0;->notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
