.class final Lnet/jpountz/lz4/LZ4JavaUnsafeFastDecompressor;
.super Lnet/jpountz/lz4/LZ4FastDecompressor;
.source "SourceFile"


# static fields
.field public static final INSTANCE:Lnet/jpountz/lz4/LZ4FastDecompressor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lnet/jpountz/lz4/LZ4JavaUnsafeFastDecompressor;

    .line 2
    .line 3
    invoke-direct {v0}, Lnet/jpountz/lz4/LZ4JavaUnsafeFastDecompressor;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lnet/jpountz/lz4/LZ4JavaUnsafeFastDecompressor;->INSTANCE:Lnet/jpountz/lz4/LZ4FastDecompressor;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lnet/jpountz/lz4/LZ4FastDecompressor;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public decompress(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)I
    .locals 10

    .line 1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move-object v0, p1

    .line 14
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    add-int/2addr p2, v0

    .line 23
    move-object v1, p3

    .line 24
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    add-int/2addr p4, v0

    .line 33
    invoke-virtual/range {p0 .. p5}, Lnet/jpountz/lz4/LZ4JavaUnsafeFastDecompressor;->decompress([BI[BII)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_0
    move-object v0, p1

    .line 39
    move-object v1, p3

    .line 40
    invoke-static {v0}, Lnet/jpountz/util/ByteBufferUtils;->inNativeByteOrder(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {v1}, Lnet/jpountz/util/ByteBufferUtils;->inNativeByteOrder(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p0, p2}, Lnet/jpountz/util/ByteBufferUtils;->checkRange(Ljava/nio/ByteBuffer;I)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, p4, p5}, Lnet/jpountz/util/ByteBufferUtils;->checkRange(Ljava/nio/ByteBuffer;II)V

    .line 52
    .line 53
    .line 54
    const/4 p3, 0x0

    .line 55
    const/4 v0, 0x1

    .line 56
    const-string v1, "Malformed input at "

    .line 57
    .line 58
    if-nez p5, :cond_2

    .line 59
    .line 60
    invoke-static {p0, p2}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_1

    .line 65
    .line 66
    return v0

    .line 67
    :cond_1
    invoke-static {v1, p2}, Ll/f7r;->a(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    return p3

    .line 71
    :cond_2
    add-int/2addr p5, p4

    .line 72
    move v2, p2

    .line 73
    move v3, p4

    .line 74
    :goto_0
    invoke-static {p0, v2}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    and-int/lit16 v5, v4, 0xff

    .line 79
    .line 80
    add-int/2addr v2, v0

    .line 81
    ushr-int/lit8 v5, v5, 0x4

    .line 82
    .line 83
    const/4 v6, -0x1

    .line 84
    const/16 v7, 0xf

    .line 85
    .line 86
    if-ne v5, v7, :cond_4

    .line 87
    .line 88
    :goto_1
    add-int/lit8 v8, v2, 0x1

    .line 89
    .line 90
    invoke-static {p0, v2}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-ne v2, v6, :cond_3

    .line 95
    .line 96
    add-int/lit16 v5, v5, 0xff

    .line 97
    .line 98
    move v2, v8

    .line 99
    goto :goto_1

    .line 100
    :cond_3
    and-int/lit16 v2, v2, 0xff

    .line 101
    .line 102
    add-int/2addr v5, v2

    .line 103
    move v2, v8

    .line 104
    :cond_4
    add-int v8, v3, v5

    .line 105
    .line 106
    add-int/lit8 v9, p5, -0x8

    .line 107
    .line 108
    if-le v8, v9, :cond_6

    .line 109
    .line 110
    if-ne v8, p5, :cond_5

    .line 111
    .line 112
    invoke-static {p0, v2, p1, v3, v5}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->safeArraycopy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 113
    .line 114
    .line 115
    add-int/2addr v2, v5

    .line 116
    sub-int/2addr v2, p2

    .line 117
    return v2

    .line 118
    :cond_5
    invoke-static {v1, v2}, Ll/f7r;->a(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    return p3

    .line 122
    :cond_6
    invoke-static {p0, v2, p1, v3, v5}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->wildArraycopy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 123
    .line 124
    .line 125
    add-int/2addr v2, v5

    .line 126
    invoke-static {p0, v2}, Lnet/jpountz/util/ByteBufferUtils;->readShortLE(Ljava/nio/ByteBuffer;I)I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    add-int/lit8 v2, v2, 0x2

    .line 131
    .line 132
    sub-int v3, v8, v3

    .line 133
    .line 134
    if-lt v3, p4, :cond_b

    .line 135
    .line 136
    and-int/lit8 v4, v4, 0xf

    .line 137
    .line 138
    if-ne v4, v7, :cond_8

    .line 139
    .line 140
    :goto_2
    add-int/lit8 v5, v2, 0x1

    .line 141
    .line 142
    invoke-static {p0, v2}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-ne v2, v6, :cond_7

    .line 147
    .line 148
    add-int/lit16 v4, v4, 0xff

    .line 149
    .line 150
    move v2, v5

    .line 151
    goto :goto_2

    .line 152
    :cond_7
    and-int/lit16 v2, v2, 0xff

    .line 153
    .line 154
    add-int/2addr v4, v2

    .line 155
    move v2, v5

    .line 156
    :cond_8
    add-int/lit8 v4, v4, 0x4

    .line 157
    .line 158
    add-int v5, v8, v4

    .line 159
    .line 160
    if-le v5, v9, :cond_a

    .line 161
    .line 162
    if-gt v5, p5, :cond_9

    .line 163
    .line 164
    invoke-static {p1, v3, v8, v4}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->safeIncrementalCopy(Ljava/nio/ByteBuffer;III)V

    .line 165
    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_9
    invoke-static {v1, v2}, Ll/f7r;->a(Ljava/lang/String;I)V

    .line 169
    .line 170
    .line 171
    return p3

    .line 172
    :cond_a
    invoke-static {p1, v3, v8, v5}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->wildIncrementalCopy(Ljava/nio/ByteBuffer;III)V

    .line 173
    .line 174
    .line 175
    :goto_3
    move v3, v5

    .line 176
    goto :goto_0

    .line 177
    :cond_b
    invoke-static {v1, v2}, Ll/f7r;->a(Ljava/lang/String;I)V

    .line 178
    .line 179
    .line 180
    return p3
.end method

.method public decompress([BI[BII)I
    .locals 9

    .line 181
    invoke-static {p1, p2}, Lnet/jpountz/util/UnsafeUtils;->checkRange([BI)V

    .line 182
    invoke-static {p3, p4, p5}, Lnet/jpountz/util/UnsafeUtils;->checkRange([BII)V

    const/4 p0, 0x1

    .line 183
    const-string v0, "Malformed input at "

    if-nez p5, :cond_1

    .line 184
    invoke-static {p1, p2}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    move-result p1

    if-nez p1, :cond_0

    return p0

    .line 185
    :cond_0
    invoke-static {v0, p2}, Ll/f7r;->a(Ljava/lang/String;I)V

    :goto_0
    const/4 p0, 0x0

    return p0

    :cond_1
    add-int/2addr p5, p4

    move v1, p2

    move v2, p4

    .line 186
    :goto_1
    invoke-static {p1, v1}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    move-result v3

    and-int/lit16 v4, v3, 0xff

    add-int/2addr v1, p0

    ushr-int/lit8 v4, v4, 0x4

    const/4 v5, -0x1

    const/16 v6, 0xf

    if-ne v4, v6, :cond_3

    :goto_2
    add-int/lit8 v7, v1, 0x1

    .line 187
    invoke-static {p1, v1}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    move-result v1

    if-ne v1, v5, :cond_2

    add-int/lit16 v4, v4, 0xff

    move v1, v7

    goto :goto_2

    :cond_2
    and-int/lit16 v1, v1, 0xff

    add-int/2addr v4, v1

    move v1, v7

    :cond_3
    add-int v7, v2, v4

    add-int/lit8 v8, p5, -0x8

    if-le v7, v8, :cond_5

    if-ne v7, p5, :cond_4

    .line 188
    invoke-static {p1, v1, p3, v2, v4}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->safeArraycopy([BI[BII)V

    add-int/2addr v1, v4

    sub-int/2addr v1, p2

    return v1

    .line 189
    :cond_4
    invoke-static {v0, v1}, Ll/f7r;->a(Ljava/lang/String;I)V

    goto :goto_0

    .line 190
    :cond_5
    invoke-static {p1, v1, p3, v2, v4}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->wildArraycopy([BI[BII)V

    add-int/2addr v1, v4

    .line 191
    invoke-static {p1, v1}, Lnet/jpountz/util/UnsafeUtils;->readShortLE([BI)I

    move-result v2

    add-int/lit8 v1, v1, 0x2

    sub-int v2, v7, v2

    if-lt v2, p4, :cond_a

    and-int/lit8 v3, v3, 0xf

    if-ne v3, v6, :cond_7

    :goto_3
    add-int/lit8 v4, v1, 0x1

    .line 192
    invoke-static {p1, v1}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    move-result v1

    if-ne v1, v5, :cond_6

    add-int/lit16 v3, v3, 0xff

    move v1, v4

    goto :goto_3

    :cond_6
    and-int/lit16 v1, v1, 0xff

    add-int/2addr v3, v1

    move v1, v4

    :cond_7
    add-int/lit8 v3, v3, 0x4

    add-int v4, v7, v3

    if-le v4, v8, :cond_9

    if-gt v4, p5, :cond_8

    .line 193
    invoke-static {p3, v2, v7, v3}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->safeIncrementalCopy([BIII)V

    goto :goto_4

    .line 194
    :cond_8
    invoke-static {v0, v1}, Ll/f7r;->a(Ljava/lang/String;I)V

    goto :goto_0

    .line 195
    :cond_9
    invoke-static {p3, v2, v7, v4}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->wildIncrementalCopy([BIII)V

    :goto_4
    move v2, v4

    goto :goto_1

    .line 196
    :cond_a
    invoke-static {v0, v1}, Ll/f7r;->a(Ljava/lang/String;I)V

    goto :goto_0
.end method
