.class public Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private checksumsize:I

.field private gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

.field private keysize:I

.field private mdsize:I

.field private messDigestOTS:Lorg/spongycastle/crypto/Digest;

.field private messagesize:I

.field private privateKeyOTS:[[B

.field private w:I


# direct methods
.method public constructor <init>([BLorg/spongycastle/crypto/Digest;I)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 7
    .line 8
    new-instance v0, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 9
    .line 10
    invoke-direct {v0, p2}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 14
    .line 15
    iget-object p2, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 16
    .line 17
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iput p2, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 22
    .line 23
    shl-int/lit8 p2, p2, 0x3

    .line 24
    .line 25
    int-to-double v0, p2

    .line 26
    int-to-double v2, p3

    .line 27
    div-double/2addr v0, v2

    .line 28
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    double-to-int p2, v0

    .line 33
    iput p2, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messagesize:I

    .line 34
    .line 35
    shl-int/2addr p2, p3

    .line 36
    const/4 p3, 0x1

    .line 37
    add-int/2addr p2, p3

    .line 38
    invoke-virtual {p0, p2}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->getLog(I)I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iput p2, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->checksumsize:I

    .line 43
    .line 44
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messagesize:I

    .line 45
    .line 46
    int-to-double v4, p2

    .line 47
    div-double/2addr v4, v2

    .line 48
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 49
    .line 50
    .line 51
    move-result-wide v1

    .line 52
    double-to-int p2, v1

    .line 53
    add-int/2addr v0, p2

    .line 54
    iput v0, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->keysize:I

    .line 55
    .line 56
    iget p2, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 57
    .line 58
    const/4 v1, 0x2

    .line 59
    new-array v1, v1, [I

    .line 60
    .line 61
    aput p2, v1, p3

    .line 62
    .line 63
    const/4 p2, 0x0

    .line 64
    aput v0, v1, p2

    .line 65
    .line 66
    sget-object p3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 67
    .line 68
    invoke-static {p3, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    check-cast p3, [[B

    .line 73
    .line 74
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 75
    .line 76
    iget p3, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 77
    .line 78
    new-array v0, p3, [B

    .line 79
    .line 80
    invoke-static {p1, p2, v0, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 81
    .line 82
    .line 83
    :goto_0
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->keysize:I

    .line 84
    .line 85
    if-ge p2, p1, :cond_0

    .line 86
    .line 87
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 88
    .line 89
    iget-object p3, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 90
    .line 91
    invoke-virtual {p3, v0}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    aput-object p3, p1, p2

    .line 96
    .line 97
    add-int/lit8 p2, p2, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    return-void
.end method


# virtual methods
.method public getLog(I)I
    .locals 1

    const/4 p0, 0x1

    const/4 v0, 0x2

    :goto_0
    if-ge v0, p1, :cond_0

    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    return p0
.end method

.method public getPrivateKey()[[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getPublicKey()[B
    .locals 9

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->keysize:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 4
    .line 5
    mul-int/2addr v0, v1

    .line 6
    new-array v2, v0, [B

    .line 7
    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 12
    .line 13
    shl-int/2addr v1, v3

    .line 14
    const/4 v3, 0x0

    .line 15
    move v4, v3

    .line 16
    :goto_0
    iget v5, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->keysize:I

    .line 17
    .line 18
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 19
    .line 20
    if-ge v4, v5, :cond_1

    .line 21
    .line 22
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 23
    .line 24
    aget-object v5, v5, v4

    .line 25
    .line 26
    array-length v7, v5

    .line 27
    invoke-interface {v6, v5, v3, v7}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 28
    .line 29
    .line 30
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 31
    .line 32
    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    new-array v5, v5, [B

    .line 37
    .line 38
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 39
    .line 40
    invoke-interface {v6, v5, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 41
    .line 42
    .line 43
    const/4 v6, 0x2

    .line 44
    :goto_1
    if-ge v6, v1, :cond_0

    .line 45
    .line 46
    iget-object v7, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 47
    .line 48
    array-length v8, v5

    .line 49
    invoke-interface {v7, v5, v3, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 50
    .line 51
    .line 52
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 53
    .line 54
    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    new-array v5, v5, [B

    .line 59
    .line 60
    iget-object v7, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 61
    .line 62
    invoke-interface {v7, v5, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 63
    .line 64
    .line 65
    add-int/lit8 v6, v6, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_0
    iget v6, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 69
    .line 70
    mul-int v7, v6, v4

    .line 71
    .line 72
    invoke-static {v5, v3, v2, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 73
    .line 74
    .line 75
    add-int/lit8 v4, v4, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    invoke-interface {v6, v2, v3, v0}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 82
    .line 83
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    new-array v0, v0, [B

    .line 88
    .line 89
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 90
    .line 91
    invoke-interface {p0, v0, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 92
    .line 93
    .line 94
    return-object v0
.end method

.method public getSignature([B)[B
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->keysize:I

    .line 6
    .line 7
    iget v3, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 8
    .line 9
    mul-int/2addr v2, v3

    .line 10
    new-array v2, v2, [B

    .line 11
    .line 12
    new-array v3, v3, [B

    .line 13
    .line 14
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 15
    .line 16
    array-length v4, v1

    .line 17
    const/4 v5, 0x0

    .line 18
    invoke-interface {v3, v1, v5, v4}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 19
    .line 20
    .line 21
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 22
    .line 23
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    new-array v3, v1, [B

    .line 28
    .line 29
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 30
    .line 31
    invoke-interface {v4, v3, v5}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 32
    .line 33
    .line 34
    iget v4, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 35
    .line 36
    const/16 v6, 0x8

    .line 37
    .line 38
    rem-int v7, v6, v4

    .line 39
    .line 40
    const/4 v8, 0x1

    .line 41
    if-nez v7, :cond_4

    .line 42
    .line 43
    div-int/2addr v6, v4

    .line 44
    shl-int v4, v8, v4

    .line 45
    .line 46
    sub-int/2addr v4, v8

    .line 47
    iget v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 48
    .line 49
    new-array v7, v7, [B

    .line 50
    .line 51
    move v8, v5

    .line 52
    move v9, v8

    .line 53
    move v10, v9

    .line 54
    :goto_0
    if-ge v8, v1, :cond_2

    .line 55
    .line 56
    move v11, v5

    .line 57
    :goto_1
    if-ge v11, v6, :cond_1

    .line 58
    .line 59
    aget-byte v12, v3, v8

    .line 60
    .line 61
    and-int/2addr v12, v4

    .line 62
    add-int/2addr v9, v12

    .line 63
    iget-object v13, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 64
    .line 65
    aget-object v13, v13, v10

    .line 66
    .line 67
    iget v14, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 68
    .line 69
    invoke-static {v13, v5, v7, v5, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    .line 71
    .line 72
    :goto_2
    if-lez v12, :cond_0

    .line 73
    .line 74
    iget-object v13, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 75
    .line 76
    array-length v14, v7

    .line 77
    invoke-interface {v13, v7, v5, v14}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 78
    .line 79
    .line 80
    iget-object v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 81
    .line 82
    invoke-interface {v7}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    new-array v7, v7, [B

    .line 87
    .line 88
    iget-object v13, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 89
    .line 90
    invoke-interface {v13, v7, v5}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 91
    .line 92
    .line 93
    add-int/lit8 v12, v12, -0x1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_0
    iget v12, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 97
    .line 98
    mul-int v13, v10, v12

    .line 99
    .line 100
    invoke-static {v7, v5, v2, v13, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 101
    .line 102
    .line 103
    aget-byte v12, v3, v8

    .line 104
    .line 105
    iget v13, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 106
    .line 107
    ushr-int/2addr v12, v13

    .line 108
    int-to-byte v12, v12

    .line 109
    aput-byte v12, v3, v8

    .line 110
    .line 111
    add-int/lit8 v10, v10, 0x1

    .line 112
    .line 113
    add-int/lit8 v11, v11, 0x1

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_1
    add-int/lit8 v8, v8, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_2
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messagesize:I

    .line 120
    .line 121
    iget v3, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 122
    .line 123
    shl-int/2addr v1, v3

    .line 124
    sub-int/2addr v1, v9

    .line 125
    move v3, v5

    .line 126
    :goto_3
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->checksumsize:I

    .line 127
    .line 128
    if-ge v3, v6, :cond_15

    .line 129
    .line 130
    and-int v6, v1, v4

    .line 131
    .line 132
    iget-object v8, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 133
    .line 134
    aget-object v8, v8, v10

    .line 135
    .line 136
    iget v9, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 137
    .line 138
    invoke-static {v8, v5, v7, v5, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 139
    .line 140
    .line 141
    :goto_4
    if-lez v6, :cond_3

    .line 142
    .line 143
    iget-object v8, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 144
    .line 145
    array-length v9, v7

    .line 146
    invoke-interface {v8, v7, v5, v9}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 147
    .line 148
    .line 149
    iget-object v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 150
    .line 151
    invoke-interface {v7}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 152
    .line 153
    .line 154
    move-result v7

    .line 155
    new-array v7, v7, [B

    .line 156
    .line 157
    iget-object v8, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 158
    .line 159
    invoke-interface {v8, v7, v5}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 160
    .line 161
    .line 162
    add-int/lit8 v6, v6, -0x1

    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_3
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 166
    .line 167
    mul-int v8, v10, v6

    .line 168
    .line 169
    invoke-static {v7, v5, v2, v8, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 170
    .line 171
    .line 172
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 173
    .line 174
    ushr-int/2addr v1, v6

    .line 175
    add-int/lit8 v10, v10, 0x1

    .line 176
    .line 177
    add-int/2addr v3, v6

    .line 178
    goto :goto_3

    .line 179
    :cond_4
    if-ge v4, v6, :cond_d

    .line 180
    .line 181
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 182
    .line 183
    div-int v7, v1, v4

    .line 184
    .line 185
    shl-int v4, v8, v4

    .line 186
    .line 187
    sub-int/2addr v4, v8

    .line 188
    new-array v1, v1, [B

    .line 189
    .line 190
    move v11, v5

    .line 191
    move v12, v11

    .line 192
    move v13, v12

    .line 193
    move v14, v13

    .line 194
    :goto_5
    if-ge v11, v7, :cond_8

    .line 195
    .line 196
    move v15, v5

    .line 197
    move/from16 p1, v8

    .line 198
    .line 199
    const-wide/16 v16, 0x0

    .line 200
    .line 201
    :goto_6
    iget v8, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 202
    .line 203
    if-ge v15, v8, :cond_5

    .line 204
    .line 205
    aget-byte v8, v3, v12

    .line 206
    .line 207
    and-int/lit16 v8, v8, 0xff

    .line 208
    .line 209
    shl-int/lit8 v18, v15, 0x3

    .line 210
    .line 211
    shl-int v8, v8, v18

    .line 212
    .line 213
    const-wide/16 v18, 0x0

    .line 214
    .line 215
    int-to-long v9, v8

    .line 216
    xor-long v16, v16, v9

    .line 217
    .line 218
    add-int/lit8 v12, v12, 0x1

    .line 219
    .line 220
    add-int/lit8 v15, v15, 0x1

    .line 221
    .line 222
    goto :goto_6

    .line 223
    :cond_5
    const-wide/16 v18, 0x0

    .line 224
    .line 225
    move v8, v5

    .line 226
    :goto_7
    if-ge v8, v6, :cond_7

    .line 227
    .line 228
    int-to-long v9, v4

    .line 229
    and-long v9, v16, v9

    .line 230
    .line 231
    long-to-int v9, v9

    .line 232
    add-int/2addr v14, v9

    .line 233
    iget-object v10, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 234
    .line 235
    aget-object v10, v10, v13

    .line 236
    .line 237
    iget v15, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 238
    .line 239
    invoke-static {v10, v5, v1, v5, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 240
    .line 241
    .line 242
    :goto_8
    if-lez v9, :cond_6

    .line 243
    .line 244
    iget-object v10, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 245
    .line 246
    array-length v15, v1

    .line 247
    invoke-interface {v10, v1, v5, v15}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 248
    .line 249
    .line 250
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 251
    .line 252
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    new-array v1, v1, [B

    .line 257
    .line 258
    iget-object v10, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 259
    .line 260
    invoke-interface {v10, v1, v5}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 261
    .line 262
    .line 263
    add-int/lit8 v9, v9, -0x1

    .line 264
    .line 265
    goto :goto_8

    .line 266
    :cond_6
    iget v9, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 267
    .line 268
    mul-int v10, v13, v9

    .line 269
    .line 270
    invoke-static {v1, v5, v2, v10, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 271
    .line 272
    .line 273
    iget v9, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 274
    .line 275
    ushr-long v16, v16, v9

    .line 276
    .line 277
    add-int/lit8 v13, v13, 0x1

    .line 278
    .line 279
    add-int/lit8 v8, v8, 0x1

    .line 280
    .line 281
    goto :goto_7

    .line 282
    :cond_7
    add-int/lit8 v11, v11, 0x1

    .line 283
    .line 284
    move/from16 v8, p1

    .line 285
    .line 286
    goto :goto_5

    .line 287
    :cond_8
    move/from16 p1, v8

    .line 288
    .line 289
    const-wide/16 v18, 0x0

    .line 290
    .line 291
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 292
    .line 293
    iget v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 294
    .line 295
    rem-int/2addr v6, v7

    .line 296
    move v7, v5

    .line 297
    move-wide/from16 v9, v18

    .line 298
    .line 299
    :goto_9
    if-ge v7, v6, :cond_9

    .line 300
    .line 301
    aget-byte v8, v3, v12

    .line 302
    .line 303
    and-int/lit16 v8, v8, 0xff

    .line 304
    .line 305
    shl-int/lit8 v11, v7, 0x3

    .line 306
    .line 307
    shl-int/2addr v8, v11

    .line 308
    move v15, v6

    .line 309
    int-to-long v5, v8

    .line 310
    xor-long/2addr v9, v5

    .line 311
    add-int/lit8 v12, v12, 0x1

    .line 312
    .line 313
    add-int/lit8 v7, v7, 0x1

    .line 314
    .line 315
    move v6, v15

    .line 316
    const/4 v5, 0x0

    .line 317
    goto :goto_9

    .line 318
    :cond_9
    move v15, v6

    .line 319
    shl-int/lit8 v3, v15, 0x3

    .line 320
    .line 321
    const/4 v5, 0x0

    .line 322
    :goto_a
    if-ge v5, v3, :cond_b

    .line 323
    .line 324
    int-to-long v6, v4

    .line 325
    and-long/2addr v6, v9

    .line 326
    long-to-int v6, v6

    .line 327
    add-int/2addr v14, v6

    .line 328
    iget-object v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 329
    .line 330
    aget-object v7, v7, v13

    .line 331
    .line 332
    iget v8, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 333
    .line 334
    const/4 v11, 0x0

    .line 335
    invoke-static {v7, v11, v1, v11, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 336
    .line 337
    .line 338
    :goto_b
    if-lez v6, :cond_a

    .line 339
    .line 340
    iget-object v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 341
    .line 342
    array-length v8, v1

    .line 343
    invoke-interface {v7, v1, v11, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 344
    .line 345
    .line 346
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 347
    .line 348
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 349
    .line 350
    .line 351
    move-result v1

    .line 352
    new-array v1, v1, [B

    .line 353
    .line 354
    iget-object v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 355
    .line 356
    invoke-interface {v7, v1, v11}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 357
    .line 358
    .line 359
    add-int/lit8 v6, v6, -0x1

    .line 360
    .line 361
    goto :goto_b

    .line 362
    :cond_a
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 363
    .line 364
    mul-int v7, v13, v6

    .line 365
    .line 366
    invoke-static {v1, v11, v2, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 367
    .line 368
    .line 369
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 370
    .line 371
    ushr-long/2addr v9, v6

    .line 372
    add-int/lit8 v13, v13, 0x1

    .line 373
    .line 374
    add-int/2addr v5, v6

    .line 375
    goto :goto_a

    .line 376
    :cond_b
    iget v3, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messagesize:I

    .line 377
    .line 378
    iget v5, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 379
    .line 380
    shl-int/2addr v3, v5

    .line 381
    sub-int/2addr v3, v14

    .line 382
    const/4 v5, 0x0

    .line 383
    :goto_c
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->checksumsize:I

    .line 384
    .line 385
    if-ge v5, v6, :cond_15

    .line 386
    .line 387
    and-int v6, v3, v4

    .line 388
    .line 389
    iget-object v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 390
    .line 391
    aget-object v7, v7, v13

    .line 392
    .line 393
    iget v8, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 394
    .line 395
    const/4 v11, 0x0

    .line 396
    invoke-static {v7, v11, v1, v11, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 397
    .line 398
    .line 399
    :goto_d
    if-lez v6, :cond_c

    .line 400
    .line 401
    iget-object v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 402
    .line 403
    array-length v8, v1

    .line 404
    invoke-interface {v7, v1, v11, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 405
    .line 406
    .line 407
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 408
    .line 409
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 410
    .line 411
    .line 412
    move-result v1

    .line 413
    new-array v1, v1, [B

    .line 414
    .line 415
    iget-object v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 416
    .line 417
    invoke-interface {v7, v1, v11}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 418
    .line 419
    .line 420
    add-int/lit8 v6, v6, -0x1

    .line 421
    .line 422
    goto :goto_d

    .line 423
    :cond_c
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 424
    .line 425
    mul-int v7, v13, v6

    .line 426
    .line 427
    invoke-static {v1, v11, v2, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 428
    .line 429
    .line 430
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 431
    .line 432
    ushr-int/2addr v3, v6

    .line 433
    add-int/lit8 v13, v13, 0x1

    .line 434
    .line 435
    add-int/2addr v5, v6

    .line 436
    goto :goto_c

    .line 437
    :cond_d
    move/from16 p1, v8

    .line 438
    .line 439
    const-wide/16 v18, 0x0

    .line 440
    .line 441
    const/16 v1, 0x39

    .line 442
    .line 443
    if-ge v4, v1, :cond_15

    .line 444
    .line 445
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 446
    .line 447
    shl-int/lit8 v5, v1, 0x3

    .line 448
    .line 449
    sub-int/2addr v5, v4

    .line 450
    shl-int v4, p1, v4

    .line 451
    .line 452
    add-int/lit8 v4, v4, -0x1

    .line 453
    .line 454
    new-array v1, v1, [B

    .line 455
    .line 456
    const/4 v7, 0x0

    .line 457
    const/4 v8, 0x0

    .line 458
    const/4 v9, 0x0

    .line 459
    :goto_e
    if-gt v7, v5, :cond_10

    .line 460
    .line 461
    ushr-int/lit8 v10, v7, 0x3

    .line 462
    .line 463
    rem-int/lit8 v14, v7, 0x8

    .line 464
    .line 465
    iget v15, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 466
    .line 467
    add-int/2addr v7, v15

    .line 468
    add-int/lit8 v15, v7, 0x7

    .line 469
    .line 470
    ushr-int/lit8 v15, v15, 0x3

    .line 471
    .line 472
    move-wide/from16 v20, v18

    .line 473
    .line 474
    const/16 v16, 0x0

    .line 475
    .line 476
    :goto_f
    if-ge v10, v15, :cond_e

    .line 477
    .line 478
    move/from16 v17, v6

    .line 479
    .line 480
    aget-byte v6, v3, v10

    .line 481
    .line 482
    and-int/lit16 v6, v6, 0xff

    .line 483
    .line 484
    shl-int/lit8 v22, v16, 0x3

    .line 485
    .line 486
    shl-int v6, v6, v22

    .line 487
    .line 488
    const-wide/16 v23, 0x1

    .line 489
    .line 490
    int-to-long v11, v6

    .line 491
    xor-long v20, v20, v11

    .line 492
    .line 493
    add-int/lit8 v16, v16, 0x1

    .line 494
    .line 495
    add-int/lit8 v10, v10, 0x1

    .line 496
    .line 497
    move/from16 v6, v17

    .line 498
    .line 499
    goto :goto_f

    .line 500
    :cond_e
    move/from16 v17, v6

    .line 501
    .line 502
    const-wide/16 v23, 0x1

    .line 503
    .line 504
    ushr-long v10, v20, v14

    .line 505
    .line 506
    int-to-long v12, v4

    .line 507
    and-long/2addr v10, v12

    .line 508
    int-to-long v12, v9

    .line 509
    add-long/2addr v12, v10

    .line 510
    long-to-int v9, v12

    .line 511
    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 512
    .line 513
    aget-object v6, v6, v8

    .line 514
    .line 515
    iget v12, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 516
    .line 517
    const/4 v13, 0x0

    .line 518
    invoke-static {v6, v13, v1, v13, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 519
    .line 520
    .line 521
    :goto_10
    cmp-long v6, v10, v18

    .line 522
    .line 523
    if-lez v6, :cond_f

    .line 524
    .line 525
    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 526
    .line 527
    array-length v12, v1

    .line 528
    invoke-interface {v6, v1, v13, v12}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 529
    .line 530
    .line 531
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 532
    .line 533
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 534
    .line 535
    .line 536
    move-result v1

    .line 537
    new-array v1, v1, [B

    .line 538
    .line 539
    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 540
    .line 541
    invoke-interface {v6, v1, v13}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 542
    .line 543
    .line 544
    sub-long v10, v10, v23

    .line 545
    .line 546
    goto :goto_10

    .line 547
    :cond_f
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 548
    .line 549
    mul-int v10, v8, v6

    .line 550
    .line 551
    invoke-static {v1, v13, v2, v10, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 552
    .line 553
    .line 554
    add-int/lit8 v8, v8, 0x1

    .line 555
    .line 556
    move/from16 v6, v17

    .line 557
    .line 558
    goto :goto_e

    .line 559
    :cond_10
    move/from16 v17, v6

    .line 560
    .line 561
    const-wide/16 v23, 0x1

    .line 562
    .line 563
    ushr-int/lit8 v5, v7, 0x3

    .line 564
    .line 565
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 566
    .line 567
    if-ge v5, v6, :cond_13

    .line 568
    .line 569
    rem-int/lit8 v7, v7, 0x8

    .line 570
    .line 571
    move-wide/from16 v12, v18

    .line 572
    .line 573
    const/4 v6, 0x0

    .line 574
    :goto_11
    iget v10, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 575
    .line 576
    if-ge v5, v10, :cond_11

    .line 577
    .line 578
    aget-byte v10, v3, v5

    .line 579
    .line 580
    and-int/lit16 v10, v10, 0xff

    .line 581
    .line 582
    shl-int/lit8 v14, v6, 0x3

    .line 583
    .line 584
    shl-int/2addr v10, v14

    .line 585
    int-to-long v14, v10

    .line 586
    xor-long/2addr v12, v14

    .line 587
    add-int/lit8 v6, v6, 0x1

    .line 588
    .line 589
    add-int/lit8 v5, v5, 0x1

    .line 590
    .line 591
    goto :goto_11

    .line 592
    :cond_11
    ushr-long v5, v12, v7

    .line 593
    .line 594
    int-to-long v12, v4

    .line 595
    and-long/2addr v5, v12

    .line 596
    int-to-long v12, v9

    .line 597
    add-long/2addr v12, v5

    .line 598
    long-to-int v9, v12

    .line 599
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 600
    .line 601
    aget-object v3, v3, v8

    .line 602
    .line 603
    const/4 v11, 0x0

    .line 604
    invoke-static {v3, v11, v1, v11, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 605
    .line 606
    .line 607
    :goto_12
    cmp-long v3, v5, v18

    .line 608
    .line 609
    if-lez v3, :cond_12

    .line 610
    .line 611
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 612
    .line 613
    array-length v7, v1

    .line 614
    invoke-interface {v3, v1, v11, v7}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 615
    .line 616
    .line 617
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 618
    .line 619
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 620
    .line 621
    .line 622
    move-result v1

    .line 623
    new-array v1, v1, [B

    .line 624
    .line 625
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 626
    .line 627
    invoke-interface {v3, v1, v11}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 628
    .line 629
    .line 630
    sub-long v5, v5, v23

    .line 631
    .line 632
    goto :goto_12

    .line 633
    :cond_12
    iget v3, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 634
    .line 635
    mul-int v5, v8, v3

    .line 636
    .line 637
    invoke-static {v1, v11, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 638
    .line 639
    .line 640
    add-int/lit8 v8, v8, 0x1

    .line 641
    .line 642
    :cond_13
    iget v3, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messagesize:I

    .line 643
    .line 644
    iget v5, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 645
    .line 646
    shl-int/2addr v3, v5

    .line 647
    sub-int/2addr v3, v9

    .line 648
    const/4 v5, 0x0

    .line 649
    :goto_13
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->checksumsize:I

    .line 650
    .line 651
    if-ge v5, v6, :cond_15

    .line 652
    .line 653
    and-int v6, v3, v4

    .line 654
    .line 655
    int-to-long v6, v6

    .line 656
    iget-object v9, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->privateKeyOTS:[[B

    .line 657
    .line 658
    aget-object v9, v9, v8

    .line 659
    .line 660
    iget v10, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 661
    .line 662
    const/4 v11, 0x0

    .line 663
    invoke-static {v9, v11, v1, v11, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 664
    .line 665
    .line 666
    :goto_14
    cmp-long v9, v6, v18

    .line 667
    .line 668
    if-lez v9, :cond_14

    .line 669
    .line 670
    iget-object v9, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 671
    .line 672
    array-length v10, v1

    .line 673
    invoke-interface {v9, v1, v11, v10}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 674
    .line 675
    .line 676
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 677
    .line 678
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 679
    .line 680
    .line 681
    move-result v1

    .line 682
    new-array v1, v1, [B

    .line 683
    .line 684
    iget-object v9, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 685
    .line 686
    invoke-interface {v9, v1, v11}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 687
    .line 688
    .line 689
    sub-long v6, v6, v23

    .line 690
    .line 691
    goto :goto_14

    .line 692
    :cond_14
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->mdsize:I

    .line 693
    .line 694
    mul-int v7, v8, v6

    .line 695
    .line 696
    invoke-static {v1, v11, v2, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 697
    .line 698
    .line 699
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->w:I

    .line 700
    .line 701
    ushr-int/2addr v3, v6

    .line 702
    add-int/lit8 v8, v8, 0x1

    .line 703
    .line 704
    add-int/2addr v5, v6

    .line 705
    goto :goto_13

    .line 706
    :cond_15
    return-object v2
.end method
