.class public Ll/ug50$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w84;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ug50;->i(Ll/ug50$c;Ll/vj20$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ug50$c;

.field public final synthetic b:Ll/vj20$a;

.field public final synthetic c:Ll/ug50;


# direct methods
.method public constructor <init>(Ll/ug50;Ll/ug50$c;Ll/vj20$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ug50$b;->a:Ll/ug50$c;

    .line 4
    .line 5
    iput-object p3, p0, Ll/ug50$b;->b:Ll/vj20$a;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onFailure(Ll/ry3;Ljava/io/IOException;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onFailure url = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ll/x1d0;->k()Ll/rnl;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ", exception = "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "[common][image_net]"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :try_start_0
    iget-object v0, p0, Ll/ug50$b;->a:Ll/ug50$c;

    .line 37
    .line 38
    iget v1, v0, Ll/ug50$c;->i:I

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    iput v1, v0, Ll/ug50$c;->i:I

    .line 43
    .line 44
    iget-object v1, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 45
    .line 46
    iget-object v2, p0, Ll/ug50$b;->b:Ll/vj20$a;

    .line 47
    .line 48
    invoke-virtual {v1, v0, p1, p2, v2}, Ll/ug50;->m(Ll/ug50$c;Ll/ry3;Ljava/lang/Exception;Ll/vj20$a;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 52
    .line 53
    invoke-static {p2}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    if-eqz p2, :cond_1

    .line 58
    .line 59
    invoke-interface {p1}, Ll/ry3;->isCanceled()Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_0

    .line 64
    .line 65
    iget-object p2, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 66
    .line 67
    invoke-static {p2}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {p2, v0}, Ll/ukm;->requestCancel(Ll/x1d0;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    iget-object p0, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 79
    .line 80
    invoke-static {p0}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-interface {p0, p1}, Ll/ukm;->a(Ll/x1d0;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void

    .line 92
    :catchall_0
    move-exception p2

    .line 93
    iget-object v0, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 94
    .line 95
    invoke-static {v0}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    invoke-interface {p1}, Ll/ry3;->isCanceled()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    iget-object v0, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 108
    .line 109
    invoke-static {v0}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-interface {v0, v1}, Ll/ukm;->requestCancel(Ll/x1d0;)V

    .line 118
    .line 119
    .line 120
    :cond_2
    iget-object p0, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 121
    .line 122
    invoke-static {p0}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-interface {p0, p1}, Ll/ukm;->a(Ll/x1d0;)V

    .line 131
    .line 132
    .line 133
    :cond_3
    throw p2
.end method

.method public onResponse(Ll/ry3;Ll/i5d0;)V
    .locals 8

    .line 1
    const-string v0, "Exception when closing response body"

    .line 2
    .line 3
    const-string v1, "OkHttpNetworkFetchProducer"

    .line 4
    .line 5
    const-string v2, "Unexpected HTTP code "

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v4, "onResponse url = "

    .line 10
    .line 11
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    invoke-virtual {v4}, Ll/x1d0;->k()Ll/rnl;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v4, ", response = "

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const-string v4, "[common][image_net]"

    .line 38
    .line 39
    invoke-static {v4, v3}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Ll/ug50$b;->a:Ll/ug50$c;

    .line 43
    .line 44
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    iput-wide v4, v3, Ll/ug50$c;->g:J

    .line 49
    .line 50
    invoke-virtual {p2}, Ll/i5d0;->k()Ll/k5d0;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    :try_start_0
    invoke-virtual {p2}, Ll/i5d0;->I()Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-nez v4, :cond_1

    .line 59
    .line 60
    iget-object v4, p0, Ll/ug50$b;->a:Ll/ug50$c;

    .line 61
    .line 62
    iget v5, v4, Ll/ug50$c;->i:I

    .line 63
    .line 64
    add-int/lit8 v5, v5, 0x3

    .line 65
    .line 66
    iput v5, v4, Ll/ug50$c;->i:I

    .line 67
    .line 68
    iget-object v5, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 69
    .line 70
    new-instance v6, Ljava/io/IOException;

    .line 71
    .line 72
    new-instance v7, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v7, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2}, Ll/i5d0;->q()I

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-direct {v6, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, Ll/ug50$b;->b:Ll/vj20$a;

    .line 92
    .line 93
    invoke-virtual {v5, v4, p1, v6, p2}, Ll/ug50;->m(Ll/ug50$c;Ll/ry3;Ljava/lang/Exception;Ll/vj20$a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    .line 95
    .line 96
    iget-object p2, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 97
    .line 98
    invoke-static {p2}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    if-eqz p2, :cond_0

    .line 103
    .line 104
    iget-object p0, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 105
    .line 106
    invoke-static {p0}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-interface {p0, p1}, Ll/ukm;->a(Ll/x1d0;)V

    .line 115
    .line 116
    .line 117
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Ll/k5d0;->close()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :catch_0
    move-exception p0

    .line 122
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v1, v0, p0}, Ll/huf;->y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :catchall_0
    move-exception p2

    .line 130
    goto :goto_4

    .line 131
    :catch_1
    move-exception p2

    .line 132
    goto :goto_2

    .line 133
    :cond_1
    :try_start_2
    invoke-virtual {v3}, Ll/k5d0;->contentLength()J

    .line 134
    .line 135
    .line 136
    move-result-wide v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 137
    const-wide/16 v6, 0x0

    .line 138
    .line 139
    cmp-long p2, v4, v6

    .line 140
    .line 141
    if-gez p2, :cond_2

    .line 142
    .line 143
    move-wide v4, v6

    .line 144
    :cond_2
    :try_start_3
    iget-object p2, p0, Ll/ug50$b;->b:Ll/vj20$a;

    .line 145
    .line 146
    invoke-virtual {v3}, Ll/k5d0;->byteStream()Ljava/io/InputStream;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    long-to-int v4, v4

    .line 151
    invoke-interface {p2, v2, v4}, Ll/vj20$a;->b(Ljava/io/InputStream;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :catch_2
    move-exception p2

    .line 156
    :try_start_4
    iget-object v2, p0, Ll/ug50$b;->a:Ll/ug50$c;

    .line 157
    .line 158
    iget v4, v2, Ll/ug50$c;->i:I

    .line 159
    .line 160
    add-int/lit8 v4, v4, 0x3

    .line 161
    .line 162
    iput v4, v2, Ll/ug50$c;->i:I

    .line 163
    .line 164
    iget-object v4, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 165
    .line 166
    iget-object v5, p0, Ll/ug50$b;->b:Ll/vj20$a;

    .line 167
    .line 168
    invoke-virtual {v4, v2, p1, p2, v5}, Ll/ug50;->m(Ll/ug50$c;Ll/ry3;Ljava/lang/Exception;Ll/vj20$a;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 169
    .line 170
    .line 171
    :goto_0
    iget-object p2, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 172
    .line 173
    invoke-static {p2}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    if-eqz p2, :cond_3

    .line 178
    .line 179
    :goto_1
    iget-object p0, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 180
    .line 181
    invoke-static {p0}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-interface {p0, p1}, Ll/ukm;->a(Ll/x1d0;)V

    .line 190
    .line 191
    .line 192
    :cond_3
    :try_start_5
    invoke-virtual {v3}, Ll/k5d0;->close()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_3

    .line 193
    .line 194
    .line 195
    goto :goto_3

    .line 196
    :catch_3
    move-exception p0

    .line 197
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 198
    .line 199
    .line 200
    invoke-static {v1, v0, p0}, Ll/huf;->y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 201
    .line 202
    .line 203
    goto :goto_3

    .line 204
    :goto_2
    :try_start_6
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 205
    .line 206
    .line 207
    iget-object v2, p0, Ll/ug50$b;->a:Ll/ug50$c;

    .line 208
    .line 209
    iget v4, v2, Ll/ug50$c;->i:I

    .line 210
    .line 211
    add-int/lit8 v4, v4, 0x3

    .line 212
    .line 213
    iput v4, v2, Ll/ug50$c;->i:I

    .line 214
    .line 215
    iget-object v4, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 216
    .line 217
    iget-object v5, p0, Ll/ug50$b;->b:Ll/vj20$a;

    .line 218
    .line 219
    invoke-virtual {v4, v2, p1, p2, v5}, Ll/ug50;->m(Ll/ug50$c;Ll/ry3;Ljava/lang/Exception;Ll/vj20$a;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 220
    .line 221
    .line 222
    iget-object p2, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 223
    .line 224
    invoke-static {p2}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    if-eqz p2, :cond_3

    .line 229
    .line 230
    goto :goto_1

    .line 231
    :goto_3
    return-void

    .line 232
    :goto_4
    iget-object v2, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 233
    .line 234
    invoke-static {v2}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    if-eqz v2, :cond_4

    .line 239
    .line 240
    iget-object p0, p0, Ll/ug50$b;->c:Ll/ug50;

    .line 241
    .line 242
    invoke-static {p0}, Ll/ug50;->f(Ll/ug50;)Ll/ukm;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-interface {p0, p1}, Ll/ukm;->a(Ll/x1d0;)V

    .line 251
    .line 252
    .line 253
    :cond_4
    :try_start_7
    invoke-virtual {v3}, Ll/k5d0;->close()V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_4

    .line 254
    .line 255
    .line 256
    goto :goto_5

    .line 257
    :catch_4
    move-exception p0

    .line 258
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 259
    .line 260
    .line 261
    invoke-static {v1, v0, p0}, Ll/huf;->y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 262
    .line 263
    .line 264
    :goto_5
    throw p2
.end method
