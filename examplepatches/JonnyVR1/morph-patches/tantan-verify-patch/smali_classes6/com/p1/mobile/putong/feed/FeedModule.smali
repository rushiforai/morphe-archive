.class public Lcom/p1/mobile/putong/feed/FeedModule;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/putong/module/Module;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "FeedModule"
    path = "/feed_module/module"
.end annotation


# static fields
.field public static a:Landroid/app/Application;

.field public static b:Lcom/p1/mobile/putong/feed/api/a;

.field public static c:Lcom/p1/mobile/putong/feed/api/b;

.field public static d:Ll/jka;

.field public static e:Ll/ms8;

.field public static f:Ll/oka;

.field public static g:Ll/jl8;

.field public static h:Ll/cu9;

.field public static i:Ll/qzg;


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

.method public static F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    return-object v0
.end method

.method public static H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    return-object v0
.end method

.method public static M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 4
    .line 5
    return-object v0
.end method

.method public static Um(Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "clear_feed_cache_threshold"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->A(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v4, v0, v2

    .line 14
    .line 15
    if-lez v4, :cond_6

    .line 16
    .line 17
    new-instance v4, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    new-instance v5, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v6, "FeedModule reportCacheSize when "

    .line 22
    .line 23
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v4, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    const-string p0, "corePhotoAlbum.momentsMap="

    .line 41
    .line 42
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 46
    .line 47
    iget-object p0, p0, Ll/jka;->i0:Ljava/util/Map;

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p0, "corePhotoAlbum.momentVoiceLiveInfosMap="

    .line 57
    .line 58
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 62
    .line 63
    iget-object p0, p0, Ll/jka;->h0:Ljava/util/Map;

    .line 64
    .line 65
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p0, "corePhotoAlbum.usersMap="

    .line 73
    .line 74
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 78
    .line 79
    iget-object p0, p0, Ll/jka;->A0:Ljava/util/Map;

    .line 80
    .line 81
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string p0, "corePhotoAlbum.userStatesMap="

    .line 89
    .line 90
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 94
    .line 95
    iget-object p0, p0, Ll/jka;->M0:Ljava/util/Map;

    .line 96
    .line 97
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string p0, "corePhotoAlbum.commentsMap="

    .line 105
    .line 106
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 110
    .line 111
    iget-object p0, p0, Ll/jka;->H0:Ljava/util/Map;

    .line 112
    .line 113
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 121
    .line 122
    iget-object p0, p0, Ll/jka;->i0:Ljava/util/Map;

    .line 123
    .line 124
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    int-to-long v2, p0

    .line 129
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 130
    .line 131
    iget-object p0, p0, Ll/jka;->h0:Ljava/util/Map;

    .line 132
    .line 133
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    int-to-long v5, p0

    .line 138
    add-long/2addr v2, v5

    .line 139
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 140
    .line 141
    iget-object p0, p0, Ll/jka;->A0:Ljava/util/Map;

    .line 142
    .line 143
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    int-to-long v5, p0

    .line 148
    add-long/2addr v2, v5

    .line 149
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 150
    .line 151
    iget-object p0, p0, Ll/jka;->M0:Ljava/util/Map;

    .line 152
    .line 153
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    int-to-long v5, p0

    .line 158
    add-long/2addr v2, v5

    .line 159
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 160
    .line 161
    iget-object p0, p0, Ll/jka;->H0:Ljava/util/Map;

    .line 162
    .line 163
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    int-to-long v5, p0

    .line 168
    add-long/2addr v2, v5

    .line 169
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 170
    .line 171
    if-eqz p0, :cond_2

    .line 172
    .line 173
    iget-object p0, p0, Ll/cu9;->I:Ljava/util/HashMap;

    .line 174
    .line 175
    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    if-eqz v5, :cond_2

    .line 188
    .line 189
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    check-cast v5, Ljava/lang/String;

    .line 194
    .line 195
    sget-object v6, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 196
    .line 197
    invoke-virtual {v6, v5}, Ll/cu9;->u0(Ljava/lang/String;)Ljava/util/HashMap;

    .line 198
    .line 199
    .line 200
    move-result-object v6

    .line 201
    const-string v7, "coreMlnPhotoAlbum."

    .line 202
    .line 203
    if-nez v6, :cond_1

    .line 204
    .line 205
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v5, "= null"

    .line 212
    .line 213
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    goto :goto_0

    .line 217
    :cond_1
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v5, "="

    .line 224
    .line 225
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v6}, Ljava/util/HashMap;->size()I

    .line 229
    .line 230
    .line 231
    move-result v5

    .line 232
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v6}, Ljava/util/HashMap;->size()I

    .line 236
    .line 237
    .line 238
    move-result v5

    .line 239
    int-to-long v5, v5

    .line 240
    add-long/2addr v2, v5

    .line 241
    goto :goto_0

    .line 242
    :cond_2
    cmp-long p0, v2, v0

    .line 243
    .line 244
    if-ltz p0, :cond_6

    .line 245
    .line 246
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 247
    .line 248
    if-eqz p0, :cond_3

    .line 249
    .line 250
    iget-object p0, p0, Ll/jka;->i0:Ljava/util/Map;

    .line 251
    .line 252
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 253
    .line 254
    .line 255
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 256
    .line 257
    iget-object p0, p0, Ll/jka;->h0:Ljava/util/Map;

    .line 258
    .line 259
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 260
    .line 261
    .line 262
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 263
    .line 264
    iget-object p0, p0, Ll/jka;->A0:Ljava/util/Map;

    .line 265
    .line 266
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 267
    .line 268
    .line 269
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 270
    .line 271
    iget-object p0, p0, Ll/jka;->M0:Ljava/util/Map;

    .line 272
    .line 273
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 274
    .line 275
    .line 276
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 277
    .line 278
    iget-object p0, p0, Ll/jka;->H0:Ljava/util/Map;

    .line 279
    .line 280
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 281
    .line 282
    .line 283
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 284
    .line 285
    if-eqz p0, :cond_5

    .line 286
    .line 287
    iget-object p0, p0, Ll/cu9;->I:Ljava/util/HashMap;

    .line 288
    .line 289
    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    :cond_4
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-eqz v0, :cond_5

    .line 302
    .line 303
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    check-cast v0, Ljava/lang/String;

    .line 308
    .line 309
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 310
    .line 311
    invoke-virtual {v1, v0}, Ll/cu9;->u0(Ljava/lang/String;)Ljava/util/HashMap;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    if-eqz v0, :cond_4

    .line 316
    .line 317
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 318
    .line 319
    .line 320
    goto :goto_1

    .line 321
    :cond_5
    new-instance p0, Ljava/lang/RuntimeException;

    .line 322
    .line 323
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 331
    .line 332
    .line 333
    :cond_6
    return-void
.end method


# virtual methods
.method public Ec()V
    .locals 0

    .line 1
    new-instance p0, Ll/cmg;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cmg;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Ll/o8h;

    .line 10
    .line 11
    invoke-direct {p0}, Ll/o8h;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/ryh;->c()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final J()V
    .locals 0

    .line 1
    invoke-static {}, Ll/pfh0;->a()Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    sput-object p0, Ll/pu20;->j:Ljava/util/HashSet;

    .line 6
    .line 7
    return-void
.end method

.method public Jh()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final K()V
    .locals 3

    .line 1
    invoke-static {}, Ll/pu20;->k()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/pu20;->r()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, ""

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 18
    .line 19
    const-string v2, "p_discover_discussion"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/jka;->d7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-static {}, Ll/pu20;->q()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 35
    .line 36
    const-string v0, "p_discover_dating"

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Ll/jka;->d7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 39
    .line 40
    .line 41
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 42
    .line 43
    const-string v0, "p_like"

    .line 44
    .line 45
    invoke-virtual {p0, v0, v1}, Ll/jka;->d7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final L()V
    .locals 2

    .line 1
    new-instance v0, Ll/cu9;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cu9;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/api/a;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/api/a;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/feed/api/b;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/api/b;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 21
    .line 22
    new-instance v0, Ll/jka;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/jka;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 28
    .line 29
    new-instance v0, Ll/oka;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/oka;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->f:Ll/oka;

    .line 35
    .line 36
    invoke-static {}, Ll/cmg;->l0()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/jka;->Mc()Lrx/c;

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/FeedModule;->K()V

    .line 48
    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 51
    .line 52
    const/4 v1, 0x1

    .line 53
    invoke-virtual {v0, v1}, Ll/jka;->i8(Z)Lrx/c;

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/cmg;->u0()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/jka;->E7()Lrx/c;

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-static {}, Ll/cmg;->x()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 74
    .line 75
    const-string v1, "brand"

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ll/jka;->Q7(Ljava/lang/String;)Lrx/c;

    .line 78
    .line 79
    .line 80
    :cond_2
    new-instance v0, Ll/ms8;

    .line 81
    .line 82
    invoke-direct {v0}, Ll/ms8;-><init>()V

    .line 83
    .line 84
    .line 85
    sput-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 86
    .line 87
    new-instance v0, Ll/jl8;

    .line 88
    .line 89
    invoke-direct {v0}, Ll/jl8;-><init>()V

    .line 90
    .line 91
    .line 92
    sput-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->g:Ll/jl8;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/FeedModule;->J()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public Ma()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qzg;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v0, Ll/qzg;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/qzg;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/l9c;->y(Ll/h9c;)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 21
    .line 22
    return-void
.end method

.method public Qh()V
    .locals 1

    .line 1
    invoke-static {}, Ll/rxh;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-class v0, Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-class v0, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewBridgeImplementation;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/cqq;->h(Ljava/lang/Class;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/ifh;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/ifh;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v0, "tantan_moment"

    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/w0c;->O(Ljava/lang/String;Ll/scj;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public ft()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/app/Application;

    .line 2
    .line 3
    sput-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 4
    .line 5
    return-void
.end method

.method public ms()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequestsAndStop()V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequestsAndStop()V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/jka;->clearRequestsAndStop()V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->f:Ll/oka;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequestsAndStop()V

    .line 19
    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequestsAndStop()V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/k110;->b()V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    sput p0, Ll/ksg;->a:I

    .line 31
    .line 32
    invoke-static {}, Ll/qvm;->d()Ll/qvm;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/qvm;->i()V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/b5i;->m()Ll/b5i;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/b5i;->w()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    return-void
.end method

.method public onTrimMemory(I)V
    .locals 0

    return-void
.end method

.method public tr(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->FeedAfterSignIn:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/FeedModule;->L()V

    .line 11
    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {}, Ll/fci$a;->c()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public zf()V
    .locals 0

    .line 1
    return-void
.end method
