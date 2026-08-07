.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:Ljava/util/Random;

.field public final c:Lcom/tencent/cloud/ai/network/okio/f;

.field public final d:Lcom/tencent/cloud/ai/network/okio/e;

.field public e:Z

.field public final f:Lcom/tencent/cloud/ai/network/okio/e;

.field public final g:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;

.field public h:Z

.field public final i:[B

.field public final j:Lcom/tencent/cloud/ai/network/okio/e$b;


# direct methods
.method public constructor <init>(ZLcom/tencent/cloud/ai/network/okio/f;Ljava/util/Random;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->f:Lcom/tencent/cloud/ai/network/okio/e;

    .line 10
    .line 11
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p2, :cond_3

    .line 20
    .line 21
    if-eqz p3, :cond_2

    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->a:Z

    .line 24
    .line 25
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->c:Lcom/tencent/cloud/ai/network/okio/f;

    .line 26
    .line 27
    invoke-interface {p2}, Lcom/tencent/cloud/ai/network/okio/f;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 32
    .line 33
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->b:Ljava/util/Random;

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    const/4 p2, 0x4

    .line 38
    new-array p2, p2, [B

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move-object p2, v0

    .line 42
    :goto_0
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->i:[B

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 47
    .line 48
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/e$b;-><init>()V

    .line 49
    .line 50
    .line 51
    :cond_1
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->j:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    const-string p0, "random == null"

    .line 55
    .line 56
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw v0

    .line 60
    :cond_3
    const-string p0, "sink == null"

    .line 61
    .line 62
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw v0
.end method


# virtual methods
.method public a(IJZZ)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_7

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p4, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move p1, v0

    .line 10
    :goto_0
    if-eqz p5, :cond_1

    .line 11
    .line 12
    or-int/lit16 p1, p1, 0x80

    .line 13
    .line 14
    :cond_1
    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 15
    .line 16
    invoke-virtual {p4, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 17
    .line 18
    .line 19
    iget-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->a:Z

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    const/16 v0, 0x80

    .line 24
    .line 25
    :cond_2
    const-wide/16 p4, 0x7d

    .line 26
    .line 27
    cmp-long p1, p2, p4

    .line 28
    .line 29
    if-gtz p1, :cond_3

    .line 30
    .line 31
    long-to-int p1, p2

    .line 32
    or-int/2addr p1, v0

    .line 33
    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 34
    .line 35
    invoke-virtual {p4, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 36
    .line 37
    .line 38
    goto/16 :goto_1

    .line 39
    .line 40
    :cond_3
    const-wide/32 p4, 0xffff

    .line 41
    .line 42
    .line 43
    cmp-long p1, p2, p4

    .line 44
    .line 45
    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 46
    .line 47
    if-gtz p1, :cond_4

    .line 48
    .line 49
    or-int/lit8 p1, v0, 0x7e

    .line 50
    .line 51
    invoke-virtual {p4, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 55
    .line 56
    long-to-int p4, p2

    .line 57
    invoke-virtual {p1, p4}, Lcom/tencent/cloud/ai/network/okio/e;->g(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_4
    or-int/lit8 p1, v0, 0x7f

    .line 62
    .line 63
    invoke-virtual {p4, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 67
    .line 68
    const/16 p4, 0x8

    .line 69
    .line 70
    invoke-virtual {p1, p4}, Lcom/tencent/cloud/ai/network/okio/e;->d(I)Lcom/tencent/cloud/ai/network/okio/s;

    .line 71
    .line 72
    .line 73
    move-result-object p5

    .line 74
    iget-object v0, p5, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 75
    .line 76
    iget v1, p5, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 77
    .line 78
    add-int/lit8 v2, v1, 0x1

    .line 79
    .line 80
    const/16 v3, 0x38

    .line 81
    .line 82
    ushr-long v3, p2, v3

    .line 83
    .line 84
    const-wide/16 v5, 0xff

    .line 85
    .line 86
    and-long/2addr v3, v5

    .line 87
    long-to-int v3, v3

    .line 88
    int-to-byte v3, v3

    .line 89
    aput-byte v3, v0, v1

    .line 90
    .line 91
    add-int/lit8 v3, v1, 0x2

    .line 92
    .line 93
    const/16 v4, 0x30

    .line 94
    .line 95
    ushr-long v7, p2, v4

    .line 96
    .line 97
    and-long/2addr v7, v5

    .line 98
    long-to-int v4, v7

    .line 99
    int-to-byte v4, v4

    .line 100
    aput-byte v4, v0, v2

    .line 101
    .line 102
    add-int/lit8 v2, v1, 0x3

    .line 103
    .line 104
    const/16 v4, 0x28

    .line 105
    .line 106
    ushr-long v7, p2, v4

    .line 107
    .line 108
    and-long/2addr v7, v5

    .line 109
    long-to-int v4, v7

    .line 110
    int-to-byte v4, v4

    .line 111
    aput-byte v4, v0, v3

    .line 112
    .line 113
    add-int/lit8 v3, v1, 0x4

    .line 114
    .line 115
    const/16 v4, 0x20

    .line 116
    .line 117
    ushr-long v7, p2, v4

    .line 118
    .line 119
    and-long/2addr v7, v5

    .line 120
    long-to-int v4, v7

    .line 121
    int-to-byte v4, v4

    .line 122
    aput-byte v4, v0, v2

    .line 123
    .line 124
    add-int/lit8 v2, v1, 0x5

    .line 125
    .line 126
    const/16 v4, 0x18

    .line 127
    .line 128
    ushr-long v7, p2, v4

    .line 129
    .line 130
    and-long/2addr v7, v5

    .line 131
    long-to-int v4, v7

    .line 132
    int-to-byte v4, v4

    .line 133
    aput-byte v4, v0, v3

    .line 134
    .line 135
    add-int/lit8 v3, v1, 0x6

    .line 136
    .line 137
    const/16 v4, 0x10

    .line 138
    .line 139
    ushr-long v7, p2, v4

    .line 140
    .line 141
    and-long/2addr v7, v5

    .line 142
    long-to-int v4, v7

    .line 143
    int-to-byte v4, v4

    .line 144
    aput-byte v4, v0, v2

    .line 145
    .line 146
    add-int/lit8 v2, v1, 0x7

    .line 147
    .line 148
    ushr-long v7, p2, p4

    .line 149
    .line 150
    and-long/2addr v7, v5

    .line 151
    long-to-int v4, v7

    .line 152
    int-to-byte v4, v4

    .line 153
    aput-byte v4, v0, v3

    .line 154
    .line 155
    add-int/2addr v1, p4

    .line 156
    and-long v3, p2, v5

    .line 157
    .line 158
    long-to-int p4, v3

    .line 159
    int-to-byte p4, p4

    .line 160
    aput-byte p4, v0, v2

    .line 161
    .line 162
    iput v1, p5, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 163
    .line 164
    iget-wide p4, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 165
    .line 166
    const-wide/16 v0, 0x8

    .line 167
    .line 168
    add-long/2addr p4, v0

    .line 169
    iput-wide p4, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 170
    .line 171
    :goto_1
    iget-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->a:Z

    .line 172
    .line 173
    if-eqz p1, :cond_5

    .line 174
    .line 175
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->b:Ljava/util/Random;

    .line 176
    .line 177
    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->i:[B

    .line 178
    .line 179
    invoke-virtual {p1, p4}, Ljava/util/Random;->nextBytes([B)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 183
    .line 184
    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->i:[B

    .line 185
    .line 186
    invoke-virtual {p1, p4}, Lcom/tencent/cloud/ai/network/okio/e;->b([B)Lcom/tencent/cloud/ai/network/okio/e;

    .line 187
    .line 188
    .line 189
    const-wide/16 p4, 0x0

    .line 190
    .line 191
    cmp-long p1, p2, p4

    .line 192
    .line 193
    if-lez p1, :cond_6

    .line 194
    .line 195
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 196
    .line 197
    iget-wide p4, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 198
    .line 199
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->f:Lcom/tencent/cloud/ai/network/okio/e;

    .line 200
    .line 201
    invoke-virtual {p1, v0, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 205
    .line 206
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->j:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 207
    .line 208
    invoke-virtual {p1, p2}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/e$b;)Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 209
    .line 210
    .line 211
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->j:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 212
    .line 213
    invoke-virtual {p1, p4, p5}, Lcom/tencent/cloud/ai/network/okio/e$b;->h(J)I

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->j:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 217
    .line 218
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->i:[B

    .line 219
    .line 220
    invoke-static {p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketProtocol;->a(Lcom/tencent/cloud/ai/network/okio/e$b;[B)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->j:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 224
    .line 225
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/e$b;->close()V

    .line 226
    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_5
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 230
    .line 231
    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->f:Lcom/tencent/cloud/ai/network/okio/e;

    .line 232
    .line 233
    invoke-virtual {p1, p4, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 234
    .line 235
    .line 236
    :cond_6
    :goto_2
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->c:Lcom/tencent/cloud/ai/network/okio/f;

    .line 237
    .line 238
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/f;->i()Lcom/tencent/cloud/ai/network/okio/f;

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :cond_7
    const-string p0, "closed"

    .line 243
    .line 244
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    return-void
.end method

.method public a(ILcom/tencent/cloud/ai/network/okio/ByteString;)V
    .locals 1

    .line 248
    sget-object v0, Lcom/tencent/cloud/ai/network/okio/ByteString;->EMPTY:Lcom/tencent/cloud/ai/network/okio/ByteString;

    if-nez p1, :cond_0

    if-eqz p2, :cond_4

    :cond_0
    if-eqz p1, :cond_2

    .line 249
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketProtocol;->a(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 250
    :cond_1
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-void

    .line 251
    :cond_2
    :goto_0
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 252
    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->g(I)Lcom/tencent/cloud/ai/network/okio/e;

    if-eqz p2, :cond_3

    .line 253
    invoke-virtual {v0, p2}, Lcom/tencent/cloud/ai/network/okio/e;->b(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/e;

    .line 254
    :cond_3
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->m()Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object v0

    :cond_4
    const/16 p1, 0x8

    const/4 p2, 0x1

    .line 255
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->b(ILcom/tencent/cloud/ai/network/okio/ByteString;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    iput-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->e:Z

    return-void

    :catchall_0
    move-exception p1

    iput-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->e:Z

    .line 257
    throw p1
.end method

.method public final b(ILcom/tencent/cloud/ai/network/okio/ByteString;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-long v1, v0

    .line 10
    const-wide/16 v3, 0x7d

    .line 11
    .line 12
    cmp-long v1, v1, v3

    .line 13
    .line 14
    if-gtz v1, :cond_2

    .line 15
    .line 16
    or-int/lit16 p1, p1, 0x80

    .line 17
    .line 18
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 21
    .line 22
    .line 23
    iget-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->a:Z

    .line 24
    .line 25
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    or-int/lit16 p1, v0, 0x80

    .line 30
    .line 31
    invoke-virtual {v1, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->b:Ljava/util/Random;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->i:[B

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Ljava/util/Random;->nextBytes([B)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->i:[B

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Lcom/tencent/cloud/ai/network/okio/e;->b([B)Lcom/tencent/cloud/ai/network/okio/e;

    .line 46
    .line 47
    .line 48
    if-lez v0, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 51
    .line 52
    iget-wide v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Lcom/tencent/cloud/ai/network/okio/e;->b(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/e;

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 58
    .line 59
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->j:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/e$b;)Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->j:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 65
    .line 66
    invoke-virtual {p1, v0, v1}, Lcom/tencent/cloud/ai/network/okio/e$b;->h(J)I

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->j:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 70
    .line 71
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->i:[B

    .line 72
    .line 73
    invoke-static {p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketProtocol;->a(Lcom/tencent/cloud/ai/network/okio/e$b;[B)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->j:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/e$b;->close()V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    invoke-virtual {v1, v0}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->d:Lcom/tencent/cloud/ai/network/okio/e;

    .line 86
    .line 87
    invoke-virtual {p1, p2}, Lcom/tencent/cloud/ai/network/okio/e;->b(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/e;

    .line 88
    .line 89
    .line 90
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->c:Lcom/tencent/cloud/ai/network/okio/f;

    .line 91
    .line 92
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/f;->flush()V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    const-string p0, "Payload size must be less than or equal to 125"

    .line 97
    .line 98
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    const-string p0, "closed"

    .line 103
    .line 104
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method
