.class public final Lokio/-Base64;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u001a\u000e\u0010\u0006\u001a\u0004\u0018\u00010\u0001*\u00020\u0007H\u0000\u001a\u0016\u0010\u0008\u001a\u00020\u0007*\u00020\u00012\u0008\u0008\u0002\u0010\t\u001a\u00020\u0001H\u0000\"\u0014\u0010\u0000\u001a\u00020\u0001X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0003\"\u0014\u0010\u0004\u001a\u00020\u0001X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0003\u00a8\u0006\n"
    }
    d2 = {
        "BASE64",
        "",
        "getBASE64",
        "()[B",
        "BASE64_URL_SAFE",
        "getBASE64_URL_SAFE",
        "decodeBase64ToArray",
        "",
        "encodeBase64",
        "map",
        "jvm"
    }
    k = 0x2
    mv = {
        0x1,
        0x1,
        0xb
    }
.end annotation

.annotation build Lkotlin/jvm/JvmName;
.end annotation


# static fields
.field private static final BASE64:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final BASE64_URL_SAFE:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lokio/ByteString;->Companion:Lokio/ByteString$Companion;

    .line 2
    .line 3
    const-string v1, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lokio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lokio/ByteString;->getData$jvm()[B

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sput-object v1, Lokio/-Base64;->BASE64:[B

    .line 14
    .line 15
    const-string v1, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lokio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lokio/ByteString;->getData$jvm()[B

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lokio/-Base64;->BASE64_URL_SAFE:[B

    .line 26
    .line 27
    return-void
.end method

.method public static final decodeBase64ToArray(Ljava/lang/String;)[B
    .locals 15
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    :goto_0
    const/16 v1, 0x9

    .line 9
    .line 10
    const/16 v2, 0x20

    .line 11
    .line 12
    const/16 v3, 0xd

    .line 13
    .line 14
    const/16 v4, 0xa

    .line 15
    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    add-int/lit8 v5, v0, -0x1

    .line 19
    .line 20
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    const/16 v6, 0x3d

    .line 25
    .line 26
    if-eq v5, v6, :cond_0

    .line 27
    .line 28
    if-eq v5, v4, :cond_0

    .line 29
    .line 30
    if-eq v5, v3, :cond_0

    .line 31
    .line 32
    if-eq v5, v2, :cond_0

    .line 33
    .line 34
    if-eq v5, v1, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    :goto_1
    int-to-long v5, v0

    .line 41
    const-wide/16 v7, 0x6

    .line 42
    .line 43
    mul-long/2addr v5, v7

    .line 44
    const-wide/16 v7, 0x8

    .line 45
    .line 46
    div-long/2addr v5, v7

    .line 47
    long-to-int v5, v5

    .line 48
    new-array v6, v5, [B

    .line 49
    .line 50
    const/4 v7, 0x0

    .line 51
    move v8, v7

    .line 52
    move v9, v8

    .line 53
    move v10, v9

    .line 54
    move v11, v10

    .line 55
    :goto_2
    const/4 v12, 0x0

    .line 56
    if-ge v8, v0, :cond_e

    .line 57
    .line 58
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    .line 59
    .line 60
    .line 61
    move-result v13

    .line 62
    const/16 v14, 0x41

    .line 63
    .line 64
    if-le v14, v13, :cond_2

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_2
    const/16 v14, 0x5a

    .line 68
    .line 69
    if-lt v14, v13, :cond_3

    .line 70
    .line 71
    add-int/lit8 v13, v13, -0x41

    .line 72
    .line 73
    goto :goto_8

    .line 74
    :cond_3
    :goto_3
    const/16 v14, 0x61

    .line 75
    .line 76
    if-le v14, v13, :cond_4

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_4
    const/16 v14, 0x7a

    .line 80
    .line 81
    if-lt v14, v13, :cond_5

    .line 82
    .line 83
    add-int/lit8 v13, v13, -0x47

    .line 84
    .line 85
    goto :goto_8

    .line 86
    :cond_5
    :goto_4
    const/16 v14, 0x30

    .line 87
    .line 88
    if-le v14, v13, :cond_6

    .line 89
    .line 90
    goto :goto_5

    .line 91
    :cond_6
    const/16 v14, 0x39

    .line 92
    .line 93
    if-lt v14, v13, :cond_7

    .line 94
    .line 95
    add-int/lit8 v13, v13, 0x4

    .line 96
    .line 97
    goto :goto_8

    .line 98
    :cond_7
    :goto_5
    const/16 v14, 0x2b

    .line 99
    .line 100
    if-eq v13, v14, :cond_c

    .line 101
    .line 102
    const/16 v14, 0x2d

    .line 103
    .line 104
    if-ne v13, v14, :cond_8

    .line 105
    .line 106
    goto :goto_7

    .line 107
    :cond_8
    const/16 v14, 0x2f

    .line 108
    .line 109
    if-eq v13, v14, :cond_b

    .line 110
    .line 111
    const/16 v14, 0x5f

    .line 112
    .line 113
    if-ne v13, v14, :cond_9

    .line 114
    .line 115
    goto :goto_6

    .line 116
    :cond_9
    if-eq v13, v4, :cond_d

    .line 117
    .line 118
    if-eq v13, v3, :cond_d

    .line 119
    .line 120
    if-eq v13, v2, :cond_d

    .line 121
    .line 122
    if-ne v13, v1, :cond_a

    .line 123
    .line 124
    goto :goto_9

    .line 125
    :cond_a
    return-object v12

    .line 126
    :cond_b
    :goto_6
    const/16 v13, 0x3f

    .line 127
    .line 128
    goto :goto_8

    .line 129
    :cond_c
    :goto_7
    const/16 v13, 0x3e

    .line 130
    .line 131
    :goto_8
    shl-int/lit8 v10, v10, 0x6

    .line 132
    .line 133
    or-int/2addr v10, v13

    .line 134
    add-int/lit8 v9, v9, 0x1

    .line 135
    .line 136
    rem-int/lit8 v12, v9, 0x4

    .line 137
    .line 138
    if-nez v12, :cond_d

    .line 139
    .line 140
    add-int/lit8 v12, v11, 0x1

    .line 141
    .line 142
    shr-int/lit8 v13, v10, 0x10

    .line 143
    .line 144
    int-to-byte v13, v13

    .line 145
    aput-byte v13, v6, v11

    .line 146
    .line 147
    add-int/lit8 v13, v11, 0x2

    .line 148
    .line 149
    shr-int/lit8 v14, v10, 0x8

    .line 150
    .line 151
    int-to-byte v14, v14

    .line 152
    aput-byte v14, v6, v12

    .line 153
    .line 154
    add-int/lit8 v11, v11, 0x3

    .line 155
    .line 156
    int-to-byte v12, v10

    .line 157
    aput-byte v12, v6, v13

    .line 158
    .line 159
    :cond_d
    :goto_9
    add-int/lit8 v8, v8, 0x1

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_e
    rem-int/lit8 v9, v9, 0x4

    .line 163
    .line 164
    const/4 p0, 0x1

    .line 165
    if-eq v9, p0, :cond_12

    .line 166
    .line 167
    const/4 p0, 0x2

    .line 168
    if-eq v9, p0, :cond_10

    .line 169
    .line 170
    const/4 p0, 0x3

    .line 171
    if-eq v9, p0, :cond_f

    .line 172
    .line 173
    goto :goto_a

    .line 174
    :cond_f
    shl-int/lit8 p0, v10, 0x6

    .line 175
    .line 176
    add-int/lit8 v0, v11, 0x1

    .line 177
    .line 178
    shr-int/lit8 v1, p0, 0x10

    .line 179
    .line 180
    int-to-byte v1, v1

    .line 181
    aput-byte v1, v6, v11

    .line 182
    .line 183
    add-int/lit8 v11, v11, 0x2

    .line 184
    .line 185
    shr-int/lit8 p0, p0, 0x8

    .line 186
    .line 187
    int-to-byte p0, p0

    .line 188
    aput-byte p0, v6, v0

    .line 189
    .line 190
    goto :goto_a

    .line 191
    :cond_10
    shl-int/lit8 p0, v10, 0xc

    .line 192
    .line 193
    add-int/lit8 v0, v11, 0x1

    .line 194
    .line 195
    shr-int/lit8 p0, p0, 0x10

    .line 196
    .line 197
    int-to-byte p0, p0

    .line 198
    aput-byte p0, v6, v11

    .line 199
    .line 200
    move v11, v0

    .line 201
    :goto_a
    if-ne v11, v5, :cond_11

    .line 202
    .line 203
    return-object v6

    .line 204
    :cond_11
    new-array p0, v11, [B

    .line 205
    .line 206
    invoke-static {v6, v7, p0, v7, v11}, Lokio/-Platform;->arraycopy([BI[BII)V

    .line 207
    .line 208
    .line 209
    return-object p0

    .line 210
    :cond_12
    return-object v12
.end method

.method public static final encodeBase64([B[B)Ljava/lang/String;
    .locals 11
    .param p0    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    array-length v0, p0

    .line 8
    const/4 v1, 0x2

    .line 9
    add-int/2addr v0, v1

    .line 10
    div-int/lit8 v0, v0, 0x3

    .line 11
    .line 12
    mul-int/lit8 v0, v0, 0x4

    .line 13
    .line 14
    new-array v0, v0, [B

    .line 15
    .line 16
    array-length v2, p0

    .line 17
    array-length v3, p0

    .line 18
    rem-int/lit8 v3, v3, 0x3

    .line 19
    .line 20
    sub-int/2addr v2, v3

    .line 21
    const/4 v3, 0x0

    .line 22
    move v4, v3

    .line 23
    :goto_0
    if-ge v3, v2, :cond_0

    .line 24
    .line 25
    add-int/lit8 v5, v3, 0x1

    .line 26
    .line 27
    aget-byte v6, p0, v3

    .line 28
    .line 29
    add-int/lit8 v7, v3, 0x2

    .line 30
    .line 31
    aget-byte v5, p0, v5

    .line 32
    .line 33
    add-int/lit8 v3, v3, 0x3

    .line 34
    .line 35
    aget-byte v7, p0, v7

    .line 36
    .line 37
    add-int/lit8 v8, v4, 0x1

    .line 38
    .line 39
    and-int/lit16 v9, v6, 0xff

    .line 40
    .line 41
    shr-int/2addr v9, v1

    .line 42
    aget-byte v9, p1, v9

    .line 43
    .line 44
    aput-byte v9, v0, v4

    .line 45
    .line 46
    add-int/lit8 v9, v4, 0x2

    .line 47
    .line 48
    and-int/lit8 v6, v6, 0x3

    .line 49
    .line 50
    shl-int/lit8 v6, v6, 0x4

    .line 51
    .line 52
    and-int/lit16 v10, v5, 0xff

    .line 53
    .line 54
    shr-int/lit8 v10, v10, 0x4

    .line 55
    .line 56
    or-int/2addr v6, v10

    .line 57
    aget-byte v6, p1, v6

    .line 58
    .line 59
    aput-byte v6, v0, v8

    .line 60
    .line 61
    add-int/lit8 v6, v4, 0x3

    .line 62
    .line 63
    and-int/lit8 v5, v5, 0xf

    .line 64
    .line 65
    shl-int/2addr v5, v1

    .line 66
    and-int/lit16 v8, v7, 0xff

    .line 67
    .line 68
    shr-int/lit8 v8, v8, 0x6

    .line 69
    .line 70
    or-int/2addr v5, v8

    .line 71
    aget-byte v5, p1, v5

    .line 72
    .line 73
    aput-byte v5, v0, v9

    .line 74
    .line 75
    add-int/lit8 v4, v4, 0x4

    .line 76
    .line 77
    and-int/lit8 v5, v7, 0x3f

    .line 78
    .line 79
    aget-byte v5, p1, v5

    .line 80
    .line 81
    aput-byte v5, v0, v6

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    array-length v5, p0

    .line 85
    sub-int/2addr v5, v2

    .line 86
    const/16 v2, 0x3d

    .line 87
    .line 88
    const/4 v6, 0x1

    .line 89
    if-eq v5, v6, :cond_2

    .line 90
    .line 91
    if-eq v5, v1, :cond_1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_1
    add-int/lit8 v5, v3, 0x1

    .line 95
    .line 96
    aget-byte v3, p0, v3

    .line 97
    .line 98
    aget-byte p0, p0, v5

    .line 99
    .line 100
    add-int/lit8 v5, v4, 0x1

    .line 101
    .line 102
    and-int/lit16 v6, v3, 0xff

    .line 103
    .line 104
    shr-int/2addr v6, v1

    .line 105
    aget-byte v6, p1, v6

    .line 106
    .line 107
    aput-byte v6, v0, v4

    .line 108
    .line 109
    add-int/lit8 v6, v4, 0x2

    .line 110
    .line 111
    and-int/lit8 v3, v3, 0x3

    .line 112
    .line 113
    shl-int/lit8 v3, v3, 0x4

    .line 114
    .line 115
    and-int/lit16 v7, p0, 0xff

    .line 116
    .line 117
    shr-int/lit8 v7, v7, 0x4

    .line 118
    .line 119
    or-int/2addr v3, v7

    .line 120
    aget-byte v3, p1, v3

    .line 121
    .line 122
    aput-byte v3, v0, v5

    .line 123
    .line 124
    add-int/lit8 v4, v4, 0x3

    .line 125
    .line 126
    and-int/lit8 p0, p0, 0xf

    .line 127
    .line 128
    shl-int/2addr p0, v1

    .line 129
    aget-byte p0, p1, p0

    .line 130
    .line 131
    aput-byte p0, v0, v6

    .line 132
    .line 133
    aput-byte v2, v0, v4

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_2
    aget-byte p0, p0, v3

    .line 137
    .line 138
    add-int/lit8 v3, v4, 0x1

    .line 139
    .line 140
    and-int/lit16 v5, p0, 0xff

    .line 141
    .line 142
    shr-int/lit8 v1, v5, 0x2

    .line 143
    .line 144
    aget-byte v1, p1, v1

    .line 145
    .line 146
    aput-byte v1, v0, v4

    .line 147
    .line 148
    add-int/lit8 v1, v4, 0x2

    .line 149
    .line 150
    and-int/lit8 p0, p0, 0x3

    .line 151
    .line 152
    shl-int/lit8 p0, p0, 0x4

    .line 153
    .line 154
    aget-byte p0, p1, p0

    .line 155
    .line 156
    aput-byte p0, v0, v3

    .line 157
    .line 158
    add-int/lit8 v4, v4, 0x3

    .line 159
    .line 160
    aput-byte v2, v0, v1

    .line 161
    .line 162
    aput-byte v2, v0, v4

    .line 163
    .line 164
    :goto_1
    invoke-static {v0}, Lokio/-Platform;->toUtf8String([B)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    return-object p0
.end method

.method public static bridge synthetic encodeBase64$default([B[BILjava/lang/Object;)Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    sget-object p1, Lokio/-Base64;->BASE64:[B

    .line 6
    .line 7
    :cond_0
    invoke-static {p0, p1}, Lokio/-Base64;->encodeBase64([B[B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static final getBASE64()[B
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lokio/-Base64;->BASE64:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static final getBASE64_URL_SAFE()[B
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lokio/-Base64;->BASE64_URL_SAFE:[B

    .line 2
    .line 3
    return-object v0
.end method
