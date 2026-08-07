.class public Ll/ptq0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String;

.field private static b:[C

.field private static c:[B


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const-string v0, "line.separator"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/ptq0;->a:Ljava/lang/String;

    .line 8
    .line 9
    const/16 v0, 0x40

    .line 10
    .line 11
    new-array v1, v0, [C

    .line 12
    .line 13
    sput-object v1, Ll/ptq0;->b:[C

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    const/16 v2, 0x41

    .line 17
    .line 18
    move v3, v1

    .line 19
    :goto_0
    const/16 v4, 0x5a

    .line 20
    .line 21
    if-gt v2, v4, :cond_0

    .line 22
    .line 23
    sget-object v4, Ll/ptq0;->b:[C

    .line 24
    .line 25
    add-int/lit8 v5, v3, 0x1

    .line 26
    .line 27
    aput-char v2, v4, v3

    .line 28
    .line 29
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    int-to-char v2, v2

    .line 32
    move v3, v5

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/16 v2, 0x61

    .line 35
    .line 36
    :goto_1
    const/16 v4, 0x7a

    .line 37
    .line 38
    if-gt v2, v4, :cond_1

    .line 39
    .line 40
    sget-object v4, Ll/ptq0;->b:[C

    .line 41
    .line 42
    add-int/lit8 v5, v3, 0x1

    .line 43
    .line 44
    aput-char v2, v4, v3

    .line 45
    .line 46
    add-int/lit8 v2, v2, 0x1

    .line 47
    .line 48
    int-to-char v2, v2

    .line 49
    move v3, v5

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    const/16 v2, 0x30

    .line 52
    .line 53
    :goto_2
    const/16 v4, 0x39

    .line 54
    .line 55
    if-gt v2, v4, :cond_2

    .line 56
    .line 57
    sget-object v4, Ll/ptq0;->b:[C

    .line 58
    .line 59
    add-int/lit8 v5, v3, 0x1

    .line 60
    .line 61
    aput-char v2, v4, v3

    .line 62
    .line 63
    add-int/lit8 v2, v2, 0x1

    .line 64
    .line 65
    int-to-char v2, v2

    .line 66
    move v3, v5

    .line 67
    goto :goto_2

    .line 68
    :cond_2
    sget-object v2, Ll/ptq0;->b:[C

    .line 69
    .line 70
    add-int/lit8 v4, v3, 0x1

    .line 71
    .line 72
    const/16 v5, 0x2b

    .line 73
    .line 74
    aput-char v5, v2, v3

    .line 75
    .line 76
    const/16 v3, 0x2f

    .line 77
    .line 78
    aput-char v3, v2, v4

    .line 79
    .line 80
    const/16 v2, 0x80

    .line 81
    .line 82
    new-array v2, v2, [B

    .line 83
    .line 84
    sput-object v2, Ll/ptq0;->c:[B

    .line 85
    .line 86
    move v2, v1

    .line 87
    :goto_3
    sget-object v3, Ll/ptq0;->c:[B

    .line 88
    .line 89
    array-length v4, v3

    .line 90
    if-ge v2, v4, :cond_3

    .line 91
    .line 92
    const/4 v4, -0x1

    .line 93
    aput-byte v4, v3, v2

    .line 94
    .line 95
    add-int/lit8 v2, v2, 0x1

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_3
    :goto_4
    if-ge v1, v0, :cond_4

    .line 99
    .line 100
    sget-object v2, Ll/ptq0;->c:[B

    .line 101
    .line 102
    sget-object v3, Ll/ptq0;->b:[C

    .line 103
    .line 104
    aget-char v3, v3, v1

    .line 105
    .line 106
    int-to-byte v4, v1

    .line 107
    aput-byte v4, v2, v3

    .line 108
    .line 109
    add-int/lit8 v1, v1, 0x1

    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_4
    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/ptq0;->e([B)[C

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([C)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static b(Ljava/lang/String;)[B
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/ptq0;->c([C)[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static c([C)[B
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    array-length v1, p0

    .line 3
    invoke-static {p0, v0, v1}, Ll/ptq0;->d([CII)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static d([CII)[B
    .locals 11

    .line 1
    rem-int/lit8 v0, p2, 0x4

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_8

    .line 5
    .line 6
    :goto_0
    if-lez p2, :cond_0

    .line 7
    .line 8
    add-int v0, p1, p2

    .line 9
    .line 10
    add-int/lit8 v0, v0, -0x1

    .line 11
    .line 12
    aget-char v0, p0, v0

    .line 13
    .line 14
    const/16 v2, 0x3d

    .line 15
    .line 16
    if-ne v0, v2, :cond_0

    .line 17
    .line 18
    add-int/lit8 p2, p2, -0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    mul-int/lit8 v0, p2, 0x3

    .line 22
    .line 23
    div-int/lit8 v0, v0, 0x4

    .line 24
    .line 25
    new-array v2, v0, [B

    .line 26
    .line 27
    add-int/2addr p2, p1

    .line 28
    const/4 v3, 0x0

    .line 29
    :goto_1
    if-ge p1, p2, :cond_7

    .line 30
    .line 31
    add-int/lit8 v4, p1, 0x1

    .line 32
    .line 33
    aget-char v5, p0, p1

    .line 34
    .line 35
    add-int/lit8 v6, p1, 0x2

    .line 36
    .line 37
    aget-char v4, p0, v4

    .line 38
    .line 39
    const/16 v7, 0x41

    .line 40
    .line 41
    if-ge v6, p2, :cond_1

    .line 42
    .line 43
    add-int/lit8 p1, p1, 0x3

    .line 44
    .line 45
    aget-char v6, p0, v6

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_1
    move p1, v6

    .line 49
    move v6, v7

    .line 50
    :goto_2
    if-ge p1, p2, :cond_2

    .line 51
    .line 52
    add-int/lit8 v7, p1, 0x1

    .line 53
    .line 54
    aget-char p1, p0, p1

    .line 55
    .line 56
    move v10, v7

    .line 57
    move v7, p1

    .line 58
    move p1, v10

    .line 59
    :cond_2
    const-string v8, "Illegal character in Base64 encoded data."

    .line 60
    .line 61
    const/16 v9, 0x7f

    .line 62
    .line 63
    if-gt v5, v9, :cond_6

    .line 64
    .line 65
    if-gt v4, v9, :cond_6

    .line 66
    .line 67
    if-gt v6, v9, :cond_6

    .line 68
    .line 69
    if-gt v7, v9, :cond_6

    .line 70
    .line 71
    sget-object v9, Ll/ptq0;->c:[B

    .line 72
    .line 73
    aget-byte v5, v9, v5

    .line 74
    .line 75
    aget-byte v4, v9, v4

    .line 76
    .line 77
    aget-byte v6, v9, v6

    .line 78
    .line 79
    aget-byte v7, v9, v7

    .line 80
    .line 81
    if-ltz v5, :cond_5

    .line 82
    .line 83
    if-ltz v4, :cond_5

    .line 84
    .line 85
    if-ltz v6, :cond_5

    .line 86
    .line 87
    if-ltz v7, :cond_5

    .line 88
    .line 89
    shl-int/lit8 v5, v5, 0x2

    .line 90
    .line 91
    ushr-int/lit8 v8, v4, 0x4

    .line 92
    .line 93
    or-int/2addr v5, v8

    .line 94
    and-int/lit8 v4, v4, 0xf

    .line 95
    .line 96
    shl-int/lit8 v4, v4, 0x4

    .line 97
    .line 98
    ushr-int/lit8 v8, v6, 0x2

    .line 99
    .line 100
    or-int/2addr v4, v8

    .line 101
    and-int/lit8 v6, v6, 0x3

    .line 102
    .line 103
    shl-int/lit8 v6, v6, 0x6

    .line 104
    .line 105
    or-int/2addr v6, v7

    .line 106
    add-int/lit8 v7, v3, 0x1

    .line 107
    .line 108
    int-to-byte v5, v5

    .line 109
    aput-byte v5, v2, v3

    .line 110
    .line 111
    if-ge v7, v0, :cond_3

    .line 112
    .line 113
    add-int/lit8 v3, v3, 0x2

    .line 114
    .line 115
    int-to-byte v4, v4

    .line 116
    aput-byte v4, v2, v7

    .line 117
    .line 118
    move v7, v3

    .line 119
    :cond_3
    if-ge v7, v0, :cond_4

    .line 120
    .line 121
    add-int/lit8 v3, v7, 0x1

    .line 122
    .line 123
    int-to-byte v4, v6

    .line 124
    aput-byte v4, v2, v7

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_4
    move v3, v7

    .line 128
    goto :goto_1

    .line 129
    :cond_5
    invoke-static {v8}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-object v1

    .line 133
    :cond_6
    invoke-static {v8}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return-object v1

    .line 137
    :cond_7
    return-object v2

    .line 138
    :cond_8
    const-string p0, "Length of Base64 encoded input string is not a multiple of 4."

    .line 139
    .line 140
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-object v1
.end method

.method public static e([B)[C
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    array-length v1, p0

    .line 3
    invoke-static {p0, v0, v1}, Ll/ptq0;->f([BII)[C

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static f([BII)[C
    .locals 10

    .line 1
    mul-int/lit8 v0, p2, 0x4

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    div-int/lit8 v0, v0, 0x3

    .line 6
    .line 7
    add-int/lit8 v1, p2, 0x2

    .line 8
    .line 9
    div-int/lit8 v1, v1, 0x3

    .line 10
    .line 11
    mul-int/lit8 v1, v1, 0x4

    .line 12
    .line 13
    new-array v1, v1, [C

    .line 14
    .line 15
    add-int/2addr p2, p1

    .line 16
    const/4 v2, 0x0

    .line 17
    move v3, v2

    .line 18
    :goto_0
    if-ge p1, p2, :cond_4

    .line 19
    .line 20
    add-int/lit8 v4, p1, 0x1

    .line 21
    .line 22
    aget-byte v5, p0, p1

    .line 23
    .line 24
    and-int/lit16 v6, v5, 0xff

    .line 25
    .line 26
    if-ge v4, p2, :cond_0

    .line 27
    .line 28
    add-int/lit8 p1, p1, 0x2

    .line 29
    .line 30
    aget-byte v4, p0, v4

    .line 31
    .line 32
    and-int/lit16 v4, v4, 0xff

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    move p1, v4

    .line 36
    move v4, v2

    .line 37
    :goto_1
    if-ge p1, p2, :cond_1

    .line 38
    .line 39
    add-int/lit8 v7, p1, 0x1

    .line 40
    .line 41
    aget-byte p1, p0, p1

    .line 42
    .line 43
    and-int/lit16 p1, p1, 0xff

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_1
    move v7, p1

    .line 47
    move p1, v2

    .line 48
    :goto_2
    ushr-int/lit8 v6, v6, 0x2

    .line 49
    .line 50
    and-int/lit8 v5, v5, 0x3

    .line 51
    .line 52
    shl-int/lit8 v5, v5, 0x4

    .line 53
    .line 54
    ushr-int/lit8 v8, v4, 0x4

    .line 55
    .line 56
    or-int/2addr v5, v8

    .line 57
    and-int/lit8 v4, v4, 0xf

    .line 58
    .line 59
    shl-int/lit8 v4, v4, 0x2

    .line 60
    .line 61
    ushr-int/lit8 v8, p1, 0x6

    .line 62
    .line 63
    or-int/2addr v4, v8

    .line 64
    and-int/lit8 p1, p1, 0x3f

    .line 65
    .line 66
    add-int/lit8 v8, v3, 0x1

    .line 67
    .line 68
    sget-object v9, Ll/ptq0;->b:[C

    .line 69
    .line 70
    aget-char v6, v9, v6

    .line 71
    .line 72
    aput-char v6, v1, v3

    .line 73
    .line 74
    add-int/lit8 v6, v3, 0x2

    .line 75
    .line 76
    aget-char v5, v9, v5

    .line 77
    .line 78
    aput-char v5, v1, v8

    .line 79
    .line 80
    const/16 v5, 0x3d

    .line 81
    .line 82
    if-ge v6, v0, :cond_2

    .line 83
    .line 84
    aget-char v4, v9, v4

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_2
    move v4, v5

    .line 88
    :goto_3
    aput-char v4, v1, v6

    .line 89
    .line 90
    add-int/lit8 v4, v3, 0x3

    .line 91
    .line 92
    if-ge v4, v0, :cond_3

    .line 93
    .line 94
    aget-char v5, v9, p1

    .line 95
    .line 96
    :cond_3
    aput-char v5, v1, v4

    .line 97
    .line 98
    add-int/lit8 v3, v3, 0x4

    .line 99
    .line 100
    move p1, v7

    .line 101
    goto :goto_0

    .line 102
    :cond_4
    return-object v1
.end method

.method public static g(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ptq0;->b(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
