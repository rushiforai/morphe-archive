.class public final Landroidx/profileinstaller/e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/profileinstaller/e$c;,
        Landroidx/profileinstaller/e$b;,
        Landroidx/profileinstaller/e$a;
    }
.end annotation


# static fields
.field public static final a:Ll/t3d0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/t3d0<",
            "Landroidx/profileinstaller/e$c;",
            ">;"
        }
    .end annotation
.end field

.field public static final b:Ljava/lang/Object;

.field public static c:Landroidx/profileinstaller/e$c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ll/t3d0;->a()Ll/t3d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Landroidx/profileinstaller/e;->a:Ll/t3d0;

    .line 6
    .line 7
    new-instance v0, Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Landroidx/profileinstaller/e;->b:Ljava/lang/Object;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-object v0, Landroidx/profileinstaller/e;->c:Landroidx/profileinstaller/e$c;

    .line 16
    .line 17
    return-void
.end method

.method public static a(Landroid/content/Context;)J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 10
    .line 11
    const/16 v2, 0x21

    .line 12
    .line 13
    if-lt v1, v2, :cond_0

    .line 14
    .line 15
    invoke-static {v0, p0}, Landroidx/profileinstaller/e$a;->a(Landroid/content/pm/PackageManager;Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-wide v0, p0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 20
    .line 21
    return-wide v0

    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-wide v0, p0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 32
    .line 33
    return-wide v0
.end method

.method public static b(IZZZ)Landroidx/profileinstaller/e$c;
    .locals 1

    .line 1
    new-instance v0, Landroidx/profileinstaller/e$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Landroidx/profileinstaller/e$c;-><init>(IZZZ)V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/profileinstaller/e;->c:Landroidx/profileinstaller/e$c;

    .line 7
    .line 8
    sget-object p0, Landroidx/profileinstaller/e;->a:Ll/t3d0;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/t3d0;->set(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    sget-object p0, Landroidx/profileinstaller/e;->c:Landroidx/profileinstaller/e$c;

    .line 14
    .line 15
    return-object p0
.end method

.method public static c(Landroid/content/Context;Z)Landroidx/profileinstaller/e$c;
    .locals 19
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Landroidx/profileinstaller/e;->c:Landroidx/profileinstaller/e$c;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    sget-object v1, Landroidx/profileinstaller/e;->b:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    :try_start_0
    sget-object v0, Landroidx/profileinstaller/e;->c:Landroidx/profileinstaller/e$c;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    return-object v0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto/16 :goto_a

    .line 21
    .line 22
    :cond_1
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    const/4 v5, 0x0

    .line 26
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v6, "dexopt/baseline.prof"

    .line 31
    .line 32
    invoke-virtual {v0, v6}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    .line 33
    .line 34
    .line 35
    move-result-object v6
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    :try_start_2
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    .line 37
    .line 38
    .line 39
    move-result-wide v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 40
    cmp-long v0, v7, v2

    .line 41
    .line 42
    if-lez v0, :cond_2

    .line 43
    .line 44
    move v0, v4

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    move v0, v5

    .line 47
    :goto_0
    :try_start_3
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :catchall_1
    move-exception v0

    .line 52
    move-object v7, v0

    .line 53
    if-eqz v6, :cond_3

    .line 54
    .line 55
    :try_start_4
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :catchall_2
    move-exception v0

    .line 60
    :try_start_5
    invoke-virtual {v7, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_1
    throw v7
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 64
    :catch_0
    move v0, v5

    .line 65
    :goto_2
    :try_start_6
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 66
    .line 67
    const/16 v7, 0x1c

    .line 68
    .line 69
    if-lt v6, v7, :cond_11

    .line 70
    .line 71
    const/16 v7, 0x1e

    .line 72
    .line 73
    if-ne v6, v7, :cond_4

    .line 74
    .line 75
    goto/16 :goto_9

    .line 76
    .line 77
    :cond_4
    new-instance v6, Ljava/io/File;

    .line 78
    .line 79
    new-instance v7, Ljava/io/File;

    .line 80
    .line 81
    const-string v8, "/data/misc/profiles/ref/"

    .line 82
    .line 83
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v9

    .line 87
    invoke-direct {v7, v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const-string v8, "primary.prof"

    .line 91
    .line 92
    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v6}, Ljava/io/File;->length()J

    .line 96
    .line 97
    .line 98
    move-result-wide v7

    .line 99
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    if-eqz v6, :cond_5

    .line 104
    .line 105
    cmp-long v6, v7, v2

    .line 106
    .line 107
    if-lez v6, :cond_5

    .line 108
    .line 109
    move v6, v4

    .line 110
    goto :goto_3

    .line 111
    :cond_5
    move v6, v5

    .line 112
    :goto_3
    new-instance v9, Ljava/io/File;

    .line 113
    .line 114
    new-instance v10, Ljava/io/File;

    .line 115
    .line 116
    const-string v11, "/data/misc/profiles/cur/0/"

    .line 117
    .line 118
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v12

    .line 122
    invoke-direct {v10, v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    const-string v11, "primary.prof"

    .line 126
    .line 127
    invoke-direct {v9, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v9}, Ljava/io/File;->length()J

    .line 131
    .line 132
    .line 133
    move-result-wide v17

    .line 134
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    .line 135
    .line 136
    .line 137
    move-result v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 138
    if-eqz v9, :cond_6

    .line 139
    .line 140
    cmp-long v2, v17, v2

    .line 141
    .line 142
    if-lez v2, :cond_6

    .line 143
    .line 144
    move v2, v4

    .line 145
    goto :goto_4

    .line 146
    :cond_6
    move v2, v5

    .line 147
    :goto_4
    :try_start_7
    invoke-static/range {p0 .. p0}, Landroidx/profileinstaller/e;->a(Landroid/content/Context;)J

    .line 148
    .line 149
    .line 150
    move-result-wide v15
    :try_end_7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 151
    :try_start_8
    new-instance v3, Ljava/io/File;

    .line 152
    .line 153
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 154
    .line 155
    .line 156
    move-result-object v9

    .line 157
    const-string v10, "profileInstalled"

    .line 158
    .line 159
    invoke-direct {v3, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 163
    .line 164
    .line 165
    move-result v9
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 166
    if-eqz v9, :cond_7

    .line 167
    .line 168
    :try_start_9
    invoke-static {v3}, Landroidx/profileinstaller/e$b;->a(Ljava/io/File;)Landroidx/profileinstaller/e$b;

    .line 169
    .line 170
    .line 171
    move-result-object v9
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 172
    goto :goto_5

    .line 173
    :catch_1
    const/high16 v3, 0x20000

    .line 174
    .line 175
    :try_start_a
    invoke-static {v3, v6, v2, v0}, Landroidx/profileinstaller/e;->b(IZZZ)Landroidx/profileinstaller/e$c;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    monitor-exit v1

    .line 180
    return-object v0

    .line 181
    :cond_7
    const/4 v9, 0x0

    .line 182
    :goto_5
    const/4 v10, 0x2

    .line 183
    if-eqz v9, :cond_9

    .line 184
    .line 185
    iget-wide v11, v9, Landroidx/profileinstaller/e$b;->c:J

    .line 186
    .line 187
    cmp-long v11, v11, v15

    .line 188
    .line 189
    if-nez v11, :cond_9

    .line 190
    .line 191
    iget v11, v9, Landroidx/profileinstaller/e$b;->b:I

    .line 192
    .line 193
    if-ne v11, v10, :cond_8

    .line 194
    .line 195
    goto :goto_6

    .line 196
    :cond_8
    move v5, v11

    .line 197
    goto :goto_7

    .line 198
    :cond_9
    :goto_6
    if-nez v0, :cond_a

    .line 199
    .line 200
    const/high16 v5, 0x50000

    .line 201
    .line 202
    goto :goto_7

    .line 203
    :cond_a
    if-eqz v6, :cond_b

    .line 204
    .line 205
    move v5, v4

    .line 206
    goto :goto_7

    .line 207
    :cond_b
    if-eqz v2, :cond_c

    .line 208
    .line 209
    move v5, v10

    .line 210
    :cond_c
    :goto_7
    if-eqz p1, :cond_d

    .line 211
    .line 212
    if-eqz v2, :cond_d

    .line 213
    .line 214
    if-eq v5, v4, :cond_d

    .line 215
    .line 216
    move v5, v10

    .line 217
    :cond_d
    if-eqz v9, :cond_e

    .line 218
    .line 219
    iget v11, v9, Landroidx/profileinstaller/e$b;->b:I

    .line 220
    .line 221
    if-ne v11, v10, :cond_e

    .line 222
    .line 223
    if-ne v5, v4, :cond_e

    .line 224
    .line 225
    iget-wide v10, v9, Landroidx/profileinstaller/e$b;->d:J

    .line 226
    .line 227
    cmp-long v4, v7, v10

    .line 228
    .line 229
    if-gez v4, :cond_e

    .line 230
    .line 231
    const/4 v5, 0x3

    .line 232
    :cond_e
    move v14, v5

    .line 233
    new-instance v12, Landroidx/profileinstaller/e$b;

    .line 234
    .line 235
    const/4 v13, 0x1

    .line 236
    invoke-direct/range {v12 .. v18}, Landroidx/profileinstaller/e$b;-><init>(IIJJ)V

    .line 237
    .line 238
    .line 239
    if-eqz v9, :cond_f

    .line 240
    .line 241
    invoke-virtual {v9, v12}, Landroidx/profileinstaller/e$b;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 245
    if-nez v4, :cond_10

    .line 246
    .line 247
    :cond_f
    :try_start_b
    invoke-virtual {v12, v3}, Landroidx/profileinstaller/e$b;->b(Ljava/io/File;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 248
    .line 249
    .line 250
    goto :goto_8

    .line 251
    :catch_2
    const/high16 v14, 0x30000

    .line 252
    .line 253
    :cond_10
    :goto_8
    :try_start_c
    invoke-static {v14, v6, v2, v0}, Landroidx/profileinstaller/e;->b(IZZZ)Landroidx/profileinstaller/e$c;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    monitor-exit v1

    .line 258
    return-object v0

    .line 259
    :catch_3
    const/high16 v3, 0x10000

    .line 260
    .line 261
    invoke-static {v3, v6, v2, v0}, Landroidx/profileinstaller/e;->b(IZZZ)Landroidx/profileinstaller/e$c;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    monitor-exit v1

    .line 266
    return-object v0

    .line 267
    :cond_11
    :goto_9
    const/high16 v2, 0x40000

    .line 268
    .line 269
    invoke-static {v2, v5, v5, v0}, Landroidx/profileinstaller/e;->b(IZZZ)Landroidx/profileinstaller/e$c;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    monitor-exit v1

    .line 274
    return-object v0

    .line 275
    :goto_a
    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 276
    throw v0
.end method
