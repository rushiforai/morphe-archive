.class public final Ll/dtp0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dtp0$a;
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:Lokio/BufferedSource;

.field public final c:Ll/dtp0$a;

.field public d:Z

.field public e:I

.field public f:J

.field public g:Z

.field public h:Z

.field public final i:Lokio/Buffer;

.field public final j:Lokio/Buffer;

.field public final k:[B

.field public final l:Lokio/Buffer$UnsafeCursor;


# direct methods
.method public constructor <init>(ZLokio/BufferedSource;Ll/dtp0$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lokio/Buffer;

    .line 5
    .line 6
    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/dtp0;->i:Lokio/Buffer;

    .line 10
    .line 11
    new-instance v0, Lokio/Buffer;

    .line 12
    .line 13
    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/dtp0;->j:Lokio/Buffer;

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
    iput-boolean p1, p0, Ll/dtp0;->a:Z

    .line 24
    .line 25
    iput-object p2, p0, Ll/dtp0;->b:Lokio/BufferedSource;

    .line 26
    .line 27
    iput-object p3, p0, Ll/dtp0;->c:Ll/dtp0$a;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    move-object p2, v0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p2, 0x4

    .line 34
    new-array p2, p2, [B

    .line 35
    .line 36
    :goto_0
    iput-object p2, p0, Ll/dtp0;->k:[B

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    new-instance v0, Lokio/Buffer$UnsafeCursor;

    .line 42
    .line 43
    invoke-direct {v0}, Lokio/Buffer$UnsafeCursor;-><init>()V

    .line 44
    .line 45
    .line 46
    :goto_1
    iput-object v0, p0, Ll/dtp0;->l:Lokio/Buffer$UnsafeCursor;

    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    const-string p0, "frameCallback == null"

    .line 50
    .line 51
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw v0

    .line 55
    :cond_3
    const-string p0, "source == null"

    .line 56
    .line 57
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
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
    invoke-virtual {p0}, Ll/dtp0;->c()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/dtp0;->h:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/dtp0;->b()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/dtp0;->e()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final b()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/dtp0;->f:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-lez v4, :cond_0

    .line 8
    .line 9
    iget-object v4, p0, Ll/dtp0;->b:Lokio/BufferedSource;

    .line 10
    .line 11
    iget-object v5, p0, Ll/dtp0;->i:Lokio/Buffer;

    .line 12
    .line 13
    invoke-interface {v4, v5, v0, v1}, Lokio/BufferedSource;->readFully(Lokio/Buffer;J)V

    .line 14
    .line 15
    .line 16
    iget-boolean v0, p0, Ll/dtp0;->a:Z

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/dtp0;->i:Lokio/Buffer;

    .line 21
    .line 22
    iget-object v1, p0, Ll/dtp0;->l:Lokio/Buffer$UnsafeCursor;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lokio/Buffer;->readAndWriteUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/dtp0;->l:Lokio/Buffer$UnsafeCursor;

    .line 28
    .line 29
    invoke-virtual {v0, v2, v3}, Lokio/Buffer$UnsafeCursor;->seek(J)I

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/dtp0;->l:Lokio/Buffer$UnsafeCursor;

    .line 33
    .line 34
    iget-object v1, p0, Ll/dtp0;->k:[B

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/atp0;->b(Lokio/Buffer$UnsafeCursor;[B)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/dtp0;->l:Lokio/Buffer$UnsafeCursor;

    .line 40
    .line 41
    invoke-virtual {v0}, Lokio/Buffer$UnsafeCursor;->close()V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget v0, p0, Ll/dtp0;->e:I

    .line 45
    .line 46
    packed-switch v0, :pswitch_data_0

    .line 47
    .line 48
    .line 49
    new-instance v0, Ljava/net/ProtocolException;

    .line 50
    .line 51
    iget p0, p0, Ll/dtp0;->e:I

    .line 52
    .line 53
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v2, "Unknown control opcode: "

    .line 60
    .line 61
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw v0

    .line 75
    :pswitch_0
    iget-object v0, p0, Ll/dtp0;->c:Ll/dtp0$a;

    .line 76
    .line 77
    iget-object p0, p0, Ll/dtp0;->i:Lokio/Buffer;

    .line 78
    .line 79
    invoke-virtual {p0}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {v0, p0}, Ll/dtp0$a;->b(Lokio/ByteString;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :pswitch_1
    iget-object v0, p0, Ll/dtp0;->c:Ll/dtp0$a;

    .line 88
    .line 89
    iget-object p0, p0, Ll/dtp0;->i:Lokio/Buffer;

    .line 90
    .line 91
    invoke-virtual {p0}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-interface {v0, p0}, Ll/dtp0$a;->a(Lokio/ByteString;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_2
    iget-object v0, p0, Ll/dtp0;->i:Lokio/Buffer;

    .line 100
    .line 101
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 102
    .line 103
    .line 104
    move-result-wide v0

    .line 105
    const-wide/16 v4, 0x1

    .line 106
    .line 107
    cmp-long v4, v0, v4

    .line 108
    .line 109
    if-eqz v4, :cond_3

    .line 110
    .line 111
    cmp-long v0, v0, v2

    .line 112
    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    iget-object v0, p0, Ll/dtp0;->i:Lokio/Buffer;

    .line 116
    .line 117
    invoke-virtual {v0}, Lokio/Buffer;->readShort()S

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iget-object v1, p0, Ll/dtp0;->i:Lokio/Buffer;

    .line 122
    .line 123
    invoke-virtual {v1}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-static {v0}, Ll/atp0;->a(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    if-nez v2, :cond_1

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_1
    invoke-static {v2}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_2
    const/16 v0, 0x3ed

    .line 139
    .line 140
    const-string v1, ""

    .line 141
    .line 142
    :goto_0
    iget-object v2, p0, Ll/dtp0;->c:Ll/dtp0$a;

    .line 143
    .line 144
    invoke-interface {v2, v0, v1}, Ll/dtp0$a;->onReadClose(ILjava/lang/String;)V

    .line 145
    .line 146
    .line 147
    const/4 v0, 0x1

    .line 148
    iput-boolean v0, p0, Ll/dtp0;->d:Z

    .line 149
    .line 150
    return-void

    .line 151
    :cond_3
    const-string p0, "Malformed close payload length of 1."

    .line 152
    .line 153
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final c()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/dtp0;->d:Z

    .line 4
    .line 5
    if-nez v1, :cond_11

    .line 6
    .line 7
    iget-object v1, p0, Ll/dtp0;->b:Lokio/BufferedSource;

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
    iget-object v3, p0, Ll/dtp0;->b:Lokio/BufferedSource;

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
    iget-object v3, p0, Ll/dtp0;->b:Lokio/BufferedSource;

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
    iget-object v4, p0, Ll/dtp0;->b:Lokio/BufferedSource;

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
    iput v0, p0, Ll/dtp0;->e:I

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
    iput-boolean v0, p0, Ll/dtp0;->g:Z

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
    iput-boolean v4, p0, Ll/dtp0;->h:Z

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
    iget-object v0, p0, Ll/dtp0;->b:Lokio/BufferedSource;

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
    iget-boolean v2, p0, Ll/dtp0;->a:Z

    .line 115
    .line 116
    if-ne v1, v2, :cond_9

    .line 117
    .line 118
    new-instance v0, Ljava/net/ProtocolException;

    .line 119
    .line 120
    iget-boolean p0, p0, Ll/dtp0;->a:Z

    .line 121
    .line 122
    if-eqz p0, :cond_8

    .line 123
    .line 124
    const-string p0, "Server-sent frames must not be masked."

    .line 125
    .line 126
    goto :goto_6

    .line 127
    :cond_8
    const-string p0, "Client-sent frames must be masked."

    .line 128
    .line 129
    :goto_6
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    throw v0

    .line 133
    :cond_9
    and-int/lit8 v0, v0, 0x7f

    .line 134
    .line 135
    int-to-long v2, v0

    .line 136
    iput-wide v2, p0, Ll/dtp0;->f:J

    .line 137
    .line 138
    const-wide/16 v4, 0x7e

    .line 139
    .line 140
    cmp-long v0, v2, v4

    .line 141
    .line 142
    if-nez v0, :cond_a

    .line 143
    .line 144
    iget-object v0, p0, Ll/dtp0;->b:Lokio/BufferedSource;

    .line 145
    .line 146
    invoke-interface {v0}, Lokio/BufferedSource;->readShort()S

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    int-to-long v2, v0

    .line 151
    const-wide/32 v4, 0xffff

    .line 152
    .line 153
    .line 154
    and-long/2addr v2, v4

    .line 155
    iput-wide v2, p0, Ll/dtp0;->f:J

    .line 156
    .line 157
    goto :goto_7

    .line 158
    :cond_a
    const-wide/16 v4, 0x7f

    .line 159
    .line 160
    cmp-long v0, v2, v4

    .line 161
    .line 162
    if-nez v0, :cond_c

    .line 163
    .line 164
    iget-object v0, p0, Ll/dtp0;->b:Lokio/BufferedSource;

    .line 165
    .line 166
    invoke-interface {v0}, Lokio/BufferedSource;->readLong()J

    .line 167
    .line 168
    .line 169
    move-result-wide v2

    .line 170
    iput-wide v2, p0, Ll/dtp0;->f:J

    .line 171
    .line 172
    const-wide/16 v4, 0x0

    .line 173
    .line 174
    cmp-long v0, v2, v4

    .line 175
    .line 176
    if-ltz v0, :cond_b

    .line 177
    .line 178
    goto :goto_7

    .line 179
    :cond_b
    new-instance v0, Ljava/net/ProtocolException;

    .line 180
    .line 181
    iget-wide v1, p0, Ll/dtp0;->f:J

    .line 182
    .line 183
    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    new-instance v1, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    const-string v2, "Frame length 0x"

    .line 190
    .line 191
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string p0, " > 0x7FFFFFFFFFFFFFFF"

    .line 198
    .line 199
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    throw v0

    .line 210
    :cond_c
    :goto_7
    iget-boolean v0, p0, Ll/dtp0;->h:Z

    .line 211
    .line 212
    if-eqz v0, :cond_e

    .line 213
    .line 214
    iget-wide v2, p0, Ll/dtp0;->f:J

    .line 215
    .line 216
    const-wide/16 v4, 0x7d

    .line 217
    .line 218
    cmp-long v0, v2, v4

    .line 219
    .line 220
    if-gtz v0, :cond_d

    .line 221
    .line 222
    goto :goto_8

    .line 223
    :cond_d
    const-string p0, "Control frame must be less than 125B."

    .line 224
    .line 225
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_e
    :goto_8
    if-eqz v1, :cond_f

    .line 230
    .line 231
    iget-object v0, p0, Ll/dtp0;->b:Lokio/BufferedSource;

    .line 232
    .line 233
    iget-object p0, p0, Ll/dtp0;->k:[B

    .line 234
    .line 235
    invoke-interface {v0, p0}, Lokio/BufferedSource;->readFully([B)V

    .line 236
    .line 237
    .line 238
    :cond_f
    return-void

    .line 239
    :cond_10
    const-string p0, "Reserved flags are unsupported."

    .line 240
    .line 241
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :catchall_0
    move-exception v3

    .line 246
    iget-object p0, p0, Ll/dtp0;->b:Lokio/BufferedSource;

    .line 247
    .line 248
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    invoke-virtual {p0, v1, v2, v0}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 253
    .line 254
    .line 255
    throw v3

    .line 256
    :cond_11
    const-string p0, "closed"

    .line 257
    .line 258
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    return-void
.end method

.method public final d()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    iget-boolean v0, p0, Ll/dtp0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget-wide v0, p0, Ll/dtp0;->f:J

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v2, v0, v2

    .line 10
    .line 11
    if-lez v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Ll/dtp0;->b:Lokio/BufferedSource;

    .line 14
    .line 15
    iget-object v3, p0, Ll/dtp0;->j:Lokio/Buffer;

    .line 16
    .line 17
    invoke-interface {v2, v3, v0, v1}, Lokio/BufferedSource;->readFully(Lokio/Buffer;J)V

    .line 18
    .line 19
    .line 20
    iget-boolean v0, p0, Ll/dtp0;->a:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/dtp0;->j:Lokio/Buffer;

    .line 25
    .line 26
    iget-object v1, p0, Ll/dtp0;->l:Lokio/Buffer$UnsafeCursor;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lokio/Buffer;->readAndWriteUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/dtp0;->l:Lokio/Buffer$UnsafeCursor;

    .line 32
    .line 33
    iget-object v1, p0, Ll/dtp0;->j:Lokio/Buffer;

    .line 34
    .line 35
    invoke-virtual {v1}, Lokio/Buffer;->size()J

    .line 36
    .line 37
    .line 38
    move-result-wide v1

    .line 39
    iget-wide v3, p0, Ll/dtp0;->f:J

    .line 40
    .line 41
    sub-long/2addr v1, v3

    .line 42
    invoke-virtual {v0, v1, v2}, Lokio/Buffer$UnsafeCursor;->seek(J)I

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/dtp0;->l:Lokio/Buffer$UnsafeCursor;

    .line 46
    .line 47
    iget-object v1, p0, Ll/dtp0;->k:[B

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/atp0;->b(Lokio/Buffer$UnsafeCursor;[B)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/dtp0;->l:Lokio/Buffer$UnsafeCursor;

    .line 53
    .line 54
    invoke-virtual {v0}, Lokio/Buffer$UnsafeCursor;->close()V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-boolean v0, p0, Ll/dtp0;->g:Z

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    invoke-virtual {p0}, Ll/dtp0;->f()V

    .line 63
    .line 64
    .line 65
    iget v0, p0, Ll/dtp0;->e:I

    .line 66
    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    new-instance v0, Ljava/net/ProtocolException;

    .line 71
    .line 72
    iget p0, p0, Ll/dtp0;->e:I

    .line 73
    .line 74
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v2, "Expected continuation opcode. Got: "

    .line 81
    .line 82
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    throw v0

    .line 96
    :cond_3
    const-string p0, "closed"

    .line 97
    .line 98
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
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
    iget v0, p0, Ll/dtp0;->e:I

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
    invoke-virtual {p0}, Ll/dtp0;->d()V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Ll/dtp0;->c:Ll/dtp0$a;

    .line 38
    .line 39
    if-ne v0, v1, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Ll/dtp0;->j:Lokio/Buffer;

    .line 42
    .line 43
    invoke-virtual {p0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {v2, p0}, Ll/dtp0$a;->onReadMessage(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    iget-object p0, p0, Ll/dtp0;->j:Lokio/Buffer;

    .line 52
    .line 53
    invoke-virtual {p0}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {v2, p0}, Ll/dtp0$a;->d(Lokio/ByteString;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final f()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    iget-boolean v0, p0, Ll/dtp0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dtp0;->c()V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/dtp0;->h:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/dtp0;->b()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    :goto_1
    return-void
.end method
