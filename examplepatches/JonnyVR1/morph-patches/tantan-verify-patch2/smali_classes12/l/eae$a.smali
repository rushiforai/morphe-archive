.class Ll/eae$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w84;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/eae;->c(Ljava/lang/String;Ljava/lang/String;Ll/eae$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/eae$b;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ll/eae;


# direct methods
.method public constructor <init>(Ll/eae;Ll/eae$b;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eae$a;->d:Ll/eae;

    .line 2
    .line 3
    iput-object p2, p0, Ll/eae$a;->a:Ll/eae$b;

    .line 4
    .line 5
    iput-object p3, p0, Ll/eae$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/eae$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onFailure(Ll/ry3;Ljava/io/IOException;)V
    .locals 4

    .line 1
    const-string v0, "url failed: "

    .line 2
    .line 3
    iget-object v1, p0, Ll/eae$a;->a:Ll/eae$b;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "onFailure\uff0cerror:"

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    const-string p2, "null"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    :goto_0
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-interface {v1, p2}, Ll/eae$b;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Ll/eae$a;->d:Ll/eae;

    .line 32
    .line 33
    invoke-static {p2}, Ll/eae;->a(Ll/eae;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    monitor-enter p2

    .line 38
    :try_start_0
    iget-object v1, p0, Ll/eae$a;->d:Ll/eae;

    .line 39
    .line 40
    invoke-static {v1}, Ll/eae;->b(Ll/eae;)Ljava/util/Set;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Ll/eae$a;->b:Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    :try_start_1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ll/rnl;->m()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string p2, "8701b0b5e66f551562c78781b1dc66c3"

    .line 63
    .line 64
    invoke-static {p2}, Lcom/immomo/mmdns/DNSManager;->getInstance(Ljava/lang/String;)Lcom/immomo/mmdns/MDDNSEntrance;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p2, p1}, Lcom/immomo/mmdns/MDDNSEntrance;->useDNS(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    const-string v1, "8701b0b5e66f551562c78781b1dc66c3"

    .line 73
    .line 74
    invoke-static {v1}, Lcom/immomo/mmdns/DNSManager;->getInstance(Ljava/lang/String;)Lcom/immomo/mmdns/MDDNSEntrance;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1, p1}, Lcom/immomo/mmdns/MDDNSEntrance;->getUsableHost(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const-string v1, "OkhttpDownload"

    .line 83
    .line 84
    new-instance v2, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/eae$a;->b:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string p0, " useDns: "

    .line 95
    .line 96
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string p0, " ip: "

    .line 103
    .line 104
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    const/16 p1, 0xb

    .line 115
    .line 116
    invoke-static {v1, p1, p0}, Ll/ne00;->a(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 117
    .line 118
    .line 119
    :catch_0
    return-void

    .line 120
    :catchall_0
    move-exception p0

    .line 121
    :try_start_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 122
    throw p0
.end method

.method public onResponse(Ll/ry3;Ll/i5d0;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 p1, 0x800

    .line 2
    .line 3
    new-array p1, p1, [B

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :try_start_0
    invoke-virtual {p2}, Ll/i5d0;->k()Ll/k5d0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/k5d0;->byteStream()Ljava/io/InputStream;

    .line 11
    .line 12
    .line 13
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 14
    :try_start_1
    invoke-virtual {p2}, Ll/i5d0;->k()Ll/k5d0;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2}, Ll/k5d0;->contentLength()J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    new-instance p2, Ljava/io/File;

    .line 23
    .line 24
    new-instance v4, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object v5, p0, Ll/eae$a;->c:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v5, "_tmp"

    .line 35
    .line 36
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-direct {p2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v4, Ljava/io/FileOutputStream;

    .line 47
    .line 48
    invoke-direct {v4, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 49
    .line 50
    .line 51
    const-wide/16 v5, 0x0

    .line 52
    .line 53
    :goto_0
    :try_start_2
    invoke-virtual {v1, p1}, Ljava/io/InputStream;->read([B)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v7, -0x1

    .line 58
    if-eq v0, v7, :cond_0

    .line 59
    .line 60
    const/4 v7, 0x0

    .line 61
    invoke-virtual {v4, p1, v7, v0}, Ljava/io/FileOutputStream;->write([BII)V

    .line 62
    .line 63
    .line 64
    int-to-long v7, v0

    .line 65
    add-long/2addr v5, v7

    .line 66
    long-to-float v0, v5

    .line 67
    const/high16 v7, 0x3f800000    # 1.0f

    .line 68
    .line 69
    mul-float/2addr v0, v7

    .line 70
    long-to-float v7, v2

    .line 71
    div-float/2addr v0, v7

    .line 72
    const/high16 v7, 0x42c80000    # 100.0f

    .line 73
    .line 74
    mul-float/2addr v0, v7

    .line 75
    float-to-int v0, v0

    .line 76
    iget-object v7, p0, Ll/eae$a;->a:Ll/eae$b;

    .line 77
    .line 78
    invoke-interface {v7, v0}, Ll/eae$b;->onDownloading(I)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :catchall_0
    move-exception p1

    .line 83
    :goto_1
    move-object v0, v1

    .line 84
    goto/16 :goto_6

    .line 85
    .line 86
    :catch_0
    move-exception p1

    .line 87
    :goto_2
    move-object v0, v1

    .line 88
    goto :goto_4

    .line 89
    :cond_0
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 90
    .line 91
    .line 92
    new-instance p1, Ljava/io/File;

    .line 93
    .line 94
    iget-object v0, p0, Ll/eae$a;->c:Ljava/lang/String;

    .line 95
    .line 96
    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_1

    .line 104
    .line 105
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 106
    .line 107
    .line 108
    :cond_1
    invoke-virtual {p2, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/eae$a;->a:Ll/eae$b;

    .line 112
    .line 113
    invoke-interface {p1}, Ll/eae$b;->b()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/eae$a;->d:Ll/eae;

    .line 117
    .line 118
    invoke-static {p1}, Ll/eae;->a(Ll/eae;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    monitor-enter p1

    .line 123
    :try_start_3
    iget-object p2, p0, Ll/eae$a;->d:Ll/eae;

    .line 124
    .line 125
    invoke-static {p2}, Ll/eae;->b(Ll/eae;)Ljava/util/Set;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    iget-object p0, p0, Ll/eae$a;->b:Ljava/lang/String;

    .line 130
    .line 131
    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 135
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 136
    .line 137
    .line 138
    :catch_1
    :goto_3
    :try_start_5
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 139
    .line 140
    .line 141
    goto :goto_5

    .line 142
    :catchall_1
    move-exception p0

    .line 143
    :try_start_6
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 144
    throw p0

    .line 145
    :catchall_2
    move-exception p1

    .line 146
    move-object v4, v0

    .line 147
    goto :goto_1

    .line 148
    :catch_2
    move-exception p1

    .line 149
    move-object v4, v0

    .line 150
    goto :goto_2

    .line 151
    :catchall_3
    move-exception p1

    .line 152
    move-object v4, v0

    .line 153
    goto :goto_6

    .line 154
    :catch_3
    move-exception p1

    .line 155
    move-object v4, v0

    .line 156
    :goto_4
    :try_start_7
    iget-object p2, p0, Ll/eae$a;->a:Ll/eae$b;

    .line 157
    .line 158
    new-instance v1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    const-string v2, "onResponse ,error:"

    .line 164
    .line 165
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-interface {p2, p1}, Ll/eae$b;->a(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Ll/eae$a;->d:Ll/eae;

    .line 183
    .line 184
    invoke-static {p1}, Ll/eae;->a(Ll/eae;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    monitor-enter p1

    .line 189
    :try_start_8
    iget-object p2, p0, Ll/eae$a;->d:Ll/eae;

    .line 190
    .line 191
    invoke-static {p2}, Ll/eae;->b(Ll/eae;)Ljava/util/Set;

    .line 192
    .line 193
    .line 194
    move-result-object p2

    .line 195
    iget-object p0, p0, Ll/eae$a;->b:Ljava/lang/String;

    .line 196
    .line 197
    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    monitor-exit p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 201
    if-eqz v0, :cond_2

    .line 202
    .line 203
    :try_start_9
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_4

    .line 204
    .line 205
    .line 206
    :catch_4
    :cond_2
    if-eqz v4, :cond_3

    .line 207
    .line 208
    goto :goto_3

    .line 209
    :catch_5
    :cond_3
    :goto_5
    return-void

    .line 210
    :catchall_4
    move-exception p0

    .line 211
    :try_start_a
    monitor-exit p1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 212
    throw p0

    .line 213
    :catchall_5
    move-exception p1

    .line 214
    :goto_6
    iget-object p2, p0, Ll/eae$a;->d:Ll/eae;

    .line 215
    .line 216
    invoke-static {p2}, Ll/eae;->a(Ll/eae;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object p2

    .line 220
    monitor-enter p2

    .line 221
    :try_start_b
    iget-object v1, p0, Ll/eae$a;->d:Ll/eae;

    .line 222
    .line 223
    invoke-static {v1}, Ll/eae;->b(Ll/eae;)Ljava/util/Set;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    iget-object p0, p0, Ll/eae$a;->b:Ljava/lang/String;

    .line 228
    .line 229
    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    monitor-exit p2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 233
    if-eqz v0, :cond_4

    .line 234
    .line 235
    :try_start_c
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_6

    .line 236
    .line 237
    .line 238
    :catch_6
    :cond_4
    if-eqz v4, :cond_5

    .line 239
    .line 240
    :try_start_d
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_7

    .line 241
    .line 242
    .line 243
    :catch_7
    :cond_5
    throw p1

    .line 244
    :catchall_6
    move-exception p0

    .line 245
    :try_start_e
    monitor-exit p2
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    .line 246
    throw p0
.end method
