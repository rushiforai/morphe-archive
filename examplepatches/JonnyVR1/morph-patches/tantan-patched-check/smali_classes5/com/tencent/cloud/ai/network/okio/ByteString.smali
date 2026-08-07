.class public Lcom/tencent/cloud/ai/network/okio/ByteString;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Comparable<",
        "Lcom/tencent/cloud/ai/network/okio/ByteString;",
        ">;"
    }
.end annotation


# static fields
.field public static final EMPTY:Lcom/tencent/cloud/ai/network/okio/ByteString;

.field public static final d:[C


# instance fields
.field public final a:[B

.field public transient b:I

.field public transient c:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [C

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/tencent/cloud/ai/network/okio/ByteString;->d:[C

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    new-array v0, v0, [B

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->of([B)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/tencent/cloud/ai/network/okio/ByteString;->EMPTY:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>([B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 5
    .line 6
    return-void
.end method

.method public static a(C)I
    .locals 2

    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v1, 0x39

    if-gt p0, v1, :cond_0

    sub-int/2addr p0, v0

    return p0

    :cond_0
    const/16 v0, 0x61

    if-lt p0, v0, :cond_1

    const/16 v0, 0x66

    if-gt p0, v0, :cond_1

    add-int/lit8 p0, p0, -0x57

    return p0

    :cond_1
    const/16 v0, 0x41

    if-lt p0, v0, :cond_2

    const/16 v0, 0x46

    if-gt p0, v0, :cond_2

    add-int/lit8 p0, p0, -0x37

    return p0

    .line 43
    :cond_2
    const-string v0, "Unexpected hex digit: "

    invoke-static {v0, p0}, Ll/tr3;->a(Ljava/lang/String;I)V

    const/4 p0, 0x0

    return p0
.end method

.method public static decodeBase64(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    if-eqz v0, :cond_11

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    :goto_0
    const/16 v3, 0x9

    .line 10
    .line 11
    const/16 v4, 0x20

    .line 12
    .line 13
    const/16 v5, 0xd

    .line 14
    .line 15
    const/16 v6, 0xa

    .line 16
    .line 17
    if-lez v2, :cond_1

    .line 18
    .line 19
    add-int/lit8 v7, v2, -0x1

    .line 20
    .line 21
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result v7

    .line 25
    const/16 v8, 0x3d

    .line 26
    .line 27
    if-eq v7, v8, :cond_0

    .line 28
    .line 29
    if-eq v7, v6, :cond_0

    .line 30
    .line 31
    if-eq v7, v5, :cond_0

    .line 32
    .line 33
    if-eq v7, v4, :cond_0

    .line 34
    .line 35
    if-eq v7, v3, :cond_0

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    add-int/lit8 v2, v2, -0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    :goto_1
    int-to-long v7, v2

    .line 42
    const-wide/16 v9, 0x6

    .line 43
    .line 44
    mul-long/2addr v7, v9

    .line 45
    const-wide/16 v9, 0x8

    .line 46
    .line 47
    div-long/2addr v7, v9

    .line 48
    long-to-int v7, v7

    .line 49
    new-array v8, v7, [B

    .line 50
    .line 51
    const/4 v9, 0x0

    .line 52
    move v10, v9

    .line 53
    move v11, v10

    .line 54
    move v12, v11

    .line 55
    move v13, v12

    .line 56
    :goto_2
    if-ge v10, v2, :cond_b

    .line 57
    .line 58
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    .line 59
    .line 60
    .line 61
    move-result v14

    .line 62
    const/16 v15, 0x41

    .line 63
    .line 64
    if-lt v14, v15, :cond_2

    .line 65
    .line 66
    const/16 v15, 0x5a

    .line 67
    .line 68
    if-gt v14, v15, :cond_2

    .line 69
    .line 70
    add-int/lit8 v14, v14, -0x41

    .line 71
    .line 72
    goto :goto_6

    .line 73
    :cond_2
    const/16 v15, 0x61

    .line 74
    .line 75
    if-lt v14, v15, :cond_3

    .line 76
    .line 77
    const/16 v15, 0x7a

    .line 78
    .line 79
    if-gt v14, v15, :cond_3

    .line 80
    .line 81
    add-int/lit8 v14, v14, -0x47

    .line 82
    .line 83
    goto :goto_6

    .line 84
    :cond_3
    const/16 v15, 0x30

    .line 85
    .line 86
    if-lt v14, v15, :cond_4

    .line 87
    .line 88
    const/16 v15, 0x39

    .line 89
    .line 90
    if-gt v14, v15, :cond_4

    .line 91
    .line 92
    add-int/lit8 v14, v14, 0x4

    .line 93
    .line 94
    goto :goto_6

    .line 95
    :cond_4
    const/16 v15, 0x2b

    .line 96
    .line 97
    if-eq v14, v15, :cond_a

    .line 98
    .line 99
    const/16 v15, 0x2d

    .line 100
    .line 101
    if-ne v14, v15, :cond_5

    .line 102
    .line 103
    goto :goto_5

    .line 104
    :cond_5
    const/16 v15, 0x2f

    .line 105
    .line 106
    if-eq v14, v15, :cond_9

    .line 107
    .line 108
    const/16 v15, 0x5f

    .line 109
    .line 110
    if-ne v14, v15, :cond_6

    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_6
    if-eq v14, v6, :cond_8

    .line 114
    .line 115
    if-eq v14, v5, :cond_8

    .line 116
    .line 117
    if-eq v14, v4, :cond_8

    .line 118
    .line 119
    if-ne v14, v3, :cond_7

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_7
    const/16 v16, 0x0

    .line 123
    .line 124
    goto :goto_8

    .line 125
    :cond_8
    :goto_3
    const/16 v16, 0x0

    .line 126
    .line 127
    goto :goto_7

    .line 128
    :cond_9
    :goto_4
    const/16 v14, 0x3f

    .line 129
    .line 130
    goto :goto_6

    .line 131
    :cond_a
    :goto_5
    const/16 v14, 0x3e

    .line 132
    .line 133
    :goto_6
    shl-int/lit8 v13, v13, 0x6

    .line 134
    .line 135
    int-to-byte v14, v14

    .line 136
    or-int/2addr v13, v14

    .line 137
    add-int/lit8 v11, v11, 0x1

    .line 138
    .line 139
    rem-int/lit8 v14, v11, 0x4

    .line 140
    .line 141
    if-nez v14, :cond_8

    .line 142
    .line 143
    add-int/lit8 v14, v12, 0x1

    .line 144
    .line 145
    shr-int/lit8 v15, v13, 0x10

    .line 146
    .line 147
    int-to-byte v15, v15

    .line 148
    aput-byte v15, v8, v12

    .line 149
    .line 150
    add-int/lit8 v15, v12, 0x2

    .line 151
    .line 152
    const/16 v16, 0x0

    .line 153
    .line 154
    shr-int/lit8 v1, v13, 0x8

    .line 155
    .line 156
    int-to-byte v1, v1

    .line 157
    aput-byte v1, v8, v14

    .line 158
    .line 159
    add-int/lit8 v12, v12, 0x3

    .line 160
    .line 161
    int-to-byte v1, v13

    .line 162
    aput-byte v1, v8, v15

    .line 163
    .line 164
    :goto_7
    add-int/lit8 v10, v10, 0x1

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_b
    const/16 v16, 0x0

    .line 168
    .line 169
    rem-int/lit8 v11, v11, 0x4

    .line 170
    .line 171
    const/4 v0, 0x1

    .line 172
    if-ne v11, v0, :cond_c

    .line 173
    .line 174
    :goto_8
    move-object/from16 v8, v16

    .line 175
    .line 176
    goto :goto_a

    .line 177
    :cond_c
    const/4 v0, 0x2

    .line 178
    if-ne v11, v0, :cond_d

    .line 179
    .line 180
    shl-int/lit8 v0, v13, 0xc

    .line 181
    .line 182
    add-int/lit8 v1, v12, 0x1

    .line 183
    .line 184
    shr-int/lit8 v0, v0, 0x10

    .line 185
    .line 186
    int-to-byte v0, v0

    .line 187
    aput-byte v0, v8, v12

    .line 188
    .line 189
    move v12, v1

    .line 190
    goto :goto_9

    .line 191
    :cond_d
    const/4 v0, 0x3

    .line 192
    if-ne v11, v0, :cond_e

    .line 193
    .line 194
    shl-int/lit8 v0, v13, 0x6

    .line 195
    .line 196
    add-int/lit8 v1, v12, 0x1

    .line 197
    .line 198
    shr-int/lit8 v2, v0, 0x10

    .line 199
    .line 200
    int-to-byte v2, v2

    .line 201
    aput-byte v2, v8, v12

    .line 202
    .line 203
    add-int/lit8 v12, v12, 0x2

    .line 204
    .line 205
    shr-int/lit8 v0, v0, 0x8

    .line 206
    .line 207
    int-to-byte v0, v0

    .line 208
    aput-byte v0, v8, v1

    .line 209
    .line 210
    :cond_e
    :goto_9
    if-ne v12, v7, :cond_f

    .line 211
    .line 212
    goto :goto_a

    .line 213
    :cond_f
    new-array v0, v12, [B

    .line 214
    .line 215
    invoke-static {v8, v9, v0, v9, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 216
    .line 217
    .line 218
    move-object v8, v0

    .line 219
    :goto_a
    if-eqz v8, :cond_10

    .line 220
    .line 221
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 222
    .line 223
    invoke-direct {v0, v8}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 224
    .line 225
    .line 226
    return-object v0

    .line 227
    :cond_10
    return-object v16

    .line 228
    :cond_11
    const/16 v16, 0x0

    .line 229
    .line 230
    const-string v0, "base64 == null"

    .line 231
    .line 232
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    return-object v16
.end method

.method public static decodeHex(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    rem-int/lit8 v1, v1, 0x2

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    div-int/lit8 v0, v0, 0x2

    .line 17
    .line 18
    new-array v1, v0, [B

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    if-ge v2, v0, :cond_0

    .line 22
    .line 23
    mul-int/lit8 v3, v2, 0x2

    .line 24
    .line 25
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a(C)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    shl-int/lit8 v4, v4, 0x4

    .line 34
    .line 35
    add-int/lit8 v3, v3, 0x1

    .line 36
    .line 37
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a(C)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    add-int/2addr v4, v3

    .line 46
    int-to-byte v3, v4

    .line 47
    aput-byte v3, v1, v2

    .line 48
    .line 49
    add-int/lit8 v2, v2, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->of([B)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_1
    const-string v1, "Unexpected hex string: "

    .line 58
    .line 59
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-object v0

    .line 67
    :cond_2
    const-string p0, "hex == null"

    .line 68
    .line 69
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-object v0
.end method

.method public static encodeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    const-string p0, "charset == null"

    .line 17
    .line 18
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    const-string p0, "s == null"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public static encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    sget-object v1, Lcom/tencent/cloud/ai/network/okio/y;->a:Ljava/nio/charset/Charset;

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 12
    .line 13
    .line 14
    iput-object p0, v0, Lcom/tencent/cloud/ai/network/okio/ByteString;->c:Ljava/lang/String;

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    const-string p0, "s == null"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public static of(Ljava/nio/ByteBuffer;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    if-eqz p0, :cond_0

    .line 31
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    .line 32
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 33
    new-instance p0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-direct {p0, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    return-object p0

    .line 34
    :cond_0
    const-string p0, "data == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static varargs of([B)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    if-eqz p0, :cond_0

    .line 29
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-virtual {p0}, [B->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [B

    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    return-object v0

    .line 30
    :cond_0
    const-string p0, "data == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static of([BII)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 7

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    int-to-long v1, v0

    .line 5
    int-to-long v3, p1

    .line 6
    int-to-long v5, p2

    .line 7
    invoke-static/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    .line 8
    .line 9
    .line 10
    new-array v0, p2, [B

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {p0, p1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 19
    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "data == null"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public static read(Ljava/io/InputStream;I)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    if-ltz p1, :cond_2

    .line 5
    .line 6
    new-array v1, p1, [B

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    if-ge v2, p1, :cond_1

    .line 10
    .line 11
    sub-int v3, p1, v2

    .line 12
    .line 13
    invoke-virtual {p0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/4 v4, -0x1

    .line 18
    if-eq v3, v4, :cond_0

    .line 19
    .line 20
    add-int/2addr v2, v3

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 23
    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    new-instance p0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 27
    .line 28
    invoke-direct {p0, v1}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 29
    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    const-string p0, "byteCount < 0: "

    .line 33
    .line 34
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_3
    const-string p0, "in == null"

    .line 39
    .line 40
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 0

    .line 41
    :try_start_0
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    invoke-virtual {p1, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->of([B)Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 42
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final a(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {p1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->toByteArray()[B

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-direct {v2, p2, p1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Ljavax/crypto/Mac;->doFinal([B)[B

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->of([B)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 25
    .line 26
    .line 27
    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return-object p0

    .line 29
    :catch_0
    move-exception p0

    .line 30
    goto :goto_0

    .line 31
    :catch_1
    move-exception p0

    .line 32
    goto :goto_1

    .line 33
    :goto_0
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :goto_1
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/e;)V
    .locals 2

    .line 45
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    array-length v0, p0

    const/4 v1, 0x0

    invoke-virtual {p1, p0, v1, v0}, Lcom/tencent/cloud/ai/network/okio/e;->b([BII)Lcom/tencent/cloud/ai/network/okio/e;

    return-void
.end method

.method public a()[B
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    return-object p0
.end method

.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 2
    .line 3
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public base64()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 2
    .line 3
    sget-object v0, Lcom/tencent/cloud/ai/network/okio/d;->a:[B

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/cloud/ai/network/okio/d;->a([B[B)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public base64Url()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 2
    .line 3
    sget-object v0, Lcom/tencent/cloud/ai/network/okio/d;->b:[B

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/cloud/ai/network/okio/d;->a([B[B)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public compareTo(Lcom/tencent/cloud/ai/network/okio/ByteString;)I
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    move v4, v3

    .line 15
    :goto_0
    const/4 v5, -0x1

    .line 16
    const/4 v6, 0x1

    .line 17
    if-ge v4, v2, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, v4}, Lcom/tencent/cloud/ai/network/okio/ByteString;->getByte(I)B

    .line 20
    .line 21
    .line 22
    move-result v7

    .line 23
    and-int/lit16 v7, v7, 0xff

    .line 24
    .line 25
    invoke-virtual {p1, v4}, Lcom/tencent/cloud/ai/network/okio/ByteString;->getByte(I)B

    .line 26
    .line 27
    .line 28
    move-result v8

    .line 29
    and-int/lit16 v8, v8, 0xff

    .line 30
    .line 31
    if-ne v7, v8, :cond_0

    .line 32
    .line 33
    add-int/lit8 v4, v4, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    if-ge v7, v8, :cond_1

    .line 37
    .line 38
    return v5

    .line 39
    :cond_1
    return v6

    .line 40
    :cond_2
    if-ne v0, v1, :cond_3

    .line 41
    .line 42
    return v3

    .line 43
    :cond_3
    if-ge v0, v1, :cond_4

    .line 44
    .line 45
    return v5

    .line 46
    :cond_4
    return v6
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 47
    check-cast p1, Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->compareTo(Lcom/tencent/cloud/ai/network/okio/ByteString;)I

    move-result p0

    return p0
.end method

.method public final endsWith(Lcom/tencent/cloud/ai/network/okio/ByteString;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {p0, v0, p1, v2, v1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->rangeEquals(ILcom/tencent/cloud/ai/network/okio/ByteString;II)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final endsWith([B)Z
    .locals 3

    .line 20
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v0

    array-length v1, p1

    sub-int/2addr v0, v1

    array-length v1, p1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, p1, v2, v1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->rangeEquals(I[BII)Z

    move-result p0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    check-cast p1, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 17
    .line 18
    array-length v3, p0

    .line 19
    if-ne v1, v3, :cond_1

    .line 20
    .line 21
    array-length v1, p0

    .line 22
    invoke-virtual {p1, v2, p0, v2, v1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->rangeEquals(I[BII)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    return v0

    .line 29
    :cond_1
    return v2
.end method

.method public getByte(I)B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 2
    .line 3
    aget-byte p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->b:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 7
    .line 8
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->b:I

    .line 13
    .line 14
    return v0
.end method

.method public hex()Ljava/lang/String;
    .locals 8

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    mul-int/lit8 v0, v0, 0x2

    .line 5
    .line 6
    new-array v0, v0, [C

    .line 7
    .line 8
    array-length v1, p0

    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    if-ge v2, v1, :cond_0

    .line 12
    .line 13
    aget-byte v4, p0, v2

    .line 14
    .line 15
    add-int/lit8 v5, v3, 0x1

    .line 16
    .line 17
    sget-object v6, Lcom/tencent/cloud/ai/network/okio/ByteString;->d:[C

    .line 18
    .line 19
    shr-int/lit8 v7, v4, 0x4

    .line 20
    .line 21
    and-int/lit8 v7, v7, 0xf

    .line 22
    .line 23
    aget-char v7, v6, v7

    .line 24
    .line 25
    aput-char v7, v0, v3

    .line 26
    .line 27
    add-int/lit8 v3, v3, 0x2

    .line 28
    .line 29
    and-int/lit8 v4, v4, 0xf

    .line 30
    .line 31
    aget-char v4, v6, v4

    .line 32
    .line 33
    aput-char v4, v0, v5

    .line 34
    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    new-instance p0, Ljava/lang/String;

    .line 39
    .line 40
    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    .line 41
    .line 42
    .line 43
    return-object p0
.end method

.method public hmacSha1(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 1
    const-string v0, "HmacSHA1"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hmacSha256(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 1
    const-string v0, "HmacSHA256"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hmacSha512(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 1
    const-string v0, "HmacSHA512"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final indexOf(Lcom/tencent/cloud/ai/network/okio/ByteString;)I
    .locals 1

    .line 30
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a()[B

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->indexOf([BI)I

    move-result p0

    return p0
.end method

.method public final indexOf(Lcom/tencent/cloud/ai/network/okio/ByteString;I)I
    .locals 0

    .line 28
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a()[B

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->indexOf([BI)I

    move-result p0

    return p0
.end method

.method public final indexOf([B)I
    .locals 1

    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->indexOf([BI)I

    move-result p0

    return p0
.end method

.method public indexOf([BI)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 7
    .line 8
    array-length v1, v1

    .line 9
    array-length v2, p1

    .line 10
    sub-int/2addr v1, v2

    .line 11
    :goto_0
    if-gt p2, v1, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 14
    .line 15
    array-length v3, p1

    .line 16
    invoke-static {v2, p2, p1, v0, v3}, Lcom/tencent/cloud/ai/network/okio/y;->a([BI[BII)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    return p2

    .line 23
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p0, -0x1

    .line 27
    return p0
.end method

.method public final lastIndexOf(Lcom/tencent/cloud/ai/network/okio/ByteString;)I
    .locals 1

    .line 30
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a()[B

    move-result-object p1

    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->lastIndexOf([BI)I

    move-result p0

    return p0
.end method

.method public final lastIndexOf(Lcom/tencent/cloud/ai/network/okio/ByteString;I)I
    .locals 0

    .line 28
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a()[B

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->lastIndexOf([BI)I

    move-result p0

    return p0
.end method

.method public final lastIndexOf([B)I
    .locals 1

    .line 29
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->lastIndexOf([BI)I

    move-result p0

    return p0
.end method

.method public lastIndexOf([BI)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    array-length v1, p1

    .line 5
    sub-int/2addr v0, v1

    .line 6
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    :goto_0
    if-ltz p2, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 13
    .line 14
    array-length v1, p1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {v0, p2, p1, v2, v1}, Lcom/tencent/cloud/ai/network/okio/y;->a([BI[BII)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return p2

    .line 23
    :cond_0
    add-int/lit8 p2, p2, -0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p0, -0x1

    .line 27
    return p0
.end method

.method public md5()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 1
    const-string v0, "MD5"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public rangeEquals(ILcom/tencent/cloud/ai/network/okio/ByteString;II)Z
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    invoke-virtual {p2, p3, p0, p1, p4}, Lcom/tencent/cloud/ai/network/okio/ByteString;->rangeEquals(I[BII)Z

    move-result p0

    return p0
.end method

.method public rangeEquals(I[BII)Z
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 4
    .line 5
    array-length v0, p0

    .line 6
    sub-int/2addr v0, p4

    .line 7
    if-gt p1, v0, :cond_0

    .line 8
    .line 9
    if-ltz p3, :cond_0

    .line 10
    .line 11
    array-length v0, p2

    .line 12
    sub-int/2addr v0, p4

    .line 13
    if-gt p3, v0, :cond_0

    .line 14
    .line 15
    invoke-static {p0, p1, p2, p3, p4}, Lcom/tencent/cloud/ai/network/okio/y;->a([BI[BII)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public sha1()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 1
    const-string v0, "SHA-1"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public sha256()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 1
    const-string v0, "SHA-256"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public sha512()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 1
    const-string v0, "SHA-512"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public final startsWith(Lcom/tencent/cloud/ai/network/okio/ByteString;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v1, p1, v1, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->rangeEquals(ILcom/tencent/cloud/ai/network/okio/ByteString;II)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final startsWith([B)Z
    .locals 2

    .line 11
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1, v1, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->rangeEquals(I[BII)Z

    move-result p0

    return p0
.end method

.method public string(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    const-string p0, "charset == null"

    .line 12
    .line 13
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public substring(I)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    array-length v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->substring(II)Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public substring(II)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_3

    .line 3
    .line 4
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 5
    .line 6
    array-length v2, v1

    .line 7
    if-gt p2, v2, :cond_2

    .line 8
    .line 9
    sub-int v2, p2, p1

    .line 10
    .line 11
    if-ltz v2, :cond_1

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    array-length v0, v1

    .line 16
    if-ne p2, v0, :cond_0

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    new-array p0, v2, [B

    .line 20
    .line 21
    const/4 p2, 0x0

    .line 22
    invoke-static {v1, p1, p0, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 28
    .line 29
    .line 30
    return-object p1

    .line 31
    :cond_1
    const-string p0, "endIndex < beginIndex"

    .line 32
    .line 33
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :cond_2
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 38
    .line 39
    array-length p0, p0

    .line 40
    const-string p1, ")"

    .line 41
    .line 42
    const-string p2, "endIndex > length("

    .line 43
    .line 44
    invoke-static {p2, p0, p1}, Ll/vic0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_3
    const-string p0, "beginIndex < 0"

    .line 49
    .line 50
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-object v0
.end method

.method public toAsciiLowercase()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_5

    .line 6
    .line 7
    aget-byte v2, v1, v0

    .line 8
    .line 9
    const/16 v3, 0x41

    .line 10
    .line 11
    if-lt v2, v3, :cond_4

    .line 12
    .line 13
    const/16 v4, 0x5a

    .line 14
    .line 15
    if-le v2, v4, :cond_0

    .line 16
    .line 17
    goto :goto_3

    .line 18
    :cond_0
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, [B

    .line 23
    .line 24
    add-int/lit8 v1, v0, 0x1

    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x20

    .line 27
    .line 28
    int-to-byte v2, v2

    .line 29
    aput-byte v2, p0, v0

    .line 30
    .line 31
    :goto_1
    array-length v0, p0

    .line 32
    if-ge v1, v0, :cond_3

    .line 33
    .line 34
    aget-byte v0, p0, v1

    .line 35
    .line 36
    if-lt v0, v3, :cond_2

    .line 37
    .line 38
    if-le v0, v4, :cond_1

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_1
    add-int/lit8 v0, v0, 0x20

    .line 42
    .line 43
    int-to-byte v0, v0

    .line 44
    aput-byte v0, p0, v1

    .line 45
    .line 46
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_3
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 52
    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_4
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_5
    return-object p0
.end method

.method public toAsciiUppercase()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_5

    .line 6
    .line 7
    aget-byte v2, v1, v0

    .line 8
    .line 9
    const/16 v3, 0x61

    .line 10
    .line 11
    if-lt v2, v3, :cond_4

    .line 12
    .line 13
    const/16 v4, 0x7a

    .line 14
    .line 15
    if-le v2, v4, :cond_0

    .line 16
    .line 17
    goto :goto_3

    .line 18
    :cond_0
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, [B

    .line 23
    .line 24
    add-int/lit8 v1, v0, 0x1

    .line 25
    .line 26
    add-int/lit8 v2, v2, -0x20

    .line 27
    .line 28
    int-to-byte v2, v2

    .line 29
    aput-byte v2, p0, v0

    .line 30
    .line 31
    :goto_1
    array-length v0, p0

    .line 32
    if-ge v1, v0, :cond_3

    .line 33
    .line 34
    aget-byte v0, p0, v1

    .line 35
    .line 36
    if-lt v0, v3, :cond_2

    .line 37
    .line 38
    if-le v0, v4, :cond_1

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_1
    add-int/lit8 v0, v0, -0x20

    .line 42
    .line 43
    int-to-byte v0, v0

    .line 44
    aput-byte v0, p0, v1

    .line 45
    .line 46
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_3
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 52
    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_4
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_5
    return-object p0
.end method

.method public toByteArray()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 2
    .line 3
    invoke-virtual {p0}, [B->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, [B

    .line 8
    .line 9
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string p0, "[size=0]"

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->utf8()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    move v3, v2

    .line 19
    move v4, v3

    .line 20
    :goto_0
    const/4 v5, -0x1

    .line 21
    const/16 v6, 0x40

    .line 22
    .line 23
    if-ge v3, v1, :cond_5

    .line 24
    .line 25
    if-ne v4, v6, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/String;->codePointAt(I)I

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    invoke-static {v7}, Ljava/lang/Character;->isISOControl(I)Z

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    if-eqz v8, :cond_2

    .line 37
    .line 38
    const/16 v8, 0xa

    .line 39
    .line 40
    if-eq v7, v8, :cond_2

    .line 41
    .line 42
    const/16 v8, 0xd

    .line 43
    .line 44
    if-ne v7, v8, :cond_3

    .line 45
    .line 46
    :cond_2
    const v8, 0xfffd

    .line 47
    .line 48
    .line 49
    if-ne v7, v8, :cond_4

    .line 50
    .line 51
    :cond_3
    move v3, v5

    .line 52
    goto :goto_1

    .line 53
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 54
    .line 55
    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    add-int/2addr v3, v5

    .line 60
    goto :goto_0

    .line 61
    :cond_5
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    :goto_1
    const-string v1, "\u2026]"

    .line 66
    .line 67
    const-string v4, "[size="

    .line 68
    .line 69
    const-string v7, "]"

    .line 70
    .line 71
    if-ne v3, v5, :cond_7

    .line 72
    .line 73
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 74
    .line 75
    array-length v0, v0

    .line 76
    if-gt v0, v6, :cond_6

    .line 77
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v1, "[hex="

    .line 81
    .line 82
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->hex()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 106
    .line 107
    array-length v3, v3

    .line 108
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v3, " hex="

    .line 112
    .line 113
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v2, v6}, Lcom/tencent/cloud/ai/network/okio/ByteString;->substring(II)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->hex()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    return-object p0

    .line 135
    :cond_7
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    const-string v5, "\\"

    .line 140
    .line 141
    const-string v6, "\\\\"

    .line 142
    .line 143
    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    const-string v5, "\n"

    .line 148
    .line 149
    const-string v6, "\\n"

    .line 150
    .line 151
    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    const-string v5, "\r"

    .line 156
    .line 157
    const-string v6, "\\r"

    .line 158
    .line 159
    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-ge v3, v0, :cond_8

    .line 168
    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 175
    .line 176
    array-length p0, p0

    .line 177
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    const-string p0, " text="

    .line 181
    .line 182
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    return-object p0

    .line 196
    :cond_8
    new-instance p0, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    const-string v0, "[text="

    .line 199
    .line 200
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    return-object p0
.end method

.method public utf8()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 9
    .line 10
    sget-object v2, Lcom/tencent/cloud/ai/network/okio/y;->a:Ljava/nio/charset/Charset;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->c:Ljava/lang/String;

    .line 16
    .line 17
    return-object v0
.end method

.method public write(Ljava/io/OutputStream;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->a:[B

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "out == null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
