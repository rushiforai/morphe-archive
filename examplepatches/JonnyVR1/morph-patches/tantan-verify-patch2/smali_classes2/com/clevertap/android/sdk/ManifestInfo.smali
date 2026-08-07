.class public Lcom/clevertap/android/sdk/ManifestInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field private static A:Ljava/lang/String;

.field private static B:Ljava/lang/String;

.field private static C:Ljava/lang/String;

.field private static D:Ljava/lang/String;

.field private static x:Lcom/clevertap/android/sdk/ManifestInfo;

.field private static y:Ljava/lang/String;

.field private static z:Ljava/lang/String;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private final e:Ljava/lang/String;

.field private final f:Ljava/lang/String;

.field private final g:Z

.field private final h:Z

.field private final i:Ljava/lang/String;

.field private final j:Ljava/lang/String;

.field private final k:Z

.field private final l:Z

.field private final m:Z

.field private final n:Ljava/lang/String;

.field private final o:Ljava/lang/String;

.field private final p:Z

.field private final q:Ljava/lang/String;

.field private final r:Ljava/lang/String;

.field private final s:[Ljava/lang/String;

.field private final t:I

.field private final u:Ljava/lang/String;

.field private final v:Ljava/lang/String;

.field private final w:Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/16 v1, 0x80

    .line 13
    .line 14
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p1, p1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    const/4 p1, 0x0

    .line 22
    :goto_0
    if-nez p1, :cond_0

    .line 23
    .line 24
    new-instance p1, Landroid/os/Bundle;

    .line 25
    .line 26
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 27
    .line 28
    .line 29
    :cond_0
    sget-object v0, Lcom/clevertap/android/sdk/ManifestInfo;->y:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    const-string v0, "CLEVERTAP_ACCOUNT_ID"

    .line 35
    .line 36
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :goto_1
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->a:Ljava/lang/String;

    .line 41
    .line 42
    sget-object v0, Lcom/clevertap/android/sdk/ManifestInfo;->z:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    const-string v0, "CLEVERTAP_TOKEN"

    .line 48
    .line 49
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    :goto_2
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->b:Ljava/lang/String;

    .line 54
    .line 55
    sget-object v0, Lcom/clevertap/android/sdk/ManifestInfo;->A:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_3
    const-string v0, "CLEVERTAP_REGION"

    .line 61
    .line 62
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :goto_3
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->c:Ljava/lang/String;

    .line 67
    .line 68
    sget-object v0, Lcom/clevertap/android/sdk/ManifestInfo;->B:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    goto :goto_4

    .line 73
    :cond_4
    const-string v0, "CLEVERTAP_PROXY_DOMAIN"

    .line 74
    .line 75
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    :goto_4
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->d:Ljava/lang/String;

    .line 80
    .line 81
    sget-object v0, Lcom/clevertap/android/sdk/ManifestInfo;->C:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v0, :cond_5

    .line 84
    .line 85
    goto :goto_5

    .line 86
    :cond_5
    const-string v0, "CLEVERTAP_SPIKY_PROXY_DOMAIN"

    .line 87
    .line 88
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    :goto_5
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->e:Ljava/lang/String;

    .line 93
    .line 94
    sget-object v0, Lcom/clevertap/android/sdk/ManifestInfo;->D:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v0, :cond_6

    .line 97
    .line 98
    goto :goto_6

    .line 99
    :cond_6
    const-string v0, "CLEVERTAP_HANDSHAKE_DOMAIN"

    .line 100
    .line 101
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    :goto_6
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->f:Ljava/lang/String;

    .line 106
    .line 107
    const-string v0, "CLEVERTAP_NOTIFICATION_ICON"

    .line 108
    .line 109
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->i:Ljava/lang/String;

    .line 114
    .line 115
    const-string v0, "CLEVERTAP_USE_GOOGLE_AD_ID"

    .line 116
    .line 117
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const-string v1, "1"

    .line 122
    .line 123
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->g:Z

    .line 128
    .line 129
    const-string v0, "CLEVERTAP_DISABLE_APP_LAUNCHED"

    .line 130
    .line 131
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->h:Z

    .line 140
    .line 141
    const-string v0, "CLEVERTAP_INAPP_EXCLUDE"

    .line 142
    .line 143
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->j:Ljava/lang/String;

    .line 148
    .line 149
    const-string v0, "CLEVERTAP_SSL_PINNING"

    .line 150
    .line 151
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->k:Z

    .line 160
    .line 161
    const-string v0, "CLEVERTAP_BACKGROUND_SYNC"

    .line 162
    .line 163
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->l:Z

    .line 172
    .line 173
    const-string v0, "CLEVERTAP_USE_CUSTOM_ID"

    .line 174
    .line 175
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->m:Z

    .line 184
    .line 185
    const-string v0, "FCM_SENDER_ID"

    .line 186
    .line 187
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    if-eqz v0, :cond_7

    .line 192
    .line 193
    const-string v2, "id:"

    .line 194
    .line 195
    const-string v3, ""

    .line 196
    .line 197
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    :cond_7
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->n:Ljava/lang/String;

    .line 202
    .line 203
    const/4 v0, 0x0

    .line 204
    :try_start_1
    const-string v2, "CLEVERTAP_ENCRYPTION_LEVEL"

    .line 205
    .line 206
    invoke-direct {p0, p1, v2}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    if-eqz v2, :cond_8

    .line 211
    .line 212
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    goto :goto_7

    .line 217
    :catchall_1
    move-exception v2

    .line 218
    goto :goto_8

    .line 219
    :cond_8
    move v2, v0

    .line 220
    :goto_7
    if-ltz v2, :cond_9

    .line 221
    .line 222
    const/4 v3, 0x2

    .line 223
    if-gt v2, v3, :cond_9

    .line 224
    .line 225
    move v0, v2

    .line 226
    goto :goto_9

    .line 227
    :cond_9
    const-string v2, "Invalid encryption level is used, defaulting to no encryption"

    .line 228
    .line 229
    invoke-static {v2}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 230
    .line 231
    .line 232
    goto :goto_9

    .line 233
    :goto_8
    const-string v3, "Unable to parse encryption level from the Manifest, Setting it to 0 by default"

    .line 234
    .line 235
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    invoke-static {v3, v2}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 240
    .line 241
    .line 242
    :goto_9
    iput v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->t:I

    .line 243
    .line 244
    const-string v0, "CLEVERTAP_APP_PACKAGE"

    .line 245
    .line 246
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->o:Ljava/lang/String;

    .line 251
    .line 252
    const-string v0, "CLEVERTAP_BETA"

    .line 253
    .line 254
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->p:Z

    .line 263
    .line 264
    const-string v0, "CLEVERTAP_INTENT_SERVICE"

    .line 265
    .line 266
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->q:Ljava/lang/String;

    .line 271
    .line 272
    const-string v0, "CLEVERTAP_DEFAULT_CHANNEL_ID"

    .line 273
    .line 274
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->r:Ljava/lang/String;

    .line 279
    .line 280
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/ManifestInfo;->v(Landroid/os/Bundle;)[Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->s:[Ljava/lang/String;

    .line 285
    .line 286
    const-string v0, "CLEVERTAP_PROVIDER_1"

    .line 287
    .line 288
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->u:Ljava/lang/String;

    .line 293
    .line 294
    const-string v0, "CLEVERTAP_PROVIDER_2"

    .line 295
    .line 296
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    iput-object v0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->v:Ljava/lang/String;

    .line 301
    .line 302
    const-string v0, "CLEVERTAP_ENCRYPTION_IN_TRANSIT"

    .line 303
    .line 304
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    iput-object p1, p0, Lcom/clevertap/android/sdk/ManifestInfo;->w:Ljava/lang/String;

    .line 309
    .line 310
    return-void
.end method

.method private a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    :catchall_0
    :cond_0
    return-object p0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/clevertap/android/sdk/ManifestInfo;
    .locals 2

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/ManifestInfo;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/clevertap/android/sdk/ManifestInfo;->x:Lcom/clevertap/android/sdk/ManifestInfo;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/clevertap/android/sdk/ManifestInfo;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/clevertap/android/sdk/ManifestInfo;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/clevertap/android/sdk/ManifestInfo;->x:Lcom/clevertap/android/sdk/ManifestInfo;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object p0, Lcom/clevertap/android/sdk/ManifestInfo;->x:Lcom/clevertap/android/sdk/ManifestInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object p0

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw p0
.end method

.method private v(Landroid/os/Bundle;)[Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "CLEVERTAP_IDENTIFIER"

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/ManifestInfo;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const-string p1, ","

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    sget-object p0, Lcom/clevertap/android/sdk/Constants;->NULL_STRING_ARRAY:[Ljava/lang/String;

    .line 21
    .line 22
    return-object p0
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ManifestInfo: getAccountRegion called, returning region:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/clevertap/android/sdk/ManifestInfo;->c:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->c:Ljava/lang/String;

    .line 21
    .line 22
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->w:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIntentServiceName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ManifestInfo: getHandshakeDomain called, returning handshakeDomain:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/clevertap/android/sdk/ManifestInfo;->f:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->f:Ljava/lang/String;

    .line 21
    .line 22
    return-object p0
.end method

.method public l()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->s:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ManifestInfo: getProxyDomain called, returning proxyDomain:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/clevertap/android/sdk/ManifestInfo;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->d:Ljava/lang/String;

    .line 21
    .line 22
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ManifestInfo: getSpikeyProxyDomain called, returning spikeyProxyDomain:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/clevertap/android/sdk/ManifestInfo;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->e:Ljava/lang/String;

    .line 21
    .line 22
    return-object p0
.end method

.method public q()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public u()Z
    .locals 0
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public x()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/ManifestInfo;->g:Z

    .line 2
    .line 3
    return p0
.end method
