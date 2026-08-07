.class public Ll/ctp0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ctp0$a;
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:Lokio/BufferedSource;

.field public final c:Ll/ctp0$a;

.field public d:Z

.field public e:I

.field public f:J

.field public g:J

.field public h:Z

.field public i:Z

.field public j:Z

.field public final k:[B

.field public final l:[B


# direct methods
.method public constructor <init>(ZLokio/BufferedSource;Ll/ctp0$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v0, v0, [B

    .line 6
    .line 7
    iput-object v0, p0, Ll/ctp0;->k:[B

    .line 8
    .line 9
    const/16 v0, 0x2000

    .line 10
    .line 11
    new-array v0, v0, [B

    .line 12
    .line 13
    iput-object v0, p0, Ll/ctp0;->l:[B

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    iput-boolean p1, p0, Ll/ctp0;->a:Z

    .line 21
    .line 22
    iput-object p2, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 23
    .line 24
    iput-object p3, p0, Ll/ctp0;->c:Ll/ctp0$a;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p0, "frameCallback == null"

    .line 28
    .line 29
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw v0

    .line 33
    :cond_1
    const-string p0, "source == null"

    .line 34
    .line 35
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw v0
.end method


# virtual methods
.method public a()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ctp0;->c()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/ctp0;->i:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ctp0;->b()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/ctp0;->e()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final b()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lokio/Buffer;

    .line 2
    .line 3
    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Ll/ctp0;->g:J

    .line 7
    .line 8
    iget-wide v3, p0, Ll/ctp0;->f:J

    .line 9
    .line 10
    cmp-long v1, v1, v3

    .line 11
    .line 12
    if-gez v1, :cond_2

    .line 13
    .line 14
    iget-boolean v1, p0, Ll/ctp0;->a:Z

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 19
    .line 20
    invoke-interface {v1, v0, v3, v4}, Lokio/BufferedSource;->readFully(Lokio/Buffer;J)V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    iget-wide v1, p0, Ll/ctp0;->g:J

    .line 25
    .line 26
    iget-wide v3, p0, Ll/ctp0;->f:J

    .line 27
    .line 28
    cmp-long v5, v1, v3

    .line 29
    .line 30
    if-gez v5, :cond_2

    .line 31
    .line 32
    sub-long/2addr v3, v1

    .line 33
    iget-object v1, p0, Ll/ctp0;->l:[B

    .line 34
    .line 35
    array-length v1, v1

    .line 36
    int-to-long v1, v1

    .line 37
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    long-to-int v1, v1

    .line 42
    iget-object v2, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 43
    .line 44
    iget-object v3, p0, Ll/ctp0;->l:[B

    .line 45
    .line 46
    const/4 v4, 0x0

    .line 47
    invoke-interface {v2, v3, v4, v1}, Lokio/BufferedSource;->read([BII)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const/4 v2, -0x1

    .line 52
    if-eq v1, v2, :cond_1

    .line 53
    .line 54
    iget-object v5, p0, Ll/ctp0;->l:[B

    .line 55
    .line 56
    int-to-long v6, v1

    .line 57
    iget-object v8, p0, Ll/ctp0;->k:[B

    .line 58
    .line 59
    iget-wide v9, p0, Ll/ctp0;->g:J

    .line 60
    .line 61
    invoke-static/range {v5 .. v10}, Ll/btp0;->b([BJ[BJ)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Ll/ctp0;->l:[B

    .line 65
    .line 66
    invoke-virtual {v0, v2, v4, v1}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 67
    .line 68
    .line 69
    iget-wide v1, p0, Ll/ctp0;->g:J

    .line 70
    .line 71
    add-long/2addr v1, v6

    .line 72
    iput-wide v1, p0, Ll/ctp0;->g:J

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    invoke-static {}, Ll/vg3;->a()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    :goto_1
    iget v1, p0, Ll/ctp0;->e:I

    .line 80
    .line 81
    packed-switch v1, :pswitch_data_0

    .line 82
    .line 83
    .line 84
    new-instance v0, Ljava/net/ProtocolException;

    .line 85
    .line 86
    iget p0, p0, Ll/ctp0;->e:I

    .line 87
    .line 88
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v2, "Unknown control opcode: "

    .line 95
    .line 96
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    throw v0

    .line 110
    :pswitch_0
    iget-object p0, p0, Ll/ctp0;->c:Ll/ctp0$a;

    .line 111
    .line 112
    invoke-virtual {v0}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-interface {p0, v0}, Ll/ctp0$a;->b(Lokio/ByteString;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :pswitch_1
    iget-object p0, p0, Ll/ctp0;->c:Ll/ctp0$a;

    .line 121
    .line 122
    invoke-virtual {v0}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-interface {p0, v0}, Ll/ctp0$a;->a(Lokio/ByteString;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :pswitch_2
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 131
    .line 132
    .line 133
    move-result-wide v1

    .line 134
    const-wide/16 v3, 0x1

    .line 135
    .line 136
    cmp-long v3, v1, v3

    .line 137
    .line 138
    if-eqz v3, :cond_5

    .line 139
    .line 140
    const-wide/16 v3, 0x0

    .line 141
    .line 142
    cmp-long v1, v1, v3

    .line 143
    .line 144
    if-eqz v1, :cond_4

    .line 145
    .line 146
    invoke-virtual {v0}, Lokio/Buffer;->readShort()S

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    invoke-virtual {v0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-static {v1}, Ll/btp0;->a(I)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    if-nez v2, :cond_3

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_3
    invoke-static {v2}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_4
    const/16 v1, 0x3ed

    .line 166
    .line 167
    const-string v0, ""

    .line 168
    .line 169
    :goto_2
    iget-object v2, p0, Ll/ctp0;->c:Ll/ctp0$a;

    .line 170
    .line 171
    invoke-interface {v2, v1, v0}, Ll/ctp0$a;->onReadClose(ILjava/lang/String;)V

    .line 172
    .line 173
    .line 174
    const/4 v0, 0x1

    .line 175
    iput-boolean v0, p0, Ll/ctp0;->d:Z

    .line 176
    .line 177
    return-void

    .line 178
    :cond_5
    const-string p0, "Malformed close payload length of 1."

    .line 179
    .line 180
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    nop

    .line 185
    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final c()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/ctp0;->d:Z

    .line 4
    .line 5
    if-nez v1, :cond_11

    .line 6
    .line 7
    iget-object v1, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 8
    .line 9
    invoke-interface {v1}, Lokio/Source;->timeout()Lokio/Timeout;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lokio/Timeout;->timeoutNanos()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    iget-object v3, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 18
    .line 19
    invoke-interface {v3}, Lokio/Source;->timeout()Lokio/Timeout;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3}, Lokio/Timeout;->clearTimeout()Lokio/Timeout;

    .line 24
    .line 25
    .line 26
    :try_start_0
    iget-object v3, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 27
    .line 28
    invoke-interface {v3}, Lokio/BufferedSource;->readByte()B

    .line 29
    .line 30
    .line 31
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object v4, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 33
    .line 34
    invoke-interface {v4}, Lokio/Source;->timeout()Lokio/Timeout;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v4, v1, v2, v0}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 39
    .line 40
    .line 41
    and-int/lit8 v0, v3, 0xf

    .line 42
    .line 43
    iput v0, p0, Ll/ctp0;->e:I

    .line 44
    .line 45
    and-int/lit16 v0, v3, 0x80

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    const/4 v2, 0x1

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    move v0, v2

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    move v0, v1

    .line 54
    :goto_0
    iput-boolean v0, p0, Ll/ctp0;->h:Z

    .line 55
    .line 56
    and-int/lit8 v4, v3, 0x8

    .line 57
    .line 58
    if-eqz v4, :cond_1

    .line 59
    .line 60
    move v4, v2

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    move v4, v1

    .line 63
    :goto_1
    iput-boolean v4, p0, Ll/ctp0;->i:Z

    .line 64
    .line 65
    if-eqz v4, :cond_3

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_2
    const-string p0, "Control frames must be final."

    .line 71
    .line 72
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_3
    :goto_2
    and-int/lit8 v0, v3, 0x40

    .line 77
    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    move v0, v2

    .line 81
    goto :goto_3

    .line 82
    :cond_4
    move v0, v1

    .line 83
    :goto_3
    and-int/lit8 v4, v3, 0x20

    .line 84
    .line 85
    if-eqz v4, :cond_5

    .line 86
    .line 87
    move v4, v2

    .line 88
    goto :goto_4

    .line 89
    :cond_5
    move v4, v1

    .line 90
    :goto_4
    and-int/lit8 v3, v3, 0x10

    .line 91
    .line 92
    if-eqz v3, :cond_6

    .line 93
    .line 94
    move v3, v2

    .line 95
    goto :goto_5

    .line 96
    :cond_6
    move v3, v1

    .line 97
    :goto_5
    if-nez v0, :cond_10

    .line 98
    .line 99
    if-nez v4, :cond_10

    .line 100
    .line 101
    if-nez v3, :cond_10

    .line 102
    .line 103
    iget-object v0, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 104
    .line 105
    invoke-interface {v0}, Lokio/BufferedSource;->readByte()B

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    and-int/lit16 v3, v0, 0x80

    .line 110
    .line 111
    if-eqz v3, :cond_7

    .line 112
    .line 113
    move v1, v2

    .line 114
    :cond_7
    iput-boolean v1, p0, Ll/ctp0;->j:Z

    .line 115
    .line 116
    iget-boolean v2, p0, Ll/ctp0;->a:Z

    .line 117
    .line 118
    if-ne v1, v2, :cond_9

    .line 119
    .line 120
    new-instance v0, Ljava/net/ProtocolException;

    .line 121
    .line 122
    iget-boolean p0, p0, Ll/ctp0;->a:Z

    .line 123
    .line 124
    if-eqz p0, :cond_8

    .line 125
    .line 126
    const-string p0, "Server-sent frames must not be masked."

    .line 127
    .line 128
    goto :goto_6

    .line 129
    :cond_8
    const-string p0, "Client-sent frames must be masked."

    .line 130
    .line 131
    :goto_6
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    throw v0

    .line 135
    :cond_9
    and-int/lit8 v0, v0, 0x7f

    .line 136
    .line 137
    int-to-long v0, v0

    .line 138
    iput-wide v0, p0, Ll/ctp0;->f:J

    .line 139
    .line 140
    const-wide/16 v2, 0x7e

    .line 141
    .line 142
    cmp-long v2, v0, v2

    .line 143
    .line 144
    const-wide/16 v3, 0x0

    .line 145
    .line 146
    if-nez v2, :cond_a

    .line 147
    .line 148
    iget-object v0, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 149
    .line 150
    invoke-interface {v0}, Lokio/BufferedSource;->readShort()S

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    int-to-long v0, v0

    .line 155
    const-wide/32 v5, 0xffff

    .line 156
    .line 157
    .line 158
    and-long/2addr v0, v5

    .line 159
    iput-wide v0, p0, Ll/ctp0;->f:J

    .line 160
    .line 161
    goto :goto_7

    .line 162
    :cond_a
    const-wide/16 v5, 0x7f

    .line 163
    .line 164
    cmp-long v0, v0, v5

    .line 165
    .line 166
    if-nez v0, :cond_c

    .line 167
    .line 168
    iget-object v0, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 169
    .line 170
    invoke-interface {v0}, Lokio/BufferedSource;->readLong()J

    .line 171
    .line 172
    .line 173
    move-result-wide v0

    .line 174
    iput-wide v0, p0, Ll/ctp0;->f:J

    .line 175
    .line 176
    cmp-long v0, v0, v3

    .line 177
    .line 178
    if-ltz v0, :cond_b

    .line 179
    .line 180
    goto :goto_7

    .line 181
    :cond_b
    new-instance v0, Ljava/net/ProtocolException;

    .line 182
    .line 183
    iget-wide v1, p0, Ll/ctp0;->f:J

    .line 184
    .line 185
    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    new-instance v1, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    const-string v2, "Frame length 0x"

    .line 192
    .line 193
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string p0, " > 0x7FFFFFFFFFFFFFFF"

    .line 200
    .line 201
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    throw v0

    .line 212
    :cond_c
    :goto_7
    iput-wide v3, p0, Ll/ctp0;->g:J

    .line 213
    .line 214
    iget-boolean v0, p0, Ll/ctp0;->i:Z

    .line 215
    .line 216
    if-eqz v0, :cond_e

    .line 217
    .line 218
    iget-wide v0, p0, Ll/ctp0;->f:J

    .line 219
    .line 220
    const-wide/16 v2, 0x7d

    .line 221
    .line 222
    cmp-long v0, v0, v2

    .line 223
    .line 224
    if-gtz v0, :cond_d

    .line 225
    .line 226
    goto :goto_8

    .line 227
    :cond_d
    const-string p0, "Control frame must be less than 125B."

    .line 228
    .line 229
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    return-void

    .line 233
    :cond_e
    :goto_8
    iget-boolean v0, p0, Ll/ctp0;->j:Z

    .line 234
    .line 235
    if-eqz v0, :cond_f

    .line 236
    .line 237
    iget-object v0, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 238
    .line 239
    iget-object p0, p0, Ll/ctp0;->k:[B

    .line 240
    .line 241
    invoke-interface {v0, p0}, Lokio/BufferedSource;->readFully([B)V

    .line 242
    .line 243
    .line 244
    :cond_f
    return-void

    .line 245
    :cond_10
    const-string p0, "Reserved flags are unsupported."

    .line 246
    .line 247
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :catchall_0
    move-exception v3

    .line 252
    iget-object p0, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 253
    .line 254
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    invoke-virtual {p0, v1, v2, v0}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 259
    .line 260
    .line 261
    throw v3

    .line 262
    :cond_11
    const-string p0, "closed"

    .line 263
    .line 264
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    return-void
.end method

.method public final d(Lokio/Buffer;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    iget-boolean v0, p0, Ll/ctp0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    iget-wide v0, p0, Ll/ctp0;->g:J

    .line 6
    .line 7
    iget-wide v2, p0, Ll/ctp0;->f:J

    .line 8
    .line 9
    cmp-long v0, v0, v2

    .line 10
    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-boolean v0, p0, Ll/ctp0;->h:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/ctp0;->f()V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Ll/ctp0;->e:I

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-boolean v0, p0, Ll/ctp0;->h:Z

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-wide v0, p0, Ll/ctp0;->f:J

    .line 30
    .line 31
    const-wide/16 v2, 0x0

    .line 32
    .line 33
    cmp-long v0, v0, v2

    .line 34
    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    :goto_1
    return-void

    .line 38
    :cond_1
    new-instance p1, Ljava/net/ProtocolException;

    .line 39
    .line 40
    iget p0, p0, Ll/ctp0;->e:I

    .line 41
    .line 42
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v1, "Expected continuation opcode. Got: "

    .line 49
    .line 50
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-direct {p1, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw p1

    .line 64
    :cond_2
    iget-wide v0, p0, Ll/ctp0;->f:J

    .line 65
    .line 66
    iget-wide v2, p0, Ll/ctp0;->g:J

    .line 67
    .line 68
    sub-long/2addr v0, v2

    .line 69
    iget-boolean v2, p0, Ll/ctp0;->j:Z

    .line 70
    .line 71
    const-wide/16 v3, -0x1

    .line 72
    .line 73
    if-eqz v2, :cond_4

    .line 74
    .line 75
    iget-object v2, p0, Ll/ctp0;->l:[B

    .line 76
    .line 77
    array-length v2, v2

    .line 78
    int-to-long v5, v2

    .line 79
    invoke-static {v0, v1, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    iget-object v2, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 84
    .line 85
    iget-object v5, p0, Ll/ctp0;->l:[B

    .line 86
    .line 87
    long-to-int v0, v0

    .line 88
    const/4 v1, 0x0

    .line 89
    invoke-interface {v2, v5, v1, v0}, Lokio/BufferedSource;->read([BII)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    int-to-long v6, v0

    .line 94
    cmp-long v0, v6, v3

    .line 95
    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    iget-object v5, p0, Ll/ctp0;->l:[B

    .line 99
    .line 100
    iget-object v8, p0, Ll/ctp0;->k:[B

    .line 101
    .line 102
    iget-wide v9, p0, Ll/ctp0;->g:J

    .line 103
    .line 104
    invoke-static/range {v5 .. v10}, Ll/btp0;->b([BJ[BJ)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/ctp0;->l:[B

    .line 108
    .line 109
    long-to-int v2, v6

    .line 110
    invoke-virtual {p1, v0, v1, v2}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    invoke-static {}, Ll/vg3;->a()V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    iget-object v2, p0, Ll/ctp0;->b:Lokio/BufferedSource;

    .line 119
    .line 120
    invoke-interface {v2, p1, v0, v1}, Lokio/Source;->read(Lokio/Buffer;J)J

    .line 121
    .line 122
    .line 123
    move-result-wide v6

    .line 124
    cmp-long v0, v6, v3

    .line 125
    .line 126
    if-eqz v0, :cond_5

    .line 127
    .line 128
    :goto_2
    iget-wide v0, p0, Ll/ctp0;->g:J

    .line 129
    .line 130
    add-long/2addr v0, v6

    .line 131
    iput-wide v0, p0, Ll/ctp0;->g:J

    .line 132
    .line 133
    goto/16 :goto_0

    .line 134
    .line 135
    :cond_5
    invoke-static {}, Ll/vg3;->a()V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_6
    const-string p0, "closed"

    .line 140
    .line 141
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public final e()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/ctp0;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance p0, Ljava/net/ProtocolException;

    .line 11
    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "Unknown opcode: "

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-direct {p0, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p0

    .line 34
    :cond_1
    :goto_0
    new-instance v2, Lokio/Buffer;

    .line 35
    .line 36
    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v2}, Ll/ctp0;->d(Lokio/Buffer;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/ctp0;->c:Ll/ctp0$a;

    .line 43
    .line 44
    if-ne v0, v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v2}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {p0, v0}, Ll/ctp0$a;->onReadMessage(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    invoke-virtual {v2}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {p0, v0}, Ll/ctp0$a;->d(Lokio/ByteString;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public f()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    iget-boolean v0, p0, Ll/ctp0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ctp0;->c()V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/ctp0;->i:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/ctp0;->b()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    :goto_1
    return-void
.end method
