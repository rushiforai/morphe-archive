.class public final Lcom/fasterxml/jackson/core/io/JsonStringEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final HB:[B

.field private static final HC:[C

.field private static final SURR1_FIRST:I = 0xd800

.field private static final SURR1_LAST:I = 0xdbff

.field private static final SURR2_FIRST:I = 0xdc00

.field private static final SURR2_LAST:I = 0xdfff

.field protected static final _threadEncoder:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/ref/SoftReference<",
            "Lcom/fasterxml/jackson/core/io/JsonStringEncoder;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field protected _bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

.field protected final _qbuf:[C

.field protected _text:Lcom/fasterxml/jackson/core/util/TextBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->copyHexChars()[C

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HC:[C

    .line 6
    .line 7
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->copyHexBytes()[B

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HB:[B

    .line 12
    .line 13
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_threadEncoder:Ljava/lang/ThreadLocal;

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    new-array v0, v0, [C

    .line 6
    .line 7
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    const/16 v1, 0x5c

    .line 11
    .line 12
    aput-char v1, v0, p0

    .line 13
    .line 14
    const/4 p0, 0x2

    .line 15
    const/16 v1, 0x30

    .line 16
    .line 17
    aput-char v1, v0, p0

    .line 18
    .line 19
    const/4 p0, 0x3

    .line 20
    aput-char v1, v0, p0

    .line 21
    .line 22
    return-void
.end method

.method private _appendByte(IILcom/fasterxml/jackson/core/util/ByteArrayBuilder;I)I
    .locals 0

    .line 1
    invoke-virtual {p3, p4}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->setCurrentSegmentLength(I)V

    .line 2
    .line 3
    .line 4
    const/16 p0, 0x5c

    .line 5
    .line 6
    invoke-virtual {p3, p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 7
    .line 8
    .line 9
    if-gez p2, :cond_1

    .line 10
    .line 11
    const/16 p0, 0x75

    .line 12
    .line 13
    invoke-virtual {p3, p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 14
    .line 15
    .line 16
    const/16 p0, 0xff

    .line 17
    .line 18
    if-le p1, p0, :cond_0

    .line 19
    .line 20
    shr-int/lit8 p0, p1, 0x8

    .line 21
    .line 22
    sget-object p2, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HB:[B

    .line 23
    .line 24
    shr-int/lit8 p4, p1, 0xc

    .line 25
    .line 26
    aget-byte p4, p2, p4

    .line 27
    .line 28
    invoke-virtual {p3, p4}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 29
    .line 30
    .line 31
    and-int/lit8 p0, p0, 0xf

    .line 32
    .line 33
    aget-byte p0, p2, p0

    .line 34
    .line 35
    invoke-virtual {p3, p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 36
    .line 37
    .line 38
    and-int/lit16 p1, p1, 0xff

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/16 p0, 0x30

    .line 42
    .line 43
    invoke-virtual {p3, p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p3, p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 47
    .line 48
    .line 49
    :goto_0
    sget-object p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HB:[B

    .line 50
    .line 51
    shr-int/lit8 p2, p1, 0x4

    .line 52
    .line 53
    aget-byte p2, p0, p2

    .line 54
    .line 55
    invoke-virtual {p3, p2}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 56
    .line 57
    .line 58
    and-int/lit8 p1, p1, 0xf

    .line 59
    .line 60
    aget-byte p0, p0, p1

    .line 61
    .line 62
    invoke-virtual {p3, p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    int-to-byte p0, p2

    .line 67
    invoke-virtual {p3, p0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 68
    .line 69
    .line 70
    :goto_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->getCurrentSegmentLength()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0
.end method

.method private _appendNamed(I[C)I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    int-to-char p1, p1

    .line 3
    aput-char p1, p2, p0

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    return p0
.end method

.method private _appendNumeric(I[C)I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    const/16 v0, 0x75

    .line 3
    .line 4
    aput-char v0, p2, p0

    .line 5
    .line 6
    sget-object p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->HC:[C

    .line 7
    .line 8
    shr-int/lit8 v0, p1, 0x4

    .line 9
    .line 10
    aget-char v0, p0, v0

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    aput-char v0, p2, v1

    .line 14
    .line 15
    and-int/lit8 p1, p1, 0xf

    .line 16
    .line 17
    aget-char p0, p0, p1

    .line 18
    .line 19
    const/4 p1, 0x5

    .line 20
    aput-char p0, p2, p1

    .line 21
    .line 22
    const/4 p0, 0x6

    .line 23
    return p0
.end method

.method private static _convert(II)I
    .locals 3

    .line 1
    const v0, 0xdc00

    .line 2
    .line 3
    .line 4
    if-lt p1, v0, :cond_0

    .line 5
    .line 6
    const v1, 0xdfff

    .line 7
    .line 8
    .line 9
    if-gt p1, v1, :cond_0

    .line 10
    .line 11
    const v1, 0xd800

    .line 12
    .line 13
    .line 14
    sub-int/2addr p0, v1

    .line 15
    shl-int/lit8 p0, p0, 0xa

    .line 16
    .line 17
    const/high16 v1, 0x10000

    .line 18
    .line 19
    add-int/2addr p0, v1

    .line 20
    sub-int/2addr p1, v0

    .line 21
    add-int/2addr p0, p1

    .line 22
    return p0

    .line 23
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 24
    .line 25
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v2, "Broken surrogate pair: first char 0x"

    .line 36
    .line 37
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, ", second 0x"

    .line 44
    .line 45
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p0, "; illegal combination"

    .line 52
    .line 53
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw v0
.end method

.method private static _illegal(I)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/UTF8Writer;->illegalSurrogateDesc(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    throw v0
.end method

.method public static getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;
    .locals 3

    .line 1
    sget-object v0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_threadEncoder:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/ref/SoftReference;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    .line 18
    .line 19
    :goto_0
    if-nez v1, :cond_1

    .line 20
    .line 21
    new-instance v1, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    .line 22
    .line 23
    invoke-direct {v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ljava/lang/ref/SoftReference;

    .line 27
    .line 28
    invoke-direct {v2, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-object v1
.end method


# virtual methods
.method public encodeAsUTF8(Ljava/lang/String;)[B
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->resetAndGetFirstSegment()[B

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    array-length v3, v2

    .line 22
    const/4 v4, 0x0

    .line 23
    move v5, v4

    .line 24
    move v6, v5

    .line 25
    :goto_0
    if-ge v5, v1, :cond_f

    .line 26
    .line 27
    add-int/lit8 v7, v5, 0x1

    .line 28
    .line 29
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    :goto_1
    const/16 v8, 0x7f

    .line 34
    .line 35
    if-gt v5, v8, :cond_3

    .line 36
    .line 37
    if-lt v6, v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    array-length v3, v2

    .line 44
    move v6, v4

    .line 45
    :cond_1
    add-int/lit8 v8, v6, 0x1

    .line 46
    .line 47
    int-to-byte v5, v5

    .line 48
    aput-byte v5, v2, v6

    .line 49
    .line 50
    if-lt v7, v1, :cond_2

    .line 51
    .line 52
    move v6, v8

    .line 53
    goto/16 :goto_5

    .line 54
    .line 55
    :cond_2
    add-int/lit8 v5, v7, 0x1

    .line 56
    .line 57
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    move v7, v5

    .line 62
    move v5, v6

    .line 63
    move v6, v8

    .line 64
    goto :goto_1

    .line 65
    :cond_3
    if-lt v6, v3, :cond_4

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    array-length v3, v2

    .line 72
    move v6, v4

    .line 73
    :cond_4
    const/16 v8, 0x800

    .line 74
    .line 75
    if-ge v5, v8, :cond_5

    .line 76
    .line 77
    add-int/lit8 v8, v6, 0x1

    .line 78
    .line 79
    shr-int/lit8 v9, v5, 0x6

    .line 80
    .line 81
    or-int/lit16 v9, v9, 0xc0

    .line 82
    .line 83
    int-to-byte v9, v9

    .line 84
    aput-byte v9, v2, v6

    .line 85
    .line 86
    :goto_2
    move v6, v5

    .line 87
    move v5, v7

    .line 88
    goto/16 :goto_4

    .line 89
    .line 90
    :cond_5
    const v8, 0xd800

    .line 91
    .line 92
    .line 93
    if-lt v5, v8, :cond_c

    .line 94
    .line 95
    const v8, 0xdfff

    .line 96
    .line 97
    .line 98
    if-le v5, v8, :cond_6

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_6
    const v8, 0xdbff

    .line 102
    .line 103
    .line 104
    if-le v5, v8, :cond_7

    .line 105
    .line 106
    invoke-static {v5}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 107
    .line 108
    .line 109
    :cond_7
    if-lt v7, v1, :cond_8

    .line 110
    .line 111
    invoke-static {v5}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 112
    .line 113
    .line 114
    :cond_8
    add-int/lit8 v8, v7, 0x1

    .line 115
    .line 116
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    invoke-static {v5, v7}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_convert(II)I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    const v7, 0x10ffff

    .line 125
    .line 126
    .line 127
    if-le v5, v7, :cond_9

    .line 128
    .line 129
    invoke-static {v5}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 130
    .line 131
    .line 132
    :cond_9
    add-int/lit8 v7, v6, 0x1

    .line 133
    .line 134
    shr-int/lit8 v9, v5, 0x12

    .line 135
    .line 136
    or-int/lit16 v9, v9, 0xf0

    .line 137
    .line 138
    int-to-byte v9, v9

    .line 139
    aput-byte v9, v2, v6

    .line 140
    .line 141
    if-lt v7, v3, :cond_a

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    array-length v3, v2

    .line 148
    move v7, v4

    .line 149
    :cond_a
    add-int/lit8 v6, v7, 0x1

    .line 150
    .line 151
    shr-int/lit8 v9, v5, 0xc

    .line 152
    .line 153
    and-int/lit8 v9, v9, 0x3f

    .line 154
    .line 155
    or-int/lit16 v9, v9, 0x80

    .line 156
    .line 157
    int-to-byte v9, v9

    .line 158
    aput-byte v9, v2, v7

    .line 159
    .line 160
    if-lt v6, v3, :cond_b

    .line 161
    .line 162
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    array-length v3, v2

    .line 167
    move v6, v4

    .line 168
    :cond_b
    add-int/lit8 v7, v6, 0x1

    .line 169
    .line 170
    shr-int/lit8 v9, v5, 0x6

    .line 171
    .line 172
    and-int/lit8 v9, v9, 0x3f

    .line 173
    .line 174
    or-int/lit16 v9, v9, 0x80

    .line 175
    .line 176
    int-to-byte v9, v9

    .line 177
    aput-byte v9, v2, v6

    .line 178
    .line 179
    move v6, v5

    .line 180
    move v5, v8

    .line 181
    move v8, v7

    .line 182
    goto :goto_4

    .line 183
    :cond_c
    :goto_3
    add-int/lit8 v8, v6, 0x1

    .line 184
    .line 185
    shr-int/lit8 v9, v5, 0xc

    .line 186
    .line 187
    or-int/lit16 v9, v9, 0xe0

    .line 188
    .line 189
    int-to-byte v9, v9

    .line 190
    aput-byte v9, v2, v6

    .line 191
    .line 192
    if-lt v8, v3, :cond_d

    .line 193
    .line 194
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    array-length v3, v2

    .line 199
    move v8, v4

    .line 200
    :cond_d
    add-int/lit8 v6, v8, 0x1

    .line 201
    .line 202
    shr-int/lit8 v9, v5, 0x6

    .line 203
    .line 204
    and-int/lit8 v9, v9, 0x3f

    .line 205
    .line 206
    or-int/lit16 v9, v9, 0x80

    .line 207
    .line 208
    int-to-byte v9, v9

    .line 209
    aput-byte v9, v2, v8

    .line 210
    .line 211
    move v8, v6

    .line 212
    goto :goto_2

    .line 213
    :goto_4
    if-lt v8, v3, :cond_e

    .line 214
    .line 215
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    array-length v3, v2

    .line 220
    move v8, v4

    .line 221
    :cond_e
    add-int/lit8 v7, v8, 0x1

    .line 222
    .line 223
    and-int/lit8 v6, v6, 0x3f

    .line 224
    .line 225
    or-int/lit16 v6, v6, 0x80

    .line 226
    .line 227
    int-to-byte v6, v6

    .line 228
    aput-byte v6, v2, v8

    .line 229
    .line 230
    move v6, v7

    .line 231
    goto/16 :goto_0

    .line 232
    .line 233
    :cond_f
    :goto_5
    iget-object p0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 234
    .line 235
    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->completeAndCoalesce(I)[B

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    return-object p0
.end method

.method public quoteAsString(Ljava/lang/String;)[C
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_text:Lcom/fasterxml/jackson/core/util/TextBuffer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/fasterxml/jackson/core/util/TextBuffer;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_text:Lcom/fasterxml/jackson/core/util/TextBuffer;

    .line 12
    .line 13
    :cond_0
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->get7BitOutputEscapes()[I

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    array-length v3, v2

    .line 22
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/4 v5, 0x0

    .line 27
    move v6, v5

    .line 28
    move v7, v6

    .line 29
    :goto_0
    if-ge v6, v4, :cond_7

    .line 30
    .line 31
    :goto_1
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    .line 32
    .line 33
    .line 34
    move-result v8

    .line 35
    if-ge v8, v3, :cond_4

    .line 36
    .line 37
    aget v9, v2, v8

    .line 38
    .line 39
    if-eqz v9, :cond_4

    .line 40
    .line 41
    add-int/lit8 v8, v6, 0x1

    .line 42
    .line 43
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    aget v9, v2, v6

    .line 48
    .line 49
    iget-object v10, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    .line 50
    .line 51
    if-gez v9, :cond_1

    .line 52
    .line 53
    invoke-direct {p0, v6, v10}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_appendNumeric(I[C)I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    goto :goto_2

    .line 58
    :cond_1
    invoke-direct {p0, v9, v10}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_appendNamed(I[C)I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    :goto_2
    add-int v9, v7, v6

    .line 63
    .line 64
    array-length v10, v1

    .line 65
    if-le v9, v10, :cond_3

    .line 66
    .line 67
    array-length v9, v1

    .line 68
    sub-int/2addr v9, v7

    .line 69
    if-lez v9, :cond_2

    .line 70
    .line 71
    iget-object v10, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    .line 72
    .line 73
    invoke-static {v10, v5, v1, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 74
    .line 75
    .line 76
    :cond_2
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    sub-int/2addr v6, v9

    .line 81
    iget-object v7, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    .line 82
    .line 83
    invoke-static {v7, v9, v1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    .line 85
    .line 86
    move v7, v6

    .line 87
    goto :goto_3

    .line 88
    :cond_3
    iget-object v10, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_qbuf:[C

    .line 89
    .line 90
    invoke-static {v10, v5, v1, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    .line 92
    .line 93
    move v7, v9

    .line 94
    :goto_3
    move v6, v8

    .line 95
    goto :goto_0

    .line 96
    :cond_4
    array-length v9, v1

    .line 97
    if-lt v7, v9, :cond_5

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    move v7, v5

    .line 104
    :cond_5
    add-int/lit8 v9, v7, 0x1

    .line 105
    .line 106
    aput-char v8, v1, v7

    .line 107
    .line 108
    add-int/lit8 v6, v6, 0x1

    .line 109
    .line 110
    if-lt v6, v4, :cond_6

    .line 111
    .line 112
    move v7, v9

    .line 113
    goto :goto_4

    .line 114
    :cond_6
    move v7, v9

    .line 115
    goto :goto_1

    .line 116
    :cond_7
    :goto_4
    invoke-virtual {v0, v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsArray()[C

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0
.end method

.method public quoteAsUTF8(Ljava/lang/String;)[B
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->resetAndGetFirstSegment()[B

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const/4 v3, 0x0

    .line 22
    move v4, v3

    .line 23
    move v5, v4

    .line 24
    :goto_0
    if-ge v4, v1, :cond_11

    .line 25
    .line 26
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->get7BitOutputEscapes()[I

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    :goto_1
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    const/16 v8, 0x7f

    .line 35
    .line 36
    if-gt v7, v8, :cond_4

    .line 37
    .line 38
    aget v9, v6, v7

    .line 39
    .line 40
    if-eqz v9, :cond_1

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_1
    array-length v8, v2

    .line 44
    if-lt v5, v8, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    move v5, v3

    .line 51
    :cond_2
    add-int/lit8 v8, v5, 0x1

    .line 52
    .line 53
    int-to-byte v7, v7

    .line 54
    aput-byte v7, v2, v5

    .line 55
    .line 56
    add-int/lit8 v4, v4, 0x1

    .line 57
    .line 58
    if-lt v4, v1, :cond_3

    .line 59
    .line 60
    move v5, v8

    .line 61
    goto/16 :goto_7

    .line 62
    .line 63
    :cond_3
    move v5, v8

    .line 64
    goto :goto_1

    .line 65
    :cond_4
    :goto_2
    array-length v7, v2

    .line 66
    if-lt v5, v7, :cond_5

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    move v5, v3

    .line 73
    :cond_5
    add-int/lit8 v7, v4, 0x1

    .line 74
    .line 75
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 76
    .line 77
    .line 78
    move-result v9

    .line 79
    if-gt v9, v8, :cond_6

    .line 80
    .line 81
    aget v2, v6, v9

    .line 82
    .line 83
    invoke-direct {p0, v9, v2, v0, v5}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_appendByte(IILcom/fasterxml/jackson/core/util/ByteArrayBuilder;I)I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->getCurrentSegment()[B

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    :goto_3
    move v4, v7

    .line 92
    goto :goto_0

    .line 93
    :cond_6
    const/16 v6, 0x7ff

    .line 94
    .line 95
    if-gt v9, v6, :cond_7

    .line 96
    .line 97
    add-int/lit8 v4, v5, 0x1

    .line 98
    .line 99
    shr-int/lit8 v6, v9, 0x6

    .line 100
    .line 101
    or-int/lit16 v6, v6, 0xc0

    .line 102
    .line 103
    int-to-byte v6, v6

    .line 104
    aput-byte v6, v2, v5

    .line 105
    .line 106
    and-int/lit8 v5, v9, 0x3f

    .line 107
    .line 108
    or-int/lit16 v5, v5, 0x80

    .line 109
    .line 110
    goto/16 :goto_6

    .line 111
    .line 112
    :cond_7
    const v6, 0xd800

    .line 113
    .line 114
    .line 115
    if-lt v9, v6, :cond_e

    .line 116
    .line 117
    const v6, 0xdfff

    .line 118
    .line 119
    .line 120
    if-le v9, v6, :cond_8

    .line 121
    .line 122
    goto :goto_5

    .line 123
    :cond_8
    const v6, 0xdbff

    .line 124
    .line 125
    .line 126
    if-le v9, v6, :cond_9

    .line 127
    .line 128
    invoke-static {v9}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 129
    .line 130
    .line 131
    :cond_9
    if-lt v7, v1, :cond_a

    .line 132
    .line 133
    invoke-static {v9}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 134
    .line 135
    .line 136
    :cond_a
    add-int/lit8 v4, v4, 0x2

    .line 137
    .line 138
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    .line 139
    .line 140
    .line 141
    move-result v6

    .line 142
    invoke-static {v9, v6}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_convert(II)I

    .line 143
    .line 144
    .line 145
    move-result v6

    .line 146
    const v7, 0x10ffff

    .line 147
    .line 148
    .line 149
    if-le v6, v7, :cond_b

    .line 150
    .line 151
    invoke-static {v6}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_illegal(I)V

    .line 152
    .line 153
    .line 154
    :cond_b
    add-int/lit8 v7, v5, 0x1

    .line 155
    .line 156
    shr-int/lit8 v8, v6, 0x12

    .line 157
    .line 158
    or-int/lit16 v8, v8, 0xf0

    .line 159
    .line 160
    int-to-byte v8, v8

    .line 161
    aput-byte v8, v2, v5

    .line 162
    .line 163
    array-length v5, v2

    .line 164
    if-lt v7, v5, :cond_c

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    move v7, v3

    .line 171
    :cond_c
    add-int/lit8 v5, v7, 0x1

    .line 172
    .line 173
    shr-int/lit8 v8, v6, 0xc

    .line 174
    .line 175
    and-int/lit8 v8, v8, 0x3f

    .line 176
    .line 177
    or-int/lit16 v8, v8, 0x80

    .line 178
    .line 179
    int-to-byte v8, v8

    .line 180
    aput-byte v8, v2, v7

    .line 181
    .line 182
    array-length v7, v2

    .line 183
    if-lt v5, v7, :cond_d

    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    move v5, v3

    .line 190
    :cond_d
    add-int/lit8 v7, v5, 0x1

    .line 191
    .line 192
    shr-int/lit8 v8, v6, 0x6

    .line 193
    .line 194
    and-int/lit8 v8, v8, 0x3f

    .line 195
    .line 196
    or-int/lit16 v8, v8, 0x80

    .line 197
    .line 198
    int-to-byte v8, v8

    .line 199
    aput-byte v8, v2, v5

    .line 200
    .line 201
    and-int/lit8 v5, v6, 0x3f

    .line 202
    .line 203
    or-int/lit16 v5, v5, 0x80

    .line 204
    .line 205
    move v10, v7

    .line 206
    move v7, v4

    .line 207
    :goto_4
    move v4, v10

    .line 208
    goto :goto_6

    .line 209
    :cond_e
    :goto_5
    add-int/lit8 v4, v5, 0x1

    .line 210
    .line 211
    shr-int/lit8 v6, v9, 0xc

    .line 212
    .line 213
    or-int/lit16 v6, v6, 0xe0

    .line 214
    .line 215
    int-to-byte v6, v6

    .line 216
    aput-byte v6, v2, v5

    .line 217
    .line 218
    array-length v5, v2

    .line 219
    if-lt v4, v5, :cond_f

    .line 220
    .line 221
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    move v4, v3

    .line 226
    :cond_f
    add-int/lit8 v5, v4, 0x1

    .line 227
    .line 228
    shr-int/lit8 v6, v9, 0x6

    .line 229
    .line 230
    and-int/lit8 v6, v6, 0x3f

    .line 231
    .line 232
    or-int/lit16 v6, v6, 0x80

    .line 233
    .line 234
    int-to-byte v6, v6

    .line 235
    aput-byte v6, v2, v4

    .line 236
    .line 237
    and-int/lit8 v4, v9, 0x3f

    .line 238
    .line 239
    or-int/lit16 v4, v4, 0x80

    .line 240
    .line 241
    move v10, v5

    .line 242
    move v5, v4

    .line 243
    goto :goto_4

    .line 244
    :goto_6
    array-length v6, v2

    .line 245
    if-lt v4, v6, :cond_10

    .line 246
    .line 247
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->finishCurrentSegment()[B

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    move v4, v3

    .line 252
    :cond_10
    add-int/lit8 v6, v4, 0x1

    .line 253
    .line 254
    int-to-byte v5, v5

    .line 255
    aput-byte v5, v2, v4

    .line 256
    .line 257
    move v5, v6

    .line 258
    goto/16 :goto_3

    .line 259
    .line 260
    :cond_11
    :goto_7
    iget-object p0, p0, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->_bytes:Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    .line 261
    .line 262
    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->completeAndCoalesce(I)[B

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    return-object p0
.end method
