.class public abstract Lcom/p1/mobile/android/app/App;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/app/App$HandledGlobally;
    }
.end annotation


# static fields
.field public static b:Z

.field public static c:Z

.field public static d:Lcom/p1/mobile/android/app/App;

.field public static e:Landroid/app/Application;

.field public static f:Z

.field public static g:J

.field public static h:Z

.field public static final i:Ll/vxd0;

.field public static final j:J

.field public static final k:Ll/byd0;

.field public static l:Z

.field public static m:J

.field public static n:J

.field public static final o:Ll/byd0;

.field public static final p:Ll/vxd0;

.field public static final q:Ll/jxd0;


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Ll/vxd0;

    .line 2
    .line 3
    const-string v1, "application_started"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 10
    .line 11
    const-wide/32 v0, 0x36ee80

    .line 12
    .line 13
    .line 14
    sput-wide v0, Lcom/p1/mobile/android/app/App;->j:J

    .line 15
    .line 16
    new-instance v0, Ll/byd0;

    .line 17
    .line 18
    const-wide/16 v3, 0x0

    .line 19
    .line 20
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v5, "previous_app_start_uptime_millis"

    .line 25
    .line 26
    invoke-direct {v0, v5, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/android/app/App;->k:Ll/byd0;

    .line 30
    .line 31
    sput-boolean v2, Lcom/p1/mobile/android/app/App;->l:Z

    .line 32
    .line 33
    sput-wide v3, Lcom/p1/mobile/android/app/App;->m:J

    .line 34
    .line 35
    sput-wide v3, Lcom/p1/mobile/android/app/App;->n:J

    .line 36
    .line 37
    new-instance v0, Ll/byd0;

    .line 38
    .line 39
    const-string v3, "aggregate_app_creation_start"

    .line 40
    .line 41
    invoke-direct {v0, v3, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/p1/mobile/android/app/App;->o:Ll/byd0;

    .line 45
    .line 46
    new-instance v0, Ll/vxd0;

    .line 47
    .line 48
    const-string v1, "aggregate_app_start_count"

    .line 49
    .line 50
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lcom/p1/mobile/android/app/App;->p:Ll/vxd0;

    .line 54
    .line 55
    new-instance v0, Ll/jxd0;

    .line 56
    .line 57
    const-string v1, "foreLivingEnable"

    .line 58
    .line 59
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 62
    .line 63
    .line 64
    sput-object v0, Lcom/p1/mobile/android/app/App;->q:Ll/jxd0;

    .line 65
    .line 66
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

.method public static synthetic a()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->k:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/App;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/App;->j()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/App;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/App;->i()V

    return-void
.end method

.method public static e()J
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Lcom/p1/mobile/android/app/App;->m:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    return-wide v0
.end method

.method public static f()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->q:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    return v0
.end method

.method public static h()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    return v0
.end method

.method private synthetic i()V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/App;->n()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic j()V
    .locals 1

    .line 1
    new-instance v0, Ll/iu0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/iu0;-><init>(Lcom/p1/mobile/android/app/App;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/xhi0;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public d()V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Ljava/lang/String;)Ljava/io/File;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/App;->l(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public l(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m()V
    .locals 7

    .line 1
    sput-object p0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 2
    .line 3
    sget-boolean v0, Lcom/p1/mobile/android/app/App;->f:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/App;->d()V

    .line 9
    .line 10
    .line 11
    sget-boolean v0, Lcom/p1/mobile/android/app/App;->b:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/oki;->v()Ljava/io/File;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "/debug.trace"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Landroid/os/Debug;->startMethodTracing(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/App;->o()V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lio/requery/android/database/sqlite/SQLiteDatabase;->uselessStaticMethod()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    int-to-long v0, v0

    .line 47
    sput-wide v0, Lcom/p1/mobile/android/app/App;->g:J

    .line 48
    .line 49
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    sput-wide v0, Lcom/p1/mobile/android/app/App;->g:J

    .line 58
    .line 59
    const-wide/32 v2, 0x4600000

    .line 60
    .line 61
    .line 62
    cmp-long v0, v0, v2

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    const/4 v2, 0x1

    .line 66
    if-gez v0, :cond_2

    .line 67
    .line 68
    move v0, v2

    .line 69
    goto :goto_0

    .line 70
    :cond_2
    move v0, v1

    .line 71
    :goto_0
    sput-boolean v0, Lcom/p1/mobile/android/app/App;->h:Z

    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    check-cast v3, Ljava/lang/Integer;

    .line 80
    .line 81
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    add-int/2addr v3, v2

    .line 86
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v0, v3}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 94
    .line 95
    .line 96
    move-result-wide v3

    .line 97
    sput-wide v3, Lcom/p1/mobile/android/app/App;->m:J

    .line 98
    .line 99
    sget-object v0, Lcom/p1/mobile/android/app/App;->o:Ll/byd0;

    .line 100
    .line 101
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    check-cast v3, Ljava/lang/Long;

    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 108
    .line 109
    .line 110
    move-result-wide v3

    .line 111
    const-wide/16 v5, 0x0

    .line 112
    .line 113
    cmp-long v3, v3, v5

    .line 114
    .line 115
    if-nez v3, :cond_3

    .line 116
    .line 117
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 118
    .line 119
    .line 120
    move-result-wide v3

    .line 121
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v0, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    check-cast v3, Ljava/lang/Long;

    .line 134
    .line 135
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 136
    .line 137
    .line 138
    move-result-wide v3

    .line 139
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 140
    .line 141
    .line 142
    move-result-wide v5

    .line 143
    cmp-long v3, v3, v5

    .line 144
    .line 145
    if-lez v3, :cond_4

    .line 146
    .line 147
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 148
    .line 149
    .line 150
    move-result-wide v3

    .line 151
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v0, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    :cond_4
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 159
    .line 160
    .line 161
    move-result-wide v3

    .line 162
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    check-cast v5, Ljava/lang/Long;

    .line 167
    .line 168
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 169
    .line 170
    .line 171
    move-result-wide v5

    .line 172
    sub-long/2addr v3, v5

    .line 173
    sget-wide v5, Lcom/p1/mobile/android/app/App;->j:J

    .line 174
    .line 175
    cmp-long v3, v3, v5

    .line 176
    .line 177
    if-lez v3, :cond_5

    .line 178
    .line 179
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 180
    .line 181
    .line 182
    move-result-wide v3

    .line 183
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    invoke-virtual {v0, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    sget-object v0, Lcom/p1/mobile/android/app/App;->p:Ll/vxd0;

    .line 191
    .line 192
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    goto :goto_2

    .line 200
    :cond_5
    sget-object v0, Lcom/p1/mobile/android/app/App;->p:Ll/vxd0;

    .line 201
    .line 202
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    check-cast v1, Ljava/lang/Integer;

    .line 207
    .line 208
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    add-int/2addr v1, v2

    .line 213
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    :goto_2
    sget-wide v0, Lcom/p1/mobile/android/app/App;->m:J

    .line 221
    .line 222
    sget-object v3, Lcom/p1/mobile/android/app/App;->k:Ll/byd0;

    .line 223
    .line 224
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    check-cast v4, Ljava/lang/Long;

    .line 229
    .line 230
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 231
    .line 232
    .line 233
    move-result-wide v4

    .line 234
    cmp-long v0, v0, v4

    .line 235
    .line 236
    if-gez v0, :cond_6

    .line 237
    .line 238
    sput-boolean v2, Lcom/p1/mobile/android/app/App;->l:Z

    .line 239
    .line 240
    :cond_6
    sget-wide v0, Lcom/p1/mobile/android/app/App;->m:J

    .line 241
    .line 242
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v3, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 250
    .line 251
    new-instance v1, Ll/gu0;

    .line 252
    .line 253
    invoke-direct {v1}, Ll/gu0;-><init>()V

    .line 254
    .line 255
    .line 256
    const-wide/32 v2, 0xea60

    .line 257
    .line 258
    .line 259
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 260
    .line 261
    .line 262
    new-instance v0, Ll/hu0;

    .line 263
    .line 264
    invoke-direct {v0, p0}, Ll/hu0;-><init>(Lcom/p1/mobile/android/app/App;)V

    .line 265
    .line 266
    .line 267
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 268
    .line 269
    .line 270
    invoke-static {}, Ll/j1e;->i()Ll/j1e;

    .line 271
    .line 272
    .line 273
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    :try_start_0
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    goto :goto_0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    :goto_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    const/16 v1, 0x1d

    .line 16
    .line 17
    if-ge v0, v1, :cond_0

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    :try_start_1
    const-class v0, Landroid/view/ViewConfiguration;

    .line 28
    .line 29
    const-string v1, "sHasPermanentMenuKey"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :catch_1
    move-exception p0

    .line 47
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catch_2
    move-exception p0

    .line 52
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    :goto_1
    invoke-static {}, Ll/ive0;->b()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public abstract o()V
.end method
