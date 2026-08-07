.class public final Ll/rbx0;
.super Ll/m8x0;
.source "SourceFile"


# instance fields
.field public final e:Landroid/content/ContentResolver;

.field public f:Landroid/net/Uri;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Landroid/content/res/AssetFileDescriptor;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Ljava/io/FileInputStream;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:J

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/m8x0;-><init>(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/rbx0;->e:Landroid/content/ContentResolver;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a([BII)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzgs;
        }
    .end annotation

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-wide v0, p0, Ll/rbx0;->i:J

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v2, v0, v2

    .line 10
    .line 11
    const/4 v3, -0x1

    .line 12
    if-eqz v2, :cond_4

    .line 13
    .line 14
    const-wide/16 v4, -0x1

    .line 15
    .line 16
    cmp-long v2, v0, v4

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    int-to-long v6, p3

    .line 21
    :try_start_0
    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->min(JJ)J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    long-to-int p3, v0

    .line 26
    :cond_1
    iget-object v0, p0, Ll/rbx0;->h:Ljava/io/FileInputStream;

    .line 27
    .line 28
    sget v1, Ll/mpw0;->a:I

    .line 29
    .line 30
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/FileInputStream;->read([BII)I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    if-ne p1, v3, :cond_2

    .line 35
    .line 36
    return v3

    .line 37
    :cond_2
    iget-wide p2, p0, Ll/rbx0;->i:J

    .line 38
    .line 39
    cmp-long v0, p2, v4

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    int-to-long v0, p1

    .line 44
    sub-long/2addr p2, v0

    .line 45
    iput-wide p2, p0, Ll/rbx0;->i:J

    .line 46
    .line 47
    :cond_3
    invoke-virtual {p0, p1}, Ll/m8x0;->zzg(I)V

    .line 48
    .line 49
    .line 50
    return p1

    .line 51
    :catch_0
    move-exception p0

    .line 52
    new-instance p1, Lcom/google/android/gms/internal/ads/zzgs;

    .line 53
    .line 54
    const/16 p2, 0x7d0

    .line 55
    .line 56
    invoke-direct {p1, p0, p2}, Lcom/google/android/gms/internal/ads/zzgs;-><init>(Ljava/io/IOException;I)V

    .line 57
    .line 58
    .line 59
    throw p1

    .line 60
    :cond_4
    return v3
.end method

.method public final e(Ll/akx0;)J
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzgs;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "Could not open file descriptor for: "

    .line 6
    .line 7
    const/4 v4, 0x1

    .line 8
    :try_start_0
    iget-object v5, v1, Ll/akx0;->a:Landroid/net/Uri;

    .line 9
    .line 10
    invoke-virtual {v5}, Landroid/net/Uri;->normalizeScheme()Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object v5

    .line 14
    iput-object v5, v0, Ll/rbx0;->f:Landroid/net/Uri;

    .line 15
    .line 16
    invoke-virtual/range {p0 .. p1}, Ll/m8x0;->k(Ll/akx0;)V

    .line 17
    .line 18
    .line 19
    const-string v6, "content"

    .line 20
    .line 21
    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    if-eqz v6, :cond_0

    .line 30
    .line 31
    new-instance v6, Landroid/os/Bundle;

    .line 32
    .line 33
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v7, "android.provider.extra.ACCEPT_ORIGINAL_MEDIA_FORMAT"

    .line 37
    .line 38
    invoke-virtual {v6, v7, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v7, v0, Ll/rbx0;->e:Landroid/content/ContentResolver;

    .line 42
    .line 43
    const-string v8, "*/*"

    .line 44
    .line 45
    invoke-virtual {v7, v5, v8, v6}, Landroid/content/ContentResolver;->openTypedAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/res/AssetFileDescriptor;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception v0

    .line 51
    const/16 v6, 0x7d0

    .line 52
    .line 53
    goto/16 :goto_4

    .line 54
    .line 55
    :cond_0
    iget-object v6, v0, Ll/rbx0;->e:Landroid/content/ContentResolver;

    .line 56
    .line 57
    const-string v7, "r"

    .line 58
    .line 59
    invoke-virtual {v6, v5, v7}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    :goto_0
    iput-object v6, v0, Ll/rbx0;->g:Landroid/content/res/AssetFileDescriptor;

    .line 64
    .line 65
    if-eqz v6, :cond_b

    .line 66
    .line 67
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    .line 68
    .line 69
    .line 70
    move-result-wide v7

    .line 71
    new-instance v2, Ljava/io/FileInputStream;

    .line 72
    .line 73
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    invoke-direct {v2, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 78
    .line 79
    .line 80
    iput-object v2, v0, Ll/rbx0;->h:Ljava/io/FileInputStream;

    .line 81
    .line 82
    const-wide/16 v9, -0x1

    .line 83
    .line 84
    cmp-long v5, v7, v9

    .line 85
    .line 86
    const/16 v11, 0x7d8

    .line 87
    .line 88
    const/4 v12, 0x0

    .line 89
    if-eqz v5, :cond_2

    .line 90
    .line 91
    iget-wide v13, v1, Ll/akx0;->f:J

    .line 92
    .line 93
    cmp-long v13, v13, v7

    .line 94
    .line 95
    if-gtz v13, :cond_1

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgs;

    .line 99
    .line 100
    invoke-direct {v0, v12, v11}, Lcom/google/android/gms/internal/ads/zzgs;-><init>(Ljava/io/IOException;I)V

    .line 101
    .line 102
    .line 103
    throw v0

    .line 104
    :cond_2
    :goto_1
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    .line 105
    .line 106
    .line 107
    move-result-wide v13

    .line 108
    iget-wide v3, v1, Ll/akx0;->f:J

    .line 109
    .line 110
    add-long/2addr v3, v13

    .line 111
    invoke-virtual {v2, v3, v4}, Ljava/io/FileInputStream;->skip(J)J

    .line 112
    .line 113
    .line 114
    move-result-wide v3

    .line 115
    sub-long/2addr v3, v13

    .line 116
    iget-wide v13, v1, Ll/akx0;->f:J

    .line 117
    .line 118
    cmp-long v13, v3, v13

    .line 119
    .line 120
    if-nez v13, :cond_a

    .line 121
    .line 122
    const-wide/16 v13, 0x0

    .line 123
    .line 124
    if-nez v5, :cond_5

    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->size()J

    .line 131
    .line 132
    .line 133
    move-result-wide v3

    .line 134
    cmp-long v5, v3, v13

    .line 135
    .line 136
    if-nez v5, :cond_3

    .line 137
    .line 138
    iput-wide v9, v0, Ll/rbx0;->i:J

    .line 139
    .line 140
    move-wide v3, v9

    .line 141
    goto :goto_2

    .line 142
    :cond_3
    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->position()J

    .line 143
    .line 144
    .line 145
    move-result-wide v7

    .line 146
    sub-long/2addr v3, v7

    .line 147
    iput-wide v3, v0, Ll/rbx0;->i:J

    .line 148
    .line 149
    cmp-long v2, v3, v13

    .line 150
    .line 151
    if-ltz v2, :cond_4

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_4
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgs;

    .line 155
    .line 156
    invoke-direct {v0, v12, v11}, Lcom/google/android/gms/internal/ads/zzgs;-><init>(Ljava/io/IOException;I)V

    .line 157
    .line 158
    .line 159
    throw v0

    .line 160
    :cond_5
    sub-long v3, v7, v3

    .line 161
    .line 162
    iput-wide v3, v0, Ll/rbx0;->i:J
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzgs; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    .line 164
    cmp-long v2, v3, v13

    .line 165
    .line 166
    if-ltz v2, :cond_9

    .line 167
    .line 168
    :goto_2
    iget-wide v5, v1, Ll/akx0;->g:J

    .line 169
    .line 170
    cmp-long v2, v5, v9

    .line 171
    .line 172
    if-eqz v2, :cond_7

    .line 173
    .line 174
    cmp-long v2, v3, v9

    .line 175
    .line 176
    if-nez v2, :cond_6

    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_6
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 180
    .line 181
    .line 182
    move-result-wide v5

    .line 183
    :goto_3
    iput-wide v5, v0, Ll/rbx0;->i:J

    .line 184
    .line 185
    :cond_7
    const/4 v15, 0x1

    .line 186
    iput-boolean v15, v0, Ll/rbx0;->j:Z

    .line 187
    .line 188
    invoke-virtual/range {p0 .. p1}, Ll/m8x0;->l(Ll/akx0;)V

    .line 189
    .line 190
    .line 191
    iget-wide v1, v1, Ll/akx0;->g:J

    .line 192
    .line 193
    cmp-long v3, v1, v9

    .line 194
    .line 195
    if-eqz v3, :cond_8

    .line 196
    .line 197
    return-wide v1

    .line 198
    :cond_8
    iget-wide v0, v0, Ll/rbx0;->i:J

    .line 199
    .line 200
    return-wide v0

    .line 201
    :cond_9
    :try_start_1
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgs;

    .line 202
    .line 203
    invoke-direct {v0, v12, v11}, Lcom/google/android/gms/internal/ads/zzgs;-><init>(Ljava/io/IOException;I)V

    .line 204
    .line 205
    .line 206
    throw v0

    .line 207
    :cond_a
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgs;

    .line 208
    .line 209
    invoke-direct {v0, v12, v11}, Lcom/google/android/gms/internal/ads/zzgs;-><init>(Ljava/io/IOException;I)V

    .line 210
    .line 211
    .line 212
    throw v0

    .line 213
    :cond_b
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgs;

    .line 214
    .line 215
    new-instance v1, Ljava/io/IOException;

    .line 216
    .line 217
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzgs; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 226
    .line 227
    .line 228
    const/16 v6, 0x7d0

    .line 229
    .line 230
    :try_start_2
    invoke-direct {v0, v1, v6}, Lcom/google/android/gms/internal/ads/zzgs;-><init>(Ljava/io/IOException;I)V

    .line 231
    .line 232
    .line 233
    throw v0
    :try_end_2
    .catch Lcom/google/android/gms/internal/ads/zzgs; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 234
    :catch_1
    move-exception v0

    .line 235
    :goto_4
    new-instance v1, Lcom/google/android/gms/internal/ads/zzgs;

    .line 236
    .line 237
    instance-of v2, v0, Ljava/io/FileNotFoundException;

    .line 238
    .line 239
    const/4 v15, 0x1

    .line 240
    if-eq v15, v2, :cond_c

    .line 241
    .line 242
    move v3, v6

    .line 243
    goto :goto_5

    .line 244
    :cond_c
    const/16 v3, 0x7d5

    .line 245
    .line 246
    :goto_5
    invoke-direct {v1, v0, v3}, Lcom/google/android/gms/internal/ads/zzgs;-><init>(Ljava/io/IOException;I)V

    .line 247
    .line 248
    .line 249
    throw v1

    .line 250
    :catch_2
    move-exception v0

    .line 251
    throw v0
.end method

.method public final zzc()Landroid/net/Uri;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rbx0;->f:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzd()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzgs;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/rbx0;->f:Landroid/net/Uri;

    .line 3
    .line 4
    const/16 v1, 0x7d0

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    :try_start_0
    iget-object v3, p0, Ll/rbx0;->h:Ljava/io/FileInputStream;

    .line 8
    .line 9
    if-eqz v3, :cond_0

    .line 10
    .line 11
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v3

    .line 16
    goto :goto_4

    .line 17
    :catch_0
    move-exception v3

    .line 18
    goto :goto_3

    .line 19
    :cond_0
    :goto_0
    iput-object v0, p0, Ll/rbx0;->h:Ljava/io/FileInputStream;

    .line 20
    .line 21
    :try_start_1
    iget-object v3, p0, Ll/rbx0;->g:Landroid/content/res/AssetFileDescriptor;

    .line 22
    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-virtual {v3}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :catchall_1
    move-exception v1

    .line 30
    goto :goto_7

    .line 31
    :catch_1
    move-exception v3

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    :goto_1
    iput-object v0, p0, Ll/rbx0;->g:Landroid/content/res/AssetFileDescriptor;

    .line 34
    .line 35
    iget-boolean v0, p0, Ll/rbx0;->j:Z

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iput-boolean v2, p0, Ll/rbx0;->j:Z

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/m8x0;->j()V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void

    .line 45
    :goto_2
    :try_start_2
    new-instance v4, Lcom/google/android/gms/internal/ads/zzgs;

    .line 46
    .line 47
    invoke-direct {v4, v3, v1}, Lcom/google/android/gms/internal/ads/zzgs;-><init>(Ljava/io/IOException;I)V

    .line 48
    .line 49
    .line 50
    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 51
    :goto_3
    :try_start_3
    new-instance v4, Lcom/google/android/gms/internal/ads/zzgs;

    .line 52
    .line 53
    invoke-direct {v4, v3, v1}, Lcom/google/android/gms/internal/ads/zzgs;-><init>(Ljava/io/IOException;I)V

    .line 54
    .line 55
    .line 56
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 57
    :goto_4
    iput-object v0, p0, Ll/rbx0;->h:Ljava/io/FileInputStream;

    .line 58
    .line 59
    :try_start_4
    iget-object v4, p0, Ll/rbx0;->g:Landroid/content/res/AssetFileDescriptor;

    .line 60
    .line 61
    if-eqz v4, :cond_3

    .line 62
    .line 63
    invoke-virtual {v4}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 64
    .line 65
    .line 66
    goto :goto_5

    .line 67
    :catch_2
    move-exception v3

    .line 68
    goto :goto_6

    .line 69
    :cond_3
    :goto_5
    iput-object v0, p0, Ll/rbx0;->g:Landroid/content/res/AssetFileDescriptor;

    .line 70
    .line 71
    iget-boolean v0, p0, Ll/rbx0;->j:Z

    .line 72
    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    iput-boolean v2, p0, Ll/rbx0;->j:Z

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/m8x0;->j()V

    .line 78
    .line 79
    .line 80
    :cond_4
    throw v3

    .line 81
    :goto_6
    :try_start_5
    new-instance v4, Lcom/google/android/gms/internal/ads/zzgs;

    .line 82
    .line 83
    invoke-direct {v4, v3, v1}, Lcom/google/android/gms/internal/ads/zzgs;-><init>(Ljava/io/IOException;I)V

    .line 84
    .line 85
    .line 86
    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 87
    :goto_7
    iput-object v0, p0, Ll/rbx0;->g:Landroid/content/res/AssetFileDescriptor;

    .line 88
    .line 89
    iget-boolean v0, p0, Ll/rbx0;->j:Z

    .line 90
    .line 91
    if-eqz v0, :cond_5

    .line 92
    .line 93
    iput-boolean v2, p0, Ll/rbx0;->j:Z

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/m8x0;->j()V

    .line 96
    .line 97
    .line 98
    :cond_5
    throw v1
.end method
