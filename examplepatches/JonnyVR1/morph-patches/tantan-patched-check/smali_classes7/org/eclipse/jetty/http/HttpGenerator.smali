.class public Lorg/eclipse/jetty/http/HttpGenerator;
.super Lorg/eclipse/jetty/http/AbstractGenerator;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/http/HttpGenerator$Status;
    }
.end annotation


# static fields
.field private static final CHUNK_SPACE:I = 0xc

.field private static final CONNECTION_:[B

.field private static final CONNECTION_CLOSE:[B

.field private static final CONNECTION_KEEP_ALIVE:[B

.field private static final CONTENT_LENGTH_0:[B

.field private static final CRLF:[B

.field private static final LAST_CHUNK:[B

.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field private static SERVER:[B

.field private static final TRANSFER_ENCODING_CHUNKED:[B

.field private static final __status:[Lorg/eclipse/jetty/http/HttpGenerator$Status;


# instance fields
.field private _bufferChunked:Z

.field protected _bypass:Z

.field private _needCRLF:Z

.field private _needEOC:Z


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    const-class v0, Lorg/eclipse/jetty/http/HttpGenerator;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    const/16 v0, 0x1fc

    .line 10
    .line 11
    new-array v0, v0, [Lorg/eclipse/jetty/http/HttpGenerator$Status;

    .line 12
    .line 13
    sput-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->__status:[Lorg/eclipse/jetty/http/HttpGenerator$Status;

    .line 14
    .line 15
    sget-object v0, Lorg/eclipse/jetty/http/HttpVersions;->HTTP_1_1_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 16
    .line 17
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    move v2, v1

    .line 23
    :goto_0
    sget-object v3, Lorg/eclipse/jetty/http/HttpGenerator;->__status:[Lorg/eclipse/jetty/http/HttpGenerator$Status;

    .line 24
    .line 25
    array-length v3, v3

    .line 26
    if-ge v2, v3, :cond_2

    .line 27
    .line 28
    invoke-static {v2}, Lorg/eclipse/jetty/http/HttpStatus;->getCode(I)Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-nez v3, :cond_0

    .line 33
    .line 34
    goto/16 :goto_2

    .line 35
    .line 36
    :cond_0
    invoke-virtual {v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;->getMessage()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    add-int/lit8 v4, v0, 0x5

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    add-int/2addr v5, v4

    .line 47
    add-int/lit8 v5, v5, 0x2

    .line 48
    .line 49
    new-array v6, v5, [B

    .line 50
    .line 51
    sget-object v7, Lorg/eclipse/jetty/http/HttpVersions;->HTTP_1_1_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 52
    .line 53
    invoke-interface {v7, v1, v6, v1, v0}, Lorg/eclipse/jetty/io/Buffer;->peek(I[BII)I

    .line 54
    .line 55
    .line 56
    const/16 v7, 0x20

    .line 57
    .line 58
    aput-byte v7, v6, v0

    .line 59
    .line 60
    add-int/lit8 v8, v0, 0x1

    .line 61
    .line 62
    div-int/lit8 v9, v2, 0x64

    .line 63
    .line 64
    add-int/lit8 v9, v9, 0x30

    .line 65
    .line 66
    int-to-byte v9, v9

    .line 67
    aput-byte v9, v6, v8

    .line 68
    .line 69
    add-int/lit8 v8, v0, 0x2

    .line 70
    .line 71
    rem-int/lit8 v9, v2, 0x64

    .line 72
    .line 73
    const/16 v10, 0xa

    .line 74
    .line 75
    div-int/2addr v9, v10

    .line 76
    add-int/lit8 v9, v9, 0x30

    .line 77
    .line 78
    int-to-byte v9, v9

    .line 79
    aput-byte v9, v6, v8

    .line 80
    .line 81
    add-int/lit8 v8, v0, 0x3

    .line 82
    .line 83
    rem-int/lit8 v9, v2, 0xa

    .line 84
    .line 85
    add-int/lit8 v9, v9, 0x30

    .line 86
    .line 87
    int-to-byte v9, v9

    .line 88
    aput-byte v9, v6, v8

    .line 89
    .line 90
    add-int/lit8 v8, v0, 0x4

    .line 91
    .line 92
    aput-byte v7, v6, v8

    .line 93
    .line 94
    move v7, v1

    .line 95
    :goto_1
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    if-ge v7, v8, :cond_1

    .line 100
    .line 101
    add-int v8, v4, v7

    .line 102
    .line 103
    invoke-virtual {v3, v7}, Ljava/lang/String;->charAt(I)C

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    int-to-byte v9, v9

    .line 108
    aput-byte v9, v6, v8

    .line 109
    .line 110
    add-int/lit8 v7, v7, 0x1

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_1
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 114
    .line 115
    .line 116
    move-result v7

    .line 117
    add-int/2addr v7, v4

    .line 118
    const/16 v8, 0xd

    .line 119
    .line 120
    aput-byte v8, v6, v7

    .line 121
    .line 122
    add-int/lit8 v7, v0, 0x6

    .line 123
    .line 124
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    add-int/2addr v7, v3

    .line 129
    aput-byte v10, v6, v7

    .line 130
    .line 131
    sget-object v3, Lorg/eclipse/jetty/http/HttpGenerator;->__status:[Lorg/eclipse/jetty/http/HttpGenerator$Status;

    .line 132
    .line 133
    new-instance v7, Lorg/eclipse/jetty/http/HttpGenerator$Status;

    .line 134
    .line 135
    const/4 v8, 0x0

    .line 136
    invoke-direct {v7, v8}, Lorg/eclipse/jetty/http/HttpGenerator$Status;-><init>(Lorg/eclipse/jetty/http/HttpGenerator$1;)V

    .line 137
    .line 138
    .line 139
    aput-object v7, v3, v2

    .line 140
    .line 141
    new-instance v8, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 142
    .line 143
    sub-int v9, v5, v0

    .line 144
    .line 145
    add-int/lit8 v9, v9, -0x7

    .line 146
    .line 147
    invoke-direct {v8, v6, v4, v9, v1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([BIII)V

    .line 148
    .line 149
    .line 150
    iput-object v8, v7, Lorg/eclipse/jetty/http/HttpGenerator$Status;->_reason:Lorg/eclipse/jetty/io/Buffer;

    .line 151
    .line 152
    aget-object v7, v3, v2

    .line 153
    .line 154
    new-instance v8, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 155
    .line 156
    invoke-direct {v8, v6, v1, v4, v1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([BIII)V

    .line 157
    .line 158
    .line 159
    iput-object v8, v7, Lorg/eclipse/jetty/http/HttpGenerator$Status;->_schemeCode:Lorg/eclipse/jetty/io/Buffer;

    .line 160
    .line 161
    aget-object v3, v3, v2

    .line 162
    .line 163
    new-instance v4, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 164
    .line 165
    invoke-direct {v4, v6, v1, v5, v1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([BIII)V

    .line 166
    .line 167
    .line 168
    iput-object v4, v3, Lorg/eclipse/jetty/http/HttpGenerator$Status;->_responseLine:Lorg/eclipse/jetty/io/Buffer;

    .line 169
    .line 170
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :cond_2
    const/4 v0, 0x5

    .line 175
    new-array v0, v0, [B

    .line 176
    .line 177
    fill-array-data v0, :array_0

    .line 178
    .line 179
    .line 180
    sput-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->LAST_CHUNK:[B

    .line 181
    .line 182
    const-string v0, "Content-Length: 0\r\n"

    .line 183
    .line 184
    invoke-static {v0}, Lorg/eclipse/jetty/util/StringUtil;->getBytes(Ljava/lang/String;)[B

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    sput-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->CONTENT_LENGTH_0:[B

    .line 189
    .line 190
    const-string v0, "Connection: keep-alive\r\n"

    .line 191
    .line 192
    invoke-static {v0}, Lorg/eclipse/jetty/util/StringUtil;->getBytes(Ljava/lang/String;)[B

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    sput-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->CONNECTION_KEEP_ALIVE:[B

    .line 197
    .line 198
    const-string v0, "Connection: close\r\n"

    .line 199
    .line 200
    invoke-static {v0}, Lorg/eclipse/jetty/util/StringUtil;->getBytes(Ljava/lang/String;)[B

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    sput-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->CONNECTION_CLOSE:[B

    .line 205
    .line 206
    const-string v0, "Connection: "

    .line 207
    .line 208
    invoke-static {v0}, Lorg/eclipse/jetty/util/StringUtil;->getBytes(Ljava/lang/String;)[B

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    sput-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->CONNECTION_:[B

    .line 213
    .line 214
    const-string v0, "\r\n"

    .line 215
    .line 216
    invoke-static {v0}, Lorg/eclipse/jetty/util/StringUtil;->getBytes(Ljava/lang/String;)[B

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    sput-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->CRLF:[B

    .line 221
    .line 222
    const-string v0, "Transfer-Encoding: chunked\r\n"

    .line 223
    .line 224
    invoke-static {v0}, Lorg/eclipse/jetty/util/StringUtil;->getBytes(Ljava/lang/String;)[B

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    sput-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->TRANSFER_ENCODING_CHUNKED:[B

    .line 229
    .line 230
    const-string v0, "Server: Jetty(7.0.x)\r\n"

    .line 231
    .line 232
    invoke-static {v0}, Lorg/eclipse/jetty/util/StringUtil;->getBytes(Ljava/lang/String;)[B

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    sput-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->SERVER:[B

    .line 237
    .line 238
    return-void

    .line 239
    :array_0
    .array-data 1
        0x30t
        0xdt
        0xat
        0xdt
        0xat
    .end array-data
.end method

.method public constructor <init>(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jetty/http/AbstractGenerator;-><init>(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bypass:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needEOC:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 12
    .line 13
    return-void
.end method

.method private flushMask()I
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v0, v1

    .line 15
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-lez v2, :cond_1

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move v2, v1

    .line 28
    :goto_1
    or-int/2addr v0, v2

    .line 29
    iget-boolean v2, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bypass:Z

    .line 30
    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-lez p0, :cond_2

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    :cond_2
    or-int p0, v0, v1

    .line 45
    .line 46
    return p0
.end method

.method public static getReasonBuffer(I)Lorg/eclipse/jetty/io/Buffer;
    .locals 3

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->__status:[Lorg/eclipse/jetty/http/HttpGenerator$Status;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ge p0, v1, :cond_0

    .line 6
    .line 7
    aget-object p0, v0, p0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move-object p0, v2

    .line 11
    :goto_0
    if-eqz p0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpGenerator$Status;->_reason:Lorg/eclipse/jetty/io/Buffer;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_1
    return-object v2
.end method

.method private prepareBuffers()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_13

    .line 5
    .line 6
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bypass:Z

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 31
    .line 32
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 33
    .line 34
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 39
    .line 40
    invoke-interface {v2, v0}, Lorg/eclipse/jetty/io/Buffer;->skip(I)I

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 44
    .line 45
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    iput-object v1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 52
    .line 53
    :cond_0
    iget-wide v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 54
    .line 55
    const-wide/16 v4, -0x2

    .line 56
    .line 57
    cmp-long v0, v2, v4

    .line 58
    .line 59
    if-nez v0, :cond_13

    .line 60
    .line 61
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bypass:Z

    .line 62
    .line 63
    const-string v2, "EOC"

    .line 64
    .line 65
    const/4 v3, 0x1

    .line 66
    const/4 v4, 0x2

    .line 67
    const/4 v5, 0x0

    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_5

    .line 79
    .line 80
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 81
    .line 82
    if-eqz v0, :cond_5

    .line 83
    .line 84
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iput-boolean v3, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 89
    .line 90
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 91
    .line 92
    if-nez v6, :cond_2

    .line 93
    .line 94
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 95
    .line 96
    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffers;->getHeader()Lorg/eclipse/jetty/io/Buffer;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    iput-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 101
    .line 102
    :cond_2
    iget-boolean v6, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 103
    .line 104
    if-eqz v6, :cond_4

    .line 105
    .line 106
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 107
    .line 108
    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    if-gtz v6, :cond_3

    .line 113
    .line 114
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 115
    .line 116
    sget-object v6, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 117
    .line 118
    invoke-interface {v2, v6}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 119
    .line 120
    .line 121
    iput-boolean v5, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_3
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_4
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 129
    .line 130
    invoke-static {v2, v0}, Lorg/eclipse/jetty/io/BufferUtil;->putHexInt(Lorg/eclipse/jetty/io/Buffer;I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 134
    .line 135
    sget-object v2, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 136
    .line 137
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 138
    .line 139
    .line 140
    iput-boolean v3, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 141
    .line 142
    goto/16 :goto_3

    .line 143
    .line 144
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 145
    .line 146
    if-eqz v0, :cond_c

    .line 147
    .line 148
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-lez v0, :cond_c

    .line 153
    .line 154
    iput-boolean v3, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 155
    .line 156
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 157
    .line 158
    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 159
    .line 160
    .line 161
    move-result v6

    .line 162
    const/16 v7, 0xc

    .line 163
    .line 164
    if-ne v6, v7, :cond_6

    .line 165
    .line 166
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 167
    .line 168
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 169
    .line 170
    .line 171
    move-result v6

    .line 172
    sub-int/2addr v6, v4

    .line 173
    sget-object v7, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 174
    .line 175
    invoke-interface {v2, v6, v7, v5, v4}, Lorg/eclipse/jetty/io/Buffer;->poke(I[BII)I

    .line 176
    .line 177
    .line 178
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 179
    .line 180
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    sub-int/2addr v6, v4

    .line 185
    invoke-interface {v2, v6}, Lorg/eclipse/jetty/io/Buffer;->setGetIndex(I)V

    .line 186
    .line 187
    .line 188
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 189
    .line 190
    invoke-static {v2, v0}, Lorg/eclipse/jetty/io/BufferUtil;->prependHexInt(Lorg/eclipse/jetty/io/Buffer;I)V

    .line 191
    .line 192
    .line 193
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 194
    .line 195
    if-eqz v0, :cond_a

    .line 196
    .line 197
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 198
    .line 199
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    sub-int/2addr v2, v4

    .line 204
    invoke-interface {v0, v2, v7, v5, v4}, Lorg/eclipse/jetty/io/Buffer;->poke(I[BII)I

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 208
    .line 209
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    sub-int/2addr v2, v4

    .line 214
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->setGetIndex(I)V

    .line 215
    .line 216
    .line 217
    iput-boolean v5, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 218
    .line 219
    goto :goto_2

    .line 220
    :cond_6
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 221
    .line 222
    if-nez v6, :cond_7

    .line 223
    .line 224
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 225
    .line 226
    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffers;->getHeader()Lorg/eclipse/jetty/io/Buffer;

    .line 227
    .line 228
    .line 229
    move-result-object v6

    .line 230
    iput-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 231
    .line 232
    :cond_7
    iget-boolean v6, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 233
    .line 234
    if-eqz v6, :cond_9

    .line 235
    .line 236
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 237
    .line 238
    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 239
    .line 240
    .line 241
    move-result v6

    .line 242
    if-gtz v6, :cond_8

    .line 243
    .line 244
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 245
    .line 246
    sget-object v6, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 247
    .line 248
    invoke-interface {v2, v6}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 249
    .line 250
    .line 251
    iput-boolean v5, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 252
    .line 253
    goto :goto_1

    .line 254
    :cond_8
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    return-void

    .line 258
    :cond_9
    :goto_1
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 259
    .line 260
    invoke-static {v2, v0}, Lorg/eclipse/jetty/io/BufferUtil;->putHexInt(Lorg/eclipse/jetty/io/Buffer;I)V

    .line 261
    .line 262
    .line 263
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 264
    .line 265
    sget-object v2, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 266
    .line 267
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 268
    .line 269
    .line 270
    :cond_a
    :goto_2
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 271
    .line 272
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    if-lt v0, v4, :cond_b

    .line 277
    .line 278
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 279
    .line 280
    sget-object v2, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 281
    .line 282
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 283
    .line 284
    .line 285
    goto :goto_3

    .line 286
    :cond_b
    iput-boolean v3, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 287
    .line 288
    :cond_c
    :goto_3
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needEOC:Z

    .line 289
    .line 290
    if-eqz v0, :cond_13

    .line 291
    .line 292
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 293
    .line 294
    if-eqz v0, :cond_d

    .line 295
    .line 296
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    if-nez v0, :cond_13

    .line 301
    .line 302
    :cond_d
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 303
    .line 304
    if-eqz v0, :cond_f

    .line 305
    .line 306
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 307
    .line 308
    if-nez v0, :cond_e

    .line 309
    .line 310
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 311
    .line 312
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    if-lt v0, v4, :cond_e

    .line 317
    .line 318
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 319
    .line 320
    sget-object v2, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 321
    .line 322
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 323
    .line 324
    .line 325
    iput-boolean v5, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 326
    .line 327
    goto :goto_4

    .line 328
    :cond_e
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 329
    .line 330
    if-eqz v0, :cond_f

    .line 331
    .line 332
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    if-lt v0, v4, :cond_f

    .line 337
    .line 338
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 339
    .line 340
    sget-object v2, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 341
    .line 342
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 343
    .line 344
    .line 345
    iput-boolean v5, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 346
    .line 347
    :cond_f
    :goto_4
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 348
    .line 349
    if-nez v0, :cond_13

    .line 350
    .line 351
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needEOC:Z

    .line 352
    .line 353
    if-eqz v0, :cond_13

    .line 354
    .line 355
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 356
    .line 357
    if-nez v0, :cond_11

    .line 358
    .line 359
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 360
    .line 361
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 362
    .line 363
    .line 364
    move-result v0

    .line 365
    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->LAST_CHUNK:[B

    .line 366
    .line 367
    array-length v4, v2

    .line 368
    if-lt v0, v4, :cond_11

    .line 369
    .line 370
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_head:Z

    .line 371
    .line 372
    if-nez v0, :cond_10

    .line 373
    .line 374
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 375
    .line 376
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 377
    .line 378
    .line 379
    iput-boolean v3, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 380
    .line 381
    :cond_10
    iput-boolean v5, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needEOC:Z

    .line 382
    .line 383
    goto :goto_5

    .line 384
    :cond_11
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 385
    .line 386
    if-eqz v0, :cond_13

    .line 387
    .line 388
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 389
    .line 390
    .line 391
    move-result v0

    .line 392
    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->LAST_CHUNK:[B

    .line 393
    .line 394
    array-length v4, v2

    .line 395
    if-lt v0, v4, :cond_13

    .line 396
    .line 397
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_head:Z

    .line 398
    .line 399
    if-nez v0, :cond_12

    .line 400
    .line 401
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 402
    .line 403
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 404
    .line 405
    .line 406
    iput-boolean v3, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 407
    .line 408
    :cond_12
    iput-boolean v5, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needEOC:Z

    .line 409
    .line 410
    :cond_13
    :goto_5
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 411
    .line 412
    if-eqz v0, :cond_14

    .line 413
    .line 414
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 415
    .line 416
    .line 417
    move-result v0

    .line 418
    if-nez v0, :cond_14

    .line 419
    .line 420
    iput-object v1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 421
    .line 422
    :cond_14
    return-void
.end method

.method public static setServerVersion(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Server: Jetty("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, ")\r\n"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Lorg/eclipse/jetty/util/StringUtil;->getBytes(Ljava/lang/String;)[B

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sput-object p0, Lorg/eclipse/jetty/http/HttpGenerator;->SERVER:[B

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public addContent(Lorg/eclipse/jetty/io/Buffer;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_noContent:Z

    .line 2
    .line 3
    if-nez v0, :cond_d

    .line 4
    .line 5
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_last:Z

    .line 6
    .line 7
    if-nez v0, :cond_c

    .line 8
    .line 9
    iget v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_2

    .line 15
    .line 16
    :cond_0
    iput-boolean p2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_last:Z

    .line 17
    .line 18
    iget-object p2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-gtz p2, :cond_2

    .line 27
    .line 28
    :cond_1
    iget-boolean p2, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 29
    .line 30
    if-eqz p2, :cond_5

    .line 31
    .line 32
    :cond_2
    iget-object p2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 33
    .line 34
    invoke-interface {p2}, Lorg/eclipse/jetty/io/EndPoint;->isOutputShutdown()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-nez p2, :cond_4

    .line 39
    .line 40
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpGenerator;->flushBuffer()I

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 44
    .line 45
    if-eqz p2, :cond_5

    .line 46
    .line 47
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-lez p2, :cond_5

    .line 52
    .line 53
    iget-boolean p2, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 54
    .line 55
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 56
    .line 57
    if-eqz p2, :cond_3

    .line 58
    .line 59
    iget-object p2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 60
    .line 61
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    add-int/lit8 p2, p2, 0xc

    .line 66
    .line 67
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr p2, v1

    .line 72
    invoke-interface {v0, p2}, Lorg/eclipse/jetty/io/Buffers;->getBuffer(I)Lorg/eclipse/jetty/io/Buffer;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 77
    .line 78
    invoke-interface {p2, v0}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 79
    .line 80
    .line 81
    sget-object v0, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 82
    .line 83
    invoke-interface {p2, v0}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 84
    .line 85
    .line 86
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    invoke-static {p2, v1}, Lorg/eclipse/jetty/io/BufferUtil;->putHexInt(Lorg/eclipse/jetty/io/Buffer;I)V

    .line 91
    .line 92
    .line 93
    invoke-interface {p2, v0}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 94
    .line 95
    .line 96
    invoke-interface {p2, p1}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 97
    .line 98
    .line 99
    :goto_0
    move-object p1, p2

    .line 100
    goto :goto_1

    .line 101
    :cond_3
    iget-object p2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 102
    .line 103
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr p2, v1

    .line 112
    invoke-interface {v0, p2}, Lorg/eclipse/jetty/io/Buffers;->getBuffer(I)Lorg/eclipse/jetty/io/Buffer;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 117
    .line 118
    invoke-interface {p2, v0}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 119
    .line 120
    .line 121
    invoke-interface {p2, p1}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_4
    new-instance p0, Lorg/eclipse/jetty/io/EofException;

    .line 126
    .line 127
    invoke-direct {p0}, Lorg/eclipse/jetty/io/EofException;-><init>()V

    .line 128
    .line 129
    .line 130
    throw p0

    .line 131
    :cond_5
    :goto_1
    iput-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 132
    .line 133
    iget-wide v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentWritten:J

    .line 134
    .line 135
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    int-to-long v2, p2

    .line 140
    add-long/2addr v0, v2

    .line 141
    iput-wide v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentWritten:J

    .line 142
    .line 143
    iget-boolean p2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_head:Z

    .line 144
    .line 145
    const/4 v0, 0x0

    .line 146
    if-eqz p2, :cond_6

    .line 147
    .line 148
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 149
    .line 150
    .line 151
    iput-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 152
    .line 153
    return-void

    .line 154
    :cond_6
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 155
    .line 156
    if-eqz p1, :cond_9

    .line 157
    .line 158
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 159
    .line 160
    if-eqz p1, :cond_7

    .line 161
    .line 162
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-nez p1, :cond_9

    .line 167
    .line 168
    :cond_7
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 169
    .line 170
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-lez p1, :cond_9

    .line 175
    .line 176
    iget-boolean p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_last:Z

    .line 177
    .line 178
    if-nez p1, :cond_8

    .line 179
    .line 180
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/AbstractGenerator;->isCommitted()Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-eqz p1, :cond_9

    .line 185
    .line 186
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 187
    .line 188
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    const/16 p2, 0x400

    .line 193
    .line 194
    if-le p1, p2, :cond_9

    .line 195
    .line 196
    :cond_8
    const/4 p1, 0x1

    .line 197
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bypass:Z

    .line 198
    .line 199
    return-void

    .line 200
    :cond_9
    iget-boolean p1, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 201
    .line 202
    if-nez p1, :cond_b

    .line 203
    .line 204
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 205
    .line 206
    if-nez p1, :cond_a

    .line 207
    .line 208
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 209
    .line 210
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffers;->getBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    iput-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 215
    .line 216
    :cond_a
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 217
    .line 218
    iget-object p2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 219
    .line 220
    invoke-interface {p1, p2}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    iget-object p2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 225
    .line 226
    invoke-interface {p2, p1}, Lorg/eclipse/jetty/io/Buffer;->skip(I)I

    .line 227
    .line 228
    .line 229
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 230
    .line 231
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    if-nez p1, :cond_b

    .line 236
    .line 237
    iput-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 238
    .line 239
    :cond_b
    return-void

    .line 240
    :cond_c
    :goto_2
    sget-object p0, Lorg/eclipse/jetty/http/HttpGenerator;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 241
    .line 242
    const-string p2, "Ignoring extra content {}"

    .line 243
    .line 244
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-interface {p0, p2, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 252
    .line 253
    .line 254
    return-void

    .line 255
    :cond_d
    const-string p0, "NO CONTENT"

    .line 256
    .line 257
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    return-void
.end method

.method public complete()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-super {p0}, Lorg/eclipse/jetty/http/AbstractGenerator;->complete()V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 11
    .line 12
    const/4 v1, 0x3

    .line 13
    if-ge v0, v1, :cond_1

    .line 14
    .line 15
    iput v1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 16
    .line 17
    iget-wide v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 18
    .line 19
    const-wide/16 v2, -0x2

    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needEOC:Z

    .line 27
    .line 28
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpGenerator;->flushBuffer()I

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public completeHeader(Lorg/eclipse/jetty/http/HttpFields;Z)V
    .locals 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 1
    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    if-eqz v2, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    if-eqz v2, :cond_1

    goto :goto_0

    .line 3
    :cond_1
    new-instance v0, Lorg/eclipse/jetty/io/EofException;

    invoke-direct {v0}, Lorg/eclipse/jetty/io/EofException;-><init>()V

    throw v0

    .line 4
    :cond_2
    :goto_0
    iget-boolean v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_last:Z

    if-eqz v2, :cond_4

    if-eqz p2, :cond_3

    goto :goto_1

    .line 5
    :cond_3
    const-string v0, "last?"

    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-void

    :cond_4
    :goto_1
    or-int v2, v2, p2

    .line 6
    iput-boolean v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_last:Z

    .line 7
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    if-nez v2, :cond_5

    .line 8
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffers;->getHeader()Lorg/eclipse/jetty/io/Buffer;

    move-result-object v2

    iput-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 9
    :cond_5
    :try_start_0
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isRequest()Z

    move-result v2

    const/16 v3, 0x9

    const/16 v5, 0xcc

    const/16 v6, 0xc8

    const-wide/16 v7, 0x0

    const/4 v9, 0x2

    const-wide/16 v10, -0x1

    const/4 v13, 0x0

    const/16 v14, 0x20

    const/16 v15, 0xa

    const/16 v16, 0x0

    const/16 p2, 0x30

    const/4 v12, 0x1

    if-eqz v2, :cond_8

    .line 10
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    .line 11
    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_version:I
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v4, "UTF-8"

    if-ne v2, v3, :cond_6

    .line 12
    :try_start_1
    iput-wide v7, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 13
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_method:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 14
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0, v14}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 15
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_uri:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 16
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    const/4 v0, 0x3

    .line 17
    iput v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 18
    iput-boolean v12, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_noContent:Z

    return-void

    :catch_0
    move-exception v0

    goto/16 :goto_19

    .line 19
    :cond_6
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget-object v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_method:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 20
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v14}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 21
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget-object v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_uri:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 22
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v14}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 23
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_version:I

    if-ne v3, v15, :cond_7

    sget-object v3, Lorg/eclipse/jetty/http/HttpVersions;->HTTP_1_0_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    goto :goto_2

    :cond_7
    sget-object v3, Lorg/eclipse/jetty/http/HttpVersions;->HTTP_1_1_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    :goto_2
    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 24
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v3, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    move-wide/from16 v17, v7

    goto/16 :goto_7

    .line 25
    :cond_8
    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_version:I

    if-ne v2, v3, :cond_9

    .line 26
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    .line 27
    iput-wide v10, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 28
    iput v9, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    return-void

    .line 29
    :cond_9
    iget-object v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    if-nez v3, :cond_b

    if-le v2, v15, :cond_a

    move v2, v12

    goto :goto_3

    :cond_a
    move/from16 v2, v16

    .line 30
    :goto_3
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    .line 31
    :cond_b
    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    sget-object v3, Lorg/eclipse/jetty/http/HttpGenerator;->__status:[Lorg/eclipse/jetty/http/HttpGenerator$Status;

    array-length v4, v3

    if-ge v2, v4, :cond_c

    aget-object v2, v3, v2

    goto :goto_4

    :cond_c
    move-object v2, v13

    :goto_4
    const/16 v3, 0x64

    if-nez v2, :cond_e

    .line 32
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v4, Lorg/eclipse/jetty/http/HttpVersions;->HTTP_1_1_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 33
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v14}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 34
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget v4, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    div-int/2addr v4, v3

    add-int/lit8 v4, v4, 0x30

    int-to-byte v4, v4

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 35
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget v4, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    rem-int/2addr v4, v3

    div-int/2addr v4, v15

    add-int/lit8 v4, v4, 0x30

    int-to-byte v4, v4

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 36
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget v4, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    rem-int/2addr v4, v15

    add-int/lit8 v4, v4, 0x30

    int-to-byte v4, v4

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 37
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v14}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 38
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_reason:Lorg/eclipse/jetty/io/Buffer;
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    .line 39
    iget-object v4, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    if-nez v2, :cond_d

    .line 40
    :try_start_2
    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    div-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x30

    int-to-byte v2, v2

    invoke-interface {v4, v2}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 41
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget v4, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    rem-int/2addr v4, v3

    div-int/2addr v4, v15

    add-int/lit8 v4, v4, 0x30

    int-to-byte v4, v4

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 42
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget v4, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    rem-int/2addr v4, v15

    add-int/lit8 v4, v4, 0x30

    int-to-byte v4, v4

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    goto :goto_5

    .line 43
    :cond_d
    invoke-interface {v4, v2}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 44
    :goto_5
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v4, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    move-wide/from16 v17, v7

    goto :goto_6

    .line 45
    :cond_e
    iget-object v4, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_reason:Lorg/eclipse/jetty/io/Buffer;
    :try_end_2
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_0

    move-wide/from16 v17, v7

    .line 46
    iget-object v7, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    if-nez v4, :cond_f

    .line 47
    :try_start_3
    iget-object v2, v2, Lorg/eclipse/jetty/http/HttpGenerator$Status;->_responseLine:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v7, v2}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    goto :goto_6

    .line 48
    :cond_f
    iget-object v2, v2, Lorg/eclipse/jetty/http/HttpGenerator$Status;->_schemeCode:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v7, v2}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 49
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget-object v4, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_reason:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 50
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v4, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 51
    :goto_6
    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    if-ge v2, v6, :cond_11

    if-lt v2, v3, :cond_11

    .line 52
    iput-boolean v12, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_noContent:Z

    .line 53
    iput-object v13, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 54
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    if-eqz v2, :cond_10

    .line 55
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 56
    :cond_10
    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    const/16 v3, 0x65

    if-eq v2, v3, :cond_13

    .line 57
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 58
    iput v9, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    return-void

    :cond_11
    if-eq v2, v5, :cond_12

    const/16 v3, 0x130

    if-ne v2, v3, :cond_13

    .line 59
    :cond_12
    iput-boolean v12, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_noContent:Z

    .line 60
    iput-object v13, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 61
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    if-eqz v2, :cond_13

    .line 62
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 63
    :cond_13
    :goto_7
    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    const/16 v3, 0x3a

    if-lt v2, v6, :cond_14

    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_date:Lorg/eclipse/jetty/io/Buffer;

    if-eqz v2, :cond_14

    .line 64
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v4, Lorg/eclipse/jetty/http/HttpHeaders;->DATE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 65
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 66
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v14}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 67
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget-object v4, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_date:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 68
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v4, Lorg/eclipse/jetty/http/HttpGenerator;->CRLF:[B

    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    :cond_14
    const/4 v2, -0x1

    const/16 v4, 0xb

    if-eqz v0, :cond_35

    .line 69
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpFields;->size()I

    move-result v8

    move-object v9, v13

    move-object/from16 v20, v9

    move-object/from16 v23, v20

    move/from16 v13, v16

    move/from16 v22, v13

    move/from16 v24, v22

    move/from16 v25, v24

    move/from16 v26, v25

    :goto_8
    if-ge v13, v8, :cond_34

    .line 70
    invoke-virtual {v0, v13}, Lorg/eclipse/jetty/http/HttpFields;->getField(I)Lorg/eclipse/jetty/http/HttpFields$Field;

    move-result-object v14

    if-nez v14, :cond_15

    move/from16 v6, p2

    goto/16 :goto_11

    .line 71
    :cond_15
    invoke-virtual {v14}, Lorg/eclipse/jetty/http/HttpFields$Field;->getNameOrdinal()I

    move-result v3

    const/4 v5, 0x5

    if-eq v3, v12, :cond_1f

    if-eq v3, v5, :cond_1d

    const/16 v5, 0xc

    if-eq v3, v5, :cond_1a

    const/16 v5, 0x10

    if-eq v3, v5, :cond_18

    move/from16 v5, p2

    if-eq v3, v5, :cond_17

    .line 72
    iget-object v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual {v14, v3}, Lorg/eclipse/jetty/http/HttpFields$Field;->putTo(Lorg/eclipse/jetty/io/Buffer;)V

    :cond_16
    move v6, v5

    goto/16 :goto_11

    .line 73
    :cond_17
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/AbstractGenerator;->getSendServerVersion()Z

    move-result v3

    if-eqz v3, :cond_16

    .line 74
    iget-object v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual {v14, v3}, Lorg/eclipse/jetty/http/HttpFields$Field;->putTo(Lorg/eclipse/jetty/io/Buffer;)V

    move/from16 v26, v12

    goto/16 :goto_11

    :cond_18
    move/from16 v5, p2

    .line 75
    sget-object v3, Lorg/eclipse/jetty/http/MimeTypes;->MULTIPART_BYTERANGES_BUFFER:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    invoke-virtual {v14}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValueBuffer()Lorg/eclipse/jetty/io/Buffer;

    move-result-object v5

    invoke-static {v3, v5}, Lorg/eclipse/jetty/io/BufferUtil;->isPrefix(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)Z

    move-result v3

    if-eqz v3, :cond_19

    const-wide/16 v10, -0x4

    iput-wide v10, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 76
    :cond_19
    iget-object v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual {v14, v3}, Lorg/eclipse/jetty/http/HttpFields$Field;->putTo(Lorg/eclipse/jetty/io/Buffer;)V

    move/from16 v22, v12

    goto/16 :goto_11

    .line 77
    :cond_1a
    invoke-virtual {v14}, Lorg/eclipse/jetty/http/HttpFields$Field;->getLongValue()J

    move-result-wide v10

    iput-wide v10, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 78
    iget-wide v6, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentWritten:J

    cmp-long v5, v10, v6

    if-ltz v5, :cond_1c

    iget-boolean v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_last:Z

    if-eqz v5, :cond_1b

    cmp-long v5, v10, v6

    if-eqz v5, :cond_1b

    goto :goto_9

    :cond_1b
    move-object/from16 v20, v14

    goto :goto_a

    :cond_1c
    :goto_9
    const/16 v20, 0x0

    .line 79
    :goto_a
    iget-object v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual {v14, v5}, Lorg/eclipse/jetty/http/HttpFields$Field;->putTo(Lorg/eclipse/jetty/io/Buffer;)V

    goto/16 :goto_11

    .line 80
    :cond_1d
    iget v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_version:I

    if-ne v5, v4, :cond_1e

    move-object/from16 v23, v14

    goto/16 :goto_11

    :cond_1e
    const/16 v6, 0x30

    goto/16 :goto_11

    :cond_1f
    move/from16 v6, p2

    .line 81
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isRequest()Z

    move-result v7

    if-eqz v7, :cond_20

    .line 82
    iget-object v7, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual {v14, v7}, Lorg/eclipse/jetty/http/HttpFields$Field;->putTo(Lorg/eclipse/jetty/io/Buffer;)V

    .line 83
    :cond_20
    invoke-virtual {v14}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValueOrdinal()I

    move-result v7

    const-wide/16 v10, -0x3

    if-eq v7, v2, :cond_28

    if-eq v7, v12, :cond_25

    if-eq v7, v5, :cond_23

    if-eq v7, v4, :cond_22

    if-nez v9, :cond_21

    .line 84
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object v9, v5

    goto :goto_b

    :cond_21
    const/16 v5, 0x2c

    .line 85
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    :goto_b
    invoke-virtual {v14}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_11

    .line 87
    :cond_22
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v5

    if-eqz v5, :cond_25

    .line 88
    iget-object v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual {v14, v5}, Lorg/eclipse/jetty/http/HttpFields$Field;->putTo(Lorg/eclipse/jetty/io/Buffer;)V

    goto/16 :goto_11

    .line 89
    :cond_23
    iget v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_version:I

    if-ne v5, v15, :cond_33

    .line 90
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v5

    if-eqz v5, :cond_24

    .line 91
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    :cond_24
    move/from16 v24, v12

    goto/16 :goto_11

    .line 92
    :cond_25
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v5

    if-eqz v5, :cond_26

    .line 93
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    .line 94
    :cond_26
    iget-object v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_27

    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v5

    if-eqz v5, :cond_27

    iget-wide v6, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    cmp-long v5, v6, v10

    if-nez v5, :cond_27

    const-wide/16 v5, -0x1

    .line 95
    iput-wide v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    :cond_27
    move/from16 v25, v12

    goto/16 :goto_11

    .line 96
    :cond_28
    invoke-virtual {v14}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValue()Ljava/lang/String;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    move/from16 v7, v16

    :goto_c
    if-eqz v6, :cond_33

    .line 97
    array-length v14, v6

    if-ge v7, v14, :cond_33

    .line 98
    sget-object v14, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    aget-object v29, v6, v7

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v14, v3}, Lorg/eclipse/jetty/io/BufferCache;->get(Ljava/lang/String;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    move-result-object v3

    if-eqz v3, :cond_31

    .line 99
    invoke-virtual {v3}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->getOrdinal()I

    move-result v3

    if-eq v3, v12, :cond_2d

    if-eq v3, v5, :cond_2b

    if-nez v9, :cond_29

    .line 100
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_d

    :cond_29
    const/16 v3, 0x2c

    .line 101
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 102
    :goto_d
    aget-object v3, v6, v7

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2a
    move-object v14, v6

    goto :goto_10

    .line 103
    :cond_2b
    iget v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_version:I

    if-ne v3, v15, :cond_2a

    .line 104
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 105
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    :cond_2c
    move-object v14, v6

    move/from16 v24, v12

    goto :goto_10

    .line 106
    :cond_2d
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 107
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    .line 108
    :cond_2e
    iget-object v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_2f

    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v3

    if-eqz v3, :cond_2f

    move-object v14, v6

    iget-wide v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    cmp-long v5, v5, v10

    if-nez v5, :cond_30

    const-wide/16 v5, -0x1

    .line 109
    iput-wide v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    goto :goto_e

    :cond_2f
    move-object v14, v6

    :cond_30
    :goto_e
    move/from16 v25, v12

    move/from16 v24, v16

    goto :goto_10

    :cond_31
    move-object v14, v6

    if-nez v9, :cond_32

    .line 110
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_f

    :cond_32
    const/16 v5, 0x2c

    .line 111
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 112
    :goto_f
    aget-object v5, v14, v7

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_10
    add-int/lit8 v7, v7, 0x1

    move-object v6, v14

    const/4 v5, 0x5

    goto/16 :goto_c

    :cond_33
    :goto_11
    add-int/lit8 v13, v13, 0x1

    const/16 p2, 0x30

    const/16 v3, 0x3a

    const/16 v5, 0xcc

    const/16 v6, 0xc8

    const-wide/16 v10, -0x1

    const/16 v14, 0x20

    goto/16 :goto_8

    :cond_34
    move-object/from16 v19, v9

    move-object/from16 v13, v20

    move-object/from16 v0, v23

    goto :goto_12

    :cond_35
    move/from16 v22, v16

    move/from16 v24, v22

    move/from16 v25, v24

    move/from16 v26, v25

    const/4 v0, 0x0

    const/4 v13, 0x0

    const/16 v19, 0x0

    .line 113
    :goto_12
    iget-wide v5, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    long-to-int v3, v5

    const/4 v5, -0x3

    const-wide/16 v6, -0x2

    if-eq v3, v5, :cond_38

    if-eq v3, v2, :cond_37

    if-eqz v3, :cond_36

    goto/16 :goto_15

    :cond_36
    if-nez v13, :cond_3f

    .line 114
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v2

    if-eqz v2, :cond_3f

    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    const/16 v3, 0xc8

    if-lt v2, v3, :cond_3f

    const/16 v3, 0xcc

    if-eq v2, v3, :cond_3f

    const/16 v3, 0x130

    if-eq v2, v3, :cond_3f

    .line 115
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v3, Lorg/eclipse/jetty/http/HttpGenerator;->CONTENT_LENGTH_0:[B

    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    goto/16 :goto_15

    .line 116
    :cond_37
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isRequest()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    goto/16 :goto_15

    .line 117
    :cond_38
    iget-wide v8, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentWritten:J

    cmp-long v2, v8, v17

    if-nez v2, :cond_3a

    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v2

    if-eqz v2, :cond_3a

    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    const/16 v3, 0xc8

    if-lt v2, v3, :cond_39

    const/16 v3, 0xcc

    if-eq v2, v3, :cond_39

    const/16 v3, 0x130

    if-ne v2, v3, :cond_3a

    :cond_39
    move-wide/from16 v2, v17

    .line 118
    iput-wide v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    goto :goto_15

    .line 119
    :cond_3a
    iget-boolean v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_last:Z

    if-eqz v2, :cond_3c

    .line 120
    iget-wide v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentWritten:J

    iput-wide v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    if-nez v13, :cond_3f

    .line 121
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v2

    if-nez v2, :cond_3b

    iget-wide v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    const-wide/16 v17, 0x0

    cmp-long v2, v2, v17

    if-gtz v2, :cond_3b

    if-eqz v22, :cond_3f

    :cond_3b
    iget-boolean v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_noContent:Z

    if-nez v2, :cond_3f

    .line 122
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v3, Lorg/eclipse/jetty/http/HttpHeaders;->CONTENT_LENGTH_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 123
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    const/16 v3, 0x3a

    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 124
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 125
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    iget-wide v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    invoke-static {v2, v3, v4}, Lorg/eclipse/jetty/io/BufferUtil;->putDecLong(Lorg/eclipse/jetty/io/Buffer;J)V

    .line 126
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v3, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    goto :goto_15

    .line 127
    :cond_3c
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_3e

    iget v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_version:I

    if-ge v2, v4, :cond_3d

    goto :goto_13

    :cond_3d
    move-wide v2, v6

    goto :goto_14

    :cond_3e
    :goto_13
    const-wide/16 v2, -0x1

    :goto_14
    iput-wide v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 128
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isRequest()Z

    move-result v2

    if-eqz v2, :cond_3f

    iget-wide v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    const-wide/16 v27, -0x1

    cmp-long v2, v2, v27

    if-nez v2, :cond_3f

    const-wide/16 v2, 0x0

    .line 129
    iput-wide v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 130
    iput-boolean v12, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_noContent:Z

    .line 131
    :cond_3f
    :goto_15
    iget-wide v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    cmp-long v2, v2, v6

    if-nez v2, :cond_42

    if-eqz v0, :cond_41

    .line 132
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValueOrdinal()I

    move-result v2

    const/4 v3, 0x2

    if-eq v3, v2, :cond_41

    .line 133
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpFields$Field;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 134
    const-string v3, "chunked"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 135
    iget-object v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/http/HttpFields$Field;->putTo(Lorg/eclipse/jetty/io/Buffer;)V

    goto :goto_16

    .line 136
    :cond_40
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "BAD TE"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :cond_41
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->TRANSFER_ENCODING_CHUNKED:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 138
    :cond_42
    :goto_16
    iget-wide v2, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    const-wide/16 v27, -0x1

    cmp-long v0, v2, v27

    if-nez v0, :cond_43

    .line 139
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    goto :goto_17

    :cond_43
    move/from16 v16, v24

    .line 140
    :goto_17
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpGenerator;->isResponse()Z

    move-result v0

    if-eqz v0, :cond_47

    .line 141
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_45

    if-nez v25, :cond_44

    iget v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_version:I

    if-le v0, v15, :cond_45

    .line 142
    :cond_44
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->CONNECTION_CLOSE:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    if-eqz v19, :cond_47

    .line 143
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    move-result v2

    const/16 v21, 0x2

    add-int/lit8 v2, v2, -0x2

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->setPutIndex(I)V

    .line 144
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    const/16 v5, 0x2c

    invoke-interface {v0, v5}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 145
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 146
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->CRLF:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    goto :goto_18

    :cond_45
    if-eqz v16, :cond_46

    .line 147
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->CONNECTION_KEEP_ALIVE:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    if-eqz v19, :cond_47

    .line 148
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    move-result v2

    const/16 v21, 0x2

    add-int/lit8 v2, v2, -0x2

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->setPutIndex(I)V

    .line 149
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    const/16 v5, 0x2c

    invoke-interface {v0, v5}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 150
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 151
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->CRLF:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    goto :goto_18

    :cond_46
    if-eqz v19, :cond_47

    .line 152
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->CONNECTION_:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 153
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 154
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->CRLF:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    :cond_47
    :goto_18
    if-nez v26, :cond_48

    .line 155
    iget v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    const/16 v2, 0xc7

    if-le v0, v2, :cond_48

    invoke-virtual {v1}, Lorg/eclipse/jetty/http/AbstractGenerator;->getSendServerVersion()Z

    move-result v0

    if-eqz v0, :cond_48

    .line 156
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->SERVER:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 157
    :cond_48
    iget-object v0, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    sget-object v2, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    const/4 v3, 0x2

    .line 158
    iput v3, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I
    :try_end_3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_0

    return-void

    .line 159
    :goto_19
    new-instance v2, Ljava/lang/RuntimeException;

    iget-object v1, v1, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v1}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    move-result v1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Header>"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public flushBuffer()I
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 2
    .line 3
    if-eqz v0, :cond_c

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/eclipse/jetty/http/HttpGenerator;->prepareBuffers()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v2, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 22
    .line 23
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needEOC:Z

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-boolean v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_head:Z

    .line 35
    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    sget-object v2, Lorg/eclipse/jetty/http/HttpGenerator;->LAST_CHUNK:[B

    .line 39
    .line 40
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 41
    .line 42
    .line 43
    :cond_1
    iput-boolean v1, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 44
    .line 45
    iput-boolean v1, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needEOC:Z

    .line 46
    .line 47
    return v1

    .line 48
    :cond_2
    invoke-direct {p0}, Lorg/eclipse/jetty/http/HttpGenerator;->flushMask()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/4 v2, -0x1

    .line 53
    move v3, v1

    .line 54
    :goto_0
    const/4 v4, 0x0

    .line 55
    packed-switch v0, :pswitch_data_0

    .line 56
    .line 57
    .line 58
    goto/16 :goto_2

    .line 59
    .line 60
    :pswitch_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 61
    .line 62
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 63
    .line 64
    .line 65
    throw p0

    .line 66
    :pswitch_1
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 67
    .line 68
    iget-object v5, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 69
    .line 70
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 71
    .line 72
    invoke-interface {v2, v5, v6, v4}, Lorg/eclipse/jetty/io/EndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    goto/16 :goto_2

    .line 77
    .line 78
    :pswitch_2
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 79
    .line 80
    iget-object v5, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 81
    .line 82
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 83
    .line 84
    invoke-interface {v2, v5, v6, v4}, Lorg/eclipse/jetty/io/EndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    goto/16 :goto_2

    .line 89
    .line 90
    :pswitch_3
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 91
    .line 92
    iget-object v4, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 93
    .line 94
    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/EndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    goto/16 :goto_2

    .line 99
    .line 100
    :pswitch_4
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 101
    .line 102
    iget-object v5, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 103
    .line 104
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 105
    .line 106
    invoke-interface {v2, v5, v6, v4}, Lorg/eclipse/jetty/io/EndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    goto/16 :goto_2

    .line 111
    .line 112
    :pswitch_5
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 113
    .line 114
    iget-object v4, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 115
    .line 116
    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/EndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    goto/16 :goto_2

    .line 121
    .line 122
    :pswitch_6
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 123
    .line 124
    iget-object v4, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 125
    .line 126
    invoke-interface {v2, v4}, Lorg/eclipse/jetty/io/EndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    goto/16 :goto_2

    .line 131
    .line 132
    :pswitch_7
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 133
    .line 134
    if-eqz v2, :cond_3

    .line 135
    .line 136
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 137
    .line 138
    .line 139
    :cond_3
    iput-boolean v1, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bypass:Z

    .line 140
    .line 141
    iput-boolean v1, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 142
    .line 143
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 144
    .line 145
    const/4 v5, 0x3

    .line 146
    if-eqz v2, :cond_4

    .line 147
    .line 148
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 149
    .line 150
    .line 151
    iget-wide v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 152
    .line 153
    const-wide/16 v8, -0x2

    .line 154
    .line 155
    cmp-long v2, v6, v8

    .line 156
    .line 157
    if-nez v2, :cond_4

    .line 158
    .line 159
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 160
    .line 161
    const/16 v6, 0xc

    .line 162
    .line 163
    invoke-interface {v2, v6}, Lorg/eclipse/jetty/io/Buffer;->setPutIndex(I)V

    .line 164
    .line 165
    .line 166
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 167
    .line 168
    invoke-interface {v2, v6}, Lorg/eclipse/jetty/io/Buffer;->setGetIndex(I)V

    .line 169
    .line 170
    .line 171
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 172
    .line 173
    if-eqz v2, :cond_4

    .line 174
    .line 175
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 180
    .line 181
    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    if-ge v2, v6, :cond_4

    .line 186
    .line 187
    iget v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 188
    .line 189
    if-eq v2, v5, :cond_4

    .line 190
    .line 191
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 192
    .line 193
    iget-object v6, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 194
    .line 195
    invoke-interface {v2, v6}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 196
    .line 197
    .line 198
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 199
    .line 200
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 201
    .line 202
    .line 203
    iput-object v4, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 204
    .line 205
    :cond_4
    iget-boolean v2, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 206
    .line 207
    if-nez v2, :cond_7

    .line 208
    .line 209
    iget-boolean v2, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needEOC:Z

    .line 210
    .line 211
    if-nez v2, :cond_7

    .line 212
    .line 213
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 214
    .line 215
    if-eqz v2, :cond_5

    .line 216
    .line 217
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    if-nez v2, :cond_7

    .line 222
    .line 223
    :cond_5
    iget v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 224
    .line 225
    const/4 v4, 0x4

    .line 226
    if-ne v2, v5, :cond_6

    .line 227
    .line 228
    iput v4, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 229
    .line 230
    :cond_6
    iget v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 231
    .line 232
    if-ne v2, v4, :cond_8

    .line 233
    .line 234
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    .line 235
    .line 236
    if-eqz v2, :cond_8

    .line 237
    .line 238
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    if-nez v2, :cond_8

    .line 243
    .line 244
    iget v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_status:I

    .line 245
    .line 246
    const/16 v4, 0x64

    .line 247
    .line 248
    if-eq v2, v4, :cond_8

    .line 249
    .line 250
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_method:Lorg/eclipse/jetty/io/Buffer;

    .line 251
    .line 252
    if-nez v2, :cond_8

    .line 253
    .line 254
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 255
    .line 256
    invoke-interface {v2}, Lorg/eclipse/jetty/io/EndPoint;->shutdownOutput()V

    .line 257
    .line 258
    .line 259
    goto :goto_1

    .line 260
    :cond_7
    invoke-direct {p0}, Lorg/eclipse/jetty/http/HttpGenerator;->prepareBuffers()V

    .line 261
    .line 262
    .line 263
    :cond_8
    :goto_1
    move v2, v1

    .line 264
    :goto_2
    if-lez v2, :cond_9

    .line 265
    .line 266
    add-int/2addr v3, v2

    .line 267
    :cond_9
    invoke-direct {p0}, Lorg/eclipse/jetty/http/HttpGenerator;->flushMask()I

    .line 268
    .line 269
    .line 270
    move-result v4

    .line 271
    if-gtz v2, :cond_b

    .line 272
    .line 273
    if-eqz v4, :cond_a

    .line 274
    .line 275
    if-eqz v0, :cond_b

    .line 276
    .line 277
    :cond_a
    return v3

    .line 278
    :cond_b
    move v0, v4

    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :cond_c
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 282
    .line 283
    const-string v0, "State==HEADER"

    .line 284
    .line 285
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    :catch_0
    move-exception p0

    .line 290
    sget-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 291
    .line 292
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 293
    .line 294
    .line 295
    instance-of v0, p0, Lorg/eclipse/jetty/io/EofException;

    .line 296
    .line 297
    if-eqz v0, :cond_d

    .line 298
    .line 299
    goto :goto_3

    .line 300
    :cond_d
    new-instance v0, Lorg/eclipse/jetty/io/EofException;

    .line 301
    .line 302
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/io/EofException;-><init>(Ljava/lang/Throwable;)V

    .line 303
    .line 304
    .line 305
    move-object p0, v0

    .line 306
    :goto_3
    throw p0

    .line 307
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getBytesBuffered()I
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 13
    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    move v2, v1

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    :goto_1
    add-int/2addr v0, v2

    .line 23
    iget-object p0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 24
    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_2
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    :goto_2
    add-int/2addr v0, v1

    .line 33
    return v0
.end method

.method public isBufferFull()Z
    .locals 4

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/http/AbstractGenerator;->isBufferFull()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bypass:Z

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-wide v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 16
    .line 17
    const-wide/16 v2, -0x2

    .line 18
    .line 19
    cmp-long v0, v0, v2

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/16 v0, 0xc

    .line 32
    .line 33
    if-ge p0, v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 39
    return p0
.end method

.method public isEmpty()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 22
    .line 23
    if-eqz p0, :cond_3

    .line 24
    .line 25
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public isRequest()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_method:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isResponse()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_method:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public prepareUncheckedAddContent()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_noContent:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_last:Z

    .line 8
    .line 9
    if-nez v0, :cond_a

    .line 10
    .line 11
    iget v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 12
    .line 13
    const/4 v2, 0x4

    .line 14
    if-ne v0, v2, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-gtz v2, :cond_3

    .line 27
    .line 28
    :cond_2
    iget-boolean v2, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 29
    .line 30
    if-eqz v2, :cond_6

    .line 31
    .line 32
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpGenerator;->flushBuffer()I

    .line 33
    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-gtz v0, :cond_5

    .line 42
    .line 43
    :cond_4
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 44
    .line 45
    if-nez v0, :cond_5

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_5
    const-string p0, "FULL"

    .line 49
    .line 50
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return v1

    .line 54
    :cond_6
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 55
    .line 56
    if-nez v0, :cond_7

    .line 57
    .line 58
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 59
    .line 60
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffers;->getBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 65
    .line 66
    :cond_7
    iget-wide v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentWritten:J

    .line 67
    .line 68
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 69
    .line 70
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    int-to-long v4, v0

    .line 75
    sub-long/2addr v2, v4

    .line 76
    iput-wide v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentWritten:J

    .line 77
    .line 78
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_head:Z

    .line 79
    .line 80
    if-eqz v0, :cond_8

    .line 81
    .line 82
    const p0, 0x7fffffff

    .line 83
    .line 84
    .line 85
    return p0

    .line 86
    :cond_8
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 87
    .line 88
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget-wide v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 93
    .line 94
    const-wide/16 v4, -0x2

    .line 95
    .line 96
    cmp-long p0, v2, v4

    .line 97
    .line 98
    if-nez p0, :cond_9

    .line 99
    .line 100
    const/16 v1, 0xc

    .line 101
    .line 102
    :cond_9
    sub-int/2addr v0, v1

    .line 103
    return v0

    .line 104
    :cond_a
    :goto_1
    return v1
.end method

.method public reset()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_persistent:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->isOutputShutdown()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 22
    .line 23
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->shutdownOutput()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    sget-object v1, Lorg/eclipse/jetty/http/HttpGenerator;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 29
    .line 30
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    :goto_0
    invoke-super {p0}, Lorg/eclipse/jetty/http/AbstractGenerator;->reset()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iput-object v1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 56
    .line 57
    :cond_3
    const/4 v0, 0x0

    .line 58
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bypass:Z

    .line 59
    .line 60
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needCRLF:Z

    .line 61
    .line 62
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_needEOC:Z

    .line 63
    .line 64
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 65
    .line 66
    iput-object v1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_method:Lorg/eclipse/jetty/io/Buffer;

    .line 67
    .line 68
    iput-object v1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_uri:Ljava/lang/String;

    .line 69
    .line 70
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_noContent:Z

    .line 71
    .line 72
    return-void
.end method

.method public send1xx(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/16 v0, 0x64

    .line 7
    .line 8
    if-lt p1, v0, :cond_6

    .line 9
    .line 10
    const/16 v0, 0xc7

    .line 11
    .line 12
    if-gt p1, v0, :cond_6

    .line 13
    .line 14
    sget-object v0, Lorg/eclipse/jetty/http/HttpGenerator;->__status:[Lorg/eclipse/jetty/http/HttpGenerator$Status;

    .line 15
    .line 16
    aget-object v0, v0, p1

    .line 17
    .line 18
    if-eqz v0, :cond_5

    .line 19
    .line 20
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 25
    .line 26
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffers;->getHeader()Lorg/eclipse/jetty/io/Buffer;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 33
    .line 34
    iget-object v0, v0, Lorg/eclipse/jetty/http/HttpGenerator$Status;->_responseLine:Lorg/eclipse/jetty/io/Buffer;

    .line 35
    .line 36
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 40
    .line 41
    sget-object v0, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 42
    .line 43
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/io/Buffer;->put([B)I

    .line 44
    .line 45
    .line 46
    :cond_2
    :goto_0
    :try_start_0
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 47
    .line 48
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-lez p1, :cond_4

    .line 53
    .line 54
    iget-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 55
    .line 56
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 57
    .line 58
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/io/EndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-ltz p1, :cond_3

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    const-wide/16 v0, 0x64

    .line 67
    .line 68
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    new-instance p0, Lorg/eclipse/jetty/io/EofException;

    .line 73
    .line 74
    invoke-direct {p0}, Lorg/eclipse/jetty/io/EofException;-><init>()V

    .line 75
    .line 76
    .line 77
    throw p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    :cond_4
    :goto_1
    return-void

    .line 79
    :catch_0
    move-exception p0

    .line 80
    sget-object p1, Lorg/eclipse/jetty/http/HttpGenerator;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 81
    .line 82
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    new-instance p1, Ljava/io/InterruptedIOException;

    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-direct {p1, p0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    throw p1

    .line 95
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 96
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string p1, "?"

    .line 106
    .line 107
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    throw p0

    .line 118
    :cond_6
    const-string p0, "!1xx"

    .line 119
    .line 120
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public sendResponse(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_noContent:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-gtz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bufferChunked:Z

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_head:Z

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_last:Z

    .line 29
    .line 30
    iput-object p1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 31
    .line 32
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/HttpGenerator;->_bypass:Z

    .line 33
    .line 34
    const/4 v0, 0x3

    .line 35
    iput v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 36
    .line 37
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    int-to-long v0, p1

    .line 42
    iput-wide v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentWritten:J

    .line 43
    .line 44
    iput-wide v0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_contentLength:J

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_state:I

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 16
    .line 17
    const/4 v3, -0x1

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    move v2, v3

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v4, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 31
    .line 32
    if-nez v4, :cond_1

    .line 33
    .line 34
    move v4, v3

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    invoke-interface {v4}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    :goto_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    iget-object p0, p0, Lorg/eclipse/jetty/http/AbstractGenerator;->_content:Lorg/eclipse/jetty/io/Buffer;

    .line 45
    .line 46
    if-nez p0, :cond_2

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_2
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    :goto_2
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    filled-new-array {v0, v1, v2, v4, p0}, [Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v0, "%s{s=%d,h=%d,b=%d,c=%d}"

    .line 62
    .line 63
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method
