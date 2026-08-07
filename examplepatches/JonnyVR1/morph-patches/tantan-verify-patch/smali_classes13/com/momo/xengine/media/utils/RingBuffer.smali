.class public Lcom/momo/xengine/media/utils/RingBuffer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private array:[B

.field private readPos:I

.field private writePos:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-array p1, p1, [B

    .line 5
    .line 6
    iput-object p1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 7
    .line 8
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 8

    .line 1
    new-instance p0, Lcom/momo/xengine/media/utils/RingBuffer;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lcom/momo/xengine/media/utils/RingBuffer;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const/16 v0, 0xa

    .line 9
    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    fill-array-data v0, :array_0

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/momo/xengine/media/utils/RingBuffer;->write([B)I

    .line 16
    .line 17
    .line 18
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 19
    .line 20
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v3, "write data : "

    .line 23
    .line 24
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 42
    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v3, "dump : "

    .line 46
    .line 47
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->dump()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    :goto_0
    const/16 v2, 0x64

    .line 66
    .line 67
    if-ge v1, v2, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->readable()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 74
    .line 75
    new-instance v5, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v6, "i = "

    .line 78
    .line 79
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v7, ",readable = "

    .line 86
    .line 87
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->readable()I

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    rem-int/lit8 v4, v1, 0x3

    .line 105
    .line 106
    if-nez v4, :cond_0

    .line 107
    .line 108
    new-array v2, v2, [B

    .line 109
    .line 110
    invoke-virtual {p0, v2}, Lcom/momo/xengine/media/utils/RingBuffer;->read([B)I

    .line 111
    .line 112
    .line 113
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 114
    .line 115
    new-instance v5, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v6, ",readBuff = "

    .line 124
    .line 125
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-static {v2}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v4, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 143
    .line 144
    new-instance v4, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->dump()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_0
    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    check-cast v2, [B

    .line 169
    .line 170
    rem-int/lit8 v4, v1, 0x2

    .line 171
    .line 172
    if-nez v4, :cond_1

    .line 173
    .line 174
    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    check-cast v2, [B

    .line 179
    .line 180
    invoke-virtual {v2}, [B->clone()Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    check-cast v2, [B

    .line 185
    .line 186
    :cond_1
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 187
    .line 188
    new-instance v5, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    const-string v6, ",write data : "

    .line 197
    .line 198
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-static {v2}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v5

    .line 212
    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0, v2}, Lcom/momo/xengine/media/utils/RingBuffer;->write([B)I

    .line 216
    .line 217
    .line 218
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 219
    .line 220
    new-instance v4, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->dump()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v5

    .line 229
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 240
    .line 241
    goto/16 :goto_0

    .line 242
    .line 243
    :cond_2
    return-void

    .line 244
    nop

    .line 245
    :array_0
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
    .end array-data
.end method

.method private reCapacity(I)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-gt p1, v1, :cond_0

    .line 5
    .line 6
    array-length p0, v0

    .line 7
    return p0

    .line 8
    :cond_0
    array-length v0, v0

    .line 9
    :goto_0
    if-ge v0, p1, :cond_1

    .line 10
    .line 11
    mul-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    new-array p1, v0, [B

    .line 15
    .line 16
    iget v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 17
    .line 18
    iget v1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-ne v0, v1, :cond_2

    .line 22
    .line 23
    iput v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 24
    .line 25
    iput v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 26
    .line 27
    iput-object p1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    if-ge v0, v1, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->readable()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 37
    .line 38
    iget v3, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 39
    .line 40
    invoke-static {v1, v3, p1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    iput v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 44
    .line 45
    iput v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 46
    .line 47
    iput-object p1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    iget-object v1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 51
    .line 52
    array-length v3, v1

    .line 53
    sub-int/2addr v3, v0

    .line 54
    invoke-static {v1, v0, p1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 58
    .line 59
    iget v1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 60
    .line 61
    invoke-static {v0, v2, p1, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    .line 63
    .line 64
    iget v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 65
    .line 66
    add-int/2addr v3, v0

    .line 67
    iput v3, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 68
    .line 69
    iput v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 70
    .line 71
    iput-object p1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 72
    .line 73
    :goto_1
    iget-object p0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 74
    .line 75
    array-length p0, p0

    .line 76
    return p0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 3
    .line 4
    iput v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 5
    .line 6
    return-void
.end method

.method public dump()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "array.length = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 9
    .line 10
    array-length v1, v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ","

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, "readPos = "

    .line 32
    .line 33
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 37
    .line 38
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v0, "writePos = "

    .line 57
    .line 58
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 62
    .line 63
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v2, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v0, "readable = "

    .line 82
    .line 83
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->readable()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v0, "remaining = "

    .line 109
    .line 110
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->remaining()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0
.end method

.method public peek([B)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    array-length v1, p1

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/momo/xengine/media/utils/RingBuffer;->peek([BII)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public peek([BII)I
    .locals 1

    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/momo/xengine/media/utils/RingBuffer;->read([BIIZ)I

    move-result p0

    return p0
.end method

.method public read([B)I
    .locals 2

    const/4 v0, 0x0

    .line 110
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1, v0}, Lcom/momo/xengine/media/utils/RingBuffer;->read([BIIZ)I

    move-result p0

    return p0
.end method

.method public read([BIIZ)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    if-eqz v1, :cond_5

    .line 6
    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-ltz p2, :cond_4

    .line 11
    .line 12
    if-ltz p3, :cond_4

    .line 13
    .line 14
    array-length v1, p1

    .line 15
    if-ge p2, v1, :cond_4

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->readable()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    array-length v1, p1

    .line 26
    sub-int/2addr v1, p2

    .line 27
    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-lez p3, :cond_3

    .line 32
    .line 33
    iget v1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 34
    .line 35
    iget v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 36
    .line 37
    iget-object v3, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 38
    .line 39
    if-gt v1, v2, :cond_1

    .line 40
    .line 41
    invoke-static {v3, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    .line 43
    .line 44
    if-nez p4, :cond_3

    .line 45
    .line 46
    iget p1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 47
    .line 48
    add-int/2addr p1, p3

    .line 49
    iput p1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 50
    .line 51
    return p3

    .line 52
    :cond_1
    array-length v2, v3

    .line 53
    sub-int/2addr v2, v1

    .line 54
    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iget-object v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 59
    .line 60
    iget v3, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 61
    .line 62
    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    .line 64
    .line 65
    if-nez p4, :cond_2

    .line 66
    .line 67
    iget v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 68
    .line 69
    add-int/2addr v2, v1

    .line 70
    iput v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 71
    .line 72
    :cond_2
    if-ge v1, p3, :cond_3

    .line 73
    .line 74
    iget-object v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 75
    .line 76
    add-int/2addr p2, v1

    .line 77
    sub-int v1, p3, v1

    .line 78
    .line 79
    invoke-static {v2, v0, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    .line 81
    .line 82
    if-nez p4, :cond_3

    .line 83
    .line 84
    iput v1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 85
    .line 86
    :cond_3
    return p3

    .line 87
    :cond_4
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    array-length p1, p1

    .line 96
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    filled-new-array {p0, p2, p1}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const-string p1, "params error , offset = %s,length = %s,buff.length = %s"

    .line 105
    .line 106
    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    :cond_5
    :goto_0
    return v0
.end method

.method public readable()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->remaining()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    sub-int/2addr v0, p0

    .line 9
    return v0
.end method

.method public remaining()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 8
    .line 9
    array-length p0, p0

    .line 10
    sub-int/2addr v1, v0

    .line 11
    sub-int/2addr p0, v1

    .line 12
    return p0

    .line 13
    :cond_0
    sub-int/2addr v0, v1

    .line 14
    return v0
.end method

.method public write([B)I
    .locals 2

    const/4 v0, 0x0

    .line 105
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/momo/xengine/media/utils/RingBuffer;->write([BII)I

    move-result p0

    return p0
.end method

.method public write([BII)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    if-eqz v1, :cond_5

    .line 6
    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-ltz p2, :cond_4

    .line 11
    .line 12
    if-ltz p3, :cond_4

    .line 13
    .line 14
    add-int v1, p2, p3

    .line 15
    .line 16
    array-length v2, p1

    .line 17
    if-gt v1, v2, :cond_4

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/momo/xengine/media/utils/RingBuffer;->remaining()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-le p3, v1, :cond_1

    .line 24
    .line 25
    iget-object v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 26
    .line 27
    array-length v2, v2

    .line 28
    sub-int v1, p3, v1

    .line 29
    .line 30
    add-int/2addr v2, v1

    .line 31
    invoke-direct {p0, v2}, Lcom/momo/xengine/media/utils/RingBuffer;->reCapacity(I)I

    .line 32
    .line 33
    .line 34
    :cond_1
    iget v1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->readPos:I

    .line 35
    .line 36
    iget v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 37
    .line 38
    iget-object v3, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 39
    .line 40
    if-gt v1, v2, :cond_3

    .line 41
    .line 42
    array-length v1, v3

    .line 43
    sub-int/2addr v1, v2

    .line 44
    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iget-object v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 49
    .line 50
    iget v3, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 51
    .line 52
    invoke-static {p1, p2, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    iget v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 56
    .line 57
    add-int/2addr v2, v1

    .line 58
    iput v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 59
    .line 60
    if-le p3, v1, :cond_2

    .line 61
    .line 62
    add-int/2addr p2, v1

    .line 63
    iget-object v2, p0, Lcom/momo/xengine/media/utils/RingBuffer;->array:[B

    .line 64
    .line 65
    sub-int v1, p3, v1

    .line 66
    .line 67
    invoke-static {p1, p2, v2, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 68
    .line 69
    .line 70
    iput v1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 71
    .line 72
    :cond_2
    return p3

    .line 73
    :cond_3
    invoke-static {p1, p2, v3, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 74
    .line 75
    .line 76
    iget p1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 77
    .line 78
    add-int/2addr p1, p3

    .line 79
    iput p1, p0, Lcom/momo/xengine/media/utils/RingBuffer;->writePos:I

    .line 80
    .line 81
    return p3

    .line 82
    :cond_4
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    array-length p1, p1

    .line 91
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    filled-new-array {p0, p2, p1}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string p1, "params error , offset = %s,length = %s,data.length = %s"

    .line 100
    .line 101
    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    :cond_5
    :goto_0
    return v0
.end method
