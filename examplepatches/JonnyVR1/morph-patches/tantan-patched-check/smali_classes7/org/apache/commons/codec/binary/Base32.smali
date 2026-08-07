.class public Lorg/apache/commons/codec/binary/Base32;
.super Lorg/apache/commons/codec/binary/BaseNCodec;
.source "SourceFile"


# static fields
.field private static final BITS_PER_ENCODED_BYTE:I = 0x5

.field private static final BYTES_PER_ENCODED_BLOCK:I = 0x8

.field private static final BYTES_PER_UNENCODED_BLOCK:I = 0x5

.field private static final CHUNK_SEPARATOR:[B

.field private static final DECODE_TABLE:[B

.field private static final ENCODE_TABLE:[B

.field private static final HEX_DECODE_TABLE:[B

.field private static final HEX_ENCODE_TABLE:[B

.field private static final MASK_5BITS:I = 0x1f


# instance fields
.field private bitWorkArea:J

.field private final decodeSize:I

.field private final decodeTable:[B

.field private final encodeSize:I

.field private final encodeTable:[B

.field private final lineSeparator:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Lorg/apache/commons/codec/binary/Base32;->CHUNK_SEPARATOR:[B

    .line 8
    .line 9
    const/16 v0, 0x5b

    .line 10
    .line 11
    new-array v0, v0, [B

    .line 12
    .line 13
    fill-array-data v0, :array_1

    .line 14
    .line 15
    .line 16
    sput-object v0, Lorg/apache/commons/codec/binary/Base32;->DECODE_TABLE:[B

    .line 17
    .line 18
    const/16 v0, 0x20

    .line 19
    .line 20
    new-array v1, v0, [B

    .line 21
    .line 22
    fill-array-data v1, :array_2

    .line 23
    .line 24
    .line 25
    sput-object v1, Lorg/apache/commons/codec/binary/Base32;->ENCODE_TABLE:[B

    .line 26
    .line 27
    const/16 v1, 0x58

    .line 28
    .line 29
    new-array v1, v1, [B

    .line 30
    .line 31
    fill-array-data v1, :array_3

    .line 32
    .line 33
    .line 34
    sput-object v1, Lorg/apache/commons/codec/binary/Base32;->HEX_DECODE_TABLE:[B

    .line 35
    .line 36
    new-array v0, v0, [B

    .line 37
    .line 38
    fill-array-data v0, :array_4

    .line 39
    .line 40
    .line 41
    sput-object v0, Lorg/apache/commons/codec/binary/Base32;->HEX_ENCODE_TABLE:[B

    .line 42
    .line 43
    return-void

    .line 44
    nop

    .line 45
    :array_0
    .array-data 1
        0xdt
        0xat
    .end array-data

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    nop

    .line 51
    :array_1
    .array-data 1
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x3ft
        -0x1t
        -0x1t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
    .end array-data

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_2
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
    .end array-data

    :array_3
    .array-data 1
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x3ft
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
    .end array-data

    :array_4
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
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 91
    invoke-direct {p0, v0}, Lorg/apache/commons/codec/binary/Base32;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 89
    sget-object v0, Lorg/apache/commons/codec/binary/Base32;->CHUNK_SEPARATOR:[B

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/codec/binary/Base32;-><init>(I[B)V

    return-void
.end method

.method public constructor <init>(I[B)V
    .locals 1

    const/4 v0, 0x0

    .line 90
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/codec/binary/Base32;-><init>(I[BZ)V

    return-void
.end method

.method public constructor <init>(I[BZ)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    move v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    array-length v1, p2

    .line 7
    :goto_0
    const/4 v2, 0x5

    .line 8
    const/16 v3, 0x8

    .line 9
    .line 10
    invoke-direct {p0, v2, v3, p1, v1}, Lorg/apache/commons/codec/binary/BaseNCodec;-><init>(IIII)V

    .line 11
    .line 12
    .line 13
    if-eqz p3, :cond_1

    .line 14
    .line 15
    sget-object p3, Lorg/apache/commons/codec/binary/Base32;->HEX_ENCODE_TABLE:[B

    .line 16
    .line 17
    iput-object p3, p0, Lorg/apache/commons/codec/binary/Base32;->encodeTable:[B

    .line 18
    .line 19
    sget-object p3, Lorg/apache/commons/codec/binary/Base32;->HEX_DECODE_TABLE:[B

    .line 20
    .line 21
    iput-object p3, p0, Lorg/apache/commons/codec/binary/Base32;->decodeTable:[B

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    sget-object p3, Lorg/apache/commons/codec/binary/Base32;->ENCODE_TABLE:[B

    .line 25
    .line 26
    iput-object p3, p0, Lorg/apache/commons/codec/binary/Base32;->encodeTable:[B

    .line 27
    .line 28
    sget-object p3, Lorg/apache/commons/codec/binary/Base32;->DECODE_TABLE:[B

    .line 29
    .line 30
    iput-object p3, p0, Lorg/apache/commons/codec/binary/Base32;->decodeTable:[B

    .line 31
    .line 32
    :goto_1
    const/4 p3, 0x0

    .line 33
    if-lez p1, :cond_4

    .line 34
    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    invoke-virtual {p0, p2}, Lorg/apache/commons/codec/binary/BaseNCodec;->containsAlphabetOrPad([B)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    array-length p1, p2

    .line 44
    add-int/2addr p1, v3

    .line 45
    iput p1, p0, Lorg/apache/commons/codec/binary/Base32;->encodeSize:I

    .line 46
    .line 47
    array-length p1, p2

    .line 48
    new-array p1, p1, [B

    .line 49
    .line 50
    iput-object p1, p0, Lorg/apache/commons/codec/binary/Base32;->lineSeparator:[B

    .line 51
    .line 52
    array-length p3, p2

    .line 53
    invoke-static {p2, v0, p1, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_2
    invoke-static {p2}, Lorg/apache/commons/codec/binary/StringUtils;->newStringUtf8([B)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "lineSeparator must not contain Base32 characters: ["

    .line 62
    .line 63
    const-string p2, "]"

    .line 64
    .line 65
    invoke-static {p1, p0, p2}, Ll/v1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    throw p3

    .line 69
    :cond_3
    const-string p0, "lineLength "

    .line 70
    .line 71
    const-string p2, " > 0, but lineSeparator is null"

    .line 72
    .line 73
    invoke-static {p0, p1, p2}, Ll/i2r0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    throw p3

    .line 77
    :cond_4
    iput v3, p0, Lorg/apache/commons/codec/binary/Base32;->encodeSize:I

    .line 78
    .line 79
    iput-object p3, p0, Lorg/apache/commons/codec/binary/Base32;->lineSeparator:[B

    .line 80
    .line 81
    :goto_2
    iget p1, p0, Lorg/apache/commons/codec/binary/Base32;->encodeSize:I

    .line 82
    .line 83
    add-int/lit8 p1, p1, -0x1

    .line 84
    .line 85
    iput p1, p0, Lorg/apache/commons/codec/binary/Base32;->decodeSize:I

    .line 86
    .line 87
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 88
    invoke-direct {p0, v0, v1, p1}, Lorg/apache/commons/codec/binary/Base32;-><init>(I[BZ)V

    return-void
.end method


# virtual methods
.method public decode([BII)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    iget-boolean v2, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    const/4 v2, 0x1

    .line 12
    if-gez v1, :cond_1

    .line 13
    .line 14
    iput-boolean v2, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 15
    .line 16
    :cond_1
    const/4 v3, 0x0

    .line 17
    move v4, v3

    .line 18
    move/from16 v3, p2

    .line 19
    .line 20
    :goto_0
    const-wide/16 v5, 0xff

    .line 21
    .line 22
    if-ge v4, v1, :cond_2

    .line 23
    .line 24
    add-int/lit8 v7, v3, 0x1

    .line 25
    .line 26
    aget-byte v3, p1, v3

    .line 27
    .line 28
    const/16 v8, 0x3d

    .line 29
    .line 30
    if-ne v3, v8, :cond_3

    .line 31
    .line 32
    iput-boolean v2, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 33
    .line 34
    :cond_2
    move/from16 v17, v2

    .line 35
    .line 36
    move-wide/from16 v18, v5

    .line 37
    .line 38
    goto/16 :goto_2

    .line 39
    .line 40
    :cond_3
    iget v8, v0, Lorg/apache/commons/codec/binary/Base32;->decodeSize:I

    .line 41
    .line 42
    invoke-virtual {v0, v8}, Lorg/apache/commons/codec/binary/BaseNCodec;->ensureBufferSize(I)V

    .line 43
    .line 44
    .line 45
    if-ltz v3, :cond_4

    .line 46
    .line 47
    iget-object v8, v0, Lorg/apache/commons/codec/binary/Base32;->decodeTable:[B

    .line 48
    .line 49
    array-length v9, v8

    .line 50
    if-ge v3, v9, :cond_4

    .line 51
    .line 52
    aget-byte v3, v8, v3

    .line 53
    .line 54
    if-ltz v3, :cond_4

    .line 55
    .line 56
    iget v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 57
    .line 58
    add-int/2addr v8, v2

    .line 59
    const/16 v9, 0x8

    .line 60
    .line 61
    rem-int/2addr v8, v9

    .line 62
    iput v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 63
    .line 64
    iget-wide v10, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 65
    .line 66
    const/4 v12, 0x5

    .line 67
    shl-long/2addr v10, v12

    .line 68
    int-to-long v13, v3

    .line 69
    add-long/2addr v10, v13

    .line 70
    iput-wide v10, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 71
    .line 72
    if-nez v8, :cond_4

    .line 73
    .line 74
    iget-object v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 75
    .line 76
    iget v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 77
    .line 78
    add-int/lit8 v13, v8, 0x1

    .line 79
    .line 80
    iput v13, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 81
    .line 82
    const/16 v14, 0x20

    .line 83
    .line 84
    shr-long v14, v10, v14

    .line 85
    .line 86
    and-long/2addr v14, v5

    .line 87
    long-to-int v14, v14

    .line 88
    int-to-byte v14, v14

    .line 89
    aput-byte v14, v3, v8

    .line 90
    .line 91
    add-int/lit8 v14, v8, 0x2

    .line 92
    .line 93
    iput v14, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 94
    .line 95
    const/16 v15, 0x18

    .line 96
    .line 97
    shr-long v15, v10, v15

    .line 98
    .line 99
    move/from16 v17, v2

    .line 100
    .line 101
    move-object/from16 p2, v3

    .line 102
    .line 103
    and-long v2, v15, v5

    .line 104
    .line 105
    long-to-int v2, v2

    .line 106
    int-to-byte v2, v2

    .line 107
    aput-byte v2, p2, v13

    .line 108
    .line 109
    add-int/lit8 v2, v8, 0x3

    .line 110
    .line 111
    iput v2, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 112
    .line 113
    const/16 v3, 0x10

    .line 114
    .line 115
    shr-long v15, v10, v3

    .line 116
    .line 117
    move-wide/from16 v18, v5

    .line 118
    .line 119
    and-long v5, v15, v18

    .line 120
    .line 121
    long-to-int v3, v5

    .line 122
    int-to-byte v3, v3

    .line 123
    aput-byte v3, p2, v14

    .line 124
    .line 125
    add-int/lit8 v3, v8, 0x4

    .line 126
    .line 127
    iput v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 128
    .line 129
    shr-long v5, v10, v9

    .line 130
    .line 131
    and-long v5, v5, v18

    .line 132
    .line 133
    long-to-int v5, v5

    .line 134
    int-to-byte v5, v5

    .line 135
    aput-byte v5, p2, v2

    .line 136
    .line 137
    add-int/2addr v8, v12

    .line 138
    iput v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 139
    .line 140
    and-long v5, v10, v18

    .line 141
    .line 142
    long-to-int v2, v5

    .line 143
    int-to-byte v2, v2

    .line 144
    aput-byte v2, p2, v3

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_4
    move/from16 v17, v2

    .line 148
    .line 149
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 150
    .line 151
    move v3, v7

    .line 152
    move/from16 v2, v17

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :goto_2
    iget-boolean v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 157
    .line 158
    if-eqz v1, :cond_5

    .line 159
    .line 160
    iget v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 161
    .line 162
    const/4 v2, 0x2

    .line 163
    if-lt v1, v2, :cond_5

    .line 164
    .line 165
    iget v1, v0, Lorg/apache/commons/codec/binary/Base32;->decodeSize:I

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Lorg/apache/commons/codec/binary/BaseNCodec;->ensureBufferSize(I)V

    .line 168
    .line 169
    .line 170
    iget v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 171
    .line 172
    const/4 v3, 0x4

    .line 173
    const/4 v4, 0x3

    .line 174
    packed-switch v1, :pswitch_data_0

    .line 175
    .line 176
    .line 177
    goto/16 :goto_3

    .line 178
    .line 179
    :pswitch_0
    iget-wide v1, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 180
    .line 181
    shr-long v4, v1, v4

    .line 182
    .line 183
    iput-wide v4, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 184
    .line 185
    iget-object v6, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 186
    .line 187
    iget v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 188
    .line 189
    add-int/lit8 v8, v7, 0x1

    .line 190
    .line 191
    iput v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 192
    .line 193
    const/16 v9, 0x1b

    .line 194
    .line 195
    shr-long v9, v1, v9

    .line 196
    .line 197
    and-long v9, v9, v18

    .line 198
    .line 199
    long-to-int v9, v9

    .line 200
    int-to-byte v9, v9

    .line 201
    aput-byte v9, v6, v7

    .line 202
    .line 203
    add-int/lit8 v9, v7, 0x2

    .line 204
    .line 205
    iput v9, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 206
    .line 207
    const/16 v10, 0x13

    .line 208
    .line 209
    shr-long v10, v1, v10

    .line 210
    .line 211
    and-long v10, v10, v18

    .line 212
    .line 213
    long-to-int v10, v10

    .line 214
    int-to-byte v10, v10

    .line 215
    aput-byte v10, v6, v8

    .line 216
    .line 217
    add-int/lit8 v8, v7, 0x3

    .line 218
    .line 219
    iput v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 220
    .line 221
    const/16 v10, 0xb

    .line 222
    .line 223
    shr-long/2addr v1, v10

    .line 224
    and-long v1, v1, v18

    .line 225
    .line 226
    long-to-int v1, v1

    .line 227
    int-to-byte v1, v1

    .line 228
    aput-byte v1, v6, v9

    .line 229
    .line 230
    add-int/2addr v7, v3

    .line 231
    iput v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 232
    .line 233
    and-long v0, v4, v18

    .line 234
    .line 235
    long-to-int v0, v0

    .line 236
    int-to-byte v0, v0

    .line 237
    aput-byte v0, v6, v8

    .line 238
    .line 239
    return-void

    .line 240
    :pswitch_1
    iget-wide v1, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 241
    .line 242
    const/4 v3, 0x6

    .line 243
    shr-long v5, v1, v3

    .line 244
    .line 245
    iput-wide v5, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 246
    .line 247
    iget-object v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 248
    .line 249
    iget v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 250
    .line 251
    add-int/lit8 v8, v7, 0x1

    .line 252
    .line 253
    iput v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 254
    .line 255
    const/16 v9, 0x16

    .line 256
    .line 257
    shr-long v9, v1, v9

    .line 258
    .line 259
    and-long v9, v9, v18

    .line 260
    .line 261
    long-to-int v9, v9

    .line 262
    int-to-byte v9, v9

    .line 263
    aput-byte v9, v3, v7

    .line 264
    .line 265
    add-int/lit8 v9, v7, 0x2

    .line 266
    .line 267
    iput v9, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 268
    .line 269
    const/16 v10, 0xe

    .line 270
    .line 271
    shr-long/2addr v1, v10

    .line 272
    and-long v1, v1, v18

    .line 273
    .line 274
    long-to-int v1, v1

    .line 275
    int-to-byte v1, v1

    .line 276
    aput-byte v1, v3, v8

    .line 277
    .line 278
    add-int/2addr v7, v4

    .line 279
    iput v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 280
    .line 281
    and-long v0, v5, v18

    .line 282
    .line 283
    long-to-int v0, v0

    .line 284
    int-to-byte v0, v0

    .line 285
    aput-byte v0, v3, v9

    .line 286
    .line 287
    return-void

    .line 288
    :pswitch_2
    iget-wide v1, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 289
    .line 290
    shr-long v5, v1, v17

    .line 291
    .line 292
    iput-wide v5, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 293
    .line 294
    iget-object v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 295
    .line 296
    iget v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 297
    .line 298
    add-int/lit8 v8, v7, 0x1

    .line 299
    .line 300
    iput v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 301
    .line 302
    const/16 v9, 0x11

    .line 303
    .line 304
    shr-long v9, v1, v9

    .line 305
    .line 306
    and-long v9, v9, v18

    .line 307
    .line 308
    long-to-int v9, v9

    .line 309
    int-to-byte v9, v9

    .line 310
    aput-byte v9, v3, v7

    .line 311
    .line 312
    add-int/lit8 v9, v7, 0x2

    .line 313
    .line 314
    iput v9, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 315
    .line 316
    const/16 v10, 0x9

    .line 317
    .line 318
    shr-long/2addr v1, v10

    .line 319
    and-long v1, v1, v18

    .line 320
    .line 321
    long-to-int v1, v1

    .line 322
    int-to-byte v1, v1

    .line 323
    aput-byte v1, v3, v8

    .line 324
    .line 325
    add-int/2addr v7, v4

    .line 326
    iput v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 327
    .line 328
    and-long v0, v5, v18

    .line 329
    .line 330
    long-to-int v0, v0

    .line 331
    int-to-byte v0, v0

    .line 332
    aput-byte v0, v3, v9

    .line 333
    .line 334
    return-void

    .line 335
    :pswitch_3
    iget-wide v4, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 336
    .line 337
    shr-long v6, v4, v3

    .line 338
    .line 339
    iput-wide v6, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 340
    .line 341
    iget-object v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 342
    .line 343
    iget v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 344
    .line 345
    add-int/lit8 v8, v3, 0x1

    .line 346
    .line 347
    iput v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 348
    .line 349
    const/16 v9, 0xc

    .line 350
    .line 351
    shr-long/2addr v4, v9

    .line 352
    and-long v4, v4, v18

    .line 353
    .line 354
    long-to-int v4, v4

    .line 355
    int-to-byte v4, v4

    .line 356
    aput-byte v4, v1, v3

    .line 357
    .line 358
    add-int/2addr v3, v2

    .line 359
    iput v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 360
    .line 361
    and-long v2, v6, v18

    .line 362
    .line 363
    long-to-int v0, v2

    .line 364
    int-to-byte v0, v0

    .line 365
    aput-byte v0, v1, v8

    .line 366
    .line 367
    return-void

    .line 368
    :pswitch_4
    iget-object v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 369
    .line 370
    iget v2, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 371
    .line 372
    add-int/lit8 v3, v2, 0x1

    .line 373
    .line 374
    iput v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 375
    .line 376
    iget-wide v3, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 377
    .line 378
    const/4 v0, 0x7

    .line 379
    shr-long/2addr v3, v0

    .line 380
    and-long v3, v3, v18

    .line 381
    .line 382
    long-to-int v0, v3

    .line 383
    int-to-byte v0, v0

    .line 384
    aput-byte v0, v1, v2

    .line 385
    .line 386
    return-void

    .line 387
    :pswitch_5
    iget-object v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 388
    .line 389
    iget v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 390
    .line 391
    add-int/lit8 v4, v3, 0x1

    .line 392
    .line 393
    iput v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 394
    .line 395
    iget-wide v4, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 396
    .line 397
    shr-long/2addr v4, v2

    .line 398
    and-long v4, v4, v18

    .line 399
    .line 400
    long-to-int v0, v4

    .line 401
    int-to-byte v0, v0

    .line 402
    aput-byte v0, v1, v3

    .line 403
    .line 404
    :cond_5
    :goto_3
    return-void

    .line 405
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public encode([BII)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    iget-boolean v2, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x1

    .line 13
    if-gez v1, :cond_6

    .line 14
    .line 15
    iput-boolean v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 16
    .line 17
    iget v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->lineLength:I

    .line 22
    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    goto/16 :goto_3

    .line 26
    .line 27
    :cond_1
    iget v1, v0, Lorg/apache/commons/codec/binary/Base32;->encodeSize:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lorg/apache/commons/codec/binary/BaseNCodec;->ensureBufferSize(I)V

    .line 30
    .line 31
    .line 32
    iget v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 33
    .line 34
    iget v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 35
    .line 36
    const/4 v5, 0x3

    .line 37
    const/4 v6, 0x2

    .line 38
    const/16 v7, 0x3d

    .line 39
    .line 40
    if-eq v4, v3, :cond_5

    .line 41
    .line 42
    const/4 v8, 0x4

    .line 43
    if-eq v4, v6, :cond_4

    .line 44
    .line 45
    if-eq v4, v5, :cond_3

    .line 46
    .line 47
    if-eq v4, v8, :cond_2

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :cond_2
    iget-object v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 52
    .line 53
    add-int/lit8 v4, v1, 0x1

    .line 54
    .line 55
    iput v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 56
    .line 57
    iget-object v8, v0, Lorg/apache/commons/codec/binary/Base32;->encodeTable:[B

    .line 58
    .line 59
    iget-wide v9, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 60
    .line 61
    const/16 v11, 0x1b

    .line 62
    .line 63
    shr-long v11, v9, v11

    .line 64
    .line 65
    long-to-int v11, v11

    .line 66
    and-int/lit8 v11, v11, 0x1f

    .line 67
    .line 68
    aget-byte v11, v8, v11

    .line 69
    .line 70
    aput-byte v11, v3, v1

    .line 71
    .line 72
    add-int/lit8 v11, v1, 0x2

    .line 73
    .line 74
    iput v11, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 75
    .line 76
    const/16 v12, 0x16

    .line 77
    .line 78
    shr-long v12, v9, v12

    .line 79
    .line 80
    long-to-int v12, v12

    .line 81
    and-int/lit8 v12, v12, 0x1f

    .line 82
    .line 83
    aget-byte v12, v8, v12

    .line 84
    .line 85
    aput-byte v12, v3, v4

    .line 86
    .line 87
    add-int/lit8 v4, v1, 0x3

    .line 88
    .line 89
    iput v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 90
    .line 91
    const/16 v12, 0x11

    .line 92
    .line 93
    shr-long v12, v9, v12

    .line 94
    .line 95
    long-to-int v12, v12

    .line 96
    and-int/lit8 v12, v12, 0x1f

    .line 97
    .line 98
    aget-byte v12, v8, v12

    .line 99
    .line 100
    aput-byte v12, v3, v11

    .line 101
    .line 102
    add-int/lit8 v11, v1, 0x4

    .line 103
    .line 104
    iput v11, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 105
    .line 106
    const/16 v12, 0xc

    .line 107
    .line 108
    shr-long v12, v9, v12

    .line 109
    .line 110
    long-to-int v12, v12

    .line 111
    and-int/lit8 v12, v12, 0x1f

    .line 112
    .line 113
    aget-byte v12, v8, v12

    .line 114
    .line 115
    aput-byte v12, v3, v4

    .line 116
    .line 117
    add-int/lit8 v4, v1, 0x5

    .line 118
    .line 119
    iput v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 120
    .line 121
    const/4 v12, 0x7

    .line 122
    shr-long v12, v9, v12

    .line 123
    .line 124
    long-to-int v12, v12

    .line 125
    and-int/lit8 v12, v12, 0x1f

    .line 126
    .line 127
    aget-byte v12, v8, v12

    .line 128
    .line 129
    aput-byte v12, v3, v11

    .line 130
    .line 131
    add-int/lit8 v11, v1, 0x6

    .line 132
    .line 133
    iput v11, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 134
    .line 135
    shr-long v12, v9, v6

    .line 136
    .line 137
    long-to-int v6, v12

    .line 138
    and-int/lit8 v6, v6, 0x1f

    .line 139
    .line 140
    aget-byte v6, v8, v6

    .line 141
    .line 142
    aput-byte v6, v3, v4

    .line 143
    .line 144
    add-int/lit8 v4, v1, 0x7

    .line 145
    .line 146
    iput v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 147
    .line 148
    shl-long v5, v9, v5

    .line 149
    .line 150
    long-to-int v5, v5

    .line 151
    and-int/lit8 v5, v5, 0x1f

    .line 152
    .line 153
    aget-byte v5, v8, v5

    .line 154
    .line 155
    aput-byte v5, v3, v11

    .line 156
    .line 157
    add-int/lit8 v5, v1, 0x8

    .line 158
    .line 159
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 160
    .line 161
    aput-byte v7, v3, v4

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_3
    iget-object v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 166
    .line 167
    add-int/lit8 v5, v1, 0x1

    .line 168
    .line 169
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 170
    .line 171
    iget-object v6, v0, Lorg/apache/commons/codec/binary/Base32;->encodeTable:[B

    .line 172
    .line 173
    iget-wide v9, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 174
    .line 175
    const/16 v11, 0x13

    .line 176
    .line 177
    shr-long v11, v9, v11

    .line 178
    .line 179
    long-to-int v11, v11

    .line 180
    and-int/lit8 v11, v11, 0x1f

    .line 181
    .line 182
    aget-byte v11, v6, v11

    .line 183
    .line 184
    aput-byte v11, v4, v1

    .line 185
    .line 186
    add-int/lit8 v11, v1, 0x2

    .line 187
    .line 188
    iput v11, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 189
    .line 190
    const/16 v12, 0xe

    .line 191
    .line 192
    shr-long v12, v9, v12

    .line 193
    .line 194
    long-to-int v12, v12

    .line 195
    and-int/lit8 v12, v12, 0x1f

    .line 196
    .line 197
    aget-byte v12, v6, v12

    .line 198
    .line 199
    aput-byte v12, v4, v5

    .line 200
    .line 201
    add-int/lit8 v5, v1, 0x3

    .line 202
    .line 203
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 204
    .line 205
    const/16 v12, 0x9

    .line 206
    .line 207
    shr-long v12, v9, v12

    .line 208
    .line 209
    long-to-int v12, v12

    .line 210
    and-int/lit8 v12, v12, 0x1f

    .line 211
    .line 212
    aget-byte v12, v6, v12

    .line 213
    .line 214
    aput-byte v12, v4, v11

    .line 215
    .line 216
    add-int/lit8 v11, v1, 0x4

    .line 217
    .line 218
    iput v11, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 219
    .line 220
    shr-long v12, v9, v8

    .line 221
    .line 222
    long-to-int v8, v12

    .line 223
    and-int/lit8 v8, v8, 0x1f

    .line 224
    .line 225
    aget-byte v8, v6, v8

    .line 226
    .line 227
    aput-byte v8, v4, v5

    .line 228
    .line 229
    add-int/lit8 v5, v1, 0x5

    .line 230
    .line 231
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 232
    .line 233
    shl-long v8, v9, v3

    .line 234
    .line 235
    long-to-int v3, v8

    .line 236
    and-int/lit8 v3, v3, 0x1f

    .line 237
    .line 238
    aget-byte v3, v6, v3

    .line 239
    .line 240
    aput-byte v3, v4, v11

    .line 241
    .line 242
    add-int/lit8 v3, v1, 0x6

    .line 243
    .line 244
    iput v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 245
    .line 246
    aput-byte v7, v4, v5

    .line 247
    .line 248
    add-int/lit8 v5, v1, 0x7

    .line 249
    .line 250
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 251
    .line 252
    aput-byte v7, v4, v3

    .line 253
    .line 254
    add-int/lit8 v3, v1, 0x8

    .line 255
    .line 256
    iput v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 257
    .line 258
    aput-byte v7, v4, v5

    .line 259
    .line 260
    goto/16 :goto_0

    .line 261
    .line 262
    :cond_4
    iget-object v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 263
    .line 264
    add-int/lit8 v5, v1, 0x1

    .line 265
    .line 266
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 267
    .line 268
    iget-object v6, v0, Lorg/apache/commons/codec/binary/Base32;->encodeTable:[B

    .line 269
    .line 270
    iget-wide v9, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 271
    .line 272
    const/16 v11, 0xb

    .line 273
    .line 274
    shr-long v11, v9, v11

    .line 275
    .line 276
    long-to-int v11, v11

    .line 277
    and-int/lit8 v11, v11, 0x1f

    .line 278
    .line 279
    aget-byte v11, v6, v11

    .line 280
    .line 281
    aput-byte v11, v4, v1

    .line 282
    .line 283
    add-int/lit8 v11, v1, 0x2

    .line 284
    .line 285
    iput v11, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 286
    .line 287
    const/4 v12, 0x6

    .line 288
    shr-long v12, v9, v12

    .line 289
    .line 290
    long-to-int v12, v12

    .line 291
    and-int/lit8 v12, v12, 0x1f

    .line 292
    .line 293
    aget-byte v12, v6, v12

    .line 294
    .line 295
    aput-byte v12, v4, v5

    .line 296
    .line 297
    add-int/lit8 v5, v1, 0x3

    .line 298
    .line 299
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 300
    .line 301
    shr-long v12, v9, v3

    .line 302
    .line 303
    long-to-int v3, v12

    .line 304
    and-int/lit8 v3, v3, 0x1f

    .line 305
    .line 306
    aget-byte v3, v6, v3

    .line 307
    .line 308
    aput-byte v3, v4, v11

    .line 309
    .line 310
    add-int/lit8 v3, v1, 0x4

    .line 311
    .line 312
    iput v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 313
    .line 314
    shl-long v8, v9, v8

    .line 315
    .line 316
    long-to-int v8, v8

    .line 317
    and-int/lit8 v8, v8, 0x1f

    .line 318
    .line 319
    aget-byte v6, v6, v8

    .line 320
    .line 321
    aput-byte v6, v4, v5

    .line 322
    .line 323
    add-int/lit8 v5, v1, 0x5

    .line 324
    .line 325
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 326
    .line 327
    aput-byte v7, v4, v3

    .line 328
    .line 329
    add-int/lit8 v3, v1, 0x6

    .line 330
    .line 331
    iput v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 332
    .line 333
    aput-byte v7, v4, v5

    .line 334
    .line 335
    add-int/lit8 v5, v1, 0x7

    .line 336
    .line 337
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 338
    .line 339
    aput-byte v7, v4, v3

    .line 340
    .line 341
    add-int/lit8 v3, v1, 0x8

    .line 342
    .line 343
    iput v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 344
    .line 345
    aput-byte v7, v4, v5

    .line 346
    .line 347
    goto :goto_0

    .line 348
    :cond_5
    iget-object v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 349
    .line 350
    add-int/lit8 v4, v1, 0x1

    .line 351
    .line 352
    iput v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 353
    .line 354
    iget-object v8, v0, Lorg/apache/commons/codec/binary/Base32;->encodeTable:[B

    .line 355
    .line 356
    iget-wide v9, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 357
    .line 358
    shr-long v11, v9, v5

    .line 359
    .line 360
    long-to-int v5, v11

    .line 361
    and-int/lit8 v5, v5, 0x1f

    .line 362
    .line 363
    aget-byte v5, v8, v5

    .line 364
    .line 365
    aput-byte v5, v3, v1

    .line 366
    .line 367
    add-int/lit8 v5, v1, 0x2

    .line 368
    .line 369
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 370
    .line 371
    shl-long/2addr v9, v6

    .line 372
    long-to-int v6, v9

    .line 373
    and-int/lit8 v6, v6, 0x1f

    .line 374
    .line 375
    aget-byte v6, v8, v6

    .line 376
    .line 377
    aput-byte v6, v3, v4

    .line 378
    .line 379
    add-int/lit8 v4, v1, 0x3

    .line 380
    .line 381
    iput v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 382
    .line 383
    aput-byte v7, v3, v5

    .line 384
    .line 385
    add-int/lit8 v5, v1, 0x4

    .line 386
    .line 387
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 388
    .line 389
    aput-byte v7, v3, v4

    .line 390
    .line 391
    add-int/lit8 v4, v1, 0x5

    .line 392
    .line 393
    iput v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 394
    .line 395
    aput-byte v7, v3, v5

    .line 396
    .line 397
    add-int/lit8 v5, v1, 0x6

    .line 398
    .line 399
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 400
    .line 401
    aput-byte v7, v3, v4

    .line 402
    .line 403
    add-int/lit8 v4, v1, 0x7

    .line 404
    .line 405
    iput v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 406
    .line 407
    aput-byte v7, v3, v5

    .line 408
    .line 409
    add-int/lit8 v5, v1, 0x8

    .line 410
    .line 411
    iput v5, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 412
    .line 413
    aput-byte v7, v3, v4

    .line 414
    .line 415
    :goto_0
    iget v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->currentLinePos:I

    .line 416
    .line 417
    iget v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 418
    .line 419
    sub-int v1, v4, v1

    .line 420
    .line 421
    add-int/2addr v3, v1

    .line 422
    iput v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->currentLinePos:I

    .line 423
    .line 424
    iget v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->lineLength:I

    .line 425
    .line 426
    if-lez v1, :cond_a

    .line 427
    .line 428
    if-lez v3, :cond_a

    .line 429
    .line 430
    iget-object v1, v0, Lorg/apache/commons/codec/binary/Base32;->lineSeparator:[B

    .line 431
    .line 432
    iget-object v3, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 433
    .line 434
    array-length v5, v1

    .line 435
    invoke-static {v1, v2, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 436
    .line 437
    .line 438
    iget v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 439
    .line 440
    iget-object v2, v0, Lorg/apache/commons/codec/binary/Base32;->lineSeparator:[B

    .line 441
    .line 442
    array-length v2, v2

    .line 443
    add-int/2addr v1, v2

    .line 444
    iput v1, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 445
    .line 446
    return-void

    .line 447
    :cond_6
    move/from16 v4, p2

    .line 448
    .line 449
    move v5, v2

    .line 450
    :goto_1
    if-ge v5, v1, :cond_a

    .line 451
    .line 452
    iget v6, v0, Lorg/apache/commons/codec/binary/Base32;->encodeSize:I

    .line 453
    .line 454
    invoke-virtual {v0, v6}, Lorg/apache/commons/codec/binary/BaseNCodec;->ensureBufferSize(I)V

    .line 455
    .line 456
    .line 457
    iget v6, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 458
    .line 459
    add-int/2addr v6, v3

    .line 460
    const/4 v7, 0x5

    .line 461
    rem-int/2addr v6, v7

    .line 462
    iput v6, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 463
    .line 464
    add-int/lit8 v8, v4, 0x1

    .line 465
    .line 466
    aget-byte v4, p1, v4

    .line 467
    .line 468
    if-gez v4, :cond_7

    .line 469
    .line 470
    add-int/lit16 v4, v4, 0x100

    .line 471
    .line 472
    :cond_7
    iget-wide v9, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 473
    .line 474
    const/16 v11, 0x8

    .line 475
    .line 476
    shl-long/2addr v9, v11

    .line 477
    int-to-long v12, v4

    .line 478
    add-long/2addr v9, v12

    .line 479
    iput-wide v9, v0, Lorg/apache/commons/codec/binary/Base32;->bitWorkArea:J

    .line 480
    .line 481
    if-nez v6, :cond_8

    .line 482
    .line 483
    iget-object v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 484
    .line 485
    iget v6, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 486
    .line 487
    add-int/lit8 v12, v6, 0x1

    .line 488
    .line 489
    iput v12, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 490
    .line 491
    iget-object v13, v0, Lorg/apache/commons/codec/binary/Base32;->encodeTable:[B

    .line 492
    .line 493
    const/16 v14, 0x23

    .line 494
    .line 495
    shr-long v14, v9, v14

    .line 496
    .line 497
    long-to-int v14, v14

    .line 498
    and-int/lit8 v14, v14, 0x1f

    .line 499
    .line 500
    aget-byte v14, v13, v14

    .line 501
    .line 502
    aput-byte v14, v4, v6

    .line 503
    .line 504
    add-int/lit8 v14, v6, 0x2

    .line 505
    .line 506
    iput v14, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 507
    .line 508
    const/16 v15, 0x1e

    .line 509
    .line 510
    move/from16 p2, v7

    .line 511
    .line 512
    move/from16 v16, v8

    .line 513
    .line 514
    shr-long v7, v9, v15

    .line 515
    .line 516
    long-to-int v7, v7

    .line 517
    and-int/lit8 v7, v7, 0x1f

    .line 518
    .line 519
    aget-byte v7, v13, v7

    .line 520
    .line 521
    aput-byte v7, v4, v12

    .line 522
    .line 523
    add-int/lit8 v7, v6, 0x3

    .line 524
    .line 525
    iput v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 526
    .line 527
    const/16 v8, 0x19

    .line 528
    .line 529
    move v15, v11

    .line 530
    shr-long v11, v9, v8

    .line 531
    .line 532
    long-to-int v8, v11

    .line 533
    and-int/lit8 v8, v8, 0x1f

    .line 534
    .line 535
    aget-byte v8, v13, v8

    .line 536
    .line 537
    aput-byte v8, v4, v14

    .line 538
    .line 539
    add-int/lit8 v8, v6, 0x4

    .line 540
    .line 541
    iput v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 542
    .line 543
    const/16 v11, 0x14

    .line 544
    .line 545
    shr-long v11, v9, v11

    .line 546
    .line 547
    long-to-int v11, v11

    .line 548
    and-int/lit8 v11, v11, 0x1f

    .line 549
    .line 550
    aget-byte v11, v13, v11

    .line 551
    .line 552
    aput-byte v11, v4, v7

    .line 553
    .line 554
    add-int/lit8 v7, v6, 0x5

    .line 555
    .line 556
    iput v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 557
    .line 558
    const/16 v11, 0xf

    .line 559
    .line 560
    shr-long v11, v9, v11

    .line 561
    .line 562
    long-to-int v11, v11

    .line 563
    and-int/lit8 v11, v11, 0x1f

    .line 564
    .line 565
    aget-byte v11, v13, v11

    .line 566
    .line 567
    aput-byte v11, v4, v8

    .line 568
    .line 569
    add-int/lit8 v8, v6, 0x6

    .line 570
    .line 571
    iput v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 572
    .line 573
    const/16 v11, 0xa

    .line 574
    .line 575
    shr-long v11, v9, v11

    .line 576
    .line 577
    long-to-int v11, v11

    .line 578
    and-int/lit8 v11, v11, 0x1f

    .line 579
    .line 580
    aget-byte v11, v13, v11

    .line 581
    .line 582
    aput-byte v11, v4, v7

    .line 583
    .line 584
    add-int/lit8 v7, v6, 0x7

    .line 585
    .line 586
    iput v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 587
    .line 588
    shr-long v11, v9, p2

    .line 589
    .line 590
    long-to-int v11, v11

    .line 591
    and-int/lit8 v11, v11, 0x1f

    .line 592
    .line 593
    aget-byte v11, v13, v11

    .line 594
    .line 595
    aput-byte v11, v4, v8

    .line 596
    .line 597
    add-int/2addr v6, v15

    .line 598
    iput v6, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 599
    .line 600
    long-to-int v8, v9

    .line 601
    and-int/lit8 v8, v8, 0x1f

    .line 602
    .line 603
    aget-byte v8, v13, v8

    .line 604
    .line 605
    aput-byte v8, v4, v7

    .line 606
    .line 607
    iget v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->currentLinePos:I

    .line 608
    .line 609
    add-int/2addr v7, v15

    .line 610
    iput v7, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->currentLinePos:I

    .line 611
    .line 612
    iget v8, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->lineLength:I

    .line 613
    .line 614
    if-lez v8, :cond_9

    .line 615
    .line 616
    if-gt v8, v7, :cond_9

    .line 617
    .line 618
    iget-object v7, v0, Lorg/apache/commons/codec/binary/Base32;->lineSeparator:[B

    .line 619
    .line 620
    array-length v8, v7

    .line 621
    invoke-static {v7, v2, v4, v6, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 622
    .line 623
    .line 624
    iget v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 625
    .line 626
    iget-object v6, v0, Lorg/apache/commons/codec/binary/Base32;->lineSeparator:[B

    .line 627
    .line 628
    array-length v6, v6

    .line 629
    add-int/2addr v4, v6

    .line 630
    iput v4, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 631
    .line 632
    iput v2, v0, Lorg/apache/commons/codec/binary/BaseNCodec;->currentLinePos:I

    .line 633
    .line 634
    goto :goto_2

    .line 635
    :cond_8
    move/from16 v16, v8

    .line 636
    .line 637
    :cond_9
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 638
    .line 639
    move/from16 v4, v16

    .line 640
    .line 641
    goto/16 :goto_1

    .line 642
    .line 643
    :cond_a
    :goto_3
    return-void
.end method

.method public isInAlphabet(B)Z
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lorg/apache/commons/codec/binary/Base32;->decodeTable:[B

    .line 4
    .line 5
    array-length v0, p0

    .line 6
    if-ge p1, v0, :cond_0

    .line 7
    .line 8
    aget-byte p0, p0, p1

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    if-eq p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method
