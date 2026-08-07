.class public Ll/se2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:[C

.field private static b:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [C

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/se2;->a:[C

    .line 9
    .line 10
    const/16 v0, 0x80

    .line 11
    .line 12
    new-array v0, v0, [B

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/se2;->b:[B

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
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
        0x2bs
        0x2fs
    .end array-data

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
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
        0x3et
        -0x1t
        -0x1t
        -0x1t
        0x3ft
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
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
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
    .end array-data
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

.method public static a([B)[B
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    array-length v0, p0

    .line 2
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 3
    .line 4
    invoke-direct {v1, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    move v4, v3

    .line 10
    move v5, v4

    .line 11
    move v6, v5

    .line 12
    :goto_0
    if-ge v2, v0, :cond_12

    .line 13
    .line 14
    :goto_1
    array-length v7, p0

    .line 15
    const/4 v8, -0x1

    .line 16
    if-lt v2, v7, :cond_0

    .line 17
    .line 18
    goto :goto_3

    .line 19
    :cond_0
    sget-object v3, Ll/se2;->b:[B

    .line 20
    .line 21
    add-int/lit8 v7, v2, 0x1

    .line 22
    .line 23
    aget-byte v2, p0, v2

    .line 24
    .line 25
    aget-byte v3, v3, v2

    .line 26
    .line 27
    if-ge v7, v0, :cond_2

    .line 28
    .line 29
    if-eq v3, v8, :cond_1

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_1
    move v2, v7

    .line 33
    goto :goto_1

    .line 34
    :cond_2
    :goto_2
    move v2, v7

    .line 35
    :goto_3
    if-ne v3, v8, :cond_3

    .line 36
    .line 37
    goto/16 :goto_d

    .line 38
    .line 39
    :cond_3
    :goto_4
    array-length v7, p0

    .line 40
    if-lt v2, v7, :cond_4

    .line 41
    .line 42
    goto :goto_6

    .line 43
    :cond_4
    sget-object v4, Ll/se2;->b:[B

    .line 44
    .line 45
    add-int/lit8 v7, v2, 0x1

    .line 46
    .line 47
    aget-byte v2, p0, v2

    .line 48
    .line 49
    aget-byte v4, v4, v2

    .line 50
    .line 51
    if-ge v7, v0, :cond_6

    .line 52
    .line 53
    if-eq v4, v8, :cond_5

    .line 54
    .line 55
    goto :goto_5

    .line 56
    :cond_5
    move v2, v7

    .line 57
    goto :goto_4

    .line 58
    :cond_6
    :goto_5
    move v2, v7

    .line 59
    :goto_6
    if-ne v4, v8, :cond_7

    .line 60
    .line 61
    goto/16 :goto_d

    .line 62
    .line 63
    :cond_7
    shl-int/lit8 v7, v3, 0x2

    .line 64
    .line 65
    and-int/lit8 v9, v4, 0x30

    .line 66
    .line 67
    ushr-int/lit8 v9, v9, 0x4

    .line 68
    .line 69
    or-int/2addr v7, v9

    .line 70
    invoke-virtual {v1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 71
    .line 72
    .line 73
    :goto_7
    array-length v7, p0

    .line 74
    const/16 v9, 0x3d

    .line 75
    .line 76
    if-lt v2, v7, :cond_8

    .line 77
    .line 78
    goto :goto_9

    .line 79
    :cond_8
    add-int/lit8 v5, v2, 0x1

    .line 80
    .line 81
    aget-byte v2, p0, v2

    .line 82
    .line 83
    if-ne v2, v9, :cond_9

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0

    .line 90
    :cond_9
    sget-object v7, Ll/se2;->b:[B

    .line 91
    .line 92
    aget-byte v2, v7, v2

    .line 93
    .line 94
    if-ge v5, v0, :cond_b

    .line 95
    .line 96
    if-eq v2, v8, :cond_a

    .line 97
    .line 98
    goto :goto_8

    .line 99
    :cond_a
    move v11, v5

    .line 100
    move v5, v2

    .line 101
    move v2, v11

    .line 102
    goto :goto_7

    .line 103
    :cond_b
    :goto_8
    move v11, v5

    .line 104
    move v5, v2

    .line 105
    move v2, v11

    .line 106
    :goto_9
    if-ne v5, v8, :cond_c

    .line 107
    .line 108
    goto :goto_d

    .line 109
    :cond_c
    and-int/lit8 v7, v4, 0xf

    .line 110
    .line 111
    shl-int/lit8 v7, v7, 0x4

    .line 112
    .line 113
    and-int/lit8 v10, v5, 0x3c

    .line 114
    .line 115
    ushr-int/lit8 v10, v10, 0x2

    .line 116
    .line 117
    or-int/2addr v7, v10

    .line 118
    invoke-virtual {v1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 119
    .line 120
    .line 121
    :goto_a
    array-length v7, p0

    .line 122
    if-lt v2, v7, :cond_d

    .line 123
    .line 124
    goto :goto_c

    .line 125
    :cond_d
    add-int/lit8 v6, v2, 0x1

    .line 126
    .line 127
    aget-byte v2, p0, v2

    .line 128
    .line 129
    if-ne v2, v9, :cond_e

    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    return-object p0

    .line 136
    :cond_e
    sget-object v7, Ll/se2;->b:[B

    .line 137
    .line 138
    aget-byte v2, v7, v2

    .line 139
    .line 140
    if-ge v6, v0, :cond_10

    .line 141
    .line 142
    if-eq v2, v8, :cond_f

    .line 143
    .line 144
    goto :goto_b

    .line 145
    :cond_f
    move v11, v6

    .line 146
    move v6, v2

    .line 147
    move v2, v11

    .line 148
    goto :goto_a

    .line 149
    :cond_10
    :goto_b
    move v11, v6

    .line 150
    move v6, v2

    .line 151
    move v2, v11

    .line 152
    :goto_c
    if-ne v6, v8, :cond_11

    .line 153
    .line 154
    goto :goto_d

    .line 155
    :cond_11
    and-int/lit8 v7, v5, 0x3

    .line 156
    .line 157
    shl-int/lit8 v7, v7, 0x6

    .line 158
    .line 159
    or-int/2addr v7, v6

    .line 160
    invoke-virtual {v1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 161
    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_12
    :goto_d
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0
.end method

.method public static b([B)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    array-length v1, p0

    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_2

    .line 9
    .line 10
    add-int/lit8 v3, v2, 0x1

    .line 11
    .line 12
    aget-byte v4, p0, v2

    .line 13
    .line 14
    and-int/lit16 v5, v4, 0xff

    .line 15
    .line 16
    if-ne v3, v1, :cond_0

    .line 17
    .line 18
    sget-object p0, Ll/se2;->a:[C

    .line 19
    .line 20
    ushr-int/lit8 v1, v5, 0x2

    .line 21
    .line 22
    aget-char p0, p0, v1

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 25
    .line 26
    .line 27
    sget-object p0, Ll/se2;->a:[C

    .line 28
    .line 29
    and-int/lit8 v1, v4, 0x3

    .line 30
    .line 31
    shl-int/lit8 v1, v1, 0x4

    .line 32
    .line 33
    aget-char p0, p0, v1

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 36
    .line 37
    .line 38
    const-string p0, "=="

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    add-int/lit8 v6, v2, 0x2

    .line 45
    .line 46
    aget-byte v3, p0, v3

    .line 47
    .line 48
    if-ne v6, v1, :cond_1

    .line 49
    .line 50
    sget-object p0, Ll/se2;->a:[C

    .line 51
    .line 52
    ushr-int/lit8 v1, v5, 0x2

    .line 53
    .line 54
    aget-char p0, p0, v1

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 57
    .line 58
    .line 59
    sget-object p0, Ll/se2;->a:[C

    .line 60
    .line 61
    and-int/lit8 v1, v4, 0x3

    .line 62
    .line 63
    shl-int/lit8 v1, v1, 0x4

    .line 64
    .line 65
    and-int/lit16 v2, v3, 0xf0

    .line 66
    .line 67
    ushr-int/lit8 v2, v2, 0x4

    .line 68
    .line 69
    or-int/2addr v1, v2

    .line 70
    aget-char p0, p0, v1

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 73
    .line 74
    .line 75
    sget-object p0, Ll/se2;->a:[C

    .line 76
    .line 77
    and-int/lit8 v1, v3, 0xf

    .line 78
    .line 79
    shl-int/lit8 v1, v1, 0x2

    .line 80
    .line 81
    aget-char p0, p0, v1

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 84
    .line 85
    .line 86
    const-string p0, "="

    .line 87
    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_1
    add-int/lit8 v2, v2, 0x3

    .line 93
    .line 94
    aget-byte v6, p0, v6

    .line 95
    .line 96
    sget-object v7, Ll/se2;->a:[C

    .line 97
    .line 98
    ushr-int/lit8 v5, v5, 0x2

    .line 99
    .line 100
    aget-char v5, v7, v5

    .line 101
    .line 102
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 103
    .line 104
    .line 105
    sget-object v5, Ll/se2;->a:[C

    .line 106
    .line 107
    and-int/lit8 v4, v4, 0x3

    .line 108
    .line 109
    shl-int/lit8 v4, v4, 0x4

    .line 110
    .line 111
    and-int/lit16 v7, v3, 0xf0

    .line 112
    .line 113
    ushr-int/lit8 v7, v7, 0x4

    .line 114
    .line 115
    or-int/2addr v4, v7

    .line 116
    aget-char v4, v5, v4

    .line 117
    .line 118
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 119
    .line 120
    .line 121
    sget-object v4, Ll/se2;->a:[C

    .line 122
    .line 123
    and-int/lit8 v3, v3, 0xf

    .line 124
    .line 125
    shl-int/lit8 v3, v3, 0x2

    .line 126
    .line 127
    and-int/lit16 v5, v6, 0xc0

    .line 128
    .line 129
    ushr-int/lit8 v5, v5, 0x6

    .line 130
    .line 131
    or-int/2addr v3, v5

    .line 132
    aget-char v3, v4, v3

    .line 133
    .line 134
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 135
    .line 136
    .line 137
    sget-object v3, Ll/se2;->a:[C

    .line 138
    .line 139
    and-int/lit8 v4, v6, 0x3f

    .line 140
    .line 141
    aget-char v3, v3, v4

    .line 142
    .line 143
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 144
    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_2
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    return-object p0
.end method
