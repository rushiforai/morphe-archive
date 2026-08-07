.class final Lcom/momo/xengine/mestatistics/Base64;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final legalChars:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/momo/xengine/mestatistics/Base64;->legalChars:[C

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static decode(C)I
    .locals 3

    const/16 v0, 0x41

    if-lt p0, v0, :cond_0

    const/16 v1, 0x5a

    if-gt p0, v1, :cond_0

    sub-int/2addr p0, v0

    return p0

    :cond_0
    const/16 v0, 0x61

    if-lt p0, v0, :cond_1

    const/16 v0, 0x7a

    if-gt p0, v0, :cond_1

    add-int/lit8 p0, p0, -0x47

    return p0

    :cond_1
    const/16 v0, 0x30

    if-lt p0, v0, :cond_2

    const/16 v0, 0x39

    if-gt p0, v0, :cond_2

    add-int/lit8 p0, p0, 0x4

    return p0

    :cond_2
    const/16 v0, 0x2b

    if-eq p0, v0, :cond_5

    const/16 v0, 0x2f

    if-eq p0, v0, :cond_4

    const/16 v0, 0x3d

    if-ne p0, v0, :cond_3

    const/4 p0, 0x0

    return p0

    .line 113
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "unexpected code: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    const/16 p0, 0x3f

    return p0

    :cond_5
    const/16 p0, 0x3e

    return p0
.end method

.method private static decode(Ljava/lang/String;Ljava/io/OutputStream;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/16 v3, 0x20

    .line 13
    .line 14
    if-gt v2, v3, :cond_0

    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    if-ne v1, v0, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-static {v2}, Lcom/momo/xengine/mestatistics/Base64;->decode(C)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    shl-int/lit8 v2, v2, 0x12

    .line 31
    .line 32
    add-int/lit8 v3, v1, 0x1

    .line 33
    .line 34
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-static {v3}, Lcom/momo/xengine/mestatistics/Base64;->decode(C)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    shl-int/lit8 v3, v3, 0xc

    .line 43
    .line 44
    add-int/2addr v2, v3

    .line 45
    add-int/lit8 v3, v1, 0x2

    .line 46
    .line 47
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-static {v4}, Lcom/momo/xengine/mestatistics/Base64;->decode(C)I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    shl-int/lit8 v4, v4, 0x6

    .line 56
    .line 57
    add-int/2addr v2, v4

    .line 58
    add-int/lit8 v4, v1, 0x3

    .line 59
    .line 60
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    invoke-static {v5}, Lcom/momo/xengine/mestatistics/Base64;->decode(C)I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    add-int/2addr v2, v5

    .line 69
    shr-int/lit8 v5, v2, 0x10

    .line 70
    .line 71
    and-int/lit16 v5, v5, 0xff

    .line 72
    .line 73
    invoke-virtual {p1, v5}, Ljava/io/OutputStream;->write(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    const/16 v5, 0x3d

    .line 81
    .line 82
    if-ne v3, v5, :cond_2

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    shr-int/lit8 v3, v2, 0x8

    .line 86
    .line 87
    and-int/lit16 v3, v3, 0xff

    .line 88
    .line 89
    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-ne v3, v5, :cond_3

    .line 97
    .line 98
    :goto_1
    return-void

    .line 99
    :cond_3
    and-int/lit16 v2, v2, 0xff

    .line 100
    .line 101
    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write(I)V

    .line 102
    .line 103
    .line 104
    add-int/lit8 v1, v1, 0x4

    .line 105
    .line 106
    goto :goto_0
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 4

    .line 107
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 108
    :try_start_0
    invoke-static {p0, v0}, Lcom/momo/xengine/mestatistics/Base64;->decode(Ljava/lang/String;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 109
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    .line 110
    :try_start_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    .line 111
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error while decoding BASE64: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-object p0

    .line 112
    :catch_1
    invoke-static {}, Ll/olk0;->a()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static encode([B)Ljava/lang/String;
    .locals 9

    .line 1
    array-length v0, p0

    .line 2
    new-instance v1, Ljava/lang/StringBuffer;

    .line 3
    .line 4
    array-length v2, p0

    .line 5
    mul-int/lit8 v2, v2, 0x3

    .line 6
    .line 7
    div-int/lit8 v2, v2, 0x2

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v2, v0, -0x3

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    move v4, v3

    .line 16
    move v5, v4

    .line 17
    :goto_0
    if-gt v4, v2, :cond_1

    .line 18
    .line 19
    aget-byte v6, p0, v4

    .line 20
    .line 21
    and-int/lit16 v6, v6, 0xff

    .line 22
    .line 23
    shl-int/lit8 v6, v6, 0x10

    .line 24
    .line 25
    add-int/lit8 v7, v4, 0x1

    .line 26
    .line 27
    aget-byte v7, p0, v7

    .line 28
    .line 29
    and-int/lit16 v7, v7, 0xff

    .line 30
    .line 31
    shl-int/lit8 v7, v7, 0x8

    .line 32
    .line 33
    or-int/2addr v6, v7

    .line 34
    add-int/lit8 v7, v4, 0x2

    .line 35
    .line 36
    aget-byte v7, p0, v7

    .line 37
    .line 38
    and-int/lit16 v7, v7, 0xff

    .line 39
    .line 40
    or-int/2addr v6, v7

    .line 41
    sget-object v7, Lcom/momo/xengine/mestatistics/Base64;->legalChars:[C

    .line 42
    .line 43
    shr-int/lit8 v8, v6, 0x12

    .line 44
    .line 45
    and-int/lit8 v8, v8, 0x3f

    .line 46
    .line 47
    aget-char v8, v7, v8

    .line 48
    .line 49
    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 50
    .line 51
    .line 52
    shr-int/lit8 v8, v6, 0xc

    .line 53
    .line 54
    and-int/lit8 v8, v8, 0x3f

    .line 55
    .line 56
    aget-char v8, v7, v8

    .line 57
    .line 58
    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 59
    .line 60
    .line 61
    shr-int/lit8 v8, v6, 0x6

    .line 62
    .line 63
    and-int/lit8 v8, v8, 0x3f

    .line 64
    .line 65
    aget-char v8, v7, v8

    .line 66
    .line 67
    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 68
    .line 69
    .line 70
    and-int/lit8 v6, v6, 0x3f

    .line 71
    .line 72
    aget-char v6, v7, v6

    .line 73
    .line 74
    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 75
    .line 76
    .line 77
    add-int/lit8 v4, v4, 0x3

    .line 78
    .line 79
    add-int/lit8 v6, v5, 0x1

    .line 80
    .line 81
    const/16 v7, 0xe

    .line 82
    .line 83
    if-lt v5, v7, :cond_0

    .line 84
    .line 85
    const-string v5, " "

    .line 86
    .line 87
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    .line 89
    .line 90
    move v5, v3

    .line 91
    goto :goto_0

    .line 92
    :cond_0
    move v5, v6

    .line 93
    goto :goto_0

    .line 94
    :cond_1
    add-int/lit8 v2, v0, -0x2

    .line 95
    .line 96
    if-ne v4, v2, :cond_2

    .line 97
    .line 98
    aget-byte v0, p0, v4

    .line 99
    .line 100
    and-int/lit16 v0, v0, 0xff

    .line 101
    .line 102
    shl-int/lit8 v0, v0, 0x10

    .line 103
    .line 104
    add-int/lit8 v4, v4, 0x1

    .line 105
    .line 106
    aget-byte p0, p0, v4

    .line 107
    .line 108
    and-int/lit16 p0, p0, 0xff

    .line 109
    .line 110
    shl-int/lit8 p0, p0, 0x8

    .line 111
    .line 112
    or-int/2addr p0, v0

    .line 113
    sget-object v0, Lcom/momo/xengine/mestatistics/Base64;->legalChars:[C

    .line 114
    .line 115
    shr-int/lit8 v2, p0, 0x12

    .line 116
    .line 117
    and-int/lit8 v2, v2, 0x3f

    .line 118
    .line 119
    aget-char v2, v0, v2

    .line 120
    .line 121
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 122
    .line 123
    .line 124
    shr-int/lit8 v2, p0, 0xc

    .line 125
    .line 126
    and-int/lit8 v2, v2, 0x3f

    .line 127
    .line 128
    aget-char v2, v0, v2

    .line 129
    .line 130
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 131
    .line 132
    .line 133
    shr-int/lit8 p0, p0, 0x6

    .line 134
    .line 135
    and-int/lit8 p0, p0, 0x3f

    .line 136
    .line 137
    aget-char p0, v0, p0

    .line 138
    .line 139
    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 140
    .line 141
    .line 142
    const-string p0, "="

    .line 143
    .line 144
    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 145
    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_2
    add-int/lit8 v0, v0, -0x1

    .line 149
    .line 150
    if-ne v4, v0, :cond_3

    .line 151
    .line 152
    aget-byte p0, p0, v4

    .line 153
    .line 154
    and-int/lit16 p0, p0, 0xff

    .line 155
    .line 156
    shl-int/lit8 p0, p0, 0x10

    .line 157
    .line 158
    sget-object v0, Lcom/momo/xengine/mestatistics/Base64;->legalChars:[C

    .line 159
    .line 160
    shr-int/lit8 v2, p0, 0x12

    .line 161
    .line 162
    and-int/lit8 v2, v2, 0x3f

    .line 163
    .line 164
    aget-char v2, v0, v2

    .line 165
    .line 166
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 167
    .line 168
    .line 169
    shr-int/lit8 p0, p0, 0xc

    .line 170
    .line 171
    and-int/lit8 p0, p0, 0x3f

    .line 172
    .line 173
    aget-char p0, v0, p0

    .line 174
    .line 175
    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 176
    .line 177
    .line 178
    const-string p0, "=="

    .line 179
    .line 180
    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 181
    .line 182
    .line 183
    :cond_3
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    return-object p0
.end method
