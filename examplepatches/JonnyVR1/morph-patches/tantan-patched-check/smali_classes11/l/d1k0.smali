.class public Ll/d1k0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:J

.field public static final b:J

.field public static final c:J

.field public static d:J

.field public static e:Ljava/lang/String;

.field public static f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-wide/32 v0, 0x36ee80

    .line 2
    .line 3
    .line 4
    sput-wide v0, Ll/d1k0;->b:J

    .line 5
    .line 6
    const-wide/32 v2, 0x2932e00

    .line 7
    .line 8
    .line 9
    sput-wide v2, Ll/d1k0;->c:J

    .line 10
    .line 11
    sput-wide v0, Ll/d1k0;->d:J

    .line 12
    .line 13
    const-string v0, ""

    .line 14
    .line 15
    sput-object v0, Ll/d1k0;->e:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Ll/d1k0;->f:Lrx/subjects/a;

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic c(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/UpdateApiResult;)V
    .locals 8

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/d1k0;->f:Lrx/subjects/a;

    .line 4
    .line 5
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Ll/d1k0;->f:Lrx/subjects/a;

    .line 12
    .line 13
    iget-boolean v1, p2, Lcom/p1/mobile/putong/data/UpdateApiResult;->hasUpdate:Z

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-boolean v0, p2, Lcom/p1/mobile/putong/data/UpdateApiResult;->hasUpdate:Z

    .line 23
    .line 24
    if-eqz v0, :cond_a

    .line 25
    .line 26
    if-eqz p0, :cond_a

    .line 27
    .line 28
    sget-object p0, Ll/d1k0;->e:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    sget-object p0, Ll/d1k0;->e:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v0, p2, Lcom/p1/mobile/putong/data/UpdateApiResult;->appVersion:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    :cond_1
    iget-object p0, p2, Lcom/p1/mobile/putong/data/UpdateApiResult;->appVersion:Ljava/lang/String;

    .line 47
    .line 48
    sput-object p0, Ll/d1k0;->e:Ljava/lang/String;

    .line 49
    .line 50
    const-wide/16 v0, 0x0

    .line 51
    .line 52
    sput-wide v0, Ll/d1k0;->a:J

    .line 53
    .line 54
    sget-wide v0, Ll/d1k0;->b:J

    .line 55
    .line 56
    sput-wide v0, Ll/d1k0;->d:J

    .line 57
    .line 58
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    sget-wide v2, Ll/d1k0;->a:J

    .line 63
    .line 64
    sub-long/2addr v0, v2

    .line 65
    sget-wide v2, Ll/d1k0;->d:J

    .line 66
    .line 67
    cmp-long p0, v0, v2

    .line 68
    .line 69
    if-ltz p0, :cond_a

    .line 70
    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    sput-wide v0, Ll/d1k0;->a:J

    .line 76
    .line 77
    const-string p0, "p_alert_version_upgrade_popup"

    .line 78
    .line 79
    const-string v0, "updateDlg"

    .line 80
    .line 81
    invoke-static {p0, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_alert_version_upgrade_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const-string v6, "swipe_page"

    .line 100
    .line 101
    const-string v7, "version_upgrade"

    .line 102
    .line 103
    const-string v2, "passive"

    .line 104
    .line 105
    const-string v3, "alert"

    .line 106
    .line 107
    const-string v4, "alert_system"

    .line 108
    .line 109
    const-string v5, "null"

    .line 110
    .line 111
    invoke-static/range {v2 .. v7}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v0, v1, v2}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p0, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 120
    .line 121
    .line 122
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 123
    .line 124
    invoke-direct {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 125
    .line 126
    .line 127
    sget v1, Lcom/p1/mobile/putong/core/R$string;->dr:I

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget-object v1, p2, Lcom/p1/mobile/putong/data/UpdateApiResult;->appVersion:Ljava/lang/String;

    .line 134
    .line 135
    iget-object v2, p2, Lcom/p1/mobile/putong/data/UpdateApiResult;->changelog:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    filled-new-array {v1}, [Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->adapterChangeLog(Ljava/util/ArrayList;)Ll/a;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->p(Landroid/widget/ListAdapter;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    sget v1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 158
    .line 159
    new-instance v2, Ll/w0k0;

    .line 160
    .line 161
    invoke-direct {v2, p2}, Ll/w0k0;-><init>(Lcom/p1/mobile/putong/data/UpdateApiResult;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->p0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-static {}, Ll/ls4;->a()Z

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    const/4 v2, 0x0

    .line 173
    const/4 v3, 0x1

    .line 174
    if-nez v1, :cond_3

    .line 175
    .line 176
    invoke-static {}, Ll/uxw;->b()Z

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    if-eqz v1, :cond_3

    .line 181
    .line 182
    move v1, v3

    .line 183
    goto :goto_0

    .line 184
    :cond_3
    move v1, v2

    .line 185
    :goto_0
    invoke-static {}, Ll/ls4;->a()Z

    .line 186
    .line 187
    .line 188
    move-result v4

    .line 189
    if-eqz v4, :cond_4

    .line 190
    .line 191
    iget-boolean v4, p2, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceGoToMarket:Z

    .line 192
    .line 193
    if-nez v4, :cond_4

    .line 194
    .line 195
    move v2, v3

    .line 196
    :cond_4
    invoke-static {}, Ll/ls4;->a()Z

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    if-eqz v4, :cond_5

    .line 201
    .line 202
    move v2, v3

    .line 203
    :cond_5
    if-eqz v1, :cond_6

    .line 204
    .line 205
    sget v1, Lcom/p1/mobile/putong/core/R$string;->er:I

    .line 206
    .line 207
    new-instance v4, Ll/x0k0;

    .line 208
    .line 209
    invoke-direct {v4, p1}, Ll/x0k0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0, v1, v4}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    :cond_6
    if-eqz v2, :cond_9

    .line 217
    .line 218
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    const-string v4, "auto_update_apk_in_wifi_mode"

    .line 227
    .line 228
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    iget-object v5, p2, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/ui/download/a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 243
    .line 244
    .line 245
    move-result-object v5

    .line 246
    invoke-virtual {v5, v4}, Lcom/p1/mobile/putong/ui/download/a;->n(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 247
    .line 248
    .line 249
    if-eqz v1, :cond_8

    .line 250
    .line 251
    if-eqz v2, :cond_8

    .line 252
    .line 253
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 254
    .line 255
    const/16 v2, 0x1e

    .line 256
    .line 257
    if-lt v1, v2, :cond_7

    .line 258
    .line 259
    if-lt v1, v2, :cond_8

    .line 260
    .line 261
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-static {v1}, Ll/q0k0;->a(Landroid/content/pm/PackageManager;)Z

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    if-eqz v1, :cond_8

    .line 270
    .line 271
    :cond_7
    invoke-static {}, Ll/f6g0;->a()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    invoke-static {p2, v1, v3, p1}, Ll/d1k0;->r(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;)V

    .line 276
    .line 277
    .line 278
    :cond_8
    sget v1, Lcom/p1/mobile/putong/core/R$string;->cr:I

    .line 279
    .line 280
    new-instance v2, Ll/y0k0;

    .line 281
    .line 282
    invoke-direct {v2, p1, p2}, Ll/y0k0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/UpdateApiResult;)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    :cond_9
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    new-instance v0, Ll/z0k0;

    .line 294
    .line 295
    invoke-direct {v0, p2}, Ll/z0k0;-><init>(Lcom/p1/mobile/putong/data/UpdateApiResult;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->A(Landroid/content/DialogInterface$OnCancelListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    new-instance p2, Ll/a1k0;

    .line 303
    .line 304
    invoke-direct {p2, p0}, Ll/a1k0;-><init>(Ll/l4g0;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 312
    .line 313
    .line 314
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 315
    .line 316
    .line 317
    :cond_a
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/UpdateApiResult;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/f6g0;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p0, p2, p1}, Ll/d1k0;->t(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/UpdateApiResult;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/d1k0;->w(Lcom/p1/mobile/putong/data/UpdateApiResult;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/d1k0;->v(Lcom/p1/mobile/android/app/Act;Ljava/io/File;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/UpdateApiResult;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/d1k0;->w(Lcom/p1/mobile/putong/data/UpdateApiResult;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/data/UpdateApiResult;Lcom/p1/mobile/android/app/Act;ZLjava/io/File;)V
    .locals 0

    .line 1
    invoke-static {p0, p3, p1, p2}, Ll/d1k0;->n(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/io/File;Lcom/p1/mobile/android/app/Act;Z)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget-wide v0, Ll/d1k0;->b:J

    .line 2
    .line 3
    sput-wide v0, Ll/d1k0;->d:J

    .line 4
    .line 5
    :try_start_0
    invoke-static {p0}, Ll/uxw;->d(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/UpdateApiResult;)V
    .locals 2

    .line 1
    sget-wide v0, Ll/d1k0;->b:J

    .line 2
    .line 3
    sput-wide v0, Ll/d1k0;->d:J

    .line 4
    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v1, 0x1a

    .line 8
    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/q0k0;->a(Landroid/content/pm/PackageManager;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-static {p0}, Ll/d1k0;->y(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/b1k0;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/b1k0;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/c1k0;

    .line 43
    .line 44
    invoke-direct {v1, p1, p0}, Ll/c1k0;-><init>(Lcom/p1/mobile/putong/data/UpdateApiResult;Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    invoke-static {}, Ll/f6g0;->a()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {p1, v0, p0}, Ll/d1k0;->t(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->p4:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static m(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/io/File;Lcom/p1/mobile/android/app/Act;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/d1k0;->n(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/io/File;Lcom/p1/mobile/android/app/Act;Z)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static n(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/io/File;Lcom/p1/mobile/android/app/Act;Z)Z
    .locals 0

    .line 1
    if-eqz p3, :cond_2

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->md5:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/d1k0;->p(Ljava/lang/String;Ljava/io/File;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 19
    .line 20
    .line 21
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->q4:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_2
    :goto_0
    new-instance p0, Ll/t0k0;

    .line 29
    .line 30
    invoke-direct {p0, p2, p1}, Ll/t0k0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/io/File;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public static o(Ljava/io/File;)Ljava/lang/String;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "MD5"

    .line 3
    .line 4
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 5
    .line 6
    .line 7
    move-result-object v1
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_4

    .line 8
    :try_start_1
    new-instance v2, Ljava/io/FileInputStream;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_3

    .line 11
    .line 12
    .line 13
    const/16 p0, 0x2000

    .line 14
    .line 15
    new-array p0, p0, [B

    .line 16
    .line 17
    :goto_0
    :try_start_2
    invoke-virtual {v2, p0}, Ljava/io/InputStream;->read([B)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-virtual {v1, p0, v3, v0}, Ljava/security/MessageDigest;->update([BII)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_2

    .line 30
    :catch_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance v0, Ljava/math/BigInteger;

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-direct {v0, v1, p0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 40
    .line 41
    .line 42
    const/16 p0, 0x10

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string v0, "%32s"

    .line 49
    .line 50
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const/16 v0, 0x20

    .line 59
    .line 60
    const/16 v1, 0x30

    .line 61
    .line 62
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 66
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 67
    .line 68
    .line 69
    return-object p0

    .line 70
    :catch_1
    move-exception v0

    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    return-object p0

    .line 75
    :goto_1
    :try_start_4
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/lang/RuntimeException;

    .line 79
    .line 80
    const-string v1, "Unable to process file for MD5"

    .line 81
    .line 82
    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 86
    :goto_2
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 87
    .line 88
    .line 89
    goto :goto_3

    .line 90
    :catch_2
    move-exception v0

    .line 91
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    :goto_3
    throw p0

    .line 95
    :catch_3
    move-exception p0

    .line 96
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    return-object v0

    .line 100
    :catch_4
    move-exception p0

    .line 101
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    return-object v0
.end method

.method public static p(Ljava/lang/String;Ljava/io/File;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {p1}, Ll/d1k0;->o(Ljava/io/File;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_2
    :goto_0
    return v1
.end method

.method public static q(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 4

    .line 1
    sget-wide v0, Ll/d1k0;->a:J

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sput-wide v0, Ll/d1k0;->a:J

    .line 16
    .line 17
    :cond_0
    sget-object v0, Ll/d1k0;->f:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    sget-wide v2, Ll/d1k0;->a:J

    .line 30
    .line 31
    sub-long/2addr v0, v2

    .line 32
    sget-wide v2, Ll/d1k0;->d:J

    .line 33
    .line 34
    cmp-long v0, v0, v2

    .line 35
    .line 36
    if-ltz v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void

    .line 40
    :cond_2
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->e:Lcom/p1/mobile/putong/core/api/g0;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g0;->a3()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/u0k0;

    .line 47
    .line 48
    invoke-direct {v1, p1, p0}, Ll/u0k0;-><init>(ZLcom/p1/mobile/android/app/Act;)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Ll/v0k0;

    .line 52
    .line 53
    invoke-direct {p0}, Ll/v0k0;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static r(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Ll/d1k0;->s(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static s(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;Z)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v5, Ll/r0k0;

    .line 14
    .line 15
    invoke-direct {v5, p0, p3, p4}, Ll/r0k0;-><init>(Lcom/p1/mobile/putong/data/UpdateApiResult;Lcom/p1/mobile/android/app/Act;Z)V

    .line 16
    .line 17
    .line 18
    new-instance v6, Ll/s0k0;

    .line 19
    .line 20
    invoke-direct {v6}, Ll/s0k0;-><init>()V

    .line 21
    .line 22
    .line 23
    move-object v3, p1

    .line 24
    move v4, p2

    .line 25
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/ui/download/a;->q(Ll/rg50;Ljava/lang/String;Ljava/lang/String;ZLl/y20;Ll/y20;)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static t(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->F()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    new-instance p1, Ljava/io/File;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, p1, p2}, Ll/d1k0;->m(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/io/File;Lcom/p1/mobile/android/app/Act;)Z

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->A()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    sget p0, Lcom/p1/mobile/putong/core/R$string;->p4:I

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->R(Z)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 49
    .line 50
    .line 51
    sget p0, Lcom/p1/mobile/putong/core/R$string;->br:I

    .line 52
    .line 53
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    new-instance v0, Ljava/io/File;

    .line 58
    .line 59
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    new-instance v0, Ljava/io/File;

    .line 69
    .line 70
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p0, v0, p2}, Ll/d1k0;->m(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/io/File;Lcom/p1/mobile/android/app/Act;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    return-void

    .line 80
    :cond_3
    invoke-static {}, Ll/cxv;->b()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    const-string v0, "\u5f00\u59cb\u4e0b\u8f7d"

    .line 87
    .line 88
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_4
    invoke-static {p0, p1, v1, p2}, Ll/d1k0;->r(Lcom/p1/mobile/putong/data/UpdateApiResult;Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public static u(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "files."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p0, v0, p1}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static v(Lcom/p1/mobile/android/app/Act;Ljava/io/File;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "android.intent.action.VIEW"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p0, p1}, Ll/d1k0;->u(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v1, "application/vnd.android.package-archive"

    .line 17
    .line 18
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/high16 v0, 0x10000000

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    move-exception p0

    .line 37
    new-instance p1, Ljava/lang/Exception;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v1, "UpdateChecker exception:"

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-direct {p1, v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    const/16 p0, 0x3e8

    .line 61
    .line 62
    invoke-static {p1, p0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static w(Lcom/p1/mobile/putong/data/UpdateApiResult;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/d1k0;->z()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/download/a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/download/a;->n(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static x(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    sput-wide v0, Ll/d1k0;->a:J

    .line 4
    .line 5
    sget-wide v0, Ll/d1k0;->b:J

    .line 6
    .line 7
    sput-wide v0, Ll/d1k0;->d:J

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/d1k0;->q(Lcom/p1/mobile/android/app/Act;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static y(Landroid/content/Context;)V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1a
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "package:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Landroid/content/Intent;

    .line 24
    .line 25
    const-string v2, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    .line 26
    .line 27
    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 28
    .line 29
    .line 30
    const/high16 v0, 0x10000000

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static z()V
    .locals 4

    .line 1
    sget-wide v0, Ll/d1k0;->d:J

    .line 2
    .line 3
    const-wide/16 v2, 0x2

    .line 4
    .line 5
    mul-long/2addr v0, v2

    .line 6
    sget-wide v2, Ll/d1k0;->c:J

    .line 7
    .line 8
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    sput-wide v0, Ll/d1k0;->d:J

    .line 13
    .line 14
    return-void
.end method
