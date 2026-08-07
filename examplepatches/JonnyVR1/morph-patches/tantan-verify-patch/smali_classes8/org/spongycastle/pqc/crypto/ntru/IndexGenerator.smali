.class public Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;
    }
.end annotation


# instance fields
.field private N:I

.field private buf:Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;

.field private c:I

.field private counter:I

.field private hLen:I

.field private hashAlg:Lorg/spongycastle/crypto/Digest;

.field private initialized:Z

.field private minCallsR:I

.field private remLen:I

.field private seed:[B

.field private totLen:I


# direct methods
.method public constructor <init>([BLorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->seed:[B

    .line 5
    .line 6
    iget p1, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->N:I

    .line 7
    .line 8
    iput p1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->N:I

    .line 9
    .line 10
    iget p1, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->c:I

    .line 11
    .line 12
    iput p1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->c:I

    .line 13
    .line 14
    iget p1, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->minCallsR:I

    .line 15
    .line 16
    iput p1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->minCallsR:I

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->totLen:I

    .line 20
    .line 21
    iput p1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->remLen:I

    .line 22
    .line 23
    iput p1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->counter:I

    .line 24
    .line 25
    iget-object p2, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->hashAlg:Lorg/spongycastle/crypto/Digest;

    .line 26
    .line 27
    iput-object p2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hashAlg:Lorg/spongycastle/crypto/Digest;

    .line 28
    .line 29
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    iput p2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hLen:I

    .line 34
    .line 35
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->initialized:Z

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic access$000([BI)[B
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->copyOf([BI)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private appendHash(Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;[B)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hashAlg:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->seed:[B

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-interface {v0, v1, v3, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hashAlg:Lorg/spongycastle/crypto/Digest;

    .line 11
    .line 12
    iget v1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->counter:I

    .line 13
    .line 14
    invoke-direct {p0, v0, v1}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->putInt(Lorg/spongycastle/crypto/Digest;I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hashAlg:Lorg/spongycastle/crypto/Digest;

    .line 18
    .line 19
    invoke-interface {p0, p2, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p2}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->appendBits([B)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private static copyOf([BI)[B
    .locals 2

    .line 1
    new-array v0, p1, [B

    .line 2
    .line 3
    array-length v1, p0

    .line 4
    if-ge p1, v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    array-length p1, p0

    .line 8
    :goto_0
    const/4 v1, 0x0

    .line 9
    invoke-static {p0, v1, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method private putInt(Lorg/spongycastle/crypto/Digest;I)V
    .locals 0

    .line 1
    shr-int/lit8 p0, p2, 0x18

    .line 2
    .line 3
    int-to-byte p0, p0

    .line 4
    invoke-interface {p1, p0}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 5
    .line 6
    .line 7
    shr-int/lit8 p0, p2, 0x10

    .line 8
    .line 9
    int-to-byte p0, p0

    .line 10
    invoke-interface {p1, p0}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 11
    .line 12
    .line 13
    shr-int/lit8 p0, p2, 0x8

    .line 14
    .line 15
    int-to-byte p0, p0

    .line 16
    invoke-interface {p1, p0}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 17
    .line 18
    .line 19
    int-to-byte p0, p2

    .line 20
    invoke-interface {p1, p0}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public nextIndex()I
    .locals 7

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->initialized:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    new-instance v0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;

    .line 7
    .line 8
    invoke-direct {v0}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->buf:Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;

    .line 12
    .line 13
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hashAlg:Lorg/spongycastle/crypto/Digest;

    .line 14
    .line 15
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    new-array v0, v0, [B

    .line 20
    .line 21
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->counter:I

    .line 22
    .line 23
    iget v3, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->minCallsR:I

    .line 24
    .line 25
    if-ge v2, v3, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->buf:Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;

    .line 28
    .line 29
    invoke-direct {p0, v2, v0}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->appendHash(Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;[B)V

    .line 30
    .line 31
    .line 32
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->counter:I

    .line 33
    .line 34
    add-int/2addr v2, v1

    .line 35
    iput v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->counter:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    mul-int/lit8 v3, v3, 0x8

    .line 39
    .line 40
    iget v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hLen:I

    .line 41
    .line 42
    mul-int/2addr v3, v0

    .line 43
    iput v3, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->totLen:I

    .line 44
    .line 45
    iput v3, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->remLen:I

    .line 46
    .line 47
    iput-boolean v1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->initialized:Z

    .line 48
    .line 49
    :cond_1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->totLen:I

    .line 50
    .line 51
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->c:I

    .line 52
    .line 53
    add-int/2addr v0, v2

    .line 54
    iput v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->totLen:I

    .line 55
    .line 56
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->buf:Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;

    .line 57
    .line 58
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->remLen:I

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->getTrailing(I)Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->remLen:I

    .line 65
    .line 66
    iget v3, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->c:I

    .line 67
    .line 68
    if-ge v2, v3, :cond_4

    .line 69
    .line 70
    sub-int/2addr v3, v2

    .line 71
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->counter:I

    .line 72
    .line 73
    iget v4, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hLen:I

    .line 74
    .line 75
    add-int v5, v3, v4

    .line 76
    .line 77
    sub-int/2addr v5, v1

    .line 78
    div-int/2addr v5, v4

    .line 79
    add-int/2addr v2, v5

    .line 80
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hashAlg:Lorg/spongycastle/crypto/Digest;

    .line 81
    .line 82
    invoke-interface {v4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    new-array v4, v4, [B

    .line 87
    .line 88
    :cond_2
    :goto_1
    iget v5, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->counter:I

    .line 89
    .line 90
    if-ge v5, v2, :cond_3

    .line 91
    .line 92
    invoke-direct {p0, v0, v4}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->appendHash(Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;[B)V

    .line 93
    .line 94
    .line 95
    iget v5, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->counter:I

    .line 96
    .line 97
    add-int/2addr v5, v1

    .line 98
    iput v5, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->counter:I

    .line 99
    .line 100
    iget v5, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hLen:I

    .line 101
    .line 102
    mul-int/lit8 v6, v5, 0x8

    .line 103
    .line 104
    if-le v3, v6, :cond_2

    .line 105
    .line 106
    mul-int/lit8 v5, v5, 0x8

    .line 107
    .line 108
    sub-int/2addr v3, v5

    .line 109
    goto :goto_1

    .line 110
    :cond_3
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->hLen:I

    .line 111
    .line 112
    mul-int/lit8 v2, v2, 0x8

    .line 113
    .line 114
    sub-int/2addr v2, v3

    .line 115
    iput v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->remLen:I

    .line 116
    .line 117
    new-instance v2, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;

    .line 118
    .line 119
    invoke-direct {v2}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;-><init>()V

    .line 120
    .line 121
    .line 122
    iput-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->buf:Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;

    .line 123
    .line 124
    invoke-virtual {v2, v4}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->appendBits([B)V

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_4
    sub-int/2addr v2, v3

    .line 129
    iput v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->remLen:I

    .line 130
    .line 131
    :goto_2
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->c:I

    .line 132
    .line 133
    invoke-virtual {v0, v2}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->getLeadingAsInt(I)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->c:I

    .line 138
    .line 139
    shl-int v3, v1, v2

    .line 140
    .line 141
    shl-int v2, v1, v2

    .line 142
    .line 143
    iget v4, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->N:I

    .line 144
    .line 145
    rem-int/2addr v2, v4

    .line 146
    sub-int/2addr v3, v2

    .line 147
    if-ge v0, v3, :cond_1

    .line 148
    .line 149
    rem-int/2addr v0, v4

    .line 150
    return v0
.end method
