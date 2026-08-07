.class public Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final decodingTable:[B

.field private static final encodingTable:[B

.field private static final version:Ljava/lang/String; = "2a"


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodingTable:[B

    .line 9
    .line 10
    const/16 v0, 0x80

    .line 11
    .line 12
    new-array v0, v0, [B

    .line 13
    .line 14
    sput-object v0, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    move v1, v0

    .line 18
    :goto_0
    sget-object v2, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    .line 19
    .line 20
    array-length v3, v2

    .line 21
    if-ge v1, v3, :cond_0

    .line 22
    .line 23
    const/4 v3, -0x1

    .line 24
    aput-byte v3, v2, v1

    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :goto_1
    sget-object v1, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodingTable:[B

    .line 30
    .line 31
    array-length v2, v1

    .line 32
    if-ge v0, v2, :cond_1

    .line 33
    .line 34
    sget-object v2, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    .line 35
    .line 36
    aget-byte v1, v1, v0

    .line 37
    .line 38
    int-to-byte v3, v0

    .line 39
    aput-byte v3, v2, v1

    .line 40
    .line 41
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    return-void

    .line 45
    :array_0
    .array-data 1
        0x2et
        0x2ft
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
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
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

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static checkPassword(Ljava/lang/String;[C)Z
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x3c

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_4

    .line 9
    .line 10
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v1, 0x24

    .line 15
    .line 16
    if-ne v0, v1, :cond_3

    .line 17
    .line 18
    const/4 v0, 0x3

    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-ne v3, v1, :cond_3

    .line 24
    .line 25
    const/4 v3, 0x6

    .line 26
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-ne v4, v1, :cond_3

    .line 31
    .line 32
    const/4 v4, 0x1

    .line 33
    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v5, "2a"

    .line 38
    .line 39
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    const/4 v0, 0x4

    .line 46
    :try_start_0
    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    if-lt v3, v0, :cond_1

    .line 55
    .line 56
    const/16 v0, 0x1f

    .line 57
    .line 58
    if-gt v3, v0, :cond_1

    .line 59
    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    add-int/2addr v1, v4

    .line 67
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    sub-int/2addr v2, v0

    .line 72
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodeSaltString(Ljava/lang/String;)[B

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {p1, v0, v3}, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->generate([C[BI)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    return p0

    .line 89
    :cond_0
    const-string p0, "Missing password."

    .line 90
    .line 91
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return v2

    .line 95
    :cond_1
    const-string p0, "Invalid cost factor: "

    .line 96
    .line 97
    const-string p1, ", 4 < cost < 31 expected."

    .line 98
    .line 99
    invoke-static {p0, v3, p1}, Ll/i2r0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return v2

    .line 103
    :catch_0
    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string p1, "Invalid cost factor:"

    .line 108
    .line 109
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return v2

    .line 117
    :cond_2
    const-string p0, "Wrong Bcrypt version, 2a expected."

    .line 118
    .line 119
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return v2

    .line 123
    :cond_3
    const-string p0, "Invalid Bcrypt String format."

    .line 124
    .line 125
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return v2

    .line 129
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    const-string p1, ", 60 required."

    .line 134
    .line 135
    const-string v0, "Bcrypt String length: "

    .line 136
    .line 137
    invoke-static {v0, p0, p1}, Ll/gx50;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    return v2
.end method

.method private static createBcryptString([B[BI)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    const/16 v1, 0x3c

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const-string v1, "$2a$"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 11
    .line 12
    .line 13
    const/16 v1, 0xa

    .line 14
    .line 15
    if-ge p2, v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "0"

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 37
    .line 38
    .line 39
    const/16 v1, 0x24

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodeData([B)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 49
    .line 50
    .line 51
    invoke-static {p0, p1, p2}, Lorg/spongycastle/crypto/generators/BCrypt;->generate([B[BI)[B

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodeData([B)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method private static decodeSaltString(Ljava/lang/String;)[B
    .locals 10

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 6
    .line 7
    const/16 v1, 0x10

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 10
    .line 11
    .line 12
    array-length v2, p0

    .line 13
    const/16 v3, 0x16

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    if-ne v2, v3, :cond_4

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    move v3, v2

    .line 20
    :goto_0
    array-length v5, p0

    .line 21
    if-ge v3, v5, :cond_2

    .line 22
    .line 23
    aget-char v5, p0, v3

    .line 24
    .line 25
    const/16 v6, 0x7a

    .line 26
    .line 27
    if-gt v5, v6, :cond_1

    .line 28
    .line 29
    const/16 v6, 0x2e

    .line 30
    .line 31
    if-lt v5, v6, :cond_1

    .line 32
    .line 33
    const/16 v6, 0x39

    .line 34
    .line 35
    if-le v5, v6, :cond_0

    .line 36
    .line 37
    const/16 v6, 0x41

    .line 38
    .line 39
    if-lt v5, v6, :cond_1

    .line 40
    .line 41
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-string p0, "Salt string contains invalid character: "

    .line 45
    .line 46
    invoke-static {p0, v5}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    return-object v4

    .line 50
    :cond_2
    const/16 v3, 0x18

    .line 51
    .line 52
    new-array v4, v3, [C

    .line 53
    .line 54
    array-length v5, p0

    .line 55
    invoke-static {p0, v2, v4, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    .line 57
    .line 58
    move p0, v2

    .line 59
    :goto_1
    if-ge p0, v3, :cond_3

    .line 60
    .line 61
    sget-object v5, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    .line 62
    .line 63
    aget-char v6, v4, p0

    .line 64
    .line 65
    aget-byte v6, v5, v6

    .line 66
    .line 67
    add-int/lit8 v7, p0, 0x1

    .line 68
    .line 69
    aget-char v7, v4, v7

    .line 70
    .line 71
    aget-byte v7, v5, v7

    .line 72
    .line 73
    add-int/lit8 v8, p0, 0x2

    .line 74
    .line 75
    aget-char v8, v4, v8

    .line 76
    .line 77
    aget-byte v8, v5, v8

    .line 78
    .line 79
    add-int/lit8 v9, p0, 0x3

    .line 80
    .line 81
    aget-char v9, v4, v9

    .line 82
    .line 83
    aget-byte v5, v5, v9

    .line 84
    .line 85
    shl-int/lit8 v6, v6, 0x2

    .line 86
    .line 87
    shr-int/lit8 v9, v7, 0x4

    .line 88
    .line 89
    or-int/2addr v6, v9

    .line 90
    invoke-virtual {v0, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 91
    .line 92
    .line 93
    shl-int/lit8 v6, v7, 0x4

    .line 94
    .line 95
    shr-int/lit8 v7, v8, 0x2

    .line 96
    .line 97
    or-int/2addr v6, v7

    .line 98
    invoke-virtual {v0, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 99
    .line 100
    .line 101
    shl-int/lit8 v6, v8, 0x6

    .line 102
    .line 103
    or-int/2addr v5, v6

    .line 104
    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 105
    .line 106
    .line 107
    add-int/lit8 p0, p0, 0x4

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    new-array v0, v1, [B

    .line 115
    .line 116
    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 117
    .line 118
    .line 119
    return-object v0

    .line 120
    :cond_4
    array-length p0, p0

    .line 121
    const-string v0, " , 22 required."

    .line 122
    .line 123
    const-string v1, "Invalid base64 salt length: "

    .line 124
    .line 125
    invoke-static {v1, p0, v0}, Ll/gx50;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    return-object v4
.end method

.method private static encodeData([B)Ljava/lang/String;
    .locals 12

    .line 1
    array-length v0, p0

    .line 2
    const/16 v1, 0x18

    .line 3
    .line 4
    const/16 v2, 0x10

    .line 5
    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    array-length v0, p0

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    array-length p0, p0

    .line 13
    const-string v0, ", 24 for key or 16 for salt expected"

    .line 14
    .line 15
    const-string v1, "Invalid length: "

    .line 16
    .line 17
    invoke-static {v1, p0, v0}, Ll/gx50;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :cond_1
    :goto_0
    array-length v0, p0

    .line 23
    const/4 v1, 0x1

    .line 24
    const/4 v3, 0x0

    .line 25
    if-ne v0, v2, :cond_2

    .line 26
    .line 27
    const/16 v0, 0x12

    .line 28
    .line 29
    new-array v0, v0, [B

    .line 30
    .line 31
    array-length v2, p0

    .line 32
    invoke-static {p0, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 33
    .line 34
    .line 35
    move-object p0, v0

    .line 36
    move v0, v1

    .line 37
    goto :goto_1

    .line 38
    :cond_2
    array-length v0, p0

    .line 39
    sub-int/2addr v0, v1

    .line 40
    aput-byte v3, p0, v0

    .line 41
    .line 42
    move v0, v3

    .line 43
    :goto_1
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    .line 44
    .line 45
    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 46
    .line 47
    .line 48
    array-length v4, p0

    .line 49
    move v5, v3

    .line 50
    :goto_2
    if-ge v5, v4, :cond_3

    .line 51
    .line 52
    aget-byte v6, p0, v5

    .line 53
    .line 54
    and-int/lit16 v6, v6, 0xff

    .line 55
    .line 56
    add-int/lit8 v7, v5, 0x1

    .line 57
    .line 58
    aget-byte v7, p0, v7

    .line 59
    .line 60
    and-int/lit16 v7, v7, 0xff

    .line 61
    .line 62
    add-int/lit8 v8, v5, 0x2

    .line 63
    .line 64
    aget-byte v8, p0, v8

    .line 65
    .line 66
    and-int/lit16 v9, v8, 0xff

    .line 67
    .line 68
    sget-object v10, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodingTable:[B

    .line 69
    .line 70
    ushr-int/lit8 v11, v6, 0x2

    .line 71
    .line 72
    and-int/lit8 v11, v11, 0x3f

    .line 73
    .line 74
    aget-byte v11, v10, v11

    .line 75
    .line 76
    invoke-virtual {v2, v11}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 77
    .line 78
    .line 79
    shl-int/lit8 v6, v6, 0x4

    .line 80
    .line 81
    ushr-int/lit8 v11, v7, 0x4

    .line 82
    .line 83
    or-int/2addr v6, v11

    .line 84
    and-int/lit8 v6, v6, 0x3f

    .line 85
    .line 86
    aget-byte v6, v10, v6

    .line 87
    .line 88
    invoke-virtual {v2, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 89
    .line 90
    .line 91
    shl-int/lit8 v6, v7, 0x2

    .line 92
    .line 93
    ushr-int/lit8 v7, v9, 0x6

    .line 94
    .line 95
    or-int/2addr v6, v7

    .line 96
    and-int/lit8 v6, v6, 0x3f

    .line 97
    .line 98
    aget-byte v6, v10, v6

    .line 99
    .line 100
    invoke-virtual {v2, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 101
    .line 102
    .line 103
    and-int/lit8 v6, v8, 0x3f

    .line 104
    .line 105
    aget-byte v6, v10, v6

    .line 106
    .line 107
    invoke-virtual {v2, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 108
    .line 109
    .line 110
    add-int/lit8 v5, v5, 0x3

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_3
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {p0}, Lorg/spongycastle/util/Strings;->fromByteArray([B)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    if-ne v0, v1, :cond_4

    .line 122
    .line 123
    const/16 v0, 0x16

    .line 124
    .line 125
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    sub-int/2addr v0, v1

    .line 135
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    return-object p0
.end method

.method public static generate([C[BI)Ljava/lang/String;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_5

    .line 3
    .line 4
    if-eqz p1, :cond_4

    .line 5
    .line 6
    array-length v1, p1

    .line 7
    const/16 v2, 0x10

    .line 8
    .line 9
    if-ne v1, v2, :cond_3

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    if-lt p2, v1, :cond_2

    .line 13
    .line 14
    const/16 v1, 0x1f

    .line 15
    .line 16
    if-gt p2, v1, :cond_2

    .line 17
    .line 18
    invoke-static {p0}, Lorg/spongycastle/util/Strings;->toUTF8ByteArray([C)[B

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    array-length v0, p0

    .line 23
    const/16 v1, 0x48

    .line 24
    .line 25
    if-lt v0, v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    array-length v0, p0

    .line 29
    add-int/lit8 v1, v0, 0x1

    .line 30
    .line 31
    :goto_0
    new-array v0, v1, [B

    .line 32
    .line 33
    array-length v2, p0

    .line 34
    const/4 v3, 0x0

    .line 35
    if-le v1, v2, :cond_1

    .line 36
    .line 37
    array-length v1, p0

    .line 38
    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    .line 44
    .line 45
    :goto_1
    invoke-static {p0, v3}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, p1, p2}, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->createBcryptString([B[BI)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v0, v3}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_2
    const-string p0, "Invalid cost factor."

    .line 57
    .line 58
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_3
    new-instance p0, Lorg/spongycastle/crypto/DataLengthException;

    .line 63
    .line 64
    array-length p1, p1

    .line 65
    new-instance p2, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v0, "16 byte salt required: "

    .line 68
    .line 69
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    throw p0

    .line 83
    :cond_4
    const-string p0, "Salt required."

    .line 84
    .line 85
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-object v0

    .line 89
    :cond_5
    const-string p0, "Password required."

    .line 90
    .line 91
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-object v0
.end method
