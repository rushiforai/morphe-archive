.class public Ll/tnw$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tnw;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/tnw;


# direct methods
.method public constructor <init>(Ll/tnw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 10
    .line 11
    iput-boolean v2, p0, Ll/tnw;->e:Z

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/tnw;->g(Ll/tnw;Landroid/os/Message;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    sput-object v0, Ll/tnw;->m:Ll/mnc0;

    .line 19
    .line 20
    iget-object v1, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 21
    .line 22
    iput-boolean v2, v1, Ll/tnw;->e:Z

    .line 23
    .line 24
    iget-boolean v2, v1, Ll/tnw;->f:Z

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    invoke-static {v1}, Ll/tnw;->f(Ll/tnw;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :try_start_0
    new-instance v1, Landroid/media/MediaMetadataRetriever;

    .line 33
    .line 34
    invoke-direct {v1}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ljava/io/FileInputStream;

    .line 38
    .line 39
    iget-object v3, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 40
    .line 41
    iget-object v3, v3, Ll/tnw;->d:Ljava/lang/String;

    .line 42
    .line 43
    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 44
    .line 45
    .line 46
    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v1, v0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 51
    .line 52
    .line 53
    const/16 v0, 0x9

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 62
    .line 63
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 68
    .line 69
    .line 70
    move-result-wide v3

    .line 71
    invoke-static {v1, v3, v4}, Ll/tnw;->e(Ll/tnw;J)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    move-object v0, v2

    .line 77
    goto/16 :goto_6

    .line 78
    .line 79
    :catch_0
    move-exception v0

    .line 80
    goto :goto_2

    .line 81
    :catch_1
    move-exception v0

    .line 82
    goto :goto_4

    .line 83
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 84
    .line 85
    invoke-static {v0}, Ll/tnw;->c(Ll/tnw;)J

    .line 86
    .line 87
    .line 88
    move-result-wide v0

    .line 89
    iget-object v3, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 90
    .line 91
    invoke-static {v3}, Ll/tnw;->b(Ll/tnw;)J

    .line 92
    .line 93
    .line 94
    move-result-wide v3

    .line 95
    cmp-long v0, v0, v3

    .line 96
    .line 97
    if-gez v0, :cond_3

    .line 98
    .line 99
    iget-object v0, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 100
    .line 101
    invoke-static {v0, p1}, Ll/tnw;->g(Ll/tnw;Landroid/os/Message;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    .line 103
    .line 104
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :catch_2
    move-exception p0

    .line 109
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    goto :goto_5

    .line 113
    :cond_3
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :catch_3
    move-exception p1

    .line 118
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    :goto_1
    iget-object p0, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 122
    .line 123
    invoke-static {p0}, Ll/tnw;->i(Ll/tnw;)V

    .line 124
    .line 125
    .line 126
    goto :goto_5

    .line 127
    :catchall_1
    move-exception p0

    .line 128
    goto :goto_6

    .line 129
    :catch_4
    move-exception v1

    .line 130
    move-object v2, v0

    .line 131
    move-object v0, v1

    .line 132
    goto :goto_2

    .line 133
    :catch_5
    move-exception v1

    .line 134
    move-object v2, v0

    .line 135
    move-object v0, v1

    .line 136
    goto :goto_4

    .line 137
    :goto_2
    :try_start_4
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 141
    .line 142
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 143
    .line 144
    .line 145
    move-result-wide v3

    .line 146
    iget-object v1, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 147
    .line 148
    invoke-static {v1}, Ll/tnw;->a(Ll/tnw;)J

    .line 149
    .line 150
    .line 151
    move-result-wide v5

    .line 152
    sub-long/2addr v3, v5

    .line 153
    invoke-static {v0, v3, v4}, Ll/tnw;->e(Ll/tnw;J)V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 157
    .line 158
    invoke-static {p0, p1}, Ll/tnw;->g(Ll/tnw;Landroid/os/Message;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 159
    .line 160
    .line 161
    if-eqz v2, :cond_4

    .line 162
    .line 163
    :goto_3
    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 164
    .line 165
    .line 166
    goto :goto_5

    .line 167
    :goto_4
    :try_start_6
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 171
    .line 172
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 173
    .line 174
    .line 175
    move-result-wide v3

    .line 176
    iget-object v1, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 177
    .line 178
    invoke-static {v1}, Ll/tnw;->a(Ll/tnw;)J

    .line 179
    .line 180
    .line 181
    move-result-wide v5

    .line 182
    sub-long/2addr v3, v5

    .line 183
    invoke-static {v0, v3, v4}, Ll/tnw;->e(Ll/tnw;J)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 187
    .line 188
    invoke-static {p0, p1}, Ll/tnw;->g(Ll/tnw;Landroid/os/Message;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 189
    .line 190
    .line 191
    if-eqz v2, :cond_4

    .line 192
    .line 193
    goto :goto_3

    .line 194
    :cond_4
    :goto_5
    return-void

    .line 195
    :goto_6
    if-eqz v0, :cond_5

    .line 196
    .line 197
    :try_start_7
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 198
    .line 199
    .line 200
    goto :goto_7

    .line 201
    :catch_6
    move-exception p1

    .line 202
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 203
    .line 204
    .line 205
    :cond_5
    :goto_7
    throw p0

    .line 206
    :cond_6
    iget-object p1, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 207
    .line 208
    iget-boolean v0, p1, Ll/tnw;->e:Z

    .line 209
    .line 210
    if-nez v0, :cond_7

    .line 211
    .line 212
    invoke-virtual {p1}, Ll/tnw;->j()V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :cond_7
    invoke-static {p1}, Ll/tnw;->h(Ll/tnw;)V

    .line 217
    .line 218
    .line 219
    iget-object p0, p0, Ll/tnw$a;->a:Ll/tnw;

    .line 220
    .line 221
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 222
    .line 223
    .line 224
    move-result-wide v0

    .line 225
    invoke-static {p0, v0, v1}, Ll/tnw;->d(Ll/tnw;J)V

    .line 226
    .line 227
    .line 228
    return-void
.end method
